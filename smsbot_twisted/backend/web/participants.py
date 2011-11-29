from base import PersistenceResource

from xml.sax.saxutils import escape

class AllParticipants(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
		
		xml = u"<select multiple=\"true\" id=\"all-participants\">"
		
		parts = self.persistence.allParticipants();
		
		for part in parts:
			xml += u"<option value=\"" + part[u"id"] + u"\">" + part[u"name"] + u"</option>"
				
		xml += u"</select>"
		
		return xml.encode("utf-8")

class AddParticipant(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part_id = self.persistence.addParticipant(request.args[u"name"][0]);

		if (part_id is not None):
			return (u"<ok id=\"" + part_id + u"\"/>").encode("utf-8")
		
		return u"<error />".encode("utf-8")

class RemoveParticipant(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		if (self.persistence.removeParticipant(request.args[u"id"][0])):
			return u"<ok />".encode("utf-8")
		
		return u"<error />".encode("utf-8")

class FetchParticipant(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = self.persistence.fetchParticipant(request.args[u"id"][0]);

		xml = u"<participant ";

		for key, value in part.items(): 
			if (value is None):
				value = u""
				
			xml += u" " + key + u"=\"" + escape(unicode(value)) + u"\""

		xml += u" />"
		
		return xml.encode("utf-8")

class UpdateParticipant(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = request.args
	
		spanish = (part[u"spanish"][0] == "true")

		self.persistence.updateParticipant(part[u"id"][0], part[u"case_number"][0], part[u"parent_name"][0], part[u"mobile_a"][0], part[u"mobile_b"][0], part[u"mobile_c"][0], part[u"mobile_d"][0],  part[u"mobile_e"][0],  part[u"group"][0],  part[u"visitor_name"][0],  part[u"visitor_mobile"][0], spanish, part[u"hour"][0], part[u"program"][0])

		return u"<ok />".encode("utf-8")