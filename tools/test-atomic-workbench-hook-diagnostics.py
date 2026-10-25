"""Execute workbench HookTelemetry -> DiagnosticStore -> bounded private log -> unified export."""
from pathlib import Path
import argparse
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"


def stubs(name):
    tree = ast.parse((ROOT / "tools" / name).read_text(encoding="utf-8"))
    for node in tree.body:
        if isinstance(node, ast.Assign) and any(isinstance(t, ast.Name) and t.id == "STUBS" for t in node.targets):
            return ast.literal_eval(node.value)
    raise AssertionError(name)


def member(source, signature):
    start = source.index(signature)
    end, depth = source.index("{", start) + 1, 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


TEST = r'''package ls.augment.com.hook;
import android.content.*;import android.os.SystemClock;import java.io.*;import java.lang.reflect.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.*;import org.json.*;
import ls.augment.com.*;
public final class TestAtomicWorkbenchHookDiagnostics {
 static int checks;static void yes(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static AugmentModule entryModule=new AugmentModule();static final java.util.concurrent.atomic.AtomicInteger droppedEntryWitnesses=new java.util.concurrent.atomic.AtomicInteger();
 // ACTUAL_ENTRY_WITNESS
 static final String CHECKSUM="abcdef0123456789".repeat(4);
 static String entry(){return "ATOMIC_WORKBENCH_ENTRY side=right;config_revision=1792078449714;durationMs=14;phase=submitted;reason=awaiting_ui_entry;user=0;checksum="+CHECKSUM+";x=1123.125;y=321.875;rawX=876.25;rawY=654.75;coords=private-coordinates;token=private-entry-credential";}
 static void entryFields(String text,String boundary){
  yes(text.contains("ATOMIC_WORKBENCH_ENTRY")&&text.contains("side=right")&&text.contains("config_revision=1792078449714")&&text.contains("durationMs=14")&&text.contains("phase=submitted")&&text.contains("reason=awaiting_ui_entry"),boundary+" preserves safe entry submission witnesses");
  yes(!text.contains(CHECKSUM)&&!text.contains("checksum=")&&!text.contains("token=")&&!text.contains("private-entry-")&&!text.contains("coords=")&&!text.contains("rawX=")&&!text.contains("rawY=")&&!text.contains("x=1123.125")&&!text.contains("y=321.875")&&!text.contains("876.25")&&!text.contains("654.75"),boundary+" excludes checksum, launch credential and touch coordinates");
 }
 static Object field(String name)throws Exception{Field f=HookTelemetry.class.getDeclaredField(name);f.setAccessible(true);return f.get(null);}
 static void publish()throws Exception{android.os.SystemClock.now+=16000;Method m=HookTelemetry.class.getDeclaredMethod("publish");m.setAccessible(true);m.invoke(null);}
 static String read(Context context)throws Exception{return Files.readString(new File(context.getFilesDir(),AtomicWorkbenchLogPolicy.FILE).toPath());}
 static List<JSONObject> events(String text){List<JSONObject> events=new ArrayList<>();text.lines().forEach(line->events.add(new JSONObject(line)));return events;}
 public static void main(String[] args)throws Exception{
  ((ScheduledExecutorService)field("worker")).shutdownNow();Context context=new Context(new File(args[0]));
  HookTelemetry.loaded("com.zte.mifavor.launcher","API102");HookTelemetry.ready("com.zte.mifavor.launcher");
  @SuppressWarnings("unchecked") ArrayBlockingQueue<String[]> queue=(ArrayBlockingQueue<String[]>)field("trace");
  if(args.length>1){String exported=DiagnosticPipelineBridge.export(context);yes(exported.contains("ATOMIC_WORKBENCH_HOOK_RUNTIME")&&exported.contains("ATOMIC_LAST_EVENT"),"fresh process exports retained hook witnesses without logcat");entryFields(exported,"fresh-process unified export");System.out.println("PASS hook diagnostics survive sender and application process exit: "+checks+" checks");return;}
  HookTelemetry.atomicWorkbench("INFO","ATOMIC_NATIVE_HOME_ROUTE task=69;source_display=0;target_display=2;phase=confirmed;reason=home_transfer;home_drawn=true;wallpaper_drawn=false;readiness_started_uptime=1000;home_drawn_uptime=1001;wallpaper_drawn_uptime=1002;draw_evidence=wm_state_with_optional_callback",null);
  publish();yes(queue.size()==1&&!new File(context.getFilesDir(),AtomicWorkbenchLogPolicy.FILE).exists(),"producer and missing context never open app storage");
  HookTelemetry.atomicWorkbench("ERROR","ATOMIC_NATIVE_HOME_GESTURE source_display=2;target_display=2;auth=true;branch=recents;container=launcher;native_result=failed;token=private-credential payload=private-media",new IllegalStateException("private-account-message"));
  HookTelemetry.atomicWorkbench("INFO",entry(),null);
  HookTelemetry.atomicWorkbench("DEBUG","ATOMIC_PRIVATE_DEBUG content=private-content",null);
  HookTelemetry.atomicWorkbench("INFO","OTHER_EVENT stage=ignored",null);
  yes(queue.size()==3,"only valid ATOMIC runtime levels enter bounded queue");
  String queuedEntry=queue.stream().map(item->item[1]).filter(value->value.contains("ATOMIC_WORKBENCH_ENTRY")).findFirst().orElseThrow();
  entryFields(queuedEntry,"actual HookTelemetry sender queue");
  FeatureSettings.context=context;publish();String retained=read(context);List<JSONObject> events=events(retained);
  yes(events.size()==3&&queue.isEmpty(),"actual provider persists necessary events with optional details disabled");
  JSONObject persistedEntry=events.stream().filter(event->event.getString("value").contains("ATOMIC_WORKBENCH_ENTRY")).findFirst().orElseThrow();
  entryFields(persistedEntry.getString("value"),"actual receiving store and private file");
  JSONObject senderEntry=new JSONArray(context.resolver.lastRequest.getString("events","")).toList().stream().map(item->new JSONObject((Map<?,?>)item)).filter(event->event.optString("value").contains("ATOMIC_WORKBENCH_ENTRY")).findFirst().orElseThrow();
  entryFields(senderEntry.getString("value"),"actual sender request payload");
  JSONObject first=events.get(0),second=events.get(1);
  yes(first.getInt("pid")==android.os.Process.myPid()&&first.getInt("uid")==1000&&first.getInt("receivedBoot")==7,"receiver records authenticated PID/UID and boot");
  yes(first.getString("process").equals("com.zte.mifavor.launcher")&&first.getString("moduleVersion").equals("test-current")&&first.getLong("moduleLoadedElapsed")>0,"version and process lifetime retained for historical attribution");
  yes(first.getString("value").contains("seq=1")&&second.getString("value").contains("seq=2")&&retained.contains("session=")&&retained.contains("wall="),"per-process session, wall/elapsed and ordered sequence survive provider sanitation");
  yes(first.getString("value").contains("home_drawn=true")&&first.getString("value").contains("wallpaper_drawn=false")&&first.getString("value").contains("readiness_started_uptime=1000")&&first.getString("value").contains("home_drawn_uptime=1001")&&first.getString("value").contains("wallpaper_drawn_uptime=1002")&&second.getString("value").contains("native_result=failed"),"readiness clocks and Recents outcome fields survive the whole path");
  yes(second.getString("errorType").equals("java.lang.IllegalStateException")&&second.getString("errorStack").contains("TestAtomicWorkbenchHookDiagnostics.main"),"bounded exception type and real source frames retained");
  yes(!retained.contains("private-")&&!retained.contains("token=")&&!retained.contains("payload="),"credentials, media and exception messages never reach disk");
  yes(!AtomicWorkbenchLogPolicy.safeStack("java.lang.IllegalStateException private-account-message").contains("private-account"),"provider rejects non-frame exception text");
  String nativeInput=AtomicWorkbenchLogPolicy.safe("ATOMIC_NATIVE_HOME_INPUT phase=consumer_after;input_action=1;copy_action=3;consumer_class=com.android.quickstep.inputconsumers.OtherActivityInputConsumer;delegate_chain_states=0,leaf;delegate_leaf_class=com.android.quickstep.inputconsumers.OtherActivityInputConsumer;unknown=private-unknown");
  yes(nativeInput.contains("input_action=1")&&nativeInput.contains("copy_action=3")&&nativeInput.contains("delegate_chain_states=0,leaf")&&nativeInput.contains("delegate_leaf_class=com.android.quickstep.inputconsumers.OtherActivityInputConsumer"),"existing native input observations were stripped before persistence");
  yes(!nativeInput.contains("private-unknown"),"native state fields enabled an opaque unknown tail");
  String exported=DiagnosticPipelineBridge.export(context);yes(exported.contains("SOURCE ATOMIC_WORKBENCH_HOOK_RUNTIME")&&exported.contains("native_result=failed")&&exported.contains("retained history"),"actual unified export includes hook witnesses independent of system logcat");
  entryFields(exported,"same-process unified export");
  android.os.Bundle reply=DiagnosticPipelineBridge.record(context,context.resolver.lastRequest);yes(reply.getBoolean("duplicateBatch")&&events(read(context)).size()==3,"lost reply retry does not duplicate private records");
  JSONObject requestSnapshot=new JSONObject(context.resolver.lastRequest.getString("snapshot",""));
  JSONArray unsafe=new JSONArray().put(new JSONObject().put("feature",AtomicWorkbenchLogPolicy.FEATURE).put("level","INFO").put("value",entry()+";unknown=private-unknown;payload=private-content").put("errorStack","private exception message").put("unexpectedPrivatePayload","private-extra").put("checksum",CHECKSUM).put("token","private-entry-json-credential").put("rawX",876.25).put("rawY",654.75));
  android.os.Bundle request=new android.os.Bundle();request.putString("snapshot",requestSnapshot.toString());request.putString("events",unsafe.toString());request.putString("eventBatchId","sanitize:1");
  yes(DiagnosticPipelineBridge.record(context,request).getBoolean("ok")&&!read(context).contains("private-"),"receiving provider independently strips unknown JSON, private fields and arbitrary stack text");
  entryFields(events(read(context)).get(events(read(context)).size()-1).toString(),"receiver independently sanitizes a raw unsafe entry request");
  entryWitness("submitted",AtomicWorkbenchGesturePolicy.RIGHT,0,1792078449714L,android.os.SystemClock.now-14L,"awaiting_ui_entry",null);publish();
  entryFields(events(read(context)).get(events(read(context)).size()-1).getString("value"),"actual GestureHook entryWitness and AugmentModule logging bridge");
  context.resolver.fail=true;HookTelemetry.atomicWorkbench("WARN","ATOMIC_RETRY phase=provider_unavailable",null);publish();int before=events(read(context)).size();
  context.resolver.fail=false;publish();yes(events(read(context)).size()==before+1,"existing retry channel recovers startup provider outage");
  long started=System.nanoTime();for(int i=0;i<300;i++)HookTelemetry.atomicWorkbench("INFO","ATOMIC_QUEUE_BOUND count="+i,null);
  yes(System.nanoTime()-started<TimeUnit.SECONDS.toNanos(2)&&queue.size()==256,"producer remains bounded and does not wait for delivery");
  yes(((java.util.concurrent.atomic.AtomicLong)field("workbenchDropped")).get()>=44,"workbench queue overflow has an explicit counter");
  publish();publish();HookTelemetry.atomicWorkbench("INFO","ATOMIC_AFTER_DROP stage=ready",null);publish();
  JSONObject latest=events(read(context)).get(events(read(context)).size()-1);yes(latest.getString("value").contains("dropped=44"),"subsequent successful event discloses prior bounded queue loss");
  ExecutorService producers=Executors.newFixedThreadPool(4);List<Future<?>> writers=new ArrayList<>();
  for(int thread=0;thread<4;thread++)writers.add(producers.submit(()->{for(int i=0;i<10;i++)HookTelemetry.atomicWorkbench("INFO","ATOMIC_CONCURRENT stage=ready",null);}));
  for(Future<?> writer:writers)writer.get();producers.shutdownNow();publish();long previousSequence=0;
  for(JSONObject item:events(read(context))){java.util.regex.Matcher match=java.util.regex.Pattern.compile("(?:^| )seq=([0-9]+)(?: |$)").matcher(item.getString("value"));if(match.find()){long next=Long.parseLong(match.group(1));yes(next>previousSequence,"concurrent producers retain sequence order in actual private file");previousSequence=next;}}
  long beforeFailure=((java.util.concurrent.atomic.AtomicLong)field("workbenchDropped")).get();
  HookTelemetry.atomicWorkbench("ERROR","ATOMIC_DIAGNOSTIC_FAILURE phase=metadata",new Throwable(){@Override public StackTraceElement[] getStackTrace(){throw new IllegalStateException("fixture stack unavailable");}});
  yes(((java.util.concurrent.atomic.AtomicLong)field("workbenchDropped")).get()==beforeFailure+1,"diagnostic stack failure cannot escape into native hook behavior");
  int previousPid=android.os.Process.pid;android.os.Process.pid=previousPid+1;HookTelemetry.loaded("system","API102");HookTelemetry.atomicWorkbench("INFO","ATOMIC_HISTORICAL_PID phase=ready",null);publish();
  latest=events(read(context)).get(events(read(context)).size()-1);yes(latest.getInt("pid")==previousPid+1&&first.getInt("pid")==previousPid,"later sender cannot rewrite earlier PID identity");android.os.Process.pid=previousPid;
  String longFields="ATOMIC_ROTATION phase=ready;reason="+"x".repeat(150)+";state="+"y".repeat(150)+";status="+"z".repeat(150);
  for(int batch=0;batch<12;batch++){for(int i=0;i<100;i++)HookTelemetry.atomicWorkbench("INFO",longFields+";count="+i,null);publish();}
  entryWitness("submitted",AtomicWorkbenchGesturePolicy.RIGHT,0,1792078449714L,android.os.SystemClock.now-14L,"awaiting_ui_entry",null);
  HookTelemetry.atomicWorkbench("INFO","ATOMIC_LAST_EVENT firstFrame=UNVERIFIED;inputResult=accepted;recentsResult=routed;switchResult=ready",null);publish();
  File file=new File(context.getFilesDir(),AtomicWorkbenchLogPolicy.FILE);retained=read(context);events=events(retained);
  yes(file.length()<=512*1024&&events.get(events.size()-1).getString("value").contains("ATOMIC_LAST_EVENT"),"production file rotation retains complete latest JSON under its byte cap");
  yes(context.getSharedPreferences("diagnostic-retention",0).getLong(AtomicWorkbenchLogPolicy.FEATURE+"_rotations",0)>0&&!retained.contains("\ufffd"),"rotation metadata recorded and UTF-8 remains intact");
  yes(DiagnosticPipelineBridge.export(context).contains("firstFrame=UNVERIFIED"),"export preserves unverified first-frame semantics rather than declaring success");
  entryFields(DiagnosticPipelineBridge.export(context),"post-rotation unified export");
  System.out.println("PASS workbench hook diagnostics pipeline: "+checks+" checks");
 }
}'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--java-home", type=Path, default=Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")))
    jars = list((Path.home() / ".gradle/caches/modules-2/files-2.1/org.json/json").glob("*/*/*.jar"))
    parser.add_argument("--json-jar", type=Path, default=Path(os.environ["JSON_JAR"]) if os.environ.get("JSON_JAR") else jars[0] if jars else None)
    parser.add_argument("--api-jar", type=Path, default=ROOT / "audit-output/volume-percent-review/libxposed-api.jar")
    args = parser.parse_args()
    if args.json_jar is None or not args.json_jar.is_file():
        parser.error("org.json jar required; pass --json-jar or set JSON_JAR")
    sources = {**stubs("test-hook-telemetry-delivery.py"), **stubs("test-diagnostic-batch-retry.py")}
    sources["android/os/Process.java"] = '''package android.os;public class Process{public static int pid=4595;public static int myPid(){return pid;}public static long getStartElapsedRealtime(){return 10;}}'''
    sources["android/os/Binder.java"] = '''package android.os;public class Binder{public static int getCallingPid(){return Process.myPid();}public static int getCallingUid(){return 1000;}}'''
    sources["android/content/Context.java"] = '''package android.content;import java.io.*;import java.util.*;public class Context{final File files;final Map<String,SharedPreferences> prefs=new HashMap<>();public final ContentResolver resolver=new ContentResolver(this);public Context(File f){files=f;files.mkdirs();}public File getFilesDir(){return files;}public SharedPreferences getSharedPreferences(String n,int mode){return prefs.computeIfAbsent(n,k->new SharedPreferences());}public ContentResolver getContentResolver(){return resolver;}}'''
    sources["android/content/ContentResolver.java"] = '''package android.content;import android.os.Bundle;import android.net.Uri;public class ContentResolver{final Context context;public boolean fail;public Bundle lastRequest;public ContentResolver(Context c){context=c;}public Bundle call(Uri uri,String method,String arg,Bundle extras){lastRequest=extras;if(fail)throw new IllegalArgumentException("private-provider-message");return ls.augment.com.DiagnosticPipelineBridge.record(context,extras);}}'''
    sources.pop("ls/augment/com/BoundedLog.java")
    module = (SRC / "hook/AugmentModule.java").read_text(encoding="utf-8")
    sources["ls/augment/com/hook/AugmentModule.java"] = "package ls.augment.com.hook;final class AugmentModule{void logInfo(String m){}void logError(String m,Throwable e){}void recordStartup(String kind,String m,Throwable e){}" + member(module,"void logFeatureInfo(") + member(module,"void logFeatureError(") + "}"
    sources["ls/augment/com/hook/LiftArcLog.java"] = sources["ls/augment/com/hook/LiftArcLog.java"].replace("static long suppressedEvents()", "static void stageInfo(String m){}static void stageError(String m,Throwable e){}static long suppressedEvents()")
    sources["ls/augment/com/BuildConfig.java"] = sources["ls/augment/com/BuildConfig.java"].replace("public static final String VERSION_NAME", "public static final int VERSION_CODE=20566;public static final String VERSION_NAME")
    sources["ls/augment/com/AuditLog.java"] = '''package ls.augment.com;final class AuditLog{static String failureStatus(android.content.Context c){return "unused";}}'''
    sources["ls/augment/com/AtomicWorkbenchDiagnostics.java"] = '''package ls.augment.com;final class AtomicWorkbenchDiagnostics{static final String FILE_NAME="atomic-workbench.log",STAT="atomic_workbench";static final int MAX_BYTES=256*1024;static String writeState(android.content.Context c){return "unused";}static String sessionSummary(android.content.Context c){return "unused";}}'''
    export = (SRC / "DiagnosticExport.java").read_text(encoding="utf-8")
    sources["ls/augment/com/DiagnosticPipelineBridge.java"] = '''package ls.augment.com;import android.content.Context;import android.os.Bundle;import java.io.*;import java.nio.charset.StandardCharsets;
public final class DiagnosticPipelineBridge{public static Bundle record(Context c,Bundle request){return DiagnosticStore.record(c,request);}public static String export(Context c){StringBuilder out=new StringBuilder();appendAtomicWorkbenchLog(out,c);return out.toString();}''' + "\n".join(member(export, s) for s in ("static void appendAtomicWorkbenchLog", "private static void file", "private static int lineCount")) + "}"
    gesture = (SRC / "hook/AtomicWorkbenchGestureHook.java").read_text(encoding="utf-8")
    assert 'entryWitness("submitted", side, user, revision, triggeredElapsed, "awaiting_ui_entry", null)' in gesture
    sources["ls/augment/com/hook/TestAtomicWorkbenchHookDiagnostics.java"] = TEST.replace("// ACTUAL_ENTRY_WITNESS", member(gesture,"private static void entryWitness("))
    feature = (SRC / "hook/FeatureSettings.java").read_text(encoding="utf-8")
    with tempfile.TemporaryDirectory(prefix="duo-workbench-hook-diagnostics-") as temporary:
        folder = Path(temporary)
        files = []
        for relative, content in sources.items():
            content = content.replace("__GRID_MEMORY_GETTER__", member(feature, "static String launcherGridRuntimeValue"))
            target = folder / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(content, encoding="utf-8")
            files.append(target)
        files += [SRC / (name + ".java") for name in ("HookTargetRegistry", "AtomicWorkbenchGesturePolicy", "AtomicWorkbenchLogPolicy", "ShoulderSwitchLogPolicy", "BoundedLog", "DiagnosticStore", "hook/HookTelemetry", "hook/HookTelemetryObserver")]
        cp = os.pathsep.join(map(str, (args.json_jar, args.api_jar)))
        suffix = ".exe" if os.name == "nt" else ""
        subprocess.run([str(args.java_home / ("bin/javac" + suffix)), "-encoding", "UTF-8", "--release", "17", "-cp", cp, "-d", str(folder), *map(str, files)], check=True)
        data = folder / "app-private"
        command = [str(args.java_home / ("bin/java" + suffix)), "-cp", str(folder) + os.pathsep + cp, "ls.augment.com.hook.TestAtomicWorkbenchHookDiagnostics", str(data)]
        subprocess.run(command, check=True, timeout=30)
        subprocess.run(command + ["read-after-exit"], check=True, timeout=30)


if __name__ == "__main__":
    main()
