package ls.augment.com;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

public final class TestRapidFireRouteEvidence {
    private static final String ID = "4c03b9c3831342fb8f1f02fdb0884249";

    public static void main(String[] args) throws Exception {
        RapidFireRouteEvidence left = RapidFireRouteEvidence.start(ID, "WAIT_LEFT");
        // Regression: the OEM refreshes LEFT then RIGHT while the user is testing LEFT.
        left.record(137, 137);
        left.record(138, 138);
        check(left.resolve(137) == 137, "later right setting must not overwrite left mapping");
        check(left.resolve(138) == 138, "both candidates retained, side not guessed");
        left.record(138, 138);
        check(left.resolve(137) == 137, "duplicate refresh is harmless");
        check(left.resolve(136) == -1, "unobserved mapping is not guessed");
        RapidFireRouteEvidence different = RapidFireRouteEvidence.start(ID, "WAIT_RIGHT");
        different.record(136, 501);
        different.record(222, 138);
        check(different.resolve(501) == 136 && different.resolve(138) == 222,
                "upper/system codes may differ, with no 136/137/138 whitelist");
        RapidFireRouteEvidence restored = RapidFireRouteEvidence.parse(different.serialize());
        check(restored != null && restored.resolve(501) == 136, "round trip");
        check(!restored.matches(ID, "WAIT_LEFT"), "previous phase ignored");
        check(!restored.matches("4058944d908d4836b6011f8f97f24884", "WAIT_RIGHT"), "previous session ignored");
        different.record(223, 138);
        check(different.isConflicted() && different.resolve(138) == -1, "two upper codes for one system code fail closed");
        check(RapidFireRouteEvidence.parse(different.serialize()).resolve(501) == -1, "conflict survives serialization");
        RapidFireRouteEvidence reusedUpper = RapidFireRouteEvidence.start(ID, "WAIT_LEFT");
        reusedUpper.record(137, 137);
        reusedUpper.record(137, 138);
        check(reusedUpper.resolve(137) == -1, "same upper mapped to two system codes is ambiguous");
        RapidFireRouteEvidence bounded = RapidFireRouteEvidence.start(ID, "WAIT_LEFT");
        for (int key = 1; key <= 17; key++) bounded.record(key, key + 100);
        check(bounded.isConflicted(), "bounded evidence instead of unbounded growth");
        check(RapidFireRouteEvidence.parse("id=" + ID + "|code=138") == null, "legacy last-value records cannot approve");
        check(RapidFireRouteEvidence.parse(left.serialize() + "|extra") == null, "malformed evidence rejected");
        check(RapidFireRouteEvidence.start(ID, "PASSED") == null, "no routes collected after completion");

        RapidFireRouteEvidence.Calls calls = new RapidFireRouteEvidence.Calls();
        try (RapidFireRouteEvidence.Calls.Scope scope = calls.begin()) {
            calls.current().observe(501);
            check(scope.trace.resolvedSystem() == 501, "single correlated transport");
            calls.current().observe(501);
            check(scope.trace.resolvedSystem() == 501, "same transport repeated");
            calls.current().observe(138);
            check(scope.trace.resolvedSystem() == -1, "multiple transports in one call rejected");
        }
        check(calls.current() == null, "scope cleaned");
        try (RapidFireRouteEvidence.Calls.Scope outer = calls.begin()) {
            calls.current().observe(137);
            try (RapidFireRouteEvidence.Calls.Scope inner = calls.begin()) {
                calls.current().observe(138);
                check(inner.trace.resolvedSystem() == -1, "nested proxy ambiguity rejected");
            }
            check(calls.current() == outer.trace && outer.trace.resolvedSystem() == -1,
                    "outer context restored but not falsely approved");
        }
        try {
            try (RapidFireRouteEvidence.Calls.Scope ignored = calls.begin()) {
                calls.current().observe(137);
                throw new IllegalStateException("simulated vendor failure");
            }
        } catch (IllegalStateException expected) { }
        check(calls.current() == null, "exception cannot leak context to next call");
        try (RapidFireRouteEvidence.Calls.Scope scope = calls.begin()) {
            check(scope.trace.resolvedSystem() == -1, "no bridge/no synchronous call is not approval");
            scope.trace.observe(137);
            scope.trace.reject();
            check(scope.trace.resolvedSystem() == -1, "failed transport cannot approve");
        }
        AtomicReference<Throwable> failure = new AtomicReference<>();
        CountDownLatch both = new CountDownLatch(2);
        Thread a = worker(calls, 137, both, failure);
        Thread b = worker(calls, 138, both, failure);
        a.start(); b.start(); a.join(); b.join();
        if (failure.get() != null) throw new AssertionError(failure.get());
        check(calls.current() == null, "thread-local routes do not leak to caller");
        System.out.println("RapidFireRouteEvidence tests passed");
    }

    private static Thread worker(RapidFireRouteEvidence.Calls calls, int code,
            CountDownLatch both, AtomicReference<Throwable> failure) {
        return new Thread(() -> {
            try (RapidFireRouteEvidence.Calls.Scope scope = calls.begin()) {
                calls.current().observe(code);
                both.countDown(); both.await();
                check(scope.trace.resolvedSystem() == code, "concurrent sides remain isolated");
            } catch (Throwable error) { failure.set(error); }
        });
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
