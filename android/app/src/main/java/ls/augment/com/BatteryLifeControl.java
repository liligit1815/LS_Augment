package ls.augment.com;

import android.content.Context;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Upgrade cleanup only: retire any overlay owned by the removed battery feature. */
final class BatteryLifeControl {
    private static final String ORIGINAL = "/vendor/etc/.tp/zte_battery_life.conf";
    private static final String DIRECTORY = "/data/adb/ls_augment/v2/battery";
    private static final String OVERLAY = DIRECTORY + "/life.conf";
    private static final String SERVICE = "vendor.zte.ldd-default";
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final ModuleWorkerDrain RUNS = new ModuleWorkerDrain();
    static void schedule(Context context) {
        schedule(context, () -> { });
    }
    static void schedule(Context context, Runnable completion) {
        if (ResetWriteFence.blocked()) { completion.run(); return; }
        long generation = ResetWriteFence.generation();
        Context app = context.getApplicationContext();
        if (!"GRANTED".equals(app.getSharedPreferences(AppConfig.DIAGNOSTICS, 0).getString("root_last_state", ""))) {
            completion.run();
            return;
        }
        ModuleWorkerDrain.Ticket ticket = RUNS.register(generation, () -> { });
        if (ticket == null) { completion.run(); return; }
        try {
            WORKER.execute(() -> {
                try { if (ticket.current()) restore(app); }
                finally { ticket.close(); completion.run(); }
            });
        } catch (java.util.concurrent.RejectedExecutionException unavailable) { ticket.close(); completion.run(); }
    }
    static boolean cancelPendingForReset() throws InterruptedException { return RUNS.cancelAndAwait(22_000L); }
    static synchronized RootShell.Result restore(Context context) {
        if (ResetWriteFence.blocked()) return new RootShell.Result(130, "正在重置，旧恢复任务已停止", false);
        long generation = ResetWriteFence.generation();
        String ownership = "[ -f '" + OVERLAY + "' ] && [ \"$(stat -c %d:%i '" + OVERLAY + "')\" = \"$(stat -c %d:%i '" + ORIGINAL + "')\" ]";
        String script = ownershipPreflight() + restartFunction() + "if " + ownership + "; then "
                + "umount '" + ORIGINAL + "' || exit 41; "
                + "if ! lsa_restart; then mount --bind '" + OVERLAY + "' '" + ORIGINAL + "'; "
                + "setprop ctl.restart '" + SERVICE + "'; exit 42; fi; fi; echo restored_vendor_policy";
        RootShell.Result result = rootNamespace(script, null);
        if (!ResetWriteFence.stale(generation)) context.getSharedPreferences(AppConfig.DIAGNOSTICS, 0).edit()
                .putString("ls_augment_battery_policy_runtime", result.output).commit();
        return result;
    }
    static String ownershipPreflight() {
        return """
                fail() { printf 'battery_restore:%s\\n' "$1" >&2; exit 74; }
                [ "$(id -u)" = 0 ] || fail root_required
                for parent in /data /data/adb /data/adb/ls_augment /data/adb/ls_augment/v2 /data/adb/ls_augment/v2/battery; do
                  [ ! -L "$parent" ] || fail symlink_parent
                  [ ! -e "$parent" ] || [ -d "$parent" ] || fail invalid_parent
                done
                for parent in /data/adb/ls_augment /data/adb/ls_augment/v2 /data/adb/ls_augment/v2/battery; do
                  if [ -e "$parent" ]; then
                    owner=$(stat -c '%u:%g:%a' "$parent") || fail parent_stat
                    case "$owner" in 0:0:700|0:0:750) ;; *) fail parent_ownership ;; esac
                  fi
                done
                overlay=/data/adb/ls_augment/v2/battery/life.conf
                [ ! -L "$overlay" ] || fail symlink_overlay
                if [ -e "$overlay" ]; then
                  [ -f "$overlay" ] || fail overlay_type
                  [ "$(readlink -f "$overlay")" = "$overlay" ] || fail overlay_canonical
                  owner=$(stat -c '%u:%g:%a' "$overlay") || fail overlay_stat
                  case "$owner" in 0:0:600|0:0:644|0:0:700) ;; *) fail overlay_ownership ;; esac
                  [ "$(stat -c %h "$overlay")" = 1 ] || fail overlay_hardlink
                  [ "$(stat -c %s "$overlay")" -le 65536 ] || fail overlay_size
                fi
                """;
    }
    private static RootShell.Result rootNamespace(String script, String input) {
        return RootShell.run("nsenter -t 1 -m -- sh -c " + RootShell.quote(script), input, 18, 65536);
    }
    private static String restartFunction() {
        return "lsa_restart() { lsa_old_pid=$(pidof vendor.zte.ldd.cmd-service); "
                + "setprop ctl.restart '" + SERVICE + "' || return 1; lsa_n=0; "
                + "while [ \"$(getprop init.svc." + SERVICE + ")\" != running ] || "
                + "[ -z \"$(pidof vendor.zte.ldd.cmd-service)\" ] || "
                + "[ \"$(pidof vendor.zte.ldd.cmd-service)\" = \"$lsa_old_pid\" ]; do "
                + "lsa_n=$((lsa_n+1)); [ $lsa_n -lt 10 ] || return 1; sleep 1; done; }; ";
    }
}
