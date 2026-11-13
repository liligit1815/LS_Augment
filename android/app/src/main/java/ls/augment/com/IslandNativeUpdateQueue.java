package ls.augment.com;

import java.util.ArrayDeque;
import java.util.function.BooleanSupplier;
import java.util.function.LongSupplier;

/** Serializes source operations while the OEM's single pending-animation slot is occupied. */
public final class IslandNativeUpdateQueue {
    public interface Scheduler { void post(Runnable task, long delay); void cancel(Runnable task); }
    private static final int LIMIT = 32;
    private static final long DEADLINE = 4000;
    private final ArrayDeque<Update> pending = new ArrayDeque<>();
    private final BooleanSupplier busy;
    private final LongSupplier clock;
    private final Scheduler scheduler;
    private final Runnable fallback, tick = this::drain;
    private boolean closed, draining;
    private static final class Update {
        final Runnable action; final long deadline;
        Update(Runnable action, long deadline) { this.action = action; this.deadline = deadline; }
    }
    public IslandNativeUpdateQueue(BooleanSupplier busy, LongSupplier clock, Scheduler scheduler, Runnable fallback) {
        this.busy = busy; this.clock = clock; this.scheduler = scheduler; this.fallback = fallback;
    }
    public void offer(Runnable action) {
        if (closed) { action.run(); return; }
        if (pending.size() >= LIMIT) { release(); action.run(); return; }
        pending.add(new Update(action, clock.getAsLong() + DEADLINE));
        drain();
    }
    public boolean idle() { return pending.isEmpty() && !draining; }
    private void drain() {
        if (draining || closed) return;
        scheduler.cancel(tick); draining = true;
        try {
            while (!pending.isEmpty()) {
                if (busy.getAsBoolean()) {
                    if (clock.getAsLong() >= pending.peek().deadline) { release(); return; }
                    scheduler.post(tick, 16); return;
                }
                pending.remove().action.run();
            }
        } finally { draining = false; }
    }
    /** On unsupported/stalled lifecycle, return accepted requests to the original OEM implementation. */
    private void release() { fallback.run(); close(); }
    public void close() {
        if (closed) return;
        closed = true; scheduler.cancel(tick);
        while (!pending.isEmpty()) pending.remove().action.run();
    }
}
