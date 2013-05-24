import datetime

from django.core.management.base import BaseCommand, CommandError
from django.utils.timezone import utc

from sms_messages.models import ScheduledMessage
from services.models import Service

class Command(BaseCommand):
    args = ''
    help = 'Send any overdue scheduled messages.'

    def handle(self, *args, **options):
        best_service = Service.objects.best_service()

        now = datetime.datetime.utcnow().replace(tzinfo=utc)
        
        for message in ScheduledMessage.objects.filter(send_date__lt=now, sent_date__isnull=True):
            if message.service != None:
                message.transmit(message.service)
            else:
                message.transmit(best_service)
