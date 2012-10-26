# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Changing field 'Service.last_error'
        db.alter_column('services_service', 'last_error', self.gf('django.db.models.fields.TextField')(max_length=4096, null=True))


    def backwards(self, orm):
        
        # Changing field 'Service.last_error'
        db.alter_column('services_service', 'last_error', self.gf('django.db.models.fields.TextField')(max_length=4096))


    models = {
        'services.service': {
            'Meta': {'object_name': 'Service'},
            'configuration': ('django.db.models.fields.TextField', [], {'default': "'{}'", 'max_length': '4096'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_error': ('django.db.models.fields.TextField', [], {'max_length': '4096', 'null': 'True', 'blank': 'True'}),
            'last_status_check': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'python_class': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'status': ('django.db.models.fields.CharField', [], {'default': "'Unknown'", 'max_length': '256'})
        }
    }

    complete_apps = ['services']
