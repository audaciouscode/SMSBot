import copy
import iso8601
import uuid
import string

from datetime import datetime, timedelta

from sqlalchemy import *
from sqlalchemy.sql import and_, or_, not_, select, delete

from vxml import voicexml

try:
	from sqlite3 import dbapi2 as sqlite
except:
	from pysqlite2 import dbapi2 as sqlite

import site

def miseducate(smart):
	smart = smart.replace(u"\u201c", "\"").replace(u"\u201d", "\"").replace(u"\u201f", "\"")
	smart = smart.replace(u"\u2018", "'").replace(u"\u2019", "'")	

	return smart 

class Persistence:
	def __init__(self):
		self.items = []

		self.engine = create_engine(u"sqlite:///data/file.db", module=sqlite, echo=False)

		self.metadata = MetaData()

		try:
			sessions_table = Table(u"sessions", self.metadata, 
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Participant", Unicode(36), nullable=False),
				Column(u"Start", DateTime),
				Column(u"End", DateTime),
				Column(u"Description", Unicode(1024)))
				
			sessions_table.create(bind=self.engine)
		except:
			pass

		try:
			participants_table = Table(u"participants", self.metadata,
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"CaseNumber", Unicode(128)),
				Column(u"ParentName", Unicode(256)),
				Column(u"ContactTime", Time()),
				Column(u"SpeakSpanish", Boolean()),
				Column(u"MobileNumberA", Unicode(36)),
				Column(u"MobileNumberB", Unicode(36)),
				Column(u"MobileNumberC", Unicode(36)),
				Column(u"MobileNumberD", Unicode(36)),
				Column(u"MobileNumberE", Unicode(36)),
				Column(u"Group", Unicode(36)),
				Column(u"Program", Unicode(36)),
				Column(u"VisitorName", Unicode(256)),
				Column(u"VisitorMobileNumber", Unicode(36)))
				
			participants_table.create(bind=self.engine)
		except:
			pass

		try:
			tips_table = Table(u"tips", self.metadata,
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Name", Unicode(256)),
				Column(u"First", Unicode(256)),
				Column(u"Second", Unicode(256)),
				Column(u"Third", Unicode(256)),
				Column(u"First_Spanish", Unicode(256)),
				Column(u"Second_Spanish", Unicode(256)),
				Column(u"Third_Spanish", Unicode(256)))
				
			tips_table.create(bind=self.engine)
		except:
			pass

		try:
			prompts_table = Table(u"prompts", self.metadata,
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Name", Unicode(256)),
				Column(u"First", Unicode(256)),
				Column(u"Second", Unicode(256)),
				Column(u"First_Spanish", Unicode(256)),
				Column(u"Second_Spanish", Unicode(256)))
				
			prompts_table.create(bind=self.engine)
		except:
			pass

		try:
			followups_table = Table(u"followups", self.metadata,
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Name", Unicode(256)),
				Column(u"Question", Unicode(256)),
				Column(u"Positive", Unicode(256)),
				Column(u"Negative", Unicode(256)),
				Column(u"Question_Spanish", Unicode(256)),
				Column(u"Positive_Spanish", Unicode(256)),
				Column(u"Negative_Spanish", Unicode(256)))
				
			followups_table.create(bind=self.engine)
		except:
			pass

		try:
			broadcasts_table = Table(u"broadcasts", self.metadata,
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Name", Unicode(256)),
				Column(u"Message", Unicode(256)),
				Column(u"Message_Spanish", Unicode(256)))
				
			broadcasts_table.create(bind=self.engine)
		except:
			pass

		try:
			scripts_table = Table(u"scripts", self.metadata,
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Name", Unicode(256)),
				Column(u"Script", Unicode(4098)),
				Column(u"Script_Spanish", Unicode(4098)))
				
			scripts_table.create(bind=self.engine)
		except:
			pass

		try:
			schedule_table = Table(u"schedule", self.metadata, 
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Date", DateTime),
				Column(u"Session", Unicode(36)))

			schedule_table.create(bind=self.engine)
		except:
			pass

		try:
			context_table = Table(u"schedule_context", self.metadata, 
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Schedule", Unicode(36)),
				Column(u"Key", Unicode(36)),
				Column(u"Value", Unicode(1024)),
				Column(u"Type", Unicode(64)))

			context_table.create(bind=self.engine)
		except:
			pass

		try:
			scheduled_scripts = Table(u"scheduled_scripts", self.metadata, 
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Recipient", Unicode(36)),
				Column(u"Date", DateTime),
				Column(u"Executed", DateTime),
				Column(u"ScriptId", Unicode(36)),
				Column(u"Script", Unicode(4096)))

			scheduled_scripts.create(bind=self.engine)
		except:
			pass

		try:
			scheduled_appts = Table(u"scheduled_appts", self.metadata, 
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Recipient", Unicode(36)),
				Column(u"Date", DateTime),
				Column(u"SendDayBefore", DateTime),
				Column(u"SendDayOf", DateTime))

			scheduled_appts.create(bind=self.engine)
		except:
			pass

		try:
			event_log = Table(u"events", self.metadata, 
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Participant", Unicode(36)),
				Column(u"Type", Unicode(36)),
				Column(u"Date", DateTime),
				Column(u"Description", Unicode(4096)))

			event_log.create(bind=self.engine)
		except:
			pass

		try:
			variables = Table(u"variables", self.metadata, 
				Column(u"Id", Unicode(36), primary_key=True),
				Column(u"Participant", Unicode(36)),
				Column(u"Date", DateTime),
				Column(u"Key", Unicode(4096)),
				Column(u"Value", Unicode(4096)))

			variables.create(bind=self.engine)
		except:
			pass
			
		self.metadata = MetaData(bind=self.engine, reflect=True)

	def participantForNumber(self, phone_number):
		if (len(phone_number) < 10):
			return None
			
		phone_number = u"".join([c for c in phone_number if c in u"1234567890."])
		
		participants = self.metadata.tables[u"participants"]
		
		stmt = select([participants.c.Id, participants.c.MobileNumberA, participants.c.MobileNumberB, participants.c.MobileNumberC, participants.c.MobileNumberD, participants.c.MobileNumberE])
		result = stmt.execute()
		
		for row in result.fetchall():
			part_no = u"".join([c for c in row[u"MobileNumberA"] if c in u"1234567890."])

			if (len(part_no) < 10):
				pass
			else:
				try:
					string.index(phone_number, part_no)
				
					return row[u"Id"]
				except ValueError:
					pass
		
		return u"Unknown (" + phone_number + u")"
	
	def setVariable(self, part_id, key, value):
		variables = self.metadata.tables[u"variables"]

		var_id = unicode(uuid.uuid4())
		
		now = datetime.now()

		insert = variables.insert()
		insert.execute(Id=var_id, Participant=part_id, Date=now, Value=value, Key=key)
		
		self.logEvent(part_id, u"Set '" + key + u"' = '" + value + u"'.", u"variable")

		return var_id

	def logEvent(self, part_id, description, type):
		events = self.metadata.tables[u"events"]

		event_id = unicode(uuid.uuid4())
		
		now = datetime.now()

		insert = events.insert()
		insert.execute(Id=event_id, Participant=part_id, Date=now, Description=description, Type=type)			
		return event_id

	def fetchEvents(self, start=None, end=None, participant=None, key=None):
		events = self.metadata.tables[u"events"]

		where_parts = []
		
		if (start is not None):
			where_parts.append(events.c.Date >= start)
			
		if (end is not None):
			where_parts.append(events.c.Date >= end)

		if (participant is not None):
			where_parts.append(events.c.Participant == id)

		if (key is not None):
			where_parts.append(events.c.Key == key)
		
		whereclause = and_(*where_parts)
	
		stmt = select([events.c.Id, events.c.Participant, events.c.Date, events.c.Description, events.c.Value, events.c.Key, events.c.Session], whereclause=whereclause)
		result = stmt.execute()

		events = []

		for row in result.fetchall():
			event = {}
			item[u"date"] = row[u"Date"]
			item[u"id"] = row[u"Id"]
			item[u"participant_id"] = row[u"Participant"]
			item[u"description"] = row[u"Description"]
			item[u"participant_id"] = row[u"Participant"]
			item[u"key"] = row[u"Key"]
			item[u"value"] = row[u"Value"]
			item[u"session"] = row[u"Session"]
	
			events.append(event)
		return events

	def fetchEventsByType(self, type):
		events = self.metadata.tables[u"events"]

		where_parts = []
		where_parts.append(events.c.Type == type)
		whereclause = and_(*where_parts)
	
		stmt = select([events.c.Id, events.c.Participant, events.c.Date, events.c.Description, events.c.Type], whereclause=whereclause)
		result = stmt.execute()

		events = []

		for row in result.fetchall():
			event = {}
			event[u"date"] = row[u"Date"]
			event[u"id"] = row[u"Id"]
			event[u"participant_id"] = row[u"Participant"]
			event[u"description"] = row[u"Description"]
			event[u"participant_id"] = row[u"Participant"]
			event[u"type"] = row[u"Type"]
	
			events.append(event)

		return events
		
	def fetchSchedule(self):
		if (len(self.items) < 1):
			schedule = self.metadata.tables[u"schedule"]
			schedule_context = self.metadata.tables[u"schedule_context"]
			
			stmt = select([schedule.c.Id, schedule.c.Date])
			result = stmt.execute()

			sched_items = result.fetchall()

			for sched_item in sched_items:
				item = {}
				item[u"date"] = sched_item[u"Date"]
				item[u"id"] = sched_item[u"Id"]
				item[u"fn"] = site.handleDialog

				where_parts = []
				where_parts.append(schedule_context.c.Schedule == sched_item[u"Id"])
				whereclause = and_(*where_parts)
				
				cxt_stmt = select([schedule_context.c.Key, schedule_context.c.Value, schedule_context.c.Type], whereclause=whereclause)
				cxt_result = cxt_stmt.execute()
				
				cxt_items = cxt_result.fetchall()
				
				context = {}
				
				for cxt_item in cxt_items:
					if (cxt_item[u"Type"] == u"float"):
						context[cxt_item[u"Key"]] = float(cxt_item[u"Value"])
					elif (cxt_item[u"Type"] == u"date"):
						context[cxt_item[u"Key"]] = iso8601.parse_date(cxt_item[u"Value"])
					else:
						context[cxt_item[u"Key"]] = cxt_item[u"Value"]
						
				item[u"context"] = context
				
				self.items.append(item)

		return copy.copy(self.items)

	def save(self):
		schedule = self.metadata.tables[u"schedule"]
		schedule_context = self.metadata.tables[u"schedule_context"]

		for item in self.items:
			try:
				where_parts = []
				where_parts.append(schedule.c.Id == item[u"id"])
				whereclause = and_(*where_parts)

				update = schedule.update(whereclause=whereclause, values=dict(Date=item[u"date"]))
				update.execute()
			except KeyError:
				item[u"id"] = unicode(uuid.uuid4())

				insert = schedule.insert()
				insert.execute(Id=item[u"id"], Date=item[u"date"])

			where_parts = []
			where_parts.append(schedule_context.c.Schedule == item[u"id"])
			whereclause = and_(*where_parts)

			delete_stmt = delete(schedule_context, whereclause=whereclause)
			delete_stmt.execute()
		

			for key, value in item[u"context"].items():
				value_type = u"string"
				
				if (isinstance(value, int) or isinstance(value, float)):
					value_type = u"float"
				elif (isinstance(value, datetime)):
					value_type = u"date"

				insert = schedule_context.insert()
				insert.execute(Id=unicode(uuid.uuid4()), Key=key, Value=value, Type=value_type, Schedule=item[u"id"])

	def removeFromSchedule(self, item):
		schedule = self.metadata.tables[u"scheduled_scripts"]

		where_parts = []
		where_parts.append(schedule.c.Id == item)
		where_parts.append(schedule.c.Executed == None)
		whereclause = and_(*where_parts)

		delete_stmt = delete(schedule, whereclause=whereclause)
		delete_stmt.execute()
		
	def removeScheduledItem(self, item):
		schedule = self.metadata.tables[u"schedule"]
		schedule_context = self.metadata.tables[u"schedule_context"]

		where_parts = []
		where_parts.append(schedule.c.Id == item[u"id"])
		whereclause = and_(*where_parts)

		delete_stmt = delete(schedule, whereclause=whereclause)
		delete_stmt.execute()

		where_parts = []
		where_parts.append(schedule_context.c.Schedule == item[u"id"])
		whereclause = and_(*where_parts)

		delete_stmt = delete(schedule_context, whereclause=whereclause)
		delete_stmt.execute()
	
		while (self.items.count(item) > 0):
			self.items.remove(item)
			
		self.save()

	def addScheduledItem(self, item):
		self.items.append(item)
		self.save()

	def allParticipants(self):
		participants = self.metadata.tables[u"participants"]

		part_list = []
		
		stmt = select([participants.c.Id, participants.c.ParentName])
		result = stmt.execute()
		
		for row in result.fetchall():
			part_list.append({ u"id": row[u"Id"], u"name": row[u"ParentName"] })

		return part_list
	
	def addParticipant(self, name):
		participants = self.metadata.tables[u"participants"]

		part_id = unicode(uuid.uuid4())
		
		insert = participants.insert()
		insert.execute(Id=part_id, ParentName=name)
			
		return part_id

	def removeParticipant(self, id):
		participants = self.metadata.tables[u"participants"]
		
		where_parts = []
		where_parts.append(participants.c.Id == id)
		whereclause = and_(*where_parts)

		delete_stmt = delete(participants, whereclause=whereclause)
		delete_stmt.execute()
		
		return True

	def fetchParticipant(self, id):
		part_dict = {}
	
		participants = self.metadata.tables[u"participants"]
		
		where_parts = []
		where_parts.append(participants.c.Id == id)
		whereclause = and_(*where_parts)

		stmt = select([participants.c.Id, participants.c.CaseNumber, participants.c.ParentName, participants.c.MobileNumberA, participants.c.MobileNumberB, participants.c.MobileNumberC, participants.c.MobileNumberD, participants.c.MobileNumberE, participants.c.Group,  participants.c.VisitorName,  participants.c.VisitorMobileNumber, participants.c.SpeakSpanish, participants.c.ContactTime, participants.c.Program], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			part_dict[u"id"] = row[u"Id"]
			part_dict[u"case_number"] = row[u"CaseNumber"]
			part_dict[u"parent_name"] = row[u"ParentName"]
			part_dict[u"mobile_a"] = row[u"MobileNumberA"]
			part_dict[u"mobile_b"] = row[u"MobileNumberB"]
			part_dict[u"mobile_c"] = row[u"MobileNumberC"]
			part_dict[u"mobile_d"] = row[u"MobileNumberD"]
			part_dict[u"mobile_e"] = row[u"MobileNumberE"]
			part_dict[u"group"] = row[u"Group"]
			part_dict[u"program"] = row[u"Program"]
			part_dict[u"visitor_name"] = row[u"VisitorName"]
			part_dict[u"visitor_mobile"] = row[u"VisitorMobileNumber"]
			
			if (row[u"SpeakSpanish"]):
				part_dict[u"spanish"] = True
			else:
				part_dict[u"spanish"] = False

			if (row[u"ContactTime"] is None):
				part_dict[u"hour"] = 12
			else:
				part_dict[u"hour"] = row[u"ContactTime"].hour
			
		return part_dict
		
	def updateParticipant(self, id, case_number, parent_name, mobile_a, mobile_b, mobile_c, mobile_d,  mobile_e,  group, visitor_name,  visitor_mobile, spanish, hour, program):
		participants = self.metadata.tables[u"participants"]

		where_parts = []
		where_parts.append(participants.c.Id == id)
		whereclause = and_(*where_parts)
		
		values = {}
		values[u"CaseNumber"] = miseducate(case_number)
		values[u"ParentName"] = miseducate(parent_name)
		values[u"MobileNumberA"] = miseducate(mobile_a)
		values[u"MobileNumberB"] = miseducate(mobile_b)
		values[u"MobileNumberC"] = miseducate(mobile_c)
		values[u"MobileNumberD"] = miseducate(mobile_d)
		values[u"MobileNumberE"] = miseducate(mobile_e)
		values[u"Group"] = miseducate(group)
		values[u"VisitorName"] = miseducate(visitor_name)
		values[u"VisitorMobileNumber"] = miseducate(visitor_mobile)
		values[u"SpeakSpanish"] = spanish
		values[u"Program"] = miseducate(program)
		
		date = datetime.now()
		date = date.replace(date.year, 1, 1, int(hour), 0, 0)
		
		values[u"ContactTime"] = date.time()

		update = participants.update(whereclause=whereclause, values=values)
		update.execute()

	def fetchPreferedTimeForParticipant(self, id):
		participants = self.metadata.tables[u"participants"]

		where_parts = [participants.c.Id == id]
		whereclause = or_(*where_parts)

		stmt = select([participants.c.Id, participants.c.ContactTime], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			return row[u"ContactTime"]

	def allTips(self):
		tips = self.metadata.tables[u"tips"]

		tip_list = []
		
		stmt = select([tips.c.Id, tips.c.Name])
		result = stmt.execute()
		
		for row in result.fetchall():
			tip_list.append({ u"id": row[u"Id"], u"name": row[u"Name"] })

		return tip_list
	
	def addTip(self, name):
		tips = self.metadata.tables[u"tips"]

		part_id = unicode(uuid.uuid4())
		
		insert = tips.insert()
		insert.execute(Id=part_id, Name=name)
			
		return part_id

	def removeTip(self, id):
		tips = self.metadata.tables[u"tips"]
		
		where_parts = []
		where_parts.append(tips.c.Id == id)
		whereclause = and_(*where_parts)

		delete_stmt = delete(tips, whereclause=whereclause)
		delete_stmt.execute()
		
		return True

	def fetchTip(self, id):
		part_dict = {}
	
		tips = self.metadata.tables[u"tips"]
		
		where_parts = []
		where_parts.append(tips.c.Id == id)
		whereclause = and_(*where_parts)

		stmt = select([tips.c.Id, tips.c.Name, tips.c.First, tips.c.Second, tips.c.Third, tips.c.First_Spanish, tips.c.Second_Spanish, tips.c.Third_Spanish], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			part_dict[u"id"] = row[u"Id"]
			part_dict[u"name"] = row[u"Name"]
			part_dict[u"first"] = row[u"First"]
			part_dict[u"second"] = row[u"Second"]
			part_dict[u"third"] = row[u"Third"]

			part_dict[u"first_spanish"] = row[u"First_Spanish"]
			part_dict[u"second_spanish"] = row[u"Second_Spanish"]
			part_dict[u"third_spanish"] = row[u"Third_Spanish"]

		return part_dict
		
	def updateTip(self, id, name, first, second, third, first_spanish, second_spanish, third_spanish):
		tips = self.metadata.tables[u"tips"]

		where_parts = []
		where_parts.append(tips.c.Id == id)
		whereclause = and_(*where_parts)

		values = {}
		values[u"Name"] = miseducate(name)
		values[u"First"] = miseducate(first)
		values[u"Second"] = miseducate(second)
		values[u"Third"] = miseducate(third)
		
		values[u"First_Spanish"] = miseducate(first_spanish)
		values[u"Second_Spanish"] = miseducate(second_spanish)
		values[u"Third_Spanish"] = miseducate(third_spanish)
		
		update = tips.update(whereclause=whereclause, values=values)
		update.execute()

	def allBroadcasts(self):
		broadcasts = self.metadata.tables[u"broadcasts"]

		broadcast_list = []
		
		stmt = select([broadcasts.c.Id, broadcasts.c.Name])
		result = stmt.execute()
		
		for row in result.fetchall():
			broadcast_list.append({ u"id": row[u"Id"], u"name": row[u"Name"] })

		return broadcast_list
	
	def addBroadcast(self, name):
		broadcasts = self.metadata.tables[u"broadcasts"]

		part_id = unicode(uuid.uuid4())
		
		insert = broadcasts.insert()
		insert.execute(Id=part_id, Name=name)
			
		return part_id

	def removeBroadcast(self, id):
		broadcasts = self.metadata.tables[u"broadcasts"]
		
		where_parts = []
		where_parts.append(broadcasts.c.Id == id)
		whereclause = and_(*where_parts)

		delete_stmt = delete(broadcasts, whereclause=whereclause)
		delete_stmt.execute()
		
		return True

	def fetchBroadcast(self, id):
		part_dict = {}
	
		broadcasts = self.metadata.tables[u"broadcasts"]
		
		where_parts = []
		where_parts.append(broadcasts.c.Id == id)
		whereclause = and_(*where_parts)

		stmt = select([broadcasts.c.Id, broadcasts.c.Name, broadcasts.c.Message, broadcasts.c.Message_Spanish], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			part_dict[u"id"] = row[u"Id"]
			part_dict[u"name"] = row[u"Name"]
			part_dict[u"message"] = row[u"Message"]
			part_dict[u"message_spanish"] = row[u"Message_Spanish"]

		return part_dict
		
	def updateBroadcast(self, id, name, message, message_spanish):
		broadcasts = self.metadata.tables[u"broadcasts"]

		where_parts = []
		where_parts.append(broadcasts.c.Id == id)
		whereclause = and_(*where_parts)

		values = {}
		values[u"Name"] = miseducate(name)
		values[u"Message"] = miseducate(message)
		values[u"Message_Spanish"] = miseducate(message_spanish)
		
		update = broadcasts.update(whereclause=whereclause, values=values)
		update.execute()

	def findRecipient(self, term):
		results = []

		participants = self.metadata.tables[u"participants"]

		where_parts = [participants.c.ParentName.like(u"%" + term + u"%")]
		whereclause = and_(*where_parts)

		stmt = select([participants.c.Id, participants.c.ParentName], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			results.append({ u"label": u"Parent: " + row[u"ParentName"], u"value": row[u"Id"] })


		where_parts = [participants.c.VisitorName.like(u"%" + term + u"%")]
		whereclause = and_(*where_parts)

		stmt = select([participants.c.Id, participants.c.VisitorName], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			results.append({ u"label": u"Visitor: " + row[u"VisitorName"], u"value": row[u"Id"] + u"--V" })

		results.append({ u"label": u"Group: 0 to 12 months",   u"value": u"group:0-12" })
		results.append({ u"label": u"Group: 13 to 24 months",  u"value": u"group:13-24" })
		results.append({ u"label": u"Group: 25 to 36 months",  u"value": u"group:25-36" })
		results.append({ u"label": u"Group: 37 to 48 months",  u"value": u"group:37-48" })
		results.append({ u"label": u"Group: 49+ months",       u"value": u"group:49-K" })
		results.append({ u"label": u"Group: Administrators",   u"value": u"group:Administrators" })
		results.append({ u"label": u"Group: Interviews",   u"value": u"group:Interviews" })
		results.append({ u"label": u"Program: IWSE", u"value": u"group:IWSE" })
		results.append({ u"label": u"Program: D-65", u"value": u"group:D-65" })
		results.append({ u"label": u"Program: Interviews", u"value": u"group:Interviews" })
		results.append({ u"label": u"All Participants", u"value": u"group:All" })

		return results
	
	def findEvents(self, caseNumber, start, end, types):
		results = []

		participants = self.metadata.tables[u"participants"]

		part_id = None
		
		if (caseNumber is not None and caseNumber != ""):
			part_id = ""
			where_parts = [participants.c.CaseNumber == caseNumber]
			whereclause = and_(*where_parts)

			stmt = select([participants.c.Id], whereclause=whereclause)
			result = stmt.execute()
		
			for row in result.fetchall():
				part_id = row[u"Id"]

		events = self.metadata.tables[u"events"]
		
		where_parts = [events.c.Participant != u""]
		
		if (part_id is not None):
			where_parts.append(events.c.Participant == part_id)
			
		if (start is not None):
			where_parts.append(events.c.Date >= start)

		if (end is not None):
			where_parts.append(events.c.Date <= end)

		whereclause = and_(*where_parts)

		if (len(types) > 0):
			type_parts = []

			for t in types:
				if (t == u"all"):
					type_parts.append(events.c.Type != t)
				else:
					type_parts.append(events.c.Type == t)

			typeclause = or_(*type_parts)
			
			whereclause = and_(whereclause, typeclause)

		stmt = select([events.c.Id, events.c.Date, events.c.Description, events.c.Participant, events.c.Type], whereclause=whereclause, order_by=[events.c.Date])
		result = stmt.execute()
		
		for row in result.fetchall():
			event = {}
			
			event[u"id"] = row[u"Id"]
			event[u"date"] = row[u"Date"]
			event[u"desc"] = row[u"Description"]
			event[u"participant"] = row[u"Participant"]
			event[u"type"] = row[u"Type"]
		
			results.append(event)
		return results

	def findRecipientCaseNo(self, term):
		results = []

		participants = self.metadata.tables[u"participants"]

		where_parts = [participants.c.ParentName.like("%" + term + "%")]
		where_parts.append(participants.c.CaseNumber.like("%" + term + "%"))
		whereclause = or_(*where_parts)

		stmt = select([participants.c.Id, participants.c.ParentName, participants.c.CaseNumber], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			results.append({ u"label": u"Parent: " + row[u"ParentName"] + u" (" + row[u"CaseNumber"] + ")" , u"value": row[u"CaseNumber"] })

		return results

	def allScripts(self):
		scripts = self.metadata.tables[u"scripts"]

		script_list = []
		
		stmt = select([scripts.c.Id, scripts.c.Name])
		result = stmt.execute()
		
		for row in result.fetchall():
			script_list.append({ u"id": row[u"Id"], u"name": row[u"Name"] })

		return script_list
	
	def addScript(self, name):
		scripts = self.metadata.tables[u"scripts"]

		part_id = unicode(uuid.uuid4())
		
		insert = scripts.insert()
		insert.execute(Id=part_id, Name=name)
			
		return part_id

	def removeScript(self, id):
		scripts = self.metadata.tables[u"scripts"]
		
		where_parts = []
		where_parts.append(scripts.c.Id == id)
		whereclause = and_(*where_parts)

		delete_stmt = delete(scripts, whereclause=whereclause)
		delete_stmt.execute()
		
		return True

	def fetchScript(self, id, recipient=None, spanish=False):
		part_dict = {}
	
		scripts = self.metadata.tables[u"scripts"]
		
		where_parts = []
		where_parts.append(scripts.c.Id == id)
		whereclause = and_(*where_parts)

		stmt = select([scripts.c.Id, scripts.c.Name, scripts.c.Script, scripts.c.Script_Spanish], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			part_dict[u"id"] = row[u"Id"]
			part_dict[u"name"] = row[u"Name"]
			part_dict[u"script"] = row[u"Script"]
			part_dict[u"script_spanish"] = row[u"Script_Spanish"]

		return part_dict
		
	def updateScript(self, id, name, script, script_spanish):
		scripts = self.metadata.tables[u"scripts"]

		where_parts = []
		where_parts.append(scripts.c.Id == id)
		whereclause = and_(*where_parts)

		values = {}
		values[u"Name"] = name
		values[u"Script"] = script
		values[u"Script_Spanish"] = script_spanish
		
		update = scripts.update(whereclause=whereclause, values=values)
		update.execute()

	def scheduleScript(self, recipient, date, script_id):
		participants = self.metadata.tables[u"participants"]

		where_parts = [participants.c.Id == recipient]
		whereclause = or_(*where_parts)

		stmt = select([participants.c.Id, participants.c.SpeakSpanish, participants.c.MobileNumberA], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			spanish = row[u"SpeakSpanish"]
				
			vxml = u""

			broadcast = self.fetchBroadcast(script_id)
		
			msg_type = u"Unknown"
		
			try:
				message = broadcast[u"message"]
				
				if (spanish):
					message = broadcast[u"message_spanish"]

				vxml = voicexml.makeBroadcast(message)
			except KeyError:
				pass

			tip = self.fetchTip(script_id)
			
			try:
				first = tip[u"first"]
				second = tip[u"second"]
				third = tip[u"third"]

				if (spanish):
					first = tip[u"first_spanish"]
					second = tip[u"second_spanish"]
					third = tip[u"third_spanish"]

				vxml = voicexml.makeTip(first, second, third, tip[u"name"])
			except KeyError:
				pass

			prompt = self.fetchPrompt(script_id)
		
			try:
				first = prompt[u"first"]
				second = prompt[u"second"]

				if (spanish):
					first = prompt[u"first_spanish"]
					second = prompt[u"second_spanish"]

				vxml = voicexml.makePrompt(first, second, prompt[u"name"])
			except KeyError:
				pass

			followup = self.fetchFollowup(script_id)
		
			try:
				question = followup[u"question"]
				positive = followup[u"positive"]
				negative = followup[u"negative"]

				if (spanish):
					question = followup[u"question_spanish"]
					positive = followup[u"positive_spanish"]
					negative = followup[u"negative_spanish"]

				vxml = voicexml.makeFollowup(question, positive, negative, followup[u"name"])
			except KeyError:
				pass

			if (vxml == u""):
				dict = self.fetchScript(script_id, recipient=recipient, spanish=spanish)
	
				vxml = dict[u"script"]

				if (spanish):
					vxml = dict[u"script_spanish"]

			if (vxml == u"" and (script_id.find(u"day-before-reminder-" == 0) or script_id.find(u"day-of-reminder-") == 0)):
				if (script_id.find(u"day-before-reminder-" == 0)):
					time = script_id.replace(u"day-before-reminder-", "")
					vxml = voicexml.makeTomorrowReminder(recipient, "Appointment Reminder (Tomorrow)", time)
				else:
					time = script_id.replace(u"day-of-reminder-", "")
					vxml = voicexml.makeTodayReminder(recipient, "Appointment Reminder (Today)", time)

			if (row["MobileNumberA"] == u""):
				self.logEvent(recipient, u"Unable to schedule message: " + script_id + u" (" + msg_type + u") for " + unicode(date) + u". No phone number available.", u"schedule")
			elif (vxml != u""):
				scheduled_scripts = self.metadata.tables[u"scheduled_scripts"]

				id = unicode(uuid.uuid4())
		
				insert = scheduled_scripts.insert()
				insert.execute(Id=id, Recipient=recipient, Date=date, Script=vxml, ScriptId=script_id)

				self.logEvent(recipient, u"Scheduled message: " + script_id + u" (" + msg_type + u") for " + unicode(date) + u".", u"schedule")

				return True
			
		return False
	
	def descriptionForScript(self, script_id):
		desc = u"Unknown or Custom Script"
		
		broadcast = self.fetchBroadcast(script_id)
		
		try:
			desc = broadcast[u"name"] + u" (Broadcast)"
		except KeyError:
			pass

		tip = self.fetchTip(script_id)
		
		try:
			desc = tip[u"name"] + u" (Tip)"
		except KeyError:
			pass

		prompt = self.fetchPrompt(script_id)
		
		try:
			desc = prompt[u"name"] + u" (Prompt)"
		except KeyError:
			pass

		followup = self.fetchFollowup(script_id)
		
		try:
			desc = followup[u"name"] + u" (Followup)"
		except KeyError:
			pass
			
		return desc
	
	def upcomingScripts(self):
		scripts = []
		
		now = datetime.now()
		
		scheduled_scripts = self.metadata.tables[u"scheduled_scripts"]
		participants = self.metadata.tables[u"participants"]
		
		where_parts = []
		where_parts.append(scheduled_scripts.c.Executed == None)
		whereclause = and_(*where_parts)

		stmt = select([scheduled_scripts.c.Id, scheduled_scripts.c.Recipient, scheduled_scripts.c.ScriptId, scheduled_scripts.c.Date], whereclause=whereclause, order_by=[scheduled_scripts.c.Date])
		result = stmt.execute()
		
		for row in result.fetchall():
			script = {}
			script[u"message_id"] = row[u"Id"]
			script[u"script_id"] = row[u"ScriptId"]
			script[u"date"] = row[u"Date"]
			script[u"script"] = self.descriptionForScript(script[u"script_id"])
			script[u"recipient"] = row[u"Recipient"]

			scripts.append(script)

		return scripts
		
	def overdueScripts(self):
		scripts = []
		
		now = datetime.now()
		
		scheduled_scripts = self.metadata.tables[u"scheduled_scripts"]
		participants = self.metadata.tables[u"participants"]
		
		where_parts = []
		where_parts.append(scheduled_scripts.c.Date < now)
		where_parts.append(scheduled_scripts.c.Executed == None)
		whereclause = and_(*where_parts)

		stmt = select([scheduled_scripts.c.Id, scheduled_scripts.c.Recipient, scheduled_scripts.c.Script], whereclause=whereclause, order_by=[scheduled_scripts.c.Date])
		result = stmt.execute()
		
		for row in result.fetchall():
			script = {}
			script[u"script"] = row[u"Script"]
			script[u"id"] = row[u"Id"]

			recp_parts = []
			recp_parts.append(participants.c.Id == row[u"Recipient"])
			partsclause = and_(*recp_parts)

			parts_stmt = select([participants.c.MobileNumberA], whereclause=partsclause)
			parts_result = parts_stmt.execute()

			for part_row in parts_result.fetchall():
				script[u"recipient"] = u"+1" + (u"".join([c for c in part_row[u"MobileNumberA"] if c in u"1234567890."]))

			scripts.append(script)

		for script in scripts:
			where_parts = []
			where_parts.append(scheduled_scripts.c.Id == script[u"id"])
			whereclause = and_(*where_parts)

			values = {}
			values[u"Executed"] = now

			update = scheduled_scripts.update(whereclause=whereclause, values=values)
			update.execute()

		return scripts
	
	def allPrompts(self):
		prompts = self.metadata.tables[u"prompts"]

		prompts_list = []
		
		stmt = select([prompts.c.Id, prompts.c.Name])
		result = stmt.execute()
		
		for row in result.fetchall():
			prompts_list.append({ u"id": row[u"Id"], u"name": row[u"Name"] })

		return prompts_list
	
	def addPrompt(self, name):
		prompts = self.metadata.tables[u"prompts"]

		part_id = unicode(uuid.uuid4())
		
		insert = prompts.insert()
		insert.execute(Id=part_id, Name=name)
			
		return part_id

	def removePrompt(self, id):
		prompts = self.metadata.tables[u"prompts"]
		
		where_parts = []
		where_parts.append(prompts.c.Id == id)
		whereclause = and_(*where_parts)

		delete_stmt = delete(prompts, whereclause=whereclause)
		delete_stmt.execute()
		
		return True

	def fetchPrompt(self, id):
		part_dict = {}
	
		prompts = self.metadata.tables[u"prompts"]
		
		where_parts = []
		where_parts.append(prompts.c.Id == id)
		whereclause = and_(*where_parts)

		stmt = select([prompts.c.Id, prompts.c.Name, prompts.c.First, prompts.c.Second, prompts.c.First_Spanish, prompts.c.Second_Spanish], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			part_dict[u"id"] = row[u"Id"]
			part_dict[u"name"] = row[u"Name"]
			part_dict[u"first"] = row[u"First"]
			part_dict[u"second"] = row[u"Second"]

			part_dict[u"first_spanish"] = row[u"First_Spanish"]
			part_dict[u"second_spanish"] = row[u"Second_Spanish"]

		return part_dict
		
	def updatePrompt(self, id, name, first, second, first_spanish, second_spanish):
		prompts = self.metadata.tables[u"prompts"]

		where_parts = []
		where_parts.append(prompts.c.Id == id)
		whereclause = and_(*where_parts)

		values = {}
		values[u"Name"] = miseducate(name)
		values[u"First"] = miseducate(first)
		values[u"Second"] = miseducate(second)

		values[u"First_Spanish"] = miseducate(first_spanish)
		values[u"Second_Spanish"] = miseducate(second_spanish)
		
		update = prompts.update(whereclause=whereclause, values=values)
		update.execute()

	def allFollowups(self):
		followups = self.metadata.tables[u"followups"]

		followups_list = []
		
		stmt = select([followups.c.Id, followups.c.Name])
		result = stmt.execute()
		
		for row in result.fetchall():
			followups_list.append({ u"id": row[u"Id"], u"name": row[u"Name"] })

		return followups_list
	
	def addFollowup(self, name):
		followups = self.metadata.tables[u"followups"]

		part_id = unicode(uuid.uuid4())
		
		insert = followups.insert()
		insert.execute(Id=part_id, Name=name)
			
		return part_id

	def removeFollowup(self, id):
		followups = self.metadata.tables[u"followups"]
		
		where_parts = []
		where_parts.append(followups.c.Id == id)
		whereclause = and_(*where_parts)

		delete_stmt = delete(followups, whereclause=whereclause)
		delete_stmt.execute()
		
		return True

	def fetchFollowup(self, id):
		part_dict = {}
	
		followups = self.metadata.tables[u"followups"]
		
		where_parts = []
		where_parts.append(followups.c.Id == id)
		whereclause = and_(*where_parts)

		stmt = select([followups.c.Id, followups.c.Name, followups.c.Question, followups.c.Positive, followups.c.Negative, followups.c.Question_Spanish, followups.c.Positive_Spanish, followups.c.Negative_Spanish], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			part_dict[u"id"] = row[u"Id"]
			part_dict[u"name"] = row[u"Name"]
			part_dict[u"question"] = row[u"Question"]
			part_dict[u"positive"] = row[u"Positive"]
			part_dict[u"negative"] = row[u"Negative"]

			part_dict[u"question_spanish"] = row[u"Question_Spanish"]
			part_dict[u"positive_spanish"] = row[u"Positive_Spanish"]
			part_dict[u"negative_spanish"] = row[u"Negative_Spanish"]

		return part_dict
		
	def updateFollowup(self, id, name, question, positive, negative, question_spanish, positive_spanish, negative_spanish):
		followups = self.metadata.tables[u"followups"]

		where_parts = []
		where_parts.append(followups.c.Id == id)
		whereclause = and_(*where_parts)

		values = {}
		values[u"Name"] = name
		values[u"Question"] = miseducate(question)
		values[u"Positive"] = miseducate(positive)
		values[u"Negative"] = miseducate(negative)

		values[u"Question_Spanish"] = miseducate(question_spanish)
		values[u"Positive_Spanish"] = miseducate(positive_spanish)
		values[u"Negative_Spanish"] = miseducate(negative_spanish)
		
		update = followups.update(whereclause=whereclause, values=values)
		update.execute()
		
	def participantsInGroup(self, group):
		participant_list = []

		participants = self.metadata.tables[u"participants"]
		
		where_parts = []
	
		if (string.lower(group) == u"all"):
			pass
		else:
			where_parts.append(participants.c.Group == group)
			where_parts.append(participants.c.Program == group)

		whereclause = or_(*where_parts)

		stmt = select([participants.c.Id], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			participant_list.append(row[u"Id"])

		return participant_list

	def allReminders(self):
		reminders = self.metadata.tables[u"reminders"]

		reminders_list = []
		
		stmt = select([reminders.c.Id, reminders.c.Name])
		result = stmt.execute()
		
		for row in result.fetchall():
			reminders_list.append({ u"id": row[u"Id"], u"name": row[u"Name"] })

		return reminders_list
	
	def addReminder(self, name):
		reminders = self.metadata.tables[u"reminders"]

		part_id = unicode(uuid.uuid4())
		
		insert = reminders.insert()
		insert.execute(Id=part_id, Name=name)
			
		return part_id

	def removeReminder(self, id):
		reminders = self.metadata.tables[u"reminders"]
		
		where_parts = []
		where_parts.append(reminders.c.Id == id)
		whereclause = and_(*where_parts)

		delete_stmt = delete(reminders, whereclause=whereclause)
		delete_stmt.execute()
		
		return True

	def fetchReminder(self, id):
		part_dict = {}
	
		reminders = self.metadata.tables[u"reminders"]
		
		where_parts = []
		where_parts.append(reminders.c.Id == id)
		whereclause = and_(*where_parts)

		stmt = select([reminders.c.Id, reminders.c.Name, reminders.c.Question], whereclause=whereclause)
		result = stmt.execute()
		
		for row in result.fetchall():
			part_dict[u"id"] = row[u"Id"]
			part_dict[u"name"] = row[u"Name"]
			part_dict[u"question"] = row[u"Question"]
#			part_dict[u"positive"] = row[u"Positive"]
#			part_dict[u"negative"] = row[u"Negative"]

		return part_dict
		
	def updateReminder(self, id, name, question): #, positive, negative):
		reminders = self.metadata.tables[u"reminders"]

		where_parts = []
		where_parts.append(reminders.c.Id == id)
		whereclause = and_(*where_parts)

		values = {}
		values[u"Name"] = name
		values[u"Question"] = miseducate(question)
#		values[u"Positive"] = miseducate(positive)
#		values[u"Negative"] = miseducate(negative)
		
		update = reminders.update(whereclause=whereclause, values=values)
		update.execute()

	def scheduleAppointment(self, recipient, date):
		time = date.strftime(u"%I:%M%p")

		scheduled_scripts = self.metadata.tables[u"scheduled_scripts"]
	
		yesterday = date - timedelta(1);

		vxml = voicexml.makeTomorrowReminder(recipient, "Appointment Reminder (Tomorrow)", time)
		id = unicode(uuid.uuid4())

		insert = scheduled_scripts.insert()
		insert.execute(Id=id, Recipient=recipient, Date=yesterday, Script=vxml, ScriptId=u"tomorrow-reminder")

		self.logEvent(recipient, u"Scheduled reminder (tomorrow) for " + unicode(date) + u".", u"schedule")

		today = date - timedelta(0, (60 * 60 * 2))

		vxml = voicexml.makeTodayReminder(recipient, "Appointment Reminder (Today)", time)
		id = unicode(uuid.uuid4())

		insert = scheduled_scripts.insert()
		insert.execute(Id=id, Recipient=recipient, Date=today, Script=vxml, ScriptId=u"today-reminder")

		self.logEvent(recipient, u"Scheduled reminder (today) for " + unicode(date) + u".", u"schedule")
			
		return True




