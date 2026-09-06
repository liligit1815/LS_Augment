package ls.augment.com.hook;

import ls.augment.com.FanCalibrationData;

/** Pure fan-speed bounds and verified level selection for the NX809J driver. */
final class FanControlPolicy {
    static final int MIN_LEVEL = 1;
    static final int OEM_MAX_LEVEL = 4;
    static final int UNLOCKED_MAX_LEVEL = 5;

    private FanControlPolicy() { }

    static boolean isReasonableRpm(int rpm) {
        return FanCalibrationData.validRpm(rpm);
    }

    static int effectiveTargetRpm(int requestedRpm, boolean unlocked, FanCalibrationData data) {
        if (data == null) return 0;
        return clamp(requestedRpm, data.rpm(1), data.rpm(unlocked ? 5 : 4));
    }

    static int targetLevel(int requestedRpm, boolean unlocked, FanCalibrationData data) {
        return data == null ? 0 : data.closestLevel(requestedRpm, unlocked ? 5 : 4);
    }

    static boolean shouldForceUnlockedExtreme(
            boolean unlockEnabled, boolean fixedEnabled, int oemMode, boolean fanEnabled) {
        return unlockEnabled && !fixedEnabled && oemMode == 0 && fanEnabled;
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
