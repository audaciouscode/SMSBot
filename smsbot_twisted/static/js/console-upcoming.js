function resizeUpcoming()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);
}

function removeScheduledItem(msg_id)
{
	$.post("/remove-scheduled-item.xml", { "id": msg_id }, function ()
	{
		$("a#" + msg_id).parent().parent().remove();
	});
}

function loadUpcoming()
{
	$("div#console").load("xml/upcoming.xml", function() 
	{
		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("div#function-body").load("upcoming-messages.xml", function()
		{
			$("a.remove-message").click(function()
			{
				removeScheduledItem($(this).attr("id"));
			});

			$("a.remove-message").corner("5px");
			
			$("div#function-body").css("overflow", "auto");
		});
		
		resizeUpcoming();
	});
}
