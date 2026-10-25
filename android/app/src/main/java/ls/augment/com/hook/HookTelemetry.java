package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.*;
import io.github.libxposed.api.XposedInterface.*;
import java.lang.reflect.Executable;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import org.json.*;
import ls.augment.com.BuildConfig;
import ls.augment.com.ShoulderSwitchLogPolicy;
import ls.augment.com.AtomicWorkbenchLogPolicy;
import ls.augment.com.hook.HookTelemetryObserver.Counter;
import ls.augment.com.hook.HookTelemetryObserver.ErrorRecord;
import ls.augment.com.hook.HookTelemetryObserver.Failures;

/** Counters never decide hook behavior; bounded export work runs off the hooked thread. */
final class HookTelemetry {
    private static final ConcurrentHashMap<String,Counter> counters=new ConcurrentHashMap<>();
    private static final ArrayBlockingQueue<String[]> trace=new ArrayBlockingQueue<>(256);
    private static final int BATCH_LIMIT=128;
    private static final int GRID_RUNTIME_MAX_BYTES=16384,SNAPSHOT_MAX_CHARS=256*1024;
    // Provider startup commonly takes longer than three attempts. Keep the bounded
    // batch until its time window ends; attempt count alone must not discard it.
    private static final long RETRY_DELAY_MS=3000,MAX_RETRY_DELAY_MS=15000,BATCH_MAX_AGE_MS=300000;
    private static final String deliverySession=UUID.randomUUID().toString();
    // Only the single writer touches the in-flight batch. Producers remain bounded at 256.
    private static List<String[]> pendingBatch=Collections.emptyList();
    private static String pendingBatchId="",pendingPayload="";
    private static long batchSequence,pendingBatchStarted,retriedBatches,exhaustedBatches,expiredBatches,terminalBatches;
    private static volatile long pendingRetryAt;
    private static boolean configListening;
    private static final Runnable configChanged=()->requestPublish(1000);
    private static int pendingBatchAttempts;
    private static final AtomicLong dropped=new AtomicLong(),sequence=new AtomicLong();
    private static final AtomicLong workbenchSequence=new AtomicLong(),workbenchDropped=new AtomicLong();
    private static final Object workbenchEmitLock=new Object();
    private static final ConcurrentHashMap<String,AtomicLong> dropReasons=new ConcurrentHashMap<>();
    private static volatile long lastDropAt,lastPublishAttemptAt,lastPublishAcceptedAt,lastPublishFailureAt;
    private static volatile String lastDropReason="",lastPublishFailureReason="",currentPublishFailureReason="",lastPublishFailureType="";
    private static volatile String lastPublishFailureDetail="";
    private static volatile String lastPublishFailurePhase="",lastPublishFailureCause="",lastPublishFailureTrace="";
    private static volatile String lastPublishProviderStage="";
    private static volatile String firstPublishFailureType="",firstPublishFailurePhase="",firstPublishFailureCause="",firstPublishFailureTrace="";
    private static String independentFailure="";
    private static boolean contextWaitRecorded;
    private static volatile long firstPublishFailureAt;
    private static volatile long lastPublishRecoveredAt;
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
    // Keep the existing 60-second freshness contract. Only this low-frequency
    // liveness heartbeat remains when optional traces and event delivery are idle.
    private static final long HEARTBEAT_MS=45000;
    private static final Object SCHEDULE_LOCK=new Object();
    private static ScheduledFuture<?> scheduled;
    private static long scheduledAt;
    static { requestPublish(1000); }
    private static void requestPublish(long delay){
        synchronized(SCHEDULE_LOCK){
            delay=Math.max(delay,pendingRetryAt-SystemClock.elapsedRealtime());
            long at=SystemClock.elapsedRealtime()+Math.max(0,delay);
            if(scheduled!=null&&!scheduled.isDone()&&scheduledAt<=at)return;
            if(scheduled!=null)scheduled.cancel(false);
            scheduledAt=at;
            try{scheduled=worker.schedule(HookTelemetry::scheduledPublish,Math.max(0,delay),TimeUnit.MILLISECONDS);}
            catch(RejectedExecutionException stopped){scheduled=null;}
        }
    }
    private static void scheduledPublish(){
        synchronized(SCHEDULE_LOCK){scheduled=null;}
        try{publish();}finally{requestPublish(nextPublishDelay());}
    }
    private static long nextPublishDelay(){
        if(!pendingBatch.isEmpty())return Math.max(1000,pendingRetryAt-SystemClock.elapsedRealtime());
        return shoulder||ai||!trace.isEmpty()?3000:HEARTBEAT_MS;
    }
    static void loaded(String name,String engine){process=name;framework=engine;requestPublish(1000);}
    static int registrationCount(){int count=0;for(Counter counter:counters.values())if("REGISTERED".equals(counter.state))count++;return count;}
    static void ready(String name){
        String target="system".equals(process)?"system":name;
        if(!ls.augment.com.HookTargetRegistry.contains(target))return;
        packages.add(target);
        // Shared OEM processes can ready several scoped packages. Keep the
        // process's own package as the legacy label and retain every target.
        if("unknown".equals(pkg)||target.equals(process)||"system".equals(target))pkg=target;
        requestPublish(1000);
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
        requestPublish(1000);
    }
    /** LiftArc runtime records are always collected, independent of optional detailed traces. */
    static void liftArc(String level,String value){
        if(!"INFO".equals(level)&&!"WARN".equals(level)&&!"ERROR".equals(level))return;
        String text="seq="+sequence.incrementAndGet()+" wall="+System.currentTimeMillis()+" elapsed="+SystemClock.elapsedRealtime()+" thread="+Thread.currentThread().getName()+" "+value;
        if(text.length()>1900)text=text.substring(0,1900)+" [TRUNCATED]";
        if(!trace.offer(new String[]{"LIFTARC",text,level}))recordDrop("queue_full",1);
        requestPublish(1000);
    }
    /** Switch state/failure witnesses persist even with optional shoulder detail off. */
    static void shoulderSwitch(String level,String value){
        if(!ShoulderSwitchLogPolicy.level(level))return;
        String safe=ShoulderSwitchLogPolicy.safeSwitch(value);if(safe.isEmpty())return;
        String text="seq="+sequence.incrementAndGet()+" wall="+System.currentTimeMillis()+" elapsed="+SystemClock.elapsedRealtime()+" thread="+Thread.currentThread().getName()+" "+safe;
        if(!trace.offer(new String[]{ShoulderSwitchLogPolicy.FEATURE,text,level}))recordDrop("queue_full",1);
        requestPublish(1000);
    }
    /** Bounded metadata only; no provider, file or logcat work occurs on the hooked thread. */
    static void atomicWorkbench(String level,String value,Throwable error){
        try{
            if(!AtomicWorkbenchLogPolicy.level(level)||!AtomicWorkbenchLogPolicy.accepts(value))return;
            String safe=AtomicWorkbenchLogPolicy.safe(value),type=AtomicWorkbenchLogPolicy.errorType(error),stack=AtomicWorkbenchLogPolicy.stack(error);
            synchronized(workbenchEmitLock){
                String text="seq="+workbenchSequence.incrementAndGet()+" wall="+System.currentTimeMillis()+" elapsed="+SystemClock.elapsedRealtime()
                        +" session="+deliverySession+" dropped="+workbenchDropped.get()+" "+safe;
                if(!trace.offer(new String[]{AtomicWorkbenchLogPolicy.FEATURE,text,level,type,stack})){
                    workbenchDropped.incrementAndGet();recordDrop("queue_full",1);
                }
            }
        }catch(Throwable ignored){workbenchDropped.incrementAndGet();}
        requestPublish(1000);
    }
    private static boolean hasRuntimeEvents(){
        for(String[] event:trace)if(event.length>2&&(ShoulderSwitchLogPolicy.runtime(event[0],event[2])
                ||AtomicWorkbenchLogPolicy.runtime(event[0],event[2])))return true;
        return false;
    }
    static void event(String message){
        String upper=message.toUpperCase(Locale.ROOT);
        if(upper.contains("TGK")||upper.contains("SHOULDER")||upper.contains("RAPID"))detail("SHOULDER",message);
        else if(upper.contains("AI_")||upper.contains("AI."))detail("AI",message);
    }
    private static void publish(){String phase="context";try{
        long now=SystemClock.elapsedRealtime();
        if(!pendingBatch.isEmpty()&&now-pendingBatchStarted>=BATCH_MAX_AGE_MS){
            recordDrop("retry_expired",pendingBatch.size());expiredBatches++;clearBatch();
        }
        Context context=FeatureSettings.from(null);if(context==null){
            if(!contextWaitRecorded){contextWaitRecorded=true;startup("TELEMETRY_WAITING_CONTEXT","",null);}
            return;
        }
        if(contextWaitRecorded){contextWaitRecorded=false;startup("TELEMETRY_CONTEXT_READY","",null);}
        if(!configListening)configListening=FeatureSettings.addSnapshotListener(context,configChanged);
        phase="config_flags";
        shoulder=FeatureSettings.enabled(context,FeatureSettings.SHOULDER_DIAGNOSTICS);
        ai=FeatureSettings.enabled(context,FeatureSettings.AI_TRIGGER_DIAGNOSTICS);
        if(!pendingBatch.isEmpty()&&now<pendingRetryAt)return;
        if(lastPublished>0&&pendingBatch.isEmpty()&&!shoulder&&!ai&&!hasRuntimeEvents()&&now-lastPublished<15000)return;
        lastPublished=now;lastPublishAttemptAt=System.currentTimeMillis();
        if(pendingBatch.isEmpty()){
            pendingPayload="";pendingBatchId="";pendingBatchAttempts=0;
            pendingBatch=new ArrayList<>(BATCH_LIMIT);trace.drainTo(pendingBatch,BATCH_LIMIT);
            if(!pendingBatch.isEmpty()){
                pendingBatchId=deliverySession+":"+(++batchSequence);pendingBatchStarted=now;
            }
        }
        if(!pendingBatch.isEmpty()&&++pendingBatchAttempts==2)retriedBatches++;
        phase="snapshot_encode";
        JSONObject out=new JSONObject().put("package",pkg).put("packages",packageNames()).put("process",process).put("pid",android.os.Process.myPid())
            .put("diagnosticWriterState",FeatureSettings.diagnosticWriterState())
            .put("moduleVersion",BuildConfig.VERSION_NAME).put("framework",framework).put("moduleLoadedAt",startedWall)
            .put("processStartedElapsed",android.os.Process.getStartElapsedRealtime()).put("moduleLoadedElapsed",startedElapsed).put("snapshotAt",System.currentTimeMillis()).put("moduleLoaded",true)
            .put("droppedDetailEvents",dropped.get()).put("shoulderDetailed",shoulder).put("aiDetailed",ai)
            .put("atomicWorkbenchDroppedEvents",workbenchDropped.get())
            .put("detailDelivery",deliveryJson())
            .put("liftArcSuppressedEvents",LiftArcLog.suppressedEvents());
        attachLauncherGrid(out);
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
        Bundle extras=new Bundle();extras.putString("snapshot",boundedSnapshot(out,targets));
        phase="event_encode";
        if(pendingPayload.isEmpty()){
            JSONArray events=new JSONArray();for(String[] e:pendingBatch){
                JSONObject event=new JSONObject().put("feature",e[0]).put("value",e[1]);
                if(e.length>2)event.put("level",e[2]);
                if(e.length>4&&AtomicWorkbenchLogPolicy.FEATURE.equals(e[0]))
                    event.put("errorType",e[3]).put("errorStack",e[4]);
                events.put(event);
            }
            pendingPayload=events.toString();
            // Native log forwarding is best effort and happens once, never once per retry.
            for(String[] e:pendingBatch)if(e.length>2)try{
                android.util.Log.println("ERROR".equals(e[2])?android.util.Log.ERROR:"WARN".equals(e[2])?android.util.Log.WARN:android.util.Log.INFO,
                        "LS_Augment",e[0]+" "+e[2]+" "+e[1]);
            }catch(Throwable ignored){}
        }
        extras.putString("events",pendingPayload);extras.putString("eventBatchId",pendingBatchId);
        phase="provider_call";
        Bundle result=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"telemetry",null,extras);
        phase="provider_reply";
        if(result==null||!result.getBoolean("ok")){
            lastPublishProviderStage=result==null?"":providerStage(result);
            boolean retryable=result==null||result.getBoolean("retryable",true);
            String detail=result==null?"NO_REPLY":providerFailureDetail(result,retryable);
            publishFailure(retryable?"provider_rejected":"provider_terminal",null,
                    result==null?"NO_REPLY":providerFailureType(result),retryable,detail,phase);
        }
        else {
            lastPublishAcceptedAt=System.currentTimeMillis();
            if(!independentFailure.isEmpty()){
                startup("TELEMETRY_DELIVERY_RECOVERED","previous="+independentFailure,null);independentFailure="";
            }
            if(!currentPublishFailureReason.isEmpty())lastPublishRecoveredAt=lastPublishAcceptedAt;
            currentPublishFailureReason="";clearBatch();
        }
    }catch(Throwable error){publishFailure("publish_failed",error,"",true,"",phase);}}
    /** Keep each process's layout result when a later launcher replaces the global latest value. */
    private static void attachLauncherGrid(JSONObject snapshot)throws JSONException{
        String raw=FeatureSettings.launcherGridRuntimeValue();
        if(raw.isEmpty()){snapshot.put("launcherGridRuntimeEvidence","NO_CACHED_OBSERVATION");return;}
        if(raw.length()>GRID_RUNTIME_MAX_BYTES||raw.getBytes(StandardCharsets.UTF_8).length>GRID_RUNTIME_MAX_BYTES){
            snapshot.put("launcherGridRuntimeEvidence","OBSERVATION_SIZE_LIMIT");return;
        }
        try{
            JSONObject runtime=new JSONObject(raw);
            if(runtime.getInt("pid")!=android.os.Process.myPid()){
                snapshot.put("launcherGridRuntimeEvidence","PID_MISMATCH");return;
            }
            snapshot.put("launcherGridRuntime",runtime).put("launcherGridRuntimeEvidence","CURRENT_PROCESS_CACHE");
        }catch(JSONException invalid){snapshot.put("launcherGridRuntimeEvidence","INVALID_JSON_OR_PID");}
    }
    /** Keep the receipt deliverable even when a host registers more hooks than fit in one IPC. */
    private static String boundedSnapshot(JSONObject out,JSONArray targets)throws JSONException{
        out.put("hooks",targets);String full=out.toString();
        if(full.length()>SNAPSHOT_MAX_CHARS&&out.has("launcherGridRuntime")){
            out.remove("launcherGridRuntime");out.put("launcherGridRuntimeEvidence","OMITTED_SNAPSHOT_BUDGET");full=out.toString();
        }
        if(full.length()<=SNAPSHOT_MAX_CHARS)return full;
        // This identical explanation is not per-hook evidence. Keep all actual
        // identities, counters and errors when removing the repetition suffices.
        out.put("businessResult","UNKNOWN: see feature witnesses; callback return is not functional success");
        for(int i=0;i<targets.length();i++)targets.getJSONObject(i).remove("businessResult");
        full=out.toString();if(full.length()<=SNAPSHOT_MAX_CHARS)return full;
        if(out.has("qsClockDebug")){
            out.remove("qsClockDebug");out.put("qsClockDebugEvidence","OMITTED_SNAPSHOT_BUDGET");
        }
        JSONArray included=new JSONArray();out.put("hooks",included);
        JSONObject coverage=new JSONObject().put("total",targets.length()).put("reported",0).put("omitted",targets.length())
                .put("registrationFailures",0).put("moduleCallbackThrows",0L).put("proceedChainThrows",0L)
                .put("meaning","Partial hook details; totals cover all hooks; missing details do not prove success");
        List<JSONObject> ordered=new ArrayList<>(targets.length());
        int registrations=0;long moduleErrors=0,proceedErrors=0;
        for(int i=0;i<targets.length();i++){
            JSONObject hook=targets.getJSONObject(i);ordered.add(hook);
            if("REGISTRATION_FAILED".equals(hook.optString("registration")))registrations++;
            moduleErrors+=hook.optLong("moduleCallbackThrows");proceedErrors+=hook.optLong("proceedChainThrows");
        }
        coverage.put("registrationFailures",registrations).put("moduleCallbackThrows",moduleErrors).put("proceedChainThrows",proceedErrors);
        out.put("hookCoverage",coverage);
        // Prefer failures, then recent activity. Stable identities break ties;
        // selection never changes the observed callbacks or their counters.
        ordered.sort(Comparator.<JSONObject>comparingInt(h->h.has("registrationError")||h.optLong("callbackThrows")>0?0:1)
                .thenComparing(Comparator.comparingLong((JSONObject h)->h.optLong("lastCallbackAt")).reversed())
                .thenComparing(h->h.optString("id")));
        int remaining=SNAPSHOT_MAX_CHARS-out.toString().length()-64;
        for(JSONObject hook:ordered){
            int size=hook.toString().length()+1;
            if(size>remaining)continue;
            included.put(hook);remaining-=size;
        }
        coverage.put("reported",included.length()).put("omitted",targets.length()-included.length());
        full=out.toString();
        if(full.length()>SNAPSHOT_MAX_CHARS)throw new JSONException("telemetry metadata exceeds snapshot budget");
        return full;
    }
    private static void clearBatch(){
        pendingBatch=Collections.emptyList();pendingBatchId="";pendingPayload="";
        pendingBatchAttempts=0;pendingBatchStarted=0;pendingRetryAt=0;
    }
    private static void recordDrop(String reason,int count){
        if(count<=0)return;
        dropped.addAndGet(count);dropReasons.computeIfAbsent(reason,key->new AtomicLong()).addAndGet(count);
        lastDropAt=System.currentTimeMillis();lastDropReason=reason;
    }
    private static JSONObject deliveryJson()throws JSONException{
        JSONObject reasons=new JSONObject();
        for(String reason:new String[]{"queue_full","provider_rejected","publish_failed","retry_expired","provider_terminal"}){
            AtomicLong count=dropReasons.get(reason);reasons.put(reason,count==null?0:count.get());
        }
        return new JSONObject().put("queueCapacity",256).put("batchLimit",BATCH_LIMIT).put("maxBufferedEvents",256+BATCH_LIMIT)
                .put("pendingEvents",trace.size()+pendingBatch.size()).put("queuedEvents",trace.size()).put("inFlightEvents",pendingBatch.size())
                .put("batchAttempts",pendingBatchAttempts).put("maxBatchAttempts",0).put("retryPolicy","TIME_WINDOW")
                .put("batchMaxAgeMs",BATCH_MAX_AGE_MS).put("maxRetryDelayMs",MAX_RETRY_DELAY_MS)
                .put("batchAgeMs",pendingBatch.isEmpty()?0:Math.max(0,SystemClock.elapsedRealtime()-pendingBatchStarted))
                .put("nextRetryInMs",Math.max(0,pendingRetryAt-SystemClock.elapsedRealtime()))
                .put("retriedBatches",retriedBatches).put("retryExhaustedBatches",exhaustedBatches).put("retryExpiredBatches",expiredBatches)
                .put("terminalRejectedBatches",terminalBatches)
                .put("droppedByReason",reasons).put("lastDropAt",lastDropAt).put("lastDropReason",lastDropReason)
                .put("lastPublishAttemptAt",lastPublishAttemptAt).put("lastPublishAcceptedAt",lastPublishAcceptedAt)
                .put("lastPublishFailureAt",lastPublishFailureAt).put("lastPublishFailureReason",lastPublishFailureReason)
                .put("lastPublishFailureType",lastPublishFailureType).put("currentPublishFailureReason",currentPublishFailureReason)
                .put("lastPublishFailureDetail",lastPublishFailureDetail)
                .put("lastPublishFailurePhase",lastPublishFailurePhase).put("lastPublishFailureCause",lastPublishFailureCause)
                .put("lastPublishFailureTrace",lastPublishFailureTrace)
                .put("lastPublishProviderStage",lastPublishProviderStage)
                .put("firstPublishFailure",new JSONObject().put("at",firstPublishFailureAt).put("type",firstPublishFailureType)
                        .put("phase",firstPublishFailurePhase).put("cause",firstPublishFailureCause).put("trace",firstPublishFailureTrace))
                .put("lastPublishRecoveredAt",lastPublishRecoveredAt)
                .put("meaning","time-bounded retries retain unacknowledged events for five minutes without attempt-count exhaustion; buffers are process-local and may be lost at process exit; dropped counts include abandoned unacknowledged events; duplicate suppression is bounded to the provider process; dropped events do not increment hook exception counters; provider acceptance is not file durability");
    }
    private static void publishFailure(String reason,Throwable error){
        publishFailure(reason,error,"",true,"","unknown");
    }
    private static String providerFailureType(Bundle result){
        String type=result.getString("error","");
        return type.matches("[A-Za-z][A-Za-z0-9_.$]{0,159}")?type:"UNKNOWN_PROVIDER_REJECTION";
    }
    private static String providerFailureDetail(Bundle result,boolean retryable){
        String detail=result.getString("detailFailure","");
        switch(detail){
            case "APPEND_COMMIT_UNKNOWN":case "NULL_EXTRAS":case "RESET_WRITE_FENCE":
            case "SNAPSHOT_TOO_LARGE":case "EVENTS_TOO_LARGE":case "EVENT_COUNT_LIMIT":case "PID_MISMATCH":
            case "INVALID_BATCH_ID":case "BATCH_PAYLOAD_CHANGED":case "MALFORMED_PAYLOAD":case "STORE_FAILURE":return detail;
            default:return retryable?"UNSPECIFIED_REJECTION":"UNSPECIFIED_TERMINAL_REJECTION";
        }
    }
    private static String providerStage(Bundle result){
        String stage=result.getString("providerStage","");
        switch(stage){
            case "request_validate":case "write_fence":
            case "snapshot_decode":case "events_decode":case "batch_identity":case "snapshot_store":
            case "event_decode":case "optional_trace_config":case "detail_append":case "retention_metadata":return stage;
            default:return "";
        }
    }
    private static void publishFailure(String reason,Throwable error,String providerType,boolean retryable,String detail,String phase){
        lastPublishFailureAt=System.currentTimeMillis();lastPublishFailureReason=reason;currentPublishFailureReason=reason;
        lastPublishFailureType=error==null?providerType:error.getClass().getName();
        lastPublishFailureDetail=detail;
        if(error!=null)lastPublishProviderStage="";
        lastPublishFailurePhase=phase;lastPublishFailureCause=transportCause(error,detail);
        lastPublishFailureTrace=transportTrace(error);
        String independentKey=reason+";type="+lastPublishFailureType+";detail="+detail+";phase="+phase+";providerStage="+lastPublishProviderStage;
        if(!independentKey.equals(independentFailure)){
            independentFailure=independentKey;
            startup("TELEMETRY_DELIVERY_FAILED",independentKey+";cause="+lastPublishFailureCause+";retryable="+retryable
                    +";pending="+(trace.size()+pendingBatch.size()),error);
        }
        if(firstPublishFailureAt==0){
            firstPublishFailureType=lastPublishFailureType;firstPublishFailurePhase=phase;
            firstPublishFailureCause=lastPublishFailureCause;firstPublishFailureTrace=lastPublishFailureTrace;
            firstPublishFailureAt=lastPublishFailureAt;
        }
        if(!pendingBatch.isEmpty()){
            if(!retryable){recordDrop(reason,pendingBatch.size());terminalBatches++;clearBatch();}
            else pendingRetryAt=SystemClock.elapsedRealtime()+retryDelay(pendingBatchAttempts);
        }
        publishWarning(reason,error);
    }
    private static void startup(String stage,String detail,Throwable error){
        try{ls.augment.com.StartupDiagnostics.record(stage,detail,error);}catch(Throwable ignored){}
    }
    private static long retryDelay(int attempts){
        // Spread remote processes slightly while bounding both delay and memory.
        long base=Math.min(MAX_RETRY_DELAY_MS,RETRY_DELAY_MS*(1L<<Math.min(3,Math.max(0,attempts-1))));
        return Math.min(MAX_RETRY_DELAY_MS,base+(android.os.Process.myPid()&511));
    }
    /** Cause codes and stack frames deliberately exclude arbitrary exception messages. */
    private static String transportCause(Throwable error,String detail){
        if(error==null)return detail.isEmpty()?"UNKNOWN_PROVIDER_REJECTION":detail;
        try{
            Throwable current=error;
            for(int i=0;current!=null&&i<4;i++){
                String type=current.getClass().getSimpleName();
                if("DeadObjectException".equals(type)||"DeadSystemException".equals(type))return "BINDER_DEAD";
                if("TransactionTooLargeException".equals(type))return "BINDER_PAYLOAD_TOO_LARGE";
                if(current instanceof SecurityException)return "PROVIDER_ACCESS_DENIED";
                String message=current.getMessage();
                if(current instanceof IllegalArgumentException&&message!=null){
                    if(message.length()>2048)message=message.substring(0,2048);
                    String lower=message.toLowerCase(Locale.ROOT);
                    if(lower.contains("unknown authority")||lower.contains("could not find provider")||lower.contains("no content provider"))return "PROVIDER_UNAVAILABLE";
                }
                Throwable next=current.getCause();if(next==current)break;current=next;
            }
        }catch(Throwable ignored){}
        return "UNCLASSIFIED_TRANSPORT_FAILURE";
    }
    private static String transportTrace(Throwable error){
        if(error==null)return "";
        try{
            StringBuilder out=new StringBuilder(512);Throwable current=error;
            for(int c=0;current!=null&&c<4;c++){
                if(c>0)out.append("\nCaused by: ");out.append(current.getClass().getName());
                StackTraceElement[] frames=current.getStackTrace();
                for(int i=0;i<Math.min(12,frames.length)&&out.length()<2048;i++){
                    String frame=String.valueOf(frames[i]);
                    out.append("\n at ").append(frame,0,Math.min(frame.length(),512));
                }
                Throwable next=current.getCause();if(next==current)break;current=next;
            }
            return out.length()>2048?out.substring(0,2048)+" [TRUNCATED]":out.toString();
        }catch(Throwable ignored){return "[CAPTURE_FAILED]";}
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
