import datetime

from django.core.management.base import BaseCommand, CommandError

from messages.models import ScheduledMessage
from services.models import Service

class Command(BaseCommand):
    args = ''
    help = 'Send any overdue scheduled messages.'

    def handle(self, *args, **options):
        service = Service.objects.best_service()
        now = datetime.datetime.now()
        
        for message in ScheduledMessage.objects.filter(send_date__lt=now, sent_date__isnull=True):
            message.transmit(service)
