#!/bin/bash

# export PYTHONPATH=$PYTHONPATH:/usr/local/smsbot/smsbot_twisted

cd /var/www/smsbot/SMSBot/twisted/
source ./bin/activate
cd smsbot

twistd -ny smsbot.tac

