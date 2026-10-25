package ls.augment.com;

import android.app.Activity;
import android.content.ClipData;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import java.util.UUID;

/** Copies only a native source offer admitted by the host's still-held, exact-window gesture. */
final class AtomicWorkbenchAppSourceDrag implements AtomicWorkbenchSourceDragBridge.Host {
    interface Host {
        Capture capture(int uid, int display, long down);
        boolean current(Capture capture);
        void preparing(boolean value);
    }
    static final class Capture {
        final int uid, display, task, window, epoch;
        final long down, session, reset;
        final String unique;
        final AtomicWorkbenchClient client;
        final View source;
        Capture(int uid, int display, int task, int window, int epoch, long down, long session, long reset,
                String unique, AtomicWorkbenchClient client, View source) {
            this.uid = uid; this.display = display; this.task = task; this.window = window; this.epoch = epoch;
            this.down = down; this.session = session; this.reset = reset; this.unique = unique; this.client = client; this.source = source;
        }
    }
    private static final class Offer {
        final Capture capture;
        final String ticket = UUID.randomUUID().toString().replace("-", "");
        final long deadline = SystemClock.elapsedRealtime() + 2500;
        IBinder completion; AtomicWorkbenchTransferStage.Job job;
        boolean consumed, completed, started, physicalStarted, ended;
        Offer(Capture capture) { this.capture = capture; }
    }
    private final Activity activity; private final AtomicWorkbenchTransfer transfer; private final Host host;
    private final Handler main = new Handler(Looper.getMainLooper());
    private Offer pending; private boolean foreground;
    AtomicWorkbenchAppSourceDrag(Activity activity, AtomicWorkbenchTransfer transfer, Host host) { this.activity = activity; this.transfer = transfer; this.host = host; }
    void foreground(boolean active) {
        foreground = active;
        if (active) AtomicWorkbenchSourceDragBridge.attach(this);
        else { AtomicWorkbenchSourceDragBridge.detach(this); cancel(); }
    }
    @Override public Bundle probe(int uid, int display, long down) {
        Bundle reply = new Bundle();
        if (!foreground || AtomicWorkbenchTransferStage.busy() || pending != null && pending.consumed) return reply;
        Capture capture = host.capture(uid, display, down);
        if (capture == null) return reply;
        pending = new Offer(capture); reply.putString("ticket", pending.ticket); reply.putInt("owner_uid", android.os.Process.myUid());
        android.util.Log.i("DuoSourceDrag", "phase=probe_accepted;display=" + display);
        return reply;
    }
    @Override public boolean offer(int uid, String ticket, ClipData clip, IBinder completion) {
        Offer offer = pending;
        if (!foreground || offer == null || offer.consumed || offer.capture.uid != uid || !offer.ticket.equals(ticket)
                || completion == null || !completion.isBinderAlive() || SystemClock.elapsedRealtime() >= offer.deadline || !host.current(offer.capture)) return false;
        final AtomicWorkbenchSourceDragData payload;
        try { payload = AtomicWorkbenchSourceDragData.read(clip); }
        catch (RuntimeException invalid) { return false; }
        offer.consumed = true; offer.completion = completion; host.preparing(true);
        android.util.Log.i("DuoSourceDrag", "phase=copy_start;files=" + payload.uris.size());
        offer.job = AtomicWorkbenchTransferStage.start(activity, payload.input, false, (staged, failure) -> {
            if (staged == null || failure != null) { main.post(() -> finish(offer, false)); return; }
            AtomicWorkbenchTransfer.IO.execute(() -> {
                AtomicWorkbenchPendingPayload frozen = null;
                try { frozen = AtomicWorkbenchTransferStore.batch(activity, staged); } catch (Exception ignored) { }
                AtomicWorkbenchPendingPayload ready = frozen;
                main.post(() -> {
                    boolean started = false;
                    if (ready != null && !offer.completed && pending == offer && foreground && host.current(offer.capture)) {
                        AtomicWorkbenchContentPanel.DragSource state = new AtomicWorkbenchContentPanel.DragSource() {
                            @Override public boolean held() { return !offer.completed && foreground && host.current(offer.capture); }
                            @Override public boolean accessibility() { return false; }
                            @Override public void starting() { offer.started = true; }
                            @Override public void started() { }
                            @Override public void ended() {
                                offer.ended = true; host.preparing(false);
                                if (offer.completed && offer.physicalStarted) AtomicWorkbenchSourceDragBridge.complete(offer.completion, true, false);
                            }
                        };
                        started = transfer.beginAppSourceDrag(offer.capture.source, ready, state, payload);
                    }
                    if (started) AtomicWorkbenchTransferStore.published(staged);
                    else AtomicWorkbenchTransfer.IO.execute(() -> AtomicWorkbenchTransferStore.discardUnpublished(activity, staged));
                    finish(offer, started);
                });
            });
        });
        return true;
    }
    private void finish(Offer offer, boolean started) {
        finish(offer, started, !started && !offer.started && foreground && host.current(offer.capture));
    }
    private void finish(Offer offer, boolean started, boolean nativeFallback) {
        if (offer.completed) return;
        offer.completed = true; offer.physicalStarted = started;
        android.util.Log.i("DuoSourceDrag", "phase=handoff_end;started=" + started + ";fallback=" + nativeFallback);
        if (pending == offer) { pending = null; if (!started) host.preparing(false); }
        // Keep the original URI grant throughout the real system drag. Native receivers
        // may request it at DROP, after our verified cache copy has already completed.
        if (!started || offer.ended) AtomicWorkbenchSourceDragBridge.complete(offer.completion, started, nativeFallback);
    }
    void cancel() {
        Offer offer = pending; if (offer == null || offer.started) return;
        if (offer.job != null) offer.job.cancel(); finish(offer, false, false);
    }
}
