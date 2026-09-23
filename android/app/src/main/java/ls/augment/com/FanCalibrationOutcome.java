package ls.augment.com;

/** A terminal measurement result belongs to one request, never a later retry. */
public final class FanCalibrationOutcome {
    public static final String DIAGNOSTIC = "ls_augment_fan_calibration_outcome";

    private FanCalibrationOutcome() { }

    public static String encode(String request, String reason) {
        if (request == null || !request.matches("[0-9]{13}:[0-9a-f]{32}")
                || reason == null || !reason.matches("[a-z_]{1,64}")) return "";
        return request + "|" + reason;
    }

    public static String message(String encoded, String request) {
        if (encoded == null || request == null || request.isEmpty()) return "";
        String[] parts = encoded.split("\\|", -1);
        if (parts.length != 2 || !request.equals(parts[0])
                || !encoded.equals(encode(parts[0], parts[1]))) return "";
        switch (parts[1]) {
            case "calibration_levels_unverified":
                return "此机型尚未验证定速档位，暂不执行逐档测量。可使用已适配的原厂全速功能。";
            case "oem_off":
                return "检测已停止：原厂风扇已关闭。已保留上一次测量结果。";
            case "vendor_state_changed":
            case "vendor_owner_changed":
                return "检测已停止：原厂风扇设置已变化。保持当前原厂设置，测量结果未更新。";
            case "calibration_cancelled":
                return "检测已取消，测量结果未更新。";
            case "thermal_unsafe":
                return "检测已停止：温度保护生效。请待手机降温后重试，测量结果未更新。";
            case "measurement_unstable":
                return "检测未完成：本次转速反馈不稳定。请重新测量，已保留上一次结果。";
            default:
                return "检测已停止，本次结果未保存。请重新测量；若仍失败，请导出运行日志。";
        }
    }
}
