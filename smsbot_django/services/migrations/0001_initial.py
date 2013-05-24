# -*- coding: utf-8 -*-
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
            ('python_class', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('configuration', self.gf('django.db.models.fields.TextField')(default='{}', max_length=4096)),
            ('status', self.gf('django.db.models.fields.CharField')(default='Unknown', max_length=256)),
            ('last_status_check', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('last_error', self.gf('django.db.models.fields.TextField')(max_length=4096, null=True, blank=True)),
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
            'last_error': ('django.db.models.fields.TextField', [], {'max_length': '4096', 'null': 'True', 'blank': 'True'}),
            'last_status_check': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'python_class': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'status': ('django.db.models.fields.CharField', [], {'default': "'Unknown'", 'max_length': '256'})
        }
    }

    complete_apps = ['services']