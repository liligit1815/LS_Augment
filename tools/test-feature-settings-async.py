"""Run real FeatureSettings against blocked RemotePreferences/Provider doubles, without ADB."""
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FEATURE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/FeatureSettings.java'
source = FEATURE.read_text(encoding='utf-8')
assert 'Settings.Global.' not in source and 'BootConfigMirror' not in source, 'legacy transport returned'
constants = sorted(set(re.findall(r'ConfigSchema\.([A-Z][A-Z0-9_]+)', source)))

SOURCES = {
    'android/net/Uri.java': '''package android.net; public final class Uri { public final String value; private Uri(String v){value=v;} public static Uri parse(String v){return new Uri(v);} }''',
    'android/os/SystemClock.java': '''package android.os; public final class SystemClock { public static volatile long offset; public static long elapsedRealtime(){return System.nanoTime()/1000000+offset;} }''',
    'android/os/UserHandle.java': '''package android.os;public final class UserHandle {public final int id;private UserHandle(int id){this.id=id;}public static UserHandle getUserHandleForUid(int uid){return new UserHandle(uid/100000);}public boolean equals(Object o){return o instanceof UserHandle&&((UserHandle)o).id==id;}public int hashCode(){return id;}}''',
    'android/os/UserManager.java': '''package android.os;import java.util.concurrent.*;import java.util.concurrent.atomic.*;public final class UserManager {public static final ConcurrentHashMap<Integer,Long> serials=new ConcurrentHashMap<>();public static final AtomicInteger calls=new AtomicInteger(),wrongThread=new AtomicInteger();public static volatile boolean unavailable;public static volatile CountDownLatch gate=new CountDownLatch(0),entered=new CountDownLatch(1);private void io(){calls.incrementAndGet();if(!Thread.currentThread().getName().equals("LSA-ConfigReader"))wrongThread.incrementAndGet();entered.countDown();try{if(!gate.await(5,TimeUnit.SECONDS))throw new AssertionError("identity double timeout");}catch(InterruptedException e){throw new AssertionError(e);}if(unavailable)throw new IllegalStateException("identity unavailable");}public long getSerialNumberForUser(UserHandle user){io();return serials.getOrDefault(user.id,-1L);}public UserHandle getUserForSerialNumber(long serial){io();for(java.util.Map.Entry<Integer,Long> e:serials.entrySet())if(e.getValue()==serial)return UserHandle.getUserHandleForUid(Math.multiplyExact(e.getKey(),100000));return null;}}''',
    'android/os/Process.java': '''package android.os; public final class Process {public static final int SYSTEM_UID=1000;public static int uid=20000;public static int myUid(){return uid;}}''',
    'android/app/ActivityThread.java': '''package android.app;public final class ActivityThread {private static final ActivityThread THREAD=new ActivityThread();public static Application application;public static int systemContextReads;public static Application currentApplication(){return application;}public static ActivityThread currentActivityThread(){return THREAD;}public android.content.Context getSystemContext(){systemContextReads++;return new android.content.Context();}}''',
    'android/os/Looper.java': '''package android.os; public final class Looper { private static final Looper MAIN=new Looper(); public static Looper getMainLooper(){return MAIN;} }''',
    'android/os/Handler.java': '''package android.os; import java.util.concurrent.*; public final class Handler { private static final ExecutorService MAIN=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"TestMain");t.setDaemon(true);return t;}); public Handler(Looper l){} public boolean post(Runnable r){MAIN.execute(r);return true;} }''',
    'android/os/Bundle.java': '''package android.os; import java.util.*; public final class Bundle { private final Map<String,Object> m=new HashMap<>(); public void putString(String k,String v){m.put(k,v);} public void putInt(String k,int v){m.put(k,v);} public void putLong(String k,long v){m.put(k,v);} public void putBoolean(String k,boolean v){m.put(k,v);} public String getString(String k){return getString(k,null);} public String getString(String k,String f){Object v=m.get(k);return v instanceof String?(String)v:f;} public int getInt(String k,int f){Object v=m.get(k);return v instanceof Integer?(Integer)v:f;} public long getLong(String k,long f){Object v=m.get(k);return v instanceof Long?(Long)v:f;} public boolean getBoolean(String k,boolean f){Object v=m.get(k);return v instanceof Boolean?(Boolean)v:f;} }''',
    'android/database/ContentObserver.java': '''package android.database; import android.os.Handler; public class ContentObserver { public ContentObserver(Handler h){} public void onChange(boolean self){} }''',
    'android/content/ContentResolver.java': '''package android.content; import android.net.Uri;import android.os.Bundle;import android.database.ContentObserver;public abstract class ContentResolver { public abstract Bundle call(Uri u,String method,String key,Bundle extras);public abstract String getGlobal(String key);public abstract boolean putGlobal(String key,String value);public abstract void registerContentObserver(Uri u,boolean descendants,ContentObserver o);public void unregisterContentObserver(ContentObserver o){} }''',
    'android/content/Context.java': '''package android.content;public class Context {private ContentResolver resolver;private String packageName="test.other";public Context(){}public Context(ContentResolver r){resolver=r;}public Context(ContentResolver r,String pkg){resolver=r;packageName=pkg;}public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}public String getPackageName(){return packageName;}public <T>T getSystemService(Class<T> type){return type.cast(new android.os.UserManager());} }''',
    'android/app/Application.java': '''package android.app; public class Application extends android.content.Context {}''',
    'android/content/SharedPreferences.java': '''package android.content;public interface SharedPreferences {java.util.Map<String,?> getAll();void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l);interface OnSharedPreferenceChangeListener {void onSharedPreferenceChanged(SharedPreferences p,String key);}}''',
    'io/github/libxposed/api/XposedInterface.java': '''package io.github.libxposed.api;public interface XposedInterface {long PROP_CAP_REMOTE=1L;long getFrameworkProperties();android.content.SharedPreferences getRemotePreferences(String name);}''',
    'ls/augment/com/RemoteConfig.java': (ROOT / 'android/app/src/main/java/ls/augment/com/RemoteConfig.java').read_text(encoding='utf-8'),
    'ls/augment/com/HideTargetCodec.java': (ROOT / 'android/app/src/main/java/ls/augment/com/HideTargetCodec.java').read_text(encoding='utf-8'),
    'ls/augment/com/HideUserIdentity.java': (ROOT / 'android/app/src/main/java/ls/augment/com/HideUserIdentity.java').read_text(encoding='utf-8'),
    'ls/augment/com/hook/SettingsTargetMatcher.java': (ROOT / 'android/app/src/main/java/ls/augment/com/hook/SettingsTargetMatcher.java').read_text(encoding='utf-8'),
    'ls/augment/com/hook/SettingsEntryBindings.java': (ROOT / 'android/app/src/main/java/ls/augment/com/hook/SettingsEntryBindings.java').read_text(encoding='utf-8'),
    'ls/augment/com/hook/TestSettingsTargetMatcher.java': (ROOT / 'tools/TestSettingsTargetMatcher.java').read_text(encoding='utf-8'),
    'ls/augment/com/ConfigSchema.java': 'package ls.augment.com; public final class ConfigSchema {' + ''.join(f'public static final String {key}="{key}";' for key in constants) + 'public static boolean isRuntimeKey(String key){return "flag".equals(key);} }',
    'ls/augment/com/ConfigSnapshot.java': '''package ls.augment.com; public final class ConfigSnapshot {public final int schemaVersion=1;public final String scope="device",checksum;public final long revision,updatedAt;private final String flag;private ConfigSnapshot(long r,String f,long t){revision=r;updatedAt=t;flag=f;checksum=r+":"+f+(t==r?"":":"+t);}public static ConfigSnapshot parse(String raw){if(raw==null)return null;String[] p=raw.split(":");long r=Long.parseLong(p[0]);return new ConfigSnapshot(r,p[1],p.length>2?Long.parseLong(p[2]):r);}public static ConfigSnapshot safeDefaults(){return parse("1:0");}public String get(String key){return flag;} }''',
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
    static volatile boolean badMetadata, runtimeUnavailable;
    static final ConcurrentHashMap<String,String> writes=new ConcurrentHashMap<>();
    static final ConcurrentHashMap<String,AtomicInteger> diagnosticCalls=new ConcurrentHashMap<>();
    static volatile String failedDiagnosticKey,failedDiagnosticValue;
    static volatile String throttledDiagnosticKey;
    static volatile long throttledUntil;
    static volatile CountDownLatch thirdFailureEntered,thirdFailureRelease;
    static final AtomicInteger diagnosticFailures=new AtomicInteger();
    static final List<String> observed=Collections.synchronizedList(new ArrayList<>());
    static final AtomicInteger wrongThread=new AtomicInteger();
    static void io(){String n=Thread.currentThread().getName();if(!n.equals("LSA-ConfigReader")&&!n.equals("LSA-ConfigWriter"))wrongThread.incrementAndGet();}
    static void await(CountDownLatch gate){try{if(!gate.await(5,TimeUnit.SECONDS))throw new AssertionError("blocked test double timed out");}catch(InterruptedException e){throw new AssertionError(e);}}
    static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    interface Condition{boolean get();}
    static void until(Condition condition){long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);while(!condition.get()){if(System.nanoTime()>end)throw new AssertionError("condition timed out; observed="+observed);try{Thread.sleep(5);}catch(InterruptedException e){throw new AssertionError(e);}}}
    static final class Remote implements SharedPreferences {
        int registrations;OnSharedPreferenceChangeListener listener;
        public Map<String,?> getAll(){io();REMOTE_ENTERED.countDown();await(REMOTE_GATE);return Map.of(RemoteConfig.SNAPSHOT,remoteValue,RemoteConfig.HIDDEN,remoteHidden);}
        public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){io();registrations++;listener=l;}
        void changed(){listener.onSharedPreferenceChanged(this,RemoteConfig.SNAPSHOT);}
    }
    static final class Framework implements io.github.libxposed.api.XposedInterface {
        final Remote remote=new Remote();int connections;boolean remoteSupported=true;
        public long getFrameworkProperties(){io();return remoteSupported?PROP_CAP_REMOTE:0;}
        public SharedPreferences getRemotePreferences(String name){io();check(name.equals(RemoteConfig.GROUP),"wrong framework preference group");connections++;return remote;}
    }
    static final class Resolver extends ContentResolver {
        public Bundle call(Uri uri,String method,String key,Bundle extras){io();
            if(method.equals("snapshot")){providerEntered.countDown();await(providerGate);ConfigSnapshot s=ConfigSnapshot.parse(providerValue);Bundle out=new Bundle();out.putBoolean("ok",true);out.putString("snapshot",providerValue);out.putInt("schemaVersion",1);out.putLong("revision",s.revision);out.putLong("updatedAt",s.updatedAt);out.putString("scope","device");out.putString("checksum",badMetadata?"invalid":s.checksum);return out;}
            if(method.equals("runtime_snapshot")){Bundle out=new Bundle();out.putBoolean("ok",!runtimeUnavailable);out.putString(RemoteConfig.HIDDEN,providerHidden);return out;}
            if(method.equals("diagnostic")){
                await(WRITE_GATE);diagnosticCalls.computeIfAbsent(key,k->new AtomicInteger()).incrementAndGet();
                String value=extras.getString("value");
                if(key.equals(throttledDiagnosticKey)&&android.os.SystemClock.elapsedRealtime()<throttledUntil){
                    Bundle out=new Bundle();out.putBoolean("ok",false);
                    out.putLong("retryAfterMs",throttledUntil-android.os.SystemClock.elapsedRealtime());return out;
                }
                if(key.equals(failedDiagnosticKey)&&value.equals(failedDiagnosticValue)){
                    if(diagnosticFailures.incrementAndGet()==3&&thirdFailureEntered!=null){thirdFailureEntered.countDown();await(thirdFailureRelease);}
                    throw new IllegalStateException("Provider not ready during boot");
                }
                writes.put(key,value);Bundle out=new Bundle();out.putBoolean("ok",true);return out;
            }
            if(method.equals("diagnostic_get")){Bundle out=new Bundle();out.putString("value",writes.getOrDefault(key,""));return out;}
            return new Bundle();
        }
        public String getGlobal(String key){throw new AssertionError("Global configuration read returned");}
        public boolean putGlobal(String k,String v){throw new AssertionError("Global configuration write returned");}
        public void registerContentObserver(Uri u,boolean d,ContentObserver o){io();}
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
        Context other=new Context(new Resolver(),"com.android.systemui");FeatureSettings.hiddenTargets(other);refresh();
        int otherCalls=android.os.UserManager.calls.get();refresh();
        check(android.os.UserManager.calls.get()==otherCalls&&FeatureSettings.hiddenTargets(other).isEmpty(),"non-Settings process acquired identity IPC or filtering");
        check(android.os.UserManager.wrongThread.get()==0&&wrongThread.get()==0,"identity or provider IPC ran on a hot reader");
        System.out.println("FeatureSettings hidden binding: startup/remote/Provider, same-raw reuse, missing/failing identity, retry, invalid legacy/pending payloads, immutable publication, master toggles, authority, expiry and Settings-only worker checks passed (1000 blocked hot reads)");
    }
    static Map<?,?> internalMap(String name)throws Exception {
        Field field=FeatureSettings.class.getDeclaredField(name);field.setAccessible(true);return (Map<?,?>)field.get(null);
    }
    static void diagnosticRetry()throws Exception {
        WRITE_GATE.countDown();providerGate.countDown();
        Context context=new Context(new Resolver());
        String key="ls_augment_tgk_rapid_fire_system_installed";
        String descriptor="bridge|module=current|schema=1|pid=1234";
        failedDiagnosticKey=key;failedDiagnosticValue=descriptor;
        FeatureSettings.diagnostic(context,key,descriptor);
        Map<?,?> pending=internalMap("DIAGNOSTICS"),cached=internalMap("DIAGNOSTIC_VALUES");
        until(()->diagnosticFailures.get()==3&&!pending.containsKey(key));
        check(!writes.containsKey(key),"failed boot publication was reported as delivered");
        check(!cached.containsKey(key),"undelivered installation witness remained permanently deduplicated");
        failedDiagnosticKey=null;
        FeatureSettings.diagnostic(context,key,descriptor);
        until(()->descriptor.equals(writes.get(key)));
        int publishedCalls=diagnosticCalls.get(key).get();
        FeatureSettings.diagnostic(context,key,descriptor);Thread.sleep(350);
        check(diagnosticCalls.get(key).get()==publishedCalls,"successful witness no longer deduplicates");

        // A previous value exhausting its retry budget must not remove a
        // replacement queued while the last Provider call is in flight.
        final String replacementKey="ls_augment_tgk_rapid_fire_installed";
        failedDiagnosticKey=replacementKey;failedDiagnosticValue="old";diagnosticFailures.set(0);
        thirdFailureEntered=new CountDownLatch(1);thirdFailureRelease=new CountDownLatch(1);
        FeatureSettings.diagnostic(context,replacementKey,"old");await(thirdFailureEntered);
        FeatureSettings.diagnostic(context,replacementKey,"new");thirdFailureRelease.countDown();
        until(()->"new".equals(writes.get(replacementKey)));
        check("new".equals(cached.get(replacementKey)),"failed older witness evicted replacement cache");
        throttledDiagnosticKey="ls_augment_throttled_witness";
        throttledUntil=android.os.SystemClock.elapsedRealtime()+1400;
        FeatureSettings.diagnostic(context,throttledDiagnosticKey,"ready");
        until(()->diagnosticCalls.containsKey(throttledDiagnosticKey));Thread.sleep(350);
        check(diagnosticCalls.get(throttledDiagnosticKey).get()==1,"throttled diagnostic repeatedly called Provider");
        check(pending.containsKey(throttledDiagnosticKey),"rate limit discarded installation witness");
        FeatureSettings.diagnostic(context,"ls_augment_unthrottled","other");
        until(()->"other".equals(writes.get("ls_augment_unthrottled")));
        until(()->"ready".equals(writes.get(throttledDiagnosticKey)));
        check(diagnosticCalls.get(throttledDiagnosticKey).get()==2,"throttled witness did not recover once");
        check(wrongThread.get()==0,"retry performed Provider I/O on the caller thread");
        System.out.println("FeatureSettings: failed boot witness retries, deduplication, in-flight replacement and Provider rate-limit backoff passed");
    }
    public static void main(String[] args)throws Exception {
        if(args.length>0&&args[0].equals("diagnostic_retry")){diagnosticRetry();return;}
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
    for case in ('remote', 'provider_only', 'hidden_binding', 'diagnostic_retry'):
        subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.hook.TestFeatureSettingsAsync', case], check=True, timeout=20)
