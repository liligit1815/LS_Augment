"""C9 reference management against real TaskOperations/Store/DTOs and temporary files.

Android service/journal adapters remain explicit. No device, UI, or real app data is used.
"""
from pathlib import Path
import runpy
import sys
import tempfile

BASE=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-operations.py')))
MODELS=BASE['MODELS']
SOURCES=dict(BASE['SOURCES'])
authority=SOURCES['ls/augment/com/AtomicWorkbenchTaskAuthority.java']
authority=authority.replace('int applies,prepares;', 'int applies,prepares,releases,queries,cleanups;String badRelease="";boolean throwAfterRelease,checkReferenceWal=true;Runnable onRelease;')
authority=authority.replace('Bundle query(String id)throws Exception{', 'Bundle query(String id)throws Exception{queries++;')
authority=authority.replace('b.putBoolean("cleanup_complete",false);', 'b.putBoolean("cleanup_complete",false);b.putBoolean("inherited_hidden_lease",false);b.putString("inherited_lease_id","");')
authority=authority.replace('Bundle cleanup(){', 'Bundle cleanup(){cleanups++;')
start=authority.index(' Bundle release(String id)')
end=authority.index(' Bundle cleanup()',start)
authority=authority[:start]+r''' Bundle release(String id)throws Exception{
 releases++;if(failCleanup)throw new Exception("cleanup blocked");
 var record=store.read().records.stream().filter(r->r.operationId.equals(id)).findFirst().orElseThrow();
 if(checkReferenceWal&&(record.phase!=AtomicWorkbenchTaskShelfStore.Phase.CLEANUP_PENDING||record.leaseState!=AtomicWorkbenchTaskShelfStore.LeaseState.RELEASE_PENDING
   &&!(record.leaseState==AtomicWorkbenchTaskShelfStore.LeaseState.RELEASED&&proofs.get(id).getBoolean("cleanup_complete"))))
  throw new AssertionError("release before durable responsibility");
 Bundle b=query(id);b.putBoolean("cleanup_complete",true);b.putBoolean("cleanup_pending",false);b.putBoolean("operation_unconfirmed",false);
 b.putBoolean("hidden_lease",false);b.putString("lease_id","");b.putBoolean("inherited_hidden_lease",false);b.putString("inherited_lease_id","");b.putBoolean("success",false);
 proofs.put(id,new Bundle(b));if(onRelease!=null)onRelease.run();if(throwAfterRelease)throw new Exception("after exact unhide");
 switch(badRelease){case "op":b.putString("operation_id","0".repeat(32));break;case "identity":{Bundle v=b.getBundle("identity");v.putString("task_generation","0".repeat(32));b.putBundle("identity",v);break;}
 case "hidden":b.putBoolean("hidden_lease",true);break;case "inherited":b.putBoolean("inherited_hidden_lease",true);break;case "lease":b.putString("lease_id","0".repeat(32));break;
 case "pending":b.putBoolean("cleanup_pending",true);break;case "unconfirmed":b.putBoolean("operation_unconfirmed",true);break;case "complete":b.putBoolean("cleanup_complete",false);break;
 case "typed":b.putString("ended","false");break;case "missing_identity":b.remove("identity");break;}
 return b;
 }
''' + authority[end:]
SOURCES['ls/augment/com/AtomicWorkbenchTaskAuthority.java']=authority
platform=SOURCES['ls/augment/com/AtomicWorkbenchPlatform.java']
platform=platform.replace('int prepares,finishes,syncs;', 'int prepares,finishes,syncs;Runnable beforeFinish;')
platform=platform.replace('throws Exception{if(failFinish)', 'throws Exception{if(beforeFinish!=null)beforeFinish.run();if(failFinish)')
SOURCES['ls/augment/com/AtomicWorkbenchPlatform.java']=platform
PREFIX=BASE['TEST'].split(' public static void main(String[]args)',1)[0]
PREFIX=PREFIX.replace('int operation;','int operation,authCalls;boolean authCurrent=true,expireInAuth;')
PREFIX=PREFIX.replace('owner=new AtomicWorkbenchTaskOperations(engine,authority,store);',
    'owner=new AtomicWorkbenchTaskOperations(engine,authority,store,()->{authCalls++;if(expireInAuth)SystemClock.now+=5001;if(!authCurrent)throw new SecurityException("reset or user changed");});')
TEST=PREFIX+r'''
 static AtomicWorkbenchTaskReferenceRequest reference(Fixture f,AtomicWorkbenchTaskReferenceRequest.Action action)throws Exception{
  var s=f.store.read();var r=s.records.get(0);return new AtomicWorkbenchTaskReferenceRequest(hex(700000+(++seq)),action,"",r.shelfId,r.operationId,
   r.observedIdentity==null?r.metadata.identity:r.observedIdentity,s.revision,r.metadata.sourceSlot,r.metadata.sourceWindowSession,SystemClock.now,SystemClock.now+5000);
 }
 static AtomicWorkbenchTaskReferenceResult result(Bundle b,AtomicWorkbenchTaskReferenceRequest r){check(b.keySet().equals(Set.of("schema","result","snapshot","queried_result")),"response keys");return AtomicWorkbenchTaskReferenceResult.fromBundle(b.getBundle("result"),r);}
 static AtomicWorkbenchTaskReferenceSnapshot snapshot(Bundle b){return AtomicWorkbenchTaskReferenceSnapshot.fromBundle(b.getBundle("snapshot"));}
 static Bundle state(Fixture f,String query){return f.owner.manageReferences(AtomicWorkbenchTaskReferenceRequest.state(hex(800000+(++seq)),query,SystemClock.now).toBundle());}
 static AtomicWorkbenchTaskShelfStore.Record terminal(Fixture f,int n)throws Exception{
  var t=new AtomicWorkbenchTaskIdentity("a".repeat(32),hex(900000+n),100+n,100+n,true,10055,0,"sample/.Base","sample/.Real",88,"vd0","unique0");
  var r=new AtomicWorkbenchTaskOperationRequest(hex(910000+n),MOVE_OUT,t,0,AtomicWorkbenchPlatform.SESSIONS[0],0,"primary","primary-unique",-1,"",hex(920000+n),0,0,1000,6000,"");
  return new AtomicWorkbenchTaskShelfStore.Record(AtomicWorkbenchTaskShelfStore.DurableMetadata.fromRequest(r),AtomicWorkbenchTaskShelfStore.Phase.TERMINAL,
   AtomicWorkbenchTaskShelfStore.Disposition.RELEASED,AtomicWorkbenchTaskShelfStore.LeaseState.RELEASED,"",false,0,"primary","primary-unique");
 }
 static void rejected(Runnable r){boolean bad=false;try{r.run();}catch(IllegalArgumentException expected){bad=true;}check(bad,"invalid DTO accepted");}
 static void pendingOnDisk(Fixture f){try{check(f.store.read().records.get(0).hasResponsibility(),"Journal saw already forgettable Store");}catch(Exception failure){throw new AssertionError(failure);}}
 public static void main(String[]args)throws Exception{root=Path.of(args[0]);
 test("STATE only reads facts and unknown receipt never becomes prior success",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);long revision=f.store.read().revision;int query=f.authority.queries,rename=Os.renames;
  Bundle b=state(f,hex(123));var s=snapshot(b);check(s.success&&s.totalCount==1&&s.heldCount==1&&!s.entries.get(0).forgettable,"wrong capacity/facts");check(b.getBundle("queried_result").isEmpty(),"unknown receipt fabricated");
  check(f.authority.queries==query&&f.authority.releases==0&&f.authority.cleanups==0&&f.authority.applies==1&&Os.renames==rename&&f.store.read().revision==revision,"STATE dispatched cleanup or writes");});
 test("FORGET deletes only completed exact reference without touching real task",()->{Fixture f=new Fixture();f.change(MOVE_OUT,f.task);var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);var reply=f.owner.manageReferences(r.toBundle());
  var result=result(reply,r);check(result.success&&result.referenceRemoved&&result.storeCommitted&&f.store.read().records.isEmpty(),"terminal not removed durably");check(f.authority.releases==0&&f.authority.cleanups==0&&f.authority.applies==1&&f.authority.tasks.size()==1,"forget touched app task");
  Bundle observation=state(f,r.requestId);check(AtomicWorkbenchTaskReferenceResult.fromBundle(observation.getBundle("queried_result"),r).referenceRemoved,"known receipt binding missing");});
 test("64 terminal references never evict; exact forget recovers one unit of capacity",()->{Fixture f=new Fixture();ArrayList<AtomicWorkbenchTaskShelfStore.Record> all=new ArrayList<>();for(int i=0;i<64;i++)all.add(terminal(f,i));f.store.save(0,all);
  boolean full=false;try{f.store.update(f.store.read().revision,terminal(f,64));}catch(Exception expected){full=true;}check(full&&f.store.read().records.size()==64,"capacity silently evicted old reference");
  var request=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);check(result(f.owner.manageReferences(request.toBundle()),request).referenceRemoved,"explicit forget refused");
  f.store.update(f.store.read().revision,terminal(f,64));check(f.store.read().records.size()==64&&f.store.read().find(all.get(0).shelfId)==null,"capacity was not reclaimed exactly");});
 test("HELD and UNKNOWN references cannot be forgotten",()->{for(boolean unknown:new boolean[]{false,true}){Fixture f=new Fixture();f.change(SHELVE,f.task);var record=f.store.read().records.get(0);if(unknown)f.store.update(f.store.read().revision,new AtomicWorkbenchTaskShelfStore.Record(record.metadata,
   AtomicWorkbenchTaskShelfStore.Phase.VERIFY_PENDING,record.disposition,AtomicWorkbenchTaskShelfStore.LeaseState.UNKNOWN,record.leaseId,true,record.actualDisplayId,record.actualDisplayName,record.actualDisplayUnique,record.observedIdentity));
  var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);long rev=f.store.read().revision;check(result(f.owner.manageReferences(r.toBundle()),r).status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED,"responsibility forgotten");check(f.store.read().revision==rev&&f.authority.releases==0&&f.owner.hasPending()==unknown,"pending responsibility changed");}});
 test("every selection field and CAS is rechecked before disk mutation",()->{for(int variant=0;variant<8;variant++){Fixture f=new Fixture();f.change(MOVE_OUT,f.task);var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);Bundle b=r.toBundle();switch(variant){case 0:b.putString("shelf_id",hex(999));break;case 1:b.putString("operation_id",hex(999));break;case 2:{Bundle id=b.getBundle("identity");id.putString("task_generation",hex(999));b.putBundle("identity",id);break;}case 3:b.putInt("source_slot",1);break;case 4:b.putString("source_session",AtomicWorkbenchPlatform.SESSIONS[1]);break;case 5:{Bundle id=b.getBundle("identity");id.putInt("root_task_id",999);b.putBundle("identity",id);break;}case 6:f.store.save(f.store.read().revision,f.store.read().records);break;case 7:{Bundle id=b.getBundle("identity");id.putInt("uid",10066);b.putBundle("identity",id);break;}}
  var selected=AtomicWorkbenchTaskReferenceRequest.fromBundle(b);long before=f.store.read().revision;check(result(f.owner.manageReferences(b),selected).status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED,"stale selection accepted");check(f.store.read().records.size()==1&&f.store.read().revision==before&&f.authority.releases==0,"selection mismatch changed disk or task");}});
 test("expired request is clearly not dispatched and duplicate receipt never repeats removal",()->{Fixture f=new Fixture();f.change(MOVE_OUT,f.task);var expired=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);SystemClock.now+=5001;
  check(result(f.owner.manageReferences(expired.toBundle()),expired).status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED&&f.store.read().records.size()==1,"expired request was not rejected");var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);var first=result(f.owner.manageReferences(r.toBundle()),r);int renames=Os.renames;var again=result(f.owner.manageReferences(r.toBundle()),r);check(first.referenceRemoved&&again.referenceRemoved&&Os.renames==renames,"lost reply replayed remove");});
 test("release original held lease before forgetting and preserve unrelated tasks",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);var b=f.owner.manageReferences(r.toBundle());
  check(result(b,r).referenceRemoved&&f.authority.releases==1&&f.authority.cleanups==0&&f.authority.applies==1,"exact release was skipped or global");check(f.store.read().records.isEmpty()&&f.authority.tasks.size()==1&&f.engine.windows[0].live,"release ended app or window");});
 test("partial or mismatched release proof preserves pending durable responsibility",()->{for(String bad:new String[]{"op","identity","hidden","inherited","lease","pending","unconfirmed","complete","typed","missing_identity"}){Fixture f=new Fixture();f.change(SHELVE,f.task);f.authority.badRelease=bad;var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);var b=f.owner.manageReferences(r.toBundle());
  check(result(b,r).operationUnconfirmed&&!result(b,r).referenceRemoved,"partial release proof certified forget: "+bad);check(f.store.read().records.size()==1&&f.store.read().records.get(0).hasResponsibility(),"partial release lost responsibility: "+bad);int releases=f.authority.releases,query=f.authority.queries,renames=Os.renames;
  var observed=state(f,r.requestId);check(AtomicWorkbenchTaskReferenceResult.fromBundle(observed.getBundle("queried_result"),r).operationUnconfirmed&&f.authority.releases==releases&&f.authority.queries==query&&Os.renames==renames,"STATE resumed unknown cleanup: "+bad);}});
 test("lost release reply can be observed and finished without automatic forget or release replay",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);f.authority.throwAfterRelease=true;var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);check(result(f.owner.manageReferences(r.toBundle()),r).operationUnconfirmed,"lost release not unknown");f.authority.throwAfterRelease=false;
  f.owner.query(r.operationId);var record=f.store.read().records.get(0);check(!record.hasResponsibility()&&record.phase==AtomicWorkbenchTaskShelfStore.Phase.TERMINAL&&f.authority.releases==1,"query replayed release or lost cleanup");check(f.store.read().records.size()==1,"query automatically forgot reference");
  var next=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);check(result(f.owner.manageReferences(next.toBundle()),next).referenceRemoved&&f.authority.applies==1&&f.authority.releases==1,"explicit follow-up did not forget only record");});
 test("journal failure remains durable pending until actual completion, even across owner recreation",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);f.engine.windows[0].failFinish=true;var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);check(result(f.owner.manageReferences(r.toBundle()),r).operationUnconfirmed,"journal failure certified forget");var record=f.store.read().records.get(0);
  check(record.phase==AtomicWorkbenchTaskShelfStore.Phase.CLEANUP_PENDING&&record.leaseState==AtomicWorkbenchTaskShelfStore.LeaseState.RELEASED&&record.hasResponsibility(),"journal crash gap dropped responsibility");
  f.owner=new AtomicWorkbenchTaskOperations(f.engine,f.authority,f.store,()->{});check(state(f,r.requestId).getBundle("queried_result").isEmpty(),"new Root fabricated old receipt");f.engine.windows[0].failFinish=false;f.owner.query(r.operationId);check(!f.store.read().records.get(0).hasResponsibility()&&f.authority.releases==1,"recreated owner failed cleanup or replayed release");});
 test("directory fsync uncertainty before release retains owner and never dispatches cleanup",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);Os.failDirectorySync=true;var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);var b=f.owner.manageReferences(r.toBundle());check(result(b,r).operationUnconfirmed&&f.authority.releases==0&&f.store.read().records.get(0).hasResponsibility(),"uncertain prepare forgot/dispatched");
  int renames=Os.renames;var s=snapshot(state(f,r.requestId));check(!s.success&&!s.entries.get(0).forgettable&&!s.entries.get(0).canReleaseAndForget&&Os.renames==renames,"STATE repaired or hid storage uncertainty");});
 test("delete rename without directory fsync never claims removal and never automatically re-deletes",()->{Fixture f=new Fixture();f.change(MOVE_OUT,f.task);Os.failDirectorySync=true;var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);var b=f.owner.manageReferences(r.toBundle());check(result(b,r).operationUnconfirmed&&!result(b,r).referenceRemoved,"uncertain delete marked removed");int renames=Os.renames;var q=state(f,r.requestId);check(!snapshot(q).success&&AtomicWorkbenchTaskReferenceResult.fromBundle(q.getBundle("queried_result"),r).operationUnconfirmed&&Os.renames==renames,"query silently re-deleted or certified fsync");});
 test("TTL after service side effect preserves cleanup result but does not perform late forget",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);f.authority.onRelease=()->SystemClock.now+=5001;var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);var b=f.owner.manageReferences(r.toBundle());check(result(b,r).operationUnconfirmed&&!result(b,r).referenceRemoved&&f.store.read().records.size()==1&&!f.store.read().records.get(0).hasResponsibility(),"late request forgot or discarded cleanup");});
 test("DTOs reject wrong types keys stale schema wide TTL and mismatched receipts",()->{Fixture f=new Fixture();f.change(MOVE_OUT,f.task);var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);for(int variant=0;variant<5;variant++){Bundle b=r.toBundle();switch(variant){case 0:b.putInt("schema",2);break;case 1:b.putString("body","secret");break;case 2:b.putString("expected_revision","1");break;case 3:b.putLong("deadline_elapsed",r.issuedElapsed+5001);break;case 4:b.putInt("source_slot",AtomicWorkbenchProtocol.WINDOW_COUNT);break;}rejected(()->AtomicWorkbenchTaskReferenceRequest.fromBundle(b));}
  var good=new AtomicWorkbenchTaskReferenceResult(r,AtomicWorkbenchTaskReferenceResult.Status.REJECTED,1,"task_reference_test",false,false,false,false,false);Bundle wrong=good.toBundle();wrong.putBoolean("success",true);rejected(()->AtomicWorkbenchTaskReferenceResult.fromBundle(wrong));var other=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);rejected(()->AtomicWorkbenchTaskReferenceResult.fromBundle(good.toBundle(),other));
  var s=snapshot(state(f,""));boolean immutable=false;try{s.entries.clear();}catch(UnsupportedOperationException expected){immutable=true;}check(immutable,"snapshot list mutable");Bundle bs=s.toBundle();bs.putInt("total_count",99);rejected(()->AtomicWorkbenchTaskReferenceSnapshot.fromBundle(bs));});
 test("UID1000 application task remains eligible and closed origin session is only a binding",()->{Fixture f=new Fixture();var old=f.task;var t=new AtomicWorkbenchTaskIdentity(old.serverBootGeneration,old.taskGeneration,old.taskId,old.rootTaskId,true,1000,0,"clock/.Main","clock/.Main",88,"vd0","unique0");
  f.authority.tasks.put(t.taskGeneration,t);check(f.change(SHELVE,t).getBoolean("success"),"UID1000 ordinary app was excluded");f.engine.windows[0].live=false;var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);check(result(f.owner.manageReferences(r.toBundle()),r).referenceRemoved&&f.authority.releases==1,"closed original window prevented exact owned cleanup");});
 test("explicit fresh retry of original cleanup never reapplies or globally releases",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);f.authority.throwAfterRelease=true;var first=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);check(result(f.owner.manageReferences(first.toBundle()),first).operationUnconfirmed,"required first uncertainty not captured");f.authority.throwAfterRelease=false;
  var retry=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);check(result(f.owner.manageReferences(retry.toBundle()),retry).referenceRemoved&&f.authority.releases==1&&f.authority.applies==1&&f.authority.cleanups==0,"retry reapplied or repeated completed cleanup");
  check(AtomicWorkbenchTaskReferenceResult.fromBundle(state(f,first.requestId).getBundle("queried_result"),first).operationUnconfirmed,"later removal forged earlier operation success");});
 test("same request UUID cannot be rebound and a malformed snapshot cannot grant forget",()->{Fixture f=new Fixture();f.change(MOVE_OUT,f.task);var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);result(f.owner.manageReferences(r.toBundle()),r);Bundle rebound=r.toBundle();rebound.putString("shelf_id",hex(999));var changed=AtomicWorkbenchTaskReferenceRequest.fromBundle(rebound);int writes=Os.renames;
  check(result(f.owner.manageReferences(rebound),changed).status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED&&Os.renames==writes,"request UUID rebound mutation");check(AtomicWorkbenchTaskReferenceResult.fromBundle(state(f,r.requestId).getBundle("queried_result"),r).referenceRemoved,"rebound overwrote original receipt");
  Fixture held=new Fixture();held.change(SHELVE,held.task);Bundle s=snapshot(state(held,"")).toBundle();ArrayList<Bundle> rows=s.getParcelableArrayList("entries");Bundle row=new Bundle(rows.get(0));row.putBoolean("forgettable",true);rows.set(0,row);s.putParcelableArrayList("entries",rows);s.putInt("forgettable_count",1);rejected(()->AtomicWorkbenchTaskReferenceSnapshot.fromBundle(s));});
 test("last blocking session check rejects reset user changes and TTL after Provider",()->{for(int v=0;v<3;v++){Fixture f=new Fixture();f.change(MOVE_OUT,f.task);var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);long revision=f.store.read().revision;if(v==0)f.authCurrent=false;if(v==1)f.expireInAuth=true;if(v==2)f.owner=new AtomicWorkbenchTaskOperations(f.engine,f.authority,f.store);var reply=result(f.owner.manageReferences(r.toBundle()),r);check(reply.status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED&&f.store.read().revision==revision&&f.store.read().records.size()==1,"late authorization changed reference");if(v<2)check(f.authCalls==1,"final fresh authorization missing");}});
 test("closing cleanup preserves pending journal responsibility without requiring new session authorization",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);f.authority.failCleanup=true;var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);check(result(f.owner.manageReferences(r.toBundle()),r).operationUnconfirmed,"cleanup failure not retained");f.authority.failCleanup=false;f.authority.badRelease="op";check(!f.owner.cleanup().getBoolean("success")&&f.store.read().records.get(0).hasResponsibility(),"closing cleanup accepted wrong operation proof");f.authority.badRelease="";f.authority.failPrimary=true;f.authCurrent=false;f.engine.windows[0].failFinish=true;
  check(!f.owner.cleanup().getBoolean("success")&&f.store.read().records.get(0).hasResponsibility(),"closing bypassed Journal acknowledgement or required fresh mutation auth");f.engine.windows[0].failFinish=false;check(f.owner.cleanup().getBoolean("success")&&!f.owner.hasPending(),"exact closing cleanup cannot finish after normal session retires");check(f.store.read().records.size()==1&&!f.store.read().records.get(0).hasResponsibility()&&f.authority.applies==1,"close automatically forgot or replayed app task");});
 test("legacy cancel observes reference cleanup without retiring a failed Journal or replaying release",()->{Fixture f=new Fixture();f.change(SHELVE,f.task);f.engine.windows[0].failFinish=true;var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);check(result(f.owner.manageReferences(r.toBundle()),r).operationUnconfirmed,"journal failure not retained");
  check(f.owner.cancel(r.operationId).getBoolean("operation_unconfirmed")&&f.store.read().records.get(0).hasResponsibility(),"legacy cancel retired reference before Journal acknowledgement");check(f.authority.releases==1&&f.authority.applies==1,"legacy cancel replayed mutation");
  f.engine.windows[0].failFinish=false;f.owner.cancel(r.operationId);check(!f.store.read().records.get(0).hasResponsibility()&&f.store.read().records.size()==1&&f.authority.releases==1,"legacy cancel failed cleanup or automatically forgot");
  Fixture partial=new Fixture();partial.change(SHELVE,partial.task);partial.authority.failCleanup=true;var pending=reference(partial,AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET);check(result(partial.owner.manageReferences(pending.toBundle()),pending).operationUnconfirmed,"required pending release missing");partial.authority.failCleanup=false;partial.authority.proofs.get(pending.operationId).putBoolean("cleanup_complete",true);
  check(partial.owner.cancel(pending.operationId).getBoolean("operation_unconfirmed")&&partial.store.read().records.get(0).hasResponsibility(),"legacy cancel accepted incomplete hidden-lease retirement proof");});
 test("normal postcondition Store remains durable pending until Journal retirement and query never reapplies",()->{for(var action:new AtomicWorkbenchTaskOperationRequest.Action[]{SHELVE,MOVE_OUT,END_TASK}){Fixture f=new Fixture();f.engine.windows[0].beforeFinish=()->pendingOnDisk(f);f.engine.windows[0].failFinish=true;var r=f.request(action,f.task);check(f.owner.change(r.toBundle()).getBoolean("operation_unconfirmed")&&f.store.read().records.get(0).hasResponsibility(),"initial Journal failure became forgettable");
  f.engine.windows[0].failFinish=false;check(f.owner.query(r.operationId).getBoolean("success")&&f.authority.applies==1,"Journal-only confirmation reapplied task");var record=f.store.read().records.get(0);check(record.phase==AtomicWorkbenchTaskShelfStore.Phase.COMMITTED&&!record.pending(),"successful journal did not commit");}});
 test("generic external confirmation never exposes failed initial Journal as forgettable",()->{Fixture f=new Fixture();f.engine.windows[0].failFinish=true;var operation=f.request(SHELVE,f.task);check(f.owner.change(operation.toBundle()).getBoolean("operation_unconfirmed"),"required initial Journal breakpoint missing");Bundle proof=f.authority.proofs.get(operation.operationId);proof.putBoolean("external",true);proof.putBoolean("hidden_lease",false);proof.putString("lease_id","");proof.putBoolean("cleanup_complete",true);
  check(f.owner.query(operation.operationId).getBoolean("operation_unconfirmed")&&f.store.read().records.get(0).hasResponsibility(),"external confirmation retired failed Journal");var r=reference(f,AtomicWorkbenchTaskReferenceRequest.Action.FORGET);check(result(f.owner.manageReferences(r.toBundle()),r).status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED,"FORGET deleted old Journal responsibility");
  f.engine.windows[0].failFinish=false;f.owner.query(operation.operationId);check(!f.store.read().records.get(0).hasResponsibility()&&f.authority.applies==1,"external cleanup could not finish without replay");});
 test("generic closing cleanup retains failed Journal without applying C9 primary-only proof",()->{for(boolean dispatched:new boolean[]{false,true}){Fixture f=new Fixture();f.authority.checkReferenceWal=false;f.authority.expirePrepared=!dispatched;var r=f.request(SHELVE,f.task);f.owner.change(r.toBundle());f.engine.windows[0].failFinish=true;check(!f.owner.cleanup().getBoolean("success")&&f.store.read().records.get(0).hasResponsibility(),"generic close retired failed Journal");
  f.engine.windows[0].failFinish=false;check(f.owner.cleanup().getBoolean("success")&&!f.owner.hasPending(),"generic cleanup stuck on inapplicable physical0 proof");var record=f.store.read().records.get(0);check(record.phase==AtomicWorkbenchTaskShelfStore.Phase.TERMINAL&&f.authority.applies==(dispatched?1:0)&&record.actualDisplayId==(dispatched?0:88),"cleanup replayed or moved un-dispatched VD task");}});
 test("non-dispatch cancel keeps original or previous durable owner until all Journals acknowledge",()->{for(boolean previous:new boolean[]{false,true}){Fixture f=new Fixture();AtomicWorkbenchTaskIdentity id=f.task;if(previous){Bundle first=f.change(SHELVE,id);id=AtomicWorkbenchTaskIdentity.fromBundle(first.getBundle("identity"));f.authority.previousLease=f.store.read().records.get(0).leaseId;}f.authority.expirePrepared=true;var r=f.request(previous?RESTORE:SHELVE,id);f.owner.change(r.toBundle());int slot=previous?1:0;f.engine.windows[slot].failFinish=true;
  check(f.owner.cancel(r.operationId).getBoolean("operation_unconfirmed")&&f.store.read().records.get(0).operationId.equals(r.operationId)&&f.store.read().records.get(0).hasResponsibility(),"cancel retired original/previous owner before Journal");f.engine.windows[slot].failFinish=false;check("CANCELLED".equals(f.owner.cancel(r.operationId).getString("status"))&&f.authority.applies==(previous?1:0),"cancel retry reapplied or remained stuck");}});
 test("generic query cancel and closing final Store fsync uncertainty never grants FORGET",()->{for(int path=0;path<3;path++){Fixture f=new Fixture();f.authority.checkReferenceWal=false;
  var operation=f.request(path==0?MOVE_OUT:SHELVE,f.task);if(path==0)f.engine.windows[0].failFinish=true;if(path==1)f.authority.expirePrepared=true;f.owner.change(operation.toBundle());f.engine.windows[0].failFinish=false;f.engine.windows[0].beforeFinish=()->Os.failDirectorySync=true;
  Bundle response=path==0?f.owner.query(operation.operationId):path==1?f.owner.cancel(operation.operationId):f.owner.cleanup();check(response.getBoolean("operation_unconfirmed")&&!response.getBoolean("success"),"generic final fsync falsely completed: "+path);
  var observed=snapshot(state(f,""));check(!observed.success&&!observed.entries.get(0).forgettable&&!observed.entries.get(0).canReleaseAndForget,"generic final fsync lost uncertainty: "+path);check(f.authority.applies==(path==1?0:1),"generic final fsync replayed real task");
  f.engine.windows[0].beforeFinish=null;check(f.owner.cleanup().getBoolean("success")&&!f.owner.hasPending(),"actual whole-store re-fsync cannot confirm cleanup: "+path);}});
 System.out.println("TASK REFERENCE RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    sources=dict(SOURCES);sources['ls/augment/com/TestTaskOperations.java']=TEST
    production=MODELS['PRODUCTION']+['AtomicWorkbenchTaskShelfStore.java','AtomicWorkbenchRecoveryScope.java','AtomicWorkbenchTaskOperations.java',
        'AtomicWorkbenchTaskReferenceRequest.java','AtomicWorkbenchTaskReferenceResult.java','AtomicWorkbenchTaskReferenceSnapshot.java']
    jars=list((MODELS['ROOT']/'audit-output').rglob('json-*.jar'))
    with tempfile.TemporaryDirectory(prefix='duo-task-references-') as tmp:
        work=Path(tmp);data=work/'data';data.mkdir()
        MODELS['compile_run'](work/'base',sources,production,'ls.augment.com.TestTaskOperations',(data,),str(jars[0]))
        if '--positive' in sys.argv:return
        controls=[
            ('skip responsibility gate','if(record.hasResponsibility()||record.previous!=null)','if(false)'),
            ('skip exact source binding','&&record.metadata.sourceWindowSession.equals(r.sourceSession)',''),
            ('skip full task identity','selected.equals(r.identity)','true'),
            ('skip CAS selection','r.expectedRevision!=snapshot.revision','false'),
            ('skip release proof','if(!completeReferenceRelease(record,proof)) throw new SecurityException("task_reference_release_unconfirmed");','/* no proof */'),
            ('forget before release','proof=authority.release(record.operationId);','proof=authority.release(record.operationId); snapshot=store.remove(snapshot.revision,r.shelfId);'),
            ('drop pre-release WAL','LeaseState.RELEASE_PENDING,record.leaseId,record.dispatched,null)','LeaseState.RELEASED,record.leaseId,record.dispatched,null)'),
            ('retire journal early','snapshot=store.update(snapshot.revision,pending);','snapshot=store.update(snapshot.revision,copy(pending,Phase.TERMINAL,disposition,LeaseState.RELEASED,record.leaseId,pending.dispatched,live));'),
            ('skip journal completion','finishJournals(pending,disposition==Disposition.ENDED?"ENDED":"SHELVED_REFERENCE","");','/* no journal completion */'),
            ('STATE dispatches cleanup','AtomicWorkbenchTaskReferenceResult queried=referenceReplies.get(r.queryRequestId);','authority.cleanup(); AtomicWorkbenchTaskReferenceResult queried=referenceReplies.get(r.queryRequestId);'),
            ('skip final authorization','requireReferenceCurrent(r); wrote=true;','wrote=true;'),
            ('skip TTL after final Provider','r.requireFresh(SystemClock.elapsedRealtime()); // Recheck after the blocking Provider proof.','/* no final TTL */'),
            ('closing cleanup keeps WAL until Journal','if(referenceReleasePending(record)) {\n                    try { finishReferenceRelease(record,authority.release(record.operationId)); }\n                    catch(Exception incomplete) { pending=true; }\n                    continue;\n                }','/* old terminal-before-journal cleanup */'),
            ('legacy cancel keeps reference WAL','if (referenceReleasePending(record)) return query(operationId);','/* old generic cancel */'),
            ('generic close keeps original WAL','String durableDisposition = disposition == Disposition.ENDED ? "ENDED"','snapshot = store.update(snapshot.revision, clean); String durableDisposition = disposition == Disposition.ENDED ? "ENDED"'),
            ('generic external keeps original WAL','finishJournals(clean, disposition == Disposition.ENDED ? "ENDED" : "SHELVED_REFERENCE", "");','snapshot = store.update(snapshot.revision, clean); finishJournals(clean, disposition == Disposition.ENDED ? "ENDED" : "SHELVED_REFERENCE", "");'),
            ('normal commit keeps pending WAL','copy(record, Phase.VERIFY_PENDING,\n                committed.disposition, committed.leaseState, committed.leaseId, true, identity)','committed'),
            ('cancel keeps original WAL','finishCancelledJournals(record, "WORKSPACE_OWNED");','snapshot = store.update(snapshot.revision, terminal); finishCancelledJournals(record, "WORKSPACE_OWNED");'),
            ('cancel keeps previous WAL','if (record.previous != null) {','if (record.previous != null) { snapshot = store.rollbackPreparedShelfOperation(snapshot.revision, operationId, proof);'),
            ('query keeps fsync uncertainty','if (unavailable instanceof AtomicWorkbenchTaskShelfStore.SaveException) storageUncertain = true;\n            Record record = findOperation(operationId);\n            return record == null ? failure("task_query_unavailable")','Record record = findOperation(operationId);\n            return record == null ? failure("task_query_unavailable")'),
            ('cancel keeps fsync uncertainty','if (unavailable instanceof AtomicWorkbenchTaskShelfStore.SaveException) storageUncertain = true;\n            Record record = findOperation(operationId);\n            return record == null ? failure("task_cancel_unavailable")','Record record = findOperation(operationId);\n            return record == null ? failure("task_cancel_unavailable")'),
            ('cleanup keeps fsync uncertainty','if (unavailable instanceof AtomicWorkbenchTaskShelfStore.SaveException) storageUncertain = true;\n            pending = true;','pending = true;'),
        ]
        controls += [
            ('request TTL bound','deadlineElapsed - issuedElapsed > MAX_LIFETIME_MS','false'),
            ('request exact keys','keys(b,KEYS); schema(b);','schema(b);'),
            ('receipt success derivation','r.success!=bool(b,"success")','false'),
            ('snapshot responsibility gate','forgettable&&hasResponsibility','false'),
        ]
        for i,(label,old,new) in enumerate(controls):
            d=work/f'negative-data-{i}';d.mkdir()
            name='AtomicWorkbenchTaskOperations.java'
            if label.startswith('request '):name='AtomicWorkbenchTaskReferenceRequest.java'
            if label.startswith('receipt '):name='AtomicWorkbenchTaskReferenceResult.java'
            if label.startswith('snapshot '):name='AtomicWorkbenchTaskReferenceSnapshot.java'
            r=MODELS['compile_run'](work/f'negative-{i}',sources,production,'ls.augment.com.TestTaskOperations',(d,),str(jars[0]),
                {'ls/augment/com/'+name:(old,new)},capture=True)
            assert r.returncode!=0 and b'AssertionError' in r.stderr,'negative escaped or failed compilation: '+label
            print('PASS task reference production negative:',label)
        print('TASK REFERENCE NEGATIVE CONTROLS',len(controls),'passed')


if __name__=='__main__':main()
