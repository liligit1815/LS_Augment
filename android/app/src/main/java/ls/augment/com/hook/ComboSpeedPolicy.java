package ls.augment.com.hook;

/**
 * Converts the OEM recovery timing and rate into a user-selected playback
 * rate while preserving the original motion duration.
 *
 * <p>The vendor bundle may already describe a two-times playback.  Rebuilding
 * the original duration first prevents applying the selected multiplier on
 * top of that OEM mode.</p>
 */
final class ComboSpeedPolicy {
    static final float MIN_RATE = 1.00f;
    static final float MAX_RATE = 10.00f;

    private ComboSpeedPolicy() { }

    static boolean isValidRate(float rate) {
        return !Float.isNaN(rate) && !Float.isInfinite(rate)
                && rate >= MIN_RATE && rate <= MAX_RATE
                && rate == Math.rint(rate);
    }

    static float normalizeRate(float rate) {
        return isValidRate(rate) ? rate : MIN_RATE;
    }

    /**
     * The cache identity intentionally follows the product contract: source
     * file name (not its directory), source modification time, and integer
     * playback rate. The readable prefix is paired with the full name hash so
     * sanitizing or truncating a long file name cannot merge normal entries.
     */
    static String cacheIdentity(String fileName, long modifiedTime, float rate) {
        if (fileName == null || fileName.isEmpty() || modifiedTime < 0L
                || !isValidRate(rate)) {
            return null;
        }
        String fileIdentity = cacheFileIdentity(fileName);
        return fileIdentity == null ? null : fileIdentity
                + "-m" + modifiedTime + "-x" + Math.round(rate);
    }

    static String cacheFileIdentity(String fileName) {
        if (fileName == null || fileName.isEmpty()) return null;
        StringBuilder readable = new StringBuilder();
        int codePoints = 0;
        for (int offset = 0; offset < fileName.length() && codePoints < 32;) {
            int codePoint = fileName.codePointAt(offset);
            if (Character.isLetterOrDigit(codePoint)
                    || codePoint == '.' || codePoint == '_'
                    || codePoint == '-') {
                readable.appendCodePoint(codePoint);
            } else {
                readable.append('_');
            }
            offset += Character.charCount(codePoint);
            codePoints++;
        }
        if (readable.length() == 0) readable.append("motion");
        return readable + "-" + Integer.toUnsignedString(fileName.hashCode(), 16);
    }

    static long adjustRecoveryTime(long recoveryTime, float originalRate, float targetRate) {
        if (recoveryTime <= 0L || Float.isNaN(originalRate)
                || Float.isInfinite(originalRate) || originalRate <= 0f
                || !isValidRate(targetRate)) {
            return recoveryTime;
        }
        double adjusted = (recoveryTime * (double) originalRate) / targetRate;
        if (adjusted >= Long.MAX_VALUE) return Long.MAX_VALUE;
        long result = (long) Math.ceil(adjusted);
        return Math.max(1L, result);
    }

    /**
     * Scale an absolute MotionEvent timestamp around the first event.  The
     * OEM player schedules every event from these timestamps, so changing a
     * separate playback-duration field cannot affect the real gesture speed.
     */
    static long scaleTimestamp(long timestamp, long origin, float targetRate) {
        if (timestamp < 0L || origin < 0L || timestamp <= origin
                || !isValidRate(targetRate)) {
            return timestamp;
        }
        double scaled = origin + ((timestamp - (double) origin) / targetRate);
        if (scaled >= Long.MAX_VALUE) return Long.MAX_VALUE;
        return Math.max(origin, Math.round(scaled));
    }
}
