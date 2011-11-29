function resizeAppointments()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);

	$("select#all-messages").height($("div#console-sidebar").height());
	$("select#all-messages").width(150);
	
	$("div.select-item").width($("div#function-body").width() - 150);
	$("div.edit-item").width($("div#function-body").width() - 160);
}

function scheduleReminder()
{
	var recipient = $("input#recipient-id").val();
	var appt_date = $("input#appt_date").val();
	
	var randomize = ($("input#randomize").attr("checked") === "true");
	
	if (recipient == "")
		alert("Please select a recepient.");
	else if (appt_date == "" && !appt_date)
		alert("Please select the date and time.");
	else
	{
		var details = {};
		details.recipient = recipient;
		details.appt_date = appt_date;

		$.post("/schedule-reminder.xml", details, function(xml)
		{
			$(xml).find("ok").each(function()
			{
				alert("Reminders scheduled.");
			});

			$(xml).find("error").each(function()
			{
				alert("Error scheduling reminder. Check the log for details.");
			});
			
			is_dirty = false;
		});
	}
}

function loadAppointments()
{
	$("div#console").load("xml/appointment.xml", function() 
	{
		$("button.save").click(scheduleReminder);
		
		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("input#appt_date").datetimepicker();

		$("input#recipients").autocomplete({
			source: "recipient-search.json",
			focus: function (event, ui) 
			{
				$(event.target).val(ui.item.label);

				return false;
			},
			select: function (event, ui) 
			{
				$(event.target).val(ui.item.label);
				$("input#recipient-id").val(ui.item.value);

				return false;
			}
		});
		
		resizeAppointments();
	});
}
