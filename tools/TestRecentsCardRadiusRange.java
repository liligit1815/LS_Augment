package ls.augment.com;

/** Real geometry endpoint conversion, including native float integer boundaries. */
public final class TestRecentsCardRadiusRange {
    private static int checks;
    private static void check(boolean ok, String reason) {
        checks++;
        if (!ok) throw new AssertionError(reason);
    }
    private static void range(float r, float d, float s1, float s2, float shortSide, int min, int max) {
        RecentsCardRadiusRange value = RecentsCardRadiusRange.fromGeometry(r, d, s1, s2, shortSide);
        check(value != null && value.minOffsetDp == min && value.maxOffsetDp == max,
                "endpoints " + min + ".." + max);
        check(Math.abs(value.nativeRadiusDp - (double) r * s1 * s2 / d) < 1e-6,
                "native radius is already screen dp");
        check(Math.abs(value.maxRadiusDp - shortSide * .5d * s1 * s2 / d) < 1e-6,
                "maximum radius is already screen dp");
    }
    public static void main(String[] args) {
        range(30, 2, 1, 1, 300, -15, 60);
        range(30, 3.25f, 1, .75f, 600, -7, 63);
        range(0, 2, 1, 1, 300, 0, 75);
        range(150, 2, 1, 1, 300, -75, 0);
        range(30, 2, 2, .5f, 300, -15, 60);
        range(30, 2, 1, .5f, 300, -8, 30);
        range(24.000002f, 3, 1, 1, 240, -8, 32);
        range(24.003f, 3, 1, 1, 240, -9, 32);
        range(23.997f, 3, 1, 1, 240, -8, 33);
        check(RecentsCardRadiusRange.fromGeometry(Float.NaN, 2, 1, 1, 300) == null, "NaN native rejected");
        check(RecentsCardRadiusRange.fromGeometry(-1, 2, 1, 1, 300) == null, "negative native rejected");
        check(RecentsCardRadiusRange.fromGeometry(151, 2, 1, 1, 300) == null, "nonmonotonic native beyond shape rejected");
        check(RecentsCardRadiusRange.fromGeometry(30, 0, 1, 1, 300) == null, "zero density rejected");
        check(RecentsCardRadiusRange.fromGeometry(30, 2, Float.NaN, 1, 300) == null, "NaN scale rejected");
        check(RecentsCardRadiusRange.fromGeometry(30, 2, 1, -1, 300) == null, "negative scale rejected");
        check(RecentsCardRadiusRange.fromGeometry(30, 2, 1, 1, Float.POSITIVE_INFINITY) == null, "infinite geometry rejected");
        check(RecentsCardRadiusRange.fromGeometry(30, 2, 1, 1, 0) == null, "unlaid-out shape rejected");
        check(RecentsCardRadiusRange.fromGeometry(1, Float.MIN_VALUE, 1, 1, 300) == null, "integer overflow rejected");
        System.out.println("PASS Recents card radius range " + checks + " checks");
    }
}
