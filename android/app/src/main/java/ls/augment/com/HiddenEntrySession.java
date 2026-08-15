package ls.augment.com;

/** In-memory gate for the intentionally concealed hide-management entry. */
final class HiddenEntrySession {
    enum TapResult { NONE, OPENED, ALREADY_OPEN }

    private static final long TAP_WINDOW_MS = 2_000L;
    private static boolean unlocked;
    private static int tapCount;
    private static long lastTapAt;

    private HiddenEntrySession() { }

    static synchronized boolean isUnlocked() {
        return unlocked;
    }

    static synchronized TapResult recordVersionTap(long now) {
        if (now - lastTapAt > TAP_WINDOW_MS) tapCount = 0;
        lastTapAt = now;
        tapCount++;
        if (tapCount < 7) return TapResult.NONE;
        tapCount = 0;
        if (unlocked) return TapResult.ALREADY_OPEN;
        unlocked = true;
        return TapResult.OPENED;
    }

    static synchronized void unlock() {
        unlocked = true;
        tapCount = 0;
        lastTapAt = 0L;
    }

    static synchronized void lock() {
        unlocked = false;
        tapCount = 0;
        lastTapAt = 0L;
    }
}
