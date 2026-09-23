package ls.augment.com;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Single source of truth for persisted LS_Augment configuration.
 *
 * <p>Diagnostics and runtime witnesses deliberately do not live here: a
 * diagnostic value must never be able to enable a feature.</p>
 */
public final class ConfigSchema {
    public static final int VERSION = 1;
    public static final String SCOPE_DEVICE = "device";
    public static final String GLOBAL_SNAPSHOT = "ls_augment_config_snapshot_v1";

    public static final String HIDE_MASTER = "ls_augment_hide_master";
    public static final String HIDE_TARGETS = "ls_augment_hide_targets_v2";
    public static final String TILE_ICON = "ls_augment_tile_icon";
    public static final String STORE_DOWNLOAD_ENABLED = "ls_augment_store_download_enabled";
    public static final String STORE_DOWNLOAD_COUNT = "ls_augment_store_download_count";
    public static final String HEALTH_MULTIPLY_ENABLED = "ls_augment_health_multiply_enabled";
    public static final String HEALTH_PLAN_ENABLED = "ls_augment_health_plan_enabled";
    public static final String HEALTH_DAILY_LIMIT_ENABLED = "ls_augment_health_daily_limit_enabled";
    public static final String HEALTH_DAILY_LIMIT_STEPS = "ls_augment_health_daily_limit_steps";
    public static final String STATUSBAR_CLOCK_ROWS = "ls_augment_statusbar_clock_rows";
    public static final String TILE_ENABLED = "ls_augment_tile_enabled";
    public static final String TILE_LABEL = "ls_augment_tile_label";
    public static final String TILE_DESCRIPTION = "ls_augment_tile_description";

    public static final String GAME_MASTER = "ls_augment_game_master";
    public static final String SHOULDER_ENABLED = "ls_augment_shoulder_enabled";
    public static final String SHOULDER_DIAGNOSTICS = "ls_augment_shoulder_diagnostics";
    public static final String TGK_RAPID_FIRE_ENABLED = "ls_augment_tgk_rapid_fire_enabled";
    public static final String TGK_RAPID_FIRE_COUNT = "ls_augment_tgk_rapid_fire_count";
    public static final String TGK_RAPID_FIRE_COMPAT_TOKEN =
            "ls_augment_tgk_rapid_fire_compat_token";
    public static final String TGK_RAPID_FIRE_TEST_SESSION =
            "ls_augment_tgk_rapid_fire_test_session";
    public static final String COMBO_SPEED_ENABLED = "ls_augment_combo_speed_enabled";
    public static final String COMBO_SPEED_RATE = "ls_augment_combo_speed_rate";
    public static final String AI_TRIGGER_ENABLED = "ls_augment_ai_trigger_enabled";
    public static final String AI_TRIGGER_DIAGNOSTICS =
            "ls_augment_ai_trigger_diagnostics";
    public static final String AI_TRIGGER_TEMPLATE_SCAN_MS = "ls_augment_ai_template_scan_ms";
    public static final String AI_TRIGGER_CLICK_MS = "ls_augment_ai_click_ms";
    public static final String AI_TRIGGER_COOLDOWN_MS = "ls_augment_ai_cooldown_ms";
    public static final String AI_TRIGGER_YOLO_SCAN_MS = "ls_augment_ai_yolo_scan_ms";
    public static final String FREEFORM_ENABLED = "ls_augment_freeform_enabled";
    public static final String FREEFORM_UNLIMITED = "ls_augment_freeform_unlimited";
    public static final String FREEFORM_ALL_APPS = "ls_augment_freeform_all_apps";
    public static final String FREEFORM_EXCLUDED_APPS = "ls_augment_freeform_excluded_apps";
    public static final String SUPER_MIRROR_LOW_MODE = "ls_augment_super_mirror_low_mode";
    public static final String SUPER_MIRROR_DIABLO_COEXIST =
            "ls_augment_super_mirror_diablo_coexist";
    public static final String FAN_FIXED_ENABLED = "ls_augment_fan_fixed_enabled";
    public static final String FAN_FIXED_LEVEL = "ls_augment_fan_fixed_level";
    public static final String FAN_TILE_REQUEST = "ls_augment_fan_tile_request";
    public static final String FAN_UNLOCK_MAX = "ls_augment_fan_unlock_max";
    public static final String FAN_TARGET_RPM = "ls_augment_fan_target_rpm";
    public static final String FAN_CALIBRATION_REQUEST = "ls_augment_fan_calibration_request";
    public static final String FAN_MEASUREMENT = "ls_augment_fan_measurement";

    public static final String SYSTEMUI_MASTER = "ls_augment_systemui_master";
    public static final String AUDIO_GAIN_ENABLED = "ls_augment_audio_gain_enabled";
    public static final String AUDIO_GAIN_STEP = "ls_augment_audio_gain_step";
    public static final String BATTERY_DISABLE_AGE_REDUCTION = "ls_augment_battery_disable_age_reduction";
    public static final String HEALTH_ENABLED = "ls_augment_health_enabled";
    public static final String HEALTH_BACKGROUND = "ls_augment_health_background";
    public static final String HEALTH_MULTIPLIER = "ls_augment_health_multiplier";
    public static final String HEALTH_ACCOUNT = "ls_augment_health_account";
    public static final String HEALTH_PLAN = "ls_augment_health_plan";
    public static final String HEALTH_SINCE = "ls_augment_health_since";
    public static final String LAUNCHER_OVERRIDES = "ls_augment_launcher_overrides";
    public static final String STATUSBAR_GRID = "ls_augment_statusbar_grid_v2";
    public static final String STATUSBAR_POSITION_SIZE_ONLY = "ls_augment_statusbar_position_size_only";
    public static final String STATUSBAR_CONNECTIVITY_GROUP = "ls_augment_statusbar_connectivity_group";
    public static final String STATUSBAR_NATIVE_BATTERY_ENABLED = "ls_augment_statusbar_native_battery_enabled";
    public static final String STATUSBAR_CONNECTIVITY_SIZE = "ls_augment_statusbar_connectivity_size_dp";
    public static final String STATUSBAR_CONNECTIVITY_STROKE = "ls_augment_statusbar_connectivity_ring_percent";
    public static final String STATUSBAR_CONNECTIVITY_INACTIVE = "ls_augment_statusbar_connectivity_inactive_percent";
    public static final String STATUSBAR_CONNECTIVITY_REVERSE = "ls_augment_statusbar_connectivity_reverse";
    public static final String STATUSBAR_CONNECTIVITY_COLORS = "ls_augment_statusbar_connectivity_colors";
    public static final String STATUSBAR_CONNECTIVITY_PLUG_COLOR = "ls_augment_statusbar_connectivity_plug_color";
    public static final String[] CONNECTIVITY_CONTENT_KEYS = {"ls_augment_statusbar_connectivity_upper_content","ls_augment_statusbar_connectivity_middle_content","ls_augment_statusbar_connectivity_lower_content"};
    public static final String[] CONNECTIVITY_SCALE_KEYS = {"ls_augment_statusbar_connectivity_upper_scale","ls_augment_statusbar_connectivity_middle_scale","ls_augment_statusbar_connectivity_lower_scale"};
    public static final int CONNECTIVITY_SCALE_MIN = 50, CONNECTIVITY_SCALE_MAX = 300;
    public static final int CONNECTIVITY_OFFSET_LIMIT = 100;
    public static final String[] CONNECTIVITY_X_KEYS = {"ls_augment_statusbar_connectivity_upper_x","ls_augment_statusbar_connectivity_middle_x","ls_augment_statusbar_connectivity_lower_x"};
    public static final String[] CONNECTIVITY_Y_KEYS = {"ls_augment_statusbar_connectivity_upper_y","ls_augment_statusbar_connectivity_middle_y","ls_augment_statusbar_connectivity_lower_y"};
    // Index 0: ordinary charging bolt; index 1: bypass charging plug.
    public static final String[] CONNECTIVITY_POWER_X_KEYS = {"ls_augment_statusbar_connectivity_charge_x","ls_augment_statusbar_connectivity_bypass_x"};
    public static final String[] CONNECTIVITY_POWER_Y_KEYS = {"ls_augment_statusbar_connectivity_charge_y","ls_augment_statusbar_connectivity_bypass_y"};
    public static final String[] CONNECTIVITY_POWER_SCALE_KEYS = {"ls_augment_statusbar_connectivity_charge_scale","ls_augment_statusbar_connectivity_bypass_scale"};
    public static final String[] CONNECTIVITY_CONTENT_VALUES = {"battery","wifi","dual","data","other","none"};
    public static final String[] CONNECTIVITY_CONTENT_LABELS = {"电量数字","Wi-Fi","双卡信号","仅流量卡信号","仅另一张卡信号","不显示"};
    public static final String STATUSBAR_NATIVE_NETWORK_SIZE_SP = "ls_augment_statusbar_native_network_size_sp";
    public static final String STATUSBAR_CPU_DECIMALS = "ls_augment_statusbar_cpu_decimals";
    public static final String STATUSBAR_GPU_DECIMALS = "ls_augment_statusbar_gpu_decimals";
    public static final String STATUSBAR_BATTERY_TEMP_DECIMALS = "ls_augment_statusbar_battery_temp_decimals";
    public static final String STATUSBAR_CURRENT_DECIMALS = "ls_augment_statusbar_current_decimals";
    public static final String STATUSBAR_POWER_DECIMALS = "ls_augment_statusbar_power_decimals";
    public static final String STATUSBAR_SYSTEM_TWO_ROWS = "ls_augment_statusbar_system_two_rows";
    public static final String STATUSBAR_NOTIFICATION_TWO_ROWS = "ls_augment_statusbar_notification_two_rows";
    public static final String STATUSBAR_NETWORK_TWO_ROWS = "ls_augment_statusbar_network_two_rows";
    public static final String STATUSBAR_NETWORK_UPLOAD_MARK = "ls_augment_statusbar_network_upload_mark";
    public static final String STATUSBAR_NETWORK_DOWNLOAD_MARK = "ls_augment_statusbar_network_download_mark";
    public static final String STATUSBAR_NETWORK_DISPLAY = "ls_augment_statusbar_network_display";
    public static final String STATUSBAR_DUAL_LEFT = "ls_augment_statusbar_dual_left";
    public static final String STATUSBAR_DUAL_RIGHT = "ls_augment_statusbar_dual_right";
    public static final String STATUSBAR_CLOCK_ACROSS = "ls_augment_statusbar_clock_across";
    public static final String STATUSBAR_HEIGHT_DP = "ls_augment_statusbar_height_dp";
    public static final String STATUSBAR_LEFT_MARGIN_DP = "ls_augment_statusbar_left_margin_dp";
    public static final String STATUSBAR_RIGHT_MARGIN_DP = "ls_augment_statusbar_right_margin_dp";
    public static final String STATUSBAR_TOP_MARGIN_DP = "ls_augment_statusbar_top_margin_dp";
    public static final String STATUSBAR_BOTTOM_MARGIN_DP = "ls_augment_statusbar_bottom_margin_dp";
    public static final String STATUSBAR_FREE_POSITION = "ls_augment_statusbar_free_position";
    public static final String STATUSBAR_LAYOUT_SPEC = "ls_augment_statusbar_layout_spec";
    public static final String STATUSBAR_CLOCK_CUSTOM = "ls_augment_statusbar_clock_custom";
    public static final String STATUSBAR_CLOCK_PATTERN = "ls_augment_statusbar_clock_pattern";
    public static final String STATUSBAR_CLOCK_PATTERN_SECOND =
            "ls_augment_statusbar_clock_pattern_second";
    public static final String STATUSBAR_CLOCK_24H = "ls_augment_statusbar_clock_24h";
    public static final String STATUSBAR_CLOCK_SECONDS = "ls_augment_statusbar_clock_seconds";
    public static final String STATUSBAR_CLOCK_PERIOD = "ls_augment_statusbar_clock_period";
    public static final String STATUSBAR_CLOCK_WEEK = "ls_augment_statusbar_clock_week";
    public static final String STATUSBAR_CLOCK_FONT_FAMILY =
            "ls_augment_statusbar_clock_font_family";
    public static final String STATUSBAR_CLOCK_SIZE_SP = "ls_augment_statusbar_clock_size_sp";
    public static final String STATUSBAR_CLOCK_WEIGHT = "ls_augment_statusbar_clock_weight";
    public static final String STATUSBAR_CLOCK_LETTER_SPACING =
            "ls_augment_statusbar_clock_letter_spacing";
    public static final String STATUSBAR_CLOCK_LINE_SPACING_DP =
            "ls_augment_statusbar_clock_line_spacing_dp";
    public static final String STATUSBAR_CLOCK_TEXT_ALIGN =
            "ls_augment_statusbar_clock_text_align";
    public static final String STATUSBAR_CLOCK_WIDTH_DP = "ls_augment_statusbar_clock_width_dp";
    public static final String STATUSBAR_THERMAL = "ls_augment_statusbar_thermal";
    public static final String STATUSBAR_BATTERY_POWER = "ls_augment_statusbar_battery_power";
    public static final String STATUSBAR_NOTIFICATION_MAX =
            "ls_augment_statusbar_notification_max";
    public static final String STATUSBAR_ICON_SCALE = "ls_augment_statusbar_icon_scale";
    public static final String STATUSBAR_DEBUG_OVERLAY = "ls_augment_statusbar_debug_overlay";
    public static final String STATUSBAR_NOTIFICATION_HIDE =
            "ls_augment_statusbar_notification_hide";
    public static final String STATUSBAR_DUAL_ROW_GAP_DP =
            "ls_augment_statusbar_dual_row_gap_dp";

    public static final String APP_MASTER = "ls_augment_app_master";
    public static final String DOUBLE_ANY_APP = "ls_augment_doubleapp_any_app";
    public static final String DOUBLE_LOW_MEMORY = "ls_augment_doubleapp_low_memory";
    public static final String BEAUTIFY_UNLIMITED_TRIAL =
            "ls_augment_beautify_unlimited_trial";
    public static final String ALLOW_SIGNATURE_MISMATCH =
            "ls_augment_allow_signature_mismatch";

    public static final String AUTOMATION_ENABLED = "ls_augment_automation_enabled";
    public static final String AUTOMATION_SCOPE = "ls_augment_automation_scope";

    private interface Normalizer {
        String normalize(String value);
    }

    private static final class Entry {
        final String defaultValue;
        final boolean runtime;
        final Normalizer normalizer;

        Entry(String defaultValue, boolean runtime, Normalizer normalizer) {
            this.defaultValue = defaultValue;
            this.runtime = runtime;
            this.normalizer = normalizer;
        }
    }

    private static final LinkedHashMap<String, Entry> ENTRIES = new LinkedHashMap<>();
    private static final Map<String, String> DEFAULTS;
    private static final Map<String, String> RUNTIME_DEFAULTS;

    static {
        addBoolean(HIDE_MASTER, false);
        add(HIDE_TARGETS, "", false, value -> length(value, 64 * 1024));
        add(TILE_ICON, "", true, value -> value.isEmpty() || value.matches("[0-9a-f]{64}") ? value : null);
        addBoolean(STORE_DOWNLOAD_ENABLED, false);
        addInteger(STORE_DOWNLOAD_COUNT, 5, 1, 50);
        addBoolean(HEALTH_MULTIPLY_ENABLED, false);
        addBoolean(HEALTH_PLAN_ENABLED, false);
        addBoolean(HEALTH_DAILY_LIMIT_ENABLED, false);
        addInteger(HEALTH_DAILY_LIMIT_STEPS, 10000, 1, 1000000);
        addInteger(STATUSBAR_CLOCK_ROWS, 2, 1, 2);
        addBoolean(TILE_ENABLED, true);
        add(TILE_LABEL, "LS_Augment", true,
                value -> truncate(value, 30, "LS_Augment"));
        add(TILE_DESCRIPTION, "应用隐藏", true,
                value -> truncate(value, 60, "应用隐藏"));

        addBoolean(GAME_MASTER, false);
        addBoolean(SHOULDER_ENABLED, false);
        addBoolean(SHOULDER_DIAGNOSTICS, false);
        addBoolean(TGK_RAPID_FIRE_ENABLED, false);
        addInteger(TGK_RAPID_FIRE_COUNT, 20, 10, 50);
        add(TGK_RAPID_FIRE_COMPAT_TOKEN, "", true, value -> length(value, 4096));
        add(TGK_RAPID_FIRE_TEST_SESSION, "", true, value -> length(value, 4096));
        addBoolean(COMBO_SPEED_ENABLED, false);
        add(COMBO_SPEED_RATE, "2", true, ConfigSchema::normalizeComboRate);
        addBoolean(AI_TRIGGER_ENABLED, false);
        addBoolean(AI_TRIGGER_DIAGNOSTICS, false);
        addInteger(AI_TRIGGER_TEMPLATE_SCAN_MS, 180, 80, 2000);
        addInteger(AI_TRIGGER_CLICK_MS, 25, 10, 500);
        addInteger(AI_TRIGGER_COOLDOWN_MS, 180, 50, 30000);
        addInteger(AI_TRIGGER_YOLO_SCAN_MS, 400, 150, 1500);
        addBoolean(FREEFORM_ENABLED, false);
        addBoolean(FREEFORM_UNLIMITED, false);
        addBoolean(FREEFORM_ALL_APPS, false);
        add(FREEFORM_EXCLUDED_APPS, "", true, AppPackageSet::normalize);
        addBoolean(SUPER_MIRROR_LOW_MODE, false);
        addBoolean(SUPER_MIRROR_DIABLO_COEXIST, false);
        addBoolean(FAN_FIXED_ENABLED, false);
        addInteger(FAN_FIXED_LEVEL, 0, 0, 5);
        add(FAN_TILE_REQUEST, "", true, value -> value.isEmpty() || value.matches("[0-9a-f]{32}") ? value : null);
        addBoolean(FAN_UNLOCK_MAX, false);
        addInteger(FAN_TARGET_RPM, 12000, 500, 100000);
        add(FAN_CALIBRATION_REQUEST, "", true, value -> value.isEmpty()
                || value.matches("[0-9]{13}:[0-9a-f]{32}") ? value : null);
        add(FAN_MEASUREMENT, "", true, value -> value.isEmpty()
                || FanCalibrationData.parse(value) != null ? value : null);

        // Status-bar entries are centralized for configuration consistency.
        // Their rendering and sampling behavior is intentionally unchanged.
        addBoolean(SYSTEMUI_MASTER, false);
        addBoolean(AUDIO_GAIN_ENABLED, false);
        // Accept retired keys from old backups, but never reactivate either feature.
        add(BATTERY_DISABLE_AGE_REDUCTION, "0", false, value -> "0");
        add(SystemOptions.key("thermal_notifications"), "0", false, value -> "0");
        addBoolean(HEALTH_ENABLED, false);
        addBoolean(HEALTH_BACKGROUND, true);
        addInteger(HEALTH_MULTIPLIER, 100, 100, 1000);
        add(HEALTH_ACCOUNT, "", true, value -> value.isEmpty() || value.matches("[0-9a-f]{64}") ? value : null);
        add(HEALTH_PLAN, "", true, value -> value.isEmpty() || StepPlan.parse(value) != null ? value : null);
        add(HEALTH_SINCE, "0", true, value -> value.matches("[0-9]{1,12}") ? value : null);
        add(LAUNCHER_OVERRIDES, "", true, value -> LauncherOverrides.parse(value)==null?null:value);
        addInteger(AUDIO_GAIN_STEP, 5, 1, 20);
        for (String route : new String[]{"speaker", "wired", "bluetooth"})
            for (int stream : new int[]{3, 2, 4}) addInteger(AudioGainPolicy.key(route, stream), 100, 100, 300);
        add(STATUSBAR_GRID, "", true, value -> {
            StatusBarGridSpec parsed = StatusBarGridSpec.parse(value);
            return parsed == null ? null : value.isEmpty() ? "" : parsed.serialize();
        });
        addBoolean(STATUSBAR_SYSTEM_TWO_ROWS, true);
        addBoolean(STATUSBAR_POSITION_SIZE_ONLY, false);
        addBoolean(STATUSBAR_CONNECTIVITY_GROUP, false);
        // Preserve native customization on upgrades that have never selected three-in-one.
        addBoolean(STATUSBAR_NATIVE_BATTERY_ENABLED, true);
        addInteger(STATUSBAR_CONNECTIVITY_SIZE, 26, 18, 40);
        addInteger(STATUSBAR_CONNECTIVITY_STROKE, 6, 3, 10);
        addInteger(STATUSBAR_CONNECTIVITY_INACTIVE, 28, 10, 65);
        // Legacy import key only; the renderer always fills counterclockwise.
        addBoolean(STATUSBAR_CONNECTIVITY_REVERSE, true);
        addBoolean(STATUSBAR_CONNECTIVITY_COLORS, true);
        add(STATUSBAR_CONNECTIVITY_PLUG_COLOR, "#FF34C759", true, value -> value.matches("#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?") ? value.toUpperCase(Locale.ROOT) : null);
        String[] connectivityDefaults={"battery","wifi","dual"};
        for(int i=0;i<3;i++){
            add(CONNECTIVITY_CONTENT_KEYS[i],connectivityDefaults[i],true,value->java.util.Arrays.asList(CONNECTIVITY_CONTENT_VALUES).contains(value)?value:null);
            addInteger(CONNECTIVITY_SCALE_KEYS[i],100,CONNECTIVITY_SCALE_MIN,CONNECTIVITY_SCALE_MAX);
            addInteger(CONNECTIVITY_X_KEYS[i],0,-CONNECTIVITY_OFFSET_LIMIT,CONNECTIVITY_OFFSET_LIMIT);
            addInteger(CONNECTIVITY_Y_KEYS[i],0,-CONNECTIVITY_OFFSET_LIMIT,CONNECTIVITY_OFFSET_LIMIT);
        }
        for(int i=0;i<2;i++){
            addInteger(CONNECTIVITY_POWER_X_KEYS[i],0,-CONNECTIVITY_OFFSET_LIMIT,CONNECTIVITY_OFFSET_LIMIT);
            addInteger(CONNECTIVITY_POWER_Y_KEYS[i],0,-CONNECTIVITY_OFFSET_LIMIT,CONNECTIVITY_OFFSET_LIMIT);
            addInteger(CONNECTIVITY_POWER_SCALE_KEYS[i],100,CONNECTIVITY_SCALE_MIN,CONNECTIVITY_SCALE_MAX);
        }
        addInteger(STATUSBAR_NATIVE_NETWORK_SIZE_SP, 0, 0, 32);
        addInteger(STATUSBAR_CPU_DECIMALS, 0, 0, 3);
        addInteger(STATUSBAR_GPU_DECIMALS, 0, 0, 3);
        addInteger(STATUSBAR_BATTERY_TEMP_DECIMALS, 1, 0, 3);
        addInteger(STATUSBAR_CURRENT_DECIMALS, 0, 0, 3);
        addInteger(STATUSBAR_POWER_DECIMALS, 1, 0, 3);
        addBoolean(STATUSBAR_NOTIFICATION_TWO_ROWS, true);
        addBoolean(STATUSBAR_NETWORK_TWO_ROWS, true);
        addInteger(STATUSBAR_NETWORK_DISPLAY, 0, 0, 4);
        add(STATUSBAR_NETWORK_UPLOAD_MARK, "↑", true, value -> length(value, 16));
        add(STATUSBAR_NETWORK_DOWNLOAD_MARK, "↓", true, value -> length(value, 16));
        addBoolean(STATUSBAR_DUAL_LEFT, false);
        addBoolean(STATUSBAR_DUAL_RIGHT, false);
        addBoolean(STATUSBAR_CLOCK_ACROSS, false);
        addInteger(STATUSBAR_HEIGHT_DP, 0, 0, 96);
        addInteger(STATUSBAR_LEFT_MARGIN_DP, 0, 0, 64);
        addInteger(STATUSBAR_RIGHT_MARGIN_DP, 0, 0, 64);
        addInteger(STATUSBAR_TOP_MARGIN_DP, 0, 0, 64);
        addInteger(STATUSBAR_BOTTOM_MARGIN_DP, 0, 0, 64);
        addBoolean(STATUSBAR_FREE_POSITION, false);
        add(STATUSBAR_LAYOUT_SPEC, "", true, value -> {
            if (value.length() > 16 * 1024) return null;
            return StatusBarLayoutSpec.parse(value).valid ? value : null;
        });
        addBoolean(STATUSBAR_CLOCK_CUSTOM, false);
        add(STATUSBAR_CLOCK_PATTERN, "", true, value -> length(value, 80));
        add(STATUSBAR_CLOCK_PATTERN_SECOND, "", true, value -> length(value, 80));
        addBoolean(STATUSBAR_CLOCK_24H, false);
        addBoolean(STATUSBAR_CLOCK_SECONDS, false);
        addBoolean(STATUSBAR_CLOCK_PERIOD, false);
        addBoolean(STATUSBAR_CLOCK_WEEK, false);
        add(STATUSBAR_CLOCK_FONT_FAMILY, "sans-serif", true, value ->
                value.length() <= 40 && value.matches("[A-Za-z0-9 _.-]*")
                        ? (value.isEmpty() ? "sans-serif" : value) : null);
        addDecimal(STATUSBAR_CLOCK_SIZE_SP, 0.0f, 0.0f, 40.0f);
        addInteger(STATUSBAR_CLOCK_WEIGHT, 400, 100, 900);
        addDecimal(STATUSBAR_CLOCK_LETTER_SPACING, 0.0f, -0.20f, 1.00f);
        addDecimal(STATUSBAR_CLOCK_LINE_SPACING_DP, 0.0f, 0.0f, 32.0f);
        add(STATUSBAR_CLOCK_TEXT_ALIGN, "center", true,
                value -> "left".equals(value) || "right".equals(value)
                        ? value : "center");
        addInteger(STATUSBAR_CLOCK_WIDTH_DP, 0, 0, 240);
        addBoolean(STATUSBAR_THERMAL, false);
        addBoolean(STATUSBAR_BATTERY_POWER, false);
        addInteger(STATUSBAR_NOTIFICATION_MAX, 0, 0, 20);
        addDecimal(STATUSBAR_ICON_SCALE, 1.0f, 0.5f, 2.0f);
        addBoolean(STATUSBAR_DEBUG_OVERLAY, false);
        addBoolean(STATUSBAR_NOTIFICATION_HIDE, false);
        addInteger(STATUSBAR_DUAL_ROW_GAP_DP, 0, -8, 64);

        addBoolean(APP_MASTER, false);
        addBoolean(DOUBLE_ANY_APP, false);
        addBoolean(DOUBLE_LOW_MEMORY, false);
        addBoolean(BEAUTIFY_UNLIMITED_TRIAL, false);
        addBoolean(ALLOW_SIGNATURE_MISMATCH, false);
        addBoolean(AUTOMATION_ENABLED, false);
        add(AUTOMATION_SCOPE, "current", true,
                value -> "all".equals(value) ? "all" : "current");

        for (EnhancementOption option : EnhancementCatalog.options()) {
            add(option.key, option.defaultValue, true, option::normalize);
        }
        LinkedHashMap<String, String> defaults = new LinkedHashMap<>();
        LinkedHashMap<String, String> runtimeDefaults = new LinkedHashMap<>();
        for (Map.Entry<String, Entry> entry : ENTRIES.entrySet()) {
            defaults.put(entry.getKey(), entry.getValue().defaultValue);
            if (entry.getValue().runtime) {
                runtimeDefaults.put(entry.getKey(), entry.getValue().defaultValue);
            }
        }
        DEFAULTS = Collections.unmodifiableMap(defaults);
        RUNTIME_DEFAULTS = Collections.unmodifiableMap(runtimeDefaults);
    }

    private ConfigSchema() { }

    public static boolean contains(String key) {
        return ENTRIES.containsKey(key);
    }

    public static boolean isRuntimeKey(String key) {
        Entry entry = ENTRIES.get(key);
        return entry != null && entry.runtime;
    }

    public static String defaultValue(String key) {
        Entry entry = ENTRIES.get(key);
        return entry == null ? null : entry.defaultValue;
    }

    public static Map<String, String> defaults() {
        return DEFAULTS;
    }

    public static Map<String, String> runtimeDefaults() {
        return RUNTIME_DEFAULTS;
    }

    public static Set<String> keys() {
        return DEFAULTS.keySet();
    }

    public static Set<String> runtimeKeys() {
        return RUNTIME_DEFAULTS.keySet();
    }

    public static String normalize(String key, String raw) {
        Entry entry = ENTRIES.get(key);
        if (entry == null) return null;
        String value = raw == null ? "" : raw.replace('\r', ' ').replace('\n', ' ').trim();
        return entry.normalizer.normalize(value);
    }

    public static boolean truthy(String value) {
        return "1".equals(value) || "true".equalsIgnoreCase(value)
                || "yes".equalsIgnoreCase(value) || "on".equalsIgnoreCase(value);
    }

    private static void addBoolean(String key, boolean defaultValue) {
        add(key, defaultValue ? "1" : "0", true,
                value -> truthy(value) ? "1" : "0");
    }

    private static void addInteger(String key, int defaultValue, int min, int max) {
        add(key, String.valueOf(defaultValue), true, value -> integer(value, min, max));
    }

    private static void addDecimal(String key, float defaultValue, float min, float max) {
        add(key, String.format(Locale.US, "%.2f", defaultValue), true,
                value -> decimal(value, min, max));
    }

    private static void add(String key, String defaultValue, boolean runtime,
            Normalizer normalizer) {
        if (ENTRIES.put(key, new Entry(defaultValue, runtime, normalizer)) != null) {
            throw new IllegalStateException("Duplicate config key: " + key);
        }
    }

    private static String integer(String value, int min, int max) {
        try {
            int number = Integer.parseInt(value);
            return number >= min && number <= max ? String.valueOf(number) : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String decimal(String value, float min, float max) {
        try {
            float number = Float.parseFloat(value);
            if (Float.isNaN(number) || Float.isInfinite(number)
                    || number < min || number > max) return null;
            return String.format(Locale.US, "%.2f", number);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String normalizeComboRate(String value) {
        try {
            float number = Float.parseFloat(value);
            int rounded = Math.round(number);
            return !Float.isNaN(number) && !Float.isInfinite(number)
                    && number == rounded && rounded >= 1 && rounded <= 10
                    ? String.valueOf(rounded) : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String length(String value, int maximum) {
        return value.length() <= maximum ? value : null;
    }

    private static String truncate(String value, int maximum, String fallback) {
        if (value.isEmpty()) return fallback;
        int count = value.codePointCount(0, value.length());
        return count <= maximum ? value
                : value.substring(0, value.offsetByCodePoints(0, maximum));
    }
}
