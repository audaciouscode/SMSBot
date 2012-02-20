package com.audacious_software.android.smsbot;

import org.jivesoftware.smack.packet.IQ;

public class RecvSmsMessage extends IQ
{
	public String source = "Unknown";
	public String message = "Null message";
	public String date = "";
	
	public String getChildElementXML() 
	{
		String xml = "<received from=\"" + source + "\" date=\"" + date + "\"><![CDATA[ "+ message + " ]]></received>";
		
		return xml;
	}
}
