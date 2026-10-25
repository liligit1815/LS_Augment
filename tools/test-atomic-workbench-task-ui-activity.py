"""Execute current Activity task/notification async bodies with actual immutable task models."""
from pathlib import Path
import argparse
import runpy
import tempfile

ROOT = Path(__file__).resolve().parents[1]
UI = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-ui.py')))
LIFE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-lifecycle.py')))
MEMBER = LIFE['member']
MODELS = UI['models']
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'

HEAD = r'''package ls.augment.com;
import android.os.*;import java.util.*;import ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.*;import static ls.augment.com.AtomicWorkbenchTaskOperationRequest.Action.*;
class Queue {final ArrayDeque<Runnable> jobs=new ArrayDeque<>();void execute(Runnable r){jobs.add(r);}void post(Runnable r){jobs.add(r);}void run(){Runnable r=jobs.poll();if(r!=null)r.run();}void drain(){int n=0;while(!jobs.isEmpty()){if(++n>100)throw new AssertionError("unexpected replay loop");run();}}}
class AtomicWorkbenchClient {
 int changes,queries,allocations,shelfReads,records;boolean throwChange,throwQuery,throwShelf;Bundle lastRecord,changeReply,queryReply,allocationReply,shelf=TestTaskUi.state(),recordReply=new Bundle();Runnable onChange;
 Bundle changeTask(Bundle b)throws Exception{changes++;if(onChange!=null)onChange.run();if(throwChange)throw new Exception("unknown");return changeReply==null?new Bundle():changeReply;}
 Bundle taskOperationState(String id)throws Exception{queries++;if(throwQuery)throw new Exception("unknown");return queryReply==null?new Bundle():queryReply;}
 Bundle taskShelfState()throws Exception{shelfReads++;if(throwShelf)throw new Exception("unknown");return shelf;}
 Bundle allocateTaskDisplay(int id,android.view.Surface out,int width,int height,int density,long generation,String allocation){allocations++;return allocationReply==null?new Bundle():allocationReply;}
 Bundle recordTimer(Bundle b){records++;lastRecord=new Bundle(b);return recordReply;}
}
public final class AtomicWorkbenchActivity {
 static final Queue WORKER=new Queue(),APP_READER=new Queue();final Queue main=new Queue();AtomicWorkbenchClient client=new AtomicWorkbenchClient();
 long taskSnapshotDiagnosticLast,taskSnapshotDiagnosticSuppressed,launchGeneration;static final java.util.concurrent.atomic.AtomicBoolean TASK_SNAPSHOT_DIAGNOSTIC_QUEUED=new java.util.concurrent.atomic.AtomicBoolean();
 android.content.Context getApplicationContext(){return new android.content.Context();}
 int epoch=1,focusedWindow=0;long sessionGeneration=8,mediaGeneration=3,outputSequence,taskSnapshotElapsed=-1;
 boolean active=true,destroyed,closing,surfaceUnavailable,outputsSyncing,outputsParked,busy,taskQueryPending,hostDialogActive,hostDragActive,appListRequested;
 final AtomicWorkbenchWindowPresentationPolicy presentationPolicy=new AtomicWorkbenchWindowPresentationPolicy();
 Receipt taskPresentationReceipt,pendingPresentationFocus;int incomingRuns;void tryIncoming(){incomingRuns++;}
 AtomicWorkbenchTaskOperationRequest pendingTaskOperation;AtomicWorkbenchTaskUiSnapshot lastTaskSnapshot;Runnable deferredOperation;
 int displayWidth=100,displayHeight=200,density=300,gestures,invalidations,renders,polls,applied,finishes;String notice;
 boolean[] pendingHomeSurfaces=new boolean[4];String[] pendingTaskAllocations=new String[4];final Model model=new Model();final Slot[]slots={new Slot(0),new Slot(1),new Slot(2),new Slot(3)};
 static final class Model {final boolean[] hosted={true,true,false,false};int main,promotions;
 final AtomicWorkbenchWorkspaceModel roles=new AtomicWorkbenchWorkspaceModel();
 void syncRoles(){for(int i=0;i<hosted.length;i++)roles.setHostedWindow(i,hosted[i]);if(roles.mainWindowId()!=main&&hosted[main])roles.promote(main);}
 boolean hasWindow(int id){return hosted[id];}void setHostedWindow(int id,boolean yes){hosted[id]=yes;}
 void promote(int id){syncRoles();if(roles.promote(id)){main=roles.mainWindowId();promotions++;}}
 int mainWindowId(){return main;}int sideWindowId(int i){syncRoles();return roles.sideWindowId(i);}}
 final class Slot {final int id;int displayId,displayWidth=100,displayHeight=200;String displayName="vd",displayUniqueId,windowSession;AtomicWorkbenchTaskUiSnapshot.Window swipeWindow;int swipeEpoch;long swipeSession;final SurfaceView surface=new SurfaceView();Slot(int i){id=i;displayId=i+88;displayUniqueId="unique-"+displayId;windowSession=i==1?TestTaskUi.SESSION:TestTaskUi.TARGET;}
 AtomicWorkbenchSideSwipe.Callback callback(){return CALLBACK;}}
 static final class SurfaceView {final Holder holder=new Holder();Holder getHolder(){return holder;}}static final class Holder{final android.view.Surface output=new android.view.Surface();void setFixedSize(int w,int h){}android.view.Surface getSurface(){return output;}}
 boolean canInteract(){return active&&!destroyed&&!closing&&!busy&&!surfaceUnavailable&&!outputsParked&&!outputsSyncing;}
 boolean canPollMedia(){return active&&!destroyed&&!closing;}void cancelGesture(){gestures++;}void invalidateExtractionGeometry(){invalidations++;}
 void showStatus(String s){notice=s;}void renderWorkspace(){renders++;}void schedulePoll(){polls++;}void lifecycleDiagnostic(String a,String b){}
 void applyWindowStatus(int id,Bundle b){applied++;}void selectTaskInWindow(AtomicWorkbenchTaskUiSnapshot.Window w,AtomicWorkbenchTaskOperationRequest.Action a){performTaskAction(w,w.tasks.get(0),a,"");}
 static Bundle failure(String m){Bundle b=new Bundle();b.putBoolean("success",false);b.putString("message",m);return b;}
 void resume(){active=true;outputsSyncing=outputsParked=false;resumeDeferredOperation();}
 void all(){WORKER.drain();main.drain();}void resetWorker(){WORKER.jobs.clear();}
'''

TEST = r'''
 static int checks,cases;interface Case{void run()throws Exception;}static void yes(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}static void test(String n,Case c)throws Exception{WORKER.jobs.clear();SystemClock.now=1000;c.run();cases++;System.out.println("PASS actual task Activity: "+n);}
 static AtomicWorkbenchTaskOperationRequest request(){var s=new AtomicWorkbenchTaskUiSnapshot(TestTaskUi.state());return s.action(s.window(1),s.window(1).tasks.get(0),SHELVE,1000,"");}
 static Bundle result(AtomicWorkbenchTaskOperationRequest r,AtomicWorkbenchTaskOperationResult.Status s){var old=r.identity;boolean ok=s==AtomicWorkbenchTaskOperationResult.Status.COMMITTED;var at=ok?new AtomicWorkbenchTaskIdentity(old.serverBootGeneration,old.taskGeneration,old.taskId,old.rootTaskId,true,old.uid,old.userId,old.baseComponent,old.realComponent,r.targetDisplayId,r.targetDisplayName,r.targetDisplayUnique):old;return new AtomicWorkbenchTaskOperationResult(r,s,8,at,ok?"COMMITTED":"TERMINAL",ok?"SHELVED_REFERENCE":"WORKSPACE_OWNED","test_result",ok,ok,ok,ok,true,false,"").toBundle();}
 static AtomicWorkbenchActivity unknown(){var a=new AtomicWorkbenchActivity();a.client.throwChange=true;a.beginTaskMutation(c->request(),-1);a.all();return a;}
 static void unchanged(AtomicWorkbenchActivity a){yes(a.model.hasWindow(1)&&a.slots[1].surface.holder.output.isValid()&&a.model.promotions==0&&a.applied==0,"unknown lost Surface/window responsibility");}
 public static void main(String[]args)throws Exception{
 test("unknown dispatch preserves exact ID and only queries without replay",()->{var a=unknown();var pending=a.pendingTaskOperation;yes(pending!=null&&!a.busy&&a.client.changes==1,"unknown discarded submitted request");unchanged(a);a.client.throwQuery=true;a.queryPendingTaskOperation();a.queryPendingTaskOperation();a.all();yes(a.client.queries==1&&a.client.changes==1&&a.pendingTaskOperation==pending,"query replayed CHANGE or rebound ID");a.beginTaskMutation(c->{throw new AssertionError("pending allowed new mutation");},-1);a.all();yes(a.client.changes==1,"pending replayed mutation");});
 test("stop after dispatch defers result and resume applies once without dispatch",()->{var a=new AtomicWorkbenchActivity();a.client.throwChange=true;a.beginTaskMutation(c->request(),-1);WORKER.run();a.active=false;a.outputsParked=true;a.main.drain();yes(a.deferredOperation!=null&&a.pendingTaskOperation==null&&a.busy,"stopped task result applied early");a.active=true;a.resumeDeferredOperation();yes(a.deferredOperation!=null,"parked output accepted task result");a.resume();yes(a.pendingTaskOperation!=null&&!a.busy&&a.client.changes==1,"resume replayed or discarded task result");a.resumeDeferredOperation();yes(a.client.changes==1,"second resume dispatched again");unchanged(a);});
 test("stop before queued work never sends CHANGE and later resume clears busy",()->{var a=new AtomicWorkbenchActivity();a.beginTaskMutation(c->request(),-1);a.active=false;a.all();yes(a.client.changes==0&&a.deferredOperation!=null,"stopped queued mutation dispatched");a.resume();yes(!a.busy&&a.pendingTaskOperation==null&&a.client.changes==0,"stopped queued operation did not retire");});
 for(String stale:new String[]{"epoch","session","client","destroy"})test("late dispatch callback isolated by "+stale,()->{var a=new AtomicWorkbenchActivity();a.beginTaskMutation(c->request(),-1);WORKER.run();if(stale.equals("epoch"))a.epoch++;else if(stale.equals("session"))a.sessionGeneration++;else if(stale.equals("client"))a.client=new AtomicWorkbenchClient();else a.destroyed=true;a.main.drain();yes(a.pendingTaskOperation==null&&a.notice==null,"stale callback changed current UI");unchanged(a);});
 test("bound rejected response retires pending while forged response cannot",()->{var a=unknown();var p=a.pendingTaskOperation;a.acceptTaskReply(result(request(),AtomicWorkbenchTaskOperationResult.Status.COMMITTED),p,-1);yes(a.pendingTaskOperation==p&&a.model.promotions==0,"foreign reply accepted");a.acceptTaskReply(result(p,AtomicWorkbenchTaskOperationResult.Status.REJECTED),p,-1);yes(a.pendingTaskOperation==null,"verified rejection remained pending");});
 test("restore promotes only after exact committed result and unknown retains receiver",()->{for(boolean committed:new boolean[]{false,true}){var a=new AtomicWorkbenchActivity();a.model.hosted[2]=true;var s=new AtomicWorkbenchTaskUiSnapshot(TestTaskUi.state());var r=s.restore(s.entries.get(0),s.window(2),1000);a.client.changeReply=committed?result(r,AtomicWorkbenchTaskOperationResult.Status.COMMITTED):new Bundle();a.beginTaskMutation(c->r,2);a.all();yes(a.client.changes==1&&a.model.promotions==(committed?1:0),"restore promoted before verified commit");yes(committed?a.pendingTaskOperation==null&&a.model.hasWindow(2)&&a.focusedWindow==-2:a.pendingTaskOperation==r,"restore response lost pending responsibility");}});
 for(String replaced:new String[]{"closed","display","name","unique","session"})test("late committed restore query cannot promote replaced receiver "+replaced,()->{var a=new AtomicWorkbenchActivity();a.model.hosted[2]=true;var s=new AtomicWorkbenchTaskUiSnapshot(TestTaskUi.state());var r=s.restore(s.entries.get(0),s.window(2),1000);a.client.throwChange=true;a.beginTaskMutation(c->r,2);a.all();yes(a.pendingTaskOperation==r,"unknown restore discarded request");a.client.queryReply=result(r,AtomicWorkbenchTaskOperationResult.Status.COMMITTED);a.queryPendingTaskOperation();WORKER.run();switch(replaced){case "closed":a.model.hosted[2]=false;break;case "display":a.slots[2].displayId=99;break;case "name":a.slots[2].displayName="another-display";break;case "unique":a.slots[2].displayUniqueId="another-generation";break;case "session":a.slots[2].windowSession=TestTaskUi.SESSION;}a.main.drain();yes(a.pendingTaskOperation==null&&a.model.promotions==0&&a.focusedWindow==0&&a.model.hasWindow(2)!=replaced.equals("closed"),"late RESTORE resurrected or promoted replaced receiver");yes(a.notice.contains("工作区已变化")&&a.client.changes==1&&a.client.queries==1,"late RESTORE rebound target or replayed action");});
 test("late query after stop updates no UI and next query keeps same request",()->{var a=unknown();var p=a.pendingTaskOperation;a.client.queryReply=result(p,AtomicWorkbenchTaskOperationResult.Status.COMMITTED);a.queryPendingTaskOperation();WORKER.run();a.active=false;a.main.drain();yes(!a.taskQueryPending&&a.pendingTaskOperation==p,"stopped query mutated pending UI");a.active=true;a.queryPendingTaskOperation();a.all();yes(a.pendingTaskOperation==null&&a.client.changes==1&&a.client.queries==2,"resume query replayed or dropped known result");});
 test("fresh snapshot deferred across stop and unknown read never renews old proof",()->{var a=new AtomicWorkbenchActivity();int[] ready={0};a.readTaskSnapshot(s->ready[0]++,null);WORKER.run();a.active=false;a.main.drain();yes(a.lastTaskSnapshot==null&&ready[0]==0&&a.deferredOperation!=null,"stopped snapshot updated proof");a.resume();var old=a.lastTaskSnapshot;long when=a.taskSnapshotElapsed;yes(ready[0]==1&&old!=null,"deferred snapshot missing");a.client.throwShelf=true;SystemClock.now=2000;a.readTaskSnapshot(s->{throw new AssertionError("unknown snapshot presented as fresh");},null);a.all();yes(a.lastTaskSnapshot==old&&a.taskSnapshotElapsed==when,"unknown snapshot renewed stale proof");});
 test("last preflight rejects recycled full task generation despite same ID and package",()->{var a=new AtomicWorkbenchActivity();var old=new AtomicWorkbenchTaskUiSnapshot(TestTaskUi.state());a.client.shelf=TestTaskUi.state();TestTaskUi.win(a.client.shelf,0).<Bundle>getParcelableArrayList("tasks").get(0).putString("task_generation","f".repeat(32));a.performTaskAction(old.window(1),old.window(1).tasks.get(0),SHELVE,"");a.all();yes(a.client.changes==0&&a.pendingTaskOperation==null&&!a.busy,"recycled task dispatched from old picker");});
 test("DOWN freezes immutable observation and UP remains bound to epoch session display and slot",()->{for(String change:new String[]{"epoch","session","display","unique","windowSession","main"}){var a=new AtomicWorkbenchActivity();a.lastTaskSnapshot=new AtomicWorkbenchTaskUiSnapshot(TestTaskUi.state());a.taskSnapshotElapsed=1000;var slot=a.slots[1];var cb=slot.callback();cb.onDown();yes(slot.swipeWindow==a.lastTaskSnapshot.window(1),"DOWN failed to freeze observation");a.lastTaskSnapshot=new AtomicWorkbenchTaskUiSnapshot(TestTaskUi.state());switch(change){case "epoch":a.epoch++;break;case "session":a.sessionGeneration++;break;case "display":slot.displayId++;break;case "unique":slot.displayUniqueId="recycled";break;case "windowSession":slot.windowSession=TestTaskUi.TARGET;break;case "main":a.model.main=1;}cb.onAction(AtomicWorkbenchSideSwipePolicy.Action.UP);a.all();yes(a.client.changes==0,"stale swipe target dispatched");cb.onFinished();yes(slot.swipeWindow==null,"finished gesture retained target");}});
 test("fresh swipe action uses Root preflight and does not trust old generation",()->{var a=new AtomicWorkbenchActivity();a.lastTaskSnapshot=new AtomicWorkbenchTaskUiSnapshot(TestTaskUi.state());a.taskSnapshotElapsed=1000;var cb=a.slots[1].callback();cb.onDown();a.client.shelf=TestTaskUi.state();TestTaskUi.win(a.client.shelf,0).<Bundle>getParcelableArrayList("tasks").get(0).putString("task_generation","e".repeat(32));cb.onAction(AtomicWorkbenchSideSwipePolicy.Action.OUT);cb.onFinished();a.all();yes(a.client.shelfReads==1&&a.client.changes==0,"swipe skipped final full generation check");});
 test("unknown empty-display allocation preserves pending Surface responsibility without replay",()->{var a=new AtomicWorkbenchActivity();var shelf=new AtomicWorkbenchTaskUiSnapshot(TestTaskUi.state());a.allocateTaskReceiver(2,shelf.entries.get(0));a.all();yes(a.client.allocations==1&&a.pendingHomeSurfaces[2]&&a.pendingTaskAllocations[2]!=null&&a.slots[2].surface.holder.output.isValid(),"unknown allocation lost output obligation");yes(a.client.changes==0&&!a.model.hasWindow(2),"unknown allocation fabricated task or window");});
 test("late allocation reply isolated across output owner session replacement",()->{var a=new AtomicWorkbenchActivity();var shelf=new AtomicWorkbenchTaskUiSnapshot(TestTaskUi.state());a.allocateTaskReceiver(2,shelf.entries.get(0));WORKER.run();a.sessionGeneration++;a.main.drain();yes(a.client.allocations==1&&a.applied==0&&!a.model.hasWindow(2),"late allocation claimed new session output");yes(a.pendingHomeSurfaces[2]&&a.slots[2].surface.holder.output.isValid(),"late allocation discarded old responsibility");});
 test("recordTimer metadata frozen and late generation suppresses callback",()->{var a=new AtomicWorkbenchActivity();Bundle b=new Bundle();b.putString("request_id","original");int[] done={0};a.recordNotificationTimer(b,r->done[0]++);b.putString("request_id","changed");WORKER.run();yes("original".equals(a.client.lastRecord.getString("request_id")),"record metadata aliased mutable UI Bundle");a.mediaGeneration++;a.main.drain();yes(a.client.records==1&&done[0]==0,"late record reply crossed media generation");a.recordNotificationTimer(b,r->done[0]++);a.active=false;a.all();yes(a.client.records==1&&done[0]==1,"stopped record dispatched or callback missing failure");});
 System.out.println("TASK UI ACTIVITY RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def sources():
    source = (SRC / 'AtomicWorkbenchActivity.java').read_text(encoding='utf8')
    markers = ['private void readTaskSnapshot(', 'private void beginTaskMutation(', 'private void acceptTaskReply(', 'private void queryPendingTaskOperation(', 'private void allocateTaskReceiver(', 'private void performTaskAction(', 'private boolean mutationAllowed(', 'private void completeOperation(', 'private void resumeDeferredOperation(', 'private void recordNotificationTimer(', 'private Roles presentationRoles(', 'private Lease presentationLease(', 'private Receipt proposalPresentation(']
    callback = MEMBER(source, 'new AtomicWorkbenchSideSwipe.Callback()')
    activity = HEAD.replace('CALLBACK', callback) + MEMBER(source, 'private interface TaskRequestFactory') + '\n'.join(MEMBER(source, m) for m in markers) + TEST
    bundle = UI['BUNDLE'].replace('public Set<String>', 'public boolean containsKey(String k){return data.containsKey(k);}public boolean getBoolean(String k,boolean d){return data.get(k) instanceof Boolean?(Boolean)data.get(k):d;}public int getInt(String k,int d){return data.get(k) instanceof Integer?(Integer)data.get(k):d;}public String getString(String k,String d){return data.get(k) instanceof String?(String)data.get(k):d;}public Set<String>')
    return {'android/os/Bundle.java': bundle,
            'android/content/Context.java': 'package android.content;public class Context{}',
            'android/os/Process.java': 'package android.os;public class Process{public static int myUid(){return 10055;}}',
            'ls/augment/com/AtomicWorkbenchDiagnostics.java': 'package ls.augment.com;final class AtomicWorkbenchDiagnostics{static void record(android.content.Context c,long generation,String event,int window,int user,String component,int display,String detail,Throwable error){}}',
            'android/os/SystemClock.java': 'package android.os;public class SystemClock{public static long now=1000;public static long elapsedRealtime(){return now;}}',
            'android/view/Surface.java': 'package android.view;public class Surface{public boolean isValid(){return true;}}',
            'ls/augment/com/AtomicWorkbenchSideSwipe.java': 'package ls.augment.com;class AtomicWorkbenchSideSwipe{interface Callback{void onDown();void onAction(AtomicWorkbenchSideSwipePolicy.Action action);void onFinished();}}',
            'ls/augment/com/TestTaskUi.java': UI['TEST'],
            'ls/augment/com/AtomicWorkbenchActivity.java': activity}


def main():
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--negative-controls', action='store_true'); args = parser.parse_args()
    files = sources()
    production = ['AtomicWorkbenchTaskIdentity.java', 'AtomicWorkbenchTaskOperationRequest.java', 'AtomicWorkbenchTaskOperationResult.java', 'AtomicWorkbenchTaskUiSnapshot.java', 'AtomicWorkbenchSideSwipePolicy.java', 'AtomicWorkbenchWorkspaceModel.java', 'AtomicWorkbenchWindowPresentationPolicy.java', 'AtomicWorkbenchWindowLayoutPlan.java']
    controls = [
        ('if (!active || outputsSyncing || outputsParked)', 'if (false)', 'stopped task result applied early'),
        ('if (pendingTaskOperation != pending || !active || closing) return;', 'if (pendingTaskOperation != pending || closing) return;', 'stopped query mutated pending UI'),
        ('swipeEpoch != epoch', 'false', 'stale swipe target dispatched'),
        ('swipeSession != sessionGeneration', 'false', 'stale swipe target dispatched'),
        ('|| selected != null && !selected.matches(displayId, displayUniqueId, windowSession)', '', 'stale swipe target dispatched'),
        ('if (submitted != null) { pendingTaskOperation = submitted;', 'if (false) { pendingTaskOperation = submitted;', 'unknown discarded submitted request'),
        (MEMBER(files['ls/augment/com/AtomicWorkbenchActivity.java'], 'if (!model.hasWindow(restoreTarget)'), '', 'late RESTORE resurrected or promoted replaced receiver'),
    ]
    with tempfile.TemporaryDirectory(prefix='duo-task-ui-activity-') as temporary:
        def run(label, replacement=None):
            result = MODELS.compile_run(Path(temporary)/label, files, production=production, runner='ls.augment.com.AtomicWorkbenchActivity', replacements=replacement, capture=True)
            return result, (result.stdout+result.stderr).decode('utf8', errors='replace')
        result, output = run('base'); print(output, end='')
        if result.returncode: raise AssertionError(output)
        if args.negative_controls:
            for n,(old,new,expected) in enumerate(controls):
                result, output = run('negative-'+str(n), {'ls/augment/com/AtomicWorkbenchActivity.java': (old,new)})
                if result.returncode == 0 or expected not in output: raise AssertionError(output)
                print('PASS task Activity negative control: '+expected)
            result, output = run('negative-full-generation', {'ls/augment/com/AtomicWorkbenchTaskUiSnapshot.java': ('|| !current.contains(task)', '')})
            if result.returncode == 0 or 'recycled task dispatched from old picker' not in output: raise AssertionError(output)
            print('PASS task Activity negative control: final fresh full task generation')


if __name__ == '__main__': main()
