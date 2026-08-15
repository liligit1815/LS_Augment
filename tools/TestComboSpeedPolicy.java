package ls.augment.com.hook;

public final class TestComboSpeedPolicy {
    public static void main(String[] args) {
        check(6546L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 1.0f, 1.0f), "1x");
        check(3273L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 1.0f, 2.0f), "2x");
        check(6546L, ComboSpeedPolicy.adjustRecoveryTime(3273L, 2.0f, 1.0f), "restore OEM 2x to 1x");
        check(1637L, ComboSpeedPolicy.adjustRecoveryTime(3273L, 2.0f, 4.0f), "OEM 2x to 4x");
        check(655L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 1.0f, 10.0f), "10x");
        check(6546L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 0.0f, 2.0f), "invalid original rate");
        check(6546L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 1.0f, Float.NaN), "invalid target rate");
        check(304367L, ComboSpeedPolicy.scaleTimestamp(
                306669L, 303600L, 4.0f), "4x motion timestamp");
        check(303907L, ComboSpeedPolicy.scaleTimestamp(
                306669L, 303600L, 10.0f), "10x motion timestamp");
        check(303600L, ComboSpeedPolicy.scaleTimestamp(
                303600L, 303600L, 4.0f), "motion origin");
        check(306669L, ComboSpeedPolicy.scaleTimestamp(
                306669L, 303600L, Float.NaN), "invalid motion rate");
        if (!ComboSpeedPolicy.isValidRate(1.0f)
                || !ComboSpeedPolicy.isValidRate(4.0f)
                || !ComboSpeedPolicy.isValidRate(10.0f)
                || ComboSpeedPolicy.isValidRate(0.5f)
                || ComboSpeedPolicy.isValidRate(4.5f)
                || ComboSpeedPolicy.isValidRate(10.01f)) {
            throw new AssertionError("rate validation");
        }
        checkText(ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                "stable cache identity");
        checkDifferent(ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123457L, 4.0f),
                "mtime invalidates cache");
        checkDifferent(ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 5.0f),
                "rate separates cache");
        checkDifferent(ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                ComboSpeedPolicy.cacheIdentity("和平精英_002", 123456L, 4.0f),
                "file name separates cache");
        checkText(null, ComboSpeedPolicy.cacheIdentity(
                "王者荣耀_002", 123456L, 4.5f), "fractional cache rate rejected");
        System.out.println("TestComboSpeedPolicy OK");
    }

    private static void check(long expected, long actual, String name) {
        if (expected != actual) {
            throw new AssertionError(name + ": expected=" + expected + " actual=" + actual);
        }
    }

    private static void checkText(String expected, String actual, String name) {
        if (expected == null ? actual != null : !expected.equals(actual)) {
            throw new AssertionError(name + ": expected=" + expected + " actual=" + actual);
        }
    }

    private static void checkDifferent(String first, String second, String name) {
        if (first == null || first.equals(second)) {
            throw new AssertionError(name + ": first=" + first + " second=" + second);
        }
    }
}
