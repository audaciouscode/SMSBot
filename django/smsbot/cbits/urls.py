from django.conf.urls.defaults import *

from views import *

urlpatterns = patterns('',
    url(r'add_script$', add_script, name='cbits_add_script'),
    url(r'fetch_events$', fetch_events, name='cbits_fetch_events'),
)
