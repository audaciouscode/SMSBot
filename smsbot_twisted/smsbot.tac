import sys

from twisted.application import service, internet
from twisted.web import resource, server, static
from twisted.words.protocols.jabber import jid
from wokkel.client import XMPPClient

from backend import xmpp, site
from backend.web import api

from local_settings import *

application = service.Application("smsbot")

# Setup XMPP services...
xmpp_client = XMPPClient(jid.internJID(XMPP_JID), XMPP_PASSWORD, XMPP_SERVER)
xmpp_client.logTraffic = True

site.xmpp_bot = xmpp.SMSBotProtocol()
site.xmpp_bot.setHandlerParent(xmpp_client)

xmpp_client.setServiceParent(application)

# Setup HTTP services...
root = resource.Resource()
root.putChild('api', api.HandleRequest(site.xmpp_bot))

site = server.Site(root)

http = internet.TCPServer(API_PORT, site)
http.setServiceParent(application)
