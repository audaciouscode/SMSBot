package com.audacious_software.android.smsbot;

import java.io.IOException;

import org.jivesoftware.smack.packet.IQ;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class SendSmsMessage extends IQ 
{
	public String phone;
	public String message;
	
	public String getChildElementXML() 
	{
		return "<sent />";
	}

	public SendSmsMessage(XmlPullParser xpp) throws XmlPullParserException, IOException
	{
		phone = xpp.getAttributeValue("", "to");
		message = xpp.getAttributeValue("", "message");
	}
}
