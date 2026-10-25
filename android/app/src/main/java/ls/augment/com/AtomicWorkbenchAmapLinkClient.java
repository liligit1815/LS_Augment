package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Base64;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONObject;

/** A normal, phone-local LinkSDK listener, leased exclusively by the visible workbench. */
final class AtomicWorkbenchAmapLinkClient {
    private static final String SERVICE = "com.amap.bundle.wearable.connect.glass.AmapLinkService";
    private static final String CONTROL = "com.amap.linksdk.aidldefine.ILinkSdkControl";
    private static final String CALLBACK = "com.amap.linksdk.aidldefine.ILinkSdkCallback";
    private final Context context;
    private final long started;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService worker = Executors.newSingleThreadExecutor(action -> {
        Thread thread = new Thread(action, "Duo-AmapLink"); thread.setDaemon(true); return thread;
    });
    private final AtomicReference<Delivery> latest = new AtomicReference<>();
    private final AtomicBoolean draining = new AtomicBoolean();
    private final Callback callback = new Callback();
    private volatile boolean closed, bound;
    private volatile int mapUid = -1;
    private volatile long touched;
    private volatile IBinder control;
    private volatile ParcelFileDescriptor reading;
    private volatile Frame frame;
    private long route;
    private volatile boolean routeEnded;
    private volatile long routeEpoch;
    private final Runnable leaseCheck = this::checkLease;

    private static final class Frame {
        final Bundle metrics;
        final long sampled;
        Frame(Bundle metrics, long sampled) { this.metrics = new Bundle(metrics); this.sampled = sampled; }
    }
    private static final class Delivery {
        final String payload;
        final ParcelFileDescriptor fd;
        final long epoch;
        final long sampled = SystemClock.elapsedRealtime();
        Delivery(String payload, ParcelFileDescriptor fd, long epoch) { this.payload = payload; this.fd = fd; this.epoch = epoch; }
    }

    AtomicWorkbenchAmapLinkClient(Context context, long started) {
        Context application = context.getApplicationContext();
        this.context = application == null ? context : application;
        this.started = started;
        touched = SystemClock.elapsedRealtime();
        main.postDelayed(leaseCheck, AtomicWorkbenchAmapData.CONSUMER_MAX_AGE_MS);
        submit(this::bind);
    }

    boolean isClosed() { return closed; }
    void touch() { if (!closed) touched = SystemClock.elapsedRealtime(); }
    void clearFrame() { frame = null; }

    synchronized void routeState(long next, boolean ended) {
        if (next <= 0L || next < route || next == route && routeEnded && !ended) return;
        if (next != route || ended != routeEnded) { ++routeEpoch; frame = null; }
        route = next; routeEnded = ended;
        if (ended) frame = null;
    }

    private void checkLease() {
        long now = SystemClock.elapsedRealtime();
        if (closed) return;
        if (now < touched || now - touched > AtomicWorkbenchAmapData.CONSUMER_MAX_AGE_MS) close();
        else main.postDelayed(leaseCheck, Math.max(1L,
                AtomicWorkbenchAmapData.CONSUMER_MAX_AGE_MS - (now - touched) + 1L));
    }

    private void bind() {
        if (closed) return;
        try {
            mapUid = context.getPackageManager().getApplicationInfo(AtomicWorkbenchAmapData.PACKAGE, 0).uid;
            if (mapUid / 100000 != android.os.Process.myUid() / 100000) { close(); return; }
            Intent intent = new Intent("com.autonavi.minimap.service.NAVIGATION_SERVICE")
                    .setComponent(new ComponentName(AtomicWorkbenchAmapData.PACKAGE, SERVICE));
            boolean connected = context.bindService(intent, connection, Context.BIND_AUTO_CREATE);
            bound = connected;
            if (closed && connected) unbind();
        } catch (Exception unavailable) { close(); }
    }

    private final ServiceConnection connection = new ServiceConnection() {
        @Override public void onServiceConnected(ComponentName name, IBinder service) {
            if (closed || !AtomicWorkbenchAmapData.PACKAGE.equals(name.getPackageName())
                    || !SERVICE.equals(name.getClassName())) return;
            submit(() -> {
                if (closed) return;
                try {
                    if (!CONTROL.equals(service.getInterfaceDescriptor())) { close(); return; }
                    control = service;
                    // Authentication success alone is not treated as proof of a navigation frame.
                    transact(1, null);
                    if (!Boolean.TRUE.equals(transact(3, callback))) close();
                } catch (Exception unavailable) { close(); }
            });
        }
        @Override public void onServiceDisconnected(ComponentName name) { close(); }
        @Override public void onBindingDied(ComponentName name) { close(); }
        @Override public void onNullBinding(ComponentName name) { close(); }
    };

    private Object transact(int code, IInterface listener) throws RemoteException {
        IBinder target = control;
        if (target == null || !target.isBinderAlive()) throw new RemoteException("link_unavailable");
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(CONTROL);
            if (listener != null) data.writeStrongBinder(listener.asBinder());
            if (!target.transact(code, data, reply, 0)) throw new RemoteException("link_contract");
            reply.readException();
            return code == 1 ? reply.readString() : reply.readInt() != 0;
        } finally { reply.recycle(); data.recycle(); }
    }

    private final class Callback extends Binder implements IInterface {
        Callback() { attachInterface(this, CALLBACK); }
        @Override public IBinder asBinder() { return this; }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == INTERFACE_TRANSACTION) { if (reply != null) reply.writeString(CALLBACK); return true; }
            if (code != 1 && code != 2) return super.onTransact(code, data, reply, flags);
            if (closed || Binder.getCallingUid() != mapUid || mapUid < 0) throw new SecurityException("link_sender");
            data.enforceInterface(CALLBACK);
            String payload = data.readString();
            ParcelFileDescriptor fd = code == 2 && data.readInt() != 0
                    ? ParcelFileDescriptor.CREATOR.createFromParcel(data) : null;
            if (data.dataAvail() != 0) { release(fd); throw new SecurityException("link_shape"); }
            if (payload != null && payload.length() > AtomicWorkbenchAmapLinkData.MAX_PAYLOAD_CHARS) release(fd);
            else offer(new Delivery(payload, fd, routeEpoch));
            if (reply != null) reply.writeNoException();
            return true;
        }
    }

    private synchronized void offer(Delivery delivery) {
        if (closed) { release(delivery.fd); return; }
        Delivery previous = latest.getAndSet(delivery);
        if (previous != null) release(previous.fd);
        if (draining.compareAndSet(false, true)) submit(this::drain);
    }

    private void drain() {
        try {
            Delivery delivery;
            while (true) {
                synchronized (this) {
                    if (closed || (delivery = latest.getAndSet(null)) == null) break;
                    if (delivery.fd != null) reading = delivery.fd;
                }
                try {
                    if (delivery.fd == null) accept(delivery.payload, delivery.sampled, delivery.epoch);
                    else {
                        try (ParcelFileDescriptor.AutoCloseInputStream input = new ParcelFileDescriptor.AutoCloseInputStream(delivery.fd);
                                ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                            byte[] buffer = new byte[8192]; int count, total = 0;
                            while ((count = input.read(buffer)) != -1) {
                                total += count;
                                if (total > AtomicWorkbenchAmapLinkData.MAX_PAYLOAD_CHARS) throw new IllegalArgumentException("link_size");
                                output.write(buffer, 0, count);
                            }
                            accept(output.toString(StandardCharsets.UTF_8.name()), delivery.sampled, delivery.epoch);
                        } finally { reading = null; release(delivery.fd); }
                    }
                } catch (Exception malformed) { /* Never record a payload or its exception message. */ }
            }
        } finally {
            draining.set(false);
            if (!closed && latest.get() != null && draining.compareAndSet(false, true)) submit(this::drain);
        }
    }

    private void accept(String payload, long sampled, long epoch) throws Exception {
        if (closed || routeEnded || epoch != routeEpoch || sampled < started
                || !AtomicWorkbenchAmapData.fresh(SystemClock.elapsedRealtime(), sampled)) return;
        if (payload == null || payload.isEmpty()) return;
        JSONObject root = new JSONObject(payload);
        String plain = payload;
        if (root.optBoolean("encrypted", false)) {
            byte[] bytes = Base64.decode(root.getString("content"), Base64.DEFAULT);
            if (bytes.length > AtomicWorkbenchAmapLinkData.MAX_PAYLOAD_CHARS) return;
            ByteBuffer input = ByteBuffer.wrap(bytes);
            int aadSize = input.getInt();
            if (aadSize < 0 || aadSize > 1024 || input.remaining() < aadSize + 4) return;
            byte[] aad = new byte[aadSize]; input.get(aad);
            int keySize = input.getInt();
            if ((keySize != 16 && keySize != 24 && keySize != 32) || input.remaining() < keySize + 28) return;
            byte[] key = new byte[keySize], nonce = new byte[12]; input.get(key); input.get(nonce);
            byte[] encrypted = new byte[input.remaining()]; input.get(encrypted);
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            try {
                cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new GCMParameterSpec(128, nonce));
                cipher.updateAAD(aad);
                plain = new String(cipher.doFinal(encrypted), StandardCharsets.UTF_8);
            } finally { Arrays.fill(key, (byte) 0); }
        }
        Bundle metrics = AtomicWorkbenchAmapLinkData.parse(plain);
        synchronized (this) {
            if (metrics != null && !closed && !routeEnded && epoch == routeEpoch) frame = new Frame(metrics, sampled);
        }
    }

    Bundle merge(Bundle fallback) {
        String status = fallback == null ? "" : fallback.getString("navigation_status", "");
        if (fallback == null || !fallback.getBoolean("owner_user_current", false)
                || !Arrays.asList("active", "no_navigation", "no_guidance", "permission_denied", "unsupported", "temporary_error").contains(status)) {
            clearFrame(); return fallback;
        }
        Frame current = frame;
        long now = SystemClock.elapsedRealtime();
        if (closed || routeEnded || current == null || now < touched || now - touched > AtomicWorkbenchAmapData.CONSUMER_MAX_AGE_MS
                || !AtomicWorkbenchAmapData.fresh(now, current.sampled)) { clearFrame(); return fallback; }
        if ("amap_memory_structured".equals(fallback.getString("navigation_source", ""))
                && fallback.getLong("navigation_elapsed", Long.MAX_VALUE) >= current.sampled) return fallback;
        Bundle result = new Bundle();
        result.putBoolean("success", true); result.putBoolean("available", true); result.putBoolean("owner_user_current", true);
        result.putBoolean("active", true); result.putBoolean("has_session", true); result.putBoolean("has_guidance", true);
        result.putString("navigation_status", "active"); result.putString("navigation_source", "amap_link_structured");
        result.putLong("navigation_elapsed", current.sampled);
        result.putString("package", AtomicWorkbenchAmapData.PACKAGE); result.putString("title", "实时路线导航");
        Object sourceGeneration=fallback.get("navigation_source_generation");
        if(AtomicWorkbenchAmapData.PACKAGE.equals(fallback.getString("package",""))&&sourceGeneration instanceof String&&((String)sourceGeneration).matches("[0-9a-f]{33,48}"))result.putString("navigation_source_generation",(String)sourceGeneration);
        result.putString("subtitle", ""); result.putString("subtext", ""); result.putString("message", "");
        result.putBundle(AtomicWorkbenchAmapData.METRICS, new Bundle(current.metrics));
        return result;
    }

    void close() {
        synchronized (this) { if (closed) return; closed = true; frame = null; }
        main.removeCallbacks(leaseCheck);
        Delivery pending = latest.getAndSet(null); if (pending != null) release(pending.fd);
        release(reading);
        submit(() -> {
            try { if (control != null) transact(4, callback); } catch (Exception ignored) { }
            control = null; unbind();
        });
        worker.shutdown();
    }

    private void unbind() {
        if (!bound) return;
        bound = false;
        try { context.unbindService(connection); } catch (RuntimeException ignored) { }
    }
    private void submit(Runnable action) { try { worker.execute(action); } catch (RuntimeException ignored) { } }
    private static void release(ParcelFileDescriptor fd) { if (fd != null) try { fd.close(); } catch (Exception ignored) { } }
}
