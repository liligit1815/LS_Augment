package ls.augment.com.hook;

import android.app.Application;
import android.database.ContentObserver;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;

import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Shared, fail-closed access to the KernelSU mirrored feature settings. */
final class FeatureSettings {
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    private static final Uri CONFIG_URI = Uri.parse("content://ls.augment.com.config/config");
    private static final long CACHE_MS = 1000L;
    private static final Object SNAPSHOT_LOCK = new Object();
    private static volatile ConfigSnapshot cachedSnapshot;
    private static volatile long cachedAt;
    private static volatile boolean observersInstalled;
    private static volatile boolean handshakeSent;

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

    static void recordRapidRoute(Context context, String sessionId, String phase,
            int upperCode, int systemCode) {
        if (context == null) return;
        try {
            Bundle extras = new Bundle();
            extras.putString("sessionId", sessionId);
            extras.putString("phase", phase);
            extras.putInt("upper", upperCode);
            extras.putInt("system", systemCode);
            context.getContentResolver().call(PROVIDER, "rapid_route", null, extras);
        } catch (Throwable ignored) {
            // Missing evidence keeps testing locked; never fall back to numeric equality.
        }
    }

    static void diagnostic(Context context, String key, String value) {
        HookTelemetry.event(key+"="+value);
        if (context == null) return;
        try {
            Bundle extras = new Bundle();
            extras.putString("value", value == null ? "" : value);
            Bundle result = context.getContentResolver().call(PROVIDER, "diagnostic", key, extras);
            if (result != null && result.getBoolean("ok", false)) return;
        } catch (Throwable ignored) {
            // Settings.Global remains a privileged-process fallback.
        }
        try {
            Settings.Global.putString(context.getContentResolver(), key, value == null ? "" : value);
        } catch (Throwable ignored) {
            // A diagnostic write must never control or crash a feature.
        }
    }

    static float decimal(Context context, String key, float fallback, float min, float max) {
        String value = text(context, key, String.valueOf(fallback));
        try {
            float parsed = Float.parseFloat(value);
            return Math.max(min, Math.min(max, parsed));
        } catch (Throwable ignored) { return fallback; }
    }

    static ConfigSnapshot snapshot(Context context) {
        if (context == null) return ConfigSnapshot.safeDefaults();
        installObservers(context);
        long now = SystemClock.elapsedRealtime();
        ConfigSnapshot value = cachedSnapshot;
        if (value != null && now - cachedAt < CACHE_MS) return value;
        boolean verified = false;
        synchronized (SNAPSHOT_LOCK) {
            value = cachedSnapshot;
            if (value != null && now - cachedAt < CACHE_MS) return value;
            value = providerSnapshot(context);
            if (value != null) verified = true;
            if (value == null) {
                value = globalSnapshot(context);
                if (value != null) verified = true;
            }
            if (value == null) value = ConfigSnapshot.safeDefaults();
            cachedSnapshot = value;
            cachedAt = now;
        }
        if (verified) publishHandshake(context, value);
        return value;
    }

    static String diagnosticValue(Context context, String key) {
        if (context == null) return "";
        try {
            Bundle value = context.getContentResolver().call(PROVIDER, "diagnostic_get", key, null);
            if (value != null) return value.getString("value", "");
        } catch (Throwable ignored) { }
        return "";
    }

    private static void publishHandshake(Context context, ConfigSnapshot snapshot) {
        if (handshakeSent || context == null || snapshot == null) return;
        synchronized (FeatureSettings.class) {
            if (handshakeSent) return;
            handshakeSent = true;
        }
        Context application = context.getApplicationContext();
        Thread thread = new Thread(() -> diagnostic(application,
                "ls_augment_config_snapshot_handshake_v1",
                "schema=" + snapshot.schemaVersion + "|revision=" + snapshot.revision),
                "LSA-ConfigHandshake");
        thread.setDaemon(true);
        thread.start();
    }

    static void invalidateSnapshot() {
        cachedAt = 0L;
        cachedSnapshot = null;
    }

    static boolean addSnapshotListener(Context context, Runnable listener) {
        if (context == null || listener == null) return false;
        ContentObserver observer = null;
        try {
            Looper looper = Looper.getMainLooper();
            if (looper == null) looper = Looper.myLooper();
            if (looper == null) return false;
            observer = new ContentObserver(new Handler(looper)) {
                @Override public void onChange(boolean selfChange) {
                    invalidateSnapshot();
                    try { listener.run(); } catch (Throwable ignored) { }
                }
            };
            context.getContentResolver().registerContentObserver(CONFIG_URI, true, observer);
            context.getContentResolver().registerContentObserver(
                    Settings.Global.getUriFor(ConfigSchema.GLOBAL_SNAPSHOT), false, observer);
            return true;
        } catch (Throwable ignored) {
            if (observer != null) {
                try { context.getContentResolver().unregisterContentObserver(observer); }
                catch (Throwable ignoredAgain) { }
            }
            return false;
        }
    }

    private static String value(Context context, String key) {
        if (context == null) return null;
        if (ConfigSchema.isRuntimeKey(key)) return snapshot(context).get(key);
        // Per-icon status-bar scale keys belong to the deferred H-02/H-06
        // redesign. Preserve their existing legacy behavior without allowing
        // them to contaminate a formal configuration snapshot.
        if (key != null && key.startsWith("scale:")) {
            try { return Settings.Global.getString(context.getContentResolver(), key); }
            catch (Throwable ignored) { return null; }
        }
        return null;
    }

    private static ConfigSnapshot providerSnapshot(Context context) {
        try {
            Bundle result = context.getContentResolver().call(PROVIDER, "snapshot", null, null);
            if (result == null || !result.getBoolean("ok", false)) return null;
            ConfigSnapshot snapshot = ConfigSnapshot.parse(result.getString("snapshot"));
            if (snapshot == null
                    || snapshot.schemaVersion != result.getInt("schemaVersion", -1)
                    || snapshot.revision != result.getLong("revision", -1L)
                    || snapshot.updatedAt != result.getLong("updatedAt", -1L)
                    || !snapshot.scope.equals(result.getString("scope", ""))
                    || !snapshot.checksum.equals(result.getString("checksum", ""))) {
                return null;
            }
            return snapshot;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static ConfigSnapshot globalSnapshot(Context context) {
        try {
            return ConfigSnapshot.parse(Settings.Global.getString(
                    context.getContentResolver(), ConfigSchema.GLOBAL_SNAPSHOT));
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void installObservers(Context context) {
        if (observersInstalled || context == null) return;
        synchronized (SNAPSHOT_LOCK) {
            if (observersInstalled) return;
            try {
                Looper looper = Looper.getMainLooper();
                if (looper == null) return;
                ContentObserver observer = new ContentObserver(new Handler(looper)) {
                    @Override public void onChange(boolean selfChange) {
                        invalidateSnapshot();
                    }
                };
                context.getContentResolver().registerContentObserver(
                        CONFIG_URI, true, observer);
                context.getContentResolver().registerContentObserver(
                        Settings.Global.getUriFor(ConfigSchema.GLOBAL_SNAPSHOT), false, observer);
                observersInstalled = true;
            } catch (Throwable ignored) {
                // The bounded cache still refreshes without an observer.
            }
        }
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
