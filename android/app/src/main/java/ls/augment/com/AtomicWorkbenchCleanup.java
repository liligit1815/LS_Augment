package ls.augment.com;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/** Phone-side cleanup ownership, separate from any visible workbench session. */
final class AtomicWorkbenchCleanup {
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(task -> {
        Thread thread = new Thread(task, "Duo-WorkbenchCleanup");
        thread.setDaemon(true);
        return thread;
    });
    private static final ArrayList<Owner> owners = new ArrayList<>();
    private static boolean scheduled;
    private static int attempts;

    private static final class Owner {
        final AtomicWorkbenchClient client;
        final String reason;
        Owner(AtomicWorkbenchClient client, String reason) { this.client = client; this.reason = reason; }
    }

    private AtomicWorkbenchCleanup() { }

    static void take(AtomicWorkbenchClient client, String reason) {
        if (client == null) return;
        String checked = AtomicWorkbenchLifecyclePolicy.requireReason(reason);
        client.setFailureListener(null);
        synchronized (AtomicWorkbenchCleanup.class) {
            for (Owner owner : owners) if (owner.client == client) return;
            owners.add(new Owner(client, checked));
            if (!scheduled) schedule(0L);
        }
    }

    static synchronized boolean pending() { return !owners.isEmpty(); }

    private static void schedule(long delay) {
        scheduled = true;
        WORKER.schedule(AtomicWorkbenchCleanup::run, delay, TimeUnit.MILLISECONDS);
    }

    private static void run() {
        ArrayList<Owner> current;
        synchronized (AtomicWorkbenchCleanup.class) { current = new ArrayList<>(owners); }
        for (Owner owner : current) {
            boolean complete = false;
            try {
                Bundle result = owner.client.close(owner.reason);
                complete = result != null && result.getBoolean("success", false)
                        && !result.getBoolean("recovery_pending", false);
            } catch (Exception ignored) {
                // The root/journal continues to own unfinished task return. No process kill,
                // journal deletion, task relaunch, or old result delivery to a new Activity.
            }
            if (complete) synchronized (AtomicWorkbenchCleanup.class) { owners.remove(owner); }
        }
        synchronized (AtomicWorkbenchCleanup.class) {
            scheduled = false;
            if (owners.isEmpty()) attempts = 0;
            else {
                // Only one retry job exists. Successful owners are dropped immediately;
                // the UI connection barrier prevents accumulation of new live sessions.
                attempts = Math.min(attempts + 1, 6);
                schedule(Math.min(30000L, 1000L << (attempts - 1)));
            }
        }
    }
}
