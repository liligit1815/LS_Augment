package ls.augment.com;

import java.util.Map;

/** One public owner; the old native selection key is an import alias only. */
public final class DuoIslandPolicy {
    public static final String CAPABILITY = "ls_augment_duo_island_host_capability";
    public static boolean migratedEnabled(boolean duo, boolean nativeSelected) { return duo || nativeSelected; }
    public static void normalizeSelection(Map<String,String> updates, Map<String,String> next) {
        String selected = updates.get(SystemUiOptions.ISLAND);
        if (selected == null) selected = updates.get(ConfigSchema.NATIVE_ISLAND_SELECTED);
        if (selected != null) {
            updates.put(SystemUiOptions.ISLAND, selected);
            next.put(SystemUiOptions.ISLAND, selected);
        }
        updates.put(ConfigSchema.NATIVE_ISLAND_SELECTED, "0");
        next.put(ConfigSchema.NATIVE_ISLAND_SELECTED, "0");
    }
    private DuoIslandPolicy() { }
}
