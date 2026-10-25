"""Execute real AppConfig and Settings bridge against local Android fault doubles.

No device installation, device settings change, Binder IPC or Root command is used.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
helper = ROOT / 'tools/test-app-config-async.py'
scope = {'__file__': str(helper)}
exec(compile(helper.read_text(encoding='utf-8').split(
    "with tempfile.TemporaryDirectory(prefix='ls-app-config-async-')", 1)[0], str(helper), 'exec'), scope)
sources = dict(scope['sources'])
sources.pop('ls/augment/com/TestAppConfigAsync.java')
sources.setdefault('ls/augment/com/CompetitiveKeyOptions.java', '''package ls.augment.com;final class CompetitiveKeyOptions {
 static final String ENABLED="competitive_enabled",NATIVE_SETTING="redmagic_competitive_key_function";}
''')
sources.setdefault('ls/augment/com/ModuleSystemSettings.java', '''package ls.augment.com;final class ModuleSystemSettings {
 static final class WriteResult {final boolean success=true;final String message="";}
 static final class RestoreResult {final boolean success=true;final String message="";}
 static WriteResult put(android.content.Context c,String ns,String key,String value){throw new AssertionError("signal bridge must never write OEM settings");}
 static RestoreResult restoreOne(android.content.Context c,String ns,String key){throw new AssertionError("signal bridge must never restore OEM settings");}}
''')
sources['ls/augment/com/SystemUiOptions.java'] = '''package ls.augment.com;public final class SystemUiOptions {
 public static final String SIGNAL_DUAL="ls_augment_rm_signal_dual",SIGNAL_DUAL_STYLE="ls_augment_rm_signal_dual_style";}
'''
sources['ls/augment/com/ConfigSchema.java'] = sources['ls/augment/com/ConfigSchema.java'].replace(
    'values.put("flag","0");', 'values.put("ls_augment_rm_signal_dual_style","0");values.put("flag","0");')
sources['ls/augment/com/ConfigSnapshot.java'] = sources['ls/augment/com/ConfigSnapshot.java'].replace(
    'String serialize()', 'String get(String key){return values.get(key);}String serialize()')
sources['android/os/Bundle.java'] = sources['android/os/Bundle.java'].replace(
    'private final java.util.Map<String,Object> data=',
    'public int size(){return data.size();}public Object get(String key){return data.get(key);}private final java.util.Map<String,Object> data=')
sources['android/content/pm/ApplicationInfo.java'] = '''package android.content.pm;public final class ApplicationInfo {public int uid;}'''
sources['android/content/pm/PackageManager.java'] = '''package android.content.pm;public class PackageManager {
 public final java.util.Map<Integer,String[]> packages=new java.util.HashMap<>();public int settingsUid=1000;
 public String[] getPackagesForUid(int uid){return packages.get(uid);}
 public ApplicationInfo getApplicationInfo(String name,int flags)throws NameNotFoundException{
  if(!"com.android.settings".equals(name))throw new NameNotFoundException();ApplicationInfo value=new ApplicationInfo();value.uid=settingsUid;return value;}
 public static final class NameNotFoundException extends Exception {}}
'''
fault_source = (ROOT / 'tools/TestRuntimeStores.java').read_text(encoding='utf-8')
fault_classes = '    static final class FakeContext' + fault_source.split(
    '    static final class FakeContext', 1)[1].rsplit('\n}', 1)[0]
sources['ls/augment/com/TestSignalStyleControl.java'] = r'''package ls.augment.com;
import android.content.*;import android.os.*;import java.util.*;import java.util.concurrent.*;
public final class TestSignalStyleControl {
 static int checks;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static Bundle select(boolean dual){Bundle value=new Bundle();value.putBoolean("dual",dual);return value;}
 static Bundle choice(int index){Bundle value=new Bundle();value.putInt("choice",index);return value;}
 static Bundle choose(FakeContext context,int index){return SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,choice(index),
  1000,"com.android.settings",new String[]{"android","com.android.settings"});}
 static Bundle read(FakeContext context){return SignalStyleControl.call(context,SignalStylePolicy.READ,null,null,
  1000,"com.android.settings",new String[]{"android","com.android.settings"});}
 static Bundle choose(FakeContext context,boolean dual){return SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,select(dual),
  1000,"com.android.settings",new String[]{"android","com.android.settings"});}
 public static void main(String[] args)throws Exception {
  FakeContext context=new FakeContext();AppConfig duo=new AppConfig(context);
  String dual=SystemUiOptions.SIGNAL_DUAL,group=ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,master=ConfigSchema.SYSTEMUI_MASTER;
  check(duo.save(Map.of(dual,"0",group,"0",master,"0")).success,"initial state saves");
  Bundle initial=read(context);check(initial.getBoolean("ok")&&!initial.getBoolean("dual")&&!initial.getBoolean("master"),"bridge returns canonical initial state");
  check("0".equals(initial.getString("style")),"existing configuration exposes Honor as the default style");
  check(initial.getInt("choice",-1)==0,"disabled dual is canonically flat");
  for(int index:new int[]{1,2,1,2,0}){
   long prior=duo.configSnapshot().revision;
   Bundle selected=choose(context,index);
   check(selected.getBoolean("ok")&&selected.getInt("choice",-1)==index,"all three native choices round trip");
   check(selected.getBoolean("dual")== (index!=0)&&selected.getLong("revision")>prior,"selection commits one new generation");
   check(index==0?"1".equals(duo.get(SystemUiOptions.SIGNAL_DUAL_STYLE)):Integer.toString(index-1).equals(duo.get(SystemUiOptions.SIGNAL_DUAL_STYLE)),"both styles save atomically; flat retains iOS memory");
   check(read(context).getInt("choice",-1)==index,"a newly opened native popup can reflect Duo's persisted state");
  }
  context.prefs(AppConfig.PREFS).failNext=1;long failedRevision=duo.configSnapshot().revision;
  Bundle failedChoice=choose(context,1);
  check(!failedChoice.getBoolean("ok")&&failedChoice.getInt("choice",-1)==0&&"1".equals(failedChoice.getString("style")),"failed style write cannot optimistically move the selection");
  check(duo.configSnapshot().revision==failedRevision&&!duo.getBoolean(dual),"failed transaction preserves gate, style and revision");
  check(duo.save(Map.of(SystemUiOptions.SIGNAL_DUAL_STYLE,"1")).success,"Duo selects iOS style through the normal configuration path");
  check("1".equals(read(context).getString("style")),"Settings reads the selected iOS style from Duo");
  long before=initial.getLong("revision");Bundle merged=choose(context,true);
  check(merged.getBoolean("ok")&&merged.getBoolean("dual")&&merged.getBoolean("master"),"Settings merged selection enables real dual gate");
  check("1".equals(merged.getString("style"))&&"1".equals(duo.get(SystemUiOptions.SIGNAL_DUAL_STYLE)),"Settings merge preserves the selected iOS style");
  check(merged.getLong("revision")>before&&duo.getBoolean(dual),"Settings write is immediately visible to Duo with advanced revision");
  check(duo.save(Map.of(group,"1")).success,"Duo three-in-one selection commits");
  check(!duo.getBoolean(dual)&&duo.getBoolean(group),"Duo selecting three-in-one turns dual off atomically");
  check(duo.save(Map.of(group,"1",dual,"1")).success,"combined editor batch gives explicit three-in-one priority");
  check(duo.getBoolean(group)&&!duo.getBoolean(dual),"canonical result of combined batch never contains both enabled flags");
  Bundle reflected=read(context);check(reflected.getBoolean("threeInOne")&&!reflected.getBoolean("dual"),"Settings reads latest Duo state");
  long blockedRevision=reflected.getLong("revision");Bundle rejected=choose(context,true);
  check(!rejected.getBoolean("ok")&&SignalStylePolicy.CONFLICT_MESSAGE.equals(rejected.getString("message")),"Settings merged selection shows exact conflict message");
  check(!rejected.getBoolean("dual")&&rejected.getBoolean("threeInOne")&&rejected.getLong("revision")==blockedRevision,"rejection preserves flags and revision");
  for(int index:new int[]{1,2}){
   Bundle conflict=choose(context,index);
   check(!conflict.getBoolean("ok")&&SignalStylePolicy.CONFLICT_MESSAGE.equals(conflict.getString("message")),"both dual styles enforce three-in-one exclusion");
   check(conflict.getInt("choice",-1)==0&&conflict.getLong("revision")==blockedRevision,"conflict cannot partially persist gate or renderer");
  }
  Bundle flat=choose(context,false);check(flat.getBoolean("ok")&&!flat.getBoolean("dual")&&flat.getBoolean("threeInOne"),"flat selection never disables three-in-one");
  check("1".equals(flat.getString("style"))&&"1".equals(duo.get(SystemUiOptions.SIGNAL_DUAL_STYLE)),"flat selection and conflict preserve the disabled feature's saved style");
  check(duo.save(Map.of(group,"0")).success,"clear opponent for stale editor case");
  Map<String,String> staleUpdates=SignalStylePolicy.selection(true);
  java.lang.reflect.Field lock=AppConfig.class.getDeclaredField("CONFIG_LOCK");lock.setAccessible(true);
  FutureTask<AppConfig.SaveResult> queued=new FutureTask<>(()->duo.save(staleUpdates));
  Thread queuedWriter=new Thread(queued,"stale-settings-save");
  synchronized(lock.get(null)){
   queuedWriter.start();long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(1);
   while(queuedWriter.getState()!=Thread.State.BLOCKED){if(System.nanoTime()>=deadline)throw new AssertionError("stale write reaches save lock");Thread.yield();}
   check(duo.save(Map.of(group,"1")).success,"three-in-one commits while stale Settings write waits");
  }
  AppConfig.SaveResult stale=queued.get(1,TimeUnit.SECONDS);
  check(!stale.success&&SignalStylePolicy.CONFLICT_MESSAGE.equals(stale.message)&&duo.getBoolean(group)&&!duo.getBoolean(dual),"save rechecks latest state under write lock");
  check(duo.save(Map.of(group,"0")).success,"clear opponent before failed commit");
  Map<String,String> savedState=duo.snapshot();context.prefs(AppConfig.PREFS).failNext=1;
  Bundle failed=choose(context,true);check(!failed.getBoolean("ok")&&!failed.getBoolean("dual")&&savedState.equals(duo.snapshot()),"failed preference commit changes neither bridge result nor Duo state");
  long unchanged=duo.configSnapshot().revision;
  check(!SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,select(true),1001000,"com.android.settings",new String[]{"com.android.settings"}).getBoolean("ok"),"cross-user Settings denied");
  check(!SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,select(true),1000,"android",new String[]{"com.android.settings"}).getBoolean("ok"),"shared UID does not grant another package writes");
  check(!SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,select(true),2000,"com.android.shell",new String[]{"com.android.shell"}).getBoolean("ok"),"shell caller denied");
  context.getPackageManager().settingsUid=1001;
  check(!choose(context,true).getBoolean("ok"),"package-manager UID mismatch denied");context.getPackageManager().settingsUid=1000;
  Bundle polluted=select(true);polluted.putString("otherFeature","1");
  check(!SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,polluted,1000,"com.android.settings",new String[]{"com.android.settings"}).getBoolean("ok"),"arbitrary key pollution denied");
  Bundle styleWrite=select(false);styleWrite.putString("style","0");
  check(!SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,styleWrite,1000,"com.android.settings",new String[]{"com.android.settings"}).getBoolean("ok")&&"1".equals(duo.get(SystemUiOptions.SIGNAL_DUAL_STYLE)),"native two-choice dialog cannot accidentally replace the saved style");
  Bundle malformed=new Bundle();malformed.putString("dual","1");
  check(!SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,malformed,1000,"com.android.settings",new String[]{"com.android.settings"}).getBoolean("ok"),"boolean type required");
  for(int invalid:new int[]{-1,3,Integer.MAX_VALUE})check(!choose(context,invalid).getBoolean("ok"),"out of range choice rejected");
  Bundle choiceText=new Bundle();choiceText.putString("choice","2");
  check(!SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,choiceText,1000,"com.android.settings",new String[]{"com.android.settings"}).getBoolean("ok"),"choice requires an integer");
  Bundle mixed=choice(2);mixed.putBoolean("dual",true);
  check(!SignalStyleControl.call(context,SignalStylePolicy.SELECT,null,mixed,1000,"com.android.settings",new String[]{"com.android.settings"}).getBoolean("ok"),"mixed legacy and new protocol rejected");
  check(!SignalStyleControl.call(context,SignalStylePolicy.READ,"unexpected",null,1000,"com.android.settings",new String[]{"com.android.settings"}).getBoolean("ok"),"unexpected arg denied");
  check(!SignalStyleControl.call(context,SignalStylePolicy.READ,null,new Bundle(),1000,"com.android.settings",new String[]{"com.android.settings"}).getBoolean("ok"),"read extras denied");
  check(duo.configSnapshot().revision==unchanged&&!duo.getBoolean(dual),"all rejected calls leave store unchanged");
  System.out.println("Actual AppConfig + SignalStyleControl: "+checks+" assertions passed; Settings/Duo synchronization, locked stale writes, three-in-one exclusivity, failed commit, identity and input rejection");
 }
''' + fault_classes + '\n}\n'

java_home = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
javac = str(java_home / 'bin/javac.exe') if os.name == 'nt' else 'javac'
java = str(java_home / 'bin/java.exe') if os.name == 'nt' else 'java'
with tempfile.TemporaryDirectory(prefix='ls-signal-style-') as folder:
    work = Path(folder)
    files = []
    for name, code in sources.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(code, encoding='utf-8')
        files.append(path)
    files += [SRC / name for name in ('AppConfig.java', 'FrameworkConfigSync.java', 'DurablePreferences.java',
        'RuntimeStateStore.java', 'RemoteConfig.java', 'ResetWriteFence.java', 'SignalStylePolicy.java', 'SignalStyleControl.java')]
    files.append(ROOT / 'tools/TestSignalStylePolicy.java')
    subprocess.run([javac, '-encoding', 'UTF-8', '--release', '17', '-d', folder, *map(str, files)], check=True)
    subprocess.run([java, '-cp', folder, 'ls.augment.com.TestSignalStylePolicy'], check=True, timeout=10)
    subprocess.run([java, '-cp', folder, 'ls.augment.com.TestSignalStyleControl'], check=True, timeout=10)
