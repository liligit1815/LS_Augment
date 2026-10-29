"""Run real FeatureSettings against blocked RemotePreferences/Provider doubles, without ADB."""
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FEATURE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/FeatureSettings.java'
source = FEATURE.read_text(encoding='utf-8')
assert 'Settings.Global.' not in source, 'Global settings configuration transport returned'
# Startup uses only the framework/private provider publication, never a root file.
assert 'BootConfigMirror' not in source
assert '/data/system' not in source
assert 'getRemotePreferences(RemoteConfig.GROUP)' in source
assert 'publishSnapshot(authoritative, true)' in source
constants = sorted(set(re.findall(r'ConfigSchema\.([A-Z][A-Z0-9_]+)', source)))

SOURCES = {
    # Layout policy is independently tested; this suite isolates transport/identity and writer timing.
    'ls/augment/com/StatusBarEditPolicy.java': '''package ls.augment.com;public final class StatusBarEditPolicy{public static StatusBarEditPolicy resolve(java.util.function.Function<String,String> values){return new StatusBarEditPolicy();}public String effective(String key,String value){return value;}}''',
    'ls/augment/com/StatusBarWorkspaceSpec.java': '''package ls.augment.com;public final class StatusBarWorkspaceSpec{public static final String ROWS="rows";public static String effectiveValue(String key,String value,String rows){return value;}}''',
    'ls/augment/com/StartupDiagnostics.java': '''package ls.augment.com;public final class StartupDiagnostics{public static final java.util.List<String> events=new java.util.concurrent.CopyOnWriteArrayList<>();public static void record(String s,String d,Throwable e){events.add(s+":"+d+(e==null?"":":"+e.getClass().getName()));}}''',
    'android/net/Uri.java': '''package android.net; public final class Uri { public final String value; private Uri(String v){value=v;} public static Uri parse(String v){return new Uri(v);} }''',
    'android/os/SystemClock.java': '''package android.os; public final class SystemClock { public static volatile long offset; public static long elapsedRealtime(){return System.nanoTime()/1000000+offset;} }''',
    'android/os/UserHandle.java': '''package android.os;public final class UserHandle {public final int id;private UserHandle(int id){this.id=id;}public static UserHandle getUserHandleForUid(int uid){return new UserHandle(uid/100000);}public boolean equals(Object o){return o instanceof UserHandle&&((UserHandle)o).id==id;}public int hashCode(){return id;}}''',
    'android/os/UserManager.java': '''package android.os;import java.util.concurrent.*;import java.util.concurrent.atomic.*;public final class UserManager {public static final ConcurrentHashMap<Integer,Long> serials=new ConcurrentHashMap<>();public static final AtomicInteger calls=new AtomicInteger(),wrongThread=new AtomicInteger();public static volatile boolean unavailable;public static volatile CountDownLatch gate=new CountDownLatch(0),entered=new CountDownLatch(1);private void io(){calls.incrementAndGet();if(!Thread.currentThread().getName().equals("LSA-ConfigReader"))wrongThread.incrementAndGet();entered.countDown();try{if(!gate.await(5,TimeUnit.SECONDS))throw new AssertionError("identity double timeout");}catch(InterruptedException e){throw new AssertionError(e);}if(unavailable)throw new IllegalStateException("identity unavailable");}public long getSerialNumberForUser(UserHandle user){io();return serials.getOrDefault(user.id,-1L);}public UserHandle getUserForSerialNumber(long serial){io();for(java.util.Map.Entry<Integer,Long> e:serials.entrySet())if(e.getValue()==serial)return UserHandle.getUserHandleForUid(Math.multiplyExact(e.getKey(),100000));return null;}}''',
    'android/os/Process.java': '''package android.os; public final class Process {public static final int SYSTEM_UID=1000;public static int uid=20000;public static int myUid(){return uid;}public static int myPid(){return 12345;}}''',
    'android/app/ActivityThread.java': '''package android.app;public final class ActivityThread {private static final ActivityThread THREAD=new ActivityThread();public static Application application;public static int systemContextReads;public static Application currentApplication(){return application;}public static ActivityThread currentActivityThread(){return THREAD;}public android.content.Context getSystemContext(){systemContextReads++;return new android.content.Context();}}''',
    'android/os/Looper.java': '''package android.os; public final class Looper { private static final Looper MAIN=new Looper(); public static Looper getMainLooper(){return MAIN;} }''',
    'android/os/Handler.java': '''package android.os; import java.util.concurrent.*; public final class Handler { private static final ScheduledExecutorService MAIN=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"TestMain");t.setDaemon(true);return t;}); public Handler(Looper l){} public boolean post(Runnable r){MAIN.execute(r);return true;}public boolean postDelayed(Runnable r,long delay){MAIN.schedule(r,delay,TimeUnit.MILLISECONDS);return true;} }''',
    'android/os/Bundle.java': '''package android.os; import java.util.*; public final class Bundle { private final Map<String,Object> m=new HashMap<>(); public void putString(String k,String v){m.put(k,v);} public void putInt(String k,int v){m.put(k,v);} public void putLong(String k,long v){m.put(k,v);} public void putBoolean(String k,boolean v){m.put(k,v);} public String getString(String k){return getString(k,null);} public String getString(String k,String f){Object v=m.get(k);return v instanceof String?(String)v:f;} public int getInt(String k,int f){Object v=m.get(k);return v instanceof Integer?(Integer)v:f;} public long getLong(String k,long f){Object v=m.get(k);return v instanceof Long?(Long)v:f;} public boolean getBoolean(String k,boolean f){Object v=m.get(k);return v instanceof Boolean?(Boolean)v:f;} }''',
    'android/database/ContentObserver.java': '''package android.database; import android.os.Handler; public class ContentObserver { public ContentObserver(Handler h){} public void onChange(boolean self){} }''',
    'android/content/ContentResolver.java': '''package android.content; import android.net.Uri;import android.os.Bundle;import android.database.ContentObserver;public abstract class ContentResolver { public abstract Bundle call(Uri u,String method,String key,Bundle extras);public abstract String getGlobal(String key);public abstract boolean putGlobal(String key,String value);public abstract void registerContentObserver(Uri u,boolean descendants,ContentObserver o);public void unregisterContentObserver(ContentObserver o){} }''',
    'android/content/Context.java': '''package android.content;public class Context {private ContentResolver resolver;private String packageName="test.other";public Context(){}public Context(ContentResolver r){resolver=r;}public Context(ContentResolver r,String pkg){resolver=r;packageName=pkg;}public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}public String getPackageName(){return packageName;}public <T>T getSystemService(Class<T> type){return type.cast(new android.os.UserManager());} }''',
    'android/app/Application.java': '''package android.app; public class Application extends android.content.Context {public static String getProcessName(){return "test.fixture";}}''',
    'android/util/Log.java': '''package android.util;public final class Log {public static String getStackTraceString(Throwable error){return error.toString();}}''',
    'org/json/JSONObject.java': '''package org.json;public final class JSONObject {private final java.util.Map<?,?> values;public JSONObject(java.util.Map<?,?> values){this.values=values;}public String toString(){return values.toString();}}''',
    'android/content/SharedPreferences.java': '''package android.content;public interface SharedPreferences {java.util.Map<String,?> getAll();void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l);default void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){}interface OnSharedPreferenceChangeListener {void onSharedPreferenceChanged(SharedPreferences p,String key);}}''',
    'io/github/libxposed/api/XposedInterface.java': '''package io.github.libxposed.api;public interface XposedInterface {long PROP_CAP_REMOTE=1L;long getFrameworkProperties();android.content.SharedPreferences getRemotePreferences(String name);interface Hooker {Object intercept(Chain chain)throws Throwable;}interface Chain {Object proceed()throws Throwable;Object getThisObject();java.util.List<Object> getArgs();}interface HookHandle {}interface HookBuilder {HookHandle intercept(Hooker hooker);}}''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.*;final class AugmentModule {final Map<Method,Hooker> hooks=new HashMap<>();HookBuilder prepareFeatureHook(Method target,String id,boolean protect){return h->{hooks.put(target,h);return new HookHandle(){};};}void registerFeatureHook(HookHandle handle){}void logFeatureError(String message,Throwable error){throw new AssertionError(message,error);}}''',
    'ls/augment/com/hook/OemHooks.java': (ROOT / 'android/app/src/main/java/ls/augment/com/hook/OemHooks.java').read_text(encoding='utf-8'),
    'ls/augment/com/BuildConfig.java': '''package ls.augment.com;public final class BuildConfig {public static final int VERSION_CODE=20497;public static final String VERSION_NAME="fixture-test20497";}''',
    'ls/augment/com/RemoteConfig.java': (ROOT / 'android/app/src/main/java/ls/augment/com/RemoteConfig.java').read_text(encoding='utf-8'),
    'ls/augment/com/HideTargetCodec.java': (ROOT / 'android/app/src/main/java/ls/augment/com/HideTargetCodec.java').read_text(encoding='utf-8'),
    'ls/augment/com/HideUserIdentity.java': (ROOT / 'android/app/src/main/java/ls/augment/com/HideUserIdentity.java').read_text(encoding='utf-8'),
    'ls/augment/com/hook/SettingsTargetMatcher.java': (ROOT / 'android/app/src/main/java/ls/augment/com/hook/SettingsTargetMatcher.java').read_text(encoding='utf-8'),
    'ls/augment/com/hook/SettingsEntryBindings.java': (ROOT / 'android/app/src/main/java/ls/augment/com/hook/SettingsEntryBindings.java').read_text(encoding='utf-8'),
    'ls/augment/com/hook/TestSettingsTargetMatcher.java': (ROOT / 'tools/TestSettingsTargetMatcher.java').read_text(encoding='utf-8'),
    'ls/augment/com/ConfigSchema.java': 'package ls.augment.com; public final class ConfigSchema {' + ''.join(f'public static final String {key}="{key}";' for key in constants) + 'public static boolean isRuntimeKey(String key){return "flag".equals(key);}public static boolean truthy(String value){return "1".equals(value)||"true".equalsIgnoreCase(value)||"yes".equalsIgnoreCase(value)||"on".equalsIgnoreCase(value);} }',
    'ls/augment/com/ConfigSnapshot.java': '''package ls.augment.com; public final class ConfigSnapshot {public final int schemaVersion=1;public final String scope="device",checksum;public final long revision,updatedAt;private final String flag;private ConfigSnapshot(long r,String f,long t){revision=r;updatedAt=t;flag=f;checksum=r+":"+f+(t==r?"":":"+t);}public static ConfigSnapshot parse(String raw){if(raw==null)return null;String[] p=raw.split(":");long r=Long.parseLong(p[0]);return new ConfigSnapshot(r,p[1],p.length>2?Long.parseLong(p[2]):r);}public static final class ParseResult{public final ConfigSnapshot snapshot;public final String error;ParseResult(ConfigSnapshot s){snapshot=s;error=s==null?"invalid":"";}}public static ParseResult parseDetailed(String raw){return new ParseResult(parse(raw));}public static ConfigSnapshot safeDefaults(){return parse("1:0");}public String get(String key){return flag;} }''',
    'ls/augment/com/hook/HookTelemetry.java': '''package ls.augment.com.hook;final class HookTelemetry {static void event(String message){} }''',
    'ls/augment/com/hook/FeatureSettings.java': source,
    'ls/augment/com/hook/TestFeatureSettingsAsync.java': r'''
package ls.augment.com.hook;
import android.content.*;import android.net.Uri;import android.os.Bundle;import android.database.ContentObserver;
import ls.augment.com.*;import java.lang.reflect.Field;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public final class TestFeatureSettingsAsync {
    static final CountDownLatch REMOTE_GATE=new CountDownLatch(1),REMOTE_ENTERED=new CountDownLatch(1),WRITE_GATE=new CountDownLatch(1);
    static volatile CountDownLatch providerGate=new CountDownLatch(1),providerEntered=new CountDownLatch(1);
    static volatile String providerValue="3:0";
    static volatile String remoteValue="2:1";
    static volatile String providerHidden="999:com.private.app";
    static volatile String remoteHidden="0:com.stale.app";
    static volatile boolean badMetadata, runtimeUnavailable, runtimeThrows;
    static final ConcurrentHashMap<String,String> writes=new ConcurrentHashMap<>();
    static final ConcurrentHashMap<String,Long> writtenObserved=new ConcurrentHashMap<>();
    static final AtomicInteger rapidRouteCalls=new AtomicInteger();
    static final ConcurrentHashMap<String,AtomicInteger> diagnosticCalls=new ConcurrentHashMap<>();
    static volatile String failedDiagnosticKey,failedDiagnosticValue;
    static volatile String rejectedDiagnosticKey;
    static volatile String rejectionReason="invalid";
    static volatile boolean rejectionRetryable;
    static volatile String throttledDiagnosticKey;
    static volatile long throttledUntil;
    static volatile CountDownLatch thirdFailureEntered,thirdFailureRelease;
    static volatile CountDownLatch homeFailureEntered,homeFailureRelease;
    static final AtomicInteger diagnosticFailures=new AtomicInteger();
    static final List<String> observed=Collections.synchronizedList(new ArrayList<>());
    static final AtomicInteger wrongThread=new AtomicInteger();
    static final AtomicInteger providerSnapshotCalls=new AtomicInteger(), snapshotOutages=new AtomicInteger(), observerRegistrations=new AtomicInteger();
    static void io(){String n=Thread.currentThread().getName();if(!n.equals("LSA-ConfigReader")&&!n.equals("LSA-ConfigWriter"))wrongThread.incrementAndGet();}
    static void await(CountDownLatch gate){try{if(!gate.await(5,TimeUnit.SECONDS))throw new AssertionError("blocked test double timed out");}catch(InterruptedException e){throw new AssertionError(e);}}
    static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    interface Condition{boolean get();}
    static void until(Condition condition){long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);while(!condition.get()){if(System.nanoTime()>end)throw new AssertionError("condition timed out; observed="+observed);try{Thread.sleep(5);}catch(InterruptedException e){throw new AssertionError(e);}}}
    static final class Remote implements SharedPreferences {
        int registrations, removals;volatile boolean failing;OnSharedPreferenceChangeListener listener;
        public Map<String,?> getAll(){io();REMOTE_ENTERED.countDown();await(REMOTE_GATE);if(failing)throw new IllegalStateException("dead remote");return Map.of(RemoteConfig.SNAPSHOT,remoteValue,RemoteConfig.HIDDEN,remoteHidden);}
        public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){io();registrations++;listener=l;}
        public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){io();if(listener==l){removals++;listener=null;}}
        void changed(){listener.onSharedPreferenceChanged(this,RemoteConfig.SNAPSHOT);}
    }
    static final class Framework implements io.github.libxposed.api.XposedInterface {
        final Remote remote=new Remote();int connections;boolean remoteSupported=true;
        public long getFrameworkProperties(){io();return remoteSupported?PROP_CAP_REMOTE:0;}
        public SharedPreferences getRemotePreferences(String name){io();check(name.equals(RemoteConfig.GROUP),"wrong framework preference group");connections++;return remote;}
    }
    static final class Resolver extends ContentResolver {
        public Bundle call(Uri uri,String method,String key,Bundle extras){io();
            if(method.equals("snapshot")){providerSnapshotCalls.incrementAndGet();if(snapshotOutages.getAndUpdate(n->Math.max(0,n-1))>0)throw new IllegalArgumentException("Unknown authority ls.augment.com.config");providerEntered.countDown();await(providerGate);ConfigSnapshot s=ConfigSnapshot.parse(providerValue);Bundle out=new Bundle();out.putBoolean("ok",true);out.putString("snapshot",providerValue);out.putInt("schemaVersion",1);out.putLong("revision",s.revision);out.putLong("updatedAt",s.updatedAt);out.putString("scope","device");out.putString("checksum",badMetadata?"invalid":s.checksum);return out;}
            if(method.equals("runtime_snapshot")){if(runtimeThrows)throw new IllegalArgumentException("Unknown authority ls.augment.com.config");Bundle out=new Bundle();out.putBoolean("ok",!runtimeUnavailable);out.putString(RemoteConfig.HIDDEN,providerHidden);return out;}
            if(method.equals("diagnostic")){
                await(WRITE_GATE);diagnosticCalls.computeIfAbsent(key,k->new AtomicInteger()).incrementAndGet();
                String value=extras.getString("value");
                if(key.equals(rejectedDiagnosticKey)){
                    Bundle out=new Bundle();out.putBoolean("ok",false);out.putString("reason",rejectionReason);
                    out.putBoolean("retryable",rejectionRetryable);return out;
                }
                if(key.equals(throttledDiagnosticKey)&&android.os.SystemClock.elapsedRealtime()<throttledUntil){
                    Bundle out=new Bundle();out.putBoolean("ok",false);
                    out.putLong("retryAfterMs",throttledUntil-android.os.SystemClock.elapsedRealtime());return out;
                }
                if(key.equals(failedDiagnosticKey)&&value.equals(failedDiagnosticValue)){
                    if(homeFailureEntered!=null){homeFailureEntered.countDown();await(homeFailureRelease);}
                    if(diagnosticFailures.incrementAndGet()==3&&thirdFailureEntered!=null){thirdFailureEntered.countDown();await(thirdFailureRelease);}
                    throw new IllegalStateException("Provider not ready during boot");
                }
                writtenObserved.put(key,extras.getLong("observedElapsed",-1));writes.put(key,value);Bundle out=new Bundle();out.putBoolean("ok",true);return out;
            }
            if(method.equals("rapid_route")){rapidRouteCalls.incrementAndGet();return new Bundle();}
            if(method.equals("diagnostic_get")){Bundle out=new Bundle();out.putString("value",writes.getOrDefault(key,""));return out;}
            return new Bundle();
        }
        public String getGlobal(String key){throw new AssertionError("Global configuration read returned");}
        public boolean putGlobal(String k,String v){throw new AssertionError("Global configuration write returned");}
        public void registerContentObserver(Uri u,boolean d,ContentObserver o){io();observerRegistrations.incrementAndGet();}
    }
    static void readerIdle()throws Exception {
        Field field=FeatureSettings.class.getDeclaredField("refreshPending");field.setAccessible(true);
        AtomicBoolean pending=(AtomicBoolean)field.get(null);until(()->!pending.get());
    }
    static void pauseProvider(String mirror,String authority)throws Exception {
        readerIdle();remoteValue=mirror;providerValue=authority;
        providerGate=new CountDownLatch(1);providerEntered=new CountDownLatch(1);
        FeatureSettings.invalidateSnapshot();await(providerEntered);
    }
    static void finishProvider()throws Exception {providerGate.countDown();readerIdle();}
    static void readersStayDisabled(Context context)throws Exception {
        ExecutorService readers=Executors.newFixedThreadPool(4);
        try {
            List<Future<?>> results=new ArrayList<>();
            for(int i=0;i<4;i++)results.add(readers.submit(()->{
                for(int n=0;n<1000;n++)check(!FeatureSettings.enabled(context,"flag"),"pre-reset mirror re-enabled the old feature");
            }));
            for(Future<?> result:results)result.get(2,TimeUnit.SECONDS);
        } finally {readers.shutdownNow();}
    }
    static boolean hidden(Context context,int user,String pkg) {
        return SettingsTargetMatcher.matches(FeatureSettings.hiddenTargets(context),user,pkg);
    }
    static void refresh()throws Exception {FeatureSettings.invalidateSnapshot();readerIdle();}
    static void hiddenBindings()throws Exception {
        android.os.UserManager.serials.put(0,0L);android.os.UserManager.serials.put(999,42L);
        remoteHidden="v3:0:0:com.remote.app";providerHidden="v3:999:42:com.private.app";
        providerValue="3:1";runtimeUnavailable=true;WRITE_GATE.countDown();
        Framework framework=new Framework();FeatureSettings.attachFramework(framework);await(REMOTE_ENTERED);
        check(FeatureSettings.hiddenTargets(null).isEmpty(),"context-free mirror authorized filtering");
        check(android.os.UserManager.calls.get()==0,"context-free read queried user identity");
        Context context=new Context(new Resolver(),"com.android.settings");
        check(FeatureSettings.hiddenTargets(context).isEmpty(),"unverified startup mirror authorized filtering");
        FeatureSettings.invalidateSnapshot();
        REMOTE_GATE.countDown();await(providerEntered);
        until(()->hidden(context,0,"com.remote.app"));
        check(!hidden(context,999,"com.remote.app"),"early remote lookup crossed users");
        providerGate.countDown();readerIdle();
        for(String invalid:new String[]{"0:com.remote.app","p3:0:0:com.remote.app","v4:0:0:com.remote.app"}) {
            remoteHidden=invalid;refresh();check(FeatureSettings.hiddenTargets(context).isEmpty(),"unverified remote payload authorized filtering");
        }
        remoteHidden="v3:0:0:com.remote.app";refresh();
        check(hidden(context,0,"com.remote.app"),"correct remote binding did not recover after rejected payload");
        runtimeUnavailable=false;refresh();
        check(hidden(context,999,"com.private.app")&&!hidden(context,0,"com.remote.app"),"Provider runtime did not replace remote candidates");
        Set<String> first=FeatureSettings.hiddenTargets(context);
        boolean immutable=false;try{first.add("0:com.injected.app");}catch(UnsupportedOperationException expected){immutable=true;}
        check(immutable,"worker publication is mutable");
        android.os.UserManager.serials.put(999,43L);refresh();
        check(!hidden(context,999,"com.private.app"),"same raw retained authorization after user number reuse");
        android.os.UserManager.serials.put(999,42L);refresh();
        check(hidden(context,999,"com.private.app"),"same candidates could not be verified again");
        android.os.UserManager.unavailable=true;refresh();
        check(!hidden(context,999,"com.private.app"),"failed identity read retained old authorization");
        android.os.UserManager.unavailable=false;refresh();
        check(hidden(context,999,"com.private.app"),"identity retry lost preserved candidates");
        android.os.UserManager.serials.remove(999);refresh();
        check(!hidden(context,999,"com.private.app"),"removed user retained old authorization");
        android.os.UserManager.serials.put(999,42L);
        for(String invalid:new String[]{"999:com.private.app","p3:999:42:com.private.app","v4:999:42:com.private.app","v3:999:42:com.private.app;broken"}) {
            providerHidden=invalid;refresh();check(FeatureSettings.hiddenTargets(context).isEmpty(),"legacy/pending/unknown/invalid runtime authorized filtering");
        }
        providerHidden="v3:999:42:com.private.app";refresh();
        check(hidden(context,999,"com.private.app"),"correct bound runtime stopped filtering");
        // Provider failure must keep its candidate authority, but recheck identity.
        runtimeUnavailable=true;remoteHidden="v3:0:0:com.remote.app";
        android.os.UserManager.serials.put(999,43L);refresh();
        check(FeatureSettings.hiddenTargets(context).isEmpty(),"Provider failure reused stale serial or adopted remote candidates");
        android.os.UserManager.serials.put(999,42L);refresh();
        check(hidden(context,999,"com.private.app")&&!hidden(context,0,"com.remote.app"),"retained private candidates lost authority during retry");
        runtimeUnavailable=false;
        remoteValue="4:0";providerValue="4:0";refresh();
        check(FeatureSettings.hiddenTargets(context).isEmpty(),"master-off retained filtering");
        int offCalls=android.os.UserManager.calls.get();refresh();
        check(android.os.UserManager.calls.get()==offCalls,"master-off refresh queried user identity");
        android.os.UserManager.serials.put(999,43L);remoteValue="5:1";providerValue="5:1";refresh();
        check(FeatureSettings.hiddenTargets(context).isEmpty(),"master re-enable reused pre-disable authorization");
        android.os.UserManager.serials.put(999,42L);refresh();
        check(hidden(context,999,"com.private.app"),"master re-enable did not recover verified targets");
        android.os.UserManager.gate=new CountDownLatch(1);android.os.UserManager.entered=new CountDownLatch(1);
        FeatureSettings.invalidateSnapshot();await(android.os.UserManager.entered);
        android.os.SystemClock.offset+=10_001L;
        long start=System.nanoTime();for(int i=0;i<1000;i++)check(FeatureSettings.hiddenTargets(context).isEmpty(),"expired publication retained filtering");
        check(System.nanoTime()-start<TimeUnit.SECONDS.toNanos(1),"hot reader waited for blocked identity service");
        android.os.UserManager.gate.countDown();readerIdle();
        // Simulate a separate process: a healthy Settings context must not be
        // replaced merely because one callback supplies another package context.
        Field retained=FeatureSettings.class.getDeclaredField("applicationContext");retained.setAccessible(true);retained.set(null,null);
        Context other=new Context(new Resolver(),"com.android.systemui");FeatureSettings.hiddenTargets(other);refresh();
        int otherCalls=android.os.UserManager.calls.get();refresh();
        check(android.os.UserManager.calls.get()==otherCalls&&FeatureSettings.hiddenTargets(other).isEmpty(),"non-Settings process acquired identity IPC or filtering");
        check(android.os.UserManager.wrongThread.get()==0&&wrongThread.get()==0,"identity or provider IPC ran on a hot reader");
        System.out.println("FeatureSettings hidden binding: startup/remote/Provider, same-raw reuse, missing/failing identity, retry, invalid legacy/pending payloads, immutable publication, master toggles, authority, expiry and Settings-only worker checks passed (1000 blocked hot reads)");
    }
    static Map<?,?> internalMap(String name)throws Exception {
        Field field=FeatureSettings.class.getDeclaredField(name);field.setAccessible(true);return (Map<?,?>)field.get(null);
    }
    static void writerTask(Runnable task)throws Exception {
        Field worker=FeatureSettings.class.getDeclaredField("WRITE_WORKER");worker.setAccessible(true);
        ((ScheduledExecutorService)worker.get(null)).submit(task).get(3,TimeUnit.SECONDS);
    }
    static void drainNow()throws Exception {
        java.lang.reflect.Method drain=FeatureSettings.class.getDeclaredMethod("drainWrites");drain.setAccessible(true);
        writerTask(()->{try{drain.invoke(null);}catch(Exception error){throw new AssertionError(error);}});
    }
    static long observed(Object pending)throws Exception {
        Field field=pending.getClass().getDeclaredField("observedElapsed");field.setAccessible(true);return field.getLong(pending);
    }
    static void expireOld(String key,Object old)throws Exception {
        java.lang.reflect.Method expire=FeatureSettings.class.getDeclaredMethod("expireDiagnostic",String.class,old.getClass());expire.setAccessible(true);
        writerTask(()->{try{expire.invoke(null,key,old);}catch(Exception error){throw new AssertionError(error);}});
    }
    static void diagnosticRetry()throws Exception {
        WRITE_GATE.countDown();providerGate.countDown();
        Context context=new Context(new Resolver());
        String key="ls_augment_launcher_grid_runtime";
        String descriptor="phase=applied|revision=7|rows=8|columns=6";
        failedDiagnosticKey=key;failedDiagnosticValue=descriptor;
        FeatureSettings.diagnostic(context,key,descriptor);
        Map<?,?> pending=internalMap("DIAGNOSTICS"),cached=internalMap("DIAGNOSTIC_VALUES");
        Object first=pending.get(key);long firstObserved=observed(first);
        until(()->diagnosticFailures.get()>=1);
        FeatureSettings.recordRapidRoute(context,"session","up",1,2);
        // Execute the real writer after a 20-second monotonic outage. The clock
        // is advanced instead of making the offline regression sleep 20 seconds.
        android.os.SystemClock.offset+=20_000L;drainNow();
        check(pending.containsKey(key)&&descriptor.equals(cached.get(key))&&!writes.containsKey(key),"20-second Provider outage discarded pending complete grid state");
        check(android.os.SystemClock.elapsedRealtime()-firstObserved>=20_000L,"outage regression did not cover fifteen seconds");
        failedDiagnosticKey=null;android.os.SystemClock.offset+=31_000L;drainNow();
        check(descriptor.equals(writes.get(key))&&writtenObserved.get(key)==firstObserved,"recovery did not deliver original observation/generation");
        check(rapidRouteCalls.get()==1,"diagnostic retries replayed a functional route call");
        int publishedCalls=diagnosticCalls.get(key).get();
        FeatureSettings.diagnostic(context,key,descriptor);Thread.sleep(350);
        check(diagnosticCalls.get(key).get()==publishedCalls,"successful observation no longer deduplicates");

        String expiredKey="ls_augment_expired_witness";failedDiagnosticKey=expiredKey;failedDiagnosticValue="ready";diagnosticFailures.set(0);
        FeatureSettings.diagnostic(context,expiredKey,"ready");Object expired=pending.get(expiredKey);
        until(()->diagnosticFailures.get()>=1);android.os.SystemClock.offset+=300_001L;drainNow();
        check(!pending.containsKey(expiredKey)&&!cached.containsKey(expiredKey),"expired undelivered value stayed queued or permanently deduplicated");
        check(FeatureSettings.diagnosticWriterState().contains("expired=1")&&FeatureSettings.diagnosticWriterState().contains("lastDropReason=retry_window_expired"),"retry-window loss has no local explicit evidence");
        failedDiagnosticKey=null;FeatureSettings.diagnostic(context,expiredKey,"ready");until(()->"ready".equals(writes.get(expiredKey)));

        // An older in-flight failure cannot erase a newer queued generation.
        final String replacementKey="ls_augment_tgk_rapid_fire_installed";
        failedDiagnosticKey=replacementKey;failedDiagnosticValue="old";diagnosticFailures.set(0);
        thirdFailureEntered=new CountDownLatch(1);thirdFailureRelease=new CountDownLatch(1);
        FeatureSettings.diagnostic(context,replacementKey,"old");await(thirdFailureEntered);Object old=pending.get(replacementKey);
        FeatureSettings.diagnostic(context,replacementKey,"new");thirdFailureRelease.countDown();
        until(()->"new".equals(writes.get(replacementKey)));
        expireOld(replacementKey,old);
        check("new".equals(cached.get(replacementKey)),"failed/expired older observation evicted replacement cache");

        // Returning to the original text still owns a different pending object.
        final String abaKey="ls_augment_generation_aba";failedDiagnosticKey=abaKey;failedDiagnosticValue="old";diagnosticFailures.set(0);
        thirdFailureEntered=new CountDownLatch(1);thirdFailureRelease=new CountDownLatch(1);
        FeatureSettings.diagnostic(context,abaKey,"old");await(thirdFailureEntered);Object abaOld=pending.get(abaKey);
        FeatureSettings.diagnostic(context,abaKey,"middle");FeatureSettings.diagnostic(context,abaKey,"old");Object abaNew=pending.get(abaKey);
        check(abaNew!=abaOld,"same text rebound to obsolete pending generation");failedDiagnosticKey=null;thirdFailureRelease.countDown();
        expireOld(abaKey,abaOld);until(()->"old".equals(writes.get(abaKey)));
        check("old".equals(cached.get(abaKey))&&writtenObserved.get(abaKey)==observed(abaNew),"obsolete expiry removed/replaced same-text newer generation");

        throttledDiagnosticKey="ls_augment_throttled_witness";
        throttledUntil=android.os.SystemClock.elapsedRealtime()+1400;
        FeatureSettings.diagnostic(context,throttledDiagnosticKey,"ready");
        until(()->diagnosticCalls.containsKey(throttledDiagnosticKey));Thread.sleep(350);
        check(diagnosticCalls.get(throttledDiagnosticKey).get()==1,"throttled diagnostic repeatedly called Provider");
        check(pending.containsKey(throttledDiagnosticKey),"rate limit discarded observation");
        FeatureSettings.diagnostic(context,"ls_augment_unthrottled","other");
        until(()->"other".equals(writes.get("ls_augment_unthrottled")));
        until(()->"ready".equals(writes.get(throttledDiagnosticKey)));
        check(diagnosticCalls.get(throttledDiagnosticKey).get()==2,"throttled observation did not recover once");
        rejectedDiagnosticKey="ls_augment_terminal_witness";
        FeatureSettings.diagnostic(context,rejectedDiagnosticKey,"private payload never in writer state");
        until(()->FeatureSettings.diagnosticWriterState().contains("rejected=1"));
        check(!pending.containsKey(rejectedDiagnosticKey)&&!writes.containsKey(rejectedDiagnosticKey),"permanent rejection was accepted or left retrying");
        String rejectedState=FeatureSettings.diagnosticWriterState();
        check(rejectedState.contains("lastFailureKey="+rejectedDiagnosticKey)&&rejectedState.contains("lastFailureReason=invalid")&&rejectedState.contains("lastDropReason=provider_terminal"),"permanent rejection lost safe key/reason evidence");
        check(!rejectedState.contains("private payload"),"writer diagnostics leaked rejected value");
        int calls=diagnosticCalls.get(rejectedDiagnosticKey).get();android.os.SystemClock.offset+=300_001L;drainNow();
        check(diagnosticCalls.get(rejectedDiagnosticKey).get()==calls,"permanent rejection retried for five minutes");
        rejectedDiagnosticKey="ls_augment_capacity_witness";rejectionReason="full";rejectionRetryable=true;
        FeatureSettings.diagnostic(context,rejectedDiagnosticKey,"recoverable");until(()->diagnosticCalls.containsKey(rejectedDiagnosticKey));
        check(pending.containsKey(rejectedDiagnosticKey)&&!writes.containsKey(rejectedDiagnosticKey),"storage capacity failure was silently accepted or discarded");
        String fullKey=rejectedDiagnosticKey;rejectedDiagnosticKey=null;android.os.SystemClock.offset+=31_000L;drainNow();
        check("recoverable".equals(writes.get(fullKey)),"capacity failure did not recover with original value");
        check(wrongThread.get()==0,"retry performed Provider I/O on the caller thread");
        check(ls.augment.com.StartupDiagnostics.events.stream().anyMatch(s->s.startsWith("LAST_VALUE_DELIVERY_FAILED:"))
                &&ls.augment.com.StartupDiagnostics.events.stream().anyMatch(s->s.startsWith("LAST_VALUE_DELIVERY_ACCEPTED:")),"real writer failures and later acceptance are independently observable");
        System.out.println("PASS FeatureSettings real writer: >15s outage recovery, five-minute expiry/drop evidence, original observation time, newer/ABA generations, deduplication, quota backoff and no functional replay");
    }
    static void diagnosticQueueFull()throws Exception {
        providerGate.countDown();Context context=new Context(new Resolver());
        FeatureSettings.diagnostic(context,"ls_augment_block_writer","ready");
        Map<?,?> pending=internalMap("DIAGNOSTICS"),cached=internalMap("DIAGNOSTIC_VALUES");
        Object sample=pending.get("ls_augment_block_writer");java.lang.reflect.Constructor<?> constructor=sample.getClass().getDeclaredConstructor(Context.class,String.class,boolean.class);constructor.setAccessible(true);
        @SuppressWarnings("unchecked") Map<String,Object> raw=(Map<String,Object>)pending;
        int fake=0;while(raw.size()<512)raw.put("ls_augment_fake_"+fake++,constructor.newInstance(context,"ready",false));
        String rejected="ls_augment_queue_overflow";FeatureSettings.diagnostic(context,rejected,"ready");
        check(!pending.containsKey(rejected)&&!cached.containsKey(rejected),"full queue permanently deduplicated value that was never admitted");
        check(FeatureSettings.diagnosticWriterState().contains("queueFull=")&&!FeatureSettings.diagnosticWriterState().contains("queueFull=0"),"full queue has no visible counter");
        for(int index=0;index<fake;index++)raw.remove("ls_augment_fake_"+index);
        WRITE_GATE.countDown();FeatureSettings.diagnostic(context,rejected,"ready");until(()->"ready".equals(writes.get(rejected)));
        check(wrongThread.get()==0,"queue recovery performed IPC on caller");
        System.out.println("PASS FeatureSettings full queue is bounded, visible, and permits re-submitting the same unadmitted value");
    }
    static long pendingLong(Object pending,String name)throws Exception {Field f=pending.getClass().getDeclaredField(name);f.setAccessible(true);return f.getLong(pending);}
    static void homeReadinessPriority()throws Exception {
        WRITE_GATE.countDown();providerGate.countDown();Context context=new Context(new Resolver());
        String key="ls_augment_atomic_home_readiness_88";
        String old="HR1|20567|88|unique-88|72|1000|false|false|false||1000|0|0|1000000000";
        String fresh="HR1|20567|88|unique-88|72|1001|true|true|true||1000|1001|1001|1000000000";
        FeatureSettings.diagnosticHomeReadiness(context,key,old);Thread.sleep(40);
        check(!diagnosticCalls.containsKey(key),"non-system host accessed HR1 priority lane");
        android.os.Process.uid=1000;
        FeatureSettings.diagnosticHomeReadiness(context,"ls_augment_other",old);
        FeatureSettings.diagnosticHomeReadiness(context,key,"unverified");
        check(internalMap("DIAGNOSTICS").isEmpty(),"priority lane admitted unrelated keys or untyped state");
        long start=System.nanoTime();FeatureSettings.diagnosticHomeReadiness(context,key,old);FeatureSettings.diagnosticHomeReadiness(context,key,fresh);
        until(()->fresh.equals(writes.get(key)));
        check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-start)<200,"HR1 retained the ordinary 250ms delivery delay");
        check(diagnosticCalls.get(key).get()==1,"rapid HR1 observations did not coalesce to latest state");
        FeatureSettings.diagnosticHomeReadiness(context,key,fresh);Thread.sleep(40);
        check(diagnosticCalls.get(key).get()==1,"unchanged delivered HR1 was replayed");

        String retryKey="ls_augment_atomic_home_readiness_89";
        failedDiagnosticKey=retryKey;failedDiagnosticValue=old;diagnosticFailures.set(0);
        homeFailureEntered=new CountDownLatch(1);homeFailureRelease=new CountDownLatch(1);
        FeatureSettings.diagnosticHomeReadiness(context,retryKey,old);await(homeFailureEntered);
        Map<?,?> pending=internalMap("DIAGNOSTICS");Object first=pending.get(retryKey);long retryStart=pendingLong(first,"retryStartedElapsed");
        FeatureSettings.diagnosticHomeReadiness(context,retryKey,fresh);Object replacement=pending.get(retryKey);
        homeFailureRelease.countDown();homeFailureEntered=null;
        until(()->{try{return pendingLong(replacement,"retryAt")>android.os.SystemClock.elapsedRealtime();}catch(Exception e){throw new AssertionError(e);}});
        drainNow();Thread.sleep(40);
        check(diagnosticCalls.get(retryKey).get()==1&&!writes.containsKey(retryKey),"new WM generation bypassed an in-flight Provider failure backoff");
        check(pendingLong(replacement,"retryStartedElapsed")==retryStart,"new WM observation reset failed delivery's retry window");
        failedDiagnosticKey=null;android.os.SystemClock.offset+=31_000L;drainNow();
        check(fresh.equals(writes.get(retryKey))&&writtenObserved.get(retryKey)==observed(replacement),"failure recovery lost latest actual observation");

        String expiredKey="ls_augment_atomic_home_readiness_90";failedDiagnosticKey=expiredKey;failedDiagnosticValue=old;diagnosticFailures.set(0);
        FeatureSettings.diagnosticHomeReadiness(context,expiredKey,old);until(()->diagnosticFailures.get()>0);
        android.os.SystemClock.offset+=300_001L;FeatureSettings.diagnosticHomeReadiness(context,expiredKey,fresh);drainNow();
        check(!pending.containsKey(expiredKey)&&!internalMap("DIAGNOSTIC_VALUES").containsKey(expiredKey),"new timestamps prolonged failed HR1 delivery beyond five minutes");
        check(FeatureSettings.diagnosticWriterState().contains("lastDropReason=retry_window_expired"),"HR1 expiry had no truthful loss evidence");
        failedDiagnosticKey=null;FeatureSettings.diagnosticHomeReadiness(context,expiredKey,fresh);until(()->fresh.equals(writes.get(expiredKey)));
        check(wrongThread.get()==0,"HR1 priority performed IPC on a callback or UI thread");
        System.out.println("PASS FeatureSettings HR1 priority: system-only narrow lane, actual <200ms/coalesced delivery, dedup, in-flight failure/new generation backpressure, fresh recovery and fixed five-minute expiry");
    }
    public static final class GuardOwner {
        private final Context held;
        static final AtomicInteger ownerReads=new AtomicInteger();
        GuardOwner(Context held){this.held=held;}
        public Context getContext(){ownerReads.incrementAndGet();return held;}
        public Object entry(){throw new AssertionError("fixture original should be delegated through Chain");}
    }
    static final Object ORIGINAL=new Object(),CHANGED=new Object();
    static final class GuardChain implements io.github.libxposed.api.XposedInterface.Chain {
        final GuardOwner owner;int proceeded;
        static final AtomicInteger receiverReads=new AtomicInteger();
        GuardChain(GuardOwner owner){this.owner=owner;}
        public Object proceed(){proceeded++;return ORIGINAL;}
        public Object getThisObject(){receiverReads.incrementAndGet();return owner;}
        public List<Object> getArgs(){return Collections.emptyList();}
    }
    static void guardedReads(io.github.libxposed.api.XposedInterface.Hooker hook,GuardOwner owner)throws Exception {
        ExecutorService readers=Executors.newFixedThreadPool(4);
        try{
            List<Future<?>> results=new ArrayList<>();
            for(int n=0;n<4;n++)results.add(readers.submit(()->{
                GuardChain chain=new GuardChain(owner);
                try{for(int i=0;i<1000;i++)check(hook.intercept(chain)==ORIGINAL,"disabled guard changed original result");}
                catch(Throwable error){throw new AssertionError(error);}
                check(chain.proceeded==1000,"disabled guard did not delegate exactly once");
            }));
            for(Future<?> result:results)result.get(2,TimeUnit.SECONDS);
        }finally{readers.shutdownNow();}
    }
    static void verifiedOffGuard()throws Throwable {
        // Execute the real OemHooks.methods wrapper, rather than a copied guard.
        WRITE_GATE.countDown();Context context=new Context(new Resolver());GuardOwner owner=new GuardOwner(context);
        AugmentModule module=new AugmentModule();AtomicInteger businessCalls=new AtomicInteger();
        check(OemHooks.methods(module,TestFeatureSettingsAsync.class.getClassLoader(),GuardOwner.class.getName(),
                "entry",Object.class,0,"flag",c->{businessCalls.incrementAndGet();return CHANGED;})==1,"real OEM guard not installed");
        java.lang.reflect.Method entry=GuardOwner.class.getDeclaredMethod("entry");
        io.github.libxposed.api.XposedInterface.Hooker hook=module.hooks.get(entry);
        check(!FeatureSettings.verifiedDisabled("flag"),"unverified startup defaults authorized off shortcut");
        long start=System.nanoTime();GuardChain startup=new GuardChain(owner);
        check(hook.intercept(startup)==ORIGINAL,"unverified startup enabled feature");
        check(System.nanoTime()-start<TimeUnit.SECONDS.toNanos(1),"unverified callback blocked on Provider");
        await(providerEntered);
        check(GuardOwner.ownerReads.get()>0&&GuardChain.receiverReads.get()>0,"unverified startup skipped context binding");
        check(providerSnapshotCalls.get()>0,"unverified startup did not request refresh");
        providerGate.countDown();readerIdle();
        check(FeatureSettings.verifiedDisabled("flag"),"saved off state not recognized");
        GuardOwner.ownerReads.set(0);GuardChain.receiverReads.set(0);
        int before=providerSnapshotCalls.get();guardedReads(hook,owner);
        check(providerSnapshotCalls.get()==before,"fresh saved-off callbacks performed Provider IPC");
        check(GuardOwner.ownerReads.get()==0&&GuardChain.receiverReads.get()==0,"saved-off guard looked up owner before return");
        check(businessCalls.get()==0,"saved-off guard executed feature body");
        // Expiration still schedules refresh. The existing verified off state
        // keeps callbacks immediate while the new Provider call is blocked.
        providerGate=new CountDownLatch(1);providerEntered=new CountDownLatch(1);
        android.os.SystemClock.offset+=1001;guardedReads(hook,owner);await(providerEntered);
        check(GuardOwner.ownerReads.get()==0&&GuardChain.receiverReads.get()==0,"expired verified-off guard performed owner lookup");
        check(providerSnapshotCalls.get()>before,"expired verified-off state stopped refreshing");
        providerValue="4:1";FeatureSettings.invalidateSnapshot();providerGate.countDown();readerIdle();
        check(!FeatureSettings.verifiedDisabled("flag"),"configuration enable retained off shortcut");
        GuardChain enabled=new GuardChain(owner);check(hook.intercept(enabled)==CHANGED,"enabled guard failed to execute body");
        check(businessCalls.get()==1&&GuardOwner.ownerReads.get()>0&&GuardChain.receiverReads.get()>0,"enabled guard skipped normal context/body path");
        providerValue="5:0";refresh();GuardOwner.ownerReads.set(0);GuardChain.receiverReads.set(0);guardedReads(hook,owner);
        check(GuardOwner.ownerReads.get()==0&&GuardChain.receiverReads.get()==0&&businessCalls.get()==1,"off-after-enable did not restore early return");
        check(wrongThread.get()==0,"guard moved IPC onto a callback reader thread");
        System.out.println("FeatureSettings/OemHooks actual guard: unverified refresh, 4000 fresh off callbacks without IPC/owner lookup, 4000 expired off callbacks with blocked worker refresh, enable/disable changes passed");
    }
    public static void main(String[] args)throws Throwable {
        if(args.length>0&&args[0].equals("host_context")){
            providerGate.countDown();WRITE_GATE.countDown();AtomicInteger foreignCalls=new AtomicInteger();
            Context foreign=new Context(new Resolver(){@Override public Bundle call(Uri uri,String method,String key,Bundle extras){foreignCalls.incrementAndGet();throw new SecurityException("android does not own app uid");}},"android"){
                @Override public android.content.pm.ApplicationInfo getApplicationInfo(){var info=super.getApplicationInfo();info.uid=1000;return info;}
            };
            FeatureSettings.snapshot(foreign);Thread.sleep(60);check(foreignCalls.get()==0,"early foreign context reached Provider");
            Context host=new Context(new Resolver());Framework framework=new Framework();framework.remoteSupported=false;FeatureSettings.attachFramework(framework);
            until(()->FeatureSettings.snapshot(host).revision==3);
            for(int i=0;i<1000;i++){FeatureSettings.snapshot(i%2==0?foreign:host);FeatureSettings.diagnostic(foreign,"ls_augment_identity_regression","valid-host");}
            FeatureSettings.invalidateSnapshot();until(()->"valid-host".equals(writes.get("ls_augment_identity_regression")));readerIdle();
            check(foreignCalls.get()==0&&FeatureSettings.hasVerifiedSnapshot(host),"foreign context poisoned read/write or discarded verified state");
            System.out.println("FeatureSettings real read/write host identity: 1000 alternating contexts, startup fallback and verified snapshot retained");return;
        }
        if(args.length>0&&args[0].equals("auxiliary_outage_observer")) {
            REMOTE_GATE.countDown();providerGate.countDown();WRITE_GATE.countDown();runtimeThrows=true;
            remoteValue="7:1";providerValue="8:1";Framework observerFramework=new Framework();FeatureSettings.attachFramework(observerFramework);
            Context observerContext=new Context(new Resolver());FeatureSettings.invalidateSnapshot();FeatureSettings.snapshot(observerContext);
            until(()->FeatureSettings.verifiedSnapshot(observerContext)!=null&&FeatureSettings.verifiedSnapshot(observerContext).revision==8);readerIdle();
            check(observerRegistrations.get()==1&&FeatureSettings.enabled(observerContext,"flag"),"auxiliary outage blocked observer or discarded verified configuration");
            until(()->writes.getOrDefault("ls_augment_config_read_state","").contains("runtime=provider_unavailable"));
            String state=writes.get("ls_augment_config_read_state");check(state.contains("provider=ready")&&state.contains("retained=false")&&state.contains("revision=8"),"auxiliary outage mislabeled successful authoritative configuration stale or failed");
            check(ls.augment.com.StartupDiagnostics.events.stream().anyMatch(s->s.startsWith("CONFIG_RUNTIME_FAILED:")),"auxiliary read exception has no independent startup record");
            runtimeThrows=false;refresh();check(observerRegistrations.get()==1,"auxiliary recovery duplicated observer");
            check(wrongThread.get()==0,"observer recovery ran IPC on caller");
            System.out.println("PASS valid configuration installs observer through auxiliary-provider outage, retains state and avoids duplicate observer");return;
        }

        if(args.length>0&&args[0].equals("launcher_publication_wait")) {
            REMOTE_GATE.countDown();remoteValue="7:1";Framework delayedFramework=new Framework();delayedFramework.remote.failing=true;
            FeatureSettings.attachFramework(delayedFramework);await(REMOTE_ENTERED);readerIdle();
            FeatureSettings.awaitBootSnapshot();check(FeatureSettings.verifiedSnapshot(null)==null,"failed attempt was mistaken for verified publication");
            Thread delayedPublisher=new Thread(()->{try{Thread.sleep(350);delayedFramework.remote.failing=false;}catch(Exception error){throw new AssertionError(error);}});delayedPublisher.start();
            long started=System.nanoTime();FeatureSettings.awaitLauncherGridSnapshot();long waited=System.nanoTime()-started;
            delayedPublisher.join();check(FeatureSettings.verifiedSnapshot(null).revision==7&&waited>=TimeUnit.MILLISECONDS.toNanos(250)&&waited<TimeUnit.SECONDS.toNanos(2),"launcher used exhausted attempt latch or missed delayed verified publication");
            check(wrongThread.get()==0,"launcher publication wait moved IPC to installer");
            System.out.println("PASS launcher waits for real verified publication after failed initial attempt, without installer IPC");return;
        }

        if(args.length>0&&args[0].equals("provider_recovery")) {
            REMOTE_GATE.countDown();providerGate.countDown();WRITE_GATE.countDown();
            remoteValue="7:1";providerValue="8:1";snapshotOutages.set(2);
            Framework recoveryFramework=new Framework();FeatureSettings.attachFramework(recoveryFramework);
            until(()->FeatureSettings.verifiedSnapshot(null)!=null);
            Context recoveryContext=new Context(new Resolver());
            check(FeatureSettings.verifiedSnapshot(recoveryContext).revision==7,"verified mirror is atomic before Provider recovers");
            until(()->providerSnapshotCalls.get()>=2);readerIdle();
            check(FeatureSettings.verifiedSnapshot(recoveryContext).revision==7,"outage replaced verified enabled state with defaults");
            until(()->FeatureSettings.verifiedSnapshot(recoveryContext).revision==8);readerIdle();
            check(providerSnapshotCalls.get()>=3,"brief read outage did not get a prompt recovery check");
            recoveryFramework.remote.failing=true;providerValue="9:1";refresh();
            check(recoveryFramework.remote.removals==1&&FeatureSettings.verifiedSnapshot(recoveryContext).revision==9,"failed mirror connection kept its stale listener or discarded valid Provider data");
            recoveryFramework.remote.failing=false;refresh();
            check(recoveryFramework.connections==2&&recoveryFramework.remote.registrations==2&&recoveryFramework.remote.removals==1,"mirror reconnect duplicated listener ownership");
            check(wrongThread.get()==0,"recovery IPC moved to a caller thread");
            System.out.println("PASS atomic verified publication, Provider outage retention/recovery, remote listener cleanup and worker-only IPC");return;
        }

        if(args.length>0&&args[0].equals("verified_off_guard")){verifiedOffGuard();return;}
        if(args.length>0&&args[0].equals("boot_startup")){
            remoteValue="7:1";REMOTE_GATE.countDown();FeatureSettings.attachFramework(new Framework());
            until(()->FeatureSettings.hasVerifiedSnapshot(null));FeatureSettings.awaitBootSnapshot();FeatureSettings.awaitBootSnapshot();
            check(FeatureSettings.hasVerifiedSnapshot(null),"private framework boot publication unavailable");
            check(providerSnapshotCalls.get()==0&&wrongThread.get()==0,"private boot publication moved IPC onto caller");
            System.out.println("FeatureSettings private framework startup publication passed");return;
        }
        if(args.length>0&&args[0].equals("diagnostic_retry")){diagnosticRetry();return;}
        if(args.length>0&&args[0].equals("diagnostic_queue_full")){diagnosticQueueFull();return;}
        if(args.length>0&&args[0].equals("home_readiness_priority")){homeReadinessPriority();return;}
        if(args.length>0&&args[0].equals("hidden_binding")){hiddenBindings();return;}
        if(args.length>0&&args[0].equals("provider_only")) {
            Framework fallback=new Framework();fallback.remoteSupported=false;providerGate.countDown();WRITE_GATE.countDown();
            Context providerContext=new Context(new Resolver(),"com.android.settings");FeatureSettings.attachFramework(fallback);
            until(()->FeatureSettings.snapshot(providerContext).revision==3);
            check(fallback.connections==0&&FeatureSettings.hasVerifiedSnapshot(providerContext),"no remote capability must use verified Provider fallback");
            check(wrongThread.get()==0,"fallback Provider read left worker");
            check(android.os.UserManager.calls.get()==0,"Settings configuration reader queried identity before filtering was requested");
            System.out.println("FeatureSettings Provider fallback without framework remote capability passed");return;
        }
        check(FeatureSettings.from(null)==null,"app startup borrowed the system package identity");
        check(android.app.ActivityThread.systemContextReads==0,"app startup touched the system Context");
        android.os.Process.uid=1000;
        check(FeatureSettings.from(null)!=null,"system_server lost its boot Context");
        check(android.app.ActivityThread.systemContextReads==1,"system fallback was not used for UID 1000");
        android.os.Process.uid=20000;
        android.app.ActivityThread.application=new android.app.Application();
        check(FeatureSettings.from(null)==android.app.ActivityThread.application,"real application Context was not used after startup");
        check(android.app.ActivityThread.systemContextReads==1,"ready application used the system fallback");
        android.app.ActivityThread.application=null;
        Context context=new Context(new Resolver());
        Framework framework=new Framework();FeatureSettings.attachFramework(framework);await(REMOTE_ENTERED);
        Runnable listener=()->{ConfigSnapshot s=FeatureSettings.snapshot(context);observed.add(s.checksum);};
        FeatureSettings.addSnapshotListener(context,listener);FeatureSettings.addSnapshotListener(context,listener);
        long started=System.nanoTime();for(int i=0;i<1000;i++)FeatureSettings.snapshot(context);
        check(System.nanoTime()-started<TimeUnit.SECONDS.toNanos(1),"reader waited for blocked remote preferences");
        check(observed.isEmpty(),"listener fired before any verified snapshot");
        REMOTE_GATE.countDown();until(()->observed.size()==1);FeatureSettings.invalidateSnapshot();await(providerEntered);
        check(observed.get(0).equals("2:1"),"early remote snapshot was not published before Provider read");
        check(FeatureSettings.hiddenTargets(context).isEmpty(),"legacy early runtime authorized non-Settings filtering");
        Field lock=FeatureSettings.class.getDeclaredField("PUBLICATION_LOCK");lock.setAccessible(true);
        Object monitor=lock.get(null);CountDownLatch holding=new CountDownLatch(1),release=new CountDownLatch(1);
        Thread holder=new Thread(()->{synchronized(monitor){holding.countDown();await(release);}});holder.start();await(holding);
        started=System.nanoTime();check(FeatureSettings.snapshot(context).revision==2,"reader lost verified state");
        FeatureSettings.invalidateSnapshot();check(FeatureSettings.snapshot(context).revision==2,"invalidation erased verified state");
        check(System.nanoTime()-started<TimeUnit.SECONDS.toNanos(1),"reader acquired publisher lock");release.countDown();holder.join();
        providerGate.countDown();until(()->FeatureSettings.snapshot(context).revision==3);until(()->observed.size()==2);
        check(observed.equals(Arrays.asList("2:1","3:0")),"duplicate listener or callback-before-publication: "+observed);
        FeatureSettings.attachFramework(framework);FeatureSettings.attachFramework(framework);
        readerIdle();check(framework.connections==1&&framework.remote.registrations==1&&FeatureSettings.snapshot(context).revision==3,"remote connection/listener duplicated or stale remote replaced newer state");
        check(FeatureSettings.hiddenTargets(context).isEmpty(),"legacy private runtime authorized non-Settings filtering");
        providerGate=new CountDownLatch(1);providerEntered=new CountDownLatch(1);providerValue="4:1";
        FeatureSettings.invalidateSnapshot();await(providerEntered);
        check(FeatureSettings.snapshot(context).revision==3,"refresh downgraded to stale mirror while Provider blocked");
        providerGate.countDown();until(()->observed.size()==3);check(observed.get(2).equals("4:1"),"updated value not visible to listener");
        FeatureSettings.removeSnapshotListener(listener);
        started=System.nanoTime();for(int i=0;i<1000;i++)FeatureSettings.diagnostic(context,"test",Integer.toString(i));
        check(System.nanoTime()-started<TimeUnit.SECONDS.toNanos(1),"diagnostic call waited for blocked writer");
        check(FeatureSettings.diagnosticValue(context,"test").equals("999"),"queued diagnostic was not readable from memory");
        WRITE_GATE.countDown();until(()->"999".equals(writes.get("test")));
        providerValue="5:0";FeatureSettings.invalidateSnapshot();until(()->FeatureSettings.snapshot(context).revision==5);
        Thread.sleep(50);check(observed.size()==3,"removed listener invoked");check(wrongThread.get()==0,"IPC ran on a reader/callback thread");
        java.lang.reflect.Method publish=FeatureSettings.class.getDeclaredMethod("publishSnapshot",ConfigSnapshot.class,boolean.class);publish.setAccessible(true);
        publish.invoke(null,ConfigSnapshot.parse("6:1:2"),false);
        check(FeatureSettings.snapshot(context).revision==6&&FeatureSettings.snapshot(context).updatedAt==2,"wall-clock rollback rejected a newer mirror revision");
        publish.invoke(null,ConfigSnapshot.parse("5:0:1000"),false);
        check(FeatureSettings.snapshot(context).revision==6,"newer wall clock allowed an older mirror revision");
        publish.invoke(null,ConfigSnapshot.parse("6:0:1"),false);
        check(FeatureSettings.snapshot(context).checksum.equals("6:1:2"),"older equal-revision mirror replaced current state");
        // Exercise real refreshes: the RemotePreferences half completes while the Provider
        // half is deliberately blocked, allowing readers to observe any flashback.
        pauseProvider("100:1","100:1");finishProvider();
        check(FeatureSettings.enabled(context,"flag"),"pre-reset baseline was not enabled");
        pauseProvider("100:1","1:0:1000");finishProvider();
        check(FeatureSettings.snapshot(context).revision==1&&!FeatureSettings.enabled(context,"flag"),"authoritative data reset was not accepted");
        for(int i=0;i<3;i++) {
            pauseProvider("100:1","1:0:1000");readersStayDisabled(context);finishProvider();
        }
        // A new private save while quarantined moves the checksum requirement.
        pauseProvider("100:1","2:0:1001");readersStayDisabled(context);finishProvider();
        pauseProvider("1:0:1000","2:0:1001");readersStayDisabled(context);finishProvider();
        pauseProvider("100:1","2:0:1001");readersStayDisabled(context);finishProvider();
        // Matching revision/time with different values is not a synchronized mirror.
        pauseProvider("2:1:1001","2:0:1001");readersStayDisabled(context);finishProvider();
        pauseProvider("100:1","2:0:1001");readersStayDisabled(context);finishProvider();
        // An exact mirror match releases quarantine. A newer mirror then applies
        // before Provider returns, including when the wall clock moves backwards.
        pauseProvider("2:0:1001","2:0:1001");readersStayDisabled(context);finishProvider();
        pauseProvider("3:1:500","3:1:500");
        check(FeatureSettings.snapshot(context).revision==3&&FeatureSettings.enabled(context,"flag"),"resynchronized mirror did not resume normal updates");
        finishProvider();check(wrongThread.get()==0,"reset handling moved IPC onto a reader thread");
        badMetadata=true;runtimeUnavailable=true;
        pauseProvider("3:1:500","4:0:501");finishProvider();
        check(FeatureSettings.snapshot(context).revision==3,"unverified Provider metadata replaced valid state");
        check(FeatureSettings.hiddenTargets(context).isEmpty(),"failed runtime read authorized non-Settings filtering");
        badMetadata=false;runtimeUnavailable=false;remoteValue="4:0:501";
        framework.remote.changed();until(()->FeatureSettings.snapshot(context).revision==4);readerIdle();
        check(framework.connections==1&&framework.remote.registrations==1,"remote change reconnected or duplicated listener");
        check(wrongThread.get()==0,"remote callback performed inline IPC");
        check(android.os.UserManager.calls.get()==0,"non-Settings configuration consumers queried user identity");
        System.out.println("FeatureSettings: startup UID identity, early framework snapshot, blocked remote/Provider, lock-free reads, publication ordering, listeners, diagnostic coalescing, revision/reset quarantine, metadata validation, private runtime authority and remote change notification passed");
    }
}
''',
}

SOURCES['ls/augment/com/hook/ConfigReadRetry.java'] = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/ConfigReadRetry.java').read_text(encoding='utf-8')
SOURCES['ls/augment/com/hook/ConfigHostContext.java'] = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/ConfigHostContext.java').read_text(encoding='utf-8')
SOURCES['ls/augment/com/hook/TestFeatureSettingsAsync.java'] = SOURCES['ls/augment/com/hook/TestFeatureSettingsAsync.java'].replace('final class Resolver', 'class Resolver')
SOURCES['ls/augment/com/hook/AugmentModule.java'] = SOURCES['ls/augment/com/hook/AugmentModule.java'].replace('void logFeatureError', 'void logFeatureInfo(String message){}void logFeatureError')
SOURCES['android/content/pm/ApplicationInfo.java']='package android.content.pm;public class ApplicationInfo{public int uid;public String packageName;}'
SOURCES['android/content/Context.java']=SOURCES['android/content/Context.java'].replace(
    'public String getPackageName(){return packageName;}',
    'public String getPackageName(){return packageName;}public String getOpPackageName(){return packageName;}public android.content.pm.ApplicationInfo getApplicationInfo(){var info=new android.content.pm.ApplicationInfo();info.uid=android.os.Process.myUid();info.packageName=packageName;return info;}')
# Keep the production per-transport cache around the controlled snapshot parser.
# The parser double models authority/revision races; real serialization has its
# separate checksum/corruption suite.
snapshot_source = (ROOT / 'android/app/src/main/java/ls/augment/com/ConfigSnapshot.java').read_text(encoding='utf-8')
reader_start = snapshot_source.index('    public static final class Reader {')
reader_end = snapshot_source.index('    public static ConfigSnapshot parse(', reader_start)
SOURCES['ls/augment/com/ConfigSnapshot.java'] = SOURCES['ls/augment/com/ConfigSnapshot.java'].rsplit('}', 1)[0] + 'public String serialize(){return checksum;}' + snapshot_source[reader_start:reader_end] + '}'

with tempfile.TemporaryDirectory(prefix='ls-feature-settings-async-') as directory:
    temporary = Path(directory)
    files = []
    for name, text in SOURCES.items():
        target = temporary / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding='utf-8')
        files.append(str(target))
    classes = temporary / 'classes'
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', str(classes), *files], check=True)
    subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.hook.TestSettingsTargetMatcher'], check=True, timeout=20)
    for case in ('host_context', 'remote', 'provider_only', 'hidden_binding', 'diagnostic_retry', 'verified_off_guard', 'boot_startup', 'provider_recovery', 'launcher_publication_wait', 'auxiliary_outage_observer', 'diagnostic_queue_full', 'home_readiness_priority'):
        subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.hook.TestFeatureSettingsAsync', case], check=True, timeout=20)
