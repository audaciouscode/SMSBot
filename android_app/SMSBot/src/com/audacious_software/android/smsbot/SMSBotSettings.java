package com.audacious_software.android.smsbot;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.preference.PreferenceActivity;

public class SMSBotSettings extends PreferenceActivity
{
	public void onCreate(Bundle savedInstanceState) 
	{
		super.onCreate(savedInstanceState);

		this.addPreferencesFromResource(R.layout.settings);
	}
    
	protected void onResume() 
	{
		super.onResume();
	}

	protected void onPause() 
	{		
		final SMSBotSettings me = this;
		
		ServiceConnection connection = new ServiceConnection() 
    	{
			public void onServiceConnected(ComponentName name, IBinder binder) 
			{
				XMPPService xmpp = ((XMPPService.LocalBinder) binder).getService();
				
				xmpp.go();
		        
		        me.unbindService(this);
			}

			public void onServiceDisconnected(ComponentName name) 
			{

			}
    	};
    	
    	this.bindService(new Intent(this, XMPPService.class), connection, Context.BIND_AUTO_CREATE);
    	
		super.onPause();
	}
}
