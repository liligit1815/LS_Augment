package ls.augment.com.hook;

import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Wait for saved options before the OEM service publishes its first storage list. */
final class MtpStartupHook {
    private static final String SERVICE = "cn.nubia.filebrowser.mtpserver.MtpService";
    // Service callbacks and retries run on the main looper; no Binder wait under its monitor.
    private static final WeakHashMap<Service, Pending> pending = new WeakHashMap<>();

    static int install(AugmentModule module, ClassLoader loader) {
        int count = OemHooks.methods(module, loader, SERVICE, "onStartCommand", int.class, 3, "", chain -> {
            Service owner = (Service) chain.getThisObject();
            Pending old = pending.get(owner);
            if (old != null && old.resuming) return chain.proceed();
            if (old != null) old.cancel(owner);
            Intent intent = (Intent) chain.getArg(0);
            if (intent == null || FeatureSettings.hasVerifiedSnapshot(owner)) return chain.proceed();
            Pending request = new Pending(owner, intent, (Integer) chain.getArg(1), (Integer) chain.getArg(2));
            pending.put(owner, request);
            request.handler.post(request);
            // Matches this OEM's native result, preserving intent redelivery after process death.
            return Service.START_REDELIVER_INTENT;
        });
        count += OemHooks.methods(module, loader, SERVICE, "onDestroy", void.class, 0, "", chain -> {
            Service owner = (Service) chain.getThisObject();
            Pending request = pending.get(owner);
            if (request != null) request.cancel(owner);
            return chain.proceed();
        });
        return count;
    }

    private static final class Pending implements Runnable {
        final WeakReference<Service> service;
        final Intent intent;
        final int flags, startId;
        final Handler handler = new Handler(Looper.getMainLooper());
        final long deadline = SystemClock.elapsedRealtime() + 2000;
        boolean resuming;

        Pending(Service owner, Intent intent, int flags, int startId) {
            service = new WeakReference<>(owner);
            this.intent = new Intent(intent);
            this.flags = flags;
            this.startId = startId;
        }

        void cancel(Service owner) {
            pending.remove(owner);
            handler.removeCallbacks(this);
        }

        @Override public void run() {
            Service owner = service.get();
            if (owner == null || pending.get(owner) != this) return;
            boolean ready = FeatureSettings.hasVerifiedSnapshot(owner);
            if (!ready && SystemClock.elapsedRealtime() < deadline) {
                handler.postDelayed(this, 25);
                return;
            }
            resuming = true;
            try {
                owner.onStartCommand(intent, flags, startId);
                FeatureSettings.diagnostic(owner, "ls_augment_mtp_startup",
                        ready ? "configuration_ready_before_storage" : "configuration_timeout_native_fallback");
            } finally {
                cancel(owner);
            }
        }
    }
}
