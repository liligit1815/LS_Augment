"""Run the real multi-window coordinator and production migration helpers with offline boundaries.

No device, ROOT process, display service, app task, or personal file is accessed.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
JDK = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
JAVAC = str(JDK / "javac.exe") if (JDK / "javac.exe").exists() else "javac"
JAVA = str(JDK / "java.exe") if (JDK / "java.exe").exists() else "java"
ENV = dict(os.environ)
if JDK.exists():
    ENV["PATH"] = str(JDK) + os.pathsep + ENV.get("PATH", "")

BUNDLE = r'''package android.os;import java.util.*;public class Bundle {
 private final Map<String,Object> data=new HashMap<>();public Bundle(){}public Bundle(Bundle other){data.putAll(other.data);}
 public boolean containsKey(String k){return data.containsKey(k);}public void remove(String k){data.remove(k);}
 public void putBoolean(String k,boolean v){data.put(k,v);}public boolean getBoolean(String k){return getBoolean(k,false);}public boolean getBoolean(String k,boolean d){return data.get(k) instanceof Boolean?(Boolean)data.get(k):d;}
 public void putInt(String k,int v){data.put(k,v);}public int getInt(String k){return getInt(k,0);}public int getInt(String k,int d){return data.get(k) instanceof Integer?(Integer)data.get(k):d;}
 public void putLong(String k,long v){data.put(k,v);}public long getLong(String k){return getLong(k,0L);}public long getLong(String k,long d){return data.get(k) instanceof Long?(Long)data.get(k):d;}
 public void putString(String k,String v){data.put(k,v);}public String getString(String k){return getString(k,null);}public String getString(String k,String d){return data.get(k) instanceof String?(String)data.get(k):d;}
 public void putBundle(String k,Bundle b){data.put(k,b);}public Bundle getBundle(String k){return (Bundle)data.get(k);}
 public void putStringArrayList(String k,ArrayList<String> v){data.put(k,v);}@SuppressWarnings("unchecked")public ArrayList<String>getStringArrayList(String k){return (ArrayList<String>)data.get(k);}
 public <T>void putParcelableArrayList(String k,ArrayList<T> v){data.put(k,v);}@SuppressWarnings("unchecked")public <T>ArrayList<T>getParcelableArrayList(String k){return (ArrayList<T>)data.get(k);}
}'''
PLATFORM = r'''package ls.augment.com;import android.os.*;import android.view.*;
final class AtomicWorkbenchPlatform {
 static int globalFocus=-1;static final java.util.List<String> focusEvents=new java.util.ArrayList<>();final int id;int displayId,taskId,clicks,opens,taskOpens,attaches,cancels,partialCloses,fullCloses,focusCalls,homeOpens,homeRestores,shares,suspends,resumes;
 boolean live,pending,failPartial,failFull,failCancel,backendFailure,invalidInput,startupFailure,nativeHome,homeOnly,failHomeRestore,physicalReturned,failDefault,failOpen,failHome,closePendingSuccess,suspended,failSuspend,failResume,failFocus,failShare;
 Bundle lastClose,lastHomeRestore;String component="",state="closed";
 AtomicWorkbenchPlatform(android.content.Context c,int uid,int user,Handler h,int id){this.id=id;displayId=100+id;taskId=1000+id;}
 Bundle open(Surface s,int w,int h,int d,String component){opens++;this.component=component;live=true;pending=failOpen;state=failOpen?"recovering":"active";return status();}
 Bundle openTask(Surface s,int w,int h,int d,String component,int task){taskOpens++;this.component=component;taskId=task;live=true;state="active";return status();}
 Bundle attachSurface(Surface s,int w,int h,int d,String component,int task){attaches++;Bundle result=status();if(!this.component.equals(component)){result.putBoolean("success",false);return result;}return result;}
 Bundle status(){Bundle b=new Bundle();b.putInt("window_id",id);b.putBoolean("success",!startupFailure&&!state.equals("recovering"));b.putBoolean("recovery_pending",pending);b.putString("state",state);b.putString("message",state);b.putInt("display_id",live||pending?displayId:-1);b.putInt("task_count",live||pending?1:0);b.putInt("task_id",live||pending?taskId:-1);b.putInt("ime_policy",live?1:-1);b.putBoolean("native_home",nativeHome);b.putBoolean("home_only",homeOnly);b.putInt("home_task_id",nativeHome?taskId+100:-1);b.putString("home_component",nativeHome?"launcher/.Home":"");b.putString("top_component",component);b.putStringArrayList("running_packages",new java.util.ArrayList<>(homeOnly||component.isEmpty()?java.util.List.of():java.util.List.of(component.split("/",2)[0])));return b;}
 Bundle openInEmptyHome(Surface surface,int w,int h,int d,String target,int original){nativeHome=homeOnly=false;return original>0?openTask(surface,w,h,d,target,original):open(surface,w,h,d,target);}
 boolean hasRecoveryPending(){return pending;}boolean hasLiveDisplay(){return live;}boolean hasStartupFailure(){return startupFailure;}
 boolean hasTaskRecoveryPending(){return pending;}
 Bundle allocateTaskDisplay(Surface s,int w,int h,int d,long g,String a){throw new AssertionError("task allocation outside legacy coordinator scope");}
 Bundle updateOutput(Bundle identity,long generation,Surface surface){throw new AssertionError("output outside legacy coordinator scope");}
 Bundle parkOutput(long generation){throw new AssertionError("park output outside legacy coordinator scope");}
 Bundle parkInput(){throw new AssertionError("park input outside legacy coordinator scope");}
 Bundle outputStatus(){Bundle b=status();b.putBoolean("output_attached",live);b.putBoolean("output_attached_known",true);b.putBoolean("task_recovery_pending",pending);return b;}
 boolean primaryInputFocusConfirmed(){throw new AssertionError("input proof outside legacy coordinator scope");}
 Bundle ensureNativeHomeBehindApp(){return status();}Bundle ensureNativeHomeBehindApp(AtomicWorkbenchPlatform source){if(source!=null){source.nativeHome=false;nativeHome=true;}return status();}boolean isHomeOnly(){return homeOnly;}boolean hasNativeHome(){return nativeHome;}
 Bundle restoreNativeHome(){homeRestores++;if(failHomeRestore){pending=true;state="recovering";}else nativeHome=false;return lastHomeRestore=status();}
 boolean physicalHomeReturned(){return physicalReturned;}boolean primaryHomeIsForeground(){return false;}Bundle focusPrimaryHome(){return focusDefault();}
 Bundle showNativeHome(Surface s,int w,int h,int d){return showNativeHome(s,w,h,d,null);}Bundle showNativeHome(Surface s,int w,int h,int d,AtomicWorkbenchPlatform source){if(source!=null)source.nativeHome=false;homeOpens++;nativeHome=homeOnly=true;Bundle b=open(s,w,h,d,"");try{restoreInputFocus();}catch(Exception e){b.putBoolean("success",false);}if(failHome){pending=true;state="recovering";b=status();}return b;}Bundle focusAppWindow(String c){return focusWindow();}
 Bundle share(android.content.Intent share,String pkg){shares++;Bundle b=status();try{restoreInputFocus();}catch(Exception e){b.putBoolean("success",false);}if(failShare)b.putBoolean("success",false);return b;}
 boolean readyForInput(){return live&&state.equals("active")&&!suspended;}boolean hasInputFocus(){return globalFocus==id&&!suspended;}
 void cancelInput()throws Exception{cancels++;focusEvents.add("cancel:"+id);if(failCancel)throw new Exception("cancel unavailable");}
 void suspendInputFocus()throws Exception{suspends++;focusEvents.add("suspend:"+id);if(failSuspend)throw new Exception("guard unavailable");suspended=true;}
 void restoreInputFocus()throws Exception{if(suspended){resumes++;focusEvents.add("resume:"+id);if(failResume)throw new Exception("guard removal unavailable");suspended=false;}}
 Bundle focusWindow(){focusCalls++;Bundle b=status();try{restoreInputFocus();}catch(Exception e){b.putBoolean("success",false);return b;}if(!readyForInput()||failFocus)b.putBoolean("success",false);else{focusEvents.add("focus:"+id);globalFocus=id;}return b;}
 Bundle focusDefault(){globalFocus=-1;Bundle b=failDefault?status():new Bundle();b.putBoolean("success",!failDefault);return b;}
 boolean inject(MotionEvent e){if(invalidInput)return false;if(backendFailure)return false;clicks++;return true;}
 boolean key(KeyEvent e){return !backendFailure;}boolean inputBackendFailed(){return backendFailure;}
 Bundle closeWindow(){partialCloses++;return closeResult(failPartial);}
 Bundle close(){fullCloses++;return closeResult(failFull);}
 private Bundle closeResult(boolean fail){suspended=false;if(fail||closePendingSuccess){pending=true;state="recovering";Bundle b=status();b.putBoolean("success",closePendingSuccess);return lastClose=b;}live=false;pending=nativeHome=homeOnly=false;state="closed";return lastClose=status();}
}'''
ENGINE_TEST = r'''package ls.augment.com;import android.os.*;import android.view.*;import java.util.*;
public final class TestAtomicWorkbenchEngine {
 static int tests,checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static final class Fixture {final AtomicWorkbenchPlatform[] p=new AtomicWorkbenchPlatform[5];final AtomicWorkbenchEngine engine;
 Fixture(){AtomicWorkbenchPlatform.globalFocus=-1;AtomicWorkbenchPlatform.focusEvents.clear();engine=new AtomicWorkbenchEngine(id->{AtomicWorkbenchPlatform platform=new AtomicWorkbenchPlatform(null,10055,0,null,id);p[id+1]=platform;return platform;});}
 AtomicWorkbenchPlatform slot(int id){return p[id+1];}void open(int id){check(engine.openWindow(id,new Surface(),1080,2400,420,"app"+id+"/.Main").getBoolean("success"),"window did not open");}
 void failedHistory(int id,boolean home){AtomicWorkbenchPlatform slot=slot(id);slot.pending=slot.failFull=true;slot.nativeHome=slot.homeOnly=home;slot.state="recovering";}
 Bundle slotState(int id){for(Bundle state:engine.status().<Bundle>getParcelableArrayList("windows"))if(state.getInt("window_id")==id)return state;throw new AssertionError("missing fixed slot");}}
 static void cleanBlocked(Bundle result,int requested,int owner){check(!result.getBoolean("success")&&result.getInt("window_id")==requested,"failed operation has wrong target");
  check(result.getBoolean("cleanup_pending")&&result.getBoolean("no_session")&&!result.getBoolean("recovery_pending"),"historical cleanup represented as current-session recovery");
  check("closed".equals(result.getString("state"))&&result.getInt("display_id",-1)==-1&&result.getInt("task_id",-1)==-1&&result.getInt("home_task_id",-1)==-1&&result.getInt("task_count")==0,"historical task/display became a new target state");
  check(!result.getBoolean("native_home")&&!result.getBoolean("home_only")&&result.getString("home_component","").isEmpty()&&result.getString("top_component","").isEmpty()&&result.getStringArrayList("running_packages")==null,"historical HOME/app identity leaked");
  Bundle detail=result.getBundle("cleanup_detail");check(detail!=null&&detail.getInt("window_id")==owner,"cleanup evidence lost its true owner");}
 static void test(String name,Runnable test){test.run();tests++;System.out.println("PASS multi-window engine: "+name);}
 public static void main(String[] args){
  test("content editing cancels an active touch without changing task or input roles",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);f.engine.inject(0,new MotionEvent(0));int cancelled=f.slot(0).cancels;long revision=f.engine.inputRevision();
   Bundle result=f.engine.cancelActiveInput();check(result.getBoolean("success")&&f.slot(0).cancels==cancelled+1,"editing skipped actual stream cancellation");
   check(f.engine.activeInputWindow()==0&&f.slot(0).live&&f.slot(1).live&&f.slot(0).fullCloses==0&&f.engine.inputRevision()>revision,"cancellation changed task roles or kept old lease current");});
  test("failed stream cancellation keeps tasks and explicitly blocks editing",()->{Fixture f=new Fixture();f.open(0);f.engine.focusWindow(0);f.slot(0).failCancel=true;
   Bundle result=f.engine.cancelActiveInput();check(!result.getBoolean("success")&&result.getBoolean("input_failure"),"failed cancellation admitted editing");
   check(f.engine.activeInputWindow()==0&&f.slot(0).live&&f.slot(0).fullCloses==0,"failed cancellation falsely cleaned original task");});
  test("host Dialog input preserves native HOME and both display owners",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.slot(0).nativeHome=true;f.engine.focusWindow(0);long before=f.engine.inputRevision();
   check(f.engine.focusInputOnly(-1).getBoolean("success"),"host input rejected");
   check(f.slot(0).nativeHome&&f.slot(0).homeRestores==0&&f.slot(0).live&&f.slot(1).live,"Dialog moved HOME or closed a task");
   check(f.engine.activeInputWindow()==-1&&f.slot(0).suspended&&f.engine.inputRevision()>before,"host switch did not suspend editor or invalidate old lease");});
  test("fast Dialog open-close still performs an acknowledged editor loss-gain cycle",()->{Fixture f=new Fixture();f.open(0);f.engine.focusWindow(0);int losses=f.slot(0).suspends,gains=f.slot(0).resumes;
   check(f.engine.focusInputOnly(-1).getBoolean("success")&&f.engine.focusInputOnly(0).getBoolean("success"),"fast host cycle failed");
   check(f.slot(0).suspends==losses+1&&f.slot(0).resumes==gains+1&&!f.slot(0).suspended&&f.engine.activeInputWindow()==0,"fast open-close collapsed to an unchanged slot focus");});
  test("new accepted input invalidates old leases while stale packets and status do not",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);long before=f.engine.inputRevision();
   f.engine.windowState(0);f.engine.status();f.engine.inject(1,new MotionEvent(0));f.engine.key(1,new KeyEvent());
   check(f.engine.inputRevision()==before,"observation or inactive packet changed ownership");
   f.engine.inject(0,new MotionEvent(0));check(f.engine.inputRevision()>before,"new touch kept old lease current");before=f.engine.inputRevision();
   f.engine.key(0,new KeyEvent());check(f.engine.inputRevision()>before,"new keyboard operation kept old lease current");before=f.engine.inputRevision();
   f.engine.closeWindow(1);check(f.engine.inputRevision()>before,"window close kept old lease current");});
  test("failed host input keeps the prior editor owner and records the attempted newer action",()->{Fixture f=new Fixture();f.open(0);f.engine.focusWindow(0);f.slot(-1).failDefault=true;long before=f.engine.inputRevision();
   Bundle result=f.engine.focusInputOnly(-1);check(!result.getBoolean("success")&&f.engine.activeInputWindow()==0&&!f.slot(0).suspended,"failed host input abandoned prior editor");
   check(f.engine.inputRevision()>before,"failed explicit action allowed a stale restore to overwrite it");});
  test("sharing to a side cancels previous input and rejects late packets from former main",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);int clicks=f.slot(0).clicks;
   Bundle shared=f.engine.shareWindow(1,new android.content.Intent(),"app1");
   check(shared.getBoolean("success")&&f.slot(1).shares==1&&f.slot(0).cancels==1,"share skipped target or old input cancellation");
   check(f.engine.inject(0,new MotionEvent(2))&&f.slot(0).clicks==clicks,"old main input continued after opening side share receiver");
   check(!f.engine.shareWindow(2,new android.content.Intent(),"app2").getBoolean("success")&&f.slot(2).shares==0,"closed share target invoked backend");});
  test("input cancellation failure prevents opening a share receiver",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);f.slot(0).failCancel=true;
   Bundle failed=f.engine.shareWindow(1,new android.content.Intent(),"app1");check(!failed.getBoolean("success")&&failed.getBoolean("input_failure")&&f.slot(1).shares==0,"share changed focus after failed stream cancellation");});
  test("four independent VDs and app state survive repeated focus swaps",()->{Fixture f=new Fixture();Set<Integer> displays=new HashSet<>(),tasks=new HashSet<>();
   for(int id=0;id<4;id++){f.open(id);displays.add(f.slotState(id).getInt("display_id"));tasks.add(f.slotState(id).getInt("task_id"));}
   check(displays.size()==4&&tasks.size()==4,"VD/task identities collided");
   for(int round=0;round<5;round++)for(int id=3;id>=0;id--){check(f.engine.focusWindow(id).getBoolean("success"),"focus failed");check(f.engine.inject(id,new MotionEvent(MotionEvent.ACTION_DOWN)),"valid click rejected");}
   for(int id=0;id<4;id++)check(f.slot(id).opens==1&&f.slot(id).clicks==5&&f.slot(id).partialCloses==0&&f.slot(id).fullCloses==0,"focus recreated or closed an application");
  });
  test("surface recreation only attaches and retains task and display identity",()->{Fixture f=new Fixture();f.open(1);int display=f.slot(1).displayId,task=f.slot(1).taskId;
   check(f.engine.openWindow(1,new Surface(),1440,3000,480,"app1/.Main").getBoolean("success"),"reattach rejected");
   check(f.slot(1).opens==1&&f.slot(1).attaches==1&&f.slot(1).displayId==display&&f.slot(1).taskId==task,"surface change restarted app");});
  test("late inactive MOVE, UP and keys do not reach or close a former window",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);f.engine.inject(0,new MotionEvent(0));
   check(f.engine.focusWindow(1).getBoolean("success")&&f.slot(0).cancels==1,"old gesture not cancelled before switch");int clicks=f.slot(0).clicks;
   for(int action:new int[]{2,1,3})check(f.engine.inject(0,new MotionEvent(action)),"stale packet escalated to backend failure");
   check(f.engine.key(0,new KeyEvent())&&f.slot(0).clicks==clicks,"inactive input reached app");check(f.slot(0).live&&f.slot(1).live&&f.slot(0).fullCloses==0,"inactive packet closed workspaces");});
  test("invalid packet is discarded but genuine input backend failure is reported",()->{Fixture f=new Fixture();f.open(0);f.engine.focusWindow(0);f.slot(0).invalidInput=true;
   check(f.engine.inject(0,new MotionEvent(0)),"invalid packet requested global recovery");f.slot(0).invalidInput=false;f.slot(0).backendFailure=true;
   check(!f.engine.inject(0,new MotionEvent(0)),"dead input service was accepted");});
  test("partial restore failure retains that slot and leaves other applications intact",()->{Fixture f=new Fixture();for(int id=0;id<4;id++)f.open(id);f.engine.focusWindow(2);f.slot(2).failPartial=true;
   Bundle failed=f.engine.closeWindow(2);check(!failed.getBoolean("success")&&failed.getBoolean("recovery_pending"),"partial failure acknowledged complete");
   for(int id:new int[]{0,1,3})check(f.slot(id).live&&f.slot(id).partialCloses==0&&f.slot(id).fullCloses==0,"unrelated window lost during partial failure");
   check(f.slotState(2).getInt("display_id")==102&&f.slotState(2).getString("state").equals("recovering"),"failed window responsibility disappeared");
   check(f.engine.focusWindow(1).getBoolean("success"),"unaffected window cannot be used");f.slot(2).failPartial=false;f.engine.retryWindowRecovery();
   check(!f.slot(2).live&&!f.slot(2).pending&&f.slot(1).live,"retry did not restore only failed slot");});
  test("full exit attempts all restores and cannot succeed while any journal remains",()->{Fixture f=new Fixture();for(int id=0;id<4;id++)f.open(id);f.slot(1).failFull=true;
   Bundle failed=f.engine.close();check(!failed.getBoolean("success")&&failed.getBoolean("recovery_pending"),"full exit ignored pending task");
   for(int id=0;id<4;id++)check(f.slot(id).fullCloses==1,"one failed window skipped later restores");check(f.slot(1).live,"failed task owner discarded");
   f.slot(1).failFull=false;check(f.engine.close().getBoolean("success")&&!f.engine.hasRecoveryPending(),"full restore retry not confirmed");});
  test("missing optional background migration does not block full exit",()->{Fixture f=new Fixture();f.open(0);f.slot(0).failPartial=true;
   check(!f.engine.closeWindow(0).getBoolean("success"),"partial failure not surfaced");check(f.engine.close().getBoolean("success")&&!f.slot(0).live,"full exit incorrectly required partial-close support");});
  test("legacy recovery blocks new launch until its original responsibility is restored",()->{Fixture f=new Fixture();f.slot(-1).pending=true;f.slot(-1).state="recovering";f.slot(-1).failFull=true;
   check(!f.engine.openWindow(0,new Surface(),1080,2400,420,"app0/.Main").getBoolean("success")&&f.slot(0).opens==0,"legacy journal bypassed by a new slot");
   check(!f.engine.close().getBoolean("success")&&f.slot(-1).pending,"legacy unresolved journal discarded");f.slot(-1).failFull=false;
   check(f.engine.openWindow(0,new Surface(),1080,2400,420,"app0/.Main").getBoolean("success"),"recovered legacy journal prevented fresh launch");});
  test("original-task takeover has no fresh-launch fallback",()->{Fixture f=new Fixture();Bundle state=f.engine.openTaskWindow(3,new Surface(),1080,2400,420,"source/.Main",987);
   check(state.getBoolean("success")&&f.slot(3).taskId==987&&f.slot(3).taskOpens==1&&f.slot(3).opens==0,"original task replaced with launcher start");});
  test("desktop focus cancels current input without destroying any application",()->{Fixture f=new Fixture();f.open(0);f.engine.focusWindow(0);
   check(f.engine.focusWindow(-1).getBoolean("success"),"host desktop focus unavailable");check(f.slot(0).cancels==1&&f.slot(0).live&&f.slot(0).fullCloses==0,"desktop switch closed task");
   check(f.engine.status().getInt("focused_window_id")==-1&&f.engine.inject(0,new MotionEvent(2)),"desktop focus still forwards old motion");});
  test("cancel backend failure is explicit before another app receives focus",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);f.slot(0).failCancel=true;
   Bundle result=f.engine.focusWindow(1);check(!result.getBoolean("success")&&result.getBoolean("input_failure")&&f.slot(1).focusCalls==0,"unsafe focus change after cancel failure");});
  test("actual promotion demotes once and restores the former editor before focusing it",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);AtomicWorkbenchPlatform.focusEvents.clear();
   check(f.engine.focusWindow(1).getBoolean("success"),"promotion failed");check(AtomicWorkbenchPlatform.focusEvents.equals(List.of("cancel:0","suspend:0","focus:1")),"old input was not lost before new focus: "+AtomicWorkbenchPlatform.focusEvents);
   check(f.slot(0).suspended&&!f.slot(1).suspended,"wrong guard retained");AtomicWorkbenchPlatform.focusEvents.clear();check(f.engine.focusAppWindow(0,"app0/.Main").getBoolean("success"),"app promotion failed");
   check(AtomicWorkbenchPlatform.focusEvents.equals(List.of("cancel:1","suspend:1","resume:0","focus:0")),"old editor did not get loss/gain cycle: "+AtomicWorkbenchPlatform.focusEvents);
   check(f.slot(0).opens==1&&f.slot(1).opens==1&&f.slot(0).displayId==100&&f.slot(1).displayId==101,"promotion changed task/display lifetime");});
  test("same active focus and repeated DOWN do not pulse the guard",()->{Fixture f=new Fixture();f.open(0);f.engine.focusWindow(0);int cancels=f.slot(0).cancels;
   for(int i=0;i<5;i++){check(f.engine.focusWindow(0).getBoolean("success"),"same focus failed");check(f.engine.inject(0,new MotionEvent(0)),"same DOWN failed");}
   check(f.slot(0).suspends==0&&f.slot(0).resumes==0&&f.slot(0).cancels==cancels,"per-DOWN or same-slot guard pulse");});
  test("guard acknowledgement failure restores old focus without opening target",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);f.slot(0).failSuspend=true;
   Bundle result=f.engine.focusWindow(1);check(!result.getBoolean("success")&&result.getBoolean("input_focus_failure")&&!result.getBoolean("input_failure"),"guard failure misclassified as injection failure");
   check(f.slot(1).focusCalls==0&&f.engine.status().getInt("active_window_id")==0&&f.engine.status().getInt("focused_window_id")==0,"failed demotion lost previous focus");
   check(f.slot(0).live&&f.slot(1).live&&f.slot(0).fullCloses==0&&f.slot(1).fullCloses==0,"guard failure destroyed recovery responsibility");});
  test("failed target promotion is redemoted while the previous guard is resumed",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);f.slot(1).failFocus=true;
   Bundle result=f.engine.focusWindow(1);check(!result.getBoolean("success")&&!result.getBoolean("input_focus_restore_pending"),"successful rollback reported pending");
   check(f.slot(1).suspended&&!f.slot(0).suspended&&f.slot(0).resumes==1&&f.engine.status().getInt("active_window_id")==0,"failed candidate stayed foreground or old guard retained");});
  test("failed guard removal keeps explicit focus pending and all task owners",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);f.slot(1).failFocus=true;f.slot(0).failResume=true;
   Bundle result=f.engine.focusWindow(1);check(!result.getBoolean("success")&&result.getBoolean("input_focus_restore_pending")&&f.engine.status().getInt("focused_window_id")==-2,"unacknowledged removal admitted input");
   check(f.slot(0).live&&f.slot(1).live&&f.slot(0).fullCloses==0,"rollback failure discarded task owner");int clicks=f.slot(0).clicks;check(f.engine.inject(0,new MotionEvent(0))&&f.slot(0).clicks==clicks,"suspended old editor accepted DOWN");});
  test("failed physical host promotion restores old app and its guard",()->{Fixture f=new Fixture();f.open(0);f.engine.focusWindow(0);f.slot(-1).failDefault=true;Bundle result=f.engine.focusWindow(-1);
   check(!result.getBoolean("success")&&f.engine.status().getInt("active_window_id")==0&&f.engine.status().getInt("focused_window_id")==0&&!f.slot(0).suspended,"failed host switch abandoned old editor");});
  test("HOME guard failure releases the unconsumed incoming Surface",()->{Fixture f=new Fixture();f.open(0);f.engine.focusWindow(0);f.slot(0).failSuspend=true;Surface surface=new Surface();Bundle result=f.engine.showNativeHome(1,surface,1080,2400,420);
   check(!result.getBoolean("success")&&surface.released&&f.slot(1).homeOpens==0&&f.slot(0).live,"cancelled HOME admission leaked Surface or changed tasks");});
  test("failed share promotion redemotes target and restores the former active app",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.focusWindow(0);f.slot(1).failShare=true;Bundle result=f.engine.shareWindow(1,new android.content.Intent(),"app1");
   check(!result.getBoolean("success")&&f.slot(1).suspended&&!f.slot(0).suspended&&f.engine.status().getInt("focused_window_id")==0,"share failure lost editor rebind state");});
  test("HOME switches transfer directly and retain the old display without primary restore",()->{Fixture f=new Fixture();f.open(1);AtomicWorkbenchPlatform old=f.slot(1);old.nativeHome=old.homeOnly=old.failHomeRestore=true;
   Surface surface=new Surface();Bundle result=f.engine.showNativeHome(0,surface,1080,2400,420);
   check(result.getBoolean("success")&&!surface.released&&f.slot(0).homeOpens==1&&old.homeRestores==0,"direct transfer unnecessarily restored primary HOME");
   check(old.live&&old.fullCloses==0&&!old.nativeHome&&f.slot(0).nativeHome,"source display was destroyed or HOME duplicated");});
  test("old HOME cleanup blocks OPEN and original-task takeover with separate evidence",()->{for(boolean takeover:new boolean[]{false,true}){Fixture f=new Fixture();f.failedHistory(1,true);Surface surface=new Surface();
   Bundle result=takeover?f.engine.openTaskWindow(0,surface,1080,2400,420,"app0/.Main",77):f.engine.openWindow(0,surface,1080,2400,420,"app0/.Main");cleanBlocked(result,0,1);
   check(surface.released&&f.slot(0).opens==0&&f.slot(0).taskOpens==0&&f.slot(1).lastClose.getInt("window_id")==1,"old recovery triggered new launch or changed owner");}});
  test("legacy cleanup never becomes a new slot's session",()->{for(boolean home:new boolean[]{false,true}){Fixture f=new Fixture();f.failedHistory(-1,false);Surface surface=new Surface();
   Bundle result=home?f.engine.showNativeHome(2,surface,1080,2400,420):f.engine.openWindow(2,surface,1080,2400,420,"app2/.Main");cleanBlocked(result,2,-1);
   check(surface.released&&f.slot(2).opens==0&&f.slot(-1).pending,"legacy failure escaped its preflight barrier");}});
  test("same-slot historical app recovery blocks both OPEN and HOME before session creation",()->{for(boolean home:new boolean[]{false,true}){Fixture f=new Fixture();f.failedHistory(2,false);Surface surface=new Surface();
   Bundle result=home?f.engine.showNativeHome(2,surface,1080,2400,420):f.engine.openWindow(2,surface,1080,2400,420,"new/.Main");cleanBlocked(result,2,2);
   check(surface.released&&f.slot(2).opens==0&&f.slot(2).homeOpens==0&&f.slot(2).fullCloses==1&&f.slot(2).pending,"same-slot history was treated as the new HOME");}});
  test("successful flag cannot bypass a still-pending historical cleanup",()->{for(boolean home:new boolean[]{false,true}){Fixture f=new Fixture();f.failedHistory(2,false);f.slot(2).closePendingSuccess=true;
   Bundle result=home?f.engine.showNativeHome(2,new Surface(),1080,2400,420):f.engine.openWindow(2,new Surface(),1080,2400,420,"new/.Main");cleanBlocked(result,2,2);
   check(f.slot(2).opens==0,"pending cleanup incorrectly accepted as complete");}});
  test("app promotion transfers HOME without closing either app display",()->{for(boolean appFocus:new boolean[]{false,true}){Fixture f=new Fixture();f.open(0);f.open(1);f.slot(1).nativeHome=f.slot(1).failHomeRestore=true;
   Bundle result=appFocus?f.engine.focusAppWindow(0,"app0/.Main"):f.engine.focusWindow(0);
   check(result.getBoolean("success")&&result.getInt("window_id")==0&&result.getInt("display_id")==100&&result.getInt("task_id")==1000,"promotion changed target identity");
   check(f.slot(0).nativeHome&&!f.slot(1).nativeHome&&f.slot(1).homeRestores==0&&f.slot(1).fullCloses==0,"promotion routed through primary HOME or destroyed source");}});
  test("blocked surface attachment preserves its existing target instead of copying old HOME",()->{for(boolean home:new boolean[]{false,true}){Fixture f=new Fixture();f.open(0);f.failedHistory(1,true);Surface surface=new Surface();
   Bundle result=home?f.engine.showNativeHome(0,surface,1080,2400,420):f.engine.openWindow(0,surface,1080,2400,420,"app0/.Main");
   check(!result.getBoolean("success")&&result.getBoolean("cleanup_pending")&&!result.getBoolean("no_session")&&result.getInt("display_id")==100&&result.getInt("task_id")==1000,"blocked reattach lost the target's actual session");
   check(surface.released&&f.slot(0).attaches==0&&f.slot(0).opens==1&&f.slot(0).live&&result.getBundle("cleanup_detail").getInt("window_id")==1,"blocked reattach changed a running app");}});
  test("direct HOME transfer does not require refocusing the physical host",()->{Fixture f=new Fixture();f.open(1);f.slot(1).nativeHome=true;f.slot(-1).failDefault=true;
   Surface surface=new Surface();Bundle result=f.engine.showNativeHome(0,surface,1080,2400,420);
   check(result.getBoolean("success")&&f.slot(0).homeOpens==1&&f.slot(1).homeRestores==0,"transfer unnecessarily depended on physical host focus");});
  test("empty HOME replacement stays on the same display without physical host focus",()->{Fixture f=new Fixture();check(f.engine.showNativeHome(0,new Surface(),1080,2400,420).getBoolean("success"),"initial HOME failed");f.slot(-1).failDefault=true;
   Surface surface=new Surface();Bundle result=f.engine.openWindow(0,surface,1080,2400,420,"new/.Main");
   check(result.getBoolean("success")&&f.slot(0).live&&f.slot(0).displayId==100&&f.slot(0).opens==2,"empty HOME replacement depended on physical host or lost its display");
   check(f.slot(0).fullCloses==0,"replacing empty HOME closed its owned display");});
  test("physical HOME exit cannot lend its old display to a newly requested window",()->{for(boolean home:new boolean[]{false,true}){Fixture f=new Fixture();f.open(1);f.slot(1).physicalReturned=true;Surface surface=new Surface();
   Bundle result=home?f.engine.showNativeHome(0,surface,1080,2400,420):f.engine.openWindow(0,surface,1080,2400,420,"app0/.Main");cleanBlocked(result,0,1);
   check(surface.released&&result.getBundle("cleanup_detail").getBoolean("physical_home_returned")&&f.slot(0).opens==0,"physical exit lost provenance or opened a target");}});
  test("fresh operation failures retain their own recovery responsibility",()->{for(boolean home:new boolean[]{false,true}){Fixture f=new Fixture();f.slot(0).failHome=home;f.slot(0).failOpen=!home;
   Bundle result=home?f.engine.showNativeHome(0,new Surface(),1080,2400,420):f.engine.openWindow(0,new Surface(),1080,2400,420,"app0/.Main");
   check(!result.getBoolean("success")&&result.getBoolean("recovery_pending")&&!result.getBoolean("cleanup_pending")&&!result.getBoolean("no_session")&&result.getInt("display_id")==100,"real new-session recovery erased as historical cleanup");}});
  test("restored historical owner allows a clean retry without replaying the old app",()->{Fixture f=new Fixture();f.failedHistory(1,true);cleanBlocked(f.engine.showNativeHome(0,new Surface(),1080,2400,420),0,1);
   f.slot(1).failFull=false;Bundle result=f.engine.showNativeHome(0,new Surface(),1080,2400,420);
   check(result.getBoolean("success")&&!result.getBoolean("cleanup_pending")&&result.getInt("window_id")==0&&result.getInt("display_id")==100,"successful retry inherited the cleanup envelope");
   check(!f.slot(1).live&&!f.slot(1).pending&&f.slot(1).opens==0&&f.slot(0).homeOpens==1,"retry resumed historical app or abandoned cleanup");});
  System.out.println("MULTI WINDOW ENGINE RESULT "+tests+" passed; "+checks+" assertions");
 }
}'''

JOURNAL_BOUNDARY = r'''package ls.augment.com;import java.util.*;final class AtomicWorkbenchJournal {
 static final String PACKAGE="ls.augment.com";int durableHidden=-1;boolean failSave;
 AtomicWorkbenchJournal(android.content.Context c,int uid,int user,int id){}void acquireLock(){}boolean isLocked(){return true;}void releaseLock(){}
 boolean originalStorageMissing(){return false;}boolean exists(){return false;}Record read(){return null;}void clear(){}
 void archiveRecreatedHome(Record record,int replacementTaskId){}
 void save(Record record)throws Exception{if(failSave){failSave=false;throw new java.io.IOException("injected journal fsync failure");}durableHidden=record.hiddenTaskId;android.window.WindowOrganizer.events.add("journal:"+durableHidden);}
 static final class TaskOrigin {final int taskId,displayId,userId;final String component;int uid=-1;String serverBootGeneration="",taskGeneration="",disposition="WORKSPACE_OWNED",successorSession="";TaskOrigin(int id,int display,int user,String component){taskId=id;displayId=display;userId=user;this.component=component;}
 TaskOrigin(int id,int display,int user,String component,int uid,String boot,String generation,String disposition,String successor){this(id,display,user,component);throw new AssertionError("new task journal outside legacy migration scope");}
 Object json(){throw new AssertionError("new task journal outside legacy migration scope");}static TaskOrigin read(Object j){throw new AssertionError("new task journal outside legacy migration scope");}}
 static final class TaskOperation {String operationId;TaskOperation(String op,String shelf,String action,String phase,String lease,TaskOrigin origin,int slot,int display,String session,String name,String unique){throw new AssertionError("new task transaction outside legacy migration scope");}}
 static final class Record {final int ownerUid,userId,windowId;int displayId=-1,width,height,density,imePolicy=-1,hiddenTaskId=-1,homeTaskId=-1,homeOriginDisplay=0;String homeComponent="";boolean homeOnly,homeMigrationPending;int homeTransferDisplay=-1;String homeTransferName="",homeTransferUniqueId="";String state="prepared",component="",displayName="owned",uniqueId="owned-unique";final ArrayList<TaskOrigin> tasks=new ArrayList<>();
 String session="11111111-1111-1111-1111-111111111111";final ArrayList<TaskOperation>taskOperations=new ArrayList<>();Record(int uid,int user,int id){ownerUid=uid;userId=user;windowId=id;}}
}'''
MIGRATION_TEST = r'''package ls.augment.com;import android.content.ComponentName;import android.window.*;import java.lang.reflect.*;import java.util.*;
public final class TestAtomicWorkbenchMigration {
 static int tests,checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static final class Task {public int taskId=77,displayId=88,userId=0;public ComponentName baseActivity=new ComponentName("sample","sample.Main"),topActivity=baseActivity;public WindowContainerToken token=new WindowContainerToken();}
 public static final class Tasks {final Task task;boolean failMove;int moves;Tasks(Task task){this.task=task;}public List<Task> getAllRootTaskInfos(){return List.of(task);}public void moveRootTaskToDisplay(int id,int display){moves++;WindowOrganizer.events.add("move:"+display);if(failMove)throw new IllegalStateException("injected task move failure");task.displayId=display;}}
 static AtomicWorkbenchPlatform platform(AtomicWorkbenchJournal journal,AtomicWorkbenchJournal.Record record,Tasks tasks)throws Exception {
  Field singleton=sun.misc.Unsafe.class.getDeclaredField("theUnsafe");singleton.setAccessible(true);sun.misc.Unsafe unsafe=(sun.misc.Unsafe)singleton.get(null);
  AtomicWorkbenchPlatform result=(AtomicWorkbenchPlatform)unsafe.allocateInstance(AtomicWorkbenchPlatform.class);
  for(String name:new String[]{"journal","record","taskService","userId"}){Field field=AtomicWorkbenchPlatform.class.getDeclaredField(name);field.setAccessible(true);field.set(result,switch(name){case "journal"->journal;case "record"->record;case "taskService"->tasks;default->0;});}
  return result;
 }
 static void call(AtomicWorkbenchPlatform platform,String method,Object... args)throws Exception{
  Method target=AtomicWorkbenchPlatform.class.getDeclaredMethod(method,args.length==0?new Class<?>[0]:new Class<?>[]{Object.class,boolean.class});target.setAccessible(true);
  try{target.invoke(platform,args);}catch(InvocationTargetException error){throw (Exception)error.getCause();}
 }
 static final class Fixture {final Task task=new Task();final Tasks tasks=new Tasks(task);final AtomicWorkbenchJournal journal=new AtomicWorkbenchJournal(null,10055,0,0);final AtomicWorkbenchJournal.Record record=new AtomicWorkbenchJournal.Record(10055,0,0);final AtomicWorkbenchPlatform platform;
 Fixture()throws Exception{WindowOrganizer.events.clear();WindowOrganizer.failHide=WindowOrganizer.failUnhide=false;record.tasks.add(new AtomicWorkbenchJournal.TaskOrigin(77,0,0,task.baseActivity.flattenToString()));platform=platform(journal,record,tasks);}}
 interface Case {void run()throws Exception;}static void test(String name,Case body)throws Exception{body.run();tests++;System.out.println("PASS production task migration: "+name);}
 public static void main(String[] args)throws Exception{
  if(args.length>0){test("optional WCT absent blocks only partial close, while full restore still works",()->{Fixture f=new Fixture();boolean failed=false;try{call(f.platform,"moveTaskToPrimary",f.task,true);}catch(NoSuchMethodException expected){failed=true;}
   check(failed&&f.task.displayId==88&&!f.task.token.hidden&&f.journal.durableHidden==-1,"partial attempt changed task without optional WCT");call(f.platform,"moveTaskToPrimary",f.task,false);check(f.task.displayId==0&&f.tasks.moves==1,"full restore incorrectly requires WCT");});
  }else{
   test("durable visibility evidence precedes hide and normal restoration clears it",()->{Fixture f=new Fixture();call(f.platform,"moveTaskToPrimary",f.task,true);
    check(f.task.displayId==0&&!f.task.token.hidden&&f.record.hiddenTaskId==-1&&f.journal.durableHidden==-1,"successful partial restore left hidden task");
    check(WindowOrganizer.events.indexOf("journal:77")<WindowOrganizer.events.indexOf("hide")&&WindowOrganizer.events.indexOf("hide")<WindowOrganizer.events.indexOf("move:0"),"visibility changed before durable evidence");});
   test("failed journal persistence never hides or migrates the task",()->{Fixture f=new Fixture();f.journal.failSave=true;boolean failed=false;try{call(f.platform,"moveTaskToPrimary",f.task,true);}catch(java.io.IOException expected){failed=true;}
    check(failed&&f.task.displayId==88&&!f.task.token.hidden&&f.tasks.moves==0&&WindowOrganizer.events.isEmpty(),"task changed after journal write failure");});
   test("failed WCT hide leaves task visible on its original display",()->{Fixture f=new Fixture();WindowOrganizer.failHide=true;boolean failed=false;try{call(f.platform,"moveTaskToPrimary",f.task,true);}catch(Exception expected){failed=true;}
    check(failed&&f.tasks.moves==0&&f.task.displayId==88&&!f.task.token.hidden&&f.journal.durableHidden==-1,"hide failure stranded task");});
   test("failed task migration restores visibility before preserving its journal",()->{Fixture f=new Fixture();f.tasks.failMove=true;boolean failed=false;try{call(f.platform,"moveTaskToPrimary",f.task,true);}catch(Exception expected){failed=true;}
    check(failed&&f.task.displayId==88&&!f.task.token.hidden&&f.record.hiddenTaskId==-1,"move failure left task hidden");});
   test("unhide failure remains durable and a replacement daemon can repair it",()->{Fixture f=new Fixture();WindowOrganizer.failUnhide=true;boolean failed=false;try{call(f.platform,"moveTaskToPrimary",f.task,true);}catch(Exception expected){failed=true;}
    check(failed&&f.task.displayId==0&&f.task.token.hidden&&f.record.hiddenTaskId==77&&f.journal.durableHidden==77,"unhide failure lost recovery identity");
    AtomicWorkbenchJournal.Record restartedRecord=new AtomicWorkbenchJournal.Record(10055,0,0);restartedRecord.hiddenTaskId=f.journal.durableHidden;restartedRecord.tasks.addAll(f.record.tasks);WindowOrganizer.failUnhide=false;
    call(platform(f.journal,restartedRecord,f.tasks),"restorePendingVisibility");check(!f.task.token.hidden&&restartedRecord.hiddenTaskId==-1&&f.journal.durableHidden==-1,"replacement daemon failed to unhide original task");});
  }
  System.out.println("TASK MIGRATION RESULT "+tests+" passed; "+checks+" assertions");
 }
}'''


def migration_sources(missing=False):
    organizer = '''package android.window;public class WindowOrganizer {
 public static final java.util.List<String> events=new java.util.ArrayList<>();public static boolean failHide,failUnhide;
 REPLACE
}'''
    implementation = '''public void applyTransaction(WindowContainerTransaction tx){events.add(tx.hidden?"hide":"unhide");
 if(tx.hidden&&failHide||!tx.hidden&&failUnhide)throw new IllegalStateException("injected visibility failure");tx.token.hidden=tx.hidden;}'''
    return {

        "ls/augment/com/AtomicWorkbenchJournal.java": JOURNAL_BOUNDARY,
        "ls/augment/com/AtomicWorkbenchDiagnostics.java": '''package ls.augment.com;final class AtomicWorkbenchDiagnostics {
 static void emit(String event,int window,int display,String component,int result,String detail,Throwable error){}
}''',
        "ls/augment/com/TestAtomicWorkbenchMigration.java": MIGRATION_TEST,
        "android/content/ComponentName.java": '''package android.content;public class ComponentName {
 private final String pkg,name;public ComponentName(String pkg,String name){this.pkg=pkg;this.name=name;}
 public String getPackageName(){return pkg;}public String getClassName(){return name;}public String flattenToString(){return pkg+"/"+name;}
 public static ComponentName unflattenFromString(String text){if(text==null||!text.contains("/"))return null;String[] parts=text.split("/",2);return new ComponentName(parts[0],parts[1]);}
 public boolean equals(Object other){return other instanceof ComponentName&&flattenToString().equals(((ComponentName)other).flattenToString());}public int hashCode(){return flattenToString().hashCode();}}''',
        "android/window/WindowContainerToken.java": "package android.window;public class WindowContainerToken {public boolean hidden;}",
        "android/window/WindowContainerTransaction.java": '''package android.window;public class WindowContainerTransaction {
 public WindowContainerToken token;public boolean hidden;public WindowContainerTransaction setHidden(WindowContainerToken token,boolean hidden){this.token=token;this.hidden=hidden;return this;}
 public WindowContainerTransaction reorder(WindowContainerToken token,boolean onTop){return this;}}''',
        "android/window/WindowOrganizer.java": organizer.replace("REPLACE", "" if missing else implementation),
    }


def task_journal_support(text):
    # Compile-only new task boundaries: legacy tests must still execute every old path.
    if "serverBootGeneration" not in text:
        text=text.replace("final String component;", 'final String component;int uid=-1;String serverBootGeneration="",taskGeneration="",disposition="WORKSPACE_OWNED",successorSession="";')
        at=text.index(" static final class Record")
        text=text[:at]+text[at:]
        marker=" static final class Record"
        extra=' static final class TaskOperation {String operationId;TaskOperation(String op,String shelf,String action,String phase,String lease,TaskOrigin origin,int slot,int display,String session,String name,String unique){throw new AssertionError("new task transaction outside legacy scope");}}\n'
        # Insert extra constructors inside the existing TaskOrigin class.
        at=text.index(marker)
        prefix=text[:at];end=prefix.rfind("}")
        ctor=' TaskOrigin(int id,int display,int user,String component,int uid,String boot,String generation,String disposition,String successor){this(id,display,user,component);throw new AssertionError("new task origin outside legacy scope");}Object json(){throw new AssertionError("new task origin outside legacy scope");}static TaskOrigin read(Object value){throw new AssertionError("new task origin outside legacy scope");}'
        text=prefix[:end]+ctor+prefix[end:]+extra+text[at:]
    if "taskOperations=" not in text and "taskOperations =" not in text:
        text=text.replace("final ArrayList<TaskOrigin> tasks=new ArrayList<>();", "final ArrayList<TaskOrigin> tasks=new ArrayList<>();final ArrayList<TaskOperation>taskOperations=new ArrayList<>();String session=\"11111111-1111-1111-1111-111111111111\";")
    if "taskAllocationId" not in text:
        text=text.replace("static final class Record {", 'static final class Record {String taskAllocationId="";boolean retainedEmptyTaskDisplay;')
    return text


def output_support(sources, production):
    sources, production = dict(sources), list(production)
    # Resolve shared production dependencies, including mutant source copies.
    bodies=[(SRC/name).read_text(encoding="utf-8") for name in production]+list(sources.values())
    for name, token in [("hook/AtomicWorkbenchQuickstepCapabilities.java","AtomicWorkbenchQuickstepCapabilities"),
                        ("hook/HookCompatibility.java","HookCompatibility")]:
        if any(token in body for body in bodies) and name not in production and "ls/augment/com/"+name not in sources:
            production.append(name);bodies.append((SRC/name).read_text(encoding="utf-8"))

    if "AtomicWorkbenchEngine.java" in production:
        # Compile the actual new metadata DTOs; old coordinator cases do not
        # execute the reference route or gain a simulated cleanup authority.
        for name in ("AtomicWorkbenchTaskIdentity.java", "AtomicWorkbenchTaskReferenceRequest.java",
                     "AtomicWorkbenchTaskReferenceResult.java", "AtomicWorkbenchTaskReferenceSnapshot.java"):
            if name not in production and 'ls/augment/com/' + name not in sources:
                production.append(name)
        bundle = sources.get("android/os/Bundle.java")
        if bundle is not None and "extends HashMap" not in bundle:
            extra = ""
            if "isEmpty(" not in bundle: extra += "public boolean isEmpty(){return data.isEmpty();}"
            if "keySet(" not in bundle: extra += "public java.util.Set<String>keySet(){return data.keySet();}"
            if " get(String " not in bundle: extra += "public Object get(String key){return data.get(key);}"
            if extra: sources["android/os/Bundle.java"] = bundle.rsplit("}",1)[0]+extra+"}"
    if "AtomicWorkbenchPlatform.java" in production:
        journal_key="ls/augment/com/AtomicWorkbenchJournal.java"
        if journal_key in sources: sources[journal_key]=task_journal_support(sources[journal_key])
        bundle = sources.get("android/os/Bundle.java")
        if bundle is not None:
            extra = ""
            if "keySet(" not in bundle:
                extra += "public java.util.Set<String> keySet(){return data.keySet();}"
            if " get(String " not in bundle:
                extra += "public Object get(String key){return data.get(key);}"
            if extra:
                sources["android/os/Bundle.java"] = bundle.rsplit("}", 1)[0] + extra + "}"
        for name in ("AtomicWorkbenchOutputIdentity.java", "AtomicWorkbenchOutputProtocol.java", "AtomicWorkbenchLaunchBoundary.java",
                     "AtomicWorkbenchTaskIdentity.java", "AtomicWorkbenchTaskOperationRequest.java"):
            if name not in production and 'ls/augment/com/' + name not in sources:
                production.append(name)
        if "AtomicWorkbenchInputFocusProbe.java" not in production:
            sources.setdefault("ls/augment/com/AtomicWorkbenchInputFocusProbe.java", "package ls.augment.com;final class AtomicWorkbenchInputFocusProbe {static boolean primaryConfirmed(){throw new AssertionError(\"input proof outside this regression scope\");}}")
    return sources, production


def compile_run(work, sources, production, runner, classpath=None, arguments=()):
    sources, production = output_support(sources, production)
    files = []
    for name, text in sources.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
        files.append(str(path))
    classes = work / "classes"
    args = [JAVAC, "--release", "17", "-encoding", "UTF-8", "-d", str(classes)]
    if classpath:
        args += ["-cp", str(classpath)]
    subprocess.run(args + [str(SRC / name) for name in production] + files, check=True, timeout=45, env=ENV)
    runtime_cp = str(classes) + (os.pathsep + str(classpath) if classpath else "")
    subprocess.run([JAVA, "-Dfile.encoding=UTF-8", "-cp", runtime_cp, runner, *arguments], check=True, timeout=25, env=ENV)


def main():
    with tempfile.TemporaryDirectory(prefix="lsa-multi-engine-") as temporary:
        work = Path(temporary)
        compile_run(work / "engine", {
            "android/content/ComponentName.java": migration_sources()["android/content/ComponentName.java"],
            "android/content/Intent.java": "package android.content;public class Intent {}",
            "android/os/Bundle.java": BUNDLE,
            "android/os/Handler.java": "package android.os;public class Handler {}",
            "android/content/Context.java": "package android.content;public class Context {}",
            "android/view/Surface.java": "package android.view;public class Surface {public boolean released;public void release(){released=true;}}",
            "android/view/KeyEvent.java": "package android.view;public class KeyEvent {public static final int ACTION_DOWN=0;public int getAction(){return ACTION_DOWN;}}",
            "android/view/MotionEvent.java": "package android.view;public class MotionEvent {public static final int ACTION_DOWN=0;private final int action;public MotionEvent(int action){this.action=action;}public int getActionMasked(){return action;}}",
            "ls/augment/com/AtomicWorkbenchPlatform.java": PLATFORM,
            "ls/augment/com/TestAtomicWorkbenchEngine.java": ENGINE_TEST,
        }, ["AtomicWorkbenchEngine.java", "AtomicWorkbenchProtocol.java"], "ls.augment.com.TestAtomicWorkbenchEngine")
        sdk = Path(os.environ.get("ANDROID_HOME", str(ROOT / "audit-output/android-sdk"))) / "platforms/android-36/android.jar"
        if not sdk.is_file():
            raise RuntimeError("SDK36 android.jar is required for production migration-helper tests")
        compile_run(work / "migration", migration_sources(), ["AtomicWorkbenchPlatform.java", "AtomicWorkbenchLaunchBridge.java", "AtomicWorkbenchProtocol.java"],
                    "ls.augment.com.TestAtomicWorkbenchMigration", sdk)
        compile_run(work / "missing-wct", migration_sources(missing=True), ["AtomicWorkbenchPlatform.java", "AtomicWorkbenchLaunchBridge.java", "AtomicWorkbenchProtocol.java"],
                    "ls.augment.com.TestAtomicWorkbenchMigration", sdk, ("missing-wct",))


if __name__ == "__main__":
    main()
