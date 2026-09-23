package ls.augment.com.hook;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

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
        Calendar calendar = Calendar.getInstance(Locale.ROOT);
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
        boolean quoted = false;
        for (int index = 0; index < pattern.length();) {
            char c = pattern.charAt(index);
            if (c == '\'') {
                if (index + 1 < pattern.length() && pattern.charAt(index + 1) == '\'') {
                    out.append('\''); index += 2;
                } else {
                    quoted = !quoted; index++;
                }
            } else if (quoted) {
                out.append(c); index++;
            } else {
                int end = index + 1;
                while (end < pattern.length() && pattern.charAt(end) == c) end++;
                out.append(formatToken(pattern.substring(index, end), timestamp, calendar, locale));
                index = end;
            }
        }
        if (quoted) throw new IllegalArgumentException("固定文字的单引号未闭合");
        return out.toString();
    }

    private static String formatToken(String token, long timestamp,
            Calendar calendar, Locale locale) {
        if (isEmpty(token)) return "";
        char c = token.charAt(0);
        int len = token.length();
        if (!((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'))) return token;
        Date date = new Date(timestamp);
        switch (c) {
            case 'Y': return ChineseCalendarText.from(calendar).yearName();
            case 'A': return ChineseCalendarText.from(calendar).animal();
            case 'N': {
                ChineseCalendarText lunar = ChineseCalendarText.from(calendar);
                if (len == 1) return lunar.monthName();
                if (len == 2) return lunar.monthGanzhi();
                String text = lunar.dateName();
                String term = len >= 4 ? ChineseCalendarText.solarTerm(calendar) : "";
                return term.isEmpty() ? text : text + " " + term;
            }
            case 'e': return ChineseCalendarText.from(calendar).dayName();
            case 't': return ChineseCalendarText.solarTerm(calendar);
            case 'I': return ChineseCalendarText.hourName(calendar, len > 1);
            case 'G': return "公元";
            case 'a':
                if (len > 1) return period(calendar.get(Calendar.HOUR_OF_DAY), locale);
                break;
            default: break;
        }
        // Standard tokens must retain platform locale, 12-hour and timezone semantics.
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(token, locale);
            formatter.setTimeZone(calendar.getTimeZone());
            return formatter.format(date);
        } catch (IllegalArgumentException unsupportedToken) {
            return token;
        }
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
                if (!quoted && (c == 's' || c == 'S')) {
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
