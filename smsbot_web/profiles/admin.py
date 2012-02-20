from profiles.models import *

from django.contrib.gis import admin

class UserProfileAdmin(admin.OSMGeoAdmin):
    list_display = ('user', 'primary_language')

admin.site.register(UserProfile, UserProfileAdmin)


class PhoneNumberAdmin(admin.OSMGeoAdmin):
    list_display = ('value', 'profile', 'priority', 'active', 'best_time')

admin.site.register(PhoneNumber, PhoneNumberAdmin)
