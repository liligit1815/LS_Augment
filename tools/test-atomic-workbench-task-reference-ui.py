"""Execute the real phone reference UI coordinator with explicit Bundle/clock/transport adapters.

This verifies selection, receipt and lifecycle ownership. It does not render Android views or
claim Binder, phone, font, screenshot or accessibility acceptance.
"""
from pathlib import Path
import hashlib
import json
import runpy
import sys
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-operations.py')))
MODELS = BASE['MODELS']
PRODUCTION = ['AtomicWorkbenchTaskIdentity.java', 'AtomicWorkbenchTaskReferenceRequest.java',
              'AtomicWorkbenchTaskReferenceResult.java', 'AtomicWorkbenchTaskReferenceSnapshot.java',
              'AtomicWorkbenchTaskReferenceUiState.java']
TEST = r'''package ls.augment.com;
import android.os.*;import java.util.*;import java.util.concurrent.atomic.*;
import static ls.augment.com.AtomicWorkbenchTaskReferenceRequest.Action.*;
import static ls.augment.com.AtomicWorkbenchTaskReferenceResult.Status.*;
public final class TestReferenceUi {
 static int cases,checks;static String hex(int n){return String.format("%032x",n);}
 interface Run{void run()throws Exception;}static void test(String n,Run r)throws Exception{r.run();cases++;System.out.println("PASS reference UI: "+n);}
 static void check(boolean b,String n){checks++;if(!b)throw new AssertionError(n);}
 static final String SESSION="11111111-1111-1111-1111-111111111111";
 static Bundle row(boolean held){Bundle b=new Bundle();b.putString("shelf_id",hex(2));b.putString("operation_id",hex(3));
  b.putBundle("identity",new AtomicWorkbenchTaskIdentity(hex(4),hex(5),42,42,true,10055,0,"sample/.Base","sample/.Real",0,"primary","primary-unique").toBundle());
  b.putInt("source_slot",0);b.putString("source_session",SESSION);b.putString("phase",held?"COMMITTED":"TERMINAL");
  b.putString("disposition",held?"SHELVED_REFERENCE":"RELEASED");b.putString("lease_state",held?"HELD":"RELEASED");b.putString("lease_id",held?hex(6):"");
  b.putBoolean("has_responsibility",held);b.putBoolean("pending",false);b.putBoolean("forgettable",!held);b.putBoolean("can_release_and_forget",held);return b;}
 static AtomicWorkbenchTaskReferenceSnapshot snap(long rev,boolean held){return snapshot(rev,true,List.of(row(held)));}
 static AtomicWorkbenchTaskReferenceSnapshot snapshot(long rev,boolean success,List<Bundle> rows){Bundle b=new Bundle();b.putInt("schema",1);b.putBoolean("success",success);
  b.putString("reason_code",success?"task_reference_snapshot":"task_reference_unavailable");b.putLong("revision",rev);b.putInt("max_references",64);b.putInt("max_pending",16);
  b.putInt("total_count",rows.size());int held=0,pending=0,forget=0;for(Bundle row:rows){if(row.getBoolean("pending"))pending++;if("HELD".equals(row.getString("lease_state")))held++;if(row.getBoolean("forgettable"))forget++;}
  b.putInt("pending_count",pending);b.putInt("held_count",held);b.putInt("forgettable_count",forget);b.putParcelableArrayList("entries",new ArrayList<>(rows));return AtomicWorkbenchTaskReferenceSnapshot.fromBundle(b);}
 static AtomicWorkbenchTaskReferenceResult receipt(AtomicWorkbenchTaskReferenceRequest r,AtomicWorkbenchTaskReferenceResult.Status status,long rev){
  return new AtomicWorkbenchTaskReferenceResult(r,status,rev,"task_reference_test",false,status==REMOVED,status==REMOVED,status==REMOVED,status==UNCONFIRMED);}
 static Bundle reply(AtomicWorkbenchTaskReferenceRequest r,AtomicWorkbenchTaskReferenceSnapshot s,AtomicWorkbenchTaskReferenceResult queried){
  return AtomicWorkbenchTaskReferenceResult.response(receipt(r,r.action==STATE?SNAPSHOT:REMOVED,s.revision),s,queried);}
 static AtomicWorkbenchTaskReferenceRequest req(Bundle b){return AtomicWorkbenchTaskReferenceRequest.fromBundle(b);}
 static final class F {
  final AtomicWorkbenchTaskReferenceUiState state=new AtomicWorkbenchTaskReferenceUiState();
  final Object client=new Object();final AtomicWorkbenchTaskReferenceUiState.Scope scope=state.bind(client,1,1);
  AtomicWorkbenchTaskReferenceSnapshot snapshot=snap(1,false);int calls,mutations;AtomicWorkbenchTaskReferenceRequest last;
  Bundle normal(Bundle b){var r=req(b);calls++;if(r.action!=STATE){mutations++;last=r;}return reply(r,r.action==STATE?snapshot:AtomicWorkbenchTaskReferenceSnapshot.empty(snapshot.revision+1,true,"task_reference_snapshot"),null);}
  void read(){var w=state.begin(scope,null);check(w!=null,"read could not start");state.run(w,this::normal,()->true);}
  AtomicWorkbenchTaskReferenceUiState.Selection select(){var v=state.view(scope);return new AtomicWorkbenchTaskReferenceUiState.Selection(v.snapshot,v.snapshot.entries.get(0),v.snapshot.entries.get(0).forgettable?FORGET:RELEASE_AND_FORGET);}
  void lost(){var w=state.begin(scope,select());check(w!=null,"mutation could not start");state.run(w,b->{var r=req(b);if(r.action==STATE)return normal(b);mutations++;last=r;throw new Exception("lost after send");},()->true);}
 }
 public static void main(String[]args)throws Exception{SystemClock.now=1000;
 test("confirmed selection performs one fresh read then exactly one bound mutation",()->{for(boolean held:new boolean[]{false,true}){F f=new F();f.snapshot=snap(1,held);f.read();var selected=f.select();var w=f.state.begin(f.scope,selected);f.state.run(w,f::normal,()->true);
  check(f.calls==3&&f.mutations==1,"mutation read/replay count");check(f.last.identity.equals(selected.entry.identity)&&f.last.expectedRevision==1&&f.last.operationId.equals(selected.entry.operationId)&&f.last.sourceSession.equals(SESSION),"selection rebound");check(!f.state.view(f.scope).busy&&f.state.view(f.scope).unconfirmed==0,"successful receipt not settled");}});
 test("changed revision never refreshes authority on behalf of an old confirmation",()->{F f=new F();f.read();var w=f.state.begin(f.scope,f.select());f.snapshot=snap(2,false);f.state.run(w,f::normal,()->true);check(f.mutations==0,"stale confirmation mutated");check(f.state.view(f.scope).notice.contains("重新选择"),"stale selection lacks feedback");});
 test("every reference identity and state field participates in fresh selection",()->{for(int n=0;n<14;n++){F f=new F();f.snapshot=snap(1,true);f.read();var w=f.state.begin(f.scope,f.select());Bundle b=row(true);switch(n){
  case 0:b.putString("shelf_id",hex(20));break;case 1:b.putString("operation_id",hex(20));break;case 2:b.putInt("source_slot",1);break;case 3:b.putString("source_session","22222222-2222-2222-2222-222222222222");break;
  case 4:b.putString("disposition","PASSIVE_BACKGROUND");break;case 5:b.putString("lease_id",hex(20));break;case 6:b.putBoolean("can_release_and_forget",false);break;
  case 7:b.putString("phase","CLEANUP_PENDING");b.putString("lease_state","RELEASE_PENDING");b.putBoolean("pending",true);break;
  default:Bundle id=b.getBundle("identity");switch(n){case 8:id.putInt("root_task_id",20);break;case 9:id.putString("task_generation",hex(20));break;case 10:id.putString("server_boot_generation",hex(20));break;case 11:id.putString("display_unique","recycled");break;case 12:id.putString("real_component","sample/.Other");break;case 13:id.putInt("uid",10066);break;}b.putBundle("identity",id);}
  f.snapshot=snapshot(1,true,List.of(b));f.state.run(w,f::normal,()->true);check(f.mutations==0,"fresh selection omitted field "+n);}});
 test("lost reply survives dialog reopen and STATE never resends the mutation",()->{F f=new F();f.read();f.lost();var lost=f.last;check(f.state.view(f.scope).unconfirmed==1&&!f.state.view(f.scope).available,"uncertain response lost or usable");
  check(f.state.bind(f.client,1,1)==f.scope,"reopen reset request identity");var w=f.state.begin(f.scope,null);f.state.run(w,b->{var r=req(b);check(r.action==STATE&&r.queryRequestId.equals(lost.requestId),"refresh replayed a mutation");return reply(r,AtomicWorkbenchTaskReferenceSnapshot.empty(2,true,"task_reference_snapshot"),null);},()->true);
  check(f.state.view(f.scope).unconfirmed==1&&!f.state.view(f.scope).notice.contains("已移除"),"absence manufactured old success");
  w=f.state.begin(f.scope,null);f.state.run(w,b->reply(req(b),AtomicWorkbenchTaskReferenceSnapshot.empty(2,true,"task_reference_snapshot"),receipt(lost,REMOVED,2)),()->true);check(f.state.view(f.scope).unconfirmed==0&&f.state.view(f.scope).notice.contains("已移除"),"exact known receipt failed to settle");});
 test("foreign query and mutated request receipts fail closed",()->{F f=new F();f.read();f.lost();var old=f.last;var foreign=new AtomicWorkbenchTaskReferenceRequest(hex(100),old.action,"",old.shelfId,old.operationId,old.identity,old.expectedRevision,old.sourceSlot,old.sourceSession,1000,6000);
  var w=f.state.begin(f.scope,null);f.state.run(w,b->reply(req(b),f.snapshot,receipt(foreign,REMOVED,1)),()->true);check(f.state.view(f.scope).unconfirmed==1&&!f.state.view(f.scope).available,"foreign receipt cleared pending");});
 test("unavailable empty snapshot retains previous rows and disables cleanup",()->{F f=new F();f.read();var w=f.state.begin(f.scope,null);f.state.run(w,b->reply(req(b),AtomicWorkbenchTaskReferenceSnapshot.empty(1,false,"task_reference_unavailable"),null),()->true);var v=f.state.view(f.scope);
  check(!v.available&&v.snapshot.entries.size()==1,"unavailable reply erased records");check(f.state.begin(f.scope,f.select())==null,"unavailable view authorized mutation");});
 test("STATE rejection never authorizes cleanup despite an attached successful snapshot",()->{F f=new F();f.read();var w=f.state.begin(f.scope,f.select());f.state.run(w,b->{check(req(b).action==STATE,"rejected read authorized a mutation");return AtomicWorkbenchTaskReferenceResult.response(receipt(req(b),REJECTED,1),f.snapshot,null);},()->true);check(!f.state.view(f.scope).available,"rejected read remained usable");});
 test("closing before dispatch and during the fresh read cancels new mutation",()->{F f=new F();f.read();var w=f.state.begin(f.scope,f.select());int calls=f.calls;f.state.run(w,f::normal,()->false);check(f.calls==calls,"closed view made read call");
  AtomicBoolean live=new AtomicBoolean(true);w=f.state.begin(f.scope,f.select());f.state.run(w,b->{var response=f.normal(b);live.set(false);return response;},live::get);check(f.mutations==0,"closed view dispatched cleanup after read");});
 test("late mutation result settles stored request without needing the closed view",()->{F f=new F();f.read();var w=f.state.begin(f.scope,f.select());AtomicBoolean live=new AtomicBoolean(true);f.state.run(w,b->{var r=req(b);if(r.action!=STATE)live.set(false);return f.normal(b);},live::get);check(f.state.view(f.scope).unconfirmed==0&&!f.state.view(f.scope).busy,"late valid receipt left spurious pending");});
 test("gate is checked again immediately before arming the one mutation",()->{F f=new F();f.read();var w=f.state.begin(f.scope,f.select());AtomicInteger gates=new AtomicInteger();f.state.run(w,f::normal,()->gates.incrementAndGet()<3);check(f.mutations==0&&gates.get()==3,"mutation omitted its final lifecycle check");});
 test("connection replacement keeps one real flight and ignores old continuation",()->{F f=new F();f.read();var w=f.state.begin(f.scope,f.select());AtomicReference<AtomicWorkbenchTaskReferenceUiState.Scope> next=new AtomicReference<>();f.state.run(w,b->{var s=f.state.bind(new Object(),2,1);next.set(s);check(f.state.begin(s,null)==null,"scope switch bypassed actual in-flight worker");return f.normal(b);},()->true);
  check(f.mutations==0&&f.state.view(next.get()).snapshot==null&&!f.state.view(next.get()).busy,"old reply crossed scope");check(f.state.begin(next.get(),null)!=null,"old worker did not release single flight");});
 test("same client with changed session or reset cannot consume an old receipt",()->{for(boolean reset:new boolean[]{false,true}){F f=new F();f.read();var w=f.state.begin(f.scope,f.select());AtomicReference<AtomicWorkbenchTaskReferenceUiState.Scope> next=new AtomicReference<>();f.state.run(w,b->{var r=req(b);if(r.action!=STATE)next.set(f.state.bind(f.client,reset?1:2,reset?2:1));return f.normal(b);},()->true);check(f.state.view(next.get()).snapshot==null&&f.state.view(next.get()).unconfirmed==0,"old scope polluted new state");}});
 test("strict response envelope rejects extra keys and revision regression",()->{for(boolean extra:new boolean[]{false,true}){F f=new F();f.read();var w=f.state.begin(f.scope,null);f.state.run(w,b->{Bundle v=reply(req(b),snap(extra?1:0,false),null);if(extra)v.putString("body","private");return v;},()->true);check(!f.state.view(f.scope).available&&f.state.view(f.scope).snapshot.revision==1,"invalid response published");}});
 test("later explicit confirmed removal frees only the same target and preserves unknown history",()->{F f=new F();f.read();f.lost();f.read();var w=f.state.begin(f.scope,f.select());f.state.run(w,f::normal,()->true);var v=f.state.view(f.scope);check(v.unconfirmed==0&&v.supersededUnknown==1,"same-target later proof did not resolve UI occupancy honestly");});
 test("another removed reference cannot retire unrelated uncertain target identities",()->{for(int n=0;n<5;n++){F f=new F();f.read();f.lost();Bundle b=row(false);switch(n){case 0:b.putString("shelf_id",hex(21));break;case 1:b.putString("operation_id",hex(21));break;case 2:{Bundle task=b.getBundle("identity");task.putString("task_generation",hex(21));b.putBundle("identity",task);break;}case 3:b.putInt("source_slot",1);break;case 4:b.putString("source_session","22222222-2222-2222-2222-222222222222");break;}
  f.snapshot=snapshot(2,true,List.of(b));f.read();var w=f.state.begin(f.scope,f.select());f.state.run(w,f::normal,()->true);var v=f.state.view(f.scope);check(v.unconfirmed==1&&v.supersededUnknown==0,"another target retired old unknown "+n);}});
 test("unknown request bookkeeping is bounded and never evicts oldest for a new mutation",()->{F f=new F();for(int n=0;n<16;n++){f.read();f.lost();}f.read();check(f.state.view(f.scope).unconfirmed==16,"unknown receipts evicted");check(f.state.begin(f.scope,f.select())==null,"unknown bound exceeded");});
 System.out.println("REFERENCE UI RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    sources={key:BASE['SOURCES'][key] for key in ('android/os/Bundle.java','android/os/SystemClock.java','android/os/IBinder.java',
             'ls/augment/com/AtomicWorkbenchProtocol.java')}
    sources['ls/augment/com/TestReferenceUi.java']=TEST
    source_root=MODELS['SRC']
    before={name:hashlib.sha256((source_root/name).read_bytes()).hexdigest() for name in PRODUCTION}
    with tempfile.TemporaryDirectory(prefix='duo-reference-ui-') as temporary:
        work=Path(temporary)
        MODELS['compile_run'](work/'base',sources,PRODUCTION,'ls.augment.com.TestReferenceUi')
        if '--positive' not in sys.argv:
            controls=[
                ('stale revision','fresh.revision!=revision','false'),
                ('recycled task','a.identity.equals(b.identity)','true'),
                ('lost reply replay','transport.exchange(read.toBundle())','transport.exchange(work.query==null?read.toBundle():work.query.toBundle())'),
                ('erase old rows','if(available || snapshot==null || !reply.snapshot.entries.isEmpty()) snapshot=reply.snapshot;','snapshot=reply.snapshot;'),
                ('clear unknown on absence','if(reply.queried!=null && reply.result.status==AtomicWorkbenchTaskReferenceResult.Status.SNAPSHOT) settle(reply.queried);','unconfirmed.clear();'),
                ('cross connection','scope==work.scope','true'),
                ('new worker on scope change','if(value!=scope || running!=null) return null;','if(value!=scope) return null;'),
                ('skip dispatch gate','if(!allowed(gate) || !arm(work,request)) return;','if(!arm(work,request)) return;'),
                ('rejected read authorizes cleanup','if(fresh.result.status!=AtomicWorkbenchTaskReferenceResult.Status.SNAPSHOT) {','if(false) {'),
                ('retire unrelated unknown','if(old.shelfId.equals(current.shelfId) && old.operationId.equals(current.operationId)','if(true'),
                ('bounded receipts','unconfirmed.size()>=MAX_UNCONFIRMED','false'),
            ]
            for index,(label,old,new) in enumerate(controls):
                result=MODELS['compile_run'](work/f'negative-{index}',sources,PRODUCTION,'ls.augment.com.TestReferenceUi',
                    replacements={'ls/augment/com/AtomicWorkbenchTaskReferenceUiState.java':(old,new)},capture=True)
                assert result.returncode!=0 and b'AssertionError' in result.stderr,'negative escaped or did not reach runtime assertion: '+label+'\n'+result.stderr.decode(errors='replace')
                print('PASS reference UI production negative:',label)
            print('REFERENCE UI NEGATIVE CONTROLS',len(controls),'passed')
    after={name:hashlib.sha256((source_root/name).read_bytes()).hexdigest() for name in PRODUCTION}
    assert before==after,'reference UI production changed during verification'
    print(json.dumps({'scope':'actual reference UI coordinator and DTOs; explicit framework/transport adapters',
                      'production_sha256':after,'source_stable':True,'phone_validated':False},sort_keys=True))


if __name__=='__main__':main()
