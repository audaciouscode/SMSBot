from datetime import datetime
import json

from django.http import HttpResponse
from django.template import loader, Context

from events.models import ScriptEvent, MessageEvent
from sms_messages.models import ScheduledScript, ScriptVariable


def callback(request):
    response =  {}
    response['success'] = False 
    response['error'] = { 'description': 'Not yet implemented' }
    response['parameters'] = {}

    if request.method == 'POST':
        message = json.loads(request.POST['message'])

        if message['action'] == 'fetch_clarification':
            template = loader.get_template('clarification.txt')
            c = Context({ 'message': message })

            response['parameters']['clarification'] = template.render(c)
            response['success'] = True

        elif message['action'] == 'fetch_unsolicited_response':
            request.META['wsgi.errors'].write('1\n')
            template = loader.get_template('unsolicited_response.txt')
            request.META['wsgi.errors'].write('2\n')
            c = Context({ 'message': message })
            request.META['wsgi.errors'].write('3\n')

            response['parameters']['response'] = template.render(c)
            request.META['wsgi.errors'].write('4\n')
            response['success'] = True
            request.META['wsgi.errors'].write('5\n')
            
        elif message['action'] == 'set_value':
            script = ScheduledScript.objects.get(session=message['parameters']['session'])
            
            event = ScriptEvent(script=script, event='script_session_variable_set', 
                                value=json.dumps(message['parameters']))
            event.save()
            
            variable = ScriptVariable(script=script, key=message['parameters']['key'],
                                      value=message['parameters']['value'])
            variable.save()

            response['success'] = True
            response['error']['description'] = ''

        elif message['action'] == 'log_session_started':
            script = ScheduledScript.objects.get(session=message['parameters']['session'])
            script.confirmed_date = datetime.now() 
            script.save()
            
            event = ScriptEvent(script=script, event='script_session_started')
            event.save()

            response['success'] = True
            response['error']['description'] = ''

        elif message['action'] == 'log_receive':
            event = MessageEvent(type='receive', sender=message['parameters']['sender'], 
                                 message=message['parameters']['message'])
            event.save()

            response['success'] = True
            response['error']['description'] = ''

        elif message['action'] == 'log_send':
            event = MessageEvent(type='send', recipient=message['parameters']['recipient'], 
                                 message=message['parameters']['message'])
            event.save()

            response['success'] = True
            response['error']['description'] = ''

        else:
            request.META['wsgi.errors'].write('TODO: HANDLE ' + message['action'])
            response['success'] = True
    
    return HttpResponse(json.dumps(response), mimetype='application/json')