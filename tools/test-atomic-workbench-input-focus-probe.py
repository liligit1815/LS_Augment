"""Actual bounded single-flight phone observer with only Binder/pipe/UID test doubles."""
from pathlib import Path
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
SRC = SUPPORT["SRC"]
PFD = r'''package android.os;import java.io.*;import java.util.concurrent.*;
public class ParcelFileDescriptor implements AutoCloseable {
 public static final ConcurrentHashMap<FileDescriptor,ParcelFileDescriptor> descriptors=new ConcurrentHashMap<>();
 final FileDescriptor descriptor=new FileDescriptor();final InputStream input;final OutputStream output;
 ParcelFileDescriptor(InputStream input,OutputStream output){this.input=input;this.output=output;descriptors.put(descriptor,this);}
 public static ParcelFileDescriptor[] createPipe()throws IOException{PipedInputStream input=new PipedInputStream(8192);return new ParcelFileDescriptor[]{new ParcelFileDescriptor(input,null),new ParcelFileDescriptor(null,new PipedOutputStream(input))};}
 public FileDescriptor getFileDescriptor(){return descriptor;}
 public void close()throws IOException{descriptors.remove(descriptor);if(input!=null)input.close();if(output!=null)output.close();}
 public static class AutoCloseInputStream extends InputStream {final ParcelFileDescriptor owner;public AutoCloseInputStream(ParcelFileDescriptor owner){this.owner=owner;}
 public int read()throws IOException{return owner.input.read();}public int read(byte[] b,int o,int l)throws IOException{return owner.input.read(b,o,l);}public void close()throws IOException{owner.close();}}
}'''
TEST = r'''package ls.augment.com;import java.io.*;import java.nio.charset.*;import java.nio.file.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;import android.os.*;
public class TestInputFocusProbe {
 static int cases,checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}interface Case{void run()throws Exception;}static void test(Case c)throws Exception{c.run();cases++;}
 static final AtomicInteger calls=new AtomicInteger(),finished=new AtomicInteger();static volatile CountDownLatch hold,entered;
 static volatile String payload;static volatile boolean throwsDump;
 static String report(int id){return "Input Reader State:\n\nInput Dispatcher State:\n  DispatchEnabled: true\n  DispatchFrozen: false\n  InputFilterEnabled: false\n  FocusedDisplayId: "+id+"\n  FocusedApplications:\n    displayId=0, name='own fixture'\n";}
 static AtomicWorkbenchInputFocusSnapshot parse(String s)throws Exception{return AtomicWorkbenchInputFocusSnapshot.read(new ByteArrayInputStream(s.getBytes(StandardCharsets.UTF_8)));}
 static void fixture(String value){payload=value;throwsDump=false;hold=entered=null;ServiceManager.service=(fd,args)->{
  calls.incrementAndGet();String fixed=payload;CountDownLatch wait=hold;if(wait!=null){entered.countDown();wait.await();}
  try {if(throwsDump)throw new IOException("fixed test failure");OutputStream output=ParcelFileDescriptor.descriptors.get(fd).output;output.write(fixed.getBytes(StandardCharsets.UTF_8));output.flush();}
  finally{finished.incrementAndGet();}};}
 static void waitDone(int count)throws Exception{long limit=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);while((finished.get()<count||!ParcelFileDescriptor.descriptors.isEmpty())&&System.nanoTime()<limit)Thread.sleep(1);check(finished.get()>=count&&ParcelFileDescriptor.descriptors.isEmpty(),"test pipe ownership not discharged");}
 public static void main(String[] args)throws Exception{
  test(()->{var p=parse(report(0));check(p.confirmed&&p.displayId==0,"native primary field not parsed");var v=parse(report(15));check(v.confirmed&&v.displayId==15,"virtual display evidence changed");});
  test(()->{var p=AtomicWorkbenchInputFocusSnapshot.read(Files.newInputStream(Path.of(args[0])));check(p.confirmed&&p.displayId==0,"actual recorded primary native dump rejected");});
  test(()->{var p=AtomicWorkbenchInputFocusSnapshot.read(Files.newInputStream(Path.of(args[1])));check(p.confirmed&&p.displayId==15,"actual recorded virtual native dump rejected");});
  test(()->check(!parse("  FocusedDisplayId: 0\n").confirmed,"unscoped field accepted"));
  test(()->check(!parse(report(0).replace("  FocusedApplications:\n", "")).confirmed,"truncated native section accepted"));
  test(()->check(!parse(report(0).replace("  FocusedApplications:\n", "  FocusedDisplayId: 15\n  FocusedApplications:\n")).confirmed,"duplicate native display accepted"));
  test(()->check(!parse(report(0)+report(0)).confirmed,"duplicate native section accepted"));
  test(()->check(!parse(report(0).replace("DispatchEnabled: true","DispatchEnabled: false")).confirmed,"disabled input dispatcher accepted"));
  test(()->check(!parse(report(0).replace("DispatchFrozen: false","DispatchFrozen: true")).confirmed,"frozen input dispatcher accepted"));
  test(()->check(!parse(report(-1)).confirmed&&!parse(report(0).replace("FocusedDisplayId: 0","FocusedDisplayId: 2147483648")).confirmed,"invalid or overflowing display accepted"));
  test(()->{boolean limited=false;try{AtomicWorkbenchInputFocusSnapshot.read(new ByteArrayInputStream(new byte[AtomicWorkbenchInputFocusSnapshot.MAX_BYTES+1]));}catch(IOException expected){limited=true;}check(limited,"input dump byte limit missing");});
  test(()->check(!parse(report(0).replace("  InputFilterEnabled: false", "x".repeat(200))).confirmed,"oversized native field accepted"));
  test(()->{fixture(report(0));int n=calls.get();android.os.Process.uid=10055;check(!AtomicWorkbenchInputFocusProbe.primaryConfirmed()&&calls.get()==n,"ordinary process started root input probe");android.os.Process.uid=0;});
  test(()->{fixture(report(0));int n=finished.get();check(AtomicWorkbenchInputFocusProbe.primaryConfirmed(),"actual observer did not accept native primary snapshot");waitDone(n+1);});
  test(()->{fixture(report(15));int n=finished.get();check(!AtomicWorkbenchInputFocusProbe.primaryConfirmed(),"virtual dispatcher focus falsely confirmed primary");waitDone(n+1);});
  test(()->{ServiceManager.service=null;check(!AtomicWorkbenchInputFocusProbe.primaryConfirmed(),"absent service fabricated focus");fixture(report(0));int n=finished.get();check(AtomicWorkbenchInputFocusProbe.primaryConfirmed(),"service failure permanently poisoned observer");waitDone(n+1);});
  test(()->{fixture(report(0));throwsDump=true;int n=finished.get();check(!AtomicWorkbenchInputFocusProbe.primaryConfirmed(),"failed Binder dump fabricated focus");waitDone(n+1);});
  test(()->{fixture(report(15));hold=new CountDownLatch(1);entered=new CountDownLatch(1);int n=calls.get(),done=finished.get();
   try {long start=System.nanoTime();check(!AtomicWorkbenchInputFocusProbe.primaryConfirmed(),"timeout certified unconfirmed input");check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-start)<1000,"probe wait unbounded");
    check(entered.getCount()==0&&calls.get()==n+1,"dump did not enter expected boundary");check(!AtomicWorkbenchInputFocusProbe.primaryConfirmed()&&calls.get()==n+1,"timeout spawned another Binder dump");
    payload=report(0);
   } finally {hold.countDown();}waitDone(done+1);hold=null;
   check(AtomicWorkbenchInputFocusProbe.primaryConfirmed()&&calls.get()==n+2,"late old snapshot was reused for new focus proof");waitDone(done+2);
  });
  check(ParcelFileDescriptor.descriptors.isEmpty(),"native probe left pipe resources");
  System.out.println("INPUT FOCUS PROBE RESULT "+cases+" cases; "+checks+" assertions; no phone Binder execution claimed");
 }
}'''


def main():
    source = {name: (SRC / name).read_text(encoding="utf-8") for name in ("AtomicWorkbenchInputFocusSnapshot.java", "AtomicWorkbenchInputFocusProbe.java")}
    variants = [("production", None, None, None, None)]
    variants += [
        ("PRIMARY_REQUIRES_DISPLAY_ZERO", "AtomicWorkbenchInputFocusProbe.java", "job.snapshot.displayId == 0", "job.snapshot.displayId >= 0", "virtual dispatcher focus falsely confirmed primary"),
        ("STUCK_DUMP_REMAINS_SINGLE_FLIGHT", "AtomicWorkbenchInputFocusProbe.java", "if (active != null) return false;", "if (active != null) active = null;", "timeout spawned another Binder dump"),
        ("TIMEOUT_NEVER_CERTIFIES_FOCUS", "AtomicWorkbenchInputFocusProbe.java", "if (!job.done.await(400L, TimeUnit.MILLISECONDS)) return false;", "if (!job.done.await(400L, TimeUnit.MILLISECONDS)) return true;", "timeout certified unconfirmed input"),
        ("DUPLICATE_DISPLAY_FIELD_REJECTED", "AtomicWorkbenchInputFocusSnapshot.java", "displays == 1", "displays >= 1", "duplicate native display accepted"),
        ("NATIVE_DUMP_LIMIT_IS_REAL", "AtomicWorkbenchInputFocusSnapshot.java", 'if (++count > MAX_BYTES) throw new IOException("input_snapshot_limit");', "++count;", "input dump byte limit missing"),
    ]
    for label, filename, old, new, expected in variants:
        with tempfile.TemporaryDirectory(prefix="duo-input-focus-probe-") as temporary:
            work = Path(temporary)
            values = {"android/os/Process.java": "package android.os;public class Process {public static int uid;public static int myUid(){return uid;}}",
                "android/os/ParcelFileDescriptor.java": PFD,
                "android/os/IBinder.java": "package android.os;public interface IBinder{void dump(java.io.FileDescriptor fd,String[] args)throws Exception;}",
                "android/os/ServiceManager.java": "package android.os;public class ServiceManager {public static IBinder service;public static IBinder getService(String name){return service;}}",
                "ls/augment/com/TestInputFocusProbe.java": TEST}
            for name, text in source.items():
                if name == filename:
                    assert old in text, "probe mutation source changed: " + label
                    text = text.replace(old, new)
                values["ls/augment/com/" + name] = text
            # Boundary output is package-visible solely to the synthetic Binder implementation.
            values["android/os/ParcelFileDescriptor.java"] = values["android/os/ParcelFileDescriptor.java"].replace("final OutputStream output", "public final OutputStream output")
            files = []
            for name, text in values.items():
                path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(text, encoding="utf-8"); files.append(str(path))
            subprocess.run([SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-d", str(work), *files], check=True, timeout=45, env=SUPPORT["ENV"])
            run = subprocess.run([SUPPORT["JAVA"], "-cp", str(work), "ls.augment.com.TestInputFocusProbe",
                str(ROOT / "audit-output/workbench-completion-20261016/multiwindow/baseline-input.txt"),
                str(ROOT / "audit-output/workbench-completion-20261016/multiwindow/inflight-input.txt")],
                capture_output=expected is not None, text=True, timeout=30, env=SUPPORT["ENV"])
            if expected is None: run.check_returncode()
            else:
                assert run.returncode != 0 and expected in run.stdout + run.stderr, "uncaught probe mutation: " + label
                print("PASS rejected input probe negative:", label)


if __name__ == "__main__":
    main()
