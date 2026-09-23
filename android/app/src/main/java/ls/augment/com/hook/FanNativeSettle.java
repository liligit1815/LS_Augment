package ls.augment.com.hook;

/** Observe the OEM's asynchronous mode transition before capturing its restore point. */
final class FanNativeSettle {
    private static final long EVENT_SETTLE_MS = 3000L;
    private static final long LEVEL_STABLE_MS = 1800L;
    private long nativeEventAt = Long.MIN_VALUE;
    private long stableSince;
    private int mode = Integer.MIN_VALUE;
    private int manual = Integer.MIN_VALUE;
    private int level = -1;

    synchronized void nativeEvent(long now) {
        nativeEventAt = now;
        level = -1;
    }

    synchronized boolean ready(int observedMode, int observedManual, int observedLevel, long now) {
        if (mode != observedMode || manual != observedManual) {
            mode = observedMode;
            manual = observedManual;
            nativeEventAt = now;
            level = -1;
        }
        if (level != observedLevel) {
            level = observedLevel;
            stableSince = now;
        }
        return now - nativeEventAt >= EVENT_SETTLE_MS && now - stableSince >= LEVEL_STABLE_MS;
    }
}
