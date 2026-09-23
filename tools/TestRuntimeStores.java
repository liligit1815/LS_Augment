package ls.augment.com;

import android.content.Context;
import android.content.ContentResolver;
import android.content.SharedPreferences;
import android.os.Bundle;
import java.util.HashMap;
import java.util.Map;

/** Runs against production stores with a host-side SharedPreferences fault model. */
public final class TestRuntimeStores {
    private static final String A = "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa";
    private static final String B = "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb";
    public static void main(String[] args) {
        FakeContext context = new FakeContext();
        FakePreferences runtime = context.prefs("ls_augment_runtime_v2");
        FakePreferences fuse = context.prefs("ls_augment_crash_fuse_v2");
        String test = args[0];
        switch (test) {
            case "runtime_success":
                check(RuntimeStateStore.publishHidden(context, "999:com.test.app", "ALL_HIDDEN").isSuccess(), "publish succeeds");
                check("999:com.test.app".equals(runtime.disk.get(RemoteConfig.HIDDEN)), "hidden targets durable");
                check(context.resolver.notifications == 1 && FrameworkConfigSync.requests == 1, "notify after durable publication");
                check(RuntimeStateStore.snapshot(context).getBoolean("ok"), "snapshot available");
                break;
            case "runtime_failed_retry":
                runtime.failNext = 1;
                check(!RuntimeStateStore.publishHidden(context, "0:com.test.app", "ALL_HIDDEN").isSuccess(), "first write fails");
                check(context.resolver.notifications == 0 && FrameworkConfigSync.requests == 0, "failed state not published");
                check(RuntimeStateStore.publishHidden(context, "0:com.test.app", "ALL_HIDDEN").isSuccess(), "same-value retry succeeds");
                check(runtime.commits >= 2 && "0:com.test.app".equals(runtime.disk.get(RemoteConfig.HIDDEN)), "same-value retry really reaches disk");
                break;
            case "runtime_failed_snapshot":
                check(RuntimeStateStore.publishHidden(context, "0:com.old.app", "ALL_HIDDEN").isSuccess(), "baseline durable");
                runtime.failNext = 1;
                check(!RuntimeStateStore.publishHidden(context, "999:com.new.app", "MIXED").isSuccess(), "second write fails");
                check("0:com.old.app".equals(RuntimeStateStore.snapshot(context).getString(RemoteConfig.HIDDEN)), "readers retain last durable hidden set");
                check("ALL_HIDDEN".equals(RuntimeStateStore.snapshot(context).getString(RemoteConfig.TILE)), "readers retain last durable tile");
                break;
            case "runtime_idempotent":
                RuntimeStateStore.publishHidden(context, "0:com.test.app", "ALL_HIDDEN");
                int commits = runtime.commits;
                RuntimeStateStore.publishHidden(context, "0:com.test.app", "ALL_HIDDEN");
                check(runtime.commits == commits, "confirmed unchanged snapshot avoids disk write");
                check(!RuntimeStateStore.publishHidden(context, null, "ALL_HIDDEN").isSuccess(), "invalid hidden value rejected");
                check(!RuntimeStateStore.publishHidden(context, "", "lower case").isSuccess(), "invalid tile rejected");
                break;
            case "fuse_unmigrated":
                check(CrashFuseStore.isFused(context), "unmigrated is fail-closed");
                check(!CrashFuseStore.refresh(context, request(A, "arm")).getBoolean("ok"), "unmigrated cannot arm");
                RootShell.next = new RootShell.Result(127, "denied", false);
                check(!CrashFuseStore.importLegacy(context) && CrashFuseStore.isFused(context), "Root unavailable cannot bypass migration");
                break;
            case "fuse_failed_reset":
                RootShell.next = new RootShell.Result(0, "0\n3\n1", false);
                check(CrashFuseStore.importLegacy(context) && CrashFuseStore.isFused(context), "tripped legacy imported");
                fuse.failNext = 1;
                check(!CrashFuseStore.reset(context), "reset failure reported");
                check(CrashFuseStore.isFused(context), "failed reset cannot untrip in memory");
                check("FUSED".equals(CrashFuseStore.refresh(context, request(A, "arm")).getString("state")), "later refresh cannot commit failed reset as success");
                break;
            case "fuse_failed_migration":
                RootShell.next = new RootShell.Result(0, "null\nnull\nnull", false);
                fuse.failNext = 1;
                check(!CrashFuseStore.importLegacy(context), "migration disk failure reported");
                check(CrashFuseStore.isFused(context), "failed migration remains blocked");
                check(CrashFuseStore.importLegacy(context), "migration retry succeeds");
                check(Boolean.TRUE.equals(fuse.disk.get("migrated")) && fuse.commits >= 2, "migration retry reaches disk");
                break;
            case "fuse_bad_migration":
                RootShell.next = new RootShell.Result(0, "0\nnot-a-number\n0", false);
                check(!CrashFuseStore.importLegacy(context) && CrashFuseStore.isFused(context), "malformed legacy blocked");
                RootShell.next = new RootShell.Result(0, "0\n-1\n0", false);
                check(!CrashFuseStore.importLegacy(context) && CrashFuseStore.isFused(context), "negative legacy blocked");
                break;
            case "fuse_third_crash":
                RootShell.next = new RootShell.Result(0, "1\n2\n0", false);
                check(CrashFuseStore.importLegacy(context), "pending legacy imported");
                Bundle result = CrashFuseStore.refresh(context, request(A, "arm"));
                check(result.getInt("attempts") == 3 && "FUSED".equals(result.getString("state")), "third interrupted session trips");
                result = CrashFuseStore.refresh(context, request(A, "clearAttempts", "clearPending", "arm"));
                check("FUSED".equals(result.getString("state")), "clearing counters cannot clear tripped fuse");
                break;
            case "fuse_failed_arm":
                check(CrashFuseStore.reset(context), "reset durable");
                fuse.failNext = 1;
                check(!CrashFuseStore.refresh(context, request(A, "arm")).getBoolean("ok"), "failed arm returns unknown");
                check(!Boolean.TRUE.equals(fuse.disk.get("pending")), "failed arm is not durable");
                Bundle armed = CrashFuseStore.refresh(context, request(A, "arm"));
                check(armed.getBoolean("ok") && "ARMED".equals(armed.getString("state"))
                        && Boolean.TRUE.equals(fuse.disk.get("pending")), "retry arms only after durable marker");
                break;
            case "fuse_stable":
                check(CrashFuseStore.reset(context), "reset durable");
                check("ARMED".equals(CrashFuseStore.refresh(context, request(A, "arm")).getString("state")), "first session arms");
                CrashFuseStore.refresh(context, request(A, "clearPending", "clearAttempts"));
                Bundle next = CrashFuseStore.refresh(context, request(B));
                check("READY".equals(next.getString("state")) && next.getInt("attempts") == 0, "stable session not counted as crash");
                break;
            case "fuse_repeated_session":
                CrashFuseStore.reset(context);
                CrashFuseStore.refresh(context, request(A, "arm"));
                Bundle once = CrashFuseStore.refresh(context, request(B, "arm"));
                check(once.getInt("attempts") == 1, "new session counts pending interruption once");
                for (int i = 0; i < 5; i++)
                    check(CrashFuseStore.refresh(context, request(B, "arm")).getInt("attempts") == 1,
                            "same session does not double count");
                break;
            case "fuse_failed_counter":
                CrashFuseStore.reset(context);
                CrashFuseStore.refresh(context, request(A, "arm"));
                fuse.failNext = 1;
                check(!CrashFuseStore.refresh(context, request(B, "arm")).getBoolean("ok"), "failed count is not acknowledged");
                Bundle counted = CrashFuseStore.refresh(context, request(B, "arm"));
                check(counted.getInt("attempts") == 1 && (Integer) fuse.disk.get("attempts") == 1,
                        "retry counts original interrupted session exactly once");
                break;
            case "durable_failed_key_leak":
                DurablePreferences store = new DurablePreferences(runtime);
                check(store.edit().putString("original", "yes").commit(), "baseline");
                runtime.failNext = 1;
                check(!store.edit().putString("failed", "no").commit(), "optimistic failed key inserted");
                check(!store.contains("failed") && runtime.memory.containsKey("failed"), "confirmed ignores optimistic memory");
                check(store.edit().putString("next", "yes").commit(), "different later write succeeds");
                check(!runtime.disk.containsKey("failed") && "yes".equals(runtime.disk.get("original")), "full replacement prevents failed key leakage");
                break;
            case "runtime_cold_reload":
                RuntimeStateStore.publishHidden(context, "0:com.old.app", "ALL_HIDDEN");
                runtime.failNext = 1;
                RuntimeStateStore.publishHidden(context, "999:com.new.app", "MIXED");
                coldReload(RuntimeStateStore.class, runtime);
                check("0:com.old.app".equals(RuntimeStateStore.snapshot(context).getString(RemoteConfig.HIDDEN)),
                        "cold process reloads durable state after failed write");
                break;
            case "fuse_cold_reload":
                CrashFuseStore.reset(context);
                CrashFuseStore.refresh(context, request(A, "arm"));
                coldReload(CrashFuseStore.class, fuse);
                Bundle reloaded = CrashFuseStore.refresh(context, request(B, "arm"));
                check(reloaded.getInt("attempts") == 1 && "ARMED".equals(reloaded.getString("state")),
                        "cold process counts persisted pending marker once");
                break;
            default: throw new AssertionError(test);
        }
        System.out.println(test + ": OK");
    }

    private static Bundle request(String session, String... flags) {
        Bundle value = new Bundle(); value.putString("session", session);
        for (String flag : flags) value.putBoolean(flag, true);
        return value;
    }
    private static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }

    private static void coldReload(Class<?> store, FakePreferences preferences) {
        preferences.memory.clear(); preferences.memory.putAll(preferences.disk);
        try {
            java.lang.reflect.Field field = store.getDeclaredField("durable");
            field.setAccessible(true); field.set(null, null);
        } catch (ReflectiveOperationException error) { throw new AssertionError(error); }
    }

    static final class FakeContext extends Context {
        final Map<String, FakePreferences> stores = new HashMap<>();
        final ContentResolver resolver = new ContentResolver();
        FakePreferences prefs(String name) { return stores.computeIfAbsent(name, unused -> new FakePreferences()); }
        @Override public SharedPreferences getSharedPreferences(String name, int mode) {
            check(mode == 0, "all preferences must remain app-private"); return prefs(name);
        }
        @Override public ContentResolver getContentResolver() { return resolver; }
    }

    static final class FakePreferences implements SharedPreferences {
        final Map<String, Object> memory = new HashMap<>(), disk = new HashMap<>();
        int failNext, commits;
        public Map<String, ?> getAll() { return new HashMap<>(memory); }
        public String getString(String key, String fallback) { return (String) memory.getOrDefault(key, fallback); }
        public boolean getBoolean(String key, boolean fallback) { return (Boolean) memory.getOrDefault(key, fallback); }
        public int getInt(String key, int fallback) { return (Integer) memory.getOrDefault(key, fallback); }
        public long getLong(String key, long fallback) { return (Long) memory.getOrDefault(key, fallback); }
        public Editor edit() {
            return new Editor() {
                final Map<String, Object> pending = new HashMap<>();
                boolean clear;
                public Editor putString(String key, String value) { pending.put(key, value); return this; }
                public Editor putBoolean(String key, boolean value) { pending.put(key, value); return this; }
                public Editor putInt(String key, int value) { pending.put(key, value); return this; }
                public Editor putLong(String key, long value) { pending.put(key, value); return this; }
                public Editor putFloat(String key, float value) { pending.put(key, value); return this; }
                public Editor clear() { clear = true; return this; }
                public boolean commit() {
                    commits++;
                    if (clear) memory.clear();
                    memory.putAll(pending); // AOSP commitToMemory happens before disk completion.
                    if (failNext > 0) { failNext--; return false; }
                    disk.clear(); disk.putAll(memory); return true;
                }
            };
        }
    }
}
