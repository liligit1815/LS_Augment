"""Execute actual Activity output batches with controlled Binder and UI scheduling."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-lifecycle.py')))
SUPPORT, SRC, member = BASE['SUPPORT'], BASE['SRC'], BASE['member']
HEAD = r'''package ls.augment.com;import android.os.Bundle;import android.view.Surface;import java.util.*;
final class AtomicWorkbenchSurface {static final class Output {}}
final class ResetWriteFence {static boolean staleValue;static boolean stale(long generation){return staleValue;}}
final class AtomicWorkbenchClient {
 final ArrayList<Bundle> windows=new ArrayList<>();final List<String> calls=new ArrayList<>();boolean parked,failResume,failStatus,throwUpdate;int failSide=-1,closes,updates;long lastGeneration;
 Runnable updateHook;
 AtomicWorkbenchClient(){for(int i=0;i<4;i++){Bundle b=new Bundle();b.putInt("window_id",i);b.putInt("display_id",10+i);b.putInt("user_id",0);b.putString("display_name","owned-"+i);b.putString("display_unique_id","unique-"+i);b.putBoolean("output_attached",true);b.putBoolean("output_attached_known",true);windows.add(b);}}
 void clearGestureTarget(){calls.add("clear");}
 Bundle resumeUi(long generation){calls.add("resume");checkSequence(generation);if(!failResume)parked=false;Bundle b=status();b.putBoolean("success",!failResume);return b;}
 Bundle focusHostInput(){calls.add("host");return status();}
 Bundle status(){Bundle b=new Bundle();b.putBoolean("success",!failStatus);b.putBoolean("ui_parked",parked);ArrayList<Bundle> copy=new ArrayList<>();for(Bundle w:windows)copy.add(new Bundle(w));b.putParcelableArrayList("windows",copy);return b;}
 Bundle updateOutput(int id,Bundle expected,long generation,Surface surface)throws Exception{checkSequence(generation);calls.add("output:"+id+":"+(surface!=null));updates++;if(throwUpdate)throw new Exception("fixed");
  Bundle w=windows.get(id);boolean success=id!=failSide;w.putBoolean("output_attached",success&&surface!=null);w.putBoolean("output_attached_known",true);if(updateHook!=null){Runnable hook=updateHook;updateHook=null;hook.run();}Bundle b=new Bundle(w);b.putBoolean("success",success);b.putString("message","fixed output failure");return b;}
 Bundle parkUi(long generation){checkSequence(generation);calls.add("park");parked=true;for(Bundle w:windows)w.putBoolean("output_attached",false);return status();}
 Bundle close(){closes++;return status();}
 void checkSequence(long value){if(value<=lastGeneration)throw new AssertionError("old output generation");lastGeneration=value;}
}
public final class TestOutputUi {
 // Presentation-only boundary: these older fixtures never return storage-scope metadata.
 // The actual scope observer/typed facts/pinned transport are executed by test-atomic-workbench-storage-scope-ui.py.
 int scopeObservationCallbacks,scopeCancellationCallbacks;
 void observeTaskStorageScope(Bundle response){if(response!=null&&response.containsKey("task_backend_state"))throw new AssertionError("storage scope facts require the dedicated real-method suite");scopeObservationCallbacks++;}
 void cancelTaskStorageRecheck(){scopeCancellationCallbacks++;}

 static final int COUNT=4;static final List<Surface> duplicates=new ArrayList<>();
 static final class Queue {final ArrayList<Runnable> jobs=new ArrayList<>();void execute(Runnable r){jobs.add(r);}void post(Runnable r){jobs.add(r);}void one(){if(jobs.isEmpty())throw new AssertionError("empty queue");jobs.remove(0).run();}void all(){int remaining=100;while(!jobs.isEmpty()){if(--remaining<0)throw new AssertionError("queue storm");one();}}}
 static final class ViewOutput {final Surface original=new Surface();boolean valid=true,configured=true;long frames=1;ViewOutput getHolder(){return this;}Surface getSurface(){return original;}boolean isValid(){return valid;}long frameCount(){return frames;}boolean isFrameFromConfiguredGeometry(){return configured&&valid&&frames>0;}}
 final class Slot {final int id;final ViewOutput surface=new ViewOutput();boolean ready=true,outputAwaitingFrame,outputRetainsProducer;long outputFrameBoundary;int surfaceLifecycle=1,lastSurfaceWidth,lastSurfaceHeight,surfaceChanges,surfaceChangeLogs;String displayUniqueId;Slot(int id){this.id=id;displayUniqueId="unique-"+id;}void surfaceDiagnostic(String event,String detail){} __ACTUAL_DESTROYED__ }
 final AtomicWorkbenchWindowPresentationPolicy presentationPolicy=new AtomicWorkbenchWindowPresentationPolicy();AtomicWorkbenchWindowPresentationPolicy.Receipt pendingPresentationFocus;
 final AtomicWorkbenchWorkspaceModel model=new AtomicWorkbenchWorkspaceModel();final Slot[] slots={new Slot(0),new Slot(1),new Slot(2),new Slot(3)};
 final Queue WORKER=new Queue(),main=new Queue();AtomicWorkbenchClient client=new AtomicWorkbenchClient();
 boolean active=true,destroyed,closing,recoveryPending,waitingForCleanup,outputsSyncing,outputsParked,outputFocusPending,outputsNeedRetry,outputSyncAgain,surfaceUnavailable,busy,hostDialogActive,mainLayoutPresented,layoutMatches=true;
 long outputTransition,outputSequence,sessionGeneration=1,launchGeneration=7;int focusedWindow,renders,polls,media,tries,hostRequests;String status,operationNotice;Runnable deferred;
 final AtomicWorkbenchLifecyclePolicy.Gate lifecycleGate=new AtomicWorkbenchLifecyclePolicy.Gate();
 final boolean[] pendingHomeSurfaces=new boolean[COUNT];
 TestOutputUi(){for(int i=0;i<4;i++)model.commitLaunch(model.planLaunch("app"+i+"/.Main"));}
 void cancelGesture(){}void invalidateMainLayout(int id){mainLayoutPresented=false;}boolean mainLayoutMatches(int id){return layoutMatches;}
 boolean canInteract(){return active&&!destroyed&&!closing&&!outputsSyncing&&!outputsParked&&!busy;}
 boolean mainReady(){return canInteract()&&slots[model.mainWindowId()].ready;}
 void queueHostInput(boolean enter){hostRequests++;focusedWindow=enter?-1:model.mainWindowId();}
 void renderWorkspace(){renders++;}void showStatus(String s){status=s;}void tryIncoming(){tries++;}void schedulePoll(){polls++;}void scheduleMedia(){media++;}
 void resumeDeferredOperation(){if(deferred!=null){Runnable r=deferred;deferred=null;r.run();}}
 void resumePendingHomeAfterOutputs(){}
 void lifecycleDiagnostic(String event,String detail){}
 void applyWindowStatus(int id,Bundle b){model.setHostedWindow(id,b.getInt("display_id",-1)>0);slots[id].ready=b.getBoolean("output_attached")&&b.getBoolean("output_attached_known");}
 static Surface duplicateOutput(Surface source){Surface duplicate=new Surface();duplicates.add(duplicate);return duplicate;}
 void settle(){mainLayoutPresented=true;finishOutputPresentation();}
 void stopped(){active=false;parkWorkspaceOutputs();}
 void restarted(){active=true;syncWorkspaceOutputs();}
 void drain(){int remaining=30;while(!WORKER.jobs.isEmpty()||!main.jobs.isEmpty()){if(--remaining<0)throw new AssertionError("unfinished output batches");WORKER.all();main.all();}}
 static int cases,checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static void test(String name,Runnable action){ResetWriteFence.staleValue=false;duplicates.clear();action.run();for(Surface s:duplicates)check(s.releases==1,"batch producer not released exactly once");cases++;System.out.println("PASS actual Activity output: "+name);}
'''
TEST = r'''
 public static void main(String[] args){
  test("same-Activity stop parks outputs while retaining all task and window identities",()->{var f=new TestOutputUi();var original=f.client;int main=f.model.mainWindowId();int[] sides={f.model.sideWindowId(0),f.model.sideWindowId(1),f.model.sideWindowId(2)};f.stopped();f.WORKER.all();f.main.all();check(f.client==original&&f.model.appCount()==4&&f.model.mainWindowId()==main,"stop discarded workspace");for(int i=0;i<3;i++)check(f.model.sideWindowId(i)==sides[i],"stop changed side order");check(original.parked&&original.closes==0&&original.calls.contains("park"),"stop closed instead of parking");});
  test("stop before a queued reconnect prevents obsolete resume and attach",()->{var f=new TestOutputUi();f.syncWorkspaceOutputs();f.stopped();f.WORKER.all();f.main.all();check(!f.client.calls.contains("resume")&&f.client.updates==0&&f.client.parked,"stopped UI resumed old output");check(f.outputsParked&&!f.outputsSyncing&&f.hostRequests==0,"stopped batch published input");});
  test("stop and start before the worker runs cannot revive a prior batch",()->{var f=new TestOutputUi();f.syncWorkspaceOutputs();f.stopped();f.restarted();f.WORKER.one();check(!f.client.calls.contains("resume")&&f.client.updates==0,"prior transition revived when Activity became active again");f.WORKER.all();f.main.all();check(!f.outputsParked&&f.client.updates==4,"new transition did not reconnect");});
  test("failed resume cannot release a deferred mutation merely because ui_parked is false",()->{var f=new TestOutputUi();f.client.failResume=true;f.client.parked=false;final int[] mutations={0};f.deferred=()->mutations[0]++;f.syncWorkspaceOutputs();f.WORKER.all();f.main.all();check(f.outputsParked&&mutations[0]==0&&f.deferred!=null&&f.hostRequests==0,"failed resume released deferred mutation");});
  test("expanded presentation detaches sides and returns with the same four identities",()->{var f=new TestOutputUi();int main=f.model.mainWindowId();String[] components=new String[4];for(int i=0;i<4;i++)components[i]=f.model.component(i);f.setMainExpanded(true);f.WORKER.all();f.main.all();check(f.model.mainExpanded(),"expand not applied");for(int i=0;i<4;i++)check(f.client.windows.get(i).getBoolean("output_attached")== (i==main),"side not detached");f.settle();f.setMainExpanded(false);f.WORKER.all();f.main.all();for(int i=0;i<4;i++)check(f.client.windows.get(i).getBoolean("output_attached")&&components[i].equals(f.model.component(i)),"return replaced a task or lost output");check(f.client.closes==0&&f.model.mainWindowId()==main,"presentation closed or promoted another window");});
  test("an admitted producer can reuse its complete buffer after a pure View layout change",()->{var f=new TestOutputUi();f.syncWorkspaceOutputs();f.WORKER.all();f.main.all();Slot s=f.slots[f.model.mainWindowId()];s.surface.configured=false;check(s.outputRetainsProducer&&!s.outputAwaitingFrame,"existing producer became fake new frame");f.settle();check(f.hostRequests==1,"static admitted producer was deadlocked awaiting an unrequested redraw");});
  test("a replacement producer waits for a real current-geometry frame and layout",()->{var f=new TestOutputUi();Slot s=f.slots[f.model.mainWindowId()];s.ready=false;s.surface.frames=0;s.surface.configured=false;f.syncWorkspaceOutputs();f.WORKER.all();f.main.all();f.settle();check(f.hostRequests==0&&s.outputAwaitingFrame,"new producer admitted before actual frame");s.outputAwaitingFrame=false;f.finishOutputPresentation();check(f.hostRequests==0,"wrong-geometry frame admitted input");s.surface.frames=1;s.surface.configured=true;f.finishOutputPresentation();check(f.hostRequests==1,"real frame never admitted input");});
  test("a different display unique ID cannot inherit the captured output",()->{var f=new TestOutputUi();f.client.windows.get(0).putString("display_unique_id","replacement");f.syncWorkspaceOutputs();f.WORKER.all();f.main.all();check(!f.client.calls.contains("output:0:true")&&f.outputsNeedRetry&&f.status!=null&&f.client.closes==0,"foreign display received an old producer");});
  test("a producer changed before acknowledgement triggers a new batch before publishing input",()->{var f=new TestOutputUi();f.syncWorkspaceOutputs();f.WORKER.all();f.slots[0].surfaceLifecycle++;f.main.one();check(f.outputsParked&&f.hostRequests==0&&f.main.jobs.size()==1,"old producer acknowledged as current");f.main.one();f.WORKER.all();f.main.all();check(!f.outputsParked&&!f.outputsSyncing&&f.client.updates==8,"new producer batch not completed");});
  test("destroy without a replacement invalidates the actual producer generation and late acknowledgement",()->{var f=new TestOutputUi();Slot s=f.slots[f.model.mainWindowId()];int generation=s.surfaceLifecycle;f.syncWorkspaceOutputs();f.WORKER.all();s.surfaceDestroyed(null);s.surface.valid=false;check(s.surfaceLifecycle==generation+1&&!s.ready&&!s.outputRetainsProducer,"destroy did not invalidate producer generation");f.main.one();check(f.outputsParked&&f.hostRequests==0,"destroyed producer received old acknowledgement");f.settle();check(f.hostRequests==0,"destroyed producer received input before reconnect");f.drain();check(!f.client.windows.get(s.id).getBoolean("output_attached")&&f.client.closes==0&&f.model.appCount()==4,"destroyed producer was attached or its task closed");});
  test("a retained ready flag cannot admit input through an invalid holder",()->{var f=new TestOutputUi();Slot s=f.slots[f.model.mainWindowId()];f.outputFocusPending=f.mainLayoutPresented=s.outputRetainsProducer=true;s.surface.valid=false;f.finishOutputPresentation();check(f.hostRequests==0&&f.outputFocusPending,"invalid holder admitted host input");});
  test("a presentation changed during a batch cannot replay its old side visibility",()->{var f=new TestOutputUi();f.model.setMainExpanded(true);f.syncWorkspaceOutputs();f.model.setMainExpanded(false);f.syncWorkspaceOutputs();f.WORKER.all();f.main.all();check(f.WORKER.jobs.size()==1&&f.outputsSyncing&&f.hostRequests==0,"old presentation was published");f.WORKER.all();f.main.all();for(Bundle w:f.client.windows)check(w.getBoolean("output_attached"),"latest presentation failed to restore side");});
  test("a failed resume preserves ownership and a visible retry instead of closing",()->{var f=new TestOutputUi();f.client.parked=f.client.failResume=true;f.syncWorkspaceOutputs();f.WORKER.all();f.main.all();check(f.outputsParked&&!f.outputsSyncing&&f.model.appCount()==4&&f.client.closes==0&&f.hostRequests==0,"failed resume discarded tasks or admitted input");});
  test("one failed side remains unavailable without closing the usable main",()->{var f=new TestOutputUi();int side=f.model.sideWindowId(0);f.client.failSide=side;f.syncWorkspaceOutputs();f.WORKER.all();f.main.all();f.settle();check(!f.outputsParked&&f.outputsNeedRetry&&!f.slots[side].ready&&f.slots[f.model.mainWindowId()].ready&&f.hostRequests==1,"side failure closed main or claimed side ready");});
  test("a replaced client receives no old batch or queued status application",()->{var f=new TestOutputUi();var old=f.client;f.syncWorkspaceOutputs();f.client=new AtomicWorkbenchClient();f.sessionGeneration++;f.WORKER.all();f.main.all();check(old.updates==0&&!old.calls.contains("resume")&&f.renders==0&&f.hostRequests==0,"departed client received old output");});
  test("update exceptions release every local handle without replay or task cleanup",()->{var f=new TestOutputUi();f.client.throwUpdate=true;f.syncWorkspaceOutputs();f.WORKER.all();f.main.all();check(f.client.updates==1&&f.outputsParked&&f.client.closes==0&&f.model.appCount()==4,"unconfirmed update replayed or closed session");});
  test("deferred mutation completes before the authoritative fresh snapshot is applied",()->{var f=new TestOutputUi();f.slots[0].displayUniqueId="";f.deferred=()->f.slots[0].ready=false;f.syncWorkspaceOutputs();f.WORKER.all();f.main.all();check(f.deferred==null&&f.slots[0].ready,"old deferred result replaced fresh output state");});
  test("reset cannot resume a pending batch",()->{var f=new TestOutputUi();f.syncWorkspaceOutputs();ResetWriteFence.staleValue=true;f.WORKER.all();f.main.all();check(!f.client.calls.contains("resume")&&f.client.updates==0&&f.client.closes==0,"reset resumed old root");});
  System.out.println("OUTPUT UI RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    activity = (SRC / 'AtomicWorkbenchActivity.java').read_text(encoding='utf-8')
    signatures = ('private void setMainExpanded', 'private void finishOutputPresentation',
                  'private void syncWorkspaceOutputs', 'private boolean outputSessionCurrent',
                  'private static Bundle findWindow', 'private static Bundle outputIdentity',
                  'private void parkWorkspaceOutputs', 'private void onWindowSurfaceDestroyed')
    body = '\n'.join(member(activity, signature) for signature in signatures)
    destroyed = member(activity, 'public void surfaceDestroyed(AtomicWorkbenchSurface.Output holder)')
    body = HEAD.replace('__ACTUAL_DESTROYED__', destroyed) + body
    variants = [('production', body, None)]
    for label, old, new, expected in (
        ('STOP_MUST_PARK_NOT_CLOSE', 'connected.parkUi(sequence);', 'connected.close();', 'stop closed instead of parking'),
        ('UNIQUE_ID_MUST_MATCH', 'if (!expectedUnique[id].isEmpty() && !expectedUnique[id].equals(window.getString("display_unique_id", "")))', 'if (false)', 'foreign display received an old producer'),
        ('NEW_PRODUCER_MUST_HAVE_FRAME', '|| !slots[id].outputRetainsProducer && !slots[id].surface.isFrameFromConfiguredGeometry()', '', 'wrong-geometry frame admitted input'),
        ('LATE_PRODUCER_MUST_RECONNECT', 'for (Slot slot : slots) changed |= slot.surfaceLifecycle != lifecycles[slot.id];', '', 'old producer acknowledged as current'),
        ('OLD_TRANSITION_CANNOT_REVIVE', '&& transition == outputTransition', '', 'prior transition revived when Activity became active again'),
        ('FAILED_RESUME_CANNOT_UNPARK', 'outputsParked = !admitted || response == null', 'outputsParked = response == null', 'failed resume released deferred mutation'),
        ('DESTROY_MUST_INVALIDATE_GENERATION', '++surfaceLifecycle;', '', 'destroy did not invalidate producer generation'),
        ('HOLDER_MUST_REMAIN_VALID', '|| !slots[id].surface.getHolder().isValid()', '', 'invalid holder admitted host input'),
    ):
        assert old in body, label
        variants.append((label, body.replace(old, new, 1), expected))
    for label, current, expected in variants:
        with tempfile.TemporaryDirectory(prefix='lsa-output-ui-') as temporary:
            work = Path(temporary)
            files = {'android/os/Bundle.java': SUPPORT['BUNDLE'],
                     'android/view/Surface.java': 'package android.view; public final class Surface { public int releases; public void release(){if(++releases>1)throw new AssertionError("duplicate release");}}',
                     'ls/augment/com/TestOutputUi.java': current + TEST}
            paths = []
            for name, value in files.items():
                path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(value, encoding='utf-8'); paths.append(str(path))
            subprocess.run([SUPPORT['JAVAC'], '--release', '17', '-encoding', 'UTF-8', '-d', str(work),
                            str(SRC / 'AtomicWorkbenchWorkspaceModel.java'), str(SRC / 'AtomicWorkbenchLifecyclePolicy.java'), str(SRC / 'AtomicWorkbenchWindowPresentationPolicy.java'), str(SRC / 'AtomicWorkbenchWindowLayoutPlan.java'), *paths], check=True, timeout=60, env=SUPPORT['ENV'])
            result = subprocess.run([SUPPORT['JAVA'], '-Dfile.encoding=UTF-8', '-cp', str(work), 'ls.augment.com.TestOutputUi'], encoding='utf-8', errors='replace', capture_output=True, timeout=30, env=SUPPORT['ENV'])
            if expected is None:
                print(result.stdout, end=''); print(result.stderr, end=''); result.check_returncode()
            else:
                assert result.returncode != 0 and expected in result.stdout + result.stderr, (label, result.stdout, result.stderr)
                print('PASS rejected actual output UI negative:', label)


if __name__ == '__main__':
    main()
