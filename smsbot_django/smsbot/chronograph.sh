#!/bin/bash

source /var/www/django/smsbot/smsbot_web/venv/bin/activate
cd /var/www/django/smsbot/smsbot_web/smsbot
./manage.py initiate_overdue_scripts
./manage.py update_services_status
./manage.py send_overdue_messages
./manage.py schedule_moodtext_today
./manage.py ingest_moodtext_phq9
