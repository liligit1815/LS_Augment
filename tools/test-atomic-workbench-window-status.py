"""Execute the Activity's real window-status method with controlled UI boundaries."""
from pathlib import Path
import runpy
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))
SUPPORT, SRC, member = BASE["SUPPORT"], BASE["SRC"], BASE["member"]

HEAD = r'''package ls.augment.com;
import android.os.Bundle;import java.util.ArrayList;
public final class TestWindowStatus {
 final AtomicWorkbenchWorkspaceModel model=new AtomicWorkbenchWorkspaceModel();
 final Slot[] slots={new Slot()};boolean recoveryPending;int cancelled;
 static class PendingTask {int sourceSlot;PendingTask(int id){sourceSlot=id;}}
 PendingTask pendingTaskOperation;
 static final class Surface {
  final Holder holder=new Holder();Holder getHolder(){return holder;}
 }
 static final class Holder {int changes;void setFixedSize(int width,int height){changes++;}}
 static final class Slot {
  boolean nativeHome,wasActive,ready,retainedEmptyTaskDisplay;int homeTaskId=-1,displayId=88,displayWidth=1216,displayHeight=2688;
  long homeReadinessGenerationNanos=-1,homeReadinessRequestNanos=-1;
  String displayUniqueId="",topComponent="",message="",displayName="",windowSession="";int targetUid=-1,targetTaskId=-1;
  final ArrayList<String> runningPackages=new ArrayList<>();final Surface surface=new Surface();
  void fitSurface(){}
 }
 void cancelGesture(){cancelled++;}
 void showStatus(String value){}
'''

TEST = r'''
 static int cases,checks;
 static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static void test(String name,Runnable run){run.run();cases++;System.out.println("PASS Activity window status: "+name);}
 static Bundle active(Integer policy){Bundle b=new Bundle();b.putBoolean("success",true);b.putString("state","active");
  b.putInt("display_id",88);b.putInt("task_count",1);b.putString("message","keyboard route unavailable");
  if(policy!=null)b.putInt("ime_policy",policy);return b;
 }
 public static void main(String[] args){
  test("detached unknown or transitioning output cannot enable an otherwise ready window",()->{
   for(String key:new String[]{"output_attached","output_attached_known","output_transition_pending"}){
    TestWindowStatus f=new TestWindowStatus();f.applyWindowStatus(0,active(1));Bundle pending=active(1);
    pending.putBoolean(key,key.equals("output_transition_pending"));f.applyWindowStatus(0,pending);
    check(!f.slots[0].ready&&f.cancelled==1&&f.model.hasWindow(0),"output gap admitted input or discarded display: "+key);
    f.applyWindowStatus(0,active(1));check(f.slots[0].ready,"confirmed output could not regain readiness");
   }
  });
  test("delivery identity follows fresh status and missing fields cannot reuse an old recipient",()->{
   TestWindowStatus f=new TestWindowStatus();Bundle good=active(1);good.putString("display_name","DuoAtomic-test");
   good.putString("display_unique_id","unique-one");good.putInt("target_uid",13001);good.putInt("task_id",41);
   f.applyWindowStatus(0,good);check(f.slots[0].targetUid==13001&&f.slots[0].targetTaskId==41&&f.slots[0].displayName.equals("DuoAtomic-test"),"fresh recipient lost");
   Bundle missing=active(1);f.applyWindowStatus(0,missing);
   check(f.slots[0].targetUid==-1&&f.slots[0].targetTaskId==-1&&f.slots[0].displayName.isEmpty(),"missing recipient reused stale task/UID");
   check(f.slots[0].ready&&f.slots[0].displayId==88&&f.slots[0].displayUniqueId.equals("unique-one"),"unknown recipient erased ordinary display ownership");
   Bundle malformed=active(1);malformed.putString("target_uid","13001");malformed.putString("task_id","41");f.applyWindowStatus(0,malformed);
   check(f.slots[0].targetUid==-1&&f.slots[0].targetTaskId==-1,"typed recipient metadata coerced strings");
  });
  test("phone-display IME enables the actual Activity input gate",()->{
   TestWindowStatus f=new TestWindowStatus();f.applyWindowStatus(0,active(1));
   check(f.slots[0].ready&&f.slots[0].wasActive,"fallback keyboard policy did not enable window input");
   check(f.cancelled==0&&f.slots[0].message.isEmpty(),"ready window cancelled its stream or retained error");
   f.applyWindowStatus(0,active(1));check(f.cancelled==0,"unchanged ready status cancelled input");
  });
  for(Integer policy:new Integer[]{0,-1,null})test("local unknown or missing IME policy stays unready: "+policy,()->{
   TestWindowStatus f=new TestWindowStatus();f.applyWindowStatus(0,active(policy));
   check(!f.slots[0].ready,"unverified keyboard route enabled window input: "+policy);
   check(f.cancelled==0,"already-unready status cancelled unrelated input");
   check(f.slots[0].message.equals("keyboard route unavailable"),"unready window hid its reported status");
  });
  for(Integer policy:new Integer[]{0,-1,null})test("ready-to-unready IME transition cancels one stream: "+policy,()->{
   TestWindowStatus f=new TestWindowStatus();f.applyWindowStatus(0,active(1));f.applyWindowStatus(0,active(policy));
   check(!f.slots[0].ready&&f.cancelled==1,"IME readiness loss did not cancel the active gesture: "+policy);
   f.applyWindowStatus(0,active(policy));check(f.cancelled==1,"unchanged failure repeatedly cancelled input");
   f.applyWindowStatus(0,active(1));check(f.slots[0].ready&&f.cancelled==1,"fresh verified route did not restore readiness");
  });
  test("phone keyboard policy cannot bypass task and active-state requirements",()->{
   for(String gate:new String[]{"success","state","display","tasks"}){
    TestWindowStatus f=new TestWindowStatus();Bundle b=active(1);
    if(gate.equals("success"))b.putBoolean("success",false);
    else if(gate.equals("state"))b.putString("state","launching");
    else if(gate.equals("display"))b.putInt("display_id",-1);
    else b.putInt("task_count",0);
    f.applyWindowStatus(0,b);check(!f.slots[0].ready,"keyboard policy bypassed "+gate+" gate");
   }
  });
  test("an exited explicit app retires its binding while the borrowed HOME stays owned",()->{
   TestWindowStatus f=new TestWindowStatus();
   AtomicWorkbenchWorkspaceModel.LaunchPlan launch=f.model.planLaunch("example.a/.Main");
   check(f.model.commitLaunch(launch),"app reservation failed");
   Bundle b=active(1);b.putBoolean("home_only",false);b.putBoolean("native_home",false);b.putInt("home_task_id",41);b.putInt("task_count",2);
   b.putStringArrayList("running_packages",new ArrayList<>(java.util.List.of("example.a")));
   f.applyWindowStatus(0,b);AtomicWorkbenchWorkspaceModel.LaunchPlan old=f.model.planLaunch("example.a/.Alias");
   b.putBoolean("native_home",true);b.putInt("task_count",1);b.putStringArrayList("running_packages",new ArrayList<>());
   f.applyWindowStatus(0,b);
   check(f.model.find("example.a/.Main")==-1&&f.model.component(0)==null,"finished app retained its launcher binding");
   check(f.model.hasWindow(0)&&f.slots[0].displayId==88&&f.slots[0].ready,"HOME lost its live display/input ownership");
   check(!f.model.commitLaunch(old),"old focus completion survived task removal");
   AtomicWorkbenchWorkspaceModel.LaunchPlan reopen=f.model.planLaunch("example.a/.Main");
   check(reopen.accepted()&&!reopen.existing&&reopen.replacesEmptyHome&&reopen.windowId==0,"finished app cannot reopen in the confirmed HOME slot");
  });
  test("launch and failed snapshots cannot erase a binding or real package observations",()->{
   for(String reason:new String[]{"prepared","launching","failed","recovering","missing_packages","missing_display","missing_tasks"}){
    TestWindowStatus f=new TestWindowStatus();f.model.commitLaunch(f.model.planLaunch("example.a/.Main"));
    Bundle good=active(1);good.putBoolean("home_only",false);good.putStringArrayList("running_packages",new ArrayList<>(java.util.List.of("example.a")));
    f.applyWindowStatus(0,good);
    Bundle invalid=active(1);invalid.putStringArrayList("running_packages",new ArrayList<>());
    if(reason.equals("prepared")||reason.equals("launching"))invalid.putString("state",reason);
    else if(reason.equals("failed"))invalid.putBoolean("success",false);
    else if(reason.equals("recovering"))invalid.putBoolean("recovery_pending",true);
    else if(reason.equals("missing_packages"))invalid.putStringArrayList("running_packages",null);
    else if(reason.equals("missing_display")){invalid=new Bundle();invalid.putBoolean("success",true);invalid.putString("state","active");invalid.putInt("task_count",1);invalid.putStringArrayList("running_packages",new ArrayList<>());}
    else {invalid=new Bundle();invalid.putBoolean("success",true);invalid.putString("state","active");invalid.putInt("display_id",88);invalid.putStringArrayList("running_packages",new ArrayList<>());}
    f.applyWindowStatus(0,invalid);
    check("example.a/.Main".equals(f.model.component(0))&&f.model.find("example.a/.Main")==0,"invalid snapshot retired binding: "+reason);
    check(f.slots[0].runningPackages.equals(java.util.List.of("example.a")),"invalid snapshot erased observed tasks: "+reason);
    check(f.slots[0].displayId==88&&f.model.hasWindow(0),"incomplete reply erased display lease: "+reason);
   }
  });
  test("a different remaining application keeps the original display occupied",()->{
   TestWindowStatus f=new TestWindowStatus();f.model.commitLaunch(f.model.planLaunch("example.a/.Main"));
   Bundle b=active(1);b.putBoolean("home_only",false);b.putBoolean("native_home",false);b.putInt("home_task_id",41);b.putInt("task_count",2);
   b.putStringArrayList("running_packages",new ArrayList<>(java.util.List.of("example.b")));f.applyWindowStatus(0,b);
   check(f.model.component(0)==null&&f.model.find("example.a/.Main")==-1&&f.model.find("example.b/.Alias")==0,"running replacement app identity lost");
   AtomicWorkbenchWorkspaceModel.LaunchPlan next=f.model.planLaunch("example.c/.Main");
   check(f.model.hasWindow(0)&&next.windowId!=0&&!next.replacesEmptyHome,"remaining app incorrectly treated as empty HOME");
  });
  test("HOME-only task evidence survives foreground lag and incomplete mutation replies",()->{
   TestWindowStatus f=new TestWindowStatus();f.model.commitLaunch(f.model.planLaunch("example.a/.Main"));
   Bundle home=active(1);home.putBoolean("home_only",false);home.putBoolean("native_home",false);home.putInt("home_task_id",41);
   home.putStringArrayList("running_packages",new ArrayList<>());f.applyWindowStatus(0,home);
   AtomicWorkbenchWorkspaceModel.LaunchPlan before=f.model.planLaunch("example.a/.Main");
   check(before.replacesEmptyHome&&before.windowId==0,"HOME foreground animation forced another slot allocation");
   Bundle partial=new Bundle();partial.putBoolean("success",false);partial.putBoolean("home_only",false);partial.putInt("display_id",88);
   f.applyWindowStatus(0,partial);AtomicWorkbenchWorkspaceModel.LaunchPlan after=f.model.planLaunch("example.a/.Main");
   check(after.replacesEmptyHome&&after.windowId==0&&f.model.hasWindow(0),"failed mutation revoked the last successful HOME-only task snapshot");
  });
  test("exited task-count lag cannot divert an immediate reopen away from its HOME lease",()->{
   TestWindowStatus f=new TestWindowStatus();f.model.commitLaunch(f.model.planLaunch("example.a/.Main"));
   Bundle b=active(1);b.putInt("home_task_id",41);b.putInt("task_count",2);
   b.putStringArrayList("running_packages",new ArrayList<>());f.applyWindowStatus(0,b);
   AtomicWorkbenchWorkspaceModel.LaunchPlan reopen=f.model.planLaunch("example.a/.Main");
   check(f.model.component(0)==null&&reopen.replacesEmptyHome&&reopen.windowId==0,"ghost exiting root diverted reopen to another display");
   b.putStringArrayList("running_packages",new ArrayList<>(java.util.List.of("example.b")));f.applyWindowStatus(0,b);
   AtomicWorkbenchWorkspaceModel.LaunchPlan racing=f.model.planLaunch("example.a/.Main");
   check(!racing.replacesEmptyHome&&racing.windowId!=0,"real racing application was marked empty");
   b.putInt("home_task_id",-1);b.putStringArrayList("running_packages",new ArrayList<>());f.applyWindowStatus(0,b);
   check(!f.model.planLaunch("example.a/.Main").replacesEmptyHome,"display without an authenticated HOME became a replacement candidate");
  });
  test("intentional empty receiver keeps VD without claiming HOME or input readiness",()->{
   TestWindowStatus f=new TestWindowStatus();f.model.setHostedWindow(0,true);f.slots[0].wasActive=true;
   Bundle b=active(1);b.putInt("task_count",0);b.putInt("home_task_id",-1);b.putStringArrayList("running_packages",new ArrayList<>());
   b.putBoolean("retained_empty_task_display",true);b.putString("window_session","11111111-1111-1111-1111-111111111111");f.applyWindowStatus(0,b);
   check(f.slots[0].retainedEmptyTaskDisplay&&!f.slots[0].ready&&f.model.hasWindow(0),"empty task display lost lease or gained input");
   check(!f.model.planLaunch("example.a/.Main").replacesEmptyHome,"empty display forged HOME");check(!f.shouldCloseExitedWindow(0,b),"intentional empty display auto-closed");
   b.putBoolean("retained_empty_task_display",false);check(f.shouldCloseExitedWindow(0,b),"natural exit no longer closes");
   f.pendingTaskOperation=new PendingTask(0);check(!f.shouldCloseExitedWindow(0,b),"unconfirmed source auto-closed");f.pendingTaskOperation=new PendingTask(1);check(f.shouldCloseExitedWindow(0,b),"unrelated task mutation kept ordinary exited VD");
   b.putBoolean("operation_unconfirmed",true);check(!f.shouldCloseExitedWindow(0,b),"unknown observation auto-closed");
   b.putBoolean("operation_unconfirmed",false);b.putInt("task_count",1);b.putBoolean("retained_empty_task_display",true);f.applyWindowStatus(0,b);check(!f.slots[0].retainedEmptyTaskDisplay,"occupied display retained empty affordance");
  });
  System.out.println("ACTIVITY WINDOW STATUS RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    activity = (SRC / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
    bundle = SUPPORT["BUNDLE"]
    if "containsKey(" not in bundle:
        bundle = bundle.rsplit("}", 1)[0] + "public boolean containsKey(String key){return data.containsKey(key);}}"
    sources = {
        "android/os/Bundle.java": bundle,
        "android/content/ComponentName.java": SUPPORT["migration_sources"]()["android/content/ComponentName.java"],
        "ls/augment/com/TestWindowStatus.java": HEAD + member(activity, "private void applyWindowStatus(int id, Bundle result)") + member(activity, "private boolean shouldCloseExitedWindow(int id, Bundle window)") + TEST,
    }
    with tempfile.TemporaryDirectory(prefix="lsa-window-status-") as directory:
        SUPPORT["compile_run"](Path(directory), sources,
                               ["AtomicWorkbenchProtocol.java", "AtomicWorkbenchWorkspaceModel.java"],
                               "ls.augment.com.TestWindowStatus")


if __name__ == "__main__":
    main()
