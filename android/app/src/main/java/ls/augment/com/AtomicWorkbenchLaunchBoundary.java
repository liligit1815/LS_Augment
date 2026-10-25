package ls.augment.com;

/** Optional, synchronous admission that stays live until the actual platform dispatch. */
final class AtomicWorkbenchLaunchBoundary {
    interface Check { void require(String component) throws Exception; }
    private static final ThreadLocal<Check> ACTIVE = new ThreadLocal<>();
    private AtomicWorkbenchLaunchBoundary() { }

    static AutoCloseable enter(Check check) {
        if (check == null || ACTIVE.get() != null) throw new IllegalStateException("launch_boundary_busy");
        Thread thread = Thread.currentThread();
        ACTIVE.set(check);
        return () -> {
            if (Thread.currentThread() != thread || ACTIVE.get() != check) throw new IllegalStateException("launch_boundary_owner");
            ACTIVE.remove();
        };
    }

    static void require(String component) throws Exception {
        Check check = ACTIVE.get();
        if (check != null) check.require(component);
    }

    static boolean isActive() { return ACTIVE.get() != null; }
}
