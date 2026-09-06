package ls.augment.com;

import java.util.List;

public final class TestRapidFireInputDetector {
    public static void main(String[] args) {
        String inventory = "I: Bus=0000 Vendor=0000 Product=0000 Version=0000\n"
                + "N: Name=\"nubia_tgk_aw_sar0_ch0\"\n"
                + "H: Handlers=event4 cpufreq\n\n"
                + "I: Bus=0000 Vendor=0000 Product=0000 Version=0000\n"
                + "N: Name=\"nubia_tgk_aw_sar1_ch0\"\n"
                + "H: Handlers=event5 cpufreq\n\n"
                + "I: Bus=0000 Vendor=0000 Product=0001 Version=0001\n"
                + "N: Name=\"synaptics_tcm_touch\"\n"
                + "H: Handlers=event9 cpufreq kgsl\n";
        List<RapidFireInputDetector.Device> devices = RapidFireInputDetector.discover(inventory);
        check(devices.size() == 2, "only two TGK devices must be discovered");
        check("/dev/input/event4".equals(devices.get(0).path), "left candidate path");
        check("/dev/input/event5".equals(devices.get(1).path), "right candidate path");

        String touchThenShoulder = "[ 1.000000] /dev/input/event9: 0001 014a 00000001\n"
                + "[ 1.010000] /dev/input/event9: 0001 014a 00000000\n"
                + "[ 2.000000] /dev/input/event4: 0001 0041 00000001\n"
                + "[ 2.040000] /dev/input/event4: 0001 0041 00000000\n";
        RapidFireInputDetector.Capture left = RapidFireInputDetector.parseCapture(
                touchThenShoulder, devices);
        check(left != null && left.code == 65, "touch code 330 must be ignored");
        check("nubia_tgk_aw_sar0_ch0".equals(left.name), "captured device identity");

        String incomplete = "[ 3.000000] /dev/input/event5: 0001 0042 00000001\n";
        check(RapidFireInputDetector.parseCapture(incomplete, devices) == null,
                "a down event without release must fail closed");
        check(RapidFireInputDetector.parseCapture(touchThenShoulder + incomplete
                + "[ 3.050000] /dev/input/event5: 0001 0042 00000000\n", devices) == null,
                "pressing both sides in one capture is ambiguous");
        check(RapidFireInputDetector.parseCapture(
                "[ 3.000000] /dev/input/event4: 0001 0041 00000001\n"
                + "[ 3.050000] /dev/input/event5: 0001 0041 00000000\n", devices) == null,
                "a release on another device cannot complete a press");
        check(!RapidFireInputDetector.isLikelyShoulderName("proximity_sar_sensor"),
                "generic SAR sensors must not be accepted");
        System.out.println("RapidFireInputDetector tests passed");
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
