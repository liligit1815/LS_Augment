package ls.augment.com;

/** Bounded lifecycle decisions shared by the UI and its authenticated root endpoint. */
final class AtomicWorkbenchLifecyclePolicy {
    static final long STOP_GRACE_MS = 350L;
    private AtomicWorkbenchLifecyclePolicy() { }

    static String requireReason(String reason) {
        if (reason == null) throw new IllegalArgumentException("missing workbench close reason");
        switch (reason) {
            case "user_exit": case "navigation": case "host_stopped": case "host_destroyed":
            case "surface_lost": case "config_reset": case "recovery_retry": case "launch_failure":
            case "connection_replaced": case "abandoned_connect": return reason;
            default: throw new IllegalArgumentException("invalid workbench close reason");
        }
    }

    static boolean focusPrimaryHome(String reason, boolean observedPrimaryHome, boolean interactive, boolean locked) {
        return ("host_stopped".equals(reason) || "surface_lost".equals(reason))
                && observedPrimaryHome && interactive && !locked;
    }

    static final class Gate {
        private int generation;
        private boolean active, surfaceLost;
        void started() { active = true; generation++; }
        int stopped() { active = false; return ++generation; }
        int surfaceLost() { surfaceLost = true; return ++generation; }
        int pending() { return generation; }
        boolean shouldClose(int ticket) { return ticket == generation && (!active || surfaceLost); }
        boolean surfaceMissing() { return surfaceLost; }
        void closing() { generation++; }
        void restored() { surfaceLost = false; generation++; }
    }
}
