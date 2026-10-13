package ls.augment.com;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/** Retires generated motion derivatives, preserving original OEM recordings and every native setting. */
final class GameHelperResetCache {
    private static final String PACKAGE = "cn.nubia.gamehelpmodule";
    private GameHelperResetCache() { }

    /** Only after combo has been disabled and FrameworkConfigSync.publishForReset(false) succeeded. */
    static Result clearAfterPause(Context context, boolean published) {
        if (!published) return failure("连招暂停尚未同步，未清理游戏助手缓存");
        Context appContext = context.getApplicationContext();
        if (new AppConfig(appContext).getBoolean(AppConfig.COMBO_SPEED_ENABLED))
            return failure("连招速度尚未关闭，未清理游戏助手缓存");
        if (!ComboMotionPrivateCache.clear(appContext)) return failure("模块私有连招缓存未能清理");
        return retireLegacy(appContext);
    }

    /** Upgrade retirement leaves the user configuration untouched and stops only an old writer. */
    static Result retireLegacy(Context context) {
        Context appContext = context.getApplicationContext();
        int user = android.os.Process.myUid() / 100000;
        HideUserIdentity.Snapshot identity = HideUserIdentity.read(appContext, user);
        if (!identity.success) return failure("游戏助手用户身份未确认");
        ApplicationInfo app;
        try { app = appContext.getPackageManager().getApplicationInfo(PACKAGE, 0); }
        catch (PackageManager.NameNotFoundException absent) { return new Result(true, 0, "当前用户未安装游戏助手"); }
        catch (RuntimeException unavailable) { return failure("游戏助手身份暂不可读取"); }
        String base = "/data/user/" + user + "/" + PACKAGE;
        if (!PACKAGE.equals(app.packageName) || app.uid / 100000 != user || app.dataDir == null
                || !(app.dataDir.equals(base) || user == 0 && app.dataDir.equals("/data/data/" + PACKAGE)))
            return failure("游戏助手身份或目录不一致");
        String script;
        try (InputStream input = appContext.getAssets().open("gamehelper_reset_cache.sh")) {
            script = new String(input.readAllBytes(), StandardCharsets.UTF_8);
        } catch (Exception missing) { return failure("无法读取游戏助手缓存清理程序"); }
        if (!HideUserIdentity.match(appContext, user, identity.userSerial).success)
            return failure("游戏助手用户空间已变化，未清理缓存");
        // App-created su inherits Android's isolated app-data mounts. Check and
        // retire this other app's records in init's view, without weakening paths.
        RootShell.Result removed = RootShell.run("nsenter -t 1 -m -- sh", "expected_user=" + user + "\nexpected_uid=" + app.uid
                + "\nbase=" + RootShell.quote(base) + "\n" + script, 20, 4096);
        if (!removed.isSuccess() || removed.capture == null || !removed.capture.reliable()
                || !removed.output.matches("GAMEHELPER_CACHE_CLEARED:[0-9]{1,6}"))
            return failure("游戏助手缓存未能安全清理：" + removed.publicError());
        if (!HideUserIdentity.match(appContext, user, identity.userSerial).success)
            return failure("游戏助手缓存清理后用户空间已变化，请核对");
        return new Result(true, Integer.parseInt(removed.output.substring(25)), "模块生成的连招缓存已清理");
    }
    private static Result failure(String text) { return new Result(false, 0, text); }
    static final class Result {
        final boolean success; final int count; final String message;
        Result(boolean success, int count, String message) { this.success = success; this.count = count; this.message = message; }
    }
}
