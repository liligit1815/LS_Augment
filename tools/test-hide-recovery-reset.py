"""Execute the production total-reset coordinator with offline Android/phase doubles.

The real ConfigSchema, EnhancementCatalog, ResetWriteFence and HiddenEntrySession are compiled too.
No ADB, Root process, PackageManager mutation, real credentials, or device data is used.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
STUBS = {
    'android/content/Context.java': '''package android.content;
public class Context {public Context getApplicationContext(){return this;} public String getPackageName(){return "ls.augment.com";}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}}''',
    'android/content/ComponentName.java': '''package android.content;
public class ComponentName {public final String name;public ComponentName(Context c,String s){name=s;}
public ComponentName(Context c,Class<?> type){name=type.getSimpleName();}}''',
    'android/content/pm/PackageManager.java': '''package android.content.pm;
public class PackageManager {public static final int COMPONENT_ENABLED_STATE_DEFAULT=0,DONT_KILL_APP=1;
 public void setComponentEnabledSetting(android.content.ComponentName c,int s,int f){ls.augment.com.TestHideRecoveryReset.event("launcher-alias");}}''',
    'android/service/quicksettings/TileService.java': '''package android.service.quicksettings;
public class TileService {public static void requestListeningState(android.content.Context c,android.content.ComponentName n){ls.augment.com.TestHideRecoveryReset.event("tile:"+n.name);}}''',
    'android/os/Bundle.java': '''package android.os;
public class Bundle {private final java.util.Map<String,Object> values=new java.util.HashMap<>();
 public void putBoolean(String key,boolean value){values.put(key,value);}public boolean getBoolean(String key){return Boolean.TRUE.equals(values.get(key));}
 public void putString(String key,String value){values.put(key,value);}public String getString(String key,String fallback){Object value=values.get(key);return value instanceof String?(String)value:fallback;}}''',
}
TEST = r'''
package ls.augment.com;
import android.content.Context;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;
class Fixture {
 static final List<String> trace=new ArrayList<>();
 static String fail="",throwsAt="";static boolean review,history,grid,page,workbenchPending;
 static int hideClears,healthCalls,storageCalls;static Map<String,String> paused;
 static final String TARGETS="v3:0:0:org.example.same;v3:12:44:org.example.same",ACCOUNT="a".repeat(64),TOKEN="fixture-token";
 static void event(String stage){
  if(stage.equals("workbench")||stage.equals("boot-cancel")||stage.equals("rapid-capture")){
   if(RootHideManager.ACTION_LOCK.isHeldByCurrentThread())throw new AssertionError("drain waits must not hold action lock: "+stage);
  }else if(!stage.startsWith("audit:")&&!RootHideManager.ACTION_LOCK.isHeldByCurrentThread())throw new AssertionError("missing lock: "+stage);
  if(ResetWriteFence.blocked())throw new AssertionError("reset owner incorrectly blocked");trace.add(stage);
  if(stage.equals(throwsAt))throw new IllegalStateException("injected "+stage);
 }
 static boolean phase(String stage){event(stage);return !stage.equals(fail);}
 static void reset(){trace.clear();fail=throwsAt="";review=history=grid=page=workbenchPending=false;hideClears=healthCalls=storageCalls=0;paused=null;
  HiddenEntrySession.lock();
  AppConfig.values=new LinkedHashMap<>(ConfigSchema.defaults());
  for(String key:TestHideRecoveryReset.expectedBooleans())AppConfig.values.put(key,"1");
  AppConfig.values.put(ConfigSchema.HIDE_TARGETS,TARGETS);AppConfig.values.put(ConfigSchema.HEALTH_ACCOUNT,ACCOUNT);
  AppConfig.values.put(ConfigSchema.HEALTH_SINCE,"175000000000");AppConfig.values.put(ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN,TOKEN);
  AppConfig.values.put(ConfigSchema.FREEFORM_GAME_APPS,"org.example.game");
  AppConfig.values.put(ConfigSchema.FREEFORM_EXCLUDED_APPS,"org.example.excluded");
  AppConfig.values.put(ShoulderQuickSwitchPolicy.KEY,"TQ1;fixture-entry");
  AppConfig.values.put("retired_credential","fixture-retired-private-token");
 }
}
class AppConfig {
 static Map<String,String> values;final long epoch=ResetWriteFence.generation();AppConfig(Context c){}
 Map<String,String> snapshot(){return new LinkedHashMap<>(values);}
 SaveResult save(Map<String,String> update){
  if(ResetWriteFence.stale(epoch))return new SaveResult(false,"stale editor",false);
  if(!Fixture.phase("pause"))return new SaveResult(false,"pause failed",false);
  LinkedHashMap<String,String> normalized=new LinkedHashMap<>();
  for(var e:update.entrySet()){String v=ConfigSchema.normalize(e.getKey(),e.getValue());
   if(v==null)throw new AssertionError("invalid paused value: "+e.getKey());normalized.put(e.getKey(),v);}
  Fixture.paused=normalized;values.putAll(normalized);return new SaveResult(true,"paused",true);
 }
 SaveResult resetToDefaults(){if(ResetWriteFence.stale(epoch))throw new AssertionError("reset editor became stale");
  if(!Fixture.phase("defaults"))return new SaveResult(false,"defaults failed",false);
  values=new LinkedHashMap<>(ConfigSchema.defaults());return new SaveResult(true,"defaults",true);}
 static class SaveResult {final boolean success,runtimeSynced;final String message;
  SaveResult(boolean s,String m,boolean r){success=s;message=m;runtimeSynced=r;}}
}
class RootHideManager {
 static final ReentrantLock ACTION_LOCK=new ReentrantLock();
 static class OperationResult {final boolean success;final String message;OperationResult(boolean s,String m){success=s;message=m;}}
}
class HideResetController {
 HideResetController(Context c){}static class Result {final boolean success,reviewRequired;final String message;final int restoredCount=1,verifiedCount=2;
  Result(boolean s){success=s;reviewRequired=Fixture.review;message="visibility result";}}
 Result restoreRecorded(java.util.function.Consumer<String> progress){boolean ok=Fixture.phase("show");return new Result(ok);}
 RootHideManager.OperationResult clearVerified(Result r){if(!r.success)throw new AssertionError("failure receipt used");
  boolean ok=Fixture.phase("clear-hidden");if(ok)Fixture.hideClears++;return new RootHideManager.OperationResult(ok,"clear result");}
}
class ScreenAutomation {static void sync(Context c){Fixture.event(Fixture.trace.contains("defaults")?"automation-final":"automation-pause");}}
class BootJobService {static class ResetResult {final boolean success;final String message="boot cancel result";ResetResult(boolean s){success=s;}}
 static ResetResult cancelForReset(Context c){return new ResetResult(Fixture.phase("boot-cancel"));}}
class AtomicWorkbenchReset {static android.os.Bundle restore(Context c){
 if(!ResetWriteFence.owns())throw new AssertionError("workbench recovery has no reset ownership");
 android.os.Bundle result=new android.os.Bundle();result.putBoolean("success",Fixture.phase("workbench"));
 result.putBoolean("recovery_pending",Fixture.workbenchPending);result.putString("message","workbench recovery unconfirmed");return result;}}
class RapidCaptureReset {static class Result {final boolean success,reviewRequired;final String message="capture reset result";final int count=1;
 Result(boolean s){success=s;reviewRequired=Fixture.review;}}
 static Result stopAndAwait(Context c){return new Result(Fixture.phase("rapid-capture"));}}
class GameHelperResetCache {static class Result {final boolean success;final String message="game cache result";Result(boolean s){success=s;}}
 static Result clearAfterPause(Context c,boolean proof){if(!proof||!Fixture.trace.contains("remote-pause"))throw new AssertionError("game cache cleaned before published pause");
  return new Result(Fixture.phase("game-cache"));}}
class ModuleRuntimeReset {static class Result {final boolean success;final String message="notification reset result";Result(boolean s){success=s;}}
 static Result clearNotifications(Context c){return new Result(Fixture.phase("notifications"));}}
class FrameworkConfigSync {static RootShell.Result publishForReset(Context c,boolean replace){
 String stage=replace?"remote-final":"remote-pause";return new RootShell.Result(Fixture.phase(stage)?0:74,stage,false);}}
class ModuleSystemSettings {static class RestoreResult {final boolean success,reviewRequired;final boolean legacyDimHistoryUnknown=false;final String message="system result";
 RestoreResult(boolean s){success=s;reviewRequired=Fixture.review;}}static RestoreResult restore(Context c){return new RestoreResult(Fixture.phase("system"));}}
class BatteryLifeControl {static RootShell.Result restore(Context c){return new RootShell.Result(Fixture.phase("battery")?0:74,"battery result",false);}}
class ModuleRetiredRootStorage {static class Result {final boolean success;final String message="retired root result";Result(boolean s){success=s;}}
 static Result clearAfterBatteryRestore(RootShell.Result proof){if(proof==null||!proof.isSuccess())throw new AssertionError("invalid battery restore proof");
  return new Result(Fixture.phase("retired-root"));}}
class HealthResetController {static final String HISTORY_LIMITATION="fixture health historical limitation";
 static class Result {final boolean success,historyMayHaveBeenModified;final String message="health result";
  Result(boolean s){success=s;historyMayHaveBeenModified=Fixture.history;}}
 static Result clearModuleRecords(Context c,boolean synced){if(!synced)throw new AssertionError("unsynchronized health cleanup");
  Fixture.healthCalls++;return new Result(Fixture.phase("health"));}}
class ModuleExternalReset {static class Result {final boolean success,reviewRequired;final String message="external result";
 Result(boolean s){success=s;reviewRequired=Fixture.review;}}static Result restore(Context c){return new Result(Fixture.phase("external"));}}
class LauncherResetController {static class Result {final boolean success,pendingGridRestore,pageHistoryPresent;final String message="launcher result";
 Result(boolean s){success=s;pendingGridRestore=Fixture.grid;pageHistoryPresent=Fixture.page;}}
 static Result prepare(Context c){return new Result(Fixture.phase("launcher"));}}
class ModuleResetStorage {static void clear(Context c)throws java.io.IOException {Fixture.storageCalls++;Fixture.event("storage");
 if(Fixture.fail.equals("storage"))throw new java.io.IOException("storage failed");}}
class RecentsCardRadiusStore {static void onStorageReset(Context c){Fixture.event("recents-storage");}}
class AugmentTileService {} class ExtraDimTileService {}
class AuditLog {static void write(Context c,String event,String message){Fixture.event("audit:"+event);}}
public class TestHideRecoveryReset {
 static int tests,checks,failed;static final Context CONTEXT=new Context();
 public static void event(String e){Fixture.event(e);}
 static Set<String> expectedBooleans(){LinkedHashSet<String> keys=new LinkedHashSet<>();
  for(String key:ConfigSchema.booleanKeys())if(ConfigSchema.isRuntimeKey(key))keys.add(key);
  return keys;
 }
 static void check(boolean v,String m){checks++;if(!v)throw new AssertionError(m+"; trace="+Fixture.trace);}
 static void order(String a,String b){check(Fixture.trace.indexOf(a)>=0&&Fixture.trace.indexOf(a)<Fixture.trace.indexOf(b),a+" must precede "+b);}
 static void preserved(){check(Fixture.hideClears==0,"recovery records erased before restoration completed");
  check(Fixture.TARGETS.equals(AppConfig.values.get(ConfigSchema.HIDE_TARGETS)),"targets cleared on recovery failure");
  check(Fixture.ACCOUNT.equals(AppConfig.values.get(ConfigSchema.HEALTH_ACCOUNT)),"health binding erased on recovery failure");
  check(Fixture.TOKEN.equals(AppConfig.values.get(ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN)),"compatibility credential erased on recovery failure");
  check("fixture-retired-private-token".equals(AppConfig.values.get("retired_credential")),"retired data erased before recovery");
  check(!Fixture.trace.contains("defaults")&&Fixture.storageCalls==0,"local clear ran before recovery");}
 static ConfigResetController.Result run(){long before=ResetWriteFence.generation();var r=ConfigResetController.reset(CONTEXT);
  check(ResetWriteFence.generation()==before+2,"fence begin/end generation mismatch");
  check(!RootHideManager.ACTION_LOCK.isLocked(),"lock leaked");
  final boolean[] blocked={true};Thread t=new Thread(()->blocked[0]=ResetWriteFence.blocked());t.start();try{t.join();}catch(Exception e){throw new RuntimeException(e);}
  check(!blocked[0],"fence owner leaked");return r;}
 static void test(String name,Runnable body){Fixture.reset();try{body.run();tests++;System.out.println("PASS total reset: "+name);}
  catch(Throwable e){failed++;System.out.println("FAIL total reset: "+name+": "+e);}}
 public static void main(String[] args){
  for(String stage:List.of("workbench","boot-cancel","rapid-capture","pause","remote-pause","show","game-cache","system","battery","retired-root","health","external","launcher","clear-hidden"))
   test(stage+" failure preserves recovery records and health credentials",()->{Fixture.fail=stage;var r=run();
    check(!r.success&&!r.settingsReset&&!r.runtimeSynced,"failure reported completed");preserved();
    if(!stage.equals("workbench")&&!stage.equals("pause")&&!stage.equals("boot-cancel")&&!stage.equals("rapid-capture"))check("0".equals(AppConfig.values.get(ConfigSchema.HIDE_MASTER))&&"0".equals(AppConfig.values.get(ConfigSchema.AUTOMATION_ENABLED)),"automatic hiding not paused");});
  for(String stage:List.of("workbench","boot-cancel","rapid-capture","pause","remote-pause","show","game-cache","system","battery","retired-root","health","external","launcher","clear-hidden"))
   test(stage+" exception preserves recovery records and releases fence",()->{Fixture.throwsAt=stage;var r=run();check(!r.success&&!r.settingsReset,"exception reported completed");preserved();});
  test("workbench failure stops before boot cancellation, pause, or any reset write",()->{
   Map<String,String> before=new LinkedHashMap<>(AppConfig.values);Fixture.fail="workbench";var result=run();
   check(!result.success&&!result.settingsReset&&result.message.contains("workbench recovery unconfirmed"),"recovery failure receipt lost");
   check(AppConfig.values.equals(before),"configuration changed before workbench recovery");
   check(!Fixture.trace.contains("boot-cancel")&&!Fixture.trace.contains("rapid-capture")&&Fixture.healthCalls==0,"continued other recovery phases");preserved();});
  test("workbench success with pending recovery cannot authorize destructive reset",()->{
   Map<String,String> before=new LinkedHashMap<>(AppConfig.values);Fixture.workbenchPending=true;var result=run();
   check(!result.success&&!result.settingsReset&&!result.runtimeSynced,"pending restoration accepted as complete");
   check(AppConfig.values.equals(before)&&Fixture.paused==null&&Fixture.healthCalls==0,"pending workbench permitted reset writes");
   check(!Fixture.trace.contains("boot-cancel")&&!Fixture.trace.contains("recents-storage"),"continued after pending restoration");preserved();});
  test("default write failure retains private binding and reports incomplete",()->{Fixture.fail="defaults";var r=run();
   check(!r.success&&!r.settingsReset&&Fixture.hideClears==1,"defaults failure status");
   check(Fixture.ACCOUNT.equals(AppConfig.values.get(ConfigSchema.HEALTH_ACCOUNT))&&Fixture.TOKEN.equals(AppConfig.values.get(ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN)),"failed default write erased credentials");
   check(Fixture.storageCalls==0&&!Fixture.trace.contains("remote-final"),"continued after failed defaults");});
  for(String stage:List.of("storage","notifications","launcher-alias","automation-final","tile:AugmentTileService","tile:ExtraDimTileService","remote-final"))
   test(stage+" failure reports defaults committed but reset incomplete",()->{if(stage.equals("storage")||stage.equals("remote-final")||stage.equals("notifications"))Fixture.fail=stage;else Fixture.throwsAt=stage;
    var r=run();check(!r.success&&r.settingsReset&&!r.runtimeSynced,"partial completion status lost");
    check(AppConfig.values.equals(ConfigSchema.defaults())&&Fixture.hideClears==1,"default store not replaced");});
  test("notification cleanup exception reports defaults committed and releases fence",()->{Fixture.throwsAt="notifications";var r=run();
   check(!r.success&&r.settingsReset&&!r.runtimeSynced&&AppConfig.values.equals(ConfigSchema.defaults()),"notification exception status lost");});
  test("visibility review reaches coordinator",()->{Fixture.fail="show";Fixture.review=true;check(run().reviewRequired,"review reason lost");preserved();});
  test("system review reaches coordinator",()->{Fixture.fail="system";Fixture.review=true;check(run().reviewRequired,"review reason lost");preserved();});
  test("external ownership review reaches coordinator",()->{Fixture.fail="external";Fixture.review=true;check(run().reviewRequired,"review reason lost");preserved();});
  test("capture shutdown review reaches coordinator before action lock",()->{Fixture.fail="rapid-capture";Fixture.review=true;var r=run();check(r.reviewRequired&&!r.settingsReset,"capture review reason lost");preserved();});
  test("full success restores before clearing and removes all lists and binding",()->{var r=run();check(r.success&&r.settingsReset&&r.runtimeSynced&&!r.reviewRequired,"success status");
   for(String restoration:List.of("show","game-cache","system","battery","retired-root","health","external","launcher"))order(restoration,"clear-hidden");
   order("workbench","boot-cancel");order("workbench","defaults");order("boot-cancel","rapid-capture");order("rapid-capture","pause");order("show","game-cache");order("game-cache","system");order("storage","recents-storage");order("recents-storage","notifications");order("notifications","launcher-alias");
   order("battery","retired-root");order("retired-root","health");
   order("pause","automation-pause");order("automation-pause","remote-pause");order("remote-pause","show");order("clear-hidden","defaults");order("defaults","storage");order("storage","remote-final");
   check(AppConfig.values.equals(ConfigSchema.defaults()),"retired keys survived complete store replacement");
   for(String key:List.of(ConfigSchema.HIDE_TARGETS,ConfigSchema.HEALTH_ACCOUNT,ConfigSchema.HEALTH_PLAN,ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN,ConfigSchema.TGK_RAPID_FIRE_TEST_SESSION,ConfigSchema.FREEFORM_GAME_APPS,ConfigSchema.FREEFORM_EXCLUDED_APPS,ConfigSchema.LAUNCHER_OVERRIDES))
    check(AppConfig.values.get(key).isEmpty(),"sensitive/list key retained: "+key);
   check(ShoulderQuickSwitchPolicy.EMPTY.equals(AppConfig.values.get(ShoulderQuickSwitchPolicy.KEY)),"shoulder candidate list retained");
   check(!AppConfig.values.containsKey("retired_credential")&&Fixture.hideClears==1&&Fixture.storageCalls==1,"records or retired credential retained");});
  test("pause covers every runtime boolean without changing numerical recovery values",()->{Fixture.fail="remote-pause";run();
   Set<String> omitted=new LinkedHashSet<>();for(String key:expectedBooleans())if(!"0".equals(Fixture.paused.get(key)))omitted.add(key);
   check(omitted.isEmpty(),"unpaused runtime boolean keys "+omitted);
   check(!Fixture.paused.containsKey(ConfigSchema.HEALTH_MULTIPLIER)&&!Fixture.paused.containsKey(ConfigSchema.COMBO_SPEED_RATE)&&!Fixture.paused.containsKey(ConfigSchema.FAN_TARGET_RPM),"pause changed numerical restore parameters");
   check(!Fixture.paused.containsKey(ConfigSchema.HEALTH_ACCOUNT)&&!Fixture.paused.containsKey(ConfigSchema.HIDE_TARGETS),"pause erased credentials or target discovery");});
  test("historical health and launcher limitations are explicit",()->{Fixture.history=Fixture.grid=Fixture.page=true;var r=run();
   check(r.success&&r.message.contains(HealthResetController.HISTORY_LIMITATION)&&r.message.contains("原始桌面行列")&&r.message.contains("历史手动调整无法自动还原"),"historical limits hidden");
   check(r.message.contains("已显示 1 个隐藏应用")&&r.message.contains("2 条记录核验")&&r.message.contains("原停止状态无法追溯"),"SHOW counts or original-state limitation hidden");});
  test("progress callback exception still releases fence",()->{long before=ResetWriteFence.generation();var r=ConfigResetController.reset(CONTEXT,m->{throw new IllegalStateException("progress");});
   check(!r.success&&!r.settingsReset&&ResetWriteFence.generation()==before+2&&!RootHideManager.ACTION_LOCK.isLocked(),"progress exception leaked reset fence");preserved();});
  test("pre-reset editor cannot revive values after success",()->{AppConfig old=new AppConfig(CONTEXT);check(run().success,"setup");
   check(!old.save(Map.of(ConfigSchema.HEALTH_ACCOUNT,Fixture.ACCOUNT)).success&&AppConfig.values.equals(ConfigSchema.defaults()),"stale editor revived binding");});
  test("success clears the concealed entry unlock and unfinished seven-tap session",()->{
   for(int i=0;i<13;i++)HiddenEntrySession.recordSystemVersionTap(10000+i);
   check(HiddenEntrySession.isUnlocked(),"entry setup failed");check(run().success,"reset setup failed");
   check(!HiddenEntrySession.isUnlocked(),"old concealed entry remained unlocked");
   for(int i=0;i<6;i++)check(HiddenEntrySession.recordSystemVersionTap(10013+i)==HiddenEntrySession.TapResult.NONE,"old tap count unlocked entry early");
   check(HiddenEntrySession.recordSystemVersionTap(10019)==HiddenEntrySession.TapResult.OPENED,"fresh seven-tap unlock no longer works");});
  test("failed default write preserves the old in-memory entry session",()->{
   for(int i=0;i<13;i++)HiddenEntrySession.recordSystemVersionTap(10000+i);Fixture.fail="defaults";var r=run();
   check(!r.success&&!r.settingsReset&&HiddenEntrySession.isUnlocked(),"entry relocked before default commit");
   check(HiddenEntrySession.recordSystemVersionTap(10013)==HiddenEntrySession.TapResult.ALREADY_OPEN,"tap session cleared before default commit");});
  test("entry is relocked after default commit even if later storage cleanup fails",()->{
   for(int i=0;i<13;i++)HiddenEntrySession.recordSystemVersionTap(10000+i);Fixture.fail="storage";var r=run();
   check(!r.success&&r.settingsReset&&!HiddenEntrySession.isUnlocked(),"post-default failure retained old unlock");
   check(HiddenEntrySession.recordSystemVersionTap(10013)==HiddenEntrySession.TapResult.NONE,"post-default failure retained old tap cache");});
  test("concurrent writers are blocked by real ResetWriteFence",()->{ResetWriteFence.begin();long epoch=ResetWriteFence.generation();
   try{final boolean[] stale={false};Thread t=new Thread(()->{AppConfig other=new AppConfig(CONTEXT);stale[0]=!other.save(Map.of(ConfigSchema.HEALTH_ACCOUNT,Fixture.ACCOUNT)).success;});t.start();try{t.join();}catch(Exception e){throw new RuntimeException(e);}
    check(stale[0]&&ResetWriteFence.generation()==epoch,"concurrent writer was accepted");}
   finally{ResetWriteFence.end();}check(!ResetWriteFence.blocked(),"manual fence leaked");});
  System.out.println("TOTAL RESET RESULT "+tests+" passed, "+failed+" failed, "+checks+" assertions");if(failed>0)System.exit(1);
 }
}
'''


def main():
    with tempfile.TemporaryDirectory(prefix='lsa-total-reset-fixture-') as temporary:
        folder = Path(temporary)
        sources = []
        for relative, text in {**STUBS, 'ls/augment/com/TestHideRecoveryReset.java': TEST}.items():
            path = folder / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding='utf-8')
            sources.append(str(path))
        classes = folder / 'classes'
        production = ['ConfigResetController.java', 'ConfigSchema.java', 'EnhancementCatalog.java',
                      'ResetWriteFence.java', 'RootShell.java', 'HiddenEntrySession.java']
        subprocess.run(['javac', '--release', '17', '-encoding', 'UTF-8', '-sourcepath',
                        str(JAVA.parents[2]) + os.pathsep + str(folder), '-d', str(classes),
                        *[str(JAVA / name) for name in production], *sources], check=True, timeout=45)
        subprocess.run(['java', '-Dfile.encoding=UTF-8', '-cp', str(classes), 'ls.augment.com.TestHideRecoveryReset'], check=True, timeout=30)


if __name__ == '__main__':
    main()
