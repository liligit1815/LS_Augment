package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.*;
import io.github.libxposed.api.XposedInterface.*;
import java.lang.reflect.Executable;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import org.json.*;
import ls.augment.com.BuildConfig;

/** Counters never decide hook behavior; bounded export work runs off the hooked thread. */
final class HookTelemetry {
    private static final ConcurrentHashMap<String,Counter> counters=new ConcurrentHashMap<>();
    private static final ArrayBlockingQueue<String[]> trace=new ArrayBlockingQueue<>(256);
    private static final AtomicLong dropped=new AtomicLong(),sequence=new AtomicLong();
    private static final AtomicInteger capturedErrorStacks=new AtomicInteger();
    private static final long startedWall=System.currentTimeMillis(),startedElapsed=SystemClock.elapsedRealtime();
    private static volatile String process="unknown",pkg="unknown",framework="unknown";
    private static volatile boolean shoulder,ai;
    private static long lastPublished;
    private static final AtomicInteger publishWarnings=new AtomicInteger();
    private static final ScheduledExecutorService worker=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"LSA-DiagnosticWriter");t.setDaemon(true);return t;});
    static { worker.scheduleWithFixedDelay(HookTelemetry::publish,1,3,TimeUnit.SECONDS); }
    static void loaded(String name,String engine){process=name;framework=engine;}
    static void ready(String name){pkg="system".equals(process)?"system":name;}
    static HookBuilder observe(HookBuilder delegate,Executable target){return new HookBuilder(){
        String id=target.toGenericString();
        public HookBuilder setPriority(int p){delegate.setPriority(p);return this;}
        public HookBuilder setExceptionMode(ExceptionMode mode){delegate.setExceptionMode(mode);return this;}
        public HookBuilder setId(String value){id=value;delegate.setId(value);return this;}
        public HookHandle intercept(Hooker hooker){
            Counter counter=new Counter(target.toGenericString());counters.put(id,counter);
            try{HookHandle handle=delegate.intercept(chain->{
                counter.hits.incrementAndGet();counter.lastHit=System.currentTimeMillis();
                try {Object value=hooker.intercept(chain);counter.returned.incrementAndGet();return value;}
                catch(Throwable error){long errors=counter.errors.incrementAndGet();counter.lastError=error.getClass().getName()+":"+String.valueOf(error.getMessage());
                    if(errors==1){
                        if(capturedErrorStacks.getAndIncrement()<8){String stack=android.util.Log.getStackTraceString(error);counter.lastErrorStack=stack.length()>4096?stack.substring(0,4096)+" [TRUNCATED]":stack;}
                        android.util.Log.e("LS_Augment","HOOK_CALLBACK_FAILURE process="+process+" id="+id,error);
                    }
                    throw error;}
            });counter.state="REGISTERED";return handle;}
            catch(Throwable error){counter.state="REGISTRATION_FAILED";counter.lastError=error.toString();if(error instanceof Error)throw (Error)error;throw new IllegalStateException(error);}
        }
    };}
    static void detail(String feature,String value){
        if((feature.equals("AI")&&!ai)||(feature.equals("SHOULDER")&&!shoulder))return;
        String text="seq="+sequence.incrementAndGet()+" wall="+System.currentTimeMillis()+" elapsed="+SystemClock.elapsedRealtime()+" thread="+Thread.currentThread().getName()+" "+value;
        if(text.length()>1900)text=text.substring(0,1900)+" [TRUNCATED]";
        if(!trace.offer(new String[]{feature,text}))dropped.incrementAndGet();
    }
    static void event(String message){
        String upper=message.toUpperCase(Locale.ROOT);
        if(upper.contains("TGK")||upper.contains("SHOULDER")||upper.contains("RAPID"))detail("SHOULDER",message);
        else if(upper.contains("AI_")||upper.contains("AI."))detail("AI",message);
    }
    private static void publish(){int pendingEvents=0;try{
        Context context=FeatureSettings.from(null);if(context==null)return;
        shoulder=FeatureSettings.enabled(context,FeatureSettings.SHOULDER_DIAGNOSTICS);
        ai=FeatureSettings.enabled(context,FeatureSettings.AI_TRIGGER_DIAGNOSTICS);
        long now=SystemClock.elapsedRealtime();if(!shoulder&&!ai&&now-lastPublished<15000)return;lastPublished=now;
        JSONObject out=new JSONObject().put("package",pkg).put("process",process).put("pid",android.os.Process.myPid())
            .put("moduleVersion",BuildConfig.VERSION_NAME).put("framework",framework).put("moduleLoadedAt",startedWall)
            .put("processStartedElapsed",android.os.Process.getStartElapsedRealtime()).put("moduleLoadedElapsed",startedElapsed).put("snapshotAt",System.currentTimeMillis()).put("moduleLoaded",true)
            .put("droppedDetailEvents",dropped.get()).put("shoulderDetailed",shoulder).put("aiDetailed",ai);
        JSONArray targets=new JSONArray();
        for(Map.Entry<String,Counter> entry:counters.entrySet()){
            Counter c=entry.getValue();targets.put(new JSONObject().put("id",entry.getKey()).put("target",c.target).put("registration",c.state)
                .put("callbackCalls",c.hits.get()).put("callbackReturns",c.returned.get()).put("callbackThrows",c.errors.get())
                .put("lastCallbackAt",c.lastHit).put("lastError",c.lastError).put("lastErrorStack",c.lastErrorStack).put("businessResult","UNKNOWN: see feature witnesses; callback return is not functional success"));
        }
        if("com.android.systemui".equals(pkg))out.put("qsClockDebug",ControlCenterHeaderHook.clockDebug);
        out.put("hooks",targets);Bundle extras=new Bundle();extras.putString("snapshot",out.toString());
        JSONArray events=new JSONArray();for(int i=0;i<128;i++){String[] e=trace.poll();if(e==null)break;events.put(new JSONObject().put("feature",e[0]).put("value",e[1]));}
        extras.putString("events",events.toString());pendingEvents=events.length();
        Bundle result=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"telemetry",null,extras);
        if(result==null||!result.getBoolean("ok")){dropped.addAndGet(events.length());publishWarning("provider_rejected",null);}
    }catch(Throwable error){dropped.addAndGet(pendingEvents);publishWarning("publish_failed",error);}}
    private static void publishWarning(String reason,Throwable error){
        if(!BuildConfig.DEBUG||!android.util.Log.isLoggable("LS_Augment",android.util.Log.INFO))return;
        if(publishWarnings.getAndIncrement()>=3)return;
        android.util.Log.w("LS_Augment","TELEMETRY_PUBLISH "+reason+" process="+process+" package="+pkg,error);
    }
    private static final class Counter {
        final String target;final AtomicLong hits=new AtomicLong(),returned=new AtomicLong(),errors=new AtomicLong();
        volatile long lastHit;volatile String state="PENDING",lastError="",lastErrorStack="";
        Counter(String target){this.target=target;}
    }
}
