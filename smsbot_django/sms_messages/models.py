import datetime
import re
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
    tags = models.TextField(max_length=2048, null=True, blank=True)
    
    recipient = models.ForeignKey(UserProfile, related_name='messages')
    
    send_date = models.DateTimeField()
    sent_date = models.DateTimeField(blank=True, null=True)
    confirmed_date = models.DateTimeField(blank=True, null=True)

    use_recipient_time = models.BooleanField(default=True)
    random_delay = models.IntegerField(default=0)
    
    service = models.ForeignKey(Service, related_name='messages', null=True)
        
    errors = models.TextField(max_length=4096, blank=True, null=True)
    
    def transmit(self, service):
        if service == None:
            service = Service.objects.best_service()
        
        service.transmit(self)

    def __unicode__(self):
        return self.message

if local_settings.DISABLE_GEODJANGO:
    class ScriptTemplateManager(models.Manager):
        def template_for_language(self, slug, language='en'):
            lang_slug = slug + '_' + language
        
            scripts = super(ScriptTemplateManager, self).filter(slug=lang_slug)
        
            if scripts.count() > 0:
                return scripts[0]

            scripts = super(ScriptTemplateManager, self).filter(slug=slug)

            if scripts.count() > 0:
                return scripts[0]
            
            return None
else:
    class ScriptTemplateManager(models.GeoManager):
        def template_for_language(self, slug, language='en'):
            lang_slug = slug + '_' + language
        
            scripts = super(ScriptTemplateManager, self).filter(slug=lang_slug)
        
            if scripts.count() > 0:
                return scripts[0]

            scripts = super(ScriptTemplateManager, self).filter(slug=slug)

            if scripts.count() > 0:
                return scripts[0]
            
            return None

    
class ScriptTemplate(models.Model):
    objects = ScriptTemplateManager()

    name = models.CharField(max_length=128)
    slug = models.SlugField(max_length=64, unique=True)
    
    primary_language = models.CharField(max_length=6, default='en', choices=LANGUAGES)

    # TODO: VALIDATE VXML
    
    script_file = models.FileField(upload_to='vxml_templates')
    
    def generate_script(self, values):
        pass

    def __unicode__(self):
        return self.name + ' (' + self.slug + ')'

class ScheduledScript(models.Model):
    if not local_settings.DISABLE_GEODJANGO:
        objects = models.GeoManager()

    script = models.TextField(max_length=1048576)
    session = models.CharField(max_length=36, unique=True, default=make_uuid) # UUID
    
    recipient = models.ForeignKey(UserProfile, related_name='scripts')
    tags = models.TextField(max_length=2048, null=True, blank=True)
    
    start_date = models.DateTimeField()
    sent_date = models.DateTimeField(null=True, blank=True)
    confirmed_date = models.DateTimeField(null=True, blank=True)
    completed_date = models.DateTimeField(null=True, blank=True)

    template = models.ForeignKey(ScriptTemplate, related_name='scripts', null=True)
    
    use_recipient_time = models.BooleanField(default=True)
    random_delay = models.IntegerField(default=0)

    service = models.ForeignKey(Service, related_name='scripts', null=True)
    
    skipped = models.BooleanField(default=False)
    
    errors = models.TextField(max_length=4096, blank=True, null=True)
    
    def initiate(self, service):
        if self.recipient.active == False:
            self.sent_date = datetime.datetime.now()
            self.skipped = True
            self.save()
        else:
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
    
    def source_message(self):
        from events.models import MessageEvent
        
        delta = datetime.timedelta(0, 5)
        
        start = self.recv_date - delta
        end = self.recv_date + delta
        
        phone = self.script.recipient.best_phone()
        
        non_decimal = re.compile(r'[^\d.]+')
        phone = non_decimal.sub('', phone)
        
        matches = MessageEvent.objects.filter(date__gte=start, date__lte=end, type='receive', sender__endswith=phone)
        
        if matches.count() > 0:
            best_match = None
            delta = 10
            
            for message in matches:
                diff = abs((message.date - self.recv_date).seconds)

                if diff < delta or best_match == None:
                    delta = diff
                    best_match = message.message
                    
            if best_match != None:
                return best_match
                
        return self.value
                    
                    
        
        
