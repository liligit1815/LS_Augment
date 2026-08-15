package ls.augment.com.hook;

public final class TestRecentsStackMath {
    private static final float EPSILON = 0.0001f;

    private TestRecentsStackMath() { }

    public static void main(String[] args) {
        testPageProgressUsesCardCenters();
        testPageProgressIgnoresUnusedCapacity();
        testTransientPageIntervalKeepsLastValidGeometry();
        testKnownLifecycleWaitsForTransitionCompletion();
        testCurrentTaskKeepsForegroundDeckSlot();
        testRunningTaskEntryKeepsCurrentCardOnScreen();
        testSnappedDeckStaysCompact();
        testSnappedFrontPairStaysJoined();
        testConfiguredOverlapAcrossCardWidths();
        testIncomingCardCatchesOutgoingDuringDrag();
        testIncomingGapIsMonotonicAcrossCompressionRange();
        testFrontPairNeverOpensIncludingEndpoints();
        testFrontPairDoesNotOverCompressExistingOverlap();
        testFrontPairCorrectionWorksAtEndpoints();
        testBackCardsMoveBetweenSlots();
        testBackCardsGainRestrainedPerspective();
        testCoverOrderNeverFlips();
        testEntryBlendAndDelayedOverlay();
        testMemoryLabel();
        System.out.println("Recents stack math checks: OK");
    }

    private static void testPageProgressUsesCardCenters() {
        float[] centers = {120.0f, 1020.0f, 1920.0f};
        assertClose(0.0f, RecentsStackMath.pagePosition(120.0f, centers, 900.0f));
        assertClose(0.5f, RecentsStackMath.pagePosition(570.0f, centers, 900.0f));
        assertClose(1.5f, RecentsStackMath.pagePosition(1470.0f, centers, 900.0f));
        assertClose(-0.1f, RecentsStackMath.pagePosition(30.0f, centers, 900.0f));
        assertClose(2.1f, RecentsStackMath.pagePosition(2010.0f, centers, 900.0f));
    }

    private static void testPageProgressIgnoresUnusedCapacity() {
        float[] reusedBuffer = {120.0f, 1020.0f, 1920.0f, -5000.0f, 8000.0f};
        assertClose(
                2.1f,
                RecentsStackMath.pagePosition(
                        2010.0f, reusedBuffer, 3, 900.0f));
        assertClose(
                0.5f,
                RecentsStackMath.pagePosition(
                        570.0f, reusedBuffer, 1, 900.0f));
        assertClose(
                0.0f,
                RecentsStackMath.pagePosition(
                        570.0f, reusedBuffer, 0, 900.0f));
    }

    private static void testTransientPageIntervalKeepsLastValidGeometry() {
        assertClose(900.0f, RecentsStackMath.stablePageInterval(0.0f, 900.0f));
        assertClose(900.0f, RecentsStackMath.stablePageInterval(450.0f, 900.0f));
        assertClose(900.0f, RecentsStackMath.stablePageInterval(1800.0f, 900.0f));
        assertClose(940.0f, RecentsStackMath.stablePageInterval(940.0f, 900.0f));
        assertClose(0.0f, RecentsStackMath.stablePageInterval(0.0f, 0.0f));
        assertClose(900.0f, RecentsStackMath.stablePageInterval(900.0f, 0.0f));
    }

    private static void testKnownLifecycleWaitsForTransitionCompletion() {
        if (RecentsStackMath.shouldStartEntryBlend(true, false, true, true)) {
            throw new AssertionError(
                    "known lifecycle started before transition completion");
        }
        if (!RecentsStackMath.shouldStartEntryBlend(true, true, false, false)) {
            throw new AssertionError(
                    "known lifecycle ignored transition completion");
        }
        if (!RecentsStackMath.shouldStartEntryBlend(false, false, true, false)
                || !RecentsStackMath.shouldStartEntryBlend(
                        false, false, false, true)) {
            throw new AssertionError(
                    "fallback lifecycle did not honor visual/time readiness");
        }
    }

    private static void testCurrentTaskKeepsForegroundDeckSlot() {
        assertClose(4.0f, RecentsStackMath.visualPagePosition(5.0f, 6));
        assertClose(3.5f, RecentsStackMath.visualPagePosition(4.5f, 6));
        assertClose(-0.65f, RecentsStackMath.visualPagePosition(0.0f, 6));
        assertClose(4.65f, RecentsStackMath.visualPagePosition(6.0f, 6));
        assertClose(0.0f, RecentsStackMath.visualPagePosition(3.0f, 1));
    }

    private static void testRunningTaskEntryKeepsCurrentCardOnScreen() {
        assertClose(5.0f, RecentsStackMath.visualPagePosition(5.0f, 6, true));
        assertClose(4.5f, RecentsStackMath.visualPagePosition(4.5f, 6, true));
        assertClose(5.0f, RecentsStackMath.visualPagePosition(6.0f, 6, true));
        assertClose(-0.65f, RecentsStackMath.visualPagePosition(-1.0f, 6, true));
        assertClose(0.0f, RecentsStackMath.visualPagePosition(3.0f, 1, true));
    }

    private static void testSnappedDeckStaysCompact() {
        float interval = 900.0f;
        float front = RecentsStackMath.visualOffset(0.0f, interval, 0.32f);
        float back1 = RecentsStackMath.visualOffset(-1.0f, interval, 0.32f);
        float back2 = RecentsStackMath.visualOffset(-2.0f, interval, 0.32f);
        float back3 = RecentsStackMath.visualOffset(-3.0f, interval, 0.32f);
        float back4 = RecentsStackMath.visualOffset(-4.0f, interval, 0.32f);

        if (!(front > 0.0f && front < interval * 0.08f)) {
            throw new AssertionError("front card is not slightly right-biased: " + front);
        }
        float firstGap = front - back1;
        float secondGap = back1 - back2;
        float thirdGap = back2 - back3;
        float fourthGap = back3 - back4;
        if (!(firstGap > interval * 0.16f && firstGap < interval * 0.19f)) {
            throw new AssertionError("first back slot has the wrong exposure: " + firstGap);
        }
        if (!(firstGap > secondGap && secondGap > thirdGap && thirdGap > fourthGap
                && fourthGap > 0.0f)) {
            throw new AssertionError("back deck gaps must diminish with depth");
        }
        if (!(front - back4 < interval * 0.37f)) {
            throw new AssertionError("back deck exceeded its finite visual width");
        }
    }

    private static void testSnappedFrontPairStaysJoined() {
        float interval = 900.0f;
        float cardWidth = 760.0f;
        float overlapRatio = 0.30f;
        float frontDistance = RecentsStackMath.frontDistanceRatio(
                cardWidth, interval, overlapRatio);
        float front = RecentsStackMath.visualOffset(
                0.0f, interval, 0.32f, frontDistance);
        float nearest = RecentsStackMath.visualOffset(
                1.0f, interval, 0.32f, frontDistance);
        float second = RecentsStackMath.visualOffset(
                2.0f, interval, 0.32f, frontDistance);
        float renderedOverlap = cardWidth - (nearest - front);
        assertClose(cardWidth * overlapRatio, renderedOverlap, 0.01f);
        if (!(nearest - front < interval * 0.60f)) {
            throw new AssertionError("nearest future card detached from the deck: "
                    + (nearest - front));
        }
        if (!(second - nearest > interval * 0.99f
                && second - nearest < interval * 1.01f)) {
            throw new AssertionError("far future cards crowded into the visible deck");
        }
    }

    private static void testConfiguredOverlapAcrossCardWidths() {
        float interval = 900.0f;
        float[] widthRatios = {0.55f, 0.75f, 0.95f, 1.10f};
        float[] overlapRatios = {0.20f, 0.30f, 0.60f};
        for (float widthRatio : widthRatios) {
            float cardWidth = interval * widthRatio;
            for (float overlapRatio : overlapRatios) {
                float frontDistance = RecentsStackMath.frontDistanceRatio(
                        cardWidth, interval, overlapRatio);
                float leftCenter = RecentsStackMath.visualOffset(
                        0.0f, interval, 0.32f, frontDistance);
                float rightCenter = RecentsStackMath.visualOffset(
                        1.0f, interval, 0.32f, frontDistance);
                float leftRight = leftCenter + cardWidth / 2.0f;
                float rightLeft = rightCenter - cardWidth / 2.0f;
                float correction = RecentsStackMath.frontPairCorrection(
                        0.0f,
                        leftRight,
                        rightLeft,
                        cardWidth,
                        interval,
                        overlapRatio);
                float finalOverlap = leftRight - (rightLeft - correction);
                if (finalOverlap + 0.01f < cardWidth * overlapRatio) {
                    throw new AssertionError(
                            "snapped overlap was not preserved for width=" + widthRatio
                                    + ", overlap=" + overlapRatio
                                    + ": " + finalOverlap);
                }
            }
        }
    }

    private static void testIncomingCardCatchesOutgoingDuringDrag() {
        float interval = 900.0f;
        float earlyGap = frontGap(0.25f, interval);
        float middleGap = frontGap(0.50f, interval);
        float lateGap = frontGap(0.75f, interval);
        float snappedGap = frontGap(1.00f, interval);
        if (!(earlyGap > middleGap && middleGap > lateGap && lateGap > snappedGap)) {
            throw new AssertionError("incoming exposure did not change continuously: "
                    + earlyGap + ", " + middleGap + ", " + lateGap + ", " + snappedGap);
        }
        if (!(middleGap > interval * 0.27f && middleGap < interval * 0.32f)) {
            throw new AssertionError("halfway cards look side-by-side instead of stacked: "
                    + middleGap);
        }
    }

    private static float frontGap(float progress, float interval) {
        return frontGap(progress, interval, 0.32f);
    }

    private static float frontGap(
            float progress, float interval, float compression) {
        return frontGap(progress, interval, compression, 0.68f);
    }

    private static float frontGap(
            float progress,
            float interval,
            float compression,
            float frontDistance) {
        float outgoing = RecentsStackMath.visualOffset(-progress, interval, compression);
        float incoming = RecentsStackMath.visualOffset(
                1.0f - progress, interval, compression, frontDistance);
        return incoming - outgoing;
    }

    private static void testIncomingGapIsMonotonicAcrossCompressionRange() {
        float interval = 900.0f;
        float[] compressionValues = {0.12f, 0.32f, 0.90f};
        float[] frontDistances = {0.32f, 0.55f, 0.78f};
        for (float compression : compressionValues) {
            for (float frontDistance : frontDistances) {
                float previous = Float.POSITIVE_INFINITY;
                for (int step = 0; step <= 100; step++) {
                    float progress = step / 100.0f;
                    float gap = frontGap(
                            progress, interval, compression, frontDistance);
                    if (gap > previous + 0.01f) {
                        throw new AssertionError(
                                "incoming gap reversed at compression=" + compression
                                        + ", frontDistance=" + frontDistance
                                        + ", progress=" + progress);
                    }
                    previous = gap;
                }
            }
        }
    }

    private static void testFrontPairNeverOpensIncludingEndpoints() {
        float interval = 900.0f;
        float cardWidth = interval * 0.70f;
        float[] compressionValues = {0.12f, 0.32f, 0.90f};
        for (float compression : compressionValues) {
            for (int step = 0; step <= 100; step++) {
                float progress = step / 100.0f;
                float leftCenter = RecentsStackMath.visualOffset(
                        -progress, interval, compression);
                float rightCenter = RecentsStackMath.visualOffset(
                        1.0f - progress, interval, compression);
                float leftScale = RecentsStackMath.visualScale(-progress);
                float rightScale = RecentsStackMath.visualScale(1.0f - progress);
                float leftRight = leftCenter + cardWidth * leftScale / 2.0f;
                float rightLeft = rightCenter - cardWidth * rightScale / 2.0f;
                float smallerWidth = cardWidth * Math.min(leftScale, rightScale);
                float correction = RecentsStackMath.frontPairCorrection(
                        progress, leftRight, rightLeft, smallerWidth, interval);
                if (rightLeft - correction > leftRight + 0.01f) {
                    throw new AssertionError(
                            "front pair opened at compression=" + compression
                                    + ", progress=" + progress
                                    + ", gap=" + (rightLeft - correction - leftRight));
                }
            }
        }
    }

    private static void testFrontPairDoesNotOverCompressExistingOverlap() {
        float correction = RecentsStackMath.frontPairCorrection(
                0.50f, 500.0f, 180.0f, 630.0f, 900.0f);
        assertClose(0.0f, correction);
    }

    private static void testFrontPairCorrectionWorksAtEndpoints() {
        float startCorrection = RecentsStackMath.frontPairCorrection(
                0.0f, 500.0f, 550.0f, 630.0f, 900.0f, 0.30f);
        float endCorrection = RecentsStackMath.frontPairCorrection(
                1.0f, 500.0f, 550.0f, 630.0f, 900.0f, 0.30f);
        assertClose(239.0f, startCorrection);
        assertClose(startCorrection, endCorrection);
    }

    private static void testBackCardsMoveBetweenSlots() {
        float interval = 900.0f;
        float firstStart = RecentsStackMath.visualOffset(-1.0f, interval, 0.32f);
        float firstMiddle = RecentsStackMath.visualOffset(-1.5f, interval, 0.32f);
        float firstEnd = RecentsStackMath.visualOffset(-2.0f, interval, 0.32f);
        if (!(firstStart > firstMiddle && firstMiddle > firstEnd)) {
            throw new AssertionError("first covered card did not move between deck slots");
        }

        float deepStart = RecentsStackMath.visualOffset(-3.0f, interval, 0.32f);
        float deepMiddle = RecentsStackMath.visualOffset(-3.5f, interval, 0.32f);
        float deepEnd = RecentsStackMath.visualOffset(-4.0f, interval, 0.32f);
        if (!(deepStart > deepMiddle && deepMiddle > deepEnd
                && deepStart - deepMiddle > interval * 0.005f)) {
            throw new AssertionError("deep covered card remained visually pinned");
        }
    }

    private static void testBackCardsGainRestrainedPerspective() {
        assertClose(1.0f, RecentsStackMath.visualScale(0.0f));
        assertClose(1.0f, RecentsStackMath.visualScale(0.5f));
        float back1 = RecentsStackMath.visualScale(-1.0f);
        float back2 = RecentsStackMath.visualScale(-2.0f);
        float back4 = RecentsStackMath.visualScale(-4.0f);
        if (!(back1 == 1.0f && back1 > back2 && back2 > back4 && back4 > 0.95f)) {
            throw new AssertionError("back-card scale falloff is not restrained");
        }
        float halfway = RecentsStackMath.visualScale(-0.5f);
        assertClose(1.0f, halfway);
        assertClose(0.0f, RecentsStackMath.verticalOffsetRatio(0.0f));
        assertClose(0.0f, RecentsStackMath.verticalOffsetRatio(-1.0f));
        if (!(RecentsStackMath.verticalOffsetRatio(-2.0f)
                > RecentsStackMath.verticalOffsetRatio(-1.0f))) {
            throw new AssertionError("deeper cards must sit lower in the deck");
        }
    }

    private static void testCoverOrderNeverFlips() {
        float left = RecentsStackMath.layerDepth(0, 3, 12.0f);
        float middle = RecentsStackMath.layerDepth(1, 3, 12.0f);
        float right = RecentsStackMath.layerDepth(2, 3, 12.0f);
        if (!(left < middle && middle < right)) {
            throw new AssertionError("right-side card must always be the top layer");
        }
    }

    private static void testEntryBlendAndDelayedOverlay() {
        assertClose(0.0f, RecentsStackMath.entryBlend(0L, 220L));
        assertClose(0.5f, RecentsStackMath.entryBlend(110L, 220L));
        assertClose(1.0f, RecentsStackMath.entryBlend(220L, 220L));
        assertClose(0.0f, RecentsStackMath.revealProgress(0.85f, 0.86f));
        assertClose(1.0f, RecentsStackMath.revealProgress(1.0f, 0.86f));
        float halfway = RecentsStackMath.revealProgress(0.93f, 0.86f);
        if (!(halfway > 0.45f && halfway < 0.55f)) {
            throw new AssertionError("memory reveal must fade in near stack settle");
        }
    }

    private static void testMemoryLabel() {
        long gb = 1024L * 1024L * 1024L;
        String value = RecentsMemoryFormatter.format(7L * gb, 16L * gb);
        if (!"7.0 GB / 16.0 GB".equals(value)) {
            throw new AssertionError("unexpected memory label: " + value);
        }
        if (!"".equals(RecentsMemoryFormatter.format(-1L, 16L * gb))) {
            throw new AssertionError("invalid memory values must stay hidden");
        }
    }

    private static void assertClose(float expected, float actual) {
        assertClose(expected, actual, EPSILON);
    }

    private static void assertClose(float expected, float actual, float tolerance) {
        if (Math.abs(expected - actual) > tolerance) {
            throw new AssertionError("expected " + expected + " but was " + actual);
        }
    }
}
