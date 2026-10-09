package ls.augment.com;

/** Absolute placement in a scaled parent; independent of the previous frame. */
public final class StatusBarTransform {
    private StatusBarTransform() { }

    public static float scale(float desired, float contentSize, float ancestorScale) {
        return finite((double)desired / Math.max(1f, contentSize) / ancestorScale);
    }

    public static float translation(float targetInParent, float contentStart,
            float pivot, float scale) {
        return finite((double)targetInParent - pivot - ((double)contentStart - pivot) * scale);
    }

    /** Android transform properties are floats even when logical worksheet geometry is larger. */
    public static float finite(double value) {
        return Double.isNaN(value) ? 0f : (float)Math.max(-Float.MAX_VALUE,Math.min(Float.MAX_VALUE,value));
    }
}
