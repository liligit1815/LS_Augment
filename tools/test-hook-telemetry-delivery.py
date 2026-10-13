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

STUBS = {
    'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle{final Map<String,Object> data=new HashMap<>();public void putString(String k,String v){data.put(k,v);}public String getString(String k){return (String)data.get(k);}public String getString(String k,String d){return (String)data.getOrDefault(k,d);}public void putBoolean(String k,boolean v){data.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(data.get(k));}public boolean getBoolean(String k,boolean d){return (Boolean)data.getOrDefault(k,d);}}''',
    'android/os/SystemClock.java': '''package android.os;public class SystemClock{public static long now=100000;public static long elapsedRealtime(){return now;}}''',
    'android/os/Process.java': '''package android.os;public class Process{public static int myPid(){return 4595;}public static long getStartElapsedRealtime(){return 10;}}''',
    'android/net/Uri.java': '''package android.net;public class Uri{public static Uri parse(String s){return new Uri();}}''',
    'android/content/Context.java': '''package android.content;public class Context{public final ContentResolver resolver=new ContentResolver();public ContentResolver getContentResolver(){return resolver;}}''',
    'android/content/ContentResolver.java': '''package android.content;import android.os.Bundle;import android.net.Uri;import java.util.*;public class ContentResolver{public boolean accept=true,fail,nullReply,retryable=true;public String error="",detailFailure="";public final List<Bundle> calls=new ArrayList<>();public Bundle call(Uri uri,String method,String arg,Bundle extras){calls.add(extras);if(fail)throw new IllegalStateException("fixture provider unavailable");if(nullReply)return null;Bundle reply=new Bundle();reply.putBoolean("ok",accept);reply.putBoolean("retryable",retryable);reply.putString("error",error);reply.putString("detailFailure",detailFailure);return reply;}}''',
    'android/util/Log.java': '''package android.util;public class Log{public static final int ERROR=6,WARN=5,INFO=4;public static int printed;public static boolean throwPrint;public static int e(String t,String s){return 0;}public static int w(String t,String s,Throwable e){return 0;}public static int println(int p,String t,String s){if(throwPrint)throw new IllegalStateException("fixture log transport");printed++;return 0;}public static boolean isLoggable(String t,int p){return false;}}''',
    'ls/augment/com/BuildConfig.java': '''package ls.augment.com;public class BuildConfig{public static final String VERSION_NAME="test-current";public static final boolean DEBUG=false;}''',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import android.content.Context;final class FeatureSettings{static Context context;static final String SHOULDER_DIAGNOSTICS="shoulder",AI_TRIGGER_DIAGNOSTICS="ai";static Context from(Object o){return context;}static boolean enabled(Context c,String k){return false;}}''',
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
 static int inFlight()throws Exception{return ((List<?>)field("pendingBatch")).size();}
 static String batchId(ContentResolver resolver){return resolver.calls.get(resolver.calls.size()-1).getString("eventBatchId");}
 static String payload(ContentResolver resolver){return resolver.calls.get(resolver.calls.size()-1).getString("events");}
 static JSONObject snapshot(ContentResolver resolver)throws Exception{return new JSONObject(resolver.calls.get(resolver.calls.size()-1).getString("snapshot"));}
 static JSONArray events(ContentResolver resolver)throws Exception{return new JSONArray(resolver.calls.get(resolver.calls.size()-1).getString("events"));}
 static JSONObject delivery(ContentResolver resolver)throws Exception{return snapshot(resolver).getJSONObject("detailDelivery");}
 static long dropped()throws Exception{return ((AtomicLong)field("dropped")).get();}
 public static void main(String[] args)throws Exception{
  ((ScheduledExecutorService)field("worker")).shutdownNow();
  @SuppressWarnings("unchecked") ArrayBlockingQueue<String[]> queue=(ArrayBlockingQueue<String[]>)field("trace");
  HookTelemetry.loaded("com.android.systemui","API102");HookTelemetry.ready("com.android.systemui");
  HookTelemetry.liftArc("INFO","before context");publish();yes(queue.size()==1&&dropped()==0,"unavailable context retains queued detail, not counted as hook failure");
  Context context=new Context();FeatureSettings.context=context;ContentResolver resolver=context.resolver;
  resolver.accept=false;publish();yes(queue.isEmpty()&&inFlight()==1&&dropped()==0,"transient rejection retains the batch without claiming loss");
  yes(field("lastPublishFailureType").equals("UNKNOWN_PROVIDER_REJECTION"),"rejection without a cause remains explicitly unknown");
  String originalPayload=payload(resolver),originalId=batchId(resolver);int calls=resolver.calls.size(),printed=android.util.Log.printed;
  HookTelemetry.liftArc("INFO","arrived after first attempt");publishAfter(0);yes(resolver.calls.size()==calls,"runtime events cannot bypass the retry delay");
  resolver.accept=true;publishAfter(3001);JSONObject state=delivery(resolver);
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
  publishAfter(3001);yes(dropped()==before&&inFlight()==1,"second attempt remains bounded and pending");
  publishAfter(3001);yes(dropped()==before+1&&inFlight()==0,"third failed attempt abandons the unacknowledged batch exactly once");
  resolver.fail=false;publish();state=delivery(resolver);yes(state.getJSONObject("droppedByReason").getLong("publish_failed")==1&&state.getLong("retryExhaustedBatches")==1,"exhausted transport losses retain their cause");
  yes(state.getString("lastPublishFailureType").equals("java.lang.IllegalStateException"),"transport exception type survives into accepted snapshots");
  yes(state.getInt("queueCapacity")==256&&state.getInt("batchLimit")==128&&state.getInt("maxBufferedEvents")==384,"snapshot distinguishes producer queue and in-flight memory bounds");
  before=dropped();resolver.fail=true;publish();yes(dropped()==before,"failed snapshot with no detail does not invent dropped events");
  resolver.fail=false;resolver.nullReply=true;HookTelemetry.liftArc("ERROR","null reply");publish();yes(dropped()==before&&inFlight()==1&&events(resolver).length()==1,"unknown reply is retried and a previous empty snapshot cannot swallow a new event");
  resolver.nullReply=false;publishAfter(3001);yes(dropped()==before&&inFlight()==0,"null reply can recover without abandoning the event");publish();state=delivery(resolver);
  yes(state.getString("meaning").contains("not file durability"),"provider acceptance is not claimed as durable storage");
  before=dropped();android.util.Log.throwPrint=true;HookTelemetry.liftArc("INFO","local log transport failure");publish();
  yes(dropped()==before&&queue.isEmpty()&&inFlight()==0&&events(resolver).length()==1&&counter.failures().total==0,"best-effort native log failure does not prevent provider delivery or change hook counters");
  android.util.Log.throwPrint=false;publish();state=delivery(resolver);
  yes(state.getJSONObject("droppedByReason").getLong("publish_failed")==1,"only exhausted actual events are classified as dropped");
  long retriesBefore=((Long)field("retriedBatches"));HookTelemetry.liftArc("WARN","expired while context unavailable");resolver.fail=true;publish();before=dropped();FeatureSettings.context=null;publishAfter(30001);
  yes(inFlight()==0&&dropped()==before+1,"pending batches expire after 30 seconds even if context disappears");FeatureSettings.context=context;resolver.fail=false;publish();state=delivery(resolver);
  yes(state.getLong("retriedBatches")==retriesBefore,"a scheduled but never attempted retry is not counted as executed");
  yes(state.getJSONObject("droppedByReason").getLong("retry_expired")==1&&state.getLong("retryExpiredBatches")==1,"age expiry is distinguishable from retry exhaustion");
  for(int i=0;i<256;i++)HookTelemetry.liftArc("INFO","in-flight capacity "+i);resolver.fail=true;publish();
  before=dropped();for(int i=0;i<200;i++)HookTelemetry.liftArc("INFO","during outage "+i);
  yes(inFlight()==128&&queue.size()==256&&dropped()==before+72,"producers plus retained batch never exceed 384 events during an outage");
  resolver.fail=false;publishAfter(3001);publish();publish();yes(inFlight()==0&&queue.isEmpty(),"recovery drains both retained and newly queued batches");
  HookTelemetry.liftArc("ERROR","permanently rejected");resolver.accept=false;resolver.error="IOException";before=dropped();publish();publishAfter(3001);publishAfter(3001);
  yes(dropped()==before+1&&inFlight()==0,"explicit provider rejection also has finite retries");resolver.accept=true;publish();state=delivery(resolver);
  yes(state.getJSONObject("droppedByReason").getLong("provider_rejected")==1&&state.getString("lastDropReason").equals("provider_rejected")&&state.getLong("lastDropAt")>0,"terminal rejection keeps the failure cause and time");
  yes(state.getString("lastPublishFailureType").equals("IOException"),"provider exception type is retained without its message");
  resolver.accept=false;resolver.error="private account=secret";HookTelemetry.liftArc("WARN","unsafe provider text");publish();
  yes(field("lastPublishFailureType").equals("UNKNOWN_PROVIDER_REJECTION"),"arbitrary provider failure text is excluded");resolver.accept=true;resolver.error="";publishAfter(3001);
  resolver.accept=false;resolver.retryable=false;resolver.error="IOException";resolver.detailFailure="APPEND_COMMIT_UNKNOWN";
  HookTelemetry.liftArc("ERROR","terminal commit uncertainty");before=dropped();publish();
  yes(inFlight()==0&&dropped()==before+1,"unsafe-to-retry append outcome abandons the unacknowledged batch immediately");
  calls=resolver.calls.size();publishAfter(3001);yes(resolver.calls.size()==calls,"terminal rejection does not schedule a batch replay");
  resolver.accept=true;resolver.retryable=true;resolver.error="";resolver.detailFailure="";publish();state=delivery(resolver);
  yes(state.getLong("terminalRejectedBatches")==1&&state.getJSONObject("droppedByReason").getLong("provider_terminal")==1
    &&state.getString("lastPublishFailureDetail").equals("APPEND_COMMIT_UNKNOWN"),"terminal failure cause remains visible independently of later transport recovery");
  HookTelemetry.shoulderSwitch("INFO","tx=1 stage=request caseId=2 schemeName=private-name");
  HookTelemetry.shoulderSwitch("WARN","tx=1 stage=shortcut_stale expectedHash=abc observedHash=def payload={\"account\":\"private-account\"}");
  HookTelemetry.shoulderSwitch("DEBUG","stage=private_debug");
  yes(queue.size()==2&&!queue.peek()[1].contains("private-name"),"necessary switch state bypasses disabled detail and rejects free text/unknown fields");
  int beforeCalls=resolver.calls.size();Method directPublish=HookTelemetry.class.getDeclaredMethod("publish");directPublish.setAccessible(true);directPublish.invoke(null);
  yes(resolver.calls.size()==beforeCalls+1&&queue.isEmpty(),"necessary switch state bypasses the 15-second optional-off snapshot throttle");
  JSONArray switches=events(resolver);yes(switches.length()==2&&switches.getJSONObject(0).getString("feature").equals("SHOULDER_SWITCH")
    &&switches.getJSONObject(0).getString("level").equals("INFO")&&!switches.toString().contains("private-account"),"real publish carries timestamped safe ordinary events");
  System.out.println("PASS actual HookTelemetry delivery: "+checks+" checks (bounded queue, real publish method; provider double)");
 }
}
'''

with tempfile.TemporaryDirectory(prefix='duo-telemetry-delivery-') as folder:
    work = Path(folder)
    files = []
    for relative, content in {**STUBS, 'ls/augment/com/hook/TestHookTelemetryDelivery.java': TEST}.items():
        target = work/relative
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(content, encoding='utf-8')
        files.append(target)
    main = ROOT/'android/app/src/main/java/ls/augment/com'
    files += [main/'HookTargetRegistry.java', main/'ShoulderSwitchLogPolicy.java', main/'hook/HookTelemetry.java', main/'hook/HookTelemetryObserver.java']
    cp = os.pathsep.join(map(str, [args.api_jar, args.json_jar]))
    subprocess.run([str(args.java_home/'bin/javac.exe'), '-encoding', 'UTF-8', '--release', '17', '-cp', cp, '-d', str(work), *map(str, files)], check=True)
    subprocess.run([str(args.java_home/'bin/java.exe'), '-cp', str(work)+os.pathsep+cp, 'ls.augment.com.hook.TestHookTelemetryDelivery'], check=True, timeout=30)
