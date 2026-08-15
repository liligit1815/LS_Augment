package ls.augment.com.hook;

import java.util.Locale;

/** Number-only memory label used by the Recents overlay. */
final class RecentsMemoryFormatter {
    private static final double BYTES_PER_GB = 1024.0d * 1024.0d * 1024.0d;

    private RecentsMemoryFormatter() { }

    static String format(long availableBytes, long totalBytes) {
        if (availableBytes < 0L || totalBytes <= 0L) return "";
        long safeAvailable = Math.min(availableBytes, totalBytes);
        return String.format(Locale.US, "%.1f GB / %.1f GB",
                safeAvailable / BYTES_PER_GB, totalBytes / BYTES_PER_GB);
    }
}
