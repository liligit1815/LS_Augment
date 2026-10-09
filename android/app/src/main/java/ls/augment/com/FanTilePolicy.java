package ls.augment.com;

/** Only levels 1–5 control speed; protocol zero releases it and is never a fixed level. */
public final class FanTilePolicy {
    private FanTilePolicy() { }
    public static boolean supportedDevice(String device, String model, String product) {
        return "NX809J".equalsIgnoreCase(device) || "NX809J".equalsIgnoreCase(model)
                || "NX809J".equalsIgnoreCase(product);
    }
    public static boolean validSelection(int level) { return level >= 0 && level <= 5; }
    /** Selecting a speed enables only the existing fan controller; zero preserves its remembered speed. */
    public static java.util.LinkedHashMap<String, String> selectionUpdates(int level) {
        if (!validSelection(level)) throw new IllegalArgumentException("Invalid fan level");
        java.util.LinkedHashMap<String, String> updates = new java.util.LinkedHashMap<>();
        if (level > 0) updates.put(ConfigSchema.FAN_FIXED_LEVEL, String.valueOf(level));
        updates.put(ConfigSchema.FAN_FIXED_ENABLED, level > 0 ? "1" : "0");
        updates.put(ConfigSchema.FAN_TILE_REQUEST, java.util.UUID.randomUUID().toString().replace("-", ""));
        if (level > 0) updates.put(ConfigSchema.GAME_MASTER, "1");
        return updates;
    }
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
