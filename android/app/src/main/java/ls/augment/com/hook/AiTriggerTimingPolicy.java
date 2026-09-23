package ls.augment.com.hook;

/** Pure cadence policy: honor the configured floor without slowing the OEM loop. */
final class AiTriggerTimingPolicy {
    private AiTriggerTimingPolicy() { }

    static long scanDelay(long originalDelayMs, long configuredDelayMs, long minimumDelayMs) {
        if (originalDelayMs <= 0L) return originalDelayMs;
        long configured = Math.max(minimumDelayMs, configuredDelayMs);
        return Math.min(originalDelayMs, configured);
    }

    static long touchDelay(int message, long configuredClickMs) {
        long click = Math.max(10L, Math.min(500L, configuredClickMs));
        switch (message) {
            case 102: return Math.min(50L, click);
            case 103: return Math.min(450L, Math.max(click + 25L, click * 2L));
            case 104: return Math.min(500L, Math.max(click + 50L, click * 3L));
            default: return -1L;
        }
    }

    static long actionCooldown(long originalDelayMs, long configuredCooldownMs, long configuredClickMs) {
        if (originalDelayMs <= 0) return originalDelayMs;
        // Completion clears the OEM's running flag on another Handler. Keep it
        // closed until the virtual touch has been disabled, including handoff time.
        long touchFinished = touchDelay(104, configuredClickMs) + 50L;
        return Math.min(originalDelayMs, Math.max(configuredCooldownMs, touchFinished));
    }
}
