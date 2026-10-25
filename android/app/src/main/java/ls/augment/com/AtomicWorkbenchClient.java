package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.Surface;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;
import org.json.JSONObject;

/** The app's session owner. Blocking lifecycle calls belong on a worker thread. */
public final class AtomicWorkbenchClient {
    private static final long CONNECT_TIMEOUT_MS = 20_000L;
    private static final int MAX_OUTPUT_LINE = AtomicWorkbenchDiagnostics.MAX_WIRE_CHARS;
    private final Context application;
    private final AtomicWorkbenchProvider.Pending pending;
    private final java.lang.Process process;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final AtomicReference<String> failure = new AtomicReference<>();
    private final long diagnosticGeneration;
    private volatile IBinder endpoint;
    // Set only by a complete typed reply from this actual live endpoint, never by a UI hint.
    private volatile IBinder taskStorageScopeEndpoint;
    private volatile boolean closed;
    private volatile Consumer<String> failureListener;
    private volatile AtomicWorkbenchClient recoveryClient;
    private final Object navigationLock = new Object();
    private long navigationGeneration;
    private boolean navigationStopped;
    private final IBinder.DeathRecipient deathRecipient = () -> {
        record("ROOT_BINDER_DIED", -1, null, -1, "client_closed=" + closed, null);
        reportFailure("工作台连接已中断，手机端将恢复应用任务");
    };

    private AtomicWorkbenchClient(Context application, AtomicWorkbenchProvider.Pending pending,
            java.lang.Process process, long diagnosticGeneration) {
        this.application = application;
        this.pending = pending;
        this.process = process;
        this.diagnosticGeneration = diagnosticGeneration;
    }

    public static AtomicWorkbenchClient connect(Context context) throws Exception {
        requireWorkerThread();
        if (context == null) throw new IllegalArgumentException("context is required");
        Context application = context.getApplicationContext();
        if (application == null) application = context;
        long generation = ResetWriteFence.generation();
        int userId = android.os.Process.myUid() / 100000;
        AtomicWorkbenchProvider.Pending pending = null;
        java.lang.Process process = null;
        AtomicWorkbenchClient client = null;
        String stage = "prepare_session";
        try {
            AtomicWorkbenchDiagnostics.record(application, generation, "CONNECT_REQUEST", -1, userId, "", -1, "", null);
            pending = AtomicWorkbenchProvider.prepare(application);
            String apk = application.getApplicationInfo().sourceDir;
            String su = new File("/system/bin/su").canExecute() ? "/system/bin/su" : "su";
            // Only the APK path is a shell argument. Credentials travel exclusively through stdin.
            String command = "CLASSPATH=" + shellQuote(apk)
                    + " exec /system/bin/app_process /system/bin ls.augment.com.AtomicWorkbenchRoot";
            stage = "spawn_root";
            process = new ProcessBuilder(su, "-c", command).redirectErrorStream(true).start();
            client = new AtomicWorkbenchClient(application, pending, process, generation);
            client.startOutputDrain();
            client.startExitWatcher();
            client.writeBootstrap();
            stage = "await_registration";
            if (!pending.ready.await(CONNECT_TIMEOUT_MS, TimeUnit.MILLISECONDS))
                throw new IOException("工作台 Root 连接超时，请确认 Root 授权");
            if (pending.failure != null && !pending.failure.isEmpty())
                throw new IOException(client.sanitize(pending.failure));
            stage = "verify_endpoint";
            IBinder binder = pending.endpoint;
            if (binder == null || !binder.isBinderAlive())
                throw new IOException("工作台 Root 服务未就绪");
            client.endpoint = binder;
            binder.linkToDeath(client.deathRecipient, 0);
            if (!binder.isBinderAlive()) throw new IOException("工作台 Root 服务已退出");
            client.record("CONNECT_READY", -1, null, -1, "binder_alive;app_launch_not_yet_verified", null);
            return client;
        } catch (Exception error) {
            AtomicWorkbenchDiagnostics.record(application, generation, "CONNECT_FAILED", -1, userId, "", -1,
                    "stage=" + stage, error);
            if (pending != null) AtomicWorkbenchProvider.remove(pending);
            // No OPEN can have been sent before connect returns. A registered root owns
            // its recovery lifetime; never kill it merely because the UI timed out.
            if ((pending == null || pending.endpoint == null) && process != null) process.destroy();
            else if (client != null && pending != null && pending.endpoint != null)
                client.requestAbandonedConnectionClose(pending.endpoint);
            if (client != null) client.closed = true;
            if (error instanceof InterruptedException) Thread.currentThread().interrupt();
            throw error;
        }
    }

    public Bundle open(Surface surface, int width, int height, int density,
            ComponentName component) throws Exception {
        return openWindow(0, surface, width, height, density, component);
    }

    public Bundle openWindow(int windowId, Surface surface, int width, int height, int density,
            ComponentName component) throws Exception {
        return openWindowRequest(AtomicWorkbenchProtocol.TX_OPEN_WINDOW, windowId, surface, width, height, density, component, -1);
    }

    public Bundle openTaskWindow(int windowId, Surface surface, int width, int height, int density,
            ComponentName component, int taskId) throws Exception {
        if (taskId < 1) throw new IllegalArgumentException("invalid original task");
        return openWindowRequest(AtomicWorkbenchProtocol.TX_OPEN_TASK_WINDOW, windowId, surface, width, height, density, component, taskId);
    }

    public Bundle showNativeHome(int windowId, Surface surface, int width, int height, int density) throws Exception {
        try {
            requireWorkerThread();
            requireWindow(windowId);
            record("HOME_REQUEST", windowId, null, -1,
                    "width=" + width + ";height=" + height + ";density=" + density, null);
            if (ResetWriteFence.active()) throw new IllegalStateException("正在重置模块，不能启动工作台");
            if (surface == null || !surface.isValid() || width < 1 || height < 1 || density < 1)
                throw new IllegalArgumentException("invalid workbench home display request");
            Bundle result = request(AtomicWorkbenchProtocol.TX_NATIVE_HOME, data -> {
                data.writeInt(windowId);
                data.writeStrongBinder(pending.owner);
                data.writeTypedObject(surface, 0);
                data.writeInt(width);
                data.writeInt(height);
                data.writeInt(density);
            });
            record("HOME_RESULT", windowId, null, result.getInt("display_id", -1),
                    "success=" + result.getBoolean("success", false)
                            + ";nativeHome=" + result.getBoolean("native_home", false)
                            + ";task=" + result.getInt("task_id", -1)
                            + ";homeTask=" + result.getInt("home_task_id", -1)
                            + ";recoveryPending=" + result.getBoolean("recovery_pending", false)
                            + ";firstFrame=UNVERIFIED", null);
            return result;
        } catch (Exception error) {
            record("HOME_FAILED", windowId, null, -1, "", error);
            throw error;
        }
    }

    private Bundle openWindowRequest(int code, int windowId, Surface surface, int width, int height, int density,
            ComponentName component, int taskId) throws Exception {
        try {
            requireWorkerThread();
            requireWindow(windowId);
            record("OPEN_REQUEST", windowId, component, -1,
                    "width=" + width + ";height=" + height + ";density=" + density + ";originalTask=" + taskId, null);
            if (ResetWriteFence.active()) throw new IllegalStateException("正在重置模块，不能启动工作台");
            if (surface == null || !surface.isValid() || component == null
                    || width < 1 || height < 1 || density < 1)
                throw new IllegalArgumentException("invalid workbench display request");
            Bundle result = request(code, data -> {
                data.writeInt(windowId);
                data.writeStrongBinder(pending.owner);
                data.writeTypedObject(surface, 0);
                data.writeInt(width);
                data.writeInt(height);
                data.writeInt(density);
                data.writeString(component.flattenToString());
                if (code == AtomicWorkbenchProtocol.TX_OPEN_TASK_WINDOW) data.writeInt(taskId);
            });
            // Do not dump the Bundle or equate task activation with a rendered first frame.
            record("OPEN_RESULT", windowId, component, result.getInt("display_id", -1),
                    "success=" + result.getBoolean("success", false)
                            + ";state=" + AtomicWorkbenchDiagnostics.safe(result.getString("state", ""), pending.token, 80)
                            + ";task=" + result.getInt("task_id", -1)
                            + ";requestedTask=" + taskId
                            + ";taskCount=" + result.getInt("task_count", -1)
                            + ";recoveryPending=" + result.getBoolean("recovery_pending", false)
                            + ";firstFrame=UNVERIFIED", null);
            return result;
        } catch (Exception error) {
            record("OPEN_FAILED", windowId, component, -1, "", error);
            throw error;
        }
    }

    /** The caller retains its event and may recycle it immediately after this call returns. */
    public void touch(MotionEvent alreadyMapped) {
        touchWindow(0, alreadyMapped);
    }

    public void touchWindow(int windowId, MotionEvent alreadyMapped) {
        requireWindow(windowId);
        if (alreadyMapped == null || closed) return;
        sendOneway(AtomicWorkbenchProtocol.TX_TOUCH_WINDOW,
                data -> { data.writeInt(windowId); data.writeTypedObject(alreadyMapped, 0); });
    }

    void publishGestureTarget(int displayId, int windowId, int hostTaskId, String uniqueId) {
        if (!closed && !endpointDead()) AtomicWorkbenchProvider.publishGestureTarget(pending, displayId, windowId, hostTaskId, uniqueId);
        else clearGestureTarget();
    }

    void clearGestureTarget() { AtomicWorkbenchProvider.clearGestureTarget(pending); }

    boolean nativeGestureActive() { return !closed && !endpointDead() && AtomicWorkbenchProvider.nativeGestureActive(pending); }

    public void key(int keyCode) {
        keyWindow(0, keyCode);
    }

    public void keyWindow(int windowId, int keyCode) {
        requireWindow(windowId);
        if (closed || keyCode <= KeyEvent.KEYCODE_UNKNOWN || keyCode > KeyEvent.getMaxKeyCode())
            return;
        long now = SystemClock.uptimeMillis();
        KeyEvent down = new KeyEvent(now, now, KeyEvent.ACTION_DOWN, keyCode, 0, 0,
                KeyCharacterMap.VIRTUAL_KEYBOARD, 0, 0, InputDevice.SOURCE_KEYBOARD);
        KeyEvent up = KeyEvent.changeAction(down, KeyEvent.ACTION_UP);
        if (sendOneway(AtomicWorkbenchProtocol.TX_KEY_WINDOW, data -> { data.writeInt(windowId); data.writeTypedObject(down, 0); }))
            sendOneway(AtomicWorkbenchProtocol.TX_KEY_WINDOW, data -> { data.writeInt(windowId); data.writeTypedObject(up, 0); });
    }

    public Bundle focusWindow(int windowId) throws Exception {
        requireWorkerThread();
        if (windowId != -1) requireWindow(windowId);
        return request(AtomicWorkbenchProtocol.TX_FOCUS_WINDOW, data -> data.writeInt(windowId));
    }

    Bundle focusHostInput() throws Exception {
        requireWorkerThread();
        return request(AtomicWorkbenchProtocol.TX_HOST_INPUT, null);
    }

    long inputSession() { return pending.startedAt; }

    Bundle preparePaste(AtomicWorkbenchPasteRequest value) throws Exception {
        requireWorkerThread();
        return request(AtomicWorkbenchProtocol.TX_PASTE_PREPARE, data -> data.writeTypedObject(value.metadata(), 0));
    }

    Bundle validatePaste(AtomicWorkbenchPasteRequest value, AtomicWorkbenchEditorEvidence evidence) throws Exception {
        requireWorkerThread();
        return request(AtomicWorkbenchProtocol.TX_PASTE_VALIDATE, data -> {
            data.writeTypedObject(value.metadata(), 0);
            data.writeTypedObject(evidence.toBundle(), 0);
        });
    }

    Bundle releasePaste(AtomicWorkbenchPasteRequest value) throws Exception {
        requireWorkerThread();
        return request(AtomicWorkbenchProtocol.TX_PASTE_RELEASE, data -> data.writeTypedObject(value.metadata(), 0));
    }

    Bundle shareExact(AtomicWorkbenchDeliveryTarget target, Intent share) throws Exception {
        requireWorkerThread();
        return request(AtomicWorkbenchProtocol.TX_SHARE_EXACT, data -> {
            data.writeTypedObject(target.metadata(), 0);
            data.writeTypedObject(share, 0);
        });
    }

    /** Send real, app-owned content to an application's public share entry in its existing window. */
    public Bundle shareWindow(int windowId, Intent share, String packageName) throws Exception {
        requireWorkerThread();
        requireWindow(windowId);
        if (share == null || packageName == null) throw new IllegalArgumentException("invalid content transfer");
        return request(AtomicWorkbenchProtocol.TX_SHARE_WINDOW, data -> {
            data.writeInt(windowId);
            data.writeTypedObject(share, 0);
            data.writeString(packageName);
        });
    }

    /** Focus an existing task in its owned display; this operation never launches an app. */
    public Bundle focusAppWindow(int windowId, String component) throws Exception {
        requireWorkerThread();
        requireWindow(windowId);
        ComponentName target = AtomicWorkbenchProtocol.requireFocusComponent(component);
        try {
            record("FOCUS_APP_REQUEST", windowId, target, -1, "", null);
            Bundle result = request(AtomicWorkbenchProtocol.TX_FOCUS_APP, data -> {
                data.writeInt(windowId);
                data.writeString(component);
            });
            record("FOCUS_APP_RESULT", windowId, target, result.getInt("display_id", -1),
                    "success=" + result.getBoolean("success", false)
                            + ";task=" + result.getInt("task_id", -1)
                            + ";recoveryPending=" + result.getBoolean("recovery_pending", false)
                            + ";firstFrame=UNVERIFIED", null);
            return result;
        } catch (Exception error) {
            record("FOCUS_APP_FAILED", windowId, target, -1, "", error);
            throw error;
        }
    }

    /** Metadata is transient UI data: never pass these responses to diagnostics. */
    public Bundle mediaState() throws Exception {
        requireWorkerThread();
        AtomicWorkbenchClient recovery = recoveryClient;
        if (recovery != null) return recovery.mediaState();
        return request(AtomicWorkbenchProtocol.TX_MEDIA_STATE, null);
    }

    /** Current-user notification text is transient UI data and never enters diagnostics. */
    public Bundle navigationState() throws Exception {
        requireWorkerThread();
        AtomicWorkbenchClient recovery = recoveryClient;
        if (recovery != null) return recovery.navigationState();
        final long generation;
        final boolean consuming;
        synchronized (navigationLock) {
            generation = navigationGeneration;
            consuming = !navigationStopped;
            if (consuming) AtomicWorkbenchProvider.touchNavigation(pending);
        }
        try {
            Bundle state = request(AtomicWorkbenchProtocol.TX_NAVIGATION_STATE, null);
            synchronized (navigationLock) {
                return !consuming || navigationStopped || generation != navigationGeneration ? state
                        : AtomicWorkbenchProvider.mergeNavigation(pending, state);
            }
        } catch (Exception failure) {
            synchronized (navigationLock) {
                if (consuming && generation == navigationGeneration) AtomicWorkbenchProvider.stopNavigation(pending);
            }
            throw failure;
        }
    }

    /** Only the active UI may reopen consumption after stopping or leaving a media poll. */
    public void resumeNavigation() {
        AtomicWorkbenchClient recovery = recoveryClient;
        if (recovery != null) recovery.resumeNavigation();
        synchronized (navigationLock) { if (!closed) navigationStopped = false; }
    }

    /** Local, nonblocking UI lifecycle signal; cleanup may keep the Root endpoint alive. */
    public void stopNavigation() {
        AtomicWorkbenchClient recovery = recoveryClient;
        if (recovery != null) recovery.stopNavigation();
        synchronized (navigationLock) {
            navigationStopped = true;
            ++navigationGeneration;
            AtomicWorkbenchProvider.stopNavigation(pending);
        }
    }

    public Bundle mediaCommand(String command, String sessionId) throws Exception {
        requireWorkerThread();
        AtomicWorkbenchProtocol.requireMediaCommand(command, sessionId);
        AtomicWorkbenchClient recovery = recoveryClient;
        if (recovery != null) return recovery.mediaCommand(command, sessionId);
        return request(AtomicWorkbenchProtocol.TX_MEDIA_COMMAND, data -> {
            data.writeString(command);
            data.writeString(sessionId);
        });
    }

    public synchronized Bundle closeWindow(int windowId) throws Exception {
        requireWorkerThread(); requireWindow(windowId);
        if (closed) {
            Bundle state = new Bundle(); state.putBoolean("success", true); state.putBoolean("no_session", true);
            state.putInt("window_id", windowId); state.putString("state", "closed"); return state;
        }
        AtomicWorkbenchClient recovery = recoveryClient;
        if (recovery != null) return recovery.closeWindow(windowId);
        if (endpointDead()) {
            AtomicWorkbenchProvider.remove(pending);
            recoveryClient = recovery = connect(application);
            failure.set(null); recovery.setFailureListener(this::reportFailure);
            return recovery.closeWindow(windowId);
        }
        return request(AtomicWorkbenchProtocol.TX_CLOSE_WINDOW, data -> data.writeInt(windowId));
    }

    public Bundle status() throws Exception {
        requireWorkerThread();
        AtomicWorkbenchClient recovery = recoveryClient;
        if (recovery != null) return recovery.status();
        if (!closed && endpointDead()) {
            Bundle state = new Bundle();
            state.putBoolean("success", false);
            state.putBoolean("recovery_pending", true);
            state.putString("message", "工作台 Root 进程已退出，请重试恢复以核对手机内保存的任务记录");
            return state;
        }
        return request(AtomicWorkbenchProtocol.TX_STATUS, null);
    }

    /** Read only the actual previously observed live owner; never connect or delegate to recovery. */
    Bundle statusForStorageRecheck() throws Exception {
        requireWorkerThread();
        IBinder observed = taskStorageScopeEndpoint;
        if (observed == null || closed || recoveryClient != null || failure.get() != null
                || endpoint != observed || !observed.isBinderAlive())
            throw new IOException("原工作台连接已离开，请使用原恢复入口核对任务");
        Bundle response = requestOnEndpoint(observed, AtomicWorkbenchProtocol.TX_STATUS, null);
        if (endpoint != observed || closed || recoveryClient != null || failure.get() != null
                || !observed.isBinderAlive()) throw new IOException("原工作台连接已离开，状态未获确认");
        return response;
    }

    /** Strict complete state from this one status response; it grants no allocation authority. */
    static java.util.ArrayList<Bundle> recoveryPoolWindows(Bundle response) {
        return AtomicWorkbenchProtocol.recoveryPoolWindows(response);
    }

    /** Presentation facts only. READY is independent of overall success and cleanup responsibility. */
    static int taskStorageScope(Bundle response) {
        if (response == null || !(response.get("success") instanceof Boolean)) return -1;
        Object raw = response.get("windows");
        if (!(raw instanceof java.util.ArrayList<?>)) return -1;
        java.util.ArrayList<?> windows = (java.util.ArrayList<?>) raw;
        if (windows.size() != AtomicWorkbenchProtocol.WINDOW_COUNT) return -1;
        boolean[] seen = new boolean[AtomicWorkbenchProtocol.WINDOW_COUNT];
        for (Object value : windows) {
            if (!(value instanceof Bundle)) return -1;
            Object id = ((Bundle) value).get("window_id");
            if (!(id instanceof Integer) || (Integer) id < 0 || (Integer) id >= seen.length || seen[(Integer) id]) return -1;
            seen[(Integer) id] = true;
        }
        if (response.containsKey("recovery_domain") && !AtomicWorkbenchProtocol.completeRecoveryDomain(response)) return -1;
        Object state = response.get("task_backend_state"), reason = response.get("task_backend_reason");
        Object available = response.get("task_backend_available"), unverified = response.get("task_storage_unverified");
        Object verified = response.get("task_scope_verified");
        if (!(state instanceof String) || !(reason instanceof String) || !(available instanceof Boolean)
                || !(unverified instanceof Boolean) || !(verified instanceof Boolean)) return -1;
        if ("storage_unverified".equals(state) && Boolean.FALSE.equals(available)
                && Boolean.TRUE.equals(unverified) && Boolean.FALSE.equals(verified)) return 1;
        if ("not_configured".equals(state) && Boolean.FALSE.equals(available)
                && Boolean.FALSE.equals(unverified) && Boolean.FALSE.equals(verified)) return 2;
        return "ready".equals(state) && "".equals(reason) && Boolean.TRUE.equals(available)
                && Boolean.FALSE.equals(unverified) && Boolean.TRUE.equals(verified) ? 0 : -1;
    }

    public Bundle updateOutput(int windowId, Bundle expected, long generation, Surface surface) throws Exception {
        requireWorkerThread();
        requireWindow(windowId);
        if (expected == null || generation < 1) throw new IllegalArgumentException("invalid output identity");
        return request(AtomicWorkbenchProtocol.TX_OUTPUT, data -> {
            data.writeInt(windowId); data.writeTypedObject(new Bundle(expected), 0);
            data.writeLong(generation); data.writeTypedObject(surface, 0);
        });
    }

    public Bundle parkUi(long generation) throws Exception {
        requireWorkerThread(); clearGestureTarget();
        if (generation < 1) throw new IllegalArgumentException("invalid UI generation");
        return request(AtomicWorkbenchProtocol.TX_PARK_UI, data -> data.writeLong(generation));
    }

    public Bundle resumeUi(long generation) throws Exception {
        requireWorkerThread();
        if (generation < 1) throw new IllegalArgumentException("invalid UI generation");
        return request(AtomicWorkbenchProtocol.TX_RESUME_UI, data -> data.writeLong(generation));
    }

    public Bundle mediaAction(String action, Bundle metadata) throws Exception {
        requireWorkerThread();
        return request(AtomicWorkbenchProtocol.TX_MEDIA_ACTION, data -> {
            data.writeString(action); data.writeTypedObject(metadata == null ? null : new Bundle(metadata), 0);
        });
    }

    Bundle openMediaWindow(int id, Surface surface, int width, int height, int density,
            ComponentName component, AtomicWorkbenchMediaOpenRequest target) throws Exception {
        requireWorkerThread(); requireWindow(id);
        if (target == null || component == null || !target.component.equals(component.flattenToString())
                || !target.fresh(SystemClock.elapsedRealtime())) throw new IllegalArgumentException("stale_media_open");
        return request(AtomicWorkbenchProtocol.TX_OPEN_MEDIA, data -> {
            data.writeInt(id); data.writeStrongBinder(pending.owner); data.writeTypedObject(surface, 0);
            data.writeInt(width); data.writeInt(height); data.writeInt(density); data.writeString(target.component);
            data.writeTypedObject(target.metadata(), 0);
        });
    }

    Bundle focusMediaWindow(int id, ComponentName component, AtomicWorkbenchMediaOpenRequest target) throws Exception {
        requireWorkerThread(); requireWindow(id);
        if (target == null || component == null || !target.component.equals(component.flattenToString())
                || !target.fresh(SystemClock.elapsedRealtime())) throw new IllegalArgumentException("stale_media_open");
        return request(AtomicWorkbenchProtocol.TX_FOCUS_MEDIA, data -> {
            data.writeInt(id); data.writeString(target.component); data.writeTypedObject(target.metadata(), 0);
        });
    }

    Bundle notificationStateWithActions(String selected)throws Exception{
        Bundle selection=new Bundle();selection.putString("selected_source_id",selected);
        try{return notificationAction("state",selection);}catch(Exception unsupported){return notificationState();}
    }
    public Bundle notificationAction(String operation,Bundle metadata)throws Exception{
        requireWorkerThread();if(!java.util.Set.of("state","describe","send","describe_open","confirm_sent").contains(operation))throw new IllegalArgumentException("notification_operation");
        Bundle frozen=metadata==null?null:new Bundle(metadata);
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_NOTIFICATION_ACTION,data->{data.writeString(operation);data.writeTypedObject(frozen,0);});
    }
    Bundle openNotificationWindow(int id,Surface surface,int width,int height,int density,ComponentName component,AtomicWorkbenchNotificationOpenRequest target)throws Exception{
        requireWorkerThread();requireWindow(id);
        if(target==null||component==null||!target.component.equals(component.flattenToString())||!target.fresh(SystemClock.elapsedRealtime()))throw new IllegalArgumentException("stale_notification_open");
        return request(AtomicWorkbenchProtocol.TX_OPEN_NOTIFICATION,data->{
            data.writeInt(id);data.writeStrongBinder(pending.owner);data.writeTypedObject(surface,0);data.writeInt(width);data.writeInt(height);data.writeInt(density);
            data.writeString(target.component);data.writeTypedObject(target.metadata(),0);
        });
    }
    Bundle focusNotificationWindow(int id,ComponentName component,AtomicWorkbenchNotificationOpenRequest target)throws Exception{
        requireWorkerThread();requireWindow(id);
        if(target==null||component==null||!target.component.equals(component.flattenToString())||!target.fresh(SystemClock.elapsedRealtime()))throw new IllegalArgumentException("stale_notification_open");
        return request(AtomicWorkbenchProtocol.TX_FOCUS_NOTIFICATION,data->{data.writeInt(id);data.writeString(target.component);data.writeTypedObject(target.metadata(),0);});
    }

    public Bundle notificationState() throws Exception {
        requireWorkerThread(); return requestTaskMetadata(AtomicWorkbenchProtocol.TX_NOTIFICATION_STATE, null);
    }
    public Bundle recordTimer(Bundle metadata) throws Exception {
        requireWorkerThread(); if (metadata == null) throw new IllegalArgumentException("missing timer record metadata");
        Bundle frozen = new Bundle(metadata);
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_RECORD_TIMER, data -> data.writeTypedObject(frozen, 0));
    }

    public Bundle registerExtractionGeometry(Bundle geometry) throws Exception {
        requireWorkerThread(); if (geometry == null) throw new IllegalArgumentException("missing extraction geometry");
        Bundle frozen = new Bundle(geometry);
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_EXTRACTION_GEOMETRY, data -> {
            data.writeInt(1); data.writeTypedObject(frozen, 0);
        });
    }
    public Bundle clearAllExtractionGeometry() throws Exception {
        requireWorkerThread();
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_EXTRACTION_GEOMETRY, data -> {
            data.writeInt(3); data.writeTypedObject(new Bundle(), 0);
        });
    }
    public void invalidateExtractionGeometry(long minimumRevision) {
        if (minimumRevision < 1) return;
        IBinder binder = endpoint;
        if (closed || binder == null) return;
        Parcel data = Parcel.obtain();
        try {
            writeHeader(data); data.writeLong(minimumRevision);
            if (!binder.transact(AtomicWorkbenchProtocol.TX_INVALIDATE_EXTRACTION_GEOMETRY, data, null, IBinder.FLAG_ONEWAY)
                    && !binder.isBinderAlive()) reportFailure("工作台连接已中断，手机端将恢复应用任务");
        } catch (RuntimeException | RemoteException unavailable) {
            if (!binder.isBinderAlive()) reportFailure("工作台连接已中断，手机端将恢复应用任务");
        } finally { data.recycle(); }
    }

    /** One exact task action; an unknown reply must only be queried, never replayed. */
    public Bundle changeTask(Bundle metadata) throws Exception {
        requireWorkerThread();
        AtomicWorkbenchTaskOperationRequest request = AtomicWorkbenchTaskOperationRequest.fromBundle(metadata);
        request.requireFresh(SystemClock.elapsedRealtime());
        Bundle frozen = request.toBundle();
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_CHANGE_TASK, data -> data.writeTypedObject(frozen, 0));
    }

    public Bundle taskOperationState(String operationId) throws Exception {
        requireWorkerThread(); requireTaskOperationId(operationId);
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_TASK_OPERATION_STATE, data -> data.writeString(operationId));
    }

    public Bundle taskShelfState() throws Exception {
        requireWorkerThread();
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_TASK_SHELF_STATE, null);
    }

    /** Exact reference management; STATE only observes receipts and never repeats a lost mutation. */
    public Bundle manageTaskReferences(Bundle metadata) throws Exception {
        requireWorkerThread();
        AtomicWorkbenchTaskReferenceRequest request=AtomicWorkbenchTaskReferenceRequest.fromBundle(metadata);
        request.requireFresh(SystemClock.elapsedRealtime()); Bundle frozen=request.toBundle();
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_TASK_REFERENCES,data->data.writeTypedObject(frozen,0));
    }

    /** Allocate one empty receiver; a missing reply is resolved by status, never by replay. */
    public Bundle allocateTaskDisplay(int windowId, Surface surface, int width, int height, int density,
            long outputGeneration, String allocationId) throws Exception {
        requireWorkerThread(); requireWindow(windowId); requireTaskOperationId(allocationId);
        if (ResetWriteFence.active() || surface == null || !surface.isValid()
                || width < 1 || height < 1 || density < 1 || outputGeneration < 1)
            throw new IllegalArgumentException("invalid empty task display request");
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_ALLOCATE_TASK_DISPLAY, data -> {
            data.writeInt(windowId); data.writeStrongBinder(pending.owner); data.writeTypedObject(surface, 0);
            data.writeInt(width); data.writeInt(height); data.writeInt(density);
            data.writeLong(outputGeneration); data.writeString(allocationId);
        });
    }

    public Bundle cancelTaskOperation(String operationId) throws Exception {
        requireWorkerThread(); requireTaskOperationId(operationId);
        return requestTaskMetadata(AtomicWorkbenchProtocol.TX_CANCEL_TASK_OPERATION, data -> data.writeString(operationId));
    }

    private static void requireTaskOperationId(String id) {
        if (id == null || !id.matches("[0-9a-f]{32}")) throw new IllegalArgumentException("invalid task operation identity");
    }

    /** A live broker's delayed or missing reply cannot request recovery of unrelated windows. */
    private Bundle requestTaskMetadata(int code, ParcelWriter writer) throws Exception {
        IBinder binder = requireEndpoint();
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            writeHeader(data);
            if (writer != null) writer.write(data);
            if (!binder.transact(code, data, reply, 0)) throw new RemoteException("task operation unsupported");
            reply.readException();
            if (reply.dataSize() > 256 * 1024) throw new IOException("任务状态过大，原任务已保留");
            Bundle result = reply.readTypedObject(Bundle.CREATOR);
            reply.enforceNoDataAvail();
            if (result == null) throw new IOException("任务操作返回未知，原任务已保留");
            result.setClassLoader(AtomicWorkbenchClient.class.getClassLoader());
            return result;
        } catch (RemoteException unavailable) {
            if (!binder.isBinderAlive()) reportFailure("工作台连接已中断，手机端将恢复应用任务");
            throw unavailable;
        } finally { data.recycle(); reply.recycle(); }
    }

    public synchronized Bundle close() throws Exception {
        return close("recovery_retry");
    }

    public synchronized Bundle close(String reason) throws Exception {
        requireWorkerThread();
        final String closeReason = AtomicWorkbenchLifecyclePolicy.requireReason(reason);
        stopNavigation();
        clearGestureTarget();
        record("CLOSE_REQUEST", -1, null, -1, "reason=" + closeReason + ";alreadyClosed=" + closed, null);
        if (closed) {
            Bundle result = new Bundle();
            result.putBoolean("success", true);
            result.putBoolean("recovery_pending", false);
            result.putString("message", "工作台已关闭");
            return result;
        }
        Bundle result;
        AtomicWorkbenchClient recovery = recoveryClient;
        if (recovery != null) {
            result = recovery.close(closeReason);
        } else if (endpointDead()) {
            result = closeThroughRecoveryClient(closeReason);
        } else {
            try { result = request(AtomicWorkbenchProtocol.TX_CLOSE, data -> data.writeString(closeReason)); }
            catch (Exception error) {
                // Only a confirmed dead endpoint may be replaced: an alive root
                // may still own the display and must finish its own recovery.
                if (!endpointDead()) {
                    record("CLOSE_FAILED", -1, null, -1, "reason=" + closeReason + ";endpoint_alive=true", error);
                    throw error;
                }
                result = closeThroughRecoveryClient(closeReason);
            }
        }
        if (result.getBoolean("success", false)
                && !result.getBoolean("recovery_pending", false)) {
            closed = true;
            IBinder binder = endpoint;
            if (binder != null) try { binder.unlinkToDeath(deathRecipient, 0); }
            catch (RuntimeException ignored) { }
            endpoint = null;
            AtomicWorkbenchProvider.remove(pending);
            // The root decides when it can exit after task restoration. No process.destroy().
        }
        record("CLOSE_RESULT", -1, null, -1, "reason=" + closeReason
                + ";success=" + result.getBoolean("success") + ";recovery_pending=" + result.getBoolean("recovery_pending")
                + ";primary_home_focus=" + result.getBoolean("primary_home_focus_requested"), null);
        return result;
    }

    public void setFailureListener(Consumer<String> listener) {
        failureListener = listener;
        AtomicWorkbenchClient recovery = recoveryClient;
        if (recovery != null) recovery.setFailureListener(this::reportFailure);
        String message = failure.get();
        if (listener != null && message != null) postFailure(listener, message);
    }

    private Bundle request(int code, ParcelWriter writer) throws Exception {
        return requestOnEndpoint(requireEndpoint(), code, writer);
    }

    private Bundle requestOnEndpoint(IBinder binder, int code, ParcelWriter writer) throws Exception {
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            writeHeader(data);
            if (writer != null) writer.write(data);
            if (!binder.transact(code, data, reply, 0))
                throw new RemoteException("workbench operation unsupported");
            reply.readException();
            Bundle result = reply.readTypedObject(Bundle.CREATOR);
            if (result == null) throw new IOException("工作台返回了空响应");
            result.setClassLoader(AtomicWorkbenchClient.class.getClassLoader());
            if (taskStorageScope(result) >= 0 && !closed && recoveryClient == null && failure.get() == null
                    && endpoint == binder && binder.isBinderAlive()) taskStorageScopeEndpoint = binder;
            return result;
        } catch (RemoteException error) {
            reportFailure("工作台连接已中断，手机端将恢复应用任务");
            throw error;
        } finally {
            data.recycle();
            reply.recycle();
        }
    }

    private boolean sendOneway(int code, ParcelWriter writer) {
        IBinder binder = endpoint;
        if (closed || binder == null) return false;
        Parcel data = Parcel.obtain();
        try {
            writeHeader(data);
            writer.write(data);
            if (!binder.transact(code, data, null, IBinder.FLAG_ONEWAY))
                throw new RemoteException("workbench input unsupported");
            return true;
        } catch (RuntimeException | RemoteException error) {
            reportFailure("工作台输入连接已中断，请退出并恢复应用");
            return false;
        } finally {
            data.recycle();
        }
    }

    private IBinder requireEndpoint() throws IOException {
        IBinder binder = endpoint;
        if (closed || binder == null || !binder.isBinderAlive())
            throw new IOException("工作台连接不可用");
        return binder;
    }

    boolean live() { return !closed && !endpointDead(); }

    private boolean endpointDead() {
        IBinder binder = endpoint;
        return binder == null || !binder.isBinderAlive();
    }

    private Bundle closeThroughRecoveryClient(String reason) throws Exception {
        record("CLOSE_RECONNECT", -1, null, -1, "reason=" + reason + ";endpoint_dead=true", null);
        AtomicWorkbenchProvider.remove(pending);
        AtomicWorkbenchClient replacement = connect(application);
        // Retain even an unresolved recovery session, so the next retry reaches
        // the same root rather than spawning a second display owner.
        recoveryClient = replacement;
        failure.set(null);
        replacement.setFailureListener(this::reportFailure);
        return replacement.close(reason);
    }

    private void requestAbandonedConnectionClose(IBinder registered) {
        endpoint = registered;
        FutureTask<Bundle> shutdown = new FutureTask<>(() -> {
            // Do not consult this client's closed bit: connect may already have
            // thrown while a slow root is still completing this safe shutdown.
            Parcel data = Parcel.obtain(), reply = Parcel.obtain();
            try {
                writeHeader(data);
                data.writeString("abandoned_connect");
                if (!registered.transact(AtomicWorkbenchProtocol.TX_CLOSE, data, reply, 0))
                    throw new RemoteException("workbench shutdown unsupported");
                reply.readException();
                return reply.readTypedObject(Bundle.CREATOR);
            } finally {
                data.recycle();
                reply.recycle();
            }
        });
        Thread worker = new Thread(shutdown, "atomic-workbench-abandoned-close");
        worker.setDaemon(true);
        worker.start();
        try { shutdown.get(2500L, TimeUnit.MILLISECONDS); }
        catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); }
        catch (Exception ignored) {
            // The request continues on its worker. The registered root retains
            // responsibility for journal recovery; it is never forcibly killed.
        }
    }

    private void writeHeader(Parcel data) {
        data.writeInterfaceToken(AtomicWorkbenchProtocol.DESCRIPTOR);
        data.writeInt(AtomicWorkbenchProtocol.VERSION);
        data.writeString(pending.token);
    }

    private void writeBootstrap() {
        Thread thread = new Thread(() -> {
            try (OutputStream output = process.getOutputStream()) {
                JSONObject bootstrap = new JSONObject();
                bootstrap.put("token", pending.token);
                bootstrap.put("uid", pending.uid);
                bootstrap.put("user", pending.userId);
                bootstrap.put("authority", AtomicWorkbenchProtocol.AUTHORITY);
                bootstrap.put("version", AtomicWorkbenchProtocol.VERSION);
                output.write((bootstrap.toString() + "\n").getBytes(StandardCharsets.UTF_8));
                output.flush();
            } catch (Exception error) {
                record("BOOTSTRAP_WRITE_FAILED", -1, null, -1, "", error);
                reportFailure("无法向 Root 服务发送工作台会话");
                pending.ready.countDown();
            }
        }, "atomic-workbench-bootstrap");
        thread.setDaemon(true);
        thread.start();
    }

    private void startOutputDrain() {
        Thread thread = new Thread(() -> {
            try (InputStreamReader reader = new InputStreamReader(
                    process.getInputStream(), StandardCharsets.UTF_8)) {
                StringBuilder line = new StringBuilder();
                boolean truncated = false;
                int next;
                while ((next = reader.read()) != -1) {
                    if (next == '\n') {
                        retainDiagnostic(line.toString(), truncated);
                        line.setLength(0);
                        truncated = false;
                    } else if (line.length() < MAX_OUTPUT_LINE) {
                        line.append((char) next);
                    } else {
                        truncated = true;
                    }
                }
                if (line.length() > 0) retainDiagnostic(line.toString(), truncated);
            } catch (IOException error) {
                record("ROOT_OUTPUT_READ_FAILED", -1, null, -1, "", error);
                // Process death is reported by the dedicated waiter or Binder death recipient.
            }
        }, "atomic-workbench-output");
        thread.setDaemon(true);
        thread.start();
    }

    private void startExitWatcher() {
        Thread thread = new Thread(() -> {
            try {
                int code = process.waitFor();
                record("ROOT_EXIT", -1, null, -1, "exitCode=" + code + ";clientClosed=" + closed, null);
                pending.ready.countDown();
                if (!closed) reportFailure("工作台 Root 服务已退出（" + code + "）");
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
            }
        }, "atomic-workbench-exit");
        thread.setDaemon(true);
        thread.start();
    }

    private void reportFailure(String message) {
        if (closed) return;
        String safe = sanitize(message);
        if (!failure.compareAndSet(null, safe)) return;
        record("CONNECTION_FAILURE", -1, null, -1, safe, null);
        Consumer<String> listener = failureListener;
        if (listener != null) postFailure(listener, safe);
    }

    private void postFailure(Consumer<String> listener, String message) {
        main.post(() -> {
            if (!closed && failureListener == listener) listener.accept(message);
        });
    }

    private void retainDiagnostic(String line, boolean truncated) {
        AtomicWorkbenchDiagnostics.retainOutput(application, diagnosticGeneration, pending.userId,
                line, pending.token, truncated);
    }

    private void record(String event, int windowId, ComponentName component, int displayId,
            String detail, Throwable error) {
        try {
            AtomicWorkbenchDiagnostics.record(application, diagnosticGeneration, event, windowId, pending.userId,
                    component == null ? "" : component.flattenToString(), displayId,
                    AtomicWorkbenchDiagnostics.safe(detail, pending.token, 2048), error);
        } catch (Throwable ignored) { }
    }

    private String sanitize(String text) {
        String safe = text == null ? "" : text.replace(pending.token, "[redacted]");
        return safe.replaceAll("[\\p{Cntrl}&&[^\\t]]", " ");
    }

    private static String shellQuote(String text) {
        if (text == null || text.isEmpty()) throw new IllegalArgumentException("missing APK path");
        return "'" + text.replace("'", "'\"'\"'") + "'";
    }

    private static void requireWorkerThread() {
        if (Looper.myLooper() == Looper.getMainLooper())
            throw new IllegalStateException("工作台连接和任务操作必须在后台执行");
    }

    private static void requireWindow(int id) {
        if (id < 0 || id >= AtomicWorkbenchProtocol.WINDOW_POOL_COUNT) throw new IllegalArgumentException("invalid window");
    }

    private interface ParcelWriter { void write(Parcel data); }
}
