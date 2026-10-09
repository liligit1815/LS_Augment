"""Compile production handshake policy/fence, run isolated assertions, and review reset source invariants."""
from pathlib import Path
import json
import os
import subprocess
import runpy

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
JDK = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
OUT = ROOT / 'audit-output/launcher-reset-owning-process-tests'
OUT.mkdir(parents=True, exist_ok=True)

STUBS = {
    'android/net/Uri.java': '''package android.net; public final class Uri { public final String value; private Uri(String s){value=s;} public static Uri parse(String s){return new Uri(s);} }''',
    'android/os/SystemClock.java': '''package android.os; public final class SystemClock { public static volatile long now=1000; public static long elapsedRealtime(){return now;} }''',
    'android/os/Bundle.java': '''package android.os; import java.util.*; public final class Bundle {
      private final Map<String,Object> values=new LinkedHashMap<>(); public int size(){return values.size();}
      public Object get(String k){return values.get(k);} public void remove(String k){values.remove(k);} public void putString(String k,String v){values.put(k,v);}
      public void putInt(String k,int v){values.put(k,v);} public void putLong(String k,long v){values.put(k,v);}
      public void putBoolean(String k,boolean v){values.put(k,v);} public String getString(String k){return getString(k,null);}
      public String getString(String k,String d){Object v=values.get(k);return v instanceof String?(String)v:d;}
      public int getInt(String k,int d){Object v=values.get(k);return v instanceof Integer?(Integer)v:d;}
      public long getLong(String k,long d){Object v=values.get(k);return v instanceof Long?(Long)v:d;}
      public boolean getBoolean(String k,boolean d){Object v=values.get(k);return v instanceof Boolean?(Boolean)v:d;}
    }''',
    'android/content/ContentResolver.java': '''package android.content; import android.net.Uri;
      public final class ContentResolver { public int notifications; public boolean fail;
      public void notifyChange(Uri uri,Object observer){notifications++;if(fail)throw new IllegalStateException("fixture_notify_failure");} }''',
    'android/content/Context.java': '''package android.content; public final class Context {
      public final ContentResolver resolver=new ContentResolver(); public ContentResolver getContentResolver(){return resolver;} }''',
    'ls/augment/com/OfflineLauncherTypes.java': '''package ls.augment.com; import android.content.Context; import java.util.*;
      final class OfflineState { static long revision=77;static String checksum="a".repeat(64);static boolean paused=true,identity=true; }
      final class AppConfig { AppConfig(Context c){} ConfigSnapshot configSnapshot(){return new ConfigSnapshot();} }
      final class ConfigSnapshot { final long revision=OfflineState.revision;final String checksum=OfflineState.checksum;
        String get(String key){return OfflineState.paused?"0":"1";} }
      final class ConfigSchema { static Set<String> booleanKeys(){return Set.of("flag_a","flag_b");}static boolean isRuntimeKey(String key){return true;} }
      final class BuildConfig { static final int VERSION_CODE=20415; }
      final class HideUserIdentity { static final class Snapshot { final boolean success; Snapshot(boolean s){success=s;} }
        static Snapshot match(Context c,int user,long serial){return new Snapshot(OfflineState.identity&&user==0&&serial==4);} }
    ''',
}

RUNTIME_TEST = r'''
package ls.augment.com;
import android.content.Context;import android.os.Bundle;import android.os.SystemClock;import java.io.IOException;import java.util.concurrent.atomic.AtomicReference;
public final class TestLauncherResetRuntime {
 static int assertions,cases;static final String PACKAGE=LauncherResetPolicy.PACKAGE;
 static void check(boolean condition,String message){assertions++;if(!condition)throw new AssertionError(message);}
 interface Io {void run()throws Exception;}
 static void rejects(Io action,String message)throws Exception{boolean caught=false;try{action.run();}catch(IOException expected){caught=true;}check(caught,message);}
 static Bundle read(Context c,int uid,int pid,String caller,String[] packages,Bundle extra){return LauncherResetRuntime.call(c,"launcher_reset_read",uid,pid,caller,packages,extra);}
 static Bundle read(Context c,int pid){return read(c,10376,pid,PACKAGE,new String[]{PACKAGE},null);}
 static Bundle ackPayload(LauncherResetPolicy.Request r,boolean success,String code){Bundle b=new Bundle();b.putString("nonce",r.nonce);b.putInt("user",r.user);b.putLong("serial",r.serial);b.putInt("version",r.moduleVersion);b.putLong("revision",r.revision);b.putString("checksum",r.checksum);b.putLong("generation",r.generation);b.putBoolean("success",success);b.putString("code",code);return b;}
 static Bundle ack(Context c,int pid,Bundle b){return LauncherResetRuntime.call(c,"launcher_reset_ack",10376,pid,PACKAGE,new String[]{PACKAGE},b);}
 static void rejected(Bundle b,String message){check(b.size()==0||!b.getBoolean("ok",false),message);}
 static LauncherResetPolicy.Session open(Context c)throws Exception{SystemClock.now=1000;OfflineState.paused=true;OfflineState.identity=true;OfflineState.revision=77;OfflineState.checksum="a".repeat(64);return LauncherResetRuntime.begin(c,10376,0,4);}
 static void unauthorizedBeforeClaim(Context c,LauncherResetPolicy.Session s)throws Exception{
  cases++;
  for(int uid:new int[]{0,1000,10377,110376,-1})rejected(read(c,uid,123,PACKAGE,new String[]{PACKAGE},null),"Wrong Binder UID rejected before claim");
  for(String pkg:new String[]{null,"","other.package"})rejected(read(c,10376,123,pkg,new String[]{PACKAGE},null),"Calling package rejected before claim");
  for(String[] pkgs:new String[][]{null,new String[0],new String[]{"other.package"},new String[]{PACKAGE,"other.package"}})
   rejected(read(c,10376,123,PACKAGE,pkgs,null),"Shared/missing UID inventory rejected");
  rejected(read(c,10376,123,PACKAGE,new String[]{PACKAGE},new Bundle()),"Read with extras rejected");
  OfflineState.identity=false;rejected(read(c,123),"Changed user serial rejected");OfflineState.identity=true;
  OfflineState.paused=false;rejected(read(c,123),"Feature republish enabled rejected");OfflineState.paused=true;
  OfflineState.revision=78;rejected(read(c,123),"Changed snapshot revision rejected");OfflineState.revision=77;
  OfflineState.checksum="b".repeat(64);rejected(read(c,123),"Changed snapshot checksum rejected");OfflineState.checksum="a".repeat(64);
  check(read(c,123).getBoolean("ok",false),"Exact real process can claim after rejected probes");
  rejected(read(c,124),"Restarted PID cannot inherit first claim");
  rejected(ack(c,124,ackPayload(s.request,true,"pages_empty")),"Restarted PID cannot ACK first claim");
 }
 static void exactAck(Context c,LauncherResetPolicy.Session s)throws Exception{
  cases++;
  for(String field:new String[]{"nonce","user","serial","version","revision","checksum","generation","success","code"}){
   Bundle b=ackPayload(s.request,true,"pages_empty");b.remove(field);rejected(ack(c,123,b),"Missing ACK field rejected: "+field);
  }
  Bundle extra=ackPayload(s.request,true,"pages_empty");extra.putString("unknown","ignored");rejected(ack(c,123,extra),"Extra ACK field rejected");
  for(String field:new String[]{"nonce","user","serial","version","revision","checksum","generation","success","code"}){
   Bundle b=ackPayload(s.request,true,"pages_empty");
   if(field.equals("nonce")||field.equals("checksum")||field.equals("code"))b.putInt(field,1);else b.putString(field,"1");
   rejected(ack(c,123,b),"Wrong ACK type rejected: "+field);
  }
  for(String field:new String[]{"nonce","user","serial","version","revision","checksum","generation"}){
   Bundle b=ackPayload(s.request,true,"pages_empty");
   if(field.equals("nonce"))b.putString(field,"abcdef01-2345-6789-abcd-ef0123456789");
   else if(field.equals("checksum"))b.putString(field,"b".repeat(64));
   else if(field.equals("user")||field.equals("version"))b.putInt(field,-1);else b.putLong(field,-1);
   rejected(ack(c,123,b),"Mismatched ACK field rejected: "+field);
  }
  rejected(ack(c,123,ackPayload(s.request,true,"commit_failed")),"Success with failure code rejected");
  check(s.receipt()==null,"Rejected probes cannot invent success");
  check(ack(c,123,ackPayload(s.request,true,"pages_empty")).getBoolean("ok",false),"Exact success ACK accepted");
  check(LauncherResetRuntime.await(s).success,"Await accepts active current receipt");
  rejected(ack(c,123,ackPayload(s.request,false,"commit_failed")),"ACK replay cannot overwrite accepted success");
  LauncherResetRuntime.end(c,s);rejected(read(c,123),"Closed request cannot be reclaimed");
  rejects(()->LauncherResetRuntime.await(s),"Closed request cannot return stale success");
 }
 static void failedCommit(Context c)throws Exception{
  cases++;LauncherResetPolicy.Session s=open(c);try{
   check(read(c,123).getBoolean("ok",false),"Failure fixture claims");
   check(ack(c,123,ackPayload(s.request,false,"commit_failed")).getBoolean("ok",false),"Commit failure acknowledged explicitly");
   check(!LauncherResetRuntime.await(s).success,"Caller observes failed persistence");
   rejected(ack(c,123,ackPayload(s.request,true,"pages_empty")),"Failed persistence cannot be replaced by replayed success");
   check(!s.receipt().success,"Original commit failure retained");
  }finally{LauncherResetRuntime.end(c,s);}
 }
 static void expiryAndReplacement(Context c)throws Exception{
  cases++;LauncherResetPolicy.Session expired=open(c);check(read(c,123).getBoolean("ok",false),"Expiry fixture claimed");
  SystemClock.now=expired.request.expiresAt;rejected(ack(c,123,ackPayload(expired.request,true,"pages_empty")),"TTL boundary ACK rejected");
  rejects(()->LauncherResetRuntime.await(expired),"Expired request cannot wait indefinitely");LauncherResetRuntime.end(c,expired);
  LauncherResetPolicy.Session fresh=open(c);try{
   check(!fresh.request.nonce.equals(expired.request.nonce),"New request gets fresh nonce");
   check(read(c,124).getBoolean("ok",false),"Restarted process claims fresh request");
   rejected(ack(c,124,ackPayload(expired.request,true,"pages_empty")),"Old nonce cannot ACK replacement request");
   check(ack(c,124,ackPayload(fresh.request,true,"pages_empty")).getBoolean("ok",false),"Fresh claim clears fresh request");
  }finally{LauncherResetRuntime.end(c,fresh);}
 }
 static void notifyFailure(Context c)throws Exception{
  cases++;c.resolver.fail=true;
  try{rejects(()->open(c),"Failed observer notification is reported as safe IOException");}finally{c.resolver.fail=false;}
  LauncherResetPolicy.Session retry=open(c);LauncherResetRuntime.end(c,retry);
  check(retry!=null,"Failed begin never leaves sticky current request preventing retry");
 }
 public static void main(String[] args)throws Exception{
  Context c=new Context();cases++;rejects(()->open(c),"Requests cannot begin outside total-reset owner fence");
  ResetWriteFence.begin();try{
   AtomicReference<Throwable> unexpected=new AtomicReference<>();Thread foreign=new Thread(()->{try{open(c);unexpected.set(new AssertionError("Foreign reset owner accepted"));}catch(IOException expected){}catch(Throwable t){unexpected.set(t);}});
   foreign.start();foreign.join();check(unexpected.get()==null,"Non-owner cannot start request inside active fence");
   OfflineState.paused=false;rejects(()->LauncherResetRuntime.begin(c,10376,0,4),"Nonpaused snapshot cannot request cleanup");OfflineState.paused=true;
   OfflineState.identity=false;rejects(()->LauncherResetRuntime.begin(c,10376,0,4),"Unverified user serial cannot request cleanup");OfflineState.identity=true;
   LauncherResetPolicy.Session s=open(c);rejects(()->LauncherResetRuntime.begin(c,10376,0,4),"Concurrent request cannot replace nonce");
   try{unauthorizedBeforeClaim(c,s);exactAck(c,s);}finally{LauncherResetRuntime.end(c,s);}
   failedCommit(c);expiryAndReplacement(c);notifyFailure(c);
   LauncherResetPolicy.Session ended=open(c);check(read(c,123).getBoolean("ok",false),"Fence ending fixture claimed");
   check(ack(c,123,ackPayload(ended.request,true,"pages_empty")).getBoolean("ok",false),"Fence ending fixture receipt");
   ResetWriteFence.end();rejected(ack(c,123,ackPayload(ended.request,true,"pages_empty")),"Ended fence rejects old ACK");
   rejects(()->LauncherResetRuntime.await(ended),"Ended fence cannot return stale success");LauncherResetRuntime.end(c,ended);
  }finally{ResetWriteFence.end();}
  System.out.println("{\"success\":true,\"cases\":"+cases+",\"assertions\":"+assertions+",\"personalDataTouched\":false}");
 }
}
'''

PAGES_RESET_TEST = r'''
package ls.augment.com.hook;
import static ls.augment.com.hook.TestLauncherPagesLifecycle.*;
import java.util.*;import android.os.Handler;import ls.augment.com.LauncherOptions;
public final class TestLauncherPagesTotalReset {
 static int assertions;
 static void require(boolean yes,String message){assertions++;if(!yes)throw new AssertionError(message);}
 public static void main(String[] args)throws Throwable{
  setup();enable();bind(10,20);home(10,0);
  Map<String,Object> originalNative=new HashMap<>(nativePrefs().values);
  var originalChildren=new ArrayList<>(ws.children);var originalOrder=new ArrayList<>(ws.order.values);
  own().edit().putString("order","20,10").putBoolean("keep_empty",true).apply();
  c().showEditor(context);Handler.drain();var oldEditor=c().editor;
  require(oldEditor!=null&&oldEditor.isShowing(),"Reset fixture contains open old editor");
  Result oldAllocation=new Result();c().addPage(oldAllocation.done,oldAllocation.error);Handler.drain();
  require(ModelQueue.pending()==1&&c().pending,"OEM allocation queued before reset");
  int oldToken=c().requestToken,oldGeneration=c().bindingGeneration;
  FeatureSettings.values.put(LauncherOptions.PAGE_REORDER,false);FeatureSettings.values.put(LauncherOptions.KEEP_EMPTY,false);
  FeatureSettings.resetRevision=77;
  require(LauncherPagesHook.pauseForReset(77),"Main idle barrier accepts reset");
  require(c().resetPaused&&!c().pending&&c().pendingCheck==null,"Reset cancels pending intent and timeout");
  require(c().requestToken>oldToken&&c().bindingGeneration>oldGeneration,"Reset invalidates already-posted/model-thread callbacks");
  require(c().editor==null&&!oldEditor.isShowing(),"Reset dismisses stale editor");
  require(LauncherPagesHook.cachedResetPreferences()==own(),"Hook exposes actual cached page store for clearing");
  require(own().edit().clear().commit(),"Owning-process clear updates same cached store");
  int afterClear=own().writes;
  ModelQueue.drain();Handler.drain();
  require(oldAllocation.successes==0,"Old native allocation cannot complete after reset barrier");
  require(ws.order.values.equals(originalOrder)&&ws.children.equals(originalChildren),"Old queued mutation preserves native pages and object identity");
  require(nativePrefs().values.equals(originalNative),"No native home-page preference rewritten by reset");
  c().cleanup.run();c().save();c().configurationChanged();
  require(own().values.isEmpty()&&own().writes==afterClear,"Old cleanup/save/configuration callbacks cannot resurrect page prefs during pause");
  require(c().saved().isEmpty()&&!c().keepEmpty(),"Binding cannot reuse cached old order/keep-empty");
  FeatureSettings.resetRevision=78;c().configurationChanged();Handler.drain();
  require(!c().resetPaused&&own().values.isEmpty()&&own().writes==afterClear,"Default snapshot releases barrier without restoring old page data");
  var c0=c();c0.binding=true;require(!LauncherPagesHook.pauseForReset(79),"Reset postpones during native binding");c0.binding=false;
  c0.mutating=true;require(!LauncherPagesHook.pauseForReset(79),"Reset postpones during native mutation");c0.mutating=false;
  require(LauncherPagesHook.pauseForReset(79),"Idle controller can process a subsequent reset");
  System.out.println("{\"success\":true,\"assertions\":"+assertions+",\"personalDataTouched\":false}");
 }
}
'''

def run_pages_reset():
    sources = dict(runpy.run_path(str(ROOT / 'tools/test-launcher-pages-lifecycle.py'))['SOURCES'])
    prefs = '''package android.content;import java.util.*;public class SharedPreferences {
      public final Map<String,Object> values=new HashMap<>();public int writes;public boolean failCommit;
      public Map<String,?> getAll(){return new HashMap<>(values);}public String getString(String k,String d){return (String)values.getOrDefault(k,d);}
      public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);}public int getInt(String k,int d){return (Integer)values.getOrDefault(k,d);}
      public boolean contains(String k){return values.containsKey(k);}public Editor edit(){return new Editor();}
      public class Editor {final Map<String,Object> edits=new HashMap<>();boolean clear;
        public Editor clear(){clear=true;return this;}public Editor putString(String k,String v){edits.put(k,v);return this;}
        public Editor putBoolean(String k,boolean v){edits.put(k,v);return this;}public Editor putInt(String k,int v){edits.put(k,v);return this;}
        public Editor remove(String k){edits.put(k,null);return this;}public void apply(){writes++;if(clear)values.clear();for(var e:edits.entrySet())if(e.getValue()==null)values.remove(e.getKey());else values.put(e.getKey(),e.getValue());}
        public boolean commit(){apply();return !failCommit;}}
    }'''
    sources['android/content/SharedPreferences.java'] = prefs
    feature = sources['ls/augment/com/hook/FeatureSettings.java']
    cut = feature.rfind('}')
    sources['ls/augment/com/hook/FeatureSettings.java'] = feature[:cut] + '''
      static long resetRevision=77;static ls.augment.com.ConfigSnapshot snapshot(android.content.Context c){return new ls.augment.com.ConfigSnapshot(resetRevision);}
    ''' + feature[cut:]
    sources['ls/augment/com/ConfigSnapshot.java'] = '''package ls.augment.com;public final class ConfigSnapshot {public final long revision;public ConfigSnapshot(long r){revision=r;}}'''
    sources['ls/augment/com/hook/LauncherResetHook.java'] = '''package ls.augment.com.hook;final class LauncherResetHook {static void attach(android.content.Context c){}}'''
    sources['ls/augment/com/hook/TestLauncherPagesTotalReset.java'] = PAGES_RESET_TEST
    root = OUT / 'pages-fixture'
    source_root = root / 'sources'
    source_files = []
    for name, source in sources.items():
        file = source_root / name
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(source, encoding='utf-8')
        source_files.append(str(file))
    classes = root / 'classes'
    classes.mkdir(parents=True, exist_ok=True)
    hooks = JAVA / 'hook'
    subprocess.run([str(JDK / 'bin/javac.exe'), '-encoding', 'UTF-8', '-d', str(classes),
                    *source_files, *[str(hooks / name) for name in ('LauncherPagesHook.java','LauncherPageOrder.java','TargetReflection.java')]], check=True)
    result = subprocess.run([str(JDK / 'bin/java.exe'), '-cp', str(classes), 'ls.augment.com.hook.TestLauncherPagesTotalReset'],
                            text=True, capture_output=True, check=True)
    return json.loads(result.stdout.strip())

def run():
    subprocess.run([str(JDK / 'bin/javac.exe'), '-encoding', 'UTF-8', '-d', str(OUT),
                    str(JAVA / 'LauncherResetPolicy.java'), str(JAVA / 'ResetWriteFence.java'),
                    str(ROOT / 'tools/TestLauncherResetPolicy.java')], check=True)
    result = subprocess.run([str(JDK / 'bin/java.exe'), '-cp', str(OUT), 'ls.augment.com.TestLauncherResetPolicy'],
                            text=True, capture_output=True, check=True)
    report = {'policyAndFence': json.loads(result.stdout.strip()), 'deviceActions': False,
              'scope': 'Actual production pure policy/fence runtime tests; Android Hook source reviewed separately.'}
    runtime_sources = OUT / 'runtime-fixture-sources'
    stub_files = []
    for name, source in STUBS.items():
        path = runtime_sources / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        stub_files.append(str(path))
    test_file = runtime_sources / 'ls/augment/com/TestLauncherResetRuntime.java'
    test_file.write_text(RUNTIME_TEST, encoding='utf-8')
    runtime_classes = OUT / 'runtime-classes'
    runtime_classes.mkdir(exist_ok=True)
    subprocess.run([str(JDK / 'bin/javac.exe'), '-encoding', 'UTF-8', '-d', str(runtime_classes),
                    *stub_files, str(JAVA / 'LauncherResetPolicy.java'), str(JAVA / 'ResetWriteFence.java'),
                    str(JAVA / 'LauncherResetRuntime.java'), str(test_file)], check=True)
    runtime = subprocess.run([str(JDK / 'bin/java.exe'), '-cp', str(runtime_classes), 'ls.augment.com.TestLauncherResetRuntime'],
                             text=True, capture_output=True)
    report['runtimeExitCode'] = runtime.returncode
    if runtime.returncode == 0:
        report['runtimeWithAndroidDoubles'] = json.loads(runtime.stdout.strip())
    else:
        report['runtimeFailure'] = runtime.stderr.strip()
    if runtime.returncode == 0:
        report['pagesControllerWithOemDoubles'] = run_pages_reset()
    (OUT / 'result.json').write_text(json.dumps(report, indent=2), encoding='utf-8')
    print(json.dumps(report, ensure_ascii=False, indent=2))
    if runtime.returncode:
        raise SystemExit(runtime.returncode)

if __name__ == '__main__':
    run()
