#!/bin/bash

export PYTHONPATH=$PYTHONPATH:/usr/local/smsbot/smsbot_twisted

cd /usr/local/smsbot/smsbot_twisted

twistd -y smsbot.tac

