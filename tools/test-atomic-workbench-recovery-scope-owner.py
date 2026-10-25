"""Actual Store + TaskOperations + Engine scope changes, and actual Root owner methods.

The filesystem and serialized production controllers run together. Platform, broker, clock,
Handler and UI are controlled adapters; these checks do not claim Android/phone execution.
"""
from pathlib import Path
import runpy
import tempfile

STORE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-shelf-store.py')))
TASK = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-engine.py')))
MODELS = STORE['MODELS']
ENGINE = TASK['ENGINE']

AUTHORITY = r'''package ls.augment.com;import android.os.*;import java.util.*;
final class AtomicWorkbenchTaskAuthority{
 interface Authentication{Bundle get()throws Exception;}
 static boolean failCleanup,failQuery;static int cleanups,mutations,queries;AtomicWorkbenchTaskAuthority(android.content.Context c,Authentication a){}
 AtomicWorkbenchTaskAuthority(android.content.Context c,Authentication a,Authentication retained){this(c,a);}
 Bundle capacity(int user){throw new AssertionError("scope observation requested allocation capacity");}
 static void reset(){failCleanup=failQuery=false;cleanups=mutations=queries=0;}
 Bundle cleanup(){cleanups++;Bundle b=new Bundle();b.putBoolean("success",!failCleanup);b.putBoolean("cleanup_pending",failCleanup);return b;}
 Bundle primaryDisplay(){queries++;throw new AssertionError("scope observation queried primary Task");}
 Bundle describe(Bundle b){queries++;throw new AssertionError("scope observation described Tasks");}
 Bundle inspect(ArrayList<String> ids){queries++;throw new AssertionError("scope observation inspected tickets");}
 Bundle prepare(AtomicWorkbenchTaskOperationRequest r){mutations++;throw new AssertionError("scope observation prepared mutation");}
 Bundle apply(String a,String b){mutations++;throw new AssertionError("scope observation applied mutation");}
 Bundle query(String a)throws Exception{queries++;if(failQuery)throw new Exception("controlled readonly query unavailable");throw new AssertionError("scope observation queried mutation");}
 Bundle cancel(String a){mutations++;throw new AssertionError("scope observation cancelled mutation");}
 Bundle release(String a){mutations++;throw new AssertionError("scope observation released mutation");}
}'''

PLATFORM_EXTRA = r'''
 AtomicWorkbenchRecoveryScope.ReaderProfile reader=AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4;
 AtomicWorkbenchPlatform(android.content.Context c,int uid,int user,Handler h,int id,ReadinessReader r,FocusController f,AtomicWorkbenchRecoveryScope.ReaderProfile reader){this(c,uid,user,h,id,r,f);this.reader=reader;}
 int recoveryWindowId(){return id;}AtomicWorkbenchRecoveryScope.ReaderProfile recoveryReaderProfile(){return reader;}
 interface AllocationScopeFence{void require(int target,int source)throws Exception;}AllocationScopeFence allocationScopeFence;
 void configureAllocationScopeFence(AllocationScopeFence fence){allocationScopeFence=fence;}
 static class AllocationScopeRefused extends Exception{AllocationScopeRefused(Exception cause){super(cause);}}
 boolean needsNativeHomeAllocation(){return !live;}boolean needsApplicationAllocation(String component,int task){return !live;}
 Bundle allocateTaskDisplay(Surface s,int w,int h,int d,long g,String a,Runnable commit)throws AllocationScopeRefused{try{allocationScopeFence.require(id,-1);}catch(Exception denied){throw new AllocationScopeRefused(denied);}commit.run();return allocateTaskDisplay(s,w,h,d,g,a);}
 boolean hasTaskJournalSession(String s){return live;}
 Bundle taskWindowIdentity(){Bundle b=new Bundle();b.putInt("window_id",id);b.putString("window_session","11111111-1111-1111-1111-111111111111");b.putInt("display_id",displayId);b.putString("display_name","vd"+id);b.putString("display_unique","unique"+id);return b;}
 void prepareTaskOperation(AtomicWorkbenchTaskOperationRequest r,boolean receiving,String phase,String lease){throw new AssertionError("unexpected task journal mutation");}
 void finishTaskOperation(String o,String b,String g,String d,String s){throw new AssertionError("unexpected task journal mutation");}
 void cancelPreparedTaskOperation(String o,String b,String g,String d,String s){throw new AssertionError("unexpected task journal mutation");}
 void synchronizeTaskOperationBinding(AtomicWorkbenchTaskIdentity id){throw new AssertionError("unexpected task binding mutation");}
'''

TEST = r'''package ls.augment.com;import android.os.*;import android.view.*;import android.content.*;import android.system.*;import java.nio.file.*;import java.util.*;import org.json.*;
public final class TestRecoveryScopeOwner{
 static int cases,checks,sequence;static Path base;interface Run{void run()throws Exception;}
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void test(String name,Run r)throws Exception{AtomicWorkbenchTaskAuthority.reset();Looper.current=Looper.worker;SystemClock.now=1000;Handler.mainPosts=0;try{r.run();cases++;System.out.println("PASS recovery scope owner: "+name);}finally{Os.cleanup();}}
 static Context context()throws Exception{Context c=new Context();Path data=Files.createDirectory(base.resolve("case-"+(++sequence)));c.pm.info.dataDir=data.toString();Os.chown(data.toString(),10055,10055);return c;}
 static Path file(Context c){return Path.of(c.pm.info.dataDir,"files/atomic_workbench/task-shelf.json");}
 static String v1(Context c)throws Exception{AtomicWorkbenchTaskShelfStore s=new AtomicWorkbenchTaskShelfStore(c,10055,0);s.save(0,List.of());return Files.readString(file(c));}
 static void raw(Context c,String text)throws Exception{Files.writeString(file(c),text);Os.chown(file(c).toString(),10055,10055);Os.chmod(file(c).toString(),0600);}
 static String high(String text)throws Exception{return new JSONObject(text).put("schema",2).put("store_epoch","b".repeat(32)).put("retirement_outbox",new JSONArray()).put("recovery_scope",new JSONObject().put("schema",1).put("pool_limit",8).put("phase","HIGH_REQUIRED").put("epoch","c".repeat(32))).toString();}
 static void unknown(Bundle b){check("storage_unverified".equals(b.getString("task_backend_state"))&&!b.getBoolean("task_backend_available")&&b.getBoolean("task_storage_unverified")&&!b.getBoolean("task_scope_verified"),"unknown scope published READY/available facts");check(!b.getBoolean("success")&&b.getBoolean("recovery_pending")&&b.getBoolean("operation_unconfirmed"),"unknown scope became successful or clean");}
 static void ready(Bundle b){check("ready".equals(b.getString("task_backend_state"))&&b.getBoolean("task_backend_available")&&!b.getBoolean("task_storage_unverified")&&b.getBoolean("task_scope_verified")&&b.getString("task_backend_reason").isEmpty(),"readable complete scope did not become READY");}
 static final class Fixture{final Context context;final AtomicWorkbenchTaskShelfStore store;final AtomicWorkbenchEngine engine;final AtomicWorkbenchTaskOperations owner;final String initial;
  Fixture()throws Exception{context=context();initial=v1(context);store=new AtomicWorkbenchTaskShelfStore(context,10055,0);engine=new AtomicWorkbenchEngine(id->new AtomicWorkbenchPlatform(context,10055,0,new Handler(Looper.worker),id));owner=new AtomicWorkbenchTaskOperations(engine,new AtomicWorkbenchTaskAuthority(context,()->new Bundle()),store,()->{});engine.configureTaskOperations(owner);}
  void open(int id){check(engine.openWindow(id,new Surface(),1080,2400,420,"app"+id+"/.Main").getBoolean("success"),"could not open actual Engine slot");}
  AtomicWorkbenchTaskShelfStore.Record reference()throws Exception{return reference(false);}
  AtomicWorkbenchTaskShelfStore.Record reference(boolean held)throws Exception{var identity=new AtomicWorkbenchTaskIdentity("a".repeat(32),"d".repeat(32),42,42,true,10055,0,"app0/.Main","app0/.Main",100,"vd0","unique0");
   var request=new AtomicWorkbenchTaskOperationRequest("e".repeat(32),held?AtomicWorkbenchTaskOperationRequest.Action.SHELVE:AtomicWorkbenchTaskOperationRequest.Action.MOVE_OUT,identity,0,"11111111-1111-1111-1111-111111111111",0,"primary","primary-unique",-1,"","f".repeat(32),store.read().revision,0,1000,6000,"");
   var record=new AtomicWorkbenchTaskShelfStore.Record(AtomicWorkbenchTaskShelfStore.DurableMetadata.fromRequest(request),held?AtomicWorkbenchTaskShelfStore.Phase.COMMITTED:AtomicWorkbenchTaskShelfStore.Phase.TERMINAL,held?AtomicWorkbenchTaskShelfStore.Disposition.SHELVED_REFERENCE:AtomicWorkbenchTaskShelfStore.Disposition.PASSIVE_BACKGROUND,held?AtomicWorkbenchTaskShelfStore.LeaseState.HELD:AtomicWorkbenchTaskShelfStore.LeaseState.RELEASED,held?"9".repeat(32):"",true,0,"primary","primary-unique");store.update(store.read().revision,record);owner.refreshStorageScope();return record;
  }
 }
 public static void main(String[] args)throws Exception{base=Path.of(args[0]);
  test("actual installed controller observes later high scope without being replaced",()->{Fixture f=new Fixture();f.open(0);f.open(1);raw(f.context,high(f.initial));Bundle s=f.engine.status();unknown(s);check(f.engine.taskOperationsConfigured()&&f.engine.taskStorageUnverified()&&f.engine.hasRecoveryPending(),"installed owner or unknown responsibility disappeared");
   check("task_scope_unsupported_full_scope".equals(s.getString("task_backend_reason")),"precise unsupported-scope reason missing");check(f.engine.taskPlatform(0).live&&f.engine.taskPlatform(1).live,"scope observation closed a known window");
   for(Bundle w:s.<Bundle>getParcelableArrayList("windows"))check(!w.getBoolean("task_operation_pending"),"read-only scope uncertainty froze ordinary window input");check(AtomicWorkbenchTaskAuthority.queries==0&&AtomicWorkbenchTaskAuthority.cleanups==0&&AtomicWorkbenchTaskAuthority.mutations==0,"status dispatched a broker action");
  });
  test("scope-only unknown preserves normal focus touch keys and exact existing output attachment",()->{Fixture f=new Fixture();f.open(0);raw(f.context,high(f.initial));unknown(f.engine.status());var p=f.engine.taskPlatform(0);check(f.engine.focusWindow(0).getBoolean("success"),"scope unknown blocked actual current-window focus");int clicks=p.clicks;check(f.engine.inject(0,new MotionEvent(0))&&p.clicks==clicks+1,"scope unknown swallowed actual current-window touch");check(f.engine.key(0,new KeyEvent()),"scope unknown blocked current-window key");int attached=p.attaches;check(f.engine.openWindow(0,new Surface(),1080,2400,420,"app0/.Main").getBoolean("success")&&p.attaches==attached+1,"scope unknown broke same-app output reattachment");
  });
  test("unknown scope still returns every actual window but cannot certify close or no-session",()->{Fixture f=new Fixture();f.open(0);f.open(1);raw(f.context,high(f.initial));Bundle b=f.engine.close();unknown(b);check(!b.getBoolean("no_session")&&f.owner.hasPending()&&f.engine.hasRecoveryPending(),"close lost sticky unknown scope");for(int id=0;id<4;id++)check(f.engine.taskPlatform(id).fullCloses==1&&!f.engine.taskPlatform(id).live,"unknown store prevented known window cleanup");check(AtomicWorkbenchTaskAuthority.cleanups==0&&AtomicWorkbenchTaskAuthority.mutations==0,"unsupported scope dispatched broker cleanup");
  });
  test("complete reread restores READY while failed actual cleanup remains pending",()->{Fixture f=new Fixture();f.reference();String saved=Files.readString(file(f.context));raw(f.context,high(saved));unknown(f.engine.close());raw(f.context,saved);AtomicWorkbenchTaskAuthority.failCleanup=true;Bundle b=f.engine.close();ready(b);check(!b.getBoolean("success")&&b.getBoolean("recovery_pending")&&f.owner.hasPending()&&f.engine.hasRecoveryPending(),"read success was confused with actual cleanup success");Bundle s=f.engine.status();ready(s);check(!s.getBoolean("success")&&s.getBoolean("recovery_pending")&&s.getString("message").contains("清理尚未确认"),"READY hid pending cleanup from status");
   AtomicWorkbenchTaskAuthority.failCleanup=false;Bundle done=f.engine.close();ready(done);check(done.getBoolean("success")&&!done.getBoolean("recovery_pending")&&!f.owner.hasPending()&&!f.engine.hasRecoveryPending(),"old sticky cleanup state self-locked after genuine recovery");check(AtomicWorkbenchTaskAuthority.cleanups==2&&AtomicWorkbenchTaskAuthority.mutations==0,"recovery replayed a task action");
  });
  test("readonly reread alone never clears an earlier known cleanup failure",()->{Fixture f=new Fixture();f.reference();AtomicWorkbenchTaskAuthority.failCleanup=true;check(!f.engine.close().getBoolean("success"),"broker failure became successful");AtomicWorkbenchTaskAuthority.failCleanup=false;int count=AtomicWorkbenchTaskAuthority.cleanups;Bundle s=f.engine.status();ready(s);check(!s.getBoolean("success")&&s.getBoolean("recovery_pending")&&f.owner.hasPending()&&AtomicWorkbenchTaskAuthority.cleanups==count,"status replayed cleanup or converted pending receipt to success");check(f.engine.close().getBoolean("success"),"explicit cleanup could not converge");
  });
  test("malformed store is dynamic unknown and actual reread heals scope without mutation",()->{Fixture f=new Fixture();raw(f.context,"{}");unknown(f.engine.status());check(f.owner.storageScopeUnverified(),"malformed read did not persist unknown");raw(f.context,f.initial);Bundle s=f.engine.status();ready(s);check(s.getBoolean("success")&&!f.owner.storageScopeUnverified()&&AtomicWorkbenchTaskAuthority.cleanups==0,"scope reread mutated or failed to heal");
  });
  test("one status performs one bounded complete Store read and no broker work",()->{Fixture f=new Fixture();int reads=Os.shelfReads;for(int i=0;i<8;i++)f.engine.status();check(Os.shelfReads-reads==8,"status made duplicate/unbounded or skipped scope reads");check(AtomicWorkbenchTaskAuthority.queries==0&&AtomicWorkbenchTaskAuthority.cleanups==0&&AtomicWorkbenchTaskAuthority.mutations==0,"scope refresh touched broker state");
  });
  test("actual STATE read failure disables cached reference actions without freezing current input",()->{Fixture f=new Fixture();f.open(0);var record=f.reference();Bundle initial=f.owner.manageReferences(AtomicWorkbenchTaskReferenceRequest.state("1".repeat(32),"",1000).toBundle());var known=AtomicWorkbenchTaskReferenceSnapshot.fromBundle(initial.getBundle("snapshot"));check(known.success&&known.totalCount==1&&known.entries.get(0).forgettable,"readable cached reference did not expose normal action");
   String old=Files.readString(file(f.context));raw(f.context,high(old));Bundle failed=f.owner.manageReferences(AtomicWorkbenchTaskReferenceRequest.state("2".repeat(32),"",1000).toBundle());var stale=AtomicWorkbenchTaskReferenceSnapshot.fromBundle(failed.getBundle("snapshot"));check(!stale.success&&stale.reasonCode.equals("task_reference_scope_unverified")&&stale.totalCount==1&&!stale.entries.get(0).forgettable&&!stale.entries.get(0).canReleaseAndForget&&stale.entries.get(0).operationId.equals(record.operationId),"unknown scope exposed stale actions or erased original cached record");
   check(!f.owner.blocksWindow(0)&&f.engine.focusWindow(0).getBoolean("success"),"pure STATE read failure became dispatched storage uncertainty");int clicks=f.engine.taskPlatform(0).clicks;check(f.engine.inject(0,new MotionEvent(0))&&f.engine.taskPlatform(0).clicks==clicks+1,"pure read failure swallowed actual input");raw(f.context,old);ready(f.engine.status());check(!f.owner.blocksWindow(0)&&AtomicWorkbenchTaskAuthority.mutations==0,"readonly recovery mutated task resources");
   Fixture h=new Fixture();h.reference(true);var knownHeld=AtomicWorkbenchTaskReferenceSnapshot.fromBundle(h.owner.manageReferences(AtomicWorkbenchTaskReferenceRequest.state("4".repeat(32),"",1000).toBundle()).getBundle("snapshot"));check(knownHeld.entries.get(0).canReleaseAndForget,"normal HELD reference did not offer explicit release");raw(h.context,high(Files.readString(file(h.context))));var unknownHeld=AtomicWorkbenchTaskReferenceSnapshot.fromBundle(h.owner.manageReferences(AtomicWorkbenchTaskReferenceRequest.state("5".repeat(32),"",1000).toBundle()).getBundle("snapshot"));check(!unknownHeld.success&&!unknownHeld.entries.get(0).canReleaseAndForget&&unknownHeld.entries.get(0).hasResponsibility,"scope failure enabled release or erased held responsibility");
  });
  test("actual FORGET fsync uncertainty remains blocked after scope-only reread heals",()->{Fixture f=new Fixture();f.open(0);var record=f.reference();var r=new AtomicWorkbenchTaskReferenceRequest("3".repeat(32),AtomicWorkbenchTaskReferenceRequest.Action.FORGET,"",record.shelfId,record.operationId,record.metadata.identity,f.store.read().revision,record.metadata.sourceSlot,record.metadata.sourceWindowSession,1000,6000);
   Os.failDirectorySync=true;Bundle response=f.owner.manageReferences(r.toBundle());check(f.owner.blocksWindow(0)&&f.owner.hasPending(),"actual uncertain write lost its resource guard");String actual=Files.readString(file(f.context));raw(f.context,high(actual));unknown(f.engine.status());raw(f.context,actual);Bundle ready=f.engine.status();ready(ready);check(!ready.getBoolean("success")&&ready.getBoolean("recovery_pending")&&f.owner.blocksWindow(0),"successful scope read cleared actual write uncertainty");check(!f.engine.focusWindow(0).getBoolean("success"),"write-uncertain owner accepted focus");check(f.engine.close().getBoolean("success")&&!f.owner.hasPending(),"actual cleanup and complete-store fsync could not clear uncertainty");
  });
  test("change initial read failure preserves cached operation without inventing a write",()->{Fixture f=new Fixture();f.open(0);var record=f.reference();var m=record.metadata;var request=new AtomicWorkbenchTaskOperationRequest(m.operationId,m.action,m.identity,m.sourceSlot,m.sourceWindowSession,m.targetDisplayId,m.targetDisplayName,m.targetDisplayUnique,m.targetSlot,m.targetWindowSession,m.shelfId,m.expectedRevision,m.inputRevision,m.issuedElapsed,m.deadlineElapsed,"");raw(f.context,high(Files.readString(file(f.context))));byte[] before=Files.readAllBytes(file(f.context));Bundle result=f.owner.change(request.toBundle());check(!result.getBoolean("success")&&result.getBoolean("operation_unconfirmed"),"unreadable existing operation was falsely confirmed");check(f.owner.storageScopeUnverified()&&!f.owner.blocksWindow(0)&&f.engine.focusWindow(0).getBoolean("success"),"initial read failure blindly wrote cached phase or froze input");check(Arrays.equals(before,Files.readAllBytes(file(f.context)))&&AtomicWorkbenchTaskAuthority.mutations==0&&AtomicWorkbenchTaskAuthority.queries==0,"read failure mutated durable or broker state");
  });
  test("readable existing operation with readonly query failure does not invent a pending write",()->{Fixture f=new Fixture();f.open(0);var record=f.reference(true);var m=record.metadata;var request=new AtomicWorkbenchTaskOperationRequest(m.operationId,m.action,m.identity,m.sourceSlot,m.sourceWindowSession,m.targetDisplayId,m.targetDisplayName,m.targetDisplayUnique,m.targetSlot,m.targetWindowSession,m.shelfId,m.expectedRevision,m.inputRevision,m.issuedElapsed,m.deadlineElapsed,"");byte[] before=Files.readAllBytes(file(f.context));AtomicWorkbenchTaskAuthority.failQuery=true;Bundle result=f.owner.change(request.toBundle());check(!result.getBoolean("success")&&result.getBoolean("operation_unconfirmed")&&!f.owner.storageScopeUnverified(),"readonly broker failure changed verified storage scope");check(!f.owner.blocksWindow(0)&&Arrays.equals(before,Files.readAllBytes(file(f.context)))&&AtomicWorkbenchTaskAuthority.queries==1&&AtomicWorkbenchTaskAuthority.mutations==0,"readonly failure blindly persisted a new task phase");
  });
  test("new operation failing readonly window validation never begins preparation",()->{Fixture f=new Fixture();f.open(0);var record=f.reference();var m=record.metadata;var request=new AtomicWorkbenchTaskOperationRequest("6".repeat(32),m.action,m.identity,m.sourceSlot,"22222222-2222-2222-2222-222222222222",m.targetDisplayId,m.targetDisplayName,m.targetDisplayUnique,m.targetSlot,m.targetWindowSession,m.shelfId,f.store.read().revision,f.engine.taskInputRevision(),1000,6000,"");byte[] before=Files.readAllBytes(file(f.context));Bundle result=f.owner.change(request.toBundle());check(!result.getBoolean("success")&&!f.owner.blocksWindow(0)&&!f.owner.storageScopeUnverified(),"prevalidation failure invented dispatch/storage uncertainty");check(Arrays.equals(before,Files.readAllBytes(file(f.context)))&&AtomicWorkbenchTaskAuthority.mutations==0&&AtomicWorkbenchTaskAuthority.queries==0,"prevalidation failure touched Store or Broker mutation");
  });
  test("actual Root owns eight recovery slots while legacy reader remains fail closed",()->{ScopeRoot r=new ScopeRoot();Context c=context();r.context.pm.info.dataDir=c.pm.info.dataDir;String original=v1(r.context);raw(r.context,high(original));var engine=r.backend();check(engine.taskOperationsConfigured()&&!engine.taskStorageUnverified(),"full reader did not read high scope");check(engine.recoveryDomain()==AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8,"Root lacks full recovery domain");for(int id=0;id<8;id++)check(engine.recoveryOwners().platform(id).recoveryWindowId()==id,"missing high recovery owner");ready(engine.status());r.closing=true;check(r.closeOnce().getBoolean("success"),"verified empty full-scope cleanup failed");});
  test("actual Root constructor rejects unreadable scope before controller publication",()->{ScopeRoot r=new ScopeRoot();Context c=context();r.context.pm.info.dataDir=c.pm.info.dataDir;String original=v1(r.context);raw(r.context,"{}");var owner=r.backend();check(!owner.taskOperationsConfigured()&&owner.taskStorageUnverified(),"Root published unreadable scope as verified");r.closing=true;unknown(r.closeOnce());r.finishLater();check(!r.finished&&Handler.mainPosts==0&&r.engine.waiting.containsKey(r.recover),"Root exited unknown full scope");
  });
  test("actual Root installed owner remains alive across dynamic read failure and recovery",()->{Fixture stored=new Fixture();stored.reference();ScopeRoot r=new ScopeRoot();r.context.pm.info.dataDir=stored.context.pm.info.dataDir;String original=Files.readString(file(r.context));var engine=r.backend();check(engine.taskOperationsConfigured(),"Root did not publish actual readable controller");engine.openWindow(0,new Surface(),1080,2400,420,"app0/.Main");raw(r.context,"{}");unknown(engine.status());r.closing=true;unknown(r.closeOnce());r.finishLater();check(!r.finished&&r.backend==engine&&Handler.mainPosts==0,"Root destroyed/replaced unknown installed owner");
   raw(r.context,original);AtomicWorkbenchTaskAuthority.failCleanup=true;r.engine.run(r.recover);check(!r.finished&&r.backend==engine&&engine.status().getBoolean("task_scope_verified"),"Root treated scope-ready as cleanup-confirmed");r.finishLater();check(!r.finished&&Handler.mainPosts==0,"Root final guard accepted READY with actual cleanup unknown");AtomicWorkbenchTaskAuthority.failCleanup=false;r.engine.run(r.recover);check(r.finished&&Handler.mainPosts==1&&r.backend==engine,"Root could not finish after real reread and cleanup");
  });
  test("actual Root completion returns to owner lane before inspecting mutable recovery facts",()->{ScopeRoot r=new ScopeRoot();Context c=context();r.context.pm.info.dataDir=c.pm.info.dataDir;String original=v1(r.context);var engine=r.backend();raw(r.context,"{}");unknown(engine.status());Looper.current=Looper.main;r.finishLater();check(!r.finished&&Handler.mainPosts==0&&!r.engine.waiting.isEmpty(),"off-lane completion inspected owners or exited directly");Runnable queued=r.engine.waiting.keySet().stream().filter(x->x!=r.maintainWindows&&x!=r.recover).findFirst().orElse(null);check(queued!=null,"off-lane completion did not queue its owner-lane check");Looper.current=Looper.worker;r.engine.run(queued);check(!r.finished&&r.engine.waiting.containsKey(r.recover),"owner-lane final guard lost unknown scope");
  });
  System.out.println("RECOVERY SCOPE OWNER RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def sources():
    values = TASK['root_scope_sources']()
    for key, value in STORE['SYSTEM'].items():
        values[key] = value
    values['android/system/Os.java'] = values['android/system/Os.java'].replace('public static int fileSyncs,directorySyncs,renames;', 'public static int fileSyncs,directorySyncs,renames,shelfReads;').replace('Path p=Path.of(key(path));boolean exists=', 'if(new File(path).getName().equals("task-shelf.json")&&(flags&(OsConstants.O_WRONLY|OsConstants.O_RDWR))==0)shelfReads++;Path p=Path.of(key(path));boolean exists=')
    values['ls/augment/com/AtomicWorkbenchPlatform.java'] = values['ls/augment/com/AtomicWorkbenchPlatform.java'].rsplit('}', 1)[0] + PLATFORM_EXTRA + '}'
    # The real FULL8 projection requires explicit typed owner facts, including
    # clean/absent output state. Mirror this transport shape in the platform double.
    values['ls/augment/com/AtomicWorkbenchPlatform.java'] = values['ls/augment/com/AtomicWorkbenchPlatform.java'].replace(
        'b.putInt("window_id",id);b.putBoolean("success",',
        'b.putInt("window_id",id);b.putString("window_session",live?"11111111-1111-1111-1111-111111111111":"");b.putString("display_name",live?"vd"+id:"");b.putString("display_unique_id",live?"unique"+id:"");b.putBoolean("task_recovery_pending",pending);b.putBoolean("output_attached_known",true);for(String key:new String[]{"operation_unconfirmed","input_focus_cleanup_pending","guard_cleanup_pending","input_cancel_pending","input_rebind_pending","output_transition_pending"})b.putBoolean(key,false);b.putBoolean("success",')
    values['ls/augment/com/AtomicWorkbenchTaskAuthority.java'] = AUTHORITY
    values.pop('ls/augment/com/AtomicWorkbenchTaskShelfStore.java')
    values.pop('ls/augment/com/AtomicWorkbenchTaskOperations.java')
    values.pop('ls/augment/com/TestRootRecoveryScope.java')
    values['ls/augment/com/TestRecoveryScopeOwner.java'] = TEST
    values['ls/augment/com/ResetWriteFence.java'] = 'package ls.augment.com;final class ResetWriteFence{static boolean owns(){return false;}}'
    values['android/os/Bundle.java'] = values['android/os/Bundle.java'].rsplit('}',1)[0] + r'''
 public Bundle deepCopy(){Bundle b=new Bundle();for(var e:data.entrySet())b.data.put(e.getKey(),copyValue(e.getValue()));return b;}
 private static Object copyValue(Object v){if(v instanceof Bundle)return ((Bundle)v).deepCopy();if(v instanceof java.util.ArrayList<?>){java.util.ArrayList<Object> a=new java.util.ArrayList<>();for(Object i:(java.util.ArrayList<?>)v)a.add(copyValue(i));return a;}return v;}}'''
    values['android/view/MotionEvent.java'] = values['android/view/MotionEvent.java'].rsplit('}',1)[0] + 'public static final int ACTION_MOVE=2;public long getDownTime(){return 1;}public int getPointerId(int i){return i;}public int getDeviceId(){return 1;}public int getPointerCount(){return 1;}}'
    # Use the actual recovery projection. Only the unrelated authentication
    # transport is controlled; scope, ownership and finish guards stay production.
    root = (MODELS['SRC'] / 'AtomicWorkbenchRoot.java').read_text(encoding='utf-8')
    projection = TASK['LIFECYCLE']['member'](root, 'private Bundle recoveryState(')
    values['ls/augment/com/ScopeRoot.java'] = values['ls/augment/com/ScopeRoot.java'].rsplit('}',1)[0] + projection + 'Bundle retainedTaskCleanupMetadata(){throw new AssertionError("unexpected retained authentication transport");}}'
    return values


def main():
    values = sources()
    production = MODELS['PRODUCTION'] + ['AtomicWorkbenchEngine.java', 'AtomicWorkbenchProtocol.java',
        'AtomicWorkbenchTaskShelfStore.java', 'AtomicWorkbenchRecoveryScope.java', 'AtomicWorkbenchTaskOperations.java',
        'AtomicWorkbenchTaskReferenceRequest.java', 'AtomicWorkbenchTaskReferenceResult.java', 'AtomicWorkbenchTaskReferenceSnapshot.java',
        'AtomicWorkbenchRecoveryOwners.java', 'AtomicWorkbenchSlotDomain.java']
    values, production = ENGINE['output_support'](values, production)
    jars = list((Path.home() / '.gradle/caches/modules-2/files-2.1/org.json/json').glob('*/*/*.jar'))
    with tempfile.TemporaryDirectory(prefix='duo-recovery-scope-owner-') as tmp:
        work = Path(tmp); data = work / 'data'; data.mkdir()
        MODELS['compile_run'](work / 'base', values, production, 'ls.augment.com.TestRecoveryScopeOwner', (data,), str(jars[0]))
        controls = [
            ('status must reread actual scope', 'AtomicWorkbenchEngine.java', 'if(taskController!=null) taskController.refreshStorageScope();', ''),
            ('dynamic installed scope reaches Engine', 'AtomicWorkbenchEngine.java', 'taskStorageUnverified || taskController != null && taskController.storageScopeUnverified()', 'taskStorageUnverified'),
            ('full successful reread clears only scope unknown', 'AtomicWorkbenchTaskOperations.java', 'storageScopeUnverified=!read.scopeConsistent;', ''),
            ('known cleanup pending remains distinct from scope READY', 'AtomicWorkbenchEngine.java', '} else if(taskController!=null && taskController.hasPending()) {', '} else if(false) {'),
            ('cleanup failure remains sticky after return', 'AtomicWorkbenchTaskOperations.java', 'cleanupUnconfirmed=pending;', ''),
            ('successful later cleanup is not self-locked', 'AtomicWorkbenchTaskOperations.java', 'pending |= pendingRecordsOrStorage();', 'pending |= hasPending();'),
            ('pure scope uncertainty must not freeze current input', 'AtomicWorkbenchTaskOperations.java', 'return storageUncertain;', 'return storageUncertain || storageScopeUnverified;'),
            ('pure STATE read failure is not write uncertainty', 'AtomicWorkbenchTaskOperations.java', 'if(released||wrote) storageUncertain=true;', 'storageUncertain=true;'),
            ('unknown cached reference snapshot is unavailable', 'AtomicWorkbenchTaskOperations.java', 'b.putBoolean("success",!storageUncertain&&!storageScopeUnverified)', 'b.putBoolean("success",!storageUncertain)'),
            ('unknown cached reference cannot offer forget', 'AtomicWorkbenchTaskOperations.java', '!storageUncertain&&!storageScopeUnverified&&!r.hasResponsibility()', '!storageUncertain&&!r.hasResponsibility()'),
            ('unknown cached reference cannot offer release', 'AtomicWorkbenchTaskOperations.java', '||referenceReleasePending(r))&&!storageScopeUnverified;', '||referenceReleasePending(r));'),
            ('scope reread cannot clear prior write uncertainty', 'AtomicWorkbenchTaskOperations.java', 'storageScopeUnverified=!read.scopeConsistent;', 'storageUncertain=false; storageScopeUnverified=!read.scopeConsistent;'),
            ('initial read failure never blindly persists cached operation', 'AtomicWorkbenchTaskOperations.java', 'if(!preparationStarted) return unknown(record,"task_read_or_validation_unconfirmed");', ''),
            ('Root must retain unknown scope', 'ScopeRoot.java', 'if (current != null && current.hasRecoveryPending()) {', 'if (false) {'),
            ('Root completion observes owners on their lane', 'ScopeRoot.java', 'if (Looper.myLooper() != engine.getLooper()) {', 'if (false) {'),
        ]
        for index, (label, name, old, new) in enumerate(controls):
            data = work / ('negative-data-' + str(index)); data.mkdir()
            result = MODELS['compile_run'](work / ('negative-' + str(index)), values, production,
                'ls.augment.com.TestRecoveryScopeOwner', (data,), str(jars[0]), {'ls/augment/com/' + name: (old, new)}, capture=True)
            if result.returncode == 0 or b'AssertionError' not in result.stderr:
                raise AssertionError('scope owner negative escaped or failed compilation: ' + label + '\n' + result.stderr.decode(errors='replace'))
            print('PASS recovery scope owner production negative:', label)
        print('RECOVERY SCOPE OWNER NEGATIVE CONTROLS', len(controls), 'passed')


if __name__ == '__main__':
    main()
