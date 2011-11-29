var selected_followup = "";

function updateFollowupQuestion()
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

	l = 160 - $("textarea#question_spanish").val().length;

	$("span#question_count_spanish").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#question_count_spanish").removeClass("okay");
		$("span#question_count_spanish").addClass("warning");
	}
	else
	{
		$("span#question_count_spanish").removeClass("warning");
		$("span#question_count_spanish").addClass("okay");
	}
}

function updatePositive()
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

	l = 160 - $("textarea#positive_spanish").val().length;

	$("span#positive_count_spanish").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#positive_count_spanish").removeClass("okay");
		$("span#positive_count_spanish").addClass("warning");
	}
	else
	{
		$("span#positive_count_spanish").removeClass("warning");
		$("span#positive_count_spanish").addClass("okay");
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

	l = 160 - $("textarea#negative_spanish").val().length;

	$("span#negative_count_spanish").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#negative_count_spanish").removeClass("okay");
		$("span#negative_count_spanish").addClass("warning");
	}
	else
	{
		$("span#negative_count_spanish").removeClass("warning");
		$("span#negative_count_spanish").addClass("okay");
	}
}

function resizeFollowups()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);

	$("select#all-followups").height($("div#console-sidebar").height());
	$("select#all-followups").width(150);
	
	$("div.select-item").width($("div#function-body").width() - 150);
	$("div.edit-item").width($("div#function-body").width() - 160);
}

function showFollowup(id)
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
		$.get("/fetch-followup.xml", { "id": id }, function(xml)
		{
			$(xml).find("followup").each(function()
			{
				$("button.save").attr("disabled", false);
				$("button.remove-selected").attr("disabled", false);

				$("div.select-item").hide();
				$("div.edit-item").show();

				$("input#name").val($(this).attr("name"));
				$("textarea#question").val($(this).attr("question"));
				$("textarea#positive").val($(this).attr("positive"));
				$("textarea#negative").val($(this).attr("negative"));

				$("textarea#question_spanish").val($(this).attr("question_spanish"));
				$("textarea#positive_spanish").val($(this).attr("positive_spanish"));
				$("textarea#negative_spanish").val($(this).attr("negative_spanish"));

				$("input#followup_id").val($(this).attr("id"));

				updateFollowupQuestion();
				updatePositive();
				updateNegative();
    		});
		});
	}

	$("select#all-followups").val(id);
	selected_followup = id;
}

function loadFollowups()
{
	$("div#console").load("xml/followups.xml", function() 
	{
		$("button.save").attr("disabled", true);
		$("button.remove-selected").attr("disabled", true);
		$("button.add-new").attr("disabled", false);

		$("textarea").live("keyup", dirty);
		$("input").live("keyup", dirty);

		$("textarea#question").live("keyup", updateFollowupQuestion);
		$("textarea#positive").live("keyup", updatePositive);
		$("textarea#negative").live("keyup", updateNegative);

		$("textarea#question_spanish").live("keyup", updateFollowupQuestion);
		$("textarea#positive_spanish").live("keyup", updatePositive);
		$("textarea#negative_spanish").live("keyup", updateNegative);

		$("div.edit-item").hide();
		$("div.select-item").show();

		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("div#followup-list").load("all-followups.xml", function()
		{
			$("select#all-followups").change(function()
			{
				if ($("select#all-followups").val() != null)
					showFollowup("" + $("select#all-followups").val());
				else
					showFollowup("");
			});

			setTimeout(function()
			{
				showFollowup(selected_followup);
			}, 250);

			resizeFollowups();
		});
		
		$("button.add-new").click(function()
		{
			addFollowup();
		});

		$("button.remove-selected").click(function()
		{
			removeFollowups();
		});

		$("button.save").click(function()
		{
			saveFollowup();
		});

		resizeFollowups();
	});
}

function addFollowup()
{
	$.post("/add-followup.xml", { "name": "New Followup" }, function(xml)
	{
		loadFollowups();
		
		$(xml).find("ok").each(function()
		{
			showFollowup($(this).attr("id"));
    	});
	});
}

function removeFollowups()
{
	if (confirm("Remove selected followup?"))
	{
		var removed = false;
	
		$('select#all-followups :selected').each(function(i, selected)
		{ 
			removed = true;
		
			$.post("/remove-followup.xml", { "id": $(selected).val() });
		
			selected_followup = "";
		});
	
		if (removed)
			loadFollowups();
	}
}

function saveFollowup()
{
	var followup = {};
	
	followup.name = $("input#name").val();
	followup.question = $("textarea#question").val();
	followup.positive = $("textarea#positive").val();
	followup.negative = $("textarea#negative").val();

	followup.question_spanish = $("textarea#question_spanish").val();
	followup.positive_spanish = $("textarea#positive_spanish").val();
	followup.negative_spanish = $("textarea#negative_spanish").val();

	followup.id = $("input#followup_id").val();

	$.get("/update-followup.xml", followup, function(xml)
	{
		loadFollowups();

		alert("Followup details updated.");	
		
		is_dirty = false;
	});
}
