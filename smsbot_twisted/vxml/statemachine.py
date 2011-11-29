import voicexml

from datetime import datetime

class DialogStateMachine:
	def __init__(self, script, endpoint, output_function, refresh_times=0, refresh_interval=0):
		self.script = script
		self.node, commands = voicexml.parse(self.script)
		self.endpoint = endpoint
		self.output_function = output_function
		
		self.refresh_times = refresh_times
		self.refresh_interval = refresh_interval

		self.last_refresh = datetime.now()
		
		self.execute(commands)
	
	def isReady(self):
		if (self.node):
			return True
		
		return False

	def cancel(self):
		self.node = None

	def process(self, line):
		self.last_refresh = datetime.now()

		commands = self.node.process(line)

		self.execute(commands)
		
		if (self.node is None):
			return False
		
		return True

	def execute(self, commands):
		for command in commands:
			command.endpoint = self.endpoint
			next_commands, output = command.execute(self)
			
			if (output is not None):
				self.output_function(self.endpoint, output)									
				
			if (next_commands):
				self.execute(next_commands)
				
	def refresh(self):
		now = datetime.now()
		if (self.refresh_times > 0):
			
			delta = now - self.last_refresh
			
			if (delta.seconds / 60 >= self.refresh_interval or delta.days > 0):
				self.execute(self.node.initialCommands())
			
				self.refresh_times -= 1
			
				self.last_refresh = now
			
def parse_script(script):
	return DialogStateMachine(script)