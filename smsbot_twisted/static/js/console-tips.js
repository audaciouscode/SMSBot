var selected_tip = "";

function updateFirst()
{
	var l = 160 - $("textarea#first_message").val().length;

	$("span#first_count").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#first_count").removeClass("okay");
		$("span#first_count").addClass("warning");
	}
	else
	{
		$("span#first_count").removeClass("warning");
		$("span#first_count").addClass("okay");
	}

	l = 160 - $("textarea#first_message_spanish").val().length;

	$("span#first_count_spanish").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#first_count_spanish").removeClass("okay");
		$("span#first_count_spanish").addClass("warning");
	}
	else
	{
		$("span#first_count_spanish").removeClass("warning");
		$("span#first_count_spanish").addClass("okay");
	}

}

function updateSecond()
{
	var l = 160 - $("textarea#second_message").val().length;

	$("span#second_count").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#second_count").removeClass("okay");
		$("span#second_count").addClass("warning");
	}
	else
	{
		$("span#second_count").removeClass("warning");
		$("span#second_count").addClass("okay");
	}

	l = 160 - $("textarea#second_message_spanish").val().length;

	$("span#second_count_spanish").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#second_count_spanish").removeClass("okay");
		$("span#second_count_spanish").addClass("warning");
	}
	else
	{
		$("span#second_count_spanish").removeClass("warning");
		$("span#second_count_spanish").addClass("okay");
	}
}

function updateThird()
{
	var l = 160 - $("textarea#third_message").val().length;

	$("span#third_count").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#third_count").removeClass("okay");
		$("span#third_count").addClass("warning");
	}
	else
	{
		$("span#third_count").removeClass("warning");
		$("span#third_count").addClass("okay");
	}

	l = 160 - $("textarea#third_message_spanish").val().length;

	$("span#third_count_spanish").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#third_count_spanish").removeClass("okay");
		$("span#third_count_spanish").addClass("warning");
	}
	else
	{
		$("span#third_count_spanish").removeClass("warning");
		$("span#third_count_spanish").addClass("okay");
	}
}

function resizeTips()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);

	$("select#all-tips").width(150);
	
	$("div.select-item").width($("div#function-body").width() - 150);
	$("div.edit-item").width($("div#function-body").width() - 160);

	var bottom = $("textarea#third_message_spanish");
	
	$("select#all-tips").height($("div#console-sidebar").height() - 20);
}

function showTip(id)
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
		$.get("/fetch-tip.xml", { "id": id }, function(xml)
		{
			$(xml).find("tip").each(function()
			{
				$("button.save").attr("disabled", false);
				$("button.remove-selected").attr("disabled", false);

				$("div.select-item").hide();
				$("div.edit-item").show();

				$("input#name").val($(this).attr("name"));
				$("textarea#first_message").val($(this).attr("first"));
				$("textarea#second_message").val($(this).attr("second"));
				$("textarea#third_message").val($(this).attr("third"));

				$("textarea#first_message_spanish").val($(this).attr("first_spanish"));
				$("textarea#second_message_spanish").val($(this).attr("second_spanish"));
				$("textarea#third_message_spanish").val($(this).attr("third_spanish"));

				$("input#tip_id").val($(this).attr("id"));

				updateFirst();
				updateSecond();
				updateThird();

				resizeTips();
    		});
		});
	}
	
	$("select#all-tips").val(id);
	selected_tip = id;
}

function loadTips()
{
	$("div#console").load("xml/tips.xml", function() 
	{
		$("div.edit-item").hide();
		$("div.select-item").show();

		$("button.save").attr("disabled", true);
		$("button.remove-selected").attr("disabled", true);
		$("button.add-new").attr("disabled", false);

		$("textarea").live("keyup", dirty);
		$("input").live("keyup", dirty);

		$("textarea#first_message").live("keyup", updateFirst);
		$("textarea#second_message").live("keyup", updateSecond);
		$("textarea#third_message").live("keyup", updateThird);

		$("textarea#first_message_spanish").live("keyup", updateFirst);
		$("textarea#second_message_spanish").live("keyup", updateSecond);
		$("textarea#third_message_spanish").live("keyup", updateThird);

		$("div.edit-item").hide();
		$("div.select-item").show();

		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("div#tip-list").load("all-tips.xml", function()
		{
			$("select#all-tips").change(function()
			{
				if ($("select#all-tips").val() != null)
					showTip("" + $("select#all-tips").val());
				else
					showTip("");
			});

//			setTimeout(function()
//			{
//				showTip(selected_tip);
//				resizeTips();
//			}, 250);

			resizeTips();
		});
		
		$("button.add-new").click(function()
		{
			addTip();
		});

		$("button.remove-selected").click(function()
		{
			removeTips();
		});

		$("button.save").click(function()
		{
			saveTip();
		});

		resizeTips();
	});
}

function addTip()
{
	$.post("/add-tip.xml", { "name": "New Tip" }, function(xml)
	{
		loadTips();
		
		$(xml).find("ok").each(function()
		{
			showTip($(this).attr("id"));
    	});
	});
}

function removeTips()
{
	if (confirm("Remove selected tip?"))
	{
		var removed = false;
	
		$('select#all-tips :selected').each(function(i, selected)
		{ 
			removed = true;
		
			$.post("/remove-tip.xml", { "id": $(selected).val() });
			
			selected_tip = "";
		});
	
		if (removed)
			loadTips();
	}
}

function saveTip()
{
	var tip = {};

	tip.id = $("input#tip_id").val();
	
	tip.name = $("input#name").val();
	tip.first = $("textarea#first_message").val();
	tip.second = $("textarea#second_message").val();
	tip.third = $("textarea#third_message").val();

	tip.first_spanish = $("textarea#first_message_spanish").val();
	tip.second_spanish = $("textarea#second_message_spanish").val();
	tip.third_spanish = $("textarea#third_message_spanish").val();

	$.get("/update-tip.xml", tip, function(xml)
	{
		selected_tip = tip.id;

		loadTips();

		alert("Tip details updated.");	
		
		is_dirty = false;
	});
}
