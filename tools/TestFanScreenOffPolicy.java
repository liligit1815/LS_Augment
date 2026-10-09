import ls.augment.com.FanScreenOffPolicy;

public final class TestFanScreenOffPolicy {
    private static int checks;
    private static void check(boolean condition) {
        checks++;
        if (!condition) throw new AssertionError("fan screen-off check " + checks);
    }

    public static void main(String[] args) {
        check(FanScreenOffPolicy.supportedDevice("NX809J", null, null));
        check(FanScreenOffPolicy.supportedDevice(null, "nx809j", null));
        check(FanScreenOffPolicy.supportedDevice(null, null, "NX809J"));
        check(!FanScreenOffPolicy.supportedDevice("NX769J", "NX769J", "NX769J"));
        check(!FanScreenOffPolicy.supportedDevice(null, null, null));
        // Exhaustively cover the six independent gates. A screen-off event can
        // preserve an existing session only when no earlier OEM branch wins.
        for (int values = 0; values < 64; values++) {
            boolean enabled = (values & 1) != 0;
            boolean unlocked = (values & 2) != 0;
            boolean running = (values & 4) != 0;
            boolean calling = (values & 8) != 0;
            boolean charging = (values & 16) != 0;
            boolean shutdown = (values & 32) != 0;
            boolean expected = values == 5;
            check(FanScreenOffPolicy.preserveRunningSession(enabled, unlocked, running,
                    calling, charging, shutdown) == expected);
        }
        System.out.println("Fan screen-off policy: " + checks + " checks passed");
    }
}
