package ls.augment.com;

/** Absolute placement in a scaled parent; independent of the previous frame. */
public final class StatusBarTransform {
    private StatusBarTransform() { }

    public static float scale(float desired, float contentSize, float ancestorScale) {
        return desired / Math.max(1f, contentSize) / ancestorScale;
    }

    public static float translation(float targetInParent, float contentStart,
            float pivot, float scale) {
        return targetInParent - pivot - (contentStart - pivot) * scale;
    }
}
