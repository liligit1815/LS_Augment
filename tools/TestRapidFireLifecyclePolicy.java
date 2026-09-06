package ls.augment.com;

public final class TestRapidFireLifecyclePolicy {
    public static void main(String[] args) {
        for (String state : new String[] {"PREFLIGHT", "NEEDS_RESTART", "WAIT_LEFT", "WAIT_RIGHT", "VERIFYING"}) {
            check(!RapidFireLifecyclePolicy.expired(state, 600_000L, 600_000L), "deadline boundary " + state);
            check(RapidFireLifecyclePolicy.expired(state, 600_001L, 600_000L), "pending test expires " + state);
            check(RapidFireLifecyclePolicy.ownsExpiredTest("a", "a", state, 600_001L, 600_000L), "own test cleanup");
            check(!RapidFireLifecyclePolicy.ownsExpiredTest("a", "b", state, 600_001L, 600_000L), "new test protected");
        }
        for (String state : new String[] {"PASSED", "FAILED", "FUSED", "UNTESTED"}) {
            check(!RapidFireLifecyclePolicy.expired(state, Long.MAX_VALUE, 600_000L), "terminal is not a timed lease " + state);
            check(!RapidFireLifecyclePolicy.ownsExpiredTest("a", "a", state, Long.MAX_VALUE, 600_000L), "old timer cannot touch terminal state");
        }
        check(!RapidFireLifecyclePolicy.ownsExpiredTest("a", null, "WAIT_LEFT", 600_001L, 600_000L), "cancelled test protected");
        check(!RapidFireLifecyclePolicy.canExpand(false, false), "untested hidden");
        check(!RapidFireLifecyclePolicy.canExpand(false, true), "stale enabled flag cannot unlock");
        check(!RapidFireLifecyclePolicy.canExpand(true, false), "passed but off stays collapsed");
        check(RapidFireLifecyclePolicy.canExpand(true, true), "passed and enabled expands");
        System.out.println("RapidFireLifecyclePolicy tests passed");
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
