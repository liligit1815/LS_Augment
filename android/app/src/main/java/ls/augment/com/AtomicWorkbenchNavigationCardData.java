package ls.augment.com;

import android.os.Bundle;
import java.util.Locale;

/** Presentation of actual route fields; notification/TTS text never becomes numeric metrics. */
final class AtomicWorkbenchNavigationCardData {
    final boolean available, structured;
    final String packageName, title, subtitle, speed, remaining, glyph, maneuver,sourceGeneration;

    private AtomicWorkbenchNavigationCardData(boolean available, boolean structured, String packageName,
            String title, String subtitle, String speed, String remaining, String glyph, String maneuver,String sourceGeneration) {
        this.available = available; this.structured = structured; this.packageName = packageName;
        this.title = title; this.subtitle = subtitle; this.speed = speed; this.remaining = remaining;
        this.glyph = glyph; this.maneuver = maneuver;
        this.sourceGeneration=sourceGeneration;
    }

    static AtomicWorkbenchNavigationCardData from(Bundle state) {
        boolean available = state != null && state.getBoolean("available", false)
                && (state.getBoolean("has_session", false) || state.getBoolean("active", false));
        if (!available) return new AtomicWorkbenchNavigationCardData(false, false, "", "", "", "", "", "navigation", "","");
        Object rawGeneration=state.get("navigation_source_generation");
        String sourceGeneration=rawGeneration instanceof String&&((String)rawGeneration).matches("[0-9a-f]{33,48}")?(String)rawGeneration:"";
        boolean guidance = state.getBoolean("has_guidance", state.getBoolean("active", false));
        Bundle metrics = guidance ? AtomicWorkbenchAmapData.structured(state.getBundle(AtomicWorkbenchAmapData.METRICS)) : null;
        String pkg = state.getString("package", "");
        if (metrics != null) {
            int maneuver = metrics.getInt("curManeuverID", -1);
            String direction = maneuver(maneuver);
            String title = metrics.containsKey("segmentRemainDist") ? distance(metrics.getDouble("segmentRemainDist"))
                    : !direction.isEmpty() ? direction : "导航进行中";
            String current = metrics.getString("curRouteName", ""), next = metrics.getString("nextRouteName", "");
            String roads = current.isEmpty() ? next : next.isEmpty() || current.equals(next) ? current : current + " → " + next;
            String speed = metrics.containsKey("speed") ? number(metrics.getDouble("speed"), false) : "";
            String time = metrics.containsKey("routeRemainTime") ? minutes(metrics.getDouble("routeRemainTime")) : "";
            String length = metrics.containsKey("routeRemainDist") ? distance(metrics.getDouble("routeRemainDist")) : "";
            String remaining = time.isEmpty() ? length : length.isEmpty() ? time : time + " · " + length;
            return new AtomicWorkbenchNavigationCardData(true, true, pkg, title, roads, speed, remaining,
                    glyph(maneuver), direction,sourceGeneration);
        }
        String title = guidance ? state.getString("title", "导航") : "导航进行中";
        String line = guidance ? state.getString("subtitle", "")
                : state.getString("message", "地图通知未提供转向指引，请查看地图窗口");
        String extra = guidance ? state.getString("subtext", "") : "";
        String subtitle = line.isEmpty() ? extra : extra.isEmpty() || extra.equals(line) ? line : line + "\n" + extra;
        return new AtomicWorkbenchNavigationCardData(true, false, pkg, title, subtitle, "", "", "navigation", "",sourceGeneration);
    }

    private static String distance(double metres) {
        if (metres > 0d && metres < 1d) return "不足 1 米";
        return metres < 1000d ? number(metres, false) + " 米" : number(metres / 1000d, true) + " 公里";
    }

    private static String minutes(double seconds) {
        if (seconds > 0d && seconds < 60d) return "不足 1 分钟";
        long minutes = (long) Math.ceil(seconds / 60d);
        return minutes < 60L ? minutes + " 分钟" : minutes % 60L == 0L ? minutes / 60L + " 小时"
                : minutes / 60L + " 小时 " + minutes % 60L + " 分钟";
    }

    private static String number(double value, boolean decimal) {
        if (!decimal) return Long.toString(Math.round(value));
        String text = String.format(Locale.ROOT, "%.1f", value);
        return text.endsWith(".0") ? text.substring(0, text.length() - 2) : text;
    }

    // Verified against the referenced OneStep NavigationDisplayFormatter's maneuver IDs.
    private static String glyph(int id) {
        switch (id) {
            case 2: case 65: return "turn-left";
            case 3: case 66: return "turn-right";
            case 4: return "turn-slight-left";
            case 5: return "turn-slight-right";
            case 6: return "turn-sharp-left";
            case 7: return "turn-sharp-right";
            case 8: return "turn-uturn-left";
            case 19: return "turn-uturn-right";
            case 9: case 20: return "turn-straight";
            case 11: case 12: case 17: case 18: case 21: case 22: case 23: case 24:
            case 25: case 26: case 27: case 28: return "turn-roundabout";
            case 10: case 13: case 14: case 15: case 16: return "turn-destination";
            default: return "navigation";
        }
    }

    private static String maneuver(int id) {
        switch (id) {
            case 2: return "左转"; case 3: return "右转";
            case 4: return "向左前方行驶"; case 5: return "向右前方行驶";
            case 6: return "向左后方行驶"; case 7: return "向右后方行驶";
            case 8: return "左转掉头"; case 19: return "右转掉头";
            case 9: return "直行"; case 20: return "继续行驶";
            case 10: return "到达途经点"; case 13: return "到达服务区";
            case 14: return "到达收费站"; case 15: return "到达目的地"; case 16: return "经过隧道";
            case 11: case 17: return "进入环岛"; case 12: case 18: return "驶出环岛";
            case 21: case 25: return "环岛左转"; case 22: case 26: return "环岛右转";
            case 23: case 27: return "环岛直行"; case 24: case 28: return "环岛掉头";
            case 65: return "向左并线"; case 66: return "向右并线";
            default: return "";
        }
    }
}
