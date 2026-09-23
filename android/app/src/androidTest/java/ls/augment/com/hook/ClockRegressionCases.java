package ls.augment.com.hook;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

/** Runs against the delivered formatter on the device; never changes the phone's clock. */
public final class ClockRegressionCases {
    private static int checked;
    public static int run() {
        checked = 0;
        TimeZone original = TimeZone.getDefault();
        try {
            for (String zone : new String[]{"Asia/Shanghai", "Asia/Kathmandu", "America/New_York"}) {
                TimeZone.setDefault(TimeZone.getTimeZone(zone));
                for (Locale locale : new Locale[]{Locale.CHINA, Locale.US, Locale.FRANCE, new Locale("th", "TH")}) {
                    Calendar date = Calendar.getInstance(Locale.ROOT);
                    date.clear(); date.set(2026, Calendar.SEPTEMBER, 8, 0, 31, 42);
                    date.set(Calendar.MILLISECOND, 9);
                    for (int hour : new int[]{0, 1, 11, 12, 13, 23}) {
                        date.set(Calendar.HOUR_OF_DAY, hour);
                        for (String pattern : new String[]{"hh:mm:ss a", "HH:mm:ss", "MMM MMMM EEEE", "Z z", "S SS SSS", "'o''clock' h:mm", "'' HH 'ss'", "yyyy-MM-dd D w W k K"}) {
                            SimpleDateFormat platform = new SimpleDateFormat(pattern, locale);
                            String expected = platform.format(date.getTime());
                            check(format(date, locale, pattern).equals(expected), zone + " " + locale + " " + hour + " " + pattern);
                        }
                    }
                }
            }
            TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
            String[][] lunar = {
                    {"1901-01-01", "庚子 鼠 冬 十一"},
                    {"2026-01-01", "乙巳 蛇 冬 十三"},
                    {"2026-02-16", "乙巳 蛇 腊 廿九"},
                    {"2026-02-17", "丙午 马 正 初一"},
                    {"2025-07-25", "乙巳 蛇 闰六 初一"},
                    {"2026-09-08", "丙午 马 七 廿七"},
                    {"2026-08-12", "丙午 马 六 三十"},
                    {"2033-12-22", "癸丑 牛 闰冬 初一"}
            };
            for (String[] entry : lunar) check(format(civil(entry[0]), Locale.CHINA, "Y A N e").equals(entry[1]), "lunar " + entry[0]);
            check(format(civil("2026-09-07"), Locale.CHINA, "t").equals("白露"), "correct solar-term day");
            check(format(civil("2026-09-08"), Locale.CHINA, "t").isEmpty(), "no false solar term");
            check(format(civil("2026-09-08"), new Locale("th", "TH"), "N e").equals("七 廿七"), "non-Gregorian locale does not change lunar lookup");
            check(format(civil("2026-09-23"), Locale.CHINA, "NNNN").equals("八月十三 秋分"), "full lunar date and solar term");
            check(format(civil("2025-07-25"), Locale.CHINA, "N NNN").equals("闰六 闰六月初一"), "leap month variants");
            check(format(civil("2026-09-08"), Locale.CHINA, "NN").equals("丙申"), "seventh lunar month stem/branch per HKO September almanac");
            check(format(civil("2026-09-11"), Locale.CHINA, "NN").equals("丁酉"), "eighth lunar month stem/branch per HKO September almanac");
            check(!StatusBarClockFormatter.needsSecondRefresh("N e t", "'ss'"), "date-only format does not poll every second");
            check(StatusBarClockFormatter.needsSecondRefresh("HH:mm:ss", "N e"), "custom seconds refresh");
            Calendar now = civil("2026-09-08"); now.set(Calendar.HOUR_OF_DAY, 23);
            check(format(now, Locale.CHINA, "I II aa").equals("子 丙子 晚上"), "乙 day 子 hour according to HKO hour-stem table");
            now = civil("2026-09-09"); now.set(Calendar.HOUR_OF_DAY, 0);
            check(format(now, Locale.CHINA, "I II").equals("子 戊子"), "hour stem changes with the civil day");
            check(!StatusBarClockFormatter.formatDetailed(now.getTimeInMillis(), Locale.CHINA, true, false, false, false, "HH:mm '", "").valid, "unclosed quote rejected");
            check(!StatusBarClockFormatter.formatDetailed(civil("2101-01-01").getTimeInMillis(), Locale.CHINA, true, false, false, false, "N e", "").valid, "unsupported calendar year rejected");
            check(format(civil("2101-01-01"), Locale.CHINA, "yyyy-MM-dd").equals("2101-01-01"), "standard date unaffected by lunar range");
            return checked;
        } finally { TimeZone.setDefault(original); }
    }

    private static Calendar civil(String iso) {
        LocalDate day = LocalDate.parse(iso);
        Calendar result = Calendar.getInstance(Locale.CHINA); result.clear();
        result.set(day.getYear(), day.getMonthValue() - 1, day.getDayOfMonth(), 12, 0, 0);
        return result;
    }
    private static String format(Calendar date, Locale locale, String pattern) {
        StatusBarClockFormatter.FormatResult result = StatusBarClockFormatter.formatDetailed(date.getTimeInMillis(), locale, true, false, false, false, pattern, "");
        if (!result.valid) throw new AssertionError(pattern + ": " + result.error);
        return result.text;
    }
    private static void check(boolean passed, String description) {
        if (!passed) throw new AssertionError(description);
        checked++;
    }
    public static void main(String[] args) throws Exception {
        int cases = run();
        int sourceDates = 0;
        if (args.length > 0) {
            for (String line : Files.readAllLines(Path.of(args[0]), StandardCharsets.UTF_8)) {
                String[] fields = line.split("\t");
                LocalDate civil = LocalDate.parse(fields[0]);
                ChineseCalendarText actual = ChineseCalendarText.from(civil);
                check(actual.year == Integer.parseInt(fields[1]) && actual.month == Integer.parseInt(fields[2])
                        && actual.leap == fields[3].equals("1") && actual.day == Integer.parseInt(fields[4]), "HKO lunar " + civil);
                int term = Integer.parseInt(fields[5]);
                check(ChineseCalendarText.solarTerm(civil).equals(term < 0 ? "" : ChineseCalendarText.TERMS[term]), "HKO solar term " + civil);
                sourceDates++;
            }
            check(sourceDates == 73049, "all published civil dates checked");
        }
        System.out.println("Clock cases: " + cases + "; official reference dates checked: " + sourceDates);
    }
}
