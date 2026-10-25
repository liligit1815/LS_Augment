package ls.augment.com;

import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/** Root-only, bounded, process-wide single-flight read of the native dispatcher. */
final class AtomicWorkbenchInputFocusProbe {
    private static Job active;
    private AtomicWorkbenchInputFocusProbe() { }

    static boolean primaryConfirmed() {
        if (android.os.Process.myUid() != 0) return false;
        long requested = System.nanoTime();
        final Job job;
        synchronized (AtomicWorkbenchInputFocusProbe.class) {
            if (active != null && active.done.getCount() == 0) active = null;
            if (active != null) return false; // A stuck Binder dump still owns both worker slots.
            try { active = new Job(); }
            catch (Exception unavailable) { return false; }
            job = active; job.start();
        }
        try {
            if (!job.done.await(400L, TimeUnit.MILLISECONDS)) return false;
            return job.started >= requested && !job.failed && job.snapshot != null
                    && job.snapshot.confirmed && job.snapshot.displayId == 0;
        } catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); return false; }
        finally {
            synchronized (AtomicWorkbenchInputFocusProbe.class) {
                if (active == job && job.done.getCount() == 0) active = null;
            }
        }
    }

    private static final class Job {
        final long started = System.nanoTime();
        final CountDownLatch done = new CountDownLatch(2);
        final ParcelFileDescriptor[] pipe;
        volatile boolean failed;
        volatile AtomicWorkbenchInputFocusSnapshot snapshot;
        Job() throws java.io.IOException { pipe = ParcelFileDescriptor.createPipe(); }

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        void start() {
            Thread reader = new Thread(() -> {
                try (ParcelFileDescriptor.AutoCloseInputStream stream = new ParcelFileDescriptor.AutoCloseInputStream(pipe[0])) {
                    snapshot = AtomicWorkbenchInputFocusSnapshot.read(new java.io.BufferedInputStream(stream, 8192));
                } catch (Exception unavailable) { failed = true; }
                finally { done.countDown(); }
            }, "DuoInputObserveRead");
            Thread writer = new Thread(() -> {
                try {
                    IBinder service = (IBinder) Class.forName("android.os.ServiceManager").getMethod("getService", String.class).invoke(null, "input");
                    if (service == null) throw new IllegalStateException("input_unavailable");
                    service.dump(pipe[1].getFileDescriptor(), new String[0]);
                } catch (Exception unavailable) { failed = true; }
                finally { try { pipe[1].close(); } catch (Exception ignored) { } done.countDown(); }
            }, "DuoInputObserveDump");
            reader.setDaemon(true); writer.setDaemon(true); reader.start(); writer.start();
        }
    }
}
