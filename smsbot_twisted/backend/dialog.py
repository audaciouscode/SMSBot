import os
import string
import datetime
import site

from xml.dom import minidom

from backend.web.api import CallbackEndpoint
from vxml.statemachine import DialogStateMachine

def clean_number(sender):
    return sender.replace('-', '').replace(' ', '').replace('(', '').replace(')', '')

class DialogManager:
    def __init__ (self, output_fn):
        self.sessions = {}
        self.output_fn = output_fn
        self.problem_users = {}
        self.callback = CallbackEndpoint()
        
    def startDialog(self, sender, dialog, session):
        sender = clean_number(sender)
        
        if self.sessions.has_key(sender):
            self.sessions[sender].cancel()
            del self.sessions[sender]

        document = minidom.parseString(dialog)
        
        repeat = 0
        interval = 0
        
        if (document.documentElement.hasAttributeNS(u"http://www.audacious-software.com/smsbot", u"repeat")):
            repeat = int(document.documentElement.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"repeat"))
            
        if (document.documentElement.hasAttributeNS(u"http://www.audacious-software.com/smsbot", u"repeat_interval")):
            interval = int(document.documentElement.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"repeat_interval"))
        
        script_machine = DialogStateMachine(dialog, sender, self.output_fn, repeat, interval, session)
        
        self.callback.log_session_started(str(session))
        
        if (script_machine.isReady()):
            self.sessions[sender] = script_machine
        else:
            self.callback.log_session_error(session, 'Unable to start session. State machine not ready.')

    def refreshMachines(self):
        for number, machine in self.sessions.items():
            machine.refresh()
        
    def process(self, sender, message):
        sender = clean_number(sender)
        
        message = message.lower().strip()

        self.callback.message_received(sender, message.strip())
        
        found = False
        
        for key, machine in self.sessions.iteritems():
            if sender.find(key) != -1:
                found = True
                machine.process(message)

                if (machine.isReady() is False):
                    del self.sessions[key]
                    self.callback.log_session_completed(machine.session)

                return None
    
        message = self.callback.process_unsolicited_message(sender, message)
            
        return message
