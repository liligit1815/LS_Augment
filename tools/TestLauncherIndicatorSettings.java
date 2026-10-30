package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

/** Upgrade, persistence and independent ownership for the new workspace draw gate. */
public final class TestLauncherIndicatorSettings {
    private static int assertions;
    private static void check(boolean value, String message) {
        assertions++;
        if (!value) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        String key = LauncherOptions.PAGE_INDICATOR_EDIT_ONLY;
        EnhancementOption option = LauncherOptions.options().stream().filter(o -> key.equals(o.key)).findFirst().orElseThrow();
        check(option.kind == EnhancementOption.Kind.BOOLEAN && "0".equals(option.defaultValue), "Default off boolean");
        check(ConfigSchema.contains(key), "Registered runtime configuration");
        Map<String, String> old = new LinkedHashMap<>();
        old.put(ConfigSchema.AI_TRIGGER_ENABLED, "1");
        old.put(LauncherOptions.KEEP_EMPTY, "1");
        ConfigSnapshot upgraded = ConfigSnapshot.create(3, 12345, old);
        check(upgraded != null && "0".equals(upgraded.get(key)), "Existing users retain OEM display");
        String[] switches = {key, LauncherOptions.KEEP_EMPTY, LauncherOptions.NEW_APPS_LAST_PAGE, LauncherOptions.PAGE_REORDER};
        for (int mask = 0; mask < 16; mask++) {
            Map<String, String> values = new LinkedHashMap<>(old);
            for (int i = 0; i < switches.length; i++) values.put(switches[i], (mask & (1 << i)) == 0 ? "0" : "1");
            ConfigSnapshot saved = ConfigSnapshot.create(4, 12346, values);
            ConfigSnapshot restored = saved == null ? null : ConfigSnapshot.parse(saved.serialize());
            check(restored != null, "Snapshot round trip");
            for (String toggle : switches) check(values.get(toggle).equals(restored.get(toggle)), "Independent toggle: " + toggle);
            check("1".equals(restored.get(ConfigSchema.AI_TRIGGER_ENABLED)), "Unrelated settings retained");
        }
        int copies = 0;
        for (NativeFeatureGroups.Section section : NativeFeatureGroups.forTarget("launcher")) {
            for (NativeFeatureGroups.Feature feature : section.features) {
                if (!feature.allKeys().contains(key)) continue;
                copies++;
                check(key.equals(feature.toggleKey) && feature.allKeys().size() == 1, "One real switch");
                check(!feature.hasConfiguration(), "No empty expansion");
            }
        }
        check(copies == 1, "Single feature owner");
        System.out.println("PASS Launcher indicator settings: " + assertions + " assertions");
    }
}
