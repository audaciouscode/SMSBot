# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'ScheduledMessage'
        db.create_table('messages_scheduledmessage', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('message', self.gf('django.db.models.fields.TextField')(max_length=160)),
            ('recipient', self.gf('django.db.models.fields.related.ForeignKey')(related_name='messages', to=orm['profiles.UserProfile'])),
            ('send_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('sent_date', self.gf('django.db.models.fields.DateTimeField')(null=True)),
            ('confirmed_date', self.gf('django.db.models.fields.DateTimeField')(null=True)),
            ('use_recipient_time', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('random_delay', self.gf('django.db.models.fields.IntegerField')(default=0)),
            ('errors', self.gf('django.db.models.fields.TextField')(max_length=4096, null=True, blank=True)),
        ))
        db.send_create_signal('messages', ['ScheduledMessage'])

        # Adding model 'ScriptTemplate'
        db.create_table('messages_scripttemplate', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=64, db_index=True)),
            ('primary_language', self.gf('django.db.models.fields.CharField')(default='en', max_length=6)),
            ('script_file', self.gf('django.db.models.fields.files.FileField')(max_length=100)),
        ))
        db.send_create_signal('messages', ['ScriptTemplate'])

        # Adding model 'ScheduledScript'
        db.create_table('messages_scheduledscript', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('script', self.gf('django.db.models.fields.TextField')(max_length=1048576)),
            ('session', self.gf('django.db.models.fields.CharField')(max_length=36)),
            ('recipient', self.gf('django.db.models.fields.related.ForeignKey')(related_name='scripts', to=orm['profiles.UserProfile'])),
            ('start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('send_date', self.gf('django.db.models.fields.DateTimeField')(null=True)),
            ('confirmed_date', self.gf('django.db.models.fields.DateTimeField')(null=True)),
            ('completed_date', self.gf('django.db.models.fields.DateTimeField')(null=True)),
            ('use_recipient_time', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('random_delay', self.gf('django.db.models.fields.IntegerField')(default=0)),
            ('errors', self.gf('django.db.models.fields.TextField')(max_length=4096, null=True, blank=True)),
        ))
        db.send_create_signal('messages', ['ScheduledScript'])

        # Adding model 'ScriptVariable'
        db.create_table('messages_scriptvariable', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('script', self.gf('django.db.models.fields.related.ForeignKey')(related_name='variables', to=orm['messages.ScheduledScript'])),
            ('key', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('value', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('recv_date', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal('messages', ['ScriptVariable'])


    def backwards(self, orm):
        
        # Deleting model 'ScheduledMessage'
        db.delete_table('messages_scheduledmessage')

        # Deleting model 'ScriptTemplate'
        db.delete_table('messages_scripttemplate')

        # Deleting model 'ScheduledScript'
        db.delete_table('messages_scheduledscript')

        # Deleting model 'ScriptVariable'
        db.delete_table('messages_scriptvariable')


    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'codename')", 'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
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
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'messages.scheduledmessage': {
            'Meta': {'object_name': 'ScheduledMessage'},
            'confirmed_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True'}),
            'errors': ('django.db.models.fields.TextField', [], {'max_length': '4096', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'message': ('django.db.models.fields.TextField', [], {'max_length': '160'}),
            'random_delay': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'recipient': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'messages'", 'to': "orm['profiles.UserProfile']"}),
            'send_date': ('django.db.models.fields.DateTimeField', [], {}),
            'sent_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True'}),
            'use_recipient_time': ('django.db.models.fields.BooleanField', [], {'default': 'True'})
        },
        'messages.scheduledscript': {
            'Meta': {'object_name': 'ScheduledScript'},
            'completed_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True'}),
            'confirmed_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True'}),
            'errors': ('django.db.models.fields.TextField', [], {'max_length': '4096', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'random_delay': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'recipient': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'scripts'", 'to': "orm['profiles.UserProfile']"}),
            'script': ('django.db.models.fields.TextField', [], {'max_length': '1048576'}),
            'send_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True'}),
            'session': ('django.db.models.fields.CharField', [], {'max_length': '36'}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'use_recipient_time': ('django.db.models.fields.BooleanField', [], {'default': 'True'})
        },
        'messages.scripttemplate': {
            'Meta': {'object_name': 'ScriptTemplate'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'primary_language': ('django.db.models.fields.CharField', [], {'default': "'en'", 'max_length': '6'}),
            'script_file': ('django.db.models.fields.files.FileField', [], {'max_length': '100'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '64', 'db_index': 'True'})
        },
        'messages.scriptvariable': {
            'Meta': {'object_name': 'ScriptVariable'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'key': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'recv_date': ('django.db.models.fields.DateTimeField', [], {}),
            'script': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'variables'", 'to': "orm['messages.ScheduledScript']"}),
            'value': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        },
        'profiles.userprofile': {
            'Meta': {'object_name': 'UserProfile'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'primary_language': ('django.db.models.fields.CharField', [], {'default': "'en'", 'max_length': '6'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']", 'unique': 'True'})
        }
    }

    complete_apps = ['messages']
