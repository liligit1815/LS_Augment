"""Execute production diagnostic boundaries with host Android stubs; never run root commands."""
from pathlib import Path
import argparse
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"


def member(source, signature):
    start = source.index(signature)
    brace = source.index("{", start)
    end, depth = brace + 1, 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


STUBS = {
    "android/content/SharedPreferences.java": """package android.content;import java.util.Map;
public interface SharedPreferences {Map<String,?> getAll();String getString(String k,String d);int getInt(String k,int d);long getLong(String k,long d);Editor edit();
interface Editor {Editor putString(String k,String v);Editor putInt(String k,int v);Editor putLong(String k,long v);void apply();boolean commit();}}""",
    "android/content/Context.java": """package android.content;public abstract class Context {
public abstract SharedPreferences getSharedPreferences(String n,int mode);public abstract java.io.File getFilesDir();public Object getContentResolver(){return this;}}""",
    "android/app/Activity.java": """package android.app;public class Activity extends ls.augment.com.FakeContext {
public final java.util.concurrent.CountDownLatch finished=new java.util.concurrent.CountDownLatch(1);
public Activity(java.io.File dir){super(dir);}public void runOnUiThread(Runnable r){r.run();finished.countDown();}}""",
    "android/widget/Toast.java": """package android.widget;public class Toast {public static final int LENGTH_LONG=1;
public static Toast makeText(Object c,String v,int l){return new Toast();}public void show(){}}""",
    "android/os/SystemClock.java": """package android.os;public class SystemClock {public static long now=100000;
public static long elapsedRealtime(){return now;}public static void sleep(long delay){now+=delay;}}""",
    "android/provider/Settings.java": """package android.provider;public class Settings {public static class Global {
public static final String BOOT_COUNT="boot";public static int boot=7;public static int getInt(Object r,String key,int fallback){return boot;}}}""",
    "android/util/Log.java": """package android.util;public class Log {public static int failures;
public static int e(String tag,String message){failures++;return 0;}}""",
    "ls/augment/com/BuildConfig.java": """package ls.augment.com;final class BuildConfig {static final String VERSION_NAME="test20507";}""",
    "ls/augment/com/ResetWriteFence.java": """package ls.augment.com;final class ResetWriteFence {static boolean blocked(){return false;}}""",
    "ls/augment/com/AppConfig.java": """package ls.augment.com;final class AppConfig {static boolean synced=true,throwsOnMirror;static int attempts;
AppConfig(Object c){}RootShell.Result mirrorAll(){attempts++;if(throwsOnMirror)throw new IllegalStateException("test");return new RootShell.Result(synced?0:1,"",false);}}""",
    "ls/augment/com/FakeContext.java": """package ls.augment.com;import android.content.*;import java.util.*;
public class FakeContext extends Context {public java.io.File files;public boolean prefsUnavailable;public final Map<String,Prefs> stores=new HashMap<>();
public FakeContext(java.io.File f){files=f;}public java.io.File getFilesDir(){return files;}
public SharedPreferences getSharedPreferences(String n,int mode){if(prefsUnavailable)throw new IllegalStateException("prefs");return stores.computeIfAbsent(n,k->new Prefs());}
public static class Prefs implements SharedPreferences {public final Map<String,Object> values=new HashMap<>();public boolean commitFails;
public Map<String,?> getAll(){return new HashMap<>(values);}public String getString(String k,String d){Object v=values.get(k);return v instanceof String?(String)v:d;}
public int getInt(String k,int d){Object v=values.get(k);return v instanceof Number?((Number)v).intValue():d;}
public long getLong(String k,long d){Object v=values.get(k);return v instanceof Number?((Number)v).longValue():d;}
public Editor edit(){return new Editor(){final Map<String,Object> pending=new HashMap<>();
public Editor putString(String k,String v){pending.put(k,v);return this;}public Editor putInt(String k,int v){pending.put(k,v);return this;}
public Editor putLong(String k,long v){pending.put(k,v);return this;}public void apply(){values.putAll(pending);}public boolean commit(){apply();return !commitFails;}};}}}""",
}

TEST = r'''
package ls.augment.com;
import java.nio.file.*;import java.nio.charset.StandardCharsets;import java.util.*;import java.util.concurrent.*;import org.json.*;
public final class TestDiagnosticReliability {
 static int checks;static void yes(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
 static RootShell.Result raw(int code,String text,boolean complete,boolean failed,boolean truncated){return new RootShell.Result(code,text,false,new RootShell.CapturedOutput(text.getBytes(StandardCharsets.UTF_8),complete,failed,truncated));}
 static JSONObject snapshot()throws Exception{return new JSONObject().put("package","system").put("process","system").put("pid",321).put("sourceUid",1000)
   .put("moduleVersion",BuildConfig.VERSION_NAME).put("moduleLoaded",true).put("moduleLoadedElapsed",1000).put("receivedAt",System.currentTimeMillis()).put("receivedBoot",7);}
 static void install(FakeContext c,JSONObject value){((FakeContext.Prefs)c.getSharedPreferences("hook-processes",0)).values.put("pid_321",value.toString());}
 static void injection(Path dir)throws Exception{
  FakeContext c=new FakeContext(dir.toFile());install(c,snapshot());
  yes(!RuntimeEnvironment.injected(c),"missing lifecycle receipt remains unconfirmed");
  yes(BuildConfig.VERSION_NAME.equals(RuntimeEnvironment.telemetryVersion(c,"321")),"fresh authenticated telemetry backs up missing receipt");
  for(String field:new String[]{"sourceUid","pid","receivedBoot","moduleLoadedElapsed"}){
   JSONObject bad=snapshot().put(field,field.equals("moduleLoadedElapsed")?100001:999);install(c,bad);
   yes(RuntimeEnvironment.telemetryVersion(c,"321").isEmpty(),"reject telemetry mismatch "+field);
  }
  install(c,snapshot().put("receivedAt",System.currentTimeMillis()-60001));yes(RuntimeEnvironment.telemetryVersion(c,"321").isEmpty(),"stale telemetry cannot confirm injection");
  install(c,snapshot().put("moduleLoaded",false));yes(RuntimeEnvironment.telemetryVersion(c,"321").isEmpty(),"not loaded");
  install(c,snapshot().put("process","com.android.settings"));yes(RuntimeEnvironment.telemetryVersion(c,"321").isEmpty(),"system UID shared settings is not server");
  install(c,snapshot().put("moduleVersion","test20386"));yes("test20386".equals(RuntimeEnvironment.telemetryVersion(c,"321")),"old version remains distinguishable from installed version");
  yes(!BuildConfig.VERSION_NAME.equals(RuntimeEnvironment.telemetryVersion(c,"321")),"old telemetry cannot confirm current version");
  yes(RuntimeEnvironment.telemetryVersion(c,"").isEmpty(),"missing live PID cannot confirm");
  RuntimeEnvironment.record(c,1000,"version="+BuildConfig.VERSION_NAME+"|pid=321|loaderReady=1");yes(RuntimeEnvironment.injected(c),"current lifecycle receipt remains accepted");
  android.provider.Settings.Global.boot=8;yes(!RuntimeEnvironment.injected(c),"receipt cannot survive reboot");android.provider.Settings.Global.boot=7;
 }
 static void attribution()throws Exception{
  JSONObject legacy=new JSONObject().put("package","com.zte.cn.doubleapp").put("process","com.android.settings");
  Set<String> targets=DiagnosticExportHarness.currentPackages(legacy);yes(targets.containsAll(Set.of("com.android.settings","com.zte.cn.doubleapp")),"legacy shared process recovered");
  legacy.put("packages",new JSONArray(List.of("com.android.settings","com.zte.cn.doubleapp","com.android.settings","bad.package")));
  yes(DiagnosticExportHarness.currentPackages(legacy).size()==2,"registered target names deduplicated and invalid rejected");
  HookPackagesHarness.process="com.android.settings";HookPackagesHarness.ready("com.android.settings");HookPackagesHarness.ready("com.zte.cn.doubleapp");
  yes("com.android.settings".equals(HookPackagesHarness.pkg),"legacy label does not become last shared package");
  yes(HookPackagesHarness.names().length()==2,"every hosted target retained");HookPackagesHarness.ready("unscoped");yes(HookPackagesHarness.names().length()==2,"unscoped names excluded");
  RootShell.Result ps=raw(0,"PID NAME\n321 system_server\n4670 com.android.settings\nbad\n-1 fake",true,false,false);
  yes(DiagnosticExportHarness.processNames(ps).size()==2,"only valid process lines parsed");yes("321".equals(DiagnosticExportHarness.systemPid(DiagnosticExportHarness.processNames(ps))),"system server PID derived from observed process list");
  yes(DiagnosticExportHarness.processNames(raw(1,"321 system_server",true,false,false)).isEmpty(),"failed ps cannot supply live identity");
 }
 static void captures(){
  String empty=DiagnosticExportHarness.describe(raw(0,"",true,false,false),true,true);yes(empty.contains("status=READ")&&empty.contains("filterState=EMPTY_INPUT")&&empty.contains("lines=0"),"empty input is readable, not one metadata event");
  String noMatch=DiagnosticExportHarness.describe(raw(0,"other framework line",true,false,false),true,true);yes(noMatch.contains("filterState=NO_MATCHES")&&noMatch.contains("lines=0")&&!noMatch.contains("READ_FAILED"),"read success and no module matches separated");
  String failed=DiagnosticExportHarness.describe(raw(1,"tail: Permission denied",true,false,false),true,true);yes(failed.contains("status=READ_FAILED")&&failed.contains("NOT_RUN_READ_FAILED")&&failed.contains("Permission denied"),"raw read failure is retained");
  RootShell.Result bounded=raw(0,"LS_Augment FEATURE_AI detail",true,false,true);String trimmed=DiagnosticExportHarness.describe(bounded,true,true);
  yes(trimmed.contains("upstreamTruncated=true")&&trimmed.contains("captureState=TRUNCATED")&&trimmed.contains("limitReachedOrPossiblyTruncated=true")&&trimmed.contains("lines=0"),"original truncation survives filtering to empty");
  yes(DiagnosticExportHarness.filterIdentity(bounded)==bounded.capture,"original capture proof retained");
  yes(DiagnosticExportHarness.describe(raw(0,"LS_Augment normal",false,true,false),false,false).contains("upstreamReadFailed=true"),"capture read failure remains visible despite command exit zero");
  String synthetic=DiagnosticExportHarness.describe(new RootShell.Result(0,"",false),false,false);yes(synthetic.contains("captureState=UNVERIFIED")&&synthetic.contains("upstreamTruncated=UNKNOWN"),"synthetic results do not invent capture completeness");
  String matches=DiagnosticExportHarness.describe(raw(0,"LS_Augment normal\nLS_Augment SHOULDER detail\nother",true,false,false),true,true);yes(matches.contains("filterState=MATCHES")&&matches.contains("lines=1")&&!matches.contains("SHOULDER detail"),"feature filter removes excluded detail and counts events only");
 }
 static void limits(){
  yes(DiagnosticWritePolicy.normalize("ls_augment_test","x".repeat(2000)).length()==2000,"exact limit remains complete");
  String cut=DiagnosticWritePolicy.normalize("ls_augment_test","x".repeat(2001));yes(cut.length()==2000&&cut.endsWith(" [TRUNCATED]"),"ordinary truncation marked within budget");
  String large=DiagnosticWritePolicy.normalize("ls_augment_rm_support_test","x".repeat(32769));yes(large.length()==32768&&large.endsWith(" [TRUNCATED]"),"support budget marked");
  String pair=DiagnosticWritePolicy.normalize("ls_augment_test","x".repeat(1987)+"😀"+"x".repeat(20));yes(pair.endsWith(" [TRUNCATED]")&&pair.length()==1999,"surrogate boundary kept whole");
  yes("a b c".equals(DiagnosticWritePolicy.normalize("ls_augment_test","a\rb\nc")),"single line normalization retained");
 }
 static void audit(Path dir)throws Exception{
  FakeContext c=new FakeContext(dir.toFile());yes(AuditLog.writeDurable(c,"TEST_DURABLE","before restart"),"durable log write");yes(AuditLog.read(c).contains("before restart"),"durable event present");
  Path invalid=dir.resolve("not-directory");Files.writeString(invalid,"file");c.files=invalid.toFile();AuditLog.write(c,"RETRY","same failure");
  String failure=AuditLog.failureStatus(c);yes(failure.contains("writeFailures=1")&&failure.contains("lastWriteError=FileNotFoundException"),"disk failure recorded outside failed log");yes(android.util.Log.failures==1,"failure also visible in module logcat");
  c.files=dir.toFile();AuditLog.write(c,"RETRY","same failure");yes(AuditLog.read(c).contains("same failure"),"failed event can be retried without repeat suppression");
  FakeContext unavailable=new FakeContext(invalid.toFile());unavailable.prefsUnavailable=true;AuditLog.write(unavailable,"FAILED","metadata failure");yes(AuditLog.failureStatus(unavailable).contains("failureMetadata=UNAVAILABLE"),"unavailable metadata has in-process evidence");
 }
 static void restart(Path dir)throws Exception{
  AppConfig.synced=true;AppConfig.throwsOnMirror=false;RootShell.calls=0;
  android.app.Activity successful=new android.app.Activity(dir.toFile());RootShell.inspection=()->yes(AuditLog.read(successful).contains("[SCOPE_RESTART_COMMAND]"),"command issue audit exists before RootShell");
  ScopeRestartHarness.run(successful,"launcher");yes(successful.finished.await(5,TimeUnit.SECONDS),"restart completed");
  String events=AuditLog.read(successful);yes(RootShell.calls==1&&events.contains("[SCOPE_RESTART_REQUEST]")&&events.contains("[SCOPE_RESTART_COMMAND_RESULT]")&&events.contains("command_return_not_process_restart_proof"),"manual request and command result logged with evidence boundary");
  AppConfig.synced=false;AppConfig.attempts=0;RootShell.calls=0;android.app.Activity blocked=new android.app.Activity(dir.toFile());ScopeRestartHarness.run(blocked,"systemui");yes(blocked.finished.await(5,TimeUnit.SECONDS),"blocked restart completed");yes(RootShell.calls==0&&AppConfig.attempts==25&&AuditLog.read(blocked).contains("[SCOPE_RESTART_BLOCKED]"),"unsynced configuration cannot issue restart");
  AppConfig.throwsOnMirror=true;android.app.Activity thrown=new android.app.Activity(dir.toFile());ScopeRestartHarness.run(thrown,"settings");yes(thrown.finished.await(5,TimeUnit.SECONDS),"restart exception reported");yes(AuditLog.read(thrown).contains("[SCOPE_RESTART_ERROR]"),"restart exception has audit evidence");
 }
 public static void main(String[] args)throws Exception{Path dir=Files.createTempDirectory("duo-diagnostic-boundaries-");try{injection(dir);attribution();captures();limits();audit(dir);restart(dir);System.out.println("PASS diagnostic reliability: "+checks+" checks (production methods; no root/device commands)");}finally{try(var paths=Files.walk(dir)){for(Path p:paths.sorted(Comparator.reverseOrder()).toList())Files.deleteIfExists(p);}}}
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", type=Path, help="JDK root directory; defaults to JAVA_HOME or javac/java on PATH")
    parser.add_argument("--json-jar", type=Path, help="Existing org.json jar; defaults to JSON_JAR")
    args = parser.parse_args()
    jdk = args.jdk or (Path(os.environ["JAVA_HOME"]) if os.environ.get("JAVA_HOME") else None)
    suffix = ".exe" if os.name == "nt" else ""
    if jdk is not None:
        javac = str(jdk / "bin" / ("javac" + suffix))
        java = str(jdk / "bin" / ("java" + suffix))
        if not Path(javac).is_file() or not Path(java).is_file():
            parser.error(f"JDK tools not found under {jdk}/bin; pass --jdk or set JAVA_HOME to a JDK root")
    else:
        javac, java = shutil.which("javac"), shutil.which("java")
        if not javac or not java:
            parser.error("JDK required; pass --jdk, set JAVA_HOME, or put javac and java on PATH")
    json_path = args.json_jar or os.environ.get("JSON_JAR")
    if not json_path:
        parser.error("org.json jar required; pass --json-jar /path/to/json.jar or set JSON_JAR")
    json_jar = Path(json_path).expanduser()
    if not json_jar.is_file():
        parser.error(f"org.json jar not found: {json_jar}; pass --json-jar /path/to/json.jar or set JSON_JAR")
    export = (SRC / "DiagnosticExport.java").read_text(encoding="utf-8")
    telemetry = (SRC / "hook/HookTelemetry.java").read_text(encoding="utf-8")
    root_shell = (SRC / "RootShell.java").read_text(encoding="utf-8")
    restart = (SRC / "ScopeRestartDialog.java").read_text(encoding="utf-8")
    sources = dict(STUBS)
    sources["ls/augment/com/RootShell.java"] = """package ls.augment.com;import java.nio.charset.StandardCharsets;
final class RootShell {static int calls;static Runnable inspection;static Result run(String c,String i,long t,int m){calls++;if(inspection!=null)inspection.run();return new Result(0,"",false);}
""" + member(root_shell, "static final class CapturedOutput") + member(root_shell, "static final class Result") + "}"
    signatures = ("static Map<Integer,String> processNames", "static String systemPid", "static Set<String> currentPackages",
                  "private static RootShell.Result filter", "private static void source(StringBuilder out,String name,RootShell.Result result,int limit,boolean values,boolean filtered)", "private static int lineCount")
    sources["ls/augment/com/DiagnosticExportHarness.java"] = """package ls.augment.com;import java.util.*;import java.nio.charset.StandardCharsets;import org.json.*;
final class DiagnosticExportHarness {private static String diagnosticValues(String raw){return raw;}
static String describe(RootShell.Result raw,boolean filtered,boolean moduleOnly){StringBuilder out=new StringBuilder();source(out,"TEST",filtered?filter(raw,false,false,moduleOnly):raw,1024,false,filtered);return out.toString();}
static RootShell.CapturedOutput filterIdentity(RootShell.Result raw){return filter(raw,false,false,true).capture;}
""" + "\n".join(member(export, s) for s in signatures) + "}"
    sources["ls/augment/com/HookPackagesHarness.java"] = """package ls.augment.com;import java.util.*;import java.util.concurrent.*;import org.json.*;
final class HookPackagesHarness {static String process="unknown",pkg="unknown";private static final Set<String> packages=ConcurrentHashMap.newKeySet();static JSONArray names(){return packageNames();}
""" + member(telemetry, "static void ready") + member(telemetry, "private static JSONArray packageNames") + "}"
    constants = """static final String SETTINGS="settings",SYSTEM_UI="systemui",LAUNCHER="launcher",DEVICE="device",APPS="apps",GAMES="games",FAN="fan";"""
    sources["ls/augment/com/ScopeRestartHarness.java"] = """package ls.augment.com;import android.app.Activity;import android.widget.Toast;import java.util.concurrent.*;
final class ScopeRestartHarness {""" + constants + "static void run(Activity a,String scope){restart(a,scope);}" + member(restart, "private static void restart") + member(restart, "private static String command") + "}"
    sources["ls/augment/com/TestDiagnosticReliability.java"] = TEST
    with tempfile.TemporaryDirectory(prefix="duo-diagnostic-reliability-") as name:
        directory = Path(name)
        files = []
        for relative, content in sources.items():
            path = directory / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            files.append(path)
        files += [SRC / (name + ".java") for name in ("RuntimeEnvironment", "ModuleRuntimeStatus", "DiagnosticEvidencePolicy", "DiagnosticWritePolicy", "HookTargetRegistry", "AuditLog", "BoundedLog", "LogRepeatPolicy")]
        subprocess.run([javac, "-encoding", "UTF-8", "--release", "17", "-cp", str(json_jar), "-d", str(directory), *map(str, files)], check=True)
        subprocess.run([java, "-cp", str(directory) + os.pathsep + str(json_jar), "ls.augment.com.TestDiagnosticReliability"], check=True, timeout=30)


if __name__ == "__main__":
    main()
