package ls.augment.com.hook;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/** Supports both standard and extended date-time patterns. */
public final class StatusBarClockFormatter {
    private StatusBarClockFormatter() { }

    public static final class FormatResult {
        public final boolean valid;
        public final String text;
        public final String error;
        public final boolean refreshEverySecond;

        private FormatResult(boolean valid, String text, String error,
                boolean refreshEverySecond) {
            this.valid = valid;
            this.text = text;
            this.error = error;
            this.refreshEverySecond = refreshEverySecond;
        }
    }

    static String format(long timestamp, Locale locale, boolean use24Hour,
            boolean showSeconds, boolean showPeriod, boolean showWeek,
            String customPattern) {
        FormatResult result = formatDetailed(timestamp, locale, use24Hour,
                showSeconds, showPeriod, showWeek, customPattern, "");
        if (result.valid) return result.text;
        return builtIn(new Date(timestamp), locale == null ? Locale.getDefault() : locale,
                use24Hour, showSeconds);
    }

    public static FormatResult formatDetailed(long timestamp, Locale locale,
            boolean use24Hour, boolean showSeconds, boolean showPeriod,
            boolean showWeek, String firstPattern, String secondPattern) {
        Locale safeLocale = locale == null ? Locale.getDefault() : locale;
        Calendar calendar = Calendar.getInstance(safeLocale);
        calendar.setTimeInMillis(timestamp);
        Date date = new Date(timestamp);
        StringBuilder out = new StringBuilder();
        String error = null;
        try {
            String first = isEmpty(firstPattern)
                    ? builtIn(date, safeLocale, use24Hour, showSeconds)
                    : formatPattern(firstPattern, timestamp, calendar, safeLocale);
            out.append(first);
            if (showPeriod) {
                out.append(' ').append(period(calendar.get(Calendar.HOUR_OF_DAY), safeLocale));
            }
            if (showWeek) {
                out.append(' ').append(formatToken("E", timestamp, calendar, safeLocale));
            }
        } catch (Throwable firstError) {
            error = safeMessage(firstError);
        }
        if (!isEmpty(secondPattern)) {
            try {
                String second = formatPattern(secondPattern, timestamp, calendar, safeLocale);
                if (out.length() > 0) out.append('\n');
                out.append(second);
            } catch (Throwable secondError) {
                String secondMsg = safeMessage(secondError);
                if (error == null || error.isEmpty()) error = secondMsg;
                else error = error + ";" + secondMsg;
            }
        }
        boolean valid = error == null || error.isEmpty();
        return new FormatResult(valid, out.toString(), valid ? "" : error,
                showSeconds || needsSecondRefresh(firstPattern, secondPattern));
    }

    private static String formatPattern(String pattern, long timestamp,
            Calendar calendar, Locale locale) {
        if (isEmpty(pattern)) return "";
        StringBuilder out = new StringBuilder();
        int length = pattern.length();
        int index = 0;
        while (index < length) {
            char c = pattern.charAt(index);
            if (c == '\'') {
                int quoteEnd = pattern.indexOf('\'', index + 1);
                if (quoteEnd < 0) {
                    out.append(c);
                    index++;
                } else if (quoteEnd == index + 1) {
                    out.append('\'');
                    index += 2;
                } else {
                    out.append(pattern, index + 1, quoteEnd);
                    index = quoteEnd + 1;
                }
                continue;
            }
            int runStart = index;
            while (index < length && pattern.charAt(index) == c) index++;
            int runLength = index - runStart;
            String token = repeat(c, runLength);
            out.append(formatToken(token, timestamp, calendar, locale));
        }
        return out.toString();
    }

    private static String formatToken(String token, long timestamp,
            Calendar calendar, Locale locale) {
        if (isEmpty(token)) return "";
        char c = token.charAt(0);
        int len = token.length();
        Date date = new Date(timestamp);
        switch (c) {
            case 'y': {
                int year = calendar.get(Calendar.YEAR);
                if (len == 2) return String.format(locale, "%02d", year % 100);
                if (len == 4) return String.valueOf(year);
                return String.valueOf(year);
            }
            case 'Y': {
                // Simplified lunar year representation
                int year = calendar.get(Calendar.YEAR);
                String[] gan = {"甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"};
                String[] zhi = {"子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"};
                if (len == 2 || len == 3) {
                    // Use sexagenary year as YY fallback
                    int g = (year - 3) % 10;
                    int z = (year - 3) % 12;
                    return gan[g] + zhi[z];
                }
                // Full Chinese year representation
                StringBuilder sb = new StringBuilder();
                int y = year;
                while (y > 0) {
                    int d = y % 10;
                    y = y / 10;
                    sb.append(chineseDigit(d));
                }
                return sb.reverse().toString();
            }
            case 'G':
                return "公元";
            case 'A': {
                int year = calendar.get(Calendar.YEAR);
                String[] zodiac = {"鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗", "猪"};
                int z = (year - 3) % 12;
                return zodiac[z >= 0 ? z : z + 12];
            }
            case 'M': {
                int month = calendar.get(Calendar.MONTH) + 1;
                if (len == 1) return String.valueOf(month);
                if (len == 2) return String.format(locale, "%02d", month);
                if (len == 3 || len == 4) {
                    String[] months = {"", "一月", "二月", "三月", "四月", "五月", "六月",
                            "七月", "八月", "九月", "十月", "十一月", "十二月"};
                    if (len == 3) return monthChinese(month);
                    return months[month];
                }
                return String.valueOf(month);
            }
            case 'N': {
                // Simplified lunar month
                int month = calendar.get(Calendar.MONTH) + 1;
                if (len == 1) return lunarMonthChinese(month);
                if (len == 2) return lunarMonthGanzhi(month);
                // NNNN: lunar date + solar term
                return lunarDateWithTerm(timestamp, calendar, locale);
            }
            case 'D': {
                int dayOfYear = calendar.get(Calendar.DAY_OF_YEAR);
                return String.valueOf(dayOfYear);
            }
            case 'd': {
                int day = calendar.get(Calendar.DAY_OF_MONTH);
                if (len == 1) return String.valueOf(day);
                return String.format(locale, "%02d", day);
            }
            case 'e': {
                return lunarDayChinese(calendar.get(Calendar.DAY_OF_MONTH));
            }
            case 'E': {
                SimpleDateFormat sdf = new SimpleDateFormat(token, locale);
                return sdf.format(date);
            }
            case 'H': {
                int hour = calendar.get(Calendar.HOUR_OF_DAY);
                if (len == 1) return String.valueOf(hour);
                return String.format(locale, "%02d", hour);
            }
            case 'h': {
                int hour = calendar.get(Calendar.HOUR_OF_DAY);
                hour = hour == 0 ? 12 : hour;
                if (len == 1) return String.valueOf(hour);
                return String.format(locale, "%02d", hour);
            }
            case 'I': {
                int hour = calendar.get(Calendar.HOUR_OF_DAY);
                String[] shi = {"子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"};
                int z = (hour + 1) / 2 % 12;
                if (len == 1) return shi[z];
                String[] ganzhi = {"甲子", "乙丑", "丙寅", "丁卯", "戊辰", "己巳",
                        "庚午", "辛未", "壬申", "癸酉", "甲戌", "乙亥"};
                return ganzhi[z];
            }
            case 'm': {
                int min = calendar.get(Calendar.MINUTE);
                if (len == 1) return String.valueOf(min);
                return String.format(locale, "%02d", min);
            }
            case 's': {
                int sec = calendar.get(Calendar.SECOND);
                if (len == 1) return String.valueOf(sec);
                return String.format(locale, "%02d", sec);
            }
            case 'S': {
                int ms = calendar.get(Calendar.MILLISECOND);
                if (len == 1) return String.valueOf(ms);
                if (len == 2) return String.format(locale, "%03d", ms);
                return String.format(locale, "%03d", ms);
            }
            case 'a': {
                int hour = calendar.get(Calendar.HOUR_OF_DAY);
                if (len == 1) {
                    if (locale != null && "zh".equalsIgnoreCase(locale.getLanguage())) {
                        return hour < 12 ? "上午" : "下午";
                    }
                    return hour < 12 ? "AM" : "PM";
                }
                // aa: extended period
                if (locale != null && "zh".equalsIgnoreCase(locale.getLanguage())) {
                    if (hour < 5) return "凌晨";
                    if (hour < 8) return "早上";
                    if (hour < 11) return "上午";
                    if (hour < 13) return "中午";
                    if (hour < 18) return "下午";
                    if (hour < 20) return "傍晚";
                    return "晚上";
                }
                return hour < 12 ? "AM" : "PM";
            }
            case 'Z': {
                TimeZone tz = calendar.getTimeZone();
                int offset = tz.getOffset(timestamp);
                boolean negative = offset < 0;
                offset = Math.abs(offset);
                int hours = offset / (3600 * 1000);
                int mins = (offset % (3600 * 1000)) / (60 * 1000);
                String sign = negative ? "-" : "+";
                if (len <= 3) return String.format(locale, "%s%02d:%02d", sign, hours, mins);
                if (len == 4) return tz.getDisplayName(locale);
                // ZZZZZ: time format like 08:00
                return String.format(locale, "%s%02d:00", sign, hours);
            }
            case 'z': {
                TimeZone tz = calendar.getTimeZone();
                if (len == 4) return tz.getDisplayName(locale);
                return tz.getID();
            }
            case 't': {
                // Simplified solar term
                return solarTerm(timestamp);
            }
            default: {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat(token, locale);
                    sdf.setTimeZone(calendar.getTimeZone());
                    return sdf.format(date);
                } catch (Throwable ignored) {
                    return token;
                }
            }
        }
    }

    private static String repeat(char c, int count) {
        char[] chars = new char[count];
        for (int i = 0; i < count; i++) chars[i] = c;
        return new String(chars);
    }

    private static String chineseDigit(int d) {
        String[] digits = {"〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"};
        return d >= 0 && d < digits.length ? digits[d] : String.valueOf(d);
    }

    private static String monthChinese(int month) {
        String[] months = {"", "一", "二", "三", "四", "五", "六",
                "七", "八", "九", "十", "十一", "十二"};
        return months[month];
    }

    private static String lunarMonthChinese(int month) {
        String[] months = {"", "正", "二", "三", "四", "五", "六",
                "七", "八", "九", "十", "冬", "腊"};
        return months[month];
    }

    private static String lunarMonthGanzhi(int month) {
        String[] ganzhi = {"甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"};
        String[] zhi = {"子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"};
        int m = month % 10;
        int z = month % 12;
        return ganzhi[m] + zhi[z];
    }

    private static String lunarDayChinese(int day) {
        String[] days = {"", "初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十",
                "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十",
                "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"};
        int d = day % 30;
        return d >= 0 && d < days.length ? days[d] : String.valueOf(day);
    }

    private static String lunarDateWithTerm(long timestamp, Calendar calendar, Locale locale) {
        int month = calendar.get(Calendar.MONTH) + 1;
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        String term = solarTerm(timestamp);
        return term.isEmpty() ? (lunarMonthChinese(month) + "月" + lunarDayChinese(day))
                : (lunarMonthChinese(month) + "月" + lunarDayChinese(day) + " " + term);
    }

    private static String solarTerm(long timestamp) {
        // Simplified solar term calculation
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(timestamp);
        int month = cal.get(Calendar.MONTH) + 1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        String[] terms = {"小寒", "大寒", "立春", "雨水", "惊蛰", "春分",
                "清明", "谷雨", "立夏", "小满", "芒种", "夏至",
                "小暑", "大暑", "立秋", "处暑", "白露", "秋分",
                "寒露", "霜降", "立冬", "小雪", "大雪", "冬至"};
        int[] termDays = {6, 20, 4, 19, 6, 21, 5, 20, 6, 21, 6, 22,
                7, 23, 8, 23, 8, 24, 8, 24, 7, 22, 7, 22};
        int idx = (month - 1) * 2;
        if (idx >= 0 && idx < termDays.length && day == termDays[idx]) {
            return terms[idx];
        }
        if (idx + 1 < termDays.length && day == termDays[idx + 1]) {
            return terms[idx + 1];
        }
        return "";
    }

    static boolean needsSecondRefresh(String... patterns) {
        if (patterns == null) return false;
        for (String pattern : patterns) {
            if (pattern == null) continue;
            boolean quoted = false;
            for (int i = 0; i < pattern.length(); i++) {
                char c = pattern.charAt(i);
                if (c == '\'') {
                    if (i + 1 < pattern.length() && pattern.charAt(i + 1) == '\'') {
                        i++;
                    } else {
                        quoted = !quoted;
                    }
                    continue;
                }
                if (!quoted && (c == 's' || c == 'S' || c == 't' || c == 'T')) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean isEmpty(String value) {
        return value == null || value.isEmpty();
    }

    static String period(int hourOfDay, Locale locale) {
        int hour = Math.max(0, Math.min(23, hourOfDay));
        String language = locale == null ? "" : locale.getLanguage();
        if (!"zh".equalsIgnoreCase(language)) return hour < 12 ? "AM" : "PM";
        if (hour < 5) return "凌晨";
        if (hour < 8) return "早上";
        if (hour < 11) return "上午";
        if (hour < 13) return "中午";
        if (hour < 18) return "下午";
        if (hour < 20) return "傍晚";
        return "晚上";
    }

    private static String builtIn(Date date, Locale locale, boolean use24Hour, boolean showSeconds) {
        String pattern;
        if (use24Hour) pattern = showSeconds ? "HH:mm:ss" : "HH:mm";
        else pattern = showSeconds ? "h:mm:ss a" : "h:mm a";
        return new SimpleDateFormat(pattern, locale).format(date);
    }

    private static String safeMessage(Throwable error) {
        String value = error == null ? "" : error.getMessage();
        return value == null || value.trim().isEmpty()
                ? "不支持的格式字符" : value.replace('\n', ' ').replace('\r', ' ');
    }
}
