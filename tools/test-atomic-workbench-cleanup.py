"""Execute the unchanged phone cleanup manager with a manually advanced scheduler.

Only its executor and Android/client boundaries are replaced. No sleeping, device,
ROOT process, real task migration, or application reopening is involved.
"""
from pathlib import Path
import runpy
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))

CLIENT = r'''package ls.augment.com;
import android.os.Bundle;import java.util.*;
final class AtomicWorkbenchClient {
 static int constructed,reopened,killed;
 final int identity=++constructed;final List<String> reasons=new ArrayList<>();
 Runnable listener=()->{},duringClose;int listenerClears;Bundle response=result(true,false);Exception failure;
 static Bundle result(boolean success,boolean pending){Bundle b=new Bundle();b.putBoolean("success",success);b.putBoolean("recovery_pending",pending);return b;}
 void setFailureListener(Runnable value){if(value!=null)throw new AssertionError("cleanup installed a UI callback");listener=value;listenerClears++;}
 Bundle close(String reason)throws Exception{if(listener!=null)throw new AssertionError("departed UI listener remained attached");reasons.add(reason);if(duringClose!=null)duringClose.run();if(failure!=null)throw failure;return response;}
 static AtomicWorkbenchClient connect(){reopened++;throw new AssertionError("cleanup opened a replacement client");}
 void reopen(){reopened++;throw new AssertionError("cleanup reopened a live client");}
 void kill(){killed++;throw new AssertionError("cleanup killed a live owner");}
}
'''

TEST = r'''package ls.augment.com;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.AtomicReference;
public final class TestAtomicWorkbenchCleanup {
 static int tests,checks;static final ManualScheduler scheduler=new ManualScheduler();
 interface Case {void run()throws Exception;}
 static void check(boolean condition,String why){checks++;if(!condition)throw new AssertionError(why);}
 static Field field(String name)throws Exception{Field f=AtomicWorkbenchCleanup.class.getDeclaredField(name);f.setAccessible(true);return f;}
 static void installScheduler()throws Exception {
  // The production source is compiled as-is. Replace only its already initialized,
  // idle final executor before any test operation or JIT warmup; no worker is started.
  Field target=field("WORKER");ScheduledExecutorService original=(ScheduledExecutorService)target.get(null);
  Class<?> unsafeClass=Class.forName("sun.misc.Unsafe");Field singleton=unsafeClass.getDeclaredField("theUnsafe");singleton.setAccessible(true);Object unsafe=singleton.get(null);
  Object base=unsafeClass.getMethod("staticFieldBase",Field.class).invoke(unsafe,target);
  long offset=(Long)unsafeClass.getMethod("staticFieldOffset",Field.class).invoke(unsafe,target);
  unsafeClass.getMethod("putObjectVolatile",Object.class,long.class,Object.class).invoke(unsafe,base,offset,scheduler);
  original.shutdownNow();check(target.get(null)==scheduler,"manual executor was not installed");
 }
 static void test(String name,Case body)throws Exception {
  scheduler.jobs.clear();scheduler.delays.clear();((List<?>)field("owners").get(null)).clear();field("scheduled").setBoolean(null,false);field("attempts").setInt(null,0);
  AtomicWorkbenchClient.constructed=AtomicWorkbenchClient.reopened=AtomicWorkbenchClient.killed=0;
  body.run();check(AtomicWorkbenchClient.reopened==0&&AtomicWorkbenchClient.killed==0,"manager reopened or killed an owner");
  tests++;System.out.println("PASS production cleanup: "+name);
 }
 static void oneJob(long delay){check(scheduler.jobs.size()==1,"cleanup queued duplicate jobs or lost its retry");check(scheduler.jobs.peek().delay==delay,"unexpected retry delay: "+scheduler.jobs.peek().delay);}
 static final class Job extends FutureTask<Void> implements ScheduledFuture<Void> {
  final long delay;Job(Runnable task,long delay){super(task,null);this.delay=delay;}
  public long getDelay(TimeUnit unit){return unit.convert(delay,TimeUnit.MILLISECONDS);}
  public int compareTo(Delayed other){return Long.compare(getDelay(TimeUnit.MILLISECONDS),other.getDelay(TimeUnit.MILLISECONDS));}
 }
 static final class ManualScheduler extends ScheduledThreadPoolExecutor {
  final ArrayDeque<Job> jobs=new ArrayDeque<>();final List<Long> delays=new ArrayList<>();
  ManualScheduler(){super(1,task->{throw new AssertionError("test must never start a real cleanup worker");});}
  @Override public ScheduledFuture<?> schedule(Runnable task,long delay,TimeUnit unit){long millis=unit.toMillis(delay);Job job=new Job(task,millis);jobs.add(job);delays.add(millis);return job;}
  void advance()throws Exception{Job job=jobs.poll();check(job!=null,"no scheduled cleanup job");job.run();try{job.get();}catch(ExecutionException e){throw new AssertionError("scheduled cleanup failed",e.getCause());}}
 }
 public static void main(String[] args)throws Exception {
  installScheduler();
  test("null and invalid ownership never schedule work",()->{
   AtomicWorkbenchCleanup.take(null,"invalid");check(!AtomicWorkbenchCleanup.pending()&&scheduler.jobs.isEmpty(),"null client created ownership");
   AtomicWorkbenchClient client=new AtomicWorkbenchClient();boolean rejected=false;try{AtomicWorkbenchCleanup.take(client,"unknown");}catch(IllegalArgumentException expected){rejected=true;}
   check(rejected&&client.listener!=null&&client.listenerClears==0&&!AtomicWorkbenchCleanup.pending()&&scheduler.jobs.isEmpty(),"invalid reason altered client ownership");
  });
  test("take deduplicates the same live client and keeps its first close reason",()->{
   AtomicWorkbenchClient client=new AtomicWorkbenchClient();int identity=client.identity;
   AtomicWorkbenchCleanup.take(client,"user_exit");AtomicWorkbenchCleanup.take(client,"host_destroyed");oneJob(0);
   check(AtomicWorkbenchCleanup.pending()&&client.listener==null&&client.reasons.isEmpty(),"take closed synchronously or retained UI callback");
   scheduler.advance();check(client.reasons.equals(List.of("user_exit"))&&client.identity==identity&&AtomicWorkbenchClient.constructed==1,"duplicate owner closed twice or was replaced");
   check(!AtomicWorkbenchCleanup.pending()&&scheduler.jobs.isEmpty(),"successful owner retained a retry");
  });
  test("one batch drops successful owners and never touches an unrelated live client",()->{
   AtomicWorkbenchClient first=new AtomicWorkbenchClient(),second=new AtomicWorkbenchClient(),live=new AtomicWorkbenchClient();
   AtomicWorkbenchCleanup.take(first,"navigation");AtomicWorkbenchCleanup.take(second,"host_stopped");oneJob(0);scheduler.advance();
   check(first.reasons.equals(List.of("navigation"))&&second.reasons.equals(List.of("host_stopped")),"batch skipped or relabeled an owner");
   check(live.reasons.isEmpty()&&live.listener!=null&&AtomicWorkbenchClient.constructed==3,"unrelated live client was detached, closed or replaced");
   check(!AtomicWorkbenchCleanup.pending()&&scheduler.jobs.isEmpty(),"successful batch still pending");
  });
  for(String outcome:new String[]{"null","failure","pending","exception"})test("incomplete "+outcome+" retains exact owner until confirmed cleanup",()->{
   AtomicWorkbenchClient client=new AtomicWorkbenchClient();switch(outcome){case "null":client.response=null;break;case "failure":client.response=AtomicWorkbenchClient.result(false,false);break;case "pending":client.response=AtomicWorkbenchClient.result(true,true);break;default:client.failure=new IllegalStateException("root unavailable");}
   AtomicWorkbenchCleanup.take(client,"surface_lost");scheduler.advance();check(AtomicWorkbenchCleanup.pending()&&client.reasons.size()==1&&AtomicWorkbenchClient.constructed==1,"incomplete recovery lost or replaced the owner");oneJob(1000);
   client.failure=null;client.response=AtomicWorkbenchClient.result(true,false);scheduler.advance();
   check(client.reasons.equals(List.of("surface_lost","surface_lost"))&&!AtomicWorkbenchCleanup.pending()&&scheduler.jobs.isEmpty(),"retry changed client/reason or failed to drop confirmed owner");
  });
  test("retry backoff is bounded and resets after all owners finish",()->{
   AtomicWorkbenchClient client=new AtomicWorkbenchClient();client.response=AtomicWorkbenchClient.result(false,true);AtomicWorkbenchCleanup.take(client,"recovery_retry");
   for(long delay:new long[]{0,1000,2000,4000,8000,16000,30000,30000}){oneJob(delay);scheduler.advance();check(AtomicWorkbenchCleanup.pending(),"pending recovery was abandoned");}
   oneJob(30000);client.response=AtomicWorkbenchClient.result(true,false);scheduler.advance();check(!AtomicWorkbenchCleanup.pending()&&scheduler.jobs.isEmpty(),"completed owner retained backoff job");
   AtomicWorkbenchClient next=new AtomicWorkbenchClient();next.response=AtomicWorkbenchClient.result(false,true);AtomicWorkbenchCleanup.take(next,"user_exit");oneJob(0);scheduler.advance();oneJob(1000);
   next.response=AtomicWorkbenchClient.result(true,false);scheduler.advance();check(!AtomicWorkbenchCleanup.pending()&&AtomicWorkbenchClient.constructed==2,"fresh owner inherited previous retry budget or client");
  });
  test("one failing owner does not retain or reclose a successful peer",()->{
   AtomicWorkbenchClient failed=new AtomicWorkbenchClient(),done=new AtomicWorkbenchClient();failed.failure=new IllegalStateException("binder failure");AtomicWorkbenchCleanup.take(failed,"user_exit");AtomicWorkbenchCleanup.take(done,"host_destroyed");scheduler.advance();
   check(failed.reasons.size()==1&&done.reasons.size()==1&&AtomicWorkbenchCleanup.pending(),"one failure skipped the other owner");oneJob(1000);
   failed.failure=null;scheduler.advance();check(failed.reasons.size()==2&&done.reasons.size()==1&&!AtomicWorkbenchCleanup.pending(),"successful peer was retried or failed owner lost");
  });
  for(boolean firstPending:new boolean[]{false,true})test("owner arriving during running batch is scheduled; prior pending="+firstPending,()->{
   AtomicWorkbenchClient first=new AtomicWorkbenchClient(),arriving=new AtomicWorkbenchClient();first.response=AtomicWorkbenchClient.result(!firstPending,firstPending);
   first.duringClose=()->{
    first.duringClose=null;CountDownLatch added=new CountDownLatch(1);AtomicReference<Throwable> problem=new AtomicReference<>();
    Thread producer=new Thread(()->{try{AtomicWorkbenchCleanup.take(arriving,"connection_replaced");AtomicWorkbenchCleanup.take(arriving,"host_destroyed");}catch(Throwable failure){problem.set(failure);}finally{added.countDown();}},"cleanup-test-new-owner");producer.setDaemon(true);producer.start();
    try{check(added.await(5,TimeUnit.SECONDS),"take blocked behind running close");}catch(InterruptedException error){throw new AssertionError(error);}if(problem.get()!=null)throw new AssertionError(problem.get());
    check(scheduler.jobs.isEmpty()&&arriving.reasons.isEmpty(),"take started a second job during active batch");
   };
   AtomicWorkbenchCleanup.take(first,"user_exit");scheduler.advance();oneJob(1000);check(AtomicWorkbenchCleanup.pending()&&arriving.reasons.isEmpty(),"new owner was discarded with completed snapshot");
   first.response=AtomicWorkbenchClient.result(true,false);scheduler.advance();
   check(first.reasons.size()==(firstPending?2:1)&&arriving.reasons.equals(List.of("connection_replaced")),"new owner lost or completed owner replayed");
   check(!AtomicWorkbenchCleanup.pending()&&scheduler.jobs.isEmpty()&&AtomicWorkbenchClient.constructed==2,"concurrent transfer leaked a retry or replaced live clients");
  });
  test("duplicate transfer during close cannot leave a second owner or job",()->{
   AtomicWorkbenchClient client=new AtomicWorkbenchClient();client.duringClose=()->AtomicWorkbenchCleanup.take(client,"host_destroyed");AtomicWorkbenchCleanup.take(client,"user_exit");scheduler.advance();
   check(client.reasons.equals(List.of("user_exit"))&&!AtomicWorkbenchCleanup.pending()&&scheduler.jobs.isEmpty(),"reentrant duplicate transfer resurrected completed ownership");
  });
  scheduler.shutdownNow();System.out.println("CLEANUP RESULT "+tests+" cases; "+checks+" assertions");
 }
}
'''


def main():
    with tempfile.TemporaryDirectory(prefix="lsa-workbench-cleanup-") as temporary:
        SUPPORT["compile_run"](Path(temporary), {
            "android/os/Bundle.java": SUPPORT["BUNDLE"],
            "ls/augment/com/AtomicWorkbenchClient.java": CLIENT,
            "ls/augment/com/TestAtomicWorkbenchCleanup.java": TEST,
        }, ["AtomicWorkbenchCleanup.java", "AtomicWorkbenchLifecyclePolicy.java"],
            "ls.augment.com.TestAtomicWorkbenchCleanup")


if __name__ == "__main__":
    main()
