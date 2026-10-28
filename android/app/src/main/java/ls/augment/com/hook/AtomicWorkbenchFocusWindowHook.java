package ls.augment.com.hook;

import android.content.pm.ApplicationInfo;
import android.graphics.PixelFormat;
import android.os.Binder;
import android.os.IBinder;
import android.os.Process;
import android.view.Display;
import android.view.Gravity;
import android.view.WindowManager;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface.ExceptionMode;
import static ls.augment.com.hook.AtomicWorkbenchFocusWindowDiagnostics.*;

/** A single internal permission exception for a managed Duo focus window on its live Root VD. */
final class AtomicWorkbenchFocusWindowHook {
    private static final String PACKAGE = "ls.augment.com";
    private static final ThreadLocal<Permit> SCOPE = new ThreadLocal<>();
    private static final Map<Object, Permit> RESERVATIONS = new IdentityHashMap<>();
    private static final Map<Object, GuardLease> GUARDS = new WeakHashMap<>();
    private static volatile boolean installed, addInstalled, permissionInstalled, relayoutInstalled;
    private static int requiredDisplayFlags, allowedPrivateFlags;
    private static AtomicWorkbenchDisplayDeviceEvidence displayDeviceEvidence;
    // Revision marker of this installed callback body, bound to sealed source/DEX evidence; not a content hash.
    private static final String DIAGNOSTIC_OWNER = "FW_C12_DDI_01";
    private static final int DIAGNOSTIC_ABI = 1;
    private static volatile ThreadLocal<Attempt> observations;

    private static Attempt observation() { try { return observations == null ? null : observations.get(); } catch(Throwable ignored) { return null; } }
    private static boolean checked(boolean value,int gate) { try { Attempt a=observation();if(a!=null)a.check(gate,value); } catch(Throwable ignored){}return value; }
    private static int observed(int index,int value) { try { Attempt a=observation();if(a!=null)a.attribute(index,value); } catch(Throwable ignored){}return value; }
    private static float observedFloat(int index,float value) { observed(index,Float.floatToRawIntBits(value));return value; }
    private static void packageObserved(boolean value) {try {Attempt a=observation();if(a!=null)a.packageMatch(value);}catch(Throwable ignored){}}
    private static int diagnosticBits(){return (addInstalled?1:0)|(permissionInstalled?2:0)|(relayoutInstalled?4:0)|(AtomicWorkbenchImeHook.isInstalled()?8:0);}
    private static void installationObserved(String stage,Throwable failure){try {AtomicWorkbenchFocusWindowDiagnostics.installation(DIAGNOSTIC_OWNER,DIAGNOSTIC_ABI,stage,diagnosticBits(),failure==null?"NONE":failure instanceof LinkageError?"LINKAGE":failure instanceof ReflectiveOperationException?"REFLECTION":failure instanceof SecurityException?"SECURITY":"OTHER");}catch(Throwable ignored){}}
    private static void finishObservation(Attempt a){
        try {
            AtomicWorkbenchFocusWindowDiagnostics.offer(a,diagnosticBits());
        }catch(Throwable ignored){}
    }
    private static boolean diagnosticShape(WindowManager.LayoutParams attrs,int display){
        try {
            if(attrs==null)return false;
            if(attrs.type==WindowManager.LayoutParams.TYPE_SYSTEM_DIALOG&&PACKAGE.equals(attrs.packageName))return true;
            // A mutated type/package is still observable for the fixed, one-pixel Guard title shape.
            // This boolean selects evidence only; it is never used by authentication.
            if(attrs.width!=1||attrs.height!=1)return false;
            CharSequence title=attrs.getTitle();
            return title!=null&&title.length()<=100&&title.toString().matches("DuoAtomicInputFocus-"+display+"-[0-9a-f]{64}");
        }catch(Throwable ignored){return false;}
    }

    private static final class Permit {
        final Object service, session, content, client;
        final WindowManager.LayoutParams attrs;
        final GuardLease lease;
        final int uid, pid, display, user;
        Permit(Object service, Object session, Object content, Object client, WindowManager.LayoutParams attrs,
                int uid, int pid, int display, int user) throws Exception {
            this.service = service; this.session = session; this.content = content; this.client = client;
            this.attrs = attrs; this.uid = uid; this.pid = pid; this.display = display; this.user = user;
            lease = new GuardLease(this);
        }
    }

    private static final class GuardLease {
        final Object service, session, content;
        final int uid, pid, display;
        final String title;
        final IBinder contextToken;
        GuardLease(Permit permit) throws Exception {
            service = permit.service; session = permit.session; content = permit.content;
            uid = permit.uid; pid = permit.pid; display = permit.display;
            title = permit.attrs.getTitle().toString(); contextToken = (IBinder) field(permit.attrs, "mWindowContextToken");
        }
    }

    static boolean isInstalled() { return installed && AtomicWorkbenchImeHook.isInstalled(); }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    static synchronized int install(AugmentModule module, ClassLoader loader) {
        try {AtomicWorkbenchFocusWindowDiagnostics.initialize();if(observations==null)observations=new ThreadLocal<>();}catch(Throwable ignored){}
        if (isInstalled()) {installationObserved("ALREADY_INSTALLED",null);return 3;}
        String installStage="PROBE";
        final String callbackOwner=DIAGNOSTIC_OWNER;
        final int callbackAbi=DIAGNOSTIC_ABI;
        try {
            installStage="SERVICE_CLASS";
            Class<?> service = Class.forName("com.android.server.wm.WindowManagerService", false, loader);
            installStage="SESSION_CLASS";
            Class<?> session = Class.forName("com.android.server.wm.Session", false, loader);
            installStage="POLICY_CLASS";
            Class<?> policy = Class.forName("com.android.server.policy.PhoneWindowManager", false, loader);
            installStage="CONTEXT_CONTROLLER_CLASS";
            Class<?> controller = Class.forName("com.android.server.wm.WindowContextListenerController", false, loader);
            installStage="CONTEXT_LISTENER_CLASS";
            Class<?> listener = Class.forName("com.android.server.wm.WindowContextListenerController$WindowContextListenerImpl", false, loader);
            installStage="PROCESS_CLASS";
            Class<?> process = Class.forName("com.android.server.wm.WindowProcessController", false, loader);
            installStage="ATM_CLASS";
            Class<?> atm = Class.forName("com.android.server.wm.ActivityTaskManagerService", false, loader);
            installStage="CONTAINER_CLASS";
            Class<?> container = Class.forName("com.android.server.wm.WindowContainer", false, loader);
            installStage="WINDOW_STATE_FIELD_mAttrs";
            Class.forName("com.android.server.wm.WindowState", false, loader).getDeclaredField("mAttrs");
            installStage="ADD_METHOD";
            Method add;
            try { add = service.getDeclaredMethod("addWindow", session,
                    Class.forName("android.view.IWindow", false, loader), WindowManager.LayoutParams.class,
                    int.class, int.class, int.class, int.class,
                    Class.forName("android.view.InputChannel", false, loader),
                    Class.forName("android.view.InsetsState", false, loader),
                    Class.forName("android.view.InsetsSourceControl$Array", false, loader),
                    android.graphics.Rect.class, float[].class); }
            catch (NoSuchMethodException oldOutputsAbsent) {
                add = service.getDeclaredMethod("addWindow", session,
                        Class.forName("android.view.IWindow", false, loader), WindowManager.LayoutParams.class,
                        int.class, int.class, int.class, int.class,
                        Class.forName("android.view.InputChannel", false, loader),
                        Class.forName("android.view.WindowRelayoutResult", false, loader));
            }
            if (add.getReturnType() != int.class) throw new NoSuchMethodException("addWindow result");
            installStage="PERMISSION_METHOD";
            Method permission = policy.getDeclaredMethod("checkAddPermission", int.class, boolean.class, String.class, int[].class, int.class);
            installStage="RELAYOUT_METHOD";
            Method relayout;
            try { relayout = service.getDeclaredMethod("relayoutWindow", session,
                    Class.forName("android.view.IWindow", false, loader), WindowManager.LayoutParams.class,
                    int.class, int.class, int.class, int.class, int.class, int.class,
                    Class.forName("android.view.WindowRelayoutResult", false, loader)); }
            catch (NoSuchMethodException oldOutputsAbsent) {
                relayout = service.getDeclaredMethod("relayoutWindow", session,
                        Class.forName("android.view.IWindow", false, loader), WindowManager.LayoutParams.class,
                        int.class, int.class, int.class, int.class, int.class, int.class,
                        Class.forName("android.view.WindowRelayoutResult", false, loader), Class.forName("android.view.SurfaceControl",false,loader));
            }
            if (relayout.getReturnType() != int.class) throw new NoSuchMethodException("relayoutWindow result");
            for (String name : new String[]{"mUid", "mPid"}) {installStage="SESSION_FIELD_"+name;session.getDeclaredField(name);}
            for (String name : new String[]{"mUid", "mPid", "mUserId", "mInfo", "mName"}) {installStage="PROCESS_FIELD_"+name;process.getDeclaredField(name);}
            for (String name : new String[]{"mGlobalLock", "mRoot", "mAtmService", "mCurrentUserId", "mWindowMap", "mWindowContextListenerController", "mPolicy"}) {installStage="SERVICE_FIELD_"+name;service.getDeclaredField(name);}
            for (String name : new String[]{"mWpc", "mType", "mContainer"}) {installStage="LISTENER_FIELD_"+name;listener.getDeclaredField(name);}
            installStage="CONTROLLER_FIELD_mListeners";
            controller.getDeclaredField("mListeners");
            installStage="CONTAINER_METHOD_getDisplayContent";
            container.getDeclaredMethod("getDisplayContent");
            installStage="ATM_METHOD_getProcessController";
            atm.getDeclaredMethod("getProcessController", int.class, int.class);
            for (String name : new String[]{"privateFlags", "mWindowContextToken", "providedInsets"}) {installStage="LAYOUT_FIELD_"+name;WindowManager.LayoutParams.class.getDeclaredField(name);}
            installStage="PROCESS_METHOD_getUidForPid";
            Process.class.getDeclaredMethod("getUidForPid", int.class);
            installStage="FLAG_TRUSTED";int trusted=constant(Display.class,"FLAG_TRUSTED");
            installStage="FLAG_OWN_FOCUS";int ownFocus=constant(Display.class,"FLAG_OWN_FOCUS");
            requiredDisplayFlags=trusted|ownFocus;
            installStage="DDI_OWN_CONTENT_PROFILE";displayDeviceEvidence=AtomicWorkbenchDisplayDeviceEvidence.resolve(loader);
            // Layout-only bits added by the framework may be present; no privileged
            // overlay/insets/rounded-corner/visibility private bit is admitted.
            installStage="OPTIONAL_FLAG_USE_BLAST";int blast=optionalConstant(WindowManager.LayoutParams.class,"PRIVATE_FLAG_USE_BLAST");
            installStage="OPTIONAL_FLAG_FIT_INSETS";int fit=optionalConstant(WindowManager.LayoutParams.class,"PRIVATE_FLAG_FIT_INSETS_CONTROLLED");
            installStage="OPTIONAL_FLAG_CUTOUT";allowedPrivateFlags=blast|fit|optionalConstant(WindowManager.LayoutParams.class,"PRIVATE_FLAG_LAYOUT_SIZE_EXTENDED_BY_CUTOUT");
            installStage="DEOPT_ADD";module.deoptimize(add);
            installStage="DEOPT_PERMISSION";module.deoptimize(permission);
            installStage="DEOPT_RELAYOUT";module.deoptimize(relayout);
            installStage="REGISTER_PERMISSION";
            if (!permissionInstalled) {
                module.registerFeatureHook(module.prepareFeatureHook(permission, "atomic_workbench.focus_window.permission", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    Permit permit = SCOPE.get();
                    Attempt attempt=observation();if(attempt!=null){attempt.stage=POLICY_RECHECK;attempt.override=1;}
                    try { if (checked(installed,NOT_INSTALLED) && checked(permit != null,NO_PERMIT)
                            && checked(chain.getThisObject() == field(permit.service, "mPolicy"),POLICY_ARGUMENTS)
                            && checked(Integer.valueOf(WindowManager.LayoutParams.TYPE_SYSTEM_DIALOG).equals(chain.getArg(0)),POLICY_ARGUMENTS)
                            && checked(Boolean.FALSE.equals(chain.getArg(1)),POLICY_ARGUMENTS) && checked(PACKAGE.equals(chain.getArg(2)),POLICY_ARGUMENTS)
                            && checked(Integer.valueOf(permit.display).equals(chain.getArg(4)),POLICY_ARGUMENTS) && valid(permit)) {
                        int[] operation = (int[]) chain.getArg(3);
                        if (checked(operation != null && operation.length == 1,POLICY_ARGUMENTS)) { operation[0] = -1;if(attempt!=null)attempt.override=2;return 0; }
                    } } catch (Throwable rejected) { checked(false,REFLECTION); }
                    return chain.proceed();
                }));
                permissionInstalled = true;
            }
            installStage="REGISTER_ADD";
            if (!addInstalled) {
                module.registerFeatureHook(module.prepareFeatureHook(add, "atomic_workbench.focus_window.add", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    Permit previous = SCOPE.get(), permit = null;
                    Attempt parent=observation(),attempt=null;
                    WindowManager.LayoutParams observedAttrs=null;
                    // A failed observer initialization must not leave a nested call writing its parent's facts.
                    try {if(observations!=null)observations.remove();}catch(Throwable ignored){}
                    try {
                        if(chain.getArg(2) instanceof WindowManager.LayoutParams)observedAttrs=(WindowManager.LayoutParams)chain.getArg(2);
                        // Observer selection only: the original authorization still evaluates every predicate below.
                        if(diagnosticShape(observedAttrs,(Integer)chain.getArg(4))) {
                            attempt=AtomicWorkbenchFocusWindowDiagnostics.begin(callbackOwner,callbackAbi,-1,-1,(Integer)chain.getArg(4),(Integer)chain.getArg(5));
                            if(attempt!=null){
                                attempt.candidate=true;attempt.allowedPrivate=allowedPrivateFlags;
                                try{attempt.fitTypes=observedAttrs.getFitInsetsTypes();attempt.fitKnown=true;}catch(Throwable ignored){}
                            }
                        }
                    }catch(Throwable ignored){}
                    try {if(observations!=null)observations.set(attempt);}catch(Throwable ignored){}
                    // A nested add never inherits the enclosing call's permission.
                    SCOPE.remove();
                    try {
                        if (checked(installed,NOT_INSTALLED) && checked(previous == null,NESTED_ADD)
                                && checked(chain.getArg(2) instanceof WindowManager.LayoutParams,ARGUMENTS)) {
                            try {
                                permit = authenticate(chain.getThisObject(), chain.getArg(0), chain.getArg(1),
                                        (WindowManager.LayoutParams) chain.getArg(2),
                                        (Integer) chain.getArg(4), (Integer) chain.getArg(5));
                                if (permit != null) SCOPE.set(permit);
                            } catch (Throwable rejected) { checked(false,REFLECTION);permit = null; }
                        }
                        try {
                            Object result=chain.proceed();
                            if(attempt!=null&&result instanceof Integer){attempt.originalState=1;attempt.result=(Integer)result;}
                            return result;
                        }catch(Throwable original){
                            if(attempt!=null){attempt.originalState=2;attempt.throwKind=original instanceof SecurityException?1:original instanceof IllegalStateException?2:3;}
                            throw original;
                        }
                    } finally {
                        try {
                        SCOPE.remove();
                        if (permit != null) rememberGuard(permit);
                        if (permit != null) synchronized (RESERVATIONS) {
                            if (RESERVATIONS.get(permit.content) == permit) RESERVATIONS.remove(permit.content);
                        }
                        if (previous != null) SCOPE.set(previous);
                        } finally {
                            try {if(observations!=null){observations.remove();if(parent!=null)observations.set(parent);}}catch(Throwable ignored){}
                            finishObservation(attempt);
                        }
                    }
                }));
                addInstalled = true;
            }
            installStage="REGISTER_RELAYOUT";
            if (!relayoutInstalled) {
                module.registerFeatureHook(module.prepareFeatureHook(relayout, "atomic_workbench.focus_window.relayout", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    checkRelayout(chain.getThisObject(), chain.getArg(0), chain.getArg(1),
                            (WindowManager.LayoutParams) chain.getArg(2), (Integer) chain.getArg(3), (Integer) chain.getArg(4));
                    return chain.proceed();
                }));
                relayoutInstalled = true;
            }
            installed = addInstalled && permissionInstalled && relayoutInstalled && AtomicWorkbenchImeHook.isInstalled();
            installationObserved("COMPLETE",null);
            return installed ? 3 : 0;
        } catch (Throwable failure) {
            installed = false;
            installationObserved(installStage,failure);
            module.logFeatureError("ATOMIC_WORKBENCH_FOCUS_WINDOW_UNAVAILABLE", failure);
            return 0;
        }
    }

    private static void rememberGuard(Permit permit) {
        try {
            synchronized (field(permit.service, "mGlobalLock")) {
                Object windows = field(permit.service, "mWindowMap");
                if (!(windows instanceof Map<?, ?>)) return;
                Object client = call(permit.client, "asBinder", new Class<?>[0]);
                Object window = ((Map<?, ?>) windows).get(client);
                if (window == null || call(window, "getDisplayContent", new Class<?>[0]) != permit.content) {registryObserved(1);return;}
                WindowManager.LayoutParams attrs = (WindowManager.LayoutParams) field(window, "mAttrs");
                if (attrs == null || attrs.type != WindowManager.LayoutParams.TYPE_SYSTEM_DIALOG
                        || !permit.attrs.getTitle().toString().contentEquals(attrs.getTitle())) {registryObserved(1);return;}
                synchronized (GUARDS) { GUARDS.put(window, permit.lease); }
                registryObserved(2);
            }
        } catch (Throwable unavailable) {
            // Never classify another native window by title alone. Only a
            // successful, exact add is recorded; removal is never intercepted.
        }
    }

    private static void registryObserved(int state){try{Attempt a=observation();if(a!=null)a.registered=state;}catch(Throwable ignored){}}

    private static void checkRelayout(Object service, Object session, Object client, WindowManager.LayoutParams attrs,
            int requestedWidth, int requestedHeight) throws Throwable {
        synchronized (field(service, "mGlobalLock")) {
            Object windows = field(service, "mWindowMap");
            if (!(windows instanceof Map<?, ?>)) return;
            Object binder = call(client, "asBinder", new Class<?>[0]);
            Object window = ((Map<?, ?>) windows).get(binder);
            GuardLease lease;
            synchronized (GUARDS) { lease = GUARDS.get(window); }
            if (lease == null) return;
            if (service != lease.service || session != lease.session || Binder.getCallingUid() != lease.uid
                    || Binder.getCallingPid() != lease.pid || uidForPid(lease.pid) != lease.uid
                    || (Integer) field(session, "mUid") != lease.uid || (Integer) field(session, "mPid") != lease.pid
                    || call(window, "getDisplayContent", new Class<?>[0]) != lease.content
                    || requestedWidth < 0 || requestedWidth > 1 || requestedHeight < 0 || requestedHeight > 1)
                throw new SecurityException("工作台焦点守护不能改变窗口身份或尺寸");
            if (attrs != null && (!attributes(attrs, lease.display) || !lease.title.contentEquals(attrs.getTitle())
                    || !lease.contextToken.equals(field(attrs, "mWindowContextToken"))
                    || attrs.token != null && !lease.contextToken.equals(attrs.token)))
                throw new SecurityException("工作台焦点守护不能改为普通系统窗口");
        }
    }

    private static Permit authenticate(Object service, Object session, Object client, WindowManager.LayoutParams attrs,
            int display, int user) throws Exception {
        int uid = Binder.getCallingUid(), pid = Binder.getCallingPid();
        try{Attempt a=observation();if(a!=null){a.uid=uid;a.pid=pid;}}catch(Throwable ignored){}
        if (!checked(display > Display.DEFAULT_DISPLAY,DISPLAY_RANGE) || !checked(uid >= 10000,CALLER_UID)
                || !checked(pid > 0,CALLER_PID) || !checked(user == uid / 100000,CALLER_USER)
                || !attributes(attrs, display)) return null;
        synchronized (field(service, "mGlobalLock")) {
            Object root = field(service, "mRoot");
            Object content = call(root, "getDisplayContent", new Class<?>[]{int.class}, display);
            Permit permit = new Permit(service, session, content, client, attrs, uid, pid, display, user);
            if (!checked(content != null,DISPLAY_MISSING) || !validLocked(permit) || !checked(!hasGuard(permit),DUPLICATE_GUARD)) return null;
            synchronized (RESERVATIONS) {
                if (!checked(!RESERVATIONS.containsKey(content),RESERVATION)) return null;
                RESERVATIONS.put(content, permit);
            }
            return permit;
        }
    }

    private static boolean valid(Permit permit) {
        try {
            synchronized (field(permit.service, "mGlobalLock")) {
                synchronized (RESERVATIONS) { if (!checked(RESERVATIONS.get(permit.content) == permit,RESERVATION)) return false; }
                return validLocked(permit) && checked(!hasGuard(permit),DUPLICATE_GUARD);
            }
        } catch (Throwable unavailable) { checked(false,REFLECTION);return false; }
    }

    private static boolean validLocked(Permit permit) throws Exception {
        if (!checked(Binder.getCallingUid() == permit.uid,UID_CHANGED) || !checked(Binder.getCallingPid() == permit.pid,PID_CHANGED)
                || !checked(uidForPid(permit.pid) == permit.uid,PID_OWNER) || !attributes(permit.attrs, permit.display)
                || !checked((Integer) field(permit.session, "mUid") == permit.uid,SESSION_UID) || !checked((Integer) field(permit.session, "mPid") == permit.pid,SESSION_PID)
                || !checked((Integer) field(permit.service, "mCurrentUserId") == permit.user,CURRENT_USER)
                || !checked(AtomicWorkbenchImeHook.authenticatesFocusWindow(permit.service, permit.content, permit.uid,bindingFacts()),IME_SCOPE)) return false;
        Object atm = field(permit.service, "mAtmService");
        Object process = call(atm, "getProcessController", new Class<?>[]{int.class, int.class}, permit.pid, permit.uid);
        if (!checked(process != null,PROCESS_MISSING) || !checked((Integer) field(process, "mUid") == permit.uid,PROCESS_UID) || !checked((Integer) field(process, "mPid") == permit.pid,PROCESS_PID)
                || !checked((Integer) field(process, "mUserId") == permit.user,PROCESS_USER) || !checked(PACKAGE.equals(field(process, "mName")),PROCESS_NAME)) return false;
        ApplicationInfo info = (ApplicationInfo) field(process, "mInfo");
        if (!checked(info != null,INFO_MISSING) || !checked(info.uid == permit.uid,INFO_UID) || !checked(PACKAGE.equals(info.packageName),INFO_PACKAGE)) return false;
        IBinder client = (IBinder) call(permit.client, "asBinder", new Class<?>[0]);
        if (!checked(client != null,CLIENT_MISSING) || !checked(client.isBinderAlive(),CLIENT_DEAD)) return false;
        Display display = (Display) field(permit.content, "mDisplay");
        if (!checked(display.getDisplayId() == permit.display,DISPLAY_ID) || !checked((display.getFlags() & requiredDisplayFlags) == requiredDisplayFlags,DISPLAY_REQUIRED)
                || !checked((display.getFlags() & (Display.FLAG_PRIVATE | Display.FLAG_PRESENTATION)) == 0,DISPLAY_FORBIDDEN)
                || !checked(displayDeviceEvidence != null && displayDeviceEvidence.ownsContentOnly(permit.service,display),DISPLAY_REQUIRED)
                || !checked(title(permit.display, (String) call(display, "getUniqueId", new Class<?>[0])).contentEquals(permit.attrs.getTitle()),TITLE_UNIQUE)) return false;
        IBinder contextToken = (IBinder) field(permit.attrs, "mWindowContextToken");
        if (!checked(contextToken != null,CONTEXT_MISSING) || !checked(contextToken.isBinderAlive(),CONTEXT_DEAD)
                || !checked(permit.attrs.token == null || contextToken.equals(permit.attrs.token),WINDOW_CONTEXT)) return false;
        Object controller = field(permit.service, "mWindowContextListenerController");
        Object listeners = field(controller, "mListeners");
        if (!checked(listeners instanceof Map<?, ?>,LISTENERS_SHAPE)) return false;
        Object listener = ((Map<?, ?>) listeners).get(contextToken);
        if (!checked(listener != null,LISTENER_MISSING) || !checked(field(listener, "mWpc") == process,CONTEXT_WPC)
                || !checked((Integer) field(listener, "mType") == WindowManager.LayoutParams.TYPE_SYSTEM_DIALOG,CONTEXT_TYPE)) return false;
        Object container = field(listener, "mContainer");
        return checked(container != null,CONTAINER_MISSING) && checked(call(container, "getDisplayContent", new Class<?>[0]) == permit.content,CONTAINER_DISPLAY);
    }

    private static long[] bindingFacts(){try{Attempt a=observation();return a==null?null:a.binding;}catch(Throwable ignored){return null;}}

    private static boolean hasGuard(Permit permit) throws Exception {
        Object windows = field(permit.service, "mWindowMap");
        if (!(windows instanceof Map<?, ?>)) return true;
        for (Object window : ((Map<?, ?>) windows).values()) {
            WindowManager.LayoutParams attrs = (WindowManager.LayoutParams) field(window, "mAttrs");
            if (attrs != null && attrs.type == WindowManager.LayoutParams.TYPE_SYSTEM_DIALOG
                    && attrs.getTitle() != null && attrs.getTitle().toString().startsWith("DuoAtomicInputFocus-" + permit.display + "-")
                    && call(window, "getDisplayContent", new Class<?>[0]) == permit.content) return true;
        }
        return false;
    }


    // Physical screen/driver/stock-layout coordinates, not logical reading order; changing LEFT/RIGHT would change geometry.
    //noinspection RtlHardcoded
    private static boolean attributes(WindowManager.LayoutParams attrs, int display) throws Exception {
        int required = WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL;
        int allowed = required | WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED;
        if (!checked(observed(TYPE,attrs.type) == WindowManager.LayoutParams.TYPE_SYSTEM_DIALOG,ATTR_TYPE)
                || !checked(observed(WIDTH,attrs.width) == 1,ATTR_WIDTH) || !checked(observed(HEIGHT,attrs.height) == 1,ATTR_HEIGHT)) return false;
        boolean own=PACKAGE.equals(attrs.packageName);packageObserved(own);
        if (!checked(own,ATTR_PACKAGE) || !checked(attrs.getTitle() != null,ATTR_TITLE_NULL)
                || !checked(attrs.getTitle().toString().matches("DuoAtomicInputFocus-" + display + "-[0-9a-f]{64}"),ATTR_TITLE)
                || !checked((observed(FLAGS,attrs.flags) & required) == required,ATTR_TOUCH)
                || !checked((observed(FLAGS,attrs.flags) & ~allowed) == 0,ATTR_FLAGS)
                || !checked((observed(PRIVATE_FLAGS,(Integer) field(attrs, "privateFlags")) & ~allowedPrivateFlags) == 0,ATTR_PRIVATE)
                || !checked(observed(X,attrs.x) == 0,ATTR_X) || !checked(observed(Y,attrs.y) == 0,ATTR_Y)
                || !checked(observedFloat(DIM,attrs.dimAmount) == 0f,ATTR_DIM) || !checked(observed(ANIMATION,attrs.windowAnimations) == 0,ATTR_ANIMATION)
                || !checked(observed(FORMAT,attrs.format) == PixelFormat.TRANSLUCENT,ATTR_FORMAT)
                || !checked(!(observedFloat(ALPHA,attrs.alpha) < 0f),ATTR_ALPHA) || !checked(!(observedFloat(ALPHA,attrs.alpha) > 1f),ATTR_ALPHA)
                || !checked(Float.isFinite(observedFloat(ALPHA,attrs.alpha)),ATTR_ALPHA_FINITE)
                || !checked(observed(SOFT,attrs.softInputMode) == (WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN | WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING),ATTR_SOFT)
                || !checked(observed(GRAVITY,attrs.gravity) == (Gravity.TOP | Gravity.START) || observed(GRAVITY,attrs.gravity) == (Gravity.TOP | Gravity.LEFT),ATTR_GRAVITY)) return false;
        Object insets = field(attrs, "providedInsets");
        if(insets==null){observed(INSETS,-1);return checked(true,ATTR_INSETS);}
        return checked(observed(INSETS,Array.getLength(insets)) == 0,ATTR_INSETS);
    }


    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi
    private static int uidForPid(int pid) throws Exception {
        Method method = Process.class.getDeclaredMethod("getUidForPid", int.class); method.setAccessible(true);
        return (Integer) method.invoke(null, pid);
    }
    private static String title(int display, String unique) throws Exception {
        if (unique == null || unique.isEmpty()) throw new SecurityException("focus_display_unique");
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(unique.getBytes(StandardCharsets.UTF_8));
        StringBuilder hex = new StringBuilder(64);
        for (byte value : digest) hex.append(Character.forDigit((value >>> 4) & 15, 16)).append(Character.forDigit(value & 15, 16));
        return "DuoAtomicInputFocus-" + display + "-" + hex;
    }
    private static int constant(Class<?> owner, String name) throws Exception { Field field = owner.getDeclaredField(name); field.setAccessible(true); return field.getInt(null); }
    private static int optionalConstant(Class<?> owner, String name) throws Exception { try { return constant(owner, name); } catch (NoSuchFieldException absent) { return 0; } }
    private static Object field(Object owner, String name) throws Exception {
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try { Field field = type.getDeclaredField(name); field.setAccessible(true); return field.get(owner); }
            catch (NoSuchFieldException absent) { }
        }
        throw new NoSuchFieldException(name);
    }
    private static Object call(Object owner, String name, Class<?>[] types, Object... arguments) throws Exception {
        Method method = owner.getClass().getMethod(name, types); method.setAccessible(true); return method.invoke(owner, arguments);
    }
    private AtomicWorkbenchFocusWindowHook() { }
}
