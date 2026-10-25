package ls.augment.com.hook;

/** A paused OEM foreground notification is stable; a changed session must never inherit cached state. */
final class NativeIslandRecordingRecovery {
    private NativeIslandRecordingRecovery() { }
    static boolean matches(int status, int cachedBoot, int boot, String cachedKey, String activeKey,
                           long cachedPost, long activePost, String duration, boolean foreground) {
        if (status != 2 || boot <= 0 || cachedBoot != boot || !foreground
                || cachedKey == null || cachedKey.isEmpty() || !cachedKey.equals(activeKey)
                || cachedPost <= 0 || cachedPost != activePost || duration == null
                || !duration.matches("[0-9]{2,}:[0-5][0-9]:[0-5][0-9]")) return false;
        return true;
    }
}
