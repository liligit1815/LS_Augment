package ls.augment.com.hook;

import java.time.LocalDate;
import java.util.Calendar;

/** Offline civil-calendar lookup. Never substitutes a Gregorian month for a lunar one. */
final class ChineseCalendarText {
    private static final long BASE_DAY = LocalDate.of(1900, 1, 1).toEpochDay();
    private static final String[] STEMS = {"甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"};
    private static final String[] BRANCHES = {"子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"};
    private static final String[] ANIMALS = {"鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗", "猪"};
    private static final String[] MONTH_NAMES = {"", "正", "二", "三", "四", "五", "六", "七", "八", "九", "十", "冬", "腊"};
    private static final String[] DAY_NAMES = {"", "初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十",
            "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十",
            "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"};
    static final String[] TERMS = {"小寒", "大寒", "立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至",
            "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至"};

    final int year, month, day;
    final boolean leap;

    private ChineseCalendarText(int year, int month, int day, boolean leap) {
        this.year = year; this.month = month; this.day = day; this.leap = leap;
    }

    static ChineseCalendarText from(Calendar civil) {
        return from(LocalDate.of(civil.get(Calendar.YEAR), civil.get(Calendar.MONTH) + 1,
                civil.get(Calendar.DAY_OF_MONTH)));
    }

    static ChineseCalendarText from(LocalDate civil) {
        requireSupported(civil.getYear());
        int offset = Math.toIntExact(civil.toEpochDay() - BASE_DAY);
        int low = 0, high = ChineseCalendarData.MONTHS.length - 1;
        while (low < high) {
            int middle = (low + high + 1) >>> 1;
            if ((ChineseCalendarData.MONTHS[middle] >>> 13) <= offset) low = middle;
            else high = middle - 1;
        }
        int packed = ChineseCalendarData.MONTHS[low];
        return new ChineseCalendarText(1900 + ((packed >>> 5) & 255), packed & 15,
                offset - (packed >>> 13) + 1, (packed & 16) != 0);
    }

    String yearName() { return STEMS[Math.floorMod(year - 4, 10)] + BRANCHES[Math.floorMod(year - 4, 12)]; }
    String animal() { return ANIMALS[Math.floorMod(year - 4, 12)]; }
    // HKO stem/branch table: the first lunar month of a 甲/己 year is 丙寅.
    String monthGanzhi() {
        int stem = (Math.floorMod(year - 4, 5) * 2 + month + 1) % 10;
        return STEMS[stem] + BRANCHES[(month + 1) % 12];
    }
    String monthName() { return (leap ? "闰" : "") + MONTH_NAMES[month]; }
    String dayName() { return DAY_NAMES[day]; }
    String dateName() { return monthName() + "月" + dayName(); }

    static String hourName(Calendar civil, boolean ganzhi) {
        int branch = (civil.get(Calendar.HOUR_OF_DAY) + 1) / 2 % 12;
        if (!ganzhi) return BRANCHES[branch];
        // HKO 2026 September almanac identifies September 8 as 乙酉 (day stem 乙).
        // The clock follows its displayed civil date, changing the day at midnight.
        long day = LocalDate.of(civil.get(Calendar.YEAR), civil.get(Calendar.MONTH) + 1,
                civil.get(Calendar.DAY_OF_MONTH)).toEpochDay();
        int dayStem = (int) Math.floorMod(day - LocalDate.of(2026, 9, 8).toEpochDay() + 1, 10);
        return STEMS[(dayStem * 2 + branch) % 10] + BRANCHES[branch];
    }

    static String solarTerm(Calendar civil) {
        return solarTerm(LocalDate.of(civil.get(Calendar.YEAR), civil.get(Calendar.MONTH) + 1,
                civil.get(Calendar.DAY_OF_MONTH)));
    }

    static String solarTerm(LocalDate civil) {
        requireSupported(civil.getYear());
        String dates = ChineseCalendarData.SOLAR_TERM_DAYS[civil.getYear() - 1901];
        int first = (civil.getMonthValue() - 1) * 2;
        for (int i = first; i <= first + 1; i++)
            if (dates.charAt(i) - 'A' + 1 == civil.getDayOfMonth()) return TERMS[i];
        return "";
    }

    private static void requireSupported(int year) {
        if (year < 1901 || year > 2100) throw new IllegalArgumentException("农历和节气支持 1901–2100 年");
    }
}
