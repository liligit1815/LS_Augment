package ls.augment.com.hook;

/**
 * Pure layout math for the visual-only Quickstep task stack.
 *
 * <p>Cards occupy a bounded set of visual deck slots while Quickstep keeps its
 * native page positions and scroll state. During a drag every card moves
 * continuously between adjacent slots, with a faster catch-up path reserved
 * for the nearest incoming card.</p>
 */
final class RecentsStackMath {
    private static final float FRONT_ANCHOR_RATIO = 0.05f;
    private static final float BACK_LIMIT_BASE = 0.295f;
    private static final float BACK_LIMIT_SCALE = 0.305f;
    private static final float MIN_BACK_LIMIT = 0.35f;
    private static final float MAX_BACK_LIMIT = 0.55f;
    private static final float DEFAULT_FRONT_DISTANCE = 0.68f;
    private static final float MIN_FRONT_DISTANCE = 0.32f;
    private static final float MAX_FRONT_DISTANCE = 0.78f;
    private static final float INCOMING_INITIAL_SLOPE = 1.85f;
    private static final float BACK_GAP_DECAY = 0.56f;
    // The front pair must read as one card deck at rest as well as during a
    // drag. The slot distance is derived from the rendered card width, while
    // this correction remains as a safety net for unequal OEM card widths.
    private static final float FRONT_PAIR_MAX_CORRECTION_RATIO = 0.48f;
    private static final float MAX_BACK_SCALE_REDUCTION = 0.065f;
    private static final float MAX_BACK_VERTICAL_SHIFT_RATIO = 0.010f;
    private static final float INTEGER_EPSILON = 0.0001f;
    private static final float PAGE_INTERVAL_MIN_RATIO = 0.72f;
    private static final float PAGE_INTERVAL_MAX_RATIO = 1.38f;

    private RecentsStackMath() { }

    static float pagePosition(
            float viewportCenterInContent,
            float[] cardCenters,
            float fallbackInterval) {
        return pagePosition(
                viewportCenterInContent,
                cardCenters,
                cardCenters == null ? 0 : cardCenters.length,
                fallbackInterval);
    }

    static float pagePosition(
            float viewportCenterInContent,
            float[] cardCenters,
            int activeCount,
            float fallbackInterval) {
        int count = cardCenters == null
                ? 0
                : Math.min(Math.max(activeCount, 0), cardCenters.length);
        if (count == 0) return 0.0f;
        if (count == 1) {
            return extrapolate(
                    viewportCenterInContent - cardCenters[0], fallbackInterval);
        }

        if (viewportCenterInContent <= cardCenters[0]) {
            float interval = positiveInterval(
                    cardCenters[1] - cardCenters[0], fallbackInterval);
            return extrapolate(viewportCenterInContent - cardCenters[0], interval);
        }

        int last = count - 1;
        if (viewportCenterInContent >= cardCenters[last]) {
            float interval = positiveInterval(
                    cardCenters[last] - cardCenters[last - 1], fallbackInterval);
            return last + extrapolate(
                    viewportCenterInContent - cardCenters[last], interval);
        }

        for (int index = 0; index < last; index++) {
            float left = cardCenters[index];
            float right = cardCenters[index + 1];
            if (viewportCenterInContent > right) continue;
            float interval = positiveInterval(right - left, fallbackInterval);
            return index + (viewportCenterInContent - left) / interval;
        }
        return last;
    }

    /**
     * Keeps a temporary detach/rebind interval from replacing the last valid
     * Quickstep page geometry. A missing, collapsed or doubled measurement is
     * transient; a nearby measurement is a legitimate native layout update.
     */
    static float stablePageInterval(float measuredInterval, float previousInterval) {
        if (measuredInterval <= 1.0f) {
            return previousInterval > 1.0f ? previousInterval : 0.0f;
        }
        if (previousInterval > 1.0f
                && (measuredInterval < previousInterval * PAGE_INTERVAL_MIN_RATIO
                        || measuredInterval > previousInterval * PAGE_INTERVAL_MAX_RATIO)) {
            return previousInterval;
        }
        return measuredInterval;
    }

    static boolean shouldStartEntryBlend(
            boolean lifecycleKnown,
            boolean transitionComplete,
            boolean visuallyReady,
            boolean fallbackReady) {
        return lifecycleKnown
                ? transitionComplete
                : visuallyReady || fallbackReady;
    }

    /** Keeps the two-card foreground treatment used when Overview opens from Home. */
    static float visualPagePosition(float nativePage, int cardCount) {
        return visualPagePosition(nativePage, cardCount, false);
    }

    /**
     * An app-originated gesture has a live running task. Keep that native page
     * in the centered foreground slot so the current card cannot be placed in
     * the off-screen incoming slot. Home has no live running card, so it keeps
     * the preceding visual page and the established two-card deck treatment.
     */
    static float visualPagePosition(
            float nativePage, int cardCount, boolean runningTaskEntry) {
        if (cardCount <= 1) return 0.0f;
        if (runningTaskEntry) {
            return clamp(nativePage, -0.65f, cardCount - 1.0f);
        }
        return clamp(nativePage - 1.0f, -0.65f, cardCount - 1.35f);
    }

    /** Returns the desired visual center offset from the viewport center. */
    static float visualOffset(
            float relativePage, float pageInterval, float stackWidthRatio) {
        return visualOffset(
                relativePage, pageInterval, stackWidthRatio, DEFAULT_FRONT_DISTANCE);
    }

    /**
     * Returns the desired visual center offset using one shared front-pair
     * distance for snapped, dragged and settling states.
     */
    static float visualOffset(
            float relativePage,
            float pageInterval,
            float stackWidthRatio,
            float frontDistanceRatio) {
        int startSlot;
        float progress;
        float nearestInteger = Math.round(relativePage);
        if (Math.abs(relativePage - nearestInteger) <= INTEGER_EPSILON) {
            startSlot = (int) nearestInteger;
            progress = 0.0f;
        } else {
            startSlot = (int) Math.ceil(relativePage);
            progress = clamp(startSlot - relativePage, 0.0f, 1.0f);
        }

        float safeFrontDistance = clamp(
                frontDistanceRatio, MIN_FRONT_DISTANCE, MAX_FRONT_DISTANCE);
        float start = slotPosition(startSlot, stackWidthRatio, safeFrontDistance);
        float end = slotPosition(startSlot - 1, stackWidthRatio, safeFrontDistance);
        float slotProgress = startSlot == 1
                ? incomingProgress(progress, stackWidthRatio, safeFrontDistance)
                : progress;
        return pageInterval * lerp(start, end, slotProgress);
    }

    /**
     * Converts a requested rendered overlap into the center distance used by
     * the nearest future-card slot. This keeps the pair joined even when the
     * scroll position is exactly on a page boundary.
     */
    static float frontDistanceRatio(
            float renderedCardWidth,
            float pageInterval,
            float targetOverlapRatio) {
        if (renderedCardWidth <= 0.0f || pageInterval <= 0.0f) {
            return DEFAULT_FRONT_DISTANCE;
        }
        float overlap = clamp(targetOverlapRatio, 0.10f, 0.60f);
        return clamp(
                renderedCardWidth * (1.0f - overlap) / pageInterval,
                MIN_FRONT_DISTANCE,
                MAX_FRONT_DISTANCE);
    }

    /**
     * Adds restrained perspective without changing Quickstep's real bounds.
     * The front and incoming cards stay at native scale; covered cards become
     * progressively smaller with a deliberately shallow, bounded falloff.
     */
    static float visualScale(float relativePage) {
        return 1.0f - MAX_BACK_SCALE_REDUCTION * visualDepth(relativePage);
    }

    /** Moves covered cards slightly down as they recede into the deck. */
    static float verticalOffsetRatio(float relativePage) {
        return MAX_BACK_VERTICAL_SHIFT_RATIO * visualDepth(relativePage);
    }

    /**
     * Couples the two cards that exchange the front position during a drag.
     *
     * <p>The native page interval can be slightly wider than the rendered
     * card. Near the end of a reverse drag that lets the outgoing card move
     * away before the new front card reaches it, exposing a strip of the
     * overview background. Close that edge gap and retain the configured
     * overlap without changing either card's native page position. Endpoints
     * are included because a snapped deck must remain visually connected.</p>
     */
    static float frontPairCorrection(
            float pageProgress,
            float leftRenderedRight,
            float rightRenderedLeft,
            float smallerRenderedWidth,
            float pageInterval) {
        return frontPairCorrection(pageProgress, leftRenderedRight, rightRenderedLeft,
                smallerRenderedWidth, pageInterval, 0.30f);
    }

    static float frontPairCorrection(
            float pageProgress,
            float leftRenderedRight,
            float rightRenderedLeft,
            float smallerRenderedWidth,
            float pageInterval,
            float targetOverlapRatio) {
        if (pageProgress < 0.0f || pageProgress > 1.0f
                || smallerRenderedWidth <= 0.0f || pageInterval <= 0.0f) {
            return 0.0f;
        }

        float edgeSeparation = rightRenderedLeft - leftRenderedRight;
        float overlap = smallerRenderedWidth * clamp(targetOverlapRatio, 0.10f, 0.60f);
        float correction = Math.max(0.0f, edgeSeparation + overlap);
        return Math.min(correction, pageInterval * FRONT_PAIR_MAX_CORRECTION_RATIO);
    }

    private static float slotPosition(
            int slot, float stackWidthRatio, float frontDistanceRatio) {
        if (slot == 0) return FRONT_ANCHOR_RATIO;
        if (slot < 0) {
            return FRONT_ANCHOR_RATIO
                    - backSlotDistance(-slot, stackWidthRatio);
        }

        return FRONT_ANCHOR_RATIO + frontDistanceRatio + slot - 1.0f;
    }

    /** Packs all covered cards into a finite-width deck with diminishing gaps. */
    private static float backSlotDistance(int depth, float stackWidthRatio) {
        float backLimit = clamp(
                BACK_LIMIT_BASE + stackWidthRatio * BACK_LIMIT_SCALE,
                MIN_BACK_LIMIT,
                MAX_BACK_LIMIT);
        return backLimit * (1.0f - (float) Math.pow(BACK_GAP_DECAY, depth));
    }

    /**
     * Moves the nearest future card into the deck early, then matches the
     * first back-slot velocity at the next snapped page to avoid a visual jerk.
     */
    private static float incomingProgress(
            float progress, float stackWidthRatio, float frontDistanceRatio) {
        float endSlope = backSlotDistance(1, stackWidthRatio) / frontDistanceRatio;
        float initialSlope = Math.min(
                INCOMING_INITIAL_SLOPE, 3.0f - 2.0f * endSlope);
        float squared = progress * progress;
        float cubed = squared * progress;
        float h10 = cubed - 2.0f * squared + progress;
        float h01 = -2.0f * cubed + 3.0f * squared;
        float h11 = cubed - squared;
        return clamp(
                h10 * initialSlope + h01 + h11 * endSlope,
                0.0f,
                1.0f);
    }

    private static float visualDepth(float relativePage) {
        int startSlot;
        float progress;
        float nearestInteger = Math.round(relativePage);
        if (Math.abs(relativePage - nearestInteger) <= INTEGER_EPSILON) {
            startSlot = (int) nearestInteger;
            progress = 0.0f;
        } else {
            startSlot = (int) Math.ceil(relativePage);
            progress = clamp(startSlot - relativePage, 0.0f, 1.0f);
        }
        return lerp(slotDepth(startSlot), slotDepth(startSlot - 1), progress);
    }

    private static float slotDepth(int slot) {
        // The exchanging front pair stays at the same scale. Perspective
        // begins at the second covered card so scaling cannot open an edge gap
        // between the two cards the user is actively manipulating.
        if (slot >= -1) return 0.0f;
        float depthBeyondFirst = -slot - 1.0f;
        return depthBeyondFirst / (depthBeyondFirst + 2.0f);
    }

    /** Right-side cards always cover cards to their left; scroll position is irrelevant. */
    static float layerDepth(int index, int cardCount, float zRange) {
        if (cardCount <= 1) return zRange;
        return zRange * index / (cardCount - 1.0f);
    }

    /** Smoothly blends from Quickstep's native entry pose into the visual stack. */
    static float entryBlend(long elapsedMs, long durationMs) {
        if (durationMs <= 0L || elapsedMs >= durationMs) return 1.0f;
        if (elapsedMs <= 0L) return 0.0f;
        float progress = elapsedMs / (float) durationMs;
        return progress * progress * (3.0f - 2.0f * progress);
    }

    /** Delays auxiliary UI until the task stack is nearly settled. */
    static float revealProgress(float stackBlend, float revealStart) {
        if (stackBlend <= revealStart) return 0.0f;
        if (stackBlend >= 1.0f || revealStart >= 1.0f) return 1.0f;
        float progress = (stackBlend - revealStart) / (1.0f - revealStart);
        return progress * progress * (3.0f - 2.0f * progress);
    }

    private static float extrapolate(float distance, float interval) {
        float safeInterval = positiveInterval(interval, 1.0f);
        return distance / safeInterval;
    }

    private static float positiveInterval(float value, float fallback) {
        if (value > 1.0f) return value;
        return fallback > 1.0f ? fallback : 1.0f;
    }

    private static float lerp(float start, float end, float progress) {
        return start + (end - start) * progress;
    }

    private static float clamp(float value, float min, float max) {
        return Math.max(min, Math.min(max, value));
    }
}
