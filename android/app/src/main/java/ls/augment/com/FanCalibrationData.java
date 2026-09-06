package ls.augment.com;

import java.util.Arrays;

/** Feedback measurements, never an assertion about a motor's physical limit. */
public final class FanCalibrationData {
    public static final int LEVELS = 5;
    public static final long REQUEST_LIFETIME_MS = 180_000L;
    public final String firmware;
    public final long measuredAt;
    private final int[] median;
    private final int[] peak;

    private FanCalibrationData(String firmware, long measuredAt, int[] median, int[] peak) {
        this.firmware = firmware;
        this.measuredAt = measuredAt;
        this.median = median.clone();
        this.peak = peak.clone();
    }

    public static boolean validRpm(int rpm) {
        // A parser sanity bound, not a target ceiling or motor specification.
        return rpm >= 500 && rpm <= 100_000;
    }

    public static FanCalibrationData fromSamples(String firmware, long time, int[][] samples) {
        if (samples == null || samples.length != LEVELS) return null;
        int[] median = new int[LEVELS];
        int[] peak = new int[LEVELS];
        for (int level = 0; level < LEVELS; level++) {
            if (samples[level] == null || samples[level].length < 5) return null;
            int[] values = samples[level].clone();
            Arrays.sort(values);
            median[level] = values[values.length / 2];
            peak[level] = values[values.length - 1];
            if (!validRpm(values[0]) || !validRpm(peak[level])
                    || peak[level] - values[0] > median[level] * 0.30) return null;
        }
        return create(firmware, time, median, peak);
    }

    private static FanCalibrationData create(String firmware, long time, int[] median, int[] peak) {
        if (firmware == null || !firmware.matches("[0-9a-f]{64}") || time <= 0) return null;
        for (int i = 0; i < LEVELS; i++) {
            if (!validRpm(median[i]) || !validRpm(peak[i]) || peak[i] < median[i]
                    || (i > 0 && median[i] < median[i - 1])) return null;
        }
        return new FanCalibrationData(firmware, time, median, peak);
    }

    public boolean currentFor(String identity) { return firmware.equals(identity); }
    public int rpm(int level) { return level >= 1 && level <= LEVELS ? median[level - 1] : 0; }
    public int peak(int level) { return level >= 1 && level <= LEVELS ? peak[level - 1] : 0; }

    public int closestLevel(int requested, int maximumLevel) {
        int limit = Math.max(1, Math.min(LEVELS, maximumLevel));
        int result = 1;
        for (int i = 2; i <= limit; i++) {
            if (Math.abs((long) requested - rpm(i)) < Math.abs((long) requested - rpm(result))) result = i;
        }
        return result;
    }

    public String serialize() {
        StringBuilder text = new StringBuilder("FC1|").append(firmware).append('|').append(measuredAt);
        for (int i = 0; i < LEVELS; i++) text.append('|').append(median[i]).append(',').append(peak[i]);
        return text.toString();
    }

    public static FanCalibrationData parse(String text) {
        if (text == null || text.length() > 256) return null;
        try {
            String[] parts = text.split("\\|", -1);
            if (parts.length != 8 || !"FC1".equals(parts[0])) return null;
            int[] median = new int[LEVELS], peak = new int[LEVELS];
            for (int i = 0; i < LEVELS; i++) {
                String[] pair = parts[i + 3].split(",", -1);
                if (pair.length != 2) return null;
                median[i] = Integer.parseInt(pair[0]);
                peak[i] = Integer.parseInt(pair[1]);
            }
            return create(parts[1], Long.parseLong(parts[2]), median, peak);
        } catch (RuntimeException ignored) { return null; }
    }

    public static boolean validRequest(String request, long now) {
        if (request == null || !request.matches("[0-9]{13}:[0-9a-f]{32}")) return false;
        long created = Long.parseLong(request.substring(0, 13));
        return now >= created && now - created <= REQUEST_LIFETIME_MS;
    }
}
