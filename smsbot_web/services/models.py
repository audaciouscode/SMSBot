from datetime import datetime
import json

import local_settings

if local_settings.DISABLE_GEODJANGO:
	from django.db.models import Manager
	from django.db import models
else:
	from django.contrib.gis.db.models import GeoManager as Manager
	from django.contrib.gis.db import models


SERVICE_STATUS = (
    ('Online', 'Online'), 
    ('Offline', 'Offline'),
    ('Error', 'Error'),
    ('Unknown', 'Unknown'),
)

class ServiceManager(Manager):
    def best_service(self):
        for svc in self.filter(status='Online'):
            return svc
            
        return None

class Service(models.Model):
    objects = ServiceManager()

    name = models.CharField(max_length=256)
    python_class = models.CharField(max_length=256)
    configuration = models.TextField(max_length=4096, default='{}')
    status = models.CharField(max_length=256, default='Unknown', choices=SERVICE_STATUS)
    last_status_check = models.DateTimeField(blank=True, null=True)
    last_error = models.TextField(max_length=4096, default='')
    
    def get_endpoint(self):
        service_module = __import__(self.python_class)
        
        endpoint = service_module.api.Endpoint(json.loads(self.configuration))
        
        return endpoint

    def initiate(self, script):
        endpoint = self.get_endpoint()
        endpoint.initiate_script(script)
    
    def transmit(self, message):
        endpoint = self.get_endpoint()
        endpoint.transmit_message(message)
        
    def update_status(self):
        endpoint = self.get_endpoint()

        status_check, error = endpoint.get_status()
        
        if error:
            self.last_error = error
        else:
            self.last_error = ''

        self.last_status_check = datetime.now()
        self.status = status_check

        self.save();
