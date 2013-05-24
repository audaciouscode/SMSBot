# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'ScheduledMessage'
        db.create_table('sms_messages_scheduledmessage', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('message', self.gf('django.db.models.fields.TextField')(max_length=160)),
            ('recipient', self.gf('django.db.models.fields.related.ForeignKey')(related_name='messages', to=orm['profiles.UserProfile'])),
            ('send_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('sent_date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('confirmed_date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('use_recipient_time', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('random_delay', self.gf('django.db.models.fields.IntegerField')(default=0)),
            ('errors', self.gf('django.db.models.fields.TextField')(max_length=4096, null=True, blank=True)),
        ))
        db.send_create_signal('sms_messages', ['ScheduledMessage'])

        # Adding model 'ScriptTemplate'
        db.create_table('sms_messages_scripttemplate', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('slug', self.gf('django.db.models.fields.SlugField')(unique=True, max_length=64)),
            ('primary_language', self.gf('django.db.models.fields.CharField')(default='en', max_length=6)),
            ('script_file', self.gf('django.db.models.fields.files.FileField')(max_length=100)),
        ))
        db.send_create_signal('sms_messages', ['ScriptTemplate'])

        # Adding model 'ScheduledScript'
        db.create_table('sms_messages_scheduledscript', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('script', self.gf('django.db.models.fields.TextField')(max_length=1048576)),
            ('session', self.gf('django.db.models.fields.CharField')(default='b388a7e7-34d1-4bee-b584-57c135d772ce', unique=True, max_length=36)),
            ('recipient', self.gf('django.db.models.fields.related.ForeignKey')(related_name='scripts', to=orm['profiles.UserProfile'])),
            ('start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('sent_date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('confirmed_date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('completed_date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('use_recipient_time', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('random_delay', self.gf('django.db.models.fields.IntegerField')(default=0)),
            ('errors', self.gf('django.db.models.fields.TextField')(max_length=4096, null=True, blank=True)),
        ))
        db.send_create_signal('sms_messages', ['ScheduledScript'])

        # Adding model 'ScriptVariable'
        db.create_table('sms_messages_scriptvariable', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('script', self.gf('django.db.models.fields.related.ForeignKey')(related_name='variables', to=orm['sms_messages.ScheduledScript'])),
            ('key', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('value', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('recv_date', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal('sms_messages', ['ScriptVariable'])


    def backwards(self, orm):
        # Deleting model 'ScheduledMessage'
        db.delete_table('sms_messages_scheduledmessage')

        # Deleting model 'ScriptTemplate'
        db.delete_table('sms_messages_scripttemplate')

        # Deleting model 'ScheduledScript'
        db.delete_table('sms_messages_scheduledscript')

        # Deleting model 'ScriptVariable'
        db.delete_table('sms_messages_scriptvariable')


    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'content_type__model', 'codename')", 'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'profiles.userprofile': {
            'Meta': {'object_name': 'UserProfile'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'primary_language': ('django.db.models.fields.CharField', [], {'default': "'en'", 'max_length': '6'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']", 'unique': 'True'})
        },
        'sms_messages.scheduledmessage': {
            'Meta': {'object_name': 'ScheduledMessage'},
            'confirmed_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'errors': ('django.db.models.fields.TextField', [], {'max_length': '4096', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'message': ('django.db.models.fields.TextField', [], {'max_length': '160'}),
            'random_delay': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'recipient': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'messages'", 'to': "orm['profiles.UserProfile']"}),
            'send_date': ('django.db.models.fields.DateTimeField', [], {}),
            'sent_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'use_recipient_time': ('django.db.models.fields.BooleanField', [], {'default': 'True'})
        },
        'sms_messages.scheduledscript': {
            'Meta': {'object_name': 'ScheduledScript'},
            'completed_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'confirmed_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'errors': ('django.db.models.fields.TextField', [], {'max_length': '4096', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'random_delay': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'recipient': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'scripts'", 'to': "orm['profiles.UserProfile']"}),
            'script': ('django.db.models.fields.TextField', [], {'max_length': '1048576'}),
            'sent_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'session': ('django.db.models.fields.CharField', [], {'default': "'01fe9008-ec10-4cf6-af01-5e8f7a691aef'", 'unique': 'True', 'max_length': '36'}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'use_recipient_time': ('django.db.models.fields.BooleanField', [], {'default': 'True'})
        },
        'sms_messages.scripttemplate': {
            'Meta': {'object_name': 'ScriptTemplate'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'primary_language': ('django.db.models.fields.CharField', [], {'default': "'en'", 'max_length': '6'}),
            'script_file': ('django.db.models.fields.files.FileField', [], {'max_length': '100'}),
            'slug': ('django.db.models.fields.SlugField', [], {'unique': 'True', 'max_length': '64'})
        },
        'sms_messages.scriptvariable': {
            'Meta': {'object_name': 'ScriptVariable'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'key': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'recv_date': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'script': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'variables'", 'to': "orm['sms_messages.ScheduledScript']"}),
            'value': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        }
    }

    complete_apps = ['sms_messages']