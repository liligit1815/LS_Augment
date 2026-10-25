"""Execute the actual Root empty-display Binder branch with the real Surface handoff."""
from pathlib import Path
import importlib.util
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("models",Path(__file__).with_name("test-atomic-workbench-task-models.py"))
models=importlib.util.module_from_spec(spec);spec.loader.exec_module(models)

def root_branch():
    source=(ROOT/"android/app/src/main/java/ls/augment/com/AtomicWorkbenchRoot.java").read_text(encoding="utf-8")
    marker="} else if (code == AtomicWorkbenchProtocol.TX_ALLOCATE_TASK_DISPLAY) {"
    return source.split(marker,1)[1].split("} else if (code == AtomicWorkbenchProtocol.TX_TASK_SHELF_STATE)",1)[0]

def root_transport_support():
    source=(ROOT/"android/app/src/main/java/ls/augment/com/AtomicWorkbenchRoot.java").read_text(encoding="utf-8")
    constant='\n'.join(line for line in source.splitlines() if 'private static final int BINDER_FLAG_' in line)
    start=source.index('private static boolean synchronousReplyTransport(')
    end=source.index('\n    }',start)+len('\n    }')
    return constant+'\n'+source[start:end]

HEAD=r'''package ls.augment.com;
import android.os.*;import android.view.Surface;
class AllocationTransportHarness {
 boolean available=true,current=true,ownerGood=true;int mode,calls;long providerSession=10,providerResetGeneration=11;java.util.concurrent.Callable<Bundle> late;
 final AtomicWorkbenchEngine engine=new AtomicWorkbenchEngine();
 void requireWindow(int id){if(id<0||id>=4)throw new IllegalArgumentException();}
 String requireTaskOperationId(String id){if(id==null||!id.matches("[0-9a-f]{32}"))throw new IllegalArgumentException();return id;}
 void bindOwner(IBinder owner){if(!ownerGood||owner==null)throw new SecurityException();}
 boolean uiInputUnavailable(){return !available;}
 boolean registeredSessionCurrent(long session,long reset){if(session!=10||reset!=11)throw new AssertionError("wrong session proof");return current;}
 AtomicWorkbenchEngine backend(){return engine;}
 Bundle executeInputMetadata(java.util.concurrent.Callable<Bundle> call)throws Exception{calls++;if(mode==1){late=call;return AtomicWorkbenchProtocol.failure("timeout");}if(mode==2){available=false;}return call.call();}
 Bundle run(Parcel data,Parcel reply,int flags)throws Exception{Bundle state;
'''
TAIL=r'''
 return state;}
 static int cases,assertions;
 interface Run{void run()throws Exception;}static void check(boolean b,String why){assertions++;if(!b)throw new AssertionError(why);}
 static void reject(Run r)throws Exception{boolean caught=false;try{r.run();}catch(IllegalArgumentException|SecurityException e){caught=true;}check(caught,"invalid allocation accepted");}
 static void test(String n,Run r)throws Exception{r.run();cases++;System.out.println("PASS Root allocation: "+n);}
 static Parcel p(Surface s){return new Parcel(1,new IBinder(){},s,1080,2400,420,4L,"a".repeat(32));}
 public static void main(String[]args)throws Exception{
 test("exact decoded surface transfers once without close or launch",()->{var h=new AllocationTransportHarness();var s=new Surface();var reply=h.run(p(s),new Parcel(),0);check(h.engine.calls==1&&h.engine.received==s&&s.releases==1,"surface ownership");check(h.engine.id==1&&h.engine.width==1080&&h.engine.height==2400&&h.engine.density==420&&h.engine.generation==4&&h.engine.allocation.equals("a".repeat(32)),"mutated metadata");check(reply.getString("allocation_id").equals("a".repeat(32)),"missing query ID");});
 test("invalid transport does not decode or dispatch",()->{for(int variant=0;variant<3;variant++){var h=new AllocationTransportHarness();var s=new Surface();var data=p(s);if(variant==2)data.size=16385;final int flags=variant==0?1:0;final Parcel reply=variant==1?null:new Parcel();reject(()->h.run(data,reply,flags));check(h.calls==0&&h.engine.calls==0&&s.releases==0&&data.position==0,"invalid transport decoded surface");}});
 test("shape owner dimensions generation and allocation identity release decoded surface",()->{for(int variant=0;variant<7;variant++){var h=new AllocationTransportHarness();var s=new Surface();var data=p(s);switch(variant){case 0:data.values[3]=0;break;case 1:data.values[4]=0;break;case 2:data.values[5]=0;break;case 3:data.values[6]=0L;break;case 4:data.values[7]="bad";break;case 5:h.ownerGood=false;break;case 6:data.tail=true;break;}reject(()->h.run(data,new Parcel(),0));check(h.engine.calls==0&&s.releases==1,"decode rejected ownership");}});
 test("owner departure or reset during queue rejects without backend consumption",()->{for(int variant=0;variant<3;variant++){var h=new AllocationTransportHarness();var s=new Surface();if(variant==0)h.available=false;if(variant==1)h.current=false;if(variant==2)h.mode=2;h.run(p(s),new Parcel(),0);check(h.engine.calls==0&&s.releases==1,"stale allocation reached backend");}});
 test("metadata timeout releases unclaimed surface and late work cannot revive it",()->{var h=new AllocationTransportHarness();h.mode=1;var s=new Surface();h.run(p(s),new Parcel(),0);check(s.releases==1&&h.engine.calls==0,"timeout leaked decoded surface");boolean cancelled=false;try{h.late.call();}catch(java.util.concurrent.CancellationException ended){cancelled=true;}check(cancelled&&s.releases==1&&h.engine.calls==0,"late queued allocation replayed");});
 System.out.println("ROOT ALLOCATION TRANSPORT RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''
SOURCES={
 "android/os/Bundle.java":models.BUNDLE,
 "android/os/IBinder.java":"package android.os;public interface IBinder{}",
 "android/view/Surface.java":"package android.view;public class Surface{public static Object CREATOR=new Object();public int releases;public void release(){releases++;}}",
 "android/os/Parcel.java":r'''package android.os;public class Parcel{public Object[]values;public int size=500,position;public boolean tail;public Parcel(Object...v){values=v;}public int dataSize(){return size;}public int readInt(){return (Integer)values[position++];}public long readLong(){return (Long)values[position++];}public String readString(){return (String)values[position++];}public IBinder readStrongBinder(){return (IBinder)values[position++];}public <T>T readTypedObject(Object creator){return (T)values[position++];}public void enforceNoDataAvail(){if(tail||position!=values.length)throw new IllegalArgumentException();}}''',
 "ls/augment/com/AtomicWorkbenchProtocol.java":'package ls.augment.com;import android.os.Bundle;class AtomicWorkbenchProtocol{static Bundle failure(String reason){return new Bundle();}}',
 "ls/augment/com/AtomicWorkbenchEngine.java":r'''package ls.augment.com;import android.os.Bundle;import android.view.Surface;class AtomicWorkbenchEngine{int calls,id,width,height,density;long generation;String allocation;Surface received;Bundle allocateTaskDisplay(int id,Surface s,int w,int h,int d,long g,String a){calls++;this.id=id;width=w;height=h;density=d;generation=g;allocation=a;received=s;s.release();return new Bundle();}}'''
}

def main():
    head=HEAD.replace(' Bundle run(Parcel data',root_transport_support()+'\n Bundle run(Parcel data')
    sources=dict(SOURCES);sources["ls/augment/com/AllocationTransportHarness.java"]=head+root_branch()+TAIL
    with tempfile.TemporaryDirectory(prefix="duo-task-allocation-transport-")as tmp:
        production=["AtomicWorkbenchSurfaceHandoff.java"]
        models.compile_run(Path(tmp)/"base",sources,production=production,runner="ls.augment.com.AllocationTransportHarness")
        controls=[("!synchronousReplyTransport(flags, reply) || data.dataSize() > 16 * 1024","false"),
                  ("data.enforceNoDataAvail();", ""),
                  ("bindOwner(supplied);", ""),
                  ("|| generation < 1", ""),
                  ("uiInputUnavailable() || !registeredSessionCurrent(providerSession, providerResetGeneration)", "false"),
                  ("if (!consumed && surface != null) surface.release();", "")]
        for i,(old,new)in enumerate(controls):
            if old not in sources["ls/augment/com/AllocationTransportHarness.java"]:raise AssertionError("missing actual branch control")
            result=models.compile_run(Path(tmp)/f"negative-{i}",sources,production=production,runner="ls.augment.com.AllocationTransportHarness",replacements={"ls/augment/com/AllocationTransportHarness.java":(old,new)},capture=True)
            if result.returncode==0 or b"AssertionError"not in result.stderr:raise AssertionError("escaped allocation branch control: "+old+"\n"+result.stderr.decode(errors="replace"))
            print("PASS Root allocation transport negative control",i+1)
        print("ROOT ALLOCATION TRANSPORT NEGATIVE CONTROLS",len(controls),"passed")

if __name__=="__main__":main()
