from twisted.python import log
from twisted.web import resource, server

import simplejson as json
import datetime
import time
import string
import random

from vxml import voicexml

class PersistenceResource(resource.Resource):
	def __init__(self, persistence):
		resource.Resource.__init__(self)
		self.persistence = persistence

class SendMessage(resource.Resource):
	def __init__(self, xmpp_bot):
		resource.Resource.__init__(self)
		
		self.xmpp_bot = xmpp_bot
		
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		def onResult(result):
			request.write((u"<status action=\"" + result[0] + "\">").encode("utf-8"))
			try:
				request.write(result[1].firstChildElement().firstChildElement().toXml())
			except:
				pass
				
			request.write(u"</status>".encode("utf-8"));
			request.finish()
		
		self.xmpp_bot.sendOutputIq(request.args[u"to"][0], request.args[u"message"][0]).addCallback(onResult)

		return server.NOT_DONE_YET

class RemoteStatus(resource.Resource):
	def __init__(self, xmpp_bot):
		resource.Resource.__init__(self)
		self.xmpp_bot = xmpp_bot

	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
		
		if (self.xmpp_bot.remote_online):
			return u"<remote state=\"online\" />".encode("utf-8")
		else:
			return u"<remote state=\"offline\" />".encode("utf-8")

class AllMessages(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
		
		xml = u"<select multiple=\"true\" id=\"all-messages\">"
		
		xml += u"<option value=\"\">Broadcasts</option>"
		
		msgs = self.persistence.allBroadcasts();

		for msg in msgs:
			xml += u"<option value=\"" + msg[u"id"] + u"\">&nbsp;&nbsp;" + msg[u"name"] + u"</option>"

		xml += u"<option value=\"\">Tips</option>"
		
		msgs = self.persistence.allTips();

		for msg in msgs:
			xml += u"<option value=\"" + msg[u"id"] + u"\">&nbsp;&nbsp;" + msg[u"name"] + u"</option>"

		xml += u"<option value=\"\">Prompts</option>"
		
		msgs = self.persistence.allPrompts();

		for msg in msgs:
			xml += u"<option value=\"" + msg[u"id"] + u"\">&nbsp;&nbsp;" + msg[u"name"] + u"</option>"

		xml += u"<option value=\"\">Followups</option>"
		
		msgs = self.persistence.allFollowups();

		for msg in msgs:
			xml += u"<option value=\"" + msg[u"id"] + u"\">&nbsp;&nbsp;" + msg[u"name"] + u"</option>"

		xml += u"<option value=\"\">Reminders</option>"
		xml += u"<option value=\"tomorrow\">&nbsp;&nbsp;Meeting Tomorrow</option>"
		
#		msgs = self.persistence.allReminders();
#
#		for msg in msgs:
#			xml += "<option value=\"" + msg[u"id"] + "\">&nbsp;&nbsp;" + msg[u"name"] + "</option>"
#		
		xml += u"<option value=\"\">Custom Scripts</option>"
		
		msgs = self.persistence.allScripts();

		for msg in msgs:
			xml += u"<option value=\"" + msg[u"id"] + u"\">&nbsp;&nbsp;" + msg[u"name"] + u"</option>"
		
		xml += u"</select>"

		return xml.encode("utf-8")

class FindRecipient(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/plain")

		results = self.persistence.findRecipient(request.args[u"term"][0])
		
		return json.dumps(results)

class FindRecipientCaseNo(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/plain")

		results = self.persistence.findRecipientCaseNo(request.args[u"term"][0])
		
		return json.dumps(results)

class FindEvents(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		xml = u"<table>"
		xml += u"<tr><td style=\"width: 125px\"><strong>Date</strong></td><td style=\"width: 125px\"><strong>Participant</strong></td><td><strong>Event</strong></td><td><strong>Type</strong></td></tr>"
		
		start = None
		end = None
		case = None
		
		try:
			start = datetime.datetime(*time.strptime(request.args[u"start"][0], "%m/%d/%Y %H:%M")[0:5])
		except:
			pass

		try:
			end = datetime.datetime(*time.strptime(request.args[u"end"][0], "%m/%d/%Y %H:%M")[0:5])
		except:
			pass

		try:
			case = request.args[u"case-number"][0]
		except:
			pass

		types = []

		try:
			request.args[u"send"][0]
			types.append(u"send")
		except:
			pass

		try:
			request.args[u"receive"][0]
			types.append(u"receive")
		except:
			pass

		try:
			request.args[u"variable"][0]
			types.append(u"variable")
		except:
			pass

		try:
			request.args[u"dialog"][0]
			types.append(u"dialog")
		except:
			pass

		try:
			request.args[u"info"][0]
			types.append(u"info")
		except:
			pass

		try:
			request.args[u"all"][0]
			types.append(u"all")
		except:
			pass
		
		has_events = False
		
		for event in self.persistence.findEvents(case, start, end, types):
			has_events = True
			
			part = self.persistence.fetchParticipant(event[u"participant"])
			
			if (part is None):
				part = self.persistence.fetchParticipant(self.persistence.participantForNumber(event[u"participant"]))
			try:
				xml += u"<tr><td>" + unicode(event[u"date"].strftime("%m/%d/%y %H:%M")) + u"</td><td>" + part[u"parent_name"] + u"</td><td>" + event[u"desc"] + u"</td><td>" + event[u"type"] + u"</td></tr>"
			except KeyError:
				pass
				
		xml += u"</table>"
		
		if (has_events):
			return xml.encode("utf-8")
		
		return u"<p><em> No events found matching the given parameters.</em></p>".encode("utf-8")

class MessagePreview(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		msg_id = request.args[u"id"][0];
		
		if (msg_id == ""):
			return u"<p>Please select a message.</p>".encode("utf-8")
		else:
			return (u"<p>Coming SOON: " + msg_id + u"</p>").encode("utf-8")

class ScheduleMessage(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
	
		date = datetime.datetime(*time.strptime(request.args[u"date"][0], "%m/%d/%Y %H:%M")[0:5])
			
		recipients = []
	
		recipient = request.args[u"recipient"][0]
		
		try:
			string.index(recipient, u"group:")
			
			group = string.replace(recipient, u"group:", u"")
			
			recipients = self.persistence.participantsInGroup(group)
			
		except ValueError:
			recipients.append(recipient)

		for recipient in recipients:
			new_date = date

			if (request.args[u"use_part_time"][0] == "true"):
				t = self.persistence.fetchPreferedTimeForParticipant(recipient)
				
				date = date.replace(date.year, date.month, date.day, t.hour)
				
				new_date = date
			elif (request.args[u"use_random_time"][0] == "true"):
				# 4 hour random window...

				seconds = random.randint(0, (60 *60 * 2)) # 4))

				delta = datetime.timedelta(0, seconds, 0)
				
				new_date = date + delta				
			
	 		self.persistence.scheduleScript(recipient, new_date, request.args[u"script_id"][0])

		return u"<ok />".encode("utf-8")
		
class FetchUpcomingMessages(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		upcoming = self.persistence.upcomingScripts()
	
		xml = u"<table cellspacing=\"0\" id=\"body\">"
		xml += u"<tr><td class=\"schedule-date\">Date</td><td class=\"schedule-dest\">Recipient</td><td class=\"schedule-message\">Message</td></tr>"
		
		for script in upcoming:
			xml += u"<tr>"
			xml += u"<td class=\"schedule-cell\">" + unicode(script[u"date"]) + u"</td>"
			
			recipient = self.persistence.fetchParticipant(script[u"recipient"])
			
			xml += u"<td class=\"schedule-cell\">" + recipient[u"parent_name"] + u"</td>"
			
			xml += u"<td class=\"schedule-cell\">" + script[u"script"] + u"</td>"

			xml += u"<td class=\"schedule-cell\"><a href=\"#\" class=\"remove-message\" id=\"" + script[u"message_id"] + u"\">Cancel</a></td>"

			xml += u"</tr>"			
		
		xml += u"</table>"

		return xml.encode("utf-8")

class RemoveUpcomingMessage(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		self.persistence.removeFromSchedule(request.args[u"id"][0])

		return u"<ok />".encode("utf-8")
		
class FetchStats(PersistenceResource):
	def render(self, request):

		type = u"variable"
		desc = u"Variables Set"

		if (request.args[u"row"][0] == "msgs-sent"):
			type = u"send"
			desc = u"Messages Sent"
		elif (request.args[u"row"][0] == "msgs-recvd"):
			type = u"receive"
			desc = u"Messages Received"
		elif (request.args[u"row"][0] == "sessions-started"):
			type = u"dialog"
			desc = u"Sessions Started"
		elif (request.args[u"row"][0] == "sessions-ended"):
			type = u"dialog"
			desc = u"Sessions Ended"

		events = self.persistence.fetchEventsByType(type)

		hour_count = 0
		day_count = 0
		week_count = 0
		month_count = 0
		all_count = 0
		
		now = datetime.datetime.now()
		
		for event in events:
			event_date = event[u"date"]
			
			diff = now - event_date
			
			if (diff.seconds < (60 * 60) and diff.days < 1): # hour
				hour_count += 1

			if (diff.days < 1): # day
				day_count += 1

			if (diff.days < 7): # week
				week_count += 1

			if (diff.days < 30): # week
				month_count += 1
			
			all_count += 1

		row = u"<td>" + desc + u"</td><td>" + unicode(hour_count) + u"</td><td>" + unicode(day_count) + u"</td><td>" + unicode(week_count) + u"</td><td>" + unicode(month_count) + u"</td><td>" + unicode(all_count) + u"</td>"
		
		return row.encode("utf-8");

class ScheduleReminder(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
	
		appt_date = datetime.datetime(*time.strptime(request.args[u"appt_date"][0], "%m/%d/%Y %H:%M")[0:5])

		self.persistence.scheduleAppointment(request.args[u"recipient"][0], appt_date)

		return u"<ok />".encode("utf-8")
	
