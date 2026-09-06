package ls.augment.com;

import android.content.Context;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Root owns a reversible file overlay. Original vendor files and counters are never written. */
final class BatteryLifeControl {
    private static final String ORIGINAL = "/vendor/etc/.tp/zte_battery_life.conf";
    private static final String DIRECTORY = "/data/adb/ls_augment/v2/battery";
    private static final String OVERLAY = DIRECTORY + "/life.conf";
    private static final String SERVICE = "vendor.zte.ldd-default";
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final String[] FILES = {
            "/sys/class/power_supply/battery/cycle_count",
            "/sys/class/qcom-battery/battery_cycle",
            "/mnt/vendor/persist/zstats/cycle.dat",
            "/sys/class/power_supply/battery/charge_full",
            "/sys/class/power_supply/battery/charge_full_design",
            "/sys/class/power_supply/battery/voltage_max",
            "/sys/class/qcom-battery/soh", "/sys/class/qcom-battery/cis_level",
            "/sys/class/qcom-battery/expan_level", ORIGINAL
    };
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
            try { reconcile(app, new AppConfig(app).getBoolean(ConfigSchema.BATTERY_DISABLE_AGE_REDUCTION)); }
            finally { completion.run(); }
        });
    }
    static Map<String, String> read() {
        StringBuilder command = new StringBuilder();
        for (String path : FILES) command.append("printf '\\nLSA_FILE:").append(path)
                .append("\\n'; head -c 32768 ").append(RootShell.quote(path)).append(" 2>/dev/null; printf '\\nLSA_END\\n'; ");
        RootShell.Result result = RootShell.run(command.toString(), null, 12, 65536);
        LinkedHashMap<String, String> values = new LinkedHashMap<>();
        if (!result.isSuccess()) { values.put("error", "Root 读取失败：" + result.output); return values; }
        for (String part : result.output.split("LSA_FILE:")) {
            int line = part.indexOf('\n'), end = part.indexOf("\nLSA_END");
            if (line > 0 && end >= line) {
                String value = part.substring(line + 1, end).trim();
                if (!value.isEmpty()) values.put(part.substring(0, line).trim(), value);
            }
        }
        return values;
    }
    static synchronized RootShell.Result reconcile(Context context, boolean enabled) {
        String ownership = "[ -f '" + OVERLAY + "' ] && [ \"$(stat -c %d:%i '" + OVERLAY + "')\" = \"$(stat -c %d:%i '" + ORIGINAL + "')\" ]";
        RootShell.Result result;
        if (!enabled) {
            String script = restartFunction() + "if " + ownership + "; then "
                    + "umount '" + ORIGINAL + "' || exit 41; "
                    + "if ! lsa_restart; then mount --bind '" + OVERLAY + "' '" + ORIGINAL + "'; "
                    + "setprop ctl.restart '" + SERVICE + "'; exit 42; fi; fi; echo restored_vendor_policy";
            result = rootNamespace(script, null);
        } else {
            RootShell.Result current = rootNamespace("cat '" + ORIGINAL + "'", null);
            Boolean reduction = current.isSuccess() ? BatteryLifePolicy.reductionEnabled(current.output) : null;
            if (reduction == null) result = new RootShell.Result(40, "未识别到可确认的原厂按循环降压配置，未进行修改", false);
            else if (!reduction) result = new RootShell.Result(0, "按循环降压已关闭；未改动循环次数、健康度或充电保护", false);
            else {
                String changed = BatteryLifePolicy.disableReduction(current.output);
                String script = "set -e; " + restartFunction()
                        + "lsa_committed=0; rollback() { if " + ownership + "; then umount '" + ORIGINAL
                        + "' || return; setprop ctl.restart '" + SERVICE + "'; fi; }; "
                        + "trap 'if [ $lsa_committed -ne 1 ]; then rollback; fi' EXIT; "
                        + "trap 'exit 46' HUP INT TERM; umask 077; mkdir -p '" + DIRECTORY + "'; "
                        + "if " + ownership + "; then umount '" + ORIGINAL + "'; fi; "
                        + "cat > '" + OVERLAY + "'; chmod 0644 '" + OVERLAY + "'; "
                        + "chcon \"$(ls -Zd '" + ORIGINAL + "' | awk '{print $1}')\" '" + OVERLAY + "'; "
                        + "mount --bind '" + OVERLAY + "' '" + ORIGINAL + "'; "
                        + "cmp -s '" + OVERLAY + "' '" + ORIGINAL + "' || exit 43; "
                        + "lsa_restart || exit 45; lsa_committed=1; trap - EXIT HUP INT TERM; "
                        + "echo age_voltage_reduction_disabled_and_service_reloaded";
                result = rootNamespace(script, changed);
            }
        }
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
