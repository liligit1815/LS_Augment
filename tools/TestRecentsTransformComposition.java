package ls.augment.com.hook;

public final class TestRecentsTransformComposition {
    private static final float EPSILON = 0.0001f;

    private TestRecentsTransformComposition() { }

    public static void main(String[] args) {
        testNativeTranslationUpdatesKeepDeckOffset();
        testTargetOffsetIncludesNativeGestureTranslation();
        testNativeScaleUpdatesKeepDeckPerspective();
        System.out.println("Recents transform composition checks: OK");
    }

    private static void testNativeTranslationUpdatesKeepDeckOffset() {
        float deckOffset = -700.0f;
        float before = RecentsTransformComposition.translation(96.0f, deckOffset);
        float after = RecentsTransformComposition.translation(140.0f, deckOffset);
        assertClose(-604.0f, before);
        assertClose(-560.0f, after);
        assertClose(44.0f, after - before);
    }

    private static void testTargetOffsetIncludesNativeGestureTranslation() {
        float laidOutCenter = 608.0f;
        float nativeGestureTranslation = 650.0f;
        float targetCenter = 648.0f;
        float deckOffset = RecentsTransformComposition.deckOffsetForTarget(
                laidOutCenter, nativeGestureTranslation, targetCenter, 1.0f);
        assertClose(-610.0f, deckOffset);
        assertClose(targetCenter,
                laidOutCenter + RecentsTransformComposition.translation(
                        nativeGestureTranslation, deckOffset));

        float halfBlend = RecentsTransformComposition.deckOffsetForTarget(
                laidOutCenter, nativeGestureTranslation, targetCenter, 0.5f);
        assertClose(953.0f,
                laidOutCenter + RecentsTransformComposition.translation(
                        nativeGestureTranslation, halfBlend));
    }

    private static void testNativeScaleUpdatesKeepDeckPerspective() {
        float deckScale = 0.96f;
        assertClose(0.96f, RecentsTransformComposition.scale(1.0f, deckScale));
        assertClose(0.864f, RecentsTransformComposition.scale(0.90f, deckScale));
    }

    private static void assertClose(float expected, float actual) {
        if (Math.abs(expected - actual) > EPSILON) {
            throw new AssertionError("expected " + expected + " but was " + actual);
        }
    }
}
