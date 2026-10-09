package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/** Real worker barriers: cancellation waits for actual completion and fences delayed writers. */
public final class TestModuleWorkerDrain {
    private static int checks;
    private static void check(boolean value, String label) { checks++; if (!value) throw new AssertionError(label); }
    public static void main(String[] args) throws Exception {
        if (args.length > 0 && args[0].equals("--battery-script")) { System.out.print(BatteryLifeControl.ownershipPreflight()); return; }
        ModuleWorkerDrain workers = new ModuleWorkerDrain();
        AtomicInteger stopped = new AtomicInteger(), writes = new AtomicInteger();
        CountDownLatch cancel = new CountDownLatch(1), entered = new CountDownLatch(1), finish = new CountDownLatch(1);
        long initial = ResetWriteFence.generation();
        ModuleWorkerDrain.Ticket active = workers.register(initial, () -> { stopped.incrementAndGet(); cancel.countDown(); });
        AtomicBoolean interrupted = new AtomicBoolean();
        Thread worker = new Thread(() -> {
            entered.countDown();
            try { cancel.await(); finish.await(); }
            catch (InterruptedException error) { interrupted.set(true); }
            active.ifCurrent(writes::incrementAndGet);
            active.close();
        });
        worker.start(); check(entered.await(2, TimeUnit.SECONDS), "worker started");
        ResetWriteFence.begin();
        check(!workers.cancelAndAwait(30), "a cancelled but unfinished Root operation is still pending");
        check(stopped.get() == 1 && !interrupted.get(), "cooperative cancellation does not interrupt restoration");
        check(!active.current() && !active.ifCurrent(writes::incrementAndGet), "old status writer fenced during reset");
        check(workers.register(initial, () -> { }) == null, "queued pre-reset capture rejected before creating a lease");
        AtomicBoolean blockedRegistration = new AtomicBoolean();
        Thread newWorker = new Thread(() -> blockedRegistration.set(workers.register(ResetWriteFence.generation(), () -> { }) == null));
        newWorker.start(); newWorker.join(); check(blockedRegistration.get(), "new background worker rejected throughout reset");
        finish.countDown(); check(workers.cancelAndAwait(2000), "await releases only after worker final cleanup");
        worker.join(); check(writes.get() == 0, "cancelled worker does not write checkpoints after restoration");
        ResetWriteFence.end();
        check(!active.current() && !active.ifCurrent(writes::incrementAndGet), "old worker cannot revive after reset ends");
        check(workers.register(initial, () -> { }) == null, "old queued capture stays stale after reset ends");
        ModuleWorkerDrain.Ticket fresh = workers.register(ResetWriteFence.generation(), () -> { });
        check(fresh != null && fresh.ifCurrent(writes::incrementAndGet), "fresh post-reset work allowed");
        fresh.close(); check(!fresh.ifCurrent(writes::incrementAndGet), "closed session cannot perform delayed writes");

        CountDownLatch writing = new CountDownLatch(1), releaseWrite = new CountDownLatch(1);
        ModuleWorkerDrain.Ticket concurrent = workers.register(ResetWriteFence.generation(), () -> { });
        Thread writer = new Thread(() -> {
            concurrent.ifCurrent(() -> {
                writing.countDown();
                try { releaseWrite.await(); } catch (InterruptedException error) { throw new AssertionError(error); }
                writes.incrementAndGet();
            });
            concurrent.close();
        });
        writer.start(); check(writing.await(2, TimeUnit.SECONDS), "write has entered its critical section");
        ResetWriteFence.begin();
        Thread release = new Thread(() -> { try { Thread.sleep(80); } catch (InterruptedException ignored) { } releaseWrite.countDown(); });
        release.start(); check(workers.cancelAndAwait(2000), "reset barrier drains an already committing write before deleting its store");
        writer.join(); release.join(); check(writes.get() == 2, "only the admitted pre-barrier write completed");
        ResetWriteFence.end(); check(workers.cancelAndAwait(100), "empty drain is idempotent");
        testRestoreProof();
        System.out.println("PASS ModuleWorkerDrain: " + checks + " assertions; actual cooperative completion, no device commands");
    }
    private static void testRestoreProof() throws Exception {
        java.lang.reflect.Field unconfirmed = RapidCaptureReset.class.getDeclaredField("restorationUnconfirmed");
        unconfirmed.setAccessible(true);
        unconfirmed.setBoolean(null, false);
        String ack = "LSA_CAPTURE_END=cancelled\nLSA_CAPTURE_RESTORED=2:1\n";
        RapidCaptureReset.observeHardwareResult(new RootShell.Result(130, ack, false,
                new RootShell.CapturedOutput(ack.getBytes(StandardCharsets.UTF_8), true, false, false)));
        check(!unconfirmed.getBoolean(null), "cancelled hardware session accepts restoration proof despite exit 130");
        RapidCaptureReset.observeHardwareResult(new RootShell.Result(2, "LSA_CAPTURE_ERROR=busy", false));
        check(!unconfirmed.getBoolean(null), "busy rejection did not modify hardware");
        RapidCaptureReset.observeHardwareResult(new RootShell.Result(2, "LSA_CAPTURE_ERROR=restore_failed", false));
        check(unconfirmed.getBoolean(null), "restoration failure requires review even if lock disappears");
        unconfirmed.setBoolean(null, false);
        RapidCaptureReset.observeHardwareResult(new RootShell.Result(0, ack, false));
        check(unconfirmed.getBoolean(null), "synthetic or incomplete capture cannot claim restoration");
        unconfirmed.setBoolean(null, false);
    }
}
