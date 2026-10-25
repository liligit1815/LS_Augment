package ls.augment.com.hook;

public final class NativeIslandRecordingRecoveryTest {
    static int checks;
    static void check(boolean result, String description) {
        checks++; if (!result) throw new AssertionError(description);
    }
    static boolean match(int state, int oldBoot, int boot, String oldKey, String key,
                         long oldTime, long time, String duration, boolean foreground) {
        return NativeIslandRecordingRecovery.matches(state, oldBoot, boot, oldKey, key, oldTime, time, duration, foreground);
    }
    public static void main(String[] args) {
        check(match(2, 670, 670, "record-user0", "record-user0", 123, 123, "00:00:06", true), "same paused foreground session");
        check(!match(1, 670, 670, "r", "r", 123, 123, "00:00:06", true), "never restore an aging active clock");
        check(!match(0, 670, 670, "r", "r", 123, 123, "00:00:06", true), "stopped recording");
        check(!match(2, 669, 670, "r", "r", 123, 123, "00:00:06", true), "different boot");
        check(!match(2, -1, -1, "r", "r", 123, 123, "00:00:06", true), "unknown boot");
        check(!match(2, 670, 670, "user0", "user10", 123, 123, "00:00:06", true), "different user/session key");
        check(!match(2, 670, 670, "r", "r", 123, 124, "00:00:06", true), "replacement notification");
        check(!match(2, 670, 670, "r", "r", 0, 0, "00:00:06", true), "unknown notification time");
        check(!match(2, 670, 670, "r", "r", 123, 123, "00:99:06", true), "invalid elapsed time");
        check(!match(2, 670, 670, "r", "r", 123, 123, "00:00:06", false), "no active foreground service");
        check(!match(2, 670, 670, "", "", 123, 123, "00:00:06", true), "empty identity");
        System.out.println("PASS NativeIslandRecordingRecovery " + checks + " checks");
    }
}
