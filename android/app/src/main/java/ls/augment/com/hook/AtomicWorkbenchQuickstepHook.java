package ls.augment.com.hook;

import android.app.ActivityManager;
import android.app.ActivityOptions;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.hardware.display.DisplayManager;
import android.view.Display;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import io.github.libxposed.api.XposedInterface.ExceptionMode;

/** Preserves the actual gesture display in the ROM's native Quickstep launch options. */
final class AtomicWorkbenchQuickstepHook {
    private static final Pattern NAME = Pattern.compile("DuoAtomic-([0-9]+)-w([0-7])-([0-9a-f-]{36})");
    private static final int TASK_SNAPSHOT_LIMIT = 128;
    private static boolean installed;
    private AtomicWorkbenchQuickstepHook() { }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        AtomicWorkbenchQuickstepInputHook.install(module, loader);
        try {
            Class<?> manager = Class.forName("com.android.quickstep.TaskAnimationManager", false, loader);
            Class<?> container = Class.forName("com.android.quickstep.BaseContainerInterface", false, loader);
            Class<?> gesture = Class.forName("com.android.quickstep.GestureState", false, loader);
            Method route = HookCompatibility.inheritedMethod(manager, void.class, false,
                    new String[]{"lambda$startRecentsAnimation$0", "lambda$startRecentsAnimationInternal$6"},
                    container, Intent.class, ActivityOptions.class, gesture);
            gesture.getDeclaredMethod("getDisplayId");
            module.deoptimize(route);
            module.registerFeatureHook(module.prepareFeatureHook(route, "atomic_workbench.native_home.quickstep_display", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH)
                    .intercept(chain -> {
                        int sourceDisplay = -1;
                        boolean routed = false;
                        try {
                            int displayId = (Integer) call(chain.getArg(3), "getDisplayId", new Class<?>[0]);
                            sourceDisplay = displayId;
                            Context context = (Context) field(chain.getThisObject(), "mCtx");
                            boolean owned = displayId > 0 && authenticated(context, displayId);
                            if (owned) {
                                ((ActivityOptions) chain.getArg(2)).setLaunchDisplayId(displayId);
                                routed = true;
                            }
                            module.logFeatureInfo("ATOMIC_NATIVE_HOME_GESTURE source_display=" + displayId
                                    + ";target_display=" + displayId + ";auth=" + owned
                                    + ";phase=" + (owned ? "options_routed" : "native_passthrough")
                                    + ";reason=" + (displayId <= 0 ? "physical_display" : owned ? "quickstep_gesture_state" : "display_not_authenticated"));
                        } catch (Throwable failure) {
                            module.logFeatureError("ATOMIC_NATIVE_HOME_GESTURE phase=route_unavailable", failure);
                        }
                        // The native gesture, animation and input-monitor implementations continue.
                        try (AtomicWorkbenchQuickstepTargetHook.Scope windowScope = AtomicWorkbenchQuickstepTargetHook.launch(
                                module, chain.getThisObject(), chain.getArg(0), chain.getArg(3))) {
                            if (!windowScope.allowed) return null;
                            Object result = chain.proceed();
                            String pending = "unavailable";
                            try { pending = Boolean.TRUE.equals(field(chain.getThisObject(), "mRecentsAnimationStartPending")) ? "pending" : "not_pending"; }
                            catch (Throwable ignored) { }
                            module.logFeatureInfo("ATOMIC_NATIVE_HOME_GESTURE source_display=" + sourceDisplay
                                    + ";target_display=" + (routed ? sourceDisplay : -1) + ";auth=" + routed
                                    + ";phase=native_returned;native_result=" + pending);
                            return result;
                        } catch (Throwable failure) {
                            module.logFeatureError("ATOMIC_NATIVE_HOME_GESTURE source_display=" + sourceDisplay
                                    + ";target_display=" + (routed ? sourceDisplay : -1) + ";auth=" + routed
                                    + ";phase=native_failed", failure);
                            throw failure;
                        }
                    }));
            installed = true;
            module.logFeatureInfo("ATOMIC_NATIVE_HOME_QUICKSTEP_INSTALLED interface_matched="
                    +AtomicWorkbenchQuickstepInputHook.ready()+";launch_options=true;input_adapter="
                    +AtomicWorkbenchQuickstepInputHook.ready()+";gesture_runtime=unverified");
        } catch (Throwable failure) { module.logFeatureError("ATOMIC_NATIVE_HOME_QUICKSTEP_UNAVAILABLE", failure); }
    }

    static boolean authenticated(Context context, int displayId) throws Exception {
        ActivityManager activities = context == null ? null : (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        return activities != null && authenticated(context, displayId, activities.getRunningTasks(TASK_SNAPSHOT_LIMIT));
    }

    static boolean authenticated(Context context, int displayId, List<ActivityManager.RunningTaskInfo> snapshot) throws Exception {
        if (displayId <= 0 || context == null) return false;
        DisplayManager manager = (DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
        Display display = manager == null ? null : manager.getDisplay(displayId);
        if (display == null) return false;
        Matcher name = NAME.matcher(display.getName());
        if (!name.matches() || !UUID.fromString(name.group(3)).toString().equals(name.group(3))) return false;
        int uid = Integer.parseInt(name.group(1)), user = android.os.Process.myUid() / 100000;
        if (uid < 10000 || uid / 100000 != user || (Integer) call(display, "getOwnerUid", new Class<?>[0]) != 0
                || (Integer) call(display, "getType", new Class<?>[0]) != constant("TYPE_VIRTUAL")
                || (display.getFlags() & constant("FLAG_TRUSTED")) == 0) return false;
        ApplicationInfo owner = context.getPackageManager().getApplicationInfo("ls.augment.com", 0);
        if (owner.uid != uid) return false;
        Object unique = call(display, "getUniqueId", new Class<?>[0]);
        if (!(unique instanceof String) || ((String) unique).isEmpty()) return false;
        ResolveInfo resolved = context.getPackageManager().resolveActivity(
                new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME), PackageManager.MATCH_DEFAULT_ONLY);
        if (resolved == null || resolved.activityInfo == null
                || !context.getPackageName().equals(resolved.activityInfo.packageName)) return false;
        ComponentName primary = new ComponentName(resolved.activityInfo.packageName, resolved.activityInfo.name);
        // The ROM launcher already uses this public API. Its existing Recents UID
        // can inspect running tasks; a restricted/empty snapshot simply fails closed.
        if (snapshot == null) return false;
        int examined = 0;
        for (ActivityManager.RunningTaskInfo task : snapshot) {
            if (++examined > TASK_SNAPSHOT_LIMIT) break;
            if (task != null && (Integer) field(task, "userId") == user
                && (Integer) field(task, "displayId") == displayId
                && (Integer) call(task, "getActivityType", new Class<?>[0]) == 2
                && primary.equals(field(task, "baseActivity"))) return true;
        }
        return false;
    }

    static boolean ownedDisplayIdentity(Context context, int displayId, String expectedUnique) throws Exception {
        if (context == null || displayId <= 0) return false;
        DisplayManager displays = (DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
        Display display = displays == null ? null : displays.getDisplay(displayId);
        if (display == null) return false;
        Matcher name = NAME.matcher(display.getName());
        if (!name.matches() || !UUID.fromString(name.group(3)).toString().equals(name.group(3))) return false;
        int uid = Integer.parseInt(name.group(1));
        return uid >= 10000 && uid / 100000 == android.os.Process.myUid() / 100000
                && context.getPackageManager().getApplicationInfo("ls.augment.com", 0).uid == uid
                && (Integer) call(display, "getOwnerUid", new Class<?>[0]) == 0
                && (Integer) call(display, "getType", new Class<?>[0]) == constant("TYPE_VIRTUAL")
                && (display.getFlags() & constant("FLAG_TRUSTED")) != 0
                && expectedUnique != null && !expectedUnique.isEmpty()
                && expectedUnique.equals(call(display, "getUniqueId", new Class<?>[0]));
    }

    private static int constant(String name) throws Exception { Field f = Display.class.getDeclaredField(name); f.setAccessible(true); return f.getInt(null); }
    private static Object field(Object object, String name) throws Exception {
        for (Class<?> type = object.getClass(); type != null; type = type.getSuperclass()) {
            try { Field f = type.getDeclaredField(name); f.setAccessible(true); return f.get(object); }
            catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }
    private static Object call(Object object, String name, Class<?>[] types, Object... args) throws Exception {
        Method m = object.getClass().getMethod(name, types); m.setAccessible(true); return m.invoke(object, args);
    }
}
