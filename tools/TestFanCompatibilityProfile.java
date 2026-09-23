package ls.augment.com.hook;

import java.util.HashSet;
import java.util.Set;

/** Profile regressions: old-ROM OEM control must never authorize level writes. */
public final class TestFanCompatibilityProfile {
    public static void main(String[] args) {
        Set<String> kernel = nodes(FanCompatibilityProfile.KERNEL);
        FanCompatibilityProfile old = resolve("NX769J", false, true, true, true, kernel);
        check(old.kind == FanCompatibilityProfile.Kind.OEM_FULL_SPEED, "NX769J OEM API admitted");
        check(!old.allowsLevelWrites(), "existing 0..5-looking nodes do not prove old-ROM bounds");
        check(old.powerMethod.equals("fanFullSpeed"), "113 method kept distinct from max-speed API");

        Set<String> enableOnly = new HashSet<>();
        enableOnly.add(FanCompatibilityProfile.LEDS + "fan_enable");
        FanCompatibilityProfile leds = resolve("NX769J", false, true, true, true, enableOnly);
        check(leds.supported(), "stock full speed needs no unproven RPM/level node");
        check(leds.enableNode.equals(FanCompatibilityProfile.LEDS + "fan_enable"), "OEM fallback node");
        check(leds.rpmNode.isEmpty(), "missing RPM is not invented");
        check(!leds.allowsLevelWrites(), "fallback node cannot authorize calibration");
        enableOnly.add(FanCompatibilityProfile.KERNEL + "fan_enable");
        check(resolve("NX769J", false, true, true, true, enableOnly).enableNode
                .equals(FanCompatibilityProfile.KERNEL + "fan_enable"), "OEM kernel preference preserved");

        FanCompatibilityProfile newer = resolve("NX809J", true, true, true, true, kernel);
        check(newer.allowsLevelWrites(), "verified NX809J levels preserved");
        check(newer.powerMethod.equals("fanMaxSpeed"), "NX809J retains its max-speed path");
        kernel.remove(FanCompatibilityProfile.KERNEL + "fan_speed_count");
        check(!resolve("NX809J", true, true, true, true, kernel).supported(), "no fixed control without RPM");

        Set<String> all = nodes(FanCompatibilityProfile.KERNEL);
        all.addAll(nodes(FanCompatibilityProfile.LEDS));
        check(!resolve("NX769J", true, false, true, true, all).supported(), "no substitution of method semantics");
        check(!resolve("NX769J", false, true, false, true, all).supported(), "no acquire without cancel");
        check(!resolve("NX769J", false, true, true, false, all).supported(), "no acquire without restoration");
        check(!resolve("NX769J", false, true, true, true, new HashSet<>()).supported(), "must observe OEM enable");
        check(!resolve("unknown", true, true, true, true, all).supported(), "similar nodes do not verify a new driver");
        FanCompatibilityProfile product = FanCompatibilityProfile.resolve("nubia", "NX769J", "REDMAGIC",
                false, true, true, true, all::contains);
        check(product.supported() && !product.allowsLevelWrites(), "product identity supported with bounded capability");
        System.out.println("PASS TestFanCompatibilityProfile");
    }

    private static FanCompatibilityProfile resolve(String device, boolean max, boolean full,
            boolean cancel, boolean notify, Set<String> nodes) {
        return FanCompatibilityProfile.resolve(device, device, device, max, full, cancel, notify, nodes::contains);
    }
    private static Set<String> nodes(String root) {
        Set<String> result = new HashSet<>();
        result.add(root + "fan_enable");
        result.add(root + "fan_speed_level");
        result.add(root + "fan_speed_count");
        return result;
    }
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
}
