package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;

import java.util.LinkedHashMap;
import java.util.Map;

/** APK-private authoritative configuration with official framework synchronization. */
final class AppConfig {
    /** Serializes multi-key preference snapshots across all AppConfig instances. */
    private static final Object CONFIG_LOCK = new Object();
    private static final String PRIVATE_INITIALIZED = "private_initialized_v2";
    private static final String SNAPSHOT_REVISION = "snapshot_revision_v1";
    private static final String SNAPSHOT_UPDATED_AT = "snapshot_updated_at_v1";
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
    static final String FAN_TILE_ENHANCEMENT_ENABLED = ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED;
    static final String FAN_SCREEN_OFF_ENABLED = ConfigSchema.FAN_SCREEN_OFF_ENABLED;

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
    private static DurablePreferences sharedConfig;
    // DurablePreferences publishes a new immutable map only after a successful commit.
    // Identity also covers migrations/resets; a failed disk write must retain the old snapshot.
    private static Map<String, ?> snapshotSource;
    private static ConfigSnapshot publishedSnapshot;
    private final DurablePreferences prefs;
    private final long editorGeneration;

    AppConfig(Context context) {
        editorGeneration = ResetWriteFence.generation();
        this.context = context.getApplicationContext();
        synchronized (CONFIG_LOCK) {
            if (sharedConfig == null) sharedConfig = new DurablePreferences(
                    this.context.getSharedPreferences(PREFS, Context.MODE_PRIVATE));
            this.prefs = sharedConfig;
        }
        synchronized (CONFIG_LOCK) {
            if (ResetWriteFence.blocked()) return;
            if (!prefs.getBoolean("approved_ui_migration_v1",false)) {
                boolean oldEnabled=getBoolean(ConfigSchema.HEALTH_ENABLED);
                migrationEditor().putString(ConfigSchema.HEALTH_MULTIPLY_ENABLED,oldEnabled?"1":"0")
                    .putString(ConfigSchema.HEALTH_PLAN_ENABLED,oldEnabled&&!get(ConfigSchema.HEALTH_PLAN).isEmpty()?"1":"0")
                    .putString(ConfigSchema.STATUSBAR_CLOCK_ROWS,get(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND).isEmpty()?"1":"2")
                    .putBoolean("approved_ui_migration_v1",true).commit();
            }
            if (!prefs.getBoolean("freeform_independent_migration_v1",false)) {
                DurablePreferences.Editor migration=migrationEditor().putBoolean("freeform_independent_migration_v1",true);
                if (!getBoolean(FREEFORM_ENABLED)) migration.putString(FREEFORM_UNLIMITED,"0").putString(FREEFORM_ALL_APPS,"0");
                migration.commit();
            }
            initializePrivateDefaults();
            if (!prefs.getBoolean("notification_cascade_only_v1",false)) {
                DurablePreferences.Editor migration=migrationEditor().putBoolean("notification_cascade_only_v1",true);
                for(String suffix:new String[]{"big","small","style","complete_count","step","inset"})
                    migration.remove("ls_augment_rm_notification_stack_"+suffix);
                migration.commit();
            }
            if (!prefs.getBoolean("fan_fixed_levels_only_v1", false)) {
                migrationEditor()
                        .putString(ConfigSchema.FAN_FIXED_LEVEL, get(ConfigSchema.FAN_FIXED_LEVEL))
                        .putString(ConfigSchema.FAN_UNLOCK_MAX, "0")
                        .remove(ConfigSchema.FAN_TARGET_RPM)
                        .putBoolean("fan_fixed_levels_only_v1", true).commit();
            }
            if (!prefs.getBoolean("recents_memory_unified_layout_v1",false)) {
                DurablePreferences.Editor migration=migrationEditor()
                        .putBoolean("recents_memory_unified_layout_v1",true);
                // Retain the active style's region on upgrade; offsets already
                // share one key per orientation and must never be reset here.
                String prefix="ls_augment_rm_recents_memory_";
                if ("1".equals(get(prefix+"style"))) {
                    for (String orientation:new String[]{"portrait_","landscape_"})
                        migration.putString(prefix+orientation+"height",get(prefix+"detailed_"+orientation+"height"));
                }
                migration.commit();
            }
            if (!prefs.getBoolean("recents_memory_unified_size_v1",false)) {
                String prefix="ls_augment_rm_recents_memory_";
                String orientation=context.getResources().getConfiguration().orientation
                        ==android.content.res.Configuration.ORIENTATION_LANDSCAPE?"landscape_":"portrait_";
                DurablePreferences.Editor migration=migrationEditor().putBoolean("recents_memory_unified_size_v1",true);
                if(!prefs.contains(prefix+"simple_size"))migration.putString(prefix+"simple_size",get(prefix+orientation+"size"));
                if(!prefs.contains(prefix+"detailed_size"))migration.putString(prefix+"detailed_size",get(prefix+"detailed_"+orientation+"size"));
                migration.commit();
            }
            initializeSnapshotMetadata();
        }
    }

    private void initializePrivateDefaults() {
        if (prefs.getBoolean(PRIVATE_INITIALIZED, false)) return;
        DurablePreferences.Editor editor = migrationEditor();
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

    private DurablePreferences.Editor migrationEditor() {
        long now = Math.max(1L, System.currentTimeMillis());
        return prefs.edit().putLong(SNAPSHOT_REVISION, Math.max(prefs.getLong(SNAPSHOT_REVISION, 0L) + 1L, now))
                .putLong(SNAPSHOT_UPDATED_AT, now);
    }

    String get(String key) {
        String fallback = DEFAULTS.get(key);
        String value = prefs.getString(key, fallback == null ? "" : fallback);
        // Selection parsing owns its version/identity checks. Preserve malformed
        // or oversized source text for review instead of turning it into empty.
        if (HIDE_TARGETS.equals(key)) return value == null ? "" : value;
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
            Map<String, ?> source = prefs.getAll();
            if (source == snapshotSource && publishedSnapshot != null) return publishedSnapshot;
            ConfigSnapshot result = ConfigSnapshot.create(
                    Math.max(1L, prefs.getLong(SNAPSHOT_REVISION, 1L)),
                    Math.max(1L, prefs.getLong(SNAPSHOT_UPDATED_AT, 1L)),
                    snapshotLocked());
            publishedSnapshot = result == null ? ConfigSnapshot.safeDefaults() : result;
            snapshotSource = source;
            return publishedSnapshot;
        }
    }

    SaveResult save(Map<String, String> updates) {
        return save(updates, null, false, false, false);
    }

    /** Split freeform pages derive their shared gate from the committed sibling controls. */
    SaveResult saveFreeformControls(Map<String, String> updates) {
        return save(updates, null, false, false, true);
    }

    /** A tile command must belong to the currently enabled configuration generation. */
    SaveResult saveFanTileSelection(Map<String, String> updates, long expectedRevision) {
        synchronized (CONFIG_LOCK) {
            if (!getBoolean(FAN_TILE_ENHANCEMENT_ENABLED))
                return new SaveResult(false, "散热风扇磁贴增强已关闭");
            if (expectedRevision <= 0 || expectedRevision != prefs.getLong(SNAPSHOT_REVISION, 1L))
                return new SaveResult(false, "配置已变更，请重新选择风扇转速");
            if (FanCalibrationData.validRequest(get(ConfigSchema.FAN_CALIBRATION_REQUEST), System.currentTimeMillis()))
                return new SaveResult(false, "正在测量转速，请完成或取消测量后再选择");
            return save(updates);
        }
    }

    /** Replace the complete store: retired keys and credentials must not survive a total reset. */
    SaveResult resetToDefaults() {
        return save(DEFAULTS, null, false, true, false);
    }

    /** Only the candidate membership is writable by the GameSpace provider route. */
    SaveResult setShoulderCandidate(ShoulderQuickSwitchPolicy.CaseRef ref, boolean checked) {
        return save(java.util.Collections.emptyMap(), ref, checked, false, false);
    }

    private SaveResult save(Map<String, String> updates,
            ShoulderQuickSwitchPolicy.CaseRef candidate, boolean checked, boolean replace,
            boolean deriveFreeformGate) {
        if (touchesLauncherGrid(updates)) {
            traceLauncherGrid(context, "SAVE_REQUEST", updates, configSnapshot().revision, "");
        }
        LinkedHashMap<String, String> clean = new LinkedHashMap<>();
        for (Map.Entry<String, String> entry : updates.entrySet()) {
            String value = ConfigSchema.normalize(entry.getKey(), entry.getValue());
            if (value == null) return rejected(updates, "配置值无效：" + entry.getKey());
            clean.put(entry.getKey(), value);
        }
        ConfigSnapshot runtime;
        String competitiveRecoveryIssue="";
        synchronized (CONFIG_LOCK) {
            if (ResetWriteFence.stale(editorGeneration))
                return rejected(updates, "配置已被重置，请重新打开此页面后再修改");
            LinkedHashMap<String, String> next = new LinkedHashMap<>(replace ? DEFAULTS : snapshotLocked());
            if (candidate != null) {
                ShoulderQuickSwitchPolicy candidates = ShoulderQuickSwitchPolicy.parse(
                        next.get(ShoulderQuickSwitchPolicy.KEY));
                if (candidates == null) return rejected(updates, "肩键候选配置格式无效");
                try {
                    clean.put(ShoulderQuickSwitchPolicy.KEY, candidates.with(candidate, checked).serialize());
                } catch (IllegalArgumentException invalid) {
                    return rejected(updates, invalid.getMessage());
                }
            }
            next.putAll(clean);
            if(ConfigSchema.truthy(clean.get(SystemUiOptions.ISLAND))
                    &&NativeIslandMode.MODERN.equals(NativeIslandMode.detect(context)))
                return rejected(updates,"当前魔力岛显示分支尚不支持Duo自定义岛，请使用原厂魔力岛");
            // Last explicit selection wins, atomically. Keep every appearance parameter.
            if (ConfigSchema.truthy(clean.get(ConfigSchema.NATIVE_ISLAND_SELECTED))) {
                clean.put(SystemUiOptions.ISLAND, "0");
                next.put(SystemUiOptions.ISLAND, "0");
            } else if (ConfigSchema.truthy(clean.get(SystemUiOptions.ISLAND))) {
                clean.put(ConfigSchema.NATIVE_ISLAND_SELECTED, "0");
                next.put(ConfigSchema.NATIVE_ISLAND_SELECTED, "0");
            }
            // Both entry points publish the same state under the same lock. A
            // stale Settings page cannot enable dual signals over three-in-one.
            if (ConfigSchema.truthy(clean.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))) {
                clean.put(SystemUiOptions.SIGNAL_DUAL, "0");
                next.put(SystemUiOptions.SIGNAL_DUAL, "0");
            } else if (ConfigSchema.truthy(clean.get(SystemUiOptions.SIGNAL_DUAL))
                    && ConfigSchema.truthy(next.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))) {
                return rejected(updates, "请先关闭三合一图标");
            }
            // Evaluate after merging under CONFIG_LOCK. UI-thread reads can miss
            // a sibling page's queued save and otherwise turn an enabled page off.
            // Explicit gates (including legacy imports and resets) retain their meaning.
            if (deriveFreeformGate && !clean.containsKey(FREEFORM_ENABLED)
                    && (clean.containsKey(FREEFORM_ALL_APPS) || clean.containsKey(FREEFORM_UNLIMITED)
                    || clean.containsKey(ConfigSchema.FREEFORM_GAME_LOGIN)
                    || clean.containsKey(ConfigSchema.FREEFORM_EXTERNAL_APPS))) {
                boolean enabled = ConfigSchema.truthy(next.get(FREEFORM_ALL_APPS))
                        || ConfigSchema.truthy(next.get(FREEFORM_UNLIMITED))
                        || ConfigSchema.truthy(next.get(ConfigSchema.FREEFORM_GAME_LOGIN))
                        || ConfigSchema.truthy(next.get(ConfigSchema.FREEFORM_EXTERNAL_APPS));
                clean.put(FREEFORM_ENABLED, enabled ? "1" : "0");
                next.put(FREEFORM_ENABLED, enabled ? "1" : "0");
            }
            if (ConfigSchema.truthy(next.get(TGK_RAPID_FIRE_ENABLED))) {
                RapidFireCompatibility.Token token = RapidFireCompatibility.Token.parse(
                        next.get(TGK_RAPID_FIRE_COMPAT_TOKEN));
                boolean compatible = token != null && token.validFor(
                        RapidFireCompatibility.currentFingerprint(context));
                boolean explicitlyEnabling = ConfigSchema.truthy(
                        clean.get(TGK_RAPID_FIRE_ENABLED));
                if (!compatible && explicitlyEnabling) {
                    return rejected(updates, "肩键极速连点尚未通过本机兼容性测试");
                }
                if (!compatible) {
                    clean.put(TGK_RAPID_FIRE_ENABLED, "0");
                    next.put(TGK_RAPID_FIRE_ENABLED, "0");
                }
            }
            long now = Math.max(1L, System.currentTimeMillis());
            long revision = Math.max(prefs.getLong(SNAPSHOT_REVISION, 1L) + 1L, now);
            runtime = ConfigSnapshot.create(revision, now, next);
            if (runtime == null) return rejected(updates, "无法生成完整配置快照");

            boolean competitiveEnable=ConfigSchema.truthy(clean.get(CompetitiveKeyOptions.ENABLED))
                    &&!getBoolean(CompetitiveKeyOptions.ENABLED);
            if(competitiveEnable){
                ModuleSystemSettings.WriteResult cleared=ModuleSystemSettings.put(context,"system",CompetitiveKeyOptions.NATIVE_SETTING,"0");
                if(!cleared.success)return rejected(updates,cleared.message);
            }

            DurablePreferences.Editor editor = prefs.edit();
            if (replace) editor.clear().putBoolean(PRIVATE_INITIALIZED, true)
                    .putBoolean("approved_ui_migration_v1", true)
                    .putBoolean("freeform_independent_migration_v1", true)
                    .putBoolean("fan_fixed_levels_only_v1", true)
                    .putBoolean("recents_memory_unified_layout_v1", true)
                    .putBoolean("recents_memory_unified_size_v1", true);
            for (Map.Entry<String, String> entry : clean.entrySet()) {
                editor.putString(entry.getKey(), entry.getValue());
            }
            editor.putLong(SNAPSHOT_REVISION, revision);
            editor.putLong(SNAPSHOT_UPDATED_AT, now);
            if (!editor.commit()) {
                if(competitiveEnable){
                    ModuleSystemSettings.RestoreResult restored=ModuleSystemSettings.restoreOne(context,"system",CompetitiveKeyOptions.NATIVE_SETTING);
                    return rejected(updates,"无法写入应用配置"+(restored.success?"":"；"+restored.message));
                }
                return rejected(updates, "无法写入应用配置");
            }
            if(clean.containsKey(CompetitiveKeyOptions.ENABLED)
                    &&!ConfigSchema.truthy(clean.get(CompetitiveKeyOptions.ENABLED))&&!ResetWriteFence.blocked()){
                ModuleSystemSettings.RestoreResult restored=ModuleSystemSettings.restoreOne(context,"system",CompetitiveKeyOptions.NATIVE_SETTING);
                if(!restored.success)competitiveRecoveryIssue="；竞技键已关闭，"+restored.message;
            }
        }
        // Publish the committed private state immediately; no Root command is part of saving.
        try {
            context.getContentResolver().notifyChange(
                    Uri.parse("content://" + PROVIDER_AUTHORITY + "/config"), null);
        } catch (RuntimeException ignored) { }
        AuditLog.write(context,"CONFIG_SAVE","keys="+String.join(",",clean.keySet()));
        FrameworkConfigSync.request();
        boolean synced = FrameworkConfigSync.isPublished(runtime);
        if (touchesLauncherGrid(clean)) {
            traceLauncherGrid(context, "SAVE_COMMITTED", runtime.values(), runtime.revision,
                    "frameworkSync=" + (synced ? "SYNCED" : "PENDING") + ";desktopApplied=UNCONFIRMED");
        }
        return new SaveResult(true, (synced ? "配置已保存并同步" :
                "配置已保存；启动配置正在后台同步")+competitiveRecoveryIssue, synced);
    }

    private SaveResult rejected(Map<String,String> updates, String message) {
        if (touchesLauncherGrid(updates)) {
            synchronized (CONFIG_LOCK) {
                traceLauncherGrid(context, "SAVE_REJECTED", snapshotLocked(),
                        prefs.getLong(SNAPSHOT_REVISION, 1L), "reason=" + message);
            }
        }
        return new SaveResult(false, message);
    }

    /** Only these three public numeric settings enter the audit; never dump arbitrary updates. */
    static boolean touchesLauncherGrid(Map<String,String> values) {
        if (values == null) return false;
        for (String part : new String[]{"enabled", "rows", "columns"})
            if (values.containsKey("ls_augment_rm_launcher_grid_" + part)) return true;
        return false;
    }

    static void traceLauncherGrid(Context context, String phase, Map<String,String> values,
            long revision, String outcome) {
        StringBuilder line = new StringBuilder("version=").append(BuildConfig.VERSION_NAME)
                .append(";phase=").append(phase).append(";revision=").append(revision);
        for (String part : new String[]{"enabled", "rows", "columns"}) {
            String value = values.get("ls_augment_rm_launcher_grid_" + part);
            // Rejected raw input can include arbitrary text. Record a marker, not its contents.
            String safe = value == null ? "UNCHANGED" : value.matches("[0-9]{1,2}|true|false") ? value : "INVALID";
            line.append(';').append(part).append('=').append(safe);
        }
        if (outcome != null && !outcome.isEmpty()) line.append(';').append(outcome);
        AuditLog.write(context, "LAUNCHER_GRID_CONFIG", line.toString());
    }

    synchronized RootShell.Result mirrorAll() {
        FrameworkConfigSync.request();
        boolean synced = FrameworkConfigSync.isPublished(configSnapshot());
        return new RootShell.Result(synced ? 0 : 1,
                synced ? "框架配置已同步" : "启动配置等待框架后台同步", false);
    }

    synchronized RootShell.Result cleanupRetiredRuntimeSettings() {
        return LegacySettingsMigration.runIfAuthorized(context);
    }

    synchronized RootShell.Result initializeRuntimeMirrorsIfNeeded() {
        FrameworkConfigSync.request();
        return new RootShell.Result(0, "配置已交由框架后台同步", false);
    }

    synchronized RootShell.Result cleanupLegacyGlobalSettingsAfterHandshake() {
        return LegacySettingsMigration.runIfAuthorized(context);
    }

    static final class SaveResult {
        final boolean success;
        final boolean runtimeSynced;
        final String message;
        SaveResult(boolean success, String message) {
            this(success, message, false);
        }
        SaveResult(boolean success, String message, boolean runtimeSynced) {
            this.success = success;
            this.message = message;
            this.runtimeSynced = runtimeSynced;
        }
    }
}
