function resizeEvents()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);
}

function loadEvents()
{
	$("div#console").load("xml/events.xml", function() 
	{
		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("input#event-start").datetimepicker();
		$("input#event-end").datetimepicker();

		$("input#case-number").autocomplete(
		{
			source: "case-number-search.json",
			focus: function (event, ui) 
			{
				$(event.target).val(ui.item.label);

				return false;
			},
			select: function (event, ui) 
			{
				$(event.target).val(ui.item.label);
				$("input#case-number").val(ui.item.value);

				return false;
			}
		});

		$("a#search-events").click(function()
		{
			var values = {};
			
			values["case-number"] = $("input#case-number").val();
			values["start"] = $("input#event-start").val();
			values["end"] = $("input#event-end").val();
		
			$("input[type='checkbox']").each(function()
			{
				if ($(this).attr("checked"))
					values[$(this).attr("name")] = "true";
			});
			
			$("div#event-results").html("Search in progress...");
		
			$("div#event-results").load("event-search.xml", values, function()
			{
				$("div#event-results").css("overflow", "auto");

				resizeEvents();
			});
		});

		$("a#search-events").corner("5px");
		
		resizeEvents();
	});
}
