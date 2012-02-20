import datetime
import json
import urllib
import urllib2

from twisted.python import log
from twisted.web import resource, server

import simplejson as json
import datetime
import time
import string
import random

import local_settings

from vxml import voicexml

class CallbackEndpoint():
    def _get_url_payload(self):
        url = local_settings.CALLBACK_URL

        payload = {}
        payload['secret'] = local_settings.CALLBACK_SECRET
        payload['action'] = ''
        payload['parameters'] = {}
        
        return url, payload

    def _send(self, url,  payload):
        json_payload = json.dumps(payload)
        
        print('SEND [' + url + ']: ' + json_payload)
        
        args = urllib.urlencode({ 'message': json_payload })
        
        req = urllib2.Request(url, args)
        req.add_data(args)

        response = urllib2.urlopen(req)
        
        response_string = response.read()
        
        response_dict = json.loads(response_string)
        
        print('RECV: ' + response_string)
        
        return response_dict
        
    def get_clarification(self, number):
        url, payload = self._get_url_payload()
        
        payload['action'] = 'fetch_clarification'
        payload['parameters']['recipient'] = number

        response = self._send(url, payload)
            
        if response['success']:
            return response['parameters']['clarification']

        return None

    def set_value(self, session, key, value):
        if session == '':
            return

        url, payload = self._get_url_payload()
        
        payload['action'] = 'set_value'
        payload['parameters']['session'] = session
        payload['parameters']['key'] = key
        payload['parameters']['value'] = value

        response = self._send(url, payload)
            
        if response['success']:
            return None

        # TODO: throw error on failure
        return None

    def log_session_started(self, session):
        if session == '':
            return

        url, payload = self._get_url_payload()
        
        payload['action'] = 'log_session_started'
        payload['parameters']['session'] = session

        response = self._send(url, payload)
            
        if response['success']:
            return None

        # TODO: throw error on failure
        return None

    def log_session_completed(self, session):
        if session == '':
            return

        url, payload = self._get_url_payload()
        
        payload['action'] = 'log_session_completed'
        payload['parameters']['session'] = session

        response = self._send(url, payload)
            
        if response['success']:
            return None

        # TODO: throw error on failure
        return None
        
    def log_session_error(self, session, error_msg):
        if session == '':
            return

        url, payload = self._get_url_payload()
        
        payload['action'] = 'log_session_error'
        payload['parameters']['session'] = session
        payload['parameters']['error'] = error_msg

        response = self._send(url, payload)
            
        if response['success']:
            return None

        # TODO: throw error on failure
        return None

    def process_unsolicited_message(self, number, message):
        url, payload = self._get_url_payload()
        
        payload['action'] = 'fetch_unsolicited_response'
        payload['parameters']['recipient'] = number

        response = self._send(url, payload)
            
        if response['success']:
            return response['parameters']['response']

        return None

    def message_received(self, sender, message):

        url, payload = self._get_url_payload()
        
        payload['action'] = 'log_receive'
        payload['parameters']['sender'] = sender
        payload['parameters']['message'] = message

        response = self._send(url, payload)
            
        if response['success']:
            return None

        # TODO: throw error on failure
        return None

    def message_sent(self, recipient, message):

        url, payload = self._get_url_payload()
        
        payload['action'] = 'log_send'
        payload['parameters']['recipient'] = recipient
        payload['parameters']['message'] = message

        response = self._send(url, payload)
            
        if response['success']:
            return None

        # TODO: throw error on failure
        return None

class HandleRequest(resource.Resource):
    def __init__(self, xmpp_bot):
        resource.Resource.__init__(self)

        self.xmpp_bot = xmpp_bot
        
    def fetch_status(self, response):
        response['xmpp_server_online'] = (self.xmpp_bot.xmlstream is not None)
        response['xmpp_sender_online'] = self.xmpp_bot.remote_online
        response['success'] = True
        
        response['error']['description'] = ''

    def initiate_dialog(self, response, message):
        print(json.dumps(message, sort_keys=True, indent=1))

        self.xmpp_bot.dialog_manager.startDialog(message["recipient"], message["vxml"], message["session"])        
        
    def render_POST(self, request):
        message = json.loads(request.args['message'][0])
        
        response =  {}
        response['success'] = False, 
        response['error'] = { 'description': 'Not yet implemented' }

        if message['action'] == 'fetch_status':
            self.fetch_status(response)
        elif message['action'] == 'initiate_dialog':
            self.initiate_dialog(response, message['parameters'])

        request.setHeader("Content-type", "application/json")
        
        request.write(json.dumps(response))
        request.finish()

        return server.NOT_DONE_YET
