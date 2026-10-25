"""Actual Platform/Engine ownership after media dispatch, transport loss and asynchronous observation."""
from pathlib import Path
import os
import runpy
import subprocess
import sys
import tempfile

ROOT=Path(__file__).resolve().parents[1]
OUTPUT=runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-output-runtime.py")))
HOME,SUPPORT=OUTPUT["HOME"],OUTPUT["SUPPORT"]

TEST=r'''
 static AutoCloseable media(){return AtomicWorkbenchLaunchBoundary.enter(component->{check(component.startsWith("sample/"),"actual media component changed");});}
 static void unknown(Bundle state,String why){check(!state.getBoolean("success")&&state.getBoolean("operation_unconfirmed")&&!state.getBoolean("recovery_pending"),why);}
 static void retained(Fixture f,android.hardware.display.VirtualDisplay vd,int display,String why)throws Exception{
  check(f.platform.hasLiveDisplay()&&!vd.released&&vd.display.id==display&&Files.exists(f.file(0)),why);
  JSONObject disk=f.disk(0);check(disk.getInt("display_id")==display&&disk.getString("unique_id").equals(vd.display.unique),"uncertain dispatch lost durable exact identity");
 }
 public static void main(String[] args)throws Exception{base=Path.of(args[0]);
  for(boolean recents:new boolean[]{false,true})test("scoped "+(recents?"recents":"direct")+" reply loss after real task side effect retains ownership",()->{try(Fixture f=new Fixture()){
   Task original=new Task(77,0,0,1,"sample/sample.Main");if(recents)f.service.list.add(original);f.service.throwAfterStart=true;Bundle result;
   try(AutoCloseable scope=media()){result=recents?f.platform.openTask(new Surface(),1080,2400,420,"sample/sample.Main",77):f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");}
   var vd=f.context.displays.latest;int display=vd.display.id;unknown(result,"effectful media transport exception was cleaned or not marked unknown");retained(f,vd,display,"effectful media dispatch released its VD");
   check(f.service.list.stream().anyMatch(t->t.displayId==display&&t.baseActivity.getPackageName().equals("sample")),"transport fixture did not mutate real task location");
   f.service.failSnapshots=true;Bundle still=f.platform.status();unknown(still,"status outage promoted media uncertainty into recovery");retained(f,vd,display,"status outage released retained media session");
   f.service.failSnapshots=false;f.service.throwAfterStart=false;Bundle fresh=f.platform.status();check(fresh.getBoolean("success")&&!fresh.getBoolean("operation_unconfirmed")&&f.platform.hasLiveDisplay(),"fresh actual target did not reconcile uncertain launch");
  }});
  test("scoped accepted launch without observed task remains unconfirmed across scope exit and seven second timeout",()->{try(Fixture f=new Fixture()){
   f.service.skipNewTask=true;Bundle first;try(AutoCloseable scope=media()){first=f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");}
   unknown(first,"accepted unobserved media launch claimed success");check(!AtomicWorkbenchLaunchBoundary.isActive(),"media scope did not close");var vd=f.context.displays.latest;int display=vd.display.id,starts=f.service.starts;
   f.handler.advance(7000);Bundle timed=f.platform.status();unknown(timed,"asynchronous media timeout lost captured retention scope");retained(f,vd,display,"late media timeout released original VD");check(f.service.starts==starts&&f.service.positiveMoves==0,"timeout replayed dispatch or migrated tasks");
   f.service.list.add(0,new Task(501,display,0,1,"sample/sample.Main"));Bundle actual=f.platform.status();check(actual.getBoolean("success")&&!actual.getBoolean("operation_unconfirmed")&&f.service.starts==starts,"late actual task triggered replay or stayed unknown");
  }});
  test("scoped post-dispatch observation exception preserves owner without setting global recovery",()->{try(Fixture f=new Fixture()){
   f.service.skipNewTask=true;f.service.afterStart=()->f.service.failSnapshots=true;Bundle result;try(AutoCloseable scope=media()){result=f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");}
   unknown(result,"post-dispatch observation failure cleaned media VD");var vd=f.context.displays.latest;retained(f,vd,vd.display.id,"observation exception lost original VD");
   f.handler.advance(8000);unknown(f.platform.status(),"late snapshot error cleared uncertainty");check(f.service.starts==1&&!vd.released,"snapshot failure replayed or auto released");
  }});
  test("scoped delayed snapshot failure retains policy after ThreadLocal scope has ended",()->{try(Fixture f=new Fixture()){
   f.service.skipNewTask=true;Bundle result;try(AutoCloseable scope=media()){result=f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");}unknown(result,"initial media wait not marked unknown");var vd=f.context.displays.latest;
   f.service.failSnapshots=true;f.handler.advance(160);unknown(f.platform.status(),"delayed callback reread absent ThreadLocal scope");retained(f,vd,vd.display.id,"delayed callback released VD");
  }});
  for(boolean recents:new boolean[]{false,true})test("existing HOME "+(recents?"recents":"direct")+" media transport loss preserves same HOME display and app task",()->{try(Fixture f=new Fixture()){
   success(f.show());var vd=f.context.displays.latest;int display=f.home.displayId;Task original=new Task(77,0,0,1,"sample/sample.Main");if(recents)f.service.list.add(original);f.service.throwAfterStart=true;Bundle result;
   try(AutoCloseable scope=media()){result=f.platform.openInEmptyHome(new Surface(),1080,2400,420,"sample/sample.Main",recents?77:-1);}
   unknown(result,"existing HOME media transport loss lacked unknown receipt");retained(f,vd,display,"existing HOME dispatch replaced display");check(f.home.displayId==display&&f.disk(0).getInt("home_task_id")==41&&f.context.displays.all.size()==1,"uncertain media launch migrated original HOME");
  }});
  test("existing HOME pending media timeout survives an ended admission scope",()->{try(Fixture f=new Fixture()){
   success(f.show());var vd=f.context.displays.latest;int display=f.home.displayId;f.service.skipNewTask=true;Bundle result;try(AutoCloseable scope=media()){result=f.platform.openInEmptyHome(new Surface(),1080,2400,420,"sample/sample.Main",-1);}unknown(result,"HOME accepted wait falsely claimed confirmed");
   f.handler.advance(7000);unknown(f.platform.status(),"HOME async timeout lost media unknown flag");retained(f,vd,display,"HOME timeout released original display");check(f.home.displayId==display,"HOME timeout migrated borrowed launcher");
  }});
  test("effectful scoped app focus returns unknown and Engine status keeps it without task recovery",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main"));AtomicWorkbenchPlatform p=slot(f.engine,0);int task=p.outputStatus().getInt("task_id");var vd=f.context.displays.latest;f.service.throwFocusId=task;Bundle result;
   try(AutoCloseable scope=media()){result=f.engine.focusAppWindow(0,"sample/sample.Main");}
   unknown(result,"effectful focus transport loss lacked unknown receipt");check(!p.readyForInput()&&f.engine.status().getBoolean("operation_unconfirmed")&&!f.engine.status().getBoolean("recovery_pending")&&!vd.released&&Files.exists(f.file(0)),"Engine status dropped media focus uncertainty or recovered tasks");
   f.service.throwFocusId=-1;f.service.failSnapshots=false;Bundle fresh=f.engine.status();check(!fresh.getBoolean("operation_unconfirmed")&&p.hasLiveDisplay(),"fresh exact focused task did not resolve focus uncertainty");
  }});
  test("uncertain cross window media focus never compensates by demoting target or focusing previous task",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.openWindow(0,new Surface(),1080,2400,420,"sample1/sample1.Main"));success(f.engine.focusWindow(0));success(f.engine.openWindow(1,new Surface(),1080,2400,420,"sample/sample.Main"));success(f.engine.focusWindow(0));
   AtomicWorkbenchPlatform a=slot(f.engine,0),b=slot(f.engine,1);int displayA=a.outputStatus().getInt("display_id"),taskB=b.outputStatus().getInt("task_id"),starts=f.service.starts,moves=f.service.encodedMoves;FakeFocusController.events.clear();f.service.throwFocusId=taskB;Bundle unknown;
   try(AutoCloseable scope=media()){unknown=f.engine.focusAppWindow(1,"sample/sample.Main");}
   unknown(unknown,"cross window effectful focus lacked unknown reply");check(f.service.focused==taskB&&f.engine.activeInputWindow()==0&&FakeFocusController.events.equals(List.of("suspend:"+displayA,"focus:"+taskB)),"unknown focus compensation changed actual target or old Guard responsibility");
   int movesAfterAttempt=f.service.encodedMoves;f.service.throwFocusId=-1;f.service.failSnapshots=false;Bundle fresh=f.engine.status();check(!fresh.getBoolean("operation_unconfirmed")&&fresh.getInt("focused_window_id")==-2&&f.service.focused==taskB&&f.service.starts==starts&&f.service.encodedMoves==movesAfterAttempt,"fresh unknown focus observation replayed or claimed old focus");
   check(a.hasLiveDisplay()&&b.hasLiveDisplay()&&a.outputStatus().getBoolean("input_focus_suspended")&&!b.outputStatus().getBoolean("input_focus_suspended"),"unknown focus lost actual Guard or display ownership");
  }});
  test("same VD native B focus confirms attempted component UID and task while preserving original A binding",()->{try(Fixture f=new Fixture()){
   success(f.platform.open(new Surface(),1080,2400,420,"sample1/sample1.Main"));var vd=f.context.displays.latest;int display=vd.display.id;String original=f.platform.hostedComponent();f.context.packages.mediaUids.put("sample",10056);
   Task b=new Task(501,display,0,1,"sample/sample.Main");b.topActivityInfo.applicationInfo.uid=10056;f.service.list.add(0,b);f.service.throwFocusId=501;Bundle result;
   try(AutoCloseable scope=media()){result=f.platform.focusAppWindow("sample/sample.Main");}unknown(result,"native B effectful focus not retained");f.service.throwFocusId=-1;f.service.failSnapshots=false;
   f.context.packages.mediaUids.put("sample",10057);unknown(f.platform.status(),"changed B package UID cleared unknown");f.context.packages.mediaUids.put("sample",10056);
   b.topActivityInfo.applicationInfo.uid=10057;unknown(f.platform.status(),"TaskInfo UID mismatch cleared unknown");b.topActivityInfo.applicationInfo.uid=10056;
   var info=b.topActivityInfo;b.topActivityInfo=null;unknown(f.platform.status(),"missing TaskInfo UID cleared unknown");b.topActivityInfo=info;
   b.userId=10;unknown(f.platform.status(),"other user task cleared unknown");b.userId=0;
   b.displayId=display+100;unknown(f.platform.status(),"other display task cleared unknown");b.displayId=display;
   Task other=new Task(502,display,0,1,"sample/sample.Main");other.topActivityInfo.applicationInfo.uid=10056;f.service.list.add(0,other);f.service.focused=502;unknown(f.platform.status(),"different task cleared unknown");f.service.focused=501;
   b.topActivity=ComponentName.unflattenFromString("foreign/foreign.Top");unknown(f.platform.status(),"foreign top package cleared unknown");b.topActivity=ComponentName.unflattenFromString("sample/sample.Player");
   int starts=f.service.starts,moves=f.service.encodedMoves;FakeFocusController.events.clear();Bundle fresh=f.platform.status();check(fresh.getBoolean("success")&&!fresh.getBoolean("operation_unconfirmed")&&f.platform.hostedComponent().equals(original)&&f.disk(0).getString("component").equals("sample1/sample1.Main"),"same VD B fresh identity did not resolve independently of original A binding");
   check(f.service.focused==501&&f.service.starts==starts&&f.service.encodedMoves==moves&&FakeFocusController.events.isEmpty()&&!vd.released,"same VD fresh B confirmation replayed dispatch or altered actual task");
  }});
  test("missing actual TaskInfo UID refuses new scoped focus before dispatch without changing ordinary focus",()->{try(Fixture f=new Fixture()){
   success(f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main"));Task task=f.service.list.stream().filter(t->t.displayId==f.context.displays.latest.display.id).findFirst().orElseThrow();task.topActivityInfo=null;f.service.focused=42;FakeFocusController.events.clear();Bundle denied;
   try(AutoCloseable scope=media()){denied=f.platform.focusAppWindow("sample/sample.Main");}
   check(!denied.getBoolean("success")&&!denied.getBoolean("operation_unconfirmed")&&f.service.focused==42&&FakeFocusController.events.isEmpty(),"missing TaskInfo UID allowed scoped dispatch");
   success(f.platform.focusAppWindow("sample/sample.Main"));check(f.service.focused==task.taskId,"ordinary focus was restricted by media evidence requirements");
  }});
  test("explicit negative start result and admission rejection are confirmed failures with no retained media VD",()->{try(Fixture f=new Fixture()){
   f.service.startResult=-94;Bundle negative;try(AutoCloseable scope=media()){negative=f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");}
   check(!negative.getBoolean("success")&&!negative.getBoolean("operation_unconfirmed")&&!f.platform.hasLiveDisplay()&&f.context.displays.latest.released&&!Files.exists(f.file(0)),"explicit reject was treated as uncertain dispatch");
  }try(Fixture f=new Fixture()){
   int[] calls={0};Bundle denied;try(AutoCloseable scope=AtomicWorkbenchLaunchBoundary.enter(c->{if(++calls[0]==2)throw new IllegalStateException("expired");})){denied=f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");}
   check(!denied.getBoolean("success")&&!denied.getBoolean("operation_unconfirmed")&&f.service.starts==0&&!f.platform.hasLiveDisplay(),"undispatched admission rejection retained a phantom operation");
  }});
  test("ordinary launch transport and timeout policies remain unchanged",()->{try(Fixture f=new Fixture()){
   f.service.throwAfterStart=true;Bundle failed=f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");check(!failed.getBoolean("success")&&!failed.getBoolean("operation_unconfirmed")&&!f.platform.hasLiveDisplay()&&f.context.displays.latest.released,"ordinary transport policy changed");
  }try(Fixture f=new Fixture()){
   f.service.skipNewTask=true;success(f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main"));f.handler.advance(7000);check(!f.platform.hasLiveDisplay()&&!f.platform.outputStatus().getBoolean("operation_unconfirmed"),"ordinary timeout policy changed");
  }});
  test("unrecognised nonnegative media result cannot certify that no dispatch side effect happened",()->{try(Fixture f=new Fixture()){
   f.service.startResult=99;Bundle result;try(AutoCloseable scope=media()){result=f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");}
   unknown(result,"unrecognised result discarded possible media dispatch");var vd=f.context.displays.latest;retained(f,vd,vd.display.id,"unrecognised result released uncertain owner");
  }});
  test("explicit close retires unknown operation while preserving real failed task recovery",()->{try(Fixture f=new Fixture()){
   f.service.throwAfterStart=true;try(AutoCloseable scope=media()){unknown(f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main"),"fixture did not retain media transport");}var vd=f.context.displays.latest;
   f.service.failRestore=true;Bundle closing=f.platform.close();check(!closing.getBoolean("success")&&closing.getBoolean("recovery_pending")&&!closing.getBoolean("operation_unconfirmed")&&!vd.released,"explicit close retained stale media uncertainty instead of recovery");
   f.service.failSnapshots=true;Bundle pending=f.platform.status();check(!pending.getBoolean("success")&&pending.getBoolean("recovery_pending")&&!pending.getBoolean("operation_unconfirmed")&&"recovering".equals(pending.getString("state")),"status undid explicitly requested task recovery");
   f.service.failSnapshots=false;f.service.failRestore=false;success(f.platform.close());check(vd.released&&!f.platform.hasRecoveryPending()&&!Files.exists(f.file(0)),"explicit close retry lost actual task responsibility");
  }});
  test("old queued media observation cannot alter a newer explicitly reopened session",()->{try(Fixture f=new Fixture()){
   f.service.skipNewTask=true;try(AutoCloseable scope=media()){f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");}success(f.platform.close());f.service.skipNewTask=false;success(f.platform.open(new Surface(),1080,2400,420,"sample1/sample1.Main"));var latest=f.context.displays.latest;int display=latest.display.id;
   f.handler.advance(9000);check(f.platform.hasLiveDisplay()&&!latest.released&&f.platform.outputStatus().getInt("display_id")==display&&!f.platform.outputStatus().getBoolean("operation_unconfirmed")&&f.service.starts==2,"old media callback changed newer launch generation");
  }});
  System.out.println("MEDIA DISPATCH RUNTIME RESULT "+tests+" cases; "+checks+" assertions");
 }
 static AtomicWorkbenchPlatform slot(AtomicWorkbenchEngine engine,int id)throws Exception{Field field=AtomicWorkbenchEngine.class.getDeclaredField("windows");field.setAccessible(true);return ((AtomicWorkbenchPlatform[])field.get(engine))[id];}
}'''

MUTATIONS=[
 ("NEW_MEDIA_TRANSPORT_RETAINS_VD","AtomicWorkbenchPlatform.java","if (mediaScope && dispatched && (!dispatchKnown || dispatchMayHaveApplied)) {\n                retainMediaOperation(\"媒体应用启动结果尚未确认","if (false) {\n                retainMediaOperation(\"媒体应用启动结果尚未确认","effectful media transport exception was cleaned or not marked unknown"),
 ("ASYNC_SCOPE_IS_CAPTURED","AtomicWorkbenchPlatform.java","pollLaunchedTask(generation, deadline, retainDisplay, mediaScope), 160L)","pollLaunchedTask(generation, deadline, AtomicWorkbenchLaunchBoundary.isActive(), AtomicWorkbenchLaunchBoundary.isActive()), 160L)","asynchronous media timeout lost captured retention scope"),
 ("MEDIA_NEW_POLL_RETAINS","AtomicWorkbenchPlatform.java","pollLaunchedTask(generation, SystemClock.uptimeMillis() + 7000L, mediaScope, mediaScope);","pollLaunchedTask(generation, SystemClock.uptimeMillis() + 7000L, false, mediaScope);","asynchronous media timeout lost captured retention scope"),
 ("STATUS_UNKNOWN_IS_NOT_RECOVERY","AtomicWorkbenchPlatform.java","if (retainedMediaOperation && ownedDisplay != null && record != null)","if (false)","status outage promoted media uncertainty into recovery"),
 ('FOCUS_EFFECTFUL_UNKNOWN', 'AtomicWorkbenchPlatform.java', 'if (mediaScope && dispatched) {', 'if (false) {', 'Engine status dropped media focus uncertainty or recovered tasks'),
 ("ENGINE_AGGREGATES_UNKNOWN","AtomicWorkbenchEngine.java","top.putBoolean(\"operation_unconfirmed\", unconfirmed);","top.putBoolean(\"operation_unconfirmed\", false);","Engine status dropped media focus uncertainty or recovered tasks"),
 ("HOME_POLL_MEDIA_CAPTURE","AtomicWorkbenchPlatform.java","pollLaunchedTask(++launchGeneration, SystemClock.uptimeMillis() + 7000L, true, mediaScope);","pollLaunchedTask(++launchGeneration, SystemClock.uptimeMillis() + 7000L, false, false);","HOME async timeout lost media unknown flag"),
 ("EXPLICIT_CLOSE_RETIRES_UNKNOWN","AtomicWorkbenchPlatform.java","// An explicit close now owns recovery; a prior media query must not undo it.\n        clearMediaOperation();","// mutation: retain old media operation","explicit close retained stale media uncertainty instead of recovery"),
 ("UNKNOWN_FOCUS_NO_REVERSE_COMPENSATION","AtomicWorkbenchEngine.java","if (result.getBoolean(\"operation_unconfirmed\")) {","if (false) {","unknown focus compensation changed actual target or old Guard responsibility"),
]

MUTATIONS.extend([
 ("ACTUAL_ATTEMPTED_COMPONENT","AtomicWorkbenchPlatform.java","unconfirmedFocusTask >= 0 ? unconfirmedFocusComponent : record.component","record.component","same VD B fresh identity did not resolve independently of original A binding"),
 ("TASK_UID_IS_NOT_CURRENT_PM_UID","AtomicWorkbenchPlatform.java","actual.uid == uid && mediaPackageUid(component) == uid","mediaPackageUid(component) == uid","TaskInfo UID mismatch cleared unknown"),
 ("FROZEN_PACKAGE_UID_IS_REQUIRED","AtomicWorkbenchPlatform.java","actual.uid == uid && mediaPackageUid(component) == uid","actual.uid == uid","changed B package UID cleared unknown"),
 ("MISSING_TASK_UID_IS_NOT_PM","AtomicWorkbenchPlatform.java",'Object info = task.getClass().getField("topActivityInfo").get(task);','Object info = task.getClass().getField("topActivityInfo").get(task); if (info == null) return mediaPackageUid(component) == uid;',"missing TaskInfo UID cleared unknown"),
])

def prefix():
    text=HOME["TEST"].split(" public static void main(String[] args)",1)[0]
    replacements={
     "int starts,encodedMoves":"boolean throwAfterStart,failSnapshots;int startResult,throwFocusId=-1;int starts,encodedMoves",
     "public ComponentName baseActivity,topActivity;":"public android.content.pm.ActivityInfo topActivityInfo=new android.content.pm.ActivityInfo();public ComponentName baseActivity,topActivity;",
     "public List<Task> getAllRootTaskInfos(){":"public List<Task> getAllRootTaskInfos(){if(failSnapshots)throw new IllegalStateException(\"snapshot unavailable\");",
     "public List<Task> getTasks(int count,boolean a,boolean b,int display){":"public List<Task> getTasks(int count,boolean a,boolean b,int display){if(failSnapshots)throw new IllegalStateException(\"snapshot unavailable\");",
     "public List<Task> getAllRootTaskInfosOnDisplay(int display){":"public List<Task> getAllRootTaskInfosOnDisplay(int display){if(failSnapshots)throw new IllegalStateException(\"snapshot unavailable\");",
     'list.remove(t);list.add(0,t);}}':'list.remove(t);list.add(0,t);}if(throwFocusId==id){failSnapshots=true;throw new IllegalStateException("focus reply lost");}}',
     'if(skipNewTask){starts++;':'if(startResult!=0){starts++;return startResult;}if(skipNewTask){starts++;',
     'list.add(0,task);focused=task.taskId;return 0;':'list.add(0,task);focused=task.taskId;if(throwAfterStart)throw new IllegalStateException("start reply lost");return 0;',
     'if(t!=null)t.displayId=options.getInt("launchDisplayId");return 0;':'if(t!=null)t.displayId=options.getInt("launchDisplayId");if(throwAfterStart)throw new IllegalStateException("recents reply lost");return 0;',
     'public void close(){service.failRestore=false;':'public void close(){service.failSnapshots=false;service.throwAfterStart=false;service.throwFocusId=-1;service.failRestore=false;',
    }
    for old,new in replacements.items():
        assert old in text,"media dispatch fixture changed: "+old
        text=text.replace(old,new)
    return text

def main(mutation=None):
    sdk=ROOT/"audit-output/android-sdk/platforms/android-36/android.jar"
    json_jar=next((Path.home()/".gradle/caches/modules-2/files-2.1/org.json/json").glob("*/*/*.jar"))
    with tempfile.TemporaryDirectory(prefix="duo-media-dispatch-") as temporary:
        work=Path(temporary);data=work/"cases";data.mkdir();values=OUTPUT["sources"]()
        values["android/content/pm/PackageManager.java"]=values["android/content/pm/PackageManager.java"].replace("public class PackageManager {","public class PackageManager {public final java.util.Map<String,Integer> mediaUids=new java.util.HashMap<>();").replace("info.uid=user*100000+10055;","info.uid=user*100000+mediaUids.getOrDefault(pkg,10055);")
        values["ls/augment/com/TestAtomicWorkbenchHome.java"]=prefix()+TEST
        production=["AtomicWorkbenchPlatform.java","AtomicWorkbenchEngine.java","AtomicWorkbenchProtocol.java","AtomicWorkbenchLaunchBridge.java","AtomicWorkbenchJournal.java"]
        values,production=SUPPORT["output_support"](values,production)
        if mutation is not None:
            _,filename,old,new,_=MUTATIONS[mutation];text=(SUPPORT["SRC"]/filename).read_text(encoding="utf-8");assert old in text,"media source mutation changed"
            values["ls/augment/com/"+filename]=text.replace(old,new);production.remove(filename)
        HOME["compile_run"](work,values,production,os.pathsep.join((str(json_jar),str(sdk))),data)

if __name__=="__main__":
    if len(sys.argv)==3 and sys.argv[1]=="--mutate":main(int(sys.argv[2]))
    else:
        main()
        for index,(label,_,_,_,expected) in enumerate(MUTATIONS):
            result=subprocess.run([sys.executable,__file__,"--mutate",str(index)],capture_output=True,text=True,timeout=150,env=SUPPORT["ENV"])
            assert result.returncode!=0 and expected in result.stdout+result.stderr,"uncaught media dispatch mutation: "+label
            print("PASS rejected media dispatch negative:",label)
