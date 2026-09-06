package ls.augment.com.hook;

/** Pure cadence policy: honor the configured floor without slowing the OEM loop. */
final class AiTriggerTimingPolicy {
    private AiTriggerTimingPolicy() { }

    static long scanDelay(long originalDelayMs, long configuredDelayMs, long minimumDelayMs) {
        if (originalDelayMs <= 0L) return originalDelayMs;
        long configured = Math.max(minimumDelayMs, configuredDelayMs);
        return Math.min(originalDelayMs, configured);
    }
}
