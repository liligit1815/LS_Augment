package ls.augment.com.hook;

public final class TestFanNativeSettle {
    public static void main(String[] args) {
        FanNativeSettle settle = new FanNativeSettle();
        check(settle.ready(1, 1, 2, 0), false);
        check(settle.ready(1, 1, 2, 3000), true);
        // Settings changed before the OEM's old level has caught up.
        check(settle.ready(0, 1, 2, 4000), false);
        check(settle.ready(0, 1, 2, 4900), false);
        check(settle.ready(0, 1, 4, 6100), false);
        check(settle.ready(0, 1, 4, 7000), false);
        check(settle.ready(0, 1, 4, 7900), true);
        // A same-setting OEM callback also starts a fresh observation window.
        settle.nativeEvent(8000);
        check(settle.ready(0, 1, 4, 8100), false);
        check(settle.ready(0, 1, 4, 10999), false);
        check(settle.ready(0, 1, 4, 11000), true);
        // A later driver change must be stable even after the event delay.
        check(settle.ready(0, 1, 3, 12000), false);
        check(settle.ready(0, 1, 3, 13799), false);
        check(settle.ready(0, 1, 3, 13800), true);
        check(settle.ready(0, -100, 3, 14000), false);
        System.out.println("PASS TestFanNativeSettle: stale OEM level, delayed transition, renewed event, stable driver, manual change");
    }

    private static void check(boolean actual, boolean expected) {
        if (actual != expected) throw new AssertionError(actual + " != " + expected);
    }
}
