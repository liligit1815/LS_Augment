package ls.augment.com;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.LongSupplier;

/** Test-only, memory-only input recorder. Screenshot/Binder latency cannot extend the cancel deadline. */
final class BackGestureProbeTimeline {
    // r2 changes the test input cadence; it does not reclassify earlier 8x7 ms captures.
    static final String INPUT_CADENCE="gesture-r2-8x5-first180-second295";
    static final int DOWN=0,MOVE=2,CANCEL=3,DEADLINE_MILLIS=350,MOVE_COUNT=8,MOVE_STEP_MILLIS=5;
    static final int FIRST_SAMPLE_MILLIS=180,SECOND_SAMPLE_MILLIS=295,SAMPLE_GAP_MILLIS=80;
    static final int MIN_STATIONARY_MILLIS=120;
    // 20459 measured 43 ms for the second capture and 5 ms from CANCEL request
    // to native return; reserve that plus the existing 3 ms sample separation.
    static final int SECOND_CAPTURE_BUDGET_MILLIS=43,CANCEL_RESERVE_MILLIS=8;
    interface Input {boolean inject(long down,long time,int action,float x,float y);}
    interface Sleeper {void sleep(long millis);}
    static final class Event {
        final int action;final long down,time;final float x,y;
        volatile long returned;volatile boolean accepted;volatile Throwable error;
        Event(int action,long down,long time,float x,float y){this.action=action;this.down=down;this.time=time;this.x=x;this.y=y;}
    }
    final List<Event> events=new ArrayList<>();
    final LongSupplier clock;final Sleeper sleeper;final Input input;
    final float start,destination,y;
    final AtomicBoolean cancelling=new AtomicBoolean();
    final CountDownLatch cancelled=new CountDownLatch(1);
    volatile long down,movesCompleted;volatile float at;
    volatile Event cancelEvent;private Thread watchdog;

    BackGestureProbeTimeline(LongSupplier clock,Sleeper sleeper,Input input,float start,float destination,float y) {
        this.clock=clock;this.sleeper=sleeper;this.input=input;this.start=start;this.destination=destination;this.y=y;this.at=start;
    }

    void begin() {
        down=clock.getAsLong();
        watchdog=new Thread(()->{
            try {
                long remaining=down+DEADLINE_MILLIS-clock.getAsLong();
                if(remaining<=0||!cancelled.await(remaining,TimeUnit.MILLISECONDS))cancel();
            }catch(InterruptedException interrupted){Thread.currentThread().interrupt();cancel();}
        },"LSA-test-gesture-cancel");
        watchdog.setDaemon(true);watchdog.start();
        if(!send(DOWN,start).accepted)return;
        for(int step=1;step<=MOVE_COUNT;step++) {
            long remaining=down+step*MOVE_STEP_MILLIS-clock.getAsLong();if(remaining>0)sleeper.sleep(remaining);
            if(cancelling.get()||clock.getAsLong()>=down+DEADLINE_MILLIS)return;
            at=start+(destination-start)*step/MOVE_COUNT;
            if(!send(MOVE,at).accepted)return;
        }
        movesCompleted=clock.getAsLong();
    }

    private Event send(int action,float x) {
        Event event=new Event(action,down,clock.getAsLong(),x,y);
        synchronized(events){events.add(event);}
        try{event.accepted=input.inject(down,event.time,action,x,y);}
        catch(Throwable error){event.error=error;}
        finally{event.returned=clock.getAsLong();}
        return event;
    }

    void cancel() {
        if(!cancelling.compareAndSet(false,true))return;
        try{cancelEvent=send(CANCEL,at);}finally{cancelled.countDown();}
    }

    boolean awaitFirstSample() {
        if(movesCompleted==0||cancelling.get())return false;
        long target=firstSampleAt(down,movesCompleted);
        // A late MOVE must not shorten the native fade interval. If even an instantaneous
        // first capture cannot leave two samples and the CANCEL reserve, do not capture.
        if(!secondSampleFits(down,target,clock.getAsLong()))return false;
        long remaining=target-clock.getAsLong();
        if(remaining>0)sleeper.sleep(remaining);
        return !cancelling.get()&&secondSampleFits(down,clock.getAsLong(),clock.getAsLong());
    }

    static long firstSampleAt(long down,long movesCompleted) {
        return Math.max(down+FIRST_SAMPLE_MILLIS,movesCompleted+MIN_STATIONARY_MILLIS);
    }

    static long secondSampleAt(long down,long firstEnd) {
        return Math.max(down+SECOND_SAMPLE_MILLIS,firstEnd+SAMPLE_GAP_MILLIS);
    }

    static boolean secondSampleFits(long down,long firstEnd,long now) {
        long earliest=Math.max(now,secondSampleAt(down,firstEnd));
        return earliest+SECOND_CAPTURE_BUDGET_MILLIS+CANCEL_RESERVE_MILLIS<=down+DEADLINE_MILLIS;
    }

    boolean awaitSecondSample(long firstEnd) {
        if(cancelling.get()||!secondSampleFits(down,firstEnd,clock.getAsLong()))return false;
        long remaining=secondSampleAt(down,firstEnd)-clock.getAsLong();
        if(remaining>0)sleeper.sleep(remaining);
        return !cancelling.get()&&secondSampleFits(down,firstEnd,clock.getAsLong());
    }

    /** Injection ACK is not native receipt or completion. Applied only after
     * the nonce/build/process/downTime-matched terminal probe has been read. */
    static String nativeCancelReason(long down,long received,long returned) {
        if(down<=0||received<down||returned<received)return "Native CANCEL timing unavailable or out of order";
        if(received-down>DEADLINE_MILLIS)return "Native CANCEL received after the 350 ms limit";
        if(returned-down>DEADLINE_MILLIS)return "Native CANCEL returned after the 350 ms limit";
        return null;
    }

    static boolean stableIdle(int changed,int area) {
        return area>0&&changed>=0&&changed<=area&&changed*1000L<=area*5L;
    }
    static final class IdleWindow {
        int consecutive;
        boolean observe(int changed,int area) {
            consecutive=stableIdle(changed,area)?Math.min(2,consecutive+1):0;
            return consecutive>=2;
        }
    }

    boolean finish() throws InterruptedException {
        cancel();
        if(!cancelled.await(1500,TimeUnit.MILLISECONDS))return false;
        if(watchdog!=null)watchdog.join(100);
        // A stalled in-flight DOWN/MOVE may return after the watchdog's CANCEL. Flush it with
        // another CANCEL before any HOME/recovery action; such a run can never certify pixels.
        boolean late=false;
        synchronized(events){for(Event event:events)if(event.action!=CANCEL&&event.returned>cancelEvent.time)late=true;}
        if(late){Event cleanup=send(CANCEL,at);if(!cleanup.accepted||cleanup.error!=null)return false;}
        return cancelEvent!=null&&cancelEvent.accepted&&cancelEvent.error==null;
    }

    String invalidReason(long firstStart,long firstEnd,long secondStart,long secondEnd) {
        if(cancelled.getCount()!=0||cancelEvent==null)return "Cancellation did not complete";
        if(cancelEvent.time-down>DEADLINE_MILLIS||cancelEvent.returned-down>DEADLINE_MILLIS)
            return "Actual CANCEL exceeded the 350 ms limit";
        int moves=0;long previous=down;
        synchronized(events){for(Event event:events) {
            if(!event.accepted||event.error!=null)return "Input injection was rejected or failed";
            if(event.action==CANCEL)continue;
            if(event.time<down||event.returned<event.time||event.returned>cancelEvent.time)return "Input call crossed cancellation";
            if(event.action==MOVE){moves++;if(event.time-previous>40)return "Actual MOVE interval exceeded 40 ms";}
            previous=event.time;
        }}
        if(moves!=MOVE_COUNT||movesCompleted==0)return "Movement did not complete";
        if(firstStart<movesCompleted+MIN_STATIONARY_MILLIS||firstStart<down+FIRST_SAMPLE_MILLIS||firstEnd<=firstStart
                ||secondStart<secondSampleAt(down,firstEnd)||secondEnd<=secondStart)
            return "Both stationary screenshot intervals were not observed";
        if(firstEnd>=cancelEvent.time||secondEnd>=cancelEvent.time||secondEnd-down>=DEADLINE_MILLIS)
            return "Screenshot crossed CANCEL or the 350 ms limit";
        return null;
    }
}
