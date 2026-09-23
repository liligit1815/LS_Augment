package ls.augment.com.hook;

import java.time.Instant;
import java.time.ZoneId;

public final class TestNotificationWeatherText {
    private static int checks;
    private static void check(boolean condition, String message) {
        checks++; if (!condition) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        ZoneId zone = ZoneId.of("Asia/Shanghai");
        check(NotificationWeatherText.inline("碑林区", "多云", "19").equals("碑林区 多云 19°C"), "reference inline content");
        check(NotificationWeatherText.inline("碑林区", "晴", "0").equals("碑林区 晴 0°C"), "inline zero");
        check(NotificationWeatherText.inline("碑林区", "雪", "-12").equals("碑林区 雪 -12°C"), "inline negative");
        check(NotificationWeatherText.inline(null, "晴", "12").equals("晴 12°C"), "missing city");
        check(NotificationWeatherText.inline("碑林区", "多云", "null").equals("暂无天气"), "missing inline temperature");
        long now = Instant.parse("2026-09-21T12:27:00Z").toEpochMilli();
        String current = NotificationWeatherText.format("北京", "多云", "26.4", "19", "28", now, now, zone);
        check(current.equals("北京  多云  26°\n今日 19°～28°  ·  20:27更新"), "current city and forecast");
        check(NotificationWeatherText.temperature("-12.3").equals("-12°"), "negative temperatures");
        check(NotificationWeatherText.temperature("0").equals("0°"), "zero is valid");
        for (String bad : new String[]{null, "", "null", "NaN", "Infinity", "999", "--", "abc"})
            check(NotificationWeatherText.temperature(bad).isEmpty(), "invalid temperature: " + bad);
        check(NotificationWeatherText.format("北京", "晴", "", "19", "28", now, now, zone)
                .equals(NotificationWeatherText.EMPTY), "no invented current temperature");
        check(NotificationWeatherText.format("北京", "晴", "26", "19", "28", now - 86400000L, now, zone)
                .endsWith("非今日数据 · 点击更新"), "yesterday forecast is not today's range");
        check(NotificationWeatherText.format("北京", "晴", "26", "19", "28", 0, now, zone)
                .endsWith("更新时间未知 · 点击更新"), "unknown provider time");
        check(NotificationWeatherText.format("北京", "晴", "26", "19", "28", now + 600000L, now, zone)
                .endsWith("更新时间未知 · 点击更新"), "future timestamps");
        check(NotificationWeatherText.format("北京", "晴", "26", "19", "28", now - 14400000L, now, zone)
                .endsWith("待更新"), "same-day stale values marked");
        long midnight = Instant.parse("2026-09-21T16:01:00Z").toEpochMilli();
        check(NotificationWeatherText.format("北京", "晴", "26", "19", "28", midnight - 120000L, midnight, zone)
                .contains("非今日数据"), "midnight expiry without querying again");
        check(NotificationWeatherText.format("北京", "晴", "26", "", "28", now, now, zone)
                .endsWith("20:27更新"), "partial forecast omits range");
        check(NotificationWeatherText.clean("北京\n  朝阳\t").equals("北京 朝阳"), "provider cannot inject lines");
        System.out.println("NotificationWeatherText: " + checks + " checks passed");
    }
}
