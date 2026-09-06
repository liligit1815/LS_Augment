package ls.augment.com;

public final class TestScreenAutomationPolicy {
    public static void main(String[] args) {
        if (!ModuleRuntimeStatus.matches("version=20154|pid=3504|loaderReady=1", "20154", "3504"))
            throw new AssertionError("Current loaded version must be accepted");
        if (ModuleRuntimeStatus.matches("version=20154|pid=3504|loaderReady=1", "20154", "3338")
                || ModuleRuntimeStatus.matches("version=20153|pid=3504|loaderReady=1", "20154", "3504")
                || ModuleRuntimeStatus.matches("version=20154|pid=3504|loaderReady=0", "20154", "3504"))
            throw new AssertionError("Past process, past APK or incomplete load must not report active");
        String boot="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee";
        require(ModuleRuntimeStatus.matches("version=v|pid=5|loaderReady=1|boot="+boot,"v","5",boot),"fresh boot identity");
        require(!ModuleRuntimeStatus.matches("version=v|pid=5|loaderReady=1|boot="+boot,"v","5","ffffffff-bbbb-cccc-dddd-eeeeeeeeeeee"),"PID reuse after reboot cannot reuse an old witness");
        for (int bits = 0; bits < 16; bits++) {
            boolean permitted = ScreenAutomationPolicy.mayRun((bits & 1) != 0,
                    (bits & 2) != 0, (bits & 4) != 0, (bits & 8) != 0);
            require(permitted == (bits == 15), "all four conditions are required");
        }
        ScreenAutomationPolicy.Epoch epoch = new ScreenAutomationPolicy.Epoch();
        require(!epoch.claim(false, true), "disabled event must not claim epoch");
        require(epoch.claim(true, true), "enabling while screen is off runs once");
        require(!epoch.claim(true, true), "duplicate config/boot events do not repeat");
        epoch.failed();
        require(epoch.claim(true,true), "a failed Root operation can retry without a new screen event");
        require(!epoch.claim(true,true), "the retry is still deduplicated");
        epoch.screenOn();
        require(epoch.claim(true, true), "next off event runs again");
        require(!epoch.claim(true, false), "screen on never hides");
        require(epoch.claim(true, true), "power-state check also resets epoch");
        require("com.android.settings;org.example.app".equals(AppPackageSet.normalize(
                "org.example.app\ncom.android.settings;org.example.app")), "stable package set");
        require(AppPackageSet.normalize("org.example.app;$(id)") == null, "reject non-package syntax");
        require(AppPackageSet.normalize("com..broken") == null, "reject malformed package");
        System.out.println("PASS TestScreenAutomationPolicy");
    }
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
