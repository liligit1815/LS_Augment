package ls.augment.com.hook;

public final class TestAiTriggerTimingPolicy {
    public static void main(String[] args) {
        equal(80L, AiTriggerTimingPolicy.scanDelay(2_000L, 80L, 80L));
        equal(180L, AiTriggerTimingPolicy.scanDelay(2_000L, 180L, 80L));
        equal(600L, AiTriggerTimingPolicy.scanDelay(2_000L, 600L, 80L));
        equal(2_000L, AiTriggerTimingPolicy.scanDelay(2_000L, 2_000L, 80L));
        equal(1_500L, AiTriggerTimingPolicy.scanDelay(1_500L, 2_000L, 80L));
        equal(80L, AiTriggerTimingPolicy.scanDelay(2_000L, 20L, 80L));
        System.out.println("PASS TestAiTriggerTimingPolicy");
    }

    private static void equal(long expected, long actual) {
        if (expected != actual) {
            throw new AssertionError("expected=" + expected + " actual=" + actual);
        }
    }
}
