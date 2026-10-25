"""Actual Platform final Launcher dispatch checks; expiry is injected between admission and dispatch."""
from pathlib import Path
import os
import runpy
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-output-runtime.py")))
HOME, SUPPORT = OUTPUT["HOME"], OUTPUT["SUPPORT"]
TEST = r'''
 static AutoCloseable expiry(String component,int[] calls)throws Exception{return AtomicWorkbenchLaunchBoundary.enter(actual->{
  check(component.equals(actual),"boundary received different actual Launcher component");calls[0]++;
  if(SystemClock.now>1500)throw new IllegalStateException("expired_launcher");SystemClock.now=1501;
 });}
 public static void main(String[] args)throws Exception{base=Path.of(args[0]);
  for(boolean recents:new boolean[]{false,true})test("initial "+(recents?"recents":"direct")+" early admission does not change any VD task or journal",()->{try(Fixture f=new Fixture()){
   Task original=new Task(77,0,0,1,"sample/sample.Main");f.service.list.add(original);Surface incoming=new Surface();int[] calls={0};
   try(AutoCloseable ignored=AtomicWorkbenchLaunchBoundary.enter(actual->{calls[0]++;throw new IllegalStateException("source_changed");})){
    Bundle denied=recents?f.platform.openTask(incoming,1080,2400,420,"sample/sample.Main",77):f.platform.open(incoming,1080,2400,420,"sample/sample.Main");
    check(!denied.getBoolean("success")&&incoming.released&&calls[0]==1&&f.context.displays.all.isEmpty()&&f.home.displayId==0&&original.displayId==0&&f.service.starts==0&&!Files.exists(f.file(0)),"initial "+(recents?"recents":"direct")+" early admission changed VD task or journal");
   }
  }});
  for(boolean recents:new boolean[]{false,true})test("initial "+(recents?"recents":"direct")+" final dispatch rechecks expiry after a real VD is prepared",()->{try(Fixture f=new Fixture()){
   Task original=new Task(77,0,0,1,"sample/sample.Main");f.service.list.add(original);int[] calls={0};Bundle denied;
   try(AutoCloseable ignored=expiry("sample/sample.Main",calls)){denied=recents?f.platform.openTask(new Surface(),1080,2400,420,"sample/sample.Main",77):f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main");}
   check(!denied.getBoolean("success")&&calls[0]==2&&f.service.starts==0&&original.displayId==0&&f.home.displayId==0,"initial "+(recents?"recents":"direct")+" escaped final expiry");
   check(!f.platform.hasLiveDisplay()&&!f.platform.hasRecoveryPending()&&f.context.displays.all.size()==1&&f.context.displays.latest.released&&!Files.exists(f.file(0)),"undispatched initial VD was not safely reconciled");
  }});
  for(boolean recents:new boolean[]{false,true})test("existing HOME "+(recents?"recents":"direct")+" rejects late expiry while preserving exact original lease and journal",()->{try(Fixture f=new Fixture()){
   success(f.show());int display=f.home.displayId;var vd=f.context.displays.latest;byte[] journal=Files.readAllBytes(f.file(0));Task original=new Task(77,0,0,1,"sample/sample.Main");f.service.list.add(original);int[] calls={0};Bundle denied;
   try(AutoCloseable ignored=expiry("sample/sample.Main",calls)){denied=f.platform.openInEmptyHome(new Surface(),1080,2400,420,"sample/sample.Main",recents?77:-1);}
   check(!denied.getBoolean("success")&&denied.getBoolean("existing_session_preserved")&&calls[0]==2&&f.service.starts==0&&original.displayId==0,"existing HOME "+(recents?"recents":"direct")+" escaped final expiry");
   check(f.home.displayId==display&&f.platform.hasLiveDisplay()&&!vd.released&&f.context.displays.all.size()==1&&f.platform.isHomeOnly()&&Arrays.equals(journal,Files.readAllBytes(f.file(0))),"late expiry changed original HOME lease or journal");
  }});
  test("existing app focus rechecks expiry after admission without selecting any task",()->{try(Fixture f=new Fixture()){
   success(f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main"));var vd=f.context.displays.latest;byte[] journal=Files.readAllBytes(f.file(0));int starts=f.service.starts,moves=f.service.encodedMoves;f.service.focused=42;int[] calls={0};Bundle denied;FakeFocusController.events.clear();
   try(AutoCloseable ignored=expiry("sample/sample.Main",calls)){denied=f.platform.focusAppWindow("sample/sample.Main");}
   check(!denied.getBoolean("success")&&calls[0]==2&&f.service.focused==42&&FakeFocusController.events.stream().noneMatch(e->e.startsWith("focus:")),"focus app escaped final expiry");
   check(f.platform.hasLiveDisplay()&&!vd.released&&f.service.starts==starts&&f.service.encodedMoves==moves&&f.home.displayId==0&&Arrays.equals(journal,Files.readAllBytes(f.file(0))),"expired focus changed VD HOME tasks or journal");
  }});
  test("native HOME preparation does not enter an app Launcher boundary",()->{try(Fixture f=new Fixture()){
   int[] calls={0};try(AutoCloseable ignored=AtomicWorkbenchLaunchBoundary.enter(actual->{calls[0]++;throw new IllegalStateException("not_app_launcher");})){success(f.show());}check(calls[0]==0,"native HOME was sent to app source admission");
  }});
  test("ordinary app dispatch without a narrow scope retains real Launcher behavior",()->{try(Fixture f=new Fixture()){
   success(f.platform.open(new Surface(),1080,2400,420,"sample/sample.Main"));check(f.service.starts==1&&f.platform.hasLiveDisplay(),"no-scope ordinary app blocked");success(f.platform.focusAppWindow("sample/sample.Main"));
  }});
  System.out.println("LAUNCH BOUNDARY RUNTIME RESULT "+tests+" cases; "+checks+" assertions");
 }
}'''

MUTATIONS = [
 ("INITIAL_FINAL_DIRECT", 'AtomicWorkbenchLaunchBoundary.require(component.flattenToString());\n                dispatched = true;\n                startResult = AtomicWorkbenchLaunchBridge.start(tasks(), intent, options.toBundle(), userId);\n            }\n            diagnostic("launch_return"', 'dispatched = true;\n                startResult = AtomicWorkbenchLaunchBridge.start(tasks(), intent, options.toBundle(), userId);\n            }\n            diagnostic("launch_return"', 'initial direct escaped final expiry'),
 ("RECENTS_FINAL_CHECK", 'AtomicWorkbenchLaunchBoundary.require(component.flattenToString());\n                dispatched = true;\n                Object started = invoke(tasks(), "startActivityFromRecents"', 'dispatched = true;\n                Object started = invoke(tasks(), "startActivityFromRecents"', 'initial recents escaped final expiry'),
 ("HOME_FINAL_DIRECT", '.setComponent(component).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);\n                AtomicWorkbenchLaunchBoundary.require(component.flattenToString());\n                dispatched = true;', '.setComponent(component).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);\n                dispatched = true;', 'existing HOME direct escaped final expiry'),
 ("FOCUS_FINAL_CHECK", 'AtomicWorkbenchLaunchBoundary.require(selected.flattenToString());\n                dispatched = true;', 'dispatched = true;', 'focus app escaped final expiry'),
 ("EARLY_ADMISSION_PRECEDES_VD", 'AtomicWorkbenchLaunchBoundary.require(component.flattenToString());\n        } catch (Exception denied)', '} catch (Exception denied)', 'initial direct early admission changed VD task or journal'),
 ("HOME_REJECT_RESTORES_TASK_EVIDENCE", 'record.tasks.clear(); record.tasks.addAll(previousTasks);', '', 'late expiry changed original HOME lease or journal'),
]

def main(mutation=None):
    sdk = ROOT / "audit-output/android-sdk/platforms/android-36/android.jar"
    json_jar = next((Path.home() / ".gradle/caches/modules-2/files-2.1/org.json/json").glob("*/*/*.jar"))
    with tempfile.TemporaryDirectory(prefix="duo-launch-boundary-") as temporary:
        work=Path(temporary); data=work/"cases"; data.mkdir(); values=OUTPUT["sources"]()
        prefix=HOME["TEST"].split(" public static void main(String[] args)",1)[0]
        prefix=prefix.replace("public ComponentName baseActivity,topActivity;","public android.content.pm.ActivityInfo topActivityInfo=new android.content.pm.ActivityInfo();public ComponentName baseActivity,topActivity;")
        values["ls/augment/com/TestAtomicWorkbenchHome.java"] = prefix+TEST
        production=["AtomicWorkbenchPlatform.java","AtomicWorkbenchEngine.java","AtomicWorkbenchProtocol.java","AtomicWorkbenchLaunchBridge.java","AtomicWorkbenchJournal.java"]
        values,production=SUPPORT["output_support"](values,production)
        if mutation is not None:
            _,old,new,_=MUTATIONS[mutation]; text=(SUPPORT["SRC"]/"AtomicWorkbenchPlatform.java").read_text(encoding="utf-8")
            assert old in text,"launch boundary mutation source changed"
            values["ls/augment/com/AtomicWorkbenchPlatform.java"]=text.replace(old,new);production.remove("AtomicWorkbenchPlatform.java")
        HOME["compile_run"](work,values,production,os.pathsep.join((str(json_jar),str(sdk))),data)

if __name__=="__main__":
    if len(sys.argv)==3 and sys.argv[1]=="--mutate":main(int(sys.argv[2]))
    else:
        main()
        for index,(label,_,_,expected) in enumerate(MUTATIONS):
            result=subprocess.run([sys.executable,__file__,"--mutate",str(index)],capture_output=True,text=True,timeout=150,env=SUPPORT["ENV"])
            assert result.returncode!=0 and expected in result.stdout+result.stderr,"uncaught final Launcher mutation: "+label
            print("PASS rejected Launcher boundary negative:",label)
