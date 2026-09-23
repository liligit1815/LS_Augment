package ls.augment.com;

import java.util.Locale;

/** User-facing choices kept independent of OEM view implementations. */
public final class SystemUiPolicy {
    private SystemUiPolicy() { }
    public static int batteryBand(int level) {
        return level < 20 ? 0 : level <= 50 ? 1 : level < 80 ? 2 : 3;
    }
    public static int nativeBatteryMode(int style) {
        if (style == 1) return 1;
        if (style == 2 || style == 3 || style == 5) return 2;
        if (style == 4) return 0;
        if (style == 6) return 3;
        return -1;
    }
    /** Insert seconds after minutes without interpreting letters inside quoted literals. */
    public static String withSeconds(String format) {
        if (format == null || format.isEmpty()) return "HH:mm:ss";
        boolean quote = false; int lastMinute = -1;
        for (int i = 0; i < format.length(); i++) {
            char ch = format.charAt(i);
            if (ch == '\'') {
                if (i + 1 < format.length() && format.charAt(i + 1) == '\'') { i++; continue; }
                quote = !quote;
            } else if (!quote) {
                if (ch == 's') return format;
                if (ch == 'm') lastMinute = i;
            }
        }
        return lastMinute >= 0 ? format.substring(0, lastMinute + 1) + ":ss" + format.substring(lastMinute + 1) : format;
    }
    public static String period(int hour) {
        if (hour < 5) return "凌晨";
        if (hour < 8) return "早上";
        if (hour < 11) return "上午";
        if (hour < 13) return "中午";
        if (hour < 18) return "下午";
        if (hour < 20) return "傍晚";
        return "晚上";
    }
    public static String networkRate(long bytes,int digits,int unit,boolean perSecond){
        double safe=Math.max(0,bytes);
        boolean mega=unit==2||unit==0&&safe>=1048576;
        double value=safe/(mega?1048576d:1024d);
        int places=value>0?(int)Math.max(0,Math.min(5,digits-1-Math.floor(Math.log10(value)))):Math.max(0,digits-1);
        String label=unit==0?(mega?"M":"K"):(mega?"MB":"KB");
        return String.format(Locale.ROOT,"%."+places+"f",value)+label+(perSecond?"/s":"");
    }
    public static boolean hideNetwork(long up,long down,int thresholdKb){return thresholdKb>0&&Math.max(up,down)<thresholdKb*1024L;}
}
