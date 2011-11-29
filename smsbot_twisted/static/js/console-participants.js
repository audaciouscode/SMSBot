var selected_participant = "";

function resizeParticipants()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);

	$("select#all-participants").height($("div#console-sidebar").height());
	$("select#all-participants").width(150);
	
	$("div.select-item").width($("div#function-body").width() - 150);
}

function showParticipant(id)
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
		$.get("/fetch-participant.xml", { "id": id }, function(xml)
		{
			$(xml).find("participant").each(function()
			{
				$("button.save").attr("disabled", false);
				$("button.remove-selected").attr("disabled", false);

				$("div.select-item").hide();
				$("div.edit-item").show();
			
				$("input#part_case_number").val($(this).attr("case_number"));
				$("input#part_parent_name").val($(this).attr("parent_name"));
				
				if ($(this).attr("spanish") === "true" || $(this).attr("spanish") === "True")
					$("input#part_spanish").attr("checked", "true");
				else
					$("input#part_spanish").removeAttr("checked");

				$("input#part_hour").val($(this).attr("hour"));
					
				$("input#part_mobile_number_a").val($(this).attr("mobile_a"));
				$("input#part_mobile_number_b").val($(this).attr("mobile_b"));
				$("input#part_mobile_number_c").val($(this).attr("mobile_c"));
				$("input#part_mobile_number_d").val($(this).attr("mobile_d"));
				$("input#part_mobile_number_e").val($(this).attr("mobile_e"));
				$("select#age_group").val($(this).attr("group"));
				$("select#program").val($(this).attr("program"));
				$("input#part_visitor_name").val($(this).attr("visitor_name"));
				$("input#part_visitor_mobile_number").val($(this).attr("visitor_mobile"));
				$("input#part_id").val($(this).attr("id"));
	    	});
		});
	}

	$("select#all-participants").val(id);
	selected_participant = id;
}

function loadParticipants()
{
	$("div#console").load("xml/participants.xml", function() 
	{
		$("div.edit-item").hide();
		$("div.select-item").show();

		$("button.save").attr("disabled", true);
		$("button.remove-selected").attr("disabled", true);
		$("button.add-new").attr("disabled", false);
		
		$("textarea").live("keyup", dirty);
		$("input").live("keyup", dirty);
		$("select").change(dirty);
		$("input#part_spanish").change(dirty);
		
		$("div#function-name").corner("tr 5px").corner("tl 5px");
		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("div#participant-list").load("all-participants.xml", function()
		{
			
 			$("select#all-participants").change(function()
			{
				if ($("select#all-participants").val() != null)
					showParticipant("" + $("select#all-participants").val());
				else
					showParticipant("");
			});

			setTimeout(function()
			{
				showParticipant(selected_participant);
			}, 250);
			
			resizeParticipants();
		});

		$("button.add-new").click(function()
		{
			addParticipant();
		});

		$("button.remove-selected").click(function()
		{
			removeParticipants();
		});

		$("button.save").click(function()
		{
			saveParticipant();
		});
		
		resizeParticipants();
	});
}

function addParticipant()
{
	$.post("/add-participant.xml", { "name": "New Participant" }, function(xml)
	{
		loadParticipants();
		
		$(xml).find("ok").each(function()
		{
			showParticipant($(this).attr("id"));
    	});
	});
}

function removeParticipants()
{
	if (confirm("Remove selected participant?"))
	{
		var removed = false;
	
		$('select#all-participants :selected').each(function(i, selected)
		{ 
			removed = true;
		
			$.post("/remove-participant.xml", { "id": $(selected).val() });
		
			selected_participant = "";
		});
	
		if (removed)
			loadParticipants();
	}
}

function saveParticipant()
{
	var participant = {};

	participant.id = $("input#part_id").val();
	
	participant.case_number = $("input#part_case_number").val();
	participant.parent_name = $("input#part_parent_name").val();
	participant.mobile_a = $("input#part_mobile_number_a").val();
	participant.mobile_b = $("input#part_mobile_number_b").val();
	participant.mobile_c = $("input#part_mobile_number_c").val();
	participant.mobile_d = $("input#part_mobile_number_d").val();
	participant.mobile_e = $("input#part_mobile_number_e").val();
	
	if ($("input#part_spanish").attr("checked"))
		participant.spanish = "true";
	else
		participant.spanish = "false";

	participant.hour = parseInt($("input#part_hour").val());
	
	if (isNaN(participant.hour, 10) || participant.hour < 0 || participant.hour > 23)
	{
		alert("Please choose a valid hour (0-23).")
		
		return;
	}
	
 	participant.group = $("select#age_group").val();
 	participant.program = $("select#program").val();

	participant.visitor_name = $("input#part_visitor_name").val();
	participant.visitor_mobile = $("input#part_visitor_mobile_number").val();

	$.get("/update-participant.xml", participant, function(xml)
	{
		selected_participant = participant.id;

		loadParticipants();

		alert("Participant details updated.");	
		
		is_dirty = false;
	});
}
