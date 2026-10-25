import java.util.HashSet;
import java.util.Set;
import ls.augment.com.IosBatteryPolicy;

public final class TestIosBatteryPolicy {
    private static int checks;
    private static void check(boolean value, String why) { checks++; if (!value) throw new AssertionError(why); }
    public static void main(String[] args) {
        Set<String> assets = new HashSet<>();
        for (boolean digits : new boolean[]{false, true}) for (boolean dark : new boolean[]{false, true}) {
            for (boolean charging : new boolean[]{false, true}) for (boolean save : new boolean[]{false, true})
                for (boolean performance : new boolean[]{false, true}) assets.add(IosBatteryPolicy.asset(digits, charging, save, performance, dark));
        }
        check(assets.size() == 20, "all twenty supplied scenes reachable");
        check(IosBatteryPolicy.asset(true, true, true, true, true).equals("stat_sys_battery_power_save_digit_charge_darkmode.png"), "saving charge has its own scene");
        check(IosBatteryPolicy.asset(false, true, false, true, false).equals("stat_sys_battery_charge.png"), "charging supersedes performance");
        for (int count : new int[]{10, 100}) {
            check(IosBatteryPolicy.frame(-1, count) == 0 && IosBatteryPolicy.frame(0, count) == 0, "unknown/zero safe lower bound");
            check(IosBatteryPolicy.frame(100, count) == count - 1 && IosBatteryPolicy.frame(101, count) == count - 1, "full safe upper bound");
            for (int level = 1; level <= 100; level++) check(IosBatteryPolicy.frame(level, count) == (level - 1) / (100 / count), "level indexing " + count + "/" + level);
        }
        check(IosBatteryPolicy.frame(73, 100) == 72 && IosBatteryPolicy.frame(73, 10) == 7, "73% scene frames");
        check(IosBatteryPolicy.containsDigits(0, 1) && IosBatteryPolicy.containsDigits(1, 0), "native inside number and explicit override");
        for (int style = 2; style <= 6; style++) check(!IosBatteryPolicy.containsDigits(style, 1), "outside/hidden mode never embeds a second number");
        check(!IosBatteryPolicy.performance(0) && !IosBatteryPolicy.performance(1) && !IosBatteryPolicy.performance(2), "default/low/balanced not high performance");
        check(IosBatteryPolicy.performance(3) && IosBatteryPolicy.performance(4), "services high/chicken modes");
        check(!IosBatteryPolicy.performance(300) && !IosBatteryPolicy.performance(5), "do not confuse per-app tier with live global state");
        check(IosBatteryPolicy.powerSave(1, false) && IosBatteryPolicy.powerSave(0, true) && !IosBatteryPolicy.powerSave(2, false), "system and active game saving modes");
        System.out.println("iOS battery policy: " + checks + " checks passed");
    }
}
