from base import PersistenceResource

from xml.sax.saxutils import escape

class AllTips(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-Type", "text/xml; charset=utf-8")		
		
		xml = u"<select multiple=\"true\" id=\"all-tips\">"
		
		parts = self.persistence.allTips();

		for part in parts:
			xml += u"<option value=\"" + part[u"id"] + u"\">" + part[u"name"] + u"</option>"
		
		xml += u"</select>"

		return xml.encode("utf-8")

class AddTip(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-Type", "text/xml; charset=utf-8")
		
		part_id = self.persistence.addTip(request.args[u"name"][0]);

		if (part_id is not None):
			return (u"<ok id=\"" + part_id + u"\"/>").encode("utf-8")
		
		return u"<error />".encode("utf-8")

class RemoveTip(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-Type", "text/xml; charset=utf-8")		

		if (self.persistence.removeTip(request.args[u"id"][0])):
			return u"<ok />".encode("utf-8")
		
		return u"<error />".encode("utf-8")

class FetchTip(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-Type", "text/xml; charset=utf-8")		

		part = self.persistence.fetchTip(request.args[u"id"][0]);

		xml = u"<tip ";

		for key, value in part.items(): 
			if (value is None):
				value = ""
				
			xml += u" " + key + u"=\"" + escape(value) + u"\""

		xml += u" />"
		
		return xml.encode("utf-8")

class UpdateTip(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-Type", "text/xml; charset=utf-8")		

		part = request.args

		self.persistence.updateTip(part[u"id"][0], part[u"name"][0], part[u"first"][0], part[u"second"][0], part[u"third"][0], part[u"first_spanish"][0], part[u"second_spanish"][0], part[u"third_spanish"][0])

		return u"<ok />".encode("utf-8")
