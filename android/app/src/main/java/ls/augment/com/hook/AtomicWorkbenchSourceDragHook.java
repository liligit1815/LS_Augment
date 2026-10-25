package ls.augment.com.hook;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import io.github.libxposed.api.XposedInterface.ExceptionMode;
import ls.augment.com.AtomicWorkbenchSourceDragData;

/** Adapts an app's real GLOBAL drag only while the workbench owns that exact physical touch. */
final class AtomicWorkbenchSourceDragHook {
    private static final String MODULE = "ls.augment.com";
    private static final Uri BRIDGE = Uri.parse("content://ls.augment.com.workbench");
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<IBinder, Touch> TOUCHES = new WeakHashMap<>();
    private static final ThreadLocal<Boolean> ORIGINAL = new ThreadLocal<>();
    // Admission permits up to 30s of source preparation, then the host owns a
    // 120s system drag. Normal END revokes immediately; this only bounds lost callbacks.
    private static final long LOST_COMPLETION_TIMEOUT_MS = 165_000L;
    private static boolean installed;
    private static final class Touch {
        final WeakReference<Window> window;
        final long down;
        boolean held = true, claimed;
        Touch(Window window, long down) { this.window = new WeakReference<>(window); this.down = down; }
    }

    static synchronized void install(AugmentModule module) {
        if (installed) return;
        try {
            for (Class<?> type : new Class<?>[]{Activity.class, Dialog.class}) {
                Method touch = type.getDeclaredMethod("dispatchTouchEvent", MotionEvent.class);
                module.deoptimize(touch);
                module.registerFeatureHook(module.prepareFeatureHook(touch, "atomic_workbench.source_touch", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    Object owner = chain.getThisObject();
                    Window window = owner instanceof Activity ? ((Activity) owner).getWindow() : ((Dialog) owner).getWindow();
                    observe(window, (MotionEvent) chain.getArg(0));
                    return chain.proceed();
                }));
            }
            Method drag = View.class.getDeclaredMethod("startDragAndDrop", ClipData.class, View.DragShadowBuilder.class, Object.class, int.class);
            module.deoptimize(drag);
            module.registerFeatureHook(module.prepareFeatureHook(drag, "atomic_workbench.source_drag", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                if (!Boolean.TRUE.equals(ORIGINAL.get()) && handoff((View) chain.getThisObject(), (ClipData) chain.getArg(0),
                        (View.DragShadowBuilder) chain.getArg(1), chain.getArg(2), (Integer) chain.getArg(3))) return true;
                return chain.proceed();
            }));
            installed = true;
            module.logFeatureInfo("ATOMIC_WORKBENCH_SOURCE_DRAG_INSTALLED native_global=true;fullscreen=passthrough");
        } catch (Throwable unavailable) { module.logFeatureInfo("ATOMIC_WORKBENCH_SOURCE_DRAG_UNAVAILABLE signature_missing=true"); }
    }

    private static void observe(Window window, MotionEvent event) {
        if (window == null || event == null || window.getDecorView().getDisplay() == null
                || window.getDecorView().getDisplay().getDisplayId() <= 0) return;
        IBinder token = window.getDecorView().getWindowToken(); if (token == null) return;
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN && event.getPointerCount() == 1) TOUCHES.put(token, new Touch(window, event.getDownTime()));
        else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL || event.getPointerCount() != 1) {
            Touch touch = TOUCHES.remove(token); if (touch != null) touch.held = false;
        }
    }

    private static boolean handoff(View source, ClipData original, View.DragShadowBuilder shadow, Object local, int flags) {
        if (Looper.myLooper() != Looper.getMainLooper() || source == null || !source.isAttachedToWindow()
                || source.getDisplay() == null || source.getDisplay().getDisplayId() <= 0
                || (flags & View.DRAG_FLAG_GLOBAL) == 0 || local != null) return false;
        Touch touch = TOUCHES.get(source.getWindowToken());
        Window window = touch == null ? null : touch.window.get();
        long age = touch == null ? -1 : SystemClock.uptimeMillis() - touch.down;
        if (touch == null || !touch.held || touch.claimed || window == null || age < 200 || age > 30_000
                || (window.getAttributes().flags & WindowManager.LayoutParams.FLAG_SECURE) != 0) return false;
        Context context = source.getContext(); ArrayList<Uri> granted = new ArrayList<>();
        Completion completion = null;
        try {
            AtomicWorkbenchSourceDragData payload = AtomicWorkbenchSourceDragData.read(original);
            if (!payload.uris.isEmpty() && (flags & View.DRAG_FLAG_GLOBAL_URI_READ) == 0) return false;
            Bundle probe = new Bundle(); probe.putInt("version", 1); probe.putInt("display", source.getDisplay().getDisplayId()); probe.putLong("down", touch.down);
            Bundle lease = context.getContentResolver().call(BRIDGE, AtomicWorkbenchSourceDragData.PROBE, null, probe);
            String ticket = lease == null ? null : lease.getString("ticket");
            if (ticket == null || !ticket.matches("[0-9a-f]{32}") || !touch.held) return false;
            int moduleUid = lease.getInt("owner_uid", -1);
            if (moduleUid < 10000 || moduleUid / 100000 != android.os.Process.myUid() / 100000) return false;
            for (Uri uri : payload.uris) {
                if (context.checkUriPermission(uri, -1, moduleUid, Intent.FLAG_GRANT_READ_URI_PERMISSION) == PackageManager.PERMISSION_GRANTED) continue;
                context.grantUriPermission(MODULE, uri, Intent.FLAG_GRANT_READ_URI_PERMISSION); granted.add(uri);
            }
            completion = new Completion(context, source, touch, original, shadow, flags, moduleUid, granted);
            Bundle offer = new Bundle(); offer.putInt("version", 1); offer.putString("ticket", ticket);
            offer.putParcelable("clip", payload.clip); offer.putBinder("completion", completion);
            touch.claimed = true;
            // Once sent, an unknown result cannot safely retry the native drag. The host callback resolves it.
            completion.sent = true;
            Bundle result = context.getContentResolver().call(BRIDGE, AtomicWorkbenchSourceDragData.OFFER, null, offer);
            if (result != null && result.containsKey("accepted") && !result.getBoolean("accepted")) {
                completion.finish(false, false); touch.claimed = false; return false;
            }
            Completion retained = completion;
            MAIN.postDelayed(() -> retained.finish(false, false), LOST_COMPLETION_TIMEOUT_MS);
            return true;
        } catch (Exception unavailable) {
            if (completion != null && completion.sent) { Completion retained = completion; MAIN.postDelayed(() -> retained.finish(false, false), LOST_COMPLETION_TIMEOUT_MS); return true; }
            for (Uri uri : granted) try { context.revokeUriPermission(MODULE, uri, Intent.FLAG_GRANT_READ_URI_PERMISSION); } catch (RuntimeException ignored) { }
            return false;
        }
    }

    private static final class Completion extends Binder {
        final Context context; final WeakReference<View> source; final Touch touch; final ClipData clip;
        final View.DragShadowBuilder shadow; final int flags, moduleUid; final ArrayList<Uri> granted;
        final AtomicBoolean done = new AtomicBoolean(); boolean sent;
        Completion(Context context, View source, Touch touch, ClipData clip, View.DragShadowBuilder shadow, int flags, int moduleUid, ArrayList<Uri> granted) {
            this.context = context; this.source = new WeakReference<>(source); this.touch = touch; this.clip = clip;
            this.shadow = shadow; this.flags = flags; this.moduleUid = moduleUid; this.granted = granted;
        }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int txFlags) {
            if (code != FIRST_CALL_TRANSACTION || Binder.getCallingUid() != moduleUid || (txFlags & FLAG_ONEWAY) == 0) return false;
            data.enforceInterface(AtomicWorkbenchSourceDragData.CALLBACK); boolean started = data.readBoolean();
            boolean nativeFallback = data.readBoolean(); data.enforceNoDataAvail();
            MAIN.post(() -> finish(started, nativeFallback)); return true;
        }
        void finish(boolean started, boolean explicit) {
            if (!done.compareAndSet(false, true)) return;
            for (Uri uri : granted) try { context.revokeUriPermission(MODULE, uri, Intent.FLAG_GRANT_READ_URI_PERMISSION); } catch (RuntimeException ignored) { }
            View view = source.get();
            if (!started && explicit && touch.held && view != null && view.isAttachedToWindow() && SystemClock.uptimeMillis() - touch.down <= 30_000L) {
                ORIGINAL.set(true);
                try { view.startDragAndDrop(clip, shadow, null, flags); } catch (RuntimeException ignored) { }
                finally { ORIGINAL.remove(); }
            }
        }
    }
}
