"""Offline execution of the production private range store and provider route.

Binder/PackageManager/SharedPreferences are host doubles; preferences have separate
memory and disk states, including optimistic-memory failed commits. The JSON parser
is the cached org.json implementation. No device or system setting is touched.
"""
from pathlib import Path
import os
import re
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
java_home = os.environ.get('JAVA_HOME')
JAVA = str(Path(java_home) / 'bin/java') if java_home else shutil.which('java')
JAVAC = str(Path(java_home) / 'bin/javac') if java_home else shutil.which('javac')
if not JAVA or not JAVAC:
    raise SystemExit('Java dependencies are not prepared: set JAVA_HOME or add java and javac to PATH.')
cache_roots = [Path(os.environ['GRADLE_USER_HOME'])] if os.environ.get('GRADLE_USER_HOME') else []
cache_roots.extend((Path.home() / '.gradle', ROOT / 'audit-output/gradle-cache'))
json_candidates = [jar for cache in cache_roots
                   for folder in (cache / 'caches/modules-2/files-2.1/org.json/json',
                                  cache / 'modules-2/files-2.1/org.json/json')
                   for jar in folder.glob('**/json-*.jar')]
if not json_candidates:
    raise SystemExit('JSON dependency is not prepared: cache org.json:json in GRADLE_USER_HOME, ~/.gradle, or audit-output/gradle-cache.')
JSON = sorted(json_candidates)[-1]


def block(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


route = block((SRC / 'LSConfigProvider.java').read_text(encoding='utf-8'),
              'if ("recents_radius_publish".equals(method))')
reset_source = (SRC / 'ConfigResetController.java').read_text(encoding='utf-8')
reset_start = reset_source.index('ModuleResetStorage.clear(app);')
reset_cleanup = reset_source[reset_start:reset_source.index('ModuleRuntimeReset.Result notifications', reset_start)]
options = (SRC / 'RecentsCardRadiusOptions.java').read_text(encoding='utf-8')
minimum = re.search(r'int MIN = (-?\d+)', options).group(1)
maximum = re.search(r'int MAX = (-?\d+)', options).group(1)
STUBS = {
    'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle {
      final Map<String,Object> values=new HashMap<>();
      public void putString(String k,String v){values.put(k,v);}public String getString(String k){return (String)values.get(k);}
      public String getString(String k,String d){String v=getString(k);return v==null?d:v;}
      public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k,boolean d){Object v=values.get(k);return v instanceof Boolean?(Boolean)v:d;}
    }''',
    'android/os/Process.java': '''package android.os;public class Process {public static int myUid(){return 10055;}}''',
    'android/os/Binder.java': '''package android.os;public class Binder {
      public static int uid=10055,pid=8000,clears,restores;
      public static int getCallingUid(){return uid;}public static int getCallingPid(){return pid;}
      public static long clearCallingIdentity(){clears++;long old=uid;uid=Process.myUid();return old;}
      public static void restoreCallingIdentity(long identity){restores++;uid=(int)identity;}
    }''',
    'android/os/Build.java': '''package android.os;public class Build {public static String FINGERPRINT="firmware-a";}''',
    'android/os/SystemClock.java': '''package android.os;public class SystemClock {public static long now=10000;public static long elapsedRealtime(){return now;}}''',
    'android/net/Uri.java': '''package android.net;public class Uri {final String value;private Uri(String value){this.value=value;}
      public static Uri parse(String value){return new Uri(value);}public String toString(){return value;}}''',
    'android/content/ContentResolver.java': '''package android.content;public class ContentResolver {
      public volatile int events;public String uri;public Thread eventThread;public Runnable onNotify;
      public final java.util.concurrent.CountDownLatch notified=new java.util.concurrent.CountDownLatch(1);
      public void notifyChange(android.net.Uri value,Object observer){events++;uri=value.toString();eventThread=Thread.currentThread();if(onNotify!=null)onNotify.run();notified.countDown();}
    }''',
    'android/content/SharedPreferences.java': '''package android.content;import java.util.Map;public interface SharedPreferences {
      Map<String,?> getAll();boolean contains(String key);String getString(String key,String fallback);Editor edit();
      interface Editor {Editor putString(String k,String v);Editor putBoolean(String k,boolean v);Editor putLong(String k,long v);
        Editor putInt(String k,int v);Editor putFloat(String k,float v);Editor remove(String k);Editor clear();boolean commit();void apply();}
    }''',
    'android/content/Context.java': '''package android.content;public abstract class Context {
      public static final int MODE_PRIVATE=0;public abstract SharedPreferences getSharedPreferences(String name,int mode);
      public abstract android.content.pm.PackageManager getPackageManager();
      public Context getApplicationContext(){return this;}public abstract ContentResolver getContentResolver();
    }''',
    'android/content/pm/ApplicationInfo.java': '''package android.content.pm;public class ApplicationInfo {public int uid=12001;}''',
    'android/content/pm/PackageInfo.java': '''package android.content.pm;public class PackageInfo {
      public long version=260029,lastUpdateTime=123456789;public long getLongVersionCode(){return version;}
    }''',
    'android/content/pm/PackageManager.java': '''package android.content.pm;public class PackageManager {
      public final ApplicationInfo app=new ApplicationInfo();public final PackageInfo info=new PackageInfo();
      public boolean missing,wrongPackages;public Runnable onInfo;
      public ApplicationInfo getApplicationInfo(String p,int flags)throws Exception {if(missing)throw new Exception("missing");return app;}
      public PackageInfo getPackageInfo(String p,int flags)throws Exception {if(missing)throw new Exception("missing");if(onInfo!=null){Runnable r=onInfo;onInfo=null;r.run();}return info;}
      public String[] getPackagesForUid(int uid){return uid!=app.uid?null:new String[]{wrongPackages?"wrong.package":"com.zte.mifavor.launcher"};}
    }''',
    'ls/augment/com/BuildConfig.java': '''package ls.augment.com;final class BuildConfig {static int VERSION_CODE=20536;}''',
    'ls/augment/com/AppConfig.java': '''package ls.augment.com;final class AppConfig {static final String DIAGNOSTICS="ls_augment_diagnostics_v2";}''',
    'ls/augment/com/DiagnosticEvidenceStore.java': '''package ls.augment.com;final class DiagnosticEvidenceStore {static final String STORE="diagnostic-evidence-v1";}''',
    'ls/augment/com/RecentsCardRadiusOptions.java': f'''package ls.augment.com;final class RecentsCardRadiusOptions {{static final int MIN={minimum},MAX={maximum};}}''',
    'ls/augment/com/ProviderEntry.java': '''package ls.augment.com;import android.os.*;import android.content.Context;
      final class ProviderEntry {final Context context;String caller="com.zte.mifavor.launcher";boolean rejectPackage;
        ProviderEntry(Context context){this.context=context;}Context getContext(){return context;}
        String getCallingPackage(){if(rejectPackage)throw new SecurityException();return caller;}
        Bundle call(String method,String arg,Bundle extras){Bundle result=new Bundle();''' + route + '''return result;}}
    ''',
    'ls/augment/com/ResetCleanupEntry.java': '''package ls.augment.com;import android.content.Context;
      final class ResetCleanupEntry {static void clear(Context app){''' + reset_cleanup + '''}}
    ''',
    'ls/augment/com/ModuleResetStorage.java': '''package ls.augment.com;import android.content.Context;
      final class ModuleResetStorage {static boolean fail;
        static void clear(Context app){if(fail)throw new IllegalStateException("storage clear failed");
          app.getSharedPreferences(RecentsCardRadiusStore.PREFS,Context.MODE_PRIVATE).edit().clear().commit();}}
    ''',
}

HARNESS = r'''package ls.augment.com;
import android.content.*;import android.content.pm.*;import android.os.*;
import java.nio.file.*;import java.util.*;import java.util.concurrent.*;import org.json.*;
public final class TestRecentsRadiusStore {
 static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static class Prefs implements SharedPreferences {
  final Path path;Map<String,Object> memory=new LinkedHashMap<>();int commits,applies;boolean fail;
  Prefs(Path path){this.path=path;try{if(Files.exists(path))memory.putAll(new JSONObject(Files.readString(path)).toMap());}catch(Exception e){throw new AssertionError(e);}}
  public Map<String,?> getAll(){return new LinkedHashMap<>(memory);}public boolean contains(String k){return memory.containsKey(k);}
  public String getString(String k,String d){Object v=memory.get(k);return v instanceof String?(String)v:d;}
  public Editor edit(){return new Edit();}
  class Edit implements Editor {
   final Map<String,Object> values=new LinkedHashMap<>(memory);
   public Editor putString(String k,String v){values.put(k,v);return this;}public Editor putBoolean(String k,boolean v){values.put(k,v);return this;}
   public Editor putLong(String k,long v){values.put(k,v);return this;}public Editor putInt(String k,int v){values.put(k,v);return this;}
   public Editor putFloat(String k,float v){values.put(k,v);return this;}public Editor remove(String k){values.remove(k);return this;}
   public Editor clear(){values.clear();return this;}
   public boolean commit(){commits++;memory=new LinkedHashMap<>(values);if(fail){fail=false;return false;}
    try{Files.createDirectories(path.getParent());Files.writeString(path,new JSONObject(memory).toString());return true;}catch(Exception e){throw new AssertionError(e);}}
   public void apply(){applies++;commit();}
  }
 }
 static class App extends Context {
  final Path root;final PackageManager pm=new PackageManager();final Map<String,Prefs> all=new HashMap<>();
  final ContentResolver resolver=new ContentResolver();volatile CountDownLatch readGate;
  final CountDownLatch backgroundRead=new CountDownLatch(1);volatile Thread reader;
  App(Path root){this.root=root;}public PackageManager getPackageManager(){return pm;}
  public ContentResolver getContentResolver(){return resolver;}
  public Prefs getSharedPreferences(String name,int mode){
   check(mode==MODE_PRIVATE,"must use private preferences");
   check(Set.of(RecentsCardRadiusStore.PREFS,AppConfig.DIAGNOSTICS,DiagnosticEvidenceStore.STORE).contains(name),"unexpected storage: "+name);
   check(Binder.uid==android.os.Process.myUid(),"private storage access before Binder identity clear");
   try{if(readGate!=null)readGate.await(2,TimeUnit.SECONDS);}catch(InterruptedException error){throw new AssertionError(error);}
   if(Thread.currentThread().getName().equals("lsa-recents-radius-cache-check")){reader=Thread.currentThread();backgroundRead.countDown();}
   return all.computeIfAbsent(name,n->new Prefs(root.resolve(n+".json")));
  }
 }
 static JSONObject payload(){return new JSONObject().put("schema",2).put("build",BuildConfig.VERSION_CODE).put("pid",Binder.pid)
  .put("launcherVersion",260029L).put("densityDpi",520).put("displayWidthPx",1216).put("displayHeightPx",2688)
  .put("rotation",0).put("minOffsetDp",-16).put("maxOffsetDp",96).put("nativeRadiusDp",16d).put("maxRadiusDp",111.39446)
  .put("observedElapsed",1).put("firmware","forged-firmware").put("launcherLastUpdateTime",3).put("extra","discard");}
 static Bundle publish(ProviderEntry provider,JSONObject data){Bundle extras=new Bundle();extras.putString("payload",data.toString());
  return publishRaw(provider,null,extras);}
 static Bundle publishRaw(ProviderEntry provider,String arg,Bundle extras){
  int old=Binder.uid;Binder.uid=provider.context.getPackageManager().app.uid;
  int calling=Binder.uid;Bundle result=provider.call("recents_radius_publish",arg,extras);
  check(Binder.uid==calling,"Binder identity not restored");Binder.uid=old;return result;}
 static RecentsCardRadiusUiRange load(App app){return RecentsCardRadiusStore.load(app,520,1216,2688);}
 static String raw(App app){return app.getSharedPreferences(RecentsCardRadiusStore.PREFS,0).getString(RecentsCardRadiusStore.KEY,"");}
 static void rejected(ProviderEntry provider,JSONObject data,String message){check(!publish(provider,data).getBoolean("ok",false),message);}
 public static void main(String[] args)throws Exception {
  App app=new App(Path.of(args[1]));ProviderEntry provider=new ProviderEntry(app);
  if("seed".equals(args[0])){check(publish(provider,payload()).getBoolean("ok",false),"seed disk");System.out.println("PASS seed persistent range");return;}
  if("restart".equals(args[0])){BuildConfig.VERSION_CODE++;Binder.pid=123;RecentsCardRadiusUiRange r=load(app);
   check(r!=null&&r.minOffsetDp==-16&&r.maxOffsetDp==96,"new JVM/build/PID must load saved geometry without elapsed or boot metadata");
   check(app.getSharedPreferences(RecentsCardRadiusStore.PREFS,0).commits==0,"read-only restart wrote preferences");
   RecentsCardRadiusStore.onProviderCreated(app);check(app.backgroundRead.await(2,TimeUnit.SECONDS),"one-shot background cache check ran");app.reader.join(2000);
   check(app.resolver.events==0,"existing persisted range must not emit a reset event on provider restart");
   String original=raw(app);Bundle duplicate=publish(provider,payload().put("nativeRadiusDp",16.000000337).put("maxRadiusDp",111.8277926));
   check(duplicate.getBoolean("ok",false)&&!duplicate.getBoolean("changed",true),"same slider endpoints after a new JVM ignore legitimate float differences");
   check(raw(app).equals(original)&&app.getSharedPreferences(RecentsCardRadiusStore.PREFS,0).commits==0,"cross-process float-only change preserves original complete record without disk writes");
   System.out.println("PASS new JVM reload: "+checks+" assertions");return;}
  app.readGate=new CountDownLatch(1);RecentsCardRadiusStore.onProviderCreated(app);
  check(app.resolver.events==0,"provider creation returned without waiting for private disk read");app.readGate.countDown();
  check(app.resolver.notified.await(2,TimeUnit.SECONDS),"missing private cache emits reset event");app.readGate=null;
  check(app.resolver.eventThread!=Thread.currentThread(),"provider cold-start read/notification stays off main");
  check(app.resolver.uri.equals("content://ls.augment.com.config/recents-radius-reset"),"dedicated reset URI");
  RecentsCardRadiusStore.onProviderCreated(app);check(app.resolver.events==1,"provider check scheduled only once");
  check(load(app)==null,"missing must not manufacture range");
  Prefs prefs=app.getSharedPreferences(RecentsCardRadiusStore.PREFS,0);
  provider.caller="wrong.package";rejected(provider,payload(),"wrong caller package");provider.caller=null;rejected(provider,payload(),"null caller package");
  provider.caller="com.zte.mifavor.launcher";provider.rejectPackage=true;rejected(provider,payload(),"getCallingPackage security rejection");provider.rejectPackage=false;
  app.pm.wrongPackages=true;rejected(provider,payload(),"UID package list mismatch");app.pm.wrongPackages=false;
  app.pm.app.uid=112001;rejected(provider,payload(),"different Android user");app.pm.app.uid=12001;
  Binder.uid=14000;Bundle direct=new Bundle();direct.putString("payload",payload().toString());
  check(!provider.call("recents_radius_publish",null,direct).getBoolean("ok",false),"different UID cannot impersonate launcher");Binder.uid=10055;
  rejected(provider,payload().put("pid",8001),"payload PID mismatch");rejected(provider,payload().put("pid",8000.5),"fractional PID");
  rejected(provider,payload().put("build",BuildConfig.VERSION_CODE-1),"wrong module build");
  rejected(provider,payload().put("launcherVersion",260028),"wrong launcher version");
  rejected(provider,payload().put("schema",1),"legacy schema not migrated blindly");
  rejected(provider,payload().put("maxOffsetDp",95),"endpoint inconsistent with geometry");
  rejected(provider,payload().put("densityDpi","520"),"numeric string is not a measured number");
  rejected(provider,payload().put("rotation",5),"invalid overview direction");
  rejected(provider,payload().put("minOffsetDp",0),"invalid native endpoint");
  rejected(provider,payload().put("displayWidthPx",0),"empty screen");
  app.pm.missing=true;rejected(provider,payload(),"missing launcher");app.pm.missing=false;
  check(!publishRaw(provider,null,null).getBoolean("ok",false),"missing extras");
  check(!publishRaw(provider,"unexpected",direct).getBoolean("ok",false),"provider arg rejected");
  Bundle bad=new Bundle();bad.putString("payload","{");check(!publishRaw(provider,null,bad).getBoolean("ok",false),"malformed JSON");
  bad.putString("payload","x".repeat(4097));check(!publishRaw(provider,null,bad).getBoolean("ok",false),"bounded input");
  check(prefs.commits==0&&load(app)==null,"rejected requests never write or enable range");
  for(String name:List.of(AppConfig.DIAGNOSTICS,DiagnosticEvidenceStore.STORE))app.getSharedPreferences(name,0).edit()
   .putString(RecentsCardRadiusRange.DIAGNOSTIC,"old-range").putString("unrelated","keep").commit();
  Bundle saved=publish(provider,payload());check(saved.getBoolean("ok",false)&&saved.getBoolean("changed",false),"valid measured range stored");
  check(prefs.commits==1&&prefs.getAll().size()==1,"exactly one bounded record");
  JSONObject canonical=new JSONObject(raw(app));check(canonical.length()==12,"only normalized geometry and environment fields persist");
  check(!canonical.has("pid")&&!canonical.has("build")&&!canonical.has("observedElapsed")&&!canonical.has("extra"),"transport metadata stripped");
  check(canonical.getString("firmware").equals(Build.FINGERPRINT)&&canonical.getLong("launcherLastUpdateTime")==app.pm.info.lastUpdateTime,"provider environment overrides supplied identity");
  check(load(app)!=null&&load(app).maxOffsetDp==96,"committed range available immediately");
  for(String name:List.of(AppConfig.DIAGNOSTICS,DiagnosticEvidenceStore.STORE)){
   Prefs old=app.getSharedPreferences(name,0);check(!old.contains(RecentsCardRadiusRange.DIAGNOSTIC)&&old.getString("unrelated","").equals("keep"),"only old radius keys removed");}
  Binder.pid=9000;saved=publish(provider,payload().put("observedElapsed",999999999));
  check(saved.getBoolean("ok",false)&&!saved.getBoolean("changed",true)&&prefs.commits==1,"new PID/time deduplicates same measured geometry");
  String original=raw(app);saved=publish(provider,payload().put("nativeRadiusDp",16.000000337).put("maxRadiusDp",111.8277926));
  check(saved.getBoolean("ok",false)&&!saved.getBoolean("changed",true)&&raw(app).equals(original)&&prefs.commits==1,"same effective endpoints retain old full geometry despite float differences");
  rejected(provider,payload().put("nativeRadiusDp",17d),"same stable fields cannot bypass incoming geometry validation");
  BuildConfig.VERSION_CODE++;check(load(app)!=null,"module rebuild alone does not expire cached geometry");
  check(RecentsCardRadiusStore.load(app,520,2688,1216)!=null,"portrait settings can use last landscape-sized screen");
  check(RecentsCardRadiusStore.load(app,480,1216,2688)==null,"density change invalidates");
  check(RecentsCardRadiusStore.load(app,520,1080,2688)==null,"screen size change invalidates");
  app.pm.info.version++;check(load(app)==null,"launcher version change invalidates");app.pm.info.version--;
  app.pm.info.lastUpdateTime++;check(load(app)==null,"same version reinstall invalidates");app.pm.info.lastUpdateTime--;
  Build.FINGERPRINT="firmware-b";check(load(app)==null,"firmware update invalidates");Build.FINGERPRINT="firmware-a";
  app.pm.missing=true;check(load(app)==null,"uninstalled launcher invalidates");app.pm.missing=false;
  check(prefs.commits==1,"validation never overwrites saved record");
  String before=raw(app);JSONObject changed=payload().put("rotation",1).put("maxRadiusDp",90.1).put("maxOffsetDp",75);
  prefs.fail=true;check(!publish(provider,changed).getBoolean("ok",true),"failed disk commit is not successful publication");
  check(load(app).maxOffsetDp==96,"optimistic SharedPreferences memory cannot expose a failed range");
  check(raw(app).equals(before)==false,"fixture models Android memory-before-disk failure");
  check(new JSONObject(Files.readString(prefs.path)).getString(RecentsCardRadiusStore.KEY).equals(before),"failed commit leaves persisted range intact");
  saved=publish(provider,changed);check(saved.getBoolean("ok",false)&&saved.getBoolean("changed",false),"retry must really commit after a failed write");
  check(load(app).maxOffsetDp==75,"successful newer range replaces old one");
  app.pm.onInfo=()->{ResetWriteFence.begin();ResetWriteFence.end();};
  rejected(provider,payload(),"reset generation advanced during package lookup rejects stale publisher");
  check(load(app).maxOffsetDp==75,"stale publish preserves saved record");
  ModuleResetStorage.fail=true;ResetWriteFence.begin();try{boolean failed=false;try{ResetCleanupEntry.clear(app);}catch(IllegalStateException error){failed=true;}
   check(failed&&app.resolver.events==1&&prefs.contains(RecentsCardRadiusStore.KEY),"failed storage clear must not notify or discard acknowledged record");
  }finally{ResetWriteFence.end();ModuleResetStorage.fail=false;}
  app.resolver.onNotify=()->{check(ResetWriteFence.active(),"reset notification must run before write fence is released");check(!prefs.contains(RecentsCardRadiusStore.KEY),"reset event must follow successful private storage clear");};
  ResetWriteFence.begin();try{rejected(provider,payload(),"active reset rejects even owner-thread publication");check(load(app)==null,"active reset has no reusable range");ResetCleanupEntry.clear(app);}finally{ResetWriteFence.end();}
  check(app.resolver.events==2,"one explicit reset notification after storage clear");app.resolver.onNotify=null;
  check(load(app)==null,"reset generation invalidates in-process durable snapshot");
  rejected(provider,payload(),"old in-flight observation cannot resurrect cleared range");
  rejected(provider,payload().put("observedElapsed",SystemClock.now),"observation at reset cutoff is old");
  check(load(app)==null,"rejected old observations leave storage empty");
  check(publish(provider,payload().put("observedElapsed",SystemClock.now+1)).getBoolean("ok",false),"fresh post-reset measurement can save");
  App reopened=new App(app.root);check(load(reopened)!=null,"fresh context reads persisted record");
  JSONObject corruptGeometry=new JSONObject(raw(reopened)).put("maxRadiusDp",1d);
  reopened.getSharedPreferences(RecentsCardRadiusStore.PREFS,0).edit().putString(RecentsCardRadiusStore.KEY,corruptGeometry.toString()).commit();
  App repair=new App(app.root);check(load(repair)==null,"same stored endpoints with corrupt native geometry are unusable");
  saved=publish(new ProviderEntry(repair),payload().put("observedElapsed",SystemClock.now+1));
  check(saved.getBoolean("ok",false)&&saved.getBoolean("changed",false)&&load(repair)!=null,"valid measurement repairs corrupt geometry even when stable endpoints match");
  repair.getSharedPreferences(RecentsCardRadiusStore.PREFS,0).edit().putString(RecentsCardRadiusStore.KEY,"{").commit();
  check(load(new App(app.root))==null,"corrupt disk JSON remains unavailable");
  check(Binder.clears==Binder.restores,"all provider branches restore Binder identity");
  System.out.println("PASS private range store/provider: "+checks+" assertions");
 }
}
'''

with tempfile.TemporaryDirectory(prefix='recents-radius-store-') as temporary:
    root = Path(temporary)
    files = []
    for name, source in STUBS.items():
        path = root / 'src' / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        files.append(path)
    harness = root / 'src/ls/augment/com/TestRecentsRadiusStore.java'
    harness.write_text(HARNESS, encoding='utf-8')
    files.append(harness)
    files.extend(SRC / name for name in ('RecentsCardRadiusStore.java', 'RecentsCardRadiusUiRange.java',
                                        'RecentsCardRadiusRange.java', 'DurablePreferences.java', 'ResetWriteFence.java'))
    files.append(ROOT / 'tools/TestRecentsCardRadiusUiRange.java')
    classes = root / 'classes'
    classes.mkdir()
    subprocess.run([JAVAC, '-encoding', 'UTF-8', '--release', '17', '-cp', str(JSON),
                    '-d', str(classes), *map(str, files)], check=True)
    cp = os.pathsep.join((str(classes), str(JSON)))
    subprocess.run([JAVA, '-cp', cp, 'ls.augment.com.TestRecentsCardRadiusUiRange'], check=True)
    for mode, folder in [('all', 'all'), ('seed', 'restart'), ('restart', 'restart')]:
        subprocess.run([JAVA, '-cp', cp, 'ls.augment.com.TestRecentsRadiusStore',
                        mode, str(root / folder)], check=True, timeout=30)
