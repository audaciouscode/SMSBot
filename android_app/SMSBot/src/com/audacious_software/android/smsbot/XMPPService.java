package com.audacious_software.android.smsbot;

import java.io.IOException;

import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.filter.IQTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.provider.ProviderManager;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Binder;
import android.os.Handler;
import android.os.IBinder;
import android.widget.Toast;

public class XMPPService extends Service implements ConnectionListener, PacketListener, IQProvider
{
	private boolean connected = false;
	private boolean connecting = false;
	private XMPPConnection connection = null;
	
	private Handler handler = new Handler();
	
	private Runnable presencePing = new Runnable()
	{
		public void run() 
		{
			Presence presence = new Presence(Presence.Type.available);

			presence.setStatus("Awaiting messages...");
			
			if (connection != null && connection.isConnected())
				connection.sendPacket(presence);
			else
				XMPPService.this.go();
			
	        handler.postDelayed(this, 30000);
		}
	};
	
	private final IBinder binder = new LocalBinder();
	
    public IBinder onBind(Intent intent) 
    {
    	return binder;
    }

    public class LocalBinder extends Binder 
    {
        public XMPPService getService() 
        {
            return XMPPService.this;
        }
    }
	
	public void onStart (Intent intent, int startId)
	{
        if (!this.connected && !this.connecting)
			this.go();
        
        if (intent.hasExtra("sms_message") && intent.hasExtra("sms_source"))
        	this.handleMessage(intent.getStringExtra("sms_source"), intent.getStringExtra("sms_message"), intent.getStringExtra("sms_date"));
	}
	
    public void onCreate() 
    {
        super.onCreate();

        handler.postDelayed(presencePing, 30000);
        
        if (!this.connected && !this.connecting)
			this.go();
    }

    public boolean isConnected()
    {
    	return this.connected;
    }
    
    public void disconnect()
    {
    	connection.disconnect();
    }

    public void connect()
    {
        if (!this.connected && !this.connecting)
			this.go();
    }

    public void onDestroy() 
    {
		super.onDestroy();

		if (connection != null)
			connection.disconnect();

		NotificationManager noteManager = (NotificationManager) this.getSystemService(Context.NOTIFICATION_SERVICE);

		noteManager.cancelAll();
    }

	private boolean hasValidConfig()
	{
		if (this.username().equals("") || this.password().equals("") || this.server().equals("xmpp.server.net"))
			return false;
		
		return true;
	}

	private void setStatus(String status)
	{
		NotificationManager noteManager = (NotificationManager) this.getSystemService(Context.NOTIFICATION_SERVICE);

		Notification notification = new Notification(R.drawable.notification, status, System.currentTimeMillis());

		Context context = getApplicationContext();
		CharSequence contentTitle = "SMSBot";
		CharSequence contentText = status;
		Intent notificationIntent = new Intent(this, SMSBot.class);
		PendingIntent contentIntent = PendingIntent.getActivity(this, 0, notificationIntent, 0);

		notification.setLatestEventInfo(context, contentTitle, contentText, contentIntent);
		
		noteManager.notify(R.string.service_started, notification);
	}

	private void go()
	{
		if (!this.hasValidConfig())
			return;
		
		if (connection == null)
		{
			connection = new XMPPConnection(this.server());
			XMPPConnection.DEBUG_ENABLED = true;
		}
		
		connection.disconnect();

		this.setStatus("Connecting...");

		try
		{
			this.connecting = true;
			this.connected = false;

			ProviderManager providerManager = ProviderManager.getInstance();
			providerManager.addIQProvider("query", "urn:smsbot:message", this);

			connection.connect();

			connection.login(this.username(), this.password(), "bot");

			this.setStatus("Authenticated...");

			this.connecting = false;
			this.connected = true;

			connection.addConnectionListener(this);
			connection.addPacketListener(this, new IQTypeFilter(IQ.Type.SET));

			this.setStatus("Connected.");
		}
		catch (Exception e)
		{
			this.setStatus("Error!");

			Toast toast = Toast.makeText(this, e.getLocalizedMessage(), Toast.LENGTH_LONG);
			toast.show();
			
			this.connecting = false;
			this.connected = false;
		}
	}

	public String username() 
	{
		return this.getPreference("username", "");
	}

	public String password() 
	{
		return this.getPreference("password", "");
	}

	public String server() 
	{
		return this.getPreference("server", "xmpp.server.net");
	}

	private String getPreference(String name, String defaultValue)
	{
		SharedPreferences preferences = this.getSharedPreferences("SMSBot", Context.MODE_PRIVATE);

		return preferences.getString(name, defaultValue);
	}

	public void setUsername(String text) 
	{
		this.setPreference("username", text);
	}

	public void setPassword(String text) 
	{
		this.setPreference("password", text);
	}

	public void setServer(String text) 
	{
		this.setPreference("server", text);
	}

	private void setPreference(String name, String value)
	{
		SharedPreferences preferences = this.getSharedPreferences("SMSBot", Context.MODE_PRIVATE);
		Editor editor = preferences.edit();

		editor.putString(name, value);
		editor.commit();

		if (!this.connected && !this.connecting)
			this.go();
	}

	public void connectionClosed() 
	{
		this.setStatus("Disconnected.");

		this.connected = false;
	}

	public void connectionClosedOnError(Exception e) 
	{
		this.setStatus("Connection Closed: " + e.getMessage());

		this.connected = false;
	}

	public void reconnectingIn(int seconds)
	{
		this.setStatus("Reconnecting in " + seconds + " seconds...");
	}

	public void reconnectionFailed(Exception e) 
	{
		this.setStatus("Reconnection failed: " + e.getMessage());

		this.connected = false;
	}

	public void reconnectionSuccessful() 
	{
		this.setStatus("Reconnection successful.");

		this.connected = true;
	}

	public void processPacket(Packet packet) 
	{
		IQ iq = (IQ) packet;
		
		String to = iq.getTo();
		
		iq.setTo(iq.getFrom());
		iq.setFrom(to);
		
		iq.setType(IQ.Type.RESULT);

		connection.sendPacket(iq);
	}

	public void handleMessage(String source, String message, String date) 
	{
		RecvSmsMessage msg = new RecvSmsMessage();
		msg.source = source;
		msg.message = message;
		msg.date = date;

		msg.setFrom("smsbot@boston.audacious-software.com/bot");
		msg.setTo("smsbackend@boston.audacious-software.com/backend");
		msg.setType(IQ.Type.SET);
		
		connection.sendPacket(msg);
	}

	public IQ parseIQ(XmlPullParser xpp) throws Exception 
	{
		IQ response = new ErrorMessage();
		
		int level = 0;
		
        int eventType = xpp.next();

        do 
        {
            if (eventType == XmlPullParser.START_TAG) 
            {
                level += 1;
                return processElement(xpp);
            }
            else if (eventType == XmlPullParser.END_TAG) 
            	level -= 1;
            
            eventType = xpp.next();
        } 
        while (level > 0);

		return response;
	}

    public IQ processElement (XmlPullParser xpp) throws XmlPullParserException, IOException
    {
        String uri = xpp.getNamespace();

        if (uri.equals("urn:smsbot:message"))
        {
            String name = xpp.getName();

            if (name.equals("send"))
            {
            	SendSmsMessage send = new SendSmsMessage(xpp);

        		SMSReceiver.getInstance().sendMessage(send.phone, send.message, this);
            	
            	return send;
            }
        }
        
        return new ErrorMessage();
    }
}
