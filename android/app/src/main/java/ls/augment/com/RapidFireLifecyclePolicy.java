package ls.augment.com;

/** Shared, Android-free policy for test deadlines and feature presentation. */
public final class RapidFireLifecyclePolicy {
    private RapidFireLifecyclePolicy() { }

    public static boolean pending(String state) {
        return "PREFLIGHT".equals(state) || "NEEDS_RESTART".equals(state)
                || "WAIT_LEFT".equals(state) || "WAIT_RIGHT".equals(state)
                || "VERIFYING".equals(state);
    }

    public static boolean expired(String state, long now, long expiresAt) {
        // A completed test is a historical result, not a ten-minute usage lease.
        return pending(state) && now > expiresAt;
    }

    public static boolean ownsExpiredTest(String scheduledId, String currentId,
            String state, long now, long expiresAt) {
        return scheduledId != null && scheduledId.equals(currentId)
                && expired(state, now, expiresAt);
    }

    public static boolean canExpand(boolean compatible, boolean enabled) {
        return compatible && enabled;
    }
}
