package ls.augment.com.hook;

import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

public final class TestStatusBarFeatureSupport {
    private TestStatusBarFeatureSupport() { }

    public static void main(String[] args) {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Shanghai"), Locale.CHINA);
        calendar.set(2026, Calendar.AUGUST, 13, 19, 5, 6);
        calendar.set(Calendar.MILLISECOND, 0);
        String value = StatusBarClockFormatter.format(
                calendar.getTimeInMillis(), Locale.CHINA,
                true, true, true, true, "");
        require(value.contains("19:05:06"), "24-hour seconds formatting");
        require(value.contains("傍晚"), "Chinese period formatting");
        require(StatusBarClockFormatter.period(0, Locale.CHINA).equals("凌晨"),
                "midnight period");
        require(StatusBarClockFormatter.period(12, Locale.CHINA).equals("中午"),
                "noon period");

        StatusBarClockFormatter.FormatResult dual = StatusBarClockFormatter.formatDetailed(
                calendar.getTimeInMillis(), Locale.CHINA,
                true, false, false, false, "yy:MM-HH:mm", "E");
        require(dual.valid, "dual-line pattern valid");
        require(dual.text.contains("\n"), "dual-line clock contains line break");
        require(!dual.refreshEverySecond, "minute-only pattern does not tick every second");

        StatusBarClockFormatter.FormatResult seconds = StatusBarClockFormatter.formatDetailed(
                calendar.getTimeInMillis(), Locale.CHINA,
                true, false, false, false, "HH:mm:ss", "'II'");
        require(seconds.valid && seconds.refreshEverySecond,
                "seconds in a custom pattern controls refresh frequency");
        require(seconds.text.endsWith("\nII"), "quoted literal is supported");

        StatusBarClockFormatter.FormatResult invalid = StatusBarClockFormatter.formatDetailed(
                calendar.getTimeInMillis(), Locale.CHINA,
                true, false, false, false, "HH:mm", "II");
        require(!invalid.valid && invalid.error.contains("第二行"),
                "invalid pattern is reported instead of silently replaced");
        require(!StatusBarClockFormatter.requiresSecondUpdates("'ss'", "E"),
                "quoted seconds are literals");

        ls.augment.com.StatusBarLayoutSpec.ParseResult layout =
                ls.augment.com.StatusBarLayoutSpec.parse(
                        "clock,120,500;slot.wifi,880,240");
        require(layout.valid, "status bar layout parses");
        require(layout.spec.get("slot.wifi").x == 880, "slot coordinate retained");
        require(ls.augment.com.StatusBarLayoutSpec.pixel(500, 1216) == 608,
                "normalized coordinate maps to current status bar");
        require(!ls.augment.com.StatusBarLayoutSpec.parse("clock,1001,500").valid,
                "out-of-bounds normalized coordinate rejected");

        require(StatusBarMetricsFormatter.rate(1024L).equals("1.0 K/s"), "KiB rate");
        close(StatusBarMetricsFormatter.temperatureCelsius(375), 37.5d, "battery temp");
        close(StatusBarMetricsFormatter.temperatureCelsius(45000), 45.0d, "thermal temp");
        close(StatusBarMetricsFormatter.currentMilliAmp(-2500000), -2500.0d, "current");
        close(StatusBarMetricsFormatter.voltageVolt(4000000), 4.0d, "voltage");
        close(StatusBarMetricsFormatter.powerWatt(-2500000, 4000000), 10.0d, "power");
        System.out.println("Status bar feature support checks: OK");
    }

    private static void require(boolean value, String name) {
        if (!value) throw new AssertionError(name);
    }

    private static void close(double actual, double expected, String name) {
        if (Math.abs(actual - expected) > 0.0001d) {
            throw new AssertionError(name + ": expected=" + expected + " actual=" + actual);
        }
    }
}
