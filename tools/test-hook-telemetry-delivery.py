"""Execute the actual HookTelemetry queue and publish path; no phone or provider calls."""
from pathlib import Path
import argparse
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--java-home', type=Path, default=Path('C:/Program Files/Android/openjdk/jdk-21.0.8'))
parser.add_argument('--json-jar', type=Path, required=True)
parser.add_argument('--api-jar', type=Path, default=ROOT/'audit-output/volume-percent-review/libxposed-api.jar')
args = parser.parse_args()


def member(source, signature):
    start = source.index(signature)
    brace = source.index('{', start)
    end, depth = brace + 1, 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

STUBS = {
    'ls/augment/com/StartupDiagnostics.java': '''package ls.augment.com;public final class StartupDiagnostics{public static final java.util.List<String> events=new java.util.ArrayList<>();public static void record(String s,String d,Throwable e){events.add(s+":"+d);}}''',
    'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle{final Map<String,Object> data=new HashMap<>();public void putString(String k,String v){data.put(k,v);}public String getString(String k){return (String)data.get(k);}public String getString(String k,String d){return (String)data.getOrDefault(k,d);}public void putLong(String k,long v){data.put(k,v);}public long getLong(String k,long d){return ((Number)data.getOrDefault(k,d)).longValue();}public long getLong(String k){return getLong(k,0);}public void putBoolean(String k,boolean v){data.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(data.get(k));}public boolean getBoolean(String k,boolean d){return (Boolean)data.getOrDefault(k,d);}}''',
    'android/os/SystemClock.java': '''package android.os;public class SystemClock{public static long now=100000;public static long elapsedRealtime(){return now;}}''',
    'android/os/Process.java': '''package android.os;public class Process{public static int myPid(){return 4595;}public static long getStartElapsedRealtime(){return 10;}}''',
    'android/net/Uri.java': '''package android.net;public class Uri{public static Uri parse(String s){return new Uri();}}''',
    'android/content/Context.java': '''package android.content;public class Context{public final ContentResolver resolver=new ContentResolver();public ContentResolver getContentResolver(){return resolver;}}''',
    'android/content/ContentResolver.java': '''package android.content;import android.os.Bundle;import android.net.Uri;import java.util.*;public class ContentResolver{public long historyCutoff;public boolean accept=true,fail,nullReply,retryable=true;public String error="",detailFailure="",providerStage="";public RuntimeException thrown;public final List<Bundle> calls=new ArrayList<>();public Bundle call(Uri uri,String method,String arg,Bundle extras){calls.add(extras);if(thrown!=null)throw thrown;if(fail)throw new IllegalStateException("fixture provider unavailable account=private-secret");if(nullReply)return null;Bundle reply=new Bundle();reply.putLong("historyCutoff",historyCutoff);reply.putBoolean("ok",accept);reply.putBoolean("retryable",retryable);reply.putString("error",error);reply.putString("detailFailure",detailFailure);reply.putString("providerStage",providerStage);return reply;}}''',
    'android/util/Log.java': '''package android.util;public class Log{public static final int ERROR=6,WARN=5,INFO=4;public static int printed;public static boolean throwPrint;public static int e(String t,String s){return 0;}public static int w(String t,String s,Throwable e){return 0;}public static int println(int p,String t,String s){if(throwPrint)throw new IllegalStateException("fixture log transport");printed++;return 0;}public static boolean isLoggable(String t,int p){return false;}}''',
    'ls/augment/com/BuildConfig.java': '''package ls.augment.com;public class BuildConfig{public static final String VERSION_NAME="test-current";public static final boolean DEBUG=false;}''',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import android.content.Context;final class FeatureSettings{static boolean addSnapshotListener(android.content.Context c,Runnable r){return true;}static Context context;private static final java.util.concurrent.ConcurrentHashMap<String,String> DIAGNOSTIC_VALUES=new java.util.concurrent.ConcurrentHashMap<>();static void cacheGrid(String value){DIAGNOSTIC_VALUES.put("ls_augment_launcher_grid_runtime",value);}static final String SHOULDER_DIAGNOSTICS="shoulder",AI_TRIGGER_DIAGNOSTICS="ai";static Context from(Object o){return context;}static boolean enabled(Context c,String k){return false;}static String diagnosticWriterState(){return "pending=1;expired=0";}__GRID_MEMORY_GETTER__}''',
    'ls/augment/com/hook/LiftArcLog.java': '''package ls.augment.com.hook;final class LiftArcLog{static long suppressedEvents(){return 0;}}''',
    'ls/augment/com/hook/ControlCenterHeaderHook.java': '''package ls.augment.com.hook;final class ControlCenterHeaderHook{static String clockDebug="fixture";}''',
}

TEST = r'''
package ls.augment.com.hook;
import android.content.*;import android.os.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;import org.json.*;
public final class TestHookTelemetryDelivery{
 static int checks;static void yes(boolean result,String message){checks++;if(!result)throw new AssertionError(message);}
 static Object field(String name)throws Exception{Field f=HookTelemetry.class.getDeclaredField(name);f.setAccessible(true);return f.get(null);}
 static void publishAfter(long delay)throws Exception{android.os.SystemClock.now+=delay;Method m=HookTelemetry.class.getDeclaredMethod("publish");m.setAccessible(true);m.invoke(null);}
 static void publish()throws Exception{publishAfter(15001);}
 static void retry()throws Exception{android.os.SystemClock.now=Math.max(android.os.SystemClock.now,((Long)field("pendingRetryAt"))+1);publishAfter(0);}
 static int inFlight()throws Exception{return ((List<?>)field("pendingBatch")).size();}
 static String batchId(ContentResolver resolver){return resolver.calls.get(resolver.calls.size()-1).getString("eventBatchId");}
 static String payload(ContentResolver resolver){return resolver.calls.get(resolver.calls.size()-1).getString("events");}
 static JSONObject snapshot(ContentResolver resolver)throws Exception{return new JSONObject(resolver.calls.get(resolver.calls.size()-1).getString("snapshot"));}
 static JSONArray events(ContentResolver resolver)throws Exception{return new JSONArray(resolver.calls.get(resolver.calls.size()-1).getString("events"));}
 static JSONObject delivery(ContentResolver resolver)throws Exception{return snapshot(resolver).getJSONObject("detailDelivery");}
 static long dropped()throws Exception{return ((AtomicLong)field("dropped")).get();}
 public static void main(String[] args)throws Exception{
  ((ScheduledExecutorService)field("worker")).shutdownNow();
  Method delayMethod=HookTelemetry.class.getDeclaredMethod("nextPublishDelay");delayMethod.setAccessible(true);
  yes(((Long)delayMethod.invoke(null))==45000,"idle writer uses one low-frequency liveness heartbeat, within 60-second freshness");
  android.os.SystemClock.now=1000;FeatureSettings.context=new Context();publishAfter(0);
  yes(FeatureSettings.context.getContentResolver().calls.size()==1,"first boot receipt is not postponed by idle throttling");
  FeatureSettings.context=null;android.os.SystemClock.now=100000;

  @SuppressWarnings("unchecked") ArrayBlockingQueue<String[]> queue=(ArrayBlockingQueue<String[]>)field("trace");
  HookTelemetry.loaded("com.android.systemui","API102");HookTelemetry.ready("com.android.systemui");
  HookTelemetry.liftArc("INFO","before context");publish();yes(queue.size()==1&&dropped()==0,"unavailable context retains queued detail, not counted as hook failure");
  yes(ls.augment.com.StartupDiagnostics.events.stream().anyMatch(s->s.startsWith("TELEMETRY_WAITING_CONTEXT:")),"context wait is independently logged without a process snapshot");
  Context context=new Context();FeatureSettings.context=context;ContentResolver resolver=context.resolver;
  resolver.accept=false;publish();yes(queue.isEmpty()&&inFlight()==1&&dropped()==0,"transient rejection retains the batch without claiming loss");
  yes(new JSONObject(resolver.calls.get(resolver.calls.size()-1).getString("snapshot")).getString("diagnosticWriterState").equals("pending=1;expired=0"),"last-value writer delivery state is part of the process snapshot without recursive diagnostics");
  yes(snapshot(resolver).getString("launcherGridRuntimeEvidence").equals("NO_CACHED_OBSERVATION")&&!snapshot(resolver).has("launcherGridRuntime"),"empty process cache explicitly lacks a grid observation");
  yes(field("lastPublishFailureType").equals("UNKNOWN_PROVIDER_REJECTION"),"rejection without a cause remains explicitly unknown");
  yes(ls.augment.com.StartupDiagnostics.events.stream().anyMatch(s->s.startsWith("TELEMETRY_DELIVERY_FAILED:")&&s.contains("phase=provider_reply")),"release provider rejection retains its independent delivery phase");
  String originalPayload=payload(resolver),originalId=batchId(resolver);int calls=resolver.calls.size(),printed=android.util.Log.printed;
  HookTelemetry.liftArc("INFO","arrived after first attempt");publishAfter(0);yes(resolver.calls.size()==calls,"runtime events cannot bypass the retry delay");
  resolver.accept=true;retry();JSONObject state=delivery(resolver);
  yes(payload(resolver).equals(originalPayload)&&batchId(resolver).equals(originalId)&&!originalId.isEmpty(),"retry uses the identical payload and batch identity");
  yes(inFlight()==0&&queue.size()==1&&android.util.Log.printed==printed,"accepted retry clears only its own batch and does not duplicate native logs");
  yes(state.getString("lastPublishFailureReason").equals("provider_rejected"),"previous failed publication is explicit");
  publish();state=delivery(resolver);
  yes(events(resolver).length()==1&&!batchId(resolver).equals(originalId),"new events get a new batch rather than being swallowed by retry deduplication");
  yes(state.getLong("lastPublishAcceptedAt")>0&&state.getString("currentPublishFailureReason").isEmpty()
    &&state.getString("lastPublishFailureReason").equals("provider_rejected")&&state.getLong("lastPublishRecoveredAt")>0,"recovery clears current failure but preserves historical reason and recovery time");
  for(int i=0;i<257;i++)HookTelemetry.liftArc("INFO","capacity "+i);
  yes(queue.size()==256&&dropped()==1,"original queue capacity remains bounded");
  publish();JSONArray first=events(resolver);yes(first.length()==128&&queue.size()==128,"original batch size remains bounded");
  state=delivery(resolver);yes(state.getJSONObject("droppedByReason").getLong("queue_full")==1,"queue saturation is distinct from provider failures");
  publish();JSONArray second=events(resolver);Set<String> values=new HashSet<>();for(int i=0;i<first.length();i++)values.add(first.getJSONObject(i).getString("value"));for(int i=0;i<second.length();i++)values.add(second.getJSONObject(i).getString("value"));
  yes(second.length()==128&&queue.isEmpty()&&values.size()==256,"accepted events drain once without duplicated replay");
  HookTelemetry.detail("AI","disabled private detail");HookTelemetry.detail("SHOULDER","disabled private detail");HookTelemetry.liftArc("OTHER","invalid level");yes(queue.isEmpty(),"disabled optional detail and invalid levels remain excluded");
  HookTelemetry.liftArc("WARN","x".repeat(3000));yes(queue.peek()[1].length()<2000&&queue.peek()[1].endsWith(" [TRUNCATED]"),"individual events remain bounded and marked");
  HookTelemetryObserver.Counter counter=new HookTelemetryObserver.Counter("test hook");
  @SuppressWarnings("unchecked") Map<String,HookTelemetryObserver.Counter> counters=(Map<String,HookTelemetryObserver.Counter>)field("counters");counters.put("test",counter);
  long before=dropped();resolver.fail=true;publish();yes(dropped()==before&&inFlight()==1&&counter.failures().total==0&&counter.hits.get()==0,"transport failure retains detail without changing functional counters");
  retry();yes(dropped()==before&&inFlight()==1,"second attempt remains bounded and pending");
  retry();yes(dropped()==before&&inFlight()==1,"third failed attempt retains the unacknowledged batch");
  retry();yes(dropped()==before&&inFlight()==1,"failure lasting beyond fifteen seconds is retained for recovery");
  yes(field("lastPublishFailurePhase").equals("provider_call")&&field("lastPublishFailureCause").equals("UNCLASSIFIED_TRANSPORT_FAILURE"),"failure phase distinguishes transport from snapshot or event encoding");
  yes(((String)field("lastPublishFailureTrace")).contains("ContentResolver.call")&&!((String)field("lastPublishFailureTrace")).contains("private-secret"),"bounded transport frames identify the origin without exception message contents");
  resolver.fail=false;retry();yes(inFlight()==0&&dropped()==before,"delayed recovery delivers the same retained event without early loss");publish();state=delivery(resolver);
  yes(state.getJSONObject("droppedByReason").getLong("publish_failed")==0&&state.getLong("retryExhaustedBatches")==0,"transient failures no longer exhaust attempts and fabricate avoidable losses");
  yes(state.getString("lastPublishFailureType").equals("java.lang.IllegalStateException"),"transport exception type survives into accepted snapshots");
  JSONObject grid=new JSONObject().put("pid",android.os.Process.myPid()).put("enabled",true).put("state","active")
    .put("requestedRows",7).put("requestedColumns",4).put("effectiveRows",7).put("effectiveColumns",4).put("events",new JSONArray().put("CONFIG_RECEIVED").put("BOUND"));
  FeatureSettings.cacheGrid(grid.toString());publish();JSONObject enabledSnapshot=snapshot(resolver);
  yes(enabledSnapshot.getString("launcherGridRuntimeEvidence").equals("CURRENT_PROCESS_CACHE")&&enabledSnapshot.getJSONObject("launcherGridRuntime").getInt("effectiveRows")==7
    &&enabledSnapshot.getJSONObject("launcherGridRuntime").getJSONArray("events").length()==2,"actual publish embeds the cached current-process layout decision and effective geometry");
  FeatureSettings.cacheGrid(new JSONObject().put("pid",android.os.Process.myPid()).put("enabled",false).put("state","native").toString());publish();
  yes(!snapshot(resolver).getJSONObject("launcherGridRuntime").getBoolean("enabled")&&enabledSnapshot.getJSONObject("launcherGridRuntime").getBoolean("enabled"),"a later disabled snapshot cannot mutate an earlier process snapshot's enabled result");
  FeatureSettings.cacheGrid(new JSONObject(grid.toString()).put("pid",999).toString());publish();
  yes(snapshot(resolver).getString("launcherGridRuntimeEvidence").equals("PID_MISMATCH")&&!snapshot(resolver).has("launcherGridRuntime"),"another process's cached grid value cannot be attributed to this process");
  FeatureSettings.cacheGrid("{bad json");publish();yes(snapshot(resolver).getString("launcherGridRuntimeEvidence").equals("INVALID_JSON_OR_PID")&&!snapshot(resolver).has("launcherGridRuntime"),"invalid grid JSON does not prevent telemetry publication or invent success");
  FeatureSettings.cacheGrid(new JSONObject().put("enabled",true).toString());publish();yes(snapshot(resolver).getString("launcherGridRuntimeEvidence").equals("INVALID_JSON_OR_PID")&&!snapshot(resolver).has("launcherGridRuntime"),"a missing process identity cannot count as current grid evidence");
  FeatureSettings.cacheGrid(new JSONObject(grid.toString()).put("oversized","x".repeat(16384)).toString());publish();yes(snapshot(resolver).getString("launcherGridRuntimeEvidence").equals("OBSERVATION_SIZE_LIMIT")&&!snapshot(resolver).has("launcherGridRuntime"),"grid source size has an independent hard bound");
  FeatureSettings.cacheGrid(new JSONObject(grid.toString()).put("oversized","中".repeat(6000)).toString());publish();yes(snapshot(resolver).getString("launcherGridRuntimeEvidence").equals("OBSERVATION_SIZE_LIMIT"),"UTF-8 source size is bounded even when its character count fits");
  FeatureSettings.cacheGrid(new JSONObject(grid.toString()).put("nearBudget","x".repeat(14000)).toString());ControlCenterHeaderHook.clockDebug="x".repeat(256*1024-8000);publish();JSONObject budgetSnapshot=snapshot(resolver);
  yes(budgetSnapshot.getString("launcherGridRuntimeEvidence").equals("OMITTED_SNAPSHOT_BUDGET")&&!budgetSnapshot.has("launcherGridRuntime"),"grid attachment is explicitly omitted when it would exceed the provider snapshot budget");
  yes(resolver.calls.get(resolver.calls.size()-1).getString("snapshot").length()<=256*1024&&budgetSnapshot.getJSONArray("hooks").length()==counters.size(),"grid budget handling fits the provider limit and leaves registration evidence intact");
  ControlCenterHeaderHook.clockDebug="fixture";FeatureSettings.cacheGrid("");
  Map<String,HookTelemetryObserver.Counter> savedCounters=new HashMap<>(counters);
  for(int i=0;i<1600;i++){HookTelemetryObserver.Counter extra=new HookTelemetryObserver.Counter("public void fixture.Host.method"+i+"(java.lang.String)");extra.state="REGISTERED";counters.put("fixture-"+i,extra);}
  HookTelemetryObserver.Counter failure=new HookTelemetryObserver.Counter("public void fixture.Host.failed()");
  failure.registrationFailed(new IllegalStateException("fixture registration"),(long)1, (HookTelemetryObserver.ErrorRecorder)field("errorRecorder"));counters.put("fixture-failure",failure);
  HookTelemetry.liftArc("INFO","large host registration inventory");before=dropped();publish();JSONObject large=snapshot(resolver);
  yes(resolver.calls.get(resolver.calls.size()-1).getString("snapshot").length()<=256*1024,"large real hook inventory stays within provider budget");
  JSONObject coverage=large.getJSONObject("hookCoverage");
  yes(coverage.getInt("total")==counters.size()&&coverage.getInt("reported")==large.getJSONArray("hooks").length()&&coverage.getInt("reported")+coverage.getInt("omitted")==counters.size()&&coverage.getInt("omitted")>0,"partial details have exact coverage rather than falsely claiming a complete inventory");
  yes(large.getJSONArray("hooks").getJSONObject(0).getString("id").equals("fixture-failure")&&coverage.getInt("registrationFailures")==1,"registration failure evidence precedes healthy hook details");
  yes(inFlight()==0&&dropped()==before&&events(resolver).length()==1,"oversized inventory cannot discard an unrelated runtime event batch");
  ControlCenterHeaderHook.clockDebug="x".repeat(300000);publish();
  yes(resolver.calls.get(resolver.calls.size()-1).getString("snapshot").length()<=256*1024&&!snapshot(resolver).has("qsClockDebug"),"oversized optional clock payload also obeys hard limit");
  counters.clear();counters.putAll(savedCounters);ControlCenterHeaderHook.clockDebug="fixture";publish();
  yes(!snapshot(resolver).has("hookCoverage")&&snapshot(resolver).getJSONArray("hooks").length()==counters.size(),"ordinary host retains original complete hook schema after overload");
  yes(state.getInt("queueCapacity")==256&&state.getInt("batchLimit")==128&&state.getInt("maxBufferedEvents")==384,"snapshot distinguishes producer queue and in-flight memory bounds");
  before=dropped();resolver.fail=true;publish();yes(dropped()==before,"failed snapshot with no detail does not invent dropped events");
  resolver.fail=false;resolver.nullReply=true;HookTelemetry.liftArc("ERROR","null reply");publish();yes(dropped()==before&&inFlight()==1&&events(resolver).length()==1,"unknown reply is retried and a previous empty snapshot cannot swallow a new event");
  resolver.nullReply=false;retry();yes(dropped()==before&&inFlight()==0,"null reply can recover without abandoning the event");publish();state=delivery(resolver);
  yes(state.getString("meaning").contains("not file durability"),"provider acceptance is not claimed as durable storage");
  before=dropped();android.util.Log.throwPrint=true;HookTelemetry.liftArc("INFO","local log transport failure");publish();
  yes(dropped()==before&&queue.isEmpty()&&inFlight()==0&&events(resolver).length()==1&&counter.failures().total==0,"best-effort native log failure does not prevent provider delivery or change hook counters");
  android.util.Log.throwPrint=false;publish();state=delivery(resolver);
  yes(state.getJSONObject("droppedByReason").getLong("publish_failed")==0,"recovered failures never become detail loss");
  yes(state.getString("retryPolicy").equals("TIME_WINDOW")&&state.getLong("batchMaxAgeMs")==300000&&state.getLong("maxRetryDelayMs")==15000,"retry window and maximum interval are explicit");
  long retriesBefore=((Long)field("retriedBatches"));HookTelemetry.liftArc("WARN","expired while context unavailable");resolver.fail=true;publish();before=dropped();FeatureSettings.context=null;publishAfter(300001);
  yes(inFlight()==0&&dropped()==before+1,"pending batches have an absolute five-minute age bound even if context disappears");FeatureSettings.context=context;resolver.fail=false;publish();state=delivery(resolver);
  yes(state.getLong("retriedBatches")==retriesBefore,"a scheduled but never attempted retry is not counted as executed");
  yes(state.getJSONObject("droppedByReason").getLong("retry_expired")==1&&state.getLong("retryExpiredBatches")==1,"age expiry is distinguishable from retry exhaustion");
  for(int i=0;i<256;i++)HookTelemetry.liftArc("INFO","in-flight capacity "+i);resolver.fail=true;publish();
  before=dropped();for(int i=0;i<200;i++)HookTelemetry.liftArc("INFO","during outage "+i);
  yes(inFlight()==128&&queue.size()==256&&dropped()==before+72,"producers plus retained batch never exceed 384 events during an outage");
  resolver.fail=false;retry();publish();publish();yes(inFlight()==0&&queue.isEmpty(),"recovery drains both retained and newly queued batches");
  HookTelemetry.liftArc("ERROR","transient store rejection");resolver.accept=false;resolver.error="IOException";resolver.detailFailure="STORE_FAILURE";resolver.providerStage="detail_append";before=dropped();publish();retry();retry();
  yes(dropped()==before&&inFlight()==1,"retryable provider rejection retains detail after the original attempt limit");resolver.accept=true;retry();publish();state=delivery(resolver);
  yes(state.getJSONObject("droppedByReason").getLong("provider_rejected")==0&&state.getString("lastPublishFailureDetail").equals("STORE_FAILURE")&&state.getString("lastPublishProviderStage").equals("detail_append"),"store rejection keeps a controlled cause code and provider stage after recovery");
  yes(state.getString("lastPublishFailureType").equals("IOException"),"provider exception type is retained without its message");
  resolver.accept=false;resolver.error="private account=secret";HookTelemetry.liftArc("WARN","unsafe provider text");publish();
  yes(field("lastPublishFailureType").equals("UNKNOWN_PROVIDER_REJECTION"),"arbitrary provider failure text is excluded");resolver.accept=true;resolver.error="";retry();
  resolver.accept=false;resolver.retryable=false;resolver.error="IOException";resolver.detailFailure="APPEND_COMMIT_UNKNOWN";
  HookTelemetry.liftArc("ERROR","terminal commit uncertainty");before=dropped();publish();
  yes(inFlight()==0&&dropped()==before+1,"unsafe-to-retry append outcome abandons the unacknowledged batch immediately");
  calls=resolver.calls.size();publishAfter(3001);yes(resolver.calls.size()==calls,"terminal rejection does not schedule a batch replay");
  resolver.accept=true;resolver.retryable=true;resolver.error="";resolver.detailFailure="";publish();state=delivery(resolver);
  yes(state.getLong("terminalRejectedBatches")==1&&state.getJSONObject("droppedByReason").getLong("provider_terminal")==1
    &&state.getString("lastPublishFailureDetail").equals("APPEND_COMMIT_UNKNOWN"),"terminal failure cause remains visible independently of later transport recovery");
  resolver.thrown=new IllegalArgumentException("Unknown authority ls.augment.com.config private account=secret");HookTelemetry.liftArc("WARN","authority unavailable");before=dropped();publish();
  yes(field("lastPublishFailureCause").equals("PROVIDER_UNAVAILABLE")&&field("lastPublishFailurePhase").equals("provider_call")&&field("lastPublishProviderStage").equals(""),"real authority exceptions get an explicit cause without carrying another event's provider stage");
  resolver.thrown=null;retry();yes(dropped()==before&&inFlight()==0,"authority recovery retains detail");publish();state=delivery(resolver);
  yes(ls.augment.com.StartupDiagnostics.events.stream().anyMatch(s->s.contains("cause=PROVIDER_UNAVAILABLE"))
    &&ls.augment.com.StartupDiagnostics.events.stream().anyMatch(s->s.startsWith("TELEMETRY_DELIVERY_RECOVERED:")),"independent cause and recovery remain visible with release debug logging off");
  yes(!state.getString("lastPublishFailureTrace").contains("account=secret")&&state.getString("lastPublishFailureTrace").length()<2100&&state.getJSONObject("firstPublishFailure").getLong("at")>0,"first failure and latest bounded trace survive recovery without private messages");
  resolver.fail=true;HookTelemetry.liftArc("WARN","outage lasting minutes");before=dropped();publish();String prolongedId=batchId(resolver),prolongedPayload=payload(resolver);
  for(int i=0;i<12;i++){retry();yes(inFlight()==1&&dropped()==before&&batchId(resolver).equals(prolongedId)&&payload(resolver).equals(prolongedPayload),"minute-scale outage retains bounded identical batch "+i);}
  resolver.fail=false;retry();yes(inFlight()==0&&dropped()==before,"minute-scale provider recovery delivers without attempt exhaustion");
  Method classify=HookTelemetry.class.getDeclaredMethod("transportCause",Throwable.class,String.class);classify.setAccessible(true);
  yes(classify.invoke(null,new IllegalArgumentException("unrelated illegal argument account=secret"),"").equals("UNCLASSIFIED_TRANSPORT_FAILURE"),"unrelated IllegalArgumentException is not falsely diagnosed as provider unavailability");
  yes(classify.invoke(null,new IllegalStateException("wrapper",new SecurityException("private grant")),"").equals("PROVIDER_ACCESS_DENIED"),"cause traversal distinguishes provider access failure");
  Method boundedTrace=HookTelemetry.class.getDeclaredMethod("transportTrace",Throwable.class);boundedTrace.setAccessible(true);
  IllegalArgumentException unusual=new IllegalArgumentException("private-message");StackTraceElement[] manyFrames=new StackTraceElement[100];Arrays.fill(manyFrames,new StackTraceElement("private.package.Fixed","fixed","x".repeat(10000),1));unusual.setStackTrace(manyFrames);
  String traceText=(String)boundedTrace.invoke(null,unusual);yes(traceText.length()<2100&&!traceText.contains("private-message"),"unusual frames and frame count stay bounded without arbitrary exception messages");
  resolver.accept=false;resolver.retryable=false;resolver.error="IllegalArgumentException";resolver.detailFailure="INVALID_BATCH_ID";resolver.providerStage="batch_identity";HookTelemetry.liftArc("WARN","bad identity");before=dropped();publish();
  yes(inFlight()==0&&dropped()==before+1&&field("lastPublishFailureDetail").equals("INVALID_BATCH_ID")&&field("lastPublishProviderStage").equals("batch_identity"),"invalid input is terminal with exact provider reason and stage instead of blind retry");resolver.accept=true;resolver.retryable=true;resolver.error="";resolver.detailFailure="";resolver.providerStage="";
  HookTelemetry.shoulderSwitch("INFO","tx=1 stage=request caseId=2 schemeName=private-name");
  HookTelemetry.shoulderSwitch("WARN","tx=1 stage=shortcut_stale expectedHash=abc observedHash=def payload={\"account\":\"private-account\"}");
  HookTelemetry.shoulderSwitch("DEBUG","stage=private_debug");
  yes(queue.size()==2&&!queue.peek()[1].contains("private-name"),"necessary switch state bypasses disabled detail and rejects free text/unknown fields");
  int beforeCalls=resolver.calls.size();Method directPublish=HookTelemetry.class.getDeclaredMethod("publish");directPublish.setAccessible(true);directPublish.invoke(null);
  yes(resolver.calls.size()==beforeCalls+1&&queue.isEmpty(),"necessary switch state bypasses the 15-second optional-off snapshot throttle");
  JSONArray switches=events(resolver);yes(switches.length()==2&&switches.getJSONObject(0).getString("feature").equals("SHOULDER_SWITCH")
    &&switches.getJSONObject(0).getString("level").equals("INFO")&&!switches.toString().contains("private-account"),"real publish carries timestamped safe ordinary events");
  resolver.historyCutoff=System.currentTimeMillis()+1000;
  counters.values().forEach(c->c.hits.set(99));HookTelemetry.liftArc("WARN","old queued record");publish();
  yes(field("historyCutoff").equals(resolver.historyCutoff)&&inFlight()==0&&queue.isEmpty()&&dropped()==0,"provider clear boundary discards old in-flight and queued history");
  yes(counters.values().stream().allMatch(c->c.hits.get()==0&&c.failures().total==0),"all callback counters reset without unregistering hooks");
  HookTelemetry.liftArc("WARN","new queued record");publish();
  yes(events(resolver).length()==1&&payload(resolver).contains("new queued record")&&!payload(resolver).contains("old queued record"),"new events publish after adopting boundary");
  System.out.println("PASS actual HookTelemetry delivery: "+checks+" checks (bounded queue, real publish method; provider double)");
 }
}
'''

with tempfile.TemporaryDirectory(prefix='duo-telemetry-delivery-') as folder:
    work = Path(folder)
    files = []
    for relative, content in {**STUBS, 'ls/augment/com/hook/TestHookTelemetryDelivery.java': TEST}.items():
        if '__GRID_MEMORY_GETTER__' in content:
            feature_source = (ROOT/'android/app/src/main/java/ls/augment/com/hook/FeatureSettings.java').read_text(encoding='utf-8')
            content = content.replace('__GRID_MEMORY_GETTER__', member(feature_source, 'static String launcherGridRuntimeValue'))
        target = work/relative
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(content, encoding='utf-8')
        files.append(target)
    main = ROOT/'android/app/src/main/java/ls/augment/com'
    files += [main/'HookTargetRegistry.java', main/'ShoulderSwitchLogPolicy.java', main/'AtomicWorkbenchLogPolicy.java', main/'hook/HookTelemetry.java', main/'hook/HookTelemetryObserver.java']
    cp = os.pathsep.join(map(str, [args.api_jar, args.json_jar]))
    subprocess.run([str(args.java_home/'bin/javac.exe'), '-encoding', 'UTF-8', '--release', '17', '-cp', cp, '-d', str(work), *map(str, files)], check=True)
    subprocess.run([str(args.java_home/'bin/java.exe'), '-cp', str(work)+os.pathsep+cp, 'ls.augment.com.hook.TestHookTelemetryDelivery'], check=True, timeout=30)
