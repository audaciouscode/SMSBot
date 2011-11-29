var selected_broadcast = "";

function updateMessage()
{
	var l = 160 - $("textarea#message").val().length;

	$("span#message_count").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#message_count").removeClass("okay");
		$("span#message_count").addClass("warning");
	}
	else
	{
		$("span#message_count").removeClass("warning");
		$("span#message_count").addClass("okay");
	}

	l = 160 - $("textarea#message_spanish").val().length;

	$("span#message_count_spanish").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#message_count_spanish").removeClass("okay");
		$("span#message_count_spanish").addClass("warning");
	}
	else
	{
		$("span#message_count_spanish").removeClass("warning");
		$("span#message_count_spanish").addClass("okay");
	}
}

function resizeBroadcasts()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);

	$("select#all-broadcasts").height($("div#console-sidebar").height());
	$("select#all-broadcasts").width(150);
	
	$("div.select-item").width($("div#function-body").width() - 150);
	$("div.edit-item").width($("div#function-body").width() - 160);
}

function showBroadcast(id)
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
		$.get("/fetch-broadcast.xml", { "id": id }, function(xml)
		{
			$(xml).find("broadcast").each(function()
			{
				$("button.save").attr("disabled", false);
				$("button.remove-selected").attr("disabled", false);

				$("div.select-item").hide();
				$("div.edit-item").show();
			
				$("input#name").val($(this).attr("name"));
				$("textarea#message").val($(this).attr("message"));
				$("textarea#message_spanish").val($(this).attr("message_spanish"));
				$("input#broadcast_id").val($(this).attr("id"));
			
				updateMessage();
    		});
		});
	}

	$("select#all-broadcasts").val(id);
	selected_broadcast = id;
}

function loadBroadcasts()
{
	$("div#console").load("xml/broadcasts.xml", function() 
	{
		$("div.edit-item").hide();
		$("div.select-item").show();

		$("button.save").attr("disabled", true);
		$("button.remove-selected").attr("disabled", true);
		$("button.add-new").attr("disabled", false);

		$("textarea").live("keyup", dirty);
		$("input").live("keyup", dirty);

		$("textarea#message").live("keyup", updateMessage);
		$("textarea#message_spanish").live("keyup", updateMessage);

		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("div#broadcast-list").load("all-broadcasts.xml", function()
		{
			$("select#all-broadcasts").change(function()
			{
				if ($("select#all-broadcasts").val() != null)
					showBroadcast("" + $("select#all-broadcasts").val());
				else
					showBroadcast("");
			});

			setTimeout(function()
			{
				showBroadcast(selected_broadcast);
			}, 250);

			resizeBroadcasts();
		});
		
		$("button.add-new").click(function()
		{
			addBroadcast();
		});

		$("button.remove-selected").click(function()
		{
			removeBroadcasts();
		});

		$("button.save").click(function()
		{
			saveBroadcast();
		});

		resizeBroadcasts();
	});
}

function addBroadcast()
{
	$.post("/add-broadcast.xml", { "name": "New Broadcast" }, function(xml)
	{
		loadBroadcasts();
		
		$(xml).find("ok").each(function()
		{
			showBroadcast($(this).attr("id"));
    	});
	});
}

function removeBroadcasts()
{
	if (confirm("Remove selected broadcast?"))
	{
		var removed = false;
	
		$('select#all-broadcasts :selected').each(function(i, selected)
		{ 
			removed = true;
		
			$.post("/remove-broadcast.xml", { "id": $(selected).val() });

			selected_broadcast = "";
		});
	
		if (removed)
			loadBroadcasts();
	}
}

function saveBroadcast()
{
	var broadcast = {};

	broadcast.id = $("input#broadcast_id").val();
	
	broadcast.name = $("input#name").val();
	broadcast.message = $("textarea#message").val();
	broadcast.message_spanish = $("textarea#message_spanish").val();

	$.get("/update-broadcast.xml", broadcast, function(xml)
	{
		selected_broadcast = broadcast.id;

		loadBroadcasts();

		alert("Broadcast details updated.");	
		
		is_dirty = false;
	});
}
