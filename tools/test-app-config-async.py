"""Actual AppConfig + framework publisher: a blocked remote commit cannot block saves."""
from pathlib import Path
import ast
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
app = (SRC / 'AppConfig.java').read_text(encoding='utf-8')
save = app.split('    private SaveResult save(', 1)[1].split('    synchronized RootShell.Result mirrorAll()', 1)[0]
assert 'FrameworkConfigSync.publish(' not in save
assert 'FrameworkConfigSync.request();' in save and 'FrameworkConfigSync.isPublished(runtime)' in save
initialize = app.split('synchronized RootShell.Result initializeRuntimeMirrorsIfNeeded()', 1)[1].split('synchronized RootShell.Result cleanupLegacy', 1)[0]
assert 'mirrorAll(' not in initialize and 'FrameworkConfigSync.publish(' not in initialize

# Reuse only the literal Android fault doubles; never execute the store test runner.
tree = ast.parse((ROOT / 'tools/test-runtime-stores.py').read_text(encoding='utf-8'))
base = next(ast.literal_eval(node.value) for node in tree.body if isinstance(node, ast.Assign)
            and any(isinstance(name, ast.Name) and name.id == 'STUBS' for name in node.targets))
sources = {name: code for name, code in base.items()
           if name.startswith('android/') or name == 'ls/augment/com/RootShell.java'}
sources['android/content/Context.java'] = sources['android/content/Context.java'].replace(
    'public abstract class Context {',
    'public abstract class Context { public static final int MODE_PRIVATE=0;public Context getApplicationContext(){return this;}')
constants = sorted(set(re.findall(r'ConfigSchema\.([A-Z][A-Z0-9_]+)', app)))
sources['ls/augment/com/ConfigSchema.java'] = 'package ls.augment.com;import java.util.*;final class ConfigSchema {' + ''.join(
    f'static final String {name}="{name}";' for name in constants) + '''
static Map<String,String> defaults(){Map<String,String> values=new LinkedHashMap<>();''' + ''.join(
    f'values.put({name},"");' for name in constants) + '''values.put("flag","0");return values;}
static String normalize(String key,String value){return defaults().containsKey(key)?value:null;}
static boolean truthy(String value){return "1".equals(value)||"true".equals(value);}}
'''
sources.update({
    'ls/augment/com/ConfigSnapshot.java': '''package ls.augment.com;import java.util.*;
final class ConfigSnapshot {final long revision,updatedAt;final Map<String,String> values;
ConfigSnapshot(long r,long t,Map<String,String> v){revision=r;updatedAt=t;values=Collections.unmodifiableMap(new LinkedHashMap<>(v));}
static ConfigSnapshot create(long r,long t,Map<String,String> v){return new ConfigSnapshot(r,t,v);}
static ConfigSnapshot safeDefaults(){return create(1,1,ConfigSchema.defaults());}
String serialize(){return revision+"|"+updatedAt+"|"+new TreeMap<>(values);} }
''',
    'ls/augment/com/ShoulderQuickSwitchPolicy.java': '''package ls.augment.com;final class ShoulderQuickSwitchPolicy {
static final String KEY="shoulder";static final class CaseRef {} static ShoulderQuickSwitchPolicy parse(String raw){return new ShoulderQuickSwitchPolicy();}
ShoulderQuickSwitchPolicy with(CaseRef ref,boolean checked){return this;}String serialize(){return "";} }
''',
    'ls/augment/com/RapidFireCompatibility.java': '''package ls.augment.com;final class RapidFireCompatibility {
static String currentFingerprint(android.content.Context c){throw new AssertionError("test does not enable rapid fire");}
static class Token {static Token parse(String raw){return null;}boolean validFor(String value){return false;}} }
''',
    'ls/augment/com/AuditLog.java': '''package ls.augment.com;final class AuditLog {static void write(android.content.Context c,String event,String value){} }''',
    'ls/augment/com/LegacySettingsMigration.java': '''package ls.augment.com;final class LegacySettingsMigration {
static void request(android.content.Context c){}
static RootShell.Result runIfAuthorized(android.content.Context c){return new RootShell.Result(0,"",false);} }''',
    'io/github/libxposed/service/XposedService.java': '''package io.github.libxposed.service;public interface XposedService {
long PROP_CAP_REMOTE=1;long getFrameworkProperties();android.content.SharedPreferences getRemotePreferences(String group);}
''',
    'ls/augment/com/ModuleScopeService.java': '''package ls.augment.com;final class ModuleScopeService {
static volatile io.github.libxposed.service.XposedService current;static io.github.libxposed.service.XposedService service(){return current;}
static void addListener(Runnable listener){} }
''',
})
fault_source = (ROOT / 'tools/TestRuntimeStores.java').read_text(encoding='utf-8')
fault_classes = '    static final class FakeContext' + fault_source.split('    static final class FakeContext', 1)[1].rsplit('\n}', 1)[0]
fault_classes = fault_classes.replace('int failNext, commits;', '''int failNext, commits;boolean blocked;
        final CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);''')
fault_classes = fault_classes.replace('                    commits++;', '''
                    if(blocked){
                        check(Thread.currentThread().getName().equals("LSA-FrameworkConfig"),"remote commit ran on local save caller");
                        entered.countDown();try{release.await();}catch(InterruptedException error){throw new AssertionError(error);}
                    }
                    commits++;''')
sources['ls/augment/com/TestAppConfigAsync.java'] = r'''package ls.augment.com;
import android.content.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.locks.ReentrantLock;
public final class TestAppConfigAsync {
 public static void main(String[] args)throws Exception {
  FakeContext context=new FakeContext();AppConfig config=new AppConfig(context);
  FakePreferences remote=new FakePreferences();remote.blocked=true;
  ModuleScopeService.current=new io.github.libxposed.service.XposedService(){
   public long getFrameworkProperties(){check(Thread.currentThread().getName().equals("LSA-FrameworkConfig"),"framework properties on caller");return PROP_CAP_REMOTE;}
   public SharedPreferences getRemotePreferences(String group){check(group.equals(RemoteConfig.GROUP),"remote group");return remote;}
  };
  FrameworkConfigSync.initialize(context);
  check(remote.entered.await(2,TimeUnit.SECONDS),"framework writer did not enter blocked commit");
  ReentrantLock actionQueue=new ReentrantLock();ExecutorService caller=Executors.newSingleThreadExecutor();
  long started=System.nanoTime();
  try {
   AppConfig.SaveResult first=caller.submit(()->{actionQueue.lock();try{return config.save(Map.of("flag","1"));}finally{actionQueue.unlock();}}).get(500,TimeUnit.MILLISECONDS);
   long revision=config.configSnapshot().revision;
   AppConfig.SaveResult second=caller.submit(()->{actionQueue.lock();try{return config.save(Map.of("flag","2"));}finally{actionQueue.unlock();}}).get(500,TimeUnit.MILLISECONDS);
   check(first.success&&second.success&&!first.runtimeSynced&&!second.runtimeSynced,"local saves must succeed with explicit pending sync");
   check(config.get("flag").equals("2")&&context.prefs(AppConfig.PREFS).disk.get("flag").equals("2"),"second local save durable while remote blocked");
   check(config.configSnapshot().revision>revision,"consecutive saves advance local revision");
   check(caller.submit(config::initializeRuntimeMirrorsIfNeeded).get(500,TimeUnit.MILLISECONDS).isSuccess(),"root probe initialization must only enqueue sync");
   check(context.resolver.notifications>=2,"both saves notify private Provider readers");
   check(remote.release.getCount()==1&&!actionQueue.isLocked(),"saves completed before framework recovered and released action queue");
   long elapsed=(System.nanoTime()-started)/1_000_000;
   remote.blocked=false;remote.release.countDown();
   long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);
   while(!FrameworkConfigSync.isPublished(config.configSnapshot())){
    if(System.nanoTime()>end)throw new AssertionError("latest snapshot did not sync after recovery");
    FrameworkConfigSync.request();Thread.sleep(5);
   }
   check(remote.disk.get(RemoteConfig.SNAPSHOT).equals(config.configSnapshot().serialize()),"recovery publishes latest complete snapshot");
   System.out.println("Actual AppConfig + FrameworkConfigSync: two durable saves and root initialization completed in "+elapsed+"ms while remote commit blocked; queue released and latest snapshot published after recovery");
  } finally {remote.blocked=false;remote.release.countDown();caller.shutdownNow();}
 }
 static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
''' + fault_classes + '\n}\n'

with tempfile.TemporaryDirectory(prefix='ls-app-config-async-') as folder:
    work = Path(folder)
    files = []
    for name, code in sources.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(code, encoding='utf-8')
        files.append(path)
    files += [SRC / name for name in ('AppConfig.java', 'FrameworkConfigSync.java', 'DurablePreferences.java', 'RuntimeStateStore.java', 'RemoteConfig.java')]
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', folder, *map(str, files)], check=True)
    subprocess.run(['java', '-cp', folder, 'ls.augment.com.TestAppConfigAsync'], check=True, timeout=10)
