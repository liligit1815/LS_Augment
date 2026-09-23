package ls.augment.com.hook;

import android.app.Activity;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.SystemOptions;

/** Wait at the native forwarding boundary, without blocking lifecycle or configuration I/O. */
final class InstallerStartupHook {
    private static final String START = "com.android.packageinstaller.InstallStart";
    private static final String PREFIX = "com.android.packageinstaller.";
    private static final Map<Activity, Pending> pending = new WeakHashMap<>();
    private InstallerStartupHook() { }

    static void install(AugmentModule module, ClassLoader loader) {
        OemHooks.methods(module, loader, Activity.class.getName(), "startActivity", void.class, 1, "", chain -> {
            if (!(chain.getThisObject() instanceof Activity)) return chain.proceed();
            Activity owner = (Activity) chain.getThisObject();
            if (!START.equals(owner.getClass().getName()) || !(chain.getArg(0) instanceof Intent))
                return chain.proceed();
            Intent next = (Intent) chain.getArg(0);
            if (!supported(next)) return chain.proceed();
            Pending active = pending.get(owner);
            if (active != null && active.resuming) return chain.proceed();
            if (FeatureSettings.hasVerifiedSnapshot(owner)) {
                return chain.proceed(new Object[]{configured(owner, next)});
            }
            if (active == null) {
                Pending request = new Pending(owner, next);
                pending.put(owner, request);
                request.handler.post(request);
            }
            return null;
        });
        OemHooks.methods(module, loader, Activity.class.getName(), "finish", void.class, 0, "", chain -> {
            Activity owner = (Activity) chain.getThisObject();
            Pending request = pending.get(owner);
            if (request != null && !request.resuming) {
                // Only defer the automatic finish immediately following native forwarding.
                // Back/cancel still finishes and discards the pending launch.
                for (StackTraceElement frame : Thread.currentThread().getStackTrace())
                    if (START.equals(frame.getClassName()) && "onCreate".equals(frame.getMethodName()))
                        return null;
                pending.remove(owner);
                request.handler.removeCallbacks(request);
            }
            return chain.proceed();
        });
        OemHooks.methods(module, loader, Activity.class.getName(), "onStop", void.class, 0, "", chain -> {
            Activity owner = (Activity) chain.getThisObject();
            Pending request = pending.get(owner);
            if (request != null && !request.resuming) {
                pending.remove(owner);
                request.handler.removeCallbacks(request);
                owner.setResult(Activity.RESULT_CANCELED);
                owner.finish();
            }
            return chain.proceed();
        });
    }

    private static boolean supported(Intent intent) {
        if (intent.getComponent() == null) return false;
        String target = intent.getComponent().getClassName();
        return target.equals(PREFIX + "InstallStaging") || target.equals(PREFIX + "InstallScanning")
                || target.equals(PREFIX + "PackageInstallerActivity")
                || target.equals(PREFIX + "CtsPackageInstallerActivity");
    }

    private static Intent configured(Activity owner, Intent nativeIntent) {
        Intent result = new Intent(nativeIntent);
        if (FeatureSettings.enabled(owner, SystemOptions.key("installer_cts"))) {
            // These are the exact native CTS handoff fields. Keep source identity,
            // URI grants, sessions and result forwarding from the validated native intent.
            result.putExtra("isCtsInstall", true);
            if (!result.getComponent().getClassName().equals(PREFIX + "InstallStaging"))
                result.setClassName(owner, PREFIX + "CtsPackageInstallerActivity");
        }
        return result;
    }

    private static final class Pending implements Runnable {
        final WeakReference<Activity> activity;
        final Intent intent;
        final Handler handler = new Handler(Looper.getMainLooper());
        final long deadline = SystemClock.elapsedRealtime() + 2000;
        boolean resuming;
        Pending(Activity owner, Intent next) {
            activity = new WeakReference<>(owner);
            intent = new Intent(next);
        }
        @Override public void run() {
            Activity owner = activity.get();
            if (owner == null) return;
            if (pending.get(owner) != this) return;
            if (owner.isFinishing() || owner.isDestroyed()) { pending.remove(owner); return; }
            boolean ready = FeatureSettings.hasVerifiedSnapshot(owner);
            if (!ready && SystemClock.elapsedRealtime() < deadline) {
                handler.postDelayed(this, 25);
                return;
            }
            resuming = true;
            try {
                owner.startActivity(ready ? configured(owner, intent) : intent);
                FeatureSettings.diagnostic(owner, "ls_augment_installer_startup",
                        ready ? "configuration_ready_before_forward" : "configuration_timeout_native_fallback");
            } catch (RuntimeException error) {
                owner.setResult(Activity.RESULT_CANCELED);
                FeatureSettings.diagnostic(owner, "ls_augment_installer_startup", "forward_failed:" + error.getClass().getSimpleName());
            } finally {
                pending.remove(owner);
                owner.finish();
            }
        }
    }
}
