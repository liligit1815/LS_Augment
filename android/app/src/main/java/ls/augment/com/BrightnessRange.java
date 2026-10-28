package ls.augment.com;

import java.util.Locale;

/** Backlight interface calibration; percentages describe controls, never optical luminance. */
public final class BrightnessRange {
    public static final String ENABLED = "ls_augment_rm_full_brightness";
    public static final int NATIVE_MIN = 2, NATIVE_MAX = 7030, DRIVER_MAX = 8190;
    public static final int NORMAL_START = 500, NORMAL_END = 10500, SLIDER_MAX = 12150;
    private BrightnessRange() { }
    public static int clamp(int value) { return Math.max(0, Math.min(SLIDER_MAX, value)); }
    public static boolean extended(int value) { return value < NORMAL_START || value > NORMAL_END; }
    public static int driver(int value) {
        return driver(value, NATIVE_MAX, DRIVER_MAX);
    }
    public static boolean calibrated(int minimum, int maximum, int driverMaximum) {
        return minimum > 1 && maximum > minimum && driverMaximum > maximum && driverMaximum <= 1_000_000;
    }
    public static int driver(int value, int nativeMaximum, int driverMaximum) {
        value = clamp(value);
        if (value < NORMAL_START) return 1;
        if (value > NORMAL_END) return nativeMaximum + Math.round((value - NORMAL_END)
                * (driverMaximum - nativeMaximum) / (float) (SLIDER_MAX - NORMAL_END));
        return -1; // Native gamma/calibration remains owned by the OEM.
    }
    public static int fromNative(int value, int min, int max) {
        if (max <= min) return NORMAL_START;
        return NORMAL_START + Math.round(Math.max(0, Math.min(1, (value-min)/(float)(max-min))) * 10000f);
    }
    public static int toNative(int value, int min, int max) {
        return min + Math.round(Math.max(0, Math.min(1, (value-NORMAL_START)/10000f)) * (max-min));
    }
    public static String label(int value) {
        return label(value, NATIVE_MAX, DRIVER_MAX);
    }
    public static String label(int value, int nativeMaximum, int driverMaximum) {
        value = clamp(value);
        if (value < NORMAL_START) return "极低";
        if (value > NORMAL_END) return String.format(Locale.ROOT, "%.1f%%", driver(value,nativeMaximum,driverMaximum)*100.0/nativeMaximum);
        return Math.round((value-NORMAL_START)/100f) + "%";
    }
    public static boolean allowedCaller(int uid, int ownUid, String callingPackage, String[] packages) {
        if (uid == ownUid) return true;
        if (uid/100000 != ownUid/100000 || packages == null) return false;
        if (!"com.android.systemui".equals(callingPackage) && !"com.android.settings".equals(callingPackage)) return false;
        return java.util.Arrays.asList(packages).contains(callingPackage);
    }
}
