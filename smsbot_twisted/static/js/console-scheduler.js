function resizeScheduler()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);

	$("select#all-messages").height($("div#console-sidebar").height());
	$("select#all-messages").width(150);
	
	$("div.select-item").width($("div#function-body").width() - 150);
	$("div.edit-item").width($("div#function-body").width() - 160);
}

function showMessage(id)
{
	$.get("/fetch-message.xml", { "id": id }, function(xml)
	{
		$(xml).find("message").each(function()
		{
/*			$("input#name").val($(this).attr("name"));
			$("textarea#first_message").val($(this).attr("first"));
			$("textarea#second_message").val($(this).attr("second"));
			$("textarea#third_message").val($(this).attr("third"));
			$("input#tip_id").val($(this).attr("id"));
 */   	});
	});
}

function scheduleMessage()
{
	var recipient = $("input#recipient-id").val();
	var date = $("input#datetime").val();
	var part_time = ($("input#part_time").attr("checked"));
	var random_time = ($("input#random_time").attr("checked"));
	
	if (recipient == "")
		alert("Please select a recepient.");
	else if (date == "" && !part_time)
		alert("Please select a date.");
	else
	{
		var details = {};
		details.recipient = recipient;

		details.date = date;
		
		if (part_time)
			details.use_part_time = "true";
		else
			details.use_part_time = "false";

		if (random_time)
			details.use_random_time = "true";
		else
			details.use_random_time = "false";

		details.script_id = $("input#message-id").val();
	
		$.get("/schedule-message.xml", details, function(xml)
		{
			$(xml).find("ok").each(function()
			{
				alert("Message scheduled.");
			});

			$(xml).find("error").each(function()
			{
				alert("Error scheduling message. Check the log for details.");
			});
			
			is_dirty = false;
		});
	}
}

function loadScheduler()
{
	$("div#console").load("xml/scheduler.xml", function() 
	{
		$("button.save").click(scheduleMessage);
		
		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("button.save").attr("disabled", true);
		$("button.remove-selected").attr("disabled", true);
		$("button.add-new").attr("disabled", false);

		$("div.edit-item").hide();
		$("div.select-item").show();

		$("input#datetime").datetimepicker();

		$("div#message-list").load("all-messages.xml", function()
		{
			$("select#all-messages").change(function()
			{
				if ($("select#all-messages").val() != null && $("select#all-messages").val() != "")
				{
					$("input#message-id").val("" + $("select#all-messages").val());
					
					$.get("message-preview.xml", { "id": ("" + $("select#all-messages").val()) }, function(data)
					{
						$("div#message-preview").html(data);
					}, "text");

					$("button.save").attr("disabled", false);
					$("button.remove-selected").attr("disabled", false);

					$("div.select-item").hide();
					$("div.edit-item").show();
				}
				else
				{
					$("button.save").attr("disabled", true);
					$("button.remove-selected").attr("disabled", true);

					$("div.edit-item").hide();
					$("div.select-item").show();
				}
			});

			resizeScheduler();
		});

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
		
		resizeScheduler();
	});
}
