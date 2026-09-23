package ls.augment.com.hook;

import java.util.function.Predicate;

/** Separates verified level control from the older ROM's OEM-only full-speed request. */
final class FanCompatibilityProfile {
    static final String KERNEL = "sys/kernel/fan/";
    static final String LEDS = "sys/class/leds/fan/";
    enum Kind { VERIFIED_LEVELS, OEM_FULL_SPEED, UNAVAILABLE }

    final Kind kind;
    final String enableNode;
    final String rpmNode;
    final String powerMethod;
    final String reason;

    private FanCompatibilityProfile(Kind kind, String enableNode, String rpmNode,
            String powerMethod, String reason) {
        this.kind = kind;
        this.enableNode = enableNode;
        this.rpmNode = rpmNode;
        this.powerMethod = powerMethod;
        this.reason = reason;
    }

    static FanCompatibilityProfile resolve(String device, String product, String model,
            boolean hasMaxSpeed, boolean hasFullSpeed, boolean hasCancel, boolean hasNotify,
            Predicate<String> exists) {
        boolean nx809j = named("NX809J", device, product, model);
        boolean nx769j = named("NX769J", device, product, model);
        if (!nx809j && !nx769j) return unavailable("device_unverified");
        if (!hasCancel || !hasNotify) return unavailable("oem_restore_interface_missing");
        if (nx809j) {
            if (!hasMaxSpeed) return unavailable("oem_max_speed_interface_missing");
            if (!exists.test(KERNEL + "fan_enable") || !exists.test(KERNEL + "fan_speed_level")
                    || !exists.test(KERNEL + "fan_speed_count")) {
                return unavailable("verified_level_nodes_missing");
            }
            return new FanCompatibilityProfile(Kind.VERIFIED_LEVELS, KERNEL + "fan_enable",
                    KERNEL + "fan_speed_count", "fanMaxSpeed", "");
        }
        if (!hasFullSpeed) return unavailable("oem_full_speed_interface_missing");
        // Same enable-node selection as this device's FanControllerImpl.setFanEnable.
        String base = exists.test(KERNEL + "fan_enable") ? KERNEL
                : exists.test(LEDS + "fan_enable") ? LEDS : "";
        if (base.isEmpty()) return unavailable("oem_enable_node_missing");
        String rpm = exists.test(base + "fan_speed_count") ? base + "fan_speed_count" : "";
        return new FanCompatibilityProfile(Kind.OEM_FULL_SPEED, base + "fan_enable", rpm,
                "fanFullSpeed", "fixed_speed_unverified");
    }

    boolean supported() { return kind != Kind.UNAVAILABLE; }
    boolean allowsLevelWrites() { return kind == Kind.VERIFIED_LEVELS; }
    String capability() {
        return kind == Kind.VERIFIED_LEVELS ? "verified_levels_1_5"
                : kind == Kind.OEM_FULL_SPEED ? "oem_full_speed_only" : "unavailable";
    }

    private static boolean named(String expected, String device, String product, String model) {
        return expected.equalsIgnoreCase(device) || expected.equalsIgnoreCase(product)
                || expected.equalsIgnoreCase(model);
    }

    private static FanCompatibilityProfile unavailable(String reason) {
        return new FanCompatibilityProfile(Kind.UNAVAILABLE, "", "", "", reason);
    }
}
