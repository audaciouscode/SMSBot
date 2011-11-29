from twisted.application import service, internet
from twisted.web import resource, server, static
from twisted.words.protocols.jabber import jid
from wokkel.client import XMPPClient

import sys

reload(sys)
sys.setdefaultencoding('utf-8')
sys.path.append(".")

from backend import xmpp, scheduler, site, persistence
from backend.web import base, broadcasts, followups, participants, prompts, scripts, tips, reminders

application = service.Application("smsbot")

p = persistence.Persistence();
s = scheduler.Scheduler(p)

# Setup XMPP endpoints

xmppclient = XMPPClient(jid.internJID("smsbackend@boston.audacious-software.com/backend"), "backend", "boston.audacious-software.com")
xmppclient.logTraffic = True

site.xmpp_bot = xmpp.SMSBotProtocol()
site.xmpp_bot.setHandlerParent(xmppclient)
site.persistence = p

xmppclient.setServiceParent(application)

# Setup web endpoints on port 8080.

root = resource.Resource( )

root.putChild('', static.File('static/console.html'))
# root.putChild('', static.File('static/index.html'))
root.putChild('js', static.File('static/js'))
root.putChild('css', static.File('static/css'))
root.putChild('xml', static.File('static/xml'))

# XMPP / SMS
root.putChild('send', base.SendMessage(site.xmpp_bot))
# root.putChild('schedule', base.ScheduleDialog(s, site.xmpp_bot))
root.putChild('remote-status.xml', base.RemoteStatus(site.xmpp_bot))

# Participants

root.putChild('all-participants.xml', participants.AllParticipants(p))
root.putChild('add-participant.xml', participants.AddParticipant(p))
root.putChild('remove-participant.xml', participants.RemoveParticipant(p))
root.putChild('fetch-participant.xml', participants.FetchParticipant(p))
root.putChild('update-participant.xml', participants.UpdateParticipant(p))

# Tips

root.putChild('all-tips.xml', tips.AllTips(p))
root.putChild('add-tip.xml', tips.AddTip(p))
root.putChild('remove-tip.xml', tips.RemoveTip(p))
root.putChild('fetch-tip.xml', tips.FetchTip(p))
root.putChild('update-tip.xml', tips.UpdateTip(p))

# Prompts

root.putChild('all-prompts.xml', prompts.AllPrompts(p))
root.putChild('add-prompt.xml', prompts.AddPrompt(p))
root.putChild('remove-prompt.xml', prompts.RemovePrompt(p))
root.putChild('fetch-prompt.xml', prompts.FetchPrompt(p))
root.putChild('update-prompt.xml', prompts.UpdatePrompt(p))

# Followups

root.putChild('all-followups.xml', followups.AllFollowups(p))
root.putChild('add-followup.xml', followups.AddFollowup(p))
root.putChild('remove-followup.xml', followups.RemoveFollowup(p))
root.putChild('fetch-followup.xml', followups.FetchFollowup(p))
root.putChild('update-followup.xml', followups.UpdateFollowup(p))

# Reminders

root.putChild('all-reminders.xml', reminders.AllReminders(p))
root.putChild('add-reminder.xml', reminders.AddReminder(p))
root.putChild('remove-reminder.xml', reminders.RemoveReminder(p))
root.putChild('fetch-reminder.xml', reminders.FetchReminder(p))
root.putChild('update-reminder.xml', reminders.UpdateReminder(p))

# Broadcasts

root.putChild('all-broadcasts.xml', broadcasts.AllBroadcasts(p))
root.putChild('add-broadcast.xml', broadcasts.AddBroadcast(p))
root.putChild('remove-broadcast.xml', broadcasts.RemoveBroadcast(p))
root.putChild('fetch-broadcast.xml', broadcasts.FetchBroadcast(p))
root.putChild('update-broadcast.xml', broadcasts.UpdateBroadcast(p))

# Scheduler

root.putChild('all-messages.xml', base.AllMessages(p))
root.putChild('recipient-search.json', base.FindRecipient(p))
root.putChild('message-preview.xml', base.MessagePreview(p))
root.putChild('schedule-message.xml', base.ScheduleMessage(p))

root.putChild('upcoming-messages.xml', base.FetchUpcomingMessages(p))
root.putChild('remove-scheduled-item.xml', base.RemoveUpcomingMessage(p))

# Appointment Reminders

root.putChild('schedule-reminder.xml', base.ScheduleReminder(p))

# Custom Scripts

root.putChild('all-scripts.xml', scripts.AllScripts(p))
root.putChild('add-script.xml', scripts.AddScript(p))
root.putChild('remove-script.xml', scripts.RemoveScript(p))
root.putChild('fetch-script.xml', scripts.FetchScript(p))
root.putChild('update-script.xml', scripts.UpdateScript(p))

# Events

root.putChild('case-number-search.json', base.FindRecipientCaseNo(p))
root.putChild('event-search.xml', base.FindEvents(p))

# Overview

root.putChild('stats.xml', base.FetchStats(p))

site = server.Site(root)

http = internet.TCPServer(58081, site)
http.setServiceParent(application)

timer = internet.TimerService(30, s.wakeup)
timer.setServiceParent(application)