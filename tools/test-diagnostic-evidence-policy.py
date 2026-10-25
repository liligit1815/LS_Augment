"""Run production diagnostic attribution, queue and callback adapters on the host JVM."""
from pathlib import Path
import argparse
import os
import re
import shutil
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / "android/app/src/main/java/ls/augment/com"


def member(source, signature):
    """Copy a production Java member, preserving the executed implementation."""
    start = source.index(signature)
    brace = source.index("{", start)
    end, depth = brace + 1, 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


INVENTORY_HARNESS = r'''
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
public final class TestInventoryRetryQueue {
    static class SystemClock {
        static volatile long now = 100_000;
        static long elapsedRealtime() { return now; }
    }
    static final String PROVIDER = "provider";
    static class Bundle {
        final Map<String,Object> values = new HashMap<>();
        void putString(String key, String value) { values.put(key, value); }
        String getString(String key,String fallback) { Object v=values.get(key);return v instanceof String?(String)v:fallback; }
        int getInt(String key,int fallback) { Object v=values.get(key);return v instanceof Integer?(Integer)v:fallback; }
        long getLong(String key,long fallback) { Object v=values.get(key);return v instanceof Long?(Long)v:fallback; }
        boolean getBoolean(String key, boolean fallback) {
            Object value = values.get(key); return value instanceof Boolean ? (Boolean)value : fallback;
        }
    }
    static class Context {
        final AtomicInteger calls = new AtomicInteger();
        final CountDownLatch called = new CountDownLatch(1);
        final CountDownLatch unblock;
        final boolean fails;
        Context(boolean fails, CountDownLatch unblock) { this.fails = fails; this.unblock = unblock; }
        Context getContentResolver() { return this; }
        Bundle call(String provider, String method, String arg, Bundle extras) {
            calls.incrementAndGet(); called.countDown();
            if (unblock != null) await(unblock);
            Bundle result = new Bundle(); result.values.put("ok", !fails); return result;
        }
    }
    static class FeatureSettings {
        static final List<String> diagnostics = new CopyOnWriteArrayList<>();
        static void diagnostic(Context context, String key, String value) { diagnostics.add(key + "=" + value); }
    }
    static class ManualTimer {
        final Queue<Runnable> tasks = new ConcurrentLinkedQueue<>();
        volatile CountDownLatch scheduled = new CountDownLatch(1);
        void schedule(Runnable task, long delay, TimeUnit unit) { tasks.add(task); scheduled.countDown(); }
        void fire() { Runnable task; while ((task = tasks.poll()) != null) task.run(); }
        void reset() { tasks.clear(); scheduled = new CountDownLatch(1); }
    }
    private static final ManualTimer INVENTORY_RETRY = new ManualTimer();
    // Admission itself executes against real production code in
    // test-config-bridge-readiness-runtime.py; this suite isolates queue ordering.
    static class ConfigBridgeReadiness {
        static String callFailure(Exception failure){return failure.getClass().getSimpleName();}
        static class Result {String state="READY",error="",probeError="";boolean ready(){return true;}boolean waiting(){return false;}}
        Result check(Context context){return new Result();}
    }
    private static final ConfigBridgeReadiness INVENTORY_BRIDGE=new ConfigBridgeReadiness();
    static long reportedAt;static int freshCaptures;
    static class Main {void post(Runnable task){task.run();}}
    private static final Main MAIN=new Main();
    static void publish(){freshCaptures++;}
    private static InventoryPublication pendingInventory;
    private static final Object INVENTORY_SUBMISSION = new Object();
    private static volatile long inventoryGeneration;
    // PRODUCTION_MEMBERS
    private static void submitFresh(Context context, String payload, long capturedElapsed) {
        // PRODUCTION_SUBMISSION
                pendingInventory = new InventoryPublication(context, payload, capturedElapsed, generation);
                publishInventory(pendingInventory);
            } catch (Exception failure) { throw new AssertionError(failure); }});
        }
    }
    static int checks;
    static void yes(boolean result, String name) {
        checks++; if (!result) throw new AssertionError(name);
    }
    static void await(CountDownLatch latch) {
        try { if (!latch.await(5, TimeUnit.SECONDS)) throw new AssertionError("timeout"); }
        catch (InterruptedException e) { throw new AssertionError(e); }
    }
    static void idle() throws Exception { REPORTER.submit(() -> {}).get(5, TimeUnit.SECONDS); }
    static void queueOrder(boolean retryFirst) throws Exception {
        INVENTORY_RETRY.reset(); FeatureSettings.diagnostics.clear();
        Context old = new Context(true, null), fresh = new Context(false, null);
        submitFresh(old, "old", SystemClock.now);
        await(INVENTORY_RETRY.scheduled);
        CountDownLatch blocked = new CountDownLatch(1), release = new CountDownLatch(1);
        REPORTER.execute(() -> { blocked.countDown(); await(release); }); await(blocked);
        if (retryFirst) INVENTORY_RETRY.fire();
        submitFresh(fresh, "fresh", SystemClock.now);
        if (!retryFirst) INVENTORY_RETRY.fire();
        release.countDown(); await(fresh.called); idle();
        yes(old.calls.get() == 1, "old retry suppressed when fresh queued: " + retryFirst);
        yes(fresh.calls.get() == 1, "fresh survives bounded queue: " + retryFirst);
        yes(pendingInventory == null, "latest publication completed: " + retryFirst);
    }
    public static void main(String[] args) throws Exception {
        try {
            queueOrder(false); queueOrder(true);
            INVENTORY_RETRY.reset(); FeatureSettings.diagnostics.clear();
            CountDownLatch release = new CountDownLatch(1);
            Context old = new Context(true, release), fresh = new Context(false, null);
            submitFresh(old, "blocked-old", SystemClock.now); await(old.called);
            submitFresh(fresh, "latest", SystemClock.now); release.countDown(); await(fresh.called); idle();
            yes(INVENTORY_RETRY.tasks.isEmpty(), "old in-flight failure cannot schedule another retry");
            yes(FeatureSettings.diagnostics.stream().noneMatch(s -> s.contains("waiting;")), "old response cannot overwrite latest bridge state");
            yes(fresh.calls.get() == 1 && pendingInventory == null, "new response wins after blocked old provider");
            Context stale = new Context(false, null);
            REPORTER.submit(() -> {
                pendingInventory=new InventoryPublication(stale,"expired",SystemClock.now-60_000,inventoryGeneration);
                publishInventory(pendingInventory);
            }).get(5,TimeUnit.SECONDS);
            yes(stale.calls.get() == 0, "initial send counts queue age in 60s budget");
            yes(pendingInventory == null, "expired publication released");
            yes(freshCaptures == 1, "expired ready publication requests a fresh UI observation");
            System.out.println("PASS production inventory latest-generation queue: " + checks + " checks");
        } finally { REPORTER.shutdownNow(); }
    }
}
'''


def inventory_harness():
    source = (JAVA / "hook/StatusBarAssetsHook.java").read_text(encoding="utf-8")
    start = source.index("private static final ThreadPoolExecutor REPORTER")
    end = source.index("private static final ThreadPoolExecutor SURFACE_READER", start)
    reporter = source[start:end]
    publication = member(source, "private static final class InventoryPublication")
    publish = member(source, "private static void publishInventory") + "\n" + member(source, "private static String inventoryRejection")
    schedule = member(source, "private static void scheduleInventoryRetry")
    start = source.index("synchronized(INVENTORY_SUBMISSION)", source.index("private static void publish()"))
    end = source.index("for(String surface:observedSurfaces)", start)
    submission = source[start:end]
    return (INVENTORY_HARNESS.replace("// PRODUCTION_MEMBERS", reporter + publication + "\n" + publish + "\n" + schedule)
            .replace("// PRODUCTION_SUBMISSION", submission))


FEATURE_HARNESS = r'''
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
public final class TestFeatureDiagnosticAdapters {
    static class SystemClock { static long now = 100_000; static long elapsedRealtime() { return now; } }
    static class Bundle {
        final Map<String,Object> values = new HashMap<>();
        void putString(String key,String value) { values.put(key,value); }
        void putLong(String key,long value) { values.put(key,value); }
        boolean getBoolean(String key,boolean fallback) { return true; }
        long getLong(String key,long fallback) { return fallback; }
        String getString(String key,String fallback) { Object v=values.get(key);return v instanceof String?(String)v:fallback; }
    }
    static class Context {
        Bundle sent;
        Context getContentResolver() { return this; }
        Bundle call(String provider,String method,String key,Bundle extras) { sent=extras;return new Bundle(); }
    }
    static class ConfigSchema { static boolean truthy(String value) { return "1".equals(value); } }
    static class ConfigReadRetry {static String failure(Throwable error){return error.getClass().getSimpleName();}}
    static class Snapshot {
        final Map<String,String> values=new HashMap<>();
        String get(String key) { return values.get(key); }
    }
    static class FeatureSettings {
        static final String PROVIDER="provider";static final long CACHE_MS=PRODUCTION_CACHE_MS;
        static final Object DIAGNOSTIC_QUEUE_LOCK=new Object();
        static final Map<String,PendingDiagnostic> DIAGNOSTICS=new ConcurrentHashMap<>();
        static final Map<String,String> DIAGNOSTIC_VALUES=new ConcurrentHashMap<>();
        static final AtomicLong diagnosticAccepted=new AtomicLong(),diagnosticRejected=new AtomicLong(),diagnosticRetries=new AtomicLong();
        static long diagnosticLastAcceptedAt,diagnosticLastFailureAt,diagnosticLastDropAt;
        static String startupWriteFailureState="",diagnosticLastFailureType="",diagnosticLastFailureReason="",diagnosticLastFailureKey="",diagnosticLastDropReason="",diagnosticLastDropKey="";
        static volatile String diagnosticProcessName="";
        static volatile boolean verifiedSnapshot;
        static long cachedAt;static Snapshot cachedSnapshot=new Snapshot();
        static int refreshes,ownerLookups;static Context remembered;
        static void requestRefresh() { refreshes++; }
        static boolean enabled(Context context,String key) { remembered=context;return ConfigSchema.truthy(cachedSnapshot.get(key)); }
        static Context from(Object owner) { ownerLookups++;return owner instanceof Context ? (Context)owner : null; }
        static class PendingDiagnostic {
            final Context context;final String value="value";final long observedAt=1000,observedElapsed=1000;
            long retryAt;int failures;PendingDiagnostic(Context context){this.context=context;}
        }
        // PRODUCTION_SETTINGS
    }
    interface Hooker { Object intercept(Chain chain) throws Throwable; }
    static class Chain {
        final Object owner;boolean rejectLookup;int nativeCalls,lookups;
        Chain(Object owner,boolean rejectLookup) { this.owner=owner;this.rejectLookup=rejectLookup; }
        Object getThisObject() { lookups++;if(rejectLookup)throw new AssertionError("owner lookup in disabled/ungated adapter");return owner; }
        List<Object> getArgs() { lookups++;if(rejectLookup)throw new AssertionError("argument lookup in disabled/ungated adapter");return List.of(); }
        Object proceed() { nativeCalls++;return "native"; }
    }
    public static class Target { public int call() { return 1; } }
    static class AugmentModule {
        Hooker callback;
        static class Handle {}
        class Builder { Handle intercept(Hooker value) { callback=value;return new Handle(); } }
        Builder prepareFeatureHook(Method method,String id,boolean before) { return new Builder(); }
        void registerFeatureHook(Handle handle) {}
        void logFeatureError(String message,Throwable error) { throw new AssertionError(message,error); }
    }
    static class OemHooks {
        static final Map<Method,Set<String>> INSTALLED=new HashMap<>();
        static final Map<String,String> STATUS=new HashMap<>();
        static final Set<String> EXECUTED=new HashSet<>();
        static void publish(Context context) {}
        static void schedulePublish() {}
        // PRODUCTION_OEM
    }
    static int checks;
    static void yes(boolean condition,String message) { checks++;if(!condition)throw new AssertionError(message); }
    static void writeAs(String loaded,String application,String expected) {
        FeatureSettings.rememberDiagnosticProcess(loaded);android.app.Application.current=application;
        Context context=new Context();
        yes(FeatureSettings.writeDiagnostic("ls_augment_test",new FeatureSettings.PendingDiagnostic(context)),"diagnostic delivered");
        yes(expected.equals(context.sent.values.get("process")),"actual writer process: "+loaded+" / "+application);
    }
    public static void main(String[] args) throws Throwable {
        // Process.myUid deliberately throws in the stub: identity cannot be inferred from shared UID.
        writeAs("system",null,"system_server");
        writeAs("system", "com.android.settings", "com.android.settings");
        writeAs("system", "com.android.ztescreenshot", "com.android.ztescreenshot");
        writeAs("cn.nubia.gamelab", "", "cn.nubia.gamelab");
        writeAs(null, null, "unknown");
        writeAs("", "system", "system_server");
        FeatureSettings.rememberDiagnosticProcess("com.android.systemui");android.app.Application.fail=true;
        Context failedLookup=new Context();
        FeatureSettings.writeDiagnostic("ls_augment_test",new FeatureSettings.PendingDiagnostic(failedLookup));
        yes("com.android.systemui".equals(failedLookup.sent.values.get("process")),"API lookup failure retains loaded process");
        android.app.Application.fail=false;

        AugmentModule module=new AugmentModule();final int[] body={0};
        yes(OemHooks.methods(module,TestFeatureDiagnosticAdapters.class.getClassLoader(),Target.class.getName(),"call",
                int.class,0,"feature",chain->{body[0]++;return "changed";},null)==1,"actual adapter registered");
        Context owner=new Context();FeatureSettings.cachedSnapshot.values.put("feature","0");
        FeatureSettings.verifiedSnapshot=false;FeatureSettings.ownerLookups=0;
        Chain cold=new Chain(owner,false);
        yes("native".equals(module.callback.intercept(cold))&&cold.nativeCalls==1,"cold startup preserves native value");
        yes(FeatureSettings.ownerLookups==1&&FeatureSettings.remembered==owner,"cold startup still binds owner context");
        for(boolean enabled:new boolean[]{false,true,false,true}) {
            FeatureSettings.verifiedSnapshot=true;FeatureSettings.cachedAt=SystemClock.now-FeatureSettings.CACHE_MS;
            FeatureSettings.cachedSnapshot.values.put("feature",enabled?"1":"0");
            FeatureSettings.ownerLookups=FeatureSettings.refreshes=body[0]=0;
            Chain chain=new Chain(owner,!enabled);Object result=module.callback.intercept(chain);
            yes((enabled?"changed":"native").equals(result),"live cached adapter gate: "+enabled);
            yes(enabled?body[0]==1&&FeatureSettings.ownerLookups==1:body[0]==0&&FeatureSettings.ownerLookups==0,
                    "disabled fast path avoids reflection: "+enabled);
            yes(FeatureSettings.refreshes==1,"expired verified cache requests async replacement: "+enabled);
        }
        AugmentModule ungated=new AugmentModule();
        OemHooks.methods(ungated,TestFeatureDiagnosticAdapters.class.getClassLoader(),Target.class.getName(),"call",
                int.class,0,"",chain->"ungated",null);
        yes("ungated".equals(ungated.callback.intercept(new Chain(null,true))),"ungated bootstrap adapter filters before context");
        System.out.println("PASS production diagnostic process and disabled/cold/live adapters: "+checks+" checks");
    }
}
'''


def feature_harness():
    settings = (JAVA / "hook/FeatureSettings.java").read_text(encoding="utf-8")
    oem = (JAVA / "hook/OemHooks.java").read_text(encoding="utf-8")
    settings_members = "\n".join(member(settings, signature) for signature in (
        "static boolean verifiedDisabled", "static void rememberDiagnosticProcess",
        "private static String diagnosticProcess", "private static boolean writeDiagnostic",
        "private static void startupWriteFailure", "private static String diagnosticReason", "private static String safeDiagnosticKey"))
    signature = ("static int methods(AugmentModule module, ClassLoader loader, String className, String name,\n"
                 "            Class<?> returnType, int argc, String key, Hooker hooker, Class<?>[] parameterTypes)")
    oem_members = member(oem, signature) + "\n" + member(oem, "static Context context(Object owner,List<Object> args)")
    module = (JAVA / "hook/AugmentModule.java").read_text(encoding="utf-8")
    assert "FeatureSettings.rememberDiagnosticProcess(processName);" in member(module, "protected void onModuleLoadedAfterEarly"), "module load must publish real process"
    cache_ms = re.search(r"private static final long CACHE_MS\s*=\s*([^;]+);", settings).group(1)
    return (FEATURE_HARNESS.replace("// PRODUCTION_SETTINGS", settings_members).replace("// PRODUCTION_OEM", oem_members)
            .replace("PRODUCTION_CACHE_MS", cache_ms))

HARNESS = r'''
import ls.augment.com.DiagnosticEvidencePolicy;
import ls.augment.com.InventoryRetryPolicy;

public final class TestDiagnosticEvidencePolicy {
    private static int checks;
    private static void eq(Object expected, Object actual, String name) {
        checks++;
        if (!expected.equals(actual))
            throw new AssertionError(name + ": expected " + expected + ", got " + actual);
    }
    private static String classify(boolean matches, String version, int boot, int pid,
            boolean alive, long observed, long now, long received) {
        return DiagnosticEvidencePolicy.classify(matches, version, "test20496", boot, 7,
                pid, alive, observed, now, received);
    }
    private static boolean snapshot(String version, int pid, boolean alive, boolean loaded,
            long loadedElapsed, long nowElapsed, long receivedAt, long nowWall,
            int receivedBoot, int currentBoot) {
        return DiagnosticEvidencePolicy.currentProcessSnapshot(version, "test20496", pid, alive, loaded,
                loadedElapsed, nowElapsed, receivedAt, nowWall, receivedBoot, currentBoot);
    }
    public static void main(String[] args) {
        String current = "CURRENT_PROCESS_OBSERVATION";
        String older = "OLDER_OBSERVATION";
        String historical = "HISTORICAL";
        String unverified = "LEGACY_OR_UNVERIFIED";
        eq(current, classify(true, "test20496", 7, 321, true, 100_000, 120_000, 100_010), "fresh process observation");
        eq(unverified, classify(false, "test20496", 7, 321, true, 100_000, 120_000, 100_010), "different value digest");
        eq(unverified, classify(true, null, 7, 321, true, 100_000, 120_000, 100_010), "missing version");
        eq(unverified, classify(true, "", 7, 321, true, 100_000, 120_000, 100_010), "legacy version");
        eq(unverified, classify(true, "test20496", -1, 321, true, 100_000, 120_000, 100_010), "unknown saved boot");
        eq(unverified, DiagnosticEvidencePolicy.classify(true, "test20496", "test20496", 7, -1, 321, true,
                100_000, 120_000, 100_010), "unknown current boot");
        eq(unverified, classify(true, "test20496", 7, 0, true, 100_000, 120_000, 100_010), "missing pid");
        eq(unverified, classify(true, "test20496", 7, -1, true, 100_000, 120_000, 100_010), "legacy caller pid");
        eq(unverified, classify(true, "test20496", 7, 321, true, 0, 120_000, 100_010), "missing observation clock");
        eq(unverified, classify(true, "test20496", 7, 321, true, 100_000, 120_000, 0), "missing receipt clock");
        eq(historical, classify(true, "test20386", 7, 321, true, 100_000, 120_000, 100_010), "older module version");
        eq(historical, classify(true, "test20496", 6, 321, true, 100_000, 120_000, 100_010), "older boot");
        eq(historical, classify(true, "test20496", 7, 321, false, 100_000, 120_000, 100_010), "owner no longer alive");
        eq(historical, classify(true, "test20496", 7, 321, true, 120_001, 120_000, 120_001), "future observation");
        eq(historical, classify(true, "test20496", 7, 321, true, 100_000, 120_000, 120_001), "future receipt");
        eq(historical, classify(true, "test20496", 7, 321, true, 100_001, 120_000, 100_000), "observation after receipt");
        eq(current, classify(true, "test20496", 7, 321, true, 100_000, 159_999, 100_000), "59,999ms attribution age");
        eq(current, classify(true, "test20496", 7, 321, true, 100_000, 160_000, 100_000), "exact 60s attribution boundary");
        eq(older, classify(true, "test20496", 7, 321, true, 100_000, 160_001, 100_000), "60s plus 1ms attribution age");
        eq(older, classify(true, "test20496", 7, 321, true, 1, Long.MAX_VALUE, 1), "very old positive elapsed");

        eq(true, snapshot("test20496",321,true,true,10_000,30_000,1_000_000,1_025_000,7,7), "current loaded snapshot");
        eq(false, snapshot(null,321,true,true,10_000,30_000,1_000_000,1_025_000,7,7), "snapshot missing version");
        eq(false, snapshot("",321,true,true,10_000,30_000,1_000_000,1_025_000,7,7), "snapshot empty version");
        eq(false, snapshot("test20386",321,true,true,10_000,30_000,1_000_000,1_025_000,7,7), "snapshot older version");
        eq(false, snapshot("test20496",0,true,true,10_000,30_000,1_000_000,1_025_000,7,7), "snapshot zero pid");
        eq(false, snapshot("test20496",-1,true,true,10_000,30_000,1_000_000,1_025_000,7,7), "snapshot legacy pid");
        eq(false, snapshot("test20496",321,false,true,10_000,30_000,1_000_000,1_025_000,7,7), "snapshot process stopped or renamed");
        eq(false, snapshot("test20496",321,true,false,10_000,30_000,1_000_000,1_025_000,7,7), "snapshot missing moduleLoaded");
        eq(false, snapshot("test20496",321,true,true,0,30_000,1_000_000,1_025_000,7,7), "snapshot missing loaded elapsed");
        eq(false, snapshot("test20496",321,true,true,-1,30_000,1_000_000,1_025_000,7,7), "snapshot negative loaded elapsed");
        eq(false, snapshot("test20496",321,true,true,30_001,30_000,1_000_000,1_025_000,7,7), "snapshot future loaded elapsed");
        eq(false, snapshot("test20496",321,true,true,10_000,30_000,0,1_025_000,7,7), "snapshot missing receipt");
        eq(false, snapshot("test20496",321,true,true,10_000,30_000,-1,1_025_000,7,7), "snapshot negative receipt");
        eq(false, snapshot("test20496",321,true,true,10_000,30_000,1_025_001,1_025_000,7,7), "snapshot future receipt");
        eq(false, snapshot("test20496",321,true,true,10_000,30_000,1_000_000,1_025_000,-1,7), "snapshot missing boot remains unverified");
        eq(false, snapshot("test20496",321,true,true,10_000,30_000,1_000_000,1_025_000,7,-1), "snapshot current boot unavailable");
        eq(false, snapshot("test20496",321,true,true,10_000,30_000,1_000_000,1_025_000,6,7), "reboot with same version and reused pid");
        eq(true, snapshot("test20496",321,true,true,10_000,30_000,1_000_000,1_059_999,7,7), "snapshot 59,999ms receipt age");
        eq(false, snapshot("test20496",321,true,true,10_000,30_000,1_000_000,1_060_000,7,7), "snapshot exact 60s is stale");
        eq(false, snapshot("test20496",321,true,true,10_000,30_000,1_000_000,1_060_001,7,7), "snapshot over 60s is stale");
        eq(true, snapshot("test20496",321,true,true,10_000,30_000,1_023_000,1_025_000,7,7), "receipt during export remains valid");

        long[] delays = {1_000, 2_000, 4_000, 8_000, 15_000};
        for (int failure = 1; failure <= delays.length; failure++) {
            long delay = delays[failure - 1];
            eq(delay, InventoryRetryPolicy.delay(failure, 0), "retry backoff " + failure);
            eq(delay, InventoryRetryPolicy.delay(failure, 59_999 - delay), "retry below age boundary " + failure);
            eq(-1L, InventoryRetryPolicy.delay(failure, 60_000 - delay), "retry cannot reach 60s " + failure);
        }
        eq(-1L, InventoryRetryPolicy.delay(0, 0), "no failure");
        eq(-1L, InventoryRetryPolicy.delay(-1, 0), "negative failure");
        eq(-1L, InventoryRetryPolicy.delay(6, 0), "sixth failure stops");
        eq(-1L, InventoryRetryPolicy.delay(Integer.MAX_VALUE, 0), "failure overflow input stops");
        eq(-1L, InventoryRetryPolicy.delay(1, -1), "clock moved before captured observation");
        eq(-1L, InventoryRetryPolicy.delay(1, 60_000), "exact 60s retry boundary");
        eq(-1L, InventoryRetryPolicy.delay(1, 60_001), "stale inventory");
        eq(-1L, InventoryRetryPolicy.delay(1, Long.MAX_VALUE), "age overflow input stops");
        long age = 0;
        int retries = 0;
        for (int failure = 1; failure < 10; failure++) {
            long delay = InventoryRetryPolicy.delay(failure, age);
            if (delay < 0) break;
            retries++;
            age += delay;
        }
        eq(5, retries, "finite per-payload retry count");
        eq(30_000L, age, "backoff accumulation remains bounded");
        System.out.println("PASS diagnostic attribution and inventory retry policy: " + checks + " checks");
    }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", type=Path, help="JDK directory when java/javac are not on PATH")
    args = parser.parse_args()
    jdk = args.jdk or (Path(os.environ["JAVA_HOME"]) if os.environ.get("JAVA_HOME") else None)
    suffix = ".exe" if os.name == "nt" else ""
    javac = str(jdk / "bin" / ("javac" + suffix)) if jdk else shutil.which("javac")
    java = str(jdk / "bin" / ("java" + suffix)) if jdk else shutil.which("java")
    if not javac or not java:
        parser.error("A JDK is required; set JAVA_HOME or pass --jdk")
    with tempfile.TemporaryDirectory(prefix="duo-diagnostic-policy-") as name:
        directory = Path(name)
        harness = directory / "TestDiagnosticEvidencePolicy.java"
        harness.write_text(HARNESS, encoding="utf-8")
        inventory = directory / "TestInventoryRetryQueue.java"
        inventory.write_text(inventory_harness(), encoding="utf-8")
        feature = directory / "TestFeatureDiagnosticAdapters.java"
        feature.write_text(feature_harness(), encoding="utf-8")
        stubs = {
            "ls/augment/com/StartupDiagnostics.java": 'package ls.augment.com;public class StartupDiagnostics {public static void record(String event,String detail,Throwable error){}}',
            "android/app/Application.java": '''package android.app;public class Application {
public static String current;public static boolean fail;
public static String getProcessName(){if(fail)throw new RuntimeException("unavailable");return current;}}''',
            "android/os/Process.java": '''package android.os;public class Process {
public static int myUid(){throw new AssertionError("shared UID cannot identify process");}}''',
            "ls/augment/com/BuildConfig.java": '''package ls.augment.com;public class BuildConfig {
public static final String VERSION_NAME="test20496";}''',
        }
        stub_files = []
        for relative, source in stubs.items():
            stub = directory / relative
            stub.parent.mkdir(parents=True, exist_ok=True)
            stub.write_text(source, encoding="utf-8")
            stub_files.append(str(stub))
        subprocess.run([javac, "-encoding", "UTF-8", "-d", str(directory),
                        str(JAVA / "DiagnosticEvidencePolicy.java"),
                        str(JAVA / "InventoryRetryPolicy.java"), str(harness), str(inventory), str(feature),
                        *stub_files], check=True)
        subprocess.run([java, "-cp", str(directory), "TestDiagnosticEvidencePolicy"], check=True)
        subprocess.run([java, "-cp", str(directory), "TestInventoryRetryQueue"], check=True)
        subprocess.run([java, "-cp", str(directory), "TestFeatureDiagnosticAdapters"], check=True)


if __name__ == "__main__":
    main()
