import datetime

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
        return self.phone_numbers.order_by('priority')[0].value
    
User.profile = property(lambda u: UserProfile.objects.get_or_create(user=u)[0])


class PhoneNumber(models.Model):
    profile = models.ForeignKey(UserProfile, related_name='phone_numbers')
    
    value = PhoneNumberField(max_length=16, null=True, blank=True, unique=True)
    priority = models.IntegerField(default=0)
    active = models.BooleanField(default=True)
    
    best_time = models.TimeField(default=datetime.time(12, 0, 0))
