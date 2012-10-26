import datetime

from django.core.management.base import BaseCommand, CommandError

from messages.models import ScheduledScript
from services.models import Service

class Command(BaseCommand):
    args = ''
    help = 'Initiate any overdue scheduled scripts.'

    def handle(self, *args, **options):
        service = Service.objects.best_service()
        now = datetime.datetime.now()
        
        for script in ScheduledScript.objects.filter(start_date__lt=now, sent_date__isnull=True):
            script.initiate(service)
