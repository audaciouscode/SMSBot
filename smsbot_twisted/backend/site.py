# File to be customized for specific deployments...

xmpp_bot = None

def handleDialog(context):
	if (xmpp_bot is not None):
		xmpp_bot.processSmsMessage(context["sender"], context["command"])

