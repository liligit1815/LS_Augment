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
    static void schedule(Context context) {
        schedule(context, () -> { });
    }
    static void schedule(Context context, Runnable completion) {
        Context app = context.getApplicationContext();
        if (!"GRANTED".equals(app.getSharedPreferences(AppConfig.DIAGNOSTICS, 0).getString("root_last_state", ""))) {
            completion.run();
            return;
        }
        WORKER.execute(() -> {
            try { restore(app); }
            finally { completion.run(); }
        });
    }
    static synchronized RootShell.Result restore(Context context) {
        String ownership = "[ -f '" + OVERLAY + "' ] && [ \"$(stat -c %d:%i '" + OVERLAY + "')\" = \"$(stat -c %d:%i '" + ORIGINAL + "')\" ]";
        String script = restartFunction() + "if " + ownership + "; then "
                + "umount '" + ORIGINAL + "' || exit 41; "
                + "if ! lsa_restart; then mount --bind '" + OVERLAY + "' '" + ORIGINAL + "'; "
                + "setprop ctl.restart '" + SERVICE + "'; exit 42; fi; fi; echo restored_vendor_policy";
        RootShell.Result result = rootNamespace(script, null);
        context.getSharedPreferences(AppConfig.DIAGNOSTICS, 0).edit()
                .putString("ls_augment_battery_policy_runtime", result.output).apply();
        return result;
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
