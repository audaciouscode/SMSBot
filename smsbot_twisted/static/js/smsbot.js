function scheduleDialog()
{
	var number = $("input#dialog_number").val();
	var script = $("select#dialog").val();
	var date = $("input#dialog_date").val();
	
	$.post("/schedule", { "script": script, "to": number, "date": date }, function(xml)
	{
		$(xml).find("ok").each(function()
		{
	    	alert("Dialog scheduled successfully.");
    	});

		$(xml).find("error").each(function()
		{
	    	alert("Error scheduling dialog. Check the log for details.");
    	});
	});
}

function loadRemoteStatus()
{
	$.get("/remote-status.xml", { "foo": "bar" }, function(xml)
	{
		$(xml).find("remote").each(function()
		{
			if ($(this).attr("state") == "online")
			{
				$("span#remote-status").html("Online");
				$("span#remote-status").removeClass("remote-offline");
				$("span#remote-status").addClass("remote-online");
			}
			else
			{
				$("span#remote-status").html("Offline");
				$("span#remote-status").removeClass("remote-online");
				$("span#remote-status").addClass("remote-offline");
			}
    	});
	});
}
