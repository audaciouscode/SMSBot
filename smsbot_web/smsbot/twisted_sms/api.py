import datetime
import json
import urllib
import urllib2
import uuid

from django.template import loader, Context

class Endpoint:
    def __init__(self, configuration):
        self.configuration = configuration

    def _get_url_payload(self):
        url = self.configuration['endpoint']

        payload = {}
        payload['secret'] = self.configuration['secret']
        payload['action'] = ''
        payload['parameters'] = {}
        
        return url, payload
        
    def _send(self, url, payload):
        json_payload = json.dumps(payload)
        
        args = urllib.urlencode({ 'message': json_payload })
        
        req = urllib2.Request(url, args)
        req.add_data(args)

        response = urllib2.urlopen(req)
        
        response_string = response.read()
        
        response_dict = json.loads(response_string)
        
        return response_dict

    def initiate_script(self, script):
        url, payload = self._get_url_payload()
        
        payload['action'] = 'initiate_dialog'
        payload['parameters']['recipient'] = script.recipient.best_phone()
        payload['parameters']['session'] = script.session
        payload['parameters']['retry'] = 0
        payload['parameters']['timeout'] = 0
        
        payload['parameters']['vxml'] = script.script

        try:
            response = self._send(url, payload)
            
            if response['success']:
                script.sent_date = datetime.datetime.now()
                script.errors = ''
            else:
                script.errors = response['error']['description']
        except urllib2.URLError as strerror:
            script.errors = strerror

        script.save()
        
    def transmit_message(self, message):
        url, payload = self._get_url_payload()
        
        payload['action'] = 'initiate_dialog'
        payload['parameters']['recipient'] = message.recipient.best_phone()
        payload['parameters']['session'] = ''
        payload['parameters']['retry'] = 0
        payload['parameters']['timeout'] = 0
        
        template = loader.get_template('message.vxml')
        c = Context({ 'message': message.message })
        
        vxml = template.render(c)
        
        payload['parameters']['vxml'] = vxml

        try:
            response = self._send(url, payload)
            
            if response['success']:
                message.sent_date = datetime.datetime.now()
                message.errors = ''
            else:
                message.errors = response['error']['description']
        except urllib2.URLError as strerror:
            message.errors = strerror

        message.save()
    
    def get_status(self):
        url, payload = self._get_url_payload()
        
        payload['action'] = 'fetch_status'

        try:
            response = self._send(url, payload)
            
            if response['success']:
                if response['xmpp_sender_online']:
                    return 'Online', None
                
            return 'Offline', response['error']['description']
        except urllib2.URLError as strerror:
            return 'Offline', "Connection error: {0}".format(strerror)
        
        
    