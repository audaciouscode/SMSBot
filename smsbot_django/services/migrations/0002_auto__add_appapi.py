# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'AppApi'
        db.create_table('services_appapi', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('app_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
        ))
        db.send_create_signal('services', ['AppApi'])


    def backwards(self, orm):
        # Deleting model 'AppApi'
        db.delete_table('services_appapi')


    models = {
        'services.appapi': {
            'Meta': {'object_name': 'AppApi'},
            'app_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
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