"""Exercise phone diagnostic transport, retention, reset fencing and offline export on the JVM."""
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
    end = source.index("{", start) + 1
    depth = 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


STUBS = {
    "android/content/Context.java": """package android.content;public abstract class Context {
 public abstract java.io.File getFilesDir();public abstract SharedPreferences getSharedPreferences(String n,int mode);}""",
    "android/content/ComponentName.java": """package android.content;public class ComponentName {public String flattenToString(){return "example.app/.Main";}}""",
    "android/content/SharedPreferences.java": """package android.content;public interface SharedPreferences {
 long getLong(String k,long d);String getString(String k,String d);Editor edit();interface Editor {
 Editor putLong(String k,long v);Editor putString(String k,String v);boolean commit();}}""",
    "android/os/Process.java": """package android.os;public class Process {
 public static int uid=10123;public static int myUid(){return uid;}public static int myPid(){return 3456;}}""",
    "android/os/SystemClock.java": """package android.os;public class SystemClock {public static long elapsedRealtime(){return 12345;}}""",
    "android/util/Log.java": """package android.util;public class Log {public static int e(String tag,String value){return 0;}}""",
    "ls/augment/com/BuildConfig.java": """package ls.augment.com;final class BuildConfig {static final String VERSION_NAME="diagnostic-test";}""",
    "ls/augment/com/AuditLog.java": """package ls.augment.com;final class AuditLog {static String failureStatus(android.content.Context c){return "unused";}}""",
    "ls/augment/com/DiagnosticStore.java": """package ls.augment.com;final class DiagnosticStore {static final int DETAIL_MAX_BYTES=512*1024;}""",
    "ls/augment/com/TestContext.java": r'''package ls.augment.com;import android.content.*;import java.io.*;import java.util.*;
final class TestContext extends Context {
 final File files,metadata;boolean failMetadata;TestContext(File dir){this(dir,dir);}TestContext(File dir,File meta){files=dir;metadata=meta;}
 public File getFilesDir(){return files;}public SharedPreferences getSharedPreferences(String n,int mode){if(failMetadata)throw new IllegalStateException("unavailable");return new Prefs(new File(metadata,n+".properties"));}
 static final class Prefs implements SharedPreferences {
 final File file;final Properties values=new Properties();Prefs(File f){file=f;if(f.isFile())try(FileInputStream in=new FileInputStream(f)){values.load(in);}catch(Exception e){throw new IllegalStateException(e);}}
 public long getLong(String k,long d){return Long.parseLong(values.getProperty(k,Long.toString(d)));}public String getString(String k,String d){return values.getProperty(k,d);}
 public Editor edit(){return new Editor(){final Properties pending=new Properties();public Editor putLong(String k,long v){pending.setProperty(k,Long.toString(v));return this;}
 public Editor putString(String k,String v){pending.setProperty(k,v);return this;}public boolean commit(){values.putAll(pending);try(FileOutputStream out=new FileOutputStream(file)){values.store(out,"");return true;}catch(Exception e){return false;}}};}}
}''',
}

TEST = r'''package ls.augment.com;
import java.io.*;import java.nio.charset.StandardCharsets;import java.nio.file.*;import java.util.*;import org.json.*;
public final class TestAtomicWorkbenchDiagnostics {
 static int checks;static void yes(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static String read(TestContext c)throws Exception{return Files.readString(new File(c.files,AtomicWorkbenchDiagnostics.FILE_NAME).toPath(),StandardCharsets.UTF_8);}
 static List<JSONObject> records(String lines){List<JSONObject> list=new ArrayList<>();for(String line:lines.split("\\n"))if(!line.isBlank())list.add(new JSONObject(line));return list;}
 static void record(TestContext c,String event,String detail){AtomicWorkbenchDiagnostics.record(c,ResetWriteFence.generation(),event,2,0,"example.app/.Main",9,detail,null);}
 static void run(Path dir)throws Exception{
  TestContext c=new TestContext(dir.toFile());String token="1234567890abcdef".repeat(4);PrintStream real=System.out;
  ByteArrayOutputStream pipe=new ByteArrayOutputStream();android.os.Process.uid=0;
  try{System.setOut(new PrintStream(pipe,true,StandardCharsets.UTF_8));
   AtomicWorkbenchDiagnostics.emit("START_FAILED",2,0,"example.app/.Main",9,"task=31;token="+token,new IllegalStateException("extras=private app body"));
   yes(AtomicWorkbenchDiagnostics.flush(1000),"asynchronous ROOT event drained");
  }finally{System.setOut(real);}
  String wire=pipe.toString(StandardCharsets.UTF_8).trim();
  yes(wire.startsWith(AtomicWorkbenchDiagnostics.PREFIX),"ROOT wire prefix");yes(!wire.contains(token)&&!wire.contains("private app body"),"no token or exception-message payload on root pipe");
  yes(!new File(c.files,AtomicWorkbenchDiagnostics.FILE_NAME).exists(),"ROOT emit never touches app files");
  record(c,"ROOT_MUST_NOT_WRITE","");yes(!new File(c.files,AtomicWorkbenchDiagnostics.FILE_NAME).exists(),"ROOT cannot invoke app sink");
  android.os.Process.uid=10123;
  JSONObject original=new JSONObject(wire.substring(AtomicWorkbenchDiagnostics.PREFIX.length()));original.put("token",token).put("intentExtras","do not persist");
  AtomicWorkbenchDiagnostics.retainOutput(c,ResetWriteFence.generation(),0,AtomicWorkbenchDiagnostics.PREFIX+original,token,false);
  List<JSONObject> events=records(read(c));JSONObject event=events.get(0);
  yes(event.getString("source").equals("ROOT")&&event.getInt("uid")==0,"emitter identity preserved");
  yes(event.getInt("window")==2&&event.getInt("display")==9&&event.getString("package").equals("example.app"),"app/window/display metadata preserved");
  yes(event.getString("errorStack").contains("IllegalStateException")&&!event.has("intentExtras")&&!event.has("token"),"allowlist and bounded error stack");
  yes(event.has("rootSequence")&&event.getInt("rootQueueCapacity")==64&&event.getLong("rootDroppedEvents")==0,"delivery counters survive client allowlist");
  for(String code:new String[]{"protected","stale","cancelled","expired","unavailable","rejected","busy","invalid_reply"}){
   String reason="extraction_geometry_"+code;
   yes(AtomicWorkbenchDiagnostics.reason(new java.util.concurrent.ExecutionException(new IOException(reason))).equals(reason),"nested extraction refusal retained "+code);
   AtomicWorkbenchDiagnostics.record(c,ResetWriteFence.generation(),"GEOMETRY_FAILURE",2,0,"",9,"",new IOException(reason));
   yes(read(c).contains("\"errorReason\":\""+reason+"\""),"reason written to exported log");
  }
  JSONObject reasonEvent=new JSONObject(original.toString()).put("errorReason","extraction_geometry_busy");
  AtomicWorkbenchDiagnostics.retainOutput(c,ResetWriteFence.generation(),0,AtomicWorkbenchDiagnostics.PREFIX+reasonEvent,token,false);
  yes(read(c).contains("extraction_geometry_busy"),"root wire retains known reason");
  yes(AtomicWorkbenchDiagnostics.reason(new IOException("extraction_geometry_private_payload")).isEmpty(),"unknown exception content omitted");
  yes(event.getString("rootSessionId").matches("[a-f0-9-]{36}"),"diagnostic process session survives without authentication token");
  JSONObject startRecord=new JSONObject(original.toString()).put("event","ROOT_START").put("rootSequence",1);
  JSONObject end=new JSONObject(original.toString()).put("event","ROOT_LOOP_EXIT").put("rootSequence",3);
  String coverage=AtomicWorkbenchDiagnostics.summarizeSessions(startRecord+"\n"+end);
  JSONObject complete=new JSONObject(coverage.split("\n")[1]);
  yes(complete.getBoolean("startRetained")&&complete.getBoolean("terminalRetained")&&complete.getLong("sequenceGaps")==1,"start/end/gaps come from retained events, not inferred success");
  coverage=AtomicWorkbenchDiagnostics.summarizeSessions(startRecord.toString());
  yes(coverage.contains("UNKNOWN")&&!new JSONObject(coverage.split("\n")[1]).getBoolean("terminalRetained"),"missing tail never claims successful cleanup or a crash");
  JSONObject reusedPid=new JSONObject(startRecord.toString()).put("rootSessionId", "00000000-0000-0000-0000-000000000000");
  coverage=AtomicWorkbenchDiagnostics.summarizeSessions(startRecord+"\n"+reusedPid);
  yes(coverage.split("\n").length==3,"same PID different root sessions remain distinct");
  JSONObject legacy=new JSONObject(startRecord.toString());legacy.remove("rootSessionId");
  coverage=AtomicWorkbenchDiagnostics.summarizeSessions(legacy+"\nmalformed");
  yes(coverage.contains("LEGACY_PID_ONLY")&&coverage.contains("malformed=1"),"legacy identity and malformed coverage are explicit");
  JSONObject injected=new JSONObject(original.toString()).put("rootSessionId", "private app body");
  AtomicWorkbenchDiagnostics.retainOutput(c,ResetWriteFence.generation(),0,AtomicWorkbenchDiagnostics.PREFIX+injected,token,false);
  yes(!read(c).contains("private app body"),"untrusted diagnostic session field rejected");
  AtomicWorkbenchDiagnostics.retainOutput(c,ResetWriteFence.generation(),0,"su: permission denied token="+token,token,false);
  AtomicWorkbenchDiagnostics.retainOutput(c,ResetWriteFence.generation(),0,"java.lang.SecurityException: Intent { extras=private clipboard body",token,false);
  AtomicWorkbenchDiagnostics.retainOutput(c,ResetWriteFence.generation(),0,AtomicWorkbenchDiagnostics.PREFIX+"{token: secret-malformed",token,false);
  AtomicWorkbenchDiagnostics.retainOutput(c,ResetWriteFence.generation(),0,AtomicWorkbenchDiagnostics.PREFIX+"{secret-truncated",token,true);
  AtomicWorkbenchDiagnostics.retainOutput(c,ResetWriteFence.generation(),0,"A".repeat(200)+token.substring(0,31),token,true);
  String retained=read(c);yes(!retained.contains(token)&&!retained.contains("clipboard body")&&!retained.contains("secret-malformed")&&!retained.contains("secret-truncated"),"bootstrap and malformed payload redaction");
  yes(!retained.contains(token.substring(0,31)),"truncated credential suffix omitted");
  yes(retained.contains("ROOT_BOOTSTRAP")&&retained.contains("ROOT_EVENT_MALFORMED")&&retained.contains("ROOT_EVENT_TRUNCATED"),"output source and malformed/truncated evidence visible");
  record(c,"OPEN_RESULT","success=true;state=active;firstFrame=UNVERIFIED");
  String exported=ExportHarness.export(c);yes(exported.contains("SOURCE ATOMIC_WORKBENCH")&&exported.contains("firstFrame=UNVERIFIED"),"always-on offline export preserves evidence limits");
  ClientDrainHarness drain=new ClientDrainHarness(c);drain.closed=true;drain.start();drain.process.finish();
  yes(drain.pending.ready.await(2,java.util.concurrent.TimeUnit.SECONDS),"root exit watcher completed after client close");
  JSONObject late=new JSONObject(original.toString()).put("event","LATE_ROOT_CLEANUP");
  drain.process.send(AtomicWorkbenchDiagnostics.PREFIX+late+"\n");drain.process.output.close();
  long deadline=System.nanoTime()+java.util.concurrent.TimeUnit.SECONDS.toNanos(2);
  while(!read(c).contains("LATE_ROOT_CLEANUP")&&System.nanoTime()<deadline)Thread.sleep(5);
  yes(read(c).contains("ROOT_EXIT")&&read(c).contains("LATE_ROOT_CLEANUP"),"drain retains late root cleanup after exit and closed client");
  long generation=ResetWriteFence.generation(),before=new File(c.files,AtomicWorkbenchDiagnostics.FILE_NAME).length();
  ResetWriteFence.begin();try{AtomicWorkbenchDiagnostics.record(c,generation,"BLOCKED_DURING_RESET",0,0,"",-1,"",null);}finally{ResetWriteFence.end();}
  AtomicWorkbenchDiagnostics.record(c,generation,"BLOCKED_AFTER_RESET",0,0,"",-1,"",null);
  yes(new File(c.files,AtomicWorkbenchDiagnostics.FILE_NAME).length()==before,"old client cannot write during or after reset");
  for(int i=0;i<600;i++)record(c,"ROTATE","index="+i+";unicode=中文;"+"z".repeat(900));
  record(c,"LAST_RECORD","last=true");File file=new File(c.files,AtomicWorkbenchDiagnostics.FILE_NAME);
  yes(file.length()<=AtomicWorkbenchDiagnostics.MAX_BYTES,"file byte limit");
  retained=read(c);events=records(retained);yes(events.get(events.size()-1).getString("event").equals("LAST_RECORD"),"latest complete JSON retained after rotation");
  yes(!retained.contains("\ufffd")&&c.getSharedPreferences("diagnostic-retention",0).getLong("atomic_workbench_rotations",0)>0,"UTF-8 rotation and persistent rotation count");
  File invalid=new File(dir.toFile(),"not-directory");Files.writeString(invalid.toPath(),"occupied");TestContext bad=new TestContext(invalid,dir.toFile());
  record(bad,"FAILURE_ISOLATION","");String state=AtomicWorkbenchDiagnostics.writeState(c);
  yes(state.contains("writeFailures=1")&&state.contains("latestFailureMetadataPersisted=true"),"write failure is isolated and persisted");
  bad.failMetadata=true;record(bad,"FAILURE_ISOLATION","");yes(AtomicWorkbenchDiagnostics.writeState(bad).contains("failureMetadata=UNAVAILABLE"),"double failure has in-process fallback");
  try{System.setOut(new PrintStream(new ByteArrayOutputStream()){@Override public void println(String s){throw new IllegalStateException("broken pipe");}});
   AtomicWorkbenchDiagnostics.emit("BROKEN_PIPE",-1,0,"",-1,"",null);
   yes(AtomicWorkbenchDiagnostics.flush(1000),"broken pipe cannot strand pending events");
  }finally{System.setOut(real);}
  ByteArrayOutputStream recovered=new ByteArrayOutputStream();
  try{System.setOut(new PrintStream(recovered,true,StandardCharsets.UTF_8));
   AtomicWorkbenchDiagnostics.emit("PIPE_RECOVERED",-1,0,"",-1,"",null);yes(AtomicWorkbenchDiagnostics.flush(1000),"recovered pipe drained");
  }finally{System.setOut(real);}
  JSONObject recoveredEvent=new JSONObject(recovered.toString(StandardCharsets.UTF_8).trim().substring(AtomicWorkbenchDiagnostics.PREFIX.length()));
  yes(recoveredEvent.getLong("rootPipeFailures")>0&&recoveredEvent.getLong("rootDroppedEvents")>0,"later successful event discloses prior pipe failure and loss");
  java.util.concurrent.CountDownLatch entered=new java.util.concurrent.CountDownLatch(1),release=new java.util.concurrent.CountDownLatch(1);
  ByteArrayOutputStream blockedBytes=new ByteArrayOutputStream();
  PrintStream blocked=new PrintStream(blockedBytes,true,StandardCharsets.UTF_8){@Override public void println(String line){
   entered.countDown();try{release.await();}catch(InterruptedException e){Thread.currentThread().interrupt();}super.println(line);}};
  try{System.setOut(blocked);AtomicWorkbenchDiagnostics.emit("BLOCK_HEAD",-1,0,"",-1,"",null);
   yes(entered.await(2,java.util.concurrent.TimeUnit.SECONDS),"worker reached blocked pipe");
   long start=System.nanoTime();for(int i=0;i<100;i++)AtomicWorkbenchDiagnostics.emit("BACKPRESSURE",-1,0,"",-1,"index="+i,null);
   yes(System.nanoTime()-start<java.util.concurrent.TimeUnit.SECONDS.toNanos(1),"business emit does not wait for blocked output");
   var pendingField=AtomicWorkbenchDiagnostics.class.getDeclaredField("rootPending");pendingField.setAccessible(true);
   yes(((java.util.concurrent.atomic.AtomicInteger)pendingField.get(null)).get()<=64,"bounded pending queue includes in-flight event");
   start=System.nanoTime();yes(!AtomicWorkbenchDiagnostics.flush(25),"flush reports incomplete delivery on backpressure");
   yes(System.nanoTime()-start<java.util.concurrent.TimeUnit.MILLISECONDS.toNanos(500),"flush waits only to its deadline");
   release.countDown();yes(AtomicWorkbenchDiagnostics.flush(2000),"queue drains after pipe recovery");
  }finally{release.countDown();System.setOut(real);}
  long previous=-1,observedDrops=0;int delivered=0;
  for(String line:blockedBytes.toString(StandardCharsets.UTF_8).split("\\n")){if(line.isBlank())continue;
   JSONObject item=new JSONObject(line.substring(AtomicWorkbenchDiagnostics.PREFIX.length()));long sequence=item.getLong("rootSequence");
   if(sequence<=previous)throw new AssertionError("asynchronous order changed");previous=sequence;observedDrops=Math.max(observedDrops,item.getLong("rootDroppedEvents"));delivered++;}
  yes(delivered==64&&observedDrops>=37,"ordered bounded events and overflow losses are visible after recovery");
  System.out.println("PASS atomic workbench diagnostics: "+checks+" assertions");
 }
 public static void main(String[] args)throws Exception{
  Path dir=Path.of(args[0]);if(args.length>1){TestContext c=new TestContext(dir.toFile());String out=ExportHarness.export(c);
   yes(out.contains("LAST_RECORD")&&out.contains("writeFailures=1"),"fresh JVM can export prior process records and failure metadata");
   System.out.println("PASS atomic workbench diagnostics survive application process exit");
  }else run(dir);
 }
}'''


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--jdk", default=os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8"))
    parser.add_argument("--json-jar", default=os.environ.get("JSON_JAR"))
    args = parser.parse_args()
    jdk = Path(args.jdk)
    suffix = ".exe" if os.name == "nt" else ""
    javac = str(jdk / "bin" / ("javac" + suffix)) if jdk.is_dir() else shutil.which("javac")
    java = str(jdk / "bin" / ("java" + suffix)) if jdk.is_dir() else shutil.which("java")
    jars = list((Path.home() / ".gradle/caches/modules-2/files-2.1/org.json/json").glob("*/*/*.jar"))
    json_jar = Path(args.json_jar) if args.json_jar else jars[0] if jars else None
    if not javac or not java or json_jar is None or not json_jar.is_file():
        parser.error("JDK and org.json jar required; pass --jdk / --json-jar")
    export = (SRC / "DiagnosticExport.java").read_text(encoding="utf-8")
    assert "appendAtomicWorkbenchLog(out,context);" in export
    sources = dict(STUBS)
    sources['ls/augment/com/LogHistory.java']='package ls.augment.com;final class LogHistory {static final Object LOCK=new Object();static boolean old(android.content.Context c,long wall){return false;}}'
    sources["ls/augment/com/ExportHarness.java"] = """package ls.augment.com;import android.content.Context;import java.io.*;import java.nio.charset.StandardCharsets;
final class ExportHarness {static String export(Context c){StringBuilder out=new StringBuilder();appendAtomicWorkbenchLog(out,c);return out.toString();}
""" + "\n".join(member(export, s) for s in ("static void appendAtomicWorkbenchLog", "private static void file", "private static int lineCount")) + "}"
    sources["ls/augment/com/TestAtomicWorkbenchDiagnostics.java"] = TEST
    client = (SRC / "AtomicWorkbenchClient.java").read_text(encoding="utf-8")
    sources["ls/augment/com/ClientDrainHarness.java"] = r'''package ls.augment.com;
import android.content.*;import java.io.*;import java.nio.charset.StandardCharsets;
final class ClientDrainHarness {
 static final int MAX_OUTPUT_LINE=AtomicWorkbenchDiagnostics.MAX_WIRE_CHARS;final Context application;
 final long diagnosticGeneration=ResetWriteFence.generation();final Pending pending=new Pending();
 final Child process=new Child();volatile boolean closed;
 ClientDrainHarness(Context c)throws IOException{application=c;}void start(){startOutputDrain();startExitWatcher();}
 void reportFailure(String message){record("CONNECTION_FAILURE",-1,null,-1,message,null);}
 static final class Pending {final int userId=0;final String token="1234567890abcdef".repeat(4);final java.util.concurrent.CountDownLatch ready=new java.util.concurrent.CountDownLatch(1);}
 static final class Child extends java.lang.Process {
  final PipedInputStream input=new PipedInputStream();final PipedOutputStream output;
  final java.util.concurrent.CountDownLatch exited=new java.util.concurrent.CountDownLatch(1);
  Child()throws IOException{output=new PipedOutputStream(input);}void send(String s)throws IOException{output.write(s.getBytes(StandardCharsets.UTF_8));output.flush();}
  void finish(){exited.countDown();}public InputStream getInputStream(){return input;}public InputStream getErrorStream(){return InputStream.nullInputStream();}
  public OutputStream getOutputStream(){return OutputStream.nullOutputStream();}public int waitFor()throws InterruptedException{exited.await();return 0;}public int exitValue(){return 0;}public void destroy(){finish();}
 }
''' + "\n".join(member(client, s) for s in ("private void startOutputDrain", "private void startExitWatcher", "private void retainDiagnostic", "private void record")) + "}"
    with tempfile.TemporaryDirectory(prefix="duo-atomic-diagnostics-") as tmp:
        directory = Path(tmp)
        files = []
        for relative, content in sources.items():
            path = directory / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            files.append(path)
        files += [SRC / (name + ".java") for name in ("AtomicWorkbenchDiagnostics", "AtomicWorkbenchLogPolicy", "BoundedLog", "ResetWriteFence")]
        subprocess.run([javac, "-encoding", "UTF-8", "--release", "17", "-cp", str(json_jar), "-d", tmp, *map(str, files)], check=True)
        data = directory / "app-private"
        data.mkdir()
        command = [java, "-cp", tmp + os.pathsep + str(json_jar), "ls.augment.com.TestAtomicWorkbenchDiagnostics", str(data)]
        subprocess.run(command, check=True, timeout=30)
        subprocess.run(command + ["read-after-exit"], check=True, timeout=30)


if __name__ == "__main__":
    main()
