package ls.augment.com.hook;

public final class TestControlCenterPercent {
    private static void check(int actual, int expected, String label) {
        if (actual != expected) throw new AssertionError(label + ": " + actual + " != " + expected);
    }
    public static void main(String[] args) {
        check(ControlCenterPercent.of(0, 0, 65535), 0, "minimum brightness");
        check(ControlCenterPercent.of(32768, 0, 65535), 50, "gamma slider midpoint");
        check(ControlCenterPercent.of(65535, 0, 65535), 100, "maximum brightness");
        check(ControlCenterPercent.of(0, 0, 150), 0, "silent volume");
        check(ControlCenterPercent.of(10, 0, 150), 7, "volume rounding");
        check(ControlCenterPercent.of(75, 0, 150), 50, "volume midpoint");
        check(ControlCenterPercent.of(150, 0, 300), 50, "extended volume range");
        check(ControlCenterPercent.of(10, 10, 110), 0, "nonzero minimum");
        check(ControlCenterPercent.of(60, 10, 110), 50, "offset midpoint");
        check(ControlCenterPercent.of(-1, 0, 150), 0, "below range");
        check(ControlCenterPercent.of(151, 0, 150), 100, "above range");
        check(ControlCenterPercent.of(0, 0, 0), -1, "uninitialized range is hidden");
        check(ControlCenterPercent.of(0, 1, 0), -1, "invalid range is hidden");
        check(ControlCenterPercent.of(Integer.MAX_VALUE, Integer.MIN_VALUE, Integer.MAX_VALUE), 100, "no overflow");
        for (int maximum : new int[]{15, 150, 254, 300, 65535}) {
            int previous = -1;
            for (int value = 0; value <= maximum; value++) {
                int percent = ControlCenterPercent.of(value, 0, maximum);
                if (percent < previous || percent < 0 || percent > 100) throw new AssertionError("monotonic range");
                previous = percent;
            }
        }
        System.out.println("PASS TestControlCenterPercent");
    }
}
