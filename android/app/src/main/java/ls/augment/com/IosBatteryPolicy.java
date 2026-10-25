package ls.augment.com;

/** The supplied iOS artwork contains one vertical frame for each 1–100% level. */
public final class IosBatteryPolicy {
    public static final int FRAME_HEIGHT = 60;
    public static final String ASSET_DIRECTORY = "battery/ios/";
    private IosBatteryPolicy() { }

    /** Charging takes priority over performance; power saving has its own charging artwork. */
    public static String asset(boolean digits, boolean charging, boolean powerSave,
                               boolean performance, boolean darkGlyphs) {
        String suffix;
        if (powerSave) suffix = digits ? (charging ? "_power_save_digit_charge" : "_power_save_digit")
                : (charging ? "_power_save_charge" : "_power_save");
        else if (charging) suffix = digits ? "_charge_digit" : "_charge";
        else if (performance) suffix = digits ? "_performance_mode_digit" : "_performance_mode";
        else suffix = digits ? "_digital" : "";
        return "stat_sys_battery" + suffix + (darkGlyphs ? "_darkmode" : "") + ".png";
    }

    public static int frame(int level, int frameCount) {
        if (frameCount != 10 && frameCount != 100) throw new IllegalArgumentException("battery frame count");
        int bounded = Math.max(1, Math.min(100, level));
        return (bounded - 1) * frameCount / 100;
    }

    public static boolean containsDigits(int moduleDisplayStyle, int nativeDisplayMode) {
        return moduleDisplayStyle == 1 || moduleDisplayStyle == 0 && nativeDisplayMode == 1;
    }

    /** GameStrengthenModeCtrl writes 3 for high performance and 4 for chicken mode. */
    public static boolean performance(int mode) { return mode == 3 || mode == 4; }
    public static boolean powerSave(int mode, boolean nativePowerSave) { return nativePowerSave || mode == 1; }
}
