package ls.augment.com;

import java.util.Locale;

/** Real physical RAM presentation shared by both supported launcher variants. */
public final class LauncherMemoryPresentation {
    public static final int FULL_LABELS = 6;
    private static final double GIB = 1024d * 1024d * 1024d;

    private LauncherMemoryPresentation() { }

    public static String format(long totalBytes, long availableBytes, int style, int content) {
        if (totalBytes <= 0) return "";
        long available = Math.max(0, Math.min(totalBytes, availableBytes));
        long used = totalBytes - available;
        boolean detailed = style == 1;
        String availableText = part("可用", available, totalBytes, detailed);
        String usedText = part("已用", used, totalBytes, detailed);
        String totalText = part("总量", totalBytes, totalBytes, false);
        String separator = detailed ? "\n" : "  ";
        switch (content) {
            case 1: return availableText + separator + usedText;
            case 2: return availableText;
            case 3: return usedText;
            case 4: return totalText;
            case 5: return String.format(Locale.ROOT, "%.2f GB 可用 | %.2f GB", available / GIB, totalBytes / GIB);
            case FULL_LABELS:
                // Complementary rounded percentages always add up to 100.
                long availablePercent = Math.round(available * 100d / totalBytes);
                return String.format(Locale.ROOT, detailed
                                ? "剩余量  %.2f GB  %d%%\n已用量  %.2f GB  %d%%\n总量  %.2f GB"
                                : "剩余量  %.2f GB  已用量  %.2f GB  总量  %.2f GB",
                        detailed ? new Object[]{available / GIB, availablePercent, used / GIB,
                                100 - availablePercent, totalBytes / GIB}
                                : new Object[]{available / GIB, used / GIB, totalBytes / GIB});
            default: return availableText + separator + usedText + separator + totalText;
        }
    }

    private static String part(String title, long bytes, long total, boolean percentage) {
        String result = String.format(Locale.ROOT, "%s %.2f GB", title, bytes / GIB);
        return percentage ? result + String.format(Locale.ROOT, " %.1f%%", bytes * 100d / total)
                : result;
    }
}
