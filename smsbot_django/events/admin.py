from django.contrib.gis import admin

from events.models import ScriptEvent, MessageEvent

class ScriptEventAdmin(admin.OSMGeoAdmin):
    list_display = ('script', 'event', 'date')

admin.site.register(ScriptEvent, ScriptEventAdmin)


class MessageEventAdmin(admin.OSMGeoAdmin):
    list_display = ('type', 'sender', 'recipient', 'message', 'date')
    list_filter = ('type', 'sender', 'recipient', 'date')
admin.site.register(MessageEvent, MessageEventAdmin)
