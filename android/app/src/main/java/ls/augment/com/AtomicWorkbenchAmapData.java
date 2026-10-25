package ls.augment.com;

import android.os.Bundle;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/** In-memory notification contract. Route text is never written to module storage or diagnostics. */
public final class AtomicWorkbenchAmapData {
    public static final String PACKAGE = "com.autonavi.minimap";
    public static final String AUTHORITY = "ls.augment.com.workbench";
    public static final String REGISTER = "amap_navigation_register", PUBLISH = "amap_navigation_publish";
    public static final String PREFIX = "ls.augment.atomic.amap.";
    public static final String VERSION = PREFIX + "version", STATUS = PREFIX + "status";
    public static final String TITLE = PREFIX + "title", CONTENT = PREFIX + "content", UPDATED = PREFIX + "elapsed";
    public static final String SOURCE = PREFIX + "source";
    public static final String METRICS = "metrics";
    private static final Set<String> METRIC_KEYS = new HashSet<>(Arrays.asList("eventType", "curManeuverID",
            "segmentRemainDist", "speed", "routeRemainTime", "routeRemainDist", "curRouteName", "nextRouteName"));
    public static final int CONTRACT = 1;
    public static final long MAX_AGE_MS = 6000L;
    public static final long CONSUMER_MAX_AGE_MS = 3000L;

    private AtomicWorkbenchAmapData() { }

    /** Canonical units: distances in metres, route time in seconds, speed in km/h. */
    public static Bundle structured(Bundle raw) {
        if (raw == null) return null;
        try {
            if (!METRIC_KEYS.containsAll(raw.keySet())) return null;
            Bundle result = new Bundle();
            for (String key : new String[]{"eventType", "curManeuverID"}) {
                double value = number(raw.get(key));
                if (value >= 0d && value <= 65535d && value == Math.rint(value)) result.putInt(key, (int) value);
            }
            for (String key : new String[]{"segmentRemainDist", "speed", "routeRemainTime", "routeRemainDist"}) {
                double value = number(raw.get(key));
                if (value >= 0d && value <= Integer.MAX_VALUE) result.putDouble(key, value);
            }
            for (String key : new String[]{"curRouteName", "nextRouteName"}) {
                Object value = raw.get(key);
                String cleaned = value instanceof String ? text((String) value) : "";
                if (!cleaned.isEmpty()) result.putString(key, cleaned);
            }
            boolean useful = result.containsKey("segmentRemainDist") || result.containsKey("speed")
                    || result.containsKey("routeRemainTime") || result.containsKey("routeRemainDist")
                    || result.containsKey("curRouteName") || result.containsKey("nextRouteName")
                    || result.getInt("curManeuverID", 0) > 0;
            return useful ? result : null;
        } catch (RuntimeException malformed) { return null; }
    }

    public static boolean hasStructuredGuidance(Bundle raw) { return structured(raw) != null; }

    private static double number(Object raw) {
        if (!(raw instanceof Number)) return -1d;
        double value = ((Number) raw).doubleValue();
        return Double.isFinite(value) ? value : -1d;
    }

    public static boolean fresh(long now, long updated) {
        return fresh(now, updated, false);
    }

    public static boolean fresh(long now, long updated, boolean spoken) {
        return updated > 0L && now >= updated && now - updated <= (spoken ? 45000L : MAX_AGE_MS);
    }

    public static String text(String source) {
        if (source == null) return "";
        StringBuilder result = new StringBuilder(Math.min(160, source.length()));
        for (int i = 0; i < source.length() && i < 160; i++) {
            char c = source.charAt(i);
            result.append(Character.isISOControl(c) || c >= '\u202a' && c <= '\u202e'
                    || c >= '\u2066' && c <= '\u2069' ? ' ' : c);
        }
        if (result.length() > 0 && Character.isHighSurrogate(result.charAt(result.length() - 1)))
            result.setLength(result.length() - 1);
        return result.toString().trim();
    }

    /** A real navigation page still must supply substantive guidance, rather than its generic status. */
    public static boolean guidance(String raw) {
        String value = text(raw).toLowerCase(java.util.Locale.ROOT);
        if (value.isEmpty() || value.contains("未获取") || value.contains("获取失败") || value.contains("加载中")
                || value.contains("正在规划") || value.contains("正在定位") || value.contains("导航已结束")
                || value.contains("已到达目的地") || value.contains("导航已停止")) return false;
        return value.contains("左转") || value.contains("右转") || value.contains("直行") || value.contains("掉头")
                || value.contains("靠左") || value.contains("靠右") || value.contains("驶出") || value.contains("进入环岛")
                || value.contains("turn left") || value.contains("turn right") || value.contains("continue straight")
                || value.matches("(?s).*\\d+(?:\\.\\d+)?\\s*(?:公里|米|km\\b|m\\b|分钟|小时|minutes?\\b|mins?\\b).*")
                || !value.contains("安全") && !value.contains("注意") && value.matches("(?s).*[\\p{L}\\d·]{2,24}(?:大道|公路|高速|街|路)(?![线况网口段面标灯]).*");
    }
}
