package ls.augment.com.hook;

import java.io.Closeable;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.UUID;

/** Bounded descriptors; eviction retires cache ownership but never closes active playback. */
final class ComboMotionLeases<T extends Closeable> {
    static final String PREFIX = "/__redmagic_duo_combo__/";
    private static final int MAX_LEASES = 32;
    private static final int MAX_PLAYERS = 4;
    private final Map<String, Lease<T>> leases = new HashMap<>();
    private final IdentityHashMap<Object, Lease<T>> players = new IdentityHashMap<>();

    synchronized Lease<T> register(T resource) {
        if (resource == null) return null;
        if (leases.size() >= MAX_LEASES) { close(resource); return null; }
        Lease<T> lease = new Lease<>(PREFIX + UUID.randomUUID(), resource);
        leases.put(lease.path, lease);
        return lease;
    }

    synchronized boolean pin(Object owner, Lease<T> lease) {
        if (owner == null || lease == null || leases.get(lease.path) != lease) return false;
        if (!players.containsKey(owner) && players.size() >= MAX_PLAYERS) return false;
        if (players.get(owner) == lease) return true;
        release(owner);
        players.put(owner, lease); lease.pins++;
        return true;
    }

    synchronized void release(Object owner) {
        Lease<T> lease = players.remove(owner);
        if (lease != null) { lease.pins--; discardIfUnused(lease); }
    }

    synchronized void retire(Lease<T> lease) {
        if (lease != null) { lease.cached = false; discardIfUnused(lease); }
    }

    synchronized T duplicate(String path, Duplicator<T> duplicator) throws Exception {
        Lease<T> lease = leases.get(path);
        return lease == null || lease.pins == 0 ? null : duplicator.duplicate(lease.resource);
    }

    private void discardIfUnused(Lease<T> lease) {
        if (!lease.cached && lease.pins == 0 && leases.remove(lease.path, lease)) close(lease.resource);
    }

    private static void close(Closeable resource) { try { resource.close(); } catch (Exception ignored) { } }
    interface Duplicator<T> { T duplicate(T resource) throws Exception; }
    static final class Lease<T> {
        final String path; final T resource;
        private boolean cached = true;
        private int pins;
        private Lease(String path, T resource) { this.path = path; this.resource = resource; }
    }
}
