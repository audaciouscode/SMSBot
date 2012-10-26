from django.contrib.localflavor.us.models import PhoneNumberField
from django.contrib.gis.db import models

from messages.models import ScheduledScript
from profiles.models import UserProfile


class ScriptEvent(models.Model):
    objects = models.GeoManager()

    script = models.ForeignKey(ScheduledScript, related_name='events', null=True)
    event = models.CharField(max_length=128)
    date = models.DateTimeField(auto_now_add=True)
    
    value = models.TextField(max_length=4096, null=True, blank=True)

class MessageEvent(models.Model):
    objects = models.GeoManager()

    type = models.CharField(max_length=256)

    sender = PhoneNumberField(max_length=16, null=True, blank=True)
    recipient = PhoneNumberField(max_length=16, null=True, blank=True)

    message = models.TextField(max_length=256)
    date = models.DateTimeField(auto_now_add=True)
