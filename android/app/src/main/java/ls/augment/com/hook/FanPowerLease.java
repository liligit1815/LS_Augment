package ls.augment.com.hook;

import java.lang.reflect.Method;

/** Restores the owner's current OEM mode, never another firmware's speed command. */
final class FanPowerLease {
    private Object owner;
    private String powerMethod;
    private boolean shuttingDown;
    private boolean oemOff;

    synchronized boolean held() { return owner != null; }

    synchronized void acquire(Object nextOwner, String nextMethod) throws Exception {
        if (shuttingDown) throw new IllegalStateException("vendor_shutdown");
        if (oemOff) throw new IllegalStateException("oem_off");
        if (nextOwner == null) throw new IllegalStateException("missing_oem_power_owner");
        if (!"fanMaxSpeed".equals(nextMethod) && !"fanFullSpeed".equals(nextMethod))
            throw new IllegalStateException("unverified_oem_power_method");
        if (owner != null) {
            if (owner != nextOwner || !nextMethod.equals(powerMethod))
                throw new IllegalStateException("oem_power_owner_changed");
            return;
        }
        // A throwing invocation may already have acquired a token: keep restoration ownership.
        owner = nextOwner;
        powerMethod = nextMethod;
        invoke(owner, powerMethod);
    }

    synchronized void restore(boolean nativeFanEnabled) throws Exception {
        if (owner == null) return;
        invoke(owner, "cancelFanFullSpeed");
        if (nativeFanEnabled && !shuttingDown && !oemOff) invoke(owner, "notifyCubeFan");
        owner = null;
        powerMethod = null;
    }

    synchronized void shutdown() throws Exception {
        shuttingDown = true;
        restore(false);
    }

    synchronized void nativeEnableRequested(boolean enabled) throws Exception {
        oemOff = !enabled;
        if (oemOff) restore(false);
    }

    private static void invoke(Object owner, String name) throws Exception {
        Method method = owner.getClass().getDeclaredMethod(name);
        method.setAccessible(true);
        method.invoke(owner);
    }
}
