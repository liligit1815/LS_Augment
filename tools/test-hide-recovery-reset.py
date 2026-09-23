"""Compile and execute the real ConfigResetController with offline Android doubles.

Verifies pause/check/clear ordering and retained selections; no Root or PM process
is executed. Android and persistence operations are explicit injectable doubles.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
STUBS = {
    'android/content/Context.java': '''package android.content;
public class Context {
 public static int clears; public Context getApplicationContext(){return this;}
 public String getPackageName(){return "ls.augment.com";}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
 public Prefs getSharedPreferences(String name,int mode){return new Prefs();}
 public static class Prefs {public Prefs edit(){return this;}public Prefs clear(){clears++;return this;}public boolean commit(){return true;}}
}''',
    'android/content/ComponentName.java': '''package android.content;
public class ComponentName {public ComponentName(Context c,String s){} public ComponentName(Context c,Class<?> s){}}''',
    'android/content/pm/PackageManager.java': '''package android.content.pm;
public class PackageManager {public static final int COMPONENT_ENABLED_STATE_DEFAULT=0,DONT_KILL_APP=1;
public void setComponentEnabledSetting(android.content.ComponentName c,int state,int flag){}}''',
    'android/service/quicksettings/TileService.java': '''package android.service.quicksettings;
public class TileService {public static void requestListeningState(android.content.Context c,android.content.ComponentName n){}}''',
}
TEST = r'''
package ls.augment.com;
import android.content.Context;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;
class Fixture {
 static final List<String> trace=new ArrayList<>();
 static void event(String e){if(!RootHideManager.ACTION_LOCK.isHeldByCurrentThread())throw new AssertionError("unlocked "+e);trace.add(e);}
 static void reset(){trace.clear();Context.clears=0;AppConfig.values=new LinkedHashMap<>(ConfigSchema.defaults());
  AppConfig.values.put(ConfigSchema.HIDE_TARGETS,"v3:0:0:org.example.same;v3:12:44:org.example.same");
  AppConfig.values.put(ConfigSchema.HIDE_MASTER,"1");AppConfig.values.put(ConfigSchema.AUTOMATION_ENABLED,"1");
  AppConfig.values.put("label","keep");AppConfig.failPause=false;RootHideManager.state=RootHideManager.RootState.GRANTED;
  RootHideManager.states=new LinkedHashMap<>();RootHideManager.failClear=false;RootHideManager.clears=0;
  BatteryLifeControl.ok=true;BatteryLifeControl.calls=0;}
}
class ConfigSchema {
 static final String HIDE_TARGETS="targets",HIDE_MASTER="master",AUTOMATION_ENABLED="auto",BATTERY_DISABLE_AGE_REDUCTION="battery";
 static boolean truthy(String s){return "1".equals(s);}
 static Map<String,String> defaults(){return Map.of(HIDE_TARGETS,"",HIDE_MASTER,"0",AUTOMATION_ENABLED,"0",BATTERY_DISABLE_AGE_REDUCTION,"0","label","default");}
 static Set<String> keys(){return defaults().keySet();}
}
class AppConfig {
 static Map<String,String> values;static boolean failPause;
 AppConfig(Context c){}
 Map<String,String> snapshot(){return new LinkedHashMap<>(values);}
 SaveResult save(Map<String,String> update){Fixture.event(update.size()==2?"pause":"defaults");
  if(update.size()==2&&failPause)return new SaveResult(false);values.putAll(update);return new SaveResult(true);}
 static class SaveResult {final boolean success,runtimeSynced;final String message="save fixture";
 SaveResult(boolean s){success=s;runtimeSynced=s;}}
}
class RootHideManager {
 static final ReentrantLock ACTION_LOCK=new ReentrantLock();
 enum RootState {GRANTED,DENIED} enum State {VISIBLE,HIDDEN,MISSING,ERROR}
 static RootState state;static Map<Target,State> states;static int clears;static boolean failClear;
 RootHideManager(Context c){}
 record Target(int userId,String packageName) {}
 Set<Target> targets(){return new LinkedHashSet<>(List.of(new Target(0,"org.example.same"),new Target(12,"org.example.same")));}
 RootStatus rootStatus(){Fixture.event("root");return new RootStatus();}
 static class RootStatus {final RootState state=RootHideManager.state;final String message="root fixture";}
 State queryState(Target t){Fixture.event("query:"+t.userId);return states.getOrDefault(t,State.VISIBLE);}
 OperationResult saveTargets(Set<Target> targets){Fixture.event("clear-selection");clears++;
  if(!failClear)AppConfig.values.put(ConfigSchema.HIDE_TARGETS,"");return new OperationResult(!failClear);}
 static class OperationResult {final boolean success;final String message="clear fixture";OperationResult(boolean s){success=s;}}
}
class ScreenAutomation {static void sync(Context c){Fixture.event("sync");}}
class BatteryLifeControl {static int calls;static boolean ok;
 static RootShell.Result reconcile(Context c,boolean value){Fixture.event("battery");calls++;return new RootShell.Result(ok?0:74,"battery",false);}}
class AugmentTileService {}
class AuditLog {static void write(Context c,String action,String message){Fixture.event("audit:"+action);}}
public class TestHideRecoveryReset {
 static int passed,failed;
 static void check(boolean value,String message){if(!value)throw new AssertionError(message+" "+Fixture.trace);}
 static void test(String name,Runnable run){Fixture.reset();try{run.run();passed++;System.out.println("PASS reset: "+name);}
 catch(Throwable e){failed++;System.out.println("FAIL reset: "+name+": "+e);}
 check(!RootHideManager.ACTION_LOCK.isLocked(),"lock leaked");}
 static ConfigResetController.Result reset(){return ConfigResetController.reset(new Context());}
 static void retained(){check(AppConfig.values.get("targets").equals("v3:0:0:org.example.same;v3:12:44:org.example.same"),"selection cleared");
  check(AppConfig.values.get("label").equals("keep"),"other settings erased");
  check(RootHideManager.clears==0&&Context.clears==0,"clear called before review");
  check(AppConfig.values.get("master").equals("0")&&AppConfig.values.get("auto").equals("0"),"automation not paused");}
 public static void main(String[] args){
  for(String raw:List.of("0:org.example.same;12:org.example.same",
      "p3:12:44:org.example.same", "v3:0:0:org.example.same;12:org.example.same",
      "v9:12:44:org.example.same", "v3:0:0:org.example.same;;", " ", "x".repeat(65537)))
   test("unbound or invalid selection pauses and preserves raw: "+raw.substring(0,Math.min(55,raw.length())),()->{
    AppConfig.values.put("targets",raw);var r=reset();
    check(r.reviewRequired&&!r.success&&!r.settingsReset,"unconfirmed selection accepted");
    check(AppConfig.values.get("targets").equals(raw)&&AppConfig.values.get("label").equals("keep"),"original data erased");
    check(AppConfig.values.get("master").equals("0")&&AppConfig.values.get("auto").equals("0"),"automation not paused");
    check(RootHideManager.clears==0&&Context.clears==0&&!Fixture.trace.contains("root"),"review required reached Root or clear");
   });
  test("Root failure pauses then retains selection and settings",()->{
   RootHideManager.state=RootHideManager.RootState.DENIED;var r=reset();
   check(!r.success&&!r.settingsReset,"Root denial accepted");retained();
   check(Fixture.trace.subList(0,3).equals(List.of("pause","sync","root")),"Root checked before pause");});
  for(var state:List.of(RootHideManager.State.HIDDEN,RootHideManager.State.ERROR))for(int user:List.of(0,12))
   test(state+" in user "+user+" requires review and retains all targets",()->{
    RootHideManager.states.put(new RootHideManager.Target(user,"org.example.same"),state);var r=reset();
    check(r.reviewRequired&&!r.success&&!r.settingsReset,"review status missing");retained();});
  for(var state:List.of(RootHideManager.State.VISIBLE,RootHideManager.State.MISSING))
   test(state+" allows safe selection clear and reset",()->{
    for(var t:new RootHideManager(new Context()).targets())RootHideManager.states.put(t,state);
    var r=reset();check(r.success&&r.settingsReset&&!r.reviewRequired,"safe reset denied");
    check(AppConfig.values.equals(ConfigSchema.defaults())&&RootHideManager.clears==1,"defaults not applied");
    check(Fixture.trace.indexOf("query:12")<Fixture.trace.indexOf("clear-selection"),"not all users queried");
    check(!r.message.contains("已恢复显示"),"unproven restore claim");});
  test("selection archive/save failure retains other settings",()->{
   RootHideManager.failClear=true;var r=reset();check(!r.success,"selection save failure accepted");
   check(AppConfig.values.get("targets").contains("12:")&&AppConfig.values.get("label").equals("keep"),"config cleared after save failure");});
  test("pause failure stops before Root and target checks",()->{
   AppConfig.failPause=true;var r=reset();check(!r.success&&!Fixture.trace.contains("root")&&RootHideManager.clears==0,"pause failure continued");});
  test("battery restoration still precedes defaults",()->{
   AppConfig.values.put("targets","");AppConfig.values.put("battery","1");var r=reset();
   check(r.success&&BatteryLifeControl.calls==1,"battery flow lost");
   check(Fixture.trace.indexOf("battery")<Fixture.trace.indexOf("defaults"),"battery restored after reset");});
  test("battery failure keeps nonselection settings",()->{
   AppConfig.values.put("targets","");AppConfig.values.put("battery","1");BatteryLifeControl.ok=false;
   check(!reset().success&&AppConfig.values.get("battery").equals("1")&&AppConfig.values.get("label").equals("keep"),"battery failure erased settings");});
  System.out.println("RESET RESULT "+passed+" passed, "+failed+" failed");if(failed>0)System.exit(1);
 }
}
'''


def main():
    with tempfile.TemporaryDirectory(prefix='lsa-reset-review-') as temporary:
        folder = Path(temporary)
        sources = []
        for relative, content in {**STUBS, 'ls/augment/com/TestHideRecoveryReset.java': TEST}.items():
            path = folder / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding='utf-8')
            sources.append(str(path))
        classes = folder / 'classes'
        subprocess.run(['javac', '--release', '17', '-encoding', 'UTF-8', '-d', str(classes),
                        str(JAVA / 'ConfigResetController.java'), str(JAVA / 'HideTargetCodec.java'),
                        str(JAVA / 'RootShell.java'), *sources], check=True, timeout=30)
        subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.TestHideRecoveryReset'], check=True, timeout=30)


if __name__ == '__main__':
    main()
