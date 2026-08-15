package ls.augment.com.hook;

import android.app.Application;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Shared, fail-closed access to the KernelSU mirrored feature settings. */
final class FeatureSettings {
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    static final String APP_MASTER = "ls_augment_app_master";
    static final String HIDE_MASTER = "ls_augment_hide_master";
    static final String GAME_MASTER = "ls_augment_game_master";
    static final String SYSTEMUI_MASTER = "ls_augment_systemui_master";
    static final String SHOULDER_ENABLED = "ls_augment_shoulder_enabled";
    static final String SHOULDER_DIAGNOSTICS = "ls_augment_shoulder_diagnostics";
    static final String COMBO_SPEED_ENABLED = "ls_augment_combo_speed_enabled";
    static final String COMBO_SPEED_RATE = "ls_augment_combo_speed_rate";
    static final String DOUBLE_ANY_APP = "ls_augment_doubleapp_any_app";
    static final String DOUBLE_LOW_MEMORY = "ls_augment_doubleapp_low_memory";

    static final String STATUSBAR_DUAL_LEFT = "ls_augment_statusbar_dual_left";
    static final String STATUSBAR_DUAL_RIGHT = "ls_augment_statusbar_dual_right";
    static final String STATUSBAR_CLOCK_ACROSS = "ls_augment_statusbar_clock_across";
    static final String STATUSBAR_HEIGHT_DP = "ls_augment_statusbar_height_dp";
    static final String STATUSBAR_LEFT_MARGIN_DP = "ls_augment_statusbar_left_margin_dp";
    static final String STATUSBAR_RIGHT_MARGIN_DP = "ls_augment_statusbar_right_margin_dp";
    static final String STATUSBAR_TOP_MARGIN_DP = "ls_augment_statusbar_top_margin_dp";
    static final String STATUSBAR_BOTTOM_MARGIN_DP = "ls_augment_statusbar_bottom_margin_dp";
    static final String STATUSBAR_FREE_POSITION = "ls_augment_statusbar_free_position";
    static final String STATUSBAR_LAYOUT_SPEC = "ls_augment_statusbar_layout_spec";
    static final String STATUSBAR_CLOCK_CUSTOM = "ls_augment_statusbar_clock_custom";
    static final String STATUSBAR_CLOCK_PATTERN = "ls_augment_statusbar_clock_pattern";
    static final String STATUSBAR_CLOCK_PATTERN_SECOND =
            "ls_augment_statusbar_clock_pattern_second";
    static final String STATUSBAR_CLOCK_24H = "ls_augment_statusbar_clock_24h";
    static final String STATUSBAR_CLOCK_SECONDS = "ls_augment_statusbar_clock_seconds";
    static final String STATUSBAR_CLOCK_PERIOD = "ls_augment_statusbar_clock_period";
    static final String STATUSBAR_CLOCK_WEEK = "ls_augment_statusbar_clock_week";
    static final String STATUSBAR_CLOCK_FONT_FAMILY =
            "ls_augment_statusbar_clock_font_family";
    static final String STATUSBAR_CLOCK_SIZE_SP = "ls_augment_statusbar_clock_size_sp";
    static final String STATUSBAR_CLOCK_WEIGHT = "ls_augment_statusbar_clock_weight";
    static final String STATUSBAR_CLOCK_LETTER_SPACING =
            "ls_augment_statusbar_clock_letter_spacing";
    static final String STATUSBAR_CLOCK_LINE_SPACING_DP =
            "ls_augment_statusbar_clock_line_spacing_dp";
    static final String STATUSBAR_CLOCK_TEXT_ALIGN =
            "ls_augment_statusbar_clock_text_align";
    static final String STATUSBAR_CLOCK_WIDTH_DP = "ls_augment_statusbar_clock_width_dp";
    static final String STATUSBAR_NET_SPEED = "ls_augment_statusbar_net_speed";
    static final String STATUSBAR_THERMAL = "ls_augment_statusbar_thermal";
    static final String STATUSBAR_BATTERY_POWER = "ls_augment_statusbar_battery_power";
    static final String STATUSBAR_NOTIFICATION_MAX = "ls_augment_statusbar_notification_max";

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
            STATUSBAR_CLOCK_WIDTH_DP, STATUSBAR_NET_SPEED, STATUSBAR_THERMAL,
            STATUSBAR_BATTERY_POWER, STATUSBAR_NOTIFICATION_MAX
    };
    static final String BEAUTIFY_COMPAT = "ls_augment_beautify_compat";
    static final String BEAUTIFY_UNLIMITED_TRIAL = "ls_augment_beautify_unlimited_trial";
    static final String BEAUTIFY_ACTIVE = "ls_augment_beautify_active";
    static final String BEAUTIFY_INSTALLED = "ls_augment_beautify_installed";
    static final String BEAUTIFY_ADAPTER_INSTALLED = "ls_augment_beautify_adapter_installed";
    static final String BEAUTIFY_LAST_HIT = "ls_augment_beautify_last_hit";
    static final String BEAUTIFY_LAST_ERROR = "ls_augment_beautify_last_error";

    static final String SUPER_MIRROR_LOW_MODE =
            "ls_augment_super_mirror_low_mode";
    static final String SUPER_MIRROR_DIABLO_COEXIST =
            "ls_augment_super_mirror_diablo_coexist";
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
        if (context == null) return fallback;
        try {
            String raw = providerValue(context, key);
            if (raw == null) raw = Settings.Global.getString(context.getContentResolver(), key);
            if (raw == null || raw.isEmpty() || "null".equals(raw)) return fallback;
            return "1".equals(raw) || "true".equalsIgnoreCase(raw)
                    || "yes".equalsIgnoreCase(raw) || "on".equalsIgnoreCase(raw);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    static int integer(Context context, String key, int fallback, int min, int max) {
        if (context == null) return fallback;
        try {
            String raw = providerValue(context, key);
            if (raw == null) raw = Settings.Global.getString(context.getContentResolver(), key);
            if (raw == null || raw.isEmpty() || "null".equals(raw)) return fallback;
            int value = Integer.parseInt(raw.trim());
            return Math.max(min, Math.min(max, value));
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    static String text(Context context, String key, String fallback) {
        if (context == null) return fallback;
        try {
            String raw = providerValue(context, key);
            if (raw == null) raw = Settings.Global.getString(context.getContentResolver(), key);
            return raw == null || "null".equals(raw) ? fallback : raw;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    static void diagnostic(Context context, String key, String value) {
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

    private static String providerValue(Context context, String key) {
        try {
            Bundle result = context.getContentResolver().call(PROVIDER, "get", key, null);
            return result == null || !result.containsKey("value") ? null : result.getString("value");
        } catch (Throwable ignored) { return null; }
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
            return value instanceof Application ? (Application) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
