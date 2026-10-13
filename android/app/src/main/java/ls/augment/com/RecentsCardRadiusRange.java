package ls.augment.com;

/** Effective integer-dp endpoints derived from one settled native task card. */
public final class RecentsCardRadiusRange {
    public static final String DIAGNOSTIC = "ls_augment_rm_recents_card_radius_range";
    // Native floats near an integer should not manufacture one extra dead step.
    private static final double ENDPOINT_EPSILON_DP = .0001d;
    public final int minOffsetDp, maxOffsetDp;
    public final double nativeRadiusDp, maxRadiusDp;

    private RecentsCardRadiusRange(int min, int max, double nativeDp, double maximumDp) {
        minOffsetDp = min;
        maxOffsetDp = max;
        nativeRadiusDp = nativeDp;
        maxRadiusDp = maximumDp;
    }

    /** Caller must supply the complete OEM result at fullscreen progress zero. */
    public static RecentsCardRadiusRange fromGeometry(float radius, float density,
            float recentsScale, float taskScale, float shortSide) {
        if (!Float.isFinite(radius) || radius < 0f || !positive(density)
                || !positive(recentsScale) || !positive(taskScale) || !positive(shortSide)) return null;
        double scale = (double) recentsScale * taskScale;
        double nativeDp = radius * scale / density;
        double maximumDp = shortSide * .5d * scale / density;
        // A resting OEM radius beyond the available outline has no monotonic
        // signed range around native zero; report no measurement for that shape.
        if (!Double.isFinite(nativeDp) || !Double.isFinite(maximumDp)
                || nativeDp > maximumDp + ENDPOINT_EPSILON_DP) return null;
        double minimum = Math.floor(-nativeDp + ENDPOINT_EPSILON_DP);
        double maximum = Math.ceil(maximumDp - nativeDp - ENDPOINT_EPSILON_DP);
        if (minimum < Integer.MIN_VALUE || maximum > Integer.MAX_VALUE
                || minimum > 0d || maximum < 0d) return null;
        return new RecentsCardRadiusRange((int) minimum, (int) maximum, nativeDp, maximumDp);
    }

    private static boolean positive(float value) { return Float.isFinite(value) && value > 0f; }
}
