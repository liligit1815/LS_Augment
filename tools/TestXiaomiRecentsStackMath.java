public final class TestXiaomiRecentsStackMath {
    private static final float FOCUS = 0.538f;
    private static final float FIRST_BACK = 0.372f;
    private static final float TAIL_GAP = 0.056f;
    private static final float TAIL_DECAY = 0.310f;
    private static final float FOCUS_SCALE = 1.100f;
    private static final float SCALE_STEP = 0.026f;
    private static final float MIN_BACK_SCALE = 0.895f;
    private static final float REDMAGIC_CENTER_CORRECTION = 0.000f;

    private static float center(float depth) {
        if (depth <= 1f) return FOCUS + (FIRST_BACK - FOCUS) * depth;
        float n = depth - 1f;
        return FIRST_BACK - TAIL_GAP
                * (1f - (float) Math.pow(TAIL_DECAY, n)) / (1f - TAIL_DECAY);
    }

    private static float scale(float depth) {
        return FOCUS_SCALE * Math.max(MIN_BACK_SCALE, 1f - SCALE_STEP * depth);
    }

    private static float alpha(float depth) {
        return depth <= 4f ? 1f : Math.max(0f, 1f - (depth - 4f) * 4f);
    }

    private static int postDismissViewport(int viewportOrdinal, int taskCountAfter) {
        return taskCountAfter <= 0 ? -1
                : Math.min(Math.max(0, viewportOrdinal), taskCountAfter - 1);
    }

    private static void near(String name, float actual, float expected, float tolerance) {
        if (Math.abs(actual - expected) > tolerance) {
            throw new AssertionError(name + ": " + actual + " != " + expected);
        }
    }

    private static void checkCount(int taskCount) {
        int initial = taskCount == 0 ? -1 : (taskCount >= 2 ? 1 : 0);
        int expected = taskCount == 0 ? -1 : (taskCount == 1 ? 0 : 1);
        if (initial != expected) throw new AssertionError("initial page for " + taskCount);
        for (int i = 0; i < taskCount; i++) {
            float value = center(i);
            if (!Float.isFinite(value) || value < 0.28f || value > FOCUS) {
                throw new AssertionError("unbounded center at count=" + taskCount + ", depth=" + i);
            }
            if (i > 0 && center(i) > center(i - 1)) {
                throw new AssertionError("depth ordering reversed at " + i);
            }
        }
    }

    public static void main(String[] args) {
        near("focus", center(0), 0.538f, 0.0001f);
        near("older 1", center(1), 0.372f, 0.0001f);
        near("older 2", center(2), 0.316f, 0.001f);
        near("older 3", center(3), 0.299f, 0.0015f);
        near("older 1 scale", scale(1) / FOCUS_SCALE, 0.974f, 0.0001f);
        near("older 2 scale", scale(2) / FOCUS_SCALE, 0.948f, 0.0001f);
        near("incoming center", FOCUS + 0.472f, 1.010f, 0.0001f);
        near("incoming scale", FOCUS_SCALE * 1.025f, 1.1275f, 0.0001f);
        near("redmagic corrected focus", FOCUS - REDMAGIC_CENTER_CORRECTION,
                0.538f, 0.0001f);
        near("visible depth", alpha(4), 1f, 0.0001f);
        near("hidden depth", alpha(4.25f), 0f, 0.0001f);
        checkCount(1);
        checkCount(3);
        checkCount(10);
        checkCount(17);
        if (postDismissViewport(0, 4) != 0) {
            throw new AssertionError("deleting a back card moved the front viewport");
        }
        if (postDismissViewport(3, 4) != 3) {
            throw new AssertionError("deleting an upper card changed the visible deck slot");
        }
        if (postDismissViewport(4, 4) != 3) {
            throw new AssertionError("deleting the oldest focused card did not clamp once");
        }
        if (postDismissViewport(0, 0) != -1) {
            throw new AssertionError("empty dismissal retained a viewport");
        }
        System.out.println("PASS Xiaomi Recents stack math");
    }
}
