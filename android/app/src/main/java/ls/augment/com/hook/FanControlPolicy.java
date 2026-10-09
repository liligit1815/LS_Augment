package ls.augment.com.hook;

import ls.augment.com.FanCalibrationData;

/** Verified driver bounds; RPM is telemetry and never a speed selection. */
final class FanControlPolicy {
    static final int MIN_LEVEL = 1;
    static final int MAX_LEVEL = 5;

    private FanControlPolicy() { }

    static boolean isReasonableRpm(int rpm) {
        return FanCalibrationData.validRpm(rpm);
    }
}
