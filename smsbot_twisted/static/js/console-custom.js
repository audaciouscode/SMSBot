var selected_custom = ""

function resizeCustom()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);

	$("select#all-scripts").height($("div#console-sidebar").height());
	$("select#all-scripts").width(150);
	
	$("div.select-item").width($("div#function-body").width() - 150);
	$("div.edit-item").width($("div#function-body").width() - 160);
}

function showCustom(id)
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
		$.get("/fetch-script.xml", { "id": id }, function(xml)
		{
			$(xml).find("scripts").each(function()
			{
				$("button.save").attr("disabled", false);
				$("button.remove-selected").attr("disabled", false);

				$("div.select-item").hide();
				$("div.edit-item").show();

				$("input#name").val($(this).attr("name"));
				$("input#script_id").val($(this).attr("id"));
	    	});

			$(xml).find("english").each(function()
			{
				$("textarea#vxml_script").val($(this).text());
			});

			$(xml).find("spanish").each(function()
			{
				$("textarea#vxml_script_spanish").val($(this).text());
			});

			$("div.select-item").hide();
			$("div.edit-item").show();
		});
	}

	$("select#all-scripts").val(id);
	selected_custom = id;
}

function loadCustom()
{
	$("div#console").load("xml/custom.xml", function() 
	{
		$("button.save").attr("disabled", true);
		$("button.remove-selected").attr("disabled", true);
		$("button.add-new").attr("disabled", false);

		$("textarea").live("keyup", dirty);
		$("input").live("keyup", dirty);

		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("div.edit-item").hide();
		$("div.select-item").show();

		$("div#script-list").load("all-scripts.xml", function()
		{
			$("select#all-scripts").change(function()
			{
				if ($("select#all-scripts").val() != null)
					showCustom("" + $("select#all-scripts").val());
				else
					showCustom("");
			});

			setTimeout(function()
			{
				showCustom(selected_custom);
			}, 250);

			resizeCustom();
		});
		
		$("button.add-new").click(function()
		{
			addCustom();
		});

		$("button.remove-selected").click(function()
		{
			removeCustoms();
		});

		$("button.save").click(function()
		{
			saveCustom();
		});

		resizeCustom();
	});
}


function addCustom()
{
	$.post("/add-script.xml", { "name": "New Custom Script" }, function(xml)
	{
		loadCustom();
		
		$(xml).find("ok").each(function()
		{
			showCustom($(this).attr("id"));
    	});
	});
}

function removeCustoms()
{
	if (confirm("Remove selected script?"))
	{
		var removed = false;
	
		$('select#all-scripts :selected').each(function(i, selected)
		{ 
			removed = true;
		
			$.post("/remove-script.xml", { "id": $(selected).val() });
		
			selected_custom = "";
		});
	
		if (removed)
			loadCustom();
	}
}

function saveCustom()
{
	var script = {};

	script.id = $("input#script_id").val();
	
	script.name = $("input#name").val();
	script.script = $("textarea#vxml_script").val();
	script.script_spanish = $("textarea#vxml_script_spanish").val();

	$.post("/update-script.xml", script, function(xml)
	{
		selected_custom = script.id;

		loadCustom();

		alert("Custom script updated.");	
		
		is_dirty = false;
	});
}
