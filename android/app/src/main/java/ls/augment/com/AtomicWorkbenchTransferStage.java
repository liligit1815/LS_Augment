package ls.augment.com;

import android.content.Context;
import android.content.Intent;
import java.io.Closeable;
import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/** One bounded phone source read. A noncooperative provider retains its worker until actually done. */
final class AtomicWorkbenchTransferStage {
    interface Callback { void complete(AtomicWorkbenchTransferStore.Payload payload, String failure); }
    private static final AtomicBoolean BUSY = new AtomicBoolean();

    // Job constructor normalizes to application context; active work outlives the initiating Activity.
    //noinspection StaticFieldLeak
    private static volatile Job current;
    private static final ThreadPoolExecutor WORKER = new ThreadPoolExecutor(1, 1, 20, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(1), task -> daemon(task, "DuoTransferSource"), new ThreadPoolExecutor.AbortPolicy());
    private static final ThreadPoolExecutor CLOSER = new ThreadPoolExecutor(1, 1, 20, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(1), task -> daemon(task, "DuoTransferClose"), new ThreadPoolExecutor.AbortPolicy());
    private static final ScheduledExecutorService CLOCK = Executors.newSingleThreadScheduledExecutor(task -> daemon(task, "DuoTransferDeadline"));
    private static Thread daemon(Runnable task, String name) { Thread thread = new Thread(task, name); thread.setDaemon(true); return thread; }
    static Job start(Context context, Intent intent, boolean picker, Callback callback) { return start(context, intent, picker, callback, 60_000L); }
    static Job start(Context context, Intent intent, boolean picker, Callback callback, long timeout) {
        Job job = new Job(context, intent, picker, callback);
        String rejected = null;
        synchronized (ResetWriteFence.class) {
            if (ResetWriteFence.stale(job.generation)) rejected = "模块已开始重置，请稍后重新添加素材";
            else if (!BUSY.compareAndSet(false, true)) rejected = "上次来源仍在结束读取，请稍后重试";
            else current = job;
        }
        if (rejected != null) { job.finish(null, rejected); return job; }
        try {
            job.deadline = CLOCK.schedule(() -> job.cancel("读取来源超时；若来源未结束读取，请稍后重试"), timeout, TimeUnit.MILLISECONDS);
            WORKER.execute(job::run);
        } catch (RuntimeException unavailable) { if (job.deadline != null) job.deadline.cancel(false); if (current == job) current = null; BUSY.set(false); job.finish(null, "来源读取暂时不可用，请稍后重试"); }
        return job;
    }
    static boolean busy() { return BUSY.get(); }
    static void cancelForReset() { Job job = current; if (job != null) job.cancel("模块重置已取消本次素材读取"); }
    static final class Job implements AtomicWorkbenchTransferStore.CopyControl {
        final Context context; final Intent intent; final boolean picker; final Callback callback;
        final AtomicBoolean delivered = new AtomicBoolean();
        final long generation = ResetWriteFence.generation();
        volatile boolean cancelled; volatile Thread worker; volatile Closeable source;
        volatile java.util.concurrent.ScheduledFuture<?> deadline;
        Job(Context context, Intent intent, boolean picker, Callback callback) {
            Context app = context.getApplicationContext(); this.context = app == null ? context : app;
            this.intent = new Intent(intent); this.picker = picker; this.callback = callback;
        }
        void run() {
            AtomicWorkbenchTransferStore.Payload payload = null; String failure = null;
            worker = Thread.currentThread();
            try { check(); payload = AtomicWorkbenchTransferStore.importIntent(context, intent, picker, this); check(); }
            catch (IOException | RuntimeException invalid) { failure = invalid instanceof IOException ? invalid.getMessage() : "来源内容无法读取，请重试"; }
            finally {
                worker = null; source = null;
                if (deadline != null) deadline.cancel(false);
                if (cancelled) { AtomicWorkbenchTransferStore.discardUnpublished(context, payload); payload = null; }
                if (current == this) current = null; BUSY.set(false);
            }
            if (!finish(payload, failure) && payload != null) AtomicWorkbenchTransferStore.discardUnpublished(context, payload);
        }
        void cancel() { cancel("已取消读取来源素材"); }
        void cancel(String reason) {
            cancelled = true; Thread current = worker; if (current != null) current.interrupt();
            closeAsync(source); finish(null, reason);
        }
        @Override public void check() throws IOException {
            if (ResetWriteFence.stale(generation)) throw new IOException("模块重置已取消本次素材读取");
            if (cancelled || Thread.currentThread().isInterrupted()) throw new IOException("已取消读取来源素材");
        }
        @Override public void opened(Closeable input) throws IOException { source = input; if (cancelled) { closeAsync(input); throw new IOException("已取消读取来源素材"); } }
        @Override public void closed(Closeable input) { if (source == input) source = null; }
        boolean finish(AtomicWorkbenchTransferStore.Payload payload, String failure) {
            if (!delivered.compareAndSet(false, true)) return false;
            try { callback.complete(payload, failure); } catch (RuntimeException ignored) { if (payload != null) AtomicWorkbenchTransferStore.discardUnpublished(context, payload); }
            return true;
        }
    }
    private static void closeAsync(Closeable input) {
        if (input == null) return;
        try { CLOSER.execute(() -> { try { input.close(); } catch (IOException | RuntimeException ignored) { } }); }
        catch (RuntimeException busy) { /* Original bounded worker still owns the source and will close it. */ }
    }
}
