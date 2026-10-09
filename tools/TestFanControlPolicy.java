package ls.augment.com.hook;

import ls.augment.com.FanCalibrationData;

public final class TestFanControlPolicy {
    public static void main(String[] args) {
        String identity = "a".repeat(64);
        int[][] samples = {{4100, 4200, 4200, 4300, 4300}, {8000, 8100, 8100, 8200, 8200},
                {13000, 13100, 13200, 13300, 13300}, {16500, 16600, 16700, 16800, 16900},
                {23800, 23900, 24000, 24100, 24200}};
        FanCalibrationData data = FanCalibrationData.fromSamples(identity, 1_788_592_000_000L, samples);
        truth("stable sample accepted", data != null);
        equal("actual feedback above former ceiling", 24200, data.peak(5));
        equal("sample median", 24000, data.rpm(5));
        equal("roundtrip", 24000, FanCalibrationData.parse(data.serialize()).rpm(5));
        falsity("new firmware invalidates data", data.currentFor("b".repeat(64)));
        samples[4][0] = 500;
        truth("unstable measurement rejected", FanCalibrationData.fromSamples(identity, 1, samples) == null);
        truth("truncated data rejected", FanCalibrationData.parse("FC1|" + identity) == null);
        String request = "1788592000000:" + "b".repeat(32);
        truth("new request", FanCalibrationData.validRequest(request, 1_788_592_000_000L));
        falsity("expired request", FanCalibrationData.validRequest(request, 1_788_592_180_001L));
        falsity("future request rejected", FanCalibrationData.validRequest(request, 1_788_591_999_999L));
        truth("reasonable RPM", FanControlPolicy.isReasonableRpm(12_000));
        falsity("stopped RPM is not takeover evidence", FanControlPolicy.isReasonableRpm(0));
        truth("no former RPM software ceiling", FanControlPolicy.isReasonableRpm(30_000));
        System.out.println("PASS TestFanControlPolicy");
    }

    private static void equal(String name, int expected, int actual) {
        if (expected != actual) {
            throw new AssertionError(name + ": expected=" + expected + " actual=" + actual);
        }
    }

    private static void truth(String name, boolean value) {
        if (!value) throw new AssertionError(name);
    }

    private static void falsity(String name, boolean value) {
        if (value) throw new AssertionError(name);
    }
}
