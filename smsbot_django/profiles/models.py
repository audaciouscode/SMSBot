import datetime
import pytz
import re
import time

from smsbot import local_settings, settings

if local_settings.DISABLE_GEODJANGO:
    from django.db.models import Manager
    from django.db import models
else:
    from django.contrib.gis.db.models import GeoManager as Manager
    from django.contrib.gis.db import models

from django.conf.global_settings import LANGUAGES
from django.contrib.auth.models import User
from django.contrib.localflavor.us.models import PhoneNumberField
from django.utils.encoding import smart_unicode

def numeric_value(msg_string):
    tokens = msg_string.split(' ')

    non_decimal = re.compile(r'[^\d.]+')
    
    for token in tokens:
        token = non_decimal.sub(' ', token)
        
        toks = token.split(' ')
        
        if len(toks) > 0:
            return float(toks[0])
            
    return None

def format_phone(phone_number):
    phone_number = re.sub('[^0-9]', '', phone_number)

    phone_digits_re = re.compile(r'^(?:1-?)?(\d{3})[-\.]?(\d{3})[-\.]?(\d{4})$')
        
    value = re.sub('(\(|\)|\s+)', '', smart_unicode(phone_number))
    m = phone_digits_re.search(phone_number)

    if m:
        return u'%s-%s-%s' % (m.group(1), m.group(2), m.group(3))
    
    return None

class UserProfile(models.Model):
    # User: username, name, e-mail
    
    user = models.ForeignKey(User, unique=True)
    primary_language = models.CharField(max_length=6, default='en', choices=LANGUAGES)
    notes = models.TextField(max_length=8192, null=True, blank=True)
    
    alert_mail = models.BooleanField(default=True)
    alert_text = models.BooleanField(default=True)
    
    active = models.BooleanField(default=True)
    
    def full_name(self):
        return self.user.first_name + ' ' + self.user.last_name
        
    def __unicode__(self):
        full_name = self.full_name()
        
        if full_name != ' ':
            return full_name + ' (' + self.user.username + ')'
        
        return self.user.username
        
    def best_phone(self):
        if self.phone_numbers.filter(active=True).order_by('priority').count() > 0:
            return self.phone_numbers.filter(active=True).order_by('priority')[0].value
        else:
            phone_number = re.sub('[^0-9]', '', self.user.username)
            
            if len(phone_number) == 10:
                self.set_primary_number(phone_number)
                
                return self.best_phone()
           
        return None

    def best_phones(self):
        if self.best_phone():
            return self.phone_numbers.filter(active=True).order_by('priority')
        
        return []
        
    def set_primary_number(self, phone_number):
        phone_number = format_phone(phone_number)
        
        found = False

        for phone in self.phone_numbers.all():
            if phone.value == phone_number:
                phone.priority = 0
                phone.active = True
                
                found = True
            else:
                phone.priority = 10
                
            phone.save()
            
        if found == False:
            phone = PhoneNumber(profile=self, value=phone_number)
            phone.save()

    def set_backup_number(self, phone_number):
        if phone_number == None or phone_number.strip() == '':
            for phone in self.phone_numbers.all():
                if phone.priority != 0:
                    phone.priority = 100
                    phone.active = False
                    phone.save()
                                
            return
        
        phone_number = format_phone(phone_number)

        found = False

        for phone in self.phone_numbers.all():
            if phone.value == phone_number:
                phone.priority = 10
                phone.active = True

                found = True
            elif phone.priority != 0:
                phone.priority = 100
                
            phone.save()
            
        if found == False:
            phone = PhoneNumber(profile=self, value=phone_number, priority=10)
            phone.save()
    
    def has_tagged_messages(self, variable, start, end):
        return self.tagged_message_count(variable, start, end) > 0

    def tagged_message_count(self, variable, start, end):
        return self.scripts.filter(start_date__gte=start, start_date__lte=end, tags__icontains=variable).count()
    
    def numeric_values(self, variable, start=None, end=None):
        from sms_messages.models import ScriptVariable
        
        variables = ScriptVariable.objects.filter(script__recipient=self, key__startswith=variable).order_by('recv_date')
        
        if start != None and end != None:
            variables = ScriptVariable.objects.filter(script__recipient=self, key__startswith=variable, recv_date__gte=start, recv_date__lte=end).order_by('recv_date')

        local_tz = pytz.timezone(settings.TIME_ZONE)
            
        values = []

        for variable in variables:
            value = numeric_value(variable.value)
            
            recv_date = variable.recv_date.astimezone(local_tz)
            
            if value != None:
                values.append(((time.mktime(recv_date.timetuple()) * 1000), value, variable.source_message()))
                
        return values
        
    def numeric_variables(self):
        return [('mood', 'Mood Ratings',)]
        
        
    def msg_statistics(self):
        from events.models import MessageEvent, ScriptEvent

        stats = []

        now = datetime.datetime.now()
        
        ranges = []
        ranges.append(('Today', now, datetime.timedelta(1)))
        ranges.append(('Yesterday', now - datetime.timedelta(1), datetime.timedelta(1)))
        ranges.append(('This Week', now, datetime.timedelta(7)))
        ranges.append(('Last Week', now - datetime.timedelta(7), datetime.timedelta(7)))
        ranges.append(('Month', now, datetime.timedelta(30)))
        ranges.append(('Year', now, datetime.timedelta(365)))
        ranges.append(('All', now, datetime.timedelta(365 * 100)))

        for range in ranges:
            date_stats = {}
            date_stats['period'] = range[0]
            
            phone = self.best_phone().replace('-', '')
            
            start = range[1] - range[2]
            
            date_stats['sent'] = MessageEvent.objects.filter(sender__contains=phone, date__lte=range[1], date__gte=start).count()
            date_stats['received'] = MessageEvent.objects.filter(recipient__contains=phone, date__lte=range[1], date__gte=start).count()
            date_stats['responses'] = ScriptEvent.objects.filter(event='script_session_variable_set', date__lte=range[1], date__gte=start, script__recipient=self).count()
            
            if date_stats['received'] > 0:
                date_stats['response_rate'] = float(date_stats['responses']) / float(date_stats['received']) * 100
            else:
                date_stats['response_rate'] = 'N/A'
                
            latency_elapsed = 0.0
            session_count = 0
            
            sessions = []
            
            for event in ScriptEvent.objects.filter(date__lte=range[1], date__gte=start, script__recipient=self).order_by('date'):
                if (event.script in sessions) == False:
                    sessions.append(event.script)
                    
            for script in sessions:
                start = ScriptEvent.objects.filter(script=script, event='script_session_started')[0]

                responses = ScriptEvent.objects.filter(script=script, event='script_session_variable_set')
                
                if responses.count() > 0:
                    end = responses[0]
                    
                    diff = end.date - start.date
                    
                    session_count += 1
                    latency_elapsed += diff.seconds + (24 * 60 * 60 * diff.days)

            if session_count > 0:
                date_stats['latency'] = (latency_elapsed / session_count) / 60
            else:
                date_stats['latency'] = 'N/A'
            
            stats.append(date_stats)
        
        return stats
            
    
User.profile = property(lambda u: UserProfile.objects.get_or_create(user=u)[0])


class PhoneNumber(models.Model):
    profile = models.ForeignKey(UserProfile, related_name='phone_numbers')
    
    value = PhoneNumberField(max_length=16, null=True, blank=True, unique=True)
    priority = models.IntegerField(default=0)
    active = models.BooleanField(default=True)
    
    best_time = models.TimeField(default=datetime.time(12, 0, 0))

