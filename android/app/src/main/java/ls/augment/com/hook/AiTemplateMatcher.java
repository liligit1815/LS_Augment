package ls.augment.com.hook;

import java.util.ArrayList;
import java.util.List;

/** A same-frame shape check; native recognition remains the first gate. */
final class AiTemplateMatcher {
    static final int NONE = 0, FAST = 1, SEARCH = 2;
    private static final int FAST_VALIDATE_RADIUS = 4;
    private static final int FAST_VALIDATE_ANCHORS = 32;

    static int match(AiTemplatePixels screen, AiTemplatePixels sample, List<Integer> anchors,
            int requestedLeft, int requestedTop) {
        if (screen == null || sample == null || anchors == null
                || screen.channels <= 0
                || sample.channels <= 0 || screen.rows < sample.rows
                || screen.cols < sample.cols) {
            return NONE;
        }
        if (anchors.size() < 8) return NONE;
        double[] screenBackground = screen.borderAverage();
        int maxX = screen.cols - sample.cols;
        int maxY = screen.rows - sample.rows;

        // The scene rectangle is known.  Check only a small neighbourhood
        // around that position first; the original vendor match has already
        // confirmed the expanded crop, so this preserves the stale/background
        // guard without rescanning every possible template position.
        int expectedLeft = Math.max(0, Math.min(maxX, requestedLeft));
        int expectedTop = Math.max(0, Math.min(maxY, requestedTop));
        List<Integer> fastAnchors = evenlySpaced(anchors, FAST_VALIDATE_ANCHORS);
        int fastRequired = Math.max(8, (fastAnchors.size() * 7 + 9) / 10);
        int fastBest = 0;
        int fastBestX = expectedLeft;
        int fastBestY = expectedTop;
        for (int y = Math.max(0, expectedTop - FAST_VALIDATE_RADIUS);
                y <= Math.min(maxY, expectedTop + FAST_VALIDATE_RADIUS); y++) {
            for (int x = Math.max(0, expectedLeft - FAST_VALIDATE_RADIUS);
                    x <= Math.min(maxX, expectedLeft + FAST_VALIDATE_RADIUS); x++) {
                int score = matchingAnchors(screen, sample, fastAnchors,
                        x, y, screenBackground);
                if (score > fastBest) {
                    fastBest = score;
                    fastBestX = x;
                    fastBestY = y;
                }
            }
        }
        if (fastBest >= fastRequired
                && templateCorrelation(screen, sample, fastAnchors,
                        fastBestX, fastBestY) >= 0.78) {
            return FAST;
        }

        // A small coordinate drift or an already-expanded scene can move the
        // template outside the fast window. Keep the original exhaustive gate
        // as a conservative fallback for those cases.
        int best = 0;
        int bestX = 0;
        int bestY = 0;
        for (int y = 0; y <= maxY; y += 2) {
            for (int x = 0; x <= maxX; x += 2) {
                int score = matchingAnchors(screen, sample, anchors,
                        x, y, screenBackground);
                if (score > best) {
                    best = score;
                    bestX = x;
                    bestY = y;
                }
            }
        }
        for (int y = Math.max(0, bestY - 2); y <= Math.min(maxY, bestY + 2); y++) {
            for (int x = Math.max(0, bestX - 2); x <= Math.min(maxX, bestX + 2); x++) {
                int score = matchingAnchors(screen, sample, anchors,
                        x, y, screenBackground);
                if (score > best) {
                    best = score;
                    bestX = x;
                    bestY = y;
                }
            }
        }
        int required = Math.max(8, (anchors.size() * 7 + 9) / 10);
        boolean matched = best >= required
                && templateCorrelation(screen, sample, anchors, bestX, bestY) >= 0.78;
        return matched ? SEARCH : NONE;
    }

    private static List<Integer> evenlySpaced(List<Integer> anchors, int limit) {
        if (anchors.size() <= limit) return anchors;
        ArrayList<Integer> result = new ArrayList<>(limit);
        for (int i = 0; i < limit; i++) {
            result.add(anchors.get(i * (anchors.size() - 1) / (limit - 1)));
        }
        return result;
    }

    private static int matchingAnchors(AiTemplatePixels screen, AiTemplatePixels sample,
            List<Integer> anchors, int left, int top, double[] screenBackground) {
        int matched = 0;
        for (Integer value : anchors) {
            int templateOffset = value.intValue();
            int pixel = templateOffset / sample.channels;
            int row = pixel / sample.cols;
            int col = pixel % sample.cols;
            int screenOffset = ((top + row) * screen.cols + left + col) * screen.channels;
            if (screen.distance(screenOffset, screenBackground) > 12.0
                    && screen.distanceTo(screenOffset, sample, templateOffset, 115.0)) {
                matched++;
            }
        }
        return matched;
    }

    /**
     * The foreground test intentionally tolerates small color changes, but a
     * page background can still contain enough similarly coloured pixels to
     * satisfy the anchor count.  Correlating the same anchor layout rejects
     * that case without changing the vendor's own match threshold.
     */
    private static double templateCorrelation(AiTemplatePixels screen, AiTemplatePixels sample,
            List<Integer> anchors, int left, int top) {
        if (anchors.isEmpty()) return 0.0;
        double screenMean = 0.0;
        double sampleMean = 0.0;
        double[] screenValues = new double[anchors.size()];
        double[] sampleValues = new double[anchors.size()];
        for (int i = 0; i < anchors.size(); i++) {
            int templateOffset = anchors.get(i).intValue();
            int pixel = templateOffset / sample.channels;
            int row = pixel / sample.cols;
            int col = pixel % sample.cols;
            int screenOffset = ((top + row) * screen.cols + left + col) * screen.channels;
            double screenValue = screen.luma(screenOffset);
            double sampleValue = sample.luma(templateOffset);
            screenValues[i] = screenValue;
            sampleValues[i] = sampleValue;
            screenMean += screenValue;
            sampleMean += sampleValue;
        }
        screenMean /= anchors.size();
        sampleMean /= anchors.size();
        double covariance = 0.0;
        double screenVariance = 0.0;
        double sampleVariance = 0.0;
        for (int i = 0; i < screenValues.length; i++) {
            double screenDelta = screenValues[i] - screenMean;
            double sampleDelta = sampleValues[i] - sampleMean;
            covariance += screenDelta * sampleDelta;
            screenVariance += screenDelta * screenDelta;
            sampleVariance += sampleDelta * sampleDelta;
        }
        double denominator = Math.sqrt(screenVariance * sampleVariance);
        return denominator <= 0.001 ? 0.0 : covariance / denominator;
    }

}
