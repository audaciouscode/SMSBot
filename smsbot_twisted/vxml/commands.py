from backend import site

class Command:
	def execute(self, machine):
		return [], None
		
class PrintClarificationCommand(Command):
	def execute(self, machine):
		part_id = site.persistence.participantForNumber(self.endpoint)
		
		if (part_id is not None):
			part = site.persistence.fetchParticipant(part_id)
		
			if (part[u"spanish"]):
				return [], u"No le entendemos. Trate otra vez. (Con un numero?)"
			else:
				return [], u"I don't understand. Please try again. (Respond with a number?)"
		
		return [], None
		
class PrintCommand(Command):
	def __init__(self, string):
		self.string = string
	
	def execute(self, machine):
		print(unicode(self.string))
		
		return [], self.string

class LogValueCommand(Command):
	def __init__(self, key, value):
		self.key = key
		self.value = value

	def execute(self, machine):
		part_id = site.persistence.participantForNumber(self.endpoint)
		
		if (part_id is not None):
			site.persistence.setVariable(part_id, self.key, self.value)

		return [], None	
		
class GotoNodeCommand(Command):
	def __init__(self, node):
		self.node = node
		
	def execute(self, machine):
		machine.node = self.node

		if (machine.node):
			return machine.node.initialCommands(), None
		
		return [], None	

class NextCommand(Command):
	def execute(self, machine):
		machine.node = machine.node.nextNode()

		if (machine.node):
			return machine.node.initialCommands(), None
		
		return [], None
		
class SendMessageCommand(Command):
	def __init__(self, message, destination):
		self.message = message
		self.destination = destination

	def execute(self, machine):
		site.xmpp_bot.sendOutputIq(self.destination, self.message)

		return [], None	
