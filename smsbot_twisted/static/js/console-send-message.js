function makePhoneNumber(str)
{
	var out = new String(str); 
    out = out.replace(/[^0-9]/g, ""); 

    return out; 
}

function updateSendMessageStatus()
{
	var l = 160 - $("textarea#send_message").val().length;

	$("span#send_message_count").text("(" + l + " char. remaining)");
					
	if (l < 0)
	{
		$("span#send_message_count").removeClass("okay");
		$("span#send_message_count").addClass("warning");
	}
	else
	{
		$("span#send_message_count").removeClass("warning");
		$("span#send_message_count").addClass("okay");
	}
}

function resizeSendMessage()
{
	var width = $("div#console-title").width() - 7 - $("div#console-sidebar").width();
		
	$("div#function-name").width(width);
	$("div#function-body").width(width + 10);

	$("select#all-participants").height($("div#console-sidebar").height());
	$("select#all-participants").width(150);
	
	$("div.select-item").width($("div#function-body").width() - 150);
}

function sendMessage()
{
	var number = makePhoneNumber($("input#send_number").val());
	var message = $("textarea#send_message").val();

	$.post("/send", { "message": message, "to": number }, function(xml)
	{
		$(xml).find("status").each(function()
		{
			if ($(this).attr("action") == "sent")
		    	alert("Message transmitted successfully.");
		    else
		    	alert("Problem transmitting message. Check the logs for details.");
    	});
	});
}

function loadSendMessage()
{
	$("div#console").load("xml/send-message.xml", function() 
	{
		$("button#send-message").click(sendMessage);
		
		$("textarea#send_message").live("keyup", updateSendMessageStatus);
		$("div#function-name").corner("tr 5px").corner("tl 5px");

		$("div#function-body").corner("br 5px").corner("bl 5px");

		$("div#participant-list").load("all-participants.xml", function()
		{
 			$("select#all-participants").change(function()
			{
				if ($("select#all-participants").val() != null)
				{
					$.get("/fetch-participant.xml", { "id": ("" + $("select#all-participants").val()) }, function(xml)
					{
						$(xml).find("participant").each(function()
						{
							$("input#send_number").val($(this).attr("mobile_a"));
				    	});
					});
				}
			});

			resizeSendMessage();
		});

		resizeSendMessage();
		
		updateSendMessageStatus();
	});
}
