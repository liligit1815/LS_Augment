"""Execute the real GFRC private store, Binder route and worker client with fake Android IO.

Uses disk-backed preferences with distinct optimistic memory/confirmed disk values,
the cached org.json parser, and a second JVM for persistence. No phone is accessed.
"""
from pathlib import Path
import os
import re
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / 'android/app/src/main/java/ls/augment/com'


def java_tool(name):
    java_home = os.environ.get('JAVA_HOME')
    if java_home:
        candidate = Path(java_home) / 'bin' / (name + ('.exe' if os.name == 'nt' else ''))
        if candidate.is_file():
            return str(candidate)
    found = shutil.which(name)
    if found:
        return found
    raise SystemExit('Set JAVA_HOME or add a JDK to PATH')


def json_dependency():
    caches = [Path(os.environ['GRADLE_USER_HOME'])] if os.environ.get('GRADLE_USER_HOME') else []
    caches += [Path.home() / '.gradle', ROOT / 'audit-output/gradle-cache']
    candidates = [jar for cache in caches for folder in (
        cache / 'caches/modules-2/files-2.1/org.json/json', cache / 'modules-2/files-2.1/org.json/json')
        for jar in folder.glob('**/json-*.jar')]
    if not candidates:
        raise SystemExit('Cache org.json:json in Gradle dependencies before running this test')
    return sorted(candidates)[-1]


def block(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


STUBS = {
    'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle {
      public final Map<String,Object> values=new HashMap<>();public Object get(String k){return values.get(k);}
      public int size(){return values.size();}public boolean containsKey(String k){return values.containsKey(k);}
      public void putString(String k,String v){values.put(k,v);}public String getString(String k){Object v=get(k);return v instanceof String?(String)v:null;}
      public String getString(String k,String d){String v=getString(k);return v==null?d:v;}
      public void putInt(String k,int v){values.put(k,v);}public int getInt(String k,int d){Object v=get(k);return v instanceof Integer?(Integer)v:d;}
      public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k,boolean d){Object v=get(k);return v instanceof Boolean?(Boolean)v:d;}
    }''',
    'android/os/Process.java': '''package android.os;public class Process {public static final int SYSTEM_UID=1000;public static int uid=10055;public static int myUid(){return uid;}}''',
    'android/os/Looper.java': '''package android.os;public class Looper {
      static final Looper MAIN=new Looper();public static boolean main;public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return main?MAIN:null;}}
    ''',
    'android/os/Binder.java': '''package android.os;public class Binder {
      public static int uid=1000,pid=800,clears,restores;
      public static int getCallingUid(){return uid;}public static int getCallingPid(){return pid;}
      public static long clearCallingIdentity(){clears++;long old=uid;uid=Process.myUid();return old;}
      public static void restoreCallingIdentity(long identity){restores++;uid=(int)identity;}
    }''',
    'android/net/Uri.java': '''package android.net;public class Uri {final String value;private Uri(String value){this.value=value;}
      public static Uri parse(String value){return new Uri(value);}public String toString(){return value;}}
    ''',
    'android/database/Cursor.java': '''package android.database;public interface Cursor extends AutoCloseable {
      boolean moveToFirst();void close();}
    ''',
    'android/content/ContentResolver.java': '''package android.content;import android.os.*;public class ContentResolver {
      public java.util.function.BiFunction<String,Bundle,Bundle> target;public int calls;public int lostThrow,lostNull;public boolean unavailable;
      public Bundle call(android.net.Uri uri,String method,String arg,Bundle extras){
        calls++;if(!uri.toString().equals("content://ls.augment.com.config")||arg!=null)throw new AssertionError("unexpected endpoint");
        if(Looper.main)throw new AssertionError("client IPC on main");if(unavailable)throw new IllegalStateException("provider_down");
        Bundle r=target.apply(method,extras);if(method.equals("gfrc_recovery_write")){
          if(lostThrow>0){lostThrow--;throw new IllegalStateException("lost ACK");}if(lostNull>0){lostNull--;return null;}}
        return r;
      }
      static void legacySelection(android.net.Uri uri,String selection,String[] args){
        if(!uri.toString().equals("content://settings/global")||!"name=?".equals(selection)
          ||!java.util.Arrays.equals(args,new String[]{"redmagic_duo_native_gfrc_recovery_v1"}))
          throw new AssertionError("delete/query must target exactly the obsolete module row");
      }
      public int delete(android.net.Uri uri,String selection,String[] args){
        legacySelection(uri,selection,args);android.provider.Settings.Global.deletes++;
        android.provider.Settings.Global.events.add("legacy-delete");
        if(android.provider.Settings.Global.deleteFails)throw new SecurityException("delete rejected");
        if(android.provider.Settings.Global.deleteDrops)return 0;
        boolean exists=android.provider.Settings.Global.exists();
        android.provider.Settings.Global.legacy=null;android.provider.Settings.Global.nullRow=false;return exists?1:0;
      }
      public android.database.Cursor query(android.net.Uri uri,String[] projection,String selection,String[] args,String order){
        legacySelection(uri,selection,args);if(!java.util.Arrays.equals(projection,new String[]{"name"})||order!=null)throw new AssertionError("only inspect exact row name");
        android.provider.Settings.Global.queries++;
        if(android.provider.Settings.Global.queryThrows)throw new SecurityException("query rejected");
        if(android.provider.Settings.Global.queryFails)return null;
        final boolean exists=android.provider.Settings.Global.exists();return new android.database.Cursor(){
          public boolean moveToFirst(){return exists;}public void close(){android.provider.Settings.Global.closed++;}};
      }
    }''',
    'android/content/SharedPreferences.java': '''package android.content;import java.util.Map;public interface SharedPreferences {
      Map<String,?> getAll();boolean contains(String key);String getString(String key,String fallback);Editor edit();
      interface Editor {Editor putString(String k,String v);Editor putBoolean(String k,boolean v);Editor putLong(String k,long v);
        Editor putInt(String k,int v);Editor putFloat(String k,float v);Editor remove(String k);Editor clear();boolean commit();}
    }''',
    'android/content/Context.java': '''package android.content;public abstract class Context {
      public static final int MODE_PRIVATE=0;public abstract SharedPreferences getSharedPreferences(String name,int mode);
      public abstract android.content.pm.PackageManager getPackageManager();public abstract ContentResolver getContentResolver();
    }''',
    'android/content/pm/PackageManager.java': '''package android.content.pm;public class PackageManager {
      public String[] packages={"android"};public String[] getPackagesForUid(int uid){return packages;}}
    ''',
    'android/provider/Settings.java': '''package android.provider;import java.util.*;import android.content.ContentResolver;
      public class Settings {public static class Global {
        public static final android.net.Uri CONTENT_URI=android.net.Uri.parse("content://settings/global");
        public static String legacy;public static int reads,deletes,queries,closed;public static boolean nullRow,deleteFails,deleteDrops,queryFails,queryThrows;
        public static final List<String> events=new ArrayList<>();
        public static boolean exists(){return legacy!=null||nullRow;}
        public static String getString(ContentResolver r,String k){if(!k.equals("redmagic_duo_native_gfrc_recovery_v1"))throw new AssertionError(k);reads++;return legacy;}
        public static boolean putString(ContentResolver r,String k,String v){
          if(!k.equals("redmagic_duo_native_gfrc_recovery_v1")||v!=null)throw new AssertionError("custom system setting write");
          // Android may persist a row whose value is null; getString still returns null.
          legacy=null;nullRow=true;events.add("legacy-put-null");return true;
        }
        public static void reset(){legacy=null;reads=deletes=queries=closed=0;nullRow=deleteFails=deleteDrops=queryFails=queryThrows=false;events.clear();}
      }}''',
    'ls/augment/com/BuildConfig.java': '''package ls.augment.com;public final class BuildConfig {public static int VERSION_CODE=20537;}''',
    'ls/augment/com/hook/ClientAccess.java': '''package ls.augment.com.hook;import android.content.Context;
      public class ClientAccess {
        public static String read(Context c)throws Exception{return GfrcRecoveryClient.read(c);}
        public static void write(Context c,String expected,String value)throws Exception{GfrcRecoveryClient.write(c,expected,value);}
        public static void reset()throws Exception{var f=GfrcRecoveryClient.class.getDeclaredField("migrated");f.setAccessible(true);f.set(null,false);}
      }''',
}

HARNESS = r'''package ls.augment.com;
import android.content.*;import android.content.pm.*;import android.os.*;import android.provider.Settings;
import java.nio.file.*;import java.util.*;import org.json.*;import ls.augment.com.hook.ClientAccess;
public class TestGfrcRecoveryStore {
 static int checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 interface Checked {void run()throws Exception;}static void fails(Checked action,String message)throws Exception{
  boolean failed=false;try{action.run();}catch(Exception expected){failed=true;}check(failed,message);}
 static class Prefs implements SharedPreferences {
  final Path path;Map<String,Object> memory=new LinkedHashMap<>();int commits;boolean fail;Runnable afterCommit;
  Prefs(Path path){this.path=path;try{if(Files.exists(path))memory.putAll(new JSONObject(Files.readString(path)).toMap());}catch(Exception e){throw new AssertionError(e);}}
  public Map<String,?> getAll(){return new LinkedHashMap<>(memory);}public boolean contains(String k){return memory.containsKey(k);}
  public String getString(String k,String d){Object v=memory.get(k);return v instanceof String?(String)v:d;}
  public Editor edit(){return new Edit();}
  class Edit implements Editor {
   final Map<String,Object> next=new LinkedHashMap<>(memory);
   public Editor putString(String k,String v){if(v==null)next.remove(k);else next.put(k,v);return this;}
   public Editor putBoolean(String k,boolean v){next.put(k,v);return this;}public Editor putLong(String k,long v){next.put(k,v);return this;}
   public Editor putInt(String k,int v){next.put(k,v);return this;}public Editor putFloat(String k,float v){next.put(k,v);return this;}
   public Editor remove(String k){next.remove(k);return this;}public Editor clear(){next.clear();return this;}
   public boolean commit(){commits++;memory=new LinkedHashMap<>(next);if(fail){fail=false;return false;}
    try{Files.createDirectories(path.getParent());Files.writeString(path,new JSONObject(next).toString());}
    catch(Exception e){throw new AssertionError(e);}
    Settings.Global.events.add("private-commit");if(afterCommit!=null){Runnable task=afterCommit;afterCommit=null;task.run();}return true;}
  }
 }
 static class App extends Context {
  final Prefs prefs;final PackageManager pm=new PackageManager();final ContentResolver resolver=new ContentResolver();
  final ProviderEntry provider;boolean readFails;
  App(Path path){prefs=new Prefs(path);provider=new ProviderEntry(this);resolver.target=(method,extras)->provider.call(method,null,extras);}
  public PackageManager getPackageManager(){return pm;}public ContentResolver getContentResolver(){return resolver;}
  public Prefs getSharedPreferences(String name,int mode){if(readFails)throw new IllegalStateException("private IO failed");
   check(mode==MODE_PRIVATE&&name.equals(GfrcRecoveryStore.PREFS),"journal belongs to private module preferences");return prefs;}
 }
 static Bundle readExtras(){Bundle b=new Bundle();b.putInt("build",BuildConfig.VERSION_CODE);return b;}
 static Bundle writeExtras(String expected,String next){Bundle b=readExtras();b.putString("expected",expected);b.putString("payload",next);return b;}
 static Bundle route(App app,String method,Bundle b){int uid=Binder.uid;Bundle r=app.provider.call(method,null,b);check(Binder.uid==uid,"Binder identity restored");return r;}
 static Bundle read(App app){return route(app,"gfrc_recovery_read",readExtras());}
 static Bundle write(App app,String expected,String next){return route(app,"gfrc_recovery_write",writeExtras(expected,next));}
 static boolean ok(Bundle b){return b.getBoolean("ok",false);}
 static String journal(){return new JSONObject().put("version",1).put("boot","11111111-1111-1111-1111-111111111111")
  .put("phase","applying").put("capabilityOwned",true).put("modesStopped",false)
  .put("properties",new JSONObject().put("vendor.gpp.maxw",new JSONObject().put("original","").put("intended","1080"))).toString();}
 static String applied(String value){return new JSONObject(value).put("phase","applied").toString();}
 static void reset()throws Exception{Settings.Global.reset();ClientAccess.reset();Looper.main=false;Binder.uid=1000;Binder.pid=800;android.os.Process.uid=10055;}
 static App app(Path root,String name)throws Exception{reset();return new App(root.resolve(name+".json"));}
 public static void main(String[] args)throws Exception {
  Path root=Path.of(args[1]);String first=journal(),second=applied(first);
  if(args[0].equals("seed")){App a=app(root,"restart");check(ok(write(a,null,first)),"seed private disk");return;}
  if(args[0].equals("restart")){App a=app(root,"restart");check(first.equals(ClientAccess.read(a)),"new JVM loads durable private owner");
   check(a.prefs.commits==0&&Settings.Global.deletes==1&&!Settings.Global.exists(),"restarting keeps owner unchanged and checks obsolete row absence");
   ClientAccess.write(a,first,null);check(!GfrcRecoveryStore.hasPending(a),"new process clears journal after restore");
   System.out.println("PASS GFRC new-JVM private persistence: "+checks+" checks");return;}
  App a=app(root,"auth");
  check(ok(read(a))&&read(a).getString("payload")==null,"initial empty private record");
  for(int uid:new int[]{0,1001,10055,101000}){Binder.uid=uid;check(!ok(read(a)),"untrusted UID: "+uid);}Binder.uid=1000;
  Binder.pid=0;check(!ok(read(a)),"missing real Binder PID");Binder.pid=800;
  for(String caller:new String[]{null,"com.android.systemui","wrong.package"}){a.provider.caller=caller;check(!ok(read(a)),"wrong caller package");}a.provider.caller="android";
  a.pm.packages=null;check(!ok(read(a)),"missing package attribution");a.pm.packages=new String[]{"wrong.package"};check(!ok(read(a)),"wrong package attribution");a.pm.packages=new String[]{"android"};
  android.os.Process.uid=110055;check(!ok(read(a)),"other Android user");android.os.Process.uid=10055;
  Bundle extras=readExtras();extras.values.put("build",(long)BuildConfig.VERSION_CODE);check(!ok(route(a,"gfrc_recovery_read",extras)),"numeric coercion rejected");
  extras=readExtras();extras.putInt("build",BuildConfig.VERSION_CODE-1);check(!ok(route(a,"gfrc_recovery_read",extras)),"old hook version rejected");
  check(!ok(route(a,"gfrc_recovery_read",null)),"missing extras");extras=readExtras();extras.putString("extra","x");check(!ok(route(a,"gfrc_recovery_read",extras)),"unknown read args");
  check(!ok(a.provider.call("gfrc_recovery_read","bad",readExtras())),"non-null arg");
  for(String key:new String[]{"expected","payload"}){extras=writeExtras(null,null);extras.putInt(key,1);check(!ok(route(a,"gfrc_recovery_write",extras)),"wrong string type must not become a clear");}
  extras=readExtras();check(!ok(route(a,"gfrc_recovery_write",extras)),"missing write fields");
  for(String malformed:new String[]{"", "x".repeat(4097),"{}",new JSONObject(first).put("version",2).toString(),new JSONObject(first).put("boot","unknown").toString(),new JSONObject(first).put("phase","unknown").toString(),new JSONObject(first).put("properties",new JSONObject()).toString(),new JSONObject(first).put("extra",1).toString()})
   check(!ok(write(a,null,malformed)),"malformed journal rejected");
  JSONObject properties=new JSONObject().put("other.property",new JSONObject().put("original","").put("intended","1"));
  check(!ok(write(a,null,new JSONObject(first).put("properties",properties).toString())),"foreign system property cannot be journaled");
  for(Object original:new Object[]{1,"x".repeat(92)}){properties=new JSONObject().put("vendor.gpp.maxw",new JSONObject().put("original",original).put("intended","1080"));
   check(!ok(write(a,null,new JSONObject(first).put("properties",properties).toString())),"invalid original property");}
  check(a.prefs.commits==0,"rejected routes never write");check(Binder.clears==Binder.restores,"all cleared identities restored");
  a=app(root,"durable");a.prefs.fail=true;check(!ok(write(a,null,first)),"failed commit cannot ACK");
  check(a.prefs.memory.containsKey("owner")&&read(a).getString("payload")==null,"optimistic memory cannot grant ownership");
  check(ok(write(a,null,first)),"retry durably saves");check(ok(write(a,null,first))&&a.prefs.commits==2,"lost ACK retry returns saved without rewrite");
  check(!ok(write(a,null,second)),"stale non-idempotent update fails CAS");check(first.equals(read(a).getString("payload")),"CAS failure preserves original");
  a.prefs.fail=true;check(!ok(write(a,first,null)),"failed clear cannot acknowledge recovery");check(GfrcRecoveryStore.hasPending(a),"failed clear keeps durable recovery responsibility");
  check(first.equals(read(a).getString("payload")),"failed clear cannot hide journal via optimistic map");check(ok(write(a,first,null)),"clear succeeds on retry");
  check(ok(write(a,first,null))&&!GfrcRecoveryStore.hasPending(a),"lost clear ACK retries idempotently");
  a=app(root,"wrong-private-type");a.prefs.memory.put("owner",42);check(!ok(read(a))&&GfrcRecoveryStore.hasPending(a),"corrupt non-string owner fails closed");
  a=app(root,"missing-storage");a.readFails=true;check(!ok(read(a))&&GfrcRecoveryStore.hasPending(a),"storage inaccessible fails closed");
  a=app(root,"client-main");Looper.main=true;final App main=a;fails(()->ClientAccess.read(main),"main cannot read IPC");fails(()->ClientAccess.write(main,null,first),"main cannot write IPC");
  check(a.resolver.calls==0&&!GfrcRecoveryStore.awaitRestored(a),"main does not wait or dispatch IPC");Looper.main=false;
  for(boolean exception:new boolean[]{false,true}){a=app(root,"lost-"+exception);if(exception)a.resolver.lostThrow=1;else a.resolver.lostNull=1;
   ClientAccess.write(a,null,first);check(a.prefs.commits==1&&a.resolver.calls==2,"lost write ACK retry exactly once and commits once");
   if(exception)a.resolver.lostThrow=1;else a.resolver.lostNull=1;ClientAccess.write(a,first,null);check(a.prefs.commits==2&&a.resolver.calls==4,"lost clear ACK retry");}
  a=app(root,"unavailable");a.resolver.unavailable=true;final App unavailable=a;fails(()->ClientAccess.write(unavailable,null,first),"unavailable provider blocks ownership");check(a.resolver.calls==2&&a.prefs.commits==0,"unavailable retry bounded");
  a=app(root,"migration");Settings.Global.legacy=first;check(first.equals(ClientAccess.read(a)),"migration returns committed legacy owner");
  check(!Settings.Global.exists()&&Settings.Global.events.equals(List.of("private-commit","legacy-delete")),"legacy row deletion strictly after durable commit");
  check(Settings.Global.queries==1&&Settings.Global.closed==1,"deletion verified by name-only query and cursor closed");
  int reads=Settings.Global.reads;for(int i=0;i<20;i++)ClientAccess.read(a);check(Settings.Global.reads==reads&&a.prefs.commits==1,"normal reads never revisit migrated Settings");
  a=app(root,"migration-save-failure");Settings.Global.legacy=first;a.prefs.fail=true;final App failedSave=a;
  fails(()->ClientAccess.read(failedSave),"legacy migration save failure");check(Settings.Global.legacy.equals(first)&&Settings.Global.deletes==0,"failed migration never deletes source");
  check(first.equals(ClientAccess.read(a))&&Settings.Global.legacy==null,"failed optimistic migration can retry");
  for(boolean drop:new boolean[]{false,true}){a=app(root,"migration-delete-"+drop);Settings.Global.legacy=first;
   Settings.Global.deleteDrops=drop;Settings.Global.deleteFails=!drop;final App failedDelete=a;
   fails(()->ClientAccess.read(failedDelete),"migration delete failure blocks native mutation");check(first.equals(read(a).getString("payload"))&&Settings.Global.legacy.equals(first),"source and committed recovery survive delete failure");
   Settings.Global.deleteDrops=Settings.Global.deleteFails=false;check(first.equals(ClientAccess.read(a))&&a.prefs.commits==1,"matching private migration retries deletion without rewrite");}
  a=app(root,"migration-conflict");check(ok(write(a,null,second)),"seed different private owner");Settings.Global.legacy=first;final App conflict=a;
  fails(()->ClientAccess.read(conflict),"conflicting legacy/private owners fail closed");check(Settings.Global.legacy.equals(first)&&second.equals(read(a).getString("payload")),"conflict retains both records");
  a=app(root,"migration-race");Settings.Global.legacy=first;a.prefs.afterCommit=()->Settings.Global.legacy=second;final App race=a;
  fails(()->ClientAccess.read(race),"legacy source changed during import");check(Settings.Global.deletes==0&&Settings.Global.legacy.equals(second),"changed legacy source never deleted");
  a=app(root,"migration-invalid");Settings.Global.legacy="invalid";final App malformed=a;fails(()->ClientAccess.read(malformed),"invalid legacy fails closed");check(a.prefs.commits==0&&Settings.Global.deletes==0,"invalid legacy retained for diagnosis");
  a=app(root,"migration-empty");Settings.Global.legacy="";check(ClientAccess.read(a)==null&&Settings.Global.legacy==null,"empty obsolete key is deleted");
  check(a.prefs.commits==0&&Settings.Global.deletes==1,"empty legacy needs no manufactured journal");
  a=app(root,"migration-null-row");Settings.Global.putString(a.resolver,"redmagic_duo_native_gfrc_recovery_v1",null);
  check(Settings.Global.getString(a.resolver,"redmagic_duo_native_gfrc_recovery_v1")==null&&Settings.Global.exists(),"null value does not prove row absence");
  check(ClientAccess.read(a)==null&&!Settings.Global.exists()&&a.prefs.commits==0,"null-valued obsolete row is genuinely deleted");
  check(Settings.Global.queries==1&&Settings.Global.closed==1,"null tombstone cleanup verifies row absent");
  a=app(root,"migration-null-delete-dropped");Settings.Global.nullRow=true;Settings.Global.deleteDrops=true;final App tombstone=a;
  fails(()->ClientAccess.read(tombstone),"null tombstone surviving delete cannot mark migration complete");
  check(Settings.Global.exists()&&Settings.Global.closed==1,"name query detects null-valued row and closes cursor");
  Settings.Global.deleteDrops=false;check(ClientAccess.read(a)==null&&!Settings.Global.exists()&&Settings.Global.deletes==2,"failed null tombstone deletion retries");
  for(boolean throwsQuery:new boolean[]{false,true}){a=app(root,"migration-query-failure-"+throwsQuery);Settings.Global.legacy=first;
   Settings.Global.queryThrows=throwsQuery;Settings.Global.queryFails=!throwsQuery;final App failedQuery=a;
   fails(()->ClientAccess.read(failedQuery),"missing deletion verification fails closed");
   check(first.equals(read(a).getString("payload"))&&!Settings.Global.exists(),"durable recovery retained after successful deletion and failed query");
   Settings.Global.queryThrows=Settings.Global.queryFails=false;check(first.equals(ClientAccess.read(a))&&a.prefs.commits==1,"query failure retries absence check without reimporting journal");}
  a=app(root,"reset-fence");check(ok(write(a,null,first)),"seed owner before reset");ResetWriteFence.begin();
  try {
   check(ok(read(a)),"pending owner readable during reset");check(!ok(write(a,first,second)),"reset rejects confirming applied state");
   check(!ok(write(a,first,first)),"reset rejects idempotent acquire ACK too");
   String restoring=new JSONObject(first).put("phase","restoring").toString();check(ok(write(a,first,restoring)),"reset allows recovery phase journal");
   check(ok(write(a,restoring,null)),"reset allows completed recovery to clear");check(!ok(write(a,null,first)),"reset cannot reacquire empty journal");
   final App fenced=a;Thread staleWorker=new Thread(()->check(!ok(write(fenced,null,first)),"another Binder worker cannot reacquire during reset"));staleWorker.start();staleWorker.join();
  } finally {ResetWriteFence.end();}
  check(ok(write(a,null,first)),"later deliberate enabled state may acquire after reset ended");
  a=app(root,"reset-wait");check(GfrcRecoveryStore.awaitRestored(a),"empty journal releases reset");check(ok(write(a,null,first)),"pending reset fixture");
  Thread.currentThread().interrupt();check(!GfrcRecoveryStore.awaitRestored(a)&&Thread.interrupted(),"interrupted reset is bounded and preserves interrupt");
  long start=System.nanoTime();check(!GfrcRecoveryStore.awaitRestored(a),"pending owner blocks reset after timeout");long elapsed=(System.nanoTime()-start)/1_000_000;
  check(elapsed>=4900&&elapsed<7000&&GfrcRecoveryStore.hasPending(a),"bounded wait never clears pending owner");
  final App releasing=a;Thread worker=new Thread(()->{try{Thread.sleep(140);}catch(InterruptedException e){throw new AssertionError(e);}write(releasing,first,null);});worker.start();
  check(GfrcRecoveryStore.awaitRestored(a),"reset sees native worker release pending recovery");worker.join();
  System.out.println("PASS production GFRC store/provider/client: "+checks+" checks");
 }
}
'''


def main():
    source = (MAIN / 'LSConfigProvider.java').read_text(encoding='utf-8')
    route = block(source, 'if ("gfrc_recovery_read".equals(method)')
    files = dict(STUBS)
    files['ls/augment/com/ProviderEntry.java'] = '''package ls.augment.com;import android.os.*;import android.content.Context;
      final class ProviderEntry {final Context context;String caller="android";
        ProviderEntry(Context context){this.context=context;}Context getContext(){return context;}String getCallingPackage(){return caller;}
        Bundle call(String method,String arg,Bundle extras){Bundle result=new Bundle();''' + route + '''return result;}}
    '''
    files['ls/augment/com/TestGfrcRecoveryStore.java'] = HARNESS
    for name in ('GfrcRecoveryStore.java', 'DurablePreferences.java', 'ResetWriteFence.java', 'hook/GfrcRecoveryClient.java'):
        files['ls/augment/com/' + name] = (MAIN / name).read_text(encoding='utf-8')
    dependency = json_dependency()
    with tempfile.TemporaryDirectory(prefix='lsa-gfrc-private-') as temporary:
        folder = Path(temporary)
        sources = []
        for name, value in files.items():
            path = folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value, encoding='utf-8')
            sources.append(str(path))
        subprocess.run([java_tool('javac'), '-encoding', 'UTF-8', '--release', '17', '-cp', str(dependency), '-d', str(folder), *sources], check=True, timeout=40)
        command = [java_tool('java'), '-cp', os.pathsep.join((str(folder), str(dependency))), 'ls.augment.com.TestGfrcRecoveryStore']
        for mode in ('suite', 'seed', 'restart'):
            subprocess.run(command + [mode, str(folder / 'private')], check=True, timeout=30)


if __name__ == '__main__':
    main()
