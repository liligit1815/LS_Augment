package ls.augment.com.hook;

import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.os.SystemClock;
import android.view.Display;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.UUID;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface.ExceptionMode;

/** Read-only, Root-owned display evidence. Never reads text, clipboard, URI or editor extras. */
final class AtomicWorkbenchEditorEvidenceHook {
    // Only verified Java AppOps metadata and native TF_ACCEPT_FDS; neither permits one-way requests.
    private static final int BINDER_SYNC_METADATA_FLAGS = 0x12;

    private static boolean acceptsSynchronousBinderFlags(Object flags) {
        return flags instanceof Integer && (((Integer) flags) & ~BINDER_SYNC_METADATA_FLAGS) == 0;
    }

    private static final int TRANSACTION = 0x00D04E01, SCHEMA = 1;
    private static final String DESCRIPTOR = "ls.augment.com.atomic_editor_evidence.v1";
    private static final Map<Object, String> WINDOWS = new WeakHashMap<>();
    private static final Map<Integer, Generation> CONNECTIONS = new LinkedHashMap<>();
    private static volatile boolean installed;
    private static Class<?> imfLock, immsClass, accessibilityClass;
    private static Method getService;
    private static int requiredFlags;
    private static AtomicWorkbenchDisplayDeviceEvidence displayDeviceEvidence;
    private static volatile AugmentModule diagnosticModule;
    private static long lastRejectionDiagnostic;

    private static final class Request {
        String nonce, name, unique, pkg;
        long deadline;
        int moduleUid, user, slot, display, targetUid, task, rootPid;
    }
    private static final class Window {
        final Object content, state, task;
        final IBinder token;
        final int pid;
        Window(Object content, Object state, Object task, IBinder token, int pid) {
            this.content = content; this.state = state; this.task = task; this.token = token; this.pid = pid;
        }
        boolean same(Window other) { return other != null && content == other.content && state == other.state
                && task == other.task && token.equals(other.token) && pid == other.pid; }
    }
    private static final class Input {
        Object userData, binding, client, info, focusedInfo;
        IBinder window, connection, accessibilityConnection;
        int type, field;
        String pkg;
        boolean same(Input o) { return o != null && userData == o.userData && binding == o.binding
                && client == o.client && info == o.info && focusedInfo == o.focusedInfo && window.equals(o.window)
                && connection.equals(o.connection) && accessibilityConnection.equals(o.accessibilityConnection)
                && type == o.type && field == o.field && pkg.equals(o.pkg); }
    }
    private static final class Generation {
        final WeakReference<Object> userData, binding, client, info, focusedInfo;
        final WeakReference<IBinder> window, connection, accessibilityConnection;
        final String pkg;
        final int type, field;
        final String id = random();
        Generation(Input input) {
            userData = new WeakReference<>(input.userData); binding = new WeakReference<>(input.binding);
            client = new WeakReference<>(input.client); info = new WeakReference<>(input.info);
            focusedInfo = new WeakReference<>(input.focusedInfo); window = new WeakReference<>(input.window);
            connection = new WeakReference<>(input.connection); accessibilityConnection = new WeakReference<>(input.accessibilityConnection);
            pkg = input.pkg; type = input.type; field = input.field;
        }
        boolean same(Input input) { return userData.get() == input.userData && binding.get() == input.binding
                && client.get() == input.client && info.get() == input.info && focusedInfo.get() == input.focusedInfo
                && input.window.equals(window.get()) && input.connection.equals(connection.get())
                && input.accessibilityConnection.equals(accessibilityConnection.get())
                && type == input.type && field == input.field && pkg.equals(input.pkg); }
    }
    static boolean isInstalled() { return installed && AtomicWorkbenchImeHook.isInstalled(); }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    static synchronized int install(AugmentModule module, ClassLoader loader) {
        if (installed) return 1;
        try {
            Class<?> wms = Class.forName("com.android.server.wm.WindowManagerService", false, loader);
            Method transaction = wms.getDeclaredMethod("onTransact", int.class, Parcel.class, Parcel.class, int.class);
            imfLock = Class.forName("com.android.server.inputmethod.ImfLock", false, loader);
            immsClass = Class.forName("com.android.server.inputmethod.InputMethodManagerService", false, loader);
            accessibilityClass = Class.forName("com.android.server.accessibility.AccessibilityManagerService", false, loader);
            getService = Class.forName("android.os.ServiceManager", false, loader).getDeclaredMethod("getService", String.class);
            getService.setAccessible(true);
            probe(wms, "mGlobalLock", "mRoot", "mCurrentUserId", "mWindowMap");
            probe(Class.forName("com.android.server.wm.DisplayContent", false, loader), "mCurrentFocus", "mDisplay");
            Class.forName("com.android.server.wm.WindowContainer", false, loader).getDeclaredMethod("getDisplayContent");
            Class<?> state = Class.forName("com.android.server.wm.WindowState", false, loader);
            probe(state, "mOwnerUid", "mSession", "mActivityRecord", "mClient", "mAttrs");
            state.getDeclaredMethod("getTask"); state.getDeclaredMethod("isVisible");
            probe(Class.forName("com.android.server.wm.ActivityRecord", false, loader), "mUserId", "packageName");
            probe(Class.forName("com.android.server.wm.Task", false, loader), "mTaskId", "mUserId");
            probe(Class.forName("com.android.server.inputmethod.IInputMethodManagerImpl", false, loader), "mCallback");
            probe(immsClass, "mUserDataRepository", "mCurrentImeUserId");
            probe(Class.forName("com.android.server.inputmethod.UserDataRepository", false, loader), "mUserData");
            Class.forName("com.android.server.inputmethod.ImmutableSparseArray", false, loader).getDeclaredMethod("get", int.class);
            probe(Class.forName("com.android.server.inputmethod.UserData", false, loader), "mUserId", "mCurClient", "mCurEditorInfo",
                    "mCurInputConnection", "mCurRemoteAccessibilityInputConnection", "mImeBindingState");
            probe(Class.forName("com.android.server.inputmethod.ImeBindingState", false, loader), "mFocusedWindow", "mFocusedWindowClient", "mFocusedWindowEditorInfo", "mUserId");
            probe(Class.forName("com.android.server.inputmethod.ClientState", false, loader), "mUid", "mPid", "mSelfReportedDisplayId");
            probe(accessibilityClass, "mA11yWindowManager", "mLock", "mCurrentUserId");
            Class<?> manager = Class.forName("com.android.server.accessibility.AccessibilityWindowManager", false, loader);
            probe(manager, "mLock"); manager.getDeclaredMethod("findWindowIdLocked", int.class, IBinder.class);
            manager.getDeclaredMethod("getWindowTokenForUserAndWindowIdLocked", int.class, int.class);
            requiredFlags = constant(Display.class, "FLAG_TRUSTED") | constant(Display.class, "FLAG_OWN_FOCUS");
            displayDeviceEvidence = AtomicWorkbenchDisplayDeviceEvidence.resolve(loader);
            module.deoptimize(transaction);
            module.registerFeatureHook(module.prepareFeatureHook(transaction, "atomic_workbench.editor_evidence.read", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                if (!Integer.valueOf(TRANSACTION).equals(chain.getArg(0))) return chain.proceed();
                Parcel data = (Parcel) chain.getArg(1), reply = (Parcel) chain.getArg(2);
                // This private code has no original/AIDL behavior, including malformed/one-way requests.
                if (reply == null || !acceptsSynchronousBinderFlags(chain.getArg(3))) return true;
                read(chain.getThisObject(), data, reply);
                return true;
            }));
            installed = true;
            diagnosticModule = module;
            module.logFeatureInfo("ATOMIC_WORKBENCH_EDITOR_EVIDENCE_INSTALLED schema=1;authorization=root_owned_display;content=none");
            return 1;
        } catch (Throwable unavailable) {
            installed = false; module.logFeatureError("ATOMIC_WORKBENCH_EDITOR_EVIDENCE_UNAVAILABLE", unavailable); return 0;
        }
    }

    private static void read(Object service, Parcel data, Parcel reply) {
        Request r = new Request();
        int a11y = -1;
        String windowId = null, connectionId = null;
        Input input = null;
        long sampled = 0;
        int schema=SCHEMA;
        boolean windowOnly=false,windowReady=false;
        String stage = "request";
        try {
            if (!isInstalled() || Binder.getCallingUid() != 0 || data == null || data.dataSize() > 4096)
                throw new SecurityException();
            r.rootPid = Binder.getCallingPid();
            data.enforceInterface(DESCRIPTOR);
            schema=data.readInt();windowOnly=schema==2;
            if (schema != SCHEMA && !windowOnly) throw new SecurityException();
            r.nonce = data.readString(); r.deadline = data.readLong();
            r.moduleUid = data.readInt(); r.user = data.readInt(); r.slot = data.readInt(); r.display = data.readInt();
            r.name = data.readString(); r.unique = data.readString(); r.targetUid = data.readInt(); r.task = data.readInt(); r.pkg = data.readString();
            if (data.dataAvail() != 0 || r.nonce == null || !r.nonce.matches("[0-9a-f]{32}")
                    || r.moduleUid < 10000 || r.targetUid < 10000 || r.user < 0
                    || r.moduleUid / 100000 != r.user || r.targetUid / 100000 != r.user
                    || r.slot < 0 || r.slot > 7 || r.display <= 0 || r.task < 0 || !bounded(r.unique, 512) || !bounded(r.pkg, 256)
                    || "ls.augment.com".equals(r.pkg) || r.name == null
                    || !r.name.matches("DuoAtomic-" + r.moduleUid + "-w" + r.slot
                        + "-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")) throw new SecurityException();
            fresh(r);
            // Resolve local service instances before taking any subsystem lock. No application IPC.
            Object ims = getService.invoke(null, "input_method");
            ims = field(ims, "mCallback");
            if ("com.android.server.inputmethod.ZeroJankProxy".equals(ims.getClass().getName())) ims = field(ims, "mInner");
            if (!immsClass.isInstance(ims)) throw new SecurityException();
            Object ams = getService.invoke(null, "accessibility");
            if (!accessibilityClass.isInstance(ams)) throw new SecurityException();
            // Five independent phases. Never nest WMS, IMF and accessibility locks.
            stage = "window_before";
            Window first = window(service, r);
            if(windowOnly){
                stage="accessibility";a11y=accessibility(ams,r,first.token);
                stage="window_recheck";
                if(a11y!=accessibility(ams,r,first.token)||!first.same(window(service,r)))throw new SecurityException("window_identity_changed");
                fresh(r);
                synchronized(WINDOWS){windowId=WINDOWS.get(first.token);if(windowId==null){windowId=random();WINDOWS.put(first.token,windowId);}}
                sampled=SystemClock.elapsedRealtime();windowReady=true;
            }else{
            stage = "input_before";
            input = input(ims, r, first);
            stage = "accessibility";
            a11y = accessibility(ams, r, first.token);
            stage = "input_recheck";
            if (!input.same(input(ims, r, first))) throw new SecurityException("input_identity_changed");
            stage = "window_recheck";
            if (!first.same(window(service, r))) throw new SecurityException("window_identity_changed");
            fresh(r);
            synchronized (WINDOWS) { windowId = WINDOWS.get(first.token); if (windowId == null) { windowId = random(); WINDOWS.put(first.token, windowId); } }
            synchronized (CONNECTIONS) {
                Generation generation = CONNECTIONS.get(r.user);
                if (generation == null || !generation.same(input)) { generation = new Generation(input); CONNECTIONS.put(r.user, generation); }
                while (CONNECTIONS.size() > 8) CONNECTIONS.remove(CONNECTIONS.keySet().iterator().next());
                connectionId = generation.id;
            }
            sampled = SystemClock.elapsedRealtime();
            }
        } catch (Throwable refused) {
            input = null;
            try { if (!"request".equals(stage)) rejectionDiagnostic(stage, refused); } catch (Throwable ignored) { }
        }
        if(windowOnly){
            reply.writeNoException();reply.writeInt(2);reply.writeString(r.nonce);reply.writeInt(windowReady?1:0);
            if(windowReady){reply.writeInt(a11y);reply.writeString(windowId);reply.writeLong(sampled);}return;
        }
        reply.writeNoException(); reply.writeInt(SCHEMA); reply.writeString(r.nonce); reply.writeInt(input == null ? 0 : 1);
        if (input != null) {
            reply.writeInt(a11y); reply.writeString(windowId); reply.writeString(connectionId);
            reply.writeInt(input.type); reply.writeInt(input.field); reply.writeLong(sampled);
        }
    }

    /** Bounded capability metadata only; no editor text, package, token or request credential. */
    private static void rejectionDiagnostic(String stage, Throwable failure) {
        AugmentModule module = diagnosticModule;
        if (module == null) return;
        long now = SystemClock.elapsedRealtime();
        synchronized (WINDOWS) {
            if (lastRejectionDiagnostic != 0 && now - lastRejectionDiagnostic < 3000) return;
            lastRejectionDiagnostic = now;
        }
        String reason = failure.getMessage();
        if (reason == null || !reason.matches("[a-z_]{1,64}")) reason = "capability_unavailable";
        try { module.logFeatureInfo("ATOMIC_WORKBENCH_EDITOR_EVIDENCE_REJECTED stage=" + stage
                + ";reason=" + reason + ";error=" + failure.getClass().getSimpleName() + ";content=none"); }
        catch (Throwable ignored) { }
    }

    private static Window window(Object service, Request r) throws Exception {
        synchronized (field(service, "mGlobalLock")) {
            if (number(service, "mCurrentUserId") != r.user) throw new SecurityException("window_user_changed");
            Object content = call(field(service, "mRoot"), "getDisplayContent", new Class<?>[]{int.class}, r.display);
            if (!AtomicWorkbenchImeHook.authenticatesEditorQuery(service, content, r.moduleUid, r.rootPid)) throw new SecurityException("display_registry_unconfirmed");
            Display display = (Display) field(content, "mDisplay");
            if (!r.name.equals(display.getName()) || !r.unique.equals(call(display, "getUniqueId", new Class<?>[0]))
                    || (display.getFlags() & requiredFlags) != requiredFlags
                    || (display.getFlags() & (Display.FLAG_PRIVATE | Display.FLAG_PRESENTATION)) != 0
                    || displayDeviceEvidence == null || !displayDeviceEvidence.ownsContentOnly(service,display)) throw new SecurityException("display_identity_unconfirmed");
            Object state = field(content, "mCurrentFocus");
            if (state == null || call(state, "getDisplayContent", new Class<?>[0]) != content
                    || number(state, "mOwnerUid") != r.targetUid || !Boolean.TRUE.equals(call(state, "isVisible", new Class<?>[0]))) throw new SecurityException("window_focus_unconfirmed");
            Object session = field(state, "mSession"), activity = field(state, "mActivityRecord");
            if (activity == null || number(session, "mUid") != r.targetUid || number(activity, "mUserId") != r.user
                    || !r.pkg.equals(field(activity, "packageName"))) throw new SecurityException("window_owner_unconfirmed");
            WindowManager.LayoutParams attrs = (WindowManager.LayoutParams) field(state, "mAttrs");
            if (attrs.type < 1 || attrs.type >= 2000 || (attrs.flags & WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE) != 0) throw new SecurityException("window_type_unconfirmed");
            Object task = call(state, "getTask", new Class<?>[0]);
            if (task == null || number(task, "mTaskId") != r.task || number(task, "mUserId") != r.user
                    || call(task, "getDisplayContent", new Class<?>[0]) != content) throw new SecurityException("window_task_unconfirmed");
            IBinder token = binder(field(state, "mClient"));
            if (!token.isBinderAlive() || ((Map<?, ?>) field(service, "mWindowMap")).get(token) != state) throw new SecurityException("window_token_unconfirmed");
            return new Window(content, state, task, token, number(session, "mPid"));
        }
    }

    private static Input input(Object ims, Request r, Window window) throws Exception {
        synchronized (imfLock) {
            if (number(ims, "mCurrentImeUserId") != r.user) throw new SecurityException("input_user_changed");
            Input in = new Input();
            Object repository = field(ims, "mUserDataRepository");
            in.userData = call(field(repository, "mUserData"), "get", new Class<?>[]{int.class}, r.user);
            if (in.userData == null || number(in.userData, "mUserId") != r.user) throw new SecurityException("input_user_data_unconfirmed");
            in.client = field(in.userData, "mCurClient"); in.binding = field(in.userData, "mImeBindingState");
            if (in.client == null || in.binding == null || field(in.binding, "mFocusedWindowClient") != in.client)
                throw new SecurityException("input_client_unconfirmed");
            if (number(in.binding, "mUserId") != r.user || number(in.client, "mUid") != r.targetUid)
                throw new SecurityException("input_client_owner_unconfirmed");
            if (number(in.client, "mSelfReportedDisplayId") != r.display)
                throw new SecurityException("input_client_display_unconfirmed");
            if (number(in.client, "mPid") != window.pid) throw new SecurityException("input_client_process_unconfirmed");
            in.window = (IBinder) field(in.binding, "mFocusedWindow");
            if (!window.token.equals(in.window)) throw new SecurityException("input_window_unconfirmed");
            in.info = field(in.userData, "mCurEditorInfo"); in.focusedInfo = field(in.binding, "mFocusedWindowEditorInfo");
            if (!(in.info instanceof EditorInfo) || !(in.focusedInfo instanceof EditorInfo)) throw new SecurityException("input_editor_info_unconfirmed");
            EditorInfo info = (EditorInfo) in.info, focused = (EditorInfo) in.focusedInfo;
            in.pkg = info.packageName; in.type = info.inputType; in.field = info.fieldId;
            if (!r.pkg.equals(in.pkg) || !r.pkg.equals(focused.packageName) || focused.inputType != in.type
                    || focused.fieldId != in.field || (in.type & 15) == 0 || password(in.type)) throw new SecurityException("input_editor_identity_unconfirmed");
            in.connection = binder(field(in.userData, "mCurInputConnection"));
            in.accessibilityConnection = binder(field(in.userData, "mCurRemoteAccessibilityInputConnection"));
            if (!in.connection.isBinderAlive() || !in.accessibilityConnection.isBinderAlive()) throw new SecurityException("input_connection_unconfirmed");
            return in;
        }
    }

    private static int accessibility(Object ams, Request r, IBinder token) throws Exception {
        synchronized (field(ams, "mLock")) {
            if (number(ams, "mCurrentUserId") != r.user) throw new SecurityException("accessibility_user_changed");
            Object manager = field(ams, "mA11yWindowManager");
            if (field(manager, "mLock") != field(ams, "mLock")) throw new SecurityException("accessibility_lock_unconfirmed");
            int id = (Integer) call(manager, "findWindowIdLocked", new Class<?>[]{int.class, IBinder.class}, r.user, token);
            // Avoid getDisplayIdByUserIdAndWindowId: it calls into WMS after its own lock.
            if (id < 0 || !token.equals(call(manager, "getWindowTokenForUserAndWindowIdLocked", new Class<?>[]{int.class, int.class}, r.user, id))) throw new SecurityException("accessibility_window_unconfirmed");
            return id;
        }
    }
    private static void fresh(Request r) { long now = SystemClock.elapsedRealtime(); if (r.deadline <= now || r.deadline - now > 15000) throw new SecurityException(); }
    private static boolean password(int t) { int c = t & 15, v = t & 4080; return c == 1 && (v == 128 || v == 144 || v == 224) || c == 2 && v == 16; }
    private static boolean bounded(String s, int max) { if (s == null || s.isEmpty() || s.length() > max) return false; for (int i = 0; i < s.length(); i++) if (Character.isISOControl(s.charAt(i))) return false; return true; }
    private static String random() { return UUID.randomUUID().toString().replace("-", ""); }
    private static IBinder binder(Object object) throws Exception { if (object == null) throw new SecurityException(); return object instanceof IBinder ? (IBinder) object : (IBinder) call(object, "asBinder", new Class<?>[0]); }
    private static int number(Object object, String name) throws Exception { return (Integer) field(object, name); }
    private static int constant(Class<?> owner, String name) throws Exception { Field f = owner.getDeclaredField(name); f.setAccessible(true); return f.getInt(null); }
    private static void probe(Class<?> type, String... names) throws Exception { for (String name : names) find(type, name); }
    private static Field find(Class<?> owner, String name) throws Exception { for (Class<?> t = owner; t != null; t = t.getSuperclass()) try { Field f = t.getDeclaredField(name); f.setAccessible(true); return f; } catch (NoSuchFieldException ignored) { } throw new NoSuchFieldException(name); }
    private static Object field(Object object, String name) throws Exception { if (object == null) throw new SecurityException(); return find(object.getClass(), name).get(object); }
    private static Object call(Object object, String name, Class<?>[] types, Object... values) throws Exception { Method m = object.getClass().getMethod(name, types); m.setAccessible(true); return m.invoke(object, values); }
    private AtomicWorkbenchEditorEvidenceHook() { }
}
