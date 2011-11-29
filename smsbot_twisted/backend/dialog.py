import os
import string
import datetime
import site

from xml.dom import minidom

from vxml.statemachine import DialogStateMachine

class DialogManager:
	def __init__ (self, output_fn):
		self.sessions = {}
		self.output_fn = output_fn
		self.problem_users = {}

	def startDialog(self, sender, dialog, name=u"Unknown Dialog"):
		part_id = site.persistence.participantForNumber(sender)

		if (part_id is not None):
			try:
				self.sessions[sender].cancel()
				del self.sessions[sender]
			
				site.persistence.logEvent(part_id, u"Cancelling dialog for (" + sender + u"). Reason: Starting new dialog.", u"dialog")
			except KeyError:
				pass

			document = minidom.parseString(dialog)
		
			repeat = 0
			interval = 0
		
			if (document.documentElement.hasAttributeNS(u"http://www.audacious-software.com/smsbot", u"repeat")):
				repeat = int(document.documentElement.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"repeat"))
			
			if (document.documentElement.hasAttributeNS(u"http://www.audacious-software.com/smsbot", u"repeat_interval")):
				interval = int(document.documentElement.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"repeat_interval"))
		
			script_machine = DialogStateMachine(dialog, sender, self.output_fn, repeat, interval)
		
			if (script_machine.isReady()):
				self.sessions[sender] = script_machine
				site.persistence.logEvent(part_id, u"Started new dialog (" + name + u") for (" + sender + u").", u"dialog")
		else:
			site.persistence.logEvent("unknown", u"Unable to start dialog for (" + sender + u"). Reason: Unable to find participant.", u"dialog")

	def refreshMachines(self):
		for number, machine in self.sessions.items():
			machine.refresh()
		
	def process(self, sender, message):
		message = message.lower().strip()

		part_id = site.persistence.participantForNumber(sender)
		
		if (part_id is not None):
			part = site.persistence.fetchParticipant(part_id)
		
			site.persistence.logEvent(part_id, u"Received [u" + sender + u"]: " + message, u"receive")

			try:
				script_machine = self.sessions[sender]
				
				script_machine.process(message)

				if (script_machine.isReady() is False):
					del self.sessions[sender]

					site.persistence.logEvent(part_id, u"Finished dialog for (" + sender + u").", u"dialog")
					
					return None
				
				return None
			except KeyError:
				count = 0
			
				try:
					count = self.problem_users[sender]
				except KeyError:
					self.problem_users[sender] = count
				
				orig_message = message

				message = u"To send us a question, begin it with 411. We'll respond as soon as possible. Example: 411 at what age can babies eat meat?" 

				if (part[u"spanish"]):
					message = u"Para enviar una pregunta escriba 411 y su pregunta. Le contestaremos tan pronto sea posible. Ejemplo: 411 A que edad puede un nino comer carne?" 
			
				if (string.find(orig_message, u"411") == 0 or count >= 1):
					site.persistence.logEvent(part_id, u"Sent 411 response to (" + sender + u").", u"send")
		
					message = u"Your question has been received. We will respond shortly."

					if (part[u"spanish"]):
						message = u"Su pregunta a sido recibida. Le contestaremos pronto." 

					recipients = site.persistence.participantsInGroup(u"Administrators")

					for recipient in recipients:
						r = site.persistence.fetchParticipant(recipient)
						
						site.xmpp_bot.sendOutputIq(r[u"mobile_a"], u"Incoming 411 from " + sender + u":")
						site.xmpp_bot.sendOutputIq(r[u"mobile_a"], orig_message)
						
						site.persistence.logEvent(part_id, u"Forwarded 411 message from (" + sender + u"): " + orig_message, u"send")

					site.persistence.logEvent(part_id, u"411: " + orig_message, u"info")
				else:
					count = count + 1

				self.problem_users[sender] = count
			
			return message
		return None