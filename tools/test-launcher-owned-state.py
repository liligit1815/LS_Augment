"""Execute production launcher private store/client with Android boundary doubles.

The real serializer, provider route, reset fence and client queues are exercised.
Legacy CE/DE files and module private files live only in temporary fixture directories.
"""
from pathlib import Path
import os
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / 'android/app/src/main/java/ls/augment/com'
BASE = runpy.run_path(str(ROOT / 'tools/test-gfrc-recovery-store.py'))
STUBS = {k: v for k, v in BASE['STUBS'].items() if not any(x in k for x in ('ClientAccess', 'ContentResolver', 'SharedPreferences', 'Context.java', 'Settings.java'))}
STUBS.update({
 'android/os/Process.java': '''package android.os;public class Process {public static final ThreadLocal<Integer> uid=ThreadLocal.withInitial(()->12000);public static int myUid(){return uid.get();}}''',
 'android/os/UserManager.java':'package android.os;public class UserManager {public volatile boolean unlocked=true;public boolean isUserUnlocked(){return unlocked;}}',
 'android/util/Log.java':'package android.util;public class Log {public static int i(String tag,String text){return 0;}}',
 'android/content/pm/ApplicationInfo.java':'package android.content.pm;public class ApplicationInfo {public int uid=12000;}',
 'android/content/pm/PackageManager.java':'''package android.content.pm;public class PackageManager {public String[] packages={"com.zte.mifavor.launcher"};public int uid=12000;
 public ApplicationInfo getApplicationInfo(String p,int f){ApplicationInfo info=new ApplicationInfo();info.uid=uid;return info;}
 public String[] getPackagesForUid(int uid){return packages;}}''',
 'android/content/Context.java':'''package android.content;import java.io.File;public abstract class Context {public static final int MODE_PRIVATE=0;
 public abstract SharedPreferences getSharedPreferences(String n,int m);public abstract android.content.pm.PackageManager getPackageManager();
 public abstract ContentResolver getContentResolver();public abstract File getDataDir();public abstract String getPackageName();
 public Context getApplicationContext(){return this;}public abstract Context createCredentialProtectedStorageContext();
 public abstract Context createDeviceProtectedStorageContext();public abstract boolean deleteSharedPreferences(String n);
 public final android.os.UserManager users=new android.os.UserManager();public <T>T getSystemService(Class<T> type){return type.cast(users);}
 }''',
 'android/content/SharedPreferences.java':'''package android.content;import java.util.*;public interface SharedPreferences {
 Map<String,?> getAll();boolean contains(String k);String getString(String k,String d);int getInt(String k,int d);boolean getBoolean(String k,boolean d);
 long getLong(String k,long d);float getFloat(String k,float d);Set<String> getStringSet(String k,Set<String>d);Editor edit();
 interface OnSharedPreferenceChangeListener {void onSharedPreferenceChanged(SharedPreferences p,String k);}
 void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l);void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l);
 interface Editor {Editor putString(String k,String v);Editor putInt(String k,int v);Editor putBoolean(String k,boolean v);Editor putLong(String k,long v);
 Editor putFloat(String k,float v);Editor putStringSet(String k,Set<String>v);Editor remove(String k);Editor clear();boolean commit();void apply();}}
 ''',
 'android/content/ContentResolver.java':'''package android.content;import android.os.*;public class ContentResolver {
 public java.util.function.BiFunction<String,Bundle,Bundle> target;public volatile int calls,lost;public volatile boolean unavailable;public long delay;public volatile Error error;
 public Bundle call(android.net.Uri uri,String method,String arg,Bundle extras){calls++;
 if(!Thread.currentThread().getName().equals("LSA-LauncherPrivateState"))throw new AssertionError("durable client IO on UI/caller thread");
 if(error!=null)throw error;if(unavailable)throw new IllegalStateException("unavailable");if(delay>0){long d=delay;delay=0;try{Thread.sleep(d);}catch(Exception e){throw new AssertionError(e);}}
 Bundle result=target.apply(method,extras);if(lost>0&&method.endsWith("write")){lost--;throw new IllegalStateException("lost ACK");}return result;}}
 ''',
 'ls/augment/com/ConfigSnapshot.java':'package ls.augment.com;public class ConfigSnapshot {public final long revision;public ConfigSnapshot(long r){revision=r;}}',
 'ls/augment/com/AppConfig.java':'package ls.augment.com;class AppConfig {static long revision=77;AppConfig(android.content.Context c){}ConfigSnapshot configSnapshot(){return new ConfigSnapshot(revision);}}',
 'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;class FeatureSettings {static long revision=77;
 static final java.util.Map<String,String> diagnostics=new java.util.concurrent.ConcurrentHashMap<>();
 static ls.augment.com.ConfigSnapshot snapshot(android.content.Context c){return new ls.augment.com.ConfigSnapshot(revision);}
 static void diagnostic(android.content.Context c,String k,String v){diagnostics.put(k,v);} }
 ''',
 'ls/augment/com/hook/LauncherResetHook.java':'''package ls.augment.com.hook;class LauncherResetHook {static boolean reject;
 static void validateStorage(android.content.Context c,int user,int uid,String name)throws Exception {
 if(reject||!c.getPackageName().equals("com.zte.mifavor.launcher")||uid!=12000||user!=0
 ||!java.util.Set.of("ls_augment_launcher_grid_state","ls_augment_launcher_pages").contains(name))throw new java.io.IOException("invalid legacy identity");}}
 ''',
 'ls/augment/com/hook/LauncherClientAccess.java':'''package ls.augment.com.hook;import android.content.*;import java.util.concurrent.*;
 public class LauncherClientAccess {
 public static SharedPreferences prefs(Context c,String kind){return LauncherOwnedStateClient.preferences(c,kind);}
 public static SharedPreferences ready(Context c,String kind){return LauncherOwnedStateClient.readyPreferences(c,kind);}
 public static void preload(Context c){LauncherOwnedStateClient.preload(c);}
 public static void drain()throws Exception{var f=LauncherOwnedStateClient.class.getDeclaredField("IO");f.setAccessible(true);((ExecutorService)f.get(null)).submit(()->{}).get(5,TimeUnit.SECONDS);}
 public static void reset()throws Exception{drain();var f=LauncherOwnedStateClient.class.getDeclaredField("RECORDS");f.setAccessible(true);((java.util.Map<?,?>)f.get(null)).clear();FeatureSettings.revision=77;LauncherResetHook.reject=false;FeatureSettings.diagnostics.clear();}
 public static String diagnostic(String kind){return FeatureSettings.diagnostics.get("ls_augment_launcher_private_state_"+kind);}
 public static void retryNow(String kind)throws Exception{var r=LauncherOwnedStateClient.class.getDeclaredField("RECORDS");r.setAccessible(true);Object record=((java.util.Map<?,?>)r.get(null)).get(kind);var method=record.getClass().getDeclaredMethod("load");method.setAccessible(true);var e=LauncherOwnedStateClient.class.getDeclaredField("IO");e.setAccessible(true);((ExecutorService)e.get(null)).submit(()->{try{method.invoke(record);}catch(Exception failure){throw new RuntimeException(failure);}}).get(5,TimeUnit.SECONDS);}
 public static boolean fatal(Throwable value)throws Exception{var m=LauncherOwnedStateClient.class.getDeclaredMethod("throwIfFatal",Throwable.class);m.setAccessible(true);try{m.invoke(null,value);return false;}catch(java.lang.reflect.InvocationTargetException failure){return failure.getCause()==value;}}
 public static void revision(long value){FeatureSettings.revision=value;}public static void rejectLegacy(boolean v){LauncherResetHook.reject=v;}
 public static boolean dirty(SharedPreferences p){return LauncherOwnedStateClient.needsSave(p);}
 public static boolean clear(Context c){return LauncherOwnedStateClient.clearPagesForReset(c,new ls.augment.com.LauncherResetPolicy.Request("nonce",0,0,12000,20539,77,"",0,0,1));}
 }
 ''',
})

HARNESS = r'''package ls.augment.com;
import android.content.*;import android.content.pm.*;import android.os.*;import java.nio.file.*;import java.util.*;
import org.json.*;import ls.augment.com.hook.LauncherClientAccess;
public class TestLauncherOwnedState {
 static int checks;static List<String> events=new ArrayList<>();
 static void check(boolean v,String m){checks++;if(!v)throw new AssertionError(m);}
 interface Action {void run()throws Exception;}static void fail(Action r,String m)throws Exception{boolean e=false;try{r.run();}catch(Exception x){e=true;}check(e,m);}
 static class Prefs implements SharedPreferences {
  final Path path;Map<String,Object> memory=new LinkedHashMap<>();boolean fail;int commits;
  Prefs(Path path){this.path=path;try{if(Files.exists(path))memory.putAll(new JSONObject(Files.readString(path)).toMap());}catch(Exception e){throw new AssertionError(e);}}
  public Map<String,?> getAll(){return new LinkedHashMap<>(memory);}public boolean contains(String k){return memory.containsKey(k);}
  public String getString(String k,String d){Object v=memory.get(k);return v instanceof String?(String)v:d;}
  public int getInt(String k,int d){Object v=memory.get(k);return v instanceof Integer?(Integer)v:d;}public boolean getBoolean(String k,boolean d){Object v=memory.get(k);return v instanceof Boolean?(Boolean)v:d;}
  public long getLong(String k,long d){return d;}public float getFloat(String k,float d){return d;}public Set<String> getStringSet(String k,Set<String>d){return d;}
  public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){}public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){}
  public Editor edit(){return new Edit();}
  class Edit implements Editor {Map<String,Object> next=new LinkedHashMap<>(memory);
   public Editor putString(String k,String v){if(v==null)next.remove(k);else next.put(k,v);return this;}public Editor putInt(String k,int v){next.put(k,v);return this;}
   public Editor putBoolean(String k,boolean v){next.put(k,v);return this;}public Editor putLong(String k,long v){next.put(k,v);return this;}public Editor putFloat(String k,float v){next.put(k,v);return this;}
   public Editor putStringSet(String k,Set<String>v){throw new UnsupportedOperationException();}public Editor remove(String k){next.remove(k);return this;}public Editor clear(){next.clear();return this;}
   public boolean commit(){memory=new LinkedHashMap<>(next);commits++;if(fail){fail=false;return false;}
    try{Files.createDirectories(path.getParent());Files.writeString(path,new JSONObject(memory).toString());}catch(Exception e){throw new AssertionError(e);}
    events.add("commit:"+path.getFileName());return true;}public void apply(){commit();}}
 }
 static class App extends Context {
  final Path path;final boolean module;final PackageManager pm=new PackageManager();final ContentResolver resolver=new ContentResolver();
  final Map<String,Prefs> prefs=new HashMap<>();App ce,de;boolean deleteFails;final ProviderEntry provider;
  App(Path p,boolean m)throws Exception{path=p;module=m;Files.createDirectories(p);provider=new ProviderEntry(this);ce=de=this;}
  public Prefs getSharedPreferences(String n,int mode){check(mode==MODE_PRIVATE,"private prefs only");
   if(module)check(Set.of(LauncherOwnedStateStore.GRID_PREFS,LauncherOwnedStateStore.PAGES_PREFS).contains(n),"private store scope");
   return prefs.computeIfAbsent(n,k->new Prefs(path.resolve("shared_prefs/"+k+".xml")));}
  public java.io.File getDataDir(){return path.toFile();}public String getPackageName(){return module?"ls.augment.com":"com.zte.mifavor.launcher";}
  public PackageManager getPackageManager(){return pm;}public ContentResolver getContentResolver(){return resolver;}
  public Context createCredentialProtectedStorageContext(){return ce;}public Context createDeviceProtectedStorageContext(){return de;}
  public boolean deleteSharedPreferences(String n){events.add("delete:"+n);if(deleteFails)return false;
   try{Files.deleteIfExists(path.resolve("shared_prefs/"+n+".xml"));Files.deleteIfExists(path.resolve("shared_prefs/"+n+".xml.bak"));return true;}catch(Exception e){throw new AssertionError(e);}}
 }
 static class Fixture {
  final App module,host,de;
  Fixture(Path root)throws Exception{LauncherClientAccess.reset();AppConfig.revision=77;Binder.uid=12000;Binder.pid=88;events.clear();
   module=new App(root.resolve("module"),true);host=new App(root.resolve("host"),false);de=new App(root.resolve("host-de"),false);host.de=de;de.ce=host;
   host.resolver.target=(method,b)->{
    android.os.Process.uid.set(10055);Binder.uid=12000;
    try{if(method.equals("launcher_reset_pages_clear")){Bundle r=new Bundle();r.putBoolean("ok",LauncherOwnedStateStore.clearPagesForReset(module));return r;}
     return module.provider.call(method,null,b);
    }finally{android.os.Process.uid.set(12000);}
   };
  }
 }
 static Bundle readArgs(String kind){Bundle b=new Bundle();b.putInt("version",BuildConfig.VERSION_CODE);b.putString("kind",kind);return b;}
 static Bundle writeArgs(String kind,String old,String next,boolean importing){Bundle b=readArgs(kind);b.putString("expected",old);b.putString("payload",next);if(!importing)b.putLong("revision",AppConfig.revision);return b;}
 static Bundle route(Fixture f,String method,Bundle b){android.os.Process.uid.set(10055);try{return f.module.provider.call(method,null,b);}finally{android.os.Process.uid.set(12000);}}
 static boolean ok(Bundle b){return b.getBoolean("ok",false);}static String get(Fixture f,String kind){return route(f,"launcher_owned_read",readArgs(kind)).getString("payload");}
 static boolean put(Fixture f,String kind,String before,String next){return ok(route(f,"launcher_owned_write",writeArgs(kind,before,next,false)));}
 static Map<String,Object> grid(){return Map.of("original_rows",6,"original_columns",4,"effective_rows",7,"effective_columns",5,"owned",true,"migration_pending",false);}
 static void seed(App a,String name,Map<String,?> values){Prefs p=a.getSharedPreferences(name,0);p.memory.putAll(values);check(p.edit().commit(),"seed legacy");}
 static boolean exists(App a,String name){return Files.exists(a.path.resolve("shared_prefs/"+name+".xml"));}
 public static void main(String[] args)throws Exception {
  Path root=Path.of(args[1]);String grid=LauncherOwnedStateData.encode("grid",grid()),pages="{\"order\":\"20,10\",\"keep_empty\":true}";
  Fixture f=new Fixture(root.resolve(args[0]));
  if(args[0].equals("seed")){check(put(f,"grid","{}",grid),"persist grid");return;}
  if(args[0].equals("restart")){Fixture saved=new Fixture(root.resolve("seed"));check(get(saved,"grid").equals(grid),"new JVM keeps module private originals");System.out.println("PASS launcher new-JVM persistence "+checks);return;}
  check(get(f,"grid").equals("{}"),"empty record");
  for(int uid:new int[]{0,1000,10055,112000}){Binder.uid=uid;check(!ok(route(f,"launcher_owned_read",readArgs("grid"))),"unauthorized UID");}Binder.uid=12000;
  f.module.provider.caller="android";check(!ok(route(f,"launcher_owned_read",readArgs("grid"))),"wrong package");f.module.provider.caller="com.zte.mifavor.launcher";
  f.module.pm.packages=new String[]{"com.zte.mifavor.launcher","shared"};check(!ok(route(f,"launcher_owned_read",readArgs("grid"))),"shared UID denied");f.module.pm.packages=new String[]{"com.zte.mifavor.launcher"};
  Bundle b=readArgs("grid");b.putString("version","20539");check(!ok(route(f,"launcher_owned_read",b)),"strict version type");
  for(String bad:new String[]{"{}x","{\"owned\":true}","{\"original_rows\":0}","{\"native_key\":1}","{\"effective_rows\":\"7\"}"})check(!put(f,"grid","{}",bad),"invalid grid data");
  for(String bad:new String[]{"{\"order\":\"1,1\"}","{\"order\":\"-1\"}","{\"keep_empty\":1}","{\"order\":\"9999999999\"}"})check(!put(f,"pages","{}",bad),"invalid pages");
  Prefs gp=f.module.getSharedPreferences(LauncherOwnedStateStore.GRID_PREFS,0);gp.fail=true;check(!put(f,"grid","{}",grid),"failed disk never ACKs");check(get(f,"grid").equals("{}"),"optimistic prefs cannot fake persistence");
  check(put(f,"grid","{}",grid),"retry persists");int writes=gp.commits;check(put(f,"grid","{}",grid)&&gp.commits==writes,"lost ACK idempotence");
  check(!put(f,"grid","{}","{}"),"stale clear cannot overwrite owner");
  b=writeArgs("grid",grid,"{}",false);b.putLong("revision",76);check(!ok(route(f,"launcher_owned_write",b)),"stale configuration cannot clear");
  check(put(f,"pages","{}",pages),"independent page state");ResetWriteFence.begin();try{
   check(!put(f,"pages",get(f,"pages"),"{}"),"ordinary page clear forbidden in reset");check(!put(f,"grid",grid,grid),"grid takeover forbidden in reset");
   check(LauncherOwnedStateStore.clearPagesForReset(f.module),"trusted reset clears pages");check(get(f,"grid").equals(grid),"reset preserves grid original");
   Map<String,Object> restored=new LinkedHashMap<>(grid());restored.put("effective_rows",6);restored.put("effective_columns",4);
   check(put(f,"grid",grid,LauncherOwnedStateData.encode("grid",restored)),"native geometry recovery progress allowed during reset");
  }finally{ResetWriteFence.end();}
  f=new Fixture(root.resolve("migrate"));seed(f.host,"ls_augment_launcher_grid_state",grid());seed(f.de,"ls_augment_launcher_grid_state",grid());
  seed(f.host,"ls_augment_launcher_pages",Map.of("order","20,10","keep_empty",true));seed(f.host,"native",Map.of("launcher.default_screen",1));events.clear();
  LauncherClientAccess.preload(f.host);SharedPreferences gridPrefs=LauncherClientAccess.prefs(f.host,"grid"),pagePrefs=LauncherClientAccess.prefs(f.host,"pages");LauncherClientAccess.drain();
  check(gridPrefs.getInt("original_columns",0)==4&&pagePrefs.getString("order","").equals("20,10"),"real client loads both migrated records");
  check(!exists(f.host,"ls_augment_launcher_grid_state")&&!exists(f.de,"ls_augment_launcher_grid_state")&&!exists(f.host,"ls_augment_launcher_pages"),"CE DE exact legacy files deleted");
  check(exists(f.host,"native"),"native launcher prefs never deleted");
  check(events.indexOf("commit:"+LauncherOwnedStateStore.GRID_PREFS+".xml")<events.indexOf("delete:ls_augment_launcher_grid_state"),"private durability before source deletion");
  f.host.resolver.lost=1;check(gridPrefs.edit().putBoolean("migration_pending",true).commit(),"client retries lost private commit ACK");
  check(!exists(f.host,"ls_augment_launcher_grid_state"),"subsequent recovery writes cannot recreate host file");
  pagePrefs.edit().putString("order","10,20").apply();check(pagePrefs.getString("order","").equals("10,20"),"page edits immediately in memory");LauncherClientAccess.drain();
  check(LauncherOwnedStateData.decode("pages",get(f,"pages")).get("order").equals("10,20"),"page state asynchronously committed privately");
  AppConfig.revision=78;pagePrefs.edit().putString("order","20,10").apply();LauncherClientAccess.drain();
  check(LauncherClientAccess.dirty(pagePrefs)&&LauncherOwnedStateData.decode("pages",get(f,"pages")).get("order").equals("10,20"),"rejected stale revision keeps pending page intent");
  LauncherClientAccess.revision(78);pagePrefs.edit().putString("order","20,10").apply();LauncherClientAccess.drain();
  check(!LauncherClientAccess.dirty(pagePrefs)&&LauncherOwnedStateData.decode("pages",get(f,"pages")).get("order").equals("20,10"),"next verified lifecycle can commit same intended page order");
  ResetWriteFence.begin();try{check(LauncherClientAccess.clear(f.host),"client paused pages reset clears provider and memory");check(pagePrefs.getAll().isEmpty(),"same cached view sees reset");}finally{ResetWriteFence.end();}
  check(LauncherOwnedStateStore.pendingGrid(f.module)&&!LauncherOwnedStateStore.pagesHistory(f.module),"grid restore responsibility independent from page reset");
  f=new Fixture(root.resolve("save-failure"));seed(f.host,"ls_augment_launcher_grid_state",grid());f.module.getSharedPreferences(LauncherOwnedStateStore.GRID_PREFS,0).fail=true;final Fixture saveFailure=f;
  fail(()->LauncherClientAccess.prefs(saveFailure.host,"grid"),"legacy migration fails if private disk fails");check(exists(f.host,"ls_augment_launcher_grid_state"),"failed import source retained");
  f=new Fixture(root.resolve("legacy-conflict"));seed(f.host,"ls_augment_launcher_pages",Map.of("order","1,2"));seed(f.de,"ls_augment_launcher_pages",Map.of("order","2,1"));final Fixture conflict=f;
  fail(()->LauncherClientAccess.prefs(conflict.host,"pages"),"different CE DE records not silently overwritten");check(exists(f.host,"ls_augment_launcher_pages")&&exists(f.de,"ls_augment_launcher_pages"),"conflicting sources retained");
  f=new Fixture(root.resolve("delete-failure"));seed(f.host,"ls_augment_launcher_pages",Map.of("order","1,2"));f.host.deleteFails=true;final Fixture deletion=f;
  fail(()->LauncherClientAccess.prefs(deletion.host,"pages"),"file deletion failure visible");check(LauncherOwnedStateData.decode("pages",get(f,"pages")).get("order").equals("1,2"),"durable module copy survives cleanup failure");
  f.host.deleteFails=false;LauncherClientAccess.reset();check(LauncherClientAccess.prefs(f.host,"pages").getString("order","").equals("1,2"),"cleanup retry does not discard imported pages");
  check(!exists(f.host,"ls_augment_launcher_pages"),"retry removes emptied legacy file");
  f=new Fixture(root.resolve("delayed"));f.host.resolver.delay=1600;final Fixture delayed=f;long started=System.nanoTime();
  fail(()->LauncherClientAccess.prefs(delayed.host,"grid"),"startup wait bounded");check((System.nanoTime()-started)/1000000<1500,"no indefinite launcher startup wait");LauncherClientAccess.drain();
  check(LauncherClientAccess.prefs(f.host,"grid").getAll().isEmpty(),"late read may serve next safe lifecycle without fabricating migration");
  f=new Fixture(root.resolve("provider-recovery"));seed(f.de,"ls_augment_launcher_pages",Map.of("order","20,10","keep_empty",true));
  f.host.resolver.unavailable=true;final Fixture recovering=f;
  long readyStart=System.nanoTime();check(LauncherClientAccess.ready(f.host,"pages")==null,"nonblocking lifecycle rejects a not-yet-loaded record");
  check((System.nanoTime()-readyStart)/1000000<100,"ready accessor never waits for provider startup");
  fail(()->LauncherClientAccess.prefs(recovering.host,"pages"),"first unavailable provider is explicitly failed, not an empty ready state");
  check(exists(f.de,"ls_augment_launcher_pages")&&f.host.resolver.calls==2,"unavailable private ACK preserves DE source and bounded immediate attempts");
  check(LauncherClientAccess.diagnostic("pages").contains("state=waiting_retry")&&LauncherClientAccess.diagnostic("pages").contains("phase=private_read"),"transient failure diagnostic includes kind and phase");
  f.host.resolver.unavailable=false;Thread.sleep(450);LauncherClientAccess.drain();
  check(LauncherClientAccess.prefs(f.host,"pages").getString("order","").equals("20,10"),"real scheduled retry loads original pages without restarting process");
  check(LauncherClientAccess.ready(f.host,"pages").getString("order","").equals("20,10"),"later nonblocking lifecycle can obtain real recovered record");
  check(!exists(f.de,"ls_augment_launcher_pages")&&LauncherClientAccess.diagnostic("pages").contains("state=ready"),"successful durable retry deletes DE only after ACK and reports ready");
  int callsAfterReady=f.host.resolver.calls;Thread.sleep(1100);LauncherClientAccess.drain();
  check(f.host.resolver.calls==callsAfterReady,"successful load stops all retries");
  f=new Fixture(root.resolve("user-unlock"));seed(f.de,"ls_augment_launcher_pages",Map.of("order","4,3"));f.host.users.unlocked=false;final Fixture locked=f;
  fail(()->LauncherClientAccess.prefs(locked.host,"pages"),"locked CE is not mistaken for an empty store");
  check(f.host.resolver.calls==0&&exists(f.de,"ls_augment_launcher_pages"),"locked user does not invoke CE provider or alter DE source");
  for(int i=0;i<6;i++)LauncherClientAccess.retryNow("pages");
  check(LauncherClientAccess.diagnostic("pages").contains("state=waiting_retry"),"long locked period beyond initial backoff steps does not exhaust recovery");
  f.host.users.unlocked=true;LauncherClientAccess.retryNow("pages");LauncherClientAccess.drain();
  check(LauncherClientAccess.prefs(f.host,"pages").getString("order","").equals("4,3")&&!exists(f.de,"ls_augment_launcher_pages"),"unlock retry safely migrates DE source");
  f=new Fixture(root.resolve("linkage-error"));seed(f.de,"ls_augment_launcher_pages",Map.of("order","2,1"));f.host.resolver.error=new NoClassDefFoundError("private detail omitted");final Fixture broken=f;
  fail(()->LauncherClientAccess.prefs(broken.host,"pages"),"nonfatal linkage error is never ready empty");LauncherClientAccess.drain();
  check(exists(f.de,"ls_augment_launcher_pages")&&LauncherClientAccess.diagnostic("pages").contains("reason=NoClassDefFoundError"),"linkage error retains source and records safe class name");
  check(!LauncherClientAccess.diagnostic("pages").contains("private detail"),"exception content does not leak into diagnostic");
  int beforeRetry=f.host.resolver.calls;Thread.sleep(350);LauncherClientAccess.drain();check(f.host.resolver.calls==beforeRetry,"permanent linkage fault is not retried");
  check(LauncherClientAccess.fatal(new OutOfMemoryError())&&LauncherClientAccess.fatal(new ThreadDeath()),"fatal VM and thread termination remain propagated");
  check(!LauncherClientAccess.fatal(new LinkageError()),"nonfatal linkage failures reach controlled load boundary");
  f=new Fixture(root.resolve("retry-conflict"));seed(f.host,"ls_augment_launcher_pages",Map.of("order","1,2"));seed(f.de,"ls_augment_launcher_pages",Map.of("order","2,1"));final Fixture permanent=f;
  fail(()->LauncherClientAccess.prefs(permanent.host,"pages"),"conflicting original sources stay blocked");LauncherClientAccess.drain();
  check(LauncherClientAccess.diagnostic("pages").contains("reason=launcher_legacy_conflict"),"conflict is distinguished from provider availability");
  beforeRetry=f.host.resolver.calls;Thread.sleep(350);LauncherClientAccess.drain();
  check(f.host.resolver.calls==beforeRetry&&exists(f.host,"ls_augment_launcher_pages")&&exists(f.de,"ls_augment_launcher_pages"),"conflict neither loops nor deletes either original");
  f=new Fixture(root.resolve("retry-private-commit"));seed(f.de,"ls_augment_launcher_pages",Map.of("order","8,6"));f.module.getSharedPreferences(LauncherOwnedStateStore.PAGES_PREFS,0).fail=true;final Fixture commitRetry=f;
  fail(()->LauncherClientAccess.prefs(commitRetry.host,"pages"),"failed private persistence is not acknowledged");
  check(exists(f.de,"ls_augment_launcher_pages"),"private write failure keeps old source until durable retry");
  Thread.sleep(450);LauncherClientAccess.drain();
  check(LauncherClientAccess.prefs(f.host,"pages").getString("order","").equals("8,6")&&!exists(f.de,"ls_augment_launcher_pages"),"bounded retry confirms persistence before deleting source");
  System.out.println("PASS launcher production private store/client: "+checks+" checks");
 }
}
'''


def main():
    files = dict(STUBS)
    # Fill Android Bundle methods used by the production wire contract.
    files['android/os/Bundle.java'] = files['android/os/Bundle.java'].replace('public int size()', 'public void putLong(String k,long v){values.put(k,v);}public long getLong(String k,long d){Object v=get(k);return v instanceof Long?(Long)v:d;}public int size()')
    route = BASE['block']((MAIN / 'LSConfigProvider.java').read_text(encoding='utf-8'), 'if ("launcher_owned_read".equals(method)')
    files['ls/augment/com/ProviderEntry.java'] = '''package ls.augment.com;import android.os.*;import android.content.Context;class ProviderEntry {
      final Context context;String caller="com.zte.mifavor.launcher";ProviderEntry(Context c){context=c;}Context getContext(){return context;}
      String getCallingPackage(){return caller;}Bundle call(String method,String arg,Bundle extras){Bundle result=new Bundle();''' + route + 'return result;}}'
    files['ls/augment/com/TestLauncherOwnedState.java'] = HARNESS
    for name in ('LauncherOwnedStateData.java', 'LauncherOwnedStateStore.java', 'LauncherResetPolicy.java', 'DurablePreferences.java', 'ResetWriteFence.java', 'hook/LauncherOwnedStateClient.java'):
        files['ls/augment/com/' + name] = (MAIN / name).read_text(encoding='utf-8')
    dependency = BASE['json_dependency']()
    with tempfile.TemporaryDirectory(prefix='launcher-private-') as directory:
        folder = Path(directory)
        sources = []
        for name, source in files.items():
            path = folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding='utf-8')
            sources.append(str(path))
        subprocess.run([BASE['java_tool']('javac'), '-encoding', 'UTF-8', '--release', '17', '-cp', str(dependency), '-d', str(folder), *sources], check=True, timeout=40)
        command = [BASE['java_tool']('java'), '-cp', os.pathsep.join((str(folder), str(dependency))), 'ls.augment.com.TestLauncherOwnedState']
        for mode in ('suite', 'seed', 'restart'):
            subprocess.run(command + [mode, str(folder / 'fixture')], check=True, timeout=30)


if __name__ == '__main__':
    main()
