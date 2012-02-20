from django.contrib.gis import admin

from parent_txts.models import *

class SocialWorkerRelationshipAdmin(admin.OSMGeoAdmin):
    list_display = ('subject', 'worker', 'program_affiliation')

admin.site.register(SocialWorkerRelationship, SocialWorkerRelationshipAdmin)

class StudyParticipationDetailsAdmin(admin.OSMGeoAdmin):
    list_display = ('subject', 'age_group', 'program', 'study_id')

admin.site.register(StudyParticipationDetails, StudyParticipationDetailsAdmin)
