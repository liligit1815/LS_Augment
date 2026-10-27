package ls.augment.com.hook;

/** Shared selection and provider semantics. Nubia broadcast states are a different protocol. */
final class NativeIslandScenePolicy {
    static final String SOURCE_SYNC_PERMISSION = "android.permission.STATUS_BAR_SERVICE";
    static final String COUNTDOWN_SYNC_ACTION = "ls.augment.com.action.SYNC_NATIVE_COUNTDOWN";
    static final String RECORDER_SYNC_ACTION = "ls.augment.com.action.SYNC_NATIVE_RECORDER";
    static final String TRANSLATION_SYNC_ACTION = "ls.augment.com.action.SYNC_NATIVE_TRANSLATION";
    static final String TRANSFER_SYNC_ACTION = "ls.augment.com.action.SYNC_NATIVE_TRANSFER";
    static final String NFC_TRANSFER_SYNC_ACTION = "ls.augment.com.action.SYNC_NATIVE_NFC_TRANSFER";
    static final String CALL_SYNC_ACTION = "ls.augment.com.action.SYNC_NATIVE_CALL";
    static final String PERSONAL_SYNC_ACTION = "ls.augment.com.action.SYNC_NATIVE_PERSONAL";

    static boolean enhance(boolean master, boolean scene, boolean ready) {
        return master && scene && ready;
    }

    static int countdownState(String value) {
        if ("0".equals(value)) return 0;
        if ("1".equals(value)) return 1;
        if ("2".equals(value)) return 2;
        return -1;
    }

    static boolean countdownVisible(int state, String foreground, int sceneUser, int currentUser) {
        return (state == 1 || state == 2) && sceneUser >= 0 && sceneUser == currentUser
                && foreground != null && !foreground.isEmpty() && !"zte.com.cn.alarmclock".equals(foreground);
    }

    private NativeIslandScenePolicy() { }
}
