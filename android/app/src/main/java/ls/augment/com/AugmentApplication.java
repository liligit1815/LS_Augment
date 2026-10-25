package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;

/** Clears temporary UI disclosure whenever the whole app leaves the foreground. */
public final class AugmentApplication extends Application
        implements Application.ActivityLifecycleCallbacks {
    private int startedActivities;

    @Override protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        AppCrashDiagnostics.install(this);
    }

    @Override public void onCreate() {
        AppCrashDiagnostics.stage("app_create");
        super.onCreate();
        if(BootEvidenceCapture.PROCESS.equals(Application.getProcessName()))return;
        TransientCacheMaintenance.request(this);
        BootEvidenceCapture.schedule(this,"APP");
        AppCrashDiagnostics.stage("app_private_storage");
        HidePrivateStorage.configure(getFilesDir(), android.os.Process.myUid()/100000 == 0);
        AppCrashDiagnostics.stage("app_framework_sync");
        FrameworkConfigSync.initialize(this);
        AppCrashDiagnostics.stage("app_scope");
        ModuleScopeService.initialize();
        AppCrashDiagnostics.stage("app_visibility");
        ConfigVisibilityGrant.refresh(this);
        AppCrashDiagnostics.stage("app_automation");
        ScreenAutomation.removeLegacyNotification(this);
        HiddenEntrySession.lock();
        registerActivityLifecycleCallbacks(this);
        BatteryLifeControl.schedule(this);
        AppCrashDiagnostics.stage("app_ready");
    }

    @Override public void onActivityStarted(Activity activity) {
        startedActivities++;
    }

    @Override public void onActivityStopped(Activity activity) {
        startedActivities = Math.max(0, startedActivities - 1);
        if (startedActivities == 0 && !activity.isChangingConfigurations()) HiddenEntrySession.lock();
    }

    private static void stageActivity(Activity activity) {
        try {
            if (activity != null && !"ls.augment.com.AtomicWorkbenchActivity".equals(activity.getClass().getName()))
                AppCrashDiagnostics.stage("app_activity");
        } catch (Throwable ignored) { }
    }

    @Override public void onActivityCreated(Activity activity, Bundle state) { stageActivity(activity); }
    @Override public void onActivityResumed(Activity activity) { stageActivity(activity); }
    @Override public void onActivityPaused(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
    @Override public void onActivityDestroyed(Activity activity) { }
}
