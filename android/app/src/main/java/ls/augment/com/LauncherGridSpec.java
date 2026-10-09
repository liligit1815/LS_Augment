package ls.augment.com;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Native workspace row/column request; neither reads nor rewrites launcher databases. */
public final class LauncherGridSpec {
    public static final String ENABLED = "ls_augment_rm_launcher_grid_enabled";
    public static final String ROWS = "ls_augment_rm_launcher_grid_rows";
    public static final String COLUMNS = "ls_augment_rm_launcher_grid_columns";
    public static final String ENABLED_KEY = ENABLED, ROWS_KEY = ROWS, COLUMNS_KEY = COLUMNS;
    public static final int MIN = 3, MAX = 12, DEFAULT_ROWS = 6, DEFAULT_COLUMNS = 4;
    /** Labels use columns × rows, matching the visible desktop. */
    public static final List<Preset> PRESETS = Collections.unmodifiableList(List.of(
            new Preset(6, 4), new Preset(6, 5), new Preset(7, 5), new Preset(6, 6), new Preset(8, 6)));
    public final boolean enabled;
    public final int rows, columns;

    public LauncherGridSpec(boolean enabled, int rows, int columns) {
        check(rows, "桌面行数"); check(columns, "桌面列数");
        this.enabled = enabled; this.rows = rows; this.columns = columns;
    }
    public static LauncherGridSpec defaults() { return new LauncherGridSpec(false, DEFAULT_ROWS, DEFAULT_COLUMNS); }
    public static LauncherGridSpec square(int n) { return new LauncherGridSpec(true, n, n); }
    public LauncherGridSpec withEnabled(boolean enabled) { return new LauncherGridSpec(enabled, rows, columns); }
    public LauncherGridSpec withSize(int rows, int columns) { return new LauncherGridSpec(enabled, rows, columns); }
    public int capacity() { return rows * columns; }
    public String label() { return columns + " × " + rows; }
    /** One atomic configuration batch: disabled specifications retain their selected dimensions. */
    public Map<String, String> values() {
        Map<String, String> values = new LinkedHashMap<>();
        values.put(ENABLED, enabled ? "1" : "0"); values.put(ROWS, Integer.toString(rows)); values.put(COLUMNS, Integer.toString(columns));
        return Collections.unmodifiableMap(values);
    }
    /** Missing values use defaults. Invalid input is explicit null, never clamped to an unintended grid. */
    public static LauncherGridSpec parse(String enabled, String rows, String columns) {
        try { return new LauncherGridSpec(bool(enabled), dimension(rows, DEFAULT_ROWS), dimension(columns, DEFAULT_COLUMNS)); }
        catch (IllegalArgumentException invalid) { return null; }
    }
    public static LauncherGridSpec from(Map<String, String> values) {
        return values == null ? defaults() : parse(values.get(ENABLED), values.get(ROWS), values.get(COLUMNS));
    }
    private static int dimension(String value, int fallback) {
        if (value == null || value.trim().isEmpty()) return fallback;
        String normalized = value.trim();
        if (!normalized.matches("[0-9]{1,2}")) throw new IllegalArgumentException("桌面行列格式无效");
        return Integer.parseInt(normalized);
    }
    private static boolean bool(String value) {
        if (value == null || value.trim().isEmpty()) return false;
        switch (value.trim()) {
            case "1": case "true": return true;
            case "0": case "false": return false;
            default: throw new IllegalArgumentException("桌面网格开关无效");
        }
    }
    private static void check(int value, String title) {
        if (value < MIN || value > MAX) throw new IllegalArgumentException(title + "须为 " + MIN + "～" + MAX);
    }
    public static final class Preset {
        public final int rows, columns;
        public final String label;
        private Preset(int rows, int columns) { this.rows = rows; this.columns = columns; label = columns + " × " + rows; }
        public LauncherGridSpec apply(LauncherGridSpec current) { return current.withSize(rows, columns); }
    }
}
