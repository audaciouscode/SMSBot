import datetime
import re

from smsbot import local_settings

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
        return self.scripts.filter(start_date__gte=start, start_date__lt=end, tags__icontains=variable).count()
            
    
User.profile = property(lambda u: UserProfile.objects.get_or_create(user=u)[0])


class PhoneNumber(models.Model):
    profile = models.ForeignKey(UserProfile, related_name='phone_numbers')
    
    value = PhoneNumberField(max_length=16, null=True, blank=True, unique=True)
    priority = models.IntegerField(default=0)
    active = models.BooleanField(default=True)
    
    best_time = models.TimeField(default=datetime.time(12, 0, 0))

