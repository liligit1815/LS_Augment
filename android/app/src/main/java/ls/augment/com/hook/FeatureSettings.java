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
import ls.augment.com.BootConfigMirror;
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
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/** Cached, fail-closed access to private configuration and official remote preferences. */
final class FeatureSettings {
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    private static final Uri CONFIG_URI = Uri.parse("content://ls.augment.com.config/config");
    private static final long CACHE_MS = 1000L;
    // A hook can hold Power/AMS/WM locks. Readers never enter the publication lock or do IPC.
    private static final Object PUBLICATION_LOCK = new Object();
    // Guarded by PUBLICATION_LOCK. A Provider rollback identifies a new private
    // configuration generation; stale mirrors stay quarantined until resynced.
    private static String mirrorResyncChecksum;
    private static volatile ConfigSnapshot cachedSnapshot = ConfigSnapshot.safeDefaults();
    private static volatile long cachedAt;
    private static volatile Context applicationContext;
    private static volatile boolean verifiedSnapshot;
    private static volatile boolean observersInstalled;
    private static final AtomicBoolean handshakeSent = new AtomicBoolean();
    private static volatile XposedInterface framework;
    private static SharedPreferences remotePreferences;
    private static final CountDownLatch BOOTSTRAP_READY = new CountDownLatch(1);
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
    private static final AtomicBoolean writePending = new AtomicBoolean();
    private static final AtomicLong invalidations = new AtomicLong();
    private static final CopyOnWriteArrayList<Runnable> LISTENERS = new CopyOnWriteArrayList<>();
    private static final ConcurrentHashMap<String,String> DIAGNOSTIC_VALUES = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String,Long> AUXILIARY_READ_AT = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String,Boolean> AUXILIARY_PENDING = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String,PendingDiagnostic> DIAGNOSTICS = new ConcurrentHashMap<>();
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
    static final String FAN_UNLOCK_MAX = ConfigSchema.FAN_UNLOCK_MAX;
    static final String FAN_TARGET_RPM = ConfigSchema.FAN_TARGET_RPM;
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
        HookTelemetry.event(key + "=" + value);
        if (key == null) return;
        Context application = remember(context);
        if (application == null) return;
        String text = value == null ? "" : value;
        String previous = DIAGNOSTIC_VALUES.put(key, text);
        if (text.equals(previous)) return;
        if (DIAGNOSTICS.size() >= 512 && !DIAGNOSTICS.containsKey(key)) return;
        DIAGNOSTICS.put(key, new PendingDiagnostic(application, text));
        scheduleWrites();
    }

    static float decimal(Context context, String key, float fallback, float min, float max) {
        String value = text(context, key, String.valueOf(fallback));
        try { return Math.max(min, Math.min(max, Float.parseFloat(value))); }
        catch (Throwable ignored) { return fallback; }
    }

    /** Always returns immediately, including while either configuration service is blocked. */
    static ConfigSnapshot snapshot(Context context) {
        remember(context);
        if (SystemClock.elapsedRealtime() - cachedAt >= CACHE_MS || !verifiedSnapshot) requestRefresh();
        return cachedSnapshot;
    }

    /** Distinguishes the startup placeholder from an actual saved off configuration. */
    static boolean hasVerifiedSnapshot(Context context) {
        snapshot(context);
        return verifiedSnapshot;
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
        // AudioService reads its maximum-volume properties while constructing,
        // before the provider and framework preferences are reliably available.
        // The root-owned boot copy is local and checksummed, so it can seed this
        // one-time startup snapshot without entering a provider/Binder call.
        ConfigSnapshot boot = BootConfigMirror.read();
        if (boot != null) publishSnapshot(boot, false);
        if (verifiedSnapshot) { bootstrapStatus = "ready"; return; }
        try {
            boolean finished = BOOTSTRAP_READY.await(250L, TimeUnit.MILLISECONDS);
            bootstrapStatus = verifiedSnapshot ? "ready" : finished ? "unavailable" : "timeout";
        } catch (InterruptedException interrupted) {
            bootstrapStatus = "interrupted";
            Thread.currentThread().interrupt();
        }
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
        if (ConfigSchema.isRuntimeKey(key)) return snapshot(context).get(key);
        return null;
    }

    private static ScheduledExecutorService worker(String name) {
        return Executors.newSingleThreadScheduledExecutor(task -> {
            Thread thread = new Thread(task, name); thread.setDaemon(true); return thread;
        });
    }

    private static Context remember(Context context) {
        if (context != null) {
            try { Context app = context.getApplicationContext(); applicationContext = app == null ? context : app; }
            catch (RuntimeException unavailable) { applicationContext = context; }
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
        try {
            refreshRemotePreferences();
            refreshHiddenTargetsOnWorker(context);
            if (context == null) return;
            publishSnapshot(providerSnapshot(context), true);
            Bundle runtime = context.getContentResolver().call(PROVIDER, "runtime_snapshot", null, null);
            if (runtime != null && runtime.getBoolean("ok", false)) {
                String hidden = runtime.getString(RemoteConfig.HIDDEN, "");
                hiddenCandidates = hidden != null && hidden.length() <= 131072 ? hidden : "";
                runtimeAuthoritative = true;
            }
            installObserversOnWorker(context);
            cachedAt = SystemClock.elapsedRealtime();
            if (verifiedSnapshot && handshakeSent.compareAndSet(false, true)) {
                ConfigSnapshot value = cachedSnapshot;
                diagnostic(context, "ls_augment_config_snapshot_handshake_v2",
                        "schema=" + value.schemaVersion + "|revision=" + value.revision);
            }
            if (bootWaited.get()) diagnostic(context, "ls_augment_boot_snapshot_state", bootstrapStatus
                    + ("ready".equals(bootstrapStatus) ? "" : "|constructor_options_may_require_restart"));
        } catch (Throwable ignored) {
            // Keep the last verified state when a service is temporarily unavailable.
            cachedAt = SystemClock.elapsedRealtime();
        } finally {
            // Provider/root failure does not bypass a fresh serial check of retained candidates.
            refreshHiddenTargetsOnWorker(context);
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
            verifiedSnapshot = true;
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
            Bundle result = context.getContentResolver().call(PROVIDER, "snapshot", null, null);
            if (result == null || !result.getBoolean("ok", false)) return null;
            ConfigSnapshot snapshot = ConfigSnapshot.parse(result.getString("snapshot"));
            if (snapshot == null || snapshot.schemaVersion != result.getInt("schemaVersion", -1)
                    || snapshot.revision != result.getLong("revision", -1L)
                    || snapshot.updatedAt != result.getLong("updatedAt", -1L)
                    || !snapshot.scope.equals(result.getString("scope", ""))
                    || !snapshot.checksum.equals(result.getString("checksum", ""))) return null;
            return snapshot;
        } catch (Throwable ignored) { return null; }
    }

    private static void refreshRemotePreferences() {
        try {
            XposedInterface source = framework;
            if (source == null) return;
            if (remotePreferences == null) {
                if ((source.getFrameworkProperties() & XposedInterface.PROP_CAP_REMOTE) == 0) return;
                remotePreferences = source.getRemotePreferences(RemoteConfig.GROUP);
                remotePreferences.registerOnSharedPreferenceChangeListener(REMOTE_LISTENER);
            }
            Map<String, ?> values = remotePreferences.getAll();
            Object raw = values.get(RemoteConfig.SNAPSHOT);
            if (raw instanceof String) publishSnapshot(ConfigSnapshot.parse((String) raw), false);
            Object hidden = values.get(RemoteConfig.HIDDEN);
            if (!runtimeAuthoritative)
                hiddenCandidates = hidden instanceof String && ((String) hidden).length() <= 131072
                        ? (String) hidden : "";
        } catch (RuntimeException unavailable) {
            remotePreferences = null;
        } finally {
            BOOTSTRAP_READY.countDown();
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
        } catch (Throwable ignored) {
            try { context.getContentResolver().unregisterContentObserver(observer); } catch (Throwable cleanup) { }
        }
    }

    private static void requestAuxiliary(Context context, String key) {
        String request = "diagnostic:" + key;
        Long last = AUXILIARY_READ_AT.get(request);
        if (last != null && SystemClock.elapsedRealtime() - last < CACHE_MS) return;
        if (AUXILIARY_PENDING.size() >= 512 || AUXILIARY_PENDING.putIfAbsent(request, true) != null) return;
        WRITE_WORKER.execute(() -> {
            try {
                Bundle value = context.getContentResolver().call(PROVIDER, "diagnostic_get", key, null);
                if (value != null) DIAGNOSTIC_VALUES.put(key, value.getString("value", ""));
            } catch (Throwable ignored) { }
            finally { AUXILIARY_READ_AT.put(request, SystemClock.elapsedRealtime()); AUXILIARY_PENDING.remove(request); }
        });
    }

    private static void scheduleWrites() {
        // Keep route calls responsive while individual diagnostics wait out a quota window.
        if (writePending.compareAndSet(false, true)) WRITE_WORKER.schedule(FeatureSettings::drainWrites, 250, TimeUnit.MILLISECONDS);
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
                if(value.retryAt>SystemClock.elapsedRealtime())continue;
                if (++count > 64) break;
                if (writeDiagnostic(entry.getKey(), value)) DIAGNOSTICS.remove(entry.getKey(), value);
                else if (value.retryAt<=SystemClock.elapsedRealtime()
                        && ++value.failures >= 3 && DIAGNOSTICS.remove(entry.getKey(), value)) {
                    // A boot-time Provider miss must not permanently deduplicate
                    // an installation witness that was never delivered. Only
                    // forget this failed value; a newer queued value owns its cache.
                    DIAGNOSTIC_VALUES.remove(entry.getKey(), value.value);
                }
            }
        } finally {
            writePending.set(false);
            if (!ROUTES.isEmpty() || !DIAGNOSTICS.isEmpty()) scheduleWrites();
        }
    }

    private static boolean writeDiagnostic(String key, PendingDiagnostic pending) {
        try {
            Bundle extras = new Bundle(); extras.putString("value", pending.value);
            Bundle result = pending.context.getContentResolver().call(PROVIDER, "diagnostic", key, extras);
            if (result != null && result.getBoolean("ok", false)) return true;
            long retry=result==null?0:result.getLong("retryAfterMs",0);
            if(retry>0)pending.retryAt=SystemClock.elapsedRealtime()+Math.min(30_000,retry);
        } catch (Throwable ignored) { }
        return false;
    }

    private static final class PendingDiagnostic {
        final Context context; final String value; int failures;
        volatile long retryAt;
        PendingDiagnostic(Context context, String value) { this.context = context; this.value = value; }
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
