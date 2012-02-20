# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'Service'
        db.create_table('services_service', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('configuration', self.gf('django.db.models.fields.TextField')(default='{}', max_length=4096)),
            ('status', self.gf('django.db.models.fields.CharField')(max_length=256)),
        ))
        db.send_create_signal('services', ['Service'])


    def backwards(self, orm):
        
        # Deleting model 'Service'
        db.delete_table('services_service')


    models = {
        'services.service': {
            'Meta': {'object_name': 'Service'},
            'configuration': ('django.db.models.fields.TextField', [], {'default': "'{}'", 'max_length': '4096'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'status': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        }
    }

    complete_apps = ['services']
