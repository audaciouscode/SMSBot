var selected_prompt = ""

function updateFirstPrompt()
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

function updateSecondPrompt()
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

function resizePrompts()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);

	$("select#all-prompts").height($("div#console-sidebar").height());
	$("select#all-prompts").width(150);
	
	$("div.select-item").width($("div#function-body").width() - 150);
	$("div.edit-item").width($("div#function-body").width() - 160);
}

function showPrompt(id)
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
		$.get("/fetch-prompt.xml", { "id": id }, function(xml)
		{
			$(xml).find("prompt").each(function()
			{
				$("button.save").attr("disabled", false);
				$("button.remove-selected").attr("disabled", false);

				$("div.select-item").hide();
				$("div.edit-item").show();
			
				$("input#name").val($(this).attr("name"));
				$("textarea#first_message").val($(this).attr("first"));
				$("textarea#second_message").val($(this).attr("second"));

				$("textarea#first_message_spanish").val($(this).attr("first_spanish"));
				$("textarea#second_message_spanish").val($(this).attr("second_spanish"));

				$("input#prompt_id").val($(this).attr("id"));

				updateFirstPrompt();
				updateSecondPrompt();
	    	});
		});
	}

	$("select#all-prompts").val(id);
	selected_prompt = id;
}

function loadPrompts()
{
	$("div#console").load("xml/prompts.xml", function() 
	{
		$("button.save").attr("disabled", true);
		$("button.remove-selected").attr("disabled", true);
		$("button.add-new").attr("disabled", false);

		$("textarea").live("keyup", dirty);
		$("input").live("keyup", dirty);

		$("textarea#first_message").live("keyup", updateFirstPrompt);
		$("textarea#second_message").live("keyup", updateSecondPrompt);

		$("textarea#first_message_spanish").live("keyup", updateFirstPrompt);
		$("textarea#second_message_spanish").live("keyup", updateSecondPrompt);

		$("div.edit-item").hide();
		$("div.select-item").show();

		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("div#prompt-list").load("all-prompts.xml", function()
		{
			$("select#all-prompts").change(function()
			{
				if ($("select#all-prompts").val() != null)
					showPrompt("" + $("select#all-prompts").val());
				else
					showPrompt("");
			});

			setTimeout(function()
			{
				showPrompt(selected_prompt);
			}, 250);

			resizePrompts();
		});
		
		$("button.add-new").click(function()
		{
			addPrompt();
		});

		$("button.remove-selected").click(function()
		{
			removePrompts();
		});

		$("button.save").click(function()
		{
			savePrompt();
		});

		resizePrompts();
	});
}

function addPrompt()
{
	$.post("/add-prompt.xml", { "name": "New Prompt" }, function(xml)
	{
		loadPrompts();
		
		$(xml).find("ok").each(function()
		{
			showPrompt($(this).attr("id"));
    	});
	});
}

function removePrompts()
{
	if (confirm("Remove selected prompt?"))
	{
		var removed = false;
	
		$('select#all-prompts :selected').each(function(i, selected)
		{ 
			removed = true;
		
			$.post("/remove-prompt.xml", { "id": $(selected).val() });
		
			selected_prompt = "";
		});
	
		if (removed)
			loadPrompts();
	}
}

function savePrompt()
{
	var prompt = {};

	prompt.id = $("input#prompt_id").val();
	
	prompt.name = $("input#name").val();
	prompt.first = $("textarea#first_message").val();
	prompt.second = $("textarea#second_message").val();

	prompt.first_spanish = $("textarea#first_message_spanish").val();
	prompt.second_spanish = $("textarea#second_message_spanish").val();

	$.get("/update-prompt.xml", prompt, function(xml)
	{
		selected_prompt = prompt.id;

		loadPrompts();

		alert("Prompt details updated.");	
		
		is_dirty = false;
	});
}
