from django.core.management.base import BaseCommand, CommandError
from messages.models import Poll

class Command(BaseCommand):
    args = '<message_id message_id ...>'
    help = 'Immediately send selected scheduled messages.'

    def handle(self, *args, **options):
        for message_id in args:
            try:
                msg = ScheduledMessage.objects.get(pk=int(message_id))
            except Poll.DoesNotExist:
                raise ScheduledMessage('Scheduled message "%s" does not exist' % message_id)

            msg.transmit()
            self.stdout.write('Successfully closed poll "%s"\n' % poll_id)
