package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/** Persistent crash protection. Hook threads only read published memory state. */
final class RapidFireCrashFuse {
    static final String PENDING = "ls_augment_tgk_fuse_pending";
    static final String ATTEMPTS = "ls_augment_tgk_fuse_attempts";
    static final String FUSED = "ls_augment_tgk_fuse_tripped";
    private enum State { UNKNOWN, READY, ARMED, FUSED }
    private static volatile State state = State.UNKNOWN;
    private static volatile Context context;
    private static volatile Runnable listener;
    private static volatile boolean markerRequested;
    private static final AtomicBoolean started = new AtomicBoolean(), queued = new AtomicBoolean();
    private static final ScheduledExecutorService worker = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread t = new Thread(r, "LSA-RapidFuse"); t.setDaemon(true); return t;
    });
    private static final String SESSION = java.util.UUID.randomUUID().toString();
    // Owned exclusively by worker. The provider atomically persists before acknowledging ARMED.
    private static boolean armed, clearPending, clearAttempts, disarm;
    private static int bootAttempts = -1;
    private RapidFireCrashFuse() { }

    static void setListener(Context value, Runnable callback) {
        listener = callback;
        onSystemStart(value);
    }
    static void onSystemStart(Context value) {
        if (value == null) return;
        context = value;
        if (started.compareAndSet(false, true))
            worker.scheduleWithFixedDelay(RapidFireCrashFuse::refresh, 0, 5, TimeUnit.SECONDS);
    }
    static boolean beforeInstall(Context value) {
        onSystemStart(value);
        if (state == State.ARMED) return true;
        if (state != State.FUSED) { markerRequested = true; requestRefresh(); }
        return false;
    }
    static boolean isFused(Context value) {
        onSystemStart(value);
        State current = state;
        return current != State.READY && current != State.ARMED;
    }
    static void installationFailed(Context value) {
        onSystemStart(value);
        worker.execute(() -> { markerRequested = false; armed = false; clearPending = true; disarm = true; refresh(); });
    }
    static void armStableClear(Context value) {
        onSystemStart(value);
        worker.schedule(() -> {
            if (!TgkRapidFireNative.isLoaded()) return;
            clearPending = true; clearAttempts = true; refresh();
        }, 60, TimeUnit.SECONDS);
    }
    private static void requestRefresh() {
        if (queued.compareAndSet(false, true)) worker.execute(() -> {
            queued.set(false); refresh();
        });
    }
    private static void refresh() {
        Context current = context;
        if (current == null) return;
        try {
            Bundle request = new Bundle();
            request.putString("session", SESSION);
            request.putBoolean("arm", markerRequested);
            request.putBoolean("clearPending", clearPending);
            request.putBoolean("clearAttempts", clearAttempts);
            request.putBoolean("disarm", disarm);
            Bundle result = current.getContentResolver().call(
                    Uri.parse("content://ls.augment.com.config"), "crash_fuse", null, request);
            if (result == null || !result.getBoolean("ok", false))
                throw new IllegalStateException("fuse_persistence_unavailable");
            State next = State.valueOf(result.getString("state", "UNKNOWN"));
            bootAttempts = result.getInt("attempts", -1);
            armed = next == State.ARMED;
            clearPending = false; clearAttempts = false; disarm = false;
            publish(next);
        } catch (Throwable unavailable) {
            publish(State.UNKNOWN);
        }
    }
    private static void publish(State next) {
        State previous = state; state = next;
        if (previous == next) return;
        FeatureSettings.diagnostic(context, "ls_augment_tgk_rapid_fire_fuse_state",
                (next == State.ARMED ? "pending" : next.name().toLowerCase(java.util.Locale.ROOT)) + "|attempts=" + bootAttempts);
        Runnable callback = listener;
        if (callback != null) try { callback.run(); } catch (Throwable ignored) { }
    }
}
