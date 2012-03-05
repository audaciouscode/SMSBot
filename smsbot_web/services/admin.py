from django.contrib.gis import admin

from services.models import Service

class ServiceAdmin(admin.OSMGeoAdmin):
    list_display = ('name', 'status', 'last_status_check')

admin.site.register(Service, ServiceAdmin)

