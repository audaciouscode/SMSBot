from base import PersistenceResource

from xml.sax.saxutils import escape

class AllFollowups(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
		
		xml = u"<select multiple=\"true\" id=\"all-followups\">"
		
		parts = self.persistence.allFollowups();

		for part in parts:
			xml += u"<option value=\"" + part[u"id"] + u"\">" + part[u"name"] + u"</option>"
		
		xml += u"</select>"

		return xml.encode('utf-8')

class AddFollowup(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part_id = self.persistence.addFollowup(request.args[u"name"][0]);

		if (part_id is not None):
			return (u"<ok id=\"" + part_id + u"\"/>").encode('utf-8')
		
		return u"<error />".encode('utf-8')

class RemoveFollowup(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		if (self.persistence.removeFollowup(request.args[u"id"][0])):
			return u"<ok />".encode('utf-8')
		
		return u"<error />".encode('utf-8')

class FetchFollowup(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = self.persistence.fetchFollowup(request.args[u"id"][0]);

		xml = u"<followup ";

		for key, value in part.items(): 
			if (value is None):
				value = ""
				
			xml += u" " + key + u"=\"" + escape(value) + "\""

		xml += u" />"
		
		return xml.encode('utf-8')

class UpdateFollowup(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = request.args

		self.persistence.updateFollowup(part[u"id"][0], part[u"name"][0], part[u"question"][0], part[u"positive"][0], part[u"negative"][0], part[u"question_spanish"][0], part[u"positive_spanish"][0], part[u"negative_spanish"][0])

		return u"<ok />".encode('utf-8')
