package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/** APK-private authoritative configuration plus best-effort Settings.Global mirrors. */
final class AppConfig {
    private static final String PRIVATE_INITIALIZED = "private_initialized_v2";
    private static final String RUNTIME_INITIALIZED = "runtime_initialized_v2";
    static final String PROVIDER_AUTHORITY = "ls.augment.com.config";
    static final String PREFS = "ls_augment_config_v2";
    static final String DIAGNOSTICS = "ls_augment_diagnostics_v2";

    static final String HIDE_MASTER = "ls_augment_hide_master";
    static final String HIDE_TARGETS = "ls_augment_hide_targets_v2";
    static final String HIDDEN_MIRROR = "ls_augment_hidden_targets";
    static final String TILE_STATE = "ls_augment_tile_state";
    static final String TILE_ENABLED = "ls_augment_tile_enabled";
    static final String TILE_LABEL = "ls_augment_tile_label";
    static final String TILE_DESCRIPTION = "ls_augment_tile_description";

    static final String RECENTS_ENABLED = "ls_augment_recents_enabled";
    static final String RECENTS_COMPRESSION = "ls_augment_recents_compression";
    static final String RECENTS_FRONT_OVERLAP = "ls_augment_recents_front_overlap";
    static final String RECENTS_MEMORY_ENABLED = "ls_augment_recents_memory_enabled";
    static final String RECENTS_MEMORY_TEXT_SP = "ls_augment_recents_memory_text_sp";
    static final String RECENTS_MEMORY_GAP_DP = "ls_augment_recents_memory_gap_dp";

    static final String GAME_MASTER = "ls_augment_game_master";
    static final String SHOULDER_ENABLED = "ls_augment_shoulder_enabled";
    static final String SHOULDER_DIAGNOSTICS = "ls_augment_shoulder_diagnostics";
    static final String COMBO_SPEED_ENABLED = "ls_augment_combo_speed_enabled";
    static final String COMBO_SPEED_RATE = "ls_augment_combo_speed_rate";
    static final String SUPER_MIRROR_LOW_MODE = "ls_augment_super_mirror_low_mode";
    static final String SUPER_MIRROR_DIABLO_COEXIST = "ls_augment_super_mirror_diablo_coexist";

    static final String SYSTEMUI_MASTER = "ls_augment_systemui_master";
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

    static final String APP_MASTER = "ls_augment_app_master";
    static final String DOUBLE_ANY_APP = "ls_augment_doubleapp_any_app";
    static final String DOUBLE_LOW_MEMORY = "ls_augment_doubleapp_low_memory";
    static final String BEAUTIFY_UNLIMITED_TRIAL = "ls_augment_beautify_unlimited_trial";

    static final String AUTOMATION_ENABLED = "ls_augment_automation_enabled";
    static final String AUTOMATION_SCOPE = "ls_augment_automation_scope";
    static final String AUTOMATION_LAST_EVENT = "ls_augment_automation_last_event";
    static final String AUTOMATION_LAST_ERROR = "ls_augment_automation_last_error";

    private static final Set<String> BOOLEAN_KEYS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            HIDE_MASTER, TILE_ENABLED, RECENTS_ENABLED, RECENTS_MEMORY_ENABLED, GAME_MASTER,
            SHOULDER_ENABLED, SHOULDER_DIAGNOSTICS, COMBO_SPEED_ENABLED,
            SUPER_MIRROR_LOW_MODE,
            SUPER_MIRROR_DIABLO_COEXIST, SYSTEMUI_MASTER, STATUSBAR_DUAL_LEFT,
            STATUSBAR_DUAL_RIGHT, STATUSBAR_CLOCK_ACROSS, STATUSBAR_FREE_POSITION,
            STATUSBAR_CLOCK_CUSTOM,
            STATUSBAR_CLOCK_24H, STATUSBAR_CLOCK_SECONDS, STATUSBAR_CLOCK_PERIOD,
            STATUSBAR_CLOCK_WEEK, STATUSBAR_NET_SPEED, STATUSBAR_THERMAL,
            STATUSBAR_BATTERY_POWER, APP_MASTER, DOUBLE_ANY_APP, DOUBLE_LOW_MEMORY,
            BEAUTIFY_UNLIMITED_TRIAL, AUTOMATION_ENABLED
    )));

    private static final Map<String, String> DEFAULTS;
    static {
        LinkedHashMap<String, String> values = new LinkedHashMap<>();
        for (String key : BOOLEAN_KEYS) values.put(key, "0");
        values.put(TILE_ENABLED, "1");
        values.put(HIDE_TARGETS, "");
        values.put(TILE_LABEL, "LS_Augment");
        values.put(TILE_DESCRIPTION, "应用隐藏");
        values.put(RECENTS_COMPRESSION,
                RecentsRecommendedConfig.COMPRESSION_SERIALIZED);
        values.put(RECENTS_FRONT_OVERLAP,
                RecentsRecommendedConfig.FRONT_OVERLAP_SERIALIZED);
        values.put(RECENTS_MEMORY_TEXT_SP,
                RecentsRecommendedConfig.MEMORY_TEXT_SP_SERIALIZED);
        values.put(RECENTS_MEMORY_GAP_DP,
                RecentsRecommendedConfig.MEMORY_GAP_DP_SERIALIZED);
        values.put(COMBO_SPEED_RATE, "2");
        values.put(STATUSBAR_HEIGHT_DP, "0");
        values.put(STATUSBAR_LEFT_MARGIN_DP, "0");
        values.put(STATUSBAR_RIGHT_MARGIN_DP, "0");
        values.put(STATUSBAR_TOP_MARGIN_DP, "0");
        values.put(STATUSBAR_BOTTOM_MARGIN_DP, "0");
        values.put(STATUSBAR_LAYOUT_SPEC, "");
        values.put(STATUSBAR_CLOCK_PATTERN, "");
        values.put(STATUSBAR_CLOCK_PATTERN_SECOND, "");
        values.put(STATUSBAR_CLOCK_FONT_FAMILY, "sans-serif");
        values.put(STATUSBAR_CLOCK_SIZE_SP, "0.00");
        values.put(STATUSBAR_CLOCK_WEIGHT, "400");
        values.put(STATUSBAR_CLOCK_LETTER_SPACING, "0.00");
        values.put(STATUSBAR_CLOCK_LINE_SPACING_DP, "0.00");
        values.put(STATUSBAR_CLOCK_TEXT_ALIGN, "center");
        values.put(STATUSBAR_CLOCK_WIDTH_DP, "0");
        values.put(STATUSBAR_NOTIFICATION_MAX, "0");
        values.put(AUTOMATION_SCOPE, "current");
        DEFAULTS = Collections.unmodifiableMap(values);
    }

    private final Context context;
    private final SharedPreferences prefs;

    AppConfig(Context context) {
        this.context = context.getApplicationContext();
        this.prefs = this.context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        initializePrivateDefaults();
    }

    private void initializePrivateDefaults() {
        if (prefs.getBoolean(PRIVATE_INITIALIZED, false)) return;
        SharedPreferences.Editor editor = prefs.edit();
        for (Map.Entry<String, String> entry : DEFAULTS.entrySet()) {
            editor.putString(entry.getKey(), entry.getValue());
        }
        editor.putBoolean(PRIVATE_INITIALIZED, true).commit();
    }

    String get(String key) {
        String fallback = DEFAULTS.get(key);
        String value = prefs.getString(key, fallback == null ? "" : fallback);
        // Preserve an existing integral value such as "4.00" from test20018,
        // while exposing only the new integer representation to the UI,
        // provider, snapshots, and runtime mirror.
        return COMBO_SPEED_RATE.equals(key) ? normalizedComboRate(value) : value;
    }

    boolean getBoolean(String key) {
        String value = get(key);
        return "1".equals(value) || "true".equalsIgnoreCase(value);
    }

    int getInt(String key, int fallback) {
        try { return Integer.parseInt(get(key)); } catch (Throwable ignored) { return fallback; }
    }

    float getFloat(String key, float fallback) {
        try { return Float.parseFloat(get(key)); } catch (Throwable ignored) { return fallback; }
    }

    Map<String, String> snapshot() {
        LinkedHashMap<String, String> result = new LinkedHashMap<>();
        for (String key : DEFAULTS.keySet()) result.put(key, get(key));
        return result;
    }

    synchronized SaveResult save(Map<String, String> updates) {
        LinkedHashMap<String, String> clean = new LinkedHashMap<>();
        for (Map.Entry<String, String> entry : updates.entrySet()) {
            String value = validate(entry.getKey(), entry.getValue());
            if (value == null) return new SaveResult(false, "配置值无效：" + entry.getKey());
            clean.put(entry.getKey(), value);
        }
        SharedPreferences.Editor editor = prefs.edit();
        for (Map.Entry<String, String> entry : clean.entrySet()) {
            editor.putString(entry.getKey(), entry.getValue());
        }
        if (!editor.commit()) return new SaveResult(false, "无法写入应用配置");
        // The provider is the authoritative cross-process source. Notify
        // SystemUI immediately after the private commit so visual feedback is
        // not delayed by (or dependent on) the Root Settings.Global mirror.
        try {
            context.getContentResolver().notifyChange(
                    Uri.parse("content://" + PROVIDER_AUTHORITY + "/config"), null);
        } catch (Throwable ignored) {
            // The Settings.Global mirror below is the compatibility fallback.
        }
        RootShell.Result mirror = mirror(clean);
        return new SaveResult(true, mirror.isSuccess() ? "配置已保存并同步" :
                "配置已保存；Root 运行镜像暂未同步：" + mirror.publicError());
    }

    synchronized RootShell.Result mirrorAll() {
        return mirror(snapshot());
    }

    /**
     * A new applicationId must never inherit old Settings.Global feature
     * choices. The first successful Root session publishes this APK's safe
     * defaults and clears any stale hidden-target mirror.
     */
    synchronized RootShell.Result initializeRuntimeMirrorsIfNeeded() {
        if (prefs.getBoolean(RUNTIME_INITIALIZED, false)) {
            return new RootShell.Result(0, "运行镜像已初始化", false);
        }
        RootShell.Result values = mirror(snapshot());
        if (!values.isSuccess()) return values;
        RootShell.Result reset = RootShell.run(
                "settings delete global " + HIDDEN_MIRROR
                        + " >/dev/null 2>&1 || true; settings put global "
                        + TILE_STATE + " EMPTY", null, 8, 4096);
        if (reset.isSuccess()) prefs.edit().putBoolean(RUNTIME_INITIALIZED, true).commit();
        return reset;
    }

    private RootShell.Result mirror(Map<String, String> values) {
        if (context.getSharedPreferences(DIAGNOSTICS, Context.MODE_PRIVATE)
                .getBoolean("root_prompt_suppressed", false)) {
            return new RootShell.Result(126, "请在诊断页主动点击“重新申请 Root 授权”", false);
        }
        StringBuilder command = new StringBuilder("set -e;");
        for (Map.Entry<String, String> entry : values.entrySet()) {
            if (HIDE_TARGETS.equals(entry.getKey())) continue;
            command.append(" settings put global ")
                    .append(entry.getKey()).append(' ')
                    .append(RootShell.quote(entry.getValue())).append(';');
        }
        // GameHelperModule is privileged, but this ROM can leave its overlay
        // AppOp in the default/rejected state after an OTA or reboot. One-key
        // combo opens its editor through that overlay, so keep the vendor
        // permission in the allowed state whenever shoulder support is synced.
        if (truthy(values.get(SHOULDER_ENABLED))) {
            command.append(" appops set cn.nubia.gamehelpmodule")
                    .append(" SYSTEM_ALERT_WINDOW allow;");
        }
        if (command.length() == 6) return new RootShell.Result(0, "", false);
        return RootShell.run(command.toString());
    }

    private static String validate(String key, String raw) {
        if (!DEFAULTS.containsKey(key)) return null;
        String value = raw == null ? "" : raw.replace('\r', ' ').replace('\n', ' ').trim();
        if (BOOLEAN_KEYS.contains(key)) return truthy(value) ? "1" : "0";
        if (HIDE_TARGETS.equals(key)) {
            return value.length() <= 64 * 1024 ? value : null;
        }
        if (TILE_LABEL.equals(key)) return truncate(value, 30, "LS_Augment");
        if (TILE_DESCRIPTION.equals(key)) return truncate(value, 60, "应用隐藏");
        if (STATUSBAR_CLOCK_PATTERN.equals(key)
                || STATUSBAR_CLOCK_PATTERN_SECOND.equals(key)) {
            return value.length() <= 80 ? value : null;
        }
        if (STATUSBAR_LAYOUT_SPEC.equals(key)) {
            if (value.length() > 16 * 1024) return null;
            return StatusBarLayoutSpec.parse(value).valid ? value : null;
        }
        if (STATUSBAR_CLOCK_FONT_FAMILY.equals(key)) {
            return value.length() <= 40 && value.matches("[A-Za-z0-9 _.-]*")
                    ? (value.isEmpty() ? "sans-serif" : value) : null;
        }
        if (STATUSBAR_CLOCK_TEXT_ALIGN.equals(key)) {
            return "left".equals(value) || "right".equals(value)
                    ? value : "center";
        }
        if (AUTOMATION_SCOPE.equals(key)) return "all".equals(value) ? "all" : "current";
        if (RECENTS_COMPRESSION.equals(key)) return decimal(value, 0.12f, 0.90f);
        if (RECENTS_FRONT_OVERLAP.equals(key)) return decimal(value, 0.20f, 0.60f);
        if (RECENTS_MEMORY_TEXT_SP.equals(key)) return integer(value, 10, 20);
        if (RECENTS_MEMORY_GAP_DP.equals(key)) return integer(value, 0, 32);
        if (COMBO_SPEED_RATE.equals(key)) return integer(value, 1, 10);
        if (STATUSBAR_HEIGHT_DP.equals(key)) return integer(value, 0, 96);
        if (STATUSBAR_CLOCK_SIZE_SP.equals(key)) return decimal(value, 0.0f, 40.0f);
        if (STATUSBAR_CLOCK_WEIGHT.equals(key)) return integer(value, 100, 900);
        if (STATUSBAR_CLOCK_LETTER_SPACING.equals(key)) {
            return decimal(value, -0.20f, 1.00f);
        }
        if (STATUSBAR_CLOCK_LINE_SPACING_DP.equals(key)) return decimal(value, 0.0f, 32.0f);
        if (STATUSBAR_CLOCK_WIDTH_DP.equals(key)) return integer(value, 0, 240);
        if (STATUSBAR_NOTIFICATION_MAX.equals(key)) return integer(value, 0, 20);
        if (key.contains("_margin_dp")) return integer(value, 0, 64);
        return null;
    }

    private static boolean truthy(String value) {
        return "1".equals(value) || "true".equalsIgnoreCase(value)
                || "yes".equalsIgnoreCase(value) || "on".equalsIgnoreCase(value);
    }

    private static String decimal(String value, float min, float max) {
        try {
            float number = Float.parseFloat(value);
            if (Float.isNaN(number) || number < min || number > max) return null;
            return String.format(java.util.Locale.US, "%.2f", number);
        } catch (Throwable ignored) { return null; }
    }

    private static String integer(String value, int min, int max) {
        try {
            int number = Integer.parseInt(value);
            return number >= min && number <= max ? String.valueOf(number) : null;
        } catch (Throwable ignored) { return null; }
    }

    private static String normalizedComboRate(String value) {
        try {
            float number = Float.parseFloat(value);
            int rounded = Math.round(number);
            return !Float.isNaN(number) && !Float.isInfinite(number)
                    && number == rounded && rounded >= 1 && rounded <= 10
                    ? String.valueOf(rounded) : "1";
        } catch (Throwable ignored) {
            return "1";
        }
    }

    private static String truncate(String value, int max, String fallback) {
        if (value.isEmpty()) return fallback;
        int count = value.codePointCount(0, value.length());
        return count <= max ? value : value.substring(0, value.offsetByCodePoints(0, max));
    }

    static final class SaveResult {
        final boolean success;
        final String message;
        SaveResult(boolean success, String message) {
            this.success = success;
            this.message = message;
        }
    }
}
