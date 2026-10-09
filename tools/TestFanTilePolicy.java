import ls.augment.com.FanTilePolicy;
import ls.augment.com.ConfigSchema;
import java.util.Map;

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
        check(FanTilePolicy.supportedDevice("NX809J", "", ""));
        check(FanTilePolicy.supportedDevice(null, "nx809j", null));
        check(!FanTilePolicy.supportedDevice("NX769J", "NX769J", "NX769J"));
        check(!FanTilePolicy.supportedDevice(null, null, null));
        check("0".equals(ConfigSchema.defaultValue(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED)));
        check(ConfigSchema.isRuntimeKey(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED));
        check("1".equals(ConfigSchema.defaultValue(ConfigSchema.FAN_FIXED_LEVEL)));
        check("1".equals(ConfigSchema.normalize(ConfigSchema.FAN_FIXED_LEVEL, "0")));
        check(ConfigSchema.normalize(ConfigSchema.FAN_FIXED_LEVEL, "6") == null);
        check(ConfigSchema.normalize(ConfigSchema.FAN_FIXED_LEVEL, "-1") == null);
        check(!ConfigSchema.isRuntimeKey(ConfigSchema.FAN_TARGET_RPM));
        check(!ConfigSchema.isRuntimeKey(ConfigSchema.FAN_UNLOCK_MAX));
        check("0".equals(ConfigSchema.normalize(ConfigSchema.FAN_TARGET_RPM, "24000")));
        check("0".equals(ConfigSchema.normalize(ConfigSchema.FAN_UNLOCK_MAX, "1")));
        for (int level = 1; level <= 5; level++) {
            Map<String, String> updates = FanTilePolicy.selectionUpdates(level);
            check(updates.size() == 4);
            check(String.valueOf(level).equals(updates.get(ConfigSchema.FAN_FIXED_LEVEL)));
            check("1".equals(updates.get(ConfigSchema.FAN_FIXED_ENABLED)));
            check("1".equals(updates.get(ConfigSchema.GAME_MASTER)));
            check(ConfigSchema.normalize(ConfigSchema.FAN_TILE_REQUEST, updates.get(ConfigSchema.FAN_TILE_REQUEST)) != null);
            check(!updates.containsKey(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED));
            check(!updates.containsKey(ConfigSchema.SYSTEMUI_MASTER));
        }
        Map<String, String> release = FanTilePolicy.selectionUpdates(0);
        check(release.size() == 2 && "0".equals(release.get(ConfigSchema.FAN_FIXED_ENABLED)));
        check(!release.containsKey(ConfigSchema.FAN_FIXED_LEVEL));
        check(!release.containsKey(ConfigSchema.GAME_MASTER));
        for (int invalid : new int[]{-1, 6, Integer.MAX_VALUE}) {
            try { FanTilePolicy.selectionUpdates(invalid); throw new AssertionError("invalid level accepted"); }
            catch (IllegalArgumentException expected) { }
        }
        check(FanTilePolicy.parseHardware(" 5\n", 0, 5) == 5);
        check(FanTilePolicy.parseHardware("6", 0, 5) == -1);
        check(FanTilePolicy.parseHardware("Permission denied", 0, 5) == -1);
        check(FanTilePolicy.parseHardware("2147483648", 0, 100000) == -1);
        check(FanTilePolicy.parseHardware("0", 0, 100000) == 0);
        System.out.println("Fan tile independent defaults, device/caller isolation, selection boundaries and hardware failures: PASS");
    }
}
