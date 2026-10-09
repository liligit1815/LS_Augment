package ls.augment.com;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Process;
import android.os.SystemClock;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/** Deletes only health-hook private records after health work has been paused. */
final class HealthResetController {
    private static final String PACKAGE = "com.mi.health";
    private static final String[] PAUSED_KEYS = {
            ConfigSchema.HEALTH_ENABLED, ConfigSchema.HEALTH_BACKGROUND,
            ConfigSchema.HEALTH_MULTIPLY_ENABLED, ConfigSchema.HEALTH_PLAN_ENABLED,
            ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED
    };
    static final String HISTORY_LIMITATION = "健康应用已有的历史步数和云端记录未能还原：旧记录未保留完整原值，不能安全回退。";

    private HealthResetController() { }

    /**
     * Call after pausing all PAUSED_KEYS, publishing that snapshot and restoring
     * module-hidden applications. This method never saves settings or clears the
     * user's real health login/database. Caller clears HEALTH_ACCOUNT, HEALTH_SINCE
     * and HEALTH_PLAN when committing final module defaults.
     */
    static Result clearModuleRecords(Context context, boolean runtimeSynced) {
        if (context == null) return failure(null, "健康清理缺少应用上下文");
        Context app = context.getApplicationContext();
        AppConfig config = new AppConfig(app);
        if (!runtimeSynced) return failure(app, "健康功能暂停配置尚未同步，未清除健康记录");
        for (String key : PAUSED_KEYS) if (config.getBoolean(key))
            return failure(app, "健康功能仍在运行，未清除健康记录");
        boolean configured = !config.get(ConfigSchema.HEALTH_ACCOUNT).isEmpty()
                || !config.get(ConfigSchema.HEALTH_PLAN).isEmpty()
                || !"0".equals(config.get(ConfigSchema.HEALTH_SINCE));
        int user = Process.myUid() / 100000;
        HideUserIdentity.Snapshot identity = HideUserIdentity.read(app, user);
        if (!identity.success) return failure(app, "健康清理无法核验当前用户：" + identity.message);
        ApplicationInfo health;
        try {
            health = app.getPackageManager().getApplicationInfo(PACKAGE, 0);
        } catch (PackageManager.NameNotFoundException missing) {
            // A hidden package can also be reported missing. Do not treat that as
            // proof of cleanup; the reset coordinator restores module-owned hides
            // before invoking this operation.
            return absentPackage(app, user, identity.userSerial, configured);
        } catch (RuntimeException unavailable) {
            return failure(app, "无法读取健康应用身份：" + unavailable.getClass().getSimpleName());
        }
        String base = "/data/user/" + user + "/" + PACKAGE;
        if (!PACKAGE.equals(health.packageName) || health.uid / 100000 != user
                || health.uid % 100000 < 10000 || health.dataDir == null
                || !(base.equals(health.dataDir)
                    || user == 0 && ("/data/data/" + PACKAGE).equals(health.dataDir)))
            return failure(app, "健康应用用户或数据目录不匹配，未清除健康记录");
        // FeatureSettings dispatches asynchronously. Give its pause notification
        // a turn before force-stopping; the shell independently rejects live UIDs.
        SystemClock.sleep(1500L);
        for (String key : PAUSED_KEYS) if (config.getBoolean(key))
            return failure(app, "健康功能在清理前重新开启，未清除健康记录");
        if (!HideUserIdentity.match(app, user, identity.userSerial).success)
            return failure(app, "当前用户身份已变化，未清除健康记录");
        String script;
        try (InputStream input = app.getAssets().open("health_reset_cleanup.sh")) {
            script = "expected_uid=" + health.uid + "\nexpected_user=" + user
                    + "\nbase=" + RootShell.quote(base) + "\n"
                    + new String(input.readAllBytes(), StandardCharsets.UTF_8);
        } catch (IOException missing) {
            return failure(app, "无法读取健康清理程序");
        }
        RootShell.Result cleanup = RootShell.run("nsenter -t 1 -m -- sh", script, 15L, 4096);
        if (!cleanup.isSuccess()) return failure(app, "模块健康记录清理未完成：" + cleanup.publicError());
        int files = outputNumber(cleanup.output, "HEALTH_RESET_FILES=");
        int ledger = outputNumber(cleanup.output, "HEALTH_RESET_LEDGER_PRESENT=");
        if (files < 0 || files > 5 || ledger < 0 || ledger > 1)
            return failure(app, "模块健康记录清理结果无法核验");
        if (!HideUserIdentity.match(app, user, identity.userSerial).success)
            return failure(app, "健康清理后用户身份已变化，请核对当前用户");
        boolean history = configured || ledger == 1;
        AuditLog.write(app, "HEALTH_RESET", "user=" + user + " module_files_removed=" + files
                + " native_history_restored=false history_may_be_modified=" + history);
        return new Result(true, files, ledger == 1, history, history ? HISTORY_LIMITATION : "");
    }

    private static Result absentPackage(Context context, int user, long serial, boolean configured) {
        String base = "/data/user/" + user + "/" + PACKAGE;
        // NameNotFound is not proof of an empty sandbox (a hidden app is one
        // counterexample). Only the exact non-existent package directory is safe
        // to classify as having no remaining module ledger.
        String command = "[ \"$(id -u)\" = 0 ] || exit 73\n"
                + "if cmd package list packages --user " + user + " com.mi.health 2>/dev/null"
                + " | grep -Fx 'package:com.mi.health' >/dev/null; then exit 73; fi\n"
                + "[ ! -e " + RootShell.quote(base) + " ] && [ ! -L " + RootShell.quote(base)
                + " ] || exit 73\nprintf 'HEALTH_RESET_ABSENT=1\\n'";
        // The module's isolated mount namespace cannot prove another sandbox is
        // absent. Use the same init namespace as the installed-package cleanup.
        RootShell.Result absent = RootShell.run("nsenter -t 1 -m -- sh", command, 8L, 1024);
        if (!absent.isSuccess() || !"HEALTH_RESET_ABSENT=1".equals(absent.output)
                || !HideUserIdentity.match(context, user, serial).success)
            return failure(context, "未找到当前用户的小米运动健康，无法核验模块健康记录是否已清除");
        AuditLog.write(context, "HEALTH_RESET", "user=" + user
                + " health_package_absent=true module_files_removed=0 native_history_restored=false");
        return new Result(true, 0, false, configured, configured ? HISTORY_LIMITATION : "");
    }

    static int outputNumber(String output, String prefix) {
        int value = -1;
        for (String line : output.split("\\r?\\n")) if (line.startsWith(prefix)) {
            if (value != -1) return -1;
            String number = line.substring(prefix.length());
            if (!number.matches("[0-9]")) return -1;
            value = Integer.parseInt(number);
        }
        return value;
    }

    private static Result failure(Context context, String message) {
        AuditLog.write(context, "HEALTH_RESET_FAILED", message);
        return new Result(false, 0, false, false, message);
    }

    static final class Result {
        final boolean success;
        final int removedModuleFiles;
        final boolean moduleLedgerPresent;
        final boolean historyMayHaveBeenModified;
        final boolean historicalStepsRestored = false;
        final String message;
        Result(boolean success, int files, boolean ledger, boolean history, String message) {
            this.success = success;
            this.removedModuleFiles = files;
            this.moduleLedgerPresent = ledger;
            this.historyMayHaveBeenModified = history;
            this.message = message;
        }
    }
}
