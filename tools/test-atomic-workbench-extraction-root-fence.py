"""Execute the actual Root callback and immutable geometry fence without engine/Provider IPC."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-system-root-authority.py')))
JAVA, MEMBER = BASE['JAVA'], BASE['SUPPORT']['member']
ROOT_SOURCE = JAVA['SRC'] / 'AtomicWorkbenchRoot.java'
FENCE_SOURCE = JAVA['SRC'] / 'AtomicWorkbenchExtractionGeometryFence.java'

HEAD = '''package ls.augment.com;import android.os.*;import java.util.*;import java.util.concurrent.atomic.*;
final class AtomicWorkbenchEngine {volatile long revision=5;volatile int active=2;volatile boolean parked;int reads;Runnable onRead;
 long inputRevision(){long result=revision;reads++;if(onRead!=null){Runnable action=onRead;onRead=null;action.run();}return result;}
 int activeInputWindow(){return active;}boolean uiParked(){return parked;}
 long extractionGeometryInputRevision(long expected,long observed,int window){return observed;}}
public final class AtomicWorkbenchRoot {
 volatile AtomicWorkbenchExtractionGeometryFence extractionGeometryFence;
 volatile AtomicWorkbenchEngine backend=new AtomicWorkbenchEngine();boolean registered=true,closing,finished;
 static final class Owner implements IBinder {boolean alive=true;int checks,killAfter=999;public boolean isBinderAlive(){return alive&&++checks<killAfter;}}
 Owner owner=new Owner();final AtomicLong minimumExtractionGeometryRevision=new AtomicLong();
 static int cases,checks;static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
 interface Case{void run()throws Exception;}
 static AtomicWorkbenchRoot root;static Bundle geometry,query;static Parcel data,reply;
 static Bundle geometry(){Bundle b=new Bundle();b.putInt("window_id",2);b.putInt("display_id",19);b.putString("display_name","Duo-owned-display");b.putString("unique_id","virtual:real19");
  b.putLong("input_revision",5);b.putLong("ui_epoch",8);b.putLong("revision",10);b.putLong("deadline",3400);return b;}
 static void test(String name,Case action)throws Exception{Binder.uid=1000;SystemClock.now=1000;root=new AtomicWorkbenchRoot();geometry=geometry();query=new Bundle(geometry);
  query.putLong("provider_session",86);query.putLong("reset_generation",7);root.extractionGeometryFence=new AtomicWorkbenchExtractionGeometryFence(geometry,86,7,1000);
  data=new Parcel();data.query=query;reply=new Parcel();action.run();cases++;System.out.println("PASS actual Root geometry fence: "+name);}
 static boolean probe(){check(root.readExtractionGeometryFence(data,reply,0),"private transaction not handled");
  String expectedNonce=data.correctInterface&&data.size<=4096&&data.schema==1?data.nonce:null;
  check(reply.noException&&reply.ints.size()==2&&reply.ints.get(0)==1&&Objects.equals(reply.nonce,expectedNonce),"invalid response contract");return reply.ints.get(1)==1;}
'''

TEST = '''
 public static void main(String[] args)throws Exception{
  test("current exact immutable metadata accepted with no engine dispatch",()->{check(probe(),"valid current geometry rejected");check(root.backend.reads==2,"unexpected engine access");});
  test("foreign Binder UID rejected",()->{Binder.uid=10515;try{root.readExtractionGeometryFence(data,reply,0);throw new AssertionError("foreign query accepted");}catch(SecurityException expected){checks++;}});
  test("Root cannot impersonate a system callback",()->{Binder.uid=0;try{root.readExtractionGeometryFence(data,reply,0);throw new AssertionError("Root query accepted");}catch(SecurityException expected){checks++;}});
  test("oneway requests cannot observe or mutate the fence",()->{var before=root.extractionGeometryFence;check(root.readExtractionGeometryFence(data,null,1),"oneway unhandled");check(root.extractionGeometryFence==before&&root.backend.reads==0,"oneway read engine");});
  test("unregistered and retired roots reject",()->{root.registered=false;check(!probe(),"unregistered root accepted");});
  test("closing session rejects",()->{root.closing=true;check(!probe(),"closing root accepted");});
  test("finished session rejects",()->{root.finished=true;check(!probe(),"finished root accepted");});
  test("missing local candidate rejects",()->{root.extractionGeometryFence=null;check(!probe(),"missing local registration accepted");});
  test("missing backend rejects without allocation",()->{root.backend=null;check(!probe()&&root.backend==null,"probe created a backend");});
  test("dead owner rejects",()->{root.owner.alive=false;check(!probe(),"dead owner accepted");});
  test("expired and rolled back clocks reject",()->{SystemClock.now=3400;check(!probe(),"expired geometry accepted");});
  test("parked root rejects",()->{root.backend.parked=true;check(!probe(),"parked geometry accepted");});
  test("different active input window rejects",()->{root.backend.active=1;check(!probe(),"old active window accepted");});
  test("different current input revision rejects",()->{root.backend.revision=6;check(!probe(),"old input revision accepted");});
  test("monotonic UI invalidation floor rejects delayed same-input registration",()->{root.minimumExtractionGeometryRevision.set(10);check(!probe(),"invalidated UI revision resurrected");});
  test("candidate snapshots caller metadata before mutation",()->{geometry.putLong("input_revision",99);check(probe(),"caller mutation reached immutable fence");});
  test("extra query fields reject",()->{query.putString("token","must-not-be-accepted");check(!probe(),"extra query accepted");});
  test("typed metadata cannot be coerced",()->{query.putInt("input_revision",5);check(!probe(),"numeric metadata coercion accepted");});
  for(String key:new String[]{"window_id","display_id","display_name","unique_id","input_revision","ui_epoch","revision","deadline","provider_session","reset_generation"})
   test("missing query field "+key,()->{query.remove(key);check(!probe(),"incomplete metadata accepted");});
  test("different session rejects",()->{query.putLong("provider_session",85);check(!probe(),"other session accepted");});
  test("different reset rejects",()->{query.putLong("reset_generation",8);check(!probe(),"other reset accepted");});
  test("input revision changes during callback",()->{root.backend.onRead=()->root.backend.revision=6;check(!probe(),"mid-probe input mutation accepted");});
  test("candidate revoked during callback",()->{root.backend.onRead=()->root.extractionGeometryFence=null;check(!probe(),"mid-probe revoked candidate accepted");});
  test("close starts during callback",()->{root.backend.onRead=()->root.closing=true;check(!probe(),"mid-probe close accepted");});
  test("owner dies during callback",()->{root.owner.killAfter=2;check(!probe(),"mid-probe owner death accepted");});
  test("invalid interface and trailing payload reject",()->{data.correctInterface=false;check(!probe(),"wrong interface accepted");});
  test("trailing payload rejects",()->{data.trailing=true;check(!probe(),"trailing payload accepted");});
  test("oversized input rejects",()->{data.size=4097;check(!probe(),"oversized input accepted");});
  test("unsupported schema rejects",()->{data.schema=2;check(!probe(),"other schema accepted");});
  test("geometry lifetime cannot be extended on construction",()->{geometry.putLong("deadline",3501);
   try{new AtomicWorkbenchExtractionGeometryFence(geometry,86,7,1000);throw new AssertionError("unbounded geometry accepted");}catch(IllegalArgumentException expected){checks++;}});
  System.out.println("EXTRACTION ROOT FENCE RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''


def run(root_source, fence_source, label):
    with tempfile.TemporaryDirectory(prefix='duo-extraction-root-fence-') as temporary:
        work = Path(temporary)
        files = {key: value for key, value in BASE['STUBS'].items() if key.startswith('android/os/')}
        files['android/os/Bundle.java'] = files['android/os/Bundle.java'].replace('public void putInt', 'public int getInt(String k){return getInt(k,0);}public long getLong(String k){return getLong(k,0L);}public void putInt', 1)
        files['android/os/SystemClock.java'] = 'package android.os;public class SystemClock {public static long now=1000;public static long elapsedRealtime(){return now;}}'
        files['android/os/Parcel.java'] = '''package android.os;import java.util.*;public class Parcel {public Bundle query;public boolean correctInterface=true,trailing,noException;public int size=100,schema=1;
          public String nonce="c".repeat(32);public final List<Integer>ints=new ArrayList<>();public int dataSize(){return size;}
          public void enforceInterface(String value){if(!correctInterface||!value.equals("ls.augment.com.atomic_extraction_geometry_current.v1"))throw new SecurityException();}
          public int readInt(){return schema;}public String readString(){return nonce;}public Bundle readBundle(ClassLoader loader){return query;}
          public void enforceNoDataAvail(){if(trailing)throw new IllegalArgumentException();}public void writeNoException(){noException=true;}
          public void writeInt(int value){ints.add(value);}public void writeString(String value){nonce=value;}}'''
        files['ls/augment/com/AtomicWorkbenchExtractionGeometryFence.java'] = fence_source
        transport_support = '\n'.join(line for line in root_source.splitlines() if 'private static final int BINDER_FLAG_' in line) + '\n' + MEMBER(root_source, 'private static boolean synchronousReplyTransport(')
        files['ls/augment/com/AtomicWorkbenchRoot.java'] = HEAD + transport_support + MEMBER(root_source, 'private boolean readExtractionGeometryFence(') + TEST
        paths = []
        for name, source in files.items():
            path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(source, encoding='utf-8'); paths.append(str(path))
        compiled = subprocess.run([JAVA['JAVAC'], '-encoding', 'UTF-8', '--release', '17', '-d', str(work), *paths], env=JAVA['ENV'], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=60)
        if compiled.returncode:
            raise AssertionError(f'{label} failed to compile\n{compiled.stderr}')
        return subprocess.run([JAVA['JAVA'], '-Dfile.encoding=UTF-8', '-cp', str(work), 'ls.augment.com.AtomicWorkbenchRoot'], env=JAVA['ENV'], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=30)


if __name__ == '__main__':
    root_source = ROOT_SOURCE.read_text(encoding='utf-8'); fence_source = FENCE_SOURCE.read_text(encoding='utf-8')
    positive = run(root_source, fence_source, 'production'); print(positive.stdout, end='')
    if positive.returncode: raise SystemExit(positive.stderr)
    mutations = [
        ('system caller', root_source.replace('if (Binder.getCallingUid() != 1000) throw new SecurityException("geometry query caller mismatch");', '', 1), fence_source),
        ('second input sample', root_source.replace('&& currentBackend.inputRevision() == revision', '', 1), fence_source),
        ('revoked candidate', root_source.replace('&& extractionGeometryFence == fence', ''), fence_source),
        ('invalidation floor', root_source.replace('&& fence.revision > minimumExtractionGeometryRevision.get()', '', 1), fence_source.replace('revision <= minimumRevision || ', '', 1)),
        ('exact input revision', root_source, fence_source.replace('inputRevision != currentInputRevision || ', '', 1)),
        ('expired geometry', root_source, fence_source.replace(' || now >= deadline', '', 1)),
        ('live owner', root_source.replace('bound.isBinderAlive()', 'true'), fence_source),
    ]
    for label, changed_root, changed_fence in mutations:
        if changed_root == root_source and changed_fence == fence_source: raise AssertionError('mutation not applied: ' + label)
        negative = run(changed_root, changed_fence, label)
        if negative.returncode == 0 or 'AssertionError' not in negative.stderr:
            raise AssertionError(f'negative control not killed: {label}\n{negative.stdout}\n{negative.stderr}')
        print('PASS negative control: ' + label)
    print('EXTRACTION ROOT FENCE NEGATIVE RESULT 7 killed')
