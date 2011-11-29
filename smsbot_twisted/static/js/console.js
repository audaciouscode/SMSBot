var current_screen = "";

var is_dirty = false;

function dirty()
{
	is_dirty = true;
}

function showConsole(option)
{
	if (is_dirty)
	{
		if (confirm("You have unsaved changes. Continue?") === false)
		{
			return;
		}
	}

	$.each($("a.sidebar-link"), function(i, v) 
	{
		$(v).removeClass("sidebar-selected");
		$(v).addClass("sidebar-unselected");
	});
    
	if (current_screen !== option)
	{
		
		current_screen = option;
	
		if (current_screen == "overview")
		{
			if (loadOverview !== undefined)
				loadOverview();
		}
		else if (current_screen == "participants")
		{
			if (loadParticipants !== undefined)
				loadParticipants();
		}
		else if (current_screen == "groups")
		{
			if (loadGroups !== undefined)
				loadGroups();
		}
		else if (current_screen == "send-message")
		{
			if (loadSendMessage !== undefined)
				loadSendMessage();
		}
		else if (current_screen == "tips")
		{
			if (loadTips !== undefined)
				loadTips();
		}
		else if (current_screen == "broadcasts")
		{
			if (loadBroadcasts !== undefined)
				loadBroadcasts();
		}
		else if (current_screen == "prompts")
		{
			if (loadPrompts !== undefined)
				loadPrompts();
		}
		else if (current_screen == "followups")
		{
			if (loadFollowups !== undefined)
				loadFollowups();
		}
		else if (current_screen == "reminders")
		{
			if (loadReminders !== undefined)
				loadReminders();
		}
		else if (current_screen == "scheduler")
		{
			if (loadScheduler !== undefined)
				loadScheduler();
		}
		else if (current_screen == "custom")
		{
			if (loadCustom !== undefined)
				loadCustom();
		}
		else if (current_screen == "upcoming")
		{
			if (loadUpcoming !== undefined)
				loadUpcoming();
		}
		else if (current_screen == "events")
		{
			if (loadEvents !== undefined)
				loadEvents();
		}
		else if (current_screen == "appointment")
		{
			if (loadAppointments !== undefined)
				loadAppointments();
		}
		else
			alert("TODO: " + option);
	}

	$("a.sidebar-" + option).addClass("sidebar-selected");
	$("a.sidebar-" + option).removeClass("sidebar-unselected");

	$("div#console").corner("br 5px").corner("bl 5px");
	$("a.sidebar-selected").corner("3px");
	
	is_dirty = false;
}

function resizeConsole()
{
//	$("div#function-body").height($("div#console").height() - 42 - $("div#function-name").height() - $("div#console-footer").height());
	
	if (current_screen == "tips" && resizeTips != undefined)
		resizeTips();
	else if (current_screen == "participants" && resizeParticipants != undefined)
		resizeParticipants();
	else if (current_screen == "send-message" && resizeSendMessage != undefined)
		resizeSendMessage();
	else if (current_screen == "tips" && resizeTips != undefined)
		resizeTips();
	else if (current_screen == "broadcasts" && resizeBroadcasts != undefined)
		resizeBroadcasts();
	else if (current_screen == "scheduler" && resizeScheduler != undefined)
		resizeScheduler();
	else if (current_screen == "custom" && resizeCustom != undefined)
		resizeCustom();
	else if (current_screen == "prompts" && resizePrompts != undefined)
		resizePrompts();
	else if (current_screen == "followups" && resizeFollowups != undefined)
		resizeFollowups();
	else if (current_screen == "events" && resizeEvents != undefined)
		resizeEvents();
		
	$("a.sidebar-selected").corner("3px");
}

function loadRemoteStatus()
{
	$.get("/remote-status.xml", { "foo": "bar" }, function(xml)
	{
		$(xml).find("remote").each(function()
		{
			$("span#device-status").removeClass("device-unknown");
			$("span#device-status").removeClass("okay");
			$("span#device-status").removeClass("warning");

			if ($(this).attr("state") == "online")
			{
				$("div#console-status").addClass("status-okay");
				$("div#console-status").removeClass("status-warning");

				$("span#device-status").html("Online");
			}
			else
			{
				$("div#console-status").addClass("status-warning");
				$("div#console-status").removeClass("status-okay");

				$("span#device-status").html("Offline");
			}
    	});
    	
		$("div#console-status").corner("5px");
	});
}

function loadSidebar()
{
	$("div#console-sidebar").load("xml/sidebar.xml", function() 
	{
		$("div.sidebar-header").corner("tl 5px").corner("tr 5px");
		$("div.sidebar-section").corner("bl 5px").corner("br 5px");

		loadRemoteStatus();

		showConsole("overview");
	});
}

$(document).ready(function()
{
	var height = $(window).height();

	var window_resize = function ()
	{
//		var width = $(window).width() - 25;
//		var height = $(window).height() - 25;
//
//		$("div#console-frame").height(height);
//		$("div#console-frame").width(width);

//		var main_height = height - 40 - $("div#console-title").height() - $("div#console-footer").height();
//		$("div#console-sidebar").height(main_height);
//		$("div#console").height(main_height);
		
//		var main_width = width - 5 - $("div#console-sidebar").width();
//		$("div#console").width(main_width);
		
//		resizeConsole();
	};
	
	$(window).resize(window_resize);

//	$("body").css("overflow", "hidden");

	$("div#console-frame").corner("10px");
	$("div#console-title").corner("5px");
	$("div#console-footer").corner("5px");

	loadSidebar();

	setInterval(loadRemoteStatus, 30000);
	
	window_resize();
});

