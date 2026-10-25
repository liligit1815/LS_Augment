"""Run the real task transaction owner + real durable ShelfStore with explicit service/journal adapters.

No device claims: TaskAuthority/Engine/Platform are narrow deterministic adapters. Separate broker
tests execute the real WM mutation code; these cases exercise fsync ordering, uncertain replies,
cancel/restore and durable handoff rather than duplicating a UI model.
"""
from pathlib import Path
import runpy
import tempfile

STORE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-shelf-store.py')))
BROKER = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-broker.py')))
MODELS = STORE['MODELS']
SOURCES = dict(STORE['SYSTEM'])
SOURCES['ls/augment/com/AtomicWorkbenchDiagnostics.java'] = BROKER['SOURCES']['ls/augment/com/AtomicWorkbenchDiagnostics.java']
SOURCES['android/os/Bundle.java'] = BROKER['SOURCES']['android/os/Bundle.java']
SOURCES['android/os/SystemClock.java'] = BROKER['SOURCES']['android/os/SystemClock.java']
SOURCES['android/os/IBinder.java'] = BROKER['SOURCES']['android/os/IBinder.java']
SOURCES['ls/augment/com/AtomicWorkbenchEngine.java'] = r'''package ls.augment.com;import android.os.*;
final class AtomicWorkbenchEngine {
 interface TaskController{Bundle change(Bundle b);Bundle query(String id);Bundle shelf();Bundle cancel(String id);Bundle cleanup();void maintain();boolean hasPending();boolean blocksWindow(int id);default void refreshStorageScope(){}default boolean storageScopeUnverified(){return false;}default String storageScopeReason(){return "";}default Bundle manageReferences(Bundle b){throw new AssertionError("unexpected reference route");}}
 final AtomicWorkbenchPlatform[] windows={new AtomicWorkbenchPlatform(0),new AtomicWorkbenchPlatform(1),new AtomicWorkbenchPlatform(2),new AtomicWorkbenchPlatform(3)};long revision;boolean parked;
 boolean uiParked(){return parked;}long taskInputRevision(){return revision;}AtomicWorkbenchPlatform taskPlatform(int id){return id<0||id>3?null:windows[id];}boolean taskWindowRecovering(int id){return false;}
 Bundle cancelTaskWindowInput(int id,long expected){Bundle b=new Bundle();b.putBoolean("success",expected==revision&&!parked);if(b.getBoolean("success"))revision++;return b;}
}'''
SOURCES['ls/augment/com/AtomicWorkbenchProtocol.java']='package ls.augment.com;final class AtomicWorkbenchProtocol{static final int WINDOW_COUNT=4;}'
SOURCES['ls/augment/com/AtomicWorkbenchPlatform.java'] = r'''package ls.augment.com;import android.os.*;import java.util.*;
final class AtomicWorkbenchPlatform{
 static final String[] SESSIONS={"11111111-1111-1111-1111-111111111111","22222222-2222-2222-2222-222222222222","33333333-3333-3333-3333-333333333333","44444444-4444-4444-4444-444444444444"};
 final int slot;boolean live=true,retained,failFinish;int taskCount;String disposition="";final Map<String,String> phases=new HashMap<>();int prepares,finishes,syncs;
 AtomicWorkbenchPlatform(int s){slot=s;}
 boolean hasLiveDisplay(){return live;}boolean hasTaskJournalSession(String s){return live&&SESSIONS[slot].equals(s);}
 Bundle taskWindowIdentity(){if(!live)throw new SecurityException();Bundle b=new Bundle();b.putInt("window_id",slot);b.putString("window_session",SESSIONS[slot]);b.putInt("display_id",88+slot);b.putString("display_name","vd"+slot);b.putString("display_unique","unique"+slot);return b;}
 void prepareTaskOperation(AtomicWorkbenchTaskOperationRequest r,boolean receiving,String phase,String lease){prepares++;phases.put(r.operationId,phase);}
 void finishTaskOperation(String op,String boot,String gen,String disposition,String successor)throws Exception{if(failFinish)throw new Exception("injected journal fsync");this.disposition=disposition;finishes++;phases.remove(op);}
 void cancelPreparedTaskOperation(String op,String boot,String gen,String disposition,String successor)throws Exception{if(phases.containsKey(op))finishTaskOperation(op,boot,gen,disposition,successor);}
 void synchronizeTaskOperationBinding(AtomicWorkbenchTaskIdentity restored){syncs++;retained=taskCount==0;if(restored!=null&&restored.displayId!=88+slot)throw new SecurityException();}
}'''
SOURCES['ls/augment/com/AtomicWorkbenchTaskAuthority.java'] = r'''package ls.augment.com;import android.os.*;import java.util.*;
final class AtomicWorkbenchTaskAuthority{
 final AtomicWorkbenchEngine engine;final AtomicWorkbenchTaskShelfStore store;final Map<String,AtomicWorkbenchTaskOperationRequest> requests=new HashMap<>();final Map<String,Bundle> proofs=new HashMap<>();final Map<String,AtomicWorkbenchTaskIdentity> tasks=new HashMap<>();
 int applies,prepares;boolean expirePrepared,loseReply,hideUnknown,failQuery,failCleanup,failPrimary,driftPrimary;String previousLease="";
 AtomicWorkbenchTaskAuthority(AtomicWorkbenchEngine e,AtomicWorkbenchTaskShelfStore s){engine=e;store=s;}
 Bundle primary(){Bundle b=new Bundle();b.putInt("display_id",0);b.putString("display_name","primary");b.putString("display_unique","primary-unique");return b;}
 Bundle base(){Bundle b=new Bundle();b.putInt("schema",1);b.putBoolean("success",true);return b;}
 Bundle primaryDisplay(){Bundle b=base();b.putBoolean("success",!failPrimary);b.putBundle("primary_display",primary());return b;}
 Bundle describe(Bundle window){Bundle b=base(),p=primary();if(driftPrimary)p.putString("display_unique","reused");b.putBundle("primary_display",p);ArrayList<Bundle> list=new ArrayList<>();for(var t:tasks.values())if(t.displayId==window.getInt("display_id"))list.add(t.toBundle());b.putParcelableArrayList("tasks",list);return b;}
 Bundle inspect(ArrayList<String> ids)throws Exception{Bundle b=base();ArrayList<Bundle> all=new ArrayList<>();for(String id:ids){Bundle p=query(id);p.putBoolean("scope_current",true);all.add(p);}b.putParcelableArrayList("operations",all);return b;}
 Bundle prepare(AtomicWorkbenchTaskOperationRequest r){prepares++;requests.put(r.operationId,r);Bundle b=base();b.putString("operation_id",r.operationId);b.putString("ticket","f".repeat(32));if(expirePrepared)SystemClock.now=6001;return b;}
 Bundle apply(String id,String ticket)throws Exception{
  var r=requests.get(id);var disk=store.read().find(r.shelfId);if(disk==null||disk.phase!=AtomicWorkbenchTaskShelfStore.Phase.MUTATING)throw new AssertionError("WM before durable MUTATING");
  for(int slot:new int[]{r.sourceSlot,r.targetSlot})if(slot>=0&&engine.windows[slot].live&&r.identity.displayId>0||slot==r.targetSlot&&slot>=0)
    if(!"MUTATING".equals(engine.windows[slot].phases.get(id)))throw new AssertionError("WM before both journal owners prepared");
  applies++;Bundle b=base();b.putString("operation_id",id);b.putBoolean("mutation_dispatched",true);b.putBoolean("position_verified",!hideUnknown);b.putBoolean("visibility_verified",!hideUnknown);b.putBoolean("focus_unchanged",true);b.putBoolean("cleanup_pending",hideUnknown);b.putBoolean("operation_unconfirmed",hideUnknown);b.putBoolean("external",false);b.putBoolean("ended",r.action==AtomicWorkbenchTaskOperationRequest.Action.END_TASK);b.putBoolean("cancelled",false);b.putBoolean("cleanup_complete",false);
  boolean shelf=r.action==AtomicWorkbenchTaskOperationRequest.Action.SHELVE;b.putBoolean("hidden_lease",shelf);b.putString("lease_id",shelf?"e".repeat(32):"");b.putBoolean("success",!hideUnknown);
  var old=r.identity;var current=new AtomicWorkbenchTaskIdentity(old.serverBootGeneration,old.taskGeneration,old.taskId,old.taskId,true,old.uid,old.userId,old.baseComponent,old.realComponent,r.targetDisplayId,r.targetDisplayName,r.targetDisplayUnique);b.putBundle("identity",current.toBundle());tasks.put(old.taskGeneration,current);
  if(old.displayId>0)engine.windows[r.sourceSlot].taskCount--;if(r.targetSlot>=0)engine.windows[r.targetSlot].taskCount++;proofs.put(id,b);
  if(loseReply)throw new Exception("injected after real dispatch");return new Bundle(b);
 }
 Bundle query(String id)throws Exception{if(failQuery)throw new Exception("injected unavailable");Bundle b=proofs.get(id);if(b==null){var r=requests.get(id);b=base();b.putString("operation_id",id);b.putBoolean("success",false);b.putBoolean("mutation_dispatched",false);b.putBoolean("cancelled",false);b.putBoolean("external",false);b.putBoolean("hidden_lease",false);b.putBoolean("cleanup_pending",false);b.putBundle("identity",tasks.get(r.identity.taskGeneration).toBundle());}return new Bundle(b);}
 Bundle cancel(String id)throws Exception{if(proofs.containsKey(id))return query(id);var r=requests.get(id);Bundle b=query(id);b.putBoolean("cancelled",true);b.putBoolean("mutation_dispatched",false);b.putBoolean("external",false);b.putBoolean("inherited_hidden_lease",!previousLease.isEmpty());b.putString("inherited_lease_id",previousLease);return b;}
 Bundle release(String id)throws Exception{if(failCleanup)throw new Exception("cleanup blocked");Bundle b=query(id);b.putBoolean("cleanup_complete",true);b.putBoolean("cleanup_pending",false);b.putBoolean("operation_unconfirmed",false);b.putBoolean("hidden_lease",false);b.putBoolean("success",false);return b;}
 Bundle cleanup(){Bundle b=base();b.putBoolean("success",!failCleanup);b.putBoolean("cleanup_pending",failCleanup);return b;}
}'''
TEST = r'''package ls.augment.com;import android.os.*;import android.system.*;import android.content.*;import java.nio.file.*;import java.util.*;import static ls.augment.com.AtomicWorkbenchTaskOperationRequest.Action.*;
public class TestTaskOperations{
 static int cases,checks,seq;static Path root;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}interface Case{void run()throws Exception;}static void test(String n,Case c)throws Exception{try{c.run();cases++;System.out.println("PASS real task transaction: "+n);}finally{Os.cleanup();}}static String hex(int n){return String.format("%032x",n);}
 static final class Fixture{
 final AtomicWorkbenchEngine engine=new AtomicWorkbenchEngine();final Context c=new Context();final AtomicWorkbenchTaskShelfStore store;final AtomicWorkbenchTaskAuthority authority;AtomicWorkbenchTaskOperations owner;
 final AtomicWorkbenchTaskIdentity task=new AtomicWorkbenchTaskIdentity("a".repeat(32),hex(++seq),42,99,true,10055,0,"sample/.Base","sample/.Real",88,"vd0","unique0");final String shelf=hex(1000+seq);int operation;
 Fixture()throws Exception{SystemClock.now=1000;Path data=Files.createDirectory(root.resolve("case"+(++seq)));c.pm.info.dataDir=data.toString();Os.chown(data.toString(),10055,10055);store=new AtomicWorkbenchTaskShelfStore(c,10055,0);authority=new AtomicWorkbenchTaskAuthority(engine,store);authority.tasks.put(task.taskGeneration,task);engine.windows[0].taskCount=1;owner=new AtomicWorkbenchTaskOperations(engine,authority,store);}
 AtomicWorkbenchTaskOperationRequest request(AtomicWorkbenchTaskOperationRequest.Action action,AtomicWorkbenchTaskIdentity id)throws Exception{boolean restore=action==RESTORE;return new AtomicWorkbenchTaskOperationRequest(hex(100000+seq*100+(++operation)),action,id,0,AtomicWorkbenchPlatform.SESSIONS[0],restore?89:action==END_TASK?id.displayId:0,restore?"vd1":action==END_TASK?id.displayName:"primary",restore?"unique1":action==END_TASK?id.displayUnique:"primary-unique",restore?1:-1,restore?AtomicWorkbenchPlatform.SESSIONS[1]:"",shelf,store.read().revision,engine.revision,1000,6000,action==END_TASK?hex(900):"");}
 Bundle change(AtomicWorkbenchTaskOperationRequest.Action a,AtomicWorkbenchTaskIdentity id)throws Exception{return owner.change(request(a,id).toBundle());}
 }
 public static void main(String[]args)throws Exception{root=Path.of(args[0]);
 test("shelve commits only after durable MUTATING, retains empty source and fresh display0 identity",()->{Fixture f=new Fixture();Bundle b=f.change(SHELVE,f.task);check(b.getBoolean("success")&&"COMMITTED".equals(b.getString("status")),"shelve not committed");check(f.authority.applies==1&&f.engine.windows[0].retained&&f.engine.windows[0].disposition.equals("SHELVED_REFERENCE"),"source not retained/retired after commit");Bundle state=f.owner.shelf();var entry=(Bundle)state.getParcelableArrayList("entries").get(0);check(state.getBoolean("success")&&entry.getBoolean("can_restore")&&entry.getBundle("identity").getInt("display_id")==0,"shelf forged stale source identity");check(entry.getString("source_session").equals(AtomicWorkbenchPlatform.SESSIONS[0])&&entry.getLong("revision",-1)==f.store.read().revision,"UI metadata missing");});
 test("cross-slot restore reuses durable shelf and commits receiver before source transfer",()->{Fixture f=new Fixture();Bundle first=f.change(SHELVE,f.task);var current=AtomicWorkbenchTaskIdentity.fromBundle(first.getBundle("identity"));Bundle result=f.change(RESTORE,current);check(result.getBoolean("success")&&f.authority.applies==2,"restore not committed once");check(f.store.read().records.size()==1&&f.store.read().records.get(0).disposition.name().equals("RESTORED"),"shelf ownership duplicate/lost");check(f.engine.windows[0].disposition.equals("TRANSFERRED")&&f.engine.windows[1].disposition.equals("WORKSPACE_OWNED")&&f.engine.windows[1].syncs==1,"durable handoff/actual binding missing");});
 test("lost reply after dispatch is read-confirmed without replay",()->{Fixture f=new Fixture();f.authority.loseReply=true;var r=f.request(SHELVE,f.task);Bundle first=f.owner.change(r.toBundle());check(first.getBoolean("operation_unconfirmed")&&!first.getBoolean("success")&&f.owner.blocksWindow(0),"unknown did not isolate source");check(f.owner.change(r.toBundle()).getBoolean("success")&&f.authority.applies==1,"same operation replayed mutation");check(!f.owner.hasPending(),"read-confirmed unknown never converged");});
 test("receiver journal fsync failure preserves pending material and later read confirms",()->{Fixture f=new Fixture();Bundle first=f.change(SHELVE,f.task);var current=AtomicWorkbenchTaskIdentity.fromBundle(first.getBundle("identity"));f.engine.windows[1].failFinish=true;var request=f.request(RESTORE,current);Bundle b=f.owner.change(request.toBundle());check(b.getBoolean("operation_unconfirmed")&&!b.getBoolean("success")&&f.authority.applies==2,"journal failure falsely committed/rolled back");f.engine.windows[1].failFinish=false;check(f.owner.query(request.operationId).getBoolean("success")&&f.authority.applies==2,"receiver recovery replayed mutation or failed");});
 test("prepared restore cancellation restores previous shelf including exact inherited lease",()->{Fixture f=new Fixture();Bundle first=f.change(SHELVE,f.task);var before=f.store.read().records.get(0);var current=AtomicWorkbenchTaskIdentity.fromBundle(first.getBundle("identity"));f.authority.expirePrepared=true;var request=f.request(RESTORE,current);Bundle failed=f.owner.change(request.toBundle());check(failed.getBoolean("operation_unconfirmed")&&f.authority.applies==1,"expired restore dispatched");f.authority.previousLease=before.leaseId;Bundle cancelled=f.owner.cancel(request.operationId);check("CANCELLED".equals(cancelled.getString("status")),"restore cancellation missing");var after=f.store.read().records.get(0);check(after.operationId.equals(before.operationId)&&after.leaseId.equals(before.leaseId)&&after.observedIdentity.displayId==0,"cancellation erased original shelf");});
 test("unknown hide and cleanup failure retain responsibility while backend remains available",()->{Fixture f=new Fixture();f.authority.hideUnknown=true;Bundle b=f.change(SHELVE,f.task);check(b.getBoolean("operation_unconfirmed")&&f.owner.hasPending(),"unknown hide forgotten");f.authority.failCleanup=true;check(!f.owner.cleanup().getBoolean("success")&&f.owner.hasPending(),"failed cleanup falsely complete");f.authority.failCleanup=false;check(f.owner.cleanup().getBoolean("success")&&!f.owner.hasPending(),"cleanup retry failed");});
 test("fresh primary drift and missing query never advertise stale restore",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);f.authority.driftPrimary=true;check(!f.owner.shelf().getBoolean("success"),"different physical display accepted");f.authority.driftPrimary=false;f.authority.failQuery=true;check(!f.owner.shelf().getBoolean("success"),"unqueried historical shelf advertised");});
 test("new owner reconstructs committed result without replay from durable identity",()->{Fixture f=new Fixture();var r=f.request(MOVE_OUT,f.task);Bundle first=f.owner.change(r.toBundle());check(first.getBoolean("success"),"move out failed");f.owner=new AtomicWorkbenchTaskOperations(f.engine,f.authority,f.store);Bundle result=f.owner.query(r.operationId);check(result.getBoolean("success")&&result.getBundle("identity").getInt("display_id")==0&&f.authority.applies==1,"rebuild lost identity or replayed");});
 test("valid early rejection is exact-bound and queryable without a mutation",()->{Fixture f=new Fixture();var r=f.request(SHELVE,f.task);f.engine.parked=true;Bundle b=f.owner.change(r.toBundle());boolean valid=false;try{var parsed=AtomicWorkbenchTaskOperationResult.fromBundle(b,r);valid=parsed.status==AtomicWorkbenchTaskOperationResult.Status.REJECTED&&!parsed.mutationDispatched&&!parsed.cleanupPending;}catch(RuntimeException ignored){}check(valid&&f.authority.applies==0&&f.authority.prepares==0,"early refusal unbound or dispatched");check("REJECTED".equals(f.owner.query(r.operationId).getString("status")),"rejected request query became unknown");});
 test("fresh external activation suppresses stale can_restore",()->{Fixture f=new Fixture();var r=f.request(SHELVE,f.task);f.owner.change(r.toBundle());f.authority.proofs.get(r.operationId).putBoolean("external",true);Bundle state=f.owner.shelf();var entry=(Bundle)state.getParcelableArrayList("entries").get(0);check(state.getBoolean("success")&&!entry.getBoolean("can_restore"),"historical hidden metadata overruled fresh external activation");});
 test("fsync-visible PREPARED without journal cancels no-dispatch uncertainty",()->{Fixture f=new Fixture();var r=f.request(SHELVE,f.task);Os.failDirectorySync=true;Bundle failed=f.owner.change(r.toBundle());check(failed.getBoolean("operation_unconfirmed")&&f.authority.applies==0,"prepare storage uncertainty incorrectly dispatched or completed");Bundle query=f.owner.query(r.operationId);check(query.getBoolean("operation_unconfirmed"),"unconfirmed prepared record vanished");Bundle cancelled=f.owner.cancel(r.operationId);check("CANCELLED".equals(cancelled.getString("status"))&&!cancelled.getBoolean("mutation_dispatched"),"authoritative non-dispatch cancel stuck on UNKNOWN lease/never-written journal");check(f.owner.cleanup().getBoolean("success")&&!f.owner.hasPending(),"re-fsync could not release storage uncertainty");});
 test("only durable PREPARED after owner death cleans from Shelf without journals or replay",()->{Fixture f=new Fixture();var r=f.request(SHELVE,f.task);Os.failDirectorySync=true;f.owner.change(r.toBundle());check(f.authority.applies==0&&f.store.read().records.size()==1&&f.engine.windows[0].phases.isEmpty(),"required pre-journal crash breakpoint not reached");var old=f.task;f.authority.tasks.put(old.taskGeneration,new AtomicWorkbenchTaskIdentity(old.serverBootGeneration,old.taskGeneration,old.taskId,old.taskId,true,old.uid,old.userId,old.baseComponent,old.realComponent,0,"primary","primary-unique"));var nextEngine=new AtomicWorkbenchEngine();for(var window:nextEngine.windows)window.live=false;var nextOwner=new AtomicWorkbenchTaskOperations(nextEngine,f.authority,f.store);Bundle cleaned=nextOwner.cleanup();check(cleaned.getBoolean("success")&&!nextOwner.hasPending()&&f.authority.applies==0,"new owner replayed or lost cleanup-only responsibility");check(f.store.read().records.get(0).phase.name().equals("TERMINAL")&&!f.store.read().records.get(0).hasResponsibility(),"durable responsibility not acknowledged before reset");});
 System.out.println("TASK OPERATIONS RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    jars = list((MODELS['ROOT'] / 'audit-output').rglob('json-*.jar'))
    if not jars:
        raise RuntimeError('local org.json jar required')
    sources = dict(SOURCES)
    sources['ls/augment/com/TestTaskOperations.java'] = TEST
    production = MODELS['PRODUCTION'] + ['AtomicWorkbenchTaskShelfStore.java', 'AtomicWorkbenchRecoveryScope.java', 'AtomicWorkbenchTaskOperations.java',
        'AtomicWorkbenchTaskReferenceRequest.java','AtomicWorkbenchTaskReferenceResult.java','AtomicWorkbenchTaskReferenceSnapshot.java']
    with tempfile.TemporaryDirectory(prefix='duo-task-transactions-') as directory:
        work = Path(directory)
        data = work / 'data'; data.mkdir()
        MODELS['compile_run'](work / 'base', sources, production, 'ls.augment.com.TestTaskOperations', (data,), str(jars[0]))
        controls = [
            ('skip durable MUTATING', 'snapshot = store.update(snapshot.revision, copy(pending, Phase.MUTATING, pending.disposition, leaseState,\n                    lease, false, request.identity));', '/* mutation: no durable MUTATING */'),
            ('skip both journal preparation', 'prepareJournals(request, "MUTATING", lease);', '/* mutation: no journals */'),
            ('replay dispatch', 'proof = authority.apply(request.operationId, ticket);', 'proof = authority.apply(request.operationId, ticket); authority.apply(request.operationId, ticket);'),
            ('drop target durable binding', 'if (disposition == Disposition.RESTORED) finishTarget(committed);', '/* mutation: receiver not acknowledged */'),
            ('restore original cancelled shelf', 'snapshot = store.rollbackPreparedShelfOperation(snapshot.revision, operationId, proof);', 'snapshot = store.read();'),
            ('trust stale restore flag', 'entry.putBoolean("can_restore", restorable);', 'entry.putBoolean("can_restore", true);'),
            ('unbound early rejection', 'return rejectedRequest(request,"task_request_stale");', 'return failure("task_request_stale");'),
        ]
        for number, (label, old, new) in enumerate(controls):
            negative_data=work / f'negative-data-{number}'; negative_data.mkdir()
            result=MODELS['compile_run'](work / f'negative-{number}', sources, production,
                'ls.augment.com.TestTaskOperations', (negative_data,), str(jars[0]),
                {'ls/augment/com/AtomicWorkbenchTaskOperations.java': (old,new)}, capture=True)
            assert result.returncode != 0 and b'AssertionError' in result.stderr, 'transaction negative escaped or failed compilation: '+label
            print('PASS task transaction production negative:',label)
        print('TASK TRANSACTION NEGATIVE CONTROLS',len(controls),'passed')



if __name__ == '__main__':
    main()
