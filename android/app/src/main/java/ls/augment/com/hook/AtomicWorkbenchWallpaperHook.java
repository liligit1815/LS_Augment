package ls.augment.com.hook;

import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Process;
import android.os.SystemClock;
import android.view.Display;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.IdentityHashMap;
import java.util.function.BooleanSupplier;

/** Repairs the system wallpaper lifecycle only for an authenticated, borrowed HOME display. */
final class AtomicWorkbenchWallpaperHook {
    private static final long POLL_MS = 250L;
    private static final long FAST_PROBE_MS = 32L;
    private static final long FAST_PROBE_WINDOW_MS = 1000L;
    private static final long INITIAL_TIMEOUT_MS = 6000L;
    // Re-observe the actual WM state while the authenticated HOME lease lives.
    // A one-shot packet otherwise expires before a delayed UI retry can read it.
    private static final long READY_REFRESH_MS = 2000L;
    private static final Map<Integer, Session> SESSIONS = new HashMap<>();
    private static final Map<Object, Long> DRAWN_AT = new WeakHashMap<>();
    private static Handler worker;
    private static boolean interfaceObserversAttempted;
    private static boolean interfaceObserversInstalled;

    private AtomicWorkbenchWallpaperHook() { }

    /** Called under the HOME lock if necessary: all framework work is deferred to our worker. */
    static Session acquire(AugmentModule module, Object service, int displayId, int userId,
            String displayName, String uniqueId, BooleanSupplier leaseActive) {
        return acquire(module, service, displayId, userId, displayName, uniqueId, -1, leaseActive);
    }

    static Session acquire(AugmentModule module, Object service, int displayId, int userId,
            String displayName, String uniqueId, int homeTaskId, BooleanSupplier leaseActive) {
        Session session = new Session(module, service, displayId, userId, displayName, uniqueId, leaseActive);
        session.homeTaskId = homeTaskId;
        try {
            if (Process.myUid() != 1000 || displayId <= 0 || userId < 0 || service == null
                    || displayName == null || uniqueId == null || uniqueId.isEmpty() || leaseActive == null)
                throw new SecurityException("wallpaper_requires_authenticated_system_lease");
            synchronized (SESSIONS) {
                if (worker == null) {
                    HandlerThread thread = new HandlerThread("DuoAtomicWallpaper", Process.THREAD_PRIORITY_BACKGROUND);
                    thread.start();
                    worker = new Handler(thread.getLooper());
                }
                for (Session old : new ArrayList<>(SESSIONS.values())) {
                    if (old.displayId != displayId && !old.leaseActive.getAsBoolean()) {
                        old.cancelled = true; worker.removeCallbacks(old); worker.post(old::cleanup);
                    }
                }
                Session previous = SESSIONS.get(displayId);
                if (previous != null && !previous.cancelled && previous.service == service && previous.userId == userId
                        && previous.displayName.equals(displayName) && previous.uniqueId.equals(uniqueId)) {
                    session.connectorReused = true; session.initializations = previous.initializations;
                    session.initializedConnection = previous.initializedConnection;
                }
                // A fresh handle prevents a late release of the former HOME lease from
                // detaching this display's reused connector. WPMS objects remain untouched.
                SESSIONS.put(displayId, session);
                if (previous != null) { previous.cancelled = true; worker.removeCallbacks(previous); }
                session.handler = worker;
            }
            session.captureExistingDrawn();
            session.wake("acquire");
        } catch (Throwable failure) { session.finish("unavailable", failure); }
        return session;
    }

    /** Nonblocking; a stale release can never remove a newer lease's connector. */
    static void release(Session session) {
        if (session == null || session.cancelled) return;
        session.cancelled = true;
        Handler handler = session.handler;
        if (handler != null) {
            handler.removeCallbacks(session);
            if (!handler.post(session::cleanup)) session.finish("cleanup_unavailable", null);
        }
    }

    /** Cached metadata only. No locks in WMS/WPMS and no image, path, component or token is exposed. */
    static Bundle snapshot(Session session) {
        if (session == null) {
            Bundle empty = new Bundle(); empty.putString("wallpaper_state", "not_requested"); return empty;
        }
        return new Bundle(session.snapshot);
    }

    /** Called after the ROM's actual draw/show transition; never writes or waits in WMS. */
    static void noteDrawn(Object window) {
        try {
            Object content = call(window, "getDisplayContent", new Class<?>[0]);
            int display = (Integer) call(content, "getDisplayId", new Class<?>[0]);
            Session session;
            synchronized (SESSIONS) { session = SESSIONS.get(display); }
            if (session == null || session.cancelled || !session.leaseActive.getAsBoolean()
                    || !Boolean.TRUE.equals(call(window, "isDrawn", new Class<?>[0]))) return;
            synchronized (DRAWN_AT) { DRAWN_AT.put(window, SystemClock.uptimeMillis()); }
            session.wake("draw");
        } catch (Throwable ignored) { }
    }

    /** Framework callbacks only request a fresh read; they cannot certify readiness themselves. */
    private static void noteInterface(int displayId) {
        List<Session> active;
        synchronized (SESSIONS) { active = new ArrayList<>(SESSIONS.values()); }
        for (Session session : active)
            if (displayId < 0 || session.displayId == displayId) session.wake("interface");
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static synchronized void installInterfaceObservers(AugmentModule module, ClassLoader loader) {
        if (interfaceObserversAttempted) return;
        interfaceObserversAttempted = true;
        try {
            Class<?> connection = Class.forName("com.android.server.wallpaper.WallpaperManagerService$WallpaperConnection", false, loader);
            Class<?> engine = Class.forName("android.service.wallpaper.IWallpaperEngine", false, loader);
            Method attach = method(connection, "attachEngine", engine, int.class);
            Method shown = method(connection, "engineShown", engine);
            if (attach.getReturnType() != void.class || shown.getReturnType() != void.class)
                throw new NoSuchMethodException("wallpaper_callback_return_type");
            for (Method callback : new Method[]{attach, shown}) {
                module.registerFeatureHook(module.prepareFeatureHook(callback,
                        "atomic_workbench.native_wallpaper." + callback.getName(), true).intercept(chain -> {
                    Object result = chain.proceed();
                    try { noteInterface(callback == attach ? (Integer) chain.getArgs().get(1) : -1); }
                    catch (Throwable ignored) { /* Never change a wallpaper callback result. */ }
                    return result;
                }));
                module.deoptimize(callback);
            }
            interfaceObserversInstalled = true;
        } catch (Throwable unavailable) {
            module.logFeatureError("ATOMIC_NATIVE_WALLPAPER_INTERFACE_OBSERVER_UNAVAILABLE", unavailable);
        }
    }

    static final class Session implements Runnable {
        final AugmentModule module;
        final Object service;
        final int displayId, userId;
        final String displayName, uniqueId;
        BooleanSupplier leaseActive;
        int homeTaskId = -1;
        boolean connectorReused;
        final long readinessStarted = SystemClock.uptimeMillis();
        final long readinessStartedNanos = System.nanoTime();
        final Map<Object, Boolean> retainedDrawn = new IdentityHashMap<>();
        volatile boolean cancelled;
        volatile Bundle snapshot = state("pending", null, null, 0, "");
        Handler handler;
        Bridge bridge;
        int polls, initializations, cleanupAttempts;
        Object initializedConnection;
        List<Object> cleanupTokens;
        boolean loggedRequest;
        volatile boolean readinessMonitoring, lastReadinessReady;
        int readinessObservations;
        String lastMonitorError = "";
        String lastPublishedReadiness = "";
        long lastPublishedUptime;
        final Object scheduleLock = new Object();
        boolean immediateScheduled;
        String observationTrigger = "acquire";
        long probeDelay;

        private void wake(String reason) {
            synchronized (scheduleLock) {
                if (cancelled || handler == null || immediateScheduled) return;
                // Once WM readiness is established, repeated draw callbacks do
                // not turn the two-second retained-state heartbeat into frame polling.
                if ("draw".equals(reason) && readinessMonitoring && lastReadinessReady) return;
                immediateScheduled = true; observationTrigger = reason; probeDelay = 0L;
                handler.removeCallbacks(this);
                if (!handler.post(this)) { immediateScheduled = false; finish("worker_stopped", null); }
            }
        }

        private void schedule(long delay, String reason) {
            synchronized (scheduleLock) {
                if (cancelled || immediateScheduled) return;
                observationTrigger = reason; probeDelay = delay;
                handler.removeCallbacks(this);
                if (!handler.postDelayed(this, delay)) finish("worker_stopped", null);
            }
        }

        Session(AugmentModule module, Object service, int displayId, int userId, String displayName,
                String uniqueId, BooleanSupplier active) {
            this.module = module; this.service = service; this.displayId = displayId; this.userId = userId;
            this.displayName = displayName; this.uniqueId = uniqueId; leaseActive = active;
        }

        private void captureExistingDrawn() {
            if (homeTaskId < 0) return;
            try {
                synchronized (field(service, "mGlobalLock")) {
                    Object root = field(service, "mRootWindowContainer");
                    Object content = call(root, "getDisplayContent", new Class<?>[]{int.class}, displayId);
                    if (content == null || !displayState(null).owned) return;
                    Object task = call(root, "anyTaskForId", new Class<?>[]{int.class, int.class}, homeTaskId, 0);
                    Object activity = task == null ? null : call(task, "topRunningActivity", new Class<?>[0]);
                    Object main = activity == null ? null : call(activity, "findMainWindow", new Class<?>[0]);
                    captureRetained(main, content);
                    Object tokens = field(field(content, "mWallpaperController"), "mWallpaperTokens");
                    if (tokens instanceof List<?>) for (Object token : (List<?>) tokens) {
                        int count = (Integer) call(token, "getChildCount", new Class<?>[0]);
                        for (int child = 0; child < count; child++) captureRetained(call(token, "getChildAt", new Class<?>[]{int.class}, child), content);
                    }
                }
            } catch (Throwable ignored) { }
        }

        private void captureRetained(Object window, Object content) throws Exception {
            if (window != null && call(window, "getDisplayContent", new Class<?>[0]) == content
                    && Boolean.TRUE.equals(call(window, "isDrawn", new Class<?>[0])))
                retainedDrawn.put(window, true);
        }

        private long drawnAt(Object window) {
            synchronized (DRAWN_AT) { Long at = DRAWN_AT.get(window); return at == null ? 0L : at; }
        }

        @Override public void run() {
            synchronized (scheduleLock) { immediateScheduled = false; }
            if (!current() || cancelled) return;
            long identity = Binder.clearCallingIdentity();
            try {
                if (!loggedRequest) { loggedRequest = true; log("requested"); }
                if (!leaseActive.getAsBoolean()) { cancelled = true; cleanup(); return; }
                DisplayState display = displayState(null);
                if (!display.owned) { finish("display_lost", null); return; }
                if (bridge == null) {
                    installInterfaceObservers(module, service.getClass().getClassLoader());
                    bridge = new Bridge(service.getClass().getClassLoader());
                }
                WallpaperState wallpaper = bridge.read(displayId, userId);
                display = displayState(wallpaper);
                // onDisplayAdded ran before the HOME lease existed. Some ROMs do not repeat it
                // when setShouldShowSystemDecors(true) later changes the display settings.
                // Use the actual WPMS policy: it alone chooses current vs. fallback wallpaper.
                // The lease is published before the ROOT caller enables system decorations.
                // Wait for that setting to take effect before consuming our bounded init attempt.
                if (!readinessMonitoring && display.homeSupported && display.decorsSupported && wallpaper.currentData != null
                        && initializations < 2 && !display.tokenPresent
                        && (initializations == 0 || initializedConnection != wallpaper.currentConnection)) {
                    if (!current() || cancelled || !leaseActive.getAsBoolean()) { cleanup(); return; }
                    initializedConnection = wallpaper.currentConnection;
                    initializations++;
                    // An engine without its WMS token is stale; let WPMS detach it before
                    // reconnecting. Never manufacture a token or an engine ourselves.
                    if (wallpaper.current.engine != null || wallpaper.fallback.engine != null) bridge.remove(displayId);
                    bridge.initialize(displayId, userId);
                    wallpaper = bridge.read(displayId, userId);
                    display = displayState(wallpaper);
                    snapshot = state("initializing", wallpaper, display, initializations, "");
                    log("initialize_returned");
                }
                if (!current() || cancelled) return;
                if (!leaseActive.getAsBoolean()) { cancelled = true; cleanup(); return; }
                // isVisible() means client visibility, not that a frame was presented.
                boolean ready = display.owned && display.homeSupported && display.decorsSupported && wallpaper.engineAttached()
                        && display.engineTokenVisible && wallpaper.visibleEngineAlive(display.visibleSource) && display.targetPresent;
                snapshot = state(ready ? "interface_ready" : "waiting", wallpaper, display, initializations, "");
                publishReadiness(display, ready);
                if (ready && (homeTaskId < 0 || display.homeDrawn && display.wallpaperDrawn)) {
                    if (!readinessMonitoring || !lastReadinessReady) log("interface_ready");
                    lastReadinessReady = true; lastMonitorError = "";
                    if (homeTaskId >= 0) { readinessMonitoring = true; scheduleReadinessRefresh(); }
                    return;
                }
                if (readinessMonitoring) {
                    if (lastReadinessReady) log("readiness_waiting");
                    lastReadinessReady = false; lastMonitorError = "";
                    scheduleReadinessRefresh(); return;
                }
                polls++;
                if (SystemClock.uptimeMillis() - readinessStarted >= INITIAL_TIMEOUT_MS) {
                    finish("timeout", null);
                    if (homeTaskId >= 0) { readinessMonitoring = true; scheduleReadinessRefresh(); }
                    return;
                }
                scheduleProbe();
            } catch (Throwable failure) {
                if (homeTaskId < 0) { finish("unavailable", failure); return; }
                // Never keep a formerly successful observation alive after a WM read failure.
                DisplayState unavailable = new DisplayState();
                unavailable.observedUptime = SystemClock.uptimeMillis(); unavailable.readinessError = errorType(failure);
                snapshot = state("unavailable", null, unavailable, initializations, errorType(failure));
                publishReadiness(unavailable, false); lastReadinessReady = false;
                if (!lastMonitorError.equals(errorType(failure))) log("readiness_unavailable");
                lastMonitorError = errorType(failure);
                if (!readinessMonitoring && SystemClock.uptimeMillis() - readinessStarted < INITIAL_TIMEOUT_MS) scheduleProbe();
                else { readinessMonitoring = true; scheduleReadinessRefresh(); }
            } finally { Binder.restoreCallingIdentity(identity); }
        }

        private void scheduleReadinessRefresh() {
            if (!current() || cancelled) return;
            schedule(READY_REFRESH_MS, "heartbeat");
        }

        private void scheduleProbe() {
            if (!current() || cancelled) return;
            schedule(SystemClock.uptimeMillis() - readinessStarted < FAST_PROBE_WINDOW_MS ? FAST_PROBE_MS : POLL_MS, "probe");
        }

        private boolean current() { synchronized (SESSIONS) { return SESSIONS.get(displayId) == this; } }

        private DisplayState displayState(WallpaperState wallpaper) throws Exception {
            synchronized (field(service, "mGlobalLock")) {
                Object root = field(service, "mRootWindowContainer");
                Object content = call(root, "getDisplayContent", new Class<?>[]{int.class}, displayId);
                DisplayState result = new DisplayState();
                result.observedUptime = SystemClock.uptimeMillis();
                if (content == null) return result;
                Display display = (Display) field(content, "mDisplay");
                result.owned = displayId == display.getDisplayId() && displayName.equals(display.getName())
                        && uniqueId.equals(call(display, "getUniqueId", new Class<?>[0]))
                        && (Integer) call(display, "getOwnerUid", new Class<?>[0]) == 0
                        && (Integer) call(display, "getType", new Class<?>[0]) == staticInt(Display.class, "TYPE_VIRTUAL")
                        && (display.getFlags() & staticInt(Display.class, "FLAG_TRUSTED")) != 0;
                if (!result.owned) return result;
                if (homeTaskId >= 0) try {
                    Object task = call(root, "anyTaskForId", new Class<?>[]{int.class, int.class}, homeTaskId, 0);
                    if (task != null && (Integer) call(task, "getDisplayId", new Class<?>[0]) == displayId) {
                        Object activity = call(task, "topRunningActivity", new Class<?>[0]);
                        Object main = activity == null ? null : call(activity, "findMainWindow", new Class<?>[0]);
                        result.homeDrawn = main != null && call(main, "getDisplayContent", new Class<?>[0]) == content
                                && Boolean.TRUE.equals(call(main, "isDrawn", new Class<?>[0]));
                        if (result.homeDrawn) {
                            result.homeDrawnAt = drawnAt(main);
                            result.homeDrawn = result.homeDrawnAt > 0 || retainedDrawn.containsKey(main);
                        }
                    }
                } catch (Exception unavailable) { result.readinessError = errorType(unavailable); }
                result.homeSupported = Boolean.TRUE.equals(call(content, "isHomeSupported", new Class<?>[0]));
                result.decorsSupported = Boolean.TRUE.equals(call(content, "isSystemDecorationsSupported", new Class<?>[0]));
                Object controller = field(content, "mWallpaperController");
                result.targetPresent = field(controller, "mWallpaperTarget") != null;
                if (wallpaper != null) {
                    Object tokens = field(controller, "mWallpaperTokens");
                    if (!(tokens instanceof List<?>)) throw new IllegalStateException("wallpaper_token_contract");
                    for (Object token : (List<?>) tokens) {
                        if (token == null) continue;
                        Object binder = field(token, "token");
                        if (!wallpaper.hasToken(binder)) continue;
                        result.tokenPresent = true;
                        if (Boolean.TRUE.equals(call(token, "isVisible", new Class<?>[0]))) {
                            result.clientVisible = true;
                            if (wallpaper.current.alive() && wallpaper.current.token == binder) {
                                result.engineTokenVisible = true; result.visibleSource = "current";
                            } else if (wallpaper.fallback.alive() && wallpaper.fallback.token == binder) {
                                result.engineTokenVisible = true;
                                if (result.visibleSource == null) result.visibleSource = "fallback";
                            }
                            try {
                                int count = (Integer) call(token, "getChildCount", new Class<?>[0]);
                                for (int child = 0; child < count; child++) {
                                    Object window = call(token, "getChildAt", new Class<?>[]{int.class}, child);
                                    if (window != null && call(window, "getDisplayContent", new Class<?>[0]) == content
                                            && Boolean.TRUE.equals(call(window, "isDrawn", new Class<?>[0]))) {
                                        long at = drawnAt(window);
                                        if (at > 0 || retainedDrawn.containsKey(window)) {
                                            result.wallpaperDrawn = true; result.wallpaperDrawnAt = Math.max(result.wallpaperDrawnAt, at);
                                        }
                                    }
                                }
                            } catch (Exception unavailable) { result.readinessError = errorType(unavailable); }
                        }
                    }
                }
                return result;
            }
        }

        private void cleanup() {
            if (!current()) { finish("cleanup_superseded", null); return; }
            long identity = Binder.clearCallingIdentity();
            boolean retry = false;
            try {
                // Never remove a connector from a display ID that has already been reused.
                if (!displayState(null).owned) { finish("cleanup_display_gone", null); return; }
                if (bridge == null) bridge = new Bridge(service.getClass().getClassLoader());
                if (cleanupTokens == null) cleanupTokens = new ArrayList<>();
                for (Object token : bridge.connectorTokens(displayId)) {
                    if (!cleanupTokens.contains(token)) cleanupTokens.add(token);
                }
                // The non-desktop ROM removal path removes current OR fallback each time.
                // A transition can leave both present; drain only this owned display, boundedly.
                int remaining = bridge.connectorCount(displayId);
                for (int attempt = 0; remaining > 0 && attempt < 3; attempt++) {
                    if (!current() || !displayState(null).owned) { finish("cleanup_superseded", null); return; }
                    bridge.remove(displayId);
                    remaining = bridge.connectorCount(displayId);
                }
                Bundle result = new Bundle(snapshot);
                result.putInt("wallpaper_remaining_connectors", remaining);
                int remainingTokens = remainingTokens();
                result.putInt("wallpaper_remaining_tokens", remainingTokens);
                result.putBoolean("wallpaper_token_present", remainingTokens > 0);
                if (remaining == 0) {
                    result.putBoolean("wallpaper_current_connector", false);
                    result.putBoolean("wallpaper_fallback_connector", false);
                    result.putBoolean("wallpaper_current_engine", false);
                    result.putBoolean("wallpaper_fallback_engine", false);
                    result.putBoolean("wallpaper_current_engine_reference", false);
                    result.putBoolean("wallpaper_fallback_engine_reference", false);
                }
                if (remainingTokens == 0) result.putBoolean("wallpaper_client_visible", false);
                snapshot = result;
                boolean complete = remaining == 0 && remainingTokens == 0;
                retry = !complete && ++cleanupAttempts < 3;
                finish(complete ? "released" : "cleanup_pending", null);
            } catch (Throwable failure) {
                retry = ++cleanupAttempts < 3;
                finish("cleanup_failed", failure);
            }
            finally {
                Binder.restoreCallingIdentity(identity);
                if (!(retry && current() && handler.postDelayed(this::cleanup, POLL_MS))) {
                    synchronized (SESSIONS) { if (SESSIONS.get(displayId) == this) SESSIONS.remove(displayId); }
                }
            }
        }

        private int remainingTokens() throws Exception {
            synchronized (field(service, "mGlobalLock")) {
                if (!displayState(null).owned) return 0;
                Object content = call(field(service, "mRootWindowContainer"), "getDisplayContent",
                        new Class<?>[]{int.class}, displayId);
                Object tokens = field(field(content, "mWallpaperController"), "mWallpaperTokens");
                if (!(tokens instanceof List<?>)) throw new IllegalStateException("wallpaper_token_contract");
                int count = 0;
                for (Object token : (List<?>) tokens) {
                    if (token != null && cleanupTokens.contains(field(token, "token"))) count++;
                }
                return count;
            }
        }

        private void finish(String status, Throwable failure) {
            Bundle result = new Bundle(snapshot);
            result.putString("wallpaper_state", status);
            result.putString("wallpaper_error", errorType(failure));
            snapshot = result;
            log(status);
        }

        private void publishReadiness(DisplayState display, boolean ready) {
            if (homeTaskId < 0 || !current() || cancelled || !leaseActive.getAsBoolean()) return;
            Bundle timed = new Bundle(snapshot);
            timed.putLong("readiness_started_uptime", readinessStarted);
            timed.putLong("home_drawn_uptime", display.homeDrawnAt); timed.putLong("wallpaper_drawn_uptime", display.wallpaperDrawnAt);
            timed.putLong("readiness_observed_uptime", display.observedUptime);
            timed.putInt("readiness_observations", ++readinessObservations);
            timed.putLong("readiness_refresh_ms", READY_REFRESH_MS);
            snapshot = timed;
            try {
                String fingerprint = display.homeDrawn + "|" + ready + "|" + display.wallpaperDrawn
                        + "|" + display.readinessError + "|" + display.homeDrawnAt + "|" + display.wallpaperDrawnAt;
                // Fast WM probes must not consume the Provider's 64/UID quota.
                // Publish real state transitions promptly and unchanged state only
                // at the existing two-second heartbeat. Observation times stay real.
                if (fingerprint.equals(lastPublishedReadiness)
                        && display.observedUptime - lastPublishedUptime < READY_REFRESH_MS) return;
                Context context = (Context) field(service, "mContext");
                int build = ls.augment.com.BuildConfig.VERSION_CODE;
                String value = "HR1|" + build + "|" + displayId + "|" + uniqueId + "|" + homeTaskId + "|"
                        + display.observedUptime + "|" + display.homeDrawn + "|" + ready + "|" + display.wallpaperDrawn
                        + "|" + (display.readinessError == null ? "" : display.readinessError)
                        + "|" + readinessStarted + "|" + display.homeDrawnAt + "|" + display.wallpaperDrawnAt + "|" + readinessStartedNanos;
                FeatureSettings.diagnosticHomeReadiness(context, "ls_augment_atomic_home_readiness_" + displayId, value);
                lastPublishedReadiness = fingerprint; lastPublishedUptime = display.observedUptime;
            } catch (Throwable ignored) { /* Unknown remains false if the diagnostic bridge is unavailable. */ }
        }

        private void log(String stage) {
            try {
                Bundle s = snapshot;
                module.logFeatureInfo("ATOMIC_NATIVE_WALLPAPER stage=" + stage + " display=" + displayId
                        + " user=" + userId + " state=" + s.getString("wallpaper_state", "unknown")
                        + " source=" + s.getString("wallpaper_source", "none")
                        + " currentCompatible=" + s.getBoolean("wallpaper_current_compatible")
                        + " currentEngine=" + s.getBoolean("wallpaper_current_engine")
                        + " fallbackEngine=" + s.getBoolean("wallpaper_fallback_engine")
                        + " currentEngineReference=" + s.getBoolean("wallpaper_current_engine_reference")
                        + " fallbackEngineReference=" + s.getBoolean("wallpaper_fallback_engine_reference")
                        + " tokenPresent=" + s.getBoolean("wallpaper_token_present")
                        + " clientVisible=" + s.getBoolean("wallpaper_client_visible")
                        + " target=" + s.getBoolean("wallpaper_target_present")
                        + " decors=" + s.getBoolean("wallpaper_decors_supported")
                        + " initializationCount=" + initializations
                        + " remaining=" + s.getInt("wallpaper_remaining_connectors", -1)
                        + " remainingTokens=" + s.getInt("wallpaper_remaining_tokens", -1)
                        + " home_task=" + homeTaskId + " home_surface_ready=" + s.getBoolean("home_surface_ready")
                        + " wallpaper_interface_ready=" + "interface_ready".equals(s.getString("wallpaper_state"))
                        + " wallpaper_frame_verified=" + s.getBoolean("wallpaper_frame_verified")
                        + " readiness_error=" + s.getString("readiness_error", "") + " connector_reused=" + connectorReused
                        + " readiness_started_uptime=" + s.getLong("readiness_started_uptime", 0L)
                        + " home_drawn_uptime=" + s.getLong("home_drawn_uptime", 0L)
                        + " wallpaper_drawn_uptime=" + s.getLong("wallpaper_drawn_uptime", 0L)
                        + " draw_evidence=wm_state_with_optional_callback"
                        + " readiness_observed_uptime=" + s.getLong("readiness_observed_uptime", 0L)
                        + " readiness_observations=" + s.getInt("readiness_observations", 0)
                        + " readiness_refresh_ms=" + READY_REFRESH_MS
                        + " observation_trigger=" + observationTrigger + " probe_delay_ms=" + probeDelay
                        + " readiness_age_ms=" + Math.max(0L, SystemClock.uptimeMillis() - readinessStarted)
                        + " interface_observer=" + interfaceObserversInstalled
                        + " error=" + s.getString("wallpaper_error", "") + " firstFrame=UNVERIFIED");
            } catch (Throwable ignored) { /* Diagnostics never change a HOME recovery result. */ }
        }
    }

    private static final class Bridge {
        final Object local, service, lock;
        final Class<?> connectionType;

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        Bridge(ClassLoader loader) throws Exception {
            Class<?> type = Class.forName("com.android.server.wallpaper.WallpaperManagerInternal", false, loader);
            Class<?> locals = Class.forName("com.android.server.LocalServices", false, loader);
            local = callStatic(locals, "getService", new Class<?>[]{Class.class}, type);
            if (local == null) throw new IllegalStateException("wallpaper_service_missing");
            // Exact Android 16 ROM contract; do not guess alternate methods on another ROM.
            if (method(local.getClass(), "onDisplayAddSystemDecorations", int.class).getReturnType() != void.class
                    || method(local.getClass(), "onDisplayRemoveSystemDecorations", int.class).getReturnType() != void.class)
                throw new NoSuchMethodException("wallpaper_lifecycle_return_type");
            service = field(local, "this$0");
            lock = field(service, "mLock");
            connectionType = Class.forName("com.android.server.wallpaper.WallpaperManagerService$WallpaperConnection", false, loader);
            if (method(service.getClass(), "isWallpaperCompatibleForDisplay", int.class, connectionType).getReturnType() != boolean.class)
                throw new NoSuchMethodException("wallpaper_compatibility_return_type");
        }
        WallpaperState read(int display, int user) throws Exception {
            synchronized (lock) {
                checkUser(user);
                WallpaperState result = new WallpaperState();
                result.currentData = field(service, "mLastWallpaper");
                if (result.currentData != null) {
                    if ((Integer) field(result.currentData, "userId") != user)
                        throw new SecurityException("wallpaper_user_changed");
                    result.currentConnection = field(result.currentData, "connection");
                    result.currentCompatible = Boolean.TRUE.equals(call(service, "isWallpaperCompatibleForDisplay",
                            new Class<?>[]{int.class, connectionType}, display, result.currentConnection));
                }
                result.current = connector(result.currentData, display);
                result.fallback = connector(field(service, "mFallbackWallpaper"), display);
                return result;
            }
        }
        void initialize(int display, int user) throws Exception {
            synchronized (lock) {
                checkUser(user);
                call(local, "onDisplayAddSystemDecorations", new Class<?>[]{int.class}, display);
            }
        }
        void remove(int display) throws Exception {
            call(local, "onDisplayRemoveSystemDecorations", new Class<?>[]{int.class}, display);
        }
        int connectorCount(int display) throws Exception {
            return connectorTokens(display).size();
        }
        List<Object> connectorTokens(int display) throws Exception {
            synchronized (lock) {
                List<Object> tokens = new ArrayList<>();
                Object current = field(service, "mLastWallpaper"), fallback = field(service, "mFallbackWallpaper"),
                        locked = field(service, "mLastLockWallpaper");
                for (Object wallpaper : new Object[]{current, fallback, locked}) {
                    Connector connector = connector(wallpaper, display);
                    if (!connector.present) continue;
                    if (connector.token == null) throw new IllegalStateException("wallpaper_connector_token_missing");
                    if (!tokens.contains(connector.token)) tokens.add(connector.token);
                }
                return tokens;
            }
        }
        private void checkUser(int user) throws Exception {
            if ((Integer) field(service, "mCurrentUserId") != user) throw new SecurityException("wallpaper_user_changed");
        }
        private Connector connector(Object wallpaper, int display) throws Exception {
            Connector result = new Connector();
            if (wallpaper == null) return result;
            Object connection = field(wallpaper, "connection");
            if (connection == null) return result;
            Object connectors = field(connection, "mDisplayConnector");
            Object connector = call(connectors, "get", new Class<?>[]{int.class}, display);
            if (connector == null) return result;
            if ((Integer) field(connector, "mDisplayId") != display) throw new SecurityException("wallpaper_connector_display");
            result.present = true;
            result.engine = field(connector, "mEngine");
            if (result.engine != null && !(result.engine instanceof IInterface))
                throw new IllegalStateException("wallpaper_engine_interface_contract");
            result.token = field(connector, "mToken");
            return result;
        }
    }

    private static final class Connector {
        boolean present;
        Object engine, token;
        boolean alive() {
            if (!(engine instanceof IInterface)) return false;
            IBinder binder = ((IInterface) engine).asBinder();
            return binder != null && binder.isBinderAlive();
        }
    }
    private static final class WallpaperState {
        Object currentData, currentConnection;
        boolean currentCompatible;
        Connector current, fallback;
        boolean engineAttached() { return current.alive() || fallback.alive(); }
        boolean visibleEngineAlive(String source) {
            return "current".equals(source) ? current.alive() : "fallback".equals(source) && fallback.alive();
        }
        boolean hasToken(Object token) {
            return token != null && ((current.present && current.token == token)
                    || (fallback.present && fallback.token == token));
        }
    }
    private static final class DisplayState {
        boolean owned, homeSupported, decorsSupported, tokenPresent, clientVisible, engineTokenVisible, targetPresent;
        boolean homeDrawn, wallpaperDrawn;
        long homeDrawnAt, wallpaperDrawnAt;
        long observedUptime;
        String visibleSource, readinessError;
    }

    private static Bundle state(String status, WallpaperState wallpaper, DisplayState display, int count, String error) {
        Bundle result = new Bundle();
        result.putString("wallpaper_state", status);
        result.putString("wallpaper_error", error);
        result.putString("wallpaper_source", display != null && display.visibleSource != null ? display.visibleSource
                : wallpaper == null ? "none" : wallpaper.current.alive()
                ? "current" : wallpaper.fallback.alive() ? "fallback" : "none");
        result.putBoolean("wallpaper_current_compatible", wallpaper != null && wallpaper.currentCompatible);
        result.putBoolean("wallpaper_current_connector", wallpaper != null && wallpaper.current.present);
        result.putBoolean("wallpaper_fallback_connector", wallpaper != null && wallpaper.fallback.present);
        result.putBoolean("wallpaper_current_engine", wallpaper != null && wallpaper.current.alive());
        result.putBoolean("wallpaper_fallback_engine", wallpaper != null && wallpaper.fallback.alive());
        result.putBoolean("wallpaper_current_engine_reference", wallpaper != null && wallpaper.current.engine != null);
        result.putBoolean("wallpaper_fallback_engine_reference", wallpaper != null && wallpaper.fallback.engine != null);
        result.putBoolean("wallpaper_token_present", display != null && display.tokenPresent);
        result.putBoolean("wallpaper_client_visible", display != null && display.clientVisible);
        result.putBoolean("wallpaper_target_present", display != null && display.targetPresent);
        result.putBoolean("wallpaper_home_supported", display != null && display.homeSupported);
        result.putBoolean("wallpaper_decors_supported", display != null && display.decorsSupported);
        result.putBoolean("wallpaper_frame_verified", display != null && display.wallpaperDrawn);
        result.putBoolean("home_surface_ready", display != null && display.homeDrawn);
        result.putString("readiness_error", display == null || display.readinessError == null ? "" : display.readinessError);
        result.putInt("wallpaper_initializations", count);
        return result;
    }

    private static String errorType(Throwable error) {
        while (error instanceof InvocationTargetException && error.getCause() != null) error = error.getCause();
        return error == null ? "" : error.getClass().getSimpleName();
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
    private static Method method(Class<?> type, String name, Class<?>... types) throws Exception {
        for (Class<?> owner = type; owner != null; owner = owner.getSuperclass()) {
            try { Method method = owner.getDeclaredMethod(name, types); method.setAccessible(true); return method; }
            catch (NoSuchMethodException ignored) { }
        }
        throw new NoSuchMethodException(name);
    }
    private static Object call(Object object, String name, Class<?>[] types, Object... args) throws Exception {
        return method(object.getClass(), name, types).invoke(object, args);
    }
    private static Object callStatic(Class<?> type, String name, Class<?>[] types, Object... args) throws Exception {
        return method(type, name, types).invoke(null, args);
    }
}
