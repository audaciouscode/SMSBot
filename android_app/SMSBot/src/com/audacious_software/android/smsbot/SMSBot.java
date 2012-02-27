package com.audacious_software.android.smsbot;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.DialogInterface.OnClickListener;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.os.IBinder;
import android.telephony.TelephonyManager;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class SMSBot extends Activity
{
	private XMPPServiceConnection xmppConnection = null;
    
	protected void onPause()
	{
        super.onPause();
        
        if (xmppConnection != null)
        	xmppConnection.disconnect();
	}
	
	protected void onResume()
	{
		final Activity me = this;
		super.onResume();

        ActivityManager am = (ActivityManager) this.getSystemService(ACTIVITY_SERVICE);
        
        boolean start = true;
        
        for (ActivityManager.RunningServiceInfo rsi : am.getRunningServices(Integer.MAX_VALUE))
        {
        	if (rsi.service.getClassName().equals(XMPPService.class.getName()))
        		start = false;
        }

        if (start)
        	this.startService(new Intent(this, XMPPService.class));

        final Button toggleButton = (Button) findViewById(R.id.toggle_connection);

    	ServiceConnection toggleConnection = new ServiceConnection() 
    	{
			public void onServiceConnected(ComponentName name, IBinder binder) 
			{
				XMPPService xmpp = ((XMPPService.LocalBinder) binder).getService();

				if (xmpp.isConnected())
					toggleButton.setText(R.string.xmpp_disconnect);
				else
					toggleButton.setText(R.string.xmpp_connect);
					
		        me.unbindService(this);
			}

			public void onServiceDisconnected(ComponentName name) 
			{

			}
    	};

    	me.bindService(new Intent(me, XMPPService.class), toggleConnection, Context.BIND_AUTO_CREATE);

    	toggleButton.setOnClickListener(new View.OnClickListener() 
        {
            public void onClick(View v) 
            {
            	ServiceConnection connection = new ServiceConnection() 
            	{
        			public void onServiceConnected(ComponentName name, IBinder binder) 
        			{
        				XMPPService xmpp = ((XMPPService.LocalBinder) binder).getService();

        				if (xmpp.isConnected())
        				{
        					xmpp.disconnect();
        					toggleButton.setText(R.string.xmpp_connect);
        				}
        				else
        				{
        					xmpp.connect();
        					toggleButton.setText(R.string.xmpp_disconnect);
        				}
        				
        		        me.unbindService(this);
        			}

        			public void onServiceDisconnected(ComponentName name) 
        			{

        			}
            	};

            	me.bindService(new Intent(me, XMPPService.class), connection, Context.BIND_AUTO_CREATE);
            }
        });

    	xmppConnection = new XMPPServiceConnection(this);

    	me.bindService(new Intent(me, XMPPService.class), xmppConnection, Context.BIND_AUTO_CREATE);
	}

	protected void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.main);

        final Button sendButton = (Button) findViewById(R.id.send_message);

        final EditText phoneNumber = (EditText) findViewById(R.id.phone_field);
        final EditText message = (EditText) findViewById(R.id.message_field);

        final Activity me = this;
        
        sendButton.setOnClickListener(new View.OnClickListener() 
        {
            public void onClick(View v) 
            {
            	String phone = phoneNumber.getText().toString();
            	String note = message.getText().toString();
            	
            	SMSReceiver.getInstance().sendMessage(phone, note, me);
            	
            	message.setText("");
            }
        });
        
        TelephonyManager tm = (TelephonyManager) this.getSystemService(TELEPHONY_SERVICE);
        
		ConnectivityManager cm = (ConnectivityManager) this.getSystemService(CONNECTIVITY_SERVICE);
		
		boolean smsAvailable = false;
		boolean wifiAvailable = false;

		if (!tm.getNetworkOperatorName().equals(""))
			smsAvailable = true;
		
		NetworkInfo[] nis = cm.getAllNetworkInfo();
		
		for (int i = 0; i < nis.length; i++)
		{
			NetworkInfo ni = nis[i];
			
			if (ni.getType() == ConnectivityManager.TYPE_WIFI &&  ni.getState() == NetworkInfo.State.CONNECTED)
				wifiAvailable = true;
		}

		if (savedInstanceState != null && savedInstanceState.getBoolean("warned", false))
		{
			
		}
		else if (!smsAvailable)
		{
			new AlertDialog.Builder(this)
				.setMessage("This application requires a cellular data connection. Please connect to a cellular network.")
				.setTitle("Celluar Connection")
				.setNeutralButton("Quit", new OnClickListener()
				{
					public void onClick(DialogInterface arg0, int arg1) 
					{
		//				me.finish();
					}
				})
				.show();
		}
		else if (!wifiAvailable)
		{
			new AlertDialog.Builder(this)
			.setMessage("This application works best with a WiFi connection. Please connect to a WiFi network.")
			.setTitle("Wireless Connection")
			.setNeutralButton("OK", new OnClickListener()
			{
				public void onClick(DialogInterface dialog, int which) 
				{

				}
			})
			.show();
		}
    }
	
	protected void onSaveInstanceState(Bundle outState)
	{
		super.onSaveInstanceState(outState);
		
		outState.putBoolean("warned", true);
	}

    public boolean onCreateOptionsMenu(Menu menu) 
    {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item) 
    {
    	switch (item.getItemId())
    	{
    		case R.id.settings:
    			Intent settingsIntent = new Intent(this, SMSBotSettings.class);
    			this.startActivity(settingsIntent);
    			return true;
    		default:
    			return super.onOptionsItemSelected(item);
    	}
    }

}