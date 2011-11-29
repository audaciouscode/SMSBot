from datetime import datetime
import time
import re

from xml.dom import minidom
from xml.sax.saxutils import escape

from twisted.internet import reactor, defer
from twisted.internet.task import LoopingCall
from twisted.internet import threads
from twisted.python import log
from twisted.words.protocols.jabber import error, xmlstream, jid
from twisted.words.xish import domish

from wokkel.subprotocols import IQHandlerMixin
from wokkel.xmppim import MessageProtocol, RosterClientProtocol, AvailablePresence, UnavailablePresence

import dialog
import site

MESSAGE = u"/received"

def prep_message(message):
	message = message.replace(u"\"", u"&quot;")
	message = message.replace(u"&amp;", u"&")
	message = message.replace(u"&", u"&amp;")

	return message

class SMSBotProtocol(MessageProtocol, RosterClientProtocol, IQHandlerMixin):

	iqHandlers = { u"/iq[@type='set']" + MESSAGE: u"onMessageReceived" }

	def __init__(self):
		MessageProtocol()
		RosterClientProtocol()
		IQHandlerMixin()

		self.remote_online = False		
		self.pending_messages = []
		
		self.dialog_manager = dialog.DialogManager(self.sendOutputIq)

	def __del__(self):
		self.send(UnavailablePresence())

	def sendPending(self):
		to_remove = []

		for pending in self.pending_messages:
			to_remove.append(pending)
				
		for pending in to_remove:
			self.pending_messages.remove(pending)

		for pending in to_remove:
			self.transmitMessage(pending[u"message"], pending[u"to"], pending[u"stanza"])

	def transmitMessage(self, message, to, stanzaType=u"set"):
		try:
			doc = minidom.parseString(message)
		except:
			d = defer.Deferred()
			reactor.callLater(0, d.callback, u"xml-error")
			
			return d
		
		def cb(iq):
			return u"sent", iq
			
		def eb(failure):
			pending = {}
			pending[u"to"] = to
			pending[u"message"] = message
			pending[u"stanza"] = stanzaType
			
			self.pending_messages.append(pending)
			
			failure.trap(error.StanzaError)
			return u"error", failure
						
		iq = xmlstream.IQ(self.xmlstream, stanzaType=stanzaType)
		query = iq.addElement(("urn:smsbot:message", "query"))		
		query.addRawXml(message.encode("utf-8"))
		
		return iq.send(to).addCallback(cb).addErrback(eb)

	def tick(self):
		if self.xmlstream: 
			self.send(AvailablePresence())

			if self.remote_online:
				self.sendPending()
				
	def connectionMade(self):
		self.xmlstream.addObserver(u"/iq[@type='get' or @type='set']" + MESSAGE, self.handleRequest)
		self.xmlstream.addObserver(u"/presence", self.onPresence)
		
		self.ticker = LoopingCall(self.tick)
		self.ticker.start(60)
		self.tick()

	def onPresence(self, presence):
		if (presence.getAttribute(u"from", u"") == u"smsbot@boston.audacious-software.com/bot"):
			type = presence.getAttribute(u"type", u"available")
	
			if (type == u"unavailable"):
				self.remote_online = False
			else:
				self.remote_online = True
				
	def connectionLost(self, reason):
		print u"Disconnected!"

	def sendOutputMessage(self, dest, message):
		msg = domish.Element((None, u"message"))
		msg[u"to"] = dest
		msg[u"from"] = u"smsbackend@boston.audacious-software.com/backend"
		msg[u"type"] = u"chat"
			
		msg.addElement(u"body", content=message)

		self.send(msg)
	
	def onMessage(self, msg):
		if msg[u"type"] == u"chat" and hasattr(msg, u"body"):
			reply = domish.Element((None, u"message"))
			reply[u"to"] = msg[u"from"]
			reply[u"from"] = msg[u"to"]
			reply[u"type"] = u"chat"
			
			if (msg.body is not None):
				message = self.dialog_manager.process(msg[u"from"], msg.body)
				
				if (message is not None):
					reply.addElement(u"body", content=message)

					self.send(reply)

	def isEmail(self, destination):
		return (re.match(u"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9._%-]+.[a-zA-Z]{2,6}$", destination) != None)

	def sendEmail(self, address, message):
		import smtplib
		
		message = """\
From: txts4parents@audacious-software.com
To: %s
Subject: Incoming Message

%s
""" % (address, message)

		server = smtplib.SMTP("mail.audacious-software.com", 2525)
		server.sendmail("txts4parents@audacious-software.com", address, message)
		server.quit()

		print(u"SEND TO " + address + u": " + message)
	
	def sendOutputIq(self, dest, message):
		if (self.isEmail(dest)):
			self.sendEmail(dest, message)
			
			iq = xmlstream.IQ(self.xmlstream, stanzaType="set")
			query = iq.addElement(("urn:smsbot:message", "query"))		
			query.addRawXml(message.encode("utf-8"))
		
			return u"sent", iq
		else:
			xml_string = u"<send to=\"" + dest + u"\" message=\"" + prep_message(message) + u"\" />"

			part_id = site.persistence.participantForNumber(dest)
			if (part_id is not None):
				site.persistence.logEvent(part_id, u"Sending message to (" + dest + u"): " + message, u"send")

				return self.transmitMessage(xml_string, u"smsbot@boston.audacious-software.com/bot")

			site.persistence.logEvent(u"unknown", u"Unable to find participant for number '" + dest + u"'.", u"send")

	def processSmsMessage(self, sender, message, source=u"smsbot@boston.audacious-software.com/bot"):
		response = self.dialog_manager.process(sender, message.strip())

		part_id = site.persistence.participantForNumber(sender)

		if (response is not None and part_id is not None):
			site.persistence.logEvent(part_id, u"Sending message to (" + dest + u"): " + message, u"send")

			xml_string = u"<send to=\"" + sender + u"\" message=\"" + prep_message(response) + u"\" />"
			
			self.transmitMessage(xml_string, source)

	def onMessageReceived(self, iq):
		message = iq.firstChildElement()
		
		source = iq.getAttribute(u"from")
		
		if message.name == u"received":
			response = self.dialog_manager.process(message.getAttribute(u"from"), unicode(message).strip())

			if (response != None):
				dest = message.getAttribute(u"from")
				xml_string = u"<send to=\"" + dest + u"\" message=\"" + prep_message(response) + u"\" />"

				part_id = site.persistence.participantForNumber(dest)
				
				if (part_id is not None):
					site.persistence.logEvent(part_id, u"Sending message to (" + dest + u"): " + response, u"send")
			
					self.transmitMessage(xml_string, source)
		else:
			print u"UNHANDLED MESSAGE: " + iq.toXml()

	def processMessage(self, message, source):
#		label = message.getAttribute("label");
#		value = message.getAttribute("value");
#		user = message.getAttribute("user");
#		self.manager.processTraining(source, label, value, user)
		pass
	
