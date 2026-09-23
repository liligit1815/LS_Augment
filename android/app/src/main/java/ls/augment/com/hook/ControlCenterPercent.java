package ls.augment.com.hook;

/** Percent of the native slider range, including its minimum and extended maximum. */
final class ControlCenterPercent {
    private ControlCenterPercent() { }

    static int of(int progress, int minimum, int maximum) {
        long range = (long) maximum - minimum;
        if (range <= 0) return -1;
        long value = Math.max(0L, Math.min(range, (long) progress - minimum));
        return (int) ((value * 100L + range / 2L) / range);
    }
}
