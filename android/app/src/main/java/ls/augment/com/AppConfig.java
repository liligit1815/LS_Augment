package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;

import java.util.LinkedHashMap;
import java.util.Map;

/** APK-private authoritative configuration plus one atomic early-boot snapshot. */
final class AppConfig {
    /** Serializes multi-key preference snapshots across all AppConfig instances. */
    private static final Object CONFIG_LOCK = new Object();
    /** Prevents an older Root mirror from completing after a newer revision. */
    private static final Object MIRROR_LOCK = new Object();
    private static final String PRIVATE_INITIALIZED = "private_initialized_v2";
    private static final String RUNTIME_SNAPSHOT_INITIALIZED =
            "runtime_snapshot_initialized_v1";
    private static final String SNAPSHOT_REVISION = "snapshot_revision_v1";
    private static final String SNAPSHOT_UPDATED_AT = "snapshot_updated_at_v1";
    private static final String RETIRED_RECENTS_CLEANED = "retired_recents_cleaned_v1";
    private static final String LEGACY_GLOBAL_CLEANED = "legacy_global_cleaned_v1";
    static final String PROVIDER_AUTHORITY = "ls.augment.com.config";
    static final String PREFS = "ls_augment_config_v2";
    static final String DIAGNOSTICS = "ls_augment_diagnostics_v2";

    static final String HIDE_MASTER = ConfigSchema.HIDE_MASTER;
    static final String HIDE_TARGETS = ConfigSchema.HIDE_TARGETS;
    static final String HIDDEN_MIRROR = "ls_augment_hidden_targets";
    static final String TILE_STATE = "ls_augment_tile_state";
    static final String TILE_ENABLED = ConfigSchema.TILE_ENABLED;
    static final String TILE_LABEL = ConfigSchema.TILE_LABEL;
    static final String TILE_DESCRIPTION = ConfigSchema.TILE_DESCRIPTION;

    static final String GAME_MASTER = ConfigSchema.GAME_MASTER;
    static final String SHOULDER_ENABLED = ConfigSchema.SHOULDER_ENABLED;
    static final String SHOULDER_DIAGNOSTICS = ConfigSchema.SHOULDER_DIAGNOSTICS;
    static final String TGK_RAPID_FIRE_ENABLED = ConfigSchema.TGK_RAPID_FIRE_ENABLED;
    static final String TGK_RAPID_FIRE_COUNT = ConfigSchema.TGK_RAPID_FIRE_COUNT;
    static final String TGK_RAPID_FIRE_COMPAT_TOKEN =
            ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN;
    static final String TGK_RAPID_FIRE_TEST_SESSION =
            ConfigSchema.TGK_RAPID_FIRE_TEST_SESSION;
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
    static final String FREEFORM_EXCLUDED_APPS = ConfigSchema.FREEFORM_EXCLUDED_APPS;
    static final String SUPER_MIRROR_LOW_MODE = ConfigSchema.SUPER_MIRROR_LOW_MODE;
    static final String SUPER_MIRROR_DIABLO_COEXIST = ConfigSchema.SUPER_MIRROR_DIABLO_COEXIST;
    static final String FAN_FIXED_ENABLED = ConfigSchema.FAN_FIXED_ENABLED;
    static final String FAN_UNLOCK_MAX = ConfigSchema.FAN_UNLOCK_MAX;
    static final String FAN_TARGET_RPM = ConfigSchema.FAN_TARGET_RPM;

    static final String SYSTEMUI_MASTER = ConfigSchema.SYSTEMUI_MASTER;
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
    static final String STATUSBAR_CLOCK_PATTERN_SECOND = ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND;
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
    static final String STATUSBAR_NOTIFICATION_HIDE = ConfigSchema.STATUSBAR_NOTIFICATION_HIDE;
    static final String STATUSBAR_DUAL_ROW_GAP_DP = ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP;

    static final String APP_MASTER = ConfigSchema.APP_MASTER;
    static final String DOUBLE_ANY_APP = ConfigSchema.DOUBLE_ANY_APP;
    static final String DOUBLE_LOW_MEMORY = ConfigSchema.DOUBLE_LOW_MEMORY;
    static final String BEAUTIFY_UNLIMITED_TRIAL = ConfigSchema.BEAUTIFY_UNLIMITED_TRIAL;
    static final String ALLOW_SIGNATURE_MISMATCH = ConfigSchema.ALLOW_SIGNATURE_MISMATCH;

    static final String AUTOMATION_ENABLED = ConfigSchema.AUTOMATION_ENABLED;
    static final String AUTOMATION_SCOPE = ConfigSchema.AUTOMATION_SCOPE;
    static final String AUTOMATION_LAST_EVENT = "ls_augment_automation_last_event";
    static final String AUTOMATION_LAST_ERROR = "ls_augment_automation_last_error";

    private static final Map<String, String> DEFAULTS = ConfigSchema.defaults();

    private final Context context;
    private final SharedPreferences prefs;

    AppConfig(Context context) {
        this.context = context.getApplicationContext();
        this.prefs = this.context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        synchronized (CONFIG_LOCK) {
            if (!prefs.getBoolean("approved_ui_migration_v1",false)) {
                boolean oldEnabled=getBoolean(ConfigSchema.HEALTH_ENABLED);
                prefs.edit().putString(ConfigSchema.HEALTH_MULTIPLY_ENABLED,oldEnabled?"1":"0")
                    .putString(ConfigSchema.HEALTH_PLAN_ENABLED,oldEnabled&&!get(ConfigSchema.HEALTH_PLAN).isEmpty()?"1":"0")
                    .putString(ConfigSchema.STATUSBAR_CLOCK_ROWS,get(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND).isEmpty()?"1":"2")
                    .putBoolean("approved_ui_migration_v1",true).commit();
            }
            if (!prefs.getBoolean("freeform_independent_migration_v1",false)) {
                SharedPreferences.Editor migration=prefs.edit().putBoolean("freeform_independent_migration_v1",true);
                if (!getBoolean(FREEFORM_ENABLED)) migration.putString(FREEFORM_UNLIMITED,"0").putString(FREEFORM_ALL_APPS,"0");
                migration.commit();
            }
            initializePrivateDefaults();
            initializeSnapshotMetadata();
        }
    }

    private void initializePrivateDefaults() {
        if (prefs.getBoolean(PRIVATE_INITIALIZED, false)) return;
        SharedPreferences.Editor editor = prefs.edit();
        for (Map.Entry<String, String> entry : DEFAULTS.entrySet()) {
            // Preserve values written by an older build even if its migration
            // marker is missing or was interrupted. Only genuinely new keys
            // receive their schema defaults.
            if (!prefs.contains(entry.getKey())) {
                editor.putString(entry.getKey(), entry.getValue());
            }
        }
        editor.putBoolean(PRIVATE_INITIALIZED, true).commit();
    }

    private void initializeSnapshotMetadata() {
        long revision = prefs.getLong(SNAPSHOT_REVISION, 0L);
        long updatedAt = prefs.getLong(SNAPSHOT_UPDATED_AT, 0L);
        if (revision > 0L && updatedAt > 0L) return;
        long now = Math.max(1L, System.currentTimeMillis());
        prefs.edit()
                .putLong(SNAPSHOT_REVISION, 1L)
                .putLong(SNAPSHOT_UPDATED_AT, now)
                .commit();
    }

    String get(String key) {
        String fallback = DEFAULTS.get(key);
        String value = prefs.getString(key, fallback == null ? "" : fallback);
        String normalized = ConfigSchema.normalize(key, value);
        return normalized == null ? (fallback == null ? "" : fallback) : normalized;
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
        synchronized (CONFIG_LOCK) {
            return snapshotLocked();
        }
    }

    String diagnostic(String key) {
        return context.getSharedPreferences(DIAGNOSTICS, Context.MODE_PRIVATE).getString(key, "");
    }

    private Map<String, String> snapshotLocked() {
        LinkedHashMap<String, String> result = new LinkedHashMap<>();
        for (String key : DEFAULTS.keySet()) result.put(key, get(key));
        return result;
    }

    ConfigSnapshot configSnapshot() {
        synchronized (CONFIG_LOCK) {
            ConfigSnapshot result = ConfigSnapshot.create(
                    Math.max(1L, prefs.getLong(SNAPSHOT_REVISION, 1L)),
                    Math.max(1L, prefs.getLong(SNAPSHOT_UPDATED_AT, 1L)),
                    snapshotLocked());
            return result == null ? ConfigSnapshot.safeDefaults() : result;
        }
    }

    SaveResult save(Map<String, String> updates) {
        LinkedHashMap<String, String> clean = new LinkedHashMap<>();
        for (Map.Entry<String, String> entry : updates.entrySet()) {
            String value = ConfigSchema.normalize(entry.getKey(), entry.getValue());
            if (value == null) return new SaveResult(false, "配置值无效：" + entry.getKey());
            clean.put(entry.getKey(), value);
        }
        ConfigSnapshot runtime;
        synchronized (CONFIG_LOCK) {
            LinkedHashMap<String, String> next = new LinkedHashMap<>(snapshotLocked());
            next.putAll(clean);
            if (ConfigSchema.truthy(next.get(TGK_RAPID_FIRE_ENABLED))) {
                RapidFireCompatibility.Token token = RapidFireCompatibility.Token.parse(
                        next.get(TGK_RAPID_FIRE_COMPAT_TOKEN));
                boolean compatible = token != null && token.validFor(
                        RapidFireCompatibility.currentFingerprint(context));
                boolean explicitlyEnabling = ConfigSchema.truthy(
                        clean.get(TGK_RAPID_FIRE_ENABLED));
                if (!compatible && explicitlyEnabling) {
                    return new SaveResult(false, "肩键极速连点尚未通过本机兼容性测试");
                }
                if (!compatible) {
                    clean.put(TGK_RAPID_FIRE_ENABLED, "0");
                    next.put(TGK_RAPID_FIRE_ENABLED, "0");
                }
            }
            long now = Math.max(1L, System.currentTimeMillis());
            long revision = Math.max(prefs.getLong(SNAPSHOT_REVISION, 1L) + 1L, now);
            runtime = ConfigSnapshot.create(revision, now, next);
            if (runtime == null) return new SaveResult(false, "无法生成完整配置快照");

            SharedPreferences.Editor editor = prefs.edit();
            for (Map.Entry<String, String> entry : clean.entrySet()) {
                editor.putString(entry.getKey(), entry.getValue());
            }
            editor.putLong(SNAPSHOT_REVISION, revision);
            editor.putLong(SNAPSHOT_UPDATED_AT, now);
            if (!editor.commit()) return new SaveResult(false, "无法写入应用配置");
        }
        // The provider is the authoritative cross-process source. Notify
        // SystemUI immediately after the private commit so visual feedback is
        // not delayed by (or dependent on) the Root Settings.Global mirror.
        try {
            context.getContentResolver().notifyChange(
                    Uri.parse("content://" + PROVIDER_AUTHORITY + "/config"), null);
        } catch (Throwable ignored) {
            // The Settings.Global mirror below is the compatibility fallback.
        }
        AuditLog.write(context,"CONFIG_SAVE","keys="+String.join(",",clean.keySet()));
        RootShell.Result mirror = mirror(runtime);
        return new SaveResult(true, mirror.isSuccess() ? "配置已保存并同步" :
                "配置已保存；Root 运行镜像暂未同步：" + mirror.publicError());
    }

    synchronized RootShell.Result mirrorAll() {
        return mirror(configSnapshot());
    }

    /**
     * Disables settings consumed by retired launcher hooks. This one-time
     * migration also turns off the former launcher-only CorePatch switch so
     * an old system_server cannot keep accepting replacements after update.
     */
    synchronized RootShell.Result cleanupRetiredRuntimeSettings() {
        if (prefs.getBoolean(RETIRED_RECENTS_CLEANED, false)) {
            return new RootShell.Result(0, "已清理旧最近任务配置", false);
        }
        RootShell.Result result = RootShell.run(
                "settings put global ls_augment_recents_enabled 0; "
                        + "settings put global ls_augment_recents_memory_enabled 0; "
                        + "settings put global ls_augment_recents_native_enabled 0; "
                        + "settings put global ls_augment_corepatch_enabled 0; "
                        + "settings delete global ls_augment_recents_compression; "
                        + "settings delete global ls_augment_recents_front_overlap; "
                        + "settings delete global ls_augment_recents_memory_text_sp; "
                        + "settings delete global ls_augment_recents_memory_gap_dp",
                null, 8, 4096);
        if (result.isSuccess()) {
            prefs.edit()
                    .remove("ls_augment_recents_enabled")
                    .remove("ls_augment_recents_memory_enabled")
                    .remove("ls_augment_recents_native_enabled")
                    .remove("ls_augment_corepatch_enabled")
                    .remove("ls_augment_recents_compression")
                    .remove("ls_augment_recents_front_overlap")
                    .remove("ls_augment_recents_memory_text_sp")
                    .remove("ls_augment_recents_memory_gap_dp")
                    .putBoolean(RETIRED_RECENTS_CLEANED, true)
                    .commit();
        }
        return result;
    }

    /**
     * A new applicationId must never inherit old Settings.Global feature
     * choices. The first successful Root session publishes this APK's safe
     * defaults and clears any stale hidden-target mirror.
     */
    synchronized RootShell.Result initializeRuntimeMirrorsIfNeeded() {
        ConfigSnapshot expected = configSnapshot();
        if (prefs.getBoolean(RUNTIME_SNAPSHOT_INITIALIZED, false)) {
            // A persisted marker alone is not proof that Settings.Global still
            // contains a usable snapshot. It can disappear after an OTA,
            // manual recovery, or an interrupted migration while app data is
            // retained. Validate both revision and checksum before skipping
            // publication so early-boot hooks never remain on safe defaults.
            RootShell.Result existing = RootShell.run(
                    "settings get global " + ConfigSchema.GLOBAL_SNAPSHOT,
                    null, 6, 320 * 1024);
            ConfigSnapshot mirrored = existing.isSuccess()
                    ? ConfigSnapshot.parse(existing.output) : null;
            if (mirrored != null
                    && mirrored.revision == expected.revision
                    && mirrored.checksum.equals(expected.checksum)) {
                return new RootShell.Result(0, "运行镜像已初始化", false);
            }
        }
        RootShell.Result values = mirror(expected);
        if (!values.isSuccess()) return values;
        RootShell.Result reset = RootShell.run(
                "settings delete global " + HIDDEN_MIRROR
                        + " >/dev/null 2>&1 || true; settings put global "
                        + TILE_STATE + " EMPTY", null, 8, 4096);
        if (reset.isSuccess()) {
            prefs.edit().putBoolean(RUNTIME_SNAPSHOT_INITIALIZED, true).commit();
        }
        return reset;
    }

    synchronized RootShell.Result cleanupLegacyGlobalSettingsAfterHandshake() {
        if (prefs.getBoolean(LEGACY_GLOBAL_CLEANED, false)) {
            return new RootShell.Result(0, "旧逐键运行配置已清理", false);
        }
        StringBuilder command = new StringBuilder("set -e;");
        for (String key : ConfigSchema.runtimeKeys()) {
            command.append(" settings delete global ").append(key).append(';');
        }
        RootShell.Result result = RootShell.run(command.toString(), null, 12, 16 * 1024);
        if (result.isSuccess()) {
            prefs.edit().putBoolean(LEGACY_GLOBAL_CLEANED, true).commit();
        }
        return result;
    }

    private RootShell.Result mirror(ConfigSnapshot runtime) {
        synchronized (MIRROR_LOCK) {
            if (context.getSharedPreferences(DIAGNOSTICS, Context.MODE_PRIVATE)
                    .getBoolean("root_prompt_suppressed", false)) {
                return new RootShell.Result(126, "请在诊断页主动点击“重新申请 Root 授权”", false);
            }
            if (runtime == null) return new RootShell.Result(2, "invalid_snapshot", false);
            synchronized (CONFIG_LOCK) {
                long latest = Math.max(1L, prefs.getLong(SNAPSHOT_REVISION, 1L));
                if (runtime.revision < latest) {
                    return new RootShell.Result(0, "snapshot_superseded", false);
                }
            }
            StringBuilder command = new StringBuilder("set -e; settings put global ")
                    .append(ConfigSchema.GLOBAL_SNAPSHOT).append(' ')
                    .append(RootShell.quote(runtime.serialize())).append(';');
            // GameHelperModule is privileged, but this ROM can leave its overlay
            // AppOp in the default/rejected state after an OTA or reboot. One-key
            // combo opens its editor through that overlay, so keep the vendor
            // permission in the allowed state whenever shoulder support is synced.
            if (ConfigSchema.truthy(runtime.get(SHOULDER_ENABLED))) {
                command.append(" appops set cn.nubia.gamehelpmodule")
                        .append(" SYSTEM_ALERT_WINDOW allow;");
            }
            return RootShell.run(command.toString());
        }
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
