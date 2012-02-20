package com.audacious_software.android.smsbot;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

public class SMSBotAbout extends Activity
{
    public void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.about);
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
    		case R.id.home:
    			Intent homeIntent = new Intent(this, SMSBot.class);
    			this.startActivity(homeIntent);
    			this.finish();
    			return true;
    		case R.id.settings:
    			Intent settingsIntent = new Intent(this, SMSBotSettings.class);
    			this.startActivity(settingsIntent);
    			this.finish();
    			return true;
    		default:
    			return super.onOptionsItemSelected(item);
    	}
    }

}
