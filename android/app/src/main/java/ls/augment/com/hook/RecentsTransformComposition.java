package ls.augment.com.hook;

/**
 * Keeps LS Augment's deck channel separate from Quickstep's native TaskView
 * transform channel.
 */
final class RecentsTransformComposition {
    private RecentsTransformComposition() { }

    static float translation(float nativeTranslation, float deckOffset) {
        return nativeTranslation + deckOffset;
    }

    /**
     * Resolves the deck channel against the TaskView's complete OEM pose.
     * Running tasks can retain a large gesture translation after Overview
     * settles, so using only their laid-out center would place them off-screen.
     */
    static float deckOffsetForTarget(
            float laidOutCenter,
            float nativeTranslation,
            float targetCenter,
            float blend) {
        return (targetCenter - laidOutCenter - nativeTranslation) * blend;
    }

    static float scale(float nativeScale, float deckScale) {
        return nativeScale * deckScale;
    }
}
