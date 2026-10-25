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
    'public abstract class Context { public static final int MODE_PRIVATE=0;public Context getApplicationContext(){return this;}public android.content.res.Resources getResources(){return new android.content.res.Resources();}')
sources['android/content/res/Resources.java'] = 'package android.content.res;public class Resources {public Configuration getConfiguration(){return new Configuration();}}'
sources['android/content/res/Configuration.java'] = 'package android.content.res;public class Configuration {public static final int ORIENTATION_LANDSCAPE=2;public int orientation=1;}'
constants = sorted(set(re.findall(r'ConfigSchema\.([A-Z][A-Z0-9_]+)', app)))
sources['ls/augment/com/ConfigSchema.java'] = 'package ls.augment.com;import java.util.*;final class ConfigSchema {' + ''.join(
    f'static final String {name}="{name}";' for name in constants) + '''
static Map<String,String> defaults(){Map<String,String> values=new LinkedHashMap<>();''' + ''.join(
    f'values.put({name},"");' for name in constants) + '''values.put("flag","0");values.put("ls_augment_rm_signal_dual","0");values.put("ls_augment_rm_hide_mobile_type","0");return values;}
static String normalize(String key,String value){return defaults().containsKey(key)?value:null;}
static boolean truthy(String value){return "1".equals(value)||"true".equals(value);}}
'''
sources.update({
    # OEM competitive-key recovery is outside this transport test. Never invoke Root here.
    'ls/augment/com/CompetitiveKeyOptions.java': '''package ls.augment.com;final class CompetitiveKeyOptions {
static final String ENABLED="competitive_enabled",NATIVE_SETTING="redmagic_competitive_key_function"; }''',
    'ls/augment/com/ModuleSystemSettings.java': '''package ls.augment.com;final class ModuleSystemSettings {
static final class WriteResult {final boolean success=true;final String message="";}
static final class RestoreResult {final boolean success=true;final String message="";}
static WriteResult put(android.content.Context c,String ns,String key,String value){return new WriteResult();}
static RestoreResult restoreOne(android.content.Context c,String ns,String key){return new RestoreResult();} }''',
    'ls/augment/com/SystemUiOptions.java': '''package ls.augment.com;final class SystemUiOptions {
static final String SIGNAL_DUAL="ls_augment_rm_signal_dual",ISLAND="ls_augment_rm_dynamic_island"; }''',
    'ls/augment/com/FanCalibrationData.java': '''package ls.augment.com;final class FanCalibrationData {
static boolean validRequest(String request,long now){return "measuring".equals(request);} }''',
    'ls/augment/com/ConfigSnapshot.java': '''package ls.augment.com;import java.util.*;
final class ConfigSnapshot {final long revision,updatedAt;final Map<String,String> values;
ConfigSnapshot(long r,long t,Map<String,String> v){revision=r;updatedAt=t;values=Collections.unmodifiableMap(new LinkedHashMap<>(v));}
static ConfigSnapshot create(long r,long t,Map<String,String> v){return new ConfigSnapshot(r,t,v);}
static ConfigSnapshot safeDefaults(){return create(1,1,ConfigSchema.defaults());}
Map<String,String> values(){return values;}
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
    'ls/augment/com/BuildConfig.java': '''package ls.augment.com;final class BuildConfig {static final String VERSION_NAME="host-test";}''',
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
  ConfigSnapshot cached=config.configSnapshot();
  for(int i=0;i<10000;i++)check(new AppConfig(context).configSnapshot()==cached,"unchanged preferences rebuild the snapshot");
  context.prefs(AppConfig.PREFS).failNext=1;
  check(!config.save(Map.of("flag","1")).success&&config.configSnapshot()==cached,"failed commit invalidated confirmed cache");
  check(config.save(Map.of("flag","1")).success&&config.configSnapshot()!=cached,"successful write must invalidate shared cache");
  cached=config.configSnapshot();
  check(config.resetToDefaults().success&&config.configSnapshot()!=cached,"reset must invalidate cached authorization");
  testFreeformPages(context,config);
  String dual="ls_augment_rm_signal_dual",hide="ls_augment_rm_hide_mobile_type";
  check(config.save(Map.of(dual,"1")).success&&!config.getBoolean(hide),"enabling dual signal must preserve visible network types");
  check(config.save(Map.of(hide,"1")).success&&config.getBoolean(dual),"hiding types must preserve dual signal");
  check(config.save(Map.of(hide,"0")).success&&config.getBoolean(dual)&&!config.getBoolean(hide),"dual signal must allow turning off type hiding");
  check(config.save(Map.of(dual,"0")).success&&!config.getBoolean(hide),"disabling dual signal must not enable type hiding");
  check(config.save(Map.of(hide,"1",dual,"1")).success,"explicit hidden types save");
  check(config.save(Map.of(dual,"0")).success&&config.getBoolean(hide),"disabling dual signal must preserve explicit type hiding");
  Map<String,String> fixed=Map.of(ConfigSchema.FAN_FIXED_ENABLED,"1");
  check(!config.saveFanTileSelection(fixed,config.configSnapshot().revision).success,"disabled tile must reject commands");
  check(config.save(Map.of(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED,"1")).success,"enable tile enhancement");
  check(!config.getBoolean(ConfigSchema.FAN_FIXED_ENABLED)&&!config.getBoolean(ConfigSchema.GAME_MASTER),"enabling tile must not enable fixed speed or game master");
  long tileRevision=config.configSnapshot().revision;
  check(config.saveFanTileSelection(fixed,tileRevision).success&&config.getBoolean(ConfigSchema.FAN_FIXED_ENABLED),"current enabled generation accepts an explicit selection");
  check(!config.saveFanTileSelection(Map.of(ConfigSchema.FAN_FIXED_ENABLED,"0"),tileRevision).success,"selection cannot reuse an obsolete revision");
  tileRevision=config.configSnapshot().revision;
  check(config.save(Map.of(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED,"0")).success,"disable tile enhancement");
  check(config.save(Map.of(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED,"1")).success,"reenable tile enhancement");
  check(!config.saveFanTileSelection(Map.of(ConfigSchema.FAN_FIXED_ENABLED,"0"),tileRevision).success&&config.getBoolean(ConfigSchema.FAN_FIXED_ENABLED),"disable and reopen must reject the old command while preserving fixed speed");
  check(config.save(Map.of(ConfigSchema.FAN_CALIBRATION_REQUEST,"measuring")).success,"begin calibration");
  check(!config.saveFanTileSelection(fixed,config.configSnapshot().revision).success,"calibration must be rechecked inside the save lock");
  check(config.save(Map.of(ConfigSchema.FAN_CALIBRATION_REQUEST,"")).success,"finish calibration");
  java.lang.reflect.Field tileLockField=AppConfig.class.getDeclaredField("CONFIG_LOCK");tileLockField.setAccessible(true);
  ExecutorService tileCaller=Executors.newSingleThreadExecutor();Future<AppConfig.SaveResult> waitingSelection;
  long queuedRevision=config.configSnapshot().revision;
  synchronized(tileLockField.get(null)){
   waitingSelection=tileCaller.submit(()->config.saveFanTileSelection(Map.of(ConfigSchema.FAN_FIXED_ENABLED,"0"),queuedRevision));
   check(config.save(Map.of(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED,"0")).success,"disable while a selection awaits the configuration lock");
  }
  check(!waitingSelection.get(1,TimeUnit.SECONDS).success&&config.getBoolean(ConfigSchema.FAN_FIXED_ENABLED),"queued selection must check the final disabled state atomically");
  tileCaller.shutdownNow();
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
 static void testFreeformPages(FakeContext context,AppConfig first)throws Exception {
  AppConfig second=new AppConfig(context);
  String gate=ConfigSchema.FREEFORM_ENABLED,all=ConfigSchema.FREEFORM_ALL_APPS,
   unlimited=ConfigSchema.FREEFORM_UNLIMITED,login=ConfigSchema.FREEFORM_GAME_LOGIN,
   external=ConfigSchema.FREEFORM_EXTERNAL_APPS;
  Map<String,String> off=Map.of(gate,"0",all,"0",unlimited,"0",login,"0",external,"0");
  for(boolean limitsFirst:new boolean[]{true,false}){
   check(first.save(off).success,"initialize independent freeform pages");
   // Both pages prepare updates against the old state before either queued writer runs.
   Map<String,String> limits=Map.of(all,"1",unlimited,"0"),rules=Map.of(login,"0",external,"0");
   CountDownLatch prepared=new CountDownLatch(2),releaseLimits=new CountDownLatch(1),releaseRules=new CountDownLatch(1);
   ExecutorService limitsWorker=Executors.newSingleThreadExecutor(),rulesWorker=Executors.newSingleThreadExecutor();
   try{
    Future<AppConfig.SaveResult> limitsSave=limitsWorker.submit(()->{prepared.countDown();releaseLimits.await();return first.saveFreeformControls(limits);});
    Future<AppConfig.SaveResult> rulesSave=rulesWorker.submit(()->{prepared.countDown();releaseRules.await();return second.saveFreeformControls(rules);});
    check(prepared.await(1,TimeUnit.SECONDS),"both page writes queued before either commits");
    if(limitsFirst){releaseLimits.countDown();check(limitsSave.get(1,TimeUnit.SECONDS).success,"limits first commit");releaseRules.countDown();}
    else{releaseRules.countDown();check(rulesSave.get(1,TimeUnit.SECONDS).success,"rules first commit");releaseLimits.countDown();}
    check(limitsSave.get(1,TimeUnit.SECONDS).success&&rulesSave.get(1,TimeUnit.SECONDS).success,"both freeform page writes commit");
    check(first.getBoolean(all)&&first.getBoolean(gate),"last writer must preserve sibling enablement in either commit order");
    check("1".equals(context.prefs(AppConfig.PREFS).disk.get(gate)),"derived gate is durable with the child switch");
   }finally{releaseLimits.countDown();releaseRules.countDown();limitsWorker.shutdownNow();rulesWorker.shutdownNow();}
  }
  check(first.save(off).success,"initialize lock-contention scenario");
  java.lang.reflect.Field lockField=AppConfig.class.getDeclaredField("CONFIG_LOCK");lockField.setAccessible(true);
  FutureTask<AppConfig.SaveResult> waitingRules=new FutureTask<>(()->second.saveFreeformControls(Map.of(login,"0",external,"0")));
  Thread waitingWriter=new Thread(waitingRules,"freeform-sibling-writer");
  synchronized(lockField.get(null)){
   waitingWriter.start();long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(1);
   while(waitingWriter.getState()!=Thread.State.BLOCKED){
    check(System.nanoTime()<deadline,"queued freeform writer reaches configuration lock");Thread.yield();
   }
   check(first.saveFreeformControls(Map.of(all,"1")).success,"sibling enable commits while queued writer awaits the shared lock");
  }
  check(waitingRules.get(1,TimeUnit.SECONDS).success&&first.getBoolean(gate)&&first.getBoolean(all),"queued writer derives from the latest state after acquiring CONFIG_LOCK");
  check(second.saveFreeformControls(Map.of(login,"1")).success,"enable independent login rule");
  check(first.saveFreeformControls(Map.of(all,"0")).success&&first.getBoolean(gate),"disabling limits preserves saved login enablement");
  check(second.saveFreeformControls(Map.of(login,"0")).success&&!first.getBoolean(gate),"last child off disables gate");
  check(first.saveFreeformControls(Map.of(unlimited,"1")).success&&first.getBoolean(gate),"unlimited child enables gate");
  check(second.saveFreeformControls(Map.of(external,"1")).success,"external jump child enables gate");
  check(first.saveFreeformControls(Map.of(unlimited,"0")).success&&first.getBoolean(gate),"external jump survives limits save");
  check(second.saveFreeformControls(Map.of(external,"0")).success&&!first.getBoolean(gate),"all four children participate in gate");
  Map<String,String> before=first.snapshot();context.prefs(AppConfig.PREFS).failNext=1;
  check(!first.saveFreeformControls(Map.of(all,"1")).success&&before.equals(first.snapshot()),"failed commit publishes neither child nor derived gate");
  check(first.save(Map.of(gate,"0",all,"1")).success&&!first.getBoolean(gate)&&first.getBoolean(all),"generic import retains explicit legacy master-off semantics");
  check(first.save(Map.of(login,"1")).success&&!first.getBoolean(gate),"partial generic import retains the existing gate");
  check(first.saveFreeformControls(Map.of("flag","3")).success&&!first.getBoolean(gate),"unrelated updates must not derive a gate");
  check(first.saveFreeformControls(Map.of(gate,"0",external,"1")).success&&!first.getBoolean(gate),"explicit master takes precedence even on editor save path");
  check(first.resetToDefaults().success&&!first.getBoolean(gate)&&!first.getBoolean(all)&&!first.getBoolean(login)&&!first.getBoolean(external),"reset retains complete schema defaults");
  System.out.println("Actual AppConfig freeform regression: both interleaved commit orders, four child gates, failed commit, import and reset semantics passed");
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
    files += [SRC / name for name in ('AppConfig.java', 'FrameworkConfigSync.java', 'DurablePreferences.java', 'RuntimeStateStore.java', 'RemoteConfig.java', 'ResetWriteFence.java')]
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', folder, *map(str, files)], check=True)
    subprocess.run(['java', '-cp', folder, 'ls.augment.com.TestAppConfigAsync'], check=True, timeout=10)
