# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding field 'Service.python_class'
        db.add_column('services_service', 'python_class', self.gf('django.db.models.fields.CharField')(default='', max_length=256), keep_default=False)


    def backwards(self, orm):
        
        # Deleting field 'Service.python_class'
        db.delete_column('services_service', 'python_class')


    models = {
        'services.service': {
            'Meta': {'object_name': 'Service'},
            'configuration': ('django.db.models.fields.TextField', [], {'default': "'{}'", 'max_length': '4096'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'python_class': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'status': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        }
    }

    complete_apps = ['services']
