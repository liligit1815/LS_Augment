"""Run production sanitizers, DE journal, native readers and cross-boot archive with real files.

Android identity/POSIX/DropBox are test boundaries. Separate JVMs verify retained
fatal records after process restart; no phone crash or lock credential is changed.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JDK=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'

STUBS={
'android/content/pm/ApplicationInfo.java':'''package android.content.pm;public class ApplicationInfo{public int uid;public String packageName,deviceProtectedDataDir;}''',
'android/os/Process.java':'''package android.os;public class Process{public static int uid=10352;public static int myUid(){return uid;}public static int myPid(){return 7777;}}''',
'android/os/SystemClock.java':'''package android.os;public class SystemClock{public static long elapsedRealtime(){return 1000;}}''',
'android/os/Looper.java':'''package android.os;public class Looper{public static Object myLooper(){return new Object();}public static void prepare(){}}''',
'android/content/Context.java':'''package android.content;public class Context{public <T>T getSystemService(Class<T> type){return type.cast(new android.os.DropBoxManager());}}''',
'android/app/ActivityThread.java':'''package android.app;public class ActivityThread{public static ActivityThread systemMain(){return new ActivityThread();}public android.content.Context getSystemContext(){return new android.content.Context();}}''',
'android/os/DropBoxManager.java':r'''package android.os;import java.util.*;public class DropBoxManager{
 public static final List<Entry> entries=new ArrayList<>();public static int closed;
 public Entry getNextEntry(String tag,long since){return entries.stream().filter(e->e.tag.equals(tag)&&e.time>since).min(Comparator.comparingLong(e->e.time)).orElse(null);}
 public static class Entry{public String tag,text;public long time;public Entry(String tag,long t,String text){this.tag=tag;time=t;this.text=text;}public long getTimeMillis(){return time;}public String getText(int n){return text.substring(0,Math.min(n,text.length()));}public void close(){closed++;}}
}''',
'android/system/StructStat.java':'''package android.system;public class StructStat{public int st_uid,st_mode;public long st_nlink=1,st_size;}''',
'android/system/OsConstants.java':'''package android.system;public class OsConstants{public static final int O_RDONLY=0,O_RDWR=2,O_CREAT=64,O_EXCL=128,O_CLOEXEC=256,O_NOFOLLOW=512,O_NONBLOCK=1024,SEEK_SET=0;public static boolean S_ISREG(int m){return m==2;}public static boolean S_ISDIR(int m){return m==1;}}''',
'android/system/Os.java':r'''package android.system;import java.io.*;import java.nio.file.*;import java.util.*;public class Os{
 public static int owner=10352,syncs,flags,opens;public static boolean failWrite,wrongOwner,hardLink;
 static final Map<FileDescriptor,RandomAccessFile> handles=new HashMap<>();static final Map<FileDescriptor,String> paths=new HashMap<>();static final Map<String,Integer> owners=new HashMap<>();
 public static FileDescriptor open(String path,int f,int mode)throws Exception{opens++;flags=f;Path p=Path.of(path);if(Files.isSymbolicLink(p))throw new IOException("nofollow secret");if((f&OsConstants.O_EXCL)!=0&&Files.exists(p))throw new IOException("exists");if((f&OsConstants.O_CREAT)==0&&!Files.exists(p))throw new FileNotFoundException();RandomAccessFile r=new RandomAccessFile(path,(f&OsConstants.O_RDWR)!=0?"rw":"r");FileDescriptor fd=r.getFD();handles.put(fd,r);paths.put(fd,path);owners.putIfAbsent(path,owner);return fd;}
 public static StructStat lstat(String p)throws Exception{if(!Files.exists(Path.of(p)))throw new FileNotFoundException();StructStat s=new StructStat();s.st_mode=Files.isSymbolicLink(Path.of(p))?3:Files.isDirectory(Path.of(p))?1:2;s.st_uid=wrongOwner?999:owners.getOrDefault(p,owner);return s;}
 public static StructStat fstat(FileDescriptor fd)throws Exception{StructStat s=lstat(paths.get(fd));s.st_size=handles.get(fd).length();s.st_nlink=hardLink?2:1;return s;}
 public static void mkdir(String p,int mode)throws Exception{Files.createDirectory(Path.of(p));owners.put(p,owner);}public static void ftruncate(FileDescriptor fd,long n)throws Exception{handles.get(fd).setLength(n);}public static long lseek(FileDescriptor fd,long p,int m)throws Exception{handles.get(fd).seek(p);return p;}
 public static int write(FileDescriptor fd,byte[] b,int o,int n)throws Exception{if(failWrite)throw new IOException("private password");handles.get(fd).write(b,o,n);return n;}public static int read(FileDescriptor fd,byte[] b,int o,int n)throws Exception{return handles.get(fd).read(b,o,n);}public static void fsync(FileDescriptor fd)throws Exception{syncs++;fd.sync();}public static void close(FileDescriptor fd)throws Exception{handles.remove(fd).close();paths.remove(fd);}
}''',
'ls/augment/com/BuildConfig.java':'''package ls.augment.com;public class BuildConfig{public static final String VERSION_NAME="2.0.0-alpha1-test20590";}''',
}

TEST=r'''package ls.augment.com;
import java.io.*;import java.nio.file.*;import java.util.*;import android.system.Os;
public class BootCrashEvidenceTest{
 static int checks;static void check(boolean b,String reason){checks++;if(!b)throw new AssertionError(reason);}
 static void repeatedExport(File dir,String boot,String value)throws Exception{for(int attempt=0;;attempt++)try{BootEvidenceArchive.save(dir,boot,"EXPORT",value);return;}catch(java.nio.file.AccessDeniedException windowsScanner){if(attempt>=9)throw windowsScanner;Thread.sleep(25);}}
 static Throwable failure(){RuntimeException root=new RuntimeException("PIN=1234 account=secret");root.setStackTrace(new StackTraceElement[]{new StackTraceElement("com.android.systemui.LockedView","render","LockedView.java",47)});IllegalStateException cause=new IllegalStateException("password=private");cause.setStackTrace(new StackTraceElement[]{new StackTraceElement("ls.augment.com.hook.Adapter","apply","Adapter.java",18)});root.initCause(cause);root.addSuppressed(new IOException("token=never"));return root;}
 static android.content.pm.ApplicationInfo info(Path data){android.content.pm.ApplicationInfo i=new android.content.pm.ApplicationInfo();i.uid=10352;i.packageName="com.android.systemui";i.deviceProtectedDataDir=data.toString();return i;}
 static String nativeRead(Path data){StringBuilder b=new StringBuilder();SystemUiNativeCrashEvidence.collectSystemUi(b::append,data.toFile(),10352,"DE");return b.toString();}
 static void stacks(){StringBuilder b=new StringBuilder();CrashStackTrace.append(b,failure());String s=b.toString();check(s.contains("LockedView.java:47")&&s.contains("Adapter.java:18")&&s.contains("relation=suppressed")&&s.contains("relation=cause"),"types frames causes and suppressed exceptions survive");check(!s.contains("1234")&&!s.contains("secret")&&!s.contains("private")&&!s.contains("never"),"Throwable messages never exported");
  RuntimeException a=new RuntimeException(),c=new RuntimeException();a.initCause(c);c.initCause(a);b.setLength(0);CrashStackTrace.append(b,a);check(b.toString().contains("CAUSE_CYCLE"),"cause cycles terminate");
  String text="date\nDump triggered by exception:\njava.lang.RuntimeException: password=1234\n at com.android.systemui.A.draw(A.java:17)\nCaused by: java.lang.IllegalStateException: token=secret\n at a.b.C.bind(Unknown Source)\nSuppressed: java.io.IOException: never\n at a.b.D.read(Native Method)\nBUFFER NAME\n at private.buffer.Leak.read(Leak.java:1)\n";
  s=CrashStackTrace.fromText(text,true);check(s.contains("A.java:17")&&s.contains("relation=cause")&&s.contains("relation=suppressed")&&!s.contains("1234")&&!s.contains("secret")&&!s.contains("Leak"),"ROM eulogy strips messages and stops before unrelated buffers");
  check(CrashStackTrace.fromText("private account payload",true).contains("NO_MATCHING_JAVA_STACK"),"unknown native format is explicit and never raw");
  s=FrameworkDiagnosticFilter.safety("[LSPosed] SystemUI crashed 3 times\n[LSPosed] Entering safe mode\n[LSPosed] Disabled all modules\nother account secret\n");check(s.contains("crashed 3")&&s.contains("safe mode")&&s.contains("all modules")&&!s.contains("account"),"framework protection records survive without module name");
  check(FrameworkDiagnosticFilter.retain("framework safe_mode enabled\nother\n").contains("safe_mode"),"ordinary export also retains safety records");
  check(!FrameworkDiagnosticFilter.retain("[LSPosed] safe mode password=1234 private suffix\n").contains("1234"),"ordinary export sanitizes newly retained protection records");
  RuntimeException huge=new RuntimeException();StackTraceElement[] many=new StackTraceElement[300];for(int i=0;i<many.length;i++)many[i]=new StackTraceElement("c".repeat(200),"m".repeat(160),"F".repeat(160),i);huge.setStackTrace(many);b.setLength(0);CrashStackTrace.append(b,huge);check(b.length()<=CrashStackTrace.LIMIT+1024&&b.toString().contains("FRAMES_TRUNCATED"),"both character and frame truncation are explicit");
 }
 static void archive(Path dir)throws Exception{
  for(String boot:new String[]{"boot-A","boot-B","boot-C"})for(String phase:BootEvidenceArchive.PHASES)BootEvidenceArchive.save(dir.toFile(),boot,phase,"witness="+boot+" phase="+phase+"\n");
  for(int i=0;i<25;i++)repeatedExport(dir.toFile(),"boot-C","newest="+i+"\n");
  check(BootEvidenceArchive.read(dir.toFile()).contains("witness=boot-A")&&BootEvidenceArchive.read(dir.toFile()).contains("witness=boot-B"),"many current exports preserve earlier boots");
  BootEvidenceArchive.save(dir.toFile(),"boot-D","BOOT","witness=boot-D\n");String read=BootEvidenceArchive.read(dir.toFile());check(read.contains("boot-D")&&dir.toFile().listFiles(f->f.getName().endsWith(".txt")).length<=15,"bounded retention preserves current and two earlier boot groups");
  try{BootEvidenceArchive.save(dir.toFile(),"../outside","BOOT","secret");throw new AssertionError("path accepted");}catch(IOException expected){checks++;}
  try{BootEvidenceArchive.save(dir.toFile(),"boot-D","UNTRUSTED","secret");throw new AssertionError("phase accepted");}catch(IOException expected){checks++;}
  try{BootEvidenceArchive.save(dir.toFile(),"boot-D","BOOT","x".repeat(BootEvidenceArchive.LIMIT+1));throw new AssertionError("limit accepted");}catch(IOException expected){checks++;}
  check(BootEvidenceArchive.read(dir.toFile()).contains("witness=boot-D"),"failed replacement keeps previous durable evidence");
 }
 static void reader(Path base)throws Exception{
  Path data=base.resolve("native-reader");Files.createDirectories(data.resolve("files"));Files.writeString(data.resolve("files/log_buffers.txt"),"date\nDump triggered by exception:\njava.lang.NullPointerException: PIN=1234\n at com.android.systemui.View.bind(View.java:66)\nBUFFER PRIVATE ACCOUNT\n");
  String s=nativeRead(data);check(s.contains("View.java:66")&&!s.contains("1234")&&!s.contains("ACCOUNT"),"actual file reader sanitizes native eulogy");check(s.contains("duo_systemui_journal;status=MISSING"),"missing hook record is not claimed crash-free");
  check((Os.flags&android.system.OsConstants.O_NOFOLLOW)!=0,"root file reader requires nofollow");Os.hardLink=true;s=nativeRead(data);check(s.contains("SecurityException")&&!s.contains("View.java"),"hard-linked native file rejected");Os.hardLink=false;
  Os.wrongOwner=true;check(nativeRead(data).contains("MISSING_OR_INACCESSIBLE"),"foreign data directory rejected");Os.wrongOwner=false;
  File log=base.resolve("native-reader/files/log_buffers.txt").toFile();SystemUiNativeCrashEvidence.Read prefix=SystemUiNativeCrashEvidence.read(log,10352,16,false);check(prefix.ok&&prefix.truncated&&prefix.bytes==16&&prefix.size>16,"read budget and truncation stay explicit");
  Path framework=base.resolve("framework");Files.createDirectories(framework);Os.owner=0;Files.writeString(framework.resolve("verbose_2026-10-23T23-41-29.log"),"[LSPosed] Entering safe mode after SystemUI crash\nother secret\n");StringBuilder out=new StringBuilder();SystemUiNativeCrashEvidence.collectFramework(out::append,framework.toFile(),"previous");check(out.toString().contains("generation=previous")&&out.toString().contains("safe mode")&&!out.toString().contains("other secret"),"previous framework log directory selected and filtered");Os.owner=10352;
  android.os.DropBoxManager.entries.add(new android.os.DropBoxManager.Entry("system_app_crash",System.currentTimeMillis()-2000,"Process: com.android.systemui\nUID: 10352\njava.lang.IllegalStateException: secret\n at com.android.systemui.C.start(C.java:9)\n"));
  android.os.DropBoxManager.entries.add(new android.os.DropBoxManager.Entry("system_app_crash",System.currentTimeMillis()-1500,"Process: com.android.systemui\nUID: 110352\njava.lang.IllegalStateException: secret\n at private.user.Leak.start(Leak.java:9)\n"));
  android.os.DropBoxManager.entries.add(new android.os.DropBoxManager.Entry("system_app_crash",System.currentTimeMillis()-1000,"Process: private.app\njava.lang.RuntimeException: secret\n at private.app.Leak.x(Leak.java:1)\n"));
  ByteArrayOutputStream bytes=new ByteArrayOutputStream();PrintStream original=System.out;
  try{System.setOut(new PrintStream(bytes));android.os.Process.uid=0;SystemUiNativeCrashEvidence.main(new String[]{"0","10352"});}finally{System.setOut(original);android.os.Process.uid=10352;}
  s=bytes.toString();check(s.contains("C.java:9")&&!s.contains("private.app.Leak")&&!s.contains("private.user.Leak")&&!s.contains(": secret"),"DropBox reads only same-user SystemUI trace, never unrelated entries or messages");check(android.os.DropBoxManager.closed==3,"every DropBox entry is closed");check(s.contains("uidMissingOrDifferent=1"),"missing or foreign UID is explicitly counted");
 }
 static void write(Path base)throws Exception{Path data=base.resolve("retained-systemui");Files.createDirectories(data);SystemUiCrashJournal.hook("thread_dispatch");SystemUiCrashJournal.stage("install:core");SystemUiCrashJournal.prepare(info(data));check(SystemUiCrashJournal.status().startsWith("ARMED"),"journal armed in DE before application attach");SystemUiCrashJournal.capture(failure());SystemUiCrashJournal.capture(new IllegalArgumentException("second fatal"));String s=nativeRead(data);check(s.contains("capture=FATAL")&&s.contains("LockedView.java:47")&&!s.contains("second fatal")&&!s.contains("1234"),"first fatal synchronously persisted with phase and no messages");check(Os.syncs>=2,"arming and fatal each fsync before returning");}
 public static void main(String[] args)throws Exception{Path base=Path.of(args[1]);Files.createDirectories(base);switch(args[0]){
  case "all":stacks();archive(base.resolve("archive"));reader(base);break;
  case "write":write(base);break;
  case "read":String s=nativeRead(base.resolve("retained-systemui"));check(s.contains("capture=FATAL")&&s.contains("LockedView.java:47")&&s.contains("phase=install:core"),"a fresh JVM exports pre-restart fatal evidence");check(BootEvidenceArchive.read(base.resolve("archive").toFile()).contains("boot-D"),"boot archive survives process restart");break;
 }System.out.println("PASS boot crash evidence "+args[0]+": "+checks+" assertions");}
}'''

def main():
    with tempfile.TemporaryDirectory(prefix='duo-boot-crash-') as temporary:
        directory=Path(temporary);files=[]
        for name,text in {**STUBS,'ls/augment/com/BootCrashEvidenceTest.java':TEST}.items():
            path=directory/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text,'utf-8');files.append(path)
        files += [SRC/(name+'.java') for name in ('CrashStackTrace','FrameworkDiagnosticFilter','BootEvidenceArchive','SystemUiCrashJournal','SystemUiNativeCrashEvidence')]
        subprocess.run([str(JDK/'javac'),'-encoding','UTF-8','--release','17','-d',temporary,*map(str,files)],check=True)
        data=directory/'data'
        for mode in ('all','write','read'):
            subprocess.run([str(JDK/'java'),'-cp',temporary,'ls.augment.com.BootCrashEvidenceTest',mode,str(data)],check=True,timeout=25)

if __name__=='__main__':main()
