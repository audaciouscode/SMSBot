#!/bin/bash

source /home/moodtext/smsbot/venv/bin/activate
cd /home/moodtext/smsbot/smsbot_django
./manage.py initiate_overdue_scripts
./manage.py update_services_status
./manage.py send_overdue_messages
./manage.py schedule_moodtext_today
./manage.py ingest_moodtext_phq9
