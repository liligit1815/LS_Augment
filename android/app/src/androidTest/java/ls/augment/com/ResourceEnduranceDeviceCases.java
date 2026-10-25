package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Bundle;
import android.os.Debug;
import android.os.Process;
import android.os.SystemClock;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Bounded test-APK stress in one target process; no forced GC, recorder, or native health writes. */
final class ResourceEnduranceDeviceCases {
    static JSONObject run(Instrumentation test,Bundle args)throws Exception {
        int iterations=Integer.parseInt(args.getString("iterations","100"));
        int periodMillis=Integer.parseInt(args.getString("periodMillis","8000"));
        int idleSeconds=Integer.parseInt(args.getString("idleSeconds","0"));
        if(iterations<1||iterations>200||periodMillis<1000||periodMillis>15000||idleSeconds<0||idleSeconds>1800)
            throw new IllegalArgumentException("bounded endurance arguments");
        File cache=test.getTargetContext().getCacheDir();
        if(exports(cache)!=0)throw new IllegalStateException("Existing export: wait for the user operation to finish");
        long start=SystemClock.elapsedRealtime();int checks=0,rotations=0,cancelled=0,early=0;
        JSONArray samples=new JSONArray();samples.put(sample(test,0,start));
        File progress=new File(cache,"resource-endurance-progress.json");
        JSONObject report=new JSONObject().put("scope","SAME_PROCESS_REAL_STORAGE_SYNTHETIC_RECORDS_PICKER_CANCEL_TEST_DOUBLE")
                .put("pid",Process.myPid()).put("iterations",iterations).put("samples",samples)
                .put("nativeHealthRowsWritten",0).put("microphoneUsed",false).put("forcedGc",false);
        AtomicInteger pickerHits=new AtomicInteger();
        Instrumentation.ActivityMonitor picker=new Instrumentation.ActivityMonitor(){
            @Override public Instrumentation.ActivityResult onStartActivity(Intent intent){
                if(!Intent.ACTION_CREATE_DOCUMENT.equals(intent.getAction()))return null;
                if(!"text/plain".equals(intent.getType())||!intent.hasCategory(Intent.CATEGORY_OPENABLE))throw new AssertionError("Unexpected export intent");
                pickerHits.incrementAndGet();return new Instrumentation.ActivityResult(Activity.RESULT_CANCELED,null);
            }
        };test.addMonitor(picker);
        try {
            for(int i=1;i<=iterations;i++) {
                long cycle=SystemClock.elapsedRealtime();checkTemperature(test);
                JSONObject boundary=ResourceBoundaryDeviceCases.run(test);
                if(!boundary.getBoolean("success")||!boundary.getBoolean("fixtureStorageRemoved"))throw new AssertionError(boundary.toString());
                checks+=boundary.getInt("checks");
                if(i%10==0)rotations+=rotate(cache);
                if(i%5==0){
                    boolean finishEarly=i%10==0;export(test,cache,finishEarly);
                    if(finishEarly)early++;else cancelled++;
                }
                if(i%5==0||i==iterations){
                    samples.put(sample(test,i,start));
                    report.put("completed",i).put("checks",checks).put("rotations",rotations)
                            .put("pickerCancellations",cancelled).put("collectionCancellations",early);
                    Files.write(progress.toPath(),report.toString().getBytes(StandardCharsets.UTF_8));
                }
                long remaining=periodMillis-(SystemClock.elapsedRealtime()-cycle);
                if(remaining>0)Thread.sleep(remaining);
            }
            if(pickerHits.get()<cancelled)throw new AssertionError("Save picker cancellation was not exercised");
            awaitReleased(cache);test.waitForIdleSync();
            samples.put(sample(test,iterations,start));
            if(idleSeconds>0){
                JSONArray idle=new JSONArray();report.put("phase","idle").put("idleSamples",idle).put("idleSeconds",idleSeconds);
                long idleStart=SystemClock.elapsedRealtime();
                while(true){
                    long elapsed=SystemClock.elapsedRealtime()-idleStart;
                    idle.put(sample(test,iterations,start).put("idleElapsedMillis",elapsed));
                    Files.write(progress.toPath(),report.toString().getBytes(StandardCharsets.UTF_8));
                    if(elapsed>=idleSeconds*1000L)break;
                    Thread.sleep(Math.min(30000,idleSeconds*1000L-elapsed));
                }
                awaitReleased(cache);
            }
            return report.put("success",true).put("elapsedMillis",SystemClock.elapsedRealtime()-start)
                    .put("pickerHits",pickerHits.get()).put("finalExportFiles",exports(cache));
        }finally{
            test.removeMonitor(picker);Files.deleteIfExists(progress.toPath());
        }
    }
    private static void export(Instrumentation test,File cache,boolean early)throws Exception {
        Application application=(Application)test.getTargetContext().getApplicationContext();
        AtomicReference<Activity> created=new AtomicReference<>();AtomicBoolean destroyed=new AtomicBoolean();
        Application.ActivityLifecycleCallbacks callback=new Application.ActivityLifecycleCallbacks(){
            public void onActivityCreated(Activity a,Bundle state){if(a instanceof LogExportActivity)created.set(a);}
            public void onActivityDestroyed(Activity a){if(a==created.get())destroyed.set(true);}
            public void onActivityStarted(Activity a){}public void onActivityResumed(Activity a){}
            public void onActivityPaused(Activity a){}public void onActivityStopped(Activity a){}
            public void onActivitySaveInstanceState(Activity a,Bundle state){}
        };
        application.registerActivityLifecycleCallbacks(callback);
        try{
            test.runOnMainSync(()->test.getTargetContext().startActivity(new Intent(test.getTargetContext(),LogExportActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK)));
            long createdDeadline=SystemClock.elapsedRealtime()+5000;
            while(created.get()==null&&SystemClock.elapsedRealtime()<createdDeadline)Thread.sleep(25);
            if(created.get()==null)throw new AssertionError("Export Activity did not start");
            if(early)test.runOnMainSync(()->created.get().finish());
            long deadline=SystemClock.elapsedRealtime()+30000;
            while(!destroyed.get()&&SystemClock.elapsedRealtime()<deadline)Thread.sleep(50);
            if(!destroyed.get())throw new AssertionError("Export cancellation retained Activity");
            awaitReleased(cache);
        }finally{test.runOnMainSync(()->{Activity activity=created.get();if(activity!=null&&!activity.isDestroyed())activity.finish();});application.unregisterActivityLifecycleCallbacks(callback);}
    }
    private static void awaitReleased(File cache)throws Exception {
        long deadline=SystemClock.elapsedRealtime()+30000;
        while(SystemClock.elapsedRealtime()<deadline){
            if(exports(cache)==0&&exportWorkers()==0)return;
            Thread.sleep(50);
        }
        throw new AssertionError("Export files/workers retained after cancellation");
    }
    private static int exportWorkers(){int count=0;for(Thread thread:Thread.getAllStackTraces().keySet())if(thread.isAlive()&&thread.getName().startsWith("duo-log-"))count++;return count;}
    private static int exports(File cache){File[] files=cache.listFiles(f->f.getName().matches("duo-log-[a-f0-9-]+\\.txt"));if(files==null)throw new IllegalStateException("Cache unreadable");return files.length;}
    private static int rotate(File cache)throws Exception {
        File file=new File(cache,"resource-endurance-"+UUID.randomUUID()+".log");int rotations=0;
        try{
            for(int line=0;line<4000;line++){
                if(BoundedLog.append(file,"轮转-"+line+"-"+"x".repeat(1010),2*1024*1024,1024*1024))rotations++;
                if(file.length()>2*1024*1024)throw new AssertionError("Log exceeded cap");
            }
            String tail=new String(BoundedLog.tail(file,2048),StandardCharsets.UTF_8);
            if(rotations<2||!tail.contains("轮转-3999-")||tail.indexOf('\uFFFD')>=0)throw new AssertionError("Rotation lost newest complete UTF-8 line");
            return rotations;
        }finally{Files.deleteIfExists(file.toPath());}
    }
    private static JSONObject sample(Instrumentation test,int iteration,long start)throws Exception {
        Runtime runtime=Runtime.getRuntime();String[] descriptors=new File("/proc/self/fd").list();
        return new JSONObject().put("iteration",iteration).put("elapsedMillis",SystemClock.elapsedRealtime()-start)
                .put("pid",Process.myPid()).put("javaUsedBytes",runtime.totalMemory()-runtime.freeMemory())
                .put("javaCommittedBytes",runtime.totalMemory()).put("javaMaxBytes",runtime.maxMemory())
                .put("nativeAllocatedBytes",Debug.getNativeHeapAllocatedSize()).put("pssKiB",Debug.getPss())
                .put("javaThreads",Thread.getAllStackTraces().size()).put("fdCount",descriptors==null?-1:descriptors.length)
                .put("exportWorkers",exportWorkers()).put("exportFiles",exports(test.getTargetContext().getCacheDir()));
    }
    private static void checkTemperature(Instrumentation test){
        Intent battery=test.getTargetContext().registerReceiver(null,new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
        if(battery!=null&&battery.getIntExtra(BatteryManager.EXTRA_TEMPERATURE,0)>=450)
            throw new IllegalStateException("Temperature limit reached; stop pressure and retain observations");
    }
}
