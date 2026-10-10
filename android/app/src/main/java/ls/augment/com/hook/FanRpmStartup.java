package ls.augment.com.hook;

/** Observe OEM motor startup without granting a module write from an invalid RPM. */
final class FanRpmStartup {
    enum Action { WAIT, READY, FAIL }
    static final long STARTUP_TIMEOUT_MS = 6000L;
    private static final int REQUIRED_VALID_SAMPLES = 2;
    private long startedAt = -1L;
    private int validSamples;

    Action observe(boolean controlling, boolean valid, long now) {
        if (startedAt < 0L) startedAt = now;
        if (!valid) {
            validSamples = 0;
            // A missing signal while controlling is a safety failure. Only an
            // OEM-owned startup can wait, and that window cannot be renewed by
            // each invalid poll or an intervening single valid sample.
            return controlling || now - startedAt >= STARTUP_TIMEOUT_MS
                    ? Action.FAIL : Action.WAIT;
        }
        validSamples = Math.min(REQUIRED_VALID_SAMPLES, validSamples + 1);
        if (validSamples == REQUIRED_VALID_SAMPLES) return Action.READY;
        return !controlling && now - startedAt >= STARTUP_TIMEOUT_MS
                ? Action.FAIL : Action.WAIT;
    }

    int validSamples() { return validSamples; }

    void reset() {
        startedAt = -1L;
        validSamples = 0;
    }
}
