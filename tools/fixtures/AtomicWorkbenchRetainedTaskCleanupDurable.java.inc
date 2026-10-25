package ls.augment.com;
import android.os.*;import android.content.*;import android.system.*;import java.nio.file.*;import java.util.*;
public final class TaskOpsBridge {
 public interface Step{void run()throws Throwable;}
 static int count;
 static void check(boolean b,String m){if(!b)throw new AssertionError(m);}
 public static void run(Context c,RootCredentials credentials,TaskTransport transport,AtomicWorkbenchTaskIdentity identity,Step pressure,Step dead,String fault)throws Throwable{
  Path data=Files.createTempDirectory(Path.of(System.getProperty("test.data")),"durable-");c.pm.info.dataDir=data.toString();Os.chown(data.toString(),10055,10055);
  AtomicWorkbenchTaskShelfStore store=new AtomicWorkbenchTaskShelfStore(c,10055,0);AtomicWorkbenchEngine engine=new AtomicWorkbenchEngine();
  for(var window:engine.windows)window.live=false;
  AtomicWorkbenchPlatform p=engine.windows[0];p.live=true;p.journal=new AtomicWorkbenchJournal(c,10055,0,0);p.journal.acquireLock();
  var record=new AtomicWorkbenchJournal.Record(10055,0,0);record.displayId=identity.displayId;record.uniqueId=identity.displayUnique;record.width=1080;record.height=2400;record.density=420;record.state="active";
  var json=record.json();json.put("session",AtomicWorkbenchPlatform.SESSIONS[0]);json.put("display_name",identity.displayName);p.record=AtomicWorkbenchJournal.Record.fromJson(json);p.journal.save(p.record);
  AtomicWorkbenchTaskOperations owner=new AtomicWorkbenchTaskOperations(engine,transport.authority(),store);
  var request=new AtomicWorkbenchTaskOperationRequest(String.format("%032x",900000+(++count)),AtomicWorkbenchTaskOperationRequest.Action.END_TASK,identity,0,AtomicWorkbenchPlatform.SESSIONS[0],identity.displayId,identity.displayName,identity.displayUnique,-1,"",String.format("%032x",910000+count),0,0,SystemClock.now,SystemClock.now+5000,"c".repeat(32));
  // The controlled Binder seam arms the OS failure only after the actual broker apply
  // returned a real native-terminal proof. The actual Store/Journal methods then fail.
  faultKind=fault;
  try{
   Bundle changed=owner.change(request.toBundle());
   check(changed.getBoolean("operation_unconfirmed")&&!changed.getBoolean("success")&&owner.hasPending(),"actual durable fsync failure did not retain TaskOps responsibility");
   check(store.read().records.size()==1&&store.read().records.get(0).hasResponsibility(),"actual Store lost unacknowledged operation");
   check(Os.injectedFsyncFailures==1,"requested actual fsync boundary was not reached");
   pressure.run();dead.run();
   check(owner.cleanup().getBoolean("success")&&!owner.hasPending(),"real TaskOps dead-owner cleanup did not converge after retained receipt");
   check(store.read().records.get(0).phase==AtomicWorkbenchTaskShelfStore.Phase.TERMINAL&&!store.read().records.get(0).hasResponsibility(),"durable TaskOps terminal ack missing");
   check(p.journal.read().taskOperations.isEmpty()&&p.journal.read().tasks.get(0).disposition.equals("ENDED"),"real Journal final ack missing");
  }finally{faultKind="";p.journal.releaseLock();Os.cleanup();}
 }
 private static String faultKind="";
 public static void afterActualApply(){if(faultKind.equals("store"))Os.failDirectorySync=true;else if(faultKind.equals("journal"))Os.failAfterJournalRename=true;faultKind="";}
}
