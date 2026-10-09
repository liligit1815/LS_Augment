package ls.augment.com;

/** The audited NX809J screen gate is independent of OEM stop and speed decisions. */
public final class FanScreenOffPolicy {
    private FanScreenOffPolicy() { }

    public static boolean supportedDevice(String device, String product, String model) {
        return "NX809J".equalsIgnoreCase(device) || "NX809J".equalsIgnoreCase(product)
                || "NX809J".equalsIgnoreCase(model);
    }

    public static boolean preserveRunningSession(boolean enabled, boolean screenUnlocked,
            boolean running, boolean calling, boolean quickCharge, boolean shuttingDown) {
        // Quick charge already has an OEM screen-off path. It must never consume
        // the override intended for the later, non-charging screen predicate.
        return enabled && !screenUnlocked && running && !calling && !quickCharge && !shuttingDown;
    }
}
