package com.audacious_software.android.smsbot;

import android.app.Application;

import org.acra.ACRA;
import org.acra.ReportingInteractionMode;
import org.acra.annotation.ReportsCrashes;

@ReportsCrashes(formKey="",
	mode=ReportingInteractionMode.TOAST,
	mailTo="cjkarr@me.com",
	forceCloseDialogAfterToast=false,
	resToastText=R.string.crash_toast_text)
public class SMSBotApplication extends Application
{
    public void onCreate()
    {
        ACRA.init(this);

        super.onCreate();
    }
}
