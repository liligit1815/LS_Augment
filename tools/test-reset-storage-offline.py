"""Runs actual configuration/reset stores with Android memory-before-disk doubles.

No ADB, personal configuration, Root call, or device-wide reset is executed.
"""
from pathlib import Path
import json
import os
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
OUTPUT = ROOT / 'audit-output/reset-storage-offline'
OUTPUT.mkdir(parents=True, exist_ok=True)
helper = ROOT / 'tools/test-app-config-async.py'
scope = {'__file__': str(helper)}
exec(compile(helper.read_text(encoding='utf-8').split(
    "with tempfile.TemporaryDirectory(prefix='ls-app-config-async-')", 1)[0], str(helper), 'exec'), scope)
sources = dict(scope['sources'])
runner = (ROOT / 'tools/run-java-tests.sh').read_text(encoding='utf-8')
production = [ROOT / p for p in re.findall(r'"\$ROOT/([^\"]+\.java)"', runner)
              if p.startswith('android/app/src/main/')]
for source in production:
    sources.pop('ls/augment/com/' + source.name, None)
sources.pop('ls/augment/com/ConfigSnapshot.java', None)
sources.pop('ls/augment/com/TestAppConfigAsync.java', None)
sources['android/content/Context.java'] = sources['android/content/Context.java'].replace(
    'public abstract class Context {', '''public abstract class Context {
 public java.io.File fixtureData;
 public java.io.File getDataDir(){return fixtureData;}
 public java.io.File getFilesDir(){return new java.io.File(fixtureData,"files");}
 public java.io.File getCacheDir(){return new java.io.File(fixtureData,"cache");}
 public java.io.File getCodeCacheDir(){return new java.io.File(fixtureData,"code_cache");}
 public java.io.File[] getExternalFilesDirs(String type){return new java.io.File[]{new java.io.File(fixtureData,"external_files")};}
 public java.io.File[] getExternalCacheDirs(){return new java.io.File[]{new java.io.File(fixtureData,"external_cache")};}
''')
sources['android/content/ContentResolver.java'] = sources['android/content/ContentResolver.java'].replace(
    'public class ContentResolver {', '''public class ContentResolver {
 public final java.util.List<UriPermission> grants=new java.util.ArrayList<>();public int releases;public boolean failRelease;
 public java.util.List<UriPermission> getPersistedUriPermissions(){return new java.util.ArrayList<>(grants);}
 public void releasePersistableUriPermission(android.net.Uri uri,int flags){if(failRelease)throw new SecurityException("fixture");releases++;grants.removeIf(g->g.getUri()==uri);}
''')
sources['android/content/UriPermission.java'] = '''package android.content;public class UriPermission {
 private final android.net.Uri uri=android.net.Uri.parse("content://fixture/document");
 public android.net.Uri getUri(){return uri;}public boolean isReadPermission(){return true;}public boolean isWritePermission(){return false;}}
'''
sources['android/content/Intent.java'] = '''package android.content;public class Intent {
 public static final int FLAG_GRANT_READ_URI_PERMISSION=1,FLAG_GRANT_WRITE_URI_PERMISSION=2;}
'''
fault_source = (ROOT / 'tools/TestRuntimeStores.java').read_text(encoding='utf-8')
fault_classes = '    static final class FakeContext' + fault_source.split(
    '    static final class FakeContext', 1)[1].rsplit('\n}', 1)[0]
sources['ls/augment/com/TestResetStorageOffline.java'] = r'''package ls.augment.com;
import android.content.*;import android.os.Bundle;import java.util.*;import java.util.concurrent.*;import java.nio.file.*;import java.io.*;
public final class TestResetStorageOffline {
 static final String OLD="retired_unknown_key";
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static FakeContext seeded(){
  FakeContext context=new FakeContext();
  context.prefs(AppConfig.PREFS).edit().putString(OLD,"private old information")
   .putString(ConfigSchema.HEALTH_ACCOUNT,"a".repeat(64)).putString(ConfigSchema.HEALTH_SINCE,"1700000000")
   .putString(ConfigSchema.HEALTH_PLAN,"obsolete serialized plan")
   .putString(ConfigSchema.HIDE_TARGETS,"v3:0:0:com.example.hidden")
   .putString(ConfigSchema.FREEFORM_EXCLUDED_APPS,"com.example.excluded")
   .putString(ConfigSchema.FREEFORM_EXTERNAL_APPS,"com.example.external")
   .putString(ConfigSchema.FREEFORM_GAME_APPS,"com.example.game").commit();
  return context;
 }
 static void assertDefaults(AppConfig config,FakePreferences storage){
  Map<String,String> observed=config.snapshot(),expected=ConfigSchema.defaults();
  Map<String,String> differences=new TreeMap<>();
  for(String key:expected.keySet())if(!Objects.equals(observed.get(key),expected.get(key)))
   differences.put(key,"actual="+observed.get(key)+" default="+expected.get(key));
  check(differences.isEmpty(),"full configuration differs from schema defaults: "+differences);
  check(!storage.disk.containsKey(OLD),"retired key survived on disk");
  for(String key:List.of(ConfigSchema.HEALTH_ACCOUNT,ConfigSchema.HEALTH_PLAN,ConfigSchema.HEALTH_SINCE,
      ConfigSchema.HIDE_TARGETS,ConfigSchema.FREEFORM_EXCLUDED_APPS,ConfigSchema.FREEFORM_EXTERNAL_APPS,ConfigSchema.FREEFORM_GAME_APPS))
   check(Objects.equals(storage.disk.get(key),ConfigSchema.defaults().get(key)),"credential/list survived: "+key);
 }
 public static void main(String[] args)throws Exception {
  String test=args[0];
  switch(test){
   case "fence": {
    long old=ResetWriteFence.generation();ResetWriteFence.begin();long during=ResetWriteFence.generation();
    check(ResetWriteFence.stale(old)&&!ResetWriteFence.stale(during),"owner generation/pre-reset invalidation");
    ExecutorService writer=Executors.newSingleThreadExecutor();
    try{writer.submit(()->{
     check(ResetWriteFence.blocked()&&ResetWriteFence.stale(during),"concurrent writer not blocked");
     ResetWriteFence.end();check(ResetWriteFence.blocked(),"non-owner ended reset");
     try{ResetWriteFence.begin();throw new AssertionError("nested owner accepted");}catch(IllegalStateException expected){}
    }).get(2,TimeUnit.SECONDS);}finally{writer.shutdownNow();}
    ResetWriteFence.end();check(ResetWriteFence.stale(during),"editor created during reset remains valid after end");
    check(!ResetWriteFence.stale(ResetWriteFence.generation()),"fresh post-reset editor rejected");break;
   }
   case "config_replace": {
    FakeContext context=seeded();AppConfig config=new AppConfig(context);
    check(config.resetToDefaults().success,"default replacement failed");assertDefaults(config,context.prefs(AppConfig.PREFS));
    new AppConfig(context);assertDefaults(config,context.prefs(AppConfig.PREFS));break;
   }
   case "config_failed_commit": {
    FakeContext context=seeded();AppConfig config=new AppConfig(context);FakePreferences storage=context.prefs(AppConfig.PREFS);
    Map<String,Object> before=new HashMap<>(storage.disk);String snapshot=config.configSnapshot().serialize();int notifications=context.resolver.notifications;
    storage.failNext=1;check(!config.resetToDefaults().success,"failed disk reset reported success");
    check(storage.disk.equals(before),"failed reset changed confirmed disk");
    check(config.configSnapshot().serialize().equals(snapshot),"failed reset changed confirmed snapshot");
    check(context.resolver.notifications==notifications,"failed reset notified provider readers");
    check(config.resetToDefaults().success,"same reset retry failed");assertDefaults(config,storage);break;
   }
   case "config_failed_no_publish": {
    FakeContext context=seeded();AppConfig config=new AppConfig(context);FakePreferences remote=new FakePreferences();
    ModuleScopeService.current=new io.github.libxposed.service.XposedService(){public long getFrameworkProperties(){return PROP_CAP_REMOTE;}
     public SharedPreferences getRemotePreferences(String name){return remote;}};
    FrameworkConfigSync.initialize(context);long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);
    while(!FrameworkConfigSync.isPublished(config.configSnapshot())){
     check(System.nanoTime()<deadline,"baseline framework publication timed out");Thread.sleep(5);
    }
    var field=FrameworkConfigSync.class.getDeclaredField("REQUESTS");field.setAccessible(true);
    var requests=(java.util.concurrent.atomic.AtomicLong)field.get(null);long beforeRequests=requests.get();
    Map<String,Object> beforeRemote=new HashMap<>(remote.disk);int commits=remote.commits,notifications=context.resolver.notifications;
    context.prefs(AppConfig.PREFS).failNext=1;
    check(!config.resetToDefaults().success,"failed disk reset reported success");Thread.sleep(60);
    check(requests.get()==beforeRequests,"failed local reset enqueued framework publication");
    check(remote.commits==commits&&remote.disk.equals(beforeRemote),"failed local reset published optimistic state remotely");
    check(context.resolver.notifications==notifications,"failed local reset notified observers");break;
   }
   case "config_fence": {
    FakeContext context=seeded();AppConfig old=new AppConfig(context);ResetWriteFence.begin();AppConfig owner=new AppConfig(context);
    int commits=context.prefs(AppConfig.PREFS).commits;ExecutorService worker=Executors.newSingleThreadExecutor();AppConfig during;
    try{during=worker.submit(()->{
      AppConfig blocked=new AppConfig(context);
      check(context.prefs(AppConfig.PREFS).commits==commits,"blocked constructor committed initialization/migration");
      check(!blocked.save(Map.of(ConfigSchema.STORE_DOWNLOAD_COUNT,"3")).success,"concurrent save not blocked");return blocked;
    }).get(2,TimeUnit.SECONDS);}finally{worker.shutdownNow();}
    check(owner.resetToDefaults().success,"reset owner cannot commit");ResetWriteFence.end();
    check(!old.save(Map.of(ConfigSchema.HEALTH_ENABLED,"1")).success,"pre-reset editor re-enabled feature");
    check(!during.save(Map.of(ConfigSchema.HEALTH_ENABLED,"1")).success,"during-reset editor re-enabled feature");
    AppConfig fresh=new AppConfig(context);check(fresh.save(Map.of(ConfigSchema.STORE_DOWNLOAD_COUNT,"3")).success,"new editor cannot save");
    check(!context.prefs(AppConfig.PREFS).disk.containsKey(OLD),"new editor resurrected retired key");break;
   }
   case "blocked_constructor": {
    FakeContext context=seeded();ResetWriteFence.begin();int commits=context.prefs(AppConfig.PREFS).commits;
    ExecutorService worker=Executors.newSingleThreadExecutor();
    try{worker.submit(()->new AppConfig(context)).get(2,TimeUnit.SECONDS);}
    finally{worker.shutdownNow();ResetWriteFence.end();}
    check(context.prefs(AppConfig.PREFS).commits==commits,"uninitialized blocked constructor wrote configuration");break;
   }
   case "runtime_clear": {
    FakeContext context=new FakeContext();RuntimeStateStore.publishHidden(context,"v3:0:0:com.example.old","ALL_HIDDEN");
    FakePreferences disk=context.prefs("ls_augment_runtime_v2");disk.failNext=1;
    check(!RuntimeStateStore.clearForReset(context),"failed runtime clear accepted");
    check(RuntimeStateStore.values(context).get(RemoteConfig.HIDDEN).equals("v3:0:0:com.example.old"),"failed clear changed cached runtime");
    check(RuntimeStateStore.clearForReset(context)&&disk.disk.isEmpty(),"runtime clear retry did not remove disk keys");
    check(RuntimeStateStore.values(context).get(RemoteConfig.HIDDEN).equals("")&&RuntimeStateStore.values(context).get(RemoteConfig.TILE).equals("EMPTY"),"runtime cache not reset");break;
   }
   case "fuse_clear": {
    FakeContext context=new FakeContext();FakePreferences disk=context.prefs("ls_augment_crash_fuse_v2");
    disk.edit().putBoolean("migrated",true).putBoolean("fused",true).putString("armedSession","private-session").putString(OLD,"private").commit();
    check(CrashFuseStore.isFused(context),"baseline fuse missing");disk.failNext=1;
    check(!CrashFuseStore.clearForReset(context)&&CrashFuseStore.isFused(context),"failed clear changed confirmed fuse");
    check(CrashFuseStore.clearForReset(context)&&!CrashFuseStore.isFused(context),"fuse clear retry failed");
    check(disk.disk.equals(Map.of("migrated",true)),"fuse unknown/session keys survived");break;
   }
   case "remote_replace": {
    FakeContext context=seeded();AppConfig config=new AppConfig(context);FakePreferences remote=new FakePreferences();
    remote.edit().putString(OLD,"old remote value").putString("retired_health_binding","a".repeat(64)).commit();
    ModuleScopeService.current=new io.github.libxposed.service.XposedService(){public long getFrameworkProperties(){return PROP_CAP_REMOTE;}
     public SharedPreferences getRemotePreferences(String name){return remote;}};
    check(FrameworkConfigSync.publishForReset(context,false).isSuccess()&&remote.disk.containsKey(OLD),"pause publication should preserve old remote records until final reset");
    check(config.resetToDefaults().success,"local replacement failed");check(RuntimeStateStore.clearForReset(context),"runtime clear failed");
    Map<String,Object> before=new HashMap<>(remote.disk);remote.failNext=1;
    check(!FrameworkConfigSync.publishForReset(context,true).isSuccess(),"failed remote replacement accepted");
    check(remote.disk.equals(before),"failed remote replacement changed confirmed disk");
    check(FrameworkConfigSync.publishForReset(context,true).isSuccess(),"remote replacement retry failed");
    check(!remote.disk.containsKey(OLD)&&!remote.disk.containsKey("retired_health_binding"),"remote private retired records survived");
    check(remote.disk.keySet().equals(Set.of(RemoteConfig.SNAPSHOT,RemoteConfig.HIDDEN,RemoteConfig.TILE,RemoteConfig.RUNTIME_REVISION)),"unexpected remote fields survived");
    check(FrameworkConfigSync.isPublished(config.configSnapshot()),"published cache not current");break;
   }
   case "module_storage":case "module_storage_failed_pref":case "module_storage_orphan_backup":case "module_storage_failed_grant": {
    Path work=Files.createTempDirectory("lsa-module-storage-fixture-");
    try{
     FakeContext context=seeded();context.fixtureData=Files.createDirectory(work.resolve("module-data")).toFile();
     Path prefs=Files.createDirectory(context.fixtureData.toPath().resolve("shared_prefs"));
     for(String directory:List.of("files","cache","code_cache","external_files","external_cache")){
      Path folder=Files.createDirectory(context.fixtureData.toPath().resolve(directory));Files.writeString(folder.resolve("old-private-info"),"module fixture");
     }
     Path imported=work.resolve("original-selected-document");Files.writeString(imported,"original document");
     context.resolver.grants.add(new UriPermission());context.resolver.grants.add(new UriPermission());
     AppConfig config=new AppConfig(context);Map<String,Object> configBefore=new HashMap<>(context.prefs(AppConfig.PREFS).disk);
     Files.writeString(prefs.resolve(AppConfig.PREFS+".xml"),"configuration marker");
     FakePreferences obsolete=context.prefs("retired-private-state");obsolete.edit().putString("old-account-hash","a".repeat(64)).commit();
     Files.writeString(prefs.resolve("retired-private-state"+(test.equals("module_storage_orphan_backup")?".xml.bak":".xml")),"cached pref marker");
     if(test.equals("module_storage_failed_pref"))obsolete.failNext=1;
     if(test.equals("module_storage_failed_grant"))context.resolver.failRelease=true;
     boolean failed=false;try{ModuleResetStorage.clear(context);}catch(IOException expected){failed=true;}
     check(failed==(test.equals("module_storage_failed_pref")||test.equals("module_storage_failed_grant")),"unexpected module storage failure status");
     check(context.prefs(AppConfig.PREFS).disk.equals(configBefore),"module storage altered coordinator-owned main config");
     check(Files.readString(imported).equals("original document"),"original imported document deleted");
     if(test.equals("module_storage_failed_pref")){
      check(obsolete.disk.containsKey("old-account-hash"),"failed pref clear changed disk");
      check(Files.exists(context.getFilesDir().toPath().resolve("old-private-info")),"continued deleting files after pref failure");
      check(context.resolver.releases==0,"continued revoking imports after pref failure");
     }else{
      check(obsolete.disk.isEmpty(),"old cached prefs survived backup enumeration");
      for(String directory:List.of("files","cache","code_cache","external_files","external_cache"))
       check(new File(context.fixtureData,directory).list().length==0,"private directory not cleared: "+directory);
      if(!test.equals("module_storage_failed_grant"))check(context.resolver.releases==2&&context.resolver.grants.isEmpty(),"retained import grants survived");
     }
    }finally{try(var files=Files.walk(work)){for(Path file:files.sorted(Comparator.reverseOrder()).toList())Files.deleteIfExists(file);}}
    break;
   }
   default: throw new AssertionError(test);
  }
  System.out.println("PASS "+test+" actual production classes; no ADB or personal reset");
 }
''' + fault_classes + '\n}\n'
cases = ('fence', 'config_replace', 'config_failed_commit', 'config_failed_no_publish', 'config_fence', 'blocked_constructor',
         'runtime_clear', 'fuse_clear', 'remote_replace', 'module_storage', 'module_storage_failed_pref',
         'module_storage_orphan_backup', 'module_storage_failed_grant')
environment = dict(os.environ)
java_home = Path(r'C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
if java_home.is_dir():
    environment['PATH'] = str(java_home) + os.pathsep + environment.get('PATH', '')
javac = str(java_home / 'javac.exe') if (java_home / 'javac.exe').exists() else 'javac'
java = str(java_home / 'java.exe') if (java_home / 'java.exe').exists() else 'java'
results = []
with tempfile.TemporaryDirectory(prefix='lsa-reset-stores-', dir=OUTPUT) as temporary:
    work = Path(temporary).resolve()
    assert work.is_relative_to(OUTPUT.resolve())
    files = []
    for name, code in sources.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(code, encoding='utf-8')
        files.append(path)
    files += [*production, *[SRC / name for name in ('AppConfig.java', 'ConfigSnapshot.java',
              'FrameworkConfigSync.java', 'DurablePreferences.java', 'RuntimeStateStore.java',
              'CrashFuseStore.java', 'RemoteConfig.java', 'ResetWriteFence.java', 'ModuleResetStorage.java', 'OwnedFileCleaner.java')]]
    subprocess.run([javac, '--release', '17', '-encoding', 'UTF-8', '-d', str(work),
                    *map(str, dict.fromkeys(files))], check=True, timeout=45, env=environment)
    for case in cases:
        run = subprocess.run([java, '-cp', str(work), 'ls.augment.com.TestResetStorageOffline', case],
                             text=True, capture_output=True, timeout=15, env=environment)
        results.append({'case': case, 'passed': run.returncode == 0, 'output': run.stdout.strip(), 'error': run.stderr.strip()})
        print(run.stdout, end='')
        if run.stderr:
            print(run.stderr, end='')
report = {'success': all(case['passed'] for case in results), 'scope': 'ACTUAL_CLASSES_HOST_FAULT_DOUBLES_NO_DEVICE', 'cases': results}
(OUTPUT / 'result.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
raise SystemExit(0 if report['success'] else 1)
