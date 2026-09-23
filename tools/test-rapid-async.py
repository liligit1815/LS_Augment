"""Run actual fuse/native/identity Java against blocked private Provider and PM doubles."""
from pathlib import Path
import subprocess
import tempfile
import sys
from concurrent.futures import ThreadPoolExecutor

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java'
STUBS = {
'android/content/ContentResolver.java': '''package android.content;public class ContentResolver {
 public android.os.Bundle call(android.net.Uri uri,String method,String arg,android.os.Bundle extras){
  if(!uri.value.equals("content://ls.augment.com.config")||!method.equals("crash_fuse")||arg!=null)throw new AssertionError("unexpected fuse transport");
  return ls.augment.com.FuseProvider.call(extras);
 }}''',
'android/net/Uri.java': 'package android.net;public class Uri {public final String value;private Uri(String v){value=v;}public static Uri parse(String v){return new Uri(v);}}',
'android/os/Bundle.java': '''package android.os;public class Bundle {
 private final java.util.Map<String,Object> values=new java.util.HashMap<>();
 public void putString(String k,String v){values.put(k,v);}public String getString(String k,String d){Object v=values.get(k);return v instanceof String?(String)v:d;}
 public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k,boolean d){Object v=values.get(k);return v instanceof Boolean?(Boolean)v:d;}
 public void putInt(String k,int v){values.put(k,v);}public int getInt(String k,int d){Object v=values.get(k);return v instanceof Integer?(Integer)v:d;}
}''',
'android/content/Context.java': '''package android.content; public class Context {
 public ContentResolver getContentResolver(){return new ContentResolver();}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
}''',
'android/os/SystemClock.java': 'package android.os; public class SystemClock { public static long elapsedRealtime(){return System.nanoTime()/1000000;} }',
'android/os/Build.java': '''package android.os; public class Build { public static String ID="id",FINGERPRINT="rom"; public static String[] SUPPORTED_ABIS={"arm64-v8a"}; public static class VERSION {public static int SDK_INT=36; public static String RELEASE="16",SECURITY_PATCH="2026";} }''',
'android/content/pm/ApplicationInfo.java': 'package android.content.pm; public class ApplicationInfo { public String sourceDir,nativeLibraryDir; }',
'android/content/pm/PackageInfo.java': 'package android.content.pm; public class PackageInfo { public String versionName="1"; public long getLongVersionCode(){return Long.parseLong(versionName);} }',
'android/content/pm/PackageManager.java': '''package android.content.pm;
import java.util.concurrent.*;
public class PackageManager {
 public static class NameNotFoundException extends Exception {}
 public static volatile boolean block,fail; public static volatile int version=1;
 public static volatile CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
 public PackageInfo getPackageInfo(String pkg,int flags)throws NameNotFoundException {
  if(Thread.holdsLock(ls.augment.com.RapidFireCompatibility.class))throw new AssertionError("PM under module monitor");
  if(block){entered.countDown();try{release.await();}catch(InterruptedException e){throw new RuntimeException(e);}}
  if(fail)throw new IllegalStateException("PM unavailable");
  PackageInfo p=new PackageInfo();p.versionName=""+version;return p;
 }
}''',
'ls/augment/com/FuseProvider.java': '''package ls.augment.com;
import java.util.concurrent.*;import java.util.*;import android.os.Bundle;
/** Provider boundary model; production CrashFuseStore persistence has separate fault tests. */
public class FuseProvider {
 public static final Map<String,Integer> values=new ConcurrentHashMap<>();
 public static volatile boolean block,failMarker,denied,badAck;public static volatile CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
 private static String session="",armedSession="";
 private static final String PENDING="ls_augment_tgk_fuse_pending",ATTEMPTS="ls_augment_tgk_fuse_attempts",FUSED="ls_augment_tgk_fuse_tripped";
 public static synchronized Bundle call(Bundle request){
  if(!Thread.currentThread().getName().equals("LSA-RapidFuse"))throw new AssertionError("Provider on "+Thread.currentThread().getName());
  if(block){entered.countDown();try{release.await();}catch(Exception e){throw new RuntimeException(e);}}
  if(denied)throw new SecurityException("UID rejected");
  Bundle result=new Bundle();String incoming=request.getString("session","");
  if(!incoming.matches("[0-9a-f-]{36}"))throw new AssertionError("missing system-server session");
  int attempts=values.getOrDefault(ATTEMPTS,0),pending=values.getOrDefault(PENDING,0),fused=values.getOrDefault(FUSED,0);
  String nextArmed=armedSession;
  if(!incoming.equals(session)){attempts=Math.min(3,attempts+(pending==1?1:0));if(attempts>=3)fused=1;pending=0;nextArmed="";}
  if(request.getBoolean("clearPending",false))pending=0;
  if(request.getBoolean("clearAttempts",false))attempts=0;
  if(request.getBoolean("disarm",false))nextArmed="";
  if(fused==0&&request.getBoolean("arm",false)&&!incoming.equals(nextArmed)){pending=1;nextArmed=incoming;}
  if(failMarker&&pending==1)return result;
  values.put(ATTEMPTS,attempts);values.put(PENDING,pending);values.put(FUSED,fused);session=incoming;armedSession=nextArmed;
  result.putBoolean("ok",true);result.putInt("attempts",attempts);
  result.putString("state",badAck?"INVALID":fused==1?"FUSED":incoming.equals(armedSession)?"ARMED":"READY");return result;
 }
}''',
'ls/augment/com/BuildConfig.java': 'package ls.augment.com; public class BuildConfig {public static String VERSION_NAME="test";}',
'ls/augment/com/ConfigSchema.java': 'package ls.augment.com; public class ConfigSchema {public static int VERSION=1;}',
'ls/augment/com/RapidFireNativeLayout.java': '''package ls.augment.com; public class RapidFireNativeLayout {
 public static final String PROFILE="test";public static volatile int calls;
 public static Object inspectFile(java.io.File f){
  if(!Thread.currentThread().getName().equals("LSA-RapidNativeInstall"))throw new AssertionError("native preflight caller thread");
  if(ls.augment.com.FuseProvider.values.getOrDefault("ls_augment_tgk_fuse_pending",0)!=1)throw new AssertionError("native before persisted marker acknowledgement");
  calls++;return null;
 }
}''',
'ls/augment/com/hook/AugmentModule.java': 'package ls.augment.com.hook; class AugmentModule {android.content.pm.ApplicationInfo getModuleApplicationInfo(){return null;}}',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook; class FeatureSettings {
 static final String TGK_RAPID_FIRE_NATIVE_LAST_ERROR="err",TGK_RAPID_FIRE_NATIVE_SHA256="hash",TGK_RAPID_FIRE_NATIVE_STATE="state";
 static void diagnostic(android.content.Context c,String k,String v){}
}''',
'ls/augment/com/hook/TgkRapidFireSystemHook.java': 'package ls.augment.com.hook; class TgkRapidFireSystemHook {static void onNativeInstallationReady(android.content.Context c){}}',
'ls/augment/com/hook/TestRapidAsync.java': r'''package ls.augment.com.hook;
import android.content.*;import android.content.pm.*;
import java.util.concurrent.*;import java.util.concurrent.atomic.*;import java.util.function.*;
import ls.augment.com.*;
public class TestRapidAsync {
 static Context c=new Context(); static AtomicInteger notifications=new AtomicInteger();
 static void yes(boolean b,String m){if(!b)throw new AssertionError(m);}
 static void until(BooleanSupplier condition,long timeout,String message)throws Exception{long end=System.currentTimeMillis()+timeout;while(!condition.getAsBoolean()){if(System.currentTimeMillis()>end)throw new AssertionError(message);Thread.sleep(10);}}
 static void fast(Runnable r)throws Exception {ExecutorService e=Executors.newSingleThreadExecutor();try{e.submit(r).get(500,TimeUnit.MILLISECONDS);}finally{e.shutdownNow();}}
 static Object field(Class<?> cls,String name)throws Exception{java.lang.reflect.Field f=cls.getDeclaredField(name);f.setAccessible(true);return f.get(null);}
 static void request(){RapidFireCrashFuse.setListener(c,notifications::incrementAndGet);RapidFireCrashFuse.beforeInstall(c);}
 public static void main(String[] args)throws Exception {
  switch(args[0]) {
   case "blocked":
    FuseProvider.block=true;request();yes(FuseProvider.entered.await(2,TimeUnit.SECONDS),"provider entered");
    fast(()->{yes(RapidFireCrashFuse.isFused(c),"unknown closed");yes(!RapidFireCrashFuse.beforeInstall(c),"marker not ready");yes(!TgkRapidFireNative.ensureInstalled(new AugmentModule(),c),"native denied");});
    yes(!((Boolean)field(TgkRapidFireNative.class,"attempted")),"temporary miss must remain retryable");
    FuseProvider.block=false;FuseProvider.release.countDown();until(()->RapidFireCrashFuse.beforeInstall(c),2000,"marker recovery");
    fast(()->TgkRapidFireNative.ensureInstalled(new AugmentModule(),c));
    until(()->RapidFireNativeLayout.calls==1,2000,"background native retry");
    until(()->FuseProvider.values.getOrDefault(RapidFireCrashFuse.PENDING,-1)==0,2000,"failed preflight clears marker");break;
   case "marker_failure":
    FuseProvider.failMarker=true;request();Thread.sleep(150);
    fast(()->yes(!TgkRapidFireNative.ensureInstalled(new AugmentModule(),c),"failed persist denied"));
    yes(!((Boolean)field(TgkRapidFireNative.class,"attempted")),"failed marker retryable");
    FuseProvider.failMarker=false;until(()->RapidFireCrashFuse.beforeInstall(c),2500,"marker write retry");
    yes(FuseProvider.values.get(RapidFireCrashFuse.PENDING)==1,"marker committed");break;
   case "provider_denied":
    FuseProvider.denied=true;request();Thread.sleep(150);
    fast(()->{yes(RapidFireCrashFuse.isFused(c),"provider rejection closed");yes(!TgkRapidFireNative.ensureInstalled(new AugmentModule(),c),"provider rejection denies native install");});
    yes(!((Boolean)field(TgkRapidFireNative.class,"attempted")),"denied provider must remain retryable");
    FuseProvider.denied=false;until(()->RapidFireCrashFuse.beforeInstall(c),2500,"permission recovery");break;
   case "invalid_ack":
    FuseProvider.badAck=true;request();Thread.sleep(150);
    fast(()->yes(!TgkRapidFireNative.ensureInstalled(new AugmentModule(),c),"invalid provider state denied"));
    yes(!((Boolean)field(TgkRapidFireNative.class,"attempted")),"invalid acknowledgement must not start native attempt");
    FuseProvider.badAck=false;until(()->RapidFireCrashFuse.beforeInstall(c),2500,"valid acknowledgement recovery");break;
   case "fused":
    FuseProvider.values.put(RapidFireCrashFuse.ATTEMPTS,2);FuseProvider.values.put(RapidFireCrashFuse.PENDING,1);request();
    until(()->FuseProvider.values.getOrDefault(RapidFireCrashFuse.FUSED,0)==1,2000,"third boot fuse");
    yes(FuseProvider.values.get(RapidFireCrashFuse.ATTEMPTS)==3,"one count for this boot");
    fast(()->yes(!RapidFireCrashFuse.beforeInstall(c),"fused denies"));
    FuseProvider.values.put(RapidFireCrashFuse.FUSED,0);
    until(()->!RapidFireCrashFuse.isFused(c),6500,"external reset recovered without reboot");break;
   case "stable":
    FuseProvider.values.put(RapidFireCrashFuse.ATTEMPTS,1);request();until(()->RapidFireCrashFuse.beforeInstall(c),2500,"armed");
    java.lang.reflect.Field loaded=TgkRapidFireNative.class.getDeclaredField("loaded");loaded.setAccessible(true);loaded.setBoolean(null,true);
    RapidFireCrashFuse.armStableClear(c);Thread.sleep(150);
    yes(FuseProvider.values.get(RapidFireCrashFuse.PENDING)==1,"marker retained before stable deadline");
    until(()->FuseProvider.values.getOrDefault(RapidFireCrashFuse.PENDING,1)==0&&FuseProvider.values.getOrDefault(RapidFireCrashFuse.ATTEMPTS,1)==0,63000,"stable background clear");break;
   case "identity":
    PackageManager.block=true;
    fast(()->yes(RapidFireCompatibility.currentFingerprintAsync(c,notifications::incrementAndGet).isEmpty(),"identity unknown closed"));
    yes(PackageManager.entered.await(2,TimeUnit.SECONDS),"PM entered");
    fast(()->{synchronized(RapidFireCompatibility.class){yes(RapidFireCompatibility.currentFingerprintAsync(c,notifications::incrementAndGet).isEmpty(),"PM wait isolated");}});
    PackageManager.block=false;PackageManager.release.countDown();
    until(()->!RapidFireCompatibility.currentFingerprintAsync(c,notifications::incrementAndGet).isEmpty(),2500,"identity ready");
    String original=RapidFireCompatibility.currentFingerprintAsync(c,notifications::incrementAndGet);
    RapidFireCompatibility.Token token=RapidFireCompatibility.Token.issue(original,1,2,3,4,5,6,System.currentTimeMillis());
    PackageManager.entered=new CountDownLatch(1);PackageManager.release=new CountDownLatch(1);PackageManager.block=true;
    yes(PackageManager.entered.await(6500,TimeUnit.MILLISECONDS),"recheck blocked");
    int beforeExpiry=notifications.get();
    until(()->RapidFireCompatibility.currentFingerprintAsync(c,notifications::incrementAndGet).isEmpty(),2500,"stale identity closed");
    yes(!token.validFor(RapidFireCompatibility.currentFingerprintAsync(c,notifications::incrementAndGet)),"stale token suspended");
    until(()->notifications.get()>beforeExpiry,2000,"expiry notifies even after caller observes missing identity");
    PackageManager.block=false;PackageManager.release.countDown();
    until(()->token.validFor(RapidFireCompatibility.currentFingerprintAsync(c,notifications::incrementAndGet)),2500,"existing token auto restored");
    PackageManager.version=2;
    until(()->{String s=RapidFireCompatibility.currentFingerprintAsync(c,notifications::incrementAndGet);return !s.isEmpty()&&!s.equals(original);},6500,"version change detected");
    yes(!token.validFor(RapidFireCompatibility.currentFingerprintAsync(c,notifications::incrementAndGet)),"changed version token closed");
    yes(notifications.get()>=3,"ready/expiry/recovery notifications");break;
   default:throw new AssertionError(args[0]);
  }
  System.out.println(args[0]+" passed");
 }
}'''
}

with tempfile.TemporaryDirectory(prefix='ls-rapid-async-') as folder:
    work=Path(folder)
    for name, source in STUBS.items():
        p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf-8')
    for name in ['ls/augment/com/hook/RapidFireCrashFuse.java','ls/augment/com/hook/TgkRapidFireNative.java','ls/augment/com/RapidFireCompatibility.java','ls/augment/com/RapidFireLifecyclePolicy.java']:
        p=work/name;p.write_text((JAVA/name).read_text(encoding='utf-8'),encoding='utf-8')
    subprocess.run(['javac','-encoding','UTF-8','-d',folder]+[str(p) for p in work.rglob('*.java')],check=True)
    def run(case):
        subprocess.run(['java','-cp',folder,'ls.augment.com.hook.TestRapidAsync',case],check=True,timeout=70)
    with ThreadPoolExecutor(max_workers=7) as executor:
        list(executor.map(run,sys.argv[1:] or ['blocked','marker_failure','provider_denied','invalid_ack','fused','stable','identity']))

system=(JAVA/'ls/augment/com/hook/TgkRapidFireSystemHook.java').read_text(encoding='utf-8')
assert 'RapidFireCompatibility.currentFingerprint(context)' not in system
assert 'currentFingerprintAsync(context' in system
audio=(JAVA/'ls/augment/com/hook/AudioGainHook.java').read_text(encoding='utf-8')
assert 'handler.post(() -> { try { context.getContentResolver().registerContentObserver' in audio
fuse=(JAVA/'ls/augment/com/hook/RapidFireCrashFuse.java').read_text(encoding='utf-8')
assert 'Settings.Global.' not in fuse and '"crash_fuse", null, request' in fuse
assert 'result == null || !result.getBoolean("ok", false)' in fuse
print('Actual async hook checks passed for: ' + ', '.join(sys.argv[1:] or
      ['blocked','marker_failure','provider_denied','invalid_ack','fused','stable','identity']))
