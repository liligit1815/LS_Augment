package ls.augment.com;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/** Persistence contract for the existing island key, including upgrade/import values. */
public final class TestIslandStyles {
    private static int checks;
    public static void main(String[] args) {
        EnhancementOption option = SystemUiOptions.options().stream()
                .filter(value -> value.key.equals(SystemUiOptions.ISLAND_TRANSPARENT)).findFirst().orElseThrow();
        check(option.kind == EnhancementOption.Kind.CHOICE, "Shared choice type");
        check(Arrays.equals(option.choices, new String[]{"经典黑色", "透明", "液态玻璃"}), "Three background choices");
        check("0".equals(option.defaultValue), "Classic default unchanged");
        for (String value : new String[]{"0", "1", "2"}) {
            check(value.equals(option.normalize(value)), "Persisted style accepted: " + value);
            check(value.equals(ConfigSchema.normalize(option.key, value)), "Runtime schema agrees: " + value);
            Map<String,String> saved = new LinkedHashMap<>(ConfigSchema.runtimeDefaults());
            saved.put(option.key, value); saved.put(SystemUiOptions.ISLAND, "1");
            ConfigSnapshot snapshot = ConfigSnapshot.create(4, 12346, saved);
            ConfigSnapshot restored = snapshot == null ? null : ConfigSnapshot.parse(snapshot.serialize());
            check(restored != null && value.equals(restored.get(option.key)), "Signed snapshot round-trip: " + value);
            check("1".equals(restored.get(SystemUiOptions.ISLAND)), "Style preserves the enabled master");
        }
        for (String value : new String[]{"-1", "3", "glass", ""})
            check(option.normalize(value) == null, "Invalid style rejected: " + value);
        check("0".equals(ConfigSchema.runtimeDefaults().get(option.key)), "Default reaches SystemUI");
        check(SystemUiOptions.ISLAND_BACKGROUND_CLASSIC == 0 && SystemUiOptions.ISLAND_BACKGROUND_TRANSPARENT == 1
                && SystemUiOptions.ISLAND_BACKGROUND_GLASS == 2, "UI/runtime style mapping");
        boolean owned = false;
        for (NativeFeatureGroups.Section section : NativeFeatureGroups.SECTIONS)
            for (NativeFeatureGroups.Feature feature : section.features)
                if (feature.allKeys().contains(option.key)) {
                    check(SystemUiOptions.ISLAND.equals(feature.toggleKey), "Style remains owned by the island master");
                    check(!owned, "Style appears once"); owned = true;
                }
        check(owned, "Style is reachable");
        System.out.println("Island background contracts passed: " + checks);
    }
    private static void check(boolean value, String message) { checks++; if (!value) throw new AssertionError(message); }
}
