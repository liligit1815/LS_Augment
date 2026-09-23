package ls.augment.com;

import java.time.LocalDate;
import java.time.ZoneId;

public final class TestStepDailyLimit {
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static void rejects(Runnable operation, String message) {
        try { operation.run(); }
        catch (IllegalArgumentException expected) { return; }
        throw new AssertionError(message);
    }

    public static void main(String[] args) {
        outputs();sourcesAndBuckets();caps();dayBoundaries();invalidInputs();
        System.out.println("PASS TestStepDailyLimit");
    }

    private static void outputs() {
        check(StepDailyLimit.naturalOutput(150, 100, 300) == 350,
                "natural increments preserve old bonus");
        check(StepDailyLimit.requestedOutput(150, 100, 300, 200) == 400,
                "new multiplier affects only the 50 new raw steps");
        check(StepDailyLimit.requestedOutput(150, 100, 300, 100) == 350,
                "turning multiplication off preserves old bonus and natural increments");
        check(StepDailyLimit.requestedOutput(100, 100, 300, 1000) == 300,
                "multiplier changes do not reapply to previously seen raw steps");
        check(StepDailyLimit.requestedOutput(150, 0, 0, 300) == 450,
                "new record uses current multiplier");
        check(StepDailyLimit.requestedOutput(90, 100, 300, 1000) == 290,
                "raw correction does not produce new multiplied bonus");
        check(StepDailyLimit.naturalOutput(10, 50, 20) == 10,
                "invalid historical negative bonus cannot remove natural steps");
        check(StepDailyLimit.naturalOutput(Integer.MAX_VALUE, 0, Integer.MAX_VALUE)
                == Integer.MAX_VALUE, "natural output saturates");
        check(StepDailyLimit.requestedOutput(Integer.MAX_VALUE, 0, 0, 2000)
                == Integer.MAX_VALUE, "requested output saturates");
        check(StepDailyLimit.requestedOutput(Integer.MAX_VALUE, Integer.MAX_VALUE - 1,
                Integer.MAX_VALUE, 2000) == Integer.MAX_VALUE, "bonus addition saturates");
    }

    private static void sourcesAndBuckets() {
        StepDailyLimit.Day day = new StepDailyLimit.Day(100, 1100, 100, 10000);
        check(day.get("phone", 100) == 0 && day.total() == 0, "empty day defaults");
        day.put("phone", 100, 120);day.put("phone", 110, 80);day.put("watch", 120, 300);
        check(day.total() == 300, "source rows sum inside bucket, then merge by maximum");
        day.put("phone", 100, 250);
        check(day.total() == 330 && day.get("phone", 100) == 250, "same sid and time replace");
        day.put("phone", 100, 0);
        check(day.total() == 300, "replacement can restore another leading source");
        day.put("phone", 200, 100);day.put("watch", 200, 60);
        check(day.total() == 400, "bucket maxima sum across the day");
        day.put("phone", 200, 100);
        check(day.total() == 400, "repeated record does not double count");
        day.put("phone", 1000, Integer.MAX_VALUE);
        day.put("watch", 900, Integer.MAX_VALUE);
        check(day.total() == 400L + 2L * Integer.MAX_VALUE, "daily totals retain long range");
        day.put("phone", 1001, Integer.MAX_VALUE);
        check(day.total() == 400L + 3L * Integer.MAX_VALUE, "single-source sums retain long range");
    }

    private static void caps() {
        StepDailyLimit.Day exact = new StepDailyLimit.Day(0, 1000, 100, 1000);
        exact.put("watch", 0, 1000);
        check(exact.cap("phone", 1, 10, 500) == 10 && exact.total() == 1000,
                "at upper limit disallows even invisible source-gap additions");
        exact.put("watch", 0, 1100);
        check(exact.cap("phone", 1, 15, 1000) == 15 && exact.total() == 1100,
                "over upper limit keeps natural steps and adds no bonus");

        StepDailyLimit.Day partial = new StepDailyLimit.Day(0, 1000, 100, 1000);
        partial.put("watch", 0, 900);partial.put("phone", 1, 100);
        check(partial.cap("phone", 1, 100, 1200) == 1000 && partial.total() == 1000,
                "remaining allowance includes the nonleading source gap");
        check(partial.cap("phone", 1, 1050, 1250) == 1050 && partial.total() == 1050,
                "natural walking that crosses the cap still records normally");

        StepDailyLimit.Day batch = new StepDailyLimit.Day(0, 1000, 100, 1000);
        batch.put("phone", 0, 400);batch.put("phone", 100, 400);batch.put("phone", 200, 150);
        check(batch.cap("phone", 0, 400, 800) == 450 && batch.total() == 1000,
                "first batch row sees all natural floors");
        check(batch.cap("phone", 100, 400, 800) == 400
                && batch.cap("phone", 200, 150, 300) == 150 && batch.total() == 1000,
                "later batch rows do not reuse the same allowance");
        StepDailyLimit.Day naturalBatch = new StepDailyLimit.Day(0, 1000, 100, 1000);
        naturalBatch.put("phone", 0, 600);naturalBatch.put("phone", 100, 600);
        check(naturalBatch.cap("phone", 0, 600, 1200) == 600
                && naturalBatch.cap("phone", 100, 600, 1200) == 600
                && naturalBatch.total() == 1200, "all natural batch floors survive a exceeded cap");

        StepDailyLimit.Day uncertain = new StepDailyLimit.Day(0, 1000, 100, 1000);
        uncertain.setComplete(false);
        check(uncertain.cap("phone", 0, 100, 300) == 100 && uncertain.total() == 100,
                "incomplete native details reject extra steps");
        uncertain.setComplete(true);
        check(uncertain.cap("phone", 0, 100, 300) == 300, "complete details allow later additions");
        check(uncertain.cap("phone", 0, 300, 200) == 300, "desired cannot decrease the floor");

        StepDailyLimit.Day raised = new StepDailyLimit.Day(0, 1000, 100, 2000);
        raised.put("phone", 0, 1000);
        check(raised.cap("phone", 0, 1000, 1400) == 1400, "new higher limit resumes allowance");
        StepDailyLimit.Day lowered = new StepDailyLimit.Day(0, 1000, 100, 500);
        check(lowered.cap("phone", 0, 1400, 1800) == 1400, "lowering limit retains existing steps");
        StepDailyLimit.Day tomorrow = new StepDailyLimit.Day(1000, 2000, 100, 500);
        check(tomorrow.cap("phone", 1000, 0, 800) == 500, "next day starts with fresh allowance");
        StepDailyLimit.Day overflow = new StepDailyLimit.Day(0, 1000, 100, 1000000);
        check(overflow.cap("phone", 0, 0, Integer.MAX_VALUE) == 1000000, "large desired is capped");
        check(overflow.cap("phone", 0, Integer.MAX_VALUE, Integer.MAX_VALUE) == Integer.MAX_VALUE,
                "large natural floor does not overflow or shrink");
    }

    private static void dayBoundaries() {
        ZoneId zone = ZoneId.of("America/New_York");
        for (LocalDate date : new LocalDate[]{LocalDate.of(2026, 3, 8), LocalDate.of(2026, 11, 1)}) {
            long start = date.atStartOfDay(zone).toEpochSecond();
            long end = date.plusDays(1).atStartOfDay(zone).toEpochSecond();
            check(end - start != 86400, "fixture spans a daylight-saving transition");
            StepDailyLimit.Day day = new StepDailyLimit.Day(start, end, 600, 1000);
            day.put("phone", start, 100);day.put("phone", end - 1, 200);
            check(day.total() == 300, "actual 23/25-hour date retains both endpoints");
            rejects(() -> day.put("phone", start - 1, 1), "previous day rejected");
            rejects(() -> day.put("phone", end, 1), "exclusive next-day endpoint rejected");
        }
        StepDailyLimit.Day negative = new StepDailyLimit.Day(-200, 100, 100, 1000);
        negative.put("phone", -200, 100);negative.put("watch", -101, 200);
        negative.put("phone", -100, 50);
        check(negative.total() == 250, "bucket anchoring supports negative epoch times");
        StepDailyLimit.Day large = new StepDailyLimit.Day(Long.MAX_VALUE - 100, Long.MAX_VALUE, 60, 1000);
        large.put("phone", Long.MAX_VALUE - 1, 200);
        check(large.total() == 200, "large epoch values do not overflow bucket keys");
    }

    private static void invalidInputs() {
        rejects(() -> new StepDailyLimit.Day(0, 0, 60, 1000), "empty day rejected");
        rejects(() -> new StepDailyLimit.Day(1, 0, 60, 1000), "reversed day rejected");
        rejects(() -> new StepDailyLimit.Day(Long.MIN_VALUE, Long.MAX_VALUE, 60, 1000), "overflow span rejected");
        rejects(() -> new StepDailyLimit.Day(0, 1000, 0, 1000), "zero gap rejected");
        rejects(() -> new StepDailyLimit.Day(0, 1000, -1, 1000), "negative gap rejected");
        rejects(() -> new StepDailyLimit.Day(0, 1000, 60, 0), "zero limit rejected");
        rejects(() -> new StepDailyLimit.Day(0, 1000, 60, 1000001), "excess limit rejected");
        rejects(() -> StepDailyLimit.naturalOutput(-1, 0, 0), "negative raw rejected");
        rejects(() -> StepDailyLimit.naturalOutput(0, -1, 0), "negative old raw rejected");
        rejects(() -> StepDailyLimit.naturalOutput(0, 0, -1), "negative old output rejected");
        rejects(() -> StepDailyLimit.requestedOutput(0, 0, 0, 99), "multiplier below one rejected");
        rejects(() -> StepDailyLimit.requestedOutput(0, 0, 0, 2001), "excess multiplier rejected");
        StepDailyLimit.Day day = new StepDailyLimit.Day(0, 1000, 60, 1);
        rejects(() -> day.put("phone", 0, -1), "negative record rejected");
        rejects(() -> day.put(null, 0, 1), "null source rejected");
        rejects(() -> day.cap("phone", 0, -1, 10), "negative floor rejected");
        rejects(() -> day.cap("phone", 0, 0, -1), "negative desired rejected");
        check(day.total() == 0, "invalid operations do not mutate totals");
        check(day.cap("phone", 0, 0, 10) == 1, "minimum configured limit is supported");
    }
}
