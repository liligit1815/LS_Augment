"""Execute real Activity Dialog focus queues with controlled worker/UI ordering."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))
SUPPORT = BASE["SUPPORT"]
SOURCE = BASE["SRC"] / "AtomicWorkbenchActivity.java"
HEAD = r'''package ls.augment.com;import android.os.Bundle;import java.util.*;
final class ResetWriteFence {static boolean staleValue;static boolean stale(long generation){return staleValue;}}
final class AtomicWorkbenchClient {
 final List<Integer> calls=new ArrayList<>();int clears;boolean fail,throwsError;int activeWindow;
 void clearGestureTarget(){clears++;}
 Bundle focusHostInput()throws Exception{return focusWindow(-1);}
 Bundle focusWindow(int target)throws Exception{calls.add(target);if(throwsError)throw new Exception("fixed");
  Bundle b=new Bundle();b.putBoolean("success",!fail);b.putString("message","fixed");if(!fail)activeWindow=target;return b;}
}
public final class TestHostFocus {
 static final class Queue {final List<Runnable> jobs=new ArrayList<>();void execute(Runnable r){jobs.add(r);}void post(Runnable r){jobs.add(r);}
  void one(){if(jobs.isEmpty())throw new AssertionError("empty queue");jobs.remove(0).run();}void all(){while(!jobs.isEmpty())one();}}
 static final class Model {int main;boolean desktop;int mainWindowId(){return main;}boolean desktopVisible(){return desktop;}}
 static final class Slot {String displayUniqueId="virtual-unique";}
 final Queue WORKER=new Queue(),main=new Queue();final Model model=new Model();final Slot[] slots={new Slot(),new Slot()};
 AtomicWorkbenchClient client=new AtomicWorkbenchClient();
 final AtomicWorkbenchWindowPresentationPolicy presentationPolicy=new AtomicWorkbenchWindowPresentationPolicy();
 AtomicWorkbenchWindowPresentationPolicy.Receipt pendingPresentationFocus;
 boolean hostDialogActive,hostDragActive,textDeliveryActive,active=true,destroyed,closing,surfaceUnavailable,busy,outputsSyncing,outputsParked;
 int epoch=1,hostInputPending,focusedWindow,gestures,polls,published;long sessionGeneration=1,hostInputSequence,launchGeneration=7;
 String status;boolean recoveryPending;
 void cancelGesture(){gestures++;}void schedulePoll(){polls++;}void publishGestureTarget(){published++;}void showStatus(String value){status=value;}
 void invalidateExtractionGeometry(){}
 static Bundle failure(String message){Bundle b=new Bundle();b.putBoolean("success",false);b.putString("message",message);return b;}
'''
TEST = r'''
 static int cases,checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static void test(String name,Runnable action){ResetWriteFence.staleValue=false;action.run();cases++;System.out.println("PASS actual host focus queue: "+name);}
 public static void main(String[] args){
  test("a parked or reconnecting output blocks old Dialog focus commands",()->{for(boolean parked:new boolean[]{false,true}){TestHostFocus f=new TestHostFocus();f.onHostDialogInput(true);
   f.outputsParked=parked;f.outputsSyncing=!parked;f.WORKER.all();f.main.all();check(f.client.calls.isEmpty()&&f.hostInputPending==0,"output transition leaked queued host focus");
   f.outputsParked=f.outputsSyncing=false;f.queueHostInput(true);f.WORKER.all();f.main.all();check(f.client.calls.equals(List.of(-1)),"restored output lost Dialog focus");}});
  test("fast open-close preserves enter then restore even before either worker runs",()->{TestHostFocus f=new TestHostFocus();f.onHostDialogInput(true);f.onHostDialogInput(false);
   check(f.hostInputPending==2&&!f.hostDialogActive&&f.gestures==2,"observer lost queued ownership");f.WORKER.all();
   check(f.client.calls.equals(List.of(-1,0)),"fast close collapsed real focus-loss half");
   f.main.one();check(f.focusedWindow==0&&f.hostInputPending==1,"late enter acknowledgement replaced newer restore");
   f.main.all();check(f.focusedWindow==0&&f.hostInputPending==0,"final restore never admitted input");});
  test("old enter cannot steal an active native drag and end can restore host later",()->{TestHostFocus f=new TestHostFocus();f.onHostDialogInput(true);f.hostDragActive=true;f.WORKER.all();f.main.all();
   check(f.client.calls.isEmpty()&&f.hostInputPending==0&&f.hostDialogActive,"late enter stole drag");
   f.hostDragActive=false;f.queueHostInput(true);f.WORKER.all();f.main.all();check(f.client.calls.equals(List.of(-1))&&f.focusedWindow==-1,"drag end lost host focus responsibility");});
  test("mixed payload close cannot run an old leave over the temporary side editor",()->{TestHostFocus f=new TestHostFocus();f.onHostDialogInput(true);f.WORKER.all();f.main.all();f.client.calls.clear();
   f.onHostDialogInput(false);f.textDeliveryActive=true;f.busy=true;f.client.activeWindow=1;f.WORKER.all();f.main.all();
   check(f.client.calls.isEmpty()&&f.client.activeWindow==1&&f.hostInputPending==0,"late leave stole paste lease");
   f.textDeliveryActive=false;f.busy=false;f.queueHostInput(false);f.WORKER.all();f.main.all();check(f.client.calls.equals(List.of(0))&&f.focusedWindow==0,"delivery completion lost restore");});
  test("old enter also yields while a precise edit already owns the target",()->{TestHostFocus f=new TestHostFocus();f.onHostDialogInput(true);f.textDeliveryActive=true;f.client.activeWindow=1;f.WORKER.all();f.main.all();
   check(f.client.calls.isEmpty()&&f.client.activeWindow==1,"queued open stole editor");});
  test("busy close defers its leave without losing the already queued enter",()->{TestHostFocus f=new TestHostFocus();f.onHostDialogInput(true);f.busy=true;f.onHostDialogInput(false);
   check(f.hostInputPending==1,"busy close queued a stale main restore");f.WORKER.all();f.main.all();check(f.client.calls.equals(List.of(-1)),"busy close skipped focus-loss half");
   f.busy=false;f.queueHostInput(false);f.WORKER.all();f.main.all();check(f.client.calls.equals(List.of(-1,0)),"idle restoration lost");});
  test("new user epoch prevents an old leave from refocusing its former main",()->{TestHostFocus f=new TestHostFocus();f.hostDialogActive=true;f.onHostDialogInput(false);f.epoch++;f.model.main=1;f.client.activeWindow=1;
   f.WORKER.all();f.main.all();check(f.client.calls.isEmpty()&&f.client.activeWindow==1&&f.hostInputPending==0,"old leave overwrote new user target");});
  test("an enter queued before a newer action still supplies the real loss before that action",()->{TestHostFocus f=new TestHostFocus();f.onHostDialogInput(true);f.epoch++;f.model.main=1;f.hostDialogActive=false;
   f.WORKER.execute(()->{try{f.client.focusWindow(1);}catch(Exception e){throw new AssertionError(e);}});f.WORKER.all();f.main.all();
   check(f.client.calls.equals(List.of(-1,1))&&f.client.activeWindow==1,"new epoch collapsed required enter or changed action order");});
  test("replaced client or session cannot receive an old queued focus",()->{for(boolean replace:new boolean[]{false,true}){TestHostFocus f=new TestHostFocus();AtomicWorkbenchClient old=f.client;f.onHostDialogInput(true);
   if(replace)f.client=new AtomicWorkbenchClient();else f.sessionGeneration++;f.WORKER.all();f.main.all();check(old.calls.isEmpty()&&f.client.calls.isEmpty()&&f.hostInputPending==0,"stale session touched a root");}});
  test("stopped or reset session cannot receive queued focus",()->{for(boolean reset:new boolean[]{false,true}){TestHostFocus f=new TestHostFocus();f.onHostDialogInput(true);if(reset)ResetWriteFence.staleValue=true;else f.active=false;
   f.WORKER.all();f.main.all();check(f.client.calls.isEmpty()&&f.hostInputPending==0,"stopped/reset session focused");ResetWriteFence.staleValue=false;}});
  test("failed focus retains tasks and reports input unconfirmed without global recovery",()->{for(boolean throwsError:new boolean[]{false,true}){TestHostFocus f=new TestHostFocus();f.client.fail=!throwsError;f.client.throwsError=throwsError;
   f.onHostDialogInput(true);f.WORKER.all();f.main.all();check(f.focusedWindow==-2&&f.hostInputPending==0&&f.status!=null&&!f.recoveryPending,"failed host focus admitted input or started global restore");}});
  test("inactive observer records Dialog depth without starting a root",()->{TestHostFocus f=new TestHostFocus();f.active=false;f.client=null;f.onHostDialogInput(true);
   check(f.hostDialogActive&&f.hostInputPending==0&&f.WORKER.jobs.isEmpty()&&f.gestures==1,"inactive Dialog allocated or focused root");});
  System.out.println("HOST FOCUS RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def run(source, label):
    methods = "\n".join(BASE["member"](source, name) for name in ("private void onHostDialogInput(", "private void queueHostInput("))
    with tempfile.TemporaryDirectory(prefix="duo-host-focus-") as temporary:
        work = Path(temporary)
        files = {"android/os/Bundle.java": SUPPORT["BUNDLE"], "ls/augment/com/TestHostFocus.java": HEAD + methods + TEST}
        paths = []
        for name, value in files.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value, encoding="utf-8")
            paths.append(str(path))
        paths.extend(str(BASE["SRC"] / name) for name in ("AtomicWorkbenchWindowPresentationPolicy.java", "AtomicWorkbenchWindowLayoutPlan.java",
                "AtomicWorkbenchPoolTopology.java", "AtomicWorkbenchCapacityLayoutPlan.java", "AtomicWorkbenchSlotDomain.java"))
        compiled = subprocess.run([SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-d", str(work), *paths],
                                  env=SUPPORT["ENV"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=45)
        if compiled.returncode:
            raise AssertionError(compiled.stderr)
        result = subprocess.run([SUPPORT["JAVA"], "-cp", str(work), "ls.augment.com.TestHostFocus"],
                                env=SUPPORT["ENV"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=20)
        if label == "production":
            print(result.stdout, end="")
            if result.returncode:
                raise AssertionError(result.stderr)
        elif result.returncode == 0:
            raise AssertionError("negative control escaped: " + label)
        else:
            print("PASS rejected negative control: " + label)


if __name__ == "__main__":
    source = SOURCE.read_text(encoding="utf-8")
    run(source, "production")
    for old, new, label in (
        ("hostDragActive || textDeliveryActive", "false", "steal native drag and side editor"),
        ("request != epoch", "false", "late leave overrides newer user epoch"),
        ("if (!current || hostDragActive", "if (!current || enter && !hostDialogActive || hostDragActive", "fast open-close collapsed"),
        ("connected == client", "true", "old client receives queued focus"),
        ("sequence == hostInputSequence", "true", "late enter acknowledgement overwrites restore"),
        ("hostInputPending - 1", "hostInputPending", "focus queue ownership never released"),
    ):
        if old not in source:
            raise AssertionError("negative boundary changed: " + label)
        run(source.replace(old, new), label)
