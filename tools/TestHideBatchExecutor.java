package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class TestHideBatchExecutor {
    private static int checks;
    public static void main(String[] args) {
        Fake normal = new Fake("0:a", "999:a", "0:b");
        HideBatchExecutor.Outcome<String> hidden = new HideBatchExecutor<>(normal).execute(normal.targets(), true);
        check(hidden.success.size() == 3 && hidden.failures.isEmpty(), "hide verifies each user target");
        check(normal.queries == 2 && normal.writes.size() == 1, "one before and after snapshot for batch");
        HideBatchExecutor.Outcome<String> visible = new HideBatchExecutor<>(normal).execute(normal.targets(), false);
        check(visible.success.size() == 3, "restoration verifies visible state");

        Fake noOp = new Fake("one");
        noOp.states.put("one", HideBatchExecutor.State.HIDDEN);
        check(new HideBatchExecutor<>(noOp).execute(noOp.targets(), true).success.size() == 1
                && noOp.writes.isEmpty(), "already hidden is read, never written");

        Fake invalid = new Fake("missing", "unknown");
        invalid.states.put("missing", HideBatchExecutor.State.MISSING);
        invalid.states.put("unknown", HideBatchExecutor.State.ERROR);
        check(new HideBatchExecutor<>(invalid).execute(invalid.targets(), true).failures.size() == 2
                && invalid.writes.isEmpty(), "missing/permission error fail before mutation");

        Fake partial = new Fake("ok", "retry");
        partial.firstMiss = "retry";
        check(new HideBatchExecutor<>(partial).execute(partial.targets(), true).success.size() == 2,
                "eventual state is accepted after retry");
        check(partial.writes.size() == 2 && partial.writes.get(1).equals(set("retry")),
                "only unmatched target is retried");

        Fake persistent = new Fake("bad");
        persistent.neverChange = true;
        check(new HideBatchExecutor<>(persistent).execute(persistent.targets(), true).failures.size() == 1
                && persistent.writes.size() == 3, "successful shell exit without matching state fails after three attempts");

        Fake timeout = new Fake("done", "stuck", "three", "four", "five", "six", "seven", "eight", "later");
        timeout.timeout = true;
        HideBatchExecutor.Outcome<String> timed = new HideBatchExecutor<>(timeout).execute(timeout.targets(), true);
        check(timed.success.equals(set("done")), "timeout retains only targets verified successful");
        check(timed.failures.size() == 8 && timeout.writes.size() == 1 && timeout.queries == 2,
                "timeout verifies attempted batch and stops following writes/retries");

        Fake preparationFailed = new Fake("one", "two", "three", "four", "five", "six", "seven", "eight", "later");
        preparationFailed.stop = true;
        preparationFailed.neverChange = true;
        HideBatchExecutor.Outcome<String> notPrepared = new HideBatchExecutor<>(preparationFailed)
                .execute(preparationFailed.targets(), true);
        check(notPrepared.success.isEmpty() && notPrepared.failures.size() == 9
                && preparationFailed.writes.size() == 1, "preparation stop prevents retries and later batches");

        Fake observationFailed = new Fake("one", "two", "three", "four", "five", "six", "seven", "eight", "later");
        observationFailed.stop = true;
        HideBatchExecutor.Outcome<String> notRecorded = new HideBatchExecutor<>(observationFailed)
                .execute(observationFailed.targets(), true);
        check(notRecorded.success.isEmpty() && notRecorded.failures.size() == 9
                && observationFailed.writes.size() == 1 && observationFailed.queries == 2,
                "a visible state change cannot hide a mandatory recovery-record failure");
        check(observationFailed.states.get("one") == HideBatchExecutor.State.HIDDEN
                && observationFailed.states.get("later") == HideBatchExecutor.State.VISIBLE,
                "failed observation retains actual state while later target remains untouched");
        check(notRecorded.failures.get("one").equals("journal failure"), "record failure reason is preserved");

        Fake deniedAfter = new Fake("one");
        deniedAfter.errorAfter = true;
        check(new HideBatchExecutor<>(deniedAfter).execute(deniedAfter.targets(), true).failures.size() == 1
                && deniedAfter.writes.size() == 1, "post-write permission failure cannot report success");

        Fake many = new Fake();
        for (int i = 0; i < 40; i++) many.states.put("0:com.test.app" + i, HideBatchExecutor.State.VISIBLE);
        long start = System.nanoTime();
        many.simulatedShellDelay = true;
        check(new HideBatchExecutor<>(many).execute(many.targets(), true).success.size() == 40, "40 targets all verified");
        // Include the final fresh snapshot used for both mirrors and aggregate state.
        many.query(many.targets());
        long batchedMs = (System.nanoTime() - start) / 1_000_000;
        int oldCalls = 40 * 6; // per target: conflict, before, write, after, mirror scan, summary scan
        start = System.nanoTime();
        for (int i = 0; i < oldCalls; i++) delay();
        long oldMs = (System.nanoTime() - start) / 1_000_000;
        check(many.shellCalls == 20 && many.writes.size() == 5, "40 targets use 20 grouped shell calls instead of 240");
        for (Set<String> batch : many.writes) check(batch.size() <= 8, "bounded mutation batch");
        System.out.println("Hide batch checks: " + checks + " OK");
        System.out.println("Simulated 40-target shell overhead: oldCalls=" + oldCalls
                + " batchCalls=" + many.shellCalls + " oldMs=" + oldMs + " batchMs=" + batchedMs
                + " (3ms fake shell startup; excludes real Android pm/am work)");
    }

    private static Set<String> set(String... items) { return new LinkedHashSet<>(Arrays.asList(items)); }
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
    private static void delay() {
        try { Thread.sleep(3); } catch (InterruptedException error) { throw new AssertionError(error); }
    }
    private static final class Fake implements HideBatchExecutor.Transport<String> {
        final Map<String, HideBatchExecutor.State> states = new LinkedHashMap<>();
        final List<Set<String>> writes = new ArrayList<>();
        int queries, shellCalls;
        boolean neverChange, timeout, errorAfter, simulatedShellDelay, stop;
        String firstMiss;
        Fake(String... targets) { for (String target : targets) states.put(target, HideBatchExecutor.State.VISIBLE); }
        Set<String> targets() { return new LinkedHashSet<>(states.keySet()); }
        @Override public Map<String, HideBatchExecutor.State> query(Set<String> targets) {
            queries++;
            int batches = (targets.size() + 7) / 8;
            shellCalls += batches;
            if (simulatedShellDelay) for (int i = 0; i < batches; i++) delay();
            Map<String, HideBatchExecutor.State> result = new LinkedHashMap<>();
            for (String target : targets) result.put(target, errorAfter && !writes.isEmpty()
                    ? HideBatchExecutor.State.ERROR : states.get(target));
            return result;
        }
        @Override public HideBatchExecutor.CommandResult change(Set<String> targets, boolean hide) {
            writes.add(new LinkedHashSet<>(targets));
            shellCalls++;
            if (simulatedShellDelay) delay();
            for (String target : targets) {
                if (neverChange || (writes.size() == 1 && target.equals(firstMiss))) continue;
                if (timeout && !target.equals("done")) continue;
                states.put(target, hide ? HideBatchExecutor.State.HIDDEN : HideBatchExecutor.State.VISIBLE);
            }
            return new HideBatchExecutor.CommandResult(timeout, stop ? "journal failure" : "", stop);
        }
    }
}
