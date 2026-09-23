package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;

/** One-way cleanup of this module's old namespace, after the replacement is published. */
final class LegacySettingsMigration {
    private static final Object LOCK = new Object();
    private static final java.util.concurrent.atomic.AtomicBoolean QUEUED = new java.util.concurrent.atomic.AtomicBoolean();
    private static final java.util.concurrent.ExecutorService WORKER = java.util.concurrent.Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "LSA-LegacyCleanup"); t.setDaemon(true); return t;
    });
    private LegacySettingsMigration() { }

    static void request(Context context) {
        if (!QUEUED.compareAndSet(false, true)) return;
        Context app = context.getApplicationContext();
        WORKER.execute(() -> {
            try { runIfAuthorized(app); }
            finally { QUEUED.set(false); }
        });
    }

    static RootShell.Result runIfAuthorized(Context context) {
        synchronized (LOCK) {
            SharedPreferences diagnostics = context.getSharedPreferences(AppConfig.DIAGNOSTICS, 0);
            if (diagnostics.getBoolean("global_namespace_cleaned_v2", false))
                return new RootShell.Result(0, "旧模块数据已迁移", false);
            String boot = ModuleRuntimeStatus.bootId();
            String firstCleanupBoot = diagnostics.getString("global_namespace_cleanup_boot_v2", "");
            if (!boot.isEmpty() && boot.equals(firstCleanupBoot))
                return new RootShell.Result(0, "旧模块数据已清理，将在重启后复核", false);
            if (diagnostics.getBoolean("root_prompt_suppressed", false)
                    || !"GRANTED".equals(diagnostics.getString("root_last_state", "")))
                return new RootShell.Result(1, "将在下次已授权的 Root 操作中清理旧模块数据", false);
            if (!CrashFuseStore.importLegacy(context))
                return new RootShell.Result(1, "安全状态尚未迁移，保留旧数据", false);
            // Only literal ls_augment_ keys with a restricted identifier may reach settings delete.
            // Delete exact legacy files; no recursive deletion or other system paths.
            String command = "set -e; entries=$(settings list global) || exit 1; "
                    + "printf '%s\\n' \"$entries\" | while IFS= read -r entry; do "
                    + "case \"$entry\" in ls_augment_*=*) key=${entry%%=*}; "
                    + "case \"$key\" in *[!a-zA-Z0-9_]*) continue;; esac; "
                    + "settings delete global \"$key\" >/dev/null;; esac; done; "
                    + "if [ ! -L /data/system/ls_augment ]; then "
                    + "rm -f /data/system/ls_augment/boot-config-v1 /data/system/ls_augment/boot-config-v1.tmp; "
                    + "rmdir /data/system/ls_augment 2>/dev/null || true; fi";
            RootShell.Result removed = RootShell.run(command, null, 30, 4096);
            if (removed.isSuccess()) {
                // Old in-memory hooks may still write until their next process/OS restart.
                // A second cleanup in a later boot removes those final legacy writes.
                diagnostics.edit().putString("global_namespace_cleanup_boot_v2", boot)
                        .putBoolean("global_namespace_cleaned_v2", !firstCleanupBoot.isEmpty()
                                && !boot.isEmpty() && !boot.equals(firstCleanupBoot)).commit();
            }
            return removed;
        }
    }
}
