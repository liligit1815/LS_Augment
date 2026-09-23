package ls.augment.com;

/** About-page appearance derived only from the current scroll position, in dp. */
public final class AboutMotionState {
    public final float versionAlpha, versionScale, brandAlpha, brandScale, backgroundAlpha;
    public final boolean titleVisible;

    private AboutMotionState(float y) {
        versionAlpha = clamp(1f - y / 190f);
        versionScale = 1f - .1f * clamp(y / 389f);
        float brandProgress = clamp((y - 190f) / 40f);
        brandAlpha = 1f - brandProgress;
        brandScale = 1f - .1f * brandProgress;
        titleVisible = y >= 230f;
        backgroundAlpha = 1f - clamp(y / 389f);
    }

    /** Invalid density falls back to 1 px/dp; NaN/negative scroll means the top. */
    public static AboutMotionState at(float scrollPx, float density) {
        if (!Float.isFinite(density) || density <= 0f) density = 1f;
        float scroll = Float.isNaN(scrollPx) ? 0f : Math.max(0f, scrollPx);
        // Positive infinity, including overflow from tiny densities, naturally
        // reaches the fully scrolled state while every output remains finite.
        return new AboutMotionState(scroll / density);
    }

    private static float clamp(float value) { return Math.max(0f, Math.min(1f, value)); }
}
