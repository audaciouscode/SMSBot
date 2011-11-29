var selected_reminder = "";

function updateQuestion()
{
	var l = 160 - $("textarea#question").val().length;

	$("span#question_count").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#question_count").removeClass("okay");
		$("span#question_count").addClass("warning");
	}
	else
	{
		$("span#question_count").removeClass("warning");
		$("span#question_count").addClass("okay");
	}
}

/* function updatePositive()
{
	var l = 160 - $("textarea#positive").val().length;

	$("span#positive_count").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#positive_count").removeClass("okay");
		$("span#positive_count").addClass("warning");
	}
	else
	{
		$("span#positive_count").removeClass("warning");
		$("span#positive_count").addClass("okay");
	}
}

function updateNegative()
{
	var l = 160 - $("textarea#negative").val().length;

	$("span#negative_count").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#negative_count").removeClass("okay");
		$("span#negative_count").addClass("warning");
	}
	else
	{
		$("span#negative_count").removeClass("warning");
		$("span#negative_count").addClass("okay");
	}
} */

function resizeReminders()
{
	$("select#all-reminders").width(200);
	$("select#all-reminders").height($("div#function-body").height() - $("button#remove-selected").height() - 30);

	$("table#body").width($("div#function-name").width());
	$("div.select-item").height($("td.list").height() / 2);
}

function showReminder(id)
{
	$("button.save").attr("disabled", true);
	$("button.remove-selected").attr("disabled", true);

	if (id == "")
	{
		$("div.edit-item").hide();
		$("div.select-item").show();
	}
	else
	{
		$.get("/fetch-reminder.xml", { "id": id }, function(xml)
		{
			$(xml).find("reminder").each(function()
			{
				$("button.save").attr("disabled", false);
				$("button.remove-selected").attr("disabled", false);

				$("div.select-item").hide();
				$("div.edit-item").show();

				$("input#name").val($(this).attr("name"));
				$("textarea#question").val($(this).attr("question"));
//				$("textarea#positive").val($(this).attr("positive"));
//				$("textarea#negative").val($(this).attr("negative"));
				$("input#reminder_id").val($(this).attr("id"));

				updateQuestion();
//				updatePositive();
//				updateNegative();
    		});
		});
	}

	$("select#all-reminders").val(id);
	selected_followup = id;
}

function loadReminders()
{
	$("div#console").load("xml/reminders.xml", function() 
	{
		$("button.save").attr("disabled", true);
		$("button.remove-selected").attr("disabled", true);
		$("button.add-new").attr("disabled", false);

		$("textarea#question").live("keyup", updateQuestion);
//		$("textarea#positive").live("keyup", updatePositive);
//		$("textarea#negative").live("keyup", updateNegative);

		$("div.edit-item").hide();
		$("div.select-item").show();

		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("div#reminder-list").load("all-reminders.xml", function()
		{
			resizeReminders();
			
			$("select#all-reminders").change(function()
			{
				if ($("select#all-reminders").val() != null)
					showReminder("" + $("select#all-reminders").val());
				else
					showReminder("");
			});

			setTimeout(function()
			{
				showReminder(selected_reminder);
			}, 250);
		});
		
		$("button.add-new").click(function()
		{
			addReminder();
		});

		$("button.remove-selected").click(function()
		{
			removeReminders();
		});

		$("button.save").click(function()
		{
			saveReminder();
		});

		resizeConsole();
	});
}


function addReminder()
{
	$.post("/add-reminder.xml", { "name": "New Reminder" }, function(xml)
	{
		loadReminders();
		
		$(xml).find("ok").each(function()
		{
			showReminder($(this).attr("id"));
    	});
	});
}

function removeReminders()
{
	if (confirm("Remove selected reminder?"))
	{
		var removed = false;
	
		$('select#all-reminders :selected').each(function(i, selected)
		{ 
			removed = true;
		
			$.post("/remove-reminder.xml", { "id": $(selected).val() });
		
			selected_reminder = "";
		});
	
		if (removed)
			loadReminders();
	}
}

function saveReminder()
{
	var reminder = {};
	
	reminder.name = $("input#name").val();
	reminder.question = $("textarea#question").val();
//	reminder.positive = $("textarea#positive").val();
//	reminder.negative = $("textarea#negative").val();

	reminder.id = $("input#reminder_id").val();


	$.get("/update-reminder.xml", reminder, function(xml)
	{
		loadReminders();

		alert("Reminder details updated.");	
	});
}
