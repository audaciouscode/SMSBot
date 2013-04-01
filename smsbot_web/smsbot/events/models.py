from smsbot import local_settings

if local_settings.DISABLE_GEODJANGO:
    from django.db.models import Manager
    from django.db import models
else:
    from django.contrib.gis.db.models import GeoManager as Manager
    from django.contrib.gis.db import models

from django.contrib.localflavor.us.models import PhoneNumberField

from sms_messages.models import ScheduledScript
from profiles.models import UserProfile


class ScriptEvent(models.Model):
    if not local_settings.DISABLE_GEODJANGO:
        objects = models.GeoManager()

    script = models.ForeignKey(ScheduledScript, related_name='events', null=True)
    event = models.CharField(max_length=128)
    date = models.DateTimeField(auto_now_add=True)
    
    value = models.TextField(max_length=4096, null=True, blank=True)

class MessageEvent(models.Model):
    if not local_settings.DISABLE_GEODJANGO:
        objects = models.GeoManager()

    type = models.CharField(max_length=256)

    sender = PhoneNumberField(max_length=16, null=True, blank=True)
    recipient = PhoneNumberField(max_length=16, null=True, blank=True)

    message = models.TextField(max_length=256)
    date = models.DateTimeField(auto_now_add=True)
    
    def from_system(self):
        return (self.sender == None)
