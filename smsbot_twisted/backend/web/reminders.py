from base import PersistenceResource

from xml.sax.saxutils import escape

class AllReminders(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
		
		xml = u"<select multiple=\"true\" id=\"all-reminders\">"
		
		parts = self.persistence.allReminders();

		for part in parts:
			xml += u"<option value=\"" + part[u"id"] + u"\">" + part[u"name"] + u"</option>"
		
		xml += u"</select>"

		return xml

class AddReminder(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part_id = self.persistence.addReminder(request.args[u"name"][0]);

		if (part_id is not None):
			return u"<ok id=\"" + part_id + u"\"/>"
		
		return u"<error />"

class RemoveReminder(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		if (self.persistence.removeReminder(request.args[u"id"][0])):
			return u"<ok />"
		
		return u"<error />"

class FetchReminder(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = self.persistence.fetchReminder(request.args[u"id"][0]);

		xml = u"<reminder ";

		for key, value in part.items(): 
			if (value is None):
				value = ""
				
			xml += u" " + key + u"=\"" + escape(value) + u"\""

		xml += u" />"
		
		return xml

class UpdateReminder(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = request.args

		self.persistence.updateReminder(part[u"id"][0], part[u"name"][0], part[u"question"][0]) # , part[u"positive"][0], part[u"negative"][0])

		return u"<ok />"
