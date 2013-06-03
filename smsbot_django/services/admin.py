from django.contrib.gis import admin

from services.models import Service, AppApi

class ServiceAdmin(admin.OSMGeoAdmin):
    list_display = ('name', 'status', 'last_status_check')

admin.site.register(Service, ServiceAdmin)

class AppApiAdmin(admin.OSMGeoAdmin):
    list_display = ('app_name',)

admin.site.register(AppApi, AppApiAdmin)

