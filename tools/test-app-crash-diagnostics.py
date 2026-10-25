"""Exercise the real fatal handler/export, with POSIX descriptor and Android identity doubles.

Retained bytes use real temporary files; a separate JVM verifies export after
process restart. No installed app, phone data or default handler outside the test JVM is touched.
"""
from pathlib import Path
import os
import runpy
import subprocess
import tempfile

HERE = Path(__file__).parent
SUPPORT = runpy.run_path(str(HERE / "test-atomic-workbench-engine.py"))
MEMBER = runpy.run_path(str(HERE / "test-atomic-workbench-lifecycle.py"))["member"]
SRC = SUPPORT["SRC"]

SOURCES = {
    "android/content/pm/ApplicationInfo.java": "package android.content.pm;public class ApplicationInfo {public int uid=10515;}",
    "android/content/Context.java": r'''package android.content;public class Context {
 public java.io.File data;public String pkg="ls.augment.com";public android.content.pm.ApplicationInfo info=new android.content.pm.ApplicationInfo();
 public Context(){}public Context(java.io.File d){data=d;}public java.io.File getDataDir(){return data;}public java.io.File getFilesDir(){return new java.io.File(data,"files");}public String getPackageName(){return pkg;}public android.content.pm.ApplicationInfo getApplicationInfo(){return info;}}
''',
    "android/app/Activity.java": "package android.app;public class Activity {public boolean isChangingConfigurations(){return false;}}",
    "android/os/Bundle.java": "package android.os;public class Bundle {}",
    "android/app/Application.java": r'''package android.app;import android.content.Context;public class Application extends Context {
 public static String process="ls.augment.com";public static String getProcessName(){return process;}
 protected void attachBaseContext(Context c){data=c.data;pkg=c.pkg;info=c.info;}public void onCreate(){}public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks c){}
 public interface ActivityLifecycleCallbacks {void onActivityStarted(Activity a);void onActivityStopped(Activity a);void onActivityCreated(Activity a,android.os.Bundle b);void onActivityResumed(Activity a);void onActivityPaused(Activity a);void onActivitySaveInstanceState(Activity a,android.os.Bundle b);void onActivityDestroyed(Activity a);}}
''',
    "android/os/Process.java": "package android.os;public class Process {public static int uid=10515;public static int myUid(){return uid;}public static int myPid(){return 12345;}}",
    "android/os/SystemClock.java": "package android.os;public class SystemClock {public static long elapsedRealtime(){return 123456;}}",
    "android/system/StructStat.java": "package android.system;public class StructStat {public int st_mode,st_uid;public long st_nlink=1,st_size;}",
    "android/system/OsConstants.java": "package android.system;public class OsConstants {public static final int O_RDWR=2,O_CREAT=64,O_CLOEXEC=128,O_NOFOLLOW=256,O_NONBLOCK=512,O_RDONLY=0,SEEK_SET=0;public static boolean S_ISDIR(int m){return m==1;}public static boolean S_ISREG(int m){return m==2;}}",
    "android/system/Os.java": r'''package android.system;
import java.io.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.*;
public class Os {
 public static int opens,writes,syncs,lastFlags,owner=10515;public static boolean failWrite,failRead;public static Runnable beforeWrite,beforeRead;
 static final Map<String,Node> paths=new ConcurrentHashMap<>();static final Map<FileDescriptor,Handle> handles=new ConcurrentHashMap<>();
 static class Node {String path;byte[] bytes;int uid=owner,mode=2,links=1;Node(String p,byte[] b){path=p;bytes=b;}}
 static class Handle {Node node;int position;Handle(Node n){node=n;}}
 public static void reset(){opens=writes=syncs=0;lastFlags=0;owner=10515;failWrite=failRead=false;beforeWrite=beforeRead=null;paths.clear();handles.clear();}
 public static FileDescriptor open(String p,int flags,int mode)throws Exception {opens++;lastFlags=flags;Path path=Path.of(p);if(Files.isSymbolicLink(path))throw new IOException("nofollow");
  if(!Files.exists(path)){if((flags&OsConstants.O_CREAT)==0)throw new FileNotFoundException();Files.createFile(path);}
  Node n=paths.get(p);if(n==null){n=new Node(p,Files.readAllBytes(path));paths.put(p,n);}FileDescriptor fd=new FileDescriptor();handles.put(fd,new Handle(n));return fd;}
 public static StructStat lstat(String p){StructStat s=new StructStat();s.st_mode=Files.isDirectory(Path.of(p))?1:2;s.st_uid=owner;return s;}
 public static StructStat fstat(FileDescriptor fd){Node n=handles.get(fd).node;StructStat s=new StructStat();s.st_mode=n.mode;s.st_uid=n.uid;s.st_nlink=n.links;s.st_size=n.bytes.length;return s;}
 public static void fchmod(FileDescriptor fd,int mode){}public static void close(FileDescriptor fd){handles.remove(fd);}
 static void persist(Node n)throws Exception {if(paths.get(n.path)==n&&Files.exists(Path.of(n.path)))Files.write(Path.of(n.path),n.bytes,StandardOpenOption.WRITE,StandardOpenOption.TRUNCATE_EXISTING);}
 public static void ftruncate(FileDescriptor fd,long size)throws Exception {Node n=handles.get(fd).node;n.bytes=Arrays.copyOf(n.bytes,(int)size);persist(n);}
 public static long lseek(FileDescriptor fd,long p,int mode){handles.get(fd).position=(int)p;return p;}
 public static int write(FileDescriptor fd,byte[] bytes,int off,int len)throws Exception {if(beforeWrite!=null){Runnable r=beforeWrite;beforeWrite=null;r.run();}if(failWrite)throw new IOException("private write failure");writes++;Handle h=handles.get(fd);h.node.bytes=Arrays.copyOf(h.node.bytes,Math.max(h.node.bytes.length,h.position+len));System.arraycopy(bytes,off,h.node.bytes,h.position,len);h.position+=len;persist(h.node);return len;}
 public static int read(FileDescriptor fd,byte[] bytes,int off,int len)throws Exception {if(beforeRead!=null){Runnable r=beforeRead;beforeRead=null;r.run();}if(failRead)throw new IOException();Handle h=handles.get(fd);int n=Math.min(len,h.node.bytes.length-h.position);if(n<=0)return 0;System.arraycopy(h.node.bytes,h.position,bytes,off,n);h.position+=n;return n;}
 public static void fsync(FileDescriptor fd){syncs++;}public static void unlink(String p)throws Exception{paths.remove(p);Files.deleteIfExists(Path.of(p));}
 public static void replace(String p,byte[] bytes)throws Exception{Node n=new Node(p,bytes);paths.put(p,n);Files.write(Path.of(p),bytes);}
 public static void metadata(String p,int uid,int mode,int links){Node n=paths.get(p);n.uid=uid;n.mode=mode;n.links=links;}
}
''',
    "ls/augment/com/BuildConfig.java": "package ls.augment.com;public class BuildConfig {static final int VERSION_CODE=20566;static final String VERSION_NAME=\"2.0.0-alpha1-test20566\";}",
    "ls/augment/com/AtomicWorkbenchActivity.java": "package ls.augment.com;public class AtomicWorkbenchActivity extends android.app.Activity {}",
    "ls/augment/com/InitPorts.java": r'''package ls.augment.com;
class HidePrivateStorage {static void configure(java.io.File f,boolean b){}}class FrameworkConfigSync {static void initialize(Object c){}}
class ModuleScopeService {static void initialize(){}}class ConfigVisibilityGrant {static void refresh(Object c){}}
class ScreenAutomation {static void removeLegacyNotification(Object c){}}class HiddenEntrySession {static void lock(){}}class BatteryLifeControl {static void schedule(Object c){}}
class BootEvidenceCapture {static final String PROCESS="ls.augment.com:boot_diagnostics";static void schedule(Object c,String phase){}}
''',
}

TEST = r'''package ls.augment.com;
import android.content.Context;import android.system.*;import java.io.*;import java.nio.file.*;import java.nio.charset.StandardCharsets;import java.lang.reflect.*;import java.util.concurrent.*;
public class TestAppCrashDiagnostics {
 static int checks,cases;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}interface Case{void run()throws Exception;}static void test(Case c)throws Exception{c.run();cases++;}
 static class Previous implements Thread.UncaughtExceptionHandler {int calls;Throwable error;Runnable action;public void uncaughtException(Thread t,Throwable e){calls++;error=e;if(action!=null)action.run();}}
 static void forget()throws Exception {Field f=AppCrashDiagnostics.class.getDeclaredField("installed");f.setAccessible(true);Object h=f.get(null);if(h!=null){Field d=h.getClass().getDeclaredField("descriptor");d.setAccessible(true);Os.close((FileDescriptor)d.get(h));}f.set(null,null);}
 static class Fixture implements AutoCloseable {
  final Context context;final Previous previous=new Previous();final Thread.UncaughtExceptionHandler old=Thread.getDefaultUncaughtExceptionHandler();Thread.UncaughtExceptionHandler handler;
  Fixture()throws Exception {forget();Os.reset();android.os.Process.uid=10515;android.app.Application.process="ls.augment.com";context=context(Files.createTempDirectory("app-fatal-"));Thread.setDefaultUncaughtExceptionHandler(previous);AppCrashDiagnostics.stage("app_attach");}
  void install(){AppCrashDiagnostics.install(context);handler=Thread.getDefaultUncaughtExceptionHandler();}String path(){return new File(context.getFilesDir(),AppCrashDiagnostics.FILE_NAME).getPath();}
  void fatal(Throwable e){handler.uncaughtException(Thread.currentThread(),e);}String read(){return AppCrashExportHarness.read(context);}
  public void close()throws Exception {if(ResetWriteFence.owns())ResetWriteFence.end();forget();Thread.setDefaultUncaughtExceptionHandler(old);}
 }
 static Context context(Path data)throws Exception{Files.createDirectories(data.resolve("files"));return new Context(data.toFile());}
 static Throwable error(){RuntimeException cause=new RuntimeException("account=secret-cause token=bad");cause.setStackTrace(new StackTraceElement[]{new StackTraceElement("ls.augment.com.AtomicWorkbenchSurface","configureBuffer","AtomicWorkbenchSurface.java",92)});RuntimeException top=new RuntimeException("Intent media=/sdcard/private.jpg coordinates=123,456",cause);top.setStackTrace(new StackTraceElement[]{new StackTraceElement("ls.augment.com.AtomicWorkbenchActivity","onCreate","AtomicWorkbenchActivity.java",147),new StackTraceElement("bad/secret/path","token secret","/sdcard/private.jpg",1)});return top;}
 public static void main(String[] args)throws Exception {
  if(args.length>0){Context c=context(Path.of(args[1]));if(args[0].equals("write")){Previous p=new Previous();Thread.setDefaultUncaughtExceptionHandler(p);AppCrashDiagnostics.install(c);AppCrashDiagnostics.stage("atomic_workbench_focused");Thread.getDefaultUncaughtExceptionHandler().uncaughtException(Thread.currentThread(),error());check(p.calls==1,"fresh-process fatal not delegated");System.out.println("FATAL_WRITTEN");}else{String read=AppCrashExportHarness.read(c);check(read.contains("status=READ")&&read.contains("AtomicWorkbenchActivity#onCreate")&&!read.contains("secret")&&!read.contains("/sdcard"),"fresh JVM could not export sanitized retained stack: "+read);System.out.println("FRESH_JVM_EXPORT_OK");}return;}
  test(()->{try(Fixture f=new Fixture()){f.install();check(f.handler!=f.previous,"handler not installed");int opens=Os.opens;AppCrashDiagnostics.stage("atomic_workbench_create");AppCrashDiagnostics.stage("unknown token=secret");check(Os.writes==0&&Os.opens==opens,"ordinary stage collected a stack or touched storage");check(f.read().contains("NOT_COLLECTED"),"empty preopened file claimed fatal");Throwable e=error();f.previous.action=()->check(f.read().contains("END_APP_FATAL"),"previous handler ran before synchronous capture");f.fatal(e);String read=f.read();check(f.previous.calls==1&&f.previous.error==e&&Os.syncs==1,"original fatal/handler or sync lost");check(read.contains("phase=atomic_workbench_create")&&read.contains("exception[1]=java.lang.RuntimeException")&&read.contains("AtomicWorkbenchSurface#configureBuffer"),"phase/cause/frames absent");check(!read.contains("secret")&&!read.contains("/sdcard")&&!read.contains("coordinates="),"private error message or frame path leaked");check((Os.lastFlags&OsConstants.O_NOFOLLOW)!=0&&(Os.lastFlags&OsConstants.O_NONBLOCK)!=0,"private descriptor protections absent");}});
  test(()->{try(Fixture f=new Fixture()){f.install();Throwable e=error();f.previous.action=()->Thread.getDefaultUncaughtExceptionHandler().uncaughtException(Thread.currentThread(),e);f.fatal(e);check(f.previous.calls==1&&Os.writes==1,"recursive old handler was called or recorded repeatedly");}});
  test(()->{try(Fixture f=new Fixture()){f.install();Throwable original=error();Error sentinel=new AssertionError("previous handler failure");f.previous.action=()->{throw sentinel;};boolean propagated=false;try{f.fatal(original);}catch(Error e){propagated=e==sentinel;}check(propagated&&f.previous.error==original,"old handler failure or original Throwable swallowed");}});
  for(boolean get:new boolean[]{true,false})test(()->{try(Fixture f=new Fixture()){f.install();Field field=f.handler.getClass().getDeclaredField("handling");field.setAccessible(true);field.set(f.handler,new ThreadLocal<Boolean>(){public Boolean get(){if(get)throw new OutOfMemoryError();return null;}public void set(Boolean v){throw new OutOfMemoryError();}});Throwable e=error();f.fatal(e);check(f.previous.calls==1&&f.previous.error==e,"ThreadLocal get/set failure replaced fatal or skipped previous handler");}});
  test(()->{try(Fixture f=new Fixture()){f.install();Os.failWrite=true;Throwable e=error();f.fatal(e);check(f.previous.calls==1&&f.previous.error==e,"I/O failure swallowed original fatal");check(!f.read().contains("captureState=COMPLETE"),"failed write pretended complete evidence");}});
  test(()->{try(Fixture f=new Fixture()){f.install();RuntimeException e=new RuntimeException("secret");StackTraceElement[] frames=new StackTraceElement[100];for(int i=0;i<frames.length;i++)frames[i]=new StackTraceElement("ls.augment.com.Example","run","Example.java",i);Throwable chain=null;for(int i=0;i<10;i++){RuntimeException next=new RuntimeException("secret",chain);next.setStackTrace(frames);chain=next;}f.fatal(chain);String read=f.read();check(read.contains("CAUSES_TRUNCATED")&&read.contains("FRAMES_TRUNCATED"),"cause/frame bounds missing");check(Files.size(Path.of(f.path()))<=AppCrashDiagnostics.MAX_BYTES&&!read.contains("secret"),"fatal storage not bounded or message retained");}});
  test(()->{try(Fixture f=new Fixture()){f.install();f.fatal(error());byte[] previous=Files.readAllBytes(Path.of(f.path()));forget();Thread.setDefaultUncaughtExceptionHandler(f.previous);AppCrashDiagnostics.install(f.context);check(java.util.Arrays.equals(previous,Files.readAllBytes(Path.of(f.path()))),"healthy restart truncated previous fatal");Thread.getDefaultUncaughtExceptionHandler().uncaughtException(Thread.currentThread(),new IllegalStateException("new private text"));String read=f.read();check(read.contains("exception[0]=java.lang.IllegalStateException")&&!read.contains("exception[1]"),"new fatal did not replace bounded latest record");}});
  test(()->{try(Fixture f=new Fixture()){f.install();Os.beforeWrite=()->{try{ResetWriteFence.begin();Os.unlink(f.path());ResetWriteFence.end();}catch(Exception e){throw new RuntimeException(e);}};int opens=Os.opens;f.fatal(error());check(Os.opens==opens&&!Files.exists(Path.of(f.path())),"fatal reopened/recreated reset-deleted path");String read=f.read();check(read.contains("NOT_COLLECTED")&&read.contains("RESET_INVALIDATED_UNTIL_PROCESS_RESTART"),"reset-invalidated handler still advertised ARMED");}});
  test(()->{try(Fixture f=new Fixture()){f.install();ResetWriteFence.begin();int writes=Os.writes;f.fatal(error());check(Os.writes==writes&&f.previous.calls==1&&f.read().contains("RESET_ACTIVE"),"fatal wrote while reset active");}});
  test(()->{try(Fixture f=new Fixture()){f.install();f.fatal(error());Os.beforeRead=()->{ResetWriteFence.begin();ResetWriteFence.end();};check(f.read().contains("RESET_RACED")&&!f.read().contains("phase=atomic_workbench"),"export returned bytes across reset generation");}});
  test(()->{try(Fixture f=new Fixture()){f.install();f.fatal(error());String good=Files.readString(Path.of(f.path()));for(String bad:new String[]{good.replace("END_APP_FATAL","message=secret\nEND_APP_FATAL"),good.replace("phase=app_attach","phase=secret"),good.replace("END_APP_FATAL","\u0000END_APP_FATAL"),good.substring(0,good.length()-5)}){Os.replace(f.path(),bad.getBytes(StandardCharsets.US_ASCII));String read=f.read();check(read.contains("CONTENT_REJECTED")&&!read.contains("secret")&&!read.contains("AtomicWorkbenchActivity#"),"export trusted malformed retained file");}}});
  test(()->{try(Fixture f=new Fixture()){f.context.info.uid=10077;f.install();check(f.handler==f.previous&&Os.opens==0&&f.read().contains("OWNER_REJECTED"),"foreign owner installed/read fatal capture");f.context.info.uid=10515;android.os.Process.uid=0;AppCrashDiagnostics.install(f.context);check(Os.opens==0,"Root installed app fatal capture");}});
  test(()->{try(Fixture f=new Fixture()){android.app.Application.process="ls.augment.com:other";f.install();check(f.handler==f.previous&&Os.opens==0,"secondary process shared fatal descriptor");}});
  test(()->{try(Fixture f=new Fixture()){f.install();f.fatal(error());Os.metadata(f.path(),10077,2,1);check(f.read().contains("FILE_REJECTED"),"foreign file owner exported");Os.metadata(f.path(),10515,2,2);check(f.read().contains("FILE_REJECTED"),"hard-linked file exported");}});
  test(()->{try(Fixture f=new Fixture()){f.install();CountDownLatch locked=new CountDownLatch(1),release=new CountDownLatch(1);Thread holder=new Thread(()->{synchronized(ResetWriteFence.class){locked.countDown();try{release.await();}catch(InterruptedException e){}}});holder.start();locked.await();Thread crash=new Thread(()->f.fatal(error()));try{crash.start();crash.join(1500);check(!crash.isAlive()&&f.previous.calls==1,"fatal waited on reset/log monitor");}finally{release.countDown();holder.join(1500);crash.join(1500);}}});
  test(()->{try(Fixture f=new Fixture()){AugmentApplication app=new AugmentApplication();app.attachBaseContext(f.context);check(Thread.getDefaultUncaughtExceptionHandler()!=f.previous,"Application did not install before onCreate/Provider");app.onCreate();AppCrashDiagnostics.stage("atomic_workbench_focused");app.onActivityCreated(new AtomicWorkbenchActivity(),null);Thread.getDefaultUncaughtExceptionHandler().uncaughtException(Thread.currentThread(),error());check(f.read().contains("phase=atomic_workbench_focused"),"generic app callback overwrote workbench phase");}});
  test(()->{try(Fixture f=new Fixture()){AugmentApplication app=new AugmentApplication();app.attachBaseContext(f.context);AppCrashDiagnostics.stage("atomic_workbench_focused");app.onActivityResumed(new android.app.Activity());Thread.getDefaultUncaughtExceptionHandler().uncaughtException(Thread.currentThread(),error());check(f.read().contains("phase=app_activity"),"other screen retained workbench phase");}});
  test(()->{try(Fixture f=new Fixture()){f.install();StackTraceElement[] frames=new StackTraceElement[100];for(int i=0;i<frames.length;i++)frames[i]=new StackTraceElement("c".repeat(160),"m".repeat(100),"F".repeat(95)+".java",i);Throwable cause=null;for(int i=0;i<5;i++){RuntimeException next=new RuntimeException("secret",cause);next.setStackTrace(frames);cause=next;}f.fatal(cause);String read=f.read();check(read.contains("status=READ")&&read.contains("STACK_TRUNCATED"),"character bound produced unexportable partial evidence");check(Files.size(Path.of(f.path()))<=AppCrashDiagnostics.MAX_BYTES,"long legal frame symbols exceeded byte limit");}});
  System.out.println("APP CRASH RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''


def main():
    export = (SRC / "DiagnosticExport.java").read_text(encoding="utf-8")
    assert "appendAppCrashLog(out,context);" in export, "real export omitted app fatal evidence"
    harness = "package ls.augment.com;import android.content.Context;public class AppCrashExportHarness {static String read(Context c){StringBuilder out=new StringBuilder();appendAppCrashLog(out,c);return out.toString();}" + MEMBER(export, "private static void appendAppCrashLog(") + "}"
    with tempfile.TemporaryDirectory(prefix="lsa-app-crash-") as temporary:
        work = Path(temporary)
        SUPPORT["compile_run"](work, {**SOURCES, "ls/augment/com/TestAppCrashDiagnostics.java": TEST,
                                     "ls/augment/com/AppCrashExportHarness.java": harness},
                               ["AppCrashDiagnostics.java", "AugmentApplication.java", "ResetWriteFence.java"],
                               "ls.augment.com.TestAppCrashDiagnostics")
        data = work / "retained-app"
        for mode in ("write", "read"):
            subprocess.run([SUPPORT["JAVA"], "-Dfile.encoding=UTF-8", "-cp", str(work / "classes"),
                            "ls.augment.com.TestAppCrashDiagnostics", mode, str(data)],
                           check=True, timeout=15, env=SUPPORT["ENV"])


if __name__ == "__main__":
    main()
