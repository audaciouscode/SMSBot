function loadOverview()
{
	$("div#console").load("xml/overview.xml", function() 
	{
		var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
		$("div#function-name").width(width);
		$("div#function-body").width(width + 10);
		
		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");
		
		$("tr#msgs-sent").load("stats.xml?row=msgs-sent");
		$("tr#msgs-recvd").load("stats.xml?row=msgs-recvd");
		$("tr#sessions-started").load("stats.xml?row=sessions-started");
		$("tr#sessions-ended").load("stats.xml?row=sessions-ended");
	});
}