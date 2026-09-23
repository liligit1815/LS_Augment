package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.service.quicksettings.TileService;
import java.util.LinkedHashMap;
import java.util.Map;

/** Resets ordinary settings without changing application visibility or independent target records. */
final class ConfigResetController {
    private ConfigResetController() { }

    static synchronized Result reset(Context context) {
        RootHideManager.ACTION_LOCK.lock();
        try { return resetLocked(context); }
        finally { RootHideManager.ACTION_LOCK.unlock(); }
    }

    private static Result resetLocked(Context context) {
        Context app = context.getApplicationContext();
        AppConfig config = new AppConfig(app);
        Map<String, String> before = config.snapshot();
        LinkedHashMap<String, String> paused = new LinkedHashMap<>();
        paused.put(ConfigSchema.HIDE_MASTER, "0");
        paused.put(ConfigSchema.AUTOMATION_ENABLED, "0");
        AppConfig.SaveResult pause = config.save(paused);
        if (!pause.success) return failure(app, "重置未完成：" + pause.message);
        ScreenAutomation.sync(app);
        // Reset is never a SHOW command. The independent target file is retained
        // even when Root is denied or its contents cannot currently be read.
        Map<String, String> defaults = new LinkedHashMap<>(ConfigSchema.defaults());
        defaults.put(ConfigSchema.HIDE_TARGETS, before.get(ConfigSchema.HIDE_TARGETS));
        AppConfig.SaveResult saved = config.save(defaults);
        if (!saved.success) return failure(app, "重置未完成：" + saved.message);
        if(!app.getSharedPreferences("native_value_overrides",0).edit().clear().commit())
            return failure(app,"配置已恢复默认，界面记忆未能清除，请重试重置。");
        app.getSharedPreferences("native_launcher_drafts",0).edit().clear().commit();
        try {
            app.getPackageManager().setComponentEnabledSetting(
                    new ComponentName(app, app.getPackageName() + ".LauncherAlias"),
                    PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, PackageManager.DONT_KILL_APP);
            ScreenAutomation.sync(app);
            TileService.requestListeningState(app, new ComponentName(app, AugmentTileService.class));
        } catch (RuntimeException error) {
            return failure(app, "配置已恢复默认，桌面入口或磁贴刷新未完成：" + error.getClass().getSimpleName());
        }
        AuditLog.write(app, "CONFIG_RESET", "settings=" + ConfigSchema.keys().size()
                + " runtime_synced=" + saved.runtimeSynced);
        if (!saved.runtimeSynced)
            return new Result(true, true, false, "模块配置已恢复默认，独立应用名单和隐藏状态已保留。启动配置正等待框架后台同步，无需重新重置；同步完成后再重启手机。");
        return new Result(true, true, "模块配置已恢复默认，独立应用名单和隐藏状态已保留。请重启手机，使所有作用域按默认配置运行。");
    }

    private static Result failure(Context context, String message) {
        AuditLog.write(context, "CONFIG_RESET_FAILED", message);
        return new Result(false, false, message);
    }

    static final class Result {
        final boolean success;
        final boolean settingsReset;
        final boolean runtimeSynced;
        final boolean reviewRequired;
        final String message;
        Result(boolean success, boolean settingsReset, String message) {
            this(success, settingsReset, success, message);
        }
        Result(boolean success, boolean settingsReset, boolean runtimeSynced, String message) {
            this(success, settingsReset, runtimeSynced, false, message);
        }
        Result(boolean success, boolean settingsReset, boolean runtimeSynced, boolean reviewRequired, String message) {
            this.success = success;
            this.settingsReset = settingsReset;
            this.runtimeSynced = runtimeSynced;
            this.reviewRequired = reviewRequired;
            this.message = message;
        }
    }
}
