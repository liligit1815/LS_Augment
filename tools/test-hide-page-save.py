"""Run the production hide-page save method across separate list/settings outcomes.

Deterministic queues isolate each asynchronous phase; persistence and widgets are
in-memory boundary fixtures. No phone, Root command, or real config is accessed.
"""
from pathlib import Path
import argparse
import importlib.util
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com"
spec = importlib.util.spec_from_file_location(
    "hide_save_extract", ROOT / "tools/test-hide-automation-scope.py")
extract = importlib.util.module_from_spec(spec)
spec.loader.exec_module(extract)

FIXTURE = r'''
package ls.augment.com;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;

class Queue {
 final ArrayDeque<Runnable> tasks=new ArrayDeque<>();
 void execute(Runnable task){tasks.addLast(task);} void post(Runnable task){tasks.addLast(task);}
 void runNext(){TestHidePageSave.check(!tasks.isEmpty(),"Expected a pending phase");tasks.removeFirst().run();}
}
class Switch {boolean checked=true;boolean isChecked(){return checked;}}
class EditText {String value;EditText(String value){this.value=value;}String getText(){return value;}}
class Toast {
 static final int LENGTH_LONG=1;static final List<String> messages=new ArrayList<>();
 static Toast makeText(Object context,String message,int duration){messages.add(message);return new Toast();}
 void show(){}
}
class AppConfig {
 static final String HIDE_MASTER="master",AUTOMATION_ENABLED="automatic",AUTOMATION_SCOPE="scope",
  TILE_ENABLED="tile",TILE_LABEL="label",TILE_DESCRIPTION="description",HIDE_TARGETS="targets";
 final ArrayDeque<Boolean> results=new ArrayDeque<>();
 final List<Map<String,String>> requests=new ArrayList<>();final Map<String,String> stored=new LinkedHashMap<>();
 SaveResult save(Map<String,String> values){
  TestHidePageSave.locked();requests.add(new LinkedHashMap<>(values));
  boolean success=results.isEmpty()||results.removeFirst();if(success)stored.putAll(values);
  return new SaveResult(success,success?"settings saved":"fixture settings failed");
 }
 static class SaveResult {final boolean success;final String message;
  SaveResult(boolean success,String message){this.success=success;this.message=message;}}
}
class ScreenAutomation {
 static int syncs;static void sync(Object context){TestHidePageSave.locked();syncs++;}
}
class RootHideManager {
 static final ReentrantLock ACTION_LOCK=new ReentrantLock();
 final List<Long> expectedRevisions=new ArrayList<>();
 final List<Set<Target>> requests=new ArrayList<>();final Set<Target> stored=new LinkedHashSet<>();
 long revision=10;boolean failTargets;
 OperationResult saveTargets(Set<Target> targets,Map<String,String> settings,long expectedRevision){
  TestHidePageSave.locked();expectedRevisions.add(expectedRevision);requests.add(new LinkedHashSet<>(targets));
  if(failTargets||expectedRevision!=revision)return OperationResult.failure("fixture list failed");
  stored.clear();stored.addAll(targets);revision++;
  // A durable list commit does not imply that the other settings were saved.
  return OperationResult.success("list committed; settings require verification");
 }
 long targetRevision(){TestHidePageSave.locked();return revision;}
 ROOT_MEMBERS
}
class HideAppsActivity {
 final Queue executor=new Queue(),main=new Queue();final AppConfig config=new AppConfig();
 final RootHideManager manager=new RootHideManager();
 final Set<RootHideManager.Target> selected=new LinkedHashSet<>(),savedTargets=new LinkedHashSet<>();
 final Switch master=new Switch(),automationEnabled=new Switch(),automationAllUsers=new Switch(),tileEnabled=new Switch();
 final EditText tileLabel=new EditText("first label"),tileDescription=new EditText("first description");
 boolean saving,dirty=true,selectionReady=true,selectionLoading,saveFailed;
 long selectionRevision=10,editGeneration=1;Runnable leaveAction,failedLeave;
 int leaves,failurePrompts,renders,stateRefreshes;
 AUTO_SAVE
 boolean isFinishing(){return false;}boolean isDestroyed(){return false;}
 void updateSaveStatus(){}void updateActionButtons(){}void renderApps(){renders++;}
 void refreshAppStates(){stateRefreshes++;}
 void showSaveFailure(Runnable leave){failurePrompts++;failedLeave=leave;}
 void save(){saveSettings();}
 void requestLeave(){leaveAction=()->leaves++;saveSettings();}
 void completeOneSave(){executor.runNext();main.runNext();}
 SAVE_METHOD
}
public class TestHidePageSave {
 static int passed;
 static final RootHideManager.Target OLD=new RootHideManager.Target(0,100,"org.example.old"),
  NEW=new RootHideManager.Target(10,200,"org.example.new"),
  LATER=new RootHideManager.Target(999,300,"org.example.later");
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 static void locked(){check(RootHideManager.ACTION_LOCK.isHeldByCurrentThread(),"Persistence escaped the action lock");}
 static void test(String name,Runnable test){ScreenAutomation.syncs=0;Toast.messages.clear();test.run();passed++;System.out.println("PASS "+name);}
 static HideAppsActivity changed(){
  HideAppsActivity activity=new HideAppsActivity();activity.savedTargets.add(OLD);activity.manager.stored.add(OLD);
  activity.selected.addAll(Arrays.asList(OLD,NEW));return activity;
 }
 static void committed(HideAppsActivity activity,Set<RootHideManager.Target> expected,long revision){
  check(activity.savedTargets.equals(expected)&&activity.manager.stored.equals(expected),"Durable selection and page baseline diverged");
  check(activity.selectionRevision==revision&&activity.manager.revision==revision,"Committed revision was lost");
 }
 static void pendingFailure(HideAppsActivity activity){
  check(activity.dirty&&activity.saveFailed&&!activity.saving,"Failed settings did not remain pending");
  check(activity.leaves==0&&activity.failurePrompts==1&&activity.failedLeave!=null,"Failed save allowed navigation or lost failure handling");
  check(activity.main.tasks.isEmpty()&&activity.executor.tasks.isEmpty(),"Failure triggered an automatic retry loop");
  check(ScreenAutomation.syncs==0,"Incomplete settings were published to automation");
  check(!RootHideManager.ACTION_LOCK.isLocked(),"Save completion leaked the action lock");
 }
 public static void main(String[] args){
  test("list commit survives settings failure without discarding pending edits or leaving",()->{
   var a=changed();a.config.results.add(false);a.requestLeave();
   check(a.saving&&!a.saveFailed&&a.manager.requests.isEmpty(),"Save was not scheduled asynchronously");
   a.completeOneSave();committed(a,Set.of(OLD,NEW),11);pendingFailure(a);
   check(a.manager.expectedRevisions.equals(List.of(10L)),"First list commit used the wrong revision");
   check(a.config.requests.size()==1&&HideTargetCodec.parse(a.config.requests.get(0).get(AppConfig.HIDE_TARGETS)).valid,
    "Settings verification omitted the authoritative selection");
   check(Toast.messages.stream().anyMatch(s->s.contains("设置未保存")),"Partial save did not explain the settings failure");
  });
  test("retry saves settings only and exits after success without reusing the old list revision",()->{
   var a=changed();a.config.results.add(false);a.requestLeave();a.completeOneSave();pendingFailure(a);
   a.config.results.add(true);a.requestLeave();a.completeOneSave();
   committed(a,Set.of(OLD,NEW),11);
   check(a.manager.requests.size()==1&&a.manager.expectedRevisions.equals(List.of(10L)),"Retry resubmitted an already committed list with a stale revision");
   check(a.config.requests.size()==2&&!a.dirty&&!a.saveFailed&&!a.saving,"Settings-only retry did not settle");
   check(a.leaves==1&&a.leaveAction==null&&ScreenAutomation.syncs==1,"Successful retry did not publish settings and complete navigation exactly once");
  });
  test("list failure preserves the previously saved baseline and revision",()->{
   var a=changed();a.manager.failTargets=true;a.requestLeave();a.completeOneSave();
   committed(a,Set.of(OLD),10);pendingFailure(a);
   check(a.selected.equals(Set.of(OLD,NEW)),"List failure discarded the current draft");
   check(a.config.requests.isEmpty(),"Failed list commit wrote settings for an uncommitted selection");
   a.manager.failTargets=false;a.requestLeave();a.completeOneSave();committed(a,Set.of(OLD,NEW),11);
   check(a.manager.expectedRevisions.equals(List.of(10L,10L))&&a.leaves==1,"List retry did not use the unchanged authoritative revision");
  });
  test("new settings edit during a save stays dirty and navigation waits for the next success",()->{
   var a=changed();a.requestLeave();a.tileLabel.value="newer label";a.editGeneration++;
   a.completeOneSave();committed(a,Set.of(OLD,NEW),11);
   check(a.dirty&&!a.saveFailed&&!a.saving&&a.leaves==0&&a.leaveAction!=null,"In-flight edit was marked saved or allowed navigation");
   check("first label".equals(a.config.stored.get(AppConfig.TILE_LABEL)),"Worker did not use the confirmed settings snapshot");
   check(a.main.tasks.size()==1,"Pending edit was not queued for a following save");
   a.main.runNext();a.completeOneSave();
   check(a.manager.requests.size()==1&&a.config.requests.size()==2,"Follow-up settings save redundantly recommitted the list");
   check("newer label".equals(a.config.stored.get(AppConfig.TILE_LABEL))&&!a.dirty&&a.leaves==1&&a.leaveAction==null,
    "Following save did not preserve the newer edit before leaving");
  });
  test("new target edit during a save uses the newly committed revision on the following save",()->{
   var a=changed();a.requestLeave();a.selected.add(LATER);a.editGeneration++;
   a.completeOneSave();committed(a,Set.of(OLD,NEW),11);
   check(a.selected.contains(LATER)&&a.dirty&&a.leaves==0,"First completion erased or prematurely acknowledged the newer target");
   a.main.runNext();a.completeOneSave();committed(a,Set.of(OLD,NEW,LATER),12);
   check(a.manager.expectedRevisions.equals(List.of(10L,11L)),"Follow-up list commit reused the earlier revision");
   check(!a.dirty&&!a.saveFailed&&a.leaves==1,"Navigation did not wait for the final list and settings");
  });
  test("a repeated save request while saving does not create a second transaction",()->{
   var a=changed();a.save();a.save();check(a.executor.tasks.size()==1,"Concurrent save request created duplicate work");
   a.completeOneSave();committed(a,Set.of(OLD,NEW),11);
   check(a.manager.requests.size()==1&&a.config.requests.size()==1&&!a.dirty&&!a.saving,"Single transaction did not complete normally");
  });
  System.out.println("Hide page save: "+passed+" production-method cases passed; offline fixtures, no phone writes");
 }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--activity-source", type=Path, default=SOURCE / "HideAppsActivity.java")
    args = parser.parse_args()
    activity = args.activity_source.read_text(encoding="utf-8-sig")
    manager = (SOURCE / "RootHideManager.java").read_text(encoding="utf-8-sig")
    java = (FIXTURE.replace("SAVE_METHOD", extract.member(activity, "    private void saveSettings()"))
            .replace("AUTO_SAVE", extract.member(activity, "    private final Runnable autoSave =") + ";")
            .replace("ROOT_MEMBERS", "\n".join(extract.member(manager, signature) for signature in (
                "    static final class Target extends", "    static final class OperationResult {"))))
    with tempfile.TemporaryDirectory(prefix="ls-hide-page-save-") as folder:
        path = Path(folder) / "TestHidePageSave.java"
        path.write_text(java, encoding="utf-8")
        subprocess.run(["javac", "-encoding", "UTF-8", "--release", "17", "-d", folder,
                        str(path), str(SOURCE / "HideTargetCodec.java")], check=True, timeout=60)
        print(f"Activity source under test: {args.activity_source.resolve()}", flush=True)
        subprocess.run(["java", "-cp", folder, "ls.augment.com.TestHidePageSave"], check=True, timeout=30)


if __name__ == "__main__":
    main()
