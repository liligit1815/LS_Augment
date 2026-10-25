package ls.augment.com;

import android.app.Instrumentation;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Bundle;
import android.os.SystemClock;
import dalvik.system.PathClassLoader;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONObject;

/** Loads the installed production bytecode into a separate namespace, never its live ledger. */
final class ResourceHealthQueueDeviceCases {
    static JSONObject run(Instrumentation test)throws Exception {
        Context context=test.getTargetContext();
        PathClassLoader loader=new PathClassLoader(context.getApplicationInfo().sourceDir,ClassLoader.getSystemClassLoader());
        Class<?> store=Class.forName("ls.augment.com.HealthLedgerStore",true,loader);
        if(store==HealthLedgerStore.class)throw new AssertionError("Must not inject faults into the user's ledger");
        Field field=store.getDeclaredField("WORKER");field.setAccessible(true);
        ThreadPoolExecutor worker=(ThreadPoolExecutor)field.get(null);
        Field database=store.getDeclaredField("database"),owner=store.getDeclaredField("owner");
        database.setAccessible(true);owner.setAccessible(true);
        Method call=store.getDeclaredMethod("call",Context.class,Bundle.class,int.class,int.class);call.setAccessible(true);
        AtomicInteger late=new AtomicInteger(),fast=new AtomicInteger();
        Context counted=new ContextWrapper(context){@Override public Context getApplicationContext(){late.incrementAndGet();return this;}};
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1),ready=new CountDownLatch(96);
        ExecutorService callers=Executors.newFixedThreadPool(96);int peak;
        try {
            worker.execute(()->{entered.countDown();try{release.await();}catch(InterruptedException error){Thread.currentThread().interrupt();}});
            if(!entered.await(2,TimeUnit.SECONDS))throw new AssertionError("Worker fault injection did not start");
            ArrayList<Future<Bundle>> results=new ArrayList<>();
            for(int i=0;i<96;i++)results.add(callers.submit(()->{
                ready.countDown();long before=SystemClock.elapsedRealtime();
                Bundle answer=(Bundle)call.invoke(null,counted,new Bundle(),android.os.Process.myUid(),android.os.Process.myPid());
                if(SystemClock.elapsedRealtime()-before<2000)fast.incrementAndGet();return answer;
            }));
            if(!ready.await(3,TimeUnit.SECONDS))throw new AssertionError("Pressure callers did not start");
            Thread.sleep(1000);peak=worker.getQueue().size();
            for(Future<Bundle> result:results){Bundle answer=result.get(15,TimeUnit.SECONDS);if(answer.getBoolean("ok")||!"ledger_unavailable".equals(answer.getString("state")))throw new AssertionError("Overload/timeout result changed");}
            if(peak!=64||fast.get()<32||!worker.getQueue().isEmpty())throw new AssertionError("Queue cap or timeout removal missing");
            release.countDown();worker.submit(()->{}).get(5,TimeUnit.SECONDS);
            if(late.get()!=0)throw new AssertionError("Expired queued requests executed");
            Bundle recovered=(Bundle)call.invoke(null,counted,new Bundle(),android.os.Process.myUid(),android.os.Process.myPid());
            if(!"invalid_session".equals(recovered.getString("state")))throw new AssertionError("Worker did not recover after pressure");
            if(database.get(null)!=null||owner.get(null)!=null)throw new AssertionError("Invalid requests unexpectedly opened a ledger");
            return new JSONObject().put("success",true).put("scope","INSTALLED_PRODUCTION_BYTECODE_ISOLATED_CLASSLOADER_REAL_ART")
                    .put("requests",96).put("peakQueued",peak).put("immediateRefusals",fast.get())
                    .put("lateExecutions",0).put("queueAfterTimeout",0).put("recovered",true)
                    .put("productionDatabaseOpened",false).put("liveLedgerWorkerTouched",false);
        }finally{
            release.countDown();callers.shutdownNow();worker.shutdown();
            if(!callers.awaitTermination(5,TimeUnit.SECONDS)||!worker.awaitTermination(5,TimeUnit.SECONDS))throw new AssertionError("Fixture threads did not terminate");
        }
    }
}
