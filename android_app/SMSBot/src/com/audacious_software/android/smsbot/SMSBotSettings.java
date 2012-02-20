package com.audacious_software.android.smsbot;


import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnKeyListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class SMSBotSettings extends Activity
{
	public void onCreate(Bundle savedInstanceState) 
    {
    	super.onCreate(savedInstanceState);
        setContentView(R.layout.settings);
        
        final Button saveButton = (Button) findViewById(R.id.settings_save);
        final Button resetButton = (Button) findViewById(R.id.settings_reset);
        
        saveButton.setEnabled(false);
        resetButton.setEnabled(false);

        final EditText username = (EditText) findViewById(R.id.username_field);
        final EditText password = (EditText) findViewById(R.id.password_field);
        final EditText server = (EditText) findViewById(R.id.server_field);

        final Activity me = this;

    	ServiceConnection connection = new ServiceConnection() 
    	{
			public void onServiceConnected(ComponentName name, IBinder binder) 
			{
				XMPPService xmpp = ((XMPPService.LocalBinder) binder).getService();

				username.setText(xmpp.username());
		        password.setText(xmpp.password());
		        server.setText(xmpp.server());
		        
		        me.unbindService(this);
			}

			public void onServiceDisconnected(ComponentName name) 
			{

			}
    	};

    	this.bindService(new Intent(this, XMPPService.class), connection, Context.BIND_AUTO_CREATE);

        saveButton.setOnClickListener(new View.OnClickListener() 
        {
            public void onClick(View v) 
            {
            	ServiceConnection connection = new ServiceConnection() 
            	{
        			public void onServiceConnected(ComponentName name, IBinder binder) 
        			{
        				XMPPService xmpp = ((XMPPService.LocalBinder) binder).getService();

                    	xmpp.setUsername(username.getText().toString());
                    	xmpp.setPassword(password.getText().toString());
                    	xmpp.setServer(server.getText().toString());
        		        
        		        me.unbindService(this);
        			}

        			public void onServiceDisconnected(ComponentName name) 
        			{

        			}
            	};

            	me.bindService(new Intent(me, XMPPService.class), connection, Context.BIND_AUTO_CREATE);

		        saveButton.setEnabled(false);
		        resetButton.setEnabled(false);

		        Toast toast = Toast.makeText(getApplicationContext(), R.string.settings_saved_label, Toast.LENGTH_SHORT);
		        toast.show();
		        
		        me.finish();
            }
        });

        resetButton.setOnClickListener(new View.OnClickListener() 
        {
            public void onClick(View v) 
            {
            	ServiceConnection connection = new ServiceConnection() 
            	{
        			public void onServiceConnected(ComponentName name, IBinder binder) 
        			{
        				XMPPService xmpp = ((XMPPService.LocalBinder) binder).getService();

                        username.setText(xmpp.username());
                        password.setText(xmpp.password());
                        server.setText(xmpp.server());
        		        
        		        me.unbindService(this);
        			}

        			public void onServiceDisconnected(ComponentName name) 
        			{

        			}
            	};

            	me.bindService(new Intent(me, XMPPService.class), connection, Context.BIND_AUTO_CREATE);

		        saveButton.setEnabled(false);
		        resetButton.setEnabled(false);

		        Toast toast = Toast.makeText(getApplicationContext(), R.string.settings_reset_label, Toast.LENGTH_SHORT);
		        toast.show();
            }
        });

        OnKeyListener listener = new OnKeyListener() 
        {
			public boolean onKey(View v, int keyCode, KeyEvent event) 
			{
				saveButton.setEnabled(true);
				resetButton.setEnabled(true);
				
				return false;
			}
        };

        username.setOnKeyListener(listener);        
        password.setOnKeyListener(listener);        
        server.setOnKeyListener(listener);
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
    		case R.id.about:
    			Intent aboutIntent = new Intent(this, SMSBotAbout.class);
    			this.startActivity(aboutIntent);
    			this.finish();
    			return true;
    		case R.id.home:
    			Intent homeIntent = new Intent(this, SMSBot.class);
    			this.startActivity(homeIntent);
    			this.finish();
    			return true;
    		default:
    			return super.onOptionsItemSelected(item);
    	}
    }

}
