package ls.augment.com.hook;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Binder;
import android.os.IBinder;
import android.os.Process;
import android.view.Display;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.UUID;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.concurrent.atomic.AtomicLong;
import io.github.libxposed.api.XposedInterface.ExceptionMode;

/** Keeps the requested fallback IME policy on authenticated workbench displays only. */
final class AtomicWorkbenchImeHook {
    private static final String PACKAGE = "ls.augment.com";
    // Same complete name, package/user, trusted virtual-display checks as native HOME.
    private static final Pattern NAME = Pattern.compile("DuoAtomic-([0-9]+)-w([0-7])-([0-9a-f-]{36})");
    private static final Map<Object, Identity> DISPLAYS = new WeakHashMap<>();
    private static volatile boolean installed;
    private static boolean policyHookInstalled, ownerHookInstalled, contentHookInstalled;
    private static final ThreadLocal<OwnerRequest> OWNER_REQUEST = new ThreadLocal<>();
    private static final AtomicLong OWNER_REPORTS = new AtomicLong();
    private static Class<?> displayClass;
    private static int trustedFlag, ownFocusFlag;
    private static final AtomicLong DIAGNOSTIC_GENERATIONS = new AtomicLong();

    private static final class Identity {
        final Object service, root;
        final int displayId, pid, uid;
        final String name, uniqueId;
        final long registrationGeneration;
        boolean reported, errorReported;
        Identity(Object service, Object root, Display display, int pid, int uid, String uniqueId) {
            this.service = service; this.root = root; displayId = display.getDisplayId();
            this.pid = pid; this.uid = uid; name = display.getName(); this.uniqueId = uniqueId;
            registrationGeneration = DIAGNOSTIC_GENERATIONS.incrementAndGet();
        }
    }

    /** Exists only during one original setter invocation, including nested invocations. */
    private static final class OwnerRequest {
        final Object service, root, lock;
        final int displayId, pid;
        boolean active, beforeObserved, beforePresent, returned, setterFailed;
        String rejection = "NO_CONTENT";
        Object content;
        Identity candidate, previous;
        OwnerRequest(Object service, Object root, Object lock, int displayId, int pid) {
            this.service = service; this.root = root; this.lock = lock; this.displayId = displayId; this.pid = pid;
        }
        void register(Object returned) throws Exception {
            if (!active || candidate != null) return;
            if (returned == null) { rejection = "NO_CONTENT"; return; }
            rejection = "ROOT_MAPPING";
            if (field(service, "mRoot") != root
                    || call(root, "getDisplayContent", new Class<?>[]{int.class}, displayId) != returned) return;
            rejection = "AUTHENTICATION";
            Identity next = authenticate(service, root, returned, pid);
            if (next.displayId != displayId) { rejection = "DISPLAY_ID"; return; }
            synchronized (DISPLAYS) {
                previous = DISPLAYS.put(returned, next);
                content = returned; candidate = next; rejection = "NONE";
            }
        }
        void rollback() {
            if (candidate == null) return;
            synchronized (DISPLAYS) {
                if (DISPLAYS.get(content) == candidate) {
                    if (previous == null) DISPLAYS.remove(content); else DISPLAYS.put(content, previous);
                }
            }
        }
    }

    private static void clearOwnerRequest() {
        try { OWNER_REQUEST.remove(); }
        catch (Throwable unavailable) { try { OWNER_REQUEST.set(null); } catch (Throwable ignored) { } }
    }

    /** At most 32 fixed owner-route events per process, only outside the actual WMS lock. */
    private static void reportOwnerRequest(AugmentModule module, OwnerRequest request) {
        try {
            if (request == null || Thread.holdsLock(request.lock)) return;
            long count = OWNER_REPORTS.get();
            if (count >= 32 || !OWNER_REPORTS.compareAndSet(count, count + 1)) return;
            boolean registered;
            synchronized (DISPLAYS) { registered = request.candidate != null && DISPLAYS.get(request.content) == request.candidate; }
            // Reuse existing allowlisted fields; no display name, unique ID or Throwable text.
            module.logFeatureInfo("ATOMIC_WORKBENCH_IME_OWNER_REQUEST stage=OWNER_REQUEST;display=" + request.displayId
                    + ";root_pid=" + request.pid + ";phase=" + (!request.beforeObserved ? "UNKNOWN" : request.beforePresent ? "WARM" : "COLD")
                    + ";original_state=" + (!request.beforeObserved ? "UNKNOWN" : request.beforePresent ? "PRESENT" : "ABSENT")
                    + ";native_result=" + (request.returned ? "RETURNED" : "NOT_OBSERVED")
                    + ";registered=" + registered + ";reason=" + request.rejection
                    + ";result=" + (request.setterFailed ? "SETTER_THROWN" : "SETTER_RETURNED") + ";count=" + (count + 1));
        } catch (Throwable unavailable) { }
    }

    private AtomicWorkbenchImeHook() { }

    static boolean isInstalled() { return installed; }

    /** Read-only authority for one caller's focus window; no new display registration. */
    static boolean authenticatesFocusWindow(Object service, Object content, int appUid) {
        return authenticatesFocusWindow(service,content,appUid,null);
    }

    /** Copies primitive facts from this existing lookup only; never queries Provider or grants authority. */
    static boolean authenticatesFocusWindow(Object service, Object content, int appUid, long[] diagnostic) {
        if (!installed || service == null || content == null || appUid < 10000) return false;
        Identity identity;
        synchronized (DISPLAYS) { identity = DISPLAYS.get(content); }
        try {if(identity==null&&diagnostic!=null&&diagnostic.length==5)diagnostic[4]=3;}catch(Throwable ignored){}
        try {if(identity!=null&&diagnostic!=null&&diagnostic.length==5){
            diagnostic[0]=identity.pid;diagnostic[1]=identity.uid;diagnostic[2]=identity.displayId;
            diagnostic[3]=identity.registrationGeneration;diagnostic[4]=1;
        }}catch(Throwable ignored){}
        if (identity == null || identity.service != service || identity.uid != appUid) return false;
        try { if (valid(content, identity)) {
            try{if(diagnostic!=null&&diagnostic.length==5)diagnostic[4]=2;}catch(Throwable ignored){}
            return true;
        } }
        catch (Throwable unavailable) { }
        synchronized (DISPLAYS) { if (DISPLAYS.get(content) == identity) DISPLAYS.remove(content); }
        return false;
    }

    /** Root-only read witness; caller must also validate its exact requested display fields. */
    static boolean authenticatesEditorQuery(Object service, Object content, int appUid, int rootPid) {
        Identity identity;
        synchronized (DISPLAYS) { identity = DISPLAYS.get(content); }
        return identity != null && identity.pid == rootPid
                && authenticatesFocusWindow(service, content, appUid);
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    static synchronized int install(AugmentModule module, ClassLoader loader) {
        if (installed) return 2;
        try {
            Class<?> service = Class.forName("com.android.server.wm.WindowManagerService", false, loader);
            displayClass = Class.forName("com.android.server.wm.DisplayContent", false, loader);
            Class<?> root = Class.forName("com.android.server.wm.RootWindowContainer", false, loader);
            Class<?> settings = Class.forName("com.android.server.wm.DisplayWindowSettings", false, loader);
            Method set = service.getDeclaredMethod("setDisplayImePolicy", int.class, int.class);
            Method get = displayClass.getDeclaredMethod("getImePolicy");
            Method create = service.getDeclaredMethod("getDisplayContentOrCreate", int.class, IBinder.class);
            settings.getDeclaredMethod("getImePolicyLocked", displayClass);
            root.getDeclaredMethod("getDisplayContent", int.class);
            Process.class.getDeclaredMethod("getUidForPid", int.class);
            trustedFlag = staticInt(Display.class, "FLAG_TRUSTED");
            ownFocusFlag = staticInt(Display.class, "FLAG_OWN_FOCUS");
            for (String method : new String[]{"getOwnerUid", "getUniqueId", "getType"})
                Display.class.getDeclaredMethod(method);
            // Finish fallible probes/deoptimization before registering either callback.
            module.deoptimize(get); module.deoptimize(set); module.deoptimize(create);
            if (!policyHookInstalled) {
                module.registerFeatureHook(module.prepareFeatureHook(get, "atomic_workbench.ime.phone_policy", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                Object result = chain.proceed();
                Identity identity;
                synchronized (DISPLAYS) { identity = DISPLAYS.get(chain.getThisObject()); }
                if (!installed || identity == null) return result;
                try {
                    Object content = chain.getThisObject();
                    if (!valid(content, identity)) {
                        synchronized (DISPLAYS) { DISPLAYS.remove(content); }
                        return result;
                    }
                    // Read the actual requested setting, never replace LOCAL or HIDE requests.
                    Object windowSettings = field(identity.service, "mDisplayWindowSettings");
                    int requested = (Integer) call(windowSettings, "getImePolicyLocked",
                            new Class<?>[]{displayClass}, content);
                    if (requested != 1 || !Integer.valueOf(0).equals(result)) return result;
                    if (!identity.reported) {
                        identity.reported = true;
                        module.logFeatureInfo("ATOMIC_WORKBENCH_IME_POLICY display=" + identity.displayId
                                + ";uid=" + identity.uid + ";owner_pid=" + identity.pid
                                + ";requested=1;rom_actual=" + result + ";actual=1");
                    }
                    return 1;
                } catch (Throwable failure) {
                    if (!identity.errorReported) {
                        identity.errorReported = true;
                        module.logFeatureError("ATOMIC_WORKBENCH_IME_POLICY_UNCONFIRMED", failure);
                    }
                    return result;
                }
                }));
                policyHookInstalled = true;
            }
            if (!contentHookInstalled) {
                module.registerFeatureHook(module.prepareFeatureHook(create, "atomic_workbench.ime.owner_content", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                // The original setter owns permission checking, identity clearing and creation.
                Object content = chain.proceed();
                try {
                    OwnerRequest request = OWNER_REQUEST.get();
                    if (installed && request != null && request.active && chain.getThisObject() == request.service
                            && Integer.valueOf(request.displayId).equals(chain.getArg(0)) && chain.getArg(1) == null) {
                        request.returned = true;
                        synchronized (request.lock) { request.register(content); }
                    }
                } catch (Throwable unavailable) { }
                return content;
                }));
                contentHookInstalled = true;
            }
            if (!ownerHookInstalled) {
                module.registerFeatureHook(module.prepareFeatureHook(set, "atomic_workbench.ime.owner_request", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                OwnerRequest parent = null, request = null;
                boolean parentActive = false;
                // Suspend before any fallible child setup; non-fallback calls get no parent authority.
                try { parent = OWNER_REQUEST.get(); } catch (Throwable unavailable) { }
                if (parent != null) { parentActive = parent.active; parent.active = false; }
                clearOwnerRequest();
                try {
                    if (installed && Binder.getCallingUid() == 0 && Integer.valueOf(1).equals(chain.getArg(1))) {
                        try {
                            Object owner = chain.getThisObject();
                            Object lock = field(owner, "mGlobalLock");
                            synchronized (lock) {
                                Object rootContainer = field(owner, "mRoot");
                                request = new OwnerRequest(owner, rootContainer, lock, (Integer) chain.getArg(0), Binder.getCallingPid());
                                OWNER_REQUEST.set(request); request.active = true;
                                // Warm displays retain the existing pre-refresh registration path.
                                Object content = call(rootContainer, "getDisplayContent", new Class<?>[]{int.class}, chain.getArg(0));
                                request.beforeObserved = true;
                                request.beforePresent = content != null;
                                request.register(content);
                            }
                        } catch (Throwable unavailable) { }
                    }
                    try { return chain.proceed(); }
                    catch (Throwable failure) {
                        if (request != null) {
                            request.setterFailed = true;
                            try { request.rollback(); } catch (Throwable unavailable) { }
                        }
                        throw failure;
                    }
                } finally {
                    // Retire authority before fallible ThreadLocal cleanup or diagnostic formatting.
                    if (request != null) request.active = false;
                    clearOwnerRequest();
                    if (parent != null) try { OWNER_REQUEST.set(parent); parent.active = parentActive; }
                    catch (Throwable unavailable) { }
                    reportOwnerRequest(module, request);
                }
                }));
                ownerHookInstalled = true;
            }
            // The internal content observer adds no public capability or Focus ABI bit.
            installed = policyHookInstalled && ownerHookInstalled && contentHookInstalled;
            return 2;
        } catch (Throwable failure) {
            installed = false;
            module.logFeatureError("ATOMIC_WORKBENCH_IME_UNAVAILABLE", failure);
            return 0;
        }
    }

    private static Identity authenticate(Object service, Object root, Object content, int pid) throws Exception {
        if (content == null || pid <= 0 || uidForPid(pid) != 0) throw new SecurityException("ime_root_owner");
        Display display = (Display) field(content, "mDisplay");
        if (display.getDisplayId() <= 0 || (Integer) call(content, "getDisplayId", new Class<?>[0]) != display.getDisplayId()
                || field(content, "mWmService") != service) throw new SecurityException("ime_display_identity");
        Matcher name = NAME.matcher(display.getName());
        if (!name.matches() || !UUID.fromString(name.group(3)).toString().equals(name.group(3)))
            throw new SecurityException("ime_display_name");
        int uid = Integer.parseInt(name.group(1)), user = uid / 100000;
        if (uid < 10000 || (Integer) call(display, "getOwnerUid", new Class<?>[0]) != 0
                || (Integer) call(display, "getType", new Class<?>[0]) != staticInt(Display.class, "TYPE_VIRTUAL")
                || (display.getFlags() & (trustedFlag | ownFocusFlag)) != (trustedFlag | ownFocusFlag))
            throw new SecurityException("ime_display_owner_or_flags");
        Context context = (Context) field(service, "mContext");
        ApplicationInfo owner = (ApplicationInfo) call(context.getPackageManager(), "getApplicationInfoAsUser",
                new Class<?>[]{String.class, int.class, int.class}, PACKAGE, 0, user);
        if (owner.uid != uid) throw new SecurityException("ime_module_uid");
        String unique = (String) call(display, "getUniqueId", new Class<?>[0]);
        if (unique == null || unique.isEmpty()) throw new SecurityException("ime_display_unique_id");
        return new Identity(service, root, display, pid, uid, unique);
    }

    private static boolean valid(Object content, Identity identity) throws Exception {
        Display display = (Display) field(content, "mDisplay");
        return uidForPid(identity.pid) == 0 && field(content, "mWmService") == identity.service
                && call(identity.root, "getDisplayContent", new Class<?>[]{int.class}, identity.displayId) == content
                && display.getDisplayId() == identity.displayId && identity.name.equals(display.getName())
                && identity.uniqueId.equals(call(display, "getUniqueId", new Class<?>[0]))
                && (Integer) call(display, "getOwnerUid", new Class<?>[0]) == 0
                && (Integer) call(display, "getType", new Class<?>[0]) == staticInt(Display.class, "TYPE_VIRTUAL")
                && (display.getFlags() & (trustedFlag | ownFocusFlag)) == (trustedFlag | ownFocusFlag);
    }


    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi
    private static int uidForPid(int pid) throws Exception {
        Method method = Process.class.getDeclaredMethod("getUidForPid", int.class);
        method.setAccessible(true); return (Integer) method.invoke(null, pid);
    }

    private static int staticInt(Class<?> owner, String name) throws Exception {
        Field field = owner.getDeclaredField(name); field.setAccessible(true); return field.getInt(null);
    }

    private static Object field(Object object, String name) throws Exception {
        for (Class<?> type = object.getClass(); type != null; type = type.getSuperclass()) {
            try { Field field = type.getDeclaredField(name); field.setAccessible(true); return field.get(object); }
            catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }

    private static Object call(Object object, String name, Class<?>[] types, Object... args) throws Exception {
        Method method = object.getClass().getMethod(name, types);
        method.setAccessible(true); return method.invoke(object, args);
    }
}
