import datetime
import json
import string

from django.contrib.auth.models import User
from django.http import HttpResponse

from events.models import ScriptEvent
from messages.models import ScheduledScript, make_uuid

from profiles.models import UserProfile, PhoneNumber

def add_script(request):
    result = {}
    result['status'] = 'error'
    result['message'] = ''
    
    if request.method == 'POST':
        if 'script' in request.POST:
            script = request.POST['script']

            if 'recipient' in request.POST:
                recipient = request.POST['recipient']

                date = datetime.datetime.now()
                
                if 'date' in request.POST:
                    date = datetime.datetime.strptime(request.POST['date'], '%Y-%m-%dT%H:%M:%S')
                
                script_obj = ScheduledScript()
                script_obj.script = script
                script_obj.start_date = date
                script_obj.start_date = date
                
                recipient_profile = None
                
                recipient = string.replace(recipient, '-', '')
                recipient = string.replace(recipient, ' ', '')
                recipient = string.replace(recipient, '.', '')
                recipient = string.replace(recipient, '(', '')
                recipient = string.replace(recipient, ')', '')
                
                try:
                    phone = PhoneNumber.objects.get(value=recipient) 

                    recipient_profile = phone.profile
                except:
                    try:
                        recipient_user = User.objects.get(username=recipient)
                    except:
                        recipient_user = User.objects.create_user(recipient, recipient + '@cbits.com', make_uuid())
                        recipient_user.save()

                    recipient_profile = recipient_user.profile
                    phone = PhoneNumber(profile=recipient_profile)
                    phone.value = recipient
                    
                    phone.save()
                    
                script_obj.recipient =  recipient_profile
                
                script_obj.save()
                result['status'] = 'ok'
                result['message'] = 'Script scheduled succesfully.'
            else:
                result['message'] = '"recipient" parameter missing. Please provide a valid recipient phone number.'
            
        else:
            result['message'] = '"script" parameter missing. Please provide a valid VXML document.'
    else:
        result['message'] = 'POST request required.'
    
    return HttpResponse(json.dumps(result, indent=1), mimetype='application/json')
    
    
def fetch_events(request):
    events = []
    
    for event in ScriptEvent.objects.all().order_by('date'):
        event_dict = {}
        
        event_dict['session'] = event.script.session

        try:
            event_dict['recipient'] = event.script.recipient.phone_numbers.all()[0].value
        except:
            pass

        event_dict['date'] = event.date.isoformat()
        event_dict['event'] = event.event
        
        if event.value:
            event_dict['payload'] = json.loads(event.value)

        events.append(event_dict)
        
    return HttpResponse(json.dumps(events, indent=1), mimetype='application/json')
