package ls.augment.com.hook;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

/** Formatting and freshness are independent of provider access and Android views. */
final class NotificationWeatherText {
    static final String EMPTY = "暂无天气 · 点击打开天气更新";
    static String temperature(String value) {
        try {
            double number = Double.parseDouble(value);
            return Double.isFinite(number) && number >= -100 && number <= 100
                    ? Math.round(number) + "°" : "";
        } catch (RuntimeException invalid) { return ""; }
    }
    static String clean(String value) {
        if (value == null || value.trim().equalsIgnoreCase("null")) return "";
        return value.replaceAll("[\\p{Cntrl}\\s]+", " ").trim();
    }
    static String inline(String city, String condition, String current) {
        String temp = temperature(current);
        if (temp.isEmpty()) return "暂无天气";
        return (clean(city) + " " + clean(condition) + " " + temp + "C").trim()
                .replaceAll(" +", " ");
    }
    static String format(String city, String condition, String current, String low, String high,
            long updated, long now, ZoneId zone) {
        String temp = temperature(current);
        if (temp.isEmpty()) return EMPTY;
        String main = (clean(city) + "  " + clean(condition) + "  " + temp).trim();
        if (updated <= 0 || updated > now + 300_000L)
            return main + "\n更新时间未知 · 点击更新";
        boolean today = Instant.ofEpochMilli(updated).atZone(zone).toLocalDate()
                .equals(Instant.ofEpochMilli(now).atZone(zone).toLocalDate());
        if (!today) return main + "\n非今日数据 · 点击更新";
        String min = temperature(low), max = temperature(high);
        String detail = !min.isEmpty() && !max.isEmpty()
                ? "今日 " + min + "～" + max + "  ·  " : "";
        detail += DateTimeFormatter.ofPattern("HH:mm").withZone(zone)
                .format(Instant.ofEpochMilli(updated)) + "更新";
        if (now - updated > 3 * 60 * 60_000L) detail += " · 待更新";
        return main + "\n" + detail;
    }
    private NotificationWeatherText() { }
}
