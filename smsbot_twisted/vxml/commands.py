from backend import site

class Command:
    def execute(self, machine):
        return [], None
        
class PrintClarificationCommand(Command):
    def execute(self, machine):
        clarification = machine.callback.get_clarification(self.endpoint)

        return [], clarification
        
class PrintCommand(Command):
    def __init__(self, string):
        self.string = string
    
    def execute(self, machine):
        return [], self.string

class LogValueCommand(Command):
    def __init__(self, key, value):
        self.key = key
        self.value = value

    def execute(self, machine):
        machine.callback.set_value(machine.session, self.key, self.value)
    
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
