package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Binder;
import android.os.Handler;
import android.os.Looper;
import android.view.Display;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import io.github.libxposed.api.XposedInterface.ExceptionMode;

/** A single, authenticated lease of the real primary HOME, never a secondary launcher. */
final class AtomicWorkbenchHomeHook {
    private static final String PACKAGE = "ls.augment.com";
    private static final int ENCODE_BASE = 1000000;
    private static final Pattern NAME = Pattern.compile("DuoAtomic-([0-9]+)-w([0-7])-([0-9a-f-]{36})");
    private static volatile Lease lease;
    private static volatile boolean installed;
    private static boolean watching;
    private static final ThreadLocal<Boolean> RETURNING = new ThreadLocal<>();
    private static final ThreadLocal<Lease> STARTING_HOME = new ThreadLocal<>();

    private static final class Lease {
        final Object service, root, task, content;
        final Display display;
        final int taskId, displayId, userId, ownerPid;
        final String displayName, uniqueId, component;
        AtomicWorkbenchWallpaperHook.Session wallpaper;
        String phase = "prepared";
        int migrationSource = -1;
        boolean migrationPending;
        boolean taskMissingReported;
        Object rollbackParent;
        int rollbackIndex;
        Lease(Object service, Object root, Object task, Object content, int id, Display display, int user, int pid,
                String unique, String component) {
            this.service = service; this.root = root; this.task = task; this.content = content;
            this.display = display; taskId = id;
            displayId = display.getDisplayId(); displayName = display.getName(); uniqueId = unique;
            userId = user; ownerPid = pid; this.component = component;
        }
    }

    private AtomicWorkbenchHomeHook() { }

    static boolean isInstalled() { return installed; }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    static synchronized int install(AugmentModule module, ClassLoader loader) {
        if (installed) return 6;
        try {
            Class<?> serviceClass = Class.forName("com.android.server.wm.ActivityTaskManagerService", false, loader);
            Class<?> rootClass = Class.forName("com.android.server.wm.RootWindowContainer", false, loader);
            Class<?> areaClass = Class.forName("com.android.server.wm.TaskDisplayArea", false, loader);
            Class<?> displayClass = Class.forName("com.android.server.wm.DisplayContent", false, loader);
            Method removed = rootClass.getDeclaredMethod("onDisplayRemoved", int.class);
            // The ROM invokes this DisplayListener through the ATMS UiHandler before
            // onDisplayRemoved takes mGlobalLock and starts destroying HOME content.
            rootClass.getDeclaredField("mService");
            rootClass.getDeclaredField("mCurrentUser");
            displayClass.getDeclaredField("mDisplayInfo");
            displayClass.getDeclaredField("mRemoving");
            Class<?> taskClass = Class.forName("com.android.server.wm.Task", false, loader);
            taskClass.getDeclaredMethod("getBaseIntent");
            taskClass.getDeclaredField("mRemoving");
            Class.forName("com.android.server.wm.TaskFragment", false, loader).getDeclaredField("mIsRemovalRequested");
            Class<?> infoClass = Class.forName("android.view.DisplayInfo", false, loader);
            for (String name : new String[]{"displayId", "name", "uniqueId", "ownerUid", "type", "flags"})
                infoClass.getDeclaredField(name);
            Method move = serviceClass.getDeclaredMethod("moveRootTaskToDisplay", int.class, int.class);
            HomeStartAccess homeStart = new HomeStartAccess(rootClass, areaClass);
            Method home = homeStart.method;
            Method supports = displayClass.getDeclaredMethod("isHomeSupported");
            Method host = areaClass.getDeclaredMethod("canHostHomeTask");
            Method canStart = rootClass.getDeclaredMethod("canStartHomeOnDisplayArea", ActivityInfo.class, areaClass, boolean.class);
            Method placePrimary = rootClass.getDeclaredMethod("shouldPlacePrimaryHomeOnDisplay", int.class);
            // Probe all narrow dependencies before exposing the negative-ID handshake.
            rootClass.getDeclaredMethod("moveRootTaskToDisplay", int.class, int.class, boolean.class);
            rootClass.getDeclaredMethod("resumeFocusedTasksTopActivities");
            rootClass.getDeclaredMethod("getRootTask", int.class);
            rootClass.getDeclaredMethod("anyTaskForId", int.class, int.class);
            rootClass.getDeclaredMethod("getDisplayContent", int.class);
            android.os.Process.class.getDeclaredMethod("getUidForPid", int.class);
            // API 102 can refuse without throwing. Do not publish a partial HOME bridge.
            for (Method required : new Method[]{supports, host, home, move, canStart, placePrimary, removed})
                if (!module.deoptimize(required)) throw new IllegalStateException("HOME deoptimization refused: " + required);
            module.registerFeatureHook(module.prepareFeatureHook(supports, "atomic_workbench.native_home.display_support", true)
                    .intercept(chain -> authenticatedDisplay(chain.getThisObject()) ? true : chain.proceed()));
            module.registerFeatureHook(module.prepareFeatureHook(host, "atomic_workbench.native_home.area_host", true)
                    .intercept(chain -> authenticatedDisplay(field(chain.getThisObject(), "mDisplayContent")) ? true : chain.proceed()));
            module.registerFeatureHook(module.prepareFeatureHook(placePrimary, "atomic_workbench.native_home.primary_placement", true)
                    .intercept(chain -> {
                Lease current = STARTING_HOME.get();
                return current != null && current == lease && chain.getThisObject() == current.root
                        && (Integer) chain.getArg(0) == current.displayId ? true : chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(canStart, "atomic_workbench.native_home.launch_admission", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                Lease previous = STARTING_HOME.get();
                STARTING_HOME.remove();
                try {
                    Lease current = lease;
                    boolean authenticated = current != null && current.root == chain.getThisObject()
                            && primaryLaunchAllowed(current, (ActivityInfo) chain.getArg(0), chain.getArg(1));
                    if (authenticated) STARTING_HOME.set(current);
                    // Keep the framework's factory-test, instrumentation and
                    // display checks. Only its primary-HOME placement decision
                    // recognizes the existing, authenticated HOME lease here.
                    Object allowed = chain.proceed();
                    try { if (authenticated) module.logFeatureInfo("ATOMIC_NATIVE_HOME_LAUNCH target_display=" + current.displayId
                            + ";user=" + current.userId + ";task=" + current.taskId
                            + ";phase=" + (Boolean.TRUE.equals(allowed) ? "admitted" : "native_rejected")
                            + ";reason=leased_primary_placement"); }
                    catch (Throwable ignored) { /* Observation cannot replay a native launch decision. */ }
                    return allowed;
                } finally { if (previous == null) STARTING_HOME.remove(); else STARTING_HOME.set(previous); }
            }));
            module.registerFeatureHook(module.prepareFeatureHook(home, "atomic_workbench.native_home.home_route", true).intercept(chain -> {
                Lease current = lease;
                if (current == null || Boolean.TRUE.equals(RETURNING.get())) return chain.proceed();
                int routedDisplay = -1;
                try {
                    Object area = chain.getArg(2);
                    if (area == null) return chain.proceed();
                    int displayId = (Integer) call(field(area, "mDisplayContent"), "getDisplayId", new Class<?>[0]);
                    routedDisplay = displayId;
                    int userId = (Integer) chain.getArg(0);
                    if (userId != current.userId) return chain.proceed();
                    if (!validTask(current)) {
                        route(module, current, routedDisplay, "task_unconfirmed", "home_request", null);
                        return routedDisplay == current.displayId ? false : chain.proceed();
                    }
                    if (displayId == current.displayId && validDisplay(current)) {
                        // Migration may ask for HOME while the task is still being reparented.
                        // Do not let that transient state manufacture SecondaryDisplayLauncher.
                        if (taskDisplay(current.task) != current.displayId) return false;
                        // Android's six-argument path can maintain HOME behind another task.
                        // The authenticated existing HOME satisfies it without stealing focus.
                        if (homeStart.hasPlacement && !Boolean.TRUE.equals(chain.getArg(5))) return true;
                        call(current.task, "moveToFront", new Class<?>[]{String.class}, "DuoNativeHome");
                        call(current.root, "resumeFocusedTasksTopActivities", new Class<?>[0]);
                        route(module, current, displayId, "confirmed", "owned_display_home", null);
                        return true;
                    }
                    if (displayId == Display.DEFAULT_DISPLAY && Boolean.TRUE.equals(chain.getArg(4))
                            && (!homeStart.hasPlacement || Boolean.TRUE.equals(chain.getArg(5)))
                            && taskDisplay(current.task) == current.displayId) {
                        // Display 0 is also used by preload/repair. Only the explicit HOME-key
                        // provenance requests a foreground return here. Gesture animations retain
                        // their own launch display; ordinary default-display repair remains native.
                        restore(module, current, true, "explicit_home_key:" + String.valueOf(chain.getArg(1)));
                    }
                } catch (Throwable failure) {
                    module.logFeatureError("ATOMIC_NATIVE_HOME_ROUTE_FAILED", failure);
                    // A failed leased-display route must not fall through to SECONDARY_HOME.
                    if (routedDisplay == current.displayId) return false;
                    // Never prevent the physical display's normal HOME path on a module failure.
                }
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(move, "atomic_workbench.native_home.task_move", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                int encoded = (Integer) chain.getArg(0), target = (Integer) chain.getArg(1);
                Lease current = lease;
                if (installed && Binder.getCallingUid() == 0 && encoded <= -ENCODE_BASE
                        && target <= Integer.MIN_VALUE + Integer.MAX_VALUE / 100000) {
                    int id = Math.toIntExact(-(long) encoded - ENCODE_BASE);
                    int user = Math.toIntExact((long) target - Integer.MIN_VALUE);
                    Object service = chain.getThisObject();
                    synchronized (field(service, "mGlobalLock")) {
                        confirmPrimaryHomeTask(service, id, user);
                        return null;
                    }
                }
                if (installed && Binder.getCallingUid() == 0 && target < 0 && encoded <= -ENCODE_BASE) {
                    int id = Math.toIntExact(-(long) encoded - ENCODE_BASE);
                    int user = Math.toIntExact(-(long) target - 1L);
                    Object service = chain.getThisObject();
                    synchronized (field(service, "mGlobalLock")) {
                        confirmRetiredHome(module, service, id, user);
                        return null;
                    }
                }
                if (installed && Binder.getCallingUid() == 0 && target == 0 && encoded <= -ENCODE_BASE) {
                    int id = Math.toIntExact(-(long) encoded - ENCODE_BASE);
                    Object service = chain.getThisObject();
                    synchronized (field(service, "mGlobalLock")) {
                        Object root = field(service, "mRootWindowContainer");
                        Object task = call(root, "anyTaskForId", new Class<?>[]{int.class, int.class}, id, 0);
                        if (task == null || !Boolean.TRUE.equals(call(task, "isActivityTypeHome", new Class<?>[0]))
                                || !stableAt(task, 0)) throw new IllegalStateException("native_home_primary_structure_unconfirmed");
                        return null;
                    }
                }
                if (installed && Binder.getCallingUid() == 0 && target == 0 && encoded >= 0 && current == null) {
                    // A replacement root daemon may be recovering a durable journal after the
                    // system hook lost its in-memory lease. Reauthenticate the actual owned VD.
                    Object service = chain.getThisObject();
                    synchronized (field(service, "mGlobalLock")) {
                        Object root = field(service, "mRootWindowContainer");
                        Object task = call(root, "getRootTask", new Class<?>[]{int.class}, encoded);
                        if (task != null && Boolean.TRUE.equals(call(task, "isActivityTypeHome", new Class<?>[0]))
                                && actualDisplay(task) > 0) {
                            Object content = call(root, "getDisplayContent", new Class<?>[]{int.class}, actualDisplay(task));
                            Display display = content == null ? null : (Display) field(content, "mDisplay");
                            if (display != null && NAME.matcher(display.getName()).matches()) {
                                current = authenticate(service, encoded, actualDisplay(task), Binder.getCallingPid(), true);
                                lease = current; watch(module);
                            }
                        }
                    }
                }
                if (installed && Binder.getCallingUid() == 0 && target == 0 && current != null && encoded == current.taskId) {
                    synchronized (field(current.service, "mGlobalLock")) {
                        try { restore(module, current, false, "root_recovery"); }
                        catch (Throwable failure) { route(module, current, 0, "recovery_pending", "root_recovery", failure); throw failure; }
                        // PASSTHROUGH preserves failures without re-running a partial mutation.
                        return null;
                    }
                }
                if (!installed || encoded > -ENCODE_BASE || Binder.getCallingUid() != 0 || target <= 0) return chain.proceed();
                long decoded = -(long) encoded - ENCODE_BASE;
                if (decoded < 0 || decoded > Integer.MAX_VALUE) throw new SecurityException("native_home_task_encoding");
                Object service = chain.getThisObject();
                synchronized (field(service, "mGlobalLock")) {
                    Lease old = lease;
                    if (old != null) {
                        if (old.taskId == decoded && old.service == service && old.ownerPid == Binder.getCallingPid()
                                && validTask(old) && validDisplay(old) && stableAt(old.task, old.displayId)) {
                            if (old.displayId == target) {
                                acquireWallpaper(module, old); return null;
                            }
                            // Authenticate both VDs before one reparent. Returning through display 0
                            // changes launcher configuration twice and destroys its wallpaper target.
                            Lease next = authenticate(service, (int) decoded, target, Binder.getCallingPid(), old.displayId);
                            lease = next;
                            try {
                                moveSafely(module, old, target, false, "direct_transfer");
                                if (!validTask(next) || !stableAt(next.task, target) || !validDisplay(next))
                                    throw new IllegalStateException("native_home_transfer_unconfirmed");
                                acquireWallpaper(module, next); watch(module);
                                route(module, next, target, "confirmed", "direct_transfer;from=" + old.displayId, null);
                                return null;
                            } catch (Throwable failure) {
                                // moveSafely rolls back under the source's authenticated identity.
                                lease = old.migrationPending || old.rollbackParent != null
                                        || validTask(old) && stableAt(old.task, old.displayId) ? old : next;
                                watch(module); throw failure;
                            }
                        }
                        if (validTask(old) && stableAt(old.task, 0)) restore(module, old, false, "observed_primary_before_borrow");
                        else throw new IllegalStateException("previous_native_home_not_restored");
                    }
                    Lease candidate = authenticate(service, (int) decoded, target, Binder.getCallingPid());
                    lease = candidate;
                    try {
                        // App promotion keeps its current task in front. Explicit HOME requests
                        // focus HOME after the client has confirmed this migration.
                        moveSafely(module, candidate, target, false, "borrow");
                        if (!validTask(candidate) || !stableAt(candidate.task, target) || !validDisplay(candidate))
                            throw new IllegalStateException("native_home_migration_unconfirmed");
                        acquireWallpaper(module, candidate); watch(module);
                        return null;
                    } catch (Throwable failure) {
                        // Keep responsibility if the binder failed after the task actually moved.
                        if (validTask(candidate) && stableAt(candidate.task, 0)) finishLease(candidate);
                        else { if (validTask(candidate) && stableAt(candidate.task, target)) acquireWallpaper(module, candidate); watch(module); }
                        route(module, candidate, target, "migration_failed", "borrow", failure);
                        throw failure;
                    }
                }
            }));
            module.registerFeatureHook(module.prepareFeatureHook(removed, "atomic_workbench.native_home.before_display_removed", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                // Recovery is best effort; it cannot suppress, replay or replace the
                // framework removal, including the framework's original exception.
                try { beforeDisplayRemoved(chain.getThisObject(), (Integer) chain.getArg(0)); }
                catch (Throwable ignored) { /* An uncertain lease remains owned. */ }
                return chain.proceed();
            }));
            installDrawObservers(module, loader);
            installHostFinishObservers(module, loader);
            installed = true; return 6;
        } catch (Throwable failure) {
            module.logFeatureError("ATOMIC_NATIVE_HOME_UNAVAILABLE", failure); return 0;
        }
    }
    /** Full runtime signatures; SDK/model labels never select the HOME route. */
    private static final class HomeStartAccess {
        final Method method;
        final boolean hasPlacement;
        HomeStartAccess(Class<?> root,Class<?> area)throws ReflectiveOperationException {
            Method selected=find(root,int.class,String.class,area,boolean.class,boolean.class,boolean.class);
            hasPlacement=selected!=null;
            if(selected==null)selected=find(root,int.class,String.class,area,boolean.class,boolean.class);
            if(selected==null||selected.getReturnType()!=boolean.class
                    ||java.lang.reflect.Modifier.isStatic(selected.getModifiers())
                    ||java.lang.reflect.Modifier.isAbstract(selected.getModifiers()))
                throw new NoSuchMethodException("startHomeOnTaskDisplayArea requires an instance boolean 5/6-argument contract");
            selected.setAccessible(true);method=selected;
        }
        private static Method find(Class<?> root,Class<?>... parameters) {
            for(Class<?> owner=root;owner!=null;owner=owner.getSuperclass())try {
                return owner.getDeclaredMethod("startHomeOnTaskDisplayArea",parameters);
            }catch(NoSuchMethodException absent){ /* Keep the original defining class for inherited methods. */ }
            return null;
        }
    }

    private static boolean primaryLaunchAllowed(Lease current, ActivityInfo info, Object area) {
        try {
            if (!installed || info == null || info.applicationInfo == null || area == null
                    || info.applicationInfo.uid / 100000 != current.userId
                    || !current.component.equals(new ComponentName(info.packageName, info.name).flattenToString())
                    || (Integer) callStatic(android.os.Process.class, "getUidForPid", new Class<?>[]{int.class}, current.ownerPid) != 0
                    || current.migrationPending || current.rollbackParent != null
                    || !validTask(current) || !validDisplay(current) || !stableAt(current.task, current.displayId)) return false;
            int caller = Binder.getCallingUid();
            if (caller != 0 && caller != 1000 && caller != info.applicationInfo.uid) return false;
            Object content = call(current.root, "getDisplayContent", new Class<?>[]{int.class}, current.displayId);
            if (content == null || call(content, "getDefaultTaskDisplayArea", new Class<?>[0]) != area) return false;
            Context context = (Context) field(current.service, "mContext");
            ApplicationInfo launcher = (ApplicationInfo) call(context.getPackageManager(), "getApplicationInfoAsUser",
                    new Class<?>[]{String.class, int.class, int.class}, info.packageName, 0, current.userId);
            ResolveInfo resolved = (ResolveInfo) call(context.getPackageManager(), "resolveActivityAsUser",
                    new Class<?>[]{Intent.class, int.class, int.class},
                    new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME), PackageManager.MATCH_DEFAULT_ONLY, current.userId);
            return launcher.uid == info.applicationInfo.uid && resolved != null && resolved.activityInfo != null
                    && current.component.equals(new ComponentName(resolved.activityInfo.packageName, resolved.activityInfo.name).flattenToString());
        } catch (Exception unavailable) { return false; }
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void installDrawObservers(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> window = Class.forName("com.android.server.wm.WindowState", false, loader);
            Class<?> animator = Class.forName("com.android.server.wm.WindowStateAnimator", false, loader);
            Method show = window.getDeclaredMethod("performShowLocked");
            Method commit = animator.getDeclaredMethod("commitFinishDrawingLocked");
            for (Method method : new Method[]{show, commit}) {
                module.registerFeatureHook(module.prepareFeatureHook(method,
                        "atomic_workbench.native_home.draw." + method.getName(), true).intercept(chain -> {
                    Object result = chain.proceed();
                    if (Boolean.TRUE.equals(result)) {
                        try { AtomicWorkbenchWallpaperHook.noteDrawn(method == show ? chain.getThisObject() : field(chain.getThisObject(), "mWin")); }
                        catch (Throwable ignored) { /* Observation cannot affect a framework draw. */ }
                    }
                    return result;
                }));
                module.deoptimize(method);
            }
        } catch (Throwable unavailable) { module.logFeatureError("ATOMIC_NATIVE_HOME_DRAW_OBSERVER_UNAVAILABLE", unavailable); }
    }

    /** Optional witnesses only: neither entry can suppress or replay a system finish. */

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void installHostFinishObservers(AugmentModule module, ClassLoader loader) {
        String capability = "ActivityRecord";
        try {
            Class<?> record = Class.forName("com.android.server.wm.ActivityRecord", false, loader);
            Class<?> task = Class.forName("com.android.server.wm.Task", false, loader);
            capability = "mActivityComponent";
            Field component = finishField(record, capability, ComponentName.class);
            capability = "mUserId";
            Field user = finishField(record, capability, int.class);
            capability = "finishing";
            Field finishing = finishField(record, capability, boolean.class);
            capability = "mTaskId";
            Field taskId = finishField(task, capability, int.class);
            capability = "getTask";
            Method getTask = record.getDeclaredMethod(capability);
            if (getTask.getReturnType() != task || Modifier.isStatic(getTask.getModifiers())) throw new NoSuchMethodException(capability);
            getTask.setAccessible(true);
            capability = "getDisplayId";
            Method getDisplay = record.getDeclaredMethod(capability);
            if (getDisplay.getReturnType() != int.class || Modifier.isStatic(getDisplay.getModifiers())) throw new NoSuchMethodException(capability);
            getDisplay.setAccessible(true);
            for (String name : new String[]{"finishIfPossible", "makeFinishingLocked"}) {
                try {
                    Method method = "finishIfPossible".equals(name)
                            ? record.getDeclaredMethod(name, int.class, Intent.class,
                                    Class.forName("com.android.server.uri.NeededUriGrants", false, loader), String.class, boolean.class)
                            : record.getDeclaredMethod(name);
                    if (method.getReturnType() != ("finishIfPossible".equals(name) ? int.class : void.class)
                            || Modifier.isStatic(method.getModifiers()))
                        throw new NoSuchMethodException(name);
                    module.registerFeatureHook(module.prepareFeatureHook(method,
                            "atomic_workbench.native_home.host_finish." + name, true)
                            .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                        try {
                            Object owner = chain.getThisObject();
                            ComponentName actual = (ComponentName) component.get(owner);
                            if (actual != null && PACKAGE.equals(actual.getPackageName())
                                    && "ls.augment.com.AtomicWorkbenchActivity".equals(actual.getClassName())
                                    && !finishing.getBoolean(owner)) {
                                Object currentTask = getTask.invoke(owner);
                                String reason = "finishIfPossible".equals(name) ? (String) chain.getArg(3) : "state_transition";
                                if (reason == null) reason = "none";
                                else if (!reason.matches("[A-Za-z0-9_.$:-]{1,96}")) reason = "redacted";
                                module.logFeatureInfo("ATOMIC_NATIVE_HOME_HOST_FINISH phase=" + name
                                        + ";reason=" + reason + ";task=" + (currentTask == null ? -1 : taskId.getInt(currentTask))
                                        + ";user=" + user.getInt(owner) + ";display=" + getDisplay.invoke(owner)
                                        + ";caller_uid=" + Binder.getCallingUid() + ";caller_pid=" + Binder.getCallingPid());
                            }
                        } catch (Throwable ignored) { /* No observation failure can affect native finish. */ }
                        return chain.proceed();
                    }));
                    module.deoptimize(method);
                    finishObserverStatus(module, "ready", name);
                } catch (Throwable unavailable) { finishObserverStatus(module, "unavailable", name); }
            }
            // The short overload delegates to the full entry. Observe once, including when ART inlines it.
            try {
                Method shortFinish = record.getDeclaredMethod("finishIfPossible", String.class, boolean.class);
                if (shortFinish.getReturnType() == int.class && !Modifier.isStatic(shortFinish.getModifiers())) module.deoptimize(shortFinish);
            } catch (Throwable unavailable) { finishObserverStatus(module, "unavailable", "finishIfPossible_short_caller"); }
        } catch (Throwable unavailable) { finishObserverStatus(module, "unavailable", capability); }
    }

    private static Field finishField(Class<?> owner, String name, Class<?> type) throws Exception {
        Field result = owner.getDeclaredField(name);
        if (result.getType() != type || Modifier.isStatic(result.getModifiers())) throw new NoSuchFieldException(name);
        result.setAccessible(true);
        return result;
    }

    private static void finishObserverStatus(AugmentModule module, String phase, String capability) {
        try { module.logFeatureInfo("ATOMIC_NATIVE_HOME_HOST_FINISH_OBSERVER phase=" + phase + ";reason=" + capability); }
        catch (Throwable ignored) { /* Optional diagnostics cannot affect the six HOME routes. */ }
    }

    private static Throwable finishWitnessStack() {
        Throwable safe = new Throwable((String) null);
        ArrayList<StackTraceElement> frames = new ArrayList<>();
        for (StackTraceElement frame : safe.getStackTrace()) {
            if (frames.size() >= 12) break;
            String type = frame.getClassName();
            if (type.equals(AtomicWorkbenchHomeHook.class.getName())
                    || type.equals(AugmentModule.class.getName()) || type.startsWith(AugmentModule.class.getName() + "$")
                    || type.startsWith("io.github.libxposed.") || type.startsWith("org.lsposed.lspd.")
                    || type.startsWith("LSPHooker_") || type.startsWith("java.lang.reflect.")
                    || type.startsWith("jdk.internal.reflect.")) continue;
            String file = frame.getFileName();
            if (type.matches("[A-Za-z0-9_.$]{1,160}")
                    && frame.getMethodName().matches("[A-Za-z0-9_.$<>-]{1,160}")
                    && (file == null || file.matches("[A-Za-z0-9_.$-]{1,160}"))) frames.add(frame);
        }
        safe.setStackTrace(frames.toArray(new StackTraceElement[0]));
        return safe;
    }

    private static Lease authenticate(Object service, int taskId, int displayId, int pid) throws Exception {
        return authenticate(service, taskId, displayId, pid, false);
    }

    private static Lease authenticate(Object service, int taskId, int displayId, int pid, boolean recovering) throws Exception {
        return authenticate(service, taskId, displayId, pid, recovering ? displayId : 0);
    }

    private static Lease authenticate(Object service, int taskId, int displayId, int pid, int sourceDisplay) throws Exception {
        Object root = field(service, "mRootWindowContainer");
        Object task = call(root, "getRootTask", new Class<?>[]{int.class}, taskId);
        if (task == null || !Boolean.TRUE.equals(call(task, "isActivityTypeHome", new Class<?>[0]))
                || !stableAt(task, sourceDisplay))
            throw new SecurityException("native_home_requires_existing_primary_task");
        Object content = call(root, "getDisplayContent", new Class<?>[]{int.class}, displayId);
        if (content == null) throw new SecurityException("native_home_display_missing");
        Display display = (Display) field(content, "mDisplay");
        Matcher name = NAME.matcher(display.getName());
        if (!name.matches() || !UUID.fromString(name.group(3)).toString().equals(name.group(3)))
            throw new SecurityException("native_home_display_name");
        int uid = Integer.parseInt(name.group(1)), user = (Integer) field(task, "mUserId");
        if (uid < 10000 || uid / 100000 != user || (Integer) call(display, "getOwnerUid", new Class<?>[0]) != 0
                || (Integer) call(display, "getType", new Class<?>[0]) != staticInt(Display.class, "TYPE_VIRTUAL")
                || (display.getFlags() & staticInt(Display.class, "FLAG_TRUSTED")) == 0)
            throw new SecurityException("native_home_display_owner_or_user");
        Context context = (Context) field(service, "mContext");
        ApplicationInfo owner = (ApplicationInfo) call(context.getPackageManager(), "getApplicationInfoAsUser",
                new Class<?>[]{String.class, int.class, int.class}, PACKAGE, 0, user);
        if (owner.uid != uid) throw new SecurityException("native_home_module_uid");
        Object info = call(task, "getTaskInfo", new Class<?>[0]);
        Object base = field(info, "baseActivity");
        if (!(base instanceof ComponentName)) throw new SecurityException("native_home_component_missing");
        Intent intent = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME);
        ResolveInfo resolved = (ResolveInfo) call(context.getPackageManager(), "resolveActivityAsUser",
                new Class<?>[]{Intent.class, int.class, int.class}, intent, PackageManager.MATCH_DEFAULT_ONLY, user);
        if (resolved == null || resolved.activityInfo == null
                || !base.equals(new ComponentName(resolved.activityInfo.packageName, resolved.activityInfo.name)))
            throw new SecurityException("native_home_not_current_primary_launcher");
        String unique = (String) call(display, "getUniqueId", new Class<?>[0]);
        if (unique == null || unique.isEmpty()) throw new SecurityException("native_home_display_identity");
        return new Lease(service, root, task, content, taskId, display, user, pid, unique, ((ComponentName) base).flattenToString());
    }

    /** Only the original, still attached HOME is eligible for pre-removal return. */
    private static void beforeDisplayRemoved(Object root, int displayId) throws Exception {
        Lease current = lease;
        if (!installed || current == null || displayId <= 0 || root != current.root
                || displayId != current.displayId) return;
        Object lock = field(current.service, "mGlobalLock");
        // Normal ROM delivery is through the UiHandler without this lock. A nested
        // locked call cannot do the required fresh default-HOME resolution safely.
        if (Thread.holdsLock(lock)) return;
        String primary = resolvedHome(current.service, current.userId);
        AtomicWorkbenchWallpaperHook.Session wallpaper = null;
        synchronized (lock) {
            if (lease != current || field(root, "mService") != current.service
                    || field(current.service, "mRootWindowContainer") != root
                    || (Integer) field(root, "mCurrentUser") != current.userId
                    || !current.component.equals(primary)
                    || current.migrationPending || current.rollbackParent != null
                    || !removalDisplayMatches(current) || !removalTaskMatches(current)) return;
            if (!stableAt(current.task, 0)) {
                if (!stableAt(current.task, displayId)) return;
                Object target = call(root, "getDisplayContent", new Class<?>[]{int.class}, 0);
                if (target == null || Boolean.TRUE.equals(field(target, "mRemoving"))) return;
                Object area = call(target, "getDefaultTaskDisplayArea", new Class<?>[0]);
                // Do not run the normal PM-backed compatiblePrimaryHome merge under
                // this lock. Existing or unknown primary HOME is a pending conflict.
                if (area == null || call(area, "getRootHomeTask", new Class<?>[0]) != null) return;
                Object parent = call(current.task, "getParent", new Class<?>[0]);
                int index = childIndex(parent, current.task);
                current.migrationSource = displayId;
                current.rollbackParent = parent;
                current.rollbackIndex = index;
                current.migrationPending = true;
                current.phase = "removal_return_pending";
                Boolean returning = RETURNING.get();
                long identity = Binder.clearCallingIdentity();
                try {
                    RETURNING.set(true);
                    // Same normal reparent entry as moveSafely, with no alternate
                    // Task, detached-task resurrection, foregrounding or PM merge.
                    call(root, "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class, boolean.class},
                            current.taskId, 0, false);
                } catch (Exception failure) {
                    // A native exception can follow an applied move. Confirm that
                    // exact object rather than replaying it or discarding ownership.
                    if (!removalTaskMatches(current) || !stableAt(current.task, 0)) throw failure;
                } finally {
                    try { if (returning == null) RETURNING.remove(); else RETURNING.set(returning); }
                    finally { Binder.restoreCallingIdentity(identity); }
                }
                if (!removalTaskMatches(current) || !stableAt(current.task, 0)) return;
                clearMigration(current);
            }
            // Terminal only after the same live Task is structurally back on 0.
            current.phase = "removal_return_confirmed";
            wallpaper = current.wallpaper;
        }
        // No worker initialization, queue, telemetry or other subsystem call in WM.
        // Keep the lease and its resource reference if release itself is unknown.
        AtomicWorkbenchWallpaperHook.release(wallpaper);
        synchronized (lock) {
            if (lease == current && current.wallpaper == wallpaper
                    && !current.migrationPending && current.rollbackParent == null
                    && removalTaskMatches(current) && stableAt(current.task, 0)) {
                lease = null;
                current.wallpaper = null;
            }
        }
    }

    private static boolean removalDisplayMatches(Lease current) throws Exception {
        Object content = call(current.root, "getDisplayContent", new Class<?>[]{int.class}, current.displayId);
        if (content != current.content || field(content, "mDisplay") != current.display
                || Boolean.TRUE.equals(field(content, "mRemoving"))) return false;
        // DisplayContent's own WM-locked cache remains available when DMS has
        // already retired its logical Display. Public Display getters may refresh.
        Object info = field(content, "mDisplayInfo");
        return info != null && (Integer) field(info, "displayId") == current.displayId
                && current.displayName.equals(field(info, "name"))
                && current.uniqueId.equals(field(info, "uniqueId"))
                && (Integer) field(info, "ownerUid") == 0
                && (Integer) field(info, "type") == staticInt(Display.class, "TYPE_VIRTUAL")
                && ((Integer) field(info, "flags") & staticInt(Display.class, "FLAG_TRUSTED")) != 0;
    }

    private static boolean removalTaskMatches(Lease current) throws Exception {
        Object task = call(current.root, "anyTaskForId", new Class<?>[]{int.class, int.class}, current.taskId, 0);
        if (task != current.task || !Boolean.TRUE.equals(call(task, "isActivityTypeHome", new Class<?>[0]))
                || (Integer) field(task, "mUserId") != current.userId
                || Boolean.TRUE.equals(field(task, "mRemoving"))
                || Boolean.TRUE.equals(field(task, "mIsRemovalRequested"))) return false;
        Object intent = call(task, "getBaseIntent", new Class<?>[0]);
        ComponentName base = intent instanceof Intent ? ((Intent) intent).getComponent() : null;
        if (base == null || !current.component.equals(base.flattenToString())) return false;
        int display = taskDisplay(task);
        if (display != 0 && display != current.displayId) return false;
        Object expected = display == 0
                ? call(current.root, "getDisplayContent", new Class<?>[]{int.class}, 0) : current.content;
        Object parent = call(task, "getParent", new Class<?>[0]);
        for (int depth = 0; parent != null && depth < 64; depth++) {
            if (parent.getClass().getName().equals("com.android.server.wm.TaskDisplayArea"))
                return expected != null && field(parent, "mDisplayContent") == expected;
            parent = call(parent, "getParent", new Class<?>[0]);
        }
        return false;
    }

    private static boolean authenticatedDisplay(Object content) {
        Lease current = lease;
        if (current == null || content == null) return false;
        try { return (Integer) call(content, "getDisplayId", new Class<?>[0]) == current.displayId && validDisplay(current); }
        catch (Exception ignored) { return false; }
    }

    private static boolean validDisplay(Lease current) throws Exception {
        Object content = call(current.root, "getDisplayContent", new Class<?>[]{int.class}, current.displayId);
        if (content == null) return false;
        Display display = (Display) field(content, "mDisplay");
        return display.getName().equals(current.displayName)
                && current.uniqueId.equals(call(display, "getUniqueId", new Class<?>[0]))
                && (Integer) call(display, "getOwnerUid", new Class<?>[0]) == 0
                && (display.getFlags() & staticInt(Display.class, "FLAG_TRUSTED")) != 0;
    }

    private static boolean validTask(Lease current) throws Exception {
        // MATCH_TASK_IN_STACKS_ONLY (0) never restores an absent recent task as a side effect.
        Object task = call(current.root, "anyTaskForId", new Class<?>[]{int.class, int.class}, current.taskId, 0);
        if (task != current.task || !Boolean.TRUE.equals(call(task, "isActivityTypeHome", new Class<?>[0]))
                || (Integer) field(task, "mUserId") != current.userId) return false;
        Object base = field(call(task, "getTaskInfo", new Class<?>[0]), "baseActivity");
        return base instanceof ComponentName && current.component.equals(((ComponentName) base).flattenToString());
    }

    private static void restore(AugmentModule module, Lease current, boolean onTop, String reason) throws Exception {
        long identity = Binder.clearCallingIdentity();
        RETURNING.set(true);
        try {
            if (current.migrationPending && !stableAt(current.task, actualDisplay(current.task)) && current.rollbackParent != null)
                rollback(current);
            if (!validTask(current)) throw new IllegalStateException("native_home_identity_or_attachment_unconfirmed");
            if (taskDisplay(current.task) != 0) moveSafely(module, current, 0, onTop, reason);
            if (!validTask(current) || !stableAt(current.task, 0)) throw new IllegalStateException("native_home_restore_unconfirmed");
            if (validDisplay(current)) call(field(current.service, "mWindowManager"), "setShouldShowSystemDecors",
                    new Class<?>[]{int.class, boolean.class}, current.displayId, false);
            finishLease(current);
        } finally { RETURNING.remove(); Binder.restoreCallingIdentity(identity); }
    }

    /** Preflight HOME uniqueness before WindowContainer.reparent can detach the original. */
    private static void moveSafely(AugmentModule module, Lease current, int target, boolean onTop, String reason) throws Exception {
        if (!validTask(current) || !stableAt(current.task, actualDisplay(current.task)))
            throw new IllegalStateException("native_home_task_unconfirmed");
        int source = taskDisplay(current.task);
        Object content = call(current.root, "getDisplayContent", new Class<?>[]{int.class}, target);
        if (content == null) throw new IllegalStateException("native_home_target_display_missing");
        Object area = call(content, "getDefaultTaskDisplayArea", new Class<?>[0]);
        Object existing = call(area, "getRootHomeTask", new Class<?>[0]);
        Object parent = call(current.task, "getParent", new Class<?>[0]);
        if (parent == null) throw new IllegalStateException("native_home_parent_missing");
        int parentIndex = childIndex(parent, current.task);
        if (existing != null && existing != current.task) {
            // A replacement primary HOME may have been created by preload or display repair.
            // Keep both system objects: reparent through the normal Task API as a child of
            // the already registered HOME root, instead of adding a second root reference.
            if (target != 0 || !compatiblePrimaryHome(current, existing)) {
                route(module, current, target, "conflict", "existing_home=" + homeShape(existing, 0), null);
                throw new IllegalStateException("native_home_target_home_conflict");
            }
        }
        current.migrationSource = source;
        current.phase = "moving";
        route(module, current, target, current.phase, reason + ";from=" + source + ";merge=" + (existing != null && existing != current.task), null);
        try {
            current.rollbackParent = parent; current.rollbackIndex = parentIndex; current.migrationPending = true;
            if (existing != null && existing != current.task) {
                call(current.task, "reparent", new Class<?>[]{current.task.getClass(), int.class, boolean.class, String.class},
                        existing, onTop ? Integer.MAX_VALUE : Integer.MIN_VALUE, false, "DuoNativeHomeRecovery");
                if (onTop) call(existing, "moveToFront", new Class<?>[]{String.class}, "DuoNativeHomeRecovery");
            } else call(current.root, "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class, boolean.class}, current.taskId, target, onTop);
        } catch (Exception failure) {
            // The framework may throw after applying the move. Confirm rather than replay it.
            if (validTask(current) && stableAt(current.task, target)) {
                current.phase = "confirmed_after_exception";
                try { route(module, current, target, current.phase, reason, failure); }
                finally { clearMigration(current); }
                return;
            }
            // This ROM removes the old parent before adding the target. Retain the original
            // object and put a detached task back through its normal parent's addChild API.
            // Never overwrite mRootHomeTask or remove another HOME to repair a collision.
            try {
                if (source == 0 || validDisplay(current)) rollback(current);
            } catch (Exception rollback) { failure.addSuppressed(rollback); }
            current.phase = current.migrationPending ? "rollback_pending" : "rolled_back";
            route(module, current, target, current.phase, reason, failure); throw failure;
        }
        if (!validTask(current) || !stableAt(current.task, target))
            throw new IllegalStateException("native_home_migration_unconfirmed");
        current.phase = "confirmed";
        try { route(module, current, target, current.phase, reason, null); }
        finally { clearMigration(current); }
    }

    private static void clearMigration(Lease current) {
        // These references belong only to an interrupted reparent. Once stable, a later
        // system removal/restart must never resurrect the old HOME through this lease.
        current.migrationPending = false;
        current.rollbackParent = null;
        current.rollbackIndex = -1;
        current.migrationSource = -1;
    }

    private static int childIndex(Object parent, Object child) throws Exception {
        int count = (Integer) call(parent, "getChildCount", new Class<?>[0]);
        for (int index = 0; index < count; index++)
            if (call(parent, "getChildAt", new Class<?>[]{int.class}, index) == child) return index;
        throw new IllegalStateException("native_home_child_position_unconfirmed");
    }

    private static int actualDisplay(Object task) throws Exception {
        Object parent = call(task, "getParent", new Class<?>[0]);
        for (int depth = 0; parent != null && depth < 64; depth++) {
            if (parent.getClass().getName().equals("com.android.server.wm.TaskDisplayArea"))
                return (Integer) call(field(parent, "mDisplayContent"), "getDisplayId", new Class<?>[0]);
            parent = call(parent, "getParent", new Class<?>[0]);
        }
        return -1;
    }

    private static boolean stableAt(Object task, int display) throws Exception {
        return display >= 0 && actualDisplay(task) == display && taskDisplay(task) == display
                && !Boolean.TRUE.equals(field(task, "mReparenting"));
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void rollback(Lease current) throws Exception {
        Object parent = current.rollbackParent;
        if (parent == null) throw new IllegalStateException("native_home_rollback_parent_missing");
        if (current.migrationSource > 0 && !validDisplay(current))
            throw new SecurityException("native_home_rollback_display_identity_changed");
        if (parent.getClass().getName().equals("com.android.server.wm.TaskDisplayArea")) {
            Object content = call(current.root, "getDisplayContent", new Class<?>[]{int.class}, current.migrationSource);
            if (content == null || call(content, "getDefaultTaskDisplayArea", new Class<?>[0]) != parent)
                throw new SecurityException("native_home_rollback_parent_replaced");
        }
        ClassLoader loader = current.task.getClass().getClassLoader();
        Class<?> container = Class.forName("com.android.server.wm.WindowContainer", false, loader);
        Object attached = call(current.task, "getParent", new Class<?>[0]);
        if (attached == null) {
            call(parent, "addChild", new Class<?>[]{container, int.class}, current.task, current.rollbackIndex);
            // No net parent/display change: removal/addition both skipped callbacks while
            // mReparenting was true, and the original cached display must still agree.
            if (actualDisplay(current.task) != current.migrationSource || taskDisplay(current.task) != current.migrationSource)
                throw new IllegalStateException("native_home_rollback_display_unconfirmed");
            setField(current.task, "mReparenting", false);
        } else if (attached != parent) {
            if (parent.getClass().getName().equals("com.android.server.wm.TaskDisplayArea"))
                call(current.task, "reparent", new Class<?>[]{parent.getClass(), boolean.class}, parent, false);
            else call(current.task, "reparent", new Class<?>[]{current.task.getClass(), int.class, boolean.class, String.class},
                    parent, current.rollbackIndex, false, "DuoNativeHomeRollback");
            call(parent, "positionChildAt", new Class<?>[]{int.class, container, boolean.class}, current.rollbackIndex, current.task, false);
        }
        if (!stableAt(current.task, current.migrationSource)) throw new IllegalStateException("native_home_rollback_unconfirmed");
        clearMigration(current);
    }

    private static boolean compatiblePrimaryHome(Lease current, Object task) throws Exception {
        String component = resolvedHome(current.service, current.userId);
        return current.component.equals(component) && stableAt(task, 0)
                && Boolean.TRUE.equals(call(task, "isActivityTypeHome", new Class<?>[0]))
                && homeTree(task, current.userId, component, 0) >= 0;
    }

    private static String resolvedHome(Object service, int user) throws Exception {
        Context context = (Context) field(service, "mContext");
        Intent intent = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME);
        ResolveInfo result = (ResolveInfo) call(context.getPackageManager(), "resolveActivityAsUser",
                new Class<?>[]{Intent.class, int.class, int.class}, intent, PackageManager.MATCH_DEFAULT_ONLY, user);
        if (result == null || result.activityInfo == null) throw new IllegalStateException("native_home_resolution_missing");
        return new ComponentName(result.activityInfo.packageName, result.activityInfo.name).flattenToString();
    }

    /** -1 is conflicting/unknown; 0 is an empty HOME container; positive is identified HOME. */

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static int homeTree(Object task, int user, String component, int depth) throws Exception {
        if (depth >= 64 || !stableAt(task, 0)) return -1;
        Object base = field(call(task, "getTaskInfo", new Class<?>[0]), "baseActivity");
        if (base != null && (!(base instanceof ComponentName)
                || !component.equals(((ComponentName) base).flattenToString()))) return -1;
        int matched = base == null ? 0 : 1;
        int count = (Integer) call(task, "getChildCount", new Class<?>[0]);
        Class<?> taskClass = Class.forName("com.android.server.wm.Task", false, task.getClass().getClassLoader());
        boolean container = count == 0 && base == null;
        for (int index = 0; index < count; index++) {
            Object child = call(task, "getChildAt", new Class<?>[]{int.class}, index);
            if (taskClass.isInstance(child)) {
                container = true;
                int nested = homeTree(child, user, component, depth + 1);
                if (nested < 0) return -1;
                matched += nested;
            } else if (base == null) return -1; // Activity records without a resolved identity are not an empty root.
        }
        // Framework-created HOME containers default mUserId to zero. Their current user,
        // together with each descendant task's real user, defines their ownership.
        if ((Integer) field(task, container ? "mCurrentUser" : "mUserId") != user) return -1;
        return matched;
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static String homeShape(Object task, int depth) throws Exception {
        if (task == null) return "missing";
        if (depth >= 4) return "depth_limit";
        Object base = field(call(task, "getTaskInfo", new Class<?>[0]), "baseActivity");
        int count = (Integer) call(task, "getChildCount", new Class<?>[0]);
        String shape = "{user=" + field(task, "mUserId") + ",current_user=" + field(task, "mCurrentUser") + ",base=" + String.valueOf(base)
                + ",display=" + taskDisplay(task) + ",actual=" + actualDisplay(task) + ",children=" + count;
        Class<?> taskClass = Class.forName("com.android.server.wm.Task", false, task.getClass().getClassLoader());
        for (int i = 0; i < Math.min(count, 4); i++) {
            Object child = call(task, "getChildAt", new Class<?>[]{int.class}, i);
            if (taskClass.isInstance(child)) shape += ",task=" + homeShape(child, depth + 1);
        }
        return shape + "}";
    }

    private static void confirmRetiredHome(AugmentModule module, Object service, int taskId, int user) throws Exception {
        Object root = field(service, "mRootWindowContainer");
        if (call(root, "anyTaskForId", new Class<?>[]{int.class, int.class}, taskId, 0) != null)
            throw new IllegalStateException("native_home_old_task_still_attached");
        Lease current = lease;
        if (current != null) {
            if (current.service != service || current.taskId != taskId || current.userId != user
                    || current.migrationPending || current.rollbackParent != null || validDisplay(current)
                    || (Integer) call(current.task, "getChildCount", new Class<?>[0]) != 0)
                throw new IllegalStateException("native_home_old_lease_unresolved");
        }
        Object content = call(root, "getDisplayContent", new Class<?>[]{int.class}, 0);
        if (content == null) throw new IllegalStateException("native_home_primary_display_missing");
        Object area = call(content, "getDefaultTaskDisplayArea", new Class<?>[0]);
        Object primary = call(area, "getRootHomeTask", new Class<?>[0]);
        String component = resolvedHome(service, user);
        if (primary == null || !stableAt(primary, 0)
                || !Boolean.TRUE.equals(call(primary, "isActivityTypeHome", new Class<?>[0]))
                || homeTree(primary, user, component, 0) <= 0)
            throw new IllegalStateException("native_home_replacement_unconfirmed");
        if (current != null) {
            route(module, current, 0, "retired", "old_task_absent;replacement=" + homeShape(primary, 0), null);
            finishLease(current);
        }
    }

    /** Exact lookup includes intermediate HOME Tasks omitted by both root and leaf snapshots. */
    private static void confirmPrimaryHomeTask(Object service, int taskId, int user) throws Exception {
        Object root = field(service, "mRootWindowContainer");
        Object task = call(root, "anyTaskForId", new Class<?>[]{int.class, int.class}, taskId, 0);
        Object content = call(root, "getDisplayContent", new Class<?>[]{int.class}, 0);
        Object area = content == null ? null : call(content, "getDefaultTaskDisplayArea", new Class<?>[0]);
        Object primary = area == null ? null : call(area, "getRootHomeTask", new Class<?>[0]);
        String component = resolvedHome(service, user);
        Lease current = lease;
        if (current != null && current.taskId == taskId
                && (current.service != service || current.root != root || current.task != task
                    || current.userId != user || !current.component.equals(component)
                    || current.migrationPending || current.rollbackParent != null))
            // A stable task location does not settle an interrupted lease transaction.
            // Only the restore/rollback path may discharge that remaining responsibility.
            throw new IllegalStateException("native_home_primary_lease_unresolved");
        if (task == null || primary == null || !stableAt(task, 0)
                || !Boolean.TRUE.equals(call(task, "isActivityTypeHome", new Class<?>[0]))
                || !Boolean.TRUE.equals(call(primary, "isActivityTypeHome", new Class<?>[0]))
                || homeTree(task, user, component, 0) < 0 || homeTree(primary, user, component, 0) <= 0)
            throw new IllegalStateException("native_home_primary_identity_unconfirmed");
        Object ancestor = task;
        for (int depth = 0; ancestor != null && depth < 64; depth++) {
            if (ancestor == primary) return;
            ancestor = call(ancestor, "getParent", new Class<?>[0]);
        }
        throw new IllegalStateException("native_home_primary_ancestry_unconfirmed");
    }

    private static void acquireWallpaper(AugmentModule module, Lease current) {
        current.wallpaper = AtomicWorkbenchWallpaperHook.acquire(module, current.service,
                current.displayId, current.userId, current.displayName, current.uniqueId, current.taskId, () -> {
                    try { return validDisplay(current) && (Integer) callStatic(android.os.Process.class,
                            "getUidForPid", new Class<?>[]{int.class}, current.ownerPid) == 0; }
                    catch (Exception unavailable) { return false; }
                });
    }

    private static void finishLease(Lease current) {
        if (lease == current) lease = null;
        AtomicWorkbenchWallpaperHook.release(current.wallpaper);
        current.wallpaper = null;
    }

    private static void route(AugmentModule module, Lease current, int target, String phase, String reason, Throwable failure) {
        int actual = -1; try { actual = taskDisplay(current.task); } catch (Exception ignored) { }
        int source = current.migrationSource >= 0 && (phase.equals("moving") || phase.equals("confirmed") || phase.equals("confirmed_after_exception")
                || phase.equals("rollback_pending") || phase.equals("migration_failed")) ? current.migrationSource : actual;
        String detail = "ATOMIC_NATIVE_HOME_ROUTE task=" + current.taskId + ";source_display=" + source
                + ";target_display=" + target + ";observed_display=" + actual + ";phase=" + phase + ";reason=" + reason;
        if (failure == null) module.logFeatureInfo(detail); else module.logFeatureError(detail, failure);
    }

    private static synchronized void watch(AugmentModule module) {
        if (watching) return;
        watching = true;
        Handler handler = new Handler(Looper.getMainLooper());
        handler.postDelayed(new Runnable() {
            public void run() {
                Lease current = lease;
                if (current == null) { synchronized (AtomicWorkbenchHomeHook.class) { watching = false; } return; }
                try {
                    synchronized (field(current.service, "mGlobalLock")) {
                        if (current.migrationPending && current.rollbackParent != null && !stableAt(current.task, actualDisplay(current.task))) rollback(current);
                        if (!validTask(current)) {
                            if (!current.taskMissingReported) route(module, current, 0, "recovery_pending", "watchdog_task_unconfirmed", null);
                            current.taskMissingReported = true;
                        }
                        else if (taskDisplay(current.task) == 0) restore(module, current, false, "watchdog_observed_primary");
                        else if (!validDisplay(current) || (Integer) callStatic(android.os.Process.class,
                                "getUidForPid", new Class<?>[]{int.class}, current.ownerPid) != 0) restore(module, current, false, "watchdog_owner_or_display_gone");
                    }
                } catch (Throwable failure) { module.logFeatureError("ATOMIC_NATIVE_HOME_RECOVERY_PENDING", failure); }
                handler.postDelayed(this, 1000L);
            }
        }, 1000L);
    }

    private static int taskDisplay(Object task) throws Exception { return (Integer) call(task, "getDisplayId", new Class<?>[0]); }
    private static int staticInt(Class<?> owner, String name) throws Exception { Field field = owner.getDeclaredField(name); field.setAccessible(true); return field.getInt(null); }
    private static Object field(Object object, String name) throws Exception {
        for (Class<?> type = object.getClass(); type != null; type = type.getSuperclass()) {
            try { Field field = type.getDeclaredField(name); field.setAccessible(true); return field.get(object); }
            catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }
    private static void setField(Object object, String name, Object value) throws Exception {
        for (Class<?> type = object.getClass(); type != null; type = type.getSuperclass()) {
            try { Field field = type.getDeclaredField(name); field.setAccessible(true); field.set(object, value); return; }
            catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }
    private static Object call(Object object, String name, Class<?>[] types, Object... args) throws Exception {
        Method method = object.getClass().getMethod(name, types); method.setAccessible(true); return method.invoke(object, args);
    }
    private static Object callStatic(Class<?> type, String name, Class<?>[] types, Object... args) throws Exception {
        Method method = type.getDeclaredMethod(name, types); method.setAccessible(true); return method.invoke(null, args);
    }
}
