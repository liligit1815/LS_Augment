package ls.augment.com;

import java.io.IOException;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.RejectedExecutionException;
import java.util.function.LongSupplier;

/** Single phone-side writer with immutable snapshots and invalidation of in-flight clear/delete results. */
final class AtomicWorkbenchContentRepository implements AutoCloseable {
    interface Listener { void onChanged(AtomicWorkbenchContentSnapshot snapshot); }
    interface Subscription extends AutoCloseable { @Override void close(); }
    enum ClipboardOrigin { USER_READ, FOREGROUND_LISTENER, AUTHENTICATED_PHONE_BRIDGE }

    private final Object lock = new Object();
    private final AtomicWorkbenchContentSource source;
    private final AtomicWorkbenchContentStore store;
    private final Executor worker, callback;
    private final LongSupplier clock;
    private final ExecutorService ownedWorker;
    private final EnumMap<AtomicWorkbenchContentItem.Kind, AtomicWorkbenchContentSnapshot> snapshots = new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
    private final EnumMap<AtomicWorkbenchContentItem.Kind, Long> generations = new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
    private final EnumMap<AtomicWorkbenchContentItem.Kind, Boolean> scheduled = new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
    private final EnumMap<AtomicWorkbenchContentItem.Kind, Boolean> dirty = new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
    private final EnumMap<AtomicWorkbenchContentItem.Kind, Long> refreshAt = new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
    private final CopyOnWriteArrayList<Observer> listeners = new CopyOnWriteArrayList<>();
    private final AtomicWorkbenchContentStore.Stored data = new AtomicWorkbenchContentStore.Stored();
    private boolean closed, visible, storageAvailable = true;
    private static final int MAX_PENDING_WRITES = 128;

    AtomicWorkbenchContentRepository(AtomicWorkbenchContentSource source, AtomicWorkbenchContentStore store, Executor callback) {
        this(source, store, new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<>(MAX_PENDING_WRITES), r -> {
            Thread thread = new Thread(r, "DuoContentHistory"); thread.setDaemon(true); return thread;
        }), callback, System::currentTimeMillis, true);
    }

    /** Test boundary supplies a serial executor and deterministic clock, never an alternative production backend. */
    AtomicWorkbenchContentRepository(AtomicWorkbenchContentSource source, AtomicWorkbenchContentStore store,
            Executor worker, Executor callback, LongSupplier clock) {
        this(source, store, worker, callback, clock, false);
    }

    private AtomicWorkbenchContentRepository(AtomicWorkbenchContentSource source, AtomicWorkbenchContentStore store,
            Executor worker, Executor callback, LongSupplier clock, boolean ownsWorker) {
        this.source = java.util.Objects.requireNonNull(source); this.store = java.util.Objects.requireNonNull(store);
        this.worker = java.util.Objects.requireNonNull(worker); this.callback = java.util.Objects.requireNonNull(callback);
        this.clock = java.util.Objects.requireNonNull(clock); ownedWorker = ownsWorker ? (ExecutorService) worker : null;
        for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
            generations.put(kind, 0L); scheduled.put(kind, false); dirty.put(kind, false); refreshAt.put(kind, -1L);
            snapshots.put(kind, state(kind, List.of(), AtomicWorkbenchContentPermissionState.simple(
                    AtomicWorkbenchContentPermissionState.Scope.UNAVAILABLE), AtomicWorkbenchContentSource.State.UNAVAILABLE, false, false));
        }
        worker.execute(this::restore);
    }

    AtomicWorkbenchContentSnapshot snapshot(AtomicWorkbenchContentItem.Kind kind) { synchronized (lock) { return snapshots.get(kind); } }

    Subscription observe(AtomicWorkbenchContentItem.Kind kind, Listener listener) {
        Observer observer = new Observer(kind, listener);
        synchronized (lock) { if (closed) { observer.removed = true; return observer; } listeners.add(observer); }
        deliver(observer, snapshot(kind)); return observer;
    }

    void setVisible(boolean value) {
        synchronized (lock) { if (closed || visible == value) return; visible = value; }
        enqueue(() -> {
            synchronized (lock) { if (closed || visible != value) return; }
            if (value) {
                try { source.start(() -> {
                    refresh(AtomicWorkbenchContentItem.Kind.MEDIA, true);
                    refresh(AtomicWorkbenchContentItem.Kind.FILES, true);
                }); } catch (RuntimeException unavailable) { /* scan reports its exact source state. */ }
                // A return from Android's permission picker can change selected-media access
                // without changing the broad permission flags. Revalidate every reveal.
                refresh(AtomicWorkbenchContentItem.Kind.MEDIA, true); refresh(AtomicWorkbenchContentItem.Kind.FILES, true);
            } else source.stop();
        });
    }

    void refresh(AtomicWorkbenchContentItem.Kind kind, boolean force) {
        if (kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD) return;
        final long requested;
        synchronized (lock) {
            long now = clock.getAsLong();
            if (closed) return;
            if (scheduled.get(kind)) { if (force) dirty.put(kind, true); return; }
            if (!force && refreshAt.get(kind) >= 0
                    && now >= refreshAt.get(kind) && now - refreshAt.get(kind) < AtomicWorkbenchContentPolicy.REFRESH_TTL_MS) return;
            requested = generations.get(kind); scheduled.put(kind, true);
            AtomicWorkbenchContentSnapshot previous = snapshots.get(kind);
            snapshots.put(kind, state(kind, previous.items, previous.permission, previous.state, true, previous.cached));
        }
        publish(kind);
        enqueue(() -> scan(kind, requested));
    }

    void recordClipboard(CharSequence text, long copiedAt, boolean sensitive, ClipboardOrigin origin) {
        if (sensitive || origin == null) return;
        final AtomicWorkbenchContentItem item;
        try { item = AtomicWorkbenchContentItem.clipboard(text, copiedAt > 0 ? copiedAt : clock.getAsLong()); }
        catch (IllegalArgumentException invalid) { return; }
        enqueue(() -> {
            synchronized (lock) {
                if (closed) return;
                ArrayList<AtomicWorkbenchContentItem> entries = new ArrayList<>(data.items.get(item.kind));
                entries.removeIf(previous -> previous.key.equals(item.key)); entries.add(0, item);
                // Copying the same text is an explicit new history event even within the same millisecond.
                if (entries.size() > AtomicWorkbenchContentPolicy.CLIPBOARD_LIMIT)
                    entries.subList(AtomicWorkbenchContentPolicy.CLIPBOARD_LIMIT, entries.size()).clear();
                data.items.put(item.kind, List.copyOf(entries)); bump(item.kind);
                snapshots.put(item.kind, state(item.kind, entries, clipboardPermission(origin), AtomicWorkbenchContentSource.State.READY, false, false));
            }
            persist();
            publish(item.kind);
        });
    }

    /** Capture availability is truthful: ordinary Android listeners only run while the host is in the foreground. */
    void clipboardAccess(AtomicWorkbenchContentPermissionState.Scope scope, AtomicWorkbenchContentSource.State state) {
        enqueue(() -> {
            synchronized (lock) {
                if (closed) return;
                AtomicWorkbenchContentItem.Kind kind = AtomicWorkbenchContentItem.Kind.CLIPBOARD; bump(kind);
                snapshots.put(kind, state(kind, data.items.get(kind), AtomicWorkbenchContentPermissionState.simple(scope), state, false, false));
            }
            publish(AtomicWorkbenchContentItem.Kind.CLIPBOARD);
        });
    }

    void removeHistory(AtomicWorkbenchContentItem.Kind kind, String key) {
        if (key == null) return;
        invalidate(kind);
        enqueue(() -> {
            synchronized (lock) {
                if (closed) return;
                ArrayList<AtomicWorkbenchContentItem> items = new ArrayList<>(data.items.get(kind));
                LinkedHashSet<String> hidden = new LinkedHashSet<>(data.hidden.get(kind));
                for (AtomicWorkbenchContentItem item : items) if (item.key.equals(key) && kind != AtomicWorkbenchContentItem.Kind.CLIPBOARD) {
                    if (hidden.size() >= AtomicWorkbenchContentPolicy.MAX_HIDDEN && !hidden.contains(item.historyKey())) {
                        storageAvailable = false; rebuild(kind, snapshots.get(kind).permission, snapshots.get(kind).state, false); publish(kind); return;
                    }
                    hidden.add(item.historyKey());
                }
                items.removeIf(item -> item.key.equals(key)); data.items.put(kind, List.copyOf(items));
                data.hidden.put(kind, Set.copyOf(hidden)); rebuild(kind, snapshots.get(kind).permission, snapshots.get(kind).state, false);
            }
            persist();
            publish(kind);
        });
    }

    void clearHistory(AtomicWorkbenchContentItem.Kind kind) {
        final long clearTime = clock.getAsLong(); invalidate(kind);
        enqueue(() -> {
            synchronized (lock) {
                if (closed) return;
                long cutoff = clearTime;
                for (AtomicWorkbenchContentItem item : data.items.get(kind)) cutoff = Math.max(cutoff, item.modifiedMillis);
                if (kind != AtomicWorkbenchContentItem.Kind.CLIPBOARD) data.clearedThrough.put(kind, cutoff);
                data.items.put(kind, List.of()); data.hidden.put(kind, Set.of());
                rebuild(kind, snapshots.get(kind).permission, snapshots.get(kind).state, false);
            }
            persist();
            publish(kind);
        });
    }

    /** Selection order is preserved. Caller stages these content references with existing TransferStore. */
    List<AtomicWorkbenchContentItem> selection(AtomicWorkbenchContentItem.Kind kind, List<String> keys) throws IOException {
        if (keys == null || keys.isEmpty() || keys.size() > AtomicWorkbenchContentPolicy.MAX_SELECTION)
            throw new IOException("请选择 1–16 项内容");
        synchronized (lock) {
            if (closed) throw new IOException("内容区已关闭");
            AtomicWorkbenchContentSnapshot snapshot = snapshots.get(kind);
            // Private clipboard history is already owned by this app. Revoked access to the
            // *current system clip* must not lock previously captured history out of selection.
            boolean unavailable = snapshot.cached || (kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD
                    ? snapshot.permission.scope == AtomicWorkbenchContentPermissionState.Scope.LOCKED
                    : !snapshot.permission.accessible());
            if (unavailable) throw new IOException("请先刷新并授权手机内容访问");
            ArrayList<AtomicWorkbenchContentItem> result = new ArrayList<>(); Set<String> seen = new LinkedHashSet<>();
            for (String key : keys) {
                if (key == null || !seen.add(key)) throw new IOException("请选择不同的内容项");
                AtomicWorkbenchContentItem found = null;
                for (AtomicWorkbenchContentItem item : snapshot.items) if (item.key.equals(key)) { found = item; break; }
                if (found == null) throw new IOException("内容已变化，请重新选择"); result.add(found);
            }
            return List.copyOf(result);
        }
    }

    private void restore() {
        AtomicWorkbenchContentStore.Stored restored = null;
        synchronized (lock) { if (closed) return; }
        try { restored = store.read(); } catch (IOException | RuntimeException unavailable) { /* Publish below. */ }
        synchronized (lock) {
            if (closed) return;
            if (restored != null) {
                for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
                    data.items.put(kind, restored.items.get(kind)); data.hidden.put(kind, restored.hidden.get(kind));
                    data.clearedThrough.put(kind, restored.clearedThrough.get(kind));
                    snapshots.put(kind, state(kind, data.items.get(kind), AtomicWorkbenchContentPermissionState.simple(kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD
                            ? AtomicWorkbenchContentPermissionState.Scope.FOREGROUND_ONLY : AtomicWorkbenchContentPermissionState.Scope.UNAVAILABLE),
                            kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD ? AtomicWorkbenchContentSource.State.READY : AtomicWorkbenchContentSource.State.UNAVAILABLE,
                            false, kind != AtomicWorkbenchContentItem.Kind.CLIPBOARD));
                }
            } else {
                storageAvailable = false;
                for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values())
                    rebuild(kind, snapshots.get(kind).permission, AtomicWorkbenchContentSource.State.ERROR, true);
            }
        }
        for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) publish(kind);
    }

    private void scan(AtomicWorkbenchContentItem.Kind kind, long requested) {
        AtomicWorkbenchContentSource.Result result;
        try { result = source.scan(kind); }
        catch (RuntimeException unavailable) { result = new AtomicWorkbenchContentSource.Result(List.of(),
                AtomicWorkbenchContentPermissionState.simple(AtomicWorkbenchContentPermissionState.Scope.UNAVAILABLE), AtomicWorkbenchContentSource.State.ERROR); }
        boolean retry;
        synchronized (lock) {
            scheduled.put(kind, false);
            if (closed) return;
            retry = dirty.get(kind); dirty.put(kind, false);
            if (generations.get(kind) != requested) {
                // The clear/delete already queued by its caller owns the next visible state.
                if (retry) enqueue(() -> refresh(kind, true));
                return;
            }
            if (result.replaceSnapshot()) {
                ArrayList<AtomicWorkbenchContentItem> accepted = new ArrayList<>();
                for (AtomicWorkbenchContentItem item : result.items)
                    if (item.modifiedMillis > data.clearedThrough.get(kind)) accepted.add(item);
                data.items.put(kind, AtomicWorkbenchContentPolicy.merge(kind, accepted, data.hidden.get(kind)));
                refreshAt.put(kind, clock.getAsLong());
            }
            // Failed, denied, or locked source never exposes a stale snapshot as currently readable.
            List<AtomicWorkbenchContentItem> displayed = result.replaceSnapshot() ? data.items.get(kind) : List.of();
            snapshots.put(kind, state(kind, displayed, result.permission, result.state, false, false));
        }
        if (result.replaceSnapshot()) persist();
        publish(kind);
        if (retry) refresh(kind, true);
    }

    private void invalidate(AtomicWorkbenchContentItem.Kind kind) { synchronized (lock) { if (!closed) { bump(kind); refreshAt.put(kind, -1L); } } }
    private void bump(AtomicWorkbenchContentItem.Kind kind) { generations.put(kind, generations.get(kind) + 1); }
    private AtomicWorkbenchContentPermissionState clipboardPermission(ClipboardOrigin origin) {
        return AtomicWorkbenchContentPermissionState.simple(origin == ClipboardOrigin.AUTHENTICATED_PHONE_BRIDGE
                ? AtomicWorkbenchContentPermissionState.Scope.FULL : AtomicWorkbenchContentPermissionState.Scope.FOREGROUND_ONLY);
    }
    private AtomicWorkbenchContentSnapshot state(AtomicWorkbenchContentItem.Kind kind, List<AtomicWorkbenchContentItem> items,
            AtomicWorkbenchContentPermissionState permission, AtomicWorkbenchContentSource.State state, boolean loading, boolean cached) {
        return new AtomicWorkbenchContentSnapshot(kind, items, permission, state, loading, cached,
                generations.get(kind), clock.getAsLong(), storageAvailable);
    }
    private void rebuild(AtomicWorkbenchContentItem.Kind kind, AtomicWorkbenchContentPermissionState permission,
            AtomicWorkbenchContentSource.State state, boolean cached) {
        snapshots.put(kind, state(kind, data.items.get(kind), permission, state, false, cached));
    }
    /** Only the serial writer mutates data. UI state locks must never cover disk I/O. */
    private void persist() {
        boolean saved;
        try { store.write(data); saved = true; }
        catch (IOException | RuntimeException unavailable) { saved = false; }
        synchronized (lock) {
            storageAvailable = saved;
            for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
                AtomicWorkbenchContentSnapshot old = snapshots.get(kind);
                if (old.storageAvailable != storageAvailable)
                    snapshots.put(kind, new AtomicWorkbenchContentSnapshot(kind, old.items, old.permission, old.state,
                            old.loading, old.cached, old.generation, old.updatedAt, storageAvailable));
            }
        }
    }
    private void publish(AtomicWorkbenchContentItem.Kind kind) {
        AtomicWorkbenchContentSnapshot snapshot = snapshot(kind);
        for (Observer observer : listeners) if (observer.kind == kind) deliver(observer, snapshot);
    }
    private void deliver(Observer observer, AtomicWorkbenchContentSnapshot snapshot) {
        callback.execute(() -> {
            synchronized (lock) {
                if (closed || observer.removed || snapshots.get(observer.kind) != snapshot) return;
            }
            observer.listener.onChanged(snapshot);
        });
    }
    private void enqueue(Runnable task) {
        boolean rejected=false;
        synchronized (lock) {
            if (closed) return;
            try { worker.execute(task); }
            catch (RejectedExecutionException busy) {
                // Never run disk work on a caller as backpressure. Leave the
                // previous data intact and expose failure so the user can retry.
                rejected=storageAvailable; storageAvailable=false;
                for(AtomicWorkbenchContentItem.Kind kind:AtomicWorkbenchContentItem.Kind.values()){
                    scheduled.put(kind,false);dirty.put(kind,false);
                    AtomicWorkbenchContentSnapshot old=snapshots.get(kind);
                    snapshots.put(kind,state(kind,old.items,old.permission,AtomicWorkbenchContentSource.State.ERROR,false,old.cached));
                }
            }
        }
        if(rejected)for(AtomicWorkbenchContentItem.Kind kind:AtomicWorkbenchContentItem.Kind.values())publish(kind);
    }
    @Override public void close() {
        synchronized (lock) { if (closed) return; closed = true; for (Observer observer : listeners) observer.removed = true; listeners.clear(); }
        // The source owns cancellation. Do not queue cancellation behind a provider read which
        // is itself waiting for cancellation; pending callbacks are already fenced above.
        source.close(); if (ownedWorker != null) ownedWorker.shutdown();
    }
    private final class Observer implements Subscription {
        final AtomicWorkbenchContentItem.Kind kind; final Listener listener; volatile boolean removed;
        Observer(AtomicWorkbenchContentItem.Kind kind, Listener listener) { this.kind = java.util.Objects.requireNonNull(kind); this.listener = java.util.Objects.requireNonNull(listener); }
        @Override public void close() { removed = true; listeners.remove(this); }
    }
}
