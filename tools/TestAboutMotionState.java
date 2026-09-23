package ls.augment.com;

public final class TestAboutMotionState {
    private static int checks;

    public static void main(String[] args) {
        boundaries();
        densityNormalization();
        reversalAndBounds();
        invalidInput();
        System.out.println("PASS AboutMotionState: " + checks
                + " checks for thresholds, density, reversible position mapping and invalid inputs");
    }

    private static void boundaries() {
        AboutMotionState top = AboutMotionState.at(0, 1);
        close(1, top.versionAlpha, "top version opacity");
        close(1, top.versionScale, "top version scale");
        close(1, top.brandAlpha, "top brand opacity");
        close(1, top.brandScale, "top brand scale");
        close(1, top.backgroundAlpha, "top background opacity");
        require(!top.titleVisible, "toolbar title hidden at top");

        AboutMotionState halfway = AboutMotionState.at(95, 1);
        close(.5f, halfway.versionAlpha, "version opacity halfway through its fade");
        close(1, halfway.brandAlpha, "brand has not started fading at 95 dp");
        require(AboutMotionState.at(189.5f, 1).versionAlpha > 0,
                "version remains visible just before 190 dp");

        AboutMotionState brandStart = AboutMotionState.at(190, 1);
        close(0, brandStart.versionAlpha, "version fully transparent at 190 dp");
        close(1, brandStart.brandAlpha, "brand fade begins at 190 dp");
        close(1, brandStart.brandScale, "brand retains full scale at 190 dp");
        require(!brandStart.titleVisible, "toolbar title hidden at brand fade start");

        AboutMotionState middle = AboutMotionState.at(210, 1);
        close(.5f, middle.brandAlpha, "brand fade midpoint");
        close(.95f, middle.brandScale, "brand scale midpoint");
        require(!middle.titleVisible, "toolbar title hidden during brand fade");
        require(!AboutMotionState.at(229.5f, 1).titleVisible, "title hidden just below 230 dp");
        require(AboutMotionState.at(229.5f, 1).brandAlpha > 0, "brand visible just below 230 dp");

        AboutMotionState titleStart = AboutMotionState.at(230, 1);
        close(0, titleStart.brandAlpha, "brand transparent at 230 dp");
        close(.9f, titleStart.brandScale, "brand reaches final scale at 230 dp");
        require(titleStart.titleVisible, "toolbar title appears exactly at 230 dp");
        require(titleStart.backgroundAlpha > 0, "background fade continues after the title appears");

        AboutMotionState scaleMidpoint = AboutMotionState.at(194.5f, 1);
        close(.95f, scaleMidpoint.versionScale, "version scale uses the 389 dp span");
        close(.5f, scaleMidpoint.backgroundAlpha, "background fade uses the 389 dp span");
        require(AboutMotionState.at(388.5f, 1).backgroundAlpha > 0, "background visible just before 389 dp");
        AboutMotionState end = AboutMotionState.at(389, 1);
        close(0, end.versionAlpha, "end version opacity");
        close(.9f, end.versionScale, "end version scale");
        close(0, end.brandAlpha, "end brand opacity");
        close(.9f, end.brandScale, "end brand scale");
        close(0, end.backgroundAlpha, "end background opacity");
        require(end.titleVisible, "end toolbar title visible");
        same(end, AboutMotionState.at(10000, 1), "scroll past the end stays clamped");
    }

    private static void densityNormalization() {
        for (float density : new float[]{.5f, 1f, 1.5f, 2f, 2.625f, 3.25f, 4f}) {
            for (float dp : new float[]{0, 95, 190, 194.5f, 210, 229.5f, 230, 389, 700}) {
                same(AboutMotionState.at(dp, 1), AboutMotionState.at(dp * density, density),
                        "same dp at density " + density + " position " + dp);
            }
        }
        require(!AboutMotionState.at(230, 2).titleVisible,
                "230 physical pixels at density 2 is only 115 dp");
        require(AboutMotionState.at(460, 2).titleVisible,
                "title threshold scales to 460 physical pixels at density 2");
    }

    private static void reversalAndBounds() {
        AboutMotionState[] descent = new AboutMotionState[801];
        AboutMotionState previous = AboutMotionState.at(0, 1);
        for (int dp = 0; dp < descent.length; dp++) {
            AboutMotionState next = AboutMotionState.at(dp * 3.25f, 3.25f);
            descent[dp] = next;
            bounded(next.versionAlpha, 0, 1, "version opacity bounded");
            bounded(next.versionScale, .9f, 1, "version scale bounded");
            bounded(next.brandAlpha, 0, 1, "brand opacity bounded");
            bounded(next.brandScale, .9f, 1, "brand scale bounded");
            bounded(next.backgroundAlpha, 0, 1, "background opacity bounded");
            require(next.versionAlpha <= previous.versionAlpha, "version fade monotonic downwards");
            require(next.versionScale <= previous.versionScale, "version scale monotonic downwards");
            require(next.brandAlpha <= previous.brandAlpha, "brand fade monotonic downwards");
            require(next.brandScale <= previous.brandScale, "brand scale monotonic downwards");
            require(next.backgroundAlpha <= previous.backgroundAlpha, "background fade monotonic downwards");
            previous = next;
        }
        for (int dp = descent.length - 1; dp >= 0; dp--) {
            exact(descent[dp], AboutMotionState.at(dp * 3.25f, 3.25f), "reverse path at " + dp);
        }
        for (int repeat = 0; repeat < 20; repeat++) {
            AboutMotionState.at(1000, 1);
            exact(descent[0], AboutMotionState.at(0, 1), "return to top has no accumulated state");
        }
    }

    private static void invalidInput() {
        AboutMotionState top = AboutMotionState.at(0, 1);
        for (float scroll : new float[]{-1, -10000, Float.NEGATIVE_INFINITY, Float.NaN, -0f}) {
            same(top, AboutMotionState.at(scroll, 2), "invalid or negative scroll " + scroll);
        }
        for (float density : new float[]{0, -1, -Float.MAX_VALUE, Float.NaN,
                Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY}) {
            same(AboutMotionState.at(210, 1), AboutMotionState.at(210, density),
                    "invalid density falls back to one: " + density);
            same(top, AboutMotionState.at(Float.NaN, density), "invalid scroll and density together");
        }
        AboutMotionState end = AboutMotionState.at(389, 1);
        same(end, AboutMotionState.at(Float.POSITIVE_INFINITY, 1), "positive infinity safely saturates");
        same(end, AboutMotionState.at(Float.MAX_VALUE, 1), "largest finite scroll safely saturates");
        same(end, AboutMotionState.at(1, Float.MIN_VALUE), "overflow after density division safely saturates");
        same(top, AboutMotionState.at(0, Float.MIN_VALUE), "tiny density with zero scroll stays at top");
    }

    private static void same(AboutMotionState expected, AboutMotionState actual, String message) {
        close(expected.versionAlpha, actual.versionAlpha, message + " version alpha");
        close(expected.versionScale, actual.versionScale, message + " version scale");
        close(expected.brandAlpha, actual.brandAlpha, message + " brand alpha");
        close(expected.brandScale, actual.brandScale, message + " brand scale");
        close(expected.backgroundAlpha, actual.backgroundAlpha, message + " background alpha");
        require(expected.titleVisible == actual.titleVisible, message + " title visibility");
    }

    private static void exact(AboutMotionState expected, AboutMotionState actual, String message) {
        require(Float.floatToIntBits(expected.versionAlpha) == Float.floatToIntBits(actual.versionAlpha)
                && Float.floatToIntBits(expected.versionScale) == Float.floatToIntBits(actual.versionScale)
                && Float.floatToIntBits(expected.brandAlpha) == Float.floatToIntBits(actual.brandAlpha)
                && Float.floatToIntBits(expected.brandScale) == Float.floatToIntBits(actual.brandScale)
                && Float.floatToIntBits(expected.backgroundAlpha) == Float.floatToIntBits(actual.backgroundAlpha)
                && expected.titleVisible == actual.titleVisible, message);
    }

    private static void bounded(float value, float min, float max, String message) {
        require(Float.isFinite(value) && value >= min && value <= max, message + ": " + value);
    }
    private static void close(float expected, float actual, String message) {
        require(Float.isFinite(actual) && Math.abs(expected - actual) <= .000001f,
                message + ": expected " + expected + ", actual " + actual);
    }
    private static void require(boolean value, String message) {
        if (!value) throw new AssertionError(message);
        checks++;
    }
}
