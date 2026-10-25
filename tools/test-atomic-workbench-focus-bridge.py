"""Run the real managed-app bridge and focus guard against controlled Binder/WMS boundaries."""
from pathlib import Path
import runpy
import subprocess
import tempfile
import sys

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")
BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-input-focus-guard.py")))
ROOT, JAVA, JAVAC, ENV = (BASE[key] for key in ("ROOT", "JAVA", "JAVAC", "ENV"))
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com"
STUBS = dict(BASE["STUBS"])
STUBS.update({
"android/os/RemoteException.java": "package android.os;public class RemoteException extends Exception {}",
"android/os/IBinder.java": r'''package android.os;public interface IBinder {interface DeathRecipient{void binderDied();}boolean isBinderAlive();void linkToDeath(DeathRecipient d,int flags)throws RemoteException;boolean unlinkToDeath(DeathRecipient d,int flags);}''',
"android/os/Binder.java": r'''package android.os;import java.util.*;public class Binder implements IBinder {
 public static final ThreadLocal<Integer> CALL_UID=ThreadLocal.withInitial(()->0),CALL_PID=ThreadLocal.withInitial(()->333);
 public volatile boolean alive=true;public volatile int unlinkFailures;public int links,unlinks;public final Set<DeathRecipient> deaths=Collections.synchronizedSet(new HashSet<>());
 public static int getCallingUid(){return CALL_UID.get();}public static int getCallingPid(){return CALL_PID.get();}public boolean isBinderAlive(){return alive;}
 public synchronized void linkToDeath(DeathRecipient d,int f)throws RemoteException{if(!alive)throw new RemoteException();links++;deaths.add(d);}
 public synchronized boolean unlinkToDeath(DeathRecipient d,int f){unlinks++;if(unlinkFailures-->0)throw new IllegalStateException("synthetic-private-text");return deaths.remove(d);}
 public void kill(){List<DeathRecipient> snapshot;synchronized(this){alive=false;snapshot=new ArrayList<>(deaths);deaths.clear();}for(DeathRecipient d:snapshot)d.binderDied();}}
''',
"android/os/Bundle.java": r'''package android.os;import java.util.*;public class Bundle {
 private final Map<String,Object> values=new HashMap<>();public void putInt(String k,int v){values.put(k,v);}public int getInt(String k,int d){return (Integer)values.getOrDefault(k,d);}
 public void putString(String k,String v){values.put(k,v);}public String getString(String k,String d){return (String)values.getOrDefault(k,d);}public String getString(String k){return getString(k,null);}
 public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k){return getBoolean(k,false);}public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);}public boolean containsKey(String k){return values.containsKey(k);}}
''',
"android/hardware/display/DisplayManager.java": r'''package android.hardware.display;import android.os.*;import android.view.*;import java.util.*;import java.util.concurrent.*;public class DisplayManager {
 public interface DisplayListener{void onDisplayAdded(int id);void onDisplayRemoved(int id);void onDisplayChanged(int id);}
 public final Map<Integer,Display> values=new ConcurrentHashMap<>();public final List<DisplayListener> listeners=new CopyOnWriteArrayList<>();public volatile int unregisterFailures;public volatile int unregisters;
 public Display getDisplay(int id){return values.get(id);}public void registerDisplayListener(DisplayListener l,Handler h){listeners.add(l);}
 public void unregisterDisplayListener(DisplayListener l){unregisters++;if(unregisterFailures-->0)throw new IllegalStateException("synthetic-private-text");listeners.remove(l);}
 public void remove(int id){values.remove(id);for(DisplayListener l:listeners)l.onDisplayRemoved(id);}public void changed(int id){for(DisplayListener l:listeners)l.onDisplayChanged(id);}}
''',
})
STUBS["android/os/Looper.java"] = STUBS["android/os/Looper.java"].replace(
    "public static Looper myLooper()", "public static Looper getMainLooper(){return new Looper();}public static Looper myLooper()")
STUBS["android/content/Context.java"] = STUBS["android/content/Context.java"].replace(
    'public String getPackageName()', 'public Context getApplicationContext(){return this;}public android.content.pm.ApplicationInfo getApplicationInfo(){return packages.app;}public String getPackageName()')
STUBS["android/view/WindowManager.java"] = STUBS["android/view/WindowManager.java"].replace(
    "public volatile boolean autoFocus=true", "public volatile String authorizedUnique;public volatile boolean autoFocus=true").replace(
    "if(preRegistrationFailure)throw", "if(authorizedUnique!=null&&!p.title.equals(title(view.getDisplay().getDisplayId(),authorizedUnique)))throw new BadTokenException();if(preRegistrationFailure)throw").replace(
    "private static void await(CountDownLatch gate)", '''private static String title(int display,String unique){try{byte[] bytes=java.security.MessageDigest.getInstance("SHA-256").digest(unique.getBytes(java.nio.charset.StandardCharsets.UTF_8));return "DuoAtomicInputFocus-"+display+"-"+java.util.HexFormat.of().formatHex(bytes);}catch(Exception e){throw new AssertionError(e);}}private static void await(CountDownLatch gate)''')

TEST = r'''package ls.augment.com;
import android.content.*;import android.os.*;import android.view.*;import java.util.concurrent.*;import java.util.function.*;
public final class TestAtomicWorkbenchFocusBridge {
 static int cases,checks;interface Work{void run()throws Exception;}
 static void check(boolean v,String message){checks++;if(!v)throw new AssertionError(message);}
 static void until(BooleanSupplier c,String message)throws Exception{long end=System.nanoTime()+5_000_000_000L;while(!c.getAsBoolean()){if(System.nanoTime()>end)throw new AssertionError(message);Thread.sleep(5);}checks++;}
 static void run(String name,Work work)throws Exception{work.run();cases++;System.out.println("PASS managed focus bridge: "+name);}
 static void denied(Work work)throws Exception{try{work.run();throw new AssertionError("unauthenticated operation accepted");}catch(SecurityException expected){checks++;}}
 static Bundle identity(Display d,String unique){Bundle b=new Bundle();b.putInt("window_id",0);b.putInt("display_id",d.id);b.putString("display_name",d.name);b.putString("unique_id",unique);return b;}
 static Bundle state(Bundle b,boolean success,boolean suspended,boolean pending){for(String key:new String[]{"success","focus_suspended","cleanup_pending","message","focus_reason"})check(b.containsKey(key),"missing explicit result field: "+key);check(b.getBoolean("success")==success,"wrong success: "+b.getString("focus_reason"));check(b.getBoolean("focus_suspended")==suspended,"wrong focus suspension");check(b.getBoolean("cleanup_pending")==pending,"wrong pending responsibility");check(!b.getString("message").contains("synthetic-private-text"),"private failure text leaked");return b;}
 static final class Fixture {final Context c=new Context();final Display d=new Display();final Binder root=new Binder();final AtomicWorkbenchFocusBridge bridge;
  Fixture(){c.displays.values.put(d.id,d);c.manager.authorizedUnique=d.unique;bridge=new AtomicWorkbenchFocusBridge(c,10515,0,root,333,99);}
  Bundle control(String action){return bridge.control(action,identity(d,d.unique));}
  void finish()throws Exception{bridge.requestClose();until(()->c.displays.listeners.isEmpty()&&root.deaths.isEmpty()&&HandlerThread.alive.get()==0,"bridge lifecycle not released");check(c.manager.owned.isEmpty(),"window ownership leaked");}
 }
 static final class Call {final CountDownLatch done=new CountDownLatch(1);volatile Bundle value;volatile Throwable failure;final Thread thread;Call(java.util.concurrent.Callable<Bundle> work){thread=new Thread(()->{try{value=work.call();}catch(Throwable e){failure=e;}finally{done.countDown();}});thread.start();}void join()throws Exception{check(done.await(5000,TimeUnit.MILLISECONDS),"bridge call unbounded");thread.join();if(failure!=null)throw new AssertionError(failure);}}
 public static void main(String[] args)throws Exception {
  android.os.Process.uid=10515;
  run("managed own-UID and authenticated Root PID entry",()->{
   Fixture f=new Fixture();Binder.CALL_UID.set(10515);denied(()->f.control("suspend"));Binder.CALL_UID.set(0);Binder.CALL_PID.set(334);denied(()->f.control("suspend"));Binder.CALL_PID.set(333);check(f.c.manager.adds==0,"denied caller touched WMS");f.finish();
   android.os.Process.uid=0;denied(()->new AtomicWorkbenchFocusBridge(new Context(),10515,0,new Binder(),333,99));android.os.Process.uid=10515;
   denied(()->new AtomicWorkbenchFocusBridge(new Context(),10515,1,new Binder(),333,99));
  });
  run("actual app window focus, exact unique hash, idempotence and precise cleanup",()->{
   Fixture f=new Fixture();state(f.control("suspend"),true,true,false);check(f.c.manager.last.isAttachedToWindow()&&f.c.manager.last.hasWindowFocus(),"not real focus callback");check(f.c.manager.params.type==2008&&f.c.windowType==2008,"unexpected overlay or window type");check(f.c.manager.params.title.matches("DuoAtomicInputFocus-51-[0-9a-f]{64}"),"unique generation absent from title");
   state(f.control("suspend"),true,true,false);check(f.c.manager.adds==1,"duplicate window");state(f.control("resume"),true,false,false);check(f.c.manager.owned.isEmpty(),"resume did not detach");state(f.control("close"),true,false,false);f.finish();
  });
  run("current user must be foreground and unlocked for new suspension",()->{
   Fixture f=new Fixture();f.c.users.foreground=false;state(f.control("suspend"),false,false,false);f.c.users.foreground=true;f.c.users.unlocked=false;state(f.control("suspend"),false,false,false);check(f.c.manager.adds==0,"inactive user created system window");f.finish();
  });
  run("missing display or same-ID name change cannot create window",()->{
   Fixture f=new Fixture();f.c.displays.values.clear();state(f.control("suspend"),false,false,false);f.c.displays.values.put(f.d.id,f.d);String name=f.d.name;f.d.name=name.replace("000001","000002");state(f.bridge.control("suspend",identity(new Display(),f.d.unique)),false,false,false);check(f.c.manager.adds==0,"stale display name accepted");f.finish();
  });
  run("old unique with same display ID and name is rejected by actual window boundary",()->{
   Fixture f=new Fixture();Bundle rejected=state(f.bridge.control("suspend",identity(f.d,"synthetic:old")),false,false,false);check(rejected.getString("focus_error_type").endsWith("BadTokenException"),"lost exact rejection type");check(f.c.manager.owned.isEmpty(),"old generation added window");state(f.control("suspend"),true,true,false);
   state(f.bridge.control("resume",identity(f.d,"synthetic:old")),false,true,true);check(f.c.manager.owned.size()==1,"mismatched cleanup touched current lease");state(f.control("close"),true,false,false);f.finish();
  });
  run("held exact lease remains removable after display gone and user locks/switches",()->{
   Fixture f=new Fixture();state(f.control("suspend"),true,true,false);f.c.displays.values.clear();f.c.users.foreground=false;f.c.users.unlocked=false;state(f.control("resume"),true,false,false);state(f.control("close"),true,false,false);f.finish();
  });
  run("successful resume releases empty capability before immediate VD reuse",()->{
   Fixture f=new Fixture();state(f.control("suspend"),true,true,false);state(f.control("resume"),true,false,false);f.d.name=f.d.name.replace("000001","000002");f.d.unique="synthetic:immediate-new";f.c.manager.authorizedUnique=f.d.unique;
   state(f.control("suspend"),true,true,false);check(f.c.manager.adds==2,"empty old capability blocked fresh slot");state(f.control("close"),true,false,false);f.finish();
  });
  run("Root Binder death asynchronously removes window and nonblocking close retains ownership",()->{
   Fixture f=new Fixture();state(f.control("suspend"),true,true,false);f.c.manager.removeGate=new CountDownLatch(1);long start=System.nanoTime();f.root.kill();check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-start)<100,"death callback waited for WMS");
   check(f.c.manager.removeEntered.await(1500,TimeUnit.MILLISECONDS),"death did not request cleanup");check(f.c.manager.owned.size()==1,"blocking setup ineffective");state(f.control("suspend"),false,false,true);f.c.manager.removeGate.countDown();f.finish();state(f.control("close"),true,false,false);
  });
  run("pending focus and busy request cannot survive Root death",()->{
   Fixture f=new Fixture();f.c.manager.autoFocus=false;Call pending=new Call(()->f.control("suspend"));check(f.c.manager.added.await(1500,TimeUnit.MILLISECONDS),"no add");until(()->f.c.manager.last.isAttachedToWindow(),"no real attach");check(pending.done.getCount()==1,"requestFocus falsely acknowledged");Bundle busy=f.control("resume");check(!busy.getBoolean("success")&&busy.getBoolean("cleanup_pending")&&"operation_busy".equals(busy.getString("focus_reason")),"concurrent operation raced window creation");f.root.kill();pending.join();check(!pending.value.getBoolean("success"),"late callback reported success after death");f.finish();
  });
  run("Root death retries real remove failure without discarding held guard",()->{
   Fixture f=new Fixture();state(f.control("suspend"),true,true,false);f.c.manager.removeFailures=1;f.root.kill();f.finish();check(f.c.manager.removes==2,"failed removal responsibility was lost");
  });
  run("listener unregister and death unlink failures both retry to actual completion",()->{
   Fixture f=new Fixture();state(f.control("suspend"),true,true,false);f.c.displays.unregisterFailures=1;f.root.unlinkFailures=1;f.bridge.requestClose();f.finish();check(f.c.displays.unregisters==2&&f.root.unlinks==2,"lifecycle failure stranded retry responsibility");
  });
  run("display retirement cleans exact old capability and permits fresh slot identity",()->{
   Fixture f=new Fixture();state(f.control("suspend"),true,true,false);Bundle old=identity(f.d,f.d.unique);f.c.displays.remove(f.d.id);until(()->f.c.manager.owned.isEmpty()&&HandlerThread.alive.get()==0,"removed display guard retained");
   f.d.name=f.d.name.replace("000001","000002");f.d.unique="synthetic:fresh";f.c.displays.values.put(f.d.id,f.d);f.c.manager.authorizedUnique=f.d.unique;state(f.control("suspend"),true,true,false);state(f.bridge.control("close",old),false,true,true);check(f.c.manager.owned.size()==1,"old close touched recycled display");state(f.control("close"),true,false,false);f.finish();
  });
  run("invalid shape and unsupported action stay fixed and content-free",()->{
   Fixture f=new Fixture();state(f.bridge.control("arbitrary",identity(f.d,f.d.unique)),false,false,false);state(f.bridge.control("suspend",null),false,false,false);Bundle malformed=identity(f.d,"bad\nprivate");state(f.bridge.control("suspend",malformed),false,false,false);check(f.c.manager.adds==0,"malformed request opened window");f.finish();
  });
  run("malformed request cannot certify no cleanup while another exact guard is owned",()->{
   Fixture f=new Fixture();state(f.control("suspend"),true,true,false);state(f.bridge.control("suspend",null),false,true,true);state(f.bridge.control("arbitrary",identity(f.d,f.d.unique)),false,true,true);check(f.c.manager.owned.size()==1,"invalid request touched existing capability");state(f.control("close"),true,false,false);f.finish();
  });
  System.out.println("PASS production managed focus bridge: "+cases+" cases, "+checks+" assertions");
 }
}
'''


def build_run(folder, guard, bridge, positive=True):
    for name, text in STUBS.items():
        target = folder / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding="utf-8")
    package = folder / "ls/augment/com"
    package.mkdir(parents=True, exist_ok=True)
    (package / "AtomicWorkbenchInputFocusGuard.java").write_text(guard, encoding="utf-8")
    (package / "AtomicWorkbenchFocusBridge.java").write_text(bridge, encoding="utf-8")
    (package / "AtomicWorkbenchSlotDomain.java").write_text((SOURCE / "AtomicWorkbenchSlotDomain.java").read_text(encoding="utf-8"), encoding="utf-8")
    (package / "TestAtomicWorkbenchFocusBridge.java").write_text(TEST, encoding="utf-8")
    result = subprocess.run([JAVAC, "-encoding", "UTF-8", "-d", str(folder / "classes"), *map(str, folder.rglob("*.java"))], capture_output=True, text=True, encoding="utf-8", env=ENV)
    if result.returncode:
        raise RuntimeError(result.stdout + result.stderr)
    result = subprocess.run([JAVA, "-Dfile.encoding=UTF-8", "-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8", "-cp", str(folder / "classes"), "ls.augment.com.TestAtomicWorkbenchFocusBridge"], capture_output=True, text=True, encoding="utf-8", env=ENV, timeout=25)
    if positive:
        print(result.stdout, end="")
        if result.returncode:
            raise RuntimeError(result.stderr)
    elif result.returncode == 0:
        raise AssertionError("negative control escaped managed lifecycle regression")


def main():
    guard = (SOURCE / "AtomicWorkbenchInputFocusGuard.java").read_text(encoding="utf-8")
    bridge = (SOURCE / "AtomicWorkbenchFocusBridge.java").read_text(encoding="utf-8")
    with tempfile.TemporaryDirectory(prefix="duo-managed-focus-") as temporary:
        folder = Path(temporary)
        build_run(folder / "production", guard, bridge)
        mutations = {
            "Root Binder death must own cleanup": bridge.replace("endpoint.linkToDeath(death, 0);", "/* mutant: no Root death ownership */"),
            "failed lifecycle cleanup cannot strand retryQueued": bridge.replace("retryQueued = false;", "retryQueued = true;"),
        }
        for index, (name, mutated) in enumerate(mutations.items()):
            if mutated == bridge:
                raise AssertionError("negative mutation had no effect")
            build_run(folder / f"negative-{index}", guard, mutated, False)
            print("PASS negative control: " + name)
        result = subprocess.run([JAVAC, "-encoding", "UTF-8", "-classpath", str(ROOT / "audit-output/android-sdk/platforms/android-36/android.jar"), "-d", str(folder / "sdk36"), str(SOURCE / "AtomicWorkbenchInputFocusGuard.java"), str(SOURCE / "AtomicWorkbenchFocusBridge.java")], capture_output=True, text=True, encoding="utf-8", env=ENV)
        if result.returncode:
            raise RuntimeError(result.stdout + result.stderr)
        print("PASS SDK36 production managed bridge and guard compilation")


if __name__ == "__main__":
    main()
