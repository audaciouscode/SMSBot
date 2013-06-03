from datetime import datetime
import json
import traceback

from django.http import HttpResponse
from django.template import loader, Context
from django.views.decorators.csrf import csrf_exempt

from events.models import ScriptEvent, MessageEvent
from profiles.models import PhoneNumber, format_phone
from sms_messages.models import ScheduledScript, ScriptVariable

from services.models import AppApi

@csrf_exempt
def callback(request):
    response =  {}
    response['success'] = False 
    response['error'] = { 'description': 'Not yet implemented' }
    response['parameters'] = {}

    if request.method == 'POST':
        message = json.loads(request.POST['message'])

        if message['action'] == 'fetch_clarification':
            lang_code = ''
            
            phone_number = message['parameters']['recipient']
            
            phone_number = format_phone(phone_number)
            
            phone_objs = PhoneNumber.objects.filter(value=phone_number, active=True).order_by('priority')
            
            if phone_objs.count() > 0:
                lang_code = phone_objs[0].profile.primary_language

            template = None
            
            try:
                template = loader.get_template('clarification_' + lang_code + '.txt')
            except:
                template = loader.get_template('clarification.txt')

            c = Context({ 'message': message })

            response['parameters']['clarification'] = template.render(c)
            response['success'] = True

        elif message['action'] == 'fetch_unsolicited_response':
            lang_code = ''
            
            phone_number = message['parameters']['recipient']
            
            phone_number = format_phone(phone_number)
            
            phone_objs = PhoneNumber.objects.filter(value=phone_number, active=True).order_by('priority')
            
            if phone_objs.count() > 0:
                lang_code = phone_objs[0].profile.primary_language
            
            template = None
            
            try:
                template = loader.get_template('unsolicited_response_' + lang_code + '.txt')
            except:
                template = loader.get_template('unsolicited_response.txt')
            
            c = Context({ 'message': message })
            response['parameters']['response'] = template.render(c)
            response['success'] = True
            
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
            
            for app in AppApi.objects.all():
                try:
                    api = __import__(app.app_name + '.api', globals(), locals(), ['on_receive'], -1)
                    
                    api.on_receive(message['parameters']['sender'], message['parameters']['message'])
                except:
                    traceback.print_exc()                   
            
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