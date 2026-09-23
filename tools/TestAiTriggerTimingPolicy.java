package ls.augment.com.hook;

public final class TestAiTriggerTimingPolicy {
    public static void main(String[] args) {
        equal(80L, AiTriggerTimingPolicy.scanDelay(2_000L, 80L, 80L));
        equal(180L, AiTriggerTimingPolicy.scanDelay(2_000L, 180L, 80L));
        equal(600L, AiTriggerTimingPolicy.scanDelay(2_000L, 600L, 80L));
        equal(2_000L, AiTriggerTimingPolicy.scanDelay(2_000L, 2_000L, 80L));
        equal(1_500L, AiTriggerTimingPolicy.scanDelay(1_500L, 2_000L, 80L));
        equal(80L, AiTriggerTimingPolicy.scanDelay(2_000L, 20L, 80L));
        equal(110L, AiTriggerTimingPolicy.actionCooldown(2_000L, 50L, 10L));
        equal(125L, AiTriggerTimingPolicy.actionCooldown(2_000L, 50L, 25L));
        equal(180L, AiTriggerTimingPolicy.actionCooldown(2_000L, 180L, 25L));
        equal(500L, AiTriggerTimingPolicy.actionCooldown(2_000L, 50L, 150L));
        equal(550L, AiTriggerTimingPolicy.actionCooldown(2_000L, 50L, 500L));
        equal(2_000L, AiTriggerTimingPolicy.actionCooldown(2_000L, 2_000L, 500L));
        equal(2_000L, AiTriggerTimingPolicy.actionCooldown(2_000L, 30_000L, 500L));
        // Every supported click/cooldown pair keeps completion after DOWN/UP/disable.
        for (int click = 10; click <= 500; click++) {
            long down = AiTriggerTimingPolicy.touchDelay(102, click);
            long up = AiTriggerTimingPolicy.touchDelay(103, click);
            long disable = AiTriggerTimingPolicy.touchDelay(104, click);
            if (!(down < up && up < disable && disable <= 500L)) {
                throw new AssertionError("unordered click=" + click);
            }
            for (int cooldown : new int[]{50, 180, 1025, 2000}) {
                if (AiTriggerTimingPolicy.actionCooldown(2000L, cooldown, click) < disable + 50L) {
                    throw new AssertionError("completion overlaps click=" + click + " cooldown=" + cooldown);
                }
            }
        }
        System.out.println("PASS TestAiTriggerTimingPolicy");
    }

    private static void equal(long expected, long actual) {
        if (expected != actual) {
            throw new AssertionError("expected=" + expected + " actual=" + actual);
        }
    }
}
