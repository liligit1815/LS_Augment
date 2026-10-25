package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.SystemClock;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import ls.augment.com.AtomicWorkbenchAmapData;

/** One bounded in-memory frame slot; all Provider IPC belongs to this worker. */
final class AtomicWorkbenchAmapWriter {
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.workbench");
    private static final String REGISTER = "amap_navigation_register", PUBLISH = "amap_navigation_publish";
    private static final IBinder PRODUCER = new Binder();
    private static final ThreadPoolExecutor WORKER = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<>(1), action -> {
                Thread thread = new Thread(action, "Duo-AmapGuidance"); thread.setDaemon(true); return thread;
            });
    private static final AtomicReference<Packet> LATEST = new AtomicReference<>();
    private static final AtomicBoolean DRAINING = new AtomicBoolean();
    // Only WORKER reads these credentials. No token, route text or packet enters logs/storage.
    private static String writer;
    private static long writerRoute, session, sequence;

    private static final class Packet {
        final long route, elapsed;
        final String status, source, title, content;
        final Bundle metrics;
        Packet(long route, long elapsed, String status, String source, String title, String content) {
            this(route, elapsed, status, source, title, content, null);
        }
        Packet(long route, long elapsed, String status, String source, String title, String content, Bundle metrics) {
            this.route = route; this.elapsed = elapsed; this.status = status;
            this.source = source; this.title = title; this.content = content;
            this.metrics = metrics == null ? null : new Bundle(metrics);
        }
    }

    private AtomicWorkbenchAmapWriter() { }

    static void active(long route, long elapsed, String source, String title, String content) {
        offer(new Packet(route, elapsed, "active", source, title, content));
    }

    static void ended(long route) {
        offer(new Packet(route, SystemClock.elapsedRealtime(), "ended", "", "", ""));
    }

    static void structured(long route, long elapsed, Bundle metrics) {
        Bundle clean = AtomicWorkbenchAmapData.structured(metrics);
        if (clean != null) offer(new Packet(route, elapsed, "active", "structured", "", "", clean));
    }

    private static void offer(Packet packet) {
        if (packet.route <= 0L) return;
        LATEST.set(packet);
        dispatch();
    }

    private static void dispatch() {
        if (!DRAINING.compareAndSet(false, true)) return;
        try { WORKER.execute(AtomicWorkbenchAmapWriter::drain); }
        catch (RuntimeException unavailable) { DRAINING.set(false); LATEST.set(null); }
    }

    private static void drain() {
        try {
            Packet packet;
            while ((packet = LATEST.getAndSet(null)) != null) {
                try { deliver(packet); }
                catch (Throwable ignored) { discardCredentials(); }
            }
        } finally {
            DRAINING.set(false);
            if (LATEST.get() != null) dispatch();
        }
    }

    private static void deliver(Packet packet) {
        Context context = FeatureSettings.from(null);
        if (context == null || !"com.autonavi.minimap".equals(context.getPackageName())) {
            discardCredentials(); return;
        }
        boolean ended = "ended".equals(packet.status);
        // Newer, never-published lifetimes can replace an older end in the single slot.
        // Ending that newer lifetime also revokes every earlier producer route; clear
        // the currently registered earlier route with its own credential and ID.
        if (ended && (writer == null || writerRoute > packet.route)) return;
        if (!ended && (writer == null || writerRoute != packet.route)) {
            discardCredentials();
            Bundle request = new Bundle(); request.putInt("version", 1);
            request.putBinder("producer", PRODUCER); request.putLong("route", packet.route);
            Bundle reply = context.getContentResolver().call(PROVIDER, REGISTER, null, request);
            if (reply == null || !reply.getBoolean("success")) return;
            String credential = reply.getString("writer", "");
            long epoch = reply.getLong("session", -1L);
            if (!credential.matches("[0-9a-f]{64}") || epoch <= 0L) return;
            writer = credential; writerRoute = packet.route; session = epoch;
        }
        // A frame sampled before this workbench existed cannot be replayed into it.
        if (packet.elapsed < session || packet.elapsed > SystemClock.elapsedRealtime()) return;
        Bundle request = new Bundle(); request.putInt("version", 1);
        request.putBinder("producer", PRODUCER); request.putLong("route", ended ? writerRoute : packet.route);
        request.putString("writer", writer); request.putLong("session", session);
        request.putLong("sequence", ++sequence); request.putString("status", packet.status);
        request.putString("source", packet.source); request.putString("title", packet.title);
        request.putString("content", packet.content); request.putLong("elapsed", packet.elapsed);
        if (packet.metrics != null) request.putBundle(AtomicWorkbenchAmapData.METRICS, new Bundle(packet.metrics));
        Bundle reply = context.getContentResolver().call(PROVIDER, PUBLISH, null, request);
        if (reply == null || !reply.getBoolean("success")) discardCredentials();
        // A failed packet is never requeued. Only another actual source frame can register.
    }

    private static void discardCredentials() { writer = null; writerRoute = session = 0L; }
}
