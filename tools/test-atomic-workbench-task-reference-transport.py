"""Execute the actual Root TX39 body, Engine unavailable receipt and Client writer."""
from pathlib import Path
import runpy
import tempfile

MODELS=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-models.py')))
BROKER=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-broker.py')))
MEMBER=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-lifecycle.py')))['member']
SRC=MODELS['SRC']

def branch():
    source=(SRC/'AtomicWorkbenchRoot.java').read_text(encoding='utf-8')
    start='} else if (code == AtomicWorkbenchProtocol.TX_TASK_REFERENCES) {'
    return source.split(start,1)[1].split('} else if (code == AtomicWorkbenchProtocol.TX_FOCUS_WINDOW)',1)[0]

SOURCES={
    'android/os/Bundle.java':BROKER['SOURCES']['android/os/Bundle.java'].replace('extends HashMap<String,Object>{','extends HashMap<String,Object>{public static final Object CREATOR=new Object();'),
    'android/os/IBinder.java':'package android.os;public interface IBinder{}',
    'android/os/SystemClock.java':BROKER['SOURCES']['android/os/SystemClock.java'],
    'android/os/Parcel.java':r'''package android.os;public class Parcel{public Object value;public int size=1000,reads;public boolean tail;public Parcel(Object v){value=v;}public int dataSize(){return size;}public <T>T readTypedObject(Object c){reads++;return (T)value;}public void writeTypedObject(Object v,int flags){value=v;}public void enforceNoDataAvail(){if(tail)throw new IllegalArgumentException("tail");}}''',
    'ls/augment/com/AtomicWorkbenchProtocol.java':r'''package ls.augment.com;import android.os.Bundle;final class AtomicWorkbenchProtocol{static final int WINDOW_COUNT=4,TX_TASK_REFERENCES=39;static Bundle failure(String reason){Bundle b=new Bundle();b.putBoolean("operation_unconfirmed",true);return b;}}''',
}
HEAD=r'''package ls.augment.com;import android.os.*;import java.util.*;
class ReferenceTransportHarness{
 boolean closing,finished,current=true,expireDuringAuth,closeDuringAuth;long providerSession=10,providerResetGeneration=11;int executions,mode;java.util.concurrent.Callable<Bundle> late;
 final AtomicWorkbenchEngine engine=new AtomicWorkbenchEngine();
 boolean registeredSessionCurrent(long session,long reset){if(session!=10||reset!=11)throw new AssertionError("session fence args");if(expireDuringAuth)SystemClock.now=7001;if(closeDuringAuth)closing=true;return current;}
 AtomicWorkbenchEngine backend(){return engine;}
 Bundle executeInputMetadata(java.util.concurrent.Callable<Bundle> c)throws Exception{executions++;if(mode==1){late=c;return AtomicWorkbenchProtocol.failure("timeout");}return c.call();}
 Bundle run(Parcel data,Parcel reply,int flags)throws Exception{Bundle state;
'''
TAIL=r'''
 return state;}
 static int cases,checks;
 interface Test{void run()throws Exception;}static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static void test(String name,Test c)throws Exception{SystemClock.now=1000;c.run();cases++;System.out.println("PASS task reference transport: "+name);}
 static AtomicWorkbenchTaskReferenceRequest state(){return AtomicWorkbenchTaskReferenceRequest.state("a".repeat(32),"",1000);}
 static void reject(Test c)throws Exception{boolean failed=false;try{c.run();}catch(IllegalArgumentException|SecurityException expected){failed=true;}check(failed,"invalid transport accepted");}
 static AtomicWorkbenchTaskReferenceResult result(Bundle b){check(b.keySet().equals(Set.of("schema","result","snapshot","queried_result")),"reply shape");return AtomicWorkbenchTaskReferenceResult.fromBundle(b.getBundle("result"),state());}
 public static void main(String[] args)throws Exception{
 test("exact typed metadata reaches backend once",()->{var h=new ReferenceTransportHarness();var b=h.run(new Parcel(state().toBundle()),new Parcel(null),0);check(h.engine.calls==1&&h.executions==1,"metadata not once");check(result(b).status==AtomicWorkbenchTaskReferenceResult.Status.SNAPSHOT,"state result lost");});
 test("wrong flags missing reply oversized input tail and untyped request reject before backend",()->{for(int i=0;i<5;i++){var h=new ReferenceTransportHarness();var p=new Parcel(state().toBundle());if(i==2)p.size=16385;if(i==3)p.tail=true;if(i==4)((Bundle)p.value).putString("request_id","invalid");final int v=i;reject(()->h.run(p,v==1?null:new Parcel(null),v==0?1:0));check(h.engine.calls==0,"invalid input reached engine");}});
 test("close reset owner expiry cannot dispatch management",()->{for(int i=0;i<5;i++){var h=new ReferenceTransportHarness();if(i==0)h.closing=true;if(i==1)h.finished=true;if(i==2)h.current=false;if(i==3)h.expireDuringAuth=true;if(i==4)SystemClock.now=7001;var r=result(h.run(new Parcel(state().toBundle()),new Parcel(null),0));check(r.status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED&&!r.releaseAttempted&&!r.writeAttempted&&h.engine.calls==0,"stale metadata dispatched or false unknown");}});
 test("metadata timeout returns typed uncertainty without global recovery or late replay",()->{var h=new ReferenceTransportHarness();h.mode=1;var r=result(h.run(new Parcel(state().toBundle()),new Parcel(null),0));check(r.operationUnconfirmed&&h.engine.calls==0,"timeout false success/dispatched");SystemClock.now=7001;var late=h.late.call();check(AtomicWorkbenchTaskReferenceResult.fromBundle(late.getBundle("result"),state()).status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED&&h.engine.calls==0,"late queued metadata expired into backend");});
 test("Client freezes typed metadata and sends only private task TX39",()->{var c=new ClientReferenceHarness();Bundle original=state().toBundle();c.manageTaskReferences(original);original.putString("request_id","0".repeat(32));check(c.code==39&&c.workers==1&&AtomicWorkbenchTaskReferenceRequest.fromBundle(c.sent).requestId.equals("a".repeat(32)),"client mutation escaped freeze or wrong TX");SystemClock.now=7001;boolean expired=false;try{c.manageTaskReferences(state().toBundle());}catch(IllegalArgumentException expected){expired=true;}check(expired&&c.requests==1,"expired client request dispatched");});
 test("actual Engine route preserves typed unavailable and dispatches controller once",()->{var e=new AtomicWorkbenchEngine();var unavailable=e.actualManageTaskReferences(state().toBundle());check(result(unavailable).status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED,"missing controller gave generic failure");final int[] calls={0};final Bundle expected=new Bundle();e.taskController=new AtomicWorkbenchEngine.TaskController(){public Bundle change(Bundle b){throw new AssertionError();}public Bundle query(String id){throw new AssertionError();}public Bundle shelf(){throw new AssertionError();}public Bundle cancel(String id){throw new AssertionError();}public Bundle cleanup(){throw new AssertionError();}public void maintain(){throw new AssertionError();}public boolean hasPending(){return false;}public boolean blocksWindow(int id){return false;}public Bundle manageReferences(Bundle b){calls[0]++;return expected;}};check(e.actualManageTaskReferences(state().toBundle())==expected&&calls[0]==1,"engine routed management to task action/cleanup");});
 test("actual Root final authorization samples closing after blocking Provider",()->{var valid=new ReferenceTransportHarness();valid.requireReferenceSession();for(int i=0;i<3;i++){var h=new ReferenceTransportHarness();if(i==0)h.current=false;if(i==1)h.closing=true;if(i==2)h.closeDuringAuth=true;reject(()->h.requireReferenceSession());check(h.engine.calls==0,"final permit touched task backend");}});
 System.out.println("TASK REFERENCE TRANSPORT RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''

def main():
    engine=(SRC/'AtomicWorkbenchEngine.java').read_text(encoding='utf-8')
    root=(SRC/'AtomicWorkbenchRoot.java').read_text(encoding='utf-8')
    client=(SRC/'AtomicWorkbenchClient.java').read_text(encoding='utf-8')
    sources=dict(SOURCES)
    sources['ls/augment/com/AtomicWorkbenchEngine.java']='''package ls.augment.com;import android.os.*;class AtomicWorkbenchEngine{int calls;Bundle manageTaskReferences(Bundle b){calls++;var r=AtomicWorkbenchTaskReferenceRequest.fromBundle(b);return AtomicWorkbenchTaskReferenceResult.response(new AtomicWorkbenchTaskReferenceResult(r,AtomicWorkbenchTaskReferenceResult.Status.SNAPSHOT,0,"task_reference_snapshot",false,false,false,false,false),AtomicWorkbenchTaskReferenceSnapshot.empty(0,true,"task_reference_snapshot"),null);}'''+MEMBER(engine,'static Bundle taskReferenceUnavailable(Bundle input, String reason)')+MEMBER(engine,'interface TaskController')+'TaskController taskController;'+MEMBER(engine,'Bundle manageTaskReferences(Bundle request)').replace('manageTaskReferences','actualManageTaskReferences',1)+'}'
    transport_support='\n'.join(line for line in root.splitlines() if 'private static final int BINDER_FLAG_' in line)+'\n'+MEMBER(root,'private static boolean synchronousReplyTransport(')
    head=HEAD.replace(' Bundle run(Parcel data',transport_support+'\n'+MEMBER(root,'private void requireReferenceSession()')+'\n Bundle run(Parcel data')
    sources['ls/augment/com/ReferenceTransportHarness.java']=head+branch()+TAIL
    sources['ls/augment/com/ClientReferenceHarness.java']='''package ls.augment.com;import android.os.*;class ClientReferenceHarness{int code,workers,requests;Bundle sent;interface Writer{void write(Parcel data);}void requireWorkerThread(){workers++;}Bundle requestTaskMetadata(int c,Writer w){code=c;requests++;Parcel p=new Parcel(null);w.write(p);sent=(Bundle)p.value;return new Bundle();}'''+MEMBER(client,'public Bundle manageTaskReferences(Bundle metadata)')+'}'
    production=['AtomicWorkbenchTaskIdentity.java','AtomicWorkbenchTaskReferenceRequest.java','AtomicWorkbenchTaskReferenceResult.java','AtomicWorkbenchTaskReferenceSnapshot.java']
    with tempfile.TemporaryDirectory(prefix='duo-task-reference-transport-') as tmp:
        work=Path(tmp)
        MODELS['compile_run'](work/'base',sources,production,'ls.augment.com.ReferenceTransportHarness')
        controls=[
            ('transport size','!synchronousReplyTransport(flags, reply)||data.dataSize()>16*1024','!synchronousReplyTransport(flags, reply)'),
            ('no trailing metadata','data.enforceNoDataAvail();',''),
            ('fresh session','closing||finished||!registeredSessionCurrent(providerSession,providerResetGeneration)','closing||finished'),
            ('TTL after authentication','request.requireFresh(android.os.SystemClock.elapsedRealtime());',''),
        ]
        for i,(label,old,new) in enumerate(controls):
            modified=dict(sources);key='ls/augment/com/ReferenceTransportHarness.java';assert old in modified[key];modified[key]=modified[key].replace(old,new,1)
            r=MODELS['compile_run'](work/f'negative-{i}',modified,production,'ls.augment.com.ReferenceTransportHarness',capture=True)
            assert r.returncode!=0 and b'AssertionError' in r.stderr,'transport negative escaped or compile failed: '+label
            print('PASS task reference transport negative:',label)
        modified=dict(sources);key='ls/augment/com/AtomicWorkbenchEngine.java';old=': taskController.manageReferences(request)';assert old in modified[key];modified[key]=modified[key].replace(old,': taskController.shelf()',1)
        r=MODELS['compile_run'](work/'negative-engine-route',modified,production,'ls.augment.com.ReferenceTransportHarness',capture=True)
        assert r.returncode!=0 and b'AssertionError' in r.stderr,'actual Engine routing mutation escaped'
        print('PASS task reference transport negative: actual Engine route')
        controls.append(('actual Engine route','',''))
        print('TASK REFERENCE TRANSPORT NEGATIVES',len(controls),'passed')


if __name__=='__main__':main()
