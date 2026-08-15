package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

/** Clears temporary UI disclosure whenever the whole app leaves the foreground. */
public final class AugmentApplication extends Application
        implements Application.ActivityLifecycleCallbacks {
    private int startedActivities;

    @Override public void onCreate() {
        super.onCreate();
        HiddenEntrySession.lock();
        registerActivityLifecycleCallbacks(this);
    }

    @Override public void onActivityStarted(Activity activity) {
        startedActivities++;
    }

    @Override public void onActivityStopped(Activity activity) {
        startedActivities = Math.max(0, startedActivities - 1);
        if (startedActivities == 0) HiddenEntrySession.lock();
    }

    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityResumed(Activity activity) { }
    @Override public void onActivityPaused(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
    @Override public void onActivityDestroyed(Activity activity) { }
}
