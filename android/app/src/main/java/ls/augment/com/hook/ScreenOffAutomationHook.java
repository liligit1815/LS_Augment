package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.PowerManager;
import android.os.Process;
import android.os.SystemClock;

import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ScreenAutomationPolicy;

/** One event owner in system_server; all Root work remains in the shared hide queue. */
final class ScreenOffAutomationHook {
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    private static volatile Controller controller;

    private ScreenOffAutomationHook() { }

    static synchronized void attach(Context context) {
        if (controller != null || context == null || Process.myUid() != Process.SYSTEM_UID) return;
        Controller next = new Controller(context);
        controller = next;
        next.handler.post(next::start);
    }

    private static final class Controller {
        final Context context;
        final HandlerThread thread = new HandlerThread("LSA-ScreenAutomation");
        final Handler handler;
        final ScreenAutomationPolicy.Epoch epoch = new ScreenAutomationPolicy.Epoch();
        int startAttempts,runAttempts;
        final Runnable retry=()->refreshAndRun("retry");
        final BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override public void onReceive(Context ignored, Intent intent) {
                if (Intent.ACTION_SCREEN_ON.equals(intent.getAction())) {
                    epoch.screenOn();
                    handler.removeCallbacks(retry);runAttempts=0;
                } else refreshAndRun(intent.getAction());
            }
        };
        final ContentObserver observer;

        Controller(Context context) {
            this.context = context;
            thread.start();
            handler = new Handler(thread.getLooper());
            observer = new ContentObserver(handler) {
                @Override public void onChange(boolean selfChange) {
                    refreshAndRun("config_changed");
                }
            };
        }

        void start() {
            try {
                IntentFilter filter = new IntentFilter();
                filter.addAction(Intent.ACTION_SCREEN_OFF);
                filter.addAction(Intent.ACTION_SCREEN_ON);
                filter.addAction(Intent.ACTION_USER_UNLOCKED);
                filter.addAction(Intent.ACTION_BOOT_COMPLETED);
                if (Build.VERSION.SDK_INT >= 33) {
                    context.registerReceiver(receiver, filter, null, handler,
                            Context.RECEIVER_NOT_EXPORTED);
                } else context.registerReceiver(receiver, filter, null, handler);
                context.getContentResolver().registerContentObserver(
                        Uri.parse(PROVIDER + "/config"), false, observer);
                startAttempts=0;
                refreshAndRun("system_attached");
            } catch (Throwable error) {
                report("ls_augment_automation_last_error", "listener_failed:" + error);
                try { context.unregisterReceiver(receiver); } catch (Throwable ignored) { }
                try { context.getContentResolver().unregisterContentObserver(observer); }
                catch (Throwable ignored) { }
                handler.postDelayed(this::start,Math.min(30000L,1000L<<Math.min(5,startAttempts++)));
            }
        }

        void refreshAndRun(String event) {
            boolean claimed=false;
            try {
                // Read the authoritative snapshot here; never block SystemUI or the
                // system main thread on provider access, Root commands or PackageManager.
                Bundle reply = context.getContentResolver().call(
                        PROVIDER, "snapshot", null, null);
                ls.augment.com.ConfigSnapshot snapshot = reply == null ? null
                        : ls.augment.com.ConfigSnapshot.parse(reply.getString("snapshot"));
                boolean enabled = snapshot != null
                        && ConfigSchema.truthy(snapshot.get(ConfigSchema.HIDE_MASTER))
                        && ConfigSchema.truthy(snapshot.get(ConfigSchema.AUTOMATION_ENABLED));
                PowerManager power = context.getSystemService(PowerManager.class);
                boolean off = power != null && !power.isInteractive();
                if(!enabled||!off){handler.removeCallbacks(retry);runAttempts=0;}
                report("ls_augment_automation_runtime", "version=" + BuildConfig.VERSION_NAME
                        + ";pid=" + Process.myPid() + ";listener=system_server;enabled=" + enabled
                        + ";time=" + System.currentTimeMillis());
                if (!epoch.claim(enabled, off)) return;
                claimed=true;
                Bundle extras = new Bundle();
                extras.putString("event", event);
                extras.putString("requestId", Process.myPid() + ":" + SystemClock.elapsedRealtimeNanos());
                Bundle result = context.getContentResolver().call(
                        PROVIDER, "automation_execute", null, extras);
                if (result == null || !result.getBoolean("ok")) {
                    report("ls_augment_automation_last_error", result == null
                            ? "root_bridge_unavailable" : result.getString("message", "执行失败"));
                    retryFailed();
                }else{handler.removeCallbacks(retry);runAttempts=0;report("ls_augment_automation_last_error", "");}
            } catch (Throwable error) {
                report("ls_augment_automation_last_error", "event_failed:" + error);
                if(claimed)retryFailed();
                else if(runAttempts++<6){handler.removeCallbacks(retry);handler.postDelayed(retry,5000L);}
            }
        }

        void retryFailed(){epoch.failed();handler.removeCallbacks(retry);
            if(runAttempts<6)handler.postDelayed(retry,Math.min(30000L,1000L<<runAttempts++));}

        void report(String key, String value) {
            FeatureSettings.diagnostic(context, key, value);
        }
    }
}
