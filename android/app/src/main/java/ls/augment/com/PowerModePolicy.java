package ls.augment.com;

/** Fixed reboot targets; never accept shell text from an IPC caller. */
public final class PowerModePolicy {
    public static final String CALL = "power_mode_reboot";
    private PowerModePolicy() { }

    public static String command(String reason) {
        if ("bootloader".equals(reason) || "fastboot".equals(reason)
                || "recovery".equals(reason) || "edl".equals(reason))
            return "/system/bin/reboot " + reason;
        return null;
    }

    public static boolean allowedCaller(int uid, int ownUid, String callingPackage, String[] packages) {
        return uid >= 0 && uid / 100000 == ownUid / 100000
                && "com.android.systemui".equals(callingPackage)
                && packages != null && java.util.Arrays.asList(packages).contains(callingPackage);
    }
}
