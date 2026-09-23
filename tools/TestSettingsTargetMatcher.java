package ls.augment.com.hook;

import java.util.Set;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import ls.augment.com.HideTargetCodec;

public final class TestSettingsTargetMatcher {
    public static void main(String[] args) {
        Map<Integer, Long> serials = new java.util.HashMap<>();
        serials.put(0, 0L); serials.put(999, 42L);
        SettingsTargetMatcher.SerialReader reader = user -> serials.getOrDefault(user, -1L);
        String raw = "v3:0:0:com.ss.android.ugc.aweme;v3:999:42:com.tencent.mm";
        Set<String> targets = SettingsTargetMatcher.verifiedTargets(raw, reader);
        require(SettingsTargetMatcher.matches(targets, 0, "com.ss.android.ugc.aweme"), "user0 target missing");
        require(!SettingsTargetMatcher.matches(targets, 999, "com.ss.android.ugc.aweme"), "package-only cross-user leak");
        require(SettingsTargetMatcher.matches(targets, 999, "com.tencent.mm"), "user999 target missing");
        require(!SettingsTargetMatcher.matches(targets, 0, "com.tencent.mm"), "reverse cross-user leak");
        require(targets.size() == 2, "correct bound targets missing");
        Set<HideTargetCodec.Entry> authorizations = SettingsTargetMatcher.verifiedBindings(raw, reader);
        require(authorizations.contains(new HideTargetCodec.Entry(999, 42, "com.tencent.mm", true)),
                "verified authorization lost the original serial");
        require(!authorizations.contains(new HideTargetCodec.Entry(999, 43, "com.tencent.mm", true)),
                "same number and package inherited another user's serial authorization");
        require(!authorizations.contains(new HideTargetCodec.Entry(999, 42, "com.tencent.mm", false)),
                "pending entry inherited confirmed authorization");
        boolean boundImmutable = false;
        try { authorizations.clear(); } catch (UnsupportedOperationException expected) { boundImmutable = true; }
        require(boundImmutable, "typed authorization set is mutable");
        serials.put(999, 43L);
        Set<String> reused = SettingsTargetMatcher.verifiedTargets(raw, reader);
        require(!SettingsTargetMatcher.matches(reused, 999, "com.tencent.mm"), "same raw authorized a reused user number");
        require(SettingsTargetMatcher.matches(reused, 0, "com.ss.android.ugc.aweme"), "unrelated current user was removed");
        serials.remove(999);
        require(!SettingsTargetMatcher.matches(SettingsTargetMatcher.verifiedTargets(raw, reader), 999, "com.tencent.mm"), "missing user retained authorization");
        require(SettingsTargetMatcher.verifiedTargets(raw, user -> { throw new IllegalStateException(); }).isEmpty(), "identity failure retained authorization");
        for (String invalid : new String[]{"0:com.ss.android.ugc.aweme", "p3:0:0:com.ss.android.ugc.aweme",
                "v4:0:0:com.ss.android.ugc.aweme", "v3:0:-1:com.ss.android.ugc.aweme",
                raw + ";bad", "v3:100000:1:com.example.app", "v3:0:0:bad:pkg", ""})
            require(SettingsTargetMatcher.verifiedTargets(invalid, reader).isEmpty(), "unbound/pending/invalid mirror authorized filtering: " + invalid);
        require(SettingsTargetMatcher.verifiedTargets(raw, null).isEmpty(), "absent identity reader authorized filtering");
        AtomicInteger reads = new AtomicInteger();
        Set<String> sameUser = SettingsTargetMatcher.verifiedTargets("v3:0:0:com.example.one;v3:0:0:com.example.two",
                user -> { reads.incrementAndGet(); return 0; });
        require(sameUser.size() == 2 && reads.get() == 1, "identity was not checked once per distinct user");
        boolean immutable = false;
        try { sameUser.add("999:com.injected.app"); } catch (UnsupportedOperationException expected) { immutable = true; }
        require(immutable, "verified set is mutable");
        require(!SettingsTargetMatcher.matches(sameUser, -1, "com.example.one"), "invalid user matched");
        System.out.println("SettingsTargetMatcher: " + checks + " behavior assertions passed");
    }

    private static int checks;
    private static void require(boolean condition, String message) {
        checks++;
        if (!condition) throw new AssertionError(message);
    }
}
