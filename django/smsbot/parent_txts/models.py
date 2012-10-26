import local_settings

if local_settings.DISABLE_GEODJANGO:
	from django.db.models import Manager
	from django.db import models
else:
	from django.contrib.gis.db.models import GeoManager as Manager
	from django.contrib.gis.db import models

from profiles.models import *

AGE_GROUPS = (
    ('0 to 12 months', '0 to 12 months'),
    ('13 to 24 months', '13 to 24 months'),
    ('25 to 36 months', '25 to 36 months'),
    ('37 to 48 months', '37 to 48 months'),
    ('49+ months', '49+ months'),
    ('Interviews', 'Interviews'),
    ('Administrators', 'Administrators'),
)

SPONSORING_PROGRAMS = (
    ('IWSE', 'IWSE'),
    ('D-65', 'D-65'),
    ('Interviews', 'Interviews'),
)

class SocialWorkerRelationship(models.Model):
    subject = models.ForeignKey(UserProfile, related_name='social_help_relationships')
    worker = models.ForeignKey(UserProfile, related_name='social_work_relationships')
    program_affiliation = models.CharField(max_length=256, null=True, blank=True)

class StudyParticipationDetails(models.Model):
    subject = models.ForeignKey(UserProfile, related_name='study_details', unique=True)
    age_group = models.CharField(max_length=128, choices=AGE_GROUPS)
    program = models.CharField(max_length=128, choices=SPONSORING_PROGRAMS)
    study_id = models.CharField(max_length=256, null=True)
    
