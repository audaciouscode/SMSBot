from commands import *
from spidermonkey import Runtime

class StateNode:
	def __init__(self, next_node=None):
		self.next_node = next_node
	
	def nextNode(self):
		return self.next_node
		
	def initialCommands(self):
		return []
		
	def process(self, string):
		return []
		
	def insertNode(self, next_node):
		if (self.next_node is not None):
			node = next_node
			
			while (node.next_node):
				node = node.next_node
			
			node.insertNode(self.next_node)
		
		self.next_node = next_node;

	def appendNode(self, next_node):
		node = self
		
		while (node.next_node is not None):
			node = node.next_node
			
		node.next_node = next_node;
	
class EchoNode(StateNode):
	def initialCommands(self):
		return [PrintCommand(u"This echo node will repeat everything you send it.")]
	
	def process(self, string):
		if (string == u"."):
			return [PrintCommand(u"Finished echoing."), NextCommand()]
		else:
			return [PrintCommand(u"Echo: " + string)]

class PrintNode(StateNode):
	def __init__ (self, string=u"", next_node=None):
		StateNode.__init__(self, next_node)
		self.string = string
		
	def initialCommands(self):
		return [PrintCommand(self.string), NextCommand()]

class PromptNode(PrintNode):
	def __init__ (self, string, name, variable_name, recognize=[], next_node=None):
		PrintNode.__init__(self, string, next_node)
		self.recognize = recognize
		
		self.name = name
		self.value = None
		
		self.variable_name = variable_name
		
	def initialCommands(self):
		return [PrintCommand(self.string)]
		
	def process(self, string):
		if (len(self.recognize) < 1 or string in self.recognize):
			self.value = string
			
			return [LogValueCommand(self.variable_name, self.value), NextCommand()]

		for recog in self.recognize:
			if (string.startswith(recog)):
				self.value = recog
			
				return [LogValueCommand(self.variable_name, self.value), NextCommand()]
		
		return [PrintClarificationCommand()]

class PrintResultsNode(StateNode):
	def __init__ (self, start_node=None, next_node=None):
		StateNode.__init__(self, next_node)
		self.start_node = start_node

	def initialCommands(self):
		commands = []
		
		if (self.start_node is not None):
			commands.append(PrintCommand(u"Received the following values:"))
			
			start = self.start_node
			
			while (start != self and start is not None):
				if (isinstance(start, PromptNode)):
					commands.append(PrintCommand(u" " + start.name + u" = " + start.value))
					
				start = start.nextNode()
		else:
			commands.append(PrintCommand(u"Unable to print results. No start node provided."))
		
		commands.append(NextCommand())
		
		return commands

class ConditionalNode(StateNode):
	def __init__ (self, value_node, condition, true_nodes, false_nodes, next_node=None):
		StateNode.__init__(self, next_node)
		self.value_node = value_node
		self.condition = condition
		self.true_nodes = true_nodes
		self.false_nodes = false_nodes
		
	def initialCommands(self):
		rt = Runtime()
		cx = rt.new_context()

		cx.add_global(self.value_node.name, self.value_node.value)

		action_nodes = self.false_nodes

		if (cx.execute(self.condition)):
			action_nodes = self.true_nodes
			
		last_node = None
		first_node = None
		
		for action_node in action_nodes:
			if (first_node is None):
				first_node = action_node
				
			if (last_node is not None):
				last_node.next_node = action_node
			
			last_node = action_node

		if (last_node is not None):	
			last_node.next_node = self.next_node
	
		self.next_node = first_node
	
		return [NextCommand()]

class SendMessageNode(StateNode):
	def __init__ (self, message, destination, next_node=None):
		StateNode.__init__(self, next_node)

		self.message = message
		self.destination = destination
		
	def initialCommands(self):
		return [SendMessageCommand(self.message, self.destination), NextCommand()]


class SendVariableNode(StateNode):
	def __init__ (self, variable, destination, start_node, next_node=None):
		StateNode.__init__(self, next_node)

		self.start_node = start_node
		self.variable = variable
		self.destination = destination
		
	def initialCommands(self):
		commands = []

#		commands.append(SendMessageCommand(self.variable, self.destination))
		
		if (self.start_node is not None):
			start = self.start_node
			
			while (start != self and start is not None):
				if (isinstance(start, PromptNode)):
					if (start.name == self.variable):
						commands.append(SendMessageCommand(start.value, self.destination))
					
				start = start.nextNode()
		
		commands.append(NextCommand())
		
		return commands
