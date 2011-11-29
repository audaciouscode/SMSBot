from base import PersistenceResource

from xml.sax.saxutils import escape

class AllBroadcasts(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
		
		xml = u"<select multiple=\"true\" id=\"all-broadcasts\">"
		
		parts = self.persistence.allBroadcasts();

		for part in parts:
			xml += u"<option value=\"" + part[u"id"] + u"\">" + part[u"name"] + u"</option>"
		
		xml += u"</select>"

		return xml.encode("utf-8")

class AddBroadcast(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part_id = self.persistence.addBroadcast(request.args[u"name"][0]);

		if (part_id is not None):
			return (u"<ok id=\"" + part_id + u"\"/>").encode("utf-8")
		
		return u"<error />".encode("utf-8")

class RemoveBroadcast(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		if (self.persistence.removeBroadcast(request.args[u"id"][0])):
			return u"<ok />".encode("utf-8")
		
		return u"<error />".encode("utf-8")

class FetchBroadcast(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = self.persistence.fetchBroadcast(request.args[u"id"][0]);

		xml = u"<broadcast ";

		for key, value in part.items(): 
			if (value is None):
				value = u""
				
			xml += u" " + key + u"=\"" + escape(value) + u"\""

		xml += u" />"
		
		return xml.encode("utf-8")

class UpdateBroadcast(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = request.args

		self.persistence.updateBroadcast(part[u"id"][0], part[u"name"][0], part[u"message"][0], part[u"message_spanish"][0])

		return u"<ok />".encode("utf-8")
