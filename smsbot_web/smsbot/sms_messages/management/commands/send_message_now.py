from django.core.management.base import BaseCommand, CommandError

from sms_messages.models import ScheduledMessage
from services.models import Service

class Command(BaseCommand):
    args = '<message_id message_id ...>'
    help = 'Immediately send selected scheduled messages.'

    def handle(self, *args, **options):
        best_service = Service.objects.best_service()

        for message_id in args:
            try:
                msg = ScheduledMessage.objects.get(pk=int(message_id))
            except ScheduledMessage.DoesNotExist:
                raise ScheduledMessage('Scheduled message "%s" does not exist' % message_id)

            if msg.service != None:
                msg.transmit(msg.service)
            else:
                msg.transmit(best_service)
