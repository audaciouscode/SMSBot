package com.audacious_software.android.smsbot;

import android.app.Activity;
import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;

public class XMPPServiceConnection implements ServiceConnection 
{
	private XMPPService xmpp;
	private Activity activity;

	public XMPPServiceConnection(Activity activity)
	{
		this.activity = activity;
	}
	
	public void onServiceConnected(ComponentName name, IBinder binder) 
	{
		xmpp = ((XMPPService.LocalBinder) binder).getService();
	}
	
	public void disconnect()
	{
        if (!xmpp.isConnected())
			xmpp.stopSelf();

        activity.unbindService(this);
	}

	public void onServiceDisconnected(ComponentName name) 
	{

	}
}
