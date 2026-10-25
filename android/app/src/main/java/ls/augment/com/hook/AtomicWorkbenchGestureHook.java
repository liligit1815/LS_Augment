package ls.augment.com.hook;

import android.app.ActivityOptions;
import android.app.KeyguardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.Process;
import android.os.SystemClock;
import android.os.UserHandle;
import android.provider.Settings;
import android.view.InputDevice;
import android.view.MotionEvent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import ls.augment.com.AtomicWorkbenchConfig;
import ls.augment.com.AtomicWorkbenchGesturePolicy;
import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;

/** Default-display observation in system_server; never consumes or replaces native input. */
public final class AtomicWorkbenchGestureHook {
    private static final String LISTENER = "com.android.server.wm.SystemGesturesPointerEventListener";
    private static final String PACKAGE = "ls.augment.com";
    private static final Map<Object, State> STATES = new WeakHashMap<>();
    private static final ThreadPoolExecutor ACTIONS = new ThreadPoolExecutor(1, 1, 0, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(2), task -> { Thread thread = new Thread(task, "Duo-WorkbenchGesture"); thread.setDaemon(true); return thread; });
    private static final ThreadPoolExecutor DIAGNOSTICS = new ThreadPoolExecutor(1, 1, 0, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(2), task -> { Thread thread = new Thread(task, "Duo-WorkbenchEvidence"); thread.setDaemon(true); return thread; });
    private static boolean installed, heartbeatStarted;

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
    private static volatile Context attached;
    private static volatile boolean observedDefaultListener;
    private static volatile String installationFailure = "";
    private static volatile String observationFailure = "";
    private static Field contextField, widthField, heightField;
    private static Method displayIdMethod;
    private static volatile AugmentModule entryModule;
    private static final java.util.concurrent.atomic.AtomicInteger droppedEntryWitnesses = new java.util.concurrent.atomic.AtomicInteger();
    private AtomicWorkbenchGestureHook() { }

    private static final class State {
        final AtomicWorkbenchGesturePolicy.Detector detector = new AtomicWorkbenchGesturePolicy.Detector();
        AtomicWorkbenchGesturePolicy.Geometry geometry;
        int width, height, areaPercent, sensitivityPercent;
        float density, statusBar;
        long gestureRevision = -1L;
        String gestureChecksum = "";
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    public static synchronized int install(AugmentModule module, ClassLoader loader) {
        entryModule = module;
        AtomicWorkbenchHomeHook.install(module, loader);
        if (installed) return 1;
        try {
            Class<?> listener = Class.forName(LISTENER, false, loader);
            Method method = listener.getDeclaredMethod("onPointerEvent", MotionEvent.class);
            if (method.getReturnType() != void.class) throw new NoSuchMethodException("pointer_event_return_type");
            contextField = listener.getDeclaredField("mContext");
            widthField = listener.getDeclaredField("screenWidth");
            heightField = listener.getDeclaredField("screenHeight");
            if (!Context.class.isAssignableFrom(contextField.getType()) || widthField.getType() != int.class
                    || heightField.getType() != int.class) throw new NoSuchFieldException("pointer_event_owner_contract");
            contextField.setAccessible(true); widthField.setAccessible(true); heightField.setAccessible(true);
            displayIdMethod = MotionEvent.class.getMethod("getDisplayId");
            module.registerFeatureHook(module.prepareFeatureHook(method, "atomic_workbench.global_gesture", true)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        try { observe(chain.getThisObject(), (MotionEvent) chain.getArg(0)); }
                        catch (Throwable error) {
                            // Failure is visible without changing native event dispatch or retaining input.
                            synchronized (STATES) {
                                State failed = STATES.get(chain.getThisObject());
                                if (failed != null) failed.detector.cancel();
                            }
                            String reason = "系统触摸观察失败（" + error.getClass().getSimpleName() + "）";
                            if (!reason.equals(observationFailure)) {
                                observationFailure = reason;
                                Context context = attached;
                                if (context != null) enqueueEvidence(context);
                            }
                        }
                        return result;
                    }));
            module.deoptimize(method);
            installed = true;
            installationFailure = "";
            startHeartbeat();
            return 1;
        } catch (Throwable error) {
            installationFailure = "本机系统缺少可用的全局手势接口（" + error.getClass().getSimpleName() + "）";
            module.logFeatureError("ATOMIC_WORKBENCH_GESTURE_UNAVAILABLE", error);
            startHeartbeat();
            return 0;
        }
    }

    private static void startHeartbeat() {
        if (heartbeatStarted || Looper.getMainLooper() == null) return;
        heartbeatStarted = true;
        Handler main = new Handler(Looper.getMainLooper());
        main.post(new Runnable() {
            public void run() {
                try {
                    // The main Handler only schedules work; even readiness reads belong off-thread.
                    enqueueEvidence(attached);
                } catch (Throwable ignored) { /* A diagnostic transport failure cannot break system_server. */ }
                finally { main.postDelayed(this, 15000L); }
            }
        });
    }


    // Measure the host's actual system inset resource; the existing missing-ID fallback is required across OEM layouts.
    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi,InternalInsetResource
    private static void observe(Object owner, MotionEvent event) throws Exception {
        if (event == null || Process.myUid() != Process.SYSTEM_UID) return;
        int display = (Integer) displayIdMethod.invoke(event);
        if (display != 0) {
            synchronized (STATES) {
                State old = STATES.get(owner);
                if (old != null) old.detector.cancel();
            }
            return;
        }
        Context context = (Context) contextField.get(owner);
        if (context == null) return;
        attached = context;
        State state;
        synchronized (STATES) { state = STATES.computeIfAbsent(owner, key -> new State()); }
        int width = widthField.getInt(owner), height = heightField.getInt(owner);
        float density = context.getResources().getDisplayMetrics().density;
        ConfigSnapshot snapshot = FeatureSettings.verifiedSnapshot(context);
        boolean enabled = snapshot != null && ConfigSchema.truthy(snapshot.get(AtomicWorkbenchConfig.ENABLED));
        int areaPercent = enabled ? Integer.parseInt(snapshot.get(AtomicWorkbenchConfig.TRIGGER_AREA_SCALE))
                : AtomicWorkbenchGesturePolicy.AREA_DEFAULT;
        int sensitivityPercent = enabled ? Integer.parseInt(snapshot.get(AtomicWorkbenchConfig.CORNER_SENSITIVITY))
                : AtomicWorkbenchGesturePolicy.SENSITIVITY_DEFAULT;
        int resource = context.getResources().getIdentifier("status_bar_height", "dimen", "android");
        float statusBar = resource == 0 ? 24f * density : context.getResources().getDimensionPixelSize(resource);
        if (state.geometry == null || width != state.width || height != state.height || density != state.density
                || statusBar != state.statusBar || areaPercent != state.areaPercent || sensitivityPercent != state.sensitivityPercent) {
            state.detector.cancel();
            state.geometry = AtomicWorkbenchGesturePolicy.Geometry.create(width, height, density, statusBar,
                    areaPercent, sensitivityPercent);
            state.width = width; state.height = height; state.density = density;
            state.statusBar = statusBar; state.areaPercent = areaPercent; state.sensitivityPercent = sensitivityPercent;
        }
        boolean first = !observedDefaultListener || !observationFailure.isEmpty();
        observedDefaultListener = true;
        observationFailure = "";
        if (first) enqueueEvidence(context);
        if (!enabled) { state.detector.cancel(); return; }
        int side = AtomicWorkbenchGesturePolicy.NONE;
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            state.gestureRevision = snapshot.revision;
            state.gestureChecksum = snapshot.checksum;
        } else if (state.gestureRevision != snapshot.revision || !state.gestureChecksum.equals(snapshot.checksum)) {
            state.detector.cancel(); return;
        }
        boolean touchscreen = event.isFromSource(InputDevice.SOURCE_TOUCHSCREEN);
        for (int index = 0; index < event.getHistorySize() && side == 0; index++) {
            side = state.detector.event(MotionEvent.ACTION_MOVE, display, event.getPointerCount(), touchscreen, enabled,
                    event.getHistoricalX(0, index), event.getHistoricalY(0, index), event.getHistoricalEventTime(index), state.geometry);
        }
        if (side == 0) side = state.detector.event(action, display, event.getPointerCount(), touchscreen, enabled,
                event.getX(), event.getY(), event.getEventTime(), state.geometry);
        if (side != 0) {
            final int requestedSide = side;
            final long requestedRevision = snapshot.revision, triggeredElapsed = SystemClock.elapsedRealtime();
            final String requestedChecksum = snapshot.checksum;
            try { ACTIONS.execute(() -> launch(context, requestedSide, requestedRevision, requestedChecksum, triggeredElapsed)); }
            catch (java.util.concurrent.RejectedExecutionException full) {
                enqueueEntryRejection(context, requestedSide, requestedRevision, triggeredElapsed);
            }
        }
    }

    private static void enqueueEntryRejection(Context context, int side, long revision, long triggeredElapsed) {
        try {
            DIAGNOSTICS.execute(() -> {
                int user = -1;
                try { user = currentUser(); } catch (Exception unavailable) { /* Unknown is explicit. */ }
                entryWitness("recognized", side, user, revision, triggeredElapsed, "corner_release", null);
                entryWitness("rejected", side, user, revision, triggeredElapsed, "queue_full", null);
                FeatureSettings.diagnostic(context, AtomicWorkbenchConfig.RUNTIME, "工作台手势请求正在处理，请稍后重试");
            });
        } catch (java.util.concurrent.RejectedExecutionException full) { droppedEntryWitnesses.incrementAndGet(); }
    }

    private static void enqueueEvidence(Context context) {
        try {
            DIAGNOSTICS.execute(() -> {
                try {
                    Context resolved = context == null ? FeatureSettings.from(null) : context;
                    if (resolved != null && Process.myUid() == Process.SYSTEM_UID) publishObserved(resolved);
                } catch (Throwable ignored) { /* Never let optional evidence terminate a system process thread. */ }
            });
        } catch (java.util.concurrent.RejectedExecutionException full) { /* A later heartbeat retries bounded diagnostics. */ }
    }

    private static void publishObserved(Context context) {
        try {
            boolean bridge = FeatureSettings.hasVerifiedSnapshot(context);
            int boot = Settings.Global.getInt(context.getContentResolver(), Settings.Global.BOOT_COUNT, -1);
            String reason = !installationFailure.isEmpty() ? installationFailure
                    : !AtomicWorkbenchImeHook.isInstalled() ? "手机主屏键盘接入尚未就绪，请检查系统框架作用域并重启手机"
                    : !observationFailure.isEmpty() ? observationFailure
                    : !observedDefaultListener ? "尚未观察到默认屏幕的系统触摸回调"
                    : !bridge ? "等待模块配置桥连接" : "";
            FeatureSettings.diagnostic(context, AtomicWorkbenchConfig.READY,
                    AtomicWorkbenchConfig.evidence(installed && AtomicWorkbenchImeHook.isInstalled()
                            && observedDefaultListener && observationFailure.isEmpty() && bridge,
                            BuildConfig.VERSION_CODE, Process.myPid(), boot, SystemClock.elapsedRealtime(), reason));
        } catch (Throwable ignored) { /* No readiness is safer than breaking a system Handler callback. */ }
    }

    private static void launch(Context context, int side, long revision, String checksum, long triggeredElapsed) {
        long identity = Binder.clearCallingIdentity();
        int user = -1;
        String stage = "current_user";
        boolean recognized = false;
        try {
            user = currentUser();
            entryWitness("recognized", side, user, revision, triggeredElapsed, "corner_release", null);
            recognized = true;
            entryWitness("request", side, user, revision, triggeredElapsed, "worker_started", null);
            stage = "user_context";
            UserHandle handle = (UserHandle) UserHandle.class.getMethod("of", int.class).invoke(null, user);
            Context userContext = (Context) Context.class.getMethod("createContextAsUser", UserHandle.class, int.class)
                    .invoke(context, handle, 0);
            stage = "initial_snapshot";
            Bundle reply = userContext.getContentResolver().call(Uri.parse("content://ls.augment.com.config"), "snapshot", null, null);
            ConfigSnapshot current = reply == null ? null : ConfigSnapshot.parse(reply.getString("snapshot", ""));
            String rejection = requestRejection(current, revision, checksum, triggeredElapsed);
            if (!rejection.isEmpty()) { entryWitness("rejected", side, user, revision, triggeredElapsed, rejection, null); return; }
            stage = "module_version";
            PackageManager pm = userContext.getPackageManager();
            if (pm.getPackageInfo(PACKAGE, 0).getLongVersionCode() != BuildConfig.VERSION_CODE) {
                entryWitness("rejected", side, user, revision, triggeredElapsed, "module_version", null);
                FeatureSettings.diagnostic(context, AtomicWorkbenchConfig.RUNTIME, "模块已更新，请重启手机后使用全局手势"); return;
            }
            stage = "device_state";
            PowerManager power = userContext.getSystemService(PowerManager.class);
            KeyguardManager keyguard = userContext.getSystemService(KeyguardManager.class);
            String unavailable = power == null ? "power_unavailable" : !power.isInteractive() ? "screen_off"
                    : keyguard == null ? "keyguard_unavailable" : keyguard.isKeyguardLocked() ? "keyguard_locked" : "";
            if (!unavailable.isEmpty()) { entryWitness("rejected", side, user, revision, triggeredElapsed, unavailable, null); return; }
            stage = "entry_intent";
            Intent intent = new Intent().setComponent(new ComponentName(PACKAGE, PACKAGE + ".AtomicWorkbenchActivity"))
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
                    .putExtra(AtomicWorkbenchConfig.EXTRA_ENTRY, "gesture")
                    .putExtra(AtomicWorkbenchConfig.EXTRA_SIDE, side == AtomicWorkbenchGesturePolicy.LEFT ? "left" : "right")
                    .putExtra(AtomicWorkbenchConfig.EXTRA_CONFIG_REVISION, revision)
                    .putExtra(AtomicWorkbenchConfig.EXTRA_CONFIG_CHECKSUM, checksum)
                    .putExtra(AtomicWorkbenchConfig.EXTRA_TRIGGER_ELAPSED, triggeredElapsed)
                    .putExtra(AtomicWorkbenchConfig.EXTRA_ENTRY_BUILD, BuildConfig.VERSION_CODE);
            captureForeground(pm, intent, user);
            // A queued gesture cannot launch after the user has changed the foreground user.
            stage = "foreground_user";
            int foregroundUser = currentUser();
            if (foregroundUser != user) { entryWitness("rejected", side, foregroundUser, revision, triggeredElapsed, "user_changed", null); return; }
            stage = "final_snapshot";
            Bundle latest = userContext.getContentResolver().call(Uri.parse("content://ls.augment.com.config"), "snapshot", null, null);
            ConfigSnapshot checked = latest == null ? null : ConfigSnapshot.parse(latest.getString("snapshot", ""));
            rejection = requestRejection(checked, revision, checksum, triggeredElapsed);
            if (!rejection.isEmpty()) { entryWitness("rejected", side, user, revision, triggeredElapsed, rejection, null); return; }
            stage = "activity_start";
            ActivityOptions options = ActivityOptions.makeBasic(); options.setLaunchDisplayId(0);
            Context.class.getMethod("startActivityAsUser", Intent.class, Bundle.class, UserHandle.class)
                    .invoke(context, intent, options.toBundle(), handle);
            entryWitness("submitted", side, user, revision, triggeredElapsed, "awaiting_ui_entry", null);
            FeatureSettings.diagnostic(context, AtomicWorkbenchConfig.RUNTIME, "启动请求已提交，等待界面进入");
        } catch (Throwable error) {
            Throwable cause = error instanceof java.lang.reflect.InvocationTargetException && error.getCause() != null ? error.getCause() : error;
            if (!recognized) entryWitness("recognized", side, user, revision, triggeredElapsed, "corner_release", null);
            entryWitness("failed", side, user, revision, triggeredElapsed, stage, cause);
            // Only operation status is retained, never coordinates, task contents, IDs or component names.
            FeatureSettings.diagnostic(context, AtomicWorkbenchConfig.RUNTIME,
                    "工作台手势启动失败（" + cause.getClass().getSimpleName() + "），请检查模块与系统框架接入状态");
        } finally { Binder.restoreCallingIdentity(identity); }
    }

    private static String requestRejection(ConfigSnapshot current, long revision, String checksum, long triggeredElapsed) {
        if (currentRequest(current, revision, checksum, triggeredElapsed)) return "";
        if (current == null) return "snapshot_missing";
        if (!ConfigSchema.truthy(current.get(AtomicWorkbenchConfig.ENABLED))) return "config_disabled";
        if (revision <= 0 || current.revision != revision) return "config_revision";
        if (checksum == null || !checksum.matches("[0-9a-f]{64}") || !checksum.equals(current.checksum)) return "config_identity";
        long now = SystemClock.elapsedRealtime();
        return triggeredElapsed < 0 || now < triggeredElapsed ? "request_time" : "request_expired";
    }

    private static void entryWitness(String phase, int side, int user, long revision, long triggeredElapsed, String reason, Throwable error) {
        AugmentModule module = entryModule;
        if (module == null) return;
        long now = SystemClock.elapsedRealtime();
        int drained = droppedEntryWitnesses.getAndSet(0);
        String message = "ATOMIC_WORKBENCH_ENTRY phase=" + phase + ";reason=" + reason
                + ";side=" + (side == AtomicWorkbenchGesturePolicy.LEFT ? "left" : "right")
                + ";build=" + BuildConfig.VERSION_CODE + ";user=" + user + ";config_revision=" + revision
                + ";durationMs=" + Math.max(-1L, now - triggeredElapsed) + ";dropped=" + drained;
        try {
            if (error == null) module.logFeatureInfo(message); else module.logFeatureError(message, error);
        } catch (Throwable unavailable) { droppedEntryWitnesses.addAndGet(drained + 1); }
    }

    private static boolean currentRequest(ConfigSnapshot current, long revision, String checksum, long triggeredElapsed) {
        return current != null && AtomicWorkbenchConfig.requestCurrent(revision, checksum, current.revision,
                current.checksum, ConfigSchema.truthy(current.get(AtomicWorkbenchConfig.ENABLED)),
                triggeredElapsed, SystemClock.elapsedRealtime(), BuildConfig.VERSION_CODE, BuildConfig.VERSION_CODE);
    }

    private static int currentUser() throws Exception {
        return (Integer) Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    @android.annotation.SuppressLint({"BlockedPrivateApi", "PrivateApi"}) // Runs in system_server, never in the application's VM.
    private static void captureForeground(PackageManager pm, Intent destination, int user) {
        if (Process.myUid() != Process.SYSTEM_UID) return;
        try {
            Object service = Class.forName("android.app.ActivityTaskManager").getDeclaredMethod("getService").invoke(null);
            Object focused = service.getClass().getMethod("getFocusedRootTaskInfo").invoke(service);
            if (focused == null || intField(focused, "displayId") != 0 || intField(focused, "userId") != user
                    || (Integer) focused.getClass().getMethod("getActivityType").invoke(focused) == 2) return;
            Object top = focused.getClass().getField("topActivity").get(focused);
            if (!(top instanceof ComponentName)) return;
            String pkg = ((ComponentName) top).getPackageName();
            if (PACKAGE.equals(pkg) || "android".equals(pkg) || "com.android.systemui".equals(pkg)
                    || pkg.endsWith("permissioncontroller")) return;
            ResolveInfo home = pm.resolveActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME), PackageManager.MATCH_DEFAULT_ONLY);
            if (home != null && home.activityInfo != null && pkg.equals(home.activityInfo.packageName)) return;
            Intent launch = pm.getLaunchIntentForPackage(pkg);
            ComponentName launcher = launch == null ? null : launch.getComponent();
            if (launcher == null) return;
            ActivityInfo info = pm.getActivityInfo(launcher, 0);
            if (!info.enabled || !info.exported || info.applicationInfo == null || !info.applicationInfo.enabled
                    || info.applicationInfo.uid / 100000 != user || info.permission != null && !info.permission.isEmpty()) return;
            boolean launcherDeclared = false;
            for (ResolveInfo resolved : pm.queryIntentActivities(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(pkg), 0))
                if (resolved.activityInfo != null && launcher.equals(new ComponentName(resolved.activityInfo.packageName, resolved.activityInfo.name))) launcherDeclared = true;
            if (!launcherDeclared) return;
            Object snapshot = service.getClass().getMethod("getTasks", int.class, boolean.class, boolean.class, int.class)
                    .invoke(service, 16, false, false, 0);
            if (!(snapshot instanceof List<?>)) return;
            for (Object task : (List<?>) snapshot) {
                if (intField(task, "displayId") != 0 || intField(task, "userId") != user) continue;
                // Package equality alone can select a different instance of the same application.
                if (!task.getClass().getField("isFocused").getBoolean(task)
                        || !task.getClass().getField("isVisible").getBoolean(task)) continue;
                Object candidate = task.getClass().getField("topActivity").get(task);
                if (!(candidate instanceof ComponentName) || !pkg.equals(((ComponentName) candidate).getPackageName())) continue;
                int id = intField(task, "taskId");
                if (id < 0) return;
                destination.putExtra(AtomicWorkbenchConfig.EXTRA_TASK_ID, id)
                        .putExtra(AtomicWorkbenchConfig.EXTRA_COMPONENT, launcher.flattenToString());
                return;
            }
        } catch (Exception unavailable) { /* No eligible foreground task means the workspace's internal desktop. */ }
    }

    private static int intField(Object value, String name) throws Exception {
        return value.getClass().getField(name).getInt(value);
    }
}
