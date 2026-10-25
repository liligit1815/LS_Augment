"""Execute production writer scheduling/drains with virtual time and controlled IPC.

This checks wakeups, coalescing and queue races, not phone CPU percentages.
Provider reply/authentication semantics are covered by the full FeatureSettings
and diagnostic reliability suites; only IPC is controlled here.
"""
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/FeatureSettings.java').read_text(encoding='utf-8')


def member(signature):
    start = SOURCE.index(signature)
    end = SOURCE.index('{', start) + 1
    depth = 1
    while depth:
        depth += (SOURCE[end] == '{') - (SOURCE[end] == '}')
        end += 1
    return SOURCE[start:end]


MEMBERS = '\n'.join(member(signature) for signature in (
    'private static void scheduleWrites()', 'private static void scheduleWrites(long delay)',
    'private static long diagnosticWriteDelay', 'private static void scheduleNextWrites',
    'private static void drainWrites()', 'private static void drainHomeReadiness()',
    'private static void scheduleHomeReadinessWrite()', 'private static void writePendingDiagnostic',
    'private static void expireDiagnostic', 'private static <T> void cacheValue',
    'private static final class PendingDiagnostic', 'private static ScheduledExecutorService worker',
    'private static void diagnostic(Context context, String key, String value, boolean homeReadiness)'))
CONSTANTS = '\n'.join(re.findall(
    r'private static final (?:int|long) (?:MAX_DIAGNOSTIC_CACHE|DIAGNOSTIC_RETRY_WINDOW_MS) = [^;]+;', SOURCE))

HARNESS = r'''import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

public class DiagnosticWriteSchedulerTest {
 static int checks;
 static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static class SystemClock{static long now=100000;static long elapsedRealtime(){return now;}}
 static class Job implements ScheduledFuture<Object>{
  final Runnable body;final long due;final ManualTimer timer;boolean cancelled,done;
  Job(ManualTimer timer,Runnable body,long due){this.timer=timer;this.body=body;this.due=due;}
  public boolean cancel(boolean interrupt){cancelled=true;timer.jobs.remove(this);return true;}
  public boolean isCancelled(){return cancelled;}public boolean isDone(){return done||cancelled;}
  public Object get(){throw new UnsupportedOperationException();}
  public Object get(long timeout,TimeUnit unit){throw new UnsupportedOperationException();}
  public long getDelay(TimeUnit unit){return unit.convert(due-SystemClock.now,TimeUnit.MILLISECONDS);}
  public int compareTo(Delayed other){return Long.compare(getDelay(TimeUnit.MILLISECONDS),other.getDelay(TimeUnit.MILLISECONDS));}
 }
 static class ManualTimer{
  final List<Job> jobs=new ArrayList<>();int wakes,maxQueued;
  ScheduledFuture<?> schedule(Runnable task,long delay,TimeUnit unit){
   Job job=new Job(this,task,SystemClock.now+unit.toMillis(delay));jobs.add(job);maxQueued=Math.max(maxQueued,jobs.size());return job;
  }
  long next(){return jobs.stream().mapToLong(j->j.due).min().orElse(Long.MAX_VALUE);}
  void advance(long millis){long target=SystemClock.now+millis;while(next()<=target){
   long due=next();Job job=jobs.stream().filter(j->j.due==due).findFirst().orElseThrow();jobs.remove(job);
   SystemClock.now=due;wakes++;job.done=true;job.body.run();}SystemClock.now=target;
  }
 }
 static class Context{
  int routes,writes;boolean accepted;Runnable duringWrite;final List<String> delivered=new ArrayList<>();
  Context getContentResolver(){return this;}
  Object call(Object provider,String method,Object arg,Object extras){routes++;return null;}
 }
 static class HookTelemetry{static void event(String text){}}
 static class FeatureSettings{
  // CONSTANTS
  static final Object PROVIDER=new Object(),DIAGNOSTIC_QUEUE_LOCK=new Object(),WRITE_SCHEDULE_LOCK=new Object();
  static ScheduledFuture<?> writeFuture;static long writeScheduledAt,writeScheduleGeneration;
  static final ManualTimer WRITE_WORKER=new ManualTimer();
  static final AtomicBoolean homeReadinessWritePending=new AtomicBoolean();
  static final AtomicLong diagnosticQueueFull=new AtomicLong(),diagnosticExpired=new AtomicLong();
  static String diagnosticLastDropReason="",diagnosticLastDropKey="";static long diagnosticLastDropAt;
  static final Map<String,PendingDiagnostic> DIAGNOSTICS=new ConcurrentHashMap<>();
  static final Map<String,String> DIAGNOSTIC_VALUES=new ConcurrentHashMap<>();
  static final ArrayBlockingQueue<PendingCall> ROUTES=new ArrayBlockingQueue<>(256);
  static class PendingCall{final Context context;final Object extras=new Object();PendingCall(Context c){context=c;}}
  static Context remember(Context context){return context;}
  static String safeDiagnosticKey(String key){return key;}
  static boolean writeDiagnostic(String key,PendingDiagnostic value){
   check(!Thread.holdsLock(WRITE_SCHEDULE_LOCK)&&!Thread.holdsLock(DIAGNOSTIC_QUEUE_LOCK),"IPC under scheduling/admission lock");
   Context c=value.context;c.writes++;c.delivered.add(value.value);
   if(c.duringWrite!=null){Runnable action=c.duringWrite;c.duringWrite=null;action.run();}
   if(c.accepted)return true;value.failures++;value.retryAt=SystemClock.now+30000;return false;
  }
  // MEMBERS
  static void put(Context context,String key,String value){diagnostic(context,key,value,false);}
  static void route(Context context){ROUTES.add(new PendingCall(context));scheduleWrites();}
  static void reset(){DIAGNOSTICS.clear();DIAGNOSTIC_VALUES.clear();ROUTES.clear();WRITE_WORKER.jobs.clear();
   WRITE_WORKER.wakes=WRITE_WORKER.maxQueued=0;writeFuture=null;writeScheduleGeneration++;homeReadinessWritePending.set(false);SystemClock.now+=1000000;
  }
 }
 public static void main(String[] args)throws Exception{
  FeatureSettings.reset();var timer=FeatureSettings.WRITE_WORKER;long start=SystemClock.now;
  FeatureSettings.scheduleNextWrites();check(timer.jobs.isEmpty(),"empty queue scheduled a wakeup");
  Context waiting=new Context();FeatureSettings.put(waiting,"waiting","v");timer.advance(250);
  timer.advance(29999);check(timer.wakes==1&&waiting.writes==1,"30-second backoff generated an early wakeup");
  timer.advance(1);check(timer.wakes==2&&waiting.writes==2,"30-second retry deadline was missed");
  FeatureSettings.reset();start=SystemClock.now;
  Context failed=new Context();FeatureSettings.put(failed,"key","first");timer.advance(250);
  check(failed.writes==1&&timer.next()==start+30250,"failed write did not sleep until retry");
  Job old=(Job)FeatureSettings.writeFuture;
  for(int i=0;i<1000;i++){timer.advance(10);FeatureSettings.put(failed,"key","latest-"+i);}
  check(timer.wakes==1&&failed.writes==1&&timer.jobs.size()==1,"changing values defeated backoff or polled a sleeping queue");
  Context route=new Context();FeatureSettings.route(route);
  check(old.cancelled&&timer.next()==SystemClock.now+250,"fresh route could not advance retry timer");
  old.body.run();check(route.routes==0&&failed.writes==1,"cancelled/taken timer escaped generation check");
  timer.advance(250);check(route.routes==1&&failed.writes==1,"route lost or diagnostic retried early");
  failed.accepted=true;timer.advance(start+30250-SystemClock.now);
  check(failed.writes==2&&failed.delivered.get(1).equals("latest-999")&&timer.jobs.isEmpty(),"latest value lost or idle timer retained");
  check(timer.maxQueued==1,"ordinary writer retained multiple timers");

  FeatureSettings.reset();failed=new Context();FeatureSettings.put(failed,"old","old");timer.advance(250);
  Context fresh=new Context();fresh.accepted=true;FeatureSettings.put(fresh,"fresh","new");timer.advance(250);
  check(fresh.writes==1&&failed.writes==1,"fresh independent key starved behind old retry");
  var pending=FeatureSettings.DIAGNOSTICS.get("old");pending.retryStartedElapsed=SystemClock.now-FeatureSettings.DIAGNOSTIC_RETRY_WINDOW_MS+1000;
  FeatureSettings.scheduleNextWrites();timer.advance(1000);
  check(!FeatureSettings.DIAGNOSTICS.containsKey("old")&&!FeatureSettings.DIAGNOSTIC_VALUES.containsKey("old")&&failed.writes==1,"expiry extended by long retry or retained context/value");

  FeatureSettings.reset();Context batch=new Context();batch.accepted=true;
  for(int i=0;i<100;i++)FeatureSettings.put(batch,"batch"+i,"value"+i);
  timer.advance(250);check(batch.writes==64&&FeatureSettings.DIAGNOSTICS.size()==36,"drain exceeded or lost its batch budget");
  timer.advance(250);check(batch.writes==100&&timer.jobs.isEmpty(),"remaining batch starved or empty queue wakes");

  FeatureSettings.reset();Context race=new Context();Context concurrent=new Context();concurrent.accepted=true;
  race.duringWrite=()->FeatureSettings.put(concurrent,"other","arrived-during-ipc");FeatureSettings.put(race,"blocked","v");timer.advance(500);
  check(concurrent.writes==1&&race.writes==1,"enqueue while draining was lost or waited for old backoff");
  FeatureSettings.reset();Context replacing=new Context();
  replacing.duringWrite=()->FeatureSettings.put(replacing,"same","new-during-ipc");FeatureSettings.put(replacing,"same","old");timer.advance(500);
  var latest=FeatureSettings.DIAGNOSTICS.get("same");check(replacing.writes==1&&latest.value.equals("new-during-ipc")&&latest.failures==1,"in-flight replacement lost failure/backoff or latest value");
  timer.advance(29750);check(replacing.writes==2&&replacing.delivered.get(1).equals("new-during-ipc"),"replacement not delivered at inherited deadline");

  FeatureSettings.reset();Context home=new Context();FeatureSettings.diagnostic(home,"home","HR1",true);
  timer.advance(16);check(home.writes==1,"home readiness lost prompt delivery");timer.advance(30000);
  check(home.writes==2&&timer.wakes==3,"home readiness failed to use bounded retry or busy-polled");

  FeatureSettings.reset();List<Thread> callers=new ArrayList<>();CountDownLatch begin=new CountDownLatch(1);
  for(int i=0;i<16;i++){Thread thread=new Thread(()->{try{begin.await();for(int j=0;j<1000;j++)FeatureSettings.scheduleWrites(30000);}catch(Exception e){throw new AssertionError(e);}});callers.add(thread);thread.start();}
  begin.countDown();for(Thread thread:callers)thread.join();check(timer.jobs.size()==1&&timer.maxQueued==1,"concurrent callers multiplied timers");
  ScheduledThreadPoolExecutor real=(ScheduledThreadPoolExecutor)FeatureSettings.worker("test-cancel-removal");
  try{for(int i=0;i<1000;i++)real.schedule(()->{},1,TimeUnit.HOURS).cancel(false);check(real.getQueue().isEmpty(),"cancelled retries retained executor queue memory");}finally{real.shutdownNow();}
  System.out.println("PASS diagnostic writer deadlines: "+checks+" assertions; no 250ms backoff polling; route/home/batch/expiry/race/cancellation");
 }
}'''

with tempfile.TemporaryDirectory(prefix='duo-writer-deadlines-') as directory:
    work = Path(directory)
    java = work / 'DiagnosticWriteSchedulerTest.java'
    java.write_text(HARNESS.replace('// CONSTANTS', CONSTANTS).replace('// MEMBERS', MEMBERS), encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', str(work), str(java)], check=True)
    subprocess.run(['java', '-cp', str(work), java.stem], check=True, timeout=30)
