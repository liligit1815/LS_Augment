package ls.augment.com;

import android.content.ClipData;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.Process;
import java.lang.ref.WeakReference;
import java.util.Set;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/** Same-user, exact live physical gesture admission. No root token is disclosed to a source app. */
final class AtomicWorkbenchSourceDragBridge {
    interface Host {
        Bundle probe(int uid, int display, long down);
        boolean offer(int uid, String ticket, ClipData data, IBinder completion);
    }
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile WeakReference<Host> host = new WeakReference<>(null);
    private static final AtomicBoolean CALLING = new AtomicBoolean();
    static void attach(Host value) { host = new WeakReference<>(value); }
    static void detach(Host value) { if (host.get() == value) host = new WeakReference<>(null); }

    static Bundle call(String method, String arg, Bundle request) {
        int uid = Binder.getCallingUid();
        if (arg != null || request == null || uid < 10000 || uid == Process.myUid()
                || uid / 100000 != Process.myUid() / 100000 || !CALLING.compareAndSet(false, true)) return rejected(method);
        AtomicBoolean waiting = new AtomicBoolean(true);
        try {
            boolean probe = AtomicWorkbenchSourceDragData.PROBE.equals(method);
            Set<String> keys = probe ? Set.of("version", "display", "down") : Set.of("version", "ticket", "clip", "completion");
            if (!request.keySet().equals(keys) || !(request.get("version") instanceof Integer) || request.getInt("version") != 1)
                return rejected(method);
            if (probe && (!(request.get("display") instanceof Integer) || !(request.get("down") instanceof Long))) return rejected(method);
            if (!probe && (!(request.get("ticket") instanceof String) || !request.getString("ticket").matches("[0-9a-f]{32}")
                    || !(request.get("clip") instanceof ClipData) || !(request.get("completion") instanceof IBinder))) return rejected(method);
            Host captured = host.get();
            if (captured == null) return rejected(method);
            FutureTask<Bundle> work = new FutureTask<>(() -> {
                if (!waiting.get() || captured != host.get()) return rejected(method);
                if (probe) return captured.probe(uid, request.getInt("display"), request.getLong("down"));
                Bundle reply = new Bundle();
                reply.putBoolean("accepted", captured.offer(uid, request.getString("ticket"),
                        request.getParcelable("clip", ClipData.class), request.getBinder("completion")));
                return reply;
            });
            MAIN.post(work);
            try { return work.get(500, TimeUnit.MILLISECONDS); }
            catch (Exception unavailable) { waiting.set(false); work.cancel(false); return new Bundle(); }
        } catch (RuntimeException invalid) { return rejected(method); }
        finally { waiting.set(false); CALLING.set(false); }
    }

    private static Bundle rejected(String method) {
        Bundle reply = new Bundle();
        if (AtomicWorkbenchSourceDragData.OFFER.equals(method)) reply.putBoolean("accepted", false);
        return reply;
    }

    static void complete(IBinder callback, boolean started, boolean nativeFallback) {
        if (callback == null) return;
        AtomicWorkbenchTransfer.IO.execute(() -> {
            Parcel data = Parcel.obtain();
            try {
                data.writeInterfaceToken(AtomicWorkbenchSourceDragData.CALLBACK); data.writeBoolean(started); data.writeBoolean(nativeFallback);
                callback.transact(IBinder.FIRST_CALL_TRANSACTION, data, null, IBinder.FLAG_ONEWAY);
            } catch (Exception ignored) { /* Source also has a bounded grant timeout. */ }
            finally { data.recycle(); }
        });
    }
}
