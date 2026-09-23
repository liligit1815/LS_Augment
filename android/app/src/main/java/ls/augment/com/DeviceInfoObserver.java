package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import java.lang.ref.WeakReference;

/** Read-only invalidations for the five About fields, scoped to the visible owner. */
final class DeviceInfoObserver implements AutoCloseable {
    // Platform protected broadcast; the constant itself is not in the public SDK.
    private static final String PREFERRED_ACTIVITY_CHANGED =
            "android.intent.action.ACTION_PREFERRED_ACTIVITY_CHANGED";
    private final Context appContext;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final WeakReference<Activity> owner;
    private volatile Runnable onChanged;
    private volatile boolean closed;
    private boolean contentRegistered, receiverRegistered, lifecycleRegistered;

    static DeviceInfoObserver watch(Context context, Runnable onChanged) {
        DeviceInfoObserver result = new DeviceInfoObserver(context, onChanged);
        if (Looper.myLooper() == Looper.getMainLooper()) result.register();
        else result.main.post(result::register);
        return result;
    }

    private DeviceInfoObserver(Context context, Runnable onChanged) {
        Context application = context.getApplicationContext();
        appContext = application == null ? context : application;
        owner = new WeakReference<>(context instanceof Activity ? (Activity) context : null);
        this.onChanged = onChanged;
    }

    private final Runnable deliver = () -> {
        Runnable callback = onChanged;
        if (!closed && callback != null) callback.run();
    };
    private final ContentObserver content = new ContentObserver(main) {
        @Override public void onChange(boolean selfChange) { changed(); }
        @Override public void onChange(boolean selfChange, Uri uri) { changed(); }
    };
    private final BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) { changed(); }
    };
    private final Application.ActivityLifecycleCallbacks lifecycle = new Application.ActivityLifecycleCallbacks() {
        @Override public void onActivityDestroyed(Activity activity) {
            if (owner.get() == activity) close();
        }
        @Override public void onActivityCreated(Activity activity, Bundle state) { }
        @Override public void onActivityStarted(Activity activity) { }
        @Override public void onActivityResumed(Activity activity) { }
        @Override public void onActivityPaused(Activity activity) { }
        @Override public void onActivityStopped(Activity activity) { }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
    };

    private void changed() {
        if (closed) return;
        main.removeCallbacks(deliver);
        main.post(deliver);
    }

    private void register() {
        if (closed) return;
        Activity activity = owner.get();
        if (activity != null && activity.isDestroyed()) { close(); return; }
        if (activity != null && appContext instanceof Application) {
            ((Application) appContext).registerActivityLifecycleCallbacks(lifecycle);
            lifecycleRegistered = true;
        }
        observe(Settings.System.getUriFor(DeviceInfo.SYSTEM_PHONE_NAME));
        observe(Settings.Global.getUriFor(DeviceInfo.GLOBAL_DEVICE_NAME));

        IntentFilter packages = new IntentFilter();
        packages.addAction(Intent.ACTION_PACKAGE_ADDED);
        packages.addAction(Intent.ACTION_PACKAGE_REMOVED);
        packages.addAction(Intent.ACTION_PACKAGE_REPLACED);
        packages.addAction(Intent.ACTION_PACKAGE_CHANGED);
        packages.addDataScheme("package");
        receive(packages);

        IntentFilter environment = new IntentFilter(PREFERRED_ACTIVITY_CHANGED);
        environment.addAction(Intent.ACTION_CONFIGURATION_CHANGED);
        environment.addAction(Intent.ACTION_LOCALE_CHANGED);
        receive(environment);
    }

    private void observe(Uri uri) {
        try {
            appContext.getContentResolver().registerContentObserver(uri, false, content);
            contentRegistered = true;
        } catch (RuntimeException unavailable) {
            // Restricted OEM providers still get a fresh read when About resumes.
        }
    }

    private void receive(IntentFilter filter) {
        try {
            if (Build.VERSION.SDK_INT >= 33) {
                appContext.registerReceiver(receiver, filter, null, main, Context.RECEIVER_NOT_EXPORTED);
            } else {
                appContext.registerReceiver(receiver, filter, null, main);
            }
            receiverRegistered = true;
        } catch (RuntimeException unavailable) {
            // Optional refresh signals must not prevent About from opening.
        }
    }

    @Override public void close() {
        closed = true;
        onChanged = null;
        main.removeCallbacks(deliver);
        if (Looper.myLooper() == Looper.getMainLooper()) unregister();
        else main.post(this::unregister);
    }

    private void unregister() {
        if (contentRegistered) {
            contentRegistered = false;
            try { appContext.getContentResolver().unregisterContentObserver(content); }
            catch (RuntimeException ignored) { }
        }
        if (receiverRegistered) {
            receiverRegistered = false;
            try { appContext.unregisterReceiver(receiver); }
            catch (RuntimeException ignored) { }
        }
        if (lifecycleRegistered) {
            lifecycleRegistered = false;
            ((Application) appContext).unregisterActivityLifecycleCallbacks(lifecycle);
        }
        owner.clear();
    }
}
