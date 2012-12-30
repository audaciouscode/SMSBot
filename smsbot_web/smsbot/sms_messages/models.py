import uuid

from smsbot import local_settings

if local_settings.DISABLE_GEODJANGO:
    from django.db.models import Manager
    from django.db import models
else:
    from django.contrib.gis.db.models import GeoManager as Manager
    from django.contrib.gis.db import models

from django.conf.global_settings import LANGUAGES

from profiles.models import UserProfile
from services.models import Service

def make_uuid():
     return str(uuid.uuid4())

class ScheduledMessage(models.Model):
    if not local_settings.DISABLE_GEODJANGO:
        objects = models.GeoManager()

    message = models.TextField(max_length=160)
    
    recipient = models.ForeignKey(UserProfile, related_name='messages')
    
    send_date = models.DateTimeField()
    sent_date = models.DateTimeField(blank=True, null=True)
    confirmed_date = models.DateTimeField(blank=True, null=True)

    use_recipient_time = models.BooleanField(default=True)
    random_delay = models.IntegerField(default=0)
        
    errors = models.TextField(max_length=4096, blank=True, null=True)
    
    def transmit(self, service):
        service.transmit(self)

    def __unicode__(self):
        return self.message

    
class ScriptTemplate(models.Model):
    if not local_settings.DISABLE_GEODJANGO:
        objects = models.GeoManager()

    name = models.CharField(max_length=128)
    slug = models.SlugField(max_length=64, unique=True)
    
    primary_language = models.CharField(max_length=6, default='en', choices=LANGUAGES)

    # TODO: VALIDATE VXML
    
    script_file = models.FileField(upload_to='vxml_templates')
    
    def generate_script(self, values):
        pass

class ScheduledScript(models.Model):
    if not local_settings.DISABLE_GEODJANGO:
        objects = models.GeoManager()

    script = models.TextField(max_length=1048576)
    session = models.CharField(max_length=36, unique=True, default=make_uuid) # UUID
    
    recipient = models.ForeignKey(UserProfile, related_name='scripts')
    
    start_date = models.DateTimeField()
    sent_date = models.DateTimeField(null=True, blank=True)
    confirmed_date = models.DateTimeField(null=True, blank=True)
    completed_date = models.DateTimeField(null=True, blank=True)
    
    use_recipient_time = models.BooleanField(default=True)
    random_delay = models.IntegerField(default=0)
    
    errors = models.TextField(max_length=4096, blank=True, null=True)
    
    def initiate(self, service):
        service.initiate(self)

    def __unicode__(self):
        return self.session + ' (' + self.recipient.user.username + ')'
        
class ScriptVariable(models.Model):
    if not local_settings.DISABLE_GEODJANGO:
        objects = models.GeoManager()

    script = models.ForeignKey(ScheduledScript, related_name='variables')
    
    key = models.CharField(max_length=256)
    value = models.CharField(max_length=256)

    recv_date = models.DateTimeField(auto_now_add=True)
