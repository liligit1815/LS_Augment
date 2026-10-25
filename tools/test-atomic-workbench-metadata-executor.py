"""Run the production metadata wait with real FutureTasks and bounded host-only concurrency."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-focus-provider.py")))
JAVA = BASE["JAVA"]
SOURCE = BASE["ROOT"] / "android/app/src/main/java/ls/augment/com/AtomicWorkbenchMetadataExecutor.java"
STUBS = dict(BASE["STUBS"])
STUBS["android/os/Binder.java"] = '''package android.os;public class Binder {
 public static final java.util.concurrent.atomic.AtomicInteger cleared=new java.util.concurrent.atomic.AtomicInteger(),restored=new java.util.concurrent.atomic.AtomicInteger();
 public static long clearCallingIdentity(){cleared.incrementAndGet();return 17;}public static void restoreCallingIdentity(long value){if(value!=17)throw new AssertionError("identity");restored.incrementAndGet();}}'''
STUBS["android/os/Handler.java"] = '''package android.os;public class Handler {public boolean post(Runnable r){return false;}}'''
STUBS["ls/augment/com/AtomicWorkbenchProtocol.java"] = '''package ls.augment.com;import android.os.Bundle;final class AtomicWorkbenchProtocol {
 static Bundle failure(String message){Bundle b=new Bundle();b.putBoolean("success",false);b.putString("message",message);return b;}}'''
TEST = r'''package ls.augment.com;import android.os.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public final class TestMetadataExecutor {
 static int cases,checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 interface Case{void run()throws Exception;}static void test(String name,Case c)throws Exception{c.run();cases++;System.out.println("PASS metadata executor: "+name);}
 static Bundle ok(){Bundle b=new Bundle();b.putBoolean("success",true);return b;}
 static final class Queue extends Handler {Runnable pending;int posts;boolean accepted=true;
  public boolean post(Runnable r){posts++;if(!accepted)return false;pending=r;return true;}void flush(){if(pending!=null)pending.run();}}
 static final class Running extends Handler {Thread worker;public boolean post(Runnable r){worker=new Thread(r);worker.start();return true;}}
 static Bundle fail(Throwable t){return AtomicWorkbenchProtocol.failure("fixed_error");}
 public static void main(String[] args)throws Exception{
  test("timed out queued query never executes later or invokes recovery mapping",()->{Queue h=new Queue();AtomicInteger calls=new AtomicInteger(),mapped=new AtomicInteger();
   Bundle result=AtomicWorkbenchMetadataExecutor.execute(h,()->{calls.incrementAndGet();return ok();},10,t->{mapped.incrementAndGet();return fail(t);});
   check(result.getBoolean("operation_unconfirmed")&&!result.getBoolean("success"),"timeout reported as confirmed");
   h.flush();check(calls.get()==0&&mapped.get()==0&&h.posts==1,"queued query replayed or timeout escalated");});
  test("running query keeps its own lease without interruption or retry",()->{Running h=new Running();CountDownLatch entered=new CountDownLatch(1),finish=new CountDownLatch(1);AtomicBoolean interrupted=new AtomicBoolean(),lease=new AtomicBoolean();AtomicInteger calls=new AtomicInteger();
   Bundle result=AtomicWorkbenchMetadataExecutor.execute(h,()->{calls.incrementAndGet();lease.set(true);entered.countDown();try{finish.await();}catch(InterruptedException failure){interrupted.set(true);}return ok();},100,TestMetadataExecutor::fail);
   check(entered.await(1,TimeUnit.SECONDS)&&result.getBoolean("operation_unconfirmed")&&lease.get(),"timeout erased running ownership");
   finish.countDown();h.worker.join(2000);check(!h.worker.isAlive()&&!interrupted.get()&&calls.get()==1&&lease.get(),"running query interrupted, repeated or falsely cleaned");
   lease.set(false);check(!lease.get(),"owner cannot finish own cleanup");});
  test("normal metadata result retains the exact return value",()->{Running h=new Running();Bundle expected=ok();int restored=Binder.restored.get();
   Bundle result=AtomicWorkbenchMetadataExecutor.execute(h,()->expected,2000,TestMetadataExecutor::fail);h.worker.join(1000);
   check(result==expected&&!result.getBoolean("operation_unconfirmed"),"result copied or marked unknown");check(Binder.restored.get()==restored+1,"Binder identity leaked");});
  test("exception maps once after restoring Binder identity",()->{Running h=new Running();AtomicInteger mapped=new AtomicInteger();int restored=Binder.restored.get();
   Bundle result=AtomicWorkbenchMetadataExecutor.execute(h,()->{throw new IllegalStateException("fixed");},2000,t->{check(t instanceof IllegalStateException,"wrapped exception lost");mapped.incrementAndGet();return fail(t);});
   h.worker.join(1000);check(!result.getBoolean("success")&&mapped.get()==1&&Binder.restored.get()==restored+1,"exception mapping or cleanup changed");});
  test("rejected Handler never runs the query",()->{Queue h=new Queue();h.accepted=false;AtomicInteger calls=new AtomicInteger();
   Bundle result=AtomicWorkbenchMetadataExecutor.execute(h,()->{calls.incrementAndGet();return ok();},20,TestMetadataExecutor::fail);
   check(!result.getBoolean("success")&&!result.getBoolean("operation_unconfirmed")&&calls.get()==0&&h.posts==1,"rejected queue executed or claimed pending");});
  test("interrupted caller retains interruption and cancels only its queued query",()->{Queue h=new Queue();AtomicInteger calls=new AtomicInteger();Thread.currentThread().interrupt();
   Bundle result=AtomicWorkbenchMetadataExecutor.execute(h,()->{calls.incrementAndGet();return ok();},100,TestMetadataExecutor::fail);
   check(Thread.currentThread().isInterrupted()&&result.getBoolean("operation_unconfirmed"),"caller interruption swallowed");Thread.interrupted();h.flush();check(calls.get()==0,"interrupted queued call ran");});
  test("wait bounds reject before touching the queue",()->{for(long duration:new long[]{0,-1,20001,Long.MAX_VALUE}){Queue h=new Queue();try{AtomicWorkbenchMetadataExecutor.execute(h,TestMetadataExecutor::ok,duration,TestMetadataExecutor::fail);throw new AssertionError("wait admitted");}catch(IllegalArgumentException expected){check(h.posts==0,"invalid wait reached Handler");}}});
  check(Binder.cleared.get()==Binder.restored.get(),"final Binder identity imbalance");
  System.out.println("METADATA EXECUTOR RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def run(source, label):
    with tempfile.TemporaryDirectory(prefix="duo-metadata-executor-") as temporary:
        work = Path(temporary)
        sources = dict(STUBS)
        sources["ls/augment/com/AtomicWorkbenchMetadataExecutor.java"] = source
        sources["ls/augment/com/TestMetadataExecutor.java"] = TEST
        files = []
        for name, value in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value, encoding="utf-8")
            files.append(str(path))
        compiled = subprocess.run([JAVA["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-d", str(work), *files],
                                  env=JAVA["ENV"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=45)
        if compiled.returncode:
            raise AssertionError(compiled.stderr)
        result = subprocess.run([JAVA["JAVA"], "-cp", str(work), "ls.augment.com.TestMetadataExecutor"],
                                env=JAVA["ENV"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=10)
        if label == "production":
            print(result.stdout, end="")
            if result.returncode:
                raise AssertionError(result.stderr)
        else:
            if result.returncode == 0:
                raise AssertionError("negative control escaped: " + label)
            print("PASS rejected negative control: " + label)


if __name__ == "__main__":
    source = SOURCE.read_text(encoding="utf-8")
    run(source, "production")
    for old, replacement, label in (
        ("operation.cancel(false);", "/* no cancellation */", "queued query replay"),
        ("operation.cancel(false);", "operation.cancel(true);", "interrupt running owner"),
        ('return unconfirmed("metadata_timeout");', "return failure.apply(timeout);", "timeout reported as ordinary failure"),
        ("Binder.restoreCallingIdentity(identity);", "/* lost Binder identity */", "Binder identity leak"),
    ):
        if old not in source:
            raise AssertionError("negative boundary changed: " + label)
        run(source.replace(old, replacement), label)
