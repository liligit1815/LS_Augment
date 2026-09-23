package ls.augment.com;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/** Only a cancellable worker/wait primitive. It knows no early token, Origins or Hook API. */
final class RootEarlyWait<T> {
    static final long MAX_WAIT_NANOS=TimeUnit.SECONDS.toNanos(5);
    private final FutureTask<T> future;
    private final Thread worker;
    private final long deadline;
    private boolean started;
    RootEarlyWait(Callable<T> callable,long deadline) {
        future=new FutureTask<>(callable);worker=new Thread(future,"lsa-early-source-prepare");worker.setDaemon(true);this.deadline=deadline;
    }
    synchronized void cancel(){future.cancel(true);}
    T startAndAwait()throws Exception {
        synchronized(this) {
            if(started)throw new IllegalStateException("Preparation already attempted");started=true;
            long remaining=deadline-System.nanoTime();
            if(remaining<=0 || remaining>MAX_WAIT_NANOS)throw new TimeoutException("invalid/expired preparation deadline");
            if(future.isCancelled())throw new java.util.concurrent.CancellationException("stopped before preparation");
            worker.start();
        }
        try {
            long remaining=deadline-System.nanoTime();if(remaining<=0)throw new TimeoutException("preparation deadline expired");
            T result=future.get(remaining,TimeUnit.NANOSECONDS);
            if(deadline-System.nanoTime()<=0)throw new TimeoutException("completion arrived at/after deadline");
            return result;
        } catch(InterruptedException interrupted) {
            cancel();Thread.currentThread().interrupt();throw interrupted;
        } finally {cancel();} // No listener can consume a discarded or late value.
    }
}
