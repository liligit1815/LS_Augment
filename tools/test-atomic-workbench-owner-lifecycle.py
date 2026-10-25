"""Execute the Root owner-death fallback and cleanup scheduling without a device."""
from pathlib import Path
import runpy
import subprocess
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))
JAVA_SUPPORT = SUPPORT["SUPPORT"]
SRC = SUPPORT["SRC"]
member = SUPPORT["member"]

STUBS = {
    "android/os/RemoteException.java": "package android.os;public class RemoteException extends Exception {}",
    "android/os/IBinder.java": "package android.os;public interface IBinder {interface DeathRecipient{void binderDied();}void linkToDeath(DeathRecipient recipient,int flags)throws RemoteException;boolean isBinderAlive();}",
    "android/os/Binder.java": "package android.os;public class Binder {public static long clearCallingIdentity(){return 1;}public static void restoreCallingIdentity(long identity){}}",
    "android/os/Bundle.java": JAVA_SUPPORT["BUNDLE"],
}

HEAD = r'''package ls.augment.com;import android.os.*;import java.util.*;
public class AtomicWorkbenchRoot {
 IBinder owner;boolean closing,finished;int recoveryAttempt,clears,closeCalls,finishes;String closeReason="none";
 boolean cleanupSucceeds=true;final List<String> events=new ArrayList<>();final Queue engine=new Queue();
 static class Queue {final Map<Runnable,Long> waiting=new LinkedHashMap<>();boolean accepting=true;
  boolean postDelayed(Runnable r,long delay){if(accepting)waiting.put(r,delay);return accepting;}
  void removeCallbacks(Runnable r){waiting.remove(r);}void run(Runnable r){waiting.remove(r);r.run();}}
 static class Owner implements IBinder {boolean alive=true,throwOnLink;int links;DeathRecipient death;
  public void linkToDeath(DeathRecipient d,int flags)throws RemoteException{links++;if(throwOnLink)throw new RemoteException();death=d;}
  public boolean isBinderAlive(){return alive;}void die(){alive=false;if(death!=null)death.binderDied();}}
 void lifecycle(String event,String detail,Throwable error){events.add(event+" "+detail);}
 void clearInputs(){clears++;}
 Bundle closeOnce(){closeCalls++;Bundle b=new Bundle();b.putBoolean("success",cleanupSucceeds);b.putBoolean("recovery_pending",!cleanupSucceeds);return b;}
 void finishLater(){finished=true;finishes++;engine.removeCallbacks(recover);engine.removeCallbacks(checkOwner);}
'''

TEST = r'''
 static int cases,assertions;static void check(boolean value,String message){assertions++;if(!value)throw new AssertionError(message);}
 interface Case{void run()throws Exception;}static void test(String name,Case body)throws Exception{body.run();cases++;System.out.println("PASS owner lifecycle: "+name);}
 public static void main(String[] args)throws Exception{
  test("live owner keeps one watcher without touching tasks",()->{
   var r=new AtomicWorkbenchRoot();var o=new Owner();r.bindOwner(o);r.bindOwner(o);
   check(o.links==1&&r.engine.waiting.size()==1,"duplicate owner registration");
   r.engine.run(r.checkOwner);check(!r.closing&&r.closeCalls==0&&r.engine.waiting.get(r.checkOwner)==1000L,"live owner cleanup");});
  test("binder death immediately schedules cleanup and confirmed cleanup exits",()->{
   var r=new AtomicWorkbenchRoot();var o=new Owner();r.bindOwner(o);o.die();
   check(r.closing&&"owner_died".equals(r.closeReason)&&r.engine.waiting.containsKey(r.recover),"death ignored");
   r.engine.run(r.recover);check(r.closeCalls==1&&r.finished&&r.finishes==1&&!r.engine.waiting.containsKey(r.checkOwner),"safe exit missing");});
  test("missing death callback is caught by liveness watch",()->{
   var r=new AtomicWorkbenchRoot();var o=new Owner();r.bindOwner(o);o.alive=false;r.engine.run(r.checkOwner);
   check(r.closing&&"owner_unavailable".equals(r.closeReason)&&r.clears==1,"orphan did not enter cleanup");
   check(r.engine.waiting.size()==1&&r.engine.waiting.containsKey(r.recover),"watcher kept scheduling after death");});
  test("incomplete cleanup retains root and retries instead of claiming completion",()->{
   var r=new AtomicWorkbenchRoot();var o=new Owner();r.bindOwner(o);r.cleanupSucceeds=false;o.die();r.engine.run(r.recover);
   check(!r.finished&&r.recoveryAttempt==1&&r.engine.waiting.get(r.recover)==2000L,"pending cleanup lost");
   r.cleanupSucceeds=true;r.engine.run(r.recover);check(r.finished&&r.closeCalls==2,"cleanup cannot converge");});
  test("owner already dead during registration is handled",()->{
   var r=new AtomicWorkbenchRoot();var o=new Owner();o.alive=false;r.bindOwner(o);
   check(r.closing&&"owner_already_dead".equals(r.closeReason),"dead registration accepted as active");});
  test("owner cannot be substituted by a different binder",()->{
   var r=new AtomicWorkbenchRoot();var o=new Owner();r.bindOwner(o);boolean rejected=false;
   try{r.bindOwner(new Owner());}catch(SecurityException expected){rejected=true;}
   check(rejected&&r.owner==o&&r.engine.waiting.size()==1,"owner substitution permitted");});
  test("finished or already closing root does not restart owner checks",()->{
   for(boolean done:new boolean[]{false,true}){var r=new AtomicWorkbenchRoot();var o=new Owner();r.bindOwner(o);
    r.finished=done;r.closing=!done;r.engine.run(r.checkOwner);check(r.engine.waiting.isEmpty()&&r.closeCalls==0,"terminal watch continued");}});
  System.out.println("OWNER LIFECYCLE RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''


def main():
    source = (SRC / "AtomicWorkbenchRoot.java").read_text(encoding="utf-8")
    methods = "\n".join(member(source, signature) + (";" if "Runnable" in signature or "DeathRecipient" in signature else "")
                        for signature in ("private final IBinder.DeathRecipient ownerDeath", "private void bindOwner",
                                          "private final Runnable checkOwner", "private void requestRecovery(String reason)",
                                          "private synchronized void scheduleRecovery", "private final Runnable recover"))
    sources = dict(STUBS)
    sources["ls/augment/com/AtomicWorkbenchRoot.java"] = HEAD + methods + TEST
    with tempfile.TemporaryDirectory(prefix="lsa-owner-lifecycle-") as temporary:
        work = Path(temporary)
        files = []
        for name, content in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            files.append(str(path))
        subprocess.run([JAVA_SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-d", str(work), *files], check=True, timeout=60, env=JAVA_SUPPORT["ENV"])
        subprocess.run([JAVA_SUPPORT["JAVA"], "-cp", str(work), "ls.augment.com.AtomicWorkbenchRoot"], check=True, timeout=30, env=JAVA_SUPPORT["ENV"])


if __name__ == "__main__":
    main()
