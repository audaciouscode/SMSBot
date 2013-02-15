from datetime import *

from twisted.python import log
from twisted.web import resource, server

from twilio.rest import TwilioRestClient

import local_settings

class HandleRequest(resource.Resource):
    def __init__(self, xmpp_bot):
        resource.Resource.__init__(self)

        self.xmpp_bot = xmpp_bot

    def render_POST(self, request):
        print(str(request.args))
        
        sender = request.args['From'][0]
        msg_txt = request.args['Body'][0]
        
        now = datetime.now()
        
        date_txt = now.strftime('%Y-%m-%dT%H:%M:%SZ')

        xml_string = '<received from="' + sender + '" date="' + date_txt + '"><![CDATA[ ' + msg_txt + ' ]]></received>';

        self.xmpp_bot.transmitMessage(xml_string, local_settings.XMPP_ENDPOINT, use_query=False)
        
        request.setHeader("Content-type", "text/xml")
        return '<?xml version="1.0" encoding="UTF-8"?><Response></Response>'
