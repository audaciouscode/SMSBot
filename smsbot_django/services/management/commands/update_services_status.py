from django.core.management.base import BaseCommand, CommandError

from services.models import Service

class Command(BaseCommand):
    help = 'Update the status of each registered service.'

    def handle(self, *args, **options):
        for service in Service.objects.all():
            service.update_status()