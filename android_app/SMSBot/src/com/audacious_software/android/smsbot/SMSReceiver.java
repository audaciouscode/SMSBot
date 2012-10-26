package com.audacious_software.android.smsbot;

import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.telephony.SmsManager;
import android.telephony.SmsMessage;
import android.util.Log;
import android.widget.Toast;

public class SMSReceiver extends BroadcastReceiver
{
	private static SMSReceiver instance = new SMSReceiver();

	static class MessageHandler extends Handler
	{
	    private final WeakReference<Context> mContext;

	    MessageHandler(Context context)
	    {
	    	this.mContext = new WeakReference<Context>(context.getApplicationContext());
	    }

	    public void handleMessage(Message message)
	    {
	    	Context context = mContext.get();

        	SmsMessage msg = (SmsMessage) message.obj;

    		Uri deleteUri = Uri.parse("content://sms");

    		context.getContentResolver().delete(deleteUri, "address=? and date=?", new String[] {msg.getOriginatingAddress(), String.valueOf(msg.getTimestampMillis())});
	    }
	}

    private static Handler mHandler = null;

	public static SMSReceiver getInstance()
	{
		return instance;
	}

	public void sendMessage(String dest, String message, Context sender)
	{
    	if (dest.length() > 0 && message.length() > 0)
    	{
    		if (sender instanceof Activity)
    			Toast.makeText(sender, "Sent '" + message + "' to '" + dest + "'.", Toast.LENGTH_SHORT).show();
    		else
    			Log.w("SMSBot", "Sent '" + message + "' to '" + dest + "'.");

			SmsManager sms = SmsManager.getDefault();

//			byte[] byteString = SmsPduUtil.toGsmCharset(message);
//			byte[] byteString = SmsPduUtil.getSeptets(message);

//	    		SmsManager.getDefault().sendTextMessage(dest, null, message, null, null);
//				sms.sendDataMessage(dest, null, (short) 0, byteString, null, null);

			ArrayList<String> msgs = sms.divideMessage(message);

			sms.sendMultipartTextMessage(dest, null, msgs, null, null);

			// SmsManager.getDefault().sendTextMessage(dest, null, message, null, null);
    	}
	}

	public void onReceive(final Context context, Intent intent)
	{
        Bundle bundle = intent.getExtras();
        SmsMessage[] msgs = null;

        if (SMSReceiver.mHandler == null)
        	SMSReceiver.mHandler = new MessageHandler(context);

        if (bundle != null)
        {
        	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");

        	Object[] pdus = (Object[]) bundle.get("pdus");

            msgs = new SmsMessage[pdus.length];

            for (int i = 0; i < msgs.length; i++)
            {
                msgs[i] = SmsMessage.createFromPdu((byte[])pdus[i]);

                final String message = msgs[i].getMessageBody().toString();
                final String source = msgs[i].getOriginatingAddress();

                final Date date = new Date(msgs[i].getTimestampMillis());

                Intent xmppIntent = new Intent(context, XMPPService.class);

                xmppIntent.putExtra("sms_source", source);
                xmppIntent.putExtra("sms_message", message);
                xmppIntent.putExtra("sms_date", format.format(date));
                context.startService(xmppIntent);
            }

            // http://stackoverflow.com/questions/419184/how-to-delete-sms-from-inbox-in-android-programmatically

            for (int i = 0; i < msgs.length; i++)
            {
            	mHandler.sendMessageDelayed(mHandler.obtainMessage(9999, msgs[i]), 2500);
            }
        }
	}
}
