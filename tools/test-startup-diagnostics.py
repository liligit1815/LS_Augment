"""Exercise production startup queue, private store and root entry against unavailable transports."""
from pathlib import Path
import argparse
import os
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
STUBS = {
'android/os/ParcelFileDescriptor.java': '''package android.os;public class ParcelFileDescriptor{}''',
'android/content/pm/ApplicationInfo.java': '''package android.content.pm;public class ApplicationInfo{}''',
'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle{final Map<String,Object> data=new HashMap<>();public void putString(String k,String v){data.put(k,v);}public String getString(String k){return (String)data.get(k);}public String getString(String k,String d){return (String)data.getOrDefault(k,d);}public void putBoolean(String k,boolean v){data.put(k,v);}public boolean getBoolean(String k,boolean d){return (Boolean)data.getOrDefault(k,d);}}''',
'android/os/SystemClock.java': '''package android.os;public class SystemClock{public static long now=1000;public static long elapsedRealtime(){return now;}}''',
'android/os/Process.java': '''package android.os;public class Process{public static final int SYSTEM_UID=1000;public static int myPid(){return 1234;}public static int myUid(){return 1000;}public static long getStartElapsedRealtime(){return 10;}}''',
'android/os/Binder.java': '''package android.os;public class Binder{public static int getCallingPid(){return 1234;}public static int getCallingUid(){return 1000;}}''',
'android/os/Build.java': '''package android.os;public class Build{public static class VERSION{public static final int SDK_INT=36;}}''',
'android/net/Uri.java': '''package android.net;public class Uri{public static Uri parse(String s){return new Uri();}}''',
'android/content/SharedPreferences.java': '''package android.content;public interface SharedPreferences{long getLong(String k,long d);Editor edit();interface Editor{Editor putLong(String k,long v);void apply();}}''',
'android/content/Context.java': '''package android.content;import java.io.*;public class Context{public static File folder;public final ContentResolver resolver=new ContentResolver(this);public ContentResolver getContentResolver(){return resolver;}public File getFilesDir(){return folder;}public SharedPreferences getSharedPreferences(String n,int m){return new SharedPreferences(){public long getLong(String k,long d){return d;}public Editor edit(){return new Editor(){public Editor putLong(String k,long v){return this;}public void apply(){}};}};}}''',
'android/content/ContentResolver.java': '''package android.content;import android.net.Uri;import android.os.Bundle;public class ContentResolver{final Context context;public int calls;public boolean fail,missing,reject,lostReply;public ContentResolver(Context c){context=c;}public Bundle call(Uri u,String m,String a,Bundle e){calls++;if(fail)throw new IllegalStateException("fixture provider unavailable",new java.net.UnknownHostException("provider cause"));if(missing)return null;if(reject){Bundle r=new Bundle();r.putString("reason","CALLER_DENIED");return r;}Bundle r=ls.augment.com.TestStartupDiagnostics.store(context,e);if(lostReply){lostReply=false;throw new IllegalStateException("reply lost after append");}return r;}}''',
'android/app/ActivityThread.java': '''package android.app;public class ActivityThread{public static android.content.Context app;public static Object currentApplication(){return app;}public static Object currentActivityThread(){return null;}public android.content.Context getSystemContext(){return app;}}''',
'android/util/Log.java': '''package android.util;public class Log{public static final int ERROR=6,INFO=4;public static boolean fail;public static final java.util.List<String> lines=new java.util.concurrent.CopyOnWriteArrayList<>();public static int println(int p,String t,String s){if(fail)throw new IllegalStateException("logcat sink fixture");lines.add(s);return 0;}public static int e(String t,String s,Throwable e){lines.add(s);return 0;}}''',
'ls/augment/com/BuildConfig.java': '''package ls.augment.com;public class BuildConfig{public static final String VERSION_NAME="test20576";}''',
'ls/augment/com/RuntimeEnvironment.java': '''package ls.augment.com;final class RuntimeEnvironment{static int bootCount(Object c){return 164;}}''',
'ls/augment/com/SystemUiCrashJournal.java': '''package ls.augment.com;public class SystemUiCrashJournal{public static void stage(String value){}}''',
'ls/augment/com/ResetWriteFence.java': '''package ls.augment.com;final class ResetWriteFence{static boolean blocked;static boolean blocked(){return blocked;}}''',
'ls/augment/com/RootCriticalProfile.java': '''package ls.augment.com;final class RootCriticalProfile{static final class SourceEvidence{Class<?> owner=Object.class;ClassLoader definingLoader;String archiveSha256="hash",dexEntry="classes.dex";}}''',
'ls/augment/com/RootEarlyCoordinator.java': '''package ls.augment.com;import java.util.*;import java.util.concurrent.*;import io.github.libxposed.api.XposedModuleInterface;final class RootEarlyCoordinator{static boolean runtimeFailed,retireFailed;RootEarlyCoordinator(RootEarlyModule.WindowAuthority a){a.bind(this);}RootEarlyModule.Result onModuleLoaded(RootEarlyModule m,XposedModuleInterface.ModuleLoadedParam p,RootEarlyModule.Mode mode){return new RootEarlyModule.Result("REJECTED","fixture target mismatch",new IllegalArgumentException("source mismatch"),0,0,1234,1000,0,0,0,Collections.emptyList(),false);}void installRuntimeEntry(RootEarlyModule m,ClassLoader l,RootEarlyModule.EntryAuthority a){if(runtimeFailed)throw new IllegalStateException("runtime entry fixture");}CompletionStage<RootEarlyModule.Result> retire(){if(retireFailed)throw new IllegalStateException("retire fixture");return CompletableFuture.completedFuture(null);}String startupDiagnostic(){return "startup";}String protectionDiagnostic(){return "protection";}}''',
}
TEST = r'''package ls.augment.com;
import android.content.*;import android.os.*;import java.io.*;import java.nio.file.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;import org.json.*;import io.github.libxposed.api.*;
public final class TestStartupDiagnostics{
 static int checks;static boolean blockFramework,failFramework;static CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
 static void yes(boolean v,String m){checks++;if(!v)throw new AssertionError(m);}
 public static Bundle store(Context c,Bundle e){return StartupDiagnosticStore.record(c,e);}
 static Object field(String n)throws Exception{Field f=StartupDiagnostics.class.getDeclaredField(n);f.setAccessible(true);return f.get(null);}
 static void drain()throws Exception{SystemClock.now+=31000;Method m=StartupDiagnostics.class.getDeclaredMethod("drain");m.setAccessible(true);m.invoke(null);}
 static void flush()throws Exception{for(int i=0;i<35;i++){drain();((ExecutorService)field("FRAMEWORK_WORKER")).submit(()->{}).get(3,TimeUnit.SECONDS);if(((Collection<?>)field("QUEUE")).isEmpty())break;}}
 static String stored()throws Exception{File f=new File(Context.folder,StartupDiagnostics.FILE);return f.exists()?Files.readString(f.toPath()):"";}
 static XposedInterface framework(){return (XposedInterface)Proxy.newProxyInstance(TestStartupDiagnostics.class.getClassLoader(),new Class<?>[]{XposedInterface.class},(p,m,a)->{
  switch(m.getName()){case "getFrameworkName":return "LSPosed";case "getFrameworkVersion":return "2.2.1";case "getFrameworkVersionCode":return 7931L;case "getApiVersion":return 102;case "log":if(failFramework)throw new IllegalStateException("framework sink fixture");if(blockFramework){entered.countDown();release.await(3,TimeUnit.SECONDS);}return null;default:return null;}
 });}
 static class Entry extends RootEarlyModule{boolean ordinary,server;Entry(){super(Mode.INSTALL_PROTECTIVE);}protected void onModuleLoadedAfterEarly(ModuleLoadedParam p,Result r){ordinary=true;throw new IllegalStateException("ordinary fixture",new IOException("nested entry cause"));}protected void onSystemServerStartingAfterRoot(SystemServerStartingParam p){server=true;throw new IllegalArgumentException("server continuation fixture");}}
 public static void main(String[] args)throws Exception{
  Context.folder=Path.of(args[0]).toFile();Context.folder.mkdirs();Context context=new Context();
  StartupDiagnostics.record("FIXTURE_BEGIN","",null);((ScheduledExecutorService)field("WORKER")).shutdownNow();
  StartupDiagnostics.initialize(framework(),"com.android.systemui");
  drain();yes(context.resolver.calls==0,"missing Context must not query provider");
  yes(android.util.Log.lines.stream().anyMatch(s->s.contains("WAITING_CONTEXT")),"context wait remains independently visible");
  android.app.ActivityThread.app=context;context.resolver.fail=true;drain();
  yes(android.util.Log.lines.stream().anyMatch(s->s.contains("DELIVERY_FAILED")&&s.contains("CALL_EXCEPTION")),"release failure has a provider-independent reason");
  yes(((Collection<?>)field("QUEUE")).size()>0,"provider outage discarded startup");
  context.resolver.fail=false;flush();String text=stored();
  yes(text.contains("MODULE_ENTRY")&&text.contains("7931")&&text.contains("DELIVERY_RECOVERED"),"entry identity and recovery persisted");
  yes(text.contains("UnknownHostException")&&text.contains("provider cause"),"delivery cause chain preserved");
  Method idleDrain=StartupDiagnostics.class.getDeclaredMethod("drainAndReschedule");idleDrain.setAccessible(true);idleDrain.invoke(null);
  yes(((Collection<?>)field("QUEUE")).isEmpty()&&field("scheduled")==null,"idle startup channel does not leave a periodic task");
  RuntimeException failure=new RuntimeException("outer complete");StackTraceElement[] frames=new StackTraceElement[70];
  for(int i=0;i<frames.length;i++)frames[i]=new StackTraceElement("Fixture","deepFrame"+i,"Fixture.java",i+1);
  failure.setStackTrace(frames);failure.initCause(new IOException("root cause"));failure.addSuppressed(new IllegalArgumentException("suppressed cause"));
  String rendered=DiagnosticException.render(failure);yes(rendered.contains("deepFrame69")&&rendered.contains("Suppressed:")&&rendered.contains("Caused by:")&&!rendered.contains("TRUNCATED"),"complete deep stack, cause and suppressed exceptions retained");
  String enormous=DiagnosticException.render(new RuntimeException("x".repeat(200000)));yes(enormous.contains("TRUNCATED")&&enormous.length()<DiagnosticException.MAX_CHARS+100,"oversized trace explicitly bounded");
  int before=context.resolver.calls;StartupDiagnostics.record("DEEP_FAILURE","unicode=完整",failure);yes(context.resolver.calls==before,"hook thread performed provider I/O");flush();
  text=stored();yes(text.contains("deepFrame69")&&text.contains("suppressed cause")&&text.contains("完整"),"full trace survives JSON and private file");
  for(String line:android.util.Log.lines)yes(line.length()<1400,"system log chunk exceeds deliberate limit");
  StartupDiagnostics.record("LOST_REPLY","",null);context.resolver.lostReply=true;drain();flush();
  long count=stored().lines().filter(l->l.contains("\"stage\":\"LOST_REPLY\"")).count();yes(count==1,"lost reply duplicated append for same event identity");
  String first=stored().lines().findFirst().orElseThrow();JSONObject forged=new JSONObject(first).put("pid",77);Bundle extra=new Bundle();extra.putString("event",forged.toString());
  yes(store(context,extra).getString("reason","").equals("CALLER_IDENTITY_MISMATCH"),"forged caller pid accepted");
  ResetWriteFence.blocked=true;extra.putString("event",first);yes(store(context,extra).getString("reason","").equals("RESET_WRITE_FENCE"),"reset fence bypassed");ResetWriteFence.blocked=false;
  context.resolver.reject=true;StartupDiagnostics.record("REJECT_TEST","",null);drain();context.resolver.reject=false;flush();yes(stored().contains("CALLER_DENIED"),"provider rejection reason lost");
  context.resolver.missing=true;StartupDiagnostics.record("NULL_REPLY_TEST","",null);drain();context.resolver.missing=false;flush();yes(stored().contains("REPLY_MISSING"),"null reply reason lost");
  blockFramework=true;StartupDiagnostics.record("FRAMEWORK_SLOW","",null);Thread thread=new Thread(()->{try{drain();}catch(Exception e){throw new RuntimeException(e);}});thread.start();yes(entered.await(2,TimeUnit.SECONDS),"framework sink did not enter");
  long start=System.nanoTime();StartupDiagnostics.record("CONCURRENT_HOOK","",null);yes(System.nanoTime()-start<TimeUnit.MILLISECONDS.toNanos(500),"slow framework logger blocked hook queue");
  thread.join(500);yes(!thread.isAlive(),"slow framework logger blocked independent provider delivery");release.countDown();blockFramework=false;flush();
  Entry entry=new Entry();entry.attachFramework(framework(),()->{});
  entry.onModuleLoaded(new XposedModuleInterface.ModuleLoadedParam(){public boolean isSystemServer(){return true;}public String getProcessName(){return "system";}});
  RootEarlyCoordinator.runtimeFailed=true;RootEarlyCoordinator.retireFailed=true;
  entry.onSystemServerStarting(new XposedModuleInterface.SystemServerStartingParam(){public ClassLoader getClassLoader(){return getClass().getClassLoader();}});flush();
  text=stored();yes(entry.ordinary&&entry.server,"early rejection or retirement failure blocked ordinary continuation");
  yes(text.contains("ROOT_EARLY_RESULT")&&text.contains("source mismatch")&&text.contains("MODULE_INITIALIZE_FAILED")&&text.contains("nested entry cause"),"root rejection and swallowed initializer error not recorded");
  yes(text.contains("ROOT_RUNTIME_ENTRY_FAILED")&&text.contains("ROOT_RETIRE_FAILED")&&text.contains("SYSTEM_SERVER_FAILED"),"server and cleanup errors not recorded");
  SystemUiStageFixture ui=new SystemUiStageFixture();ui.run();flush();text=stored();
  yes(ui.events.stream().anyMatch(s->s.equals("SYSTEMUI_STAGE_FAILED:power"))&&ui.events.stream().anyMatch(s->s.startsWith("SYSTEMUI_STAGE_RETURNED:core")),"one SystemUI stage failure hid its error or prevented the next stage");
  yes(text.contains("systemui stage cause")&&text.contains("SYSTEMUI_INSTALL_RETURNED"),"SystemUI deep failure and final attempt state not persisted");
  try{ui.prepareFailure();throw new AssertionError("prepare failure swallowed");}catch(IllegalStateException expected){yes(expected.getMessage().equals("prepare fixture"),"prepare exception identity changed");}flush();
  yes(stored().contains("SYSTEMUI_PREPARE_FAILED")&&stored().contains("prepare fixture"),"pre-SystemUI common adapter failure has no exact phase");
  StartupDiagnostics.record("ESCAPED_LIMIT","",new RuntimeException("\\\"".repeat(100000)));flush();
  yes(((Collection<?>)field("QUEUE")).isEmpty()&&stored().contains("TRUNCATED event"),"oversized escaped event poisoned startup queue");
  android.util.Log.fail=true;failFramework=true;StartupDiagnostics.record("SINK_FAILURE_TEST","",null);flush();
  android.util.Log.fail=false;failFramework=false;text=stored();yes(text.contains("LOGCAT_LOG_FAILED")&&text.contains("FRAMEWORK_LOG_FAILED")&&text.contains("framework sink fixture"),"independent sink failures lost their reason or recursed");
  String filtered=FrameworkDiagnosticFilter.retain("unrelated before\n[ clock E/LSPosed ] Error loading ls.augment.com\n[ clock E/LSPosed ] java.lang.IllegalStateException: complete\n[ clock E/LSPosed ]   at Fixture.deepFrame69(Fixture.java:70)\nCaused by: java.io.IOException: root\n\tat Deep.frame(Deep.java:8)\nSuppressed: java.lang.Error: suppressed\n\tat Hidden.frame(Hidden.java:1)\nunrelated after\n\tat Other.privateFrame(Other.java:1)\n");
  yes(filtered.contains("deepFrame69")&&filtered.contains("Suppressed")&&!filtered.contains("unrelated")&&!filtered.contains("Other.privateFrame"),"framework filter lost adjacent trace or leaked unrelated record");
  for(int i=0;i<180;i++)StartupDiagnostics.record("QUEUE_BUDGET","entry="+i,null);
  yes(((Collection<?>)field("QUEUE")).size()<=96&&((Integer)field("queuedChars"))<=512*1024&&((Long)field("dropped"))>0,"startup memory bound or loss count missing");
  flush();yes(stored().contains("queueDropped"),"queue loss metadata missing from persisted records");
  yes(new File(Context.folder,StartupDiagnostics.FILE).length()<=2*1024*1024,"private startup log grew beyond budget");
  System.out.println("PASS startup diagnostics: "+checks+" checks; early rejection, initializer/server errors, full causes/suppressed/deep frames, unavailable context/provider, missing/rejected/lost replies, independent failure/recovery, caller identity, reset fence, nonblocking queue, bounded storage and framework stack filtering");
 }
}'''

def member(source, signature):
    start=source.index(signature)
    end=source.index('{',start)+1
    depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}')
        end+=1
    return source[start:end]

def systemui_fixture():
    source=(SRC/'hook/AugmentModule.java').read_text(encoding='utf-8')
    install=member(source,'private synchronized void installSystemUiFeatureHooks(')
    stage=member(source,'private void installSystemUiStage(')
    prepare=member(source,'private void installPackageStage(')
    classes=set(re.findall(r'\(\) -> (\w+)\.install',install))
    stubs=''.join('static final class '+name+'{static void install(SystemUiStageFixture m,ClassLoader c){'
                  +('throw new IllegalStateException("systemui stage cause",new java.io.IOException("systemui root cause"));' if name=='PowerMenuModesHook' else 'HookTelemetry.count++;')+'}}' for name in classes)
    return '''package ls.augment.com;import java.util.*;final class SystemUiStageFixture{
boolean systemUiHooksInstalled;final List<String> events=new ArrayList<>();
static final String SYSTEMUI_PACKAGE="com.android.systemui";String readyPackageName=SYSTEMUI_PACKAGE;
void run(){installSystemUiFeatureHooks(getClass().getClassLoader());}
void prepareFailure(){installPackageStage("oem_extras",()->{throw new IllegalStateException("prepare fixture");});}
void recordStartup(String s,String d,Throwable e){events.add(s+":"+d);StartupDiagnostics.record(s,d,e);}
void logFeatureError(String s,Throwable e){}
static final class HookTelemetry{static int count;static int registrationCount(){return count;}}
static final class FeatureSettings{static Object from(Object o){return null;}static void diagnosticError(Object c,String k,String s,Throwable e){}}
'''+install+stage+prepare+stubs+'}'

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--jdk', type=Path, default=Path('C:/Program Files/Android/openjdk/jdk-21.0.8'))
    parser.add_argument('--json-jar', type=Path, default=ROOT/'audit-output/release-test20497/dependencies/json-20240303.jar')
    parser.add_argument('--api-jar', type=Path, default=ROOT/'audit-output/volume-percent-review/libxposed-api.jar')
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix='duo-startup-diagnostics-') as directory:
        folder = Path(directory)
        files = []
        for relative, value in {**STUBS, 'ls/augment/com/TestStartupDiagnostics.java': TEST,
                                'ls/augment/com/SystemUiStageFixture.java': systemui_fixture()}.items():
            target = folder/relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(value, encoding='utf-8')
            files.append(target)
        files += [SRC/(name+'.java') for name in ('DiagnosticException','StartupDiagnostics','StartupDiagnosticStore','FrameworkDiagnosticFilter','BoundedLog','RootEarlyModule')]
        cp = os.pathsep.join(map(str, (args.json_jar, args.api_jar)))
        suffix = '.exe' if os.name == 'nt' else ''
        subprocess.run([str(args.jdk/'bin'/('javac'+suffix)), '-encoding','UTF-8','--release','17','-cp',cp,'-d',str(folder),*map(str,files)],check=True)
        subprocess.run([str(args.jdk/'bin'/('java'+suffix)),'-cp',str(folder)+os.pathsep+cp,'ls.augment.com.TestStartupDiagnostics',str(folder/'private')],check=True,timeout=35)

if __name__ == '__main__':
    main()
