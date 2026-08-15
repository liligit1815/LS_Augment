package ls.augment.com.hook;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/** Pure formatter kept outside SystemUI so its edge cases can be unit-tested. */
final class StatusBarClockFormatter {
    private StatusBarClockFormatter() { }

    static final class FormatResult {
        final boolean valid;
        final String text;
        final String error;
        final boolean refreshEverySecond;

        private FormatResult(boolean valid, String text, String error,
                boolean refreshEverySecond) {
            this.valid = valid;
            this.text = text;
            this.error = error;
            this.refreshEverySecond = refreshEverySecond;
        }
    }

    static String format(
            long timestamp,
            Locale locale,
            boolean use24Hour,
            boolean showSeconds,
            boolean showPeriod,
            boolean showWeek,
            String customPattern) {
        FormatResult result = formatDetailed(timestamp, locale, use24Hour, showSeconds,
                showPeriod, showWeek, customPattern, "");
        if (result.valid) return result.text;
        return builtIn(new Date(timestamp), locale == null ? Locale.getDefault() : locale,
                use24Hour, showSeconds);
    }

    static FormatResult formatDetailed(
            long timestamp,
            Locale locale,
            boolean use24Hour,
            boolean showSeconds,
            boolean showPeriod,
            boolean showWeek,
            String firstPattern,
            String secondPattern) {
        Locale safeLocale = locale == null ? Locale.getDefault() : locale;
        Date date = new Date(timestamp);
        String first;
        String firstClean = clean(firstPattern);
        String secondClean = clean(secondPattern);
        try {
            first = firstClean.isEmpty()
                    ? builtIn(date, safeLocale, use24Hour, showSeconds)
                    : new SimpleDateFormat(firstClean, safeLocale).format(date);
        } catch (IllegalArgumentException error) {
            return invalid("第一行格式无效：" + safeMessage(error),
                    showSeconds || requiresSecondUpdates(firstClean, secondClean));
        }

        StringBuilder out = new StringBuilder(first);
        Calendar calendar = Calendar.getInstance(safeLocale);
        calendar.setTimeInMillis(timestamp);
        if (showPeriod) {
            out.append(' ').append(period(calendar.get(Calendar.HOUR_OF_DAY), safeLocale));
        }
        if (showWeek) {
            out.append(' ').append(new SimpleDateFormat("EEE", safeLocale).format(date));
        }
        if (!secondClean.isEmpty()) {
            try {
                out.append('\n').append(new SimpleDateFormat(secondClean, safeLocale).format(date));
            } catch (IllegalArgumentException error) {
                return invalid("第二行格式无效：" + safeMessage(error),
                        showSeconds || requiresSecondUpdates(firstClean, secondClean));
            }
        }
        return new FormatResult(true, out.toString(), "",
                showSeconds || requiresSecondUpdates(firstClean, secondClean));
    }

    static boolean requiresSecondUpdates(String... patterns) {
        if (patterns == null) return false;
        for (String pattern : patterns) {
            String value = pattern == null ? "" : pattern;
            boolean quoted = false;
            for (int index = 0; index < value.length(); index++) {
                char current = value.charAt(index);
                if (current == '\'') {
                    if (index + 1 < value.length() && value.charAt(index + 1) == '\'') {
                        index++;
                    } else {
                        quoted = !quoted;
                    }
                } else if (!quoted && (current == 's' || current == 'S')) {
                    return true;
                }
            }
        }
        return false;
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

    private static String builtIn(
            Date date, Locale locale, boolean use24Hour, boolean showSeconds) {
        String pattern;
        if (use24Hour) pattern = showSeconds ? "HH:mm:ss" : "HH:mm";
        else pattern = showSeconds ? "h:mm:ss a" : "h:mm a";
        return new SimpleDateFormat(pattern, locale).format(date);
    }

    private static String clean(String value) {
        return value == null ? "" : value.trim();
    }

    private static FormatResult invalid(String error, boolean refreshEverySecond) {
        return new FormatResult(false, "", error, refreshEverySecond);
    }

    private static String safeMessage(Throwable error) {
        String value = error == null ? "" : error.getMessage();
        return value == null || value.trim().isEmpty()
                ? "不支持的格式字符" : value.replace('\n', ' ').replace('\r', ' ');
    }
}
