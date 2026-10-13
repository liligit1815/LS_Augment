package ls.augment.com.hook;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import ls.augment.com.ShoulderQuickSwitchPolicy;
import ls.augment.com.ShoulderQuickSwitchPolicy.CaseRef;

/** Scheduling assertions against the production coordinator, without Android. */
public final class TestShoulderSwitchCoordinator {
    private static int checks;
    private static final CaseRef A = ref(0, "game.one", 0, 11);
    private static final CaseRef B = ref(0, "game.one", 1, 29);
    private static final CaseRef C = ref(0, "game.one", 0, 97);

    private static CaseRef ref(int user, String pkg, int table, long id) {
        return new CaseRef(user, pkg, table, id);
    }
    private static void check(boolean ok, String reason) {
        checks++;
        if (!ok) throw new AssertionError(reason);
    }
    private static void incompatible(ShoulderSwitchCoordinator coordinator, CaseRef previous,
            CaseRef target) {
        ShoulderSwitchCoordinator.Ticket before = coordinator.current();
        try {
            coordinator.begin(previous, target);
            throw new AssertionError("accepted incompatible case");
        } catch (IllegalArgumentException expected) {
            check(coordinator.current() == before, "invalid request preserves active request");
        }
    }

    public static void main(String[] args) throws Exception {
        ShoulderSwitchCoordinator coordinator = new ShoulderSwitchCoordinator();
        check(coordinator.current() == null, "initially idle");
        check(coordinator.logicalCurrent(A).equals(A), "idle uses actual selection");
        check(!coordinator.isLatest(null) && !coordinator.beginApply(null)
                && !coordinator.complete(null) && !coordinator.fail(null), "null callback rejected");
        ShoulderSwitchCoordinator.Ticket b = coordinator.begin(A, B);
        check(b.previous.equals(A) && b.target.equals(B), "stable table and case IDs retained");
        check(b.phase == ShoulderSwitchCoordinator.Phase.PERSISTING, "new request waits for persistence");
        check(!coordinator.complete(b), "save completion alone cannot declare apply success");
        check(coordinator.logicalCurrent(A).equals(B), "pending request drives the next click");
        incompatible(coordinator, null, B);
        incompatible(coordinator, A, null);
        incompatible(coordinator, A, ref(10, "game.one", 1, 29));
        incompatible(coordinator, A, ref(0, "game.two", 1, 29));
        check(coordinator.beginApply(b), "latest committed save may begin applying");
        check(!coordinator.beginApply(b), "one apply admission per request");
        check(b.phase == ShoulderSwitchCoordinator.Phase.APPLYING, "not successful before input apply");
        check(coordinator.complete(b), "successful input apply completes request");
        check(b.phase == ShoulderSwitchCoordinator.Phase.APPLIED && coordinator.current() == null,
                "completion releases pending state");
        check(!coordinator.complete(b) && !coordinator.beginApply(b) && !coordinator.fail(b),
                "duplicate completion cannot reapply or roll back");

        // The pair is clicked faster than persistence. Every click advances logical intent,
        // while rollback still refers to the actual A that was applied before the burst.
        List<CaseRef> pair = Arrays.asList(A, B);
        b = coordinator.begin(A, ShoulderQuickSwitchPolicy.directTarget(pair, coordinator.logicalCurrent(A)));
        ShoulderSwitchCoordinator.Ticket a = coordinator.begin(A,
                ShoulderQuickSwitchPolicy.directTarget(pair, coordinator.logicalCurrent(A)));
        ShoulderSwitchCoordinator.Ticket b2 = coordinator.begin(A,
                ShoulderQuickSwitchPolicy.directTarget(pair, coordinator.logicalCurrent(A)));
        check(b.target.equals(B) && a.target.equals(A) && b2.target.equals(B), "rapid A/B/A/B clicks");
        check(b.phase == ShoulderSwitchCoordinator.Phase.CANCELLED
                && a.phase == ShoulderSwitchCoordinator.Phase.CANCELLED, "new intent cancels old tickets");
        check(!coordinator.beginApply(b) && !coordinator.complete(a) && !coordinator.fail(b),
                "old save/failure callbacks do not affect the latest request");
        check(coordinator.current() == b2 && b2.previous.equals(A), "rollback uses actual previous case");
        check(coordinator.beginApply(b2) && coordinator.complete(b2), "last rapid pair target applies");

        // Enumerate all completion orders for three queued menu requests. Only C applies.
        int[][] orders = {{0,1,2},{0,2,1},{1,0,2},{1,2,0},{2,0,1},{2,1,0}};
        for (int[] order : orders) {
            ShoulderSwitchCoordinator c = new ShoulderSwitchCoordinator();
            ShoulderSwitchCoordinator.Ticket[] tickets = {c.begin(A, B), c.begin(A, A), c.begin(A, C)};
            List<CaseRef> applied = new ArrayList<>();
            for (int index : order) if (c.beginApply(tickets[index])) {
                applied.add(tickets[index].target);
                check(c.complete(tickets[index]), "admitted request completes");
            }
            check(applied.equals(List.of(C)), "only final menu target applies for " + Arrays.toString(order));
            for (ShoulderSwitchCoordinator.Ticket old : tickets)
                check(!c.beginApply(old) && !c.complete(old), "all late duplicate callbacks rejected");
        }

        for (boolean afterApplyAdmission : new boolean[]{false, true}) {
            ShoulderSwitchCoordinator c = new ShoulderSwitchCoordinator();
            ShoulderSwitchCoordinator.Ticket failed = c.begin(A, B);
            if (afterApplyAdmission) check(c.beginApply(failed), "input failure starts after admission");
            check(c.fail(failed), afterApplyAdmission ? "input failure retires request" : "DB failure retires request");
            check(failed.phase == ShoulderSwitchCoordinator.Phase.FAILED && c.current() == null,
                    "failure releases pending state");
            check(c.logicalCurrent(A).equals(A), "failure resumes actual previous selection");
            check(!c.beginApply(failed) && !c.complete(failed), "failed callback cannot declare success");
            ShoulderSwitchCoordinator.Ticket retry = c.begin(A, C);
            check(retry.sequence > failed.sequence && c.beginApply(retry) && c.complete(retry),
                    "retry after failure is independently admitted");
        }

        for (String cancellation : new String[]{"feature disabled", "foreground app changed", "service destroyed"}) {
            ShoulderSwitchCoordinator c = new ShoulderSwitchCoordinator();
            ShoulderSwitchCoordinator.Ticket pending = c.begin(A, B);
            c.cancel();
            check(pending.phase == ShoulderSwitchCoordinator.Phase.CANCELLED && c.current() == null,
                    cancellation + " clears pending state");
            check(!c.isLatest(pending) && !c.beginApply(pending) && !c.complete(pending)
                    && !c.fail(pending), cancellation + " rejects all stale completions");
            check(c.logicalCurrent(A).equals(A), cancellation + " does not expose cancelled target");
            c.cancel();
            ShoulderSwitchCoordinator.Ticket next = c.begin(A, C);
            check(next.sequence > pending.sequence && c.isLatest(next), "new request after " + cancellation);
        }

        // A real second thread completes storage after cancellation; no main-thread apply
        // admission is allowed. The handshake makes this deterministic rather than timing-based.
        ShoulderSwitchCoordinator c = new ShoulderSwitchCoordinator();
        ShoulderSwitchCoordinator.Ticket pending = c.begin(A, B);
        CountDownLatch stored = new CountDownLatch(1), cancelled = new CountDownLatch(1);
        AtomicReference<Throwable> error = new AtomicReference<>();
        Thread writer = new Thread(() -> {
            try {
                stored.countDown();
                cancelled.await();
                if (c.beginApply(pending)) throw new AssertionError("late writer admitted after cancellation");
            } catch (Throwable failure) { error.set(failure); }
        }, "coordinator-cancellation-test");
        writer.start();stored.await();c.cancel();cancelled.countDown();writer.join(5000);
        check(!writer.isAlive() && error.get() == null, "cross-thread late completion is rejected");
        System.out.println("PASS production shoulder switch coordinator: " + checks + " checks");
    }
}
