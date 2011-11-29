from base import PersistenceResource

from xml.sax.saxutils import escape

class AllPrompts(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
		
		xml = u"<select multiple=\"true\" id=\"all-prompts\">"
		
		parts = self.persistence.allPrompts();

		for part in parts:
			xml += u"<option value=\"" + part[u"id"] + u"\">" + part[u"name"] + u"</option>"
			
		xml += u"</select>"

		return xml.encode("utf-8")

class AddPrompt(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part_id = self.persistence.addPrompt(request.args[u"name"][0]);

		if (part_id is not None):
			return (u"<ok id=\"" + part_id + u"\"/>").encode("utf-8")
		
		return u"<error />".encode("utf-8")

class RemovePrompt(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		if (self.persistence.removePrompt(request.args[u"id"][0])):
			return u"<ok />".encode("utf-8")
		
		return u"<error />".encode("utf-8")

class FetchPrompt(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = self.persistence.fetchPrompt(request.args[u"id"][0]);

		xml = u"<prompt ";

		for key, value in part.items(): 
			if (value is None):
				value = u""
				
			xml += u" " + key + u"=\"" + escape(value) + u"\""

		xml += u" />"
		
		return xml.encode("utf-8")

class UpdatePrompt(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = request.args

		self.persistence.updatePrompt(part[u"id"][0], part[u"name"][0], part[u"first"][0], part[u"second"][0], part[u"first_spanish"][0], part[u"second_spanish"][0])

		return u"<ok />".encode("utf-8")
