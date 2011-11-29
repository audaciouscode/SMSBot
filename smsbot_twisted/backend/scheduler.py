from datetime import datetime

from twisted.internet import reactor

import site

class Scheduler:
	def __init__(self, persistence):
		self.persistence = persistence
		
	def wakeup(self):
		if (site.xmpp_bot.remote_online):
			scripts = self.persistence.overdueScripts()

			for script in scripts:
				self.persistence.logEvent(script["recipient"] , "Starting script '" + script["id"] + "'.", "script")
				site.xmpp_bot.dialog_manager.startDialog(script["recipient"], script["script"])

			site.xmpp_bot.dialog_manager.refreshMachines()