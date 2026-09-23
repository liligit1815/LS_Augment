import ls.augment.com.FanTilePolicy;

public final class TestFanTilePolicy {
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    public static void main(String[] args) {
        String ui = "com.android.systemui";
        check(FanTilePolicy.allowedCaller(10123, 10456, ui, new String[]{ui}));
        check(!FanTilePolicy.allowedCaller(110123, 10456, ui, new String[]{ui}));
        check(!FanTilePolicy.allowedCaller(10123, 10456, "cn.nubia.fan", new String[]{ui}));
        check(!FanTilePolicy.allowedCaller(10123, 10456, ui, new String[]{"other.app"}));
        check(!FanTilePolicy.allowedCaller(0, 10456, null, null));
        check(FanTilePolicy.validSelection(0));
        for (int n = 1; n <= 5; n++) check(FanTilePolicy.validSelection(n));
        check(!FanTilePolicy.validSelection(6)); check(!FanTilePolicy.validSelection(-1));
        check(!FanTilePolicy.validSelection(Integer.MAX_VALUE));
        check(FanTilePolicy.parseHardware(" 5\n", 0, 5) == 5);
        check(FanTilePolicy.parseHardware("6", 0, 5) == -1);
        check(FanTilePolicy.parseHardware("Permission denied", 0, 5) == -1);
        check(FanTilePolicy.parseHardware("2147483648", 0, 100000) == -1);
        check(FanTilePolicy.parseHardware("0", 0, 100000) == 0);
        System.out.println("Fan tile caller isolation, invalid commands and hardware failures: PASS");
    }
}
