from django.contrib.gis import admin

from sms_messages.models import *
from services.models import Service

class ScheduledMessageAdmin(admin.OSMGeoAdmin):
    list_display = ('recipient', 'message', 'send_date', 'sent_date', 'confirmed_date')

    def transmit_messages(self, request, queryset):
        service = Service.objects.best_service()
        
        if service:
            for msg in queryset:
                msg.transmit(service)
                self.message_user(request, "Message successfully transmitted to %s." % str(msg.recipient))
        else:
            self.message_user(request, "Unable to transmit messages. No suitable service found.")
        
    transmit_messages.short_description = "Transmit selected messages immediately"

    actions = [transmit_messages]

admin.site.register(ScheduledMessage, ScheduledMessageAdmin)

class ScriptTemplateAdmin(admin.OSMGeoAdmin):
    list_display = ('name', 'slug', 'primary_language')

admin.site.register(ScriptTemplate, ScriptTemplateAdmin)

class ScheduledScriptAdmin(admin.OSMGeoAdmin):
    list_display = ('recipient', 'session', 'start_date', 'sent_date', 'confirmed_date', 
                    'completed_date')

    def initiate_script(self, request, queryset):
        service = Service.objects.best_service()
        
        if service:
            for script in queryset:
                script.initiate(service)
                self.message_user(request, "Script successfully initiated with %s." % str(script.recipient))
        else:
            self.message_user(request, "Unable to iniatiate script. No suitable service found.")
        
    initiate_script.short_description = "Initiate selected scripts immediately"

    actions = [initiate_script]

admin.site.register(ScheduledScript, ScheduledScriptAdmin)

class ScriptVariableAdmin(admin.OSMGeoAdmin):
    list_display = ('script', 'key', 'value', 'recv_date')
    list_filter = ('key', 'recv_date', 'script')

admin.site.register(ScriptVariable, ScriptVariableAdmin)
