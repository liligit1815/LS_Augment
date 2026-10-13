"""Exercise the production latest-only publisher with deterministic failures.

The Android doubles test the real asynchronous call boundary; no phone, Settings,
launcher preferences or module files are written by this test.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
    'android/net/Uri.java': '''package android.net;public final class Uri {public final String value;private Uri(String value){this.value=value;}public static Uri parse(String value){return new Uri(value);}}''',
    'android/database/ContentObserver.java': '''package android.database;public abstract class ContentObserver {public ContentObserver(Object handler){}public void onChange(boolean selfChange){}}''',
    'android/os/Bundle.java': '''package android.os;import java.util.*;public final class Bundle {private final Map<String,Object> values=new HashMap<>();public void putString(String key,String value){values.put(key,value);}public String getString(String key){return (String)values.get(key);}public void putBoolean(String key,boolean value){values.put(key,value);}public boolean getBoolean(String key,boolean fallback){Object value=values.get(key);return value instanceof Boolean?(Boolean)value:fallback;}}''',
    'android/content/ContentResolver.java': '''package android.content;public final class ContentResolver {public interface Call {android.os.Bundle call(android.net.Uri uri,String method,String arg,android.os.Bundle extras);}public interface Registration {void register(android.net.Uri uri,boolean descendants,android.database.ContentObserver observer);}public volatile Call handler;public volatile Registration registration;public volatile android.database.ContentObserver observer;public void registerContentObserver(android.net.Uri uri,boolean descendants,android.database.ContentObserver observer){if(registration!=null)registration.register(uri,descendants,observer);this.observer=observer;}public android.os.Bundle call(android.net.Uri uri,String method,String arg,android.os.Bundle extras){return handler.call(uri,method,arg,extras);}}''',
    'android/content/Context.java': '''package android.content;public final class Context {public final ContentResolver resolver=new ContentResolver();public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}}''',
    'ls/augment/com/hook/TestRecentsRadiusPublisher.java': '''package ls.augment.com.hook;
import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public final class TestRecentsRadiusPublisher {
    static int checks;
    static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
    static final class Queue implements LauncherRecentsRadiusPublisher.Scheduler {
        static final class Job {final long at;final Runnable action;Job(long at,Runnable action){this.at=at;this.action=action;}}
        final List<Job> jobs=new ArrayList<>();long now;boolean fail;
        public void schedule(Runnable task,long delay){if(fail)throw new RejectedExecutionException();jobs.add(new Job(now+delay,task));check(jobs.size()<=1,"only one callback queued");}
        void next(){check(!jobs.isEmpty(),"callback exists");Job job=jobs.remove(0);now=Math.max(now,job.at);job.action.run();}
        void advance(long millis){long end=now+millis;for(int i=0;i<100;i++){if(jobs.isEmpty()||jobs.get(0).at>end){now=end;return;}next();}throw new AssertionError("unbounded retry");}
    }
    public static void main(String[] args)throws Exception {
        Queue q=new Queue();List<String> sent=new ArrayList<>();
        LauncherRecentsRadiusPublisher publisher=new LauncherRecentsRadiusPublisher(q,payload->{sent.add(payload);return true;});
        publisher.publish("A","A@1");check(sent.isEmpty(),"observation never calls transport inline");q.next();
        check(sent.equals(List.of("A@1")),"initial geometry accepted");
        for(int i=0;i<1000;i++){q.advance(60_000);publisher.publish("A","A@"+(i+2));}
        check(sent.size()==1&&q.jobs.isEmpty(),"same acknowledged geometry has no time-based IPC over 1000 minutes");
        publisher.publish("B","B");publisher.publish("C","C");check(q.jobs.size()==1,"queued replacements coalesce");q.next();
        check(sent.equals(List.of("A@1","C")),"only latest pending geometry sent");
        publisher.publish("B","B");publisher.publish("C","C@again");q.next();
        check(sent.size()==2,"return to acknowledged value before wire needs no duplicate IPC");
        publisher.publish("A","A@new");q.next();check(sent.size()==3&&sent.get(2).equals("A@new"),"return to older geometry after changed ACK is delivered");

        Queue floatQueue=new Queue();List<String> floatWire=new ArrayList<>();
        LauncherRecentsRadiusPublisher floating=new LauncherRecentsRadiusPublisher(floatQueue,payload->{floatWire.add(payload);return true;});
        String integerRange="260029,520,1220,2712,0,-16,96";
        floating.publish(integerRange,"native=16.00000025,max=111.39446");floatQueue.next();
        floating.publish(integerRange,"native=16.00000030,max=111.82779");floatQueue.advance(1_000_000);
        check(floatWire.size()==1&&floatQueue.jobs.isEmpty(),"real-device floating radius variation within same endpoints never submits again");
        floating.publish("260029,520,1220,2712,0,-16,97","native=16,max=112.1");floatQueue.next();
        check(floatWire.size()==2,"crossing integer endpoint submits updated validation payload");

        Queue lost=new Queue();List<String> applied=new ArrayList<>();AtomicInteger tries=new AtomicInteger();
        LauncherRecentsRadiusPublisher retry=new LauncherRecentsRadiusPublisher(lost,payload->{applied.add(payload);if(tries.incrementAndGet()==1)throw new IllegalStateException("ACK lost");return true;});
        retry.publish("A","same-payload");lost.next();check(applied.size()==1&&lost.jobs.size()==1,"lost ACK retries after applying value");
        lost.advance(249);check(applied.size()==1,"retry does not spin");lost.advance(1);
        check(applied.equals(List.of("same-payload","same-payload"))&&lost.jobs.isEmpty(),"same immutable payload retried then acknowledged");
        retry.publish("A","new-time");check(lost.jobs.isEmpty(),"successful retry enables dedup");

        Queue down=new Queue();AtomicBoolean available=new AtomicBoolean();AtomicInteger calls=new AtomicInteger();
        LauncherRecentsRadiusPublisher recovery=new LauncherRecentsRadiusPublisher(down,payload->{calls.incrementAndGet();return available.get();});
        recovery.publish("A","A");down.advance(10_000);
        check(calls.get()==3&&down.jobs.isEmpty(),"unavailable provider stops after bounded attempts");
        available.set(true);recovery.publish("A","A@later");down.next();
        check(calls.get()==4&&down.jobs.isEmpty(),"later real observation recovers same geometry after exhaustion");

        for(boolean oldAccepted:new boolean[]{false,true}) {
            Queue replaced=new Queue();List<String> actual=new ArrayList<>();LauncherRecentsRadiusPublisher[] ref=new LauncherRecentsRadiusPublisher[1];
            ref[0]=new LauncherRecentsRadiusPublisher(replaced,payload->{actual.add(payload);if(payload.equals("old")){ref[0].publish("new","new");return oldAccepted;}return true;});
            ref[0].publish("old","old");replaced.next();replaced.next();
            check(actual.equals(List.of("old","new"))&&replaced.jobs.isEmpty(),"old completion cannot discard or retry over newer geometry, ACK="+oldAccepted);
        }

        Queue restore=new Queue();List<String> restoration=new ArrayList<>();LauncherRecentsRadiusPublisher[] returning=new LauncherRecentsRadiusPublisher[1];
        returning[0]=new LauncherRecentsRadiusPublisher(restore,payload->{restoration.add(payload);if(payload.equals("B")){returning[0].publish("A","restored-A");return false;}return true;});
        returning[0].publish("A","initial-A");restore.next();returning[0].publish("B","B");restore.next();restore.next();
        check(restoration.equals(List.of("initial-A","B","restored-A")),"uncertain failed B requires restoring A despite earlier A ACK");

        Queue rejected=new Queue();AtomicInteger resumed=new AtomicInteger();
        LauncherRecentsRadiusPublisher schedulerRecovery=new LauncherRecentsRadiusPublisher(rejected,payload->{resumed.incrementAndGet();return true;});
        rejected.fail=true;schedulerRecovery.publish("A","A");check(rejected.jobs.isEmpty(),"scheduler rejection stays contained");
        rejected.fail=false;schedulerRecovery.publish("A","A");rejected.next();check(resumed.get()==1,"scheduler rejection can recover on next observation");

        Queue busy=new Queue();AtomicInteger failures=new AtomicInteger();LauncherRecentsRadiusPublisher[] observing=new LauncherRecentsRadiusPublisher[1];
        observing[0]=new LauncherRecentsRadiusPublisher(busy,payload->{failures.incrementAndGet();observing[0].publish("A","new-frame");return false;});
        observing[0].publish("A","A");busy.advance(10_000);check(failures.get()==3&&busy.jobs.isEmpty(),"same in-flight observations cannot reset retry limit");

        Queue resetQueue=new Queue();List<String> resetWire=new ArrayList<>();
        LauncherRecentsRadiusPublisher resetPublisher=new LauncherRecentsRadiusPublisher(resetQueue,payload->{resetWire.add(payload);return true;});
        resetPublisher.publish("A","before-reset");resetQueue.next();resetPublisher.resetObserved();
        check(resetQueue.jobs.isEmpty(),"reset only invalidates state, never schedules old data");
        resetPublisher.publish("A","fresh-A");resetQueue.next();check(resetWire.equals(List.of("before-reset","fresh-A")),"same geometry is saved again after explicit reset");
        resetPublisher.publish("B","queued-old-B");resetPublisher.resetObserved();resetQueue.next();
        check(resetWire.size()==2,"queued pre-reset observation is discarded");
        resetPublisher.publish("C","queued-old-C");resetPublisher.resetObserved();resetPublisher.publish("C","fresh-C");resetQueue.next();
        check(resetWire.get(2).equals("fresh-C")&&resetWire.size()==3,"new sample replaces canceled callback without replaying old data");

        for(boolean newDuringFlight:new boolean[]{false,true}) {
            Queue resetFlight=new Queue();List<String> flightWire=new ArrayList<>();LauncherRecentsRadiusPublisher[] ref=new LauncherRecentsRadiusPublisher[1];
            ref[0]=new LauncherRecentsRadiusPublisher(resetFlight,payload->{flightWire.add(payload);if(payload.equals("old-A")){ref[0].resetObserved();if(newDuringFlight)ref[0].publish("A","new-A");}return true;});
            ref[0].publish("A","old-A");resetFlight.next();
            if(!newDuringFlight){check(resetFlight.jobs.isEmpty(),"in-flight reset does not automatically resend");ref[0].publish("A","new-A");}
            resetFlight.next();check(flightWire.equals(List.of("old-A","new-A")),"old in-flight success cannot acknowledge post-reset sample, overlap="+newDuringFlight);
        }

        // Exercise the production constructor and actual worker, including a
        // blocked provider. Rendering-side submission remains immediately free.
        android.content.Context context=new android.content.Context();Thread caller=Thread.currentThread();
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1),completed=new CountDownLatch(2);
        AtomicReference<Throwable> workerFailure=new AtomicReference<>();List<String> wire=Collections.synchronizedList(new ArrayList<>());
        AtomicInteger registrations=new AtomicInteger();
        context.resolver.registration=(uri,descendants,observer)->{
            if(Thread.currentThread()==caller||!uri.value.equals("content://ls.augment.com.config/recents-radius-reset")||descendants)throw new AssertionError("reset observer must register precisely on worker");
            registrations.incrementAndGet();
        };
        context.resolver.handler=(uri,method,arg,extras)->{
            try {
                if(Thread.currentThread()==caller)throw new AssertionError("IPC ran on rendering thread");
                if(!uri.value.equals("content://ls.augment.com.config")||!method.equals("recents_radius_publish")||arg!=null)throw new AssertionError("dedicated module-private provider route");
                String payload=extras.getString("payload");wire.add(payload);
                if(payload.equals("slow")){entered.countDown();if(!release.await(3,TimeUnit.SECONDS))throw new AssertionError("caller blocked behind IPC");}
                android.os.Bundle result=new android.os.Bundle();result.putBoolean("ok",true);return result;
            } catch(Throwable failure){workerFailure.set(failure);throw new IllegalStateException(failure);}
            finally {completed.countDown();}
        };
        LauncherRecentsRadiusPublisher real=new LauncherRecentsRadiusPublisher(context);real.publish("slow","slow");
        check(entered.await(2,TimeUnit.SECONDS),"worker entered provider after publish returned");
        real.publish("obsolete","obsolete");real.publish("latest","latest");release.countDown();
        check(completed.await(2,TimeUnit.SECONDS),"latest geometry delivered after slow request");
        check(workerFailure.get()==null&&wire.equals(List.of("slow","latest")),"background wire excludes replaced geometry and diagnostic channels");
        check(registrations.get()==1&&context.resolver.observer!=null,"dedicated reset observer installed once before ACK");

        android.content.Context retryContext=new android.content.Context();CountDownLatch registrationFailures=new CountDownLatch(3),registrationRecovered=new CountDownLatch(1);
        AtomicBoolean registrationAvailable=new AtomicBoolean();AtomicInteger registrationAttempts=new AtomicInteger(),recoveredCalls=new AtomicInteger();
        retryContext.resolver.registration=(uri,descendants,observer)->{registrationAttempts.incrementAndGet();if(!registrationAvailable.get()){registrationFailures.countDown();throw new IllegalStateException("registration unavailable");}};
        retryContext.resolver.handler=(uri,method,arg,extras)->{recoveredCalls.incrementAndGet();android.os.Bundle result=new android.os.Bundle();result.putBoolean("ok",true);registrationRecovered.countDown();return result;};
        LauncherRecentsRadiusPublisher registrationRetry=new LauncherRecentsRadiusPublisher(retryContext);registrationRetry.publish("A","A");
        check(registrationFailures.await(2,TimeUnit.SECONDS),"observer registration gets bounded retry attempts");
        // Synchronize on the publisher after a marker on its single worker so
        // the third failure finishes before submitting a fresh real sample.
        CountDownLatch barrier=new CountDownLatch(1);android.content.Context markerContext=new android.content.Context();
        markerContext.resolver.handler=(uri,method,arg,extras)->{barrier.countDown();android.os.Bundle result=new android.os.Bundle();result.putBoolean("ok",true);return result;};
        new LauncherRecentsRadiusPublisher(markerContext).publish("marker","marker");check(barrier.await(2,TimeUnit.SECONDS),"worker drained registration failure");
        check(registrationAttempts.get()==3&&recoveredCalls.get()==0,"registration failure never acknowledges unpublished data");
        registrationAvailable.set(true);registrationRetry.publish("A","A@fresh");check(registrationRecovered.await(2,TimeUnit.SECONDS),"fresh observation recovers observer registration");
        check(registrationAttempts.get()==4&&recoveredCalls.get()==1,"registration recovery uses dedicated call once");
        System.out.println("PASS Recents radius publisher "+checks+" checks (ACK dedup, bounded failure recovery, latest-only background IPC)");
    }
}''',
}


def main():
    with tempfile.TemporaryDirectory(prefix='lsa-recents-radius-publisher-') as directory:
        root = Path(directory)
        for name, source in SOURCES.items():
            path = root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding='utf-8')
        files = list(root.rglob('*.java')) + [ROOT / 'android/app/src/main/java/ls/augment/com/hook/LauncherRecentsRadiusPublisher.java']
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(root / 'classes'), *map(str, files)], check=True)
        subprocess.run(['java', '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestRecentsRadiusPublisher'], check=True)


if __name__ == '__main__':
    main()
