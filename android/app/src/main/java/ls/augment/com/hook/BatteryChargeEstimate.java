package ls.augment.com.hook;

/** A charge-counter delta projected from the latest trusted display level. Main thread only. */
final class BatteryChargeEstimate {
    static final long MAX_SAMPLE_AGE_MS = 60_000;
    private long full = -1;
    private long lastCounter = -1;
    private long lastSampleAt;
    private int lastLevel;
    private double hundredths = Double.NaN;
    private long anchorAt;

    boolean hasFull() { return full > 0; }

    void anchor(int precise, long now) {
        hundredths = precise;
        anchorAt = now;
        if (now - lastSampleAt > MAX_SAMPLE_AGE_MS) lastCounter = -1;
    }

    void sample(int level, long counter, long learnedFull, long now) {
        if (learnedFull >= 100_000 && learnedFull <= 1_000_000_000) full = learnedFull;
        if (!hasFull() || counter < 0) return;
        // Reject unusable counters, including a zero sentinel at a nonempty level
        // and values from a different cell or in different units.
        if ((counter == 0 && level > 1) || Math.abs(counter * 100d / full - level) > 20) {
            lastCounter = -1;
            hundredths = Double.NaN;
            return;
        }
        if (lastCounter < 0) {
            if (Double.isNaN(hundredths) || now - anchorAt > MAX_SAMPLE_AGE_MS
                    || Math.abs(hundredths - level * 100) > 150) hundredths = level * 100;
        } else {
            double delta = (counter - lastCounter) * 10_000d / full;
            // A gauge reset can look like a large transfer with no change in system SOC.
            if (Math.abs(delta - (level - lastLevel) * 100) > 200) hundredths = level * 100;
            else hundredths += delta;
        }
        // Allow both rounded and truncated system percentages. Crossing an integer
        // does not discard the fraction; only drift outside its neighborhood is corrected.
        hundredths = Math.max(Math.max(0, level * 100 - 50),
                Math.min(Math.min(10_000, level * 100 + 99), hundredths));
        lastLevel = level;
        lastCounter = counter;
        lastSampleAt = now;
    }

    int value() { return lastCounter < 0 ? -1 : (int)Math.round(hundredths); }
    long sampledAt() { return lastSampleAt; }
}
