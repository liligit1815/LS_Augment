package ls.augment.com;

import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.Settings;
import java.util.LinkedHashMap;

/** Validated configuration commands and fixed-path, read-only hardware telemetry. */
final class FanTileControl {
    private static long sampledAt = -10000;
    private static Bundle sample = new Bundle();
    private FanTileControl() { }

    static synchronized Bundle call(Context context, String method, String arg, Bundle extras) {
        Bundle result = new Bundle();
        AppConfig config = new AppConfig(context);
        String installed = context.getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                .getString("ls_augment_fan_control_installed", "");
        // The application UID cannot stat this sysfs directory under SELinux.
        // Capability is probed in the OEM fan process, where hardware access lives.
        boolean supported = ("NX809J".equalsIgnoreCase(Build.DEVICE)
                || "NX809J".equalsIgnoreCase(Build.MODEL) || "NX809J".equalsIgnoreCase(Build.PRODUCT))
                && installed.contains("capability=verified_levels_1_5");
        if ("fan_tile_select".equals(method)) {
            if (arg != null || extras == null || extras.size() != 1
                    || !(extras.get("level") instanceof Integer)) return result;
            int level = extras.getInt("level", -1);
            if (!FanTilePolicy.validSelection(level)) return result;
            if (level > 0 && !supported) return fail("此机型尚未验证固定档位");
            String calibration = config.get(ConfigSchema.FAN_CALIBRATION_REQUEST);
            if (FanCalibrationData.validRequest(calibration, System.currentTimeMillis()))
                return fail("正在测量转速，请完成或取消测量后再选择");
            if (level > 0 && !installed.contains("capability=verified_levels_1_5"))
                return fail("风扇控制尚未就绪，请重启风扇作用域");
            LinkedHashMap<String, String> updates = new LinkedHashMap<>();
            if (level > 0) updates.put(ConfigSchema.FAN_FIXED_LEVEL, String.valueOf(level));
            updates.put(ConfigSchema.FAN_FIXED_ENABLED, level > 0 ? "1" : "0");
            updates.put(ConfigSchema.FAN_TILE_REQUEST, java.util.UUID.randomUUID().toString().replace("-", ""));
            // Match the module editor: an explicit feature selection enables its master.
            if (level > 0) updates.put(ConfigSchema.GAME_MASTER, "1");
            AppConfig.SaveResult saved = config.save(updates);
            result.putBoolean("ok", saved.success);
            result.putString("message", saved.message);
            return result;
        }
        if (arg != null || extras != null) return result;
        result.putBoolean("ok", true);
        result.putBoolean("supported", supported);
        result.putInt("rememberedLevel", Math.max(1, config.getInt(ConfigSchema.FAN_FIXED_LEVEL, 1)));
        result.putInt("selected", config.getBoolean(ConfigSchema.GAME_MASTER)
                && config.getBoolean(ConfigSchema.FAN_FIXED_ENABLED)
                ? config.getInt(ConfigSchema.FAN_FIXED_LEVEL, 0) : 0);
        result.putBoolean("fixedRpm", config.getBoolean(ConfigSchema.GAME_MASTER)
                && config.getBoolean(ConfigSchema.FAN_FIXED_ENABLED)
                && config.getInt(ConfigSchema.FAN_FIXED_LEVEL, 0) == 0);
        result.putString("request", config.get(ConfigSchema.FAN_TILE_REQUEST));
        result.putInt("mode", Settings.System.getInt(context.getContentResolver(), "fan_state_of_mode", -1));
        result.putBoolean("manual", Settings.System.getInt(context.getContentResolver(), "fan_state_of_manual", 0) > 0);
        result.putBoolean("measuring", FanCalibrationData.validRequest(config.get(ConfigSchema.FAN_CALIBRATION_REQUEST), System.currentTimeMillis()));
        result.putString("control", context.getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                .getString("ls_augment_fan_control_active", ""));
        if (supported) result.putAll(sampleHardware());
        return result;
    }

    private static Bundle sampleHardware() {
        long now = SystemClock.elapsedRealtime();
        if (now - sampledAt < 800) return new Bundle(sample);
        RootShell.Result read = RootShell.run("cat /sys/kernel/fan/fan_enable /sys/kernel/fan/fan_speed_level /sys/kernel/fan/fan_speed_count", null, 2, 512);
        Bundle next = new Bundle();
        if (read.isSuccess()) {
            String[] lines = read.output.trim().split("\\s+");
            if (lines.length == 3) {
                int enabled = FanTilePolicy.parseHardware(lines[0], 0, 1);
                int level = FanTilePolicy.parseHardware(lines[1], 0, 5);
                int rpm = FanTilePolicy.parseHardware(lines[2], 0, 100000);
                next.putBoolean("hardwareValid", enabled >= 0 && level >= 0 && rpm >= 0);
                next.putInt("enabled", enabled); next.putInt("level", level); next.putInt("rpm", rpm);
            }
        }
        sampledAt = SystemClock.elapsedRealtime();
        next.putLong("sampledAt", sampledAt); sample = next;
        return new Bundle(sample);
    }
    private static Bundle fail(String message) {
        Bundle result = new Bundle(); result.putBoolean("ok", false); result.putString("message", message); return result;
    }
}
