package ls.augment.com;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Process;
import android.os.SystemClock;
import java.security.SecureRandom;
import java.util.concurrent.CountDownLatch;

/** Only UID 0 may hand a root endpoint to a user-initiated, one-use launch. */
public final class AtomicWorkbenchProvider extends ContentProvider {
    static final String HOME_READINESS = "home_readiness";
    static final String FOCUS_CONTROL = "focus_control";
    static final String INPUT_SESSION = "input_session";
    static final String SYSTEM_ROOT_SESSION = "system_root_session";
    static final String EXTRACTION_SESSION_STATE = "extraction_session_state";

    // Provider-created process context; pending Binder/death/session teardown retires the navigation binding.
    //noinspection StaticFieldLeak
    private static Pending pending;
    private static final long GESTURE_TARGET_MAX_AGE_MS = 2500L;
    private static Bundle gestureTarget;
    private static Bundle nativeGesture;
    private static long nativeGestureSeen;
    private static final AtomicWorkbenchAmapMemory navigationMemory = new AtomicWorkbenchAmapMemory();

    static final class Pending {
        final String token;
        final IBinder owner = new Binder();
        final CountDownLatch ready = new CountDownLatch(1);
        final int uid, userId;
        final Context navigationContext;
        final long resetGeneration = ResetWriteFence.generation();
        final boolean resetOwner = ResetWriteFence.owns();
        final long startedAt = SystemClock.elapsedRealtime();
        volatile IBinder endpoint;
        volatile int rootPid = -1;
        volatile String failure = "";
        AtomicWorkbenchAmapLinkClient navigationLink;
        AtomicWorkbenchFocusBridge focusBridge;
        private Pending(Context context) {
            navigationContext = context;
            byte[] bytes = new byte[32];
            new SecureRandom().nextBytes(bytes);
            StringBuilder value = new StringBuilder(64);
            for (byte item : bytes) value.append(String.format(java.util.Locale.ROOT, "%02x", item & 255));
            token = value.toString();
            uid = Process.myUid();
            userId = uid / 100000;
        }
    }

    static String authority(Context context) { return AtomicWorkbenchProtocol.AUTHORITY; }

    static synchronized Pending prepare(Context context) {
        if (ResetWriteFence.blocked()) throw new IllegalStateException("正在重置模块，请稍后启动工作台");
        if (!AtomicWorkbenchProtocol.PACKAGE.equals(context.getPackageName()))
            throw new SecurityException("工作台应用身份不符");
        if (pending != null && (pending.endpoint != null ? pending.endpoint.isBinderAlive()
                : SystemClock.elapsedRealtime() - pending.startedAt < 25000L))
            throw new IllegalStateException("已有工作台正在启动、运行或恢复，请先完成退出");
        gestureTarget = nativeGesture = null;
        navigationMemory.stop(null);
        stopNavigationLink(pending);
        closeFocusBridge(pending);
        pending = new Pending(context);
        return pending;
    }

    static synchronized void remove(Pending target) {
        if (pending == target) {
            navigationMemory.stop(target); stopNavigationLink(target); closeFocusBridge(target);
            gestureTarget = nativeGesture = null; pending = null;
        }
    }

    private static void closeFocusBridge(Pending target) {
        if (target != null && target.focusBridge != null) target.focusBridge.requestClose();
    }

    /** Same-process calls only: an active UI poll leases navigation consumption for three seconds. */
    static synchronized void touchNavigation(Pending owner) {
        if (navigationOwner(owner)) {
            navigationMemory.touch(owner, owner.startedAt);
            if (owner.navigationLink == null || owner.navigationLink.isClosed())
                owner.navigationLink = new AtomicWorkbenchAmapLinkClient(owner.navigationContext, owner.startedAt);
            owner.navigationLink.touch();
        } else { navigationMemory.stop(owner); stopNavigationLink(owner); }
    }

    static synchronized void stopNavigation(Pending owner) { navigationMemory.stop(owner); stopNavigationLink(owner); }

    private static void stopNavigationLink(Pending owner) {
        if (owner != null && owner.navigationLink != null) {
            owner.navigationLink.close(); owner.navigationLink = null;
        }
    }

    static synchronized Bundle mergeNavigation(Pending owner, Bundle state) {
        if (!navigationOwner(owner)) { navigationMemory.stop(owner); stopNavigationLink(owner); return state; }
        Bundle merged = navigationMemory.merge(owner, state);
        if (state == null || !state.getBoolean("owner_user_current", false)) {
            stopNavigationLink(owner); return merged;
        }
        return owner.navigationLink == null ? merged : owner.navigationLink.merge(merged);
    }

    private static boolean navigationOwner(Pending owner) {
        return owner != null && owner == pending && owner.uid == Process.myUid()
                && owner.endpoint != null && owner.endpoint.isBinderAlive() && owner.owner.isBinderAlive()
                && owner.resetGeneration == ResetWriteFence.generation() && !ResetWriteFence.blocked()
                && navigationEnabled(owner);
    }

    private static boolean navigationEnabled(Pending owner) {
        long identity = Binder.clearCallingIdentity();
        try {
            AppConfig config = new AppConfig(owner.navigationContext);
            return config.getBoolean(AtomicWorkbenchConfig.ENABLED) && config.getBoolean(AtomicWorkbenchConfig.SHOW_MEDIA);
        } catch (RuntimeException unavailable) { return false; }
        finally { Binder.restoreCallingIdentity(identity); }
    }

    /** The live UI publishes only a Root-confirmed foreground slot, never an entry credential. */
    static synchronized void publishGestureTarget(Pending owner, int displayId, int windowId, int hostTaskId, String uniqueId) {
        if (owner != pending || owner == null) return;
        if (displayId <= 0 || windowId < 0 || windowId >= AtomicWorkbenchProtocol.WINDOW_POOL_COUNT || hostTaskId < 1
                || uniqueId == null || !uniqueId.matches("[A-Za-z0-9_.$:/,+-]{1,256}")
                || owner.endpoint == null || !owner.endpoint.isBinderAlive() || ResetWriteFence.blocked()) {
            gestureTarget = nativeGesture = null; return;
        }
        Bundle target = new Bundle();
        target.putBoolean("active", true);
        target.putInt("display_id", displayId);
        target.putString("display_unique_id", uniqueId);
        target.putInt("window_id", windowId);
        target.putInt("host_task_id", hostTaskId);
        target.putInt("owner_uid", owner.uid);
        target.putInt("user", owner.userId);
        target.putLong("session", owner.startedAt);
        target.putLong("updated_elapsed", SystemClock.elapsedRealtime());
        if (nativeGesture != null && !sameGestureTarget(nativeGesture, target)) nativeGesture = null;
        gestureTarget = target;
    }

    static synchronized void clearGestureTarget(Pending owner) {
        if (owner == pending) gestureTarget = nativeGesture = null;
    }

    private static boolean sameGestureTarget(Bundle left, Bundle right) {
        if (left == null || right == null) return false;
        for (String key : new String[]{"session", "display_id", "window_id", "host_task_id", "owner_uid", "user", "display_unique_id"})
            if (left.get(key) == null || !left.get(key).equals(right.get(key))) return false;
        return true;
    }

    /** Only defers the UI's automatic focus repair; it never grants input authority. */
    static synchronized boolean nativeGestureActive(Pending owner) {
        if (owner == null || owner != pending) return false;
        long now = SystemClock.elapsedRealtime();
        if (nativeGesture == null || !sameGestureTarget(nativeGesture, gestureTarget)
                || owner.endpoint == null || !owner.endpoint.isBinderAlive() || !owner.owner.isBinderAlive()
                || owner.resetGeneration != ResetWriteFence.generation() || ResetWriteFence.blocked()
                || now < nativeGestureSeen || now - nativeGestureSeen > 30_000L) {
            nativeGesture = null; return false;
        }
        return true;
    }

    private Bundle controlNativeGesture(String action, Bundle request) {
        // readGestureTarget applies the existing current-HOME UID and user check.
        Bundle target = readGestureTarget(null, null);
        if ((!"begin".equals(action) && !"end".equals(action)) || request == null
                || !request.keySet().equals(java.util.Set.of("session", "display_id", "window_id", "host_task_id",
                        "owner_uid", "user", "display_unique_id", "down_time"))
                || !(request.get("down_time") instanceof Long)) throw new IllegalArgumentException("原生手势请求无效");
        synchronized (AtomicWorkbenchProvider.class) {
            boolean accepted = false;
            if ("begin".equals(action)) {
                long down = request.getLong("down_time", -1L), age = SystemClock.uptimeMillis() - down;
                if (down >= 0 && age >= 0 && age <= 1500L && target.getBoolean("active", false)
                        && sameGestureTarget(request, target) && sameGestureTarget(request, gestureTarget)
                        && (nativeGesture == null || request.getLong("down_time", -1L) >= nativeGesture.getLong("down_time", -1L))) {
                    nativeGesture = new Bundle(request); nativeGestureSeen = SystemClock.elapsedRealtime(); accepted = true;
                }
            } else if (sameGestureTarget(request, nativeGesture)
                    && request.getLong("down_time", -1L) == nativeGesture.getLong("down_time", -2L)) {
                nativeGesture = null; accepted = true;
            }
            Bundle reply = new Bundle(); reply.putBoolean("success", accepted); return reply;
        }
    }

    private Bundle readGestureTarget(String arg, Bundle extras) {
        if (arg != null || extras != null) throw new IllegalArgumentException("手势目标仅支持只读查询");
        final int caller = Binder.getCallingUid();
        ResolveInfo home = getContext().getPackageManager().resolveActivity(
                new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME), PackageManager.MATCH_DEFAULT_ONLY);
        if (caller / 100000 != Process.myUid() / 100000 || home == null || home.activityInfo == null
                || home.activityInfo.applicationInfo == null || home.activityInfo.applicationInfo.uid != caller)
            throw new SecurityException("手势目标仅允许当前原厂桌面读取");
        synchronized (AtomicWorkbenchProvider.class) {
            long now = SystemClock.elapsedRealtime();
            if (gestureTarget == null || pending == null || pending.endpoint == null || !pending.endpoint.isBinderAlive()
                    || gestureTarget.getLong("session", -1L) != pending.startedAt
                    || pending.resetGeneration != ResetWriteFence.generation() || ResetWriteFence.blocked()
                    || now < gestureTarget.getLong("updated_elapsed", -1L)
                    || now - gestureTarget.getLong("updated_elapsed", -1L) > GESTURE_TARGET_MAX_AGE_MS) {
                gestureTarget = nativeGesture = null;
                Bundle inactive = new Bundle(); inactive.putBoolean("active", false); return inactive;
            }
            if (nativeGestureActive(pending)) nativeGestureSeen = now;
            return new Bundle(gestureTarget);
        }
    }

    static synchronized Pending existingForReset() {
        if (!ResetWriteFence.owns()) throw new IllegalStateException("重置调用身份无效");
        if (pending != null && pending.endpoint == null) {
            pending.failure = "模块重置已取消工作台启动";
            pending.ready.countDown();
            pending = null;
        }
        return pending;
    }

    static synchronized boolean hasLiveEndpoint() {
        return pending != null && pending.endpoint != null && pending.endpoint.isBinderAlive();
    }

    @Override public boolean onCreate() { return true; }

    @Override public Bundle call(String method, String arg, Bundle extras) {
        if (AtomicWorkbenchSourceDragData.PROBE.equals(method) || AtomicWorkbenchSourceDragData.OFFER.equals(method))
            return AtomicWorkbenchSourceDragBridge.call(method, arg, extras);
        if (AtomicWorkbenchAmapData.REGISTER.equals(method) || AtomicWorkbenchAmapData.PUBLISH.equals(method))
            return writeAmapNavigation(method, arg, extras);
        if ("gesture_target".equals(method)) return readGestureTarget(arg, extras);
        if ("native_gesture".equals(method)) return controlNativeGesture(arg, extras);
        if (HOME_READINESS.equals(method)) return readHomeReadiness(arg, extras);
        if (FOCUS_CONTROL.equals(method)) return controlFocus(arg, extras);
        if (INPUT_SESSION.equals(method)) return inputSession(arg, extras);
        if (SYSTEM_ROOT_SESSION.equals(method)) return systemRootSession(arg, extras);
        if (EXTRACTION_SESSION_STATE.equals(method)) return extractionSessionState(arg, extras);
        if (Binder.getCallingUid() != Process.ROOT_UID)
            throw new SecurityException("工作台接口仅接受手机 Root 进程登记");
        if (!AtomicWorkbenchProtocol.REGISTER.equals(method) || arg != null || extras == null)
            throw new IllegalArgumentException("不支持的工作台请求");
        synchronized (AtomicWorkbenchProvider.class) {
            Pending request = pending;
            if (request == null || request.endpoint != null
                    || ResetWriteFence.active() && !request.resetOwner
                    || request.resetGeneration != ResetWriteFence.generation()
                    || SystemClock.elapsedRealtime() - request.startedAt > 25000L
                    || extras.getInt("version", -1) != AtomicWorkbenchProtocol.VERSION
                    || extras.getInt("uid", -1) != request.uid
                    || extras.getInt("user", -1) != request.userId
                    || !AtomicWorkbenchProtocol.sameToken(request.token, extras.getString("token")))
                throw new SecurityException("工作台启动凭据已失效");
            IBinder endpoint = extras.getBinder("endpoint");
            if (endpoint == null || !endpoint.isBinderAlive())
                throw new IllegalArgumentException("工作台 Root 接口不可用");
            AtomicWorkbenchFocusBridge bridge = new AtomicWorkbenchFocusBridge(request.navigationContext,
                    request.uid, request.userId, endpoint, Binder.getCallingPid(), request.startedAt);
            request.focusBridge = bridge;
            request.endpoint = endpoint;
            request.rootPid = Binder.getCallingPid();
            request.ready.countDown();
            Bundle result = new Bundle();
            result.putBoolean("success", true);
            result.putBinder("owner", request.owner);
            result.putLong("session", request.startedAt);
            result.putLong("reset_generation", request.resetGeneration);
            return result;
        }
    }

    /** Read-only session fence; no window/backend call runs under the Provider monitor. */
    private Bundle inputSession(String arg, Bundle extras) {
        synchronized (AtomicWorkbenchProvider.class) {
            Pending request = pending;
            if (Binder.getCallingUid() != Process.ROOT_UID || arg != null || extras == null
                    || request == null || request.endpoint == null || request.rootPid <= 0
                    || Binder.getCallingPid() != request.rootPid || !request.endpoint.isBinderAlive()
                    || !request.owner.isBinderAlive()
                    || extras.getInt("version", -1) != AtomicWorkbenchProtocol.VERSION
                    || extras.getLong("session", -1L) != request.startedAt
                    || !request.endpoint.equals(extras.getBinder("endpoint"))
                    || !AtomicWorkbenchProtocol.sameToken(request.token, extras.getString("token"))
                    || extras.getInt("uid", -1) != request.uid || extras.getInt("user", -1) != request.userId
                    || request.uid != Process.myUid() || request.uid / 100000 != request.userId)
                throw new SecurityException("工作台输入会话身份不符");
            Bundle result = new Bundle();
            result.putBoolean("current", !ResetWriteFence.blocked()
                    && request.resetGeneration == ResetWriteFence.generation()
                    && extras.getLong("reset_generation", -1L) == request.resetGeneration);
            return result;
        }
    }

    /** System-server brokers recheck a Root credential captured before clearing Binder identity. */
    private Bundle systemRootSession(String arg, Bundle extras) {
        if (Binder.getCallingUid() != 1000 || arg != null || !systemSessionShape(extras))
            throw new SecurityException("工作台系统会话身份不符");
        synchronized (AtomicWorkbenchProvider.class) {
            Pending request = pending;
            if (request == null || request.endpoint == null || request.rootPid <= 0
                    || !request.endpoint.isBinderAlive() || !request.owner.isBinderAlive()
                    || extras.getInt("version", -1) != AtomicWorkbenchProtocol.VERSION
                    || extras.getInt("root_pid", -1) != request.rootPid
                    || extras.getInt("uid", -1) != request.uid || extras.getInt("user", -1) != request.userId
                    || extras.getLong("session", -1L) != request.startedAt
                    || extras.getLong("reset_generation", -1L) != request.resetGeneration
                    || !request.endpoint.equals(extras.getBinder("endpoint"))
                    || !AtomicWorkbenchProtocol.sameToken(request.token, extras.getString("token"))
                    || request.uid != Process.myUid() || request.uid / 100000 != request.userId)
                throw new SecurityException("工作台系统会话身份不符");
            Bundle result = new Bundle();
            result.putInt("version", AtomicWorkbenchProtocol.VERSION);
            result.putBoolean("current", !ResetWriteFence.blocked()
                    && request.resetGeneration == ResetWriteFence.generation());
            result.putString("nonce", extras.getString("nonce"));
            result.putBinder("owner", request.owner);
            result.putLong("session", request.startedAt);
            result.putLong("reset_generation", request.resetGeneration);
            result.putInt("uid", request.uid); result.putInt("user", request.userId);
            result.putInt("root_pid", request.rootPid);
            return result;
        }
    }

    private static boolean systemSessionShape(Bundle value) {
        try {
            if (value == null || !value.keySet().equals(java.util.Set.of("version", "uid", "user", "session",
                    "reset_generation", "root_pid", "endpoint", "token", "nonce"))) return false;
            return value.get("version") instanceof Integer && value.get("uid") instanceof Integer
                    && value.get("user") instanceof Integer && value.get("session") instanceof Long
                    && value.get("reset_generation") instanceof Long && value.get("root_pid") instanceof Integer
                    && value.get("endpoint") instanceof IBinder && value.get("token") instanceof String
                    && ((String) value.get("token")).matches("[0-9a-f]{64}")
                    && value.get("nonce") instanceof String && ((String) value.get("nonce")).matches("[0-9a-f]{32}");
        } catch (RuntimeException invalid) { return false; }
    }

    /** Read actual local service/config state; callers cannot register a service through this API. */
    private Bundle extractionSessionState(String arg, Bundle extras) {
        if (Binder.getCallingUid() != 1000 || arg != null || extras == null
                || !extras.keySet().equals(java.util.Set.of("schema", "nonce", "user", "module_uid"))
                || !(extras.get("schema") instanceof Integer) || extras.getInt("schema", -1) != 1
                || !(extras.get("module_uid") instanceof Integer) || extras.getInt("module_uid", -1) != Process.myUid()
                || !(extras.get("user") instanceof Integer) || extras.getInt("user", -1) != Process.myUid() / 100000
                || !(extras.get("nonce") instanceof String) || !extras.getString("nonce").matches("[0-9a-f]{32}"))
            throw new SecurityException("提取服务状态身份不符");
        long identity = Binder.clearCallingIdentity();
        try {
            long reset = ResetWriteFence.generation();
            Bundle first = AtomicWorkbenchExtractionSystemBridge.localState();
            AppConfig config = new AppConfig(getContext());
            ConfigSnapshot snapshot = config.configSnapshot();
            Bundle last = AtomicWorkbenchExtractionSystemBridge.localState();
            ConfigSnapshot checked = config.configSnapshot();
            if (snapshot == null || checked == null) throw new IllegalStateException("提取配置不可用");
            long checkedReset = ResetWriteFence.generation();
            boolean blocked = ResetWriteFence.active() || reset != checkedReset;
            boolean stable = extractionLocalState(first) && extractionLocalState(last)
                    && first.getBoolean("connected", false) && last.getBoolean("connected", false)
                    && first.getString("service_generation").equals(last.getString("service_generation"))
                    && snapshot.revision == checked.revision && snapshot.checksum.equals(checked.checksum);
            Bundle result = new Bundle(); result.putInt("schema", 1); result.putString("nonce", extras.getString("nonce"));
            result.putInt("module_uid", Process.myUid()); result.putInt("user", Process.myUid() / 100000);
            result.putString("service_generation", stable && !blocked ? last.getString("service_generation") : "");
            result.putBoolean("connected", stable && !blocked);
            result.putLong("config_revision", checked.revision); result.putString("config_checksum", checked.checksum);
            result.putLong("reset_generation", checkedReset); result.putBoolean("reset_blocked", blocked);
            return result;
        } finally { Binder.restoreCallingIdentity(identity); }
    }

    private static boolean extractionLocalState(Bundle value) {
        return value != null && value.keySet().equals(java.util.Set.of("service_generation", "connected", "module_uid"))
                && value.get("module_uid") instanceof Integer && value.getInt("module_uid", -1) == Process.myUid()
                && value.get("connected") instanceof Boolean && value.get("service_generation") instanceof String
                && (!value.getBoolean("connected", false) || value.getString("service_generation").matches("[0-9a-f]{32}"));
    }

    /** The managed app owns ViewRootImpl; only its exact, live Root session may control it. */
    private Bundle controlFocus(String arg, Bundle extras) {
        final AtomicWorkbenchFocusBridge bridge;
        final Bundle identity;
        final String action;
        synchronized (AtomicWorkbenchProvider.class) {
            Pending request = pending;
            action = extras == null ? "" : extras.getString("focus_action", "");
            if (Binder.getCallingUid() != Process.ROOT_UID || arg != null || extras == null
                    || request == null || request.endpoint == null || request.focusBridge == null
                    || request.rootPid <= 0 || Binder.getCallingPid() != request.rootPid
                    || !request.endpoint.isBinderAlive() || !request.owner.isBinderAlive()
                    || "suspend".equals(action) && (request.resetGeneration != ResetWriteFence.generation() || ResetWriteFence.blocked())
                    || extras.getInt("version", -1) != AtomicWorkbenchProtocol.VERSION
                    || extras.getLong("session", -1L) != request.startedAt
                    || !request.endpoint.equals(extras.getBinder("endpoint"))
                    || !AtomicWorkbenchProtocol.sameToken(request.token, extras.getString("token"))
                    || extras.getInt("uid", -1) != request.uid || extras.getInt("user", -1) != request.userId
                    || request.uid / 100000 != request.userId || Process.myUid() != request.uid)
                throw new SecurityException("窗口焦点会话身份不符");
            if (!"suspend".equals(action) && !"resume".equals(action) && !"close".equals(action))
                throw new IllegalArgumentException("不支持的窗口焦点操作");
            // Credentials never enter a Window title, callback or diagnostic record.
            identity = new Bundle();
            identity.putInt("window_id", extras.getInt("window_id", -1));
            identity.putInt("display_id", extras.getInt("display_id", -1));
            identity.putString("display_name", extras.getString("display_name", ""));
            identity.putString("unique_id", extras.getString("unique_id", ""));
            bridge = request.focusBridge;
        }
        // Actual focus/detach waits must never hold the Provider session monitor. Root death,
        // normal UI polling and recovery remain able to enter the Provider while this runs.
        return bridge.control(action, identity);
    }

    /** Independent, exact-package channel; it never exposes Root credentials or a read API. */
    private Bundle writeAmapNavigation(String method, String arg, Bundle extras) {
        final int uid = Binder.getCallingUid(), pid = Binder.getCallingPid();
        Bundle rejected = new Bundle(); rejected.putBoolean("success", false);
        try {
            if (arg != null || extras == null || pid <= 0 || uid / 100000 != Process.myUid() / 100000
                    || !AtomicWorkbenchAmapData.PACKAGE.equals(getCallingPackage())) return rejected;
            PackageManager manager = getContext().getPackageManager();
            String[] packages = manager.getPackagesForUid(uid);
            if (packages == null || !java.util.Arrays.asList(packages).contains(AtomicWorkbenchAmapData.PACKAGE)
                    || manager.getApplicationInfo(AtomicWorkbenchAmapData.PACKAGE, 0).uid != uid) return rejected;
            synchronized (AtomicWorkbenchProvider.class) {
                Pending owner = pending;
                if (!navigationOwner(owner)) { navigationMemory.stop(owner); stopNavigationLink(owner); return rejected; }
                Bundle response = AtomicWorkbenchAmapData.REGISTER.equals(method)
                        ? navigationMemory.register(owner, uid, pid, extras)
                        : navigationMemory.publish(owner, uid, pid, extras);
                if (AtomicWorkbenchAmapData.PUBLISH.equals(method) && response.getBoolean("success", false)
                        && owner.navigationLink != null) owner.navigationLink.routeState(extras.getLong("route", -1L),
                        "ended".equals(extras.getString("status", "")));
                return response;
            }
        } catch (PackageManager.NameNotFoundException | RuntimeException invalid) {
            // Route text, malformed parcel contents and sender exception messages are never logged.
            return rejected;
        }
    }

    /** Read one WM observation for this registered Root, never arbitrary module configuration. */
    private Bundle readHomeReadiness(String arg, Bundle extras) {
        synchronized (AtomicWorkbenchProvider.class) {
            Pending request = pending;
            String rejection = null;
            if (Binder.getCallingUid() != Process.ROOT_UID) rejection = "caller_uid";
            else if (arg != null || extras == null) rejection = "request_shape";
            else if (request == null || request.endpoint == null) rejection = "session_missing";
            else if (request.rootPid <= 0 || Binder.getCallingPid() != request.rootPid) rejection = "caller_pid";
            else if (!request.endpoint.isBinderAlive() || !request.owner.isBinderAlive()) rejection = "session_dead";
            else if (request.resetGeneration != ResetWriteFence.generation() || ResetWriteFence.blocked()) rejection = "reset_generation";
            else if (extras.getInt("version", -1) != AtomicWorkbenchProtocol.VERSION
                    || extras.getLong("session", -1L) != request.startedAt
                    || !request.endpoint.equals(extras.getBinder("endpoint"))
                    || !AtomicWorkbenchProtocol.sameToken(request.token, extras.getString("token"))) rejection = "session_identity";
            else if (extras.getInt("uid", -1) != request.uid || extras.getInt("user", -1) != request.userId
                    || request.uid / 100000 != request.userId || Process.myUid() != request.uid) rejection = "owner_user";
            if (rejection != null) return readinessRejected(rejection);
            int window = extras.getInt("window_id", -1), display = extras.getInt("display_id", -1);
            int task = extras.getInt("home_task_id", -1);
            String name = extras.getString("display_name", ""), unique = extras.getString("unique_id", "");
            String prefix = "DuoAtomic-" + request.uid + "-w" + window + "-";
            if (window < 0 || window >= AtomicWorkbenchProtocol.WINDOW_POOL_COUNT || display <= 0 || task < 0
                    || !name.startsWith(prefix) || unique.isEmpty() || unique.length() > 512)
                return readinessRejected("display_identity");
            try {
                String suffix = name.substring(prefix.length());
                if (!java.util.UUID.fromString(suffix).toString().equals(suffix)) return readinessRejected("display_identity");
            } catch (IllegalArgumentException malformed) { return readinessRejected("display_identity"); }
            // The Root independently authenticates the live VD/task before requesting this exact
            // identity. The stored WM report must bind to it as well; callers cannot select a key.
            long identity = Binder.clearCallingIdentity();
            try {
                String key = "ls_augment_atomic_home_readiness_" + display;
                String value = getContext().getSharedPreferences(AppConfig.DIAGNOSTICS, 0).getString(key, "");
                String[] fields = value.split("\\|", -1);
                if (fields.length != 14 || !"HR1".equals(fields[0])) return readinessRejected("observation_missing");
                if (Integer.parseInt(fields[1]) != BuildConfig.VERSION_CODE || Integer.parseInt(fields[2]) != display
                        || !unique.equals(fields[3]) || Integer.parseInt(fields[4]) != task)
                    return readinessRejected("observation_identity");
                if (!AtomicWorkbenchReadinessEvidence.matches(getContext(), key, value)) return readinessRejected("observation_source");
                Bundle result = new Bundle(); result.putBoolean("success", true); result.putString("value", value);
                result.putString("readiness_reason", "observation_read"); return result;
            } catch (RuntimeException malformed) { return readinessRejected("observation_invalid"); }
            finally { Binder.restoreCallingIdentity(identity); }
        }
    }

    private static Bundle readinessRejected(String reason) {
        Bundle result = new Bundle(); result.putBoolean("success", false); result.putString("readiness_reason", reason); return result;
    }

    // This provider has no files, rows, configuration or discovery surface.
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { throw new SecurityException("不支持查询"); }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new SecurityException("不支持写入"); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new SecurityException("不支持删除"); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new SecurityException("不支持更新"); }
}
