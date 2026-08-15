package ls.augment.com.hook;

import java.util.Set;

public final class TestSettingsTargetMatcher {
    public static void main(String[] args) {
        Set<String> targets = SettingsTargetMatcher.parse(
                "0:com.ss.android.ugc.aweme;999:com.tencent.mm;bad;0:bad:pkg");
        require(SettingsTargetMatcher.matches(targets, 0, "com.ss.android.ugc.aweme"), "user0 target missing");
        require(!SettingsTargetMatcher.matches(targets, 999, "com.ss.android.ugc.aweme"), "package-only cross-user leak");
        require(SettingsTargetMatcher.matches(targets, 999, "com.tencent.mm"), "user999 target missing");
        require(!SettingsTargetMatcher.matches(targets, 0, "com.tencent.mm"), "reverse cross-user leak");
        require(targets.size() == 2, "malformed targets were accepted");
        System.out.println("SettingsTargetMatcher tests: OK");
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
