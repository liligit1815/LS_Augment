package ls.augment.com;

import android.content.Context;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.Process;
import android.os.RemoteException;
import android.view.InputEvent;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.Surface;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;

/** Phone-only privileged process, started from this APK after an explicit user action. */
public final class AtomicWorkbenchRoot extends Binder {
    // IBinder.FLAG_COLLECT_NOTED_APP_OPS is hidden in SDK 36; BinderProxy may add it to synchronous calls.
    private static final int BINDER_FLAG_COLLECT_NOTED_APP_OPS = 0x2;
    // Native IPCThreadState adds TF_ACCEPT_FDS before transmitting either synchronous or one-way calls.
    private static final int BINDER_FLAG_ACCEPT_FDS = 0x10;
    private final Context context;
    private final int appUid, userId;
    private final String token;
    private final HandlerThread engineThread = new HandlerThread("DuoAtomicWorkbench");
    private final Handler engine;
    private final ArrayDeque<WindowInput> inputs = new ArrayDeque<>();
    private volatile AtomicWorkbenchEngine backend;
    private AtomicWorkbenchMedia media;
    private AtomicWorkbenchNotifications notifications;
    private AtomicWorkbenchNavigation navigation;
    private AtomicWorkbenchPasteHost pasteHost;
    private AtomicWorkbenchExtractionGeometryTransport extractionGeometry;
    private boolean extractionGeometryCleanupPending;
    private volatile AtomicWorkbenchExtractionGeometryFence extractionGeometryFence;
    private final java.util.concurrent.atomic.AtomicLong minimumExtractionGeometryRevision = new java.util.concurrent.atomic.AtomicLong();
    private final java.util.concurrent.atomic.AtomicBoolean extractionInvalidationQueued = new java.util.concurrent.atomic.AtomicBoolean();
    private final java.util.concurrent.atomic.AtomicBoolean taskShelfIngressObserved = new java.util.concurrent.atomic.AtomicBoolean();
    private boolean pasteHostRetired;
    private IBinder owner;
    private volatile long providerSession = -1L;
    private volatile long providerResetGeneration = -1L;
    private final java.util.concurrent.CountDownLatch registrationReady = new java.util.concurrent.CountDownLatch(1);
    private volatile boolean registered;
    private final IBinder.DeathRecipient ownerDeath = () -> {
        lifecycle("ROOT_OWNER_DIED", "owner_bound=true", null);
        requestRecovery("owner_died");
    };
    private volatile boolean closing, finished;
    private volatile String inputFailure = "";
    private boolean inputScheduled;
    private int recoveryAttempt;
    private int taskBackendRetryAttempt;
    private long taskBackendRetryElapsed;
    private volatile String closeReason = "none";
    private volatile boolean focusPrimaryHomeOnClose;

    private AtomicWorkbenchRoot(Context context, int appUid, int userId, String token) {
        this.context = context;
        this.appUid = appUid;
        this.userId = userId;
        this.token = token;
        attachInterface(null, AtomicWorkbenchProtocol.DESCRIPTOR);
        engineThread.start();
        engine = new Handler(engineThread.getLooper());
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            lifecycle("ROOT_PROCESS_SHUTDOWN", "closing=" + closing + ";finished=" + finished, null);
            AtomicWorkbenchDiagnostics.flush(250L);
        }, "DuoAtomicShutdownEvidence"));
        Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, failure) -> {
            lifecycle("ROOT_UNCAUGHT", "engine_thread=" + (thread == engineThread) + ";finished=" + finished, failure);
            AtomicWorkbenchDiagnostics.flush(250L);
            try {
                if (thread != engineThread) requestRecovery("uncaught");
                if (previous != null) previous.uncaughtException(thread, failure);
            } finally {
                // A dead engine cannot restore journals. Let system_server observe owner death;
                // the next root retains the durable recovery obligations instead of hanging alive.
                lifecycle("ROOT_PROCESS_ABORT", "recovery_confirmed=false;exit_code=10", null);
                AtomicWorkbenchDiagnostics.flush(250L);
                System.exit(10);
            }
        });
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    public static void main(String[] ignored) {
        if (Process.myUid() != 0) return;
        AtomicWorkbenchRoot endpoint = null;
        String startupStage = "hidden_api";
        int diagnosticUser = -1;
        try {
            exemptRootHiddenApis();
            if (Looper.myLooper() == null) Looper.prepareMainLooper();
            startupStage = "bootstrap";
            JSONObject boot = new JSONObject(readBootstrap());
            String token = boot.getString("token");
            int uid = boot.getInt("uid"), user = boot.getInt("user");
            if (boot.getInt("version") != AtomicWorkbenchProtocol.VERSION
                    || !AtomicWorkbenchProtocol.AUTHORITY.equals(boot.getString("authority"))
                    || !token.matches("[0-9a-f]{64}") || uid < 10000 || uid / 100000 != user)
                throw new SecurityException("invalid bootstrap");
            diagnosticUser = user;
            startupStage = "system_context";
            AtomicWorkbenchDiagnostics.emit("ROOT_START", -1, user, "", -1, "stage=" + startupStage, null);
            Object thread = Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
            Context context = (Context) thread.getClass().getMethod("getSystemContext").invoke(thread);
            Method packageUid = context.getPackageManager().getClass().getMethod(
                    "getPackageUidAsUser", String.class, int.class);
            int actualUid = (Integer) packageUid.invoke(context.getPackageManager(), AtomicWorkbenchProtocol.PACKAGE, user);
            if (uid != actualUid) throw new SecurityException("application UID mismatch");
            startupStage = "provider_registration";
            endpoint = new AtomicWorkbenchRoot(context, uid, user, token);
            Bundle request = new Bundle();
            request.putInt("version", AtomicWorkbenchProtocol.VERSION);
            request.putString("token", token);
            request.putInt("uid", uid);
            request.putInt("user", user);
            request.putBinder("endpoint", endpoint);
            Bundle accepted = registerEndpoint(user, request);
            if (accepted == null || !accepted.getBoolean("success") || accepted.getBinder("owner") == null)
                throw new SecurityException("registration rejected");
            endpoint.completeRegistration(accepted);
            AtomicWorkbenchDiagnostics.emit("ROOT_READY", -1, user, "", -1, "owner_bound=true", null);
            Looper.loop();
        } catch (Throwable error) {
            if (endpoint != null) endpoint.registrationReady.countDown();
            AtomicWorkbenchDiagnostics.emit("ROOT_START_FAILED", -1, diagnosticUser, "", -1,
                    "stage=" + startupStage, cause(error));
            // Structured diagnostics omit credentials and never block task recovery on pipe I/O.
            if (endpoint != null && endpoint.hasOwner()) {
                endpoint.requestRecovery("startup_failure");
                // Recovery owns the process until its displays have been made safe.
                if (Looper.myLooper() != null && !endpoint.finished) Looper.loop();
            }
        }
        AtomicWorkbenchDiagnostics.emit("ROOT_LOOP_EXIT", -1, diagnosticUser, "", -1,
                "endpoint_created=" + (endpoint != null) + ";finished=" + (endpoint != null && endpoint.finished), null);
        AtomicWorkbenchDiagnostics.flush(250L);
        System.exit(0);
    }

    private static String readBootstrap() throws Exception {
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in, java.nio.charset.StandardCharsets.UTF_8));
        StringBuilder value = new StringBuilder();
        int next;
        while ((next = input.read()) != -1 && next != '\n') {
            if (value.length() >= 4096) throw new IllegalArgumentException("bootstrap too large");
            value.append((char) next);
        }
        return value.toString();
    }


    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi
    private static void exemptRootHiddenApis() throws Exception {
        Class<?> runtime = Class.forName("dalvik.system.VMRuntime");
        Object vm = runtime.getDeclaredMethod("getRuntime").invoke(null);
        runtime.getDeclaredMethod("setHiddenApiExemptions", String[].class)
                .invoke(vm, (Object) new String[]{"L"});
    }

    /** Mirrors the platform content command, without pretending UID 0 is the app. */
    private static Bundle registerEndpoint(int user, Bundle extras) throws Exception {
        return callWorkbenchProvider(user, AtomicWorkbenchProtocol.REGISTER, extras);
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static Bundle callWorkbenchProvider(int user, String method, Bundle extras) throws Exception {
        Object am = Class.forName("android.app.ActivityManager").getMethod("getService").invoke(null);
        IBinder access = new Binder();
        String authority = AtomicWorkbenchProtocol.AUTHORITY;
        Method acquire = am.getClass().getMethod("getContentProviderExternal",
                String.class, int.class, IBinder.class, String.class);
        Method release = am.getClass().getMethod("removeContentProviderExternalAsUser",
                String.class, IBinder.class, int.class);
        Object holder = acquire.invoke(am, authority, user, access, "duo-atomic-workbench");
        if (holder == null) throw new IllegalStateException("provider unavailable");
        try {
            Field providerField = holder.getClass().getField("provider");
            Object provider = providerField.get(holder);
            Class<?> attribution = Class.forName("android.content.AttributionSource");
            java.lang.reflect.Constructor<?> constructor = attribution.getDeclaredConstructor(int.class, String.class, String.class);
            constructor.setAccessible(true);
            Object source = constructor.newInstance(0, "root", null);
            Method call = Class.forName("android.content.IContentProvider").getMethod("call",
                    attribution, String.class, String.class, String.class, Bundle.class);
            return (Bundle) call.invoke(provider, source, authority, method, null, extras);
        } finally {
            release.invoke(am, authority, access, user);
        }
    }

    private Bundle readHomeReadiness(Bundle identity) throws Exception {
        Bundle query = new Bundle(identity);
        query.putInt("version", AtomicWorkbenchProtocol.VERSION); query.putInt("uid", appUid); query.putInt("user", userId);
        query.putString("token", token); query.putBinder("endpoint", this); query.putLong("session", providerSession);
        return callWorkbenchProvider(userId, AtomicWorkbenchProvider.HOME_READINESS, query);
    }

    private Bundle controlInputFocus(String action, Bundle identity) throws Exception {
        Bundle released = confirmDeadFocusOwnerCleanup(action, identity);
        if (released != null) return released;
        IBinder bound;
        synchronized (this) { bound = owner; }
        if (bound != null && !bound.isBinderAlive())
            throw new IllegalStateException("窗口所属应用进程已结束，等待工作区显示实际移除");
        Bundle query = new Bundle(identity);
        query.putInt("version", AtomicWorkbenchProtocol.VERSION); query.putInt("uid", appUid); query.putInt("user", userId);
        query.putString("token", token); query.putBinder("endpoint", this); query.putLong("session", providerSession);
        query.putString("focus_action", action);
        return callWorkbenchProvider(userId, AtomicWorkbenchProvider.FOCUS_CONTROL, query);
    }

    private boolean inputSessionCurrent(long session, long reset) throws Exception {
        return (backend == null || !backend.uiParked()) && registeredSessionCurrent(session, reset);
    }

    private boolean registeredSessionCurrent(long session, long reset) throws Exception {
        IBinder bound;
        synchronized (this) { bound = owner; }
        if (closing || finished || currentUserId() != userId || !registered || session != providerSession || reset != providerResetGeneration
                || bound == null || !bound.isBinderAlive()) return false;
        Bundle query = new Bundle();
        query.putInt("version", AtomicWorkbenchProtocol.VERSION); query.putInt("uid", appUid); query.putInt("user", userId);
        query.putString("token", token); query.putBinder("endpoint", this); query.putLong("session", session);
        query.putLong("reset_generation", reset);
        Bundle state = callWorkbenchProvider(userId, AtomicWorkbenchProvider.INPUT_SESSION, query);
        return state != null && state.getBoolean("current", false) && currentUserId() == userId;
    }

    private void requireReferenceSession() throws Exception {
        if(closing||finished||!registeredSessionCurrent(providerSession,providerResetGeneration)||closing||finished)
            throw new SecurityException("task_reference_session_changed");
    }

    /** Transient broker credential: never put it in a task record, UI bundle or diagnostic. */
    private Bundle systemSessionMetadata() throws Exception {
        IBinder bound;
        synchronized (this) { bound = owner; }
        // Existing resource cleanup must still authenticate after closing/reset/user switch.
        // Every broker independently requires a fresh current permit for new mutations.
        if (!registered || finished || providerSession < 0 || providerResetGeneration < 0
                || bound == null || !bound.isBinderAlive()) throw new SecurityException("工作台系统会话已失效");
        Bundle query = new Bundle();
        query.putInt("version", AtomicWorkbenchProtocol.VERSION);
        query.putInt("uid", appUid); query.putInt("user", userId);
        query.putLong("session", providerSession); query.putLong("reset_generation", providerResetGeneration);
        query.putInt("root_pid", Process.myPid()); query.putBinder("endpoint", this); query.putString("token", token);
        query.putString("nonce", java.util.UUID.randomUUID().toString().replace("-", ""));
        if (finished || !registered || !bound.isBinderAlive()) throw new SecurityException("工作台系统会话已失效");
        return query;
    }

    /** Cleanup-only credentials for the original dead app owner; never a new session permit. */
    private Bundle retainedTaskCleanupMetadata() throws Exception {
        IBinder bound;
        synchronized (this) { bound = owner; }
        if (!closing || !registered || finished || providerSession < 0 || providerResetGeneration < 0
                || bound == null || bound.isBinderAlive()) throw new SecurityException("task_cleanup_owner_not_dead");
        Bundle query = new Bundle();
        query.putInt("version", AtomicWorkbenchProtocol.VERSION);
        query.putInt("uid", appUid); query.putInt("user", userId);
        query.putLong("session", providerSession); query.putLong("reset_generation", providerResetGeneration);
        query.putInt("root_pid", Process.myPid()); query.putBinder("endpoint", this); query.putString("token", token);
        query.putString("nonce", java.util.UUID.randomUUID().toString().replace("-", ""));
        synchronized (this) {
            if (!closing || finished || !registered || bound != owner || bound.isBinderAlive())
                throw new SecurityException("task_cleanup_owner_not_dead");
        }
        return query;
    }

    /** An app death has no surviving Provider session; certify actual server removal instead. */

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private Bundle confirmDeadFocusOwnerCleanup(String action, Bundle identity) throws Exception {
        if (!"close".equals(action) || identity == null) return null;
        IBinder bound;
        synchronized (this) { bound = owner; }
        if (bound == null || bound.isBinderAlive()) return null;
        int display = identity.getInt("display_id", -1), window = identity.getInt("window_id", -1);
        if (display <= 0 || window < 0 || window >= AtomicWorkbenchProtocol.WINDOW_POOL_COUNT) return null;
        android.hardware.display.DisplayManager manager = context.getSystemService(android.hardware.display.DisplayManager.class);
        if (manager == null || manager.getDisplay(display) != null) return null;
        Object service = Class.forName("android.view.WindowManagerGlobal").getMethod("getWindowManagerService").invoke(null);
        // WMS returns UNDEFINED only when DisplayContent is absent; a live display resolves
        // its actual nonzero mode through DisplayWindowSettings, including default settings.
        Method queryMode = service.getClass().getMethod("getWindowingMode", int.class);
        queryMode.setAccessible(true);
        Object mode = queryMode.invoke(service, display);
        if (!Integer.valueOf(0).equals(mode) || manager.getDisplay(display) != null || bound.isBinderAlive()) return null;
        Bundle result = new Bundle(); result.putBoolean("success", true);
        result.putBoolean("focus_suspended", false); result.putBoolean("cleanup_pending", false);
        result.putString("focus_reason", "owner_dead_display_removed");
        result.putString("message", "所属应用进程已结束，系统已确认工作区显示移除");
        lifecycle("FOCUS_OWNER_DEAD_CLEANED", "window=" + window + ";display=" + display
                + ";owner_dead=true;dms_absent=true;wm_mode=0", null);
        return result;
    }

    private void completeRegistration(Bundle accepted) throws RemoteException {
        long session = accepted.getLong("session", -1L);
        if (session < 0L) throw new SecurityException("registration session missing");
        providerSession = session;
        providerResetGeneration = accepted.getLong("reset_generation", -1L);
        bindOwner(accepted.getBinder("owner"));
        registered = true;
        registrationReady.countDown();
    }

    private void awaitRegistration() {
        try {
            if (!registered && !registrationReady.await(10L, TimeUnit.SECONDS) || !registered)
                throw new SecurityException("workbench registration incomplete");
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new SecurityException("workbench registration interrupted");
        }
    }

    private void bindOwner(IBinder supplied) throws RemoteException {
        boolean register;
        synchronized (this) {
            if (supplied == null || owner != null && !owner.equals(supplied))
                throw new SecurityException("workbench owner mismatch");
            register = owner == null;
            if (register) owner = supplied;
        }
        if (register) {
            supplied.linkToDeath(ownerDeath, 0);
            engine.postDelayed(checkOwner, 1000L);
        }
        if (!supplied.isBinderAlive()) requestRecovery("owner_already_dead");
    }

    private synchronized boolean hasOwner() { return owner != null; }

    // The phone's UI may be force-stopped without any Activity callback. Do not
    // rely solely on the death callback to begin returning its display tasks.
    private final Runnable checkOwner = new Runnable() {
        @Override public void run() {
            if (finished || closing) return;
            IBinder bound;
            synchronized (AtomicWorkbenchRoot.this) { bound = owner; }
            if (bound != null && !bound.isBinderAlive()) {
                lifecycle("ROOT_OWNER_UNAVAILABLE", "observation=binder_liveness", null);
                requestRecovery("owner_unavailable");
                return;
            }
            engine.postDelayed(this, 1000L);
        }
    };

    private static boolean synchronousReplyTransport(int flags, Parcel reply) {
        return (flags & ~(BINDER_FLAG_COLLECT_NOTED_APP_OPS | BINDER_FLAG_ACCEPT_FDS)) == 0 && reply != null;
    }

    private void diagnoseTaskShelfTransport(int flags, int dataSize, boolean replyPresent, boolean accepted) {
        try {
            if (!taskShelfIngressObserved.compareAndSet(false, true)) return;
            int rejected = ((flags & ~(BINDER_FLAG_COLLECT_NOTED_APP_OPS | BINDER_FLAG_ACCEPT_FDS)) != 0 ? 1 : 0)
                    | (!replyPresent ? 2 : 0) | (dataSize > 4096 ? 4 : 0);
            AtomicWorkbenchDiagnostics.emit("ATOMIC_TASK_SHELF_INGRESS", -1, userId, "", -1,
                    "owner_id=ROOT_C15_WIRE_01;diag_abi=1;stage=INGRESS;flags=" + flags + ";data_size=" + dataSize
                    + ";reply_present=" + replyPresent + ";transport_accepted=" + accepted + ";reject_mask=" + rejected, null);
        } catch (Throwable ignored) { }
    }

    @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
        if (code == INTERFACE_TRANSACTION) {
            if (reply != null) reply.writeString(AtomicWorkbenchProtocol.DESCRIPTOR);
            return true;
        }
        if (code == AtomicWorkbenchExtractionGeometryFence.TRANSACTION)
            return readExtractionGeometryFence(data, reply, flags);
        if (Binder.getCallingUid() != appUid) throw new SecurityException("workbench caller mismatch");
        data.enforceInterface(AtomicWorkbenchProtocol.DESCRIPTOR);
        if (data.readInt() != AtomicWorkbenchProtocol.VERSION
                || !AtomicWorkbenchProtocol.sameToken(token, data.readString()))
            throw new SecurityException("workbench session mismatch");
        // The Provider wakes the app before its registration reply returns here.
        // Binder workers may wait; the main Looper publishes session + owner and never waits.
        awaitRegistration();
        if (invalidatesExtractionGeometry(code)) extractionGeometryFence = null;
        if (code == AtomicWorkbenchProtocol.TX_INVALIDATE_EXTRACTION_GEOMETRY) {
            long revision = data.readLong(); data.enforceNoDataAvail();
            if (revision < 1) throw new IllegalArgumentException("invalid geometry revision");
            minimumExtractionGeometryRevision.accumulateAndGet(revision, Math::max);
            extractionGeometryFence = null;
            if (extractionInvalidationQueued.compareAndSet(false, true) && !engine.post(() -> {
                try { clearExtractionGeometry(); } finally { extractionInvalidationQueued.set(false); }
            })) extractionInvalidationQueued.set(false);
            return true;
        }
        if (code == AtomicWorkbenchProtocol.TX_TOUCH || code == AtomicWorkbenchProtocol.TX_TOUCH_WINDOW) {
            int windowId = code == AtomicWorkbenchProtocol.TX_TOUCH_WINDOW ? data.readInt() : 0;
            requireWindow(windowId);
            MotionEvent event = null;
            try {
                event = data.readTypedObject(MotionEvent.CREATOR);
                data.enforceNoDataAvail();
                if (event != null) { enqueue(windowId, event); event = null; }
            } finally { if (event != null) event.recycle(); }
            return true;
        }
        if (code == AtomicWorkbenchProtocol.TX_KEY || code == AtomicWorkbenchProtocol.TX_KEY_WINDOW) {
            int windowId = code == AtomicWorkbenchProtocol.TX_KEY_WINDOW ? data.readInt() : 0;
            requireWindow(windowId);
            KeyEvent event = data.readTypedObject(KeyEvent.CREATOR);
            data.enforceNoDataAvail();
            if (event != null && allowedKey(event.getKeyCode())) enqueue(windowId, event);
            return true;
        }
        Bundle state;
        if (code == AtomicWorkbenchProtocol.TX_OPEN || code == AtomicWorkbenchProtocol.TX_OPEN_WINDOW
                || code == AtomicWorkbenchProtocol.TX_OPEN_TASK_WINDOW || code == AtomicWorkbenchProtocol.TX_NATIVE_HOME) {
            int windowId = code == AtomicWorkbenchProtocol.TX_OPEN ? 0 : data.readInt();
            boolean nativeHome = code == AtomicWorkbenchProtocol.TX_NATIVE_HOME;
            requireWindow(windowId);
            Surface decoded = null;
            java.util.concurrent.atomic.AtomicBoolean consumed = new java.util.concurrent.atomic.AtomicBoolean();
            try {
                IBinder supplied = data.readStrongBinder();
                decoded = data.readTypedObject(Surface.CREATOR);
                final Surface surface = decoded;
                int width = data.readInt(), height = data.readInt(), density = data.readInt();
                String component = nativeHome ? null : data.readString();
                int originalTaskId = code == AtomicWorkbenchProtocol.TX_OPEN_TASK_WINDOW ? data.readInt() : -1;
                if (code == AtomicWorkbenchProtocol.TX_OPEN_TASK_WINDOW && originalTaskId < 1)
                    throw new IllegalArgumentException("invalid original task");
                data.enforceNoDataAvail();
                bindOwner(supplied);
                if (nativeHome) clearInputs();
                if (closing) {
                    if (surface != null) surface.release();
                    consumed.set(true);
                    state = AtomicWorkbenchProtocol.failure("工作台正在恢复任务");
                } else state = execute(() -> {
                    consumed.set(true);
                    // Owner death/timeout can precede this queued operation.
                    if (uiInputUnavailable()) {
                        if (surface != null) surface.release();
                        return AtomicWorkbenchProtocol.failure("工作台已开始恢复，启动请求已取消");
                    }
                    if (nativeHome) return backend().showNativeHome(windowId, surface, width, height, density);
                    return originalTaskId > 0 ? backend().openTaskWindow(windowId, surface, width, height, density, component, originalTaskId)
                            : backend().openWindow(windowId, surface, width, height, density, component);
                });
            } catch (Throwable failure) {
                state = failureState(failure, false);
                requestRecovery();
            } finally { if (!consumed.get() && decoded != null) decoded.release(); }
        } else if (code == AtomicWorkbenchProtocol.TX_OPEN_MEDIA) {
            int id = data.readInt(); requireWindow(id);
            IBinder supplied = data.readStrongBinder();
            try (AtomicWorkbenchSurfaceHandoff incoming = new AtomicWorkbenchSurfaceHandoff(data.readTypedObject(Surface.CREATOR))) {
                int width=data.readInt(), height=data.readInt(), density=data.readInt();
                String component=data.readString(); Bundle target=data.readTypedObject(Bundle.CREATOR);
                data.enforceNoDataAvail(); bindOwner(supplied);
                state=executeInputMetadata(() -> {
                    Surface surface=incoming.take(); boolean consumed=false;
                    try {
                        if(uiInputUnavailable() || !registeredSessionCurrent(providerSession,providerResetGeneration) || !mediaOpenCurrent(target,component))
                            return mediaOpenRejected(id);
                        java.util.concurrent.atomic.AtomicBoolean rejected=new java.util.concurrent.atomic.AtomicBoolean();
                        try(AutoCloseable scope=mediaOpenBoundary(target,component,rejected)) {
                            AtomicWorkbenchEngine current=backend(); consumed=true;
                            Bundle opened=current.openWindow(id,surface,width,height,density,component);
                            if(rejected.get())opened.putBoolean("media_open_rejected",true);
                            return opened;
                        }
                    } finally {if(!consumed&&surface!=null)surface.release();}
                });
            }
        } else if (code == AtomicWorkbenchProtocol.TX_FOCUS_MEDIA) {
            int id=data.readInt(); requireWindow(id); String component=data.readString();
            Bundle target=data.readTypedObject(Bundle.CREATOR); data.enforceNoDataAvail(); clearInputs();
            state=executeInputMetadata(() -> {
                if(uiInputUnavailable() || !mediaOpenCurrent(target,component))
                    return mediaOpenRejected(id);
                try(AutoCloseable scope=mediaOpenBoundary(target,component,null)) {return backend().focusAppWindow(id,component);}
            });
        } else if (code == AtomicWorkbenchProtocol.TX_OPEN_NOTIFICATION) {
            if(!synchronousReplyTransport(flags,reply)||data.dataSize()>16384)throw new IllegalArgumentException("invalid notification open transport");
            int id = data.readInt(); requireWindow(id);
            IBinder supplied = data.readStrongBinder();
            try (AtomicWorkbenchSurfaceHandoff incoming = new AtomicWorkbenchSurfaceHandoff(data.readTypedObject(Surface.CREATOR))) {
                int width=data.readInt(), height=data.readInt(), density=data.readInt();
                String component=data.readString(); Bundle target=data.readTypedObject(Bundle.CREATOR);
                data.enforceNoDataAvail(); bindOwner(supplied);
                state=executeInputMetadata(() -> {
                    Surface surface=incoming.take(); boolean consumed=false;
                    try {
                        if(uiInputUnavailable() || !registeredSessionCurrent(providerSession,providerResetGeneration) || !notificationOpenCurrent(target,component))
                            return notificationOpenRejected(id);
                        java.util.concurrent.atomic.AtomicBoolean rejected=new java.util.concurrent.atomic.AtomicBoolean();
                        try(AutoCloseable scope=notificationOpenBoundary(target,component,rejected)) {
                            AtomicWorkbenchEngine current=backend(); consumed=true;
                            Bundle opened=current.openWindow(id,surface,width,height,density,component);
                            if(rejected.get())opened.putBoolean("notification_open_rejected",true);
                            return opened;
                        }
                    } finally {if(!consumed&&surface!=null)surface.release();}
                });
            }
        } else if (code == AtomicWorkbenchProtocol.TX_FOCUS_NOTIFICATION) {
            if(!synchronousReplyTransport(flags,reply)||data.dataSize()>4096)throw new IllegalArgumentException("invalid notification focus transport");
            int id=data.readInt(); requireWindow(id); String component=data.readString();
            Bundle target=data.readTypedObject(Bundle.CREATOR); data.enforceNoDataAvail(); clearInputs();
            state=executeInputMetadata(() -> {
                if(uiInputUnavailable() || !notificationOpenCurrent(target,component))
                    return notificationOpenRejected(id);
                try(AutoCloseable scope=notificationOpenBoundary(target,component,null)) {return backend().focusAppWindow(id,component);}
            });
        } else if (code == AtomicWorkbenchProtocol.TX_OUTPUT) {
            int windowId = data.readInt(); requireWindow(windowId);
            Bundle expected = data.readTypedObject(Bundle.CREATOR);
            long generation = data.readLong();
            try (AtomicWorkbenchSurfaceHandoff incoming = new AtomicWorkbenchSurfaceHandoff(data.readTypedObject(Surface.CREATOR))) {
                data.enforceNoDataAvail();
                state = executeInputMetadata(() -> {
                    Surface surface = incoming.take();
                    boolean consumed = false;
                    try {
                        if (closing || finished || surface != null && !registeredSessionCurrent(providerSession, providerResetGeneration))
                            return AtomicWorkbenchProtocol.failure("工作台会话已结束或配置已变化，任务已保留。");
                        AtomicWorkbenchEngine current = backend();
                        consumed = true;
                        return current.updateOutput(windowId, expected, generation, surface);
                    } finally {
                        if (!consumed && surface != null) surface.release();
                    }
                });
            }
        } else if (code == AtomicWorkbenchProtocol.TX_PARK_UI || code == AtomicWorkbenchProtocol.TX_RESUME_UI) {
            long generation = data.readLong(); data.enforceNoDataAvail();
            clearInputs();
            state = executeInputMetadata(() -> {
                if (closing || finished) return AtomicWorkbenchProtocol.failure("工作台正在恢复任务");
                if (code == AtomicWorkbenchProtocol.TX_RESUME_UI && !registeredSessionCurrent(providerSession, providerResetGeneration))
                    return AtomicWorkbenchProtocol.failure("工作台会话或配置已变化，原任务已保留，请退出恢复。");
                if (pasteHost != null && code == AtomicWorkbenchProtocol.TX_PARK_UI) {
                    pasteHostRetired = true;
                    try { pasteHost.close(); } catch (RuntimeException pending) { /* Keep its lease while parking other resources. */ }
                }
                if (code == AtomicWorkbenchProtocol.TX_PARK_UI) clearExtractionGeometry();
                Bundle result = recoveryState(code == AtomicWorkbenchProtocol.TX_PARK_UI ? backend().parkUi(generation) : backend().resumeUi(generation));
                result.putBoolean("extraction_geometry_cleanup_pending", extractionGeometryCleanupPending);
                return result;
            });
        } else if (code == AtomicWorkbenchProtocol.TX_EXTRACTION_GEOMETRY) {
            if (!synchronousReplyTransport(flags, reply) || data.dataSize() > 16 * 1024)
                throw new IllegalArgumentException("invalid extraction geometry transport");
            int action = data.readInt(); Bundle expected = data.readTypedObject(Bundle.CREATOR); data.enforceNoDataAvail();
            if (action < 1 || action > 3 || expected == null) throw new IllegalArgumentException("invalid extraction geometry action");
            Bundle frozen = new Bundle(expected);
            state = executeInputMetadata(() -> extractionGeometry(action, frozen));
        } else if (code == AtomicWorkbenchProtocol.TX_CHANGE_TASK) {
            if (!synchronousReplyTransport(flags, reply) || data.dataSize() > 16 * 1024)
                throw new IllegalArgumentException("invalid task operation transport");
            AtomicWorkbenchTaskOperationRequest request = AtomicWorkbenchTaskOperationRequest.fromBundle(
                    data.readTypedObject(Bundle.CREATOR));
            data.enforceNoDataAvail();
            final Bundle frozen = request.toBundle();
            state = executeInputMetadata(() -> {
                if (uiInputUnavailable() || !registeredSessionCurrent(providerSession, providerResetGeneration))
                    return AtomicWorkbenchProtocol.failure("工作台会话已变化，原任务已保留。");
                request.requireFresh(android.os.SystemClock.elapsedRealtime());
                return backend().changeTask(frozen);
            });
            state.putString("operation_id", request.operationId);
        } else if (code == AtomicWorkbenchProtocol.TX_TASK_OPERATION_STATE
                || code == AtomicWorkbenchProtocol.TX_CANCEL_TASK_OPERATION) {
            if (!synchronousReplyTransport(flags, reply) || data.dataSize() > 4096)
                throw new IllegalArgumentException("invalid task operation transport");
            String operationId = requireTaskOperationId(data.readString()); data.enforceNoDataAvail();
            state = executeInputMetadata(() -> {
                if (finished) return AtomicWorkbenchProtocol.failure("工作台会话已结束。");
                return code == AtomicWorkbenchProtocol.TX_CANCEL_TASK_OPERATION
                        ? backend().cancelTaskOperation(operationId) : backend().taskOperationState(operationId);
            });
            state.putString("operation_id", operationId);
        } else if (code == AtomicWorkbenchProtocol.TX_ALLOCATE_TASK_DISPLAY) {
            if (!synchronousReplyTransport(flags, reply) || data.dataSize() > 16 * 1024)
                throw new IllegalArgumentException("invalid empty task display transport");
            int id = data.readInt(); requireWindow(id); IBinder supplied = data.readStrongBinder();
            try (AtomicWorkbenchSurfaceHandoff incoming = new AtomicWorkbenchSurfaceHandoff(data.readTypedObject(Surface.CREATOR))) {
                int width = data.readInt(), height = data.readInt(), density = data.readInt();
                long generation = data.readLong(); String allocationId = requireTaskOperationId(data.readString());
                data.enforceNoDataAvail(); bindOwner(supplied);
                if (width < 1 || height < 1 || density < 1 || generation < 1)
                    throw new IllegalArgumentException("invalid empty task display dimensions");
                state = executeInputMetadata(() -> {
                    Surface surface = incoming.take(); boolean consumed = false;
                    try {
                        if (uiInputUnavailable() || !registeredSessionCurrent(providerSession, providerResetGeneration))
                            return AtomicWorkbenchProtocol.failure("工作台会话已变化，原任务已保留。");
                        AtomicWorkbenchEngine current = backend(); consumed = true;
                        return current.allocateTaskDisplay(id, surface, width, height, density, generation, allocationId);
                    } finally { if (!consumed && surface != null) surface.release(); }
                });
                state.putString("allocation_id", allocationId);
            }
        } else if (code == AtomicWorkbenchProtocol.TX_TASK_SHELF_STATE) {
            int taskShelfDataSize = data.dataSize();
            boolean taskShelfTransportAccepted = synchronousReplyTransport(flags, reply) && taskShelfDataSize <= 4096;
            diagnoseTaskShelfTransport(flags, taskShelfDataSize, reply != null, taskShelfTransportAccepted);
            if (!taskShelfTransportAccepted)
                throw new IllegalArgumentException("invalid task shelf transport");
            data.enforceNoDataAvail();
            state = executeInputMetadata(() -> finished ? AtomicWorkbenchProtocol.failure("工作台会话已结束。")
                    : backend().taskShelfState());
        } else if (code == AtomicWorkbenchProtocol.TX_TASK_REFERENCES) {
            if(!synchronousReplyTransport(flags, reply)||data.dataSize()>16*1024)
                throw new IllegalArgumentException("invalid task reference transport");
            AtomicWorkbenchTaskReferenceRequest request=AtomicWorkbenchTaskReferenceRequest.fromBundle(data.readTypedObject(Bundle.CREATOR));
            data.enforceNoDataAvail(); final Bundle frozen=request.toBundle();
            state=executeInputMetadata(()->{
                if(closing||finished||!registeredSessionCurrent(providerSession,providerResetGeneration))
                    return AtomicWorkbenchEngine.taskReferenceUnavailable(frozen,"task_reference_session_changed");
                try { request.requireFresh(android.os.SystemClock.elapsedRealtime()); }
                catch(IllegalArgumentException expired) {
                    return AtomicWorkbenchEngine.taskReferenceUnavailable(frozen,"task_reference_expired");
                }
                return backend().manageTaskReferences(frozen);
            });
            if(!state.containsKey("result")) {
                // A metadata timeout cannot say whether its queued action began. Never replay it.
                state=AtomicWorkbenchTaskReferenceResult.response(new AtomicWorkbenchTaskReferenceResult(request,
                        AtomicWorkbenchTaskReferenceResult.Status.UNCONFIRMED,0,"task_reference_transport_unconfirmed",
                        false,false,false,false,true),AtomicWorkbenchTaskReferenceSnapshot.empty(0,false,"task_reference_unavailable"),null);
            }
        } else if (code == AtomicWorkbenchProtocol.TX_FOCUS_WINDOW) {
            int windowId = data.readInt();
            if (windowId != -1) requireWindow(windowId);
            data.enforceNoDataAvail();
            clearInputs();
            state = execute(() -> uiInputUnavailable() ? AtomicWorkbenchProtocol.failure("工作台画面尚未连接")
                    : backend().focusWindow(windowId));
        } else if (code == AtomicWorkbenchProtocol.TX_HOST_INPUT) {
            data.enforceNoDataAvail();
            clearInputs();
            state = executeInputMetadata(() -> uiInputUnavailable() ? AtomicWorkbenchProtocol.failure("工作台画面尚未连接")
                    : backend().focusInputOnly(-1));
        } else if (code == AtomicWorkbenchProtocol.TX_PASTE_PREPARE
                || code == AtomicWorkbenchProtocol.TX_PASTE_VALIDATE || code == AtomicWorkbenchProtocol.TX_PASTE_RELEASE) {
            Bundle metadata = data.readTypedObject(Bundle.CREATOR);
            Bundle evidence = code == AtomicWorkbenchProtocol.TX_PASTE_VALIDATE ? data.readTypedObject(Bundle.CREATOR) : null;
            data.enforceNoDataAvail();
            if (code == AtomicWorkbenchProtocol.TX_PASTE_PREPARE) clearInputs();
            state = executeInputMetadata(() -> {
                if (code == AtomicWorkbenchProtocol.TX_PASTE_RELEASE)
                    return pasteHost == null ? AtomicWorkbenchProtocol.failure("文字填入会话不存在") : pasteHost.release(metadata);
                if (uiInputUnavailable()) return AtomicWorkbenchProtocol.failure("工作台画面尚未连接");
                if (code == AtomicWorkbenchProtocol.TX_PASTE_PREPARE) {
                    if(pasteHost().awaitingVisibleFocus(metadata))return pasteHost().prepare(metadata);
                    Bundle cancelled = backend().cancelActiveInput();
                    return cancelled.getBoolean("success") ? pasteHost().prepare(metadata) : cancelled;
                }
                return pasteHost().validate(metadata, evidence);
            });
        } else if (code == AtomicWorkbenchProtocol.TX_SHARE_EXACT) {
            Bundle target = data.readTypedObject(Bundle.CREATOR);
            Intent share = data.readTypedObject(Intent.CREATOR);
            data.enforceNoDataAvail();
            clearInputs();
            state = executeInputMetadata(() -> {
                if (uiInputUnavailable()) return AtomicWorkbenchProtocol.failure("工作台画面尚未连接");
                Bundle admitted = pasteHost().authorizeShare(target);
                if (!admitted.getBoolean("success")) return admitted;
                Bundle cancelled = backend().cancelActiveInput();
                if (!cancelled.getBoolean("success")) return cancelled;
                Intent exact = new Intent(share);
                exact.putExtra(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET, new Bundle(target));
                return backend().shareWindow(target.getInt("window", -1), exact, target.getString("package", ""));
            });
        } else if (code == AtomicWorkbenchProtocol.TX_NAVIGATION_STATE) {
            data.enforceNoDataAvail();
            state = execute(() -> closing || finished ? AtomicWorkbenchNavigation.closed() : navigation().state());
        } else if (code == AtomicWorkbenchProtocol.TX_FOCUS_APP) {
            int windowId = data.readInt();
            requireWindow(windowId);
            String component = data.readString();
            data.enforceNoDataAvail();
            AtomicWorkbenchProtocol.requireFocusComponent(component);
            clearInputs();
            state = execute(() -> uiInputUnavailable() ? AtomicWorkbenchProtocol.failure("工作台画面尚未连接")
                    : backend().focusAppWindow(windowId, component));
        } else if (code == AtomicWorkbenchProtocol.TX_SHARE_WINDOW) {
            int windowId = data.readInt();
            requireWindow(windowId);
            Intent share = data.readTypedObject(Intent.CREATOR);
            String packageName = data.readString();
            data.enforceNoDataAvail();
            clearInputs();
            state = execute(() -> uiInputUnavailable() ? AtomicWorkbenchProtocol.failure("工作台画面尚未连接")
                    : backend().shareWindow(windowId, share, packageName));
        } else if (code == AtomicWorkbenchProtocol.TX_NOTIFICATION_STATE) {
            data.enforceNoDataAvail();
            state = executeInputMetadata(() -> closing || finished ? closedNotifications() : notifications().state());
        } else if (code == AtomicWorkbenchProtocol.TX_NOTIFICATION_ACTION) {
            if(!synchronousReplyTransport(flags,reply)||data.dataSize()>4096)throw new IllegalArgumentException("invalid notification action transport");
            String operation=data.readString();Bundle metadata=data.readTypedObject(Bundle.CREATOR);data.enforceNoDataAvail();
            Bundle frozen=metadata==null?null:new Bundle(metadata);
            state=executeInputMetadata(()->closing||finished?closedNotifications():"state".equals(operation)?notifications().stateWithActions(frozen):notifications().action(operation,frozen));
        } else if (code == AtomicWorkbenchProtocol.TX_RECORD_TIMER) {
            if (!synchronousReplyTransport(flags, reply) || data.dataSize() > 4096)
                throw new IllegalArgumentException("invalid timer record transport");
            Bundle metadata = data.readTypedObject(Bundle.CREATOR); data.enforceNoDataAvail();
            Bundle frozen = metadata == null ? null : new Bundle(metadata);
            state = executeInputMetadata(() -> closing || finished ? closedNotifications() : notifications().recordTimer(frozen));
        } else if (code == AtomicWorkbenchProtocol.TX_MEDIA_STATE) {
            data.enforceNoDataAvail();
            state = executeInputMetadata(() -> closing || finished ? AtomicWorkbenchMedia.closed() : media().state());
        } else if (code == AtomicWorkbenchProtocol.TX_MEDIA_COMMAND) {
            String command = data.readString(), sessionId = data.readString();
            data.enforceNoDataAvail();
            AtomicWorkbenchProtocol.requireMediaCommand(command, sessionId);
            state = executeInputMetadata(() -> closing || finished ? AtomicWorkbenchMedia.closed() : media().command(command, sessionId));
        } else if (code == AtomicWorkbenchProtocol.TX_MEDIA_ACTION) {
            String action = data.readString(); Bundle metadata = data.readTypedObject(Bundle.CREATOR);
            data.enforceNoDataAvail();
            state = executeInputMetadata(() -> closing || finished ? AtomicWorkbenchMedia.closed() : media().action(action, metadata));
        } else if (code == AtomicWorkbenchProtocol.TX_CLOSE_WINDOW) {
            int windowId = data.readInt(); requireWindow(windowId); data.enforceNoDataAvail();
            clearInputs(windowId);
            state = execute(() -> closing || finished ? AtomicWorkbenchProtocol.failure("工作台正在恢复任务")
                    : backend().closeWindow(windowId));
        } else if (code == AtomicWorkbenchProtocol.TX_CLOSE) {
            String suppliedReason = readCloseReason(data);
            closing = true;
            if ("none".equals(closeReason)) closeReason = suppliedReason;
            lifecycle("ROOT_CLOSE_REQUEST", "requested_reason=" + suppliedReason + ";finished=" + finished, null);
            clearInputs();
            state = execute(() -> {
                if (!finished) inspectCloseIntent(suppliedReason);
                return closeOnce();
            });
            if (state.getBoolean("success") && !state.getBoolean("recovery_pending")) finishLater();
            else scheduleRecovery();
        } else if (code == AtomicWorkbenchProtocol.TX_STATUS) {
            data.enforceNoDataAvail();
            state = executeInputMetadata(() -> {
                Bundle current = recoveryState(backend().status());
                current.putLong("input_revision", backend().inputRevision());
                current.putBoolean("extraction_geometry_cleanup_pending", extractionGeometryCleanupPending);
                current.putBoolean("paste_focus_cleanup_pending", pasteHost != null && pasteHost.hasCleanupPending());
                if (!inputFailure.isEmpty()) {
                    current.putBoolean("success", false);
                    current.putString("message", inputFailure);
                }
                return current;
            });
        } else return super.onTransact(code, data, reply, flags);
        if (state.getBoolean("input_failure")) requestRecovery();
        if (reply != null) {
            reply.writeNoException();
            reply.writeTypedObject(state, 0);
        }
        return true;
    }

    /** Same owner-lane snapshot: reader coverage never grants a new high-slot operation. */
    private Bundle recoveryState(Bundle actual) {
        if (!(actual.get("windows") instanceof java.util.ArrayList<?>)) return actual;
        return AtomicWorkbenchProtocol.recoveryState(actual, backend.recoveryDomain());
    }

    private AtomicWorkbenchEngine backend() {
        if (backend == null) {
            backend = new AtomicWorkbenchEngine(id -> new AtomicWorkbenchPlatform(context, appUid, userId, engine, id,
                    this::readHomeReadiness, this::controlInputFocus, AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8),
                    AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8);
            ensureTaskBackend(true);
            engine.postDelayed(maintainWindows, 1000L);
        }
        return backend;
    }

    /** Only the existing engine lane may read/attach a controller; status never invokes this retry. */
    private void ensureTaskBackend(boolean explicitRetry) {
        if (Looper.myLooper() != engine.getLooper()) throw new IllegalStateException("task_backend_worker_required");
        AtomicWorkbenchEngine current = backend;
        if (current == null || current.taskOperationsConfigured()) return;
        long now = android.os.SystemClock.elapsedRealtime();
        if (!explicitRetry && now < taskBackendRetryElapsed) return;
        try {
            // TaskOperations performs the full Store.read before this controller is published.
            current.configureTaskOperations(new AtomicWorkbenchTaskOperations(current,
                    new AtomicWorkbenchTaskAuthority(context, this::systemSessionMetadata, this::retainedTaskCleanupMetadata),
                    new AtomicWorkbenchTaskShelfStore(context, appUid, userId, current.recoveryDomain()), this::requireReferenceSession));
            taskBackendRetryAttempt = 0; taskBackendRetryElapsed = 0;
        } catch (Exception | LinkageError unavailable) {
            current.taskOperationsUnavailable("task_storage_unavailable");
            taskBackendRetryAttempt = Math.min(taskBackendRetryAttempt + 1, 5);
            long delay = Math.min(30000L, 1000L << taskBackendRetryAttempt);
            long failedAt = android.os.SystemClock.elapsedRealtime();
            taskBackendRetryElapsed = failedAt > Long.MAX_VALUE - delay ? Long.MAX_VALUE : failedAt + delay;
            lifecycle("ROOT_TASK_BACKEND_UNAVAILABLE", "original_windows_preserved=true;scope_verified=false", unavailable);
        }
    }

    private AtomicWorkbenchMedia media() {
        // A media-only connection must not allocate a virtual display or a task engine.
        if (media == null) media = new AtomicWorkbenchMedia(context, userId, this::systemSessionMetadata);
        return media;
    }

    private AtomicWorkbenchNotifications notifications() {
        if (notifications == null) notifications = new AtomicWorkbenchNotifications(context, userId, this::systemSessionMetadata);
        return notifications;
    }

    private static Bundle closedNotifications() {
        Bundle state = new Bundle(); state.putInt("schema", 1); state.putBoolean("success", false);
        state.putBoolean("available", false); state.putString("notification_status", "closed"); return state;
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private AtomicWorkbenchExtractionGeometryTransport extractionGeometry() throws Exception {
        if (extractionGeometry == null) {
            Object value = Class.forName("android.os.ServiceManager").getMethod("getService", String.class).invoke(null, "window");
            if (!(value instanceof IBinder)) throw new IllegalStateException("extraction_geometry_unavailable");
            extractionGeometry = new AtomicWorkbenchExtractionGeometryTransport((IBinder) value, () -> {
                try { return systemSessionMetadata(); }
                catch (Exception unavailable) { throw new SecurityException("工作台系统会话已失效"); }
            });
        }
        return extractionGeometry;
    }

    private Bundle extractionGeometry(int action, Bundle expected) throws Exception {
        if (action == 3) {
            if (!expected.keySet().isEmpty()) throw new IllegalArgumentException("invalid geometry cleanup");
            Bundle result = new Bundle(); result.putBoolean("success", clearExtractionGeometry());
            result.putBoolean("extraction_geometry_cleanup_pending", extractionGeometryCleanupPending); return result;
        }
        if (action == 2) {
            if (!expected.keySet().equals(java.util.Set.of("window_id", "ticket")))
                throw new IllegalArgumentException("invalid geometry cleanup");
            boolean cleared = extractionGeometry == null || extractionGeometry.clear(expected.getInt("window_id", -1), expected.getString("ticket"));
            Bundle result = new Bundle(); result.putBoolean("success", cleared); return result;
        }
        if (backend == null || uiInputUnavailable() || !registeredSessionCurrent(providerSession, providerResetGeneration))
            return AtomicWorkbenchProtocol.failure("工作台画面尚未就绪，文字提取未注册。");
        int id = expected.getInt("window_id", -1); requireWindow(id);
        Bundle window = backend.windowState(id);
        if (backend.activeInputWindow() != id || expected.getLong("input_revision", -1L) != backend.inputRevision()
                || !window.getBoolean("success", false) || window.getBoolean("recovery_pending", true)
                || window.getInt("display_id", -1) != expected.getInt("display_id", -2)
                || !window.getString("display_name", "").equals(expected.getString("display_name"))
                || !window.getString("display_unique_id", "").equals(expected.getString("unique_id"))
                || window.getInt("width", -1) != expected.getInt("buffer_width", -2)
                || window.getInt("height", -1) != expected.getInt("buffer_height", -2))
            return AtomicWorkbenchProtocol.failure("工作台窗口身份已变化，普通输入保留，文字提取暂不可用。");
        AtomicWorkbenchExtractionGeometryFence candidate = new AtomicWorkbenchExtractionGeometryFence(expected,
                providerSession, providerResetGeneration, android.os.SystemClock.elapsedRealtime());
        if (candidate.revision <= minimumExtractionGeometryRevision.get())
            return AtomicWorkbenchProtocol.failure("工作台显示代际已变化，提取注册未应用。");
        extractionGeometryFence = candidate;
        try {
            Bundle result = extractionGeometry().register(expected);
            boolean current = extractionGeometryFence == candidate && candidate.revision > minimumExtractionGeometryRevision.get()
                    && candidate.deadline > android.os.SystemClock.elapsedRealtime();
            result.putBoolean("success", current);
            if (!current) { extractionGeometryFence = null; extractionGeometryCleanupPending = true; }
            return result;
        } catch (Exception unavailable) {
            if (extractionGeometryFence == candidate) extractionGeometryFence = null;
            extractionGeometryCleanupPending = true; throw unavailable;
        }
    }

    private boolean clearExtractionGeometry() {
        extractionGeometryFence = null;
        if (extractionGeometry == null) { extractionGeometryCleanupPending = false; return true; }
        try { extractionGeometryCleanupPending = !extractionGeometry.clearAll(); }
        catch (Exception unavailable) { extractionGeometryCleanupPending = true; }
        return !extractionGeometryCleanupPending;
    }

    /** A system callback may be nested in Root's own WMS call: never queue onto the engine here. */
    private boolean readExtractionGeometryFence(Parcel data, Parcel reply, int flags) {
        if (Binder.getCallingUid() != 1000) throw new SecurityException("geometry query caller mismatch");
        if (!synchronousReplyTransport(flags, reply)) return true;
        String nonce = null; boolean current = false;
        try {
            if (data == null || data.dataSize() > 4096) throw new IllegalArgumentException();
            data.enforceInterface(AtomicWorkbenchExtractionGeometryFence.DESCRIPTOR);
            if (data.readInt() != 1) throw new IllegalArgumentException();
            nonce = data.readString();
            if (nonce == null || !nonce.matches("[0-9a-f]{32}")) throw new IllegalArgumentException();
            Bundle query = data.readBundle(AtomicWorkbenchRoot.class.getClassLoader()); data.enforceNoDataAvail();
            AtomicWorkbenchExtractionGeometryFence fence = extractionGeometryFence;
            AtomicWorkbenchEngine currentBackend = backend;
            IBinder bound; synchronized (this) { bound = owner; }
            if (fence != null && currentBackend != null && registered && !closing && !finished
                    && bound != null && bound.isBinderAlive()) {
                long revision = currentBackend.inputRevision(); int active = currentBackend.activeInputWindow();
                long geometryInput = currentBackend.extractionGeometryInputRevision(fence.inputRevision, revision, active);
                current = fence.matches(query, android.os.SystemClock.elapsedRealtime(), minimumExtractionGeometryRevision.get(),
                        geometryInput, active, currentBackend.uiParked()) && extractionGeometryFence == fence
                        && currentBackend.inputRevision() == revision && currentBackend.activeInputWindow() == active
                        && currentBackend.extractionGeometryInputRevision(fence.inputRevision, revision, active) == geometryInput
                        && !currentBackend.uiParked() && !closing && !finished && bound.isBinderAlive()
                        && fence.revision > minimumExtractionGeometryRevision.get() && extractionGeometryFence == fence;
            }
        } catch (RuntimeException malformed) { current = false; }
        reply.writeNoException(); reply.writeInt(1); reply.writeString(nonce); reply.writeInt(current ? 1 : 0); return true;
    }

    private static boolean invalidatesExtractionGeometry(int code) {
        return code == AtomicWorkbenchProtocol.TX_OPEN || code == AtomicWorkbenchProtocol.TX_OPEN_WINDOW
                || code == AtomicWorkbenchProtocol.TX_OPEN_TASK_WINDOW || code == AtomicWorkbenchProtocol.TX_NATIVE_HOME
                || code == AtomicWorkbenchProtocol.TX_OPEN_MEDIA || code == AtomicWorkbenchProtocol.TX_FOCUS_MEDIA
                || code == AtomicWorkbenchProtocol.TX_OPEN_NOTIFICATION || code == AtomicWorkbenchProtocol.TX_FOCUS_NOTIFICATION
                || code == AtomicWorkbenchProtocol.TX_FOCUS_WINDOW || code == AtomicWorkbenchProtocol.TX_FOCUS_APP
                || code == AtomicWorkbenchProtocol.TX_KEY || code == AtomicWorkbenchProtocol.TX_KEY_WINDOW
                || code == AtomicWorkbenchProtocol.TX_CLOSE || code == AtomicWorkbenchProtocol.TX_CLOSE_WINDOW
                || code == AtomicWorkbenchProtocol.TX_OUTPUT || code == AtomicWorkbenchProtocol.TX_PARK_UI
                || code == AtomicWorkbenchProtocol.TX_HOST_INPUT || code == AtomicWorkbenchProtocol.TX_PASTE_PREPARE
                || code == AtomicWorkbenchProtocol.TX_SHARE_EXACT || code == AtomicWorkbenchProtocol.TX_SHARE_WINDOW
                || code == AtomicWorkbenchProtocol.TX_CHANGE_TASK || code == AtomicWorkbenchProtocol.TX_CANCEL_TASK_OPERATION
                || code == AtomicWorkbenchProtocol.TX_ALLOCATE_TASK_DISPLAY;
    }

    private AtomicWorkbenchPasteHost pasteHost() {
        if (pasteHostRetired && pasteHost != null) {
            pasteHost.maintain();
            if (pasteHost.hasCleanupResponsibility()) throw new IllegalStateException("原文字焦点责任尚未清理");
            pasteHost = null; pasteHostRetired = false;
        }
        if (pasteHost == null) pasteHost = new AtomicWorkbenchPasteHost(appUid, userId, providerSession,
                providerResetGeneration, android.os.SystemClock::elapsedRealtime, new AtomicWorkbenchPasteHost.Workspace() {
            @Override public Bundle windowState(int id) { return backend().windowState(id); }
            @Override public int activeInputWindow() { return backend().activeInputWindow(); }
            @Override public long inputRevision() { return backend().inputRevision(); }
            @Override public Bundle focusInputOnly(int id) { return backend().focusInputOnly(id); }
            @Override public boolean sessionCurrent(long session, long reset) throws Exception {
                return inputSessionCurrent(session, reset);
            }

            // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
            //noinspection PrivateApi
            @Override public AtomicWorkbenchEditorEvidence queryEvidence(AtomicWorkbenchPasteRequest request) throws Exception {
                IBinder service = (IBinder) Class.forName("android.os.ServiceManager")
                        .getMethod("getService", String.class).invoke(null, "window");
                return AtomicWorkbenchEditorEvidence.query(service, request);
            }

            // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
            //noinspection PrivateApi
            @Override public AtomicWorkbenchEditorEvidence.WindowEvidence queryWindowEvidence(AtomicWorkbenchPasteRequest request) throws Exception {
                IBinder service=(IBinder)Class.forName("android.os.ServiceManager").getMethod("getService",String.class).invoke(null,"window");
                return AtomicWorkbenchEditorEvidence.WindowEvidence.query(service,request);
            }
        });
        return pasteHost;
    }

    private boolean uiInputUnavailable() {
        return closing || finished || currentUserId() != userId || backend != null && backend.uiParked();
    }

    private boolean notificationOpenCurrent(Bundle metadata, String component) {
        try {
            AtomicWorkbenchNotificationOpenRequest target=AtomicWorkbenchNotificationOpenRequest.parse(metadata);
            return target.userId==userId && target.component.equals(component) && target.fresh(android.os.SystemClock.elapsedRealtime())
                    && !uiInputUnavailable() && registeredSessionCurrent(providerSession,providerResetGeneration)
                    && notifications().openCurrent(target) && registeredSessionCurrent(providerSession,providerResetGeneration)
                    && target.fresh(android.os.SystemClock.elapsedRealtime());
        } catch(Exception | LinkageError unavailable){return false;}
    }
    private AutoCloseable notificationOpenBoundary(Bundle metadata,String expectedComponent,java.util.concurrent.atomic.AtomicBoolean rejected){
        Bundle frozen=new Bundle(metadata);
        return AtomicWorkbenchLaunchBoundary.enter(component->{
            if(!expectedComponent.equals(component)||!notificationOpenCurrent(frozen,component)){
                if(rejected!=null)rejected.set(true);
                throw new IllegalStateException("通知来源或打开时限已变化，请重新点按来源。");
            }
        });
    }
    private Bundle notificationOpenRejected(int id){
        Bundle result=backend==null?new Bundle():backend.windowState(id);result.putBoolean("success",false);
        result.putBoolean("notification_open_rejected",true);result.putString("message","通知来源或打开时限已变化，请重新点按来源。");return result;
    }

    private boolean mediaOpenCurrent(Bundle metadata, String component) {
        try {
            AtomicWorkbenchMediaOpenRequest target=AtomicWorkbenchMediaOpenRequest.parse(metadata);
            long now=android.os.SystemClock.elapsedRealtime();
            if(target.userId!=userId || !target.component.equals(component) || !target.fresh(now) || uiInputUnavailable()
                    || !registeredSessionCurrent(providerSession,providerResetGeneration))return false;
            Bundle fresh=media().action("describe_open",target.actionMetadata(now));
            return fresh.getBoolean("success",false)&&target.matches(fresh)&&target.fresh(android.os.SystemClock.elapsedRealtime())
                    && registeredSessionCurrent(providerSession,providerResetGeneration)
                    && target.fresh(android.os.SystemClock.elapsedRealtime());
        } catch(Exception | LinkageError unavailable) {return false;}
    }

    private AutoCloseable mediaOpenBoundary(Bundle metadata, String expectedComponent, java.util.concurrent.atomic.AtomicBoolean rejected) {
        Bundle frozen=new Bundle(metadata);
        return AtomicWorkbenchLaunchBoundary.enter(component -> {
            if(!expectedComponent.equals(component) || !mediaOpenCurrent(frozen,component)) {
                if(rejected!=null)rejected.set(true);
                throw new IllegalStateException("媒体来源或打开时限已变化，请重新点按来源。");
            }
        });
    }

    private Bundle mediaOpenRejected(int id) {
        Bundle result=backend==null?new Bundle():backend.windowState(id);
        result.putBoolean("success",false);result.putBoolean("media_open_rejected",true);
        result.putString("message","媒体来源或打开时限已变化，请重新点按来源。");return result;
    }

    private static int currentUserId() {
        try {
            Object user = Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
            return user instanceof Integer ? (Integer) user : -1;
        } catch (ReflectiveOperationException | RuntimeException unavailable) { return -1; }
    }

    private AtomicWorkbenchNavigation navigation() {
        // Querying current-user navigation never constructs a display or task backend.
        if (navigation == null) navigation = new AtomicWorkbenchNavigation(context, userId, this::systemSessionMetadata);
        return navigation;
    }

    private Bundle execute(Callable<Bundle> action) {
        FutureTask<Bundle> operation = new FutureTask<>(() -> {
            long identity = Binder.clearCallingIdentity();
            try { return action.call(); }
            catch (Throwable failure) { return failureState(failure, closing); }
            finally { Binder.restoreCallingIdentity(identity); }
        });
        if (!engine.post(operation)) return AtomicWorkbenchProtocol.failure("工作台进程已退出");
        try { return operation.get(20, TimeUnit.SECONDS); }
        catch (Throwable failure) {
            requestRecovery();
            return failureState(failure, true);
        }
    }

    private Bundle executeInputMetadata(Callable<Bundle> action) {
        return AtomicWorkbenchMetadataExecutor.execute(engine, action, 20000L, failure -> failureState(failure, false));
    }

    private void enqueue(int windowId, InputEvent event) {
        synchronized (inputs) {
            if (closing || finished) { recycle(event); return; }
            WindowInput previous = inputs.peekLast();
            if (previous != null && previous.windowId == windowId && previous.event instanceof MotionEvent && event instanceof MotionEvent
                    && mergeable((MotionEvent) previous.event, (MotionEvent) event)) recycle(inputs.removeLast().event);
            if (inputs.size() >= 256) {
                recycle(event);
                inputFailure = "触摸传输积压，正在恢复应用任务";
                AtomicWorkbenchDiagnostics.emit("ROOT_INPUT_FAILED", windowId, userId, "", -1,
                        "reason=queue_full;limit=256;recovery_pending=true", null);
                requestRecovery();
                return;
            }
            inputs.addLast(new WindowInput(windowId, event));
            if (!inputScheduled) {
                inputScheduled = true;
                engine.post(this::drainInput);
            }
        }
    }

    private static boolean mergeable(MotionEvent first, MotionEvent second) {
        if (first.getActionMasked() != MotionEvent.ACTION_MOVE || second.getActionMasked() != MotionEvent.ACTION_MOVE
                || first.getDownTime() != second.getDownTime() || first.getPointerCount() != second.getPointerCount()) return false;
        for (int index = 0; index < first.getPointerCount(); index++)
            if (first.getPointerId(index) != second.getPointerId(index)) return false;
        return true;
    }

    private void drainInput() {
        int budget = 32;
        while (budget-- > 0) {
            WindowInput input;
            synchronized (inputs) {
                input = inputs.pollFirst();
                if (input == null) { inputScheduled = false; return; }
            }
            InputEvent event = input.event;
            long identity = Binder.clearCallingIdentity();
            try {
                if (!closing && backend != null) {
                    boolean accepted = event instanceof MotionEvent ? backend.inject(input.windowId, (MotionEvent) event)
                            : backend.key(input.windowId, (KeyEvent) event);
                    if (!accepted) {
                        inputFailure = "触摸或按键未被系统接收，正在恢复应用任务";
                        AtomicWorkbenchDiagnostics.emit("ROOT_INPUT_FAILED", input.windowId, userId, "", -1,
                                "reason=not_accepted;recovery_pending=true", null);
                        requestRecovery();
                    }
                }
            } catch (Throwable failure) {
                inputFailure = "输入转发失败：" + cause(failure).getClass().getSimpleName();
                AtomicWorkbenchDiagnostics.emit("ROOT_INPUT_FAILED", input.windowId, userId, "", -1,
                        "reason=exception;recovery_pending=true", cause(failure));
                requestRecovery();
            } finally {
                Binder.restoreCallingIdentity(identity);
                recycle(event);
            }
        }
        engine.post(this::drainInput);
    }

    private static boolean allowedKey(int code) {
        return code == KeyEvent.KEYCODE_BACK || code == KeyEvent.KEYCODE_ESCAPE
                || code == KeyEvent.KEYCODE_ENTER || code == KeyEvent.KEYCODE_TAB
                || code == KeyEvent.KEYCODE_DEL || code == KeyEvent.KEYCODE_FORWARD_DEL
                || code >= KeyEvent.KEYCODE_DPAD_UP && code <= KeyEvent.KEYCODE_DPAD_CENTER;
    }

    private void clearInputs() {
        synchronized (inputs) {
            WindowInput event;
            while ((event = inputs.pollFirst()) != null) recycle(event.event);
        }
    }

    private void clearInputs(int windowId) {
        synchronized (inputs) {
            java.util.Iterator<WindowInput> iterator = inputs.iterator();
            while (iterator.hasNext()) {
                WindowInput input = iterator.next();
                if (input.windowId == windowId) { iterator.remove(); recycle(input.event); }
            }
        }
    }

    private static void requireWindow(int id) {
        if (id < 0 || id >= AtomicWorkbenchProtocol.WINDOW_POOL_COUNT) throw new IllegalArgumentException("invalid window");
    }

    private static String requireTaskOperationId(String id) {
        if (id == null || !id.matches("[0-9a-f]{32}")) throw new IllegalArgumentException("invalid task operation identity");
        return id;
    }

    private static final class WindowInput {
        final int windowId; final InputEvent event;
        WindowInput(int windowId, InputEvent event) { this.windowId = windowId; this.event = event; }
    }

    private static void recycle(InputEvent event) {
        if (event instanceof MotionEvent) ((MotionEvent) event).recycle();
    }

    private Bundle closeOnce() {
        Bundle result;
        clearExtractionGeometry();
        // Editor-focus cleanup never prevents migrating/returning actual application tasks.
        if (pasteHost != null) try { pasteHost.close(); } catch (RuntimeException pending) { }
        try {
            AtomicWorkbenchEngine current = backend;
            if (current == null) current = backend(); // Initial construction already attempts one full read.
            else ensureTaskBackend(true);
            result = recoveryState(current.close(focusPrimaryHomeOnClose));
        }
        catch (Throwable failure) { result = failureState(failure, true); }
        // Release callbacks and session-local timer records even while task recovery needs a retry.
        if (media != null) try { media.close(); } catch (RuntimeException unavailable) { }
        if (notifications != null) notifications.close();
        if (pasteHost != null) pasteHost.maintain();
        result.putString("close_reason", closeReason);
        result.putBoolean("extraction_geometry_cleanup_pending", extractionGeometryCleanupPending);
        result.putBoolean("primary_home_focus_requested", focusPrimaryHomeOnClose);
        lifecycle("ROOT_CLOSE_RESULT", "success=" + result.getBoolean("success")
                + ";recovery_pending=" + result.getBoolean("recovery_pending")
                + ";focus_restore_pending=" + result.getBoolean("focus_restore_pending")
                + ";primary_home_focus=" + focusPrimaryHomeOnClose, null);
        return result;
    }

    private static String readCloseReason(Parcel data) {
        String reason = data.dataAvail() == 0 ? "recovery_retry"
                : AtomicWorkbenchLifecyclePolicy.requireReason(data.readString());
        data.enforceNoDataAvail();
        return reason;
    }

    private void inspectCloseIntent(String reason) {
        if (!"host_stopped".equals(reason) && !"surface_lost".equals(reason)) return;
        try {
            android.os.PowerManager power = (android.os.PowerManager) context.getSystemService(Context.POWER_SERVICE);
            android.app.KeyguardManager keyguard = (android.app.KeyguardManager) context.getSystemService(Context.KEYGUARD_SERVICE);
            boolean interactive = power != null && power.isInteractive();
            boolean locked = keyguard == null || keyguard.isKeyguardLocked();
            boolean primary = backend().primaryHomeIsForeground();
            focusPrimaryHomeOnClose |= AtomicWorkbenchLifecyclePolicy.focusPrimaryHome(reason, primary, interactive, locked);
            lifecycle("ROOT_CLOSE_INTENT", "primary_home_foreground=" + primary + ";interactive=" + interactive
                    + ";locked=" + locked + ";primary_home_focus=" + focusPrimaryHomeOnClose, null);
        } catch (Throwable failure) { lifecycle("ROOT_CLOSE_INTENT", "observation=unavailable;primary_home_focus=false", failure); }
    }

    private void requestRecovery() {
        requestRecovery("backend_failure");
    }

    private void requestRecovery(String reason) {
        if (finished) return;
        closing = true;
        if ("none".equals(closeReason)) closeReason = reason;
        lifecycle("ROOT_RECOVERY_REQUEST", "requested_reason=" + reason, null);
        clearInputs();
        scheduleRecovery();
    }

    private synchronized void scheduleRecovery() {
        if (finished) return;
        engine.removeCallbacks(recover);
        if (!engine.postDelayed(recover, recoveryAttempt == 0 ? 0 : Math.min(30000L, 1000L << Math.min(recoveryAttempt, 5))))
            lifecycle("ROOT_RECOVERY_UNAVAILABLE", "worker_accepting=false", null);
    }

    private final Runnable recover = () -> {
        if (finished) return;
        lifecycle("ROOT_RECOVERY_RETRY", "attempt=" + recoveryAttempt, null);
        long identity = Binder.clearCallingIdentity();
        Bundle result;
        try { result = closeOnce(); }
        finally { Binder.restoreCallingIdentity(identity); }
        if (result.getBoolean("success") && !result.getBoolean("recovery_pending")) finishLater();
        else { recoveryAttempt++; scheduleRecovery(); }
    };

    private final Runnable maintainWindows = new Runnable() {
        @Override public void run() {
            if (finished || closing || backend == null) return;
            long identity = Binder.clearCallingIdentity();
            try {
                int current = currentUserId();
                if (current >= 0 && current != userId) { requestRecovery("user_changed"); return; }
                ensureTaskBackend(false);
                backend.retryWindowRecovery();
                if (pasteHost != null) pasteHost.maintain();
                if (extractionGeometryCleanupPending) clearExtractionGeometry();
            }
            catch (RuntimeException failure) { requestRecovery(); }
            finally { Binder.restoreCallingIdentity(identity); }
            if (!closing && !finished) engine.postDelayed(this, 1000L);
        }
    };

    private void finishLater() {
        // TX_CLOSE returns to a Binder thread after execute(); inspect mutable owners only
        // on their existing lane. Queuing completion never constructs another backend.
        if (Looper.myLooper() != engine.getLooper()) {
            if (!engine.post(this::finishLater))
                lifecycle("ROOT_FINISH_DEFERRED", "worker_accepting=false", null);
            return;
        }
        AtomicWorkbenchEngine current = backend;
        // These are bounded cached owner facts: no Store IO, Binder or Platform mutation.
        if (current != null && current.hasRecoveryPending()) {
            lifecycle("ROOT_FINISH_DEFERRED", "task_scope_verified=" + !current.taskStorageUnverified()
                    + ";recovery_pending=true", null);
            scheduleRecovery();
            return;
        }
        synchronized (this) {
            if (finished) return;
            finished = true;
        }
        lifecycle("ROOT_FINISH", "recovery_confirmed=true;exit_scheduled=true", null);
        clearInputs();
        engine.removeCallbacks(recover);
        engine.removeCallbacks(maintainWindows);
        engine.removeCallbacks(checkOwner);
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            engineThread.quitSafely();
            AtomicWorkbenchDiagnostics.flush(250L);
            System.exit(0);
        }, 750L);
    }

    private void lifecycle(String event, String detail, Throwable failure) {
        AtomicWorkbenchDiagnostics.emit(event, -1, userId, "", -1,
                "reason=" + closeReason + ";attempt=" + recoveryAttempt + ";" + detail, failure);
    }

    private static Bundle failureState(Throwable failure, boolean pending) {
        Throwable detail = cause(failure);
        AtomicWorkbenchDiagnostics.emit("ROOT_OPERATION_FAILED", -1, -1, "", -1,
                "recovery_pending=" + pending+";reason="+AtomicWorkbenchDiagnostics.reason(detail), detail);
        Bundle state = AtomicWorkbenchProtocol.failure("工作台系统调用失败：" + detail.getClass().getSimpleName());
        state.putBoolean("recovery_pending", pending);
        return state;
    }

    private static Throwable cause(Throwable failure) {
        while ((failure instanceof java.lang.reflect.InvocationTargetException
                || failure instanceof java.util.concurrent.ExecutionException) && failure.getCause() != null)
            failure = failure.getCause();
        return failure;
    }
}
