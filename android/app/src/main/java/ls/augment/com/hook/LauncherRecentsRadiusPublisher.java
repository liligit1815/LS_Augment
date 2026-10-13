package ls.augment.com.hook;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Bundle;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/** Latest-only range delivery. The launcher never persists range metadata. */
final class LauncherRecentsRadiusPublisher {
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    private static final Uri RESET = Uri.parse("content://ls.augment.com.config/recents-radius-reset");
    private static final int MAX_ATTEMPTS = 3;
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(task -> {
        Thread thread = new Thread(task, "lsa-recents-radius-publish");
        thread.setDaemon(true);
        return thread;
    });

    interface Scheduler { void schedule(Runnable task, long delayMs); }
    interface Transport { boolean publish(String payload) throws Exception; }

    private final Scheduler scheduler;
    private final Transport transport;
    private String acknowledgedGeometry;
    private Pending latest;
    private long resetGeneration;
    // Covers both the queued callback and its in-flight IPC. A replacement is
    // picked up by that callback, without adding an unbounded worker queue.
    private boolean scheduled;

    LauncherRecentsRadiusPublisher(Context context) {
        Context application = context.getApplicationContext();
        Context source = application == null ? context : application;
        scheduler = (task, delay) -> WORKER.schedule(task, delay, TimeUnit.MILLISECONDS);
        ContentObserver reset = new ContentObserver(null) {
            @Override public void onChange(boolean selfChange) { resetObserved(); }
        };
        boolean[] registered = {false}; // Accessed only by the single worker.
        transport = payload -> {
            if (!registered[0]) {
                // Observer registration is Binder work too. Registration failure
                // uses the same bounded retry path as unavailable publication.
                source.getContentResolver().registerContentObserver(RESET, false, reset);
                registered[0] = true;
            }
            Bundle extras = new Bundle();
            extras.putString("payload", payload);
            Bundle result = source.getContentResolver().call(PROVIDER, "recents_radius_publish", null, extras);
            return result != null && result.getBoolean("ok", false);
        };
    }

    LauncherRecentsRadiusPublisher(Scheduler scheduler, Transport transport) {
        this.scheduler = scheduler;
        this.transport = transport;
    }

    synchronized void publish(String geometry, String payload) {
        if (geometry == null || payload == null) return;
        if (latest != null && geometry.equals(latest.geometry)) return;
        // An in-flight different geometry might still succeed. In that case a
        // return to the last acknowledged geometry must follow it on the wire.
        if (latest == null && geometry.equals(acknowledgedGeometry)) return;
        latest = new Pending(geometry, payload);
        scheduleLocked(0L);
    }

    synchronized void resetObserved() {
        resetGeneration++;
        acknowledgedGeometry = null;
        latest = null;
        // Do not replay the old observation after the user cleared module data.
        // A queued callback is harmless; the next real sample can replace it.
    }

    private void scheduleLocked(long delay) {
        if (scheduled || latest == null) return;
        scheduled = true;
        try {
            scheduler.schedule(this::drain, delay);
        } catch (RuntimeException unavailable) {
            scheduled = false;
            latest = null; // A later real observation can retry delivery.
        }
    }

    private void drain() {
        Pending sending;
        long generation;
        synchronized (this) {
            sending = latest;
            if (sending == null || sending.geometry.equals(acknowledgedGeometry)) {
                latest = null;
                scheduled = false;
                return;
            }
            generation = resetGeneration;
        }
        boolean accepted = false;
        try {
            if (sending != null) accepted = transport.publish(sending.payload);
        } catch (Exception | LinkageError unavailable) {
            // A lost ACK is safe to retry: the provider stores canonical data.
        }
        synchronized (this) {
            scheduled = false;
            // On a lost ACK the remote value may have changed. Do not assume a
            // previously acknowledged different value is still stored there.
            acknowledgedGeometry = accepted && generation == resetGeneration ? sending.geometry : null;
            if (latest != sending) {
                scheduleLocked(0L);
                return;
            }
            if (accepted || ++sending.attempts >= MAX_ATTEMPTS) {
                latest = null;
                return;
            }
            scheduleLocked(250L * sending.attempts);
        }
    }

    private static final class Pending {
        final String geometry, payload;
        int attempts;
        Pending(String geometry, String payload) { this.geometry = geometry; this.payload = payload; }
    }
}
