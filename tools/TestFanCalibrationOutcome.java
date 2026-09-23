import ls.augment.com.FanCalibrationOutcome;

public final class TestFanCalibrationOutcome {
    public static void main(String[] args) {
        String first = "1788961400000:" + "a".repeat(32);
        String retry = "1788961400000:" + "b".repeat(32);
        String off = FanCalibrationOutcome.encode(first, "oem_off");
        require(FanCalibrationOutcome.message(off, first).contains("原厂风扇已关闭"));
        require(FanCalibrationOutcome.message(off, retry).isEmpty());
        require(FanCalibrationOutcome.message(off, "").isEmpty());
        require(FanCalibrationOutcome.message(null, first).isEmpty());
        require(FanCalibrationOutcome.message(off + "|extra", first).isEmpty());
        require(FanCalibrationOutcome.encode("invalid", "oem_off").isEmpty());
        require(FanCalibrationOutcome.message(
                FanCalibrationOutcome.encode(first, "vendor_state_changed"), first).contains("保持当前原厂设置"));
        require(FanCalibrationOutcome.message(
                FanCalibrationOutcome.encode(first, "measurement_unstable"), first).contains("已保留上一次结果"));
        require(FanCalibrationOutcome.message(FanCalibrationOutcome.encode(first,"calibration_levels_unverified"),first).contains("暂不执行逐档测量"));
        require(!FanCalibrationOutcome.message(
                FanCalibrationOutcome.encode(first, "control_exception"), first).contains("检测完成"));
        System.out.println("PASS TestFanCalibrationOutcome: exact request, stale retry, malformed result, terminal outcomes");
    }

    private static void require(boolean condition) {
        if (!condition) throw new AssertionError("Fan calibration outcome contract");
    }
}
