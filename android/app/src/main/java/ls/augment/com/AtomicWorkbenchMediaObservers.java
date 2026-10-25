package ls.augment.com;

import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Callback receipts are hints. The serial owner must reauthenticate a source before selection. */
final class AtomicWorkbenchMediaObservers implements AutoCloseable {
    private static final int MAX = 64;
    static final class Edge {
        final MediaSession.Token token;
        final String source;
        Edge(MediaSession.Token token, String source) { this.token = token; this.source = source; }
    }
    private final Object lock = new Object();
    private final Map<MediaSession.Token, Watch> watches = new LinkedHashMap<>();
    private final ArrayList<Edge> edges = new ArrayList<>();
    private Handler handler;
    private boolean closed, overflow;

    private final class Watch extends MediaController.Callback {
        final MediaController controller;
        final MediaSession.Token token;
        final String source;
        boolean playing, retired, destroyed;
        Watch(MediaController controller, String source, PlaybackState baseline) {
            this.controller = controller; token = controller.getSessionToken(); this.source = source;
            playing = isPlaying(baseline);
        }
        @Override public void onPlaybackStateChanged(PlaybackState state) {
            synchronized (lock) {
                if (closed || retired || destroyed || watches.get(token) != this) return;
                boolean next = isPlaying(state);
                if (next && !playing) {
                    if (edges.size() == MAX) { edges.clear(); overflow = true; }
                    if (!overflow) edges.add(new Edge(token, source));
                }
                playing = next;
            }
        }
        @Override public void onSessionDestroyed() {
            synchronized (lock) {
                if (retired || watches.get(token) != this) return;
                destroyed = true; edges.removeIf(edge -> edge.source.equals(source));
            }
        }
    }

    boolean observe(MediaController controller, String source, PlaybackState baseline) {
        Watch old;
        synchronized (lock) {
            if (closed) return false;
            old = watches.get(controller.getSessionToken());
            if (old != null && old.destroyed) return false;
            if (old != null && old.source.equals(source)) return !old.destroyed;
        }
        if (old != null) remove(old);
        try {
            if (handler == null) { Looper looper = Looper.getMainLooper(); if (looper == null) return true; handler = new Handler(looper); }
            Watch next = new Watch(controller, source, baseline);
            synchronized (lock) { if (closed || watches.size() >= MAX) return true; watches.put(next.token, next); }
            try { controller.registerCallback(next, handler); }
            catch (RuntimeException | LinkageError failed) { remove(next); }
            synchronized (lock) { return !next.destroyed; }
        } catch (RuntimeException | LinkageError unavailable) { return true; }
    }

    void retain(Set<MediaSession.Token> live) {
        List<Watch> removed = new ArrayList<>();
        synchronized (lock) { for (Watch item : watches.values()) if (!live.contains(item.token)) removed.add(item); }
        for (Watch item : removed) remove(item);
    }
    List<Edge> drain() {
        synchronized (lock) { List<Edge> result = new ArrayList<>(edges); edges.clear(); overflow = false; return result; }
    }
    boolean available() { synchronized (lock) { return !closed && handler != null && !watches.isEmpty() && !overflow; } }
    boolean covers(int count) {
        synchronized (lock) {
            if (!available() || count < 1) return false;
            int live = 0; for (Watch watch : watches.values()) if (!watch.retired && !watch.destroyed) live++;
            return live == count;
        }
    }
    private void remove(Watch item) {
        synchronized (lock) {
            item.retired = true; if (watches.get(item.token) == item) watches.remove(item.token);
            edges.removeIf(edge -> edge.source.equals(item.source));
        }
        try { item.controller.unregisterCallback(item); } catch (RuntimeException | LinkageError ignored) { }
    }
    void clear() {
        List<Watch> removed;
        synchronized (lock) { removed = new ArrayList<>(watches.values()); edges.clear(); overflow = false; }
        for (Watch item : removed) remove(item);
    }
    @Override public void close() { synchronized (lock) { closed = true; } clear(); }
    private static boolean isPlaying(PlaybackState state) { return state != null && state.getState() == PlaybackState.STATE_PLAYING; }
}
