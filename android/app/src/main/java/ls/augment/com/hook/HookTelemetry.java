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
import ls.augment.com.hook.HookTelemetryObserver.Counter;
import ls.augment.com.hook.HookTelemetryObserver.ErrorRecord;
import ls.augment.com.hook.HookTelemetryObserver.Failures;

/** Counters never decide hook behavior; bounded export work runs off the hooked thread. */
final class HookTelemetry {
    private static final ConcurrentHashMap<String,Counter> counters=new ConcurrentHashMap<>();
    private static final ArrayBlockingQueue<String[]> trace=new ArrayBlockingQueue<>(256);
    private static final AtomicLong dropped=new AtomicLong(),sequence=new AtomicLong();
    private static final ConcurrentHashMap<String,AtomicLong> dropReasons=new ConcurrentHashMap<>();
    private static volatile long lastDropAt,lastPublishAttemptAt,lastPublishAcceptedAt,lastPublishFailureAt;
    private static volatile String lastDropReason="",lastPublishFailureReason="";
    private static final HookTelemetryObserver.StackBudget errorStacks=new HookTelemetryObserver.StackBudget(8,4096);
    private static final long startedWall=System.currentTimeMillis(),startedElapsed=SystemClock.elapsedRealtime();
    private static volatile String process="unknown",pkg="unknown",framework="unknown";
    private static final Set<String> packages=ConcurrentHashMap.newKeySet();
    private static volatile boolean shoulder,ai;
    private static final HookTelemetryObserver.ErrorRecorder errorRecorder=new HookTelemetryObserver.ErrorRecorder(){
        public HookTelemetryObserver.StackResult capture(Throwable error){return errorStacks.capture(error);}
        public void firstFailure(Counter counter,ErrorRecord error){
            String kind=error.source==HookTelemetryObserver.ErrorSource.PROCEED_CHAIN?"HOOK_PROCEED_CHAIN_FAILURE":"HOOK_MODULE_CALLBACK_FAILURE";
            android.util.Log.e("LS_Augment",kind+" process="+process+" target="+counter.target+" at="+error.at
                +" error="+error.summary+" stackState="+error.stackState+(error.stack.isEmpty()?"":"\n"+error.stack));
        }
    };
    private static long lastPublished;
    private static final AtomicInteger publishWarnings=new AtomicInteger();
    private static final ScheduledExecutorService worker=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"LSA-DiagnosticWriter");t.setDaemon(true);return t;});
    static { worker.scheduleWithFixedDelay(HookTelemetry::publish,1,3,TimeUnit.SECONDS); }
    static void loaded(String name,String engine){process=name;framework=engine;}
    static void ready(String name){
        String target="system".equals(process)?"system":name;
        if(!ls.augment.com.HookTargetRegistry.contains(target))return;
        packages.add(target);
        // Shared OEM processes can ready several scoped packages. Keep the
        // process's own package as the legacy label and retain every target.
        if("unknown".equals(pkg)||target.equals(process)||"system".equals(target))pkg=target;
    }
    private static JSONArray packageNames(){return new JSONArray(new TreeSet<>(packages));}
    static HookBuilder observe(HookBuilder delegate,Executable target){return new HookBuilder(){
        String id=target.toGenericString();
        public HookBuilder setPriority(int p){delegate.setPriority(p);return this;}
        public HookBuilder setExceptionMode(ExceptionMode mode){delegate.setExceptionMode(mode);return this;}
        public HookBuilder setId(String value){id=value;delegate.setId(value);return this;}
        public HookHandle intercept(Hooker hooker){
            Counter counter=new Counter(target.toGenericString());counters.put(id,counter);
            try{HookHandle handle=delegate.intercept(HookTelemetryObserver.observe(hooker,counter,System::currentTimeMillis,errorRecorder));
                counter.state="REGISTERED";return handle;}
            catch(Throwable error){counter.registrationFailed(error,System.currentTimeMillis(),errorRecorder);if(error instanceof Error)throw (Error)error;throw new IllegalStateException(error);}
        }
    };}
    static void detail(String feature,String value){
        if((feature.equals("AI")&&!ai)||(feature.equals("SHOULDER")&&!shoulder))return;
        String text="seq="+sequence.incrementAndGet()+" wall="+System.currentTimeMillis()+" elapsed="+SystemClock.elapsedRealtime()+" thread="+Thread.currentThread().getName()+" "+value;
        if(text.length()>1900)text=text.substring(0,1900)+" [TRUNCATED]";
        if(!trace.offer(new String[]{feature,text}))recordDrop("queue_full",1);
    }
    /** LiftArc runtime records are always collected, independent of optional detailed traces. */
    static void liftArc(String level,String value){
        if(!"INFO".equals(level)&&!"WARN".equals(level)&&!"ERROR".equals(level))return;
        String text="seq="+sequence.incrementAndGet()+" wall="+System.currentTimeMillis()+" elapsed="+SystemClock.elapsedRealtime()+" thread="+Thread.currentThread().getName()+" "+value;
        if(text.length()>1900)text=text.substring(0,1900)+" [TRUNCATED]";
        if(!trace.offer(new String[]{"LIFTARC",text,level}))recordDrop("queue_full",1);
    }
    private static boolean hasLiftArcEvents(){
        for(String[] event:trace)if("LIFTARC".equals(event[0]))return true;
        return false;
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
        long now=SystemClock.elapsedRealtime();if(!shoulder&&!ai&&!hasLiftArcEvents()&&now-lastPublished<15000)return;lastPublished=now;lastPublishAttemptAt=System.currentTimeMillis();
        JSONObject out=new JSONObject().put("package",pkg).put("packages",packageNames()).put("process",process).put("pid",android.os.Process.myPid())
            .put("moduleVersion",BuildConfig.VERSION_NAME).put("framework",framework).put("moduleLoadedAt",startedWall)
            .put("processStartedElapsed",android.os.Process.getStartElapsedRealtime()).put("moduleLoadedElapsed",startedElapsed).put("snapshotAt",System.currentTimeMillis()).put("moduleLoaded",true)
            .put("droppedDetailEvents",dropped.get()).put("shoulderDetailed",shoulder).put("aiDetailed",ai)
            .put("detailDelivery",deliveryJson())
            .put("liftArcSuppressedEvents",LiftArcLog.suppressedEvents());
        JSONArray targets=new JSONArray();
        for(Map.Entry<String,Counter> entry:counters.entrySet()){
            Counter c=entry.getValue();Failures errors=c.failures();ErrorRecord registrationError=c.registrationError();
            ErrorRecord last=errors.last==null?registrationError:errors.last;
            JSONObject target=new JSONObject().put("id",entry.getKey()).put("target",c.target).put("registration",c.state)
                .put("callbackCalls",c.hits.get()).put("callbackReturns",c.returned.get()).put("callbackThrows",errors.total)
                .put("moduleCallbackThrows",errors.module).put("proceedChainThrows",errors.proceed)
                .put("lastCallbackAt",c.lastHit).put("lastErrorAt",last==null?0:last.at)
                .put("lastError",last==null?"":last.summary).put("lastErrorStack",last==null?"":last.stack)
                .put("lastErrorSource",last==null?"":last.source.name()).put("lastErrorStackState",last==null?"NONE":last.stackState)
                .put("businessResult","UNKNOWN: see feature witnesses; callback return is not functional success");
            if(errors.first!=null)target.put("firstCallbackError",errorJson(errors.first));
            if(errors.last!=null)target.put("lastCallbackError",errorJson(errors.last));
            if(registrationError!=null)target.put("registrationError",errorJson(registrationError));
            targets.put(target);
        }
        if("com.android.systemui".equals(pkg))out.put("qsClockDebug",ControlCenterHeaderHook.clockDebug);
        out.put("hooks",targets);Bundle extras=new Bundle();extras.putString("snapshot",out.toString());
        JSONArray events=new JSONArray();for(int i=0;i<128;i++){String[] e=trace.poll();if(e==null)break;pendingEvents++;
            JSONObject event=new JSONObject().put("feature",e[0]).put("value",e[1]);
            if(e.length>2){
                event.put("level",e[2]);
                android.util.Log.println("ERROR".equals(e[2])?android.util.Log.ERROR:"WARN".equals(e[2])?android.util.Log.WARN:android.util.Log.INFO,
                        "LS_Augment","LIFTARC "+e[2]+" "+e[1]);
            }
            events.put(event);
        }
        extras.putString("events",events.toString());pendingEvents=events.length();
        Bundle result=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"telemetry",null,extras);
        if(result==null||!result.getBoolean("ok")){recordDrop("provider_rejected",events.length());publishFailure("provider_rejected",null);}
        else {lastPublishAcceptedAt=System.currentTimeMillis();lastPublishFailureReason="";}
    }catch(Throwable error){recordDrop("publish_failed",pendingEvents);publishFailure("publish_failed",error);}}
    private static void recordDrop(String reason,int count){
        if(count<=0)return;
        dropped.addAndGet(count);dropReasons.computeIfAbsent(reason,key->new AtomicLong()).addAndGet(count);
        lastDropAt=System.currentTimeMillis();lastDropReason=reason;
    }
    private static JSONObject deliveryJson()throws JSONException{
        JSONObject reasons=new JSONObject();
        for(String reason:new String[]{"queue_full","provider_rejected","publish_failed"}){
            AtomicLong count=dropReasons.get(reason);reasons.put(reason,count==null?0:count.get());
        }
        return new JSONObject().put("queueCapacity",256).put("batchLimit",128).put("pendingEvents",trace.size())
                .put("droppedByReason",reasons).put("lastDropAt",lastDropAt).put("lastDropReason",lastDropReason)
                .put("lastPublishAttemptAt",lastPublishAttemptAt).put("lastPublishAcceptedAt",lastPublishAcceptedAt)
                .put("lastPublishFailureAt",lastPublishFailureAt).put("lastPublishFailureReason",lastPublishFailureReason)
                .put("meaning","bounded detail delivery; dropped events do not increment hook exception counters; provider acceptance is not file durability");
    }
    private static void publishFailure(String reason,Throwable error){
        lastPublishFailureAt=System.currentTimeMillis();lastPublishFailureReason=reason;publishWarning(reason,error);
    }
    private static void publishWarning(String reason,Throwable error){
        if(!BuildConfig.DEBUG||!android.util.Log.isLoggable("LS_Augment",android.util.Log.INFO))return;
        if(publishWarnings.getAndIncrement()>=3)return;
        android.util.Log.w("LS_Augment","TELEMETRY_PUBLISH "+reason+" process="+process+" package="+pkg,error);
    }
    private static JSONObject errorJson(ErrorRecord error)throws JSONException{
        return new JSONObject().put("source",error.source.name()).put("at",error.at).put("sequence",error.sequence)
            .put("error",error.summary).put("stack",error.stack).put("stackState",error.stackState);
    }
}
