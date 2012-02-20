from django.contrib.gis import admin

from services.models import Service

class ServiceAdmin(admin.OSMGeoAdmin):
    list_display = ('name', 'status')

admin.site.register(Service, ServiceAdmin)

