"""Actual Task install/handle/transport/shelf diagnostic stages with explicit ROM adapters.

No Android/device claim: exact named WM installation shapes and actual production methods
execute on the host. Authentication, Binder, disk-owner syscalls and diagnostic sinks are
controlled boundaries. Original broker/authority/transaction suites remain independent.
"""
from pathlib import Path
import argparse
import runpy
import tempfile

IPC = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-authority.py')))
OPS = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-operations.py')))
UI_ACTIVITY = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-ui-activity.py')))
MODELS = IPC['MODELS']

ROOT_DIAGNOSTICS = r'''package ls.augment.com;import java.util.*;
public final class AtomicWorkbenchDiagnostics{
 public static final List<String> events=new ArrayList<>();public static boolean fail;
 public static void reset(){events.clear();fail=false;}
 public static void emit(String event,int window,int user,String component,int display,String detail,Throwable error){
  if(fail)throw new AssertionError("SENSITIVE_TASK_CONTENT token=do-not-retain");
  events.add(event+" "+detail+" type="+AtomicWorkbenchLogPolicy.errorType(error)+" stack="+AtomicWorkbenchLogPolicy.stack(error));
 }
 public static void record(android.content.Context c,long generation,String event,int window,int user,String component,int display,String detail,Throwable error){emit(event,window,user,component,display,detail,error);}
}'''
TELEMETRY = r'''package ls.augment.com.hook;import java.util.*;import ls.augment.com.AtomicWorkbenchLogPolicy;
public final class HookTelemetry{
 public static final List<String> events=new ArrayList<>();public static Object wmLock;public static boolean fail;public static int lockedCalls;
 public static void reset(){events.clear();fail=false;lockedCalls=0;}
 static void atomicWorkbench(String level,String value,Throwable error){
  if(wmLock!=null&&Thread.holdsLock(wmLock)){lockedCalls++;throw new AssertionError("telemetry under WMS");}
  if(fail)throw new AssertionError("SENSITIVE_TASK_CONTENT token=do-not-retain");
  events.add(AtomicWorkbenchLogPolicy.safe(AtomicWorkbenchLogPolicy.safe(value))+" type="+AtomicWorkbenchLogPolicy.errorType(error)+" stack="+AtomicWorkbenchLogPolicy.stack(error));
 }
}'''

INSTALL_SHAPES = {
 'android/window/ITaskOrganizer.java': 'package android.window;public interface ITaskOrganizer{}',
 'android/app/ActivityManager.java': 'package android.app;public class ActivityManager{public static class RunningTaskInfo{}}',
 'com/android/server/wm/ConfigurationContainer.java': 'package com.android.server.wm;public class ConfigurationContainer{public final boolean isActivityTypeHomeOrRecents(){return false;}}',
 'com/android/server/wm/WindowContainer.java': 'package com.android.server.wm;public class WindowContainer extends ConfigurationContainer{}',
 'com/android/server/wm/TaskFragment.java': 'package com.android.server.wm;public class TaskFragment extends WindowContainer{public int mForceHiddenFlags;public final ActivityTaskSupervisor mTaskSupervisor=new ActivityTaskSupervisor();}',
 'com/android/server/wm/Task.java': '''package com.android.server.wm;import android.content.*;import android.window.ITaskOrganizer;
 public class Task extends TaskFragment{public final int mTaskId=42;public int mUserId,effectiveUid=10066;public Intent intent;public ComponentName realActivity;public ITaskOrganizer mTaskOrganizer;
 public boolean setForceHidden(int reason,boolean hidden){return true;}public boolean setTaskOrganizer(ITaskOrganizer organizer,boolean skip){return true;}
 public void moveToFront(String reason,Task task){}public void removeImmediately(String reason){}public void reparent(TaskDisplayArea area,boolean top){}
 public boolean isLeafTask(){return true;}public int getRootTaskId(){return 42;}public android.app.ActivityManager.RunningTaskInfo getTaskInfo(){return null;}public boolean isAlwaysOnTop(){return false;}}''',
 'com/android/server/wm/TaskDisplayArea.java': 'package com.android.server.wm;public class TaskDisplayArea{}',
 'com/android/server/wm/DisplayContent.java': 'package com.android.server.wm;public class DisplayContent{}',
 'com/android/server/wm/ActivityTaskSupervisor.java': 'package com.android.server.wm;public class ActivityTaskSupervisor{public void removeTask(Task task,boolean kill,boolean recents,String reason){}}',
 'com/android/server/wm/RootWindowContainer.java': 'package com.android.server.wm;public class RootWindowContainer{public Task anyTaskForId(int id,int mode){return null;}public DisplayContent getDisplayContent(int id){return null;}}',
 'com/android/server/wm/WindowManagerGlobalLock.java': 'package com.android.server.wm;public final class WindowManagerGlobalLock{}',
 'com/android/server/wm/WindowManagerService.java': '''package com.android.server.wm;import android.os.*;import android.content.*;
 public class WindowManagerService{public final WindowManagerGlobalLock mGlobalLock=new WindowManagerGlobalLock();public final RootWindowContainer mRoot=new RootWindowContainer();public final Context mContext=new Context();public final Handler mH=new Handler();public int mCurrentUserId;
 public boolean onTransact(int code,Parcel input,Parcel output,int flags){return false;}}''',
}

INSTALL_TEST = r'''package ls.augment.com.hook;import android.os.*;import java.lang.reflect.*;import java.util.*;
public final class TestTaskDiagnostics{
 static int cases,checks;interface Run{void run()throws Throwable;}
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void reset()throws Exception{HookTelemetry.reset();HookTelemetry.wmLock=null;
  for(String s:new String[]{"installed","transactionInstalled"})TestTaskBroker.fld(s).setBoolean(null,false);
  TestTaskBroker.fld("diagnosticBits").setInt(null,0);TestTaskBroker.fld("diagnosticCount").setLong(null,0);
  ((Set<?>)TestTaskBroker.fld("OBSERVERS").get(null)).clear();
  Arrays.fill((long[])TestTaskBroker.fld("diagnosticLast").get(null),0);Arrays.fill((long[])TestTaskBroker.fld("diagnosticSuppressed").get(null),0);
 }
 static void test(String name,Run run)throws Throwable{reset();run.run();check(HookTelemetry.lockedCalls==0,"diagnostic ran under WMS");cases++;System.out.println("PASS actual task diagnostics: "+name);}
 static String last(){check(!HookTelemetry.events.isEmpty(),"missing actual callback diagnostic");String s=HookTelemetry.events.get(HookTelemetry.events.size()-1);check(!s.contains("SENSITIVE_TASK_CONTENT")&&!s.contains("do-not-retain"),"content/message retained");return s;}
 static TestTaskBroker.Fixture fixture()throws Exception{var f=new TestTaskBroker.Fixture();AtomicWorkbenchSystemRootAuthority.current=f.owner;AtomicWorkbenchSystemRootAuthority.wmLock=f.s.mGlobalLock;AtomicWorkbenchSystemRootAuthority.currentAllowed=true;AtomicWorkbenchSystemRootAuthority.allowNested=false;HookTelemetry.wmLock=f.s.mGlobalLock;TestTaskBroker.fld("diagnosticGlobalLock").set(null,TestTaskBroker.Service.class.getField("mGlobalLock"));Binder.uid=0;Binder.pid=123;return f;}
 static Parcel input(String action){Parcel p=Parcel.obtain();p.writeInterfaceToken("ls.augment.com.atomic_task_operations.v1");p.writeInt(1);Bundle auth=new Bundle();auth.putString("nonce","a".repeat(32));p.writeBundle(auth);p.writeString(action);p.writeBundle(new Bundle());return p;}
 static Bundle handle(Object service,Parcel input,Parcel output)throws Throwable{TestTaskBroker.invoke("handle",new Class<?>[]{Object.class,Parcel.class,Parcel.class},service,input,output);return output==null?null:(Bundle)output.values.get(3);}
 static final class WriteFailure extends Error{WriteFailure(){super("SENSITIVE_TASK_CONTENT");}}
 public static class BadLockService extends TestTaskBroker.Service{public Object mGlobalLock;}
 public static void main(String[]args)throws Throwable{
  if(args.length>0){test("actual typed organizer mismatch is rejected by actual install",()->{int n=AtomicWorkbenchTaskOperationHook.install(new AugmentModule(),TestTaskDiagnostics.class.getClassLoader());check(n==0&&!AtomicWorkbenchTaskOperationHook.isInstalled(),"Object organizer impersonated actual ROM signature");check(last().contains("stage=TASK_ORGANIZER")&&last().contains("NoSuchMethodException"),"wrong mismatch stage/type");});return;}
  test("actual install resolves exact named ROM signatures and inherited fields",()->{AugmentModule m=new AugmentModule();check(AtomicWorkbenchTaskOperationHook.install(m,TestTaskDiagnostics.class.getClassLoader())==5,"actual install not completed");check(m.callbacks.size()==5&&m.deopts==5&&AtomicWorkbenchTaskOperationHook.isInstalled(),"not all five real hooks registered");String s=last();check(s.contains("ATOMIC_TASK_INSTALL")&&s.contains("owner_id=TASK_C13_DIAG_01")&&s.contains("diag_abi=1")&&s.contains("server_pid=3408")&&s.contains("hook_bits=31")&&s.contains("stage=COMPLETE")&&s.contains("success=true"),"owner/ABI/registration facts lost through twice-safe");check(com.android.server.wm.Task.class.getMethod("setTaskOrganizer",android.window.ITaskOrganizer.class,boolean.class).getReturnType()==boolean.class,"organizer shape simplified");int before=m.callbacks.size();check(AtomicWorkbenchTaskOperationHook.install(m,TestTaskDiagnostics.class.getClassLoader())==5&&m.callbacks.size()==before&&m.deopts==5,"already installed path changed");});
  test("missing actual class reports exact install stage and original zero",()->{ClassLoader loader=new ClassLoader(TestTaskDiagnostics.class.getClassLoader()){@Override protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException{if(n.equals("com.android.server.wm.Task"))throw new ClassNotFoundException("SENSITIVE_TASK_CONTENT");return super.loadClass(n,resolve);}};check(AtomicWorkbenchTaskOperationHook.install(new AugmentModule(),loader)==0,"missing class installed");check(last().contains("stage=TASK_CLASS")&&last().contains("ClassNotFoundException")&&last().contains("hook_bits=0"),"class stage wrong");});
  test("deopt and partial registration fail without false COMPLETE",()->{AugmentModule m=new AugmentModule();m.failDeopt=true;check(AtomicWorkbenchTaskOperationHook.install(m,TestTaskDiagnostics.class.getClassLoader())==0&&last().contains("stage=DEOPT_onTransact"),"deopt stage wrong");reset();m=new AugmentModule();m.failRegistration=3;check(AtomicWorkbenchTaskOperationHook.install(m,TestTaskDiagnostics.class.getClassLoader())==0,"partial registration passed");check(last().contains("stage=REGISTER_setTaskOrganizer")&&last().contains("hook_bits=3")&&!AtomicWorkbenchTaskOperationHook.isInstalled(),"confirmed partial bits wrong");m.failRegistration=0;check(AtomicWorkbenchTaskOperationHook.install(m,TestTaskDiagnostics.class.getClassLoader())==5&&last().contains("hook_bits=31"),"original partial retry did not recover");});
  test("diagnostic sink throw cannot change successful install",()->{HookTelemetry.fail=true;check(AtomicWorkbenchTaskOperationHook.install(new AugmentModule(),TestTaskDiagnostics.class.getClassLoader())==5&&AtomicWorkbenchTaskOperationHook.isInstalled(),"observer changed install");});
  test("actual handle writes unchanged success after original dispatch outside WMS",()->{var f=fixture();Bundle b=handle(f.s,input("primary_display"),Parcel.obtain());check(b.getBoolean("success")&&Binder.uid==0,"actual handle success/identity changed");check(last().contains("stage=COMPLETE")&&last().contains("action=primary_display")&&last().contains("result=REPLY_WRITTEN"),"request completion lost");});
  test("shape and interface retain original fixed rejection",()->{var f=fixture();Parcel p=input("primary_display");p.sizeOverride=48*1024+1;check(!handle(f.s,p,Parcel.obtain()).getBoolean("success")&&last().contains("stage=SHAPE"),"shape stage/rejection changed");reset();f=fixture();p=input("primary_display");p.values.set(0,"SENSITIVE_TASK_CONTENT");check(!handle(f.s,p,Parcel.obtain()).getBoolean("success")&&last().contains("stage=INTERFACE"),"interface stage/rejection changed");});
  test("auth watch current and locked-session failures are distinct",()->{var f=fixture();Binder.uid=10055;check(!handle(f.s,input("primary_display"),Parcel.obtain()).getBoolean("success")&&last().contains("stage=AUTH"),"auth stage wrong");reset();f=fixture();f.owner.endpoint=new TestTaskBroker.Live(){@Override public void linkToDeath(IBinder.DeathRecipient r,int flags){throw new SecurityException("SENSITIVE_TASK_CONTENT");}};check(!handle(f.s,input("primary_display"),Parcel.obtain()).getBoolean("success")&&last().contains("stage=WATCH"),"watch stage wrong");reset();f=fixture();AtomicWorkbenchSystemRootAuthority.currentAllowed=false;check(!handle(f.s,input("primary_display"),Parcel.obtain()).getBoolean("success")&&last().contains("stage=CURRENT"),"current stage wrong");reset();f=fixture();f.s.mCurrentUserId=1;check(!handle(f.s,input("primary_display"),Parcel.obtain()).getBoolean("success")&&last().contains("stage=SESSION"),"locked session stage wrong");});
  test("lock lookup and actual dispatch failure remain rejected after lock release",()->{var f=fixture();check(!handle(new BadLockService(),input("primary_display"),Parcel.obtain()).getBoolean("success")&&last().contains("stage=LOCK"),"lock stage wrong");reset();f=fixture();f.s.mRoot.displays.remove(0);check(!handle(f.s,input("primary_display"),Parcel.obtain()).getBoolean("success")&&last().contains("stage=DISPATCH")&&Binder.uid==0,"dispatch failure/identity changed");});
  test("unknown action cannot copy caller text into diagnostic",()->{var f=fixture();check(!handle(f.s,input("SENSITIVE_TASK_CONTENT"),Parcel.obtain()).getBoolean("success")&&last().contains("action=UNKNOWN"),"unknown action copied");});
  test("write throw preserves same throwable and exact write stage",()->{var f=fixture();WriteFailure failure=new WriteFailure();Parcel p=new Parcel(){@Override public void writeBundle(Bundle b){throw failure;}};boolean same=false;try{handle(f.s,input("primary_display"),p);}catch(WriteFailure e){same=e==failure;}check(same&&last().contains("stage=WRITE")&&last().contains("NO_REPLY_CONFIRMED"),"write failure swallowed/replaced");});
  test("observer throw and bounded repeat suppression do not alter request",()->{var f=fixture();HookTelemetry.fail=true;check(handle(f.s,input("primary_display"),Parcel.obtain()).getBoolean("success"),"observer changed handle");reset();f=fixture();for(int i=0;i<3;i++)check(handle(f.s,input("primary_display"),Parcel.obtain()).getBoolean("success"),"repeat changed reply");check(HookTelemetry.events.size()==1,"repeat not bounded");((long[])TestTaskBroker.fld("diagnosticLast").get(null))[5]=System.nanoTime()-4_000_000_000L;handle(f.s,input("primary_display"),Parcel.obtain());check(last().contains("suppressed=2")&&last().contains("count=4"),"repeat losses not visible");});
  test("outer actual WMS lock skips both successful and early failed observation",()->{var f=fixture();AtomicWorkbenchSystemRootAuthority.allowNested=true;synchronized(f.s.mGlobalLock){Bundle b=handle(f.s,input("primary_display"),Parcel.obtain());check(b.getBoolean("success")&&HookTelemetry.events.isEmpty(),"nested success changed or emitted");Binder.uid=10055;b=handle(f.s,input("primary_display"),Parcel.obtain());check(!b.getBoolean("success")&&"task_authority_rejected".equals(b.getString("reason"))&&HookTelemetry.events.isEmpty(),"nested early failure changed or emitted");}check(HookTelemetry.lockedCalls==0,"format/queue attempted under outer WMS");});
  test("missing or unreadable cached diagnostic Field does not change actual business",()->{var f=fixture();TestTaskBroker.fld("diagnosticGlobalLock").set(null,null);check(handle(f.s,input("primary_display"),Parcel.obtain()).getBoolean("success")&&HookTelemetry.events.isEmpty(),"missing observer Field affected business");TestTaskBroker.fld("diagnosticGlobalLock").set(null,com.android.server.wm.WindowManagerService.class.getField("mGlobalLock"));check(handle(f.s,input("primary_display"),Parcel.obtain()).getBoolean("success")&&HookTelemetry.events.isEmpty(),"unreadable observer Field affected business");});
  System.out.println("TASK DIAGNOSTICS INSTALL/HANDLE RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''

TRANSPORT_TEST = r'''package ls.augment.com;import android.os.*;import android.content.Context;import ls.augment.com.hook.*;
public final class TestTaskTransportDiagnostics{
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static String last(){check(!AtomicWorkbenchDiagnostics.events.isEmpty(),"missing transport diagnostic");String s=AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1);check(!s.contains("SENSITIVE_TASK_CONTENT")&&!s.contains("do-not-retain"),"message retained");return s;}
 public static void main(String[]args)throws Throwable{
  String[][] stages={{"false","TRANSACT"},{"throw","TRANSACT"},{"remote-exception","REMOTE_EXCEPTION"},{"echo","ENVELOPE"},{"oversize","ENVELOPE"},{"schema","RESULT_DTO"}};
  for(String[] p:stages){AtomicWorkbenchDiagnostics.reset();var f=new TestTaskAuthority.Fixture();f.remote.mode=p[0];boolean unknown=false;try{f.authority.primaryDisplay();}catch(AtomicWorkbenchTaskAuthority.Unconfirmed e){unknown=!e.mutationAttempted;}check(unknown&&last().contains("stage="+p[1]),"transport stage or responsibility wrong "+p[0]);if(p[0].equals("throw"))check(last().contains("type=java.lang.Exception")&&!last().contains("type=ls.augment.com.AtomicWorkbenchTaskAuthority$Unconfirmed"),"original transport exception lost under wrapper");if(p[0].equals("remote-exception"))check(last().contains("type=java.lang.SecurityException"),"original remote exception lost under wrapper");}
  AtomicWorkbenchDiagnostics.reset();var f=new TestTaskAuthority.Fixture();check(f.authority.primaryDisplay().getBoolean("success")&&last().contains("stage=COMPLETE"),"success changed");
  AtomicWorkbenchDiagnostics.reset();var a=new AtomicWorkbenchTaskAuthority(new Context(),()->{throw new SecurityException("SENSITIVE_TASK_CONTENT token=do-not-retain");});boolean original=false;try{a.primaryDisplay();}catch(SecurityException e){original=true;}check(original&&last().contains("stage=AUTH_METADATA"),"pretransport auth exception replaced");
  AtomicWorkbenchDiagnostics.reset();f=new TestTaskAuthority.Fixture();AtomicWorkbenchDiagnostics.fail=true;check(f.authority.primaryDisplay().getBoolean("success"),"root diagnostic throw changed transport");
  System.out.println("TASK DIAGNOSTICS TRANSPORT RESULT 9 cases; "+checks+" assertions");
 }
}'''

SHELF_TEST = r'''package ls.augment.com;import android.os.*;import android.system.*;import java.nio.file.*;import java.util.*;
public final class TestTaskShelfDiagnostics{
 static int cases,checks;interface Run{void run()throws Exception;}static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void test(String name,Run r)throws Exception{AtomicWorkbenchDiagnostics.reset();try{r.run();cases++;System.out.println("PASS actual shelf diagnostic: "+name);}finally{Os.cleanup();}}
 static String last(){check(!AtomicWorkbenchDiagnostics.events.isEmpty(),"shelf diagnostic missing");return AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1);}
 static void rejected(TestTaskOperations.Fixture f,String stage){int mutations=f.authority.applies,prepares=f.authority.prepares;Bundle b=f.owner.shelf();check(!b.getBoolean("success")&&"task_shelf_unavailable".equals(b.getString("reason")),"original shelf failure changed");check(last().contains("stage="+stage)&&last().contains("success=false"),"wrong shelf stage "+stage);check(mutations==f.authority.applies&&prepares==f.authority.prepares,"observation dispatched mutation");}
 public static void main(String[]args)throws Exception{TestTaskOperations.root=Path.of(args[0]);
  test("actual empty Store still requires primary and inspect",()->{var f=new TestTaskOperations.Fixture();f.authority.failPrimary=true;rejected(f,"PRIMARY");});
  test("actual Store read failure preserves bytes and cached responsibility",()->{var f=new TestTaskOperations.Fixture();f.store.save(0,List.of());Path p=Path.of(f.c.pm.info.dataDir,"files/atomic_workbench/task-shelf.json");Files.writeString(p,"SENSITIVE_TASK_CONTENT");byte[] before=Files.readAllBytes(p);rejected(f,"STORE");check(Arrays.equals(before,Files.readAllBytes(p)),"diagnostic rewrote unknown Store");});
  test("inspect and reference DTO rejection remain distinct",()->{var f=new TestTaskOperations.Fixture();f.authority.diagnosticFailure="INSPECT";rejected(f,"INSPECT");var g=new TestTaskOperations.Fixture();g.change(AtomicWorkbenchTaskOperationRequest.Action.SHELVE,g.task);g.authority.diagnosticFailure="REFERENCE_DTO";rejected(g,"REFERENCE_DTO");});
  test("actual live-window describe and Task DTO failure are distinct",()->{var f=new TestTaskOperations.Fixture();f.authority.diagnosticFailure="DESCRIBE";rejected(f,"DESCRIBE");var g=new TestTaskOperations.Fixture();g.authority.diagnosticFailure="TASK_DTO";rejected(g,"TASK_DTO");});
  test("successful shelf and logger failure keep exact business snapshot",()->{var f=new TestTaskOperations.Fixture();Bundle before=f.owner.shelf();check(before.getBoolean("success")&&last().contains("stage=SNAPSHOT_DTO"),"snapshot completion missing");var g=new TestTaskOperations.Fixture();AtomicWorkbenchDiagnostics.fail=true;Bundle after=g.owner.shelf();check(after.getBoolean("success")&&after.getLong("shelf_revision",-1)==0&&!after.getBoolean("cleanup_pending")&&!after.getBoolean("operation_unconfirmed"),"observer changed snapshot flags");check(g.authority.applies==0&&g.authority.prepares==0,"snapshot observation mutated Task");});
  System.out.println("TASK DIAGNOSTICS SHELF RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''

UI_TEST = r'''
 static int cases,checks;interface Run{void run()throws Exception;}static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void test(String name,Run r)throws Exception{WORKER.jobs.clear();APP_READER.jobs.clear();APP_READER.failExecute=false;TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.set(false);AtomicWorkbenchDiagnostics.reset();SystemClock.now=1000;r.run();cases++;System.out.println("PASS actual task snapshot UI diagnostic: "+name);}
 static int[] callbacks=new int[2];
 void read(){readTaskSnapshot(s->callbacks[0]++,()->callbacks[1]++);}
 static void unknown(AtomicWorkbenchActivity a){check(callbacks[0]==0&&callbacks[1]>0&&!a.busy&&a.lastTaskSnapshot==null&&a.client.shelfReads==1,"original unknown callback or single read changed");}
 static String last(){check(!AtomicWorkbenchDiagnostics.events.isEmpty(),"missing UI snapshot diagnostic");String s=AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1);check(!s.contains("SENSITIVE_TASK_CONTENT")&&!s.contains("do-not-retain"),"UI diagnostic copied message");return s;}
 public static void main(String[]args)throws Exception{
  test("valid original DTO reads once without diagnostic",()->{callbacks=new int[2];var a=new AtomicWorkbenchActivity();a.read();a.all();check(a.client.shelfReads==1&&callbacks[0]==1&&callbacks[1]==0&&APP_READER.jobs.isEmpty()&&a.lastTaskSnapshot!=null,"valid snapshot behavior changed");});
  test("transport exception stays original unknown and READ",()->{callbacks=new int[2];var a=new AtomicWorkbenchActivity();a.client.throwShelf=true;a.read();a.all();unknown(a);check(APP_READER.jobs.size()==1,"missing bounded observation");APP_READER.drain();check(last().contains("stage=READ")&&last().contains("type=java.lang.Exception")&&!TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.get(),"READ stage or release wrong");});
  test("actual DTO rejection stays unknown and DTO",()->{callbacks=new int[2];var a=new AtomicWorkbenchActivity();a.client.shelf=new Bundle();a.read();a.all();unknown(a);APP_READER.drain();check(last().contains("stage=DTO")&&last().contains("type=java.lang.IllegalArgumentException"),"DTO rejection missing");});
  test("diagnostic record throw cannot change original unknown",()->{callbacks=new int[2];var a=new AtomicWorkbenchActivity();a.client.throwShelf=true;AtomicWorkbenchDiagnostics.fail=true;a.read();a.all();unknown(a);APP_READER.drain();check(!TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.get()&&a.client.shelfReads==1&&!a.busy,"throwing sink changed business or retained queue permit");});
  test("blocked reader allows only one diagnostic across Activity instances",()->{callbacks=new int[2];AtomicWorkbenchActivity a=new AtomicWorkbenchActivity(),b=new AtomicWorkbenchActivity();a.client.throwShelf=b.client.throwShelf=true;a.read();a.all();b.read();b.all();check(a.client.shelfReads==1&&b.client.shelfReads==1&&callbacks[1]==2&&APP_READER.jobs.size()==1&&TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.get(),"blocked shared reader grew queue or blocked business");APP_READER.drain();check(!TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.get(),"completed record retained permit");b.read();b.all();APP_READER.drain();check(b.client.shelfReads==2&&callbacks[1]==3&&last().contains("suppressed=1"),"queue release replayed mutation or lost suppression");});
  test("submit throw releases diagnostic permit and preserves original unknown",()->{callbacks=new int[2];var a=new AtomicWorkbenchActivity();a.client.throwShelf=true;APP_READER.failExecute=true;a.read();a.all();unknown(a);check(!TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.get()&&APP_READER.jobs.isEmpty(),"submit failure leaked pending");APP_READER.failExecute=false;a.taskSnapshotDiagnosticLast=0;a.read();a.all();APP_READER.drain();check(a.client.shelfReads==2&&callbacks[1]==2&&last().contains("suppressed=1"),"submit recovery changed business or lost loss count");});
  System.out.println("TASK DIAGNOSTICS ACTIVITY RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def ipc_sources():
    sources = dict(IPC['SOURCES'])
    sources.update(INSTALL_SHAPES)
    sources['ls/augment/com/AtomicWorkbenchDiagnostics.java'] = ROOT_DIAGNOSTICS
    sources['ls/augment/com/hook/HookTelemetry.java'] = TELEMETRY
    sources['ls/augment/com/TestTaskAuthority.java'] = IPC['TEST'].replace('Bundle b=(Bundle)out.values.get(3);', 'if(mode.equals("remote-exception"))out.values.set(0,1);Bundle b=(Bundle)out.values.get(3);')
    sources['ls/augment/com/hook/TestTaskDiagnostics.java'] = INSTALL_TEST
    sources['ls/augment/com/TestTaskTransportDiagnostics.java'] = TRANSPORT_TEST
    module = sources['ls/augment/com/hook/AugmentModule.java']
    module = module.replace('public int errors;', 'public int errors,deopts,registrations,failRegistration;')
    module = module.replace('public void registerFeatureHook(Method h){}', 'public void registerFeatureHook(Method h){if(++registrations==failRegistration)throw new IllegalStateException("SENSITIVE_TASK_CONTENT");}')
    module = module.replace('public void deoptimize(Method m){', 'public void deoptimize(Method m){deopts++;')
    sources['ls/augment/com/hook/AugmentModule.java'] = module
    # Separate successful authentication from the existing subsequent current-session check.
    auth = sources['ls/augment/com/hook/AtomicWorkbenchSystemRootAuthority.java']
    auth = auth.replace('||!currentAllowed)throw new SecurityException();return current;', ')throw new SecurityException("SENSITIVE_TASK_CONTENT");return current;')
    auth = auth.replace('public static boolean currentAllowed=true;', 'public static boolean currentAllowed=true,allowNested;').replace('if(Thread.holdsLock(wmLock))', 'if(!allowNested&&Thread.holdsLock(wmLock))')
    sources['ls/augment/com/hook/AtomicWorkbenchSystemRootAuthority.java'] = auth
    return sources


def shelf_sources():
    sources = dict(OPS['SOURCES'])
    sources['ls/augment/com/AtomicWorkbenchDiagnostics.java'] = ROOT_DIAGNOSTICS
    sources['ls/augment/com/TestTaskOperations.java'] = OPS['TEST']
    sources['ls/augment/com/TestTaskShelfDiagnostics.java'] = SHELF_TEST
    auth = sources['ls/augment/com/AtomicWorkbenchTaskAuthority.java']
    auth = auth.replace('String previousLease="";', 'String previousLease="",diagnosticFailure="";')
    auth = auth.replace('Bundle describe(Bundle window){', 'Bundle describe(Bundle window){if(diagnosticFailure.equals("DESCRIBE")){Bundle rejected=base();rejected.putBoolean("success",false);return rejected;}')
    auth = auth.replace('b.putParcelableArrayList("tasks",list);', 'if(diagnosticFailure.equals("TASK_DTO"))list.add(new Bundle());b.putParcelableArrayList("tasks",list);')
    auth = auth.replace('Bundle inspect(ArrayList<String> ids)throws Exception{', 'Bundle inspect(ArrayList<String> ids)throws Exception{if(diagnosticFailure.equals("INSPECT")){Bundle rejected=base();rejected.putBoolean("success",false);return rejected;}')
    auth = auth.replace('b.putParcelableArrayList("operations",all);', 'if(diagnosticFailure.equals("REFERENCE_DTO")){all.clear();((ArrayList)all).add("SENSITIVE_TASK_CONTENT");}b.putParcelableArrayList("operations",all);')
    sources['ls/augment/com/AtomicWorkbenchTaskAuthority.java'] = auth
    return sources


def ui_sources():
    sources = UI_ACTIVITY['sources']()
    activity = sources['ls/augment/com/AtomicWorkbenchActivity.java']
    assert activity.endswith(UI_ACTIVITY['TEST'])
    activity = activity[:-len(UI_ACTIVITY['TEST'])] + UI_TEST
    activity = activity.replace('class Queue {final', 'class Queue {boolean failExecute;final').replace('void execute(Runnable r){jobs.add(r);}', 'void execute(Runnable r){if(failExecute)throw new AssertionError("SENSITIVE_TASK_CONTENT");jobs.add(r);}')
    activity = activity.replace('if(throwShelf)throw new Exception("unknown");', 'if(throwShelf)throw new Exception("SENSITIVE_TASK_CONTENT token=do-not-retain");')
    sources['ls/augment/com/AtomicWorkbenchActivity.java'] = activity
    sources['ls/augment/com/AtomicWorkbenchDiagnostics.java'] = ROOT_DIAGNOSTICS
    return sources


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--negative-controls', action='store_true')
    args = parser.parse_args()
    production = ['AtomicWorkbenchTaskIdentity.java', 'AtomicWorkbenchTaskOperationRequest.java', 'AtomicWorkbenchTaskAuthority.java', 'AtomicWorkbenchLogPolicy.java', 'hook/AtomicWorkbenchTaskOperationHook.java']
    shelf_production = MODELS['PRODUCTION'] + ['AtomicWorkbenchTaskShelfStore.java', 'AtomicWorkbenchRecoveryScope.java', 'AtomicWorkbenchTaskOperations.java', 'AtomicWorkbenchLogPolicy.java', 'AtomicWorkbenchTaskReferenceRequest.java', 'AtomicWorkbenchTaskReferenceResult.java', 'AtomicWorkbenchTaskReferenceSnapshot.java']
    ui_production = ['AtomicWorkbenchTaskIdentity.java', 'AtomicWorkbenchTaskOperationRequest.java', 'AtomicWorkbenchTaskOperationResult.java', 'AtomicWorkbenchTaskUiSnapshot.java', 'AtomicWorkbenchSideSwipePolicy.java', 'AtomicWorkbenchWorkspaceModel.java', 'AtomicWorkbenchWindowPresentationPolicy.java', 'AtomicWorkbenchWindowLayoutPlan.java', 'AtomicWorkbenchLogPolicy.java']
    jars = list((MODELS['ROOT'] / 'audit-output').rglob('json-*.jar'))
    if not jars:
        raise RuntimeError('existing local org.json jar required')
    with tempfile.TemporaryDirectory(prefix='duo-task-diagnostics-') as temporary:
        work = Path(temporary)
        ipc = ipc_sources()
        MODELS['compile_run'](work / 'install', ipc, production, 'ls.augment.com.hook.TestTaskDiagnostics')
        MODELS['compile_run'](work / 'transport', ipc, production, 'ls.augment.com.TestTaskTransportDiagnostics')
        mismatch = dict(ipc)
        mismatch['com/android/server/wm/Task.java'] = mismatch['com/android/server/wm/Task.java'].replace('setTaskOrganizer(ITaskOrganizer organizer,boolean skip)', 'setTaskOrganizer(Object organizer,boolean skip)')
        MODELS['compile_run'](work / 'organizer-mismatch', mismatch, production, 'ls.augment.com.hook.TestTaskDiagnostics', ('mismatch',))
        data = work / 'data'; data.mkdir()
        MODELS['compile_run'](work / 'shelf', shelf_sources(), shelf_production, 'ls.augment.com.TestTaskShelfDiagnostics', (data,), str(jars[0]))
        ui = ui_sources()
        MODELS['compile_run'](work / 'ui', ui, ui_production, 'ls.augment.com.AtomicWorkbenchActivity')
        if args.negative_controls:
            controls = [
                ('actual install observation', 'hook/AtomicWorkbenchTaskOperationHook.java', 'finally { diagnostic("ATOMIC_TASK_INSTALL", stage, "UNKNOWN", -1, -1, installed, false, diagnosticFailure); }', 'finally { }', 'ls.augment.com.hook.TestTaskDiagnostics'),
                ('actual auth failure stage', 'hook/AtomicWorkbenchTaskOperationHook.java', 'stage = "AUTH";', 'stage = "REQUEST";', 'ls.augment.com.hook.TestTaskDiagnostics'),
                ('unknown action privacy', 'hook/AtomicWorkbenchTaskOperationHook.java', 'observedAction = diagnosticAction(action);', 'observedAction = action;', 'ls.augment.com.hook.TestTaskDiagnostics'),
                ('actual nested WM lock observation fence', 'hook/AtomicWorkbenchTaskOperationHook.java', 'if (diagnosticMayEmit(service)) try { diagnostic(', 'if (true) try { diagnostic(', 'ls.augment.com.hook.TestTaskDiagnostics'),
                ('transport DTO stage', 'AtomicWorkbenchTaskAuthority.java', 'stage = "RESULT_DTO";', 'stage = "COMPLETE";', 'ls.augment.com.TestTaskTransportDiagnostics'),
            ]
            for number, (label, source, old, new, runner) in enumerate(controls):
                result = MODELS['compile_run'](work / f'negative-{number}', ipc, production, runner, replacements={'ls/augment/com/' + source: (old, new)}, capture=True)
                assert result.returncode != 0 and b'AssertionError' in result.stderr, 'diagnostic mutant escaped or failed compilation: ' + label
                print('PASS actual task diagnostic compiled negative:', label)
            negative_data = work / 'negative-shelf-data'; negative_data.mkdir()
            result = MODELS['compile_run'](work / 'negative-shelf', shelf_sources(), shelf_production, 'ls.augment.com.TestTaskShelfDiagnostics', (negative_data,), str(jars[0]), {'ls/augment/com/AtomicWorkbenchTaskOperations.java': ('stage = "PRIMARY";', 'stage = "STORE";')}, capture=True)
            assert result.returncode != 0 and b'AssertionError' in result.stderr, 'shelf diagnostic mutant escaped or failed compilation'
            print('PASS actual task diagnostic compiled negative: shelf primary stage')
            for number, (label, old, new) in enumerate([
                ('actual UI DTO failure stage', 'stage = "DTO";', 'stage = "READ";'),
                ('global single pending diagnostic', '!TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.compareAndSet(false, true)', 'false'),
            ]):
                result = MODELS['compile_run'](work / f'negative-ui-{number}', ui, ui_production, 'ls.augment.com.AtomicWorkbenchActivity', replacements={'ls/augment/com/AtomicWorkbenchActivity.java': (old, new)}, capture=True)
                assert result.returncode != 0 and b'AssertionError' in result.stderr, 'UI snapshot diagnostic mutant escaped or failed compilation: ' + label
                print('PASS actual task diagnostic compiled negative:', label)
            print('TASK DIAGNOSTICS NEGATIVE CONTROLS 8 passed')


if __name__ == '__main__':
    main()
