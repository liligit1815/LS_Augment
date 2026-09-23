package ls.augment.com.hook;

import java.util.ArrayList;
import java.util.List;

public final class TestFanPowerLease {
    public static void main(String[] args) throws Exception {
        Vendor old = new Vendor();
        FanPowerLease lease = new FanPowerLease();
        lease.acquire(old, "fanFullSpeed");
        lease.acquire(old, "fanFullSpeed");
        check(old.events.equals(List.of("113")), "one OEM request, never 128 or a level write");
        old.nativeExtreme = false;
        lease.restore(true);
        check(old.events.equals(List.of("113", "cancel", "native_auto")), "mode change restores current OEM state");
        check(!lease.held(), "mode change releases module ownership");

        old.events.clear();
        old.nativeExtreme = true;
        lease.acquire(old, "fanFullSpeed");
        lease.restore(true);
        check(old.events.equals(List.of("113", "cancel", "native_113")), "switch off releases then restores OEM extreme");
        check(!lease.held(), "native mode reacquisition is not module ownership");

        old.events.clear();
        lease.acquire(old, "fanFullSpeed");
        lease.restore(false);
        check(old.events.equals(List.of("113", "cancel")), "OEM off never requests power again");

        old.events.clear();
        lease.acquire(old, "fanFullSpeed");
        lease.nativeEnableRequested(false);
        boolean offBlocked = false;
        try { lease.acquire(old, "fanFullSpeed"); } catch (IllegalStateException expected) { offBlocked = true; }
        check(offBlocked && old.events.equals(List.of("113", "cancel")),
                "pending asynchronous enable-node write cannot let a late worker reacquire");
        lease.nativeEnableRequested(true);

        old.events.clear();
        lease.acquire(old, "fanFullSpeed");
        lease.shutdown();
        lease.restore(true);
        check(old.events.equals(List.of("113", "cancel")), "shutdown never restores enabled mode");
        boolean blocked = false;
        try { lease.acquire(old, "fanFullSpeed"); } catch (IllegalStateException expected) { blocked = true; }
        check(blocked, "late worker cannot reacquire during shutdown");

        FanPowerLease newer = new FanPowerLease();
        Vendor max = new Vendor();
        newer.acquire(max, "fanMaxSpeed");
        newer.restore(true);
        check(max.events.equals(List.of("128", "cancel", "native_auto")), "verified newer API preserved");

        FanPowerLease failed = new FanPowerLease();
        Vendor partial = new Vendor();
        partial.throwAfterAcquire = true;
        boolean threw = false;
        try { failed.acquire(partial, "fanFullSpeed"); } catch (Exception expected) { threw = true; }
        check(threw && failed.held(), "partial acquisition retains restoration ownership");
        failed.restore(false);
        check(partial.events.equals(List.of("113", "cancel")) && !failed.held(), "partial acquisition can be released");
        System.out.println("PASS TestFanPowerLease");
    }

    private static final class Vendor {
        final List<String> events = new ArrayList<>();
        boolean nativeExtreme;
        boolean throwAfterAcquire;
        private void fanFullSpeed() {
            events.add("113");
            if (throwAfterAcquire) throw new IllegalStateException("after_acquire");
        }
        private void fanMaxSpeed() { events.add("128"); }
        private void cancelFanFullSpeed() { events.add("cancel"); }
        private void notifyCubeFan() { events.add(nativeExtreme ? "native_113" : "native_auto"); }
    }
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
}
