package ls.augment.com.hook;

import android.app.Application;
import android.database.ContentObserver;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.content.SharedPreferences;
import io.github.libxposed.api.XposedInterface;

import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.RemoteConfig;
import ls.augment.com.HideUserIdentity;
import ls.augment.com.HideTargetCodec;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Objects;
import java.util.Collections;
import java.util.Set;
import java.util.List;
import java.util.HashMap;
import java.util.HashSet;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/** Cached, fail-closed access to private configuration and official remote preferences. */
final class FeatureSettings {
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    private static final Uri CONFIG_URI = Uri.parse("content://ls.augment.com.config/config");
    // Observers invalidate immediately; hot hooks share the five-second recovery poll.
    private static final long CACHE_MS = 5000L;
    private static final long AUXILIARY_CACHE_MS = 1000L;
    // A hook can hold Power/AMS/WM locks. Readers never enter the publication lock or do IPC.
    private static final Object PUBLICATION_LOCK = new Object();
    // Guarded by PUBLICATION_LOCK. A Provider rollback identifies a new private
    // configuration generation; stale mirrors stay quarantined until resynced.
    private static String mirrorResyncChecksum;
    private static volatile ConfigSnapshot cachedSnapshot = ConfigSnapshot.safeDefaults();
    private static final class StatusBarPolicySnapshot {
        final ConfigSnapshot snapshot;final ls.augment.com.StatusBarEditPolicy policy;
        StatusBarPolicySnapshot(ConfigSnapshot value){snapshot=value;policy=ls.augment.com.StatusBarEditPolicy.resolve(value::get);}
    }
    private static volatile StatusBarPolicySnapshot statusBarPolicy;
    private static ls.augment.com.StatusBarEditPolicy statusBarPolicy(ConfigSnapshot snapshot){
        StatusBarPolicySnapshot cached=statusBarPolicy;
        if(cached==null||cached.snapshot!=snapshot){cached=new StatusBarPolicySnapshot(snapshot);statusBarPolicy=cached;}
        return cached.policy;
    }
    // One atomic publication distinguishes a verified saved configuration from
    // the startup placeholder without making readers take the publication lock.
    private static volatile ConfigSnapshot cachedVerifiedSnapshot;
    private static volatile long cachedAt;
    private static volatile Context applicationContext;
    private static volatile boolean verifiedSnapshot;
    private static volatile boolean observersInstalled;
    // CONFIG_WORKER owns transport state. A failure retains the last verified
    // publication and schedules a bounded recovery instead of publishing defaults.
    private static String providerReadState = "not_read", remoteReadState = "not_read", runtimeReadState = "not_read";
    private static int consecutiveReadFailures;
    private static String startupReadState = "";
    private static final Map<String,String> startupReadFailures = new HashMap<>();
    private static final Map<String,Long> startupReadFailureTimes = new HashMap<>();
    private static String startupWriteFailureState = "";
    private static final AtomicBoolean handshakeSent = new AtomicBoolean();
    private static volatile XposedInterface framework;
    private static volatile String diagnosticProcessName = "";
    private static SharedPreferences remotePreferences;
    // CONFIG_WORKER owns these bounded caches; never reuse one transport's authority for another.
    private static final ConfigSnapshot.Reader PROVIDER_READER = new ConfigSnapshot.Reader();
    private static final ConfigSnapshot.Reader REMOTE_READER = new ConfigSnapshot.Reader();
    private static final CountDownLatch BOOTSTRAP_READY = new CountDownLatch(1);
    // Unlike the attempt latch above, this opens only for a verified publication.
    private static final CountDownLatch VERIFIED_PUBLICATION_READY = new CountDownLatch(1);
    private static final AtomicBoolean bootWaited = new AtomicBoolean();
    private static volatile String bootstrapStatus = "not_requested";
    // Only CONFIG_WORKER owns the untrusted candidate string. The Settings hook
    // reads a single immutable publication and never queries user identity itself.
    private static String hiddenCandidates = "";
    private static volatile boolean hiddenFilteringRequested;
    private static final long HIDDEN_VALID_MS = 10_000L;
    private static volatile HiddenSnapshot hiddenSnapshot = HiddenSnapshot.EMPTY;
    private static final SettingsEntryBindings ENTRY_BINDINGS = new SettingsEntryBindings();
    private static final CopyOnWriteArrayList<Runnable> HIDDEN_LISTENERS = new CopyOnWriteArrayList<>();
    private static boolean runtimeAuthoritative;
    // Retained strongly for the lifetime of the hooked process.
    private static final SharedPreferences.OnSharedPreferenceChangeListener REMOTE_LISTENER =
            (preferences, key) -> invalidateSnapshot();
    private static final AtomicBoolean pollingStarted = new AtomicBoolean();
    private static final AtomicBoolean refreshPending = new AtomicBoolean();
    // Only timer bookkeeping is locked; Provider calls never hold this lock.
    private static final Object WRITE_SCHEDULE_LOCK = new Object();
    private static ScheduledFuture<?> writeFuture;
    private static long writeScheduledAt, writeScheduleGeneration;
    private static final AtomicBoolean homeReadinessWritePending = new AtomicBoolean();
    private static final AtomicLong invalidations = new AtomicLong();
    private static final CopyOnWriteArrayList<Runnable> LISTENERS = new CopyOnWriteArrayList<>();
    private static final ConcurrentHashMap<String,String> DIAGNOSTIC_VALUES = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String,Long> AUXILIARY_READ_AT = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String,Boolean> AUXILIARY_PENDING = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String,PendingDiagnostic> DIAGNOSTICS = new ConcurrentHashMap<>();
    private static final int MAX_DIAGNOSTIC_CACHE = 1024;
    // Admission/expiry only; never held around IPC or a hook callback.
    private static final Object DIAGNOSTIC_QUEUE_LOCK = new Object();
    private static final long DIAGNOSTIC_RETRY_WINDOW_MS = 300_000L;
    private static final AtomicLong diagnosticRetries = new AtomicLong(), diagnosticExpired = new AtomicLong();
    private static final AtomicLong diagnosticRejected = new AtomicLong();
    private static final AtomicLong diagnosticQueueFull = new AtomicLong(), diagnosticAccepted = new AtomicLong();
    private static volatile String diagnosticLastFailureType = "", diagnosticLastDropReason = "";
    private static volatile String diagnosticLastFailureKey = "", diagnosticLastFailureReason = "", diagnosticLastDropKey = "";
    private static volatile long diagnosticLastFailureAt, diagnosticLastDropAt, diagnosticLastAcceptedAt;
    private static final ArrayBlockingQueue<PendingCall> ROUTES = new ArrayBlockingQueue<>(128);
    private static final ScheduledExecutorService CONFIG_WORKER = worker("LSA-ConfigReader");
    private static final ScheduledExecutorService WRITE_WORKER = worker("LSA-ConfigWriter");

    static final String APP_MASTER = ConfigSchema.APP_MASTER;
    static final String HIDE_MASTER = ConfigSchema.HIDE_MASTER;
    static final String GAME_MASTER = ConfigSchema.GAME_MASTER;
    static final String SYSTEMUI_MASTER = ConfigSchema.SYSTEMUI_MASTER;
    static final String SHOULDER_ENABLED = ConfigSchema.SHOULDER_ENABLED;
    static final String SHOULDER_DIAGNOSTICS = ConfigSchema.SHOULDER_DIAGNOSTICS;
    static final String TGK_RAPID_FIRE_ENABLED = ConfigSchema.TGK_RAPID_FIRE_ENABLED;
    static final String TGK_RAPID_FIRE_COUNT = ConfigSchema.TGK_RAPID_FIRE_COUNT;
    static final String TGK_RAPID_FIRE_COMPAT_TOKEN =
            ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN;
    static final String TGK_RAPID_FIRE_TEST_SESSION =
            ConfigSchema.TGK_RAPID_FIRE_TEST_SESSION;
    static final String TGK_RAPID_FIRE_NATIVE_STATE =
            "ls_augment_tgk_rapid_fire_native_state";
    static final String TGK_RAPID_FIRE_NATIVE_SHA256 =
            "ls_augment_tgk_rapid_fire_native_sha256";
    static final String TGK_RAPID_FIRE_NATIVE_LAST_HIT =
            "ls_augment_tgk_rapid_fire_native_last_hit";
    static final String TGK_RAPID_FIRE_NATIVE_LAST_ERROR =
            "ls_augment_tgk_rapid_fire_native_last_error";
    static final String ALLOW_SIGNATURE_MISMATCH = ConfigSchema.ALLOW_SIGNATURE_MISMATCH;
    static final String SIGNATURE_INSTALL_INSTALLED =
            "ls_augment_signature_install_installed";
    static final String SIGNATURE_INSTALL_ACTIVE =
            "ls_augment_signature_install_active";
    static final String SIGNATURE_INSTALL_LAST_HIT =
            "ls_augment_signature_install_last_hit";
    static final String SIGNATURE_INSTALL_LAST_ERROR =
            "ls_augment_signature_install_last_error";
    static final String COMBO_SPEED_ENABLED = ConfigSchema.COMBO_SPEED_ENABLED;
    static final String COMBO_SPEED_RATE = ConfigSchema.COMBO_SPEED_RATE;
    static final String AI_TRIGGER_ENABLED = ConfigSchema.AI_TRIGGER_ENABLED;
    static final String AI_TRIGGER_DIAGNOSTICS = ConfigSchema.AI_TRIGGER_DIAGNOSTICS;
    static final String AI_TRIGGER_TEMPLATE_SCAN_MS = ConfigSchema.AI_TRIGGER_TEMPLATE_SCAN_MS;
    static final String AI_TRIGGER_CLICK_MS = ConfigSchema.AI_TRIGGER_CLICK_MS;
    static final String AI_TRIGGER_COOLDOWN_MS = ConfigSchema.AI_TRIGGER_COOLDOWN_MS;
    static final String AI_TRIGGER_YOLO_SCAN_MS = ConfigSchema.AI_TRIGGER_YOLO_SCAN_MS;
    static final String FREEFORM_ENABLED = ConfigSchema.FREEFORM_ENABLED;
    static final String FREEFORM_UNLIMITED = ConfigSchema.FREEFORM_UNLIMITED;
    static final String FREEFORM_ALL_APPS = ConfigSchema.FREEFORM_ALL_APPS;
    static final String FAN_FIXED_ENABLED = ConfigSchema.FAN_FIXED_ENABLED;
    static final String FAN_TILE_ENHANCEMENT_ENABLED = ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED;
    static final String FAN_CONTROL_ACTIVE = "ls_augment_fan_control_active";
    static final String FAN_CONTROL_INSTALLED = "ls_augment_fan_control_installed";
    static final String FAN_CONTROL_LAST_ERROR = "ls_augment_fan_control_last_error";
    static final String DOUBLE_ANY_APP = ConfigSchema.DOUBLE_ANY_APP;
    static final String DOUBLE_LOW_MEMORY = ConfigSchema.DOUBLE_LOW_MEMORY;

    static final String STATUSBAR_DUAL_LEFT = ConfigSchema.STATUSBAR_DUAL_LEFT;
    static final String STATUSBAR_DUAL_RIGHT = ConfigSchema.STATUSBAR_DUAL_RIGHT;
    static final String STATUSBAR_CLOCK_ACROSS = ConfigSchema.STATUSBAR_CLOCK_ACROSS;
    static final String STATUSBAR_HEIGHT_DP = ConfigSchema.STATUSBAR_HEIGHT_DP;
    static final String STATUSBAR_LEFT_MARGIN_DP = ConfigSchema.STATUSBAR_LEFT_MARGIN_DP;
    static final String STATUSBAR_RIGHT_MARGIN_DP = ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP;
    static final String STATUSBAR_TOP_MARGIN_DP = ConfigSchema.STATUSBAR_TOP_MARGIN_DP;
    static final String STATUSBAR_BOTTOM_MARGIN_DP = ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP;
    static final String STATUSBAR_FREE_POSITION = ConfigSchema.STATUSBAR_FREE_POSITION;
    static final String STATUSBAR_LAYOUT_SPEC = ConfigSchema.STATUSBAR_LAYOUT_SPEC;
    static final String STATUSBAR_CLOCK_CUSTOM = ConfigSchema.STATUSBAR_CLOCK_CUSTOM;
    static final String STATUSBAR_CLOCK_PATTERN = ConfigSchema.STATUSBAR_CLOCK_PATTERN;
    static final String STATUSBAR_CLOCK_PATTERN_SECOND =
            ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND;
    static final String STATUSBAR_CLOCK_24H = ConfigSchema.STATUSBAR_CLOCK_24H;
    static final String STATUSBAR_CLOCK_SECONDS = ConfigSchema.STATUSBAR_CLOCK_SECONDS;
    static final String STATUSBAR_CLOCK_PERIOD = ConfigSchema.STATUSBAR_CLOCK_PERIOD;
    static final String STATUSBAR_CLOCK_WEEK = ConfigSchema.STATUSBAR_CLOCK_WEEK;
    static final String STATUSBAR_CLOCK_FONT_FAMILY = ConfigSchema.STATUSBAR_CLOCK_FONT_FAMILY;
    static final String STATUSBAR_CLOCK_SIZE_SP = ConfigSchema.STATUSBAR_CLOCK_SIZE_SP;
    static final String STATUSBAR_CLOCK_WEIGHT = ConfigSchema.STATUSBAR_CLOCK_WEIGHT;
    static final String STATUSBAR_CLOCK_LETTER_SPACING =
            ConfigSchema.STATUSBAR_CLOCK_LETTER_SPACING;
    static final String STATUSBAR_CLOCK_LINE_SPACING_DP =
            ConfigSchema.STATUSBAR_CLOCK_LINE_SPACING_DP;
    static final String STATUSBAR_CLOCK_TEXT_ALIGN = ConfigSchema.STATUSBAR_CLOCK_TEXT_ALIGN;
    static final String STATUSBAR_CLOCK_WIDTH_DP = ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP;
    static final String STATUSBAR_THERMAL = ConfigSchema.STATUSBAR_THERMAL;
    static final String STATUSBAR_BATTERY_POWER = ConfigSchema.STATUSBAR_BATTERY_POWER;
    static final String STATUSBAR_NOTIFICATION_MAX = ConfigSchema.STATUSBAR_NOTIFICATION_MAX;
    static final String STATUSBAR_ICON_SCALE = ConfigSchema.STATUSBAR_ICON_SCALE;
    static final String STATUSBAR_DEBUG_OVERLAY = ConfigSchema.STATUSBAR_DEBUG_OVERLAY;
    static final String STATUSBAR_NOTIFICATION_HIDE =
            ConfigSchema.STATUSBAR_NOTIFICATION_HIDE;
    static final String STATUSBAR_DUAL_ROW_GAP_DP = ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP;

    static final String DOUBLE_ACTIVE = "ls_augment_doubleapp_active";
    static final String DOUBLE_INSTALLED = "ls_augment_doubleapp_installed";
    static final String DOUBLE_LAST_HIT = "ls_augment_doubleapp_last_hit";
    static final String DOUBLE_LAST_ERROR = "ls_augment_doubleapp_last_error";
    static final String SYSTEMUI_ACTIVE = "ls_augment_systemui_active";
    static final String SYSTEMUI_INSTALLED = "ls_augment_systemui_installed";
    static final String SYSTEMUI_COMPAT = "ls_augment_systemui_compat";
    static final String SYSTEMUI_LAST_HIT = "ls_augment_systemui_last_hit";
    static final String SYSTEMUI_LAST_ERROR = "ls_augment_systemui_last_error";
    static final String SYSTEMUI_LAYOUT_STATE = "ls_augment_statusbar_layout_state";
    static final String SYSTEMUI_DISCOVERED_ICONS =
            "ls_augment_statusbar_discovered_icons";
    static final String SYSTEMUI_CLOCK_ERROR = "ls_augment_statusbar_clock_error";

    static final String[] STATUSBAR_KEYS = {
            SYSTEMUI_MASTER, STATUSBAR_DUAL_LEFT, STATUSBAR_DUAL_RIGHT,
            STATUSBAR_CLOCK_ACROSS, STATUSBAR_HEIGHT_DP,
            STATUSBAR_LEFT_MARGIN_DP, STATUSBAR_RIGHT_MARGIN_DP,
            STATUSBAR_TOP_MARGIN_DP, STATUSBAR_BOTTOM_MARGIN_DP,
            STATUSBAR_FREE_POSITION, STATUSBAR_LAYOUT_SPEC,
            STATUSBAR_CLOCK_CUSTOM, STATUSBAR_CLOCK_PATTERN,
            STATUSBAR_CLOCK_PATTERN_SECOND, STATUSBAR_CLOCK_24H,
            STATUSBAR_CLOCK_SECONDS, STATUSBAR_CLOCK_PERIOD, STATUSBAR_CLOCK_WEEK,
            STATUSBAR_CLOCK_FONT_FAMILY, STATUSBAR_CLOCK_SIZE_SP,
            STATUSBAR_CLOCK_WEIGHT, STATUSBAR_CLOCK_LETTER_SPACING,
            STATUSBAR_CLOCK_LINE_SPACING_DP, STATUSBAR_CLOCK_TEXT_ALIGN,
            STATUSBAR_CLOCK_WIDTH_DP, STATUSBAR_THERMAL,
            STATUSBAR_BATTERY_POWER, STATUSBAR_NOTIFICATION_MAX,
            STATUSBAR_ICON_SCALE, STATUSBAR_DEBUG_OVERLAY, STATUSBAR_NOTIFICATION_HIDE,
            STATUSBAR_DUAL_ROW_GAP_DP
    };
    static final String BEAUTIFY_COMPAT = "ls_augment_beautify_compat";
    static final String BEAUTIFY_UNLIMITED_TRIAL = ConfigSchema.BEAUTIFY_UNLIMITED_TRIAL;
    static final String BEAUTIFY_ACTIVE = "ls_augment_beautify_active";
    static final String BEAUTIFY_INSTALLED = "ls_augment_beautify_installed";
    static final String BEAUTIFY_ADAPTER_INSTALLED = "ls_augment_beautify_adapter_installed";
    static final String BEAUTIFY_LAST_HIT = "ls_augment_beautify_last_hit";
    static final String BEAUTIFY_LAST_ERROR = "ls_augment_beautify_last_error";

    static final String SUPER_MIRROR_LOW_MODE = ConfigSchema.SUPER_MIRROR_LOW_MODE;
    static final String SUPER_MIRROR_DIABLO_COEXIST =
            ConfigSchema.SUPER_MIRROR_DIABLO_COEXIST;
    static final String SUPER_MIRROR_ACTIVE =
            "ls_augment_super_mirror_active";
    static final String SUPER_MIRROR_INSTALLED =
            "ls_augment_super_mirror_installed";
    static final String SUPER_MIRROR_LAST_HIT =
            "ls_augment_super_mirror_last_hit";
    static final String SUPER_MIRROR_LAST_ERROR =
            "ls_augment_super_mirror_last_error";

    private FeatureSettings() { }

    static boolean enabled(Context context, String key) {
        return enabled(context, key, false);
    }

    static boolean enabled(Context context, String key, boolean fallback) {
        try {
            String raw = value(context, key);
            if (raw == null || raw.isEmpty() || "null".equals(raw)) return fallback;
            return "1".equals(raw) || "true".equalsIgnoreCase(raw)
                    || "yes".equalsIgnoreCase(raw) || "on".equalsIgnoreCase(raw);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    static int integer(Context context, String key, int fallback, int min, int max) {
        try {
            String raw = value(context, key);
            if (raw == null || raw.isEmpty() || "null".equals(raw)) return fallback;
            int value = Integer.parseInt(raw.trim());
            return Math.max(min, Math.min(max, value));
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    static String text(Context context, String key, String fallback) {
        try {
            String raw = value(context, key);
            return raw == null || "null".equals(raw) ? fallback : raw;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    /** Enqueue evidence; input/system lock owners must never wait for the provider. */
    static void recordRapidRoute(Context context, String sessionId, String phase,
            int upperCode, int systemCode) {
        Context application = remember(context);
        if (application == null) return;
        Bundle extras = new Bundle();
        extras.putString("sessionId", sessionId); extras.putString("phase", phase);
        extras.putInt("upper", upperCode); extras.putInt("system", systemCode);
        // Dropped evidence cannot unlock testing; the provider still requires a full route.
        if (ROUTES.offer(new PendingCall(application, extras))) scheduleWrites();
    }

    static void diagnostic(Context context, String key, String value) {
        diagnostic(context, key, value, false);
    }

    /** Live HR1 evidence only: coalesce on the existing writer, never perform IPC on a WM callback. */
    static void diagnosticHomeReadiness(Context context, String key, String value) {
        if (android.os.Process.myUid() != android.os.Process.SYSTEM_UID || key == null
                || !key.matches("ls_augment_atomic_home_readiness_[1-9][0-9]{0,9}")
                || value == null || !value.startsWith("HR1|")) return;
        diagnostic(context, key, value, true);
    }

    private static void diagnostic(Context context, String key, String value, boolean homeReadiness) {
        if (key == null) return;
        Context application = remember(context);
        if (application == null) return;
        String text = value == null ? "" : value;
        boolean admitted = true;
        long writeDelay = 250L;
        synchronized (DIAGNOSTIC_QUEUE_LOCK) {
            if (text.equals(DIAGNOSTIC_VALUES.get(key))) return;
            if (DIAGNOSTICS.size() >= 512 && !DIAGNOSTICS.containsKey(key)) {
                diagnosticQueueFull.incrementAndGet();
                diagnosticLastDropReason = "queue_full"; diagnosticLastDropAt = System.currentTimeMillis();
                diagnosticLastDropKey = safeDiagnosticKey(key);
                // A value that was not admitted must not stay deduplicated forever.
                admitted = false;
            } else {
                PendingDiagnostic pending = new PendingDiagnostic(application, text, homeReadiness);
                PendingDiagnostic previous = DIAGNOSTICS.get(key);
                // Fresh values cannot erase a failed Provider's backoff or restart
                // its bounded retry window on every draw/heartbeat.
                if (previous != null) {
                    pending.retryAt = previous.retryAt; pending.failures = previous.failures;
                    pending.retryStartedElapsed = previous.retryStartedElapsed;
                }
                DIAGNOSTICS.put(key, pending);
                cacheValue(DIAGNOSTIC_VALUES, DIAGNOSTICS, key, text);
                writeDelay = diagnosticWriteDelay(pending, SystemClock.elapsedRealtime());
            }
        }
        // Detailed evidence has an independent bounded queue, including a value
        // that could not enter the latest-value queue.
        HookTelemetry.event(key + "=" + text);
        if (!admitted) return;
        if (homeReadiness) scheduleHomeReadinessWrite();
        scheduleWrites(writeDelay);
    }

    /** Local evidence for the process snapshot; never queues diagnostics about its own failure. */
    static String diagnosticWriterState() {
        return "version=1;pending=" + DIAGNOSTICS.size() + ";retryWindowMs=" + DIAGNOSTIC_RETRY_WINDOW_MS
                + ";retried=" + diagnosticRetries.get() + ";expired=" + diagnosticExpired.get()
                + ";rejected=" + diagnosticRejected.get()
                + ";queueFull=" + diagnosticQueueFull.get() + ";accepted=" + diagnosticAccepted.get()
                + ";lastFailureType=" + diagnosticLastFailureType + ";lastFailureAt=" + diagnosticLastFailureAt
                + ";lastFailureKey=" + diagnosticLastFailureKey + ";lastFailureReason=" + diagnosticLastFailureReason
                + ";lastDropReason=" + diagnosticLastDropReason + ";lastDropAt=" + diagnosticLastDropAt
                + ";lastDropKey=" + diagnosticLastDropKey
                + ";lastAcceptedAt=" + diagnosticLastAcceptedAt;
    }

    /** Process snapshot evidence only: no auxiliary read, provider call or write queue. */
    static String launcherGridRuntimeValue() {
        String value = DIAGNOSTIC_VALUES.get("ls_augment_launcher_grid_runtime");
        return value == null ? "" : value;
    }

    static void diagnosticError(Context context, String key, String source, Throwable error) {
        String stack = android.util.Log.getStackTraceString(error);
        if (stack.length() > 1500) stack = stack.substring(0, 1500) + " [TRUNCATED]";
        diagnostic(context, key, source + ":" + error + ";build=" + ls.augment.com.BuildConfig.VERSION_CODE
                + ";pid=" + android.os.Process.myPid() + ";time=" + System.currentTimeMillis() + ";stack=" + stack);
    }

    static float decimal(Context context, String key, float fallback, float min, float max) {
        String value = text(context, key, String.valueOf(fallback));
        try { return Math.max(min, Math.min(max, Float.parseFloat(value))); }
        catch (Throwable ignored) { return fallback; }
    }

    /** Always returns immediately, including while either configuration service is blocked. */
    static ConfigSnapshot snapshot(Context context) {
        remember(context);
        if (cachedAt == 0L || SystemClock.elapsedRealtime() - cachedAt >= CACHE_MS) requestRefresh();
        return cachedSnapshot;
    }

    /** Distinguishes the startup placeholder from an actual saved off configuration. */
    static boolean hasVerifiedSnapshot(Context context) {
        snapshot(context);
        return verifiedSnapshot;
    }

    /** A nullable immutable publication: readiness and values belong to one generation. */
    static ConfigSnapshot verifiedSnapshot(Context context) {
        snapshot(context);
        return cachedVerifiedSnapshot;
    }

    /** Only an already verified off state can skip owner reflection; startup still binds context. */
    static boolean verifiedDisabled(String key) {
        if (!verifiedSnapshot) return false;
        if (SystemClock.elapsedRealtime()-cachedAt>=CACHE_MS) requestRefresh();
        return !ConfigSchema.truthy(cachedSnapshot.get(key));
    }

    static void rememberDiagnosticProcess(String name) {
        diagnosticProcessName = "system".equals(name) ? "system_server" : name == null ? "" : name;
    }

    private static String diagnosticProcess() {
        String current = null;
        try { current = android.app.Application.getProcessName(); } catch (Throwable ignored) { }
        if (current != null && !current.isEmpty()) return "system".equals(current) ? "system_server" : current;
        String loaded = diagnosticProcessName;
        return loaded.isEmpty() ? "unknown" : loaded;
    }

    /** Start framework I/O at module initialization, outside every intercepted call. */
    static void attachFramework(XposedInterface value) {
        framework = value;
        if (pollingStarted.compareAndSet(false, true))
            CONFIG_WORKER.scheduleWithFixedDelay(FeatureSettings::requestRefresh, 0, 5, TimeUnit.SECONDS);
        requestRefresh();
    }

    /** Once at server-hook installation, never from an intercepted method or a configuration getter. */
    static void awaitBootSnapshot() {
        if (!bootWaited.compareAndSet(false, true)) return;
        if (verifiedSnapshot) { bootstrapStatus = "ready"; return; }
        // Early constructors use the framework's official private preference
        // channel, already loaded on CONFIG_WORKER. No system-directory mirror.
        try {
            boolean finished = BOOTSTRAP_READY.await(250L, TimeUnit.MILLISECONDS);
            bootstrapStatus = verifiedSnapshot ? "ready" : finished ? "unavailable" : "timeout";
        } catch (InterruptedException interrupted) {
            bootstrapStatus = "interrupted";
            Thread.currentThread().interrupt();
        }
    }

    /** Launcher installer only, before its constructors/loaders are intercepted. */
    static void awaitLauncherGridSnapshot() {
        if (cachedVerifiedSnapshot != null) return;
        requestRefresh();
        try { VERIFIED_PUBLICATION_READY.await(1750L, TimeUnit.MILLISECONDS); }
        catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); }
    }

    static Set<String> hiddenTargets(Context context) {
        return currentHiddenSnapshot(context).targets;
    }

    static Set<HideTargetCodec.Entry> hiddenAuthorizations(Context context) {
        return currentHiddenSnapshot(context).authorizations;
    }

    static SettingsEntryBindings entryBindings() { return ENTRY_BINDINGS; }

    /** Queue only: called inside the existing Settings query, never performs identity IPC. */
    static void requestHiddenEntryVerification(Context context) {
        hiddenFilteringRequested = true;
        remember(context);
        invalidations.incrementAndGet();
        requestRefresh();
    }

    static void addHiddenTargetsListener(Runnable listener) {
        if (listener != null) HIDDEN_LISTENERS.addIfAbsent(listener);
    }

    private static void dispatchHiddenTargetsChanged() {
        Looper looper = Looper.getMainLooper();
        if (looper == null || HIDDEN_LISTENERS.isEmpty()) return;
        new Handler(looper).post(() -> {
            for (Runnable listener : HIDDEN_LISTENERS) {
                try { listener.run(); } catch (Throwable ignored) { }
            }
        });
    }

    private static HiddenSnapshot currentHiddenSnapshot(Context context) {
        boolean first = !hiddenFilteringRequested;
        hiddenFilteringRequested = true;
        snapshot(context);
        if (first) requestRefresh();
        HiddenSnapshot current = hiddenSnapshot;
        long now = SystemClock.elapsedRealtime();
        if (!verifiedSnapshot || !"1".equals(cachedSnapshot.get(HIDE_MASTER))
                || now < current.checkedAt || now - current.checkedAt >= HIDDEN_VALID_MS)
            return HiddenSnapshot.EMPTY;
        return current;
    }

    private static final class HiddenSnapshot {
        static final HiddenSnapshot EMPTY = new HiddenSnapshot(Collections.emptySet(), 0);
        final Set<String> targets;
        final Set<HideTargetCodec.Entry> authorizations;
        final long checkedAt;
        HiddenSnapshot(Set<HideTargetCodec.Entry> authorizations, long checkedAt) {
            this.authorizations = authorizations;
            HashSet<String> keys = new HashSet<>();
            for (HideTargetCodec.Entry entry : authorizations)
                keys.add(SettingsTargetMatcher.target(entry.userId, entry.packageName));
            this.targets = Collections.unmodifiableSet(keys);
            this.checkedAt = checkedAt;
        }
    }

    /** Settings only, worker only. Same raw candidates must still recheck user reuse. */
    private static void refreshHiddenTargetsOnWorker(Context context) {
        HiddenSnapshot previous = hiddenSnapshot;
        boolean entryChanged = false;
        try {
            if (!hiddenFilteringRequested || context == null
                    || !"com.android.settings".equals(context.getPackageName())
                    || !verifiedSnapshot || !"1".equals(cachedSnapshot.get(HIDE_MASTER))) {
                hiddenSnapshot = HiddenSnapshot.EMPTY;
                return;
            }
            // Freeze exact records before any identity read. A record arriving while
            // Binder is blocked must not inherit that earlier observation.
            List<SettingsEntryBindings.Check> checks = ENTRY_BINDINGS.checks();
            long checkedAt = SystemClock.elapsedRealtime();
            Map<Integer, Long> serials = new HashMap<>();
            SettingsTargetMatcher.SerialReader reader = userId -> {
                if (!serials.containsKey(userId)) {
                    HideUserIdentity.Snapshot identity = HideUserIdentity.read(context, userId);
                    serials.put(userId, identity != null && identity.success && identity.userId == userId
                            ? identity.userSerial : -1L);
                }
                return serials.get(userId);
            };
            Set<HideTargetCodec.Entry> targets = SettingsTargetMatcher.verifiedBindings(hiddenCandidates, reader);
            for (SettingsEntryBindings.Check check : checks)
                entryChanged |= ENTRY_BINDINGS.complete(check, reader.read(check.userId), checkedAt);
            hiddenSnapshot = new HiddenSnapshot(targets, checkedAt);
        } catch (Throwable unavailable) {
            // Keep candidates for a later attempt, never retain their old authorization.
            hiddenSnapshot = HiddenSnapshot.EMPTY;
        } finally {
            if (entryChanged || !previous.authorizations.equals(hiddenSnapshot.authorizations))
                dispatchHiddenTargetsChanged();
        }
    }

    static String diagnosticValue(Context context, String key) {
        Context application = remember(context);
        if (application == null || key == null) return "";
        requestAuxiliary(application, key);
        String value = DIAGNOSTIC_VALUES.get(key);
        return value == null ? "" : value;
    }

    /** Invalidating schedules a replacement; it never removes the last verified snapshot. */
    static void invalidateSnapshot() {
        invalidations.incrementAndGet();
        requestRefresh();
    }

    static boolean addSnapshotListener(Context context, Runnable listener) {
        if (context == null || listener == null || Looper.getMainLooper() == null) return false;
        boolean added = LISTENERS.addIfAbsent(listener);
        remember(context);
        if (added && verifiedSnapshot) dispatch(listener);
        requestRefresh();
        return true;
    }

    static void removeSnapshotListener(Runnable listener) {
        if (listener != null) LISTENERS.remove(listener);
    }

    private static String value(Context context, String key) {
        if (ConfigSchema.isRuntimeKey(key)) {
            ConfigSnapshot current=snapshot(context);
            ls.augment.com.StatusBarEditPolicy policy=statusBarPolicy(current);
            return ls.augment.com.StatusBarWorkspaceSpec.effectiveValue(key,policy.effective(key,current.get(key)),policy.effective(ls.augment.com.StatusBarWorkspaceSpec.ROWS,current.get(ls.augment.com.StatusBarWorkspaceSpec.ROWS)));
        }
        return null;
    }

    private static ScheduledExecutorService worker(String name) {
        ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(1, task -> {
            Thread thread = new Thread(task, name); thread.setDaemon(true); return thread;
        });
        executor.setRemoveOnCancelPolicy(true);
        return executor;
    }

    private static synchronized Context remember(Context context) {
        Context previous = applicationContext;
        Context selected = ConfigHostContext.select(previous, context);
        if (selected == null) selected = ConfigHostContext.select(null, currentApplication());
        applicationContext = selected;
        if (selected != null && selected != previous) {
            // A framework-only refresh may already be running. Ensure that its
            // context-less attempt is followed by a real provider read promptly.
            invalidations.incrementAndGet();
        }
        Context application = applicationContext;
        if (application != null && pollingStarted.compareAndSet(false, true)) {
            // Content observers normally deliver changes immediately. This bounded-rate poll
            // recovers early boot and provider restarts without forcing an observer to block.
            CONFIG_WORKER.scheduleWithFixedDelay(FeatureSettings::requestRefresh, 0, 5, TimeUnit.SECONDS);
        }
        return application;
    }

    private static void requestRefresh() {
        if ((applicationContext == null && framework == null) || !refreshPending.compareAndSet(false, true)) return;
        CONFIG_WORKER.execute(FeatureSettings::refreshOnWorker);
    }

    private static void refreshOnWorker() {
        long generation = invalidations.get();
        Context context = applicationContext;
        boolean providerReady = false;
        try {
            refreshRemotePreferences();
            refreshHiddenTargetsOnWorker(context);
            if (context == null) return;
            ConfigSnapshot authoritative = providerSnapshot(context);
            publishSnapshot(authoritative, true);
            providerReady = authoritative != null;
            // An unrelated auxiliary read must not prevent an observer from
            // following a valid configuration that was just published.
            installObserversOnWorker(context);
            try {
                Bundle runtime = ConfigReadRetry.read(() -> context.getContentResolver().call(PROVIDER, "runtime_snapshot", null, null));
                if (runtime != null && runtime.getBoolean("ok", false)) {
                    String hidden = runtime.getString(RemoteConfig.HIDDEN, "");
                    hiddenCandidates = hidden != null && hidden.length() <= 131072 ? hidden : "";
                    runtimeAuthoritative = true;
                    runtimeReadState = "ready";
                } else runtimeReadState = runtime == null ? "reply_missing" : "reply_not_accepted";
            } catch (Throwable unavailable) {
                // Auxiliary state is independent from the verified settings
                // snapshot. Its outage cannot relabel a fresh configuration stale.
                runtimeReadState = ConfigReadRetry.failure(unavailable);
                startupReadFailure("CONFIG_RUNTIME_FAILED",runtimeReadState,unavailable);
            }
            cachedAt = SystemClock.elapsedRealtime();
            if (verifiedSnapshot && handshakeSent.compareAndSet(false, true)) {
                ConfigSnapshot value = cachedSnapshot;
                diagnostic(context, "ls_augment_config_snapshot_handshake_v2",
                        "schema=" + value.schemaVersion + "|revision=" + value.revision);
            }
            if (bootWaited.get()) diagnostic(context, "ls_augment_boot_snapshot_state", bootstrapStatus
                    + ("ready".equals(bootstrapStatus) ? "" : "|constructor_options_may_require_restart"));
        } catch (Throwable unavailable) {
            // Keep the last verified state when a service is temporarily unavailable.
            providerReadState = ConfigReadRetry.failure(unavailable);
            providerReady = false;
            cachedAt = SystemClock.elapsedRealtime();
        } finally {
            // Failed/context-less attempts are rate limited too. Explicit startup retries and
            // observer invalidations still bypass this getter-side freshness check.
            cachedAt = SystemClock.elapsedRealtime();
            // Provider/root failure does not bypass a fresh serial check of retained candidates.
            refreshHiddenTargetsOnWorker(context);
            ConfigSnapshot observed=cachedVerifiedSnapshot;
            String readState="provider="+providerReadState+";mirror="+remoteReadState+";runtime="+runtimeReadState
                    +";context="+(context!=null)+";verified="+(observed!=null)+";revision="+(observed==null?-1:observed.revision)
                    +";checksum="+(observed==null?"":observed.checksum)+";bootstrap="+bootstrapStatus+";observer="+observersInstalled;
            if(!readState.equals(startupReadState)){
                startupReadState=readState;
                try{ls.augment.com.StartupDiagnostics.record("CONFIG_READ_STATE",readState,null);}catch(Throwable ignored){}
            }
            if (context != null) {
                ConfigSnapshot retained = cachedVerifiedSnapshot;
                diagnostic(context, "ls_augment_config_read_state", "provider=" + providerReadState
                        + "|mirror=" + remoteReadState + "|verified=" + (retained != null)
                        + "|runtime=" + runtimeReadState
                        + "|revision=" + (retained == null ? -1 : retained.revision)
                        + "|retained=" + (!providerReady && retained != null));
            }
            // Framework-only bootstrap can fail before any host Context exists.
            // It needs the same short recovery window as later Provider reads.
            if (context != null || (framework != null && !"remote_capability_unavailable".equals(remoteReadState))) {
                boolean readReady = context == null ? "ready".equals(remoteReadState)
                        : providerReady && "ready".equals(runtimeReadState);
                if (readReady) consecutiveReadFailures = 0;
                else {
                    // Normal polling continues every five seconds; a brief
                    // outage also gets three prompt, coalesced recovery checks.
                    int failures = ++consecutiveReadFailures;
                    if (failures <= 3) CONFIG_WORKER.schedule(FeatureSettings::requestRefresh,
                            250L << (failures - 1), TimeUnit.MILLISECONDS);
                }
            }
            refreshPending.set(false);
            if (invalidations.get() != generation) requestRefresh();
        }
    }

    private static void publishSnapshot(ConfigSnapshot next, boolean authoritative) {
        if (next == null) return;
        boolean changed;
        boolean hiddenChanged;
        synchronized (PUBLICATION_LOCK) {
            ConfigSnapshot current = cachedSnapshot;
            if (authoritative) {
                if (mirrorResyncChecksum != null || (verifiedSnapshot && (next.revision < current.revision
                        || (next.revision == current.revision && !next.checksum.equals(current.checksum))))) {
                    // Follow the latest authoritative state if further saves arrive
                    // before the framework has synchronized the reset configuration.
                    mirrorResyncChecksum = next.checksum;
                }
            } else if (mirrorResyncChecksum != null) {
                // Revision alone cannot distinguish a stale pre-reset mirror from
                // the new generation. Require the complete Provider checksum once.
                if (!mirrorResyncChecksum.equals(next.checksum)) return;
                mirrorResyncChecksum = null;
            }
            // Revisions are monotonic; wall-clock timestamps can move backwards.
            // Only compare timestamps when two mirrors carry the same revision.
            if (!authoritative && verifiedSnapshot && (next.revision < current.revision
                    || (next.revision == current.revision && next.updatedAt < current.updatedAt))) return;
            changed = !next.checksum.equals(current.checksum);
            hiddenChanged = !Objects.equals(next.get(HIDE_MASTER), current.get(HIDE_MASTER));
            if (hiddenChanged)
                hiddenSnapshot = HiddenSnapshot.EMPTY;
            cachedSnapshot = next;
            cachedVerifiedSnapshot = next;
            verifiedSnapshot = true;
            VERIFIED_PUBLICATION_READY.countDown();
        }
        // Publication is complete before listeners run. The publication monitor is released.
        if (changed) for (Runnable listener : LISTENERS) dispatch(listener);
        if (hiddenChanged) dispatchHiddenTargetsChanged();
    }

    private static void dispatch(Runnable listener) {
        Looper looper = Looper.getMainLooper();
        if (looper == null) return;
        new Handler(looper).post(() -> {
            if (!LISTENERS.contains(listener)) return;
            try { listener.run(); } catch (Throwable ignored) { }
        });
    }

    private static ConfigSnapshot providerSnapshot(Context context) {
        try {
            Bundle result = ConfigReadRetry.read(() -> context.getContentResolver().call(PROVIDER, "snapshot", null, null));
            if (result == null || !result.getBoolean("ok", false)) {
                providerReadState = result == null ? "reply_missing" : "reply_not_accepted";
                return null;
            }
            ConfigSnapshot.ParseResult parsed = PROVIDER_READER.read(result.getString("snapshot"));
            ConfigSnapshot snapshot = parsed.snapshot;
            if (snapshot == null || snapshot.schemaVersion != result.getInt("schemaVersion", -1)
                    || snapshot.revision != result.getLong("revision", -1L)
                    || snapshot.updatedAt != result.getLong("updatedAt", -1L)
                    || !snapshot.scope.equals(result.getString("scope", ""))
                    || !snapshot.checksum.equals(result.getString("checksum", ""))) {
                providerReadState = snapshot == null ? "snapshot_invalid:"+parsed.error : "metadata_mismatch";
                return null;
            }
            providerReadState = "ready";
            return snapshot;
        } catch (Throwable unavailable) {
            providerReadState = ConfigReadRetry.failure(unavailable);
            startupReadFailure("CONFIG_PROVIDER_FAILED",providerReadState,unavailable);
            return null;
        }
    }

    private static void refreshRemotePreferences() {
        try {
            XposedInterface source = framework;
            if (source == null) { remoteReadState = "framework_unavailable"; return; }
            if (remotePreferences == null) {
                if ((source.getFrameworkProperties() & XposedInterface.PROP_CAP_REMOTE) == 0) {
                    remoteReadState = "remote_capability_unavailable"; return;
                }
                remotePreferences = source.getRemotePreferences(RemoteConfig.GROUP);
                remotePreferences.registerOnSharedPreferenceChangeListener(REMOTE_LISTENER);
            }
            Map<String, ?> values = remotePreferences.getAll();
            Object raw = values.get(RemoteConfig.SNAPSHOT);
            ConfigSnapshot mirror = REMOTE_READER.read(raw instanceof String ? (String) raw : null).snapshot;
            if (mirror != null) publishSnapshot(mirror, false);
            remoteReadState = mirror == null ? "snapshot_missing_or_invalid" : "ready";
            Object hidden = values.get(RemoteConfig.HIDDEN);
            if (!runtimeAuthoritative)
                hiddenCandidates = hidden instanceof String && ((String) hidden).length() <= 131072
                        ? (String) hidden : "";
        } catch (RuntimeException unavailable) {
            remoteReadState = ConfigReadRetry.failure(unavailable);
            startupReadFailure("CONFIG_REMOTE_FAILED",remoteReadState,unavailable);
            SharedPreferences failed = remotePreferences;
            remotePreferences = null;
            if (failed != null) try { failed.unregisterOnSharedPreferenceChangeListener(REMOTE_LISTENER); }
            catch (RuntimeException cleanupUnavailable) { /* The dead connection cannot own a replacement listener. */ }
        } finally {
            BOOTSTRAP_READY.countDown();
        }
    }

    private static void startupReadFailure(String stage,String state,Throwable error){
        long now=SystemClock.elapsedRealtime();
        Long previous=startupReadFailureTimes.get(stage);
        // A successful read must not re-arm an identical error on every poll.
        if(!state.equals(startupReadFailures.get(stage))||previous==null||now-previous>=300_000L){
            startupReadFailures.put(stage,state);startupReadFailureTimes.put(stage,now);
            try{ls.augment.com.StartupDiagnostics.record(stage,state,error);}catch(Throwable ignored){}
        }
    }

    private static void installObserversOnWorker(Context context) {
        if (observersInstalled) return;
        Looper looper = Looper.getMainLooper(); if (looper == null) return;
        ContentObserver observer = new ContentObserver(new Handler(looper)) {
            @Override public void onChange(boolean selfChange) { invalidateSnapshot(); }
        };
        try {
            context.getContentResolver().registerContentObserver(CONFIG_URI, true, observer);
            observersInstalled = true;
        } catch (Throwable error) {
            try { context.getContentResolver().unregisterContentObserver(observer); }
            catch (Throwable cleanup) { if(cleanup!=error)error.addSuppressed(cleanup); }
            startupReadFailure("CONFIG_OBSERVER_FAILED","registration_failed",error);
        }
    }

    private static void requestAuxiliary(Context context, String key) {
        String request = "diagnostic:" + key;
        Long last = AUXILIARY_READ_AT.get(request);
        if (last != null && SystemClock.elapsedRealtime() - last < AUXILIARY_CACHE_MS) return;
        if (AUXILIARY_PENDING.size() >= 512 || AUXILIARY_PENDING.putIfAbsent(request, true) != null) return;
        WRITE_WORKER.execute(() -> {
            try {
                Bundle value = context.getContentResolver().call(PROVIDER, "diagnostic_get", key, null);
                if (value != null) synchronized (DIAGNOSTIC_QUEUE_LOCK) {
                    if (!DIAGNOSTICS.containsKey(key)) cacheValue(DIAGNOSTIC_VALUES, DIAGNOSTICS, key, value.getString("value", ""));
                }
            } catch (Throwable ignored) { }
            finally {
                synchronized (DIAGNOSTIC_QUEUE_LOCK) {
                    cacheValue(AUXILIARY_READ_AT, AUXILIARY_PENDING, request, SystemClock.elapsedRealtime());
                    AUXILIARY_PENDING.remove(request);
                }
            }
        });
    }

    /** Caller holds DIAGNOSTIC_QUEUE_LOCK. Pending delivery/read identities must not be evicted. */
    private static <T> void cacheValue(Map<String,T> cache, Map<String,?> pending, String key, T value) {
        if (!cache.containsKey(key) && cache.size() >= MAX_DIAGNOSTIC_CACHE) {
            for (String old : cache.keySet()) {
                if (!pending.containsKey(old)) { cache.remove(old); break; }
            }
            if (cache.size() >= MAX_DIAGNOSTIC_CACHE) return;
        }
        cache.put(key, value);
    }

    private static void scheduleWrites() {
        scheduleWrites(250L);
    }

    private static void scheduleWrites(long delay) {
        synchronized (WRITE_SCHEDULE_LOCK) {
            long due = SystemClock.elapsedRealtime() + delay;
            if (writeFuture != null && writeScheduledAt <= due) return;
            // A fresh route/value can advance a sleeping retry, never delay it.
            if (writeFuture != null) writeFuture.cancel(false);
            long generation = ++writeScheduleGeneration;
            writeScheduledAt = due;
            writeFuture = WRITE_WORKER.schedule(() -> {
                synchronized (WRITE_SCHEDULE_LOCK) {
                    // cancel(false) may race a task already taken by the worker.
                    if (generation != writeScheduleGeneration) return;
                    writeFuture = null;
                }
                drainWrites();
            }, delay, TimeUnit.MILLISECONDS);
        }
    }

    private static long diagnosticWriteDelay(PendingDiagnostic pending, long now) {
        long retryDelay = pending.retryAt - now;
        long expiryDelay = DIAGNOSTIC_RETRY_WINDOW_MS - (now - pending.retryStartedElapsed);
        return Math.max(250L, Math.min(retryDelay, expiryDelay));
    }

    private static void scheduleNextWrites() {
        long delay = ROUTES.isEmpty() ? Long.MAX_VALUE : 250L;
        long now = SystemClock.elapsedRealtime();
        for (PendingDiagnostic pending : DIAGNOSTICS.values())
            delay = Math.min(delay, diagnosticWriteDelay(pending, now));
        if (delay != Long.MAX_VALUE) scheduleWrites(delay);
    }

    private static void scheduleHomeReadinessWrite() {
        boolean eligible = false;
        long now = SystemClock.elapsedRealtime();
        for (PendingDiagnostic value : DIAGNOSTICS.values()) {
            if (value.homeReadiness && value.retryAt <= now) { eligible = true; break; }
        }
        if (eligible && homeReadinessWritePending.compareAndSet(false, true))
            WRITE_WORKER.schedule(FeatureSettings::drainHomeReadiness, 16L, TimeUnit.MILLISECONDS);
    }

    private static void drainHomeReadiness() {
        try {
            int count = 0;
            for (Map.Entry<String, PendingDiagnostic> entry : DIAGNOSTICS.entrySet()) {
                PendingDiagnostic value = entry.getValue();
                if (!value.homeReadiness) continue;
                long now = SystemClock.elapsedRealtime();
                if (now - value.retryStartedElapsed >= DIAGNOSTIC_RETRY_WINDOW_MS) {
                    expireDiagnostic(entry.getKey(), value); continue;
                }
                if (value.retryAt > now) continue;
                if (++count > 8) break;
                writePendingDiagnostic(entry.getKey(), value);
            }
        } finally {
            homeReadinessWritePending.set(false);
            // Failures retain retryAt and use the ordinary bounded retry cadence.
            // Only newly eligible observations need another prompt delivery.
            scheduleHomeReadinessWrite();
        }
    }

    private static void drainWrites() {
        try {
            for (int i = 0; i < 64; i++) {
                PendingCall call = ROUTES.poll(); if (call == null) break;
                try { call.context.getContentResolver().call(PROVIDER, "rapid_route", null, call.extras); }
                catch (Throwable ignored) { }
            }
            int count = 0;
            for (Map.Entry<String,PendingDiagnostic> entry : DIAGNOSTICS.entrySet()) {
                PendingDiagnostic value = entry.getValue();
                long now = SystemClock.elapsedRealtime();
                if (now - value.retryStartedElapsed >= DIAGNOSTIC_RETRY_WINDOW_MS) {
                    expireDiagnostic(entry.getKey(), value); continue;
                }
                if(value.retryAt>SystemClock.elapsedRealtime())continue;
                if (++count > 64) break;
                writePendingDiagnostic(entry.getKey(), value);
            }
        } finally {
            scheduleNextWrites();
        }
    }

    private static void writePendingDiagnostic(String key, PendingDiagnostic value) {
        if (writeDiagnostic(key, value)) { DIAGNOSTICS.remove(key, value); return; }
        synchronized (DIAGNOSTIC_QUEUE_LOCK) {
            PendingDiagnostic replacement = DIAGNOSTICS.get(key);
            // A newer draw may arrive while this worker is blocked in IPC.
            // Carry the real failed attempt forward without discarding that draw.
            if (replacement != null && replacement != value) {
                replacement.retryAt = Math.max(replacement.retryAt, value.retryAt);
                replacement.failures = Math.max(replacement.failures, value.failures);
                replacement.retryStartedElapsed = Math.min(replacement.retryStartedElapsed, value.retryStartedElapsed);
            }
        }
    }

    private static void expireDiagnostic(String key, PendingDiagnostic pending) {
        synchronized (DIAGNOSTIC_QUEUE_LOCK) {
            if (!DIAGNOSTICS.remove(key, pending)) return;
            DIAGNOSTIC_VALUES.remove(key, pending.value);
            diagnosticExpired.incrementAndGet();
            diagnosticLastDropKey = safeDiagnosticKey(key);
            diagnosticLastDropReason = "retry_window_expired"; diagnosticLastDropAt = System.currentTimeMillis();
        }
    }

    private static boolean writeDiagnostic(String key, PendingDiagnostic pending) {
        try {
            Bundle extras = new Bundle(); extras.putString("value", pending.value);
            extras.putString("moduleVersion",ls.augment.com.BuildConfig.VERSION_NAME);
            extras.putString("process",diagnosticProcess());
            extras.putLong("observedAt",pending.observedAt);extras.putLong("observedElapsed",pending.observedElapsed);
            Bundle result = pending.context.getContentResolver().call(PROVIDER, "diagnostic", key, extras);
            if (result != null && result.getBoolean("ok", false)) {
                diagnosticAccepted.incrementAndGet(); diagnosticLastAcceptedAt = System.currentTimeMillis();
                if(!startupWriteFailureState.isEmpty()){
                    try{ls.augment.com.StartupDiagnostics.record("LAST_VALUE_DELIVERY_ACCEPTED","key="+safeDiagnosticKey(key)
                            +";previous="+startupWriteFailureState+";otherPending="+DIAGNOSTICS.size(),null);}catch(Throwable ignored){}
                    startupWriteFailureState="";
                }
                return true;
            }
            diagnosticLastFailureType = result == null ? "reply_missing" : "reply_not_accepted";
            String reason = result == null ? "reply_missing" : result.getString("reason", "unspecified");
            diagnosticLastFailureReason = diagnosticReason(reason);
            diagnosticLastFailureKey = safeDiagnosticKey(key);
            diagnosticLastFailureAt = System.currentTimeMillis();
            startupWriteFailure(key,diagnosticLastFailureType+";reason="+diagnosticLastFailureReason,null);
            // Only the explicit permanent rejection contract may end a retry.
            // Old providers and unknown replies remain retryable, never accepted.
            if (result != null && "invalid".equals(reason) && !result.getBoolean("retryable", true)) {
                synchronized (DIAGNOSTIC_QUEUE_LOCK) {
                    if (DIAGNOSTICS.remove(key, pending)) {
                        DIAGNOSTIC_VALUES.remove(key, pending.value);
                        diagnosticRejected.incrementAndGet();
                        diagnosticLastDropReason = "provider_terminal";
                        diagnosticLastDropKey = safeDiagnosticKey(key);
                        diagnosticLastDropAt = System.currentTimeMillis();
                    }
                }
                return true; // Resolved by an explicit rejection, not an acceptance.
            }
            long retry=result==null?0:result.getLong("retryAfterMs",0);
            if(retry>0)pending.retryAt=SystemClock.elapsedRealtime()+Math.min(30_000,retry);
        } catch (Throwable unavailable) {
            diagnosticLastFailureType = ConfigReadRetry.failure(unavailable);
            diagnosticLastFailureReason = "provider_unavailable";
            diagnosticLastFailureKey = safeDiagnosticKey(key);
            startupWriteFailure(key,diagnosticLastFailureType,unavailable);
        }
        diagnosticLastFailureAt = System.currentTimeMillis(); diagnosticRetries.incrementAndGet();
        int failures = ++pending.failures;
        if(pending.retryAt<=SystemClock.elapsedRealtime())
            pending.retryAt=SystemClock.elapsedRealtime()+Math.min(30_000L,500L<<Math.min(6,failures-1));
        return false;
    }

    private static void startupWriteFailure(String key,String reason,Throwable error){
        if(!reason.equals(startupWriteFailureState)){
            startupWriteFailureState=reason;
            try{ls.augment.com.StartupDiagnostics.record("LAST_VALUE_DELIVERY_FAILED","key="+safeDiagnosticKey(key)+";reason="+reason,error);}
            catch(Throwable ignored){}
        }
    }

    private static String diagnosticReason(String reason) {
        return "invalid".equals(reason) || "throttled".equals(reason) || "full".equals(reason)
                || "reply_missing".equals(reason) ? reason : "unspecified";
    }
    private static String safeDiagnosticKey(String key) {
        return key != null && key.length() <= 151 && key.matches("ls_augment_[A-Za-z0-9_.]+")
                ? key : "invalid_key";
    }

    private static final class PendingDiagnostic {
        final Context context; final String value; volatile int failures;
        final long observedAt=System.currentTimeMillis(),observedElapsed=SystemClock.elapsedRealtime();
        final boolean homeReadiness;
        volatile long retryStartedElapsed = observedElapsed;
        volatile long retryAt;
        PendingDiagnostic(Context context, String value, boolean homeReadiness) {
            this.context = context; this.value = value; this.homeReadiness = homeReadiness;
        }
    }
    private static final class PendingCall {
        final Context context; final Bundle extras;
        PendingCall(Context context, Bundle extras) { this.context = context; this.extras = extras; }
    }

    static Context from(Object owner) {
        if (owner instanceof Context) return (Context) owner;
        if (owner != null) {
            String[] fields = {"mContext", "context", "mApplication", "this$0", "mActivity"};
            for (String field : fields) {
                Object value = field(owner, field);
                if (value instanceof Context) return (Context) value;
                Context nested = viaGetContext(value);
                if (nested != null) return nested;
            }
            Context direct = viaGetContext(owner);
            if (direct != null) return direct;
        }
        return currentApplication();
    }

    static Object field(Object owner, String name) {
        if (owner == null) return null;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (NoSuchFieldException ignored) {
                // Continue through the vendor class hierarchy.
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static Context viaGetContext(Object owner) {
        if (owner == null) return null;
        try {
            Method method = owner.getClass().getMethod("getContext");
            Object value = method.invoke(owner);
            return value instanceof Context ? (Context) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    private static Context currentApplication() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method method = activityThread.getDeclaredMethod("currentApplication");
            method.setAccessible(true);
            Object value = method.invoke(null);
            if (value instanceof Application) return (Application) value;
            // An app process can reach this during bindApplication, before its
            // Application exists. A system Context would attribute its provider
            // reads to package "android" even though the caller has the app UID.
            // Wait for the real app context; only the system UID may use this fallback.
            if (android.os.Process.myUid() != android.os.Process.SYSTEM_UID) return null;
            Method currentThread = activityThread.getDeclaredMethod("currentActivityThread");
            currentThread.setAccessible(true);
            Object thread = currentThread.invoke(null);
            if (thread == null) return null;
            Method systemContext = activityThread.getDeclaredMethod("getSystemContext");
            systemContext.setAccessible(true);
            value = systemContext.invoke(thread);
            return value instanceof Context ? (Context) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
