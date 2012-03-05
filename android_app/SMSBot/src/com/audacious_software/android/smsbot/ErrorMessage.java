package com.audacious_software.android.smsbot;

import org.jivesoftware.smack.packet.IQ;

public class ErrorMessage extends IQ 
{
	public String getChildElementXML() 
	{
		return "<query xmlns=\"urn:smsbot:message\"><error /></query>";
	}
}
