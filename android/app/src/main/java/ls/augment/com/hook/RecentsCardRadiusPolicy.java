package ls.augment.com.hook;

/** Radius adjustment in the native thumbnail's local coordinate space. */
final class RecentsCardRadiusPolicy {
    private RecentsCardRadiusPolicy() { }

    static float adjust(float nativeRadius, int offsetDp, float density,
            float fullscreenProgress, float recentsScale, float taskScale, float shortSide) {
        // Zero and full-screen must preserve the exact OEM float, even on an
        // unsupported/non-finite geometry. Never replace a window's radius.
        if (offsetDp == 0 || fullscreenProgress >= 1f
                || !Float.isFinite(nativeRadius) || nativeRadius < 0f
                || !Float.isFinite(fullscreenProgress) || fullscreenProgress < 0f
                || !Float.isFinite(density) || density <= 0f
                || !Float.isFinite(recentsScale) || recentsScale <= 0f
                || !Float.isFinite(taskScale) || taskScale <= 0f
                || !Float.isFinite(shortSide) || shortSide <= 0f) return nativeRadius;
        float scale = recentsScale * taskScale;
        if (!Float.isFinite(scale) || scale <= 0f) return nativeRadius;
        // The OEM interpolates task -> window then divides by these same scales.
        // Fade only our task contribution so native full-screen geometry survives.
        double adjusted = nativeRadius
                + (double) offsetDp * density * (1f - fullscreenProgress) / scale;
        return (float) Math.max(0d, Math.min(shortSide * .5d, adjusted));
    }
}
