package ls.augment.com;

/** The supplied iOS artwork has four columns and separate single/dual-card sources. */
public final class IosSignalPolicy {
    public static final String ASSET_DIRECTORY = "signal/ios/";
    private IosSignalPolicy() { }

    public static int artworkLevel(int level, int nativeBars) {
        int bars = nativeBars == 5 ? 5 : 4;
        return Math.round(Math.max(0, Math.min(bars, level)) * 4f / bars);
    }

    public static boolean darkArtwork(int foreground) {
        int r = (foreground >> 16) & 255, g = (foreground >> 8) & 255, b = foreground & 255;
        return 299 * r + 587 * g + 114 * b < 128000;
    }

    public static String filename(int level, int nativeBars, boolean unavailable, int foreground) {
        return filename(level, nativeBars, unavailable, foreground, true);
    }

    public static String filename(int level, int nativeBars, boolean unavailable, int foreground, boolean single) {
        if (!single) {
            int value = unavailable || level < 0 ? 0 : artworkLevel(level, nativeBars);
            // The supplied dark level-zero file is a single-row icon. Reuse the correct
            // white dual-row alpha mask; the painter applies the current native foreground.
            return "dual/stat_sys_signal_" + value
                    + (value != 0 && darkArtwork(foreground) ? "_darkmode" : "") + ".png";
        }
        return "stat_sys_signal_" + (unavailable || level < 0 ? "null" : artworkLevel(level, nativeBars))
                + (darkArtwork(foreground) ? "_darkmode" : "") + ".png";
    }
}
