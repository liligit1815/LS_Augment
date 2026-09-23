"""Execute the actual syncMirrors method with failure/locking doubles, without Android."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/RootHideManager.java').read_text(encoding='utf-8')
method = source.split('    OperationResult syncMirrors() {', 1)[1].split('    List<UserRecord> listUsers()', 1)[0]
method = '    OperationResult syncMirrors() {' + method
java = r'''package ls.augment.com;
import java.util.*;import java.util.concurrent.*;import java.util.concurrent.locks.ReentrantLock;
class HideMirrorProbe {
 static final ReentrantLock ACTION_LOCK=new ReentrantLock();final Object context=new Object();int queries;
 enum State {VISIBLE,HIDDEN,MISSING,ERROR} enum Aggregate {ALL_VISIBLE,ALL_HIDDEN,ERROR}
 static final class Target extends HideTargetCodec.Entry {
 Target(String value){this(HideTargetCodec.parseEntry(value));}
 Target(HideTargetCodec.Entry e){super(e.userId,e.userSerial,e.packageName,e.confirmed);}}
 String raw=""; HideTargetCodec.Selection selectionStatus(){return HideTargetCodec.parse(raw);}
 final Map<Target,State> states=new LinkedHashMap<>();Set<Target> targets(){return states.keySet();}
 Map<Target,State> queryStates(Set<Target> targets){if(!ACTION_LOCK.isHeldByCurrentThread())throw new AssertionError("query not locked");queries++;return states;}
 static final class Summary {final Aggregate aggregate;Summary(Aggregate value){aggregate=value;}}
 Summary summary(Map<Target,State> states){return new Summary(states.containsValue(State.MISSING)||states.containsValue(State.ERROR)?Aggregate.ERROR:
 states.containsValue(State.HIDDEN)?Aggregate.ALL_HIDDEN:Aggregate.ALL_VISIBLE);}
 static final class OperationResult {final boolean success;OperationResult(boolean ok){success=ok;}
 static OperationResult success(String message){return new OperationResult(true);}static OperationResult failure(String message){return new OperationResult(false);}}
''' + method + r'''}
class RootShell {static final class Result {boolean isSuccess(){return true;}String publicError(){return "failure";}}}
class RuntimeStateStore {static String hidden="0:com.kept.app",aggregate="";static int calls;
 static RootShell.Result publishHidden(Object context,String value,String state){
 if(!HideMirrorProbe.ACTION_LOCK.isHeldByCurrentThread())throw new AssertionError("publication not locked");
 hidden=value;aggregate=state;calls++;return new RootShell.Result();}}
public class TestHideMirror {
 public static void main(String[] args)throws Exception {
  HideMirrorProbe probe=new HideMirrorProbe();
  probe.states.put(new HideMirrorProbe.Target("0:com.unknown.app"),HideMirrorProbe.State.ERROR);
  probe.states.put(new HideMirrorProbe.Target("v3:999:10:com.hidden.app"),HideMirrorProbe.State.HIDDEN);
  check(!probe.syncMirrors().success,"unknown snapshot must fail");
  // P1-USER-001 deliberately replaces the old retain-all-on-error policy:
  // a stale user lifetime may never keep an earlier naked userId mirror active.
  check(RuntimeStateStore.calls==1&&RuntimeStateStore.hidden.equals("v3:999:10:com.hidden.app")
    &&RuntimeStateStore.aggregate.equals("ERROR"),"failure must publish only confirmed bindings and ERROR");
  check(!HideMirrorProbe.ACTION_LOCK.isLocked(),"failure unlocks action queue");
  probe.states.clear();probe.states.put(new HideMirrorProbe.Target("v3:999:10:com.hidden.app"),HideMirrorProbe.State.HIDDEN);
  probe.states.put(new HideMirrorProbe.Target("0:com.gone.app"),HideMirrorProbe.State.MISSING);
  ExecutorService worker=Executors.newSingleThreadExecutor();
  HideMirrorProbe.ACTION_LOCK.lock();int before=probe.queries;
  try {
   Future<HideMirrorProbe.OperationResult> waiting=worker.submit(probe::syncMirrors);
   Thread.sleep(100);check(probe.queries==before&&!waiting.isDone(),"independent sync must wait for ongoing hide transaction");
   check(probe.syncMirrors().success,"same-thread operation can reenter sync lock");
   HideMirrorProbe.ACTION_LOCK.unlock();
   check(waiting.get(2,TimeUnit.SECONDS).success,"queued standalone sync succeeds");
  } finally {if(HideMirrorProbe.ACTION_LOCK.isHeldByCurrentThread())HideMirrorProbe.ACTION_LOCK.unlock();worker.shutdownNow();}
  check(RuntimeStateStore.hidden.equals("v3:999:10:com.hidden.app"),"known missing package may be omitted");
  probe.raw="unrecognized-version";
  check(!probe.syncMirrors().success,"invalid selection must fail");
  check(RuntimeStateStore.hidden.isEmpty()&&RuntimeStateStore.aggregate.equals("ERROR"),"invalid selection must clear usable mirror");
  check(!HideMirrorProbe.ACTION_LOCK.isLocked(),"invalid selection unlocks action queue");
  System.out.println("Actual hide mirror method: 10 bound-subset/error, query/publication lock and reentrancy checks passed");
 }
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
}
'''
with tempfile.TemporaryDirectory(prefix='ls-hide-mirror-') as folder:
    file = Path(folder) / 'TestHideMirror.java'
    file.write_text(java, encoding='utf-8')
    codec = Path(folder) / 'HideTargetCodec.java'
    codec.write_text((ROOT / 'android/app/src/main/java/ls/augment/com/HideTargetCodec.java').read_text(encoding='utf-8'), encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', folder, str(file), str(codec)], check=True)
    subprocess.run(['java', '-cp', folder, 'ls.augment.com.TestHideMirror'], check=True, timeout=10)
