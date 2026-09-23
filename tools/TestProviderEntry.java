package ls.augment.com;

import android.os.Binder;
import android.os.Bundle;

/** Executes the current provider's extracted, unchanged call prefix and UID gate. */
public final class TestProviderEntry {
    public static void main(String[] args) {
        TestRuntimeStores.FakeContext context = new TestRuntimeStores.FakeContext();
        ProviderEntry provider = new ProviderEntry(context);
        Bundle arm = new Bundle();
        arm.putString("session", "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa");
        arm.putBoolean("arm", true);
        CrashFuseStore.reset(context);
        int checks = 0;
        Binder.uid = 12000;
        context.getPackageManager().packages.put(12000, new String[]{"com.attacker.app"});
        check(!provider.call("runtime_snapshot", null, null).getBoolean("ok"), "unscoped UID cannot read runtime"); checks++;
        check(!provider.call("crash_fuse", null, arm).getBoolean("ok"), "unscoped UID cannot arm"); checks++;
        Binder.uid = 11000;
        context.getPackageManager().packages.put(11000, new String[]{"com.android.systemui"});
        check(provider.call("runtime_snapshot", null, null).getBoolean("ok"), "scoped UID can read runtime"); checks++;
        check(!provider.call("crash_fuse", null, arm).getBoolean("ok"), "scoped UID cannot arm"); checks++;
        Binder.uid = android.os.Process.myUid();
        check(!provider.call("crash_fuse", null, arm).getBoolean("ok"), "app UID cannot call system-server route"); checks++;
        Binder.uid = 0;
        BuildConfig.DEBUG = true;
        check(provider.call("runtime_snapshot", null, null).getBoolean("ok"), "debug root read allowed"); checks++;
        check(!provider.call("crash_fuse", null, arm).getBoolean("ok"), "even debug root cannot impersonate system UID"); checks++;
        BuildConfig.DEBUG = false;
        check(!provider.call("runtime_snapshot", null, null).getBoolean("ok"), "release root fallback rejected"); checks++;
        Binder.uid = 1001000;
        context.getPackageManager().packages.put(1001000, new String[]{"com.android.systemui"});
        check(!provider.call("crash_fuse", null, arm).getBoolean("ok"), "other-user system appId is not Linux UID 1000"); checks++;
        check(Binder.clears == 0, "identity not cleared before authorization"); checks++;
        Binder.uid = 1000;
        check("ARMED".equals(provider.call("crash_fuse", null, arm).getString("state")), "system UID can persist arm marker"); checks++;
        check(Binder.clears == 1 && Binder.restores == 1 && Binder.uid == 1000, "authorized identity cleared then restored"); checks++;
        for (int rejected : new int[]{android.os.Process.myUid(), 11000, 12000, 1000}) {
            Binder.uid = rejected;
            check(!provider.call("recovery_refresh", null, null).getBoolean("ok"), "non-root UID cannot queue recovery: " + rejected); checks++;
        }
        check(BootJobService.requests == 0 && Binder.clears == 1, "denied recovery does not schedule or clear identity"); checks++;
        Binder.uid = 0;
        check(provider.call("recovery_refresh", null, null).getBoolean("ok") && BootJobService.requests == 1,
                "Linux root can queue verified recovery even in release mode"); checks++;
        check(Binder.uid == 0 && Binder.clears == 2 && Binder.restores == 2, "recovery restores caller identity"); checks++;
        BootJobService.accepted = false;
        check(!provider.call("recovery_refresh", null, null).getBoolean("ok"), "failed scheduling is not acknowledged"); checks++;
        System.out.println("Provider entry checks: " + checks + " OK (actual source prefix/gate; host UID model)");
    }
    private static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
}
