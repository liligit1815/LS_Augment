package ls.augment.com.hook;

import java.util.Locale;

/** Unit normalization and compact status-bar text formatting. */
final class StatusBarMetricsFormatter {
    private StatusBarMetricsFormatter() { }

    static String rate(long bytesPerSecond) {
        long safe = Math.max(0L, bytesPerSecond);
        if (safe < 1024L) return safe + " B/s";
        double kib = safe / 1024.0d;
        if (kib < 1024.0d) return String.format(Locale.ROOT, "%.1f K/s", kib);
        return String.format(Locale.ROOT, "%.1f M/s", kib / 1024.0d);
    }

    static double temperatureCelsius(long raw) {
        long absolute = Math.abs(raw);
        if (absolute >= 10000L) return raw / 1000.0d;
        if (absolute >= 1000L) return raw / 100.0d;
        if (absolute >= 200L) return raw / 10.0d;
        return raw;
    }

    static double currentMilliAmp(long raw) {
        return Math.abs(raw) >= 10000L ? raw / 1000.0d : raw;
    }

    static double voltageVolt(long raw) {
        long absolute = Math.abs(raw);
        if (absolute >= 100000L) return raw / 1_000_000.0d;
        if (absolute >= 1000L) return raw / 1000.0d;
        return raw;
    }

    static double powerWatt(long currentRaw, long voltageRaw) {
        return Math.abs(currentMilliAmp(currentRaw) * voltageVolt(voltageRaw) / 1000.0d);
    }
}
