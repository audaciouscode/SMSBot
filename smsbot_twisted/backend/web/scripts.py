from base import PersistenceResource

from xml.sax.saxutils import escape

class AllScripts(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")
		
		xml = u"<select multiple=\"true\" id=\"all-scripts\">"
		
		parts = self.persistence.allScripts();

		for part in parts:
			xml += u"<option value=\"" + part[u"id"] + u"\">" + part[u"name"] + u"</option>"
		
		xml += u"</select>"

		return xml.encode("utf-8")

class AddScript(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part_id = self.persistence.addScript(request.args[u"name"][0]);

		if (part_id is not None):
			return (u"<ok id=\"" + part_id + u"\"/>").encode("utf-8")
		
		return u"<error />".encode("utf-8")

class RemoveScript(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		if (self.persistence.removeScript(request.args[u"id"][0])):
			return u"<ok />".encode("utf-8")
		
		return u"<error />".encode("utf-8")

class FetchScript(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = self.persistence.fetchScript(request.args[u"id"][0]);

		xml = u"<scripts";

		for key, value in part.items():
			if (key == u"script" or key == u"script_spanish"):
				pass
			else:
				if (value is None):
					value = u""
				
				xml += u" " + key + u"=\"" + escape(value) + u"\""

		xml += u">"
		
		xml += u"<english><![CDATA[" + unicode(part["script"]) + u"]]></english>"
		xml += u"<spanish><![CDATA[" + unicode(part["script_spanish"]) + u"]]></spanish>"
		xml += u"</scripts>"
		
		return xml.encode("utf-8")

class UpdateScript(PersistenceResource):
	def render(self, request):
		request.setHeader("Content-type", "text/xml; charset=utf-8")

		part = request.args

		self.persistence.updateScript(unicode(part[u"id"][0]), unicode(part[u"name"][0]), unicode(part[u"script"][0]), unicode(part[u"script_spanish"][0]))

		return u"<ok />".encode("utf-8")
