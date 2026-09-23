package ls.augment.com;

import java.util.HashMap;
import java.util.Map;

/** Caps only additional steps while retaining natural steps and previously saved additions. */
public final class StepDailyLimit {
    private StepDailyLimit() { }

    public static int naturalOutput(int raw, int oldRaw, int oldOutput) {
        requireSteps(raw);requireSteps(oldRaw);requireSteps(oldOutput);
        return saturated((long)raw + Math.max(0L, (long)oldOutput - oldRaw));
    }

    public static int requestedOutput(int raw, int oldRaw, int oldOutput, int percent) {
        int natural = naturalOutput(raw, oldRaw, oldOutput);
        int addedRaw = Math.max(0, raw - oldRaw);
        return saturated((long)natural + StepMath.multiply(addedRaw, percent) - addedRaw);
    }

    private static int saturated(long value) {
        return (int)Math.min(Integer.MAX_VALUE, value);
    }

    private static void requireSteps(int value) {
        if (value < 0) throw new IllegalArgumentException("negative steps");
    }

    /** A local day's source records; intervals are anchored to start, and end is exclusive. */
    public static final class Day {
        private final long start, end, gap;
        private final int limit;
        private final Map<String, Map<Long, Integer>> records = new HashMap<>();
        private final Map<Long, Bucket> buckets = new HashMap<>();
        private long total;
        private boolean complete = true;

        private static final class Bucket {
            final Map<String, Long> sources = new HashMap<>();
            long maximum;
        }

        public Day(long start, long end, long gap, int limit) {
            if (end <= start || gap <= 0 || limit < 1 || limit > 1000000)
                throw new IllegalArgumentException("day or limit range");
            try { Math.subtractExact(end, start); }
            catch (ArithmeticException e) { throw new IllegalArgumentException("day span overflow", e); }
            this.start = start;this.end = end;this.gap = gap;this.limit = limit;
        }

        public void put(String sid, long time, int value) {
            requireRecord(sid, time);requireSteps(value);
            Map<Long, Integer> sourceRecords = records.computeIfAbsent(sid, key -> new HashMap<>());
            int previous = sourceRecords.getOrDefault(time, 0);
            Bucket bucket = buckets.computeIfAbsent((time - start) / gap, key -> new Bucket());
            long source = Math.addExact(bucket.sources.getOrDefault(sid, 0L), (long)value - previous);
            long maximum = source;
            for (Map.Entry<String, Long> entry : bucket.sources.entrySet())
                if (!sid.equals(entry.getKey())) maximum = Math.max(maximum, entry.getValue());
            long updatedTotal = Math.addExact(total - bucket.maximum, maximum);
            sourceRecords.put(time, value);
            bucket.sources.put(sid, source);
            bucket.maximum = maximum;
            total = updatedTotal;
        }

        public int get(String sid, long time) {
            requireRecord(sid, time);
            Map<Long, Integer> sourceRecords = records.get(sid);
            return sourceRecords == null ? 0 : sourceRecords.getOrDefault(time, 0);
        }

        public long total() { return total; }

        public void setComplete(boolean complete) { this.complete = complete; }

        public int cap(String sid, long time, int floor, int desired) {
            requireSteps(floor);requireSteps(desired);
            put(sid, time, floor);
            if (!complete || total >= limit || desired <= floor) return floor;
            Bucket bucket = buckets.get((time - start) / gap);
            long sourceGap = bucket.maximum - bucket.sources.get(sid);
            long remaining = limit - total;
            int result = (int)Math.min(desired, Math.min(Integer.MAX_VALUE,
                    (long)floor + sourceGap + remaining));
            put(sid, time, result);
            return result;
        }

        private void requireRecord(String sid, long time) {
            if (sid == null || time < start || time >= end)
                throw new IllegalArgumentException("source or day time range");
        }
    }
}
