import os
import sys

os.environ['PYTHON_EGG_CACHE'] = '/tmp/python-eggs'

path = '/usr/local/smsbot/smsbot_web'
if path not in sys.path:
    sys.path.append(path)

path = '/usr/local/smsbot'
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'smsbot_web.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()

