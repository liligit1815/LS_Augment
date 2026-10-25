package ls.augment.com.hook;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.Method;
import java.lang.reflect.Field;
import java.lang.ref.WeakReference;
import java.util.Locale;
import java.util.Objects;
import org.json.JSONObject;
import io.github.libxposed.api.XposedInterface.ExceptionMode;
import ls.augment.com.AtomicWorkbenchAmapData;
import ls.augment.com.AtomicWorkbenchAmapLinkData;
import ls.augment.com.AtomicWorkbenchConfig;

/** Supplies current guidance through the scoped map process's own navigation notification. */
final class AtomicWorkbenchAmapHook {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ThreadLocal<Boolean> REPUBLISHING = new ThreadLocal<>();
    private static final Object LOCK = new Object();
    private static boolean installed, listenerInstalled, scheduled;
    private static String baseCapability = "unsupported", capability = "unsupported";
    private static Frame frame;

    // The foreground-service notice is cleared on stop/destroy/forget; retaining it is necessary while that service owns the notification.
    //noinspection StaticFieldLeak
    private static Notice notice;
    private static RouteLease routeLease;
    private static long lastPublished, generation;

    private static final class Frame {
        final String title, content, source;
        final Bundle metrics;
        final long elapsed = SystemClock.elapsedRealtime();
        Frame(String title, String content, String source) {
            this(title, content, source, null);
        }
        Frame(String title, String content, String source, Bundle metrics) {
            this.title = AtomicWorkbenchAmapData.text(title); this.content = AtomicWorkbenchAmapData.text(content);
            this.source = source;
            this.metrics = AtomicWorkbenchAmapData.structured(metrics);
        }
    }

    private static final class Notice {
        final NotificationManager manager;
        final Notification original;
        final String tag;
        final int id;
        Service service;
        int foregroundType;
        boolean typedForeground;
        boolean foregroundStarted;
        long generation;
        Notice(NotificationManager manager, String tag, int id, Notification original, Service service, int type, boolean typed) {
            this.manager = manager; this.tag = tag; this.id = id;
            this.original = withoutBridge(original); this.service = service; foregroundType = type; typedForeground = typed;
        }
    }

    private static final class RouteLease {
        final WeakReference<Object> page;
        final long id;
        RouteLease(Object page, long id) { this.page = new WeakReference<>(page); this.id = id; }
    }

    private AtomicWorkbenchAmapHook() { }

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Method notify = NotificationManager.class.getDeclaredMethod("notify", String.class, int.class, Notification.class);
            module.registerFeatureHook(module.prepareFeatureHook(notify, "atomic_workbench.amap.notification", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                if (Boolean.TRUE.equals(REPUBLISHING.get())) return chain.proceed();
                Object result;
                synchronized (LOCK) {
                    Notice next = null;
                    Object[] args = null;
                    try {
                        String tag = (String) chain.getArg(0);
                        int id = (Integer) chain.getArg(1);
                        Notification value = (Notification) chain.getArg(2);
                        if (navigation(value, false) && !terminal(value)) {
                            next = new Notice((NotificationManager) chain.getThisObject(), tag, id, value, null, -1, false);
                            activate(next);
                            args = new Object[]{tag, id, decorate(next.original)};
                        } else if (sameKey(notice, tag, id)) forget();
                    } catch (Throwable observationFailure) {
                        if (next != null && notice == next) forget();
                        next = null; args = null;
                    }
                    try { result = args == null ? chain.proceed() : chain.proceed(args); }
                    catch (Throwable originalFailure) {
                        if (next != null && notice == next) forget();
                        throw originalFailure;
                    }
                }
                watchConfigurationSafely();
                return result;
            }));
            Method cancel = NotificationManager.class.getDeclaredMethod("cancel", String.class, int.class);
            module.registerFeatureHook(module.prepareFeatureHook(cancel, "atomic_workbench.amap.cancel", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                synchronized (LOCK) {
                    if (sameKey(notice, (String) chain.getArg(0), (Integer) chain.getArg(1))) forget();
                    return chain.proceed();
                }
            }));
            Method cancelAll = NotificationManager.class.getDeclaredMethod("cancelAll");
            module.registerFeatureHook(module.prepareFeatureHook(cancelAll, "atomic_workbench.amap.cancel_all", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                synchronized (LOCK) { forget(); return chain.proceed(); }
            }));
            // Foreground map notifications bypass NotificationManager.notify on this APK.
            for (boolean typed : new boolean[]{false, true}) {
                Method start = typed ? Service.class.getDeclaredMethod("startForeground", int.class, Notification.class, int.class)
                        : Service.class.getDeclaredMethod("startForeground", int.class, Notification.class);
                module.registerFeatureHook(module.prepareFeatureHook(start, "atomic_workbench.amap.foreground_start." + typed, true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    if (Boolean.TRUE.equals(REPUBLISHING.get())) return chain.proceed();
                    Object result;
                    synchronized (LOCK) {
                        Notice next = null;
                        Object[] args = null;
                        try {
                            Service owner = (Service) chain.getThisObject();
                            int id = (Integer) chain.getArg(0);
                            Notification value = (Notification) chain.getArg(1);
                            if (navigation(value, true) && !terminal(value)) {
                                NotificationManager manager = owner.getSystemService(NotificationManager.class);
                                if (manager != null) {
                                    int type = typed ? (Integer) chain.getArg(2) : -1;
                                    next = new Notice(manager, null, id, value, owner, type, typed);
                                    activate(next);
                                    Notification enriched = decorate(next.original);
                                    args = typed ? new Object[]{id, enriched, type} : new Object[]{id, enriched};
                                }
                            } else if (notice != null && (notice.service == owner || sameKey(notice, null, id))) forget();
                        } catch (Throwable observationFailure) {
                            if (next != null && notice == next) forget();
                            next = null; args = null;
                        }
                        REPUBLISHING.set(true);
                        try {
                            result = args == null ? chain.proceed() : chain.proceed(args);
                            // The host has now passed its own service declaration,
                            // type and runtime-permission checks. Preserve that call.
                            if (next != null && notice == next) next.foregroundStarted = true;
                        }
                        catch (Throwable originalFailure) {
                            if (next != null && notice == next) forget();
                            throw originalFailure;
                        } finally { REPUBLISHING.remove(); }
                    }
                    watchConfigurationSafely();
                    return result;
                }));
            }
            for (boolean flags : new boolean[]{false, true}) {
                Method stop = Service.class.getDeclaredMethod("stopForeground", flags ? int.class : boolean.class);
                module.registerFeatureHook(module.prepareFeatureHook(stop, "atomic_workbench.amap.foreground_stop." + flags, true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    if (Boolean.TRUE.equals(REPUBLISHING.get())) return chain.proceed();
                    synchronized (LOCK) {
                        Notice current = notice;
                        if (current != null && current.service == chain.getThisObject()) {
                            forget();
                            boolean remove = flags ? (((Integer) chain.getArg(0)) & Service.STOP_FOREGROUND_REMOVE) != 0
                                    : Boolean.TRUE.equals(chain.getArg(0));
                            // false/DETACH retains the app's notification. Remove route text
                            // and mark only this retained notification's old session ended.
                            if (!remove) stripRetainedNotification(current);
                        }
                        REPUBLISHING.set(true);
                        try { return chain.proceed(); }
                        finally { REPUBLISHING.remove(); }
                    }
                }));
            }

            // This actual driving page emits naviStart from context creation and naviStop
            // from destroy in the installed APK. A notification is optional on its VD.
            try {
                Class<?> page = Class.forName("com.amap.bundle.drive.navi.drivenavi.normal.page.AjxRouteCarNaviPage", false, loader);
                Class<?> context = Class.forName("com.autonavi.minimap.ajx3.context.IAjxContext", false, loader);
                Method created = page.getDeclaredMethod("onAjxContxtCreated", context);
                Method destroyed = page.getDeclaredMethod("destroy");
                module.registerFeatureHook(module.prepareFeatureHook(created, "atomic_workbench.amap.page_start", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    long route = -1L;
                    try { if (chain.getArg(0) != null) route = beginPage(chain.getThisObject()); }
                    catch (Throwable ignored) { }
                    watchConfigurationSafely();
                    try { return chain.proceed(); }
                    catch (Throwable originalFailure) {
                        endPage(chain.getThisObject(), route);
                        throw originalFailure;
                    }
                }));
                module.registerFeatureHook(module.prepareFeatureHook(destroyed, "atomic_workbench.amap.page_stop", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    endPage(chain.getThisObject(), -1L);
                    return chain.proceed();
                }));
            } catch (ReflectiveOperationException | LinkageError missing) { }

            int sources = 0;
            try {
                Class<?> type = Class.forName("com.amap.bundle.wearable.connect.glass.AmapLinkService", false, loader);
                Method update = type.getDeclaredMethod("d", String.class);
                module.registerFeatureHook(module.prepareFeatureHook(update, "atomic_workbench.amap.structured", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    long session = session();
                    Object result = chain.proceed();
                    try {
                        Bundle metrics = AtomicWorkbenchAmapLinkData.parse((String) chain.getArg(0));
                        if (metrics != null) publish(new Frame("", "", "structured", metrics), session);
                    } catch (Throwable ignored) { }
                    return result;
                }));
                sources++;
            } catch (ReflectiveOperationException | LinkageError missing) { }
            try {
                Class<?> type = Class.forName("com.autonavi.bundle.routecommon.ajx.ModuleRoute", false, loader);
                Method route = type.getDeclaredMethod("notifyNaviInfo", JSONObject.class);
                module.registerFeatureHook(module.prepareFeatureHook(route, "atomic_workbench.amap.walk_ride", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    long session = session();
                    Object result = chain.proceed();
                    try { routeInfo((JSONObject) chain.getArg(0), session); }
                    catch (Throwable ignored) { clear("waiting", session); }
                    return result;
                }));
                sources++;
            } catch (ReflectiveOperationException | LinkageError missing) { }
            try {
                Class<?> type = Class.forName("com.autonavi.minimap.ajx3.modules.ModuleNavi", false, loader);
                Method spoken = type.getDeclaredMethod("playTTS", String.class);
                module.registerFeatureHook(module.prepareFeatureHook(spoken, "atomic_workbench.amap.spoken_guidance", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    long session = session();
                    Object result = chain.proceed();
                    try { if (enabled()) publish(new Frame((String) chain.getArg(0), "", "spoken"), session); }
                    catch (Throwable ignored) { clear("waiting", session); }
                    return result;
                }));
                sources++;
            } catch (ReflectiveOperationException | LinkageError missing) { }
            try {
                Class<?> task = Class.forName("com.autonavi.jni.tts.AudioPlayerTask", false, loader);
                Class<?> events = Class.forName("com.amap.bundle.audio.AudioEventBroadcast", false, loader);
                Method event = events.getDeclaredMethod("onEvent", int.class, int.class, task, int.class);
                Field data = task.getField("data"), type = task.getField("taskType");
                if (data.getType() != String.class || type.getType() != short.class)
                    throw new NoSuchFieldException("audio_task_contract");
                module.registerFeatureHook(module.prepareFeatureHook(event, "atomic_workbench.amap.native_spoken_guidance", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    long session = session();
                    Object result = chain.proceed();
                    try {
                        Object spoken = chain.getArg(2);
                        if (session >= 0 && Integer.valueOf(1).equals(chain.getArg(0)) && spoken != null && enabled()) {
                            short kind = type.getShort(spoken);
                            if (kind == 0 || kind == 6 || kind == 7) {
                                String text = (String) data.get(spoken);
                                if (spokenGuidance(text)) publish(new Frame(text, "", "spoken"), session);
                            }
                        }
                    } catch (Throwable ignored) { clear("waiting", session); }
                    return result;
                }));
                sources++;
            } catch (ReflectiveOperationException | LinkageError missing) { }
            try {
                Class<?> type = Class.forName("com.amap.bundle.drive.carprojection.module.AjxModuleCarProjection", false, loader);
                Method route = type.getDeclaredMethod("notifyOngoingCard", String.class);
                module.registerFeatureHook(module.prepareFeatureHook(route, "atomic_workbench.amap.drive", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    long session = session();
                    Object result = chain.proceed();
                    try { driveInfo((String) chain.getArg(0), session); }
                    catch (Throwable ignored) { clear("waiting", session); }
                    return result;
                }));
                Method stopped = type.getDeclaredMethod("notifyNaviStopped");
                module.registerFeatureHook(module.prepareFeatureHook(stopped, "atomic_workbench.amap.drive_stop", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    long session = session(); clear("ended", session);
                    Object result = chain.proceed(); clear("ended", session); return result;
                }));
                Class<?> drive = Class.forName("com.amap.bundle.drive.ajx.module.ModuleDriveNavi", false, loader);
                Method finished = drive.getDeclaredMethod("doNaviFinish", String.class);
                module.registerFeatureHook(module.prepareFeatureHook(finished, "atomic_workbench.amap.drive_finish", true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    long session = session(); clear("ended", session);
                    Object result = chain.proceed(); clear("ended", session); return result;
                }));
                sources++;
            } catch (ReflectiveOperationException | LinkageError missing) { }
            synchronized (LOCK) { baseCapability = sources > 0 ? "waiting" : "unsupported"; capability = baseCapability; }
            installed = true;
            module.logFeatureInfo("ATOMIC_AMAP_BRIDGE sources=" + sources + ";contract=1");
        } catch (Throwable failure) {
            // Exception messages can contain map JSON, route text or destinations.
            module.logFeatureInfo("ATOMIC_AMAP_BRIDGE unavailable=" + failure.getClass().getSimpleName());
        }
    }

    private static boolean enabled() {
        Context context = FeatureSettings.from(null);
        return context != null && AtomicWorkbenchAmapData.PACKAGE.equals(context.getPackageName())
                && FeatureSettings.enabled(context, AtomicWorkbenchConfig.ENABLED)
                && FeatureSettings.enabled(context, AtomicWorkbenchConfig.SHOW_MEDIA, true);
    }

    private static void watchConfigurationSafely() {
        try {
            if (listenerInstalled) return;
            Context context = FeatureSettings.from(null);
            listenerInstalled = FeatureSettings.addSnapshotListener(context, () -> {
                try { if (enabled()) return; } catch (Throwable ignored) { }
                synchronized (LOCK) {
                    long previous = currentSession();
                    if (previous > 0L) AtomicWorkbenchAmapWriter.ended(previous);
                    frame = null; capability = baseCapability;
                    Object page = routeLease == null ? null : routeLease.page.get();
                    if (page != null) routeLease = new RouteLease(page, ++generation);
                    else routeLease = null;
                    if (notice != null) { notice.generation = ++generation; schedule(); }
                }
            });
        } catch (Throwable ignored) { /* Configuration observation cannot affect the map operation. */ }
    }

    private static boolean navigation(Notification value, boolean foreground) {
        return value != null && (foreground || (value.flags & Notification.FLAG_ONGOING_EVENT) != 0)
                && (value.flags & Notification.FLAG_GROUP_SUMMARY) == 0
                && (Notification.CATEGORY_NAVIGATION.equals(value.category) || "ROUTE_CHANNEL_ID".equals(value.getChannelId()));
    }

    private static boolean terminal(Notification value) {
        Bundle extras = value.extras;
        if (extras == null) return false;
        for (String key : new String[]{Notification.EXTRA_TITLE, Notification.EXTRA_TEXT, Notification.EXTRA_BIG_TEXT}) {
            String text = AtomicWorkbenchAmapData.text(String.valueOf(extras.getCharSequence(key, "")));
            if (text.contains("导航已结束") || text.contains("导航结束") || text.contains("已停止导航")
                    || text.contains("导航已停止") || text.contains("已退出导航") || text.contains("已到达目的地")
                    || "到达目的地".equals(text)) return true;
        }
        return false;
    }

    /** LOCK is held across native notification operations and our refresh operations. */
    private static void activate(Notice next) {
        Notice old = notice;
        if (sameKey(old, next.tag, next.id) && !"ended".equals(capability)) {
            next.generation = old.generation;
            // Amap can update its FGS through NotificationManager while backgrounded.
            if (next.service == null && old.service != null) {
                next.service = old.service; next.foregroundType = old.foregroundType; next.typedForeground = old.typedForeground;
                next.foregroundStarted = old.foregroundStarted;
            }
        } else {
            next.generation = ++generation;
            if (!pageActive()) { frame = null; capability = baseCapability; }
        }
        notice = next;
    }

    private static boolean sameKey(Notice current, String tag, int id) {
        return current != null && current.id == id && Objects.equals(current.tag, tag);
    }

    private static long session() {
        try { if (!enabled()) return -1L; } catch (Throwable unavailable) { return -1L; }
        synchronized (LOCK) { return "ended".equals(capability) ? -1L : currentSession(); }
    }

    private static boolean pageActive() { return routeLease != null && routeLease.page.get() != null; }

    private static long currentSession() {
        return pageActive() ? routeLease.id : notice == null ? -1L : notice.generation;
    }

    private static long beginPage(Object page) {
        synchronized (LOCK) {
            long previous = currentSession();
            if (previous > 0L) AtomicWorkbenchAmapWriter.ended(previous);
            routeLease = new RouteLease(page, ++generation);
            frame = null; capability = baseCapability;
            schedule();
            return routeLease.id;
        }
    }

    private static void endPage(Object page, long route) {
        synchronized (LOCK) {
            if (routeLease == null || routeLease.page.get() != page || route > 0L && routeLease.id != route) return;
            long ended = routeLease.id;
            routeLease = null; frame = null; capability = "ended";
            AtomicWorkbenchAmapWriter.ended(ended);
            schedule();
        }
    }

    private static void forget() {
        if (!pageActive()) {
            if (notice != null) AtomicWorkbenchAmapWriter.ended(notice.generation);
            frame = null; capability = baseCapability;
        }
        notice = null; generation++;
    }

    private static void routeInfo(JSONObject value, long session) {
        if (!enabled() || value == null) { clear("waiting", session); return; }
        String kind = value.optString("bizType", "");
        if (!"ridenavi".equals(kind) && !"footnavi".equals(kind)) return;
        publish(new Frame(value.optString("title", ""), value.optString("content", ""), "walk_ride"), session);
    }

    private static void driveInfo(String raw, long session) throws Exception {
        if (!enabled()) { clear("waiting", session); return; }
        if (raw == null || raw.length() > 16384) return;
        JSONObject value = new JSONObject(raw);
        String type = value.optString("type", "");
        if (!"naviInfo".equals(type) && !"nextAction".equals(type) && !"naviManeuver".equals(type)) return;
        String message = value.optString("message", "");
        if (!message.isEmpty()) publish(new Frame(message, "", "drive"), session);
    }

    private static boolean spokenGuidance(String raw) {
        String value = AtomicWorkbenchAmapData.text(raw).toLowerCase(Locale.ROOT);
        if (value.isEmpty()) return false;
        return value.contains("左转") || value.contains("右转") || value.contains("直行")
                || value.contains("掉头") || value.contains("靠左") || value.contains("靠右")
                || value.contains("环岛") || value.contains("驶出") || value.contains("turn left")
                || value.contains("turn right") || value.contains("continue straight")
                || value.matches("(?s).*\\d+(?:\\.\\d+)?\\s*(?:公里|米|km\\b|m\\b).*")
                || value.matches("(?s).*[\\p{L}\\d·]{2,24}(?:大道|公路|高速|街|路)(?![线况网口段面标灯]).*");
    }

    private static void publish(Frame next, long session) {
        synchronized (LOCK) {
            if (session < 0 || currentSession() != session || "ended".equals(capability)) return;
            if (!enabled()) { frame = null; capability = baseCapability; schedule(); return; }
            if (next.title.isEmpty() && next.content.isEmpty() && next.metrics == null) { clear("waiting", session); return; }
            if (!"structured".equals(next.source) && frame != null && "structured".equals(frame.source)
                    && AtomicWorkbenchAmapData.fresh(SystemClock.elapsedRealtime(), frame.elapsed)) return;
            if ("spoken".equals(next.source) && frame != null && !"spoken".equals(frame.source)
                    && AtomicWorkbenchAmapData.fresh(SystemClock.elapsedRealtime(), frame.elapsed)) return;
            frame = next; capability = "active";
            if (next.metrics != null) AtomicWorkbenchAmapWriter.structured(session, next.elapsed, next.metrics);
            else AtomicWorkbenchAmapWriter.active(session, next.elapsed, next.source, next.title, next.content);
            schedule();
        }
    }

    private static void clear(String status, long session) {
        synchronized (LOCK) {
            if (session < 0 || currentSession() != session) return;
            if ("ended".equals(status)) {
                if (routeLease != null && routeLease.id == session) routeLease = null;
            } else if (pageActive()) {
                // The channel's ended state is terminal for a route ID. A malformed or
                // empty source frame clears it, then only a new real frame can register
                // the still-live page under this fresh generation.
                routeLease = new RouteLease(routeLease.page.get(), ++generation);
            } else if (notice != null) notice.generation = ++generation;
            frame = null; capability = status;
            AtomicWorkbenchAmapWriter.ended(session);
            schedule();
        }
    }

    private static Notification withoutBridge(Notification original) {
        Notification result = original.clone();
        if (result.extras == null) result.extras = new Bundle();
        for (String key : new String[]{AtomicWorkbenchAmapData.VERSION, AtomicWorkbenchAmapData.STATUS,
                AtomicWorkbenchAmapData.TITLE, AtomicWorkbenchAmapData.CONTENT, AtomicWorkbenchAmapData.UPDATED,
                AtomicWorkbenchAmapData.SOURCE}) result.extras.remove(key);
        return result;
    }

    private static Notification decorate(Notification original) {
        Notification result = withoutBridge(original);
        if (!enabled()) return result;
        boolean fresh = frame != null && AtomicWorkbenchAmapData.fresh(SystemClock.elapsedRealtime(), frame.elapsed, "spoken".equals(frame.source));
        Bundle extras = result.extras;
        extras.putInt(AtomicWorkbenchAmapData.VERSION, AtomicWorkbenchAmapData.CONTRACT);
        extras.putString(AtomicWorkbenchAmapData.STATUS, fresh ? "active" : frame != null ? "stale" : capability);
        if (fresh) {
            extras.putString(AtomicWorkbenchAmapData.TITLE, frame.title);
            extras.putString(AtomicWorkbenchAmapData.CONTENT, frame.content);
            extras.putLong(AtomicWorkbenchAmapData.UPDATED, frame.elapsed);
            extras.putString(AtomicWorkbenchAmapData.SOURCE, frame.source);
        }
        return result;
    }

    private static void schedule() {
        // All callers hold LOCK. A failed optional Handler post cannot escape into map code.
        if (scheduled || notice == null) return;
        try {
            scheduled = MAIN.postDelayed(AtomicWorkbenchAmapHook::refresh,
                    Math.max(0L, 500L - (SystemClock.elapsedRealtime() - lastPublished)));
        } catch (Throwable ignored) { scheduled = false; }
    }

    private static boolean stillPosted(Notice current) {
        for (StatusBarNotification item : current.manager.getActiveNotifications())
            if (item != null && current.id == item.getId() && Objects.equals(current.tag, item.getTag())
                    && AtomicWorkbenchAmapData.PACKAGE.equals(item.getPackageName())
                    && navigation(item.getNotification(), current.service != null) && !terminal(item.getNotification())) return true;
        return false;
    }

    private static void stripRetainedNotification(Notice current) {
        try {
            if (!stillPosted(current)) return;
            REPUBLISHING.set(true);
            Notification retained = withoutBridge(current.original);
            retained.extras.putInt(AtomicWorkbenchAmapData.VERSION, AtomicWorkbenchAmapData.CONTRACT);
            retained.extras.putString(AtomicWorkbenchAmapData.STATUS, "ended");
            notifyExisting(current, retained);
        } catch (Throwable ignored) { /* Native stop must still execute exactly once. */ }
        finally { REPUBLISHING.remove(); }
    }

    private static void refresh() {
        synchronized (LOCK) {
            scheduled = false;
            Notice current = notice;
            if (current == null) return;
            try {
                if (!stillPosted(current)) { forget(); return; }
                Notification value = decorate(current.original);
                value.flags |= Notification.FLAG_ONLY_ALERT_ONCE;
                REPUBLISHING.set(true);
                if (current.service == null) {
                    if (!notifyExisting(current, value)) return;
                } else if (!refreshForeground(current, value)) return;
                lastPublished = SystemClock.elapsedRealtime();
            } catch (Throwable ignored) { forget(); }
            finally { REPUBLISHING.remove(); }
        }
    }

    // Called inside Amap's main process. Lint otherwise assumes the module APK's
    // manifest; the captured host manager checks its actual user notification grant.
    @SuppressLint("NotificationPermission")
    private static boolean notifyExisting(Notice current, Notification value) {
        Context host = FeatureSettings.from(null);
        if (host == null || !AtomicWorkbenchAmapData.PACKAGE.equals(host.getPackageName())
                || !current.manager.areNotificationsEnabled()) return false;
        current.manager.notify(current.tag, current.id, value);
        return true;
    }

    // This is the host's already-successful Service call, not a module service.
    // Keep its exact overload and dynamic type, including MANIFEST (-1); the
    // framework remains authoritative if the host's permissions later change.
    @SuppressLint("ForegroundServiceType")
    private static boolean refreshForeground(Notice current, Notification value) {
        if (!current.foregroundStarted || current.service == null
                || !AtomicWorkbenchAmapData.PACKAGE.equals(current.service.getPackageName())) return false;
        if (current.typedForeground) current.service.startForeground(current.id, value, current.foregroundType);
        else current.service.startForeground(current.id, value);
        return true;
    }
}
