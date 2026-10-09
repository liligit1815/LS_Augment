package ls.augment.com;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/** A reset waits for cooperative workers, including their final writes, rather than just cancelled Futures. */
final class ModuleWorkerDrain {
    private final Set<Ticket> running = new LinkedHashSet<>();

    synchronized Ticket register(long generation, Runnable cancel) {
        if (ResetWriteFence.stale(generation)) return null;
        Ticket ticket = new Ticket(generation, cancel);
        running.add(ticket);
        return ticket;
    }

    boolean cancelAndAwait(long timeoutMillis) throws InterruptedException {
        List<Ticket> snapshot;
        synchronized (this) {
            snapshot = new ArrayList<>(running);
            for (Ticket ticket : snapshot) ticket.cancelled = true;
        }
        // Never interrupt a Root transport: its shell may need to finish restoring hardware.
        for (Ticket ticket : snapshot) ticket.cancel.run();
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(timeoutMillis);
        for (Ticket ticket : snapshot) {
            long remaining = deadline - System.nanoTime();
            if (remaining <= 0 || !ticket.finished.await(remaining, TimeUnit.NANOSECONDS)) return false;
        }
        return true;
    }

    final class Ticket implements AutoCloseable {
        private final long generation;
        private final Runnable cancel;
        private final CountDownLatch finished = new CountDownLatch(1);
        private boolean cancelled;
        private boolean closed;
        Ticket(long generation, Runnable cancel) { this.generation = generation; this.cancel = cancel; }
        boolean current() {
            synchronized (ModuleWorkerDrain.this) {
                return !cancelled && !closed && !ResetWriteFence.stale(generation);
            }
        }
        boolean ifCurrent(Runnable write) {
            synchronized (ModuleWorkerDrain.this) {
                if (!current()) return false;
                write.run();
                return true;
            }
        }
        void cancel() {
            synchronized (ModuleWorkerDrain.this) { cancelled = true; }
            cancel.run();
        }
        @Override public void close() {
            synchronized (ModuleWorkerDrain.this) {
                closed = true;
                running.remove(this);
                finished.countDown();
            }
        }
    }
}
