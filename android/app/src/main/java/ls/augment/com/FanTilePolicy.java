package ls.augment.com;

/** Narrow protocol for the built-in SystemUI fan panel. Zero releases manual control. */
public final class FanTilePolicy {
    private FanTilePolicy() { }
    public static boolean validSelection(int level) { return level >= 0 && level <= 5; }
    public static boolean allowedCaller(int uid, int providerUid, String caller, String[] packages) {
        if (uid < 0 || providerUid < 0 || uid / 100000 != providerUid / 100000
                || !"com.android.systemui".equals(caller) || packages == null) return false;
        for (String pkg : packages) if (caller.equals(pkg)) return true;
        return false;
    }
    public static int parseHardware(String value, int min, int max) {
        try { int n = Integer.parseInt(value.trim()); return n >= min && n <= max ? n : -1; }
        catch (RuntimeException invalid) { return -1; }
    }
}
