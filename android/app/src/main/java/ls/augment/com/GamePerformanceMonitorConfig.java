package ls.augment.com;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;

/** The original game-space monitor items, shared by settings and the phone runtime. */
public final class GamePerformanceMonitorConfig {
    public static final String DEFAULT_ITEMS = "time,fps,network,battery,duration";
    private static final String[] ITEMS = {"time", "fps", "network", "battery", "duration"};
    private static final String[] LABELS = {"时间", "FPS", "网速", "电量", "游戏时长"};

    public static String[] items() { return ITEMS.clone(); }
    public static String[] labels() { return LABELS.clone(); }

    /** Reject empty/unknown selections and keep the original order for stable backups. */
    public static String normalizeItems(String value) {
        if (value == null || value.trim().isEmpty()) return null;
        Set<String> selected = new LinkedHashSet<>();
        for (String raw : value.split(",", -1)) {
            String item = raw.trim();
            if (!Arrays.asList(ITEMS).contains(item)) return null;
            selected.add(item);
        }
        Set<String> ordered = new LinkedHashSet<>();
        for (String item : ITEMS) if (selected.contains(item)) ordered.add(item);
        return ordered.isEmpty() ? null : String.join(",", ordered);
    }

    public static boolean selected(String value, String item) {
        String normalized = normalizeItems(value);
        return normalized != null && Arrays.asList(normalized.split(",")).contains(item);
    }

    private GamePerformanceMonitorConfig() { }
}
