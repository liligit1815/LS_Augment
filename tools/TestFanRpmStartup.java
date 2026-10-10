package ls.augment.com.hook;

public final class TestFanRpmStartup {
    public static void main(String[] args) {
        FanRpmStartup startup = new FanRpmStartup();
        check(startup, false, false, 0, FanRpmStartup.Action.WAIT);
        check(startup, false, false, 900, FanRpmStartup.Action.WAIT);
        check(startup, false, false, 5999, FanRpmStartup.Action.WAIT);
        check(startup, false, false, 6000, FanRpmStartup.Action.FAIL);

        startup.reset();
        check(startup, false, false, 10000, FanRpmStartup.Action.WAIT);
        check(startup, false, true, 10900, FanRpmStartup.Action.WAIT);
        check(startup, false, false, 11800, FanRpmStartup.Action.WAIT);
        check(startup.validSamples() == 0, "An invalid read breaks consecutive samples");
        check(startup, false, true, 15999, FanRpmStartup.Action.WAIT);
        check(startup, false, false, 16000, FanRpmStartup.Action.FAIL);

        startup.reset();
        check(startup, false, false, 20000, FanRpmStartup.Action.WAIT);
        check(startup, false, true, 25100, FanRpmStartup.Action.WAIT);
        check(startup, false, true, 26000, FanRpmStartup.Action.READY);
        check(startup, true, true, 26900, FanRpmStartup.Action.READY);
        check(startup, true, false, 27800, FanRpmStartup.Action.FAIL);

        startup.reset();
        check(startup, true, false, 30000, FanRpmStartup.Action.FAIL);
        startup.reset();
        check(startup, false, true, 40000, FanRpmStartup.Action.WAIT);
        check(startup, false, true, 40900, FanRpmStartup.Action.READY);
        System.out.println("PASS TestFanRpmStartup: bounded OEM startup, consecutive RPM reads, active-control failure, reset");
    }

    private static void check(FanRpmStartup startup, boolean controlling, boolean valid,
                              long now, FanRpmStartup.Action expected) {
        FanRpmStartup.Action actual = startup.observe(controlling, valid, now);
        check(actual == expected, "RPM state " + actual + " != " + expected + " at " + now);
    }
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
}
