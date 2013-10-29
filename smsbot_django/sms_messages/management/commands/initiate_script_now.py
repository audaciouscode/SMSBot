from django.core.management.base import BaseCommand, CommandError

from sms_messages.models import ScheduledScript
from services.models import Service

class Command(BaseCommand):
    args = '<script_id script_id ...>'
    help = 'Immediately initiate selected scripts.'

    def handle(self, *args, **options):
        best_service = Service.objects.best_service()

        for script_id in args:
            script = ScheduledScript.objects.get(pk=int(script_id))

            if script.service != None:
                script.initiate(script.service)
            else:
                script.initiate(best_service)
