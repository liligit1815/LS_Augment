"""Run production lifecycle decisions and exact Root/Client close methods offline."""
from pathlib import Path
import os
import runpy
import os
import subprocess
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
SRC = SUPPORT["SRC"]


def member(source, signature):
    start = source.index(signature)
    end = source.index("{", start) + 1
    depth = 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


def callback(source, signature):
    method = member(source, signature)
    start = method.index("main.post(() -> completeOperation(request, () -> {")
    end = method.index("}));", start) + len("}));")
    return method[start:end]


SOURCES = {
    "ls/augment/com/AppCrashDiagnostics.java": "package ls.augment.com;final class AppCrashDiagnostics {static void stage(String value){}}",
    "android/os/SystemClock.java": "package android.os;public class SystemClock {public static long uptimeMillis(){return 1000;}public static long elapsedRealtime(){return 1000;}}",
    "android/os/Bundle.java": SUPPORT["BUNDLE"],
    "android/os/Parcel.java": r'''package android.os;import java.util.*;public class Parcel {
 public final List<String> values=new ArrayList<>();int cursor;public void writeString(String value){values.add(value);}
 public String readString(){return values.get(cursor++);}public int dataAvail(){return values.size()-cursor;}
 public void enforceNoDataAvail(){if(dataAvail()!=0)throw new IllegalArgumentException("trailing payload");}
}''',
    "android/os/IBinder.java": "package android.os;public interface IBinder {default boolean unlinkToDeath(Object recipient,int flags){return true;}}",
    "android/widget/Toast.java": "package android.widget;public class Toast {public static final int LENGTH_LONG=1;public static String last;public static Toast makeText(Object host,String text,int duration){last=text;return new Toast();}public void show(){}}",
    "android/view/Surface.java": "package android.view;public class Surface {public boolean valid=true;public int releases;public void release(){releases++;}public boolean isValid(){return valid;}}",
    "android/view/MotionEvent.java": "package android.view;public class MotionEvent {public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_CANCEL=3;final int action;public MotionEvent(int action){this.action=action;}public int getActionMasked(){return action;}}",
    "android/os/PowerManager.java": "package android.os;public class PowerManager {public boolean interactive=true;public boolean isInteractive(){return interactive;}}",
    "android/app/KeyguardManager.java": "package android.app;public class KeyguardManager {public boolean locked;public boolean isKeyguardLocked(){return locked;}}",
    "android/content/Context.java": r'''package android.content;public class Context {
 public static final String POWER_SERVICE="power",KEYGUARD_SERVICE="keyguard";
 public android.os.PowerManager power=new android.os.PowerManager();public android.app.KeyguardManager keyguard=new android.app.KeyguardManager();
 public Object getSystemService(String service){return POWER_SERVICE.equals(service)?power:keyguard;}
}''',
    "android/content/Intent.java": r'''package android.content;import java.util.*;public class Intent {
 public static final int FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY=0x100000;public int flags;public int getFlags(){return flags;}
 public final Map<String,Object> extras=new HashMap<>();public Intent(){}public Intent(Intent other){extras.putAll(other.extras);flags=other.flags;}
 public String getStringExtra(String key){Object v=extras.get(key);return v instanceof String?(String)v:null;}public Intent removeExtra(String key){extras.remove(key);return this;}
 public boolean getBooleanExtra(String key,boolean fallback){return extras.get(key) instanceof Boolean?(Boolean)extras.get(key):fallback;}
}''',
    "ls/augment/com/AtomicWorkbenchConfig.java": "package ls.augment.com;final class AtomicWorkbenchConfig {static final String EXTRA_ENTRY=\"entry\",EXTRA_COMPONENT=\"component\",EXTRA_TASK_ID=\"task\",EXTRA_CONFIG_REVISION=\"revision\",EXTRA_CONFIG_CHECKSUM=\"checksum\",EXTRA_TRIGGER_ELAPSED=\"trigger\",EXTRA_ENTRY_BUILD=\"build\",EXTRA_SIDE=\"side\";static final long REQUEST_MAX_AGE_MS=3000;}",
    "ls/augment/com/AtomicWorkbenchSettingsActivity.java": "package ls.augment.com;final class AtomicWorkbenchSettingsActivity {static final String EXTRA_GENERATION=\"generation\";}",
    "android/content/ComponentName.java": "package android.content;public class ComponentName {final String value;public ComponentName(String value){this.value=value;}public static ComponentName unflattenFromString(String value){return value!=null&&value.contains(\"/\")?new ComponentName(value):null;}public String flattenToString(){return value;}public String getPackageName(){return value.split(\"/\")[0];}}",
    "ls/augment/com/AtomicWorkbenchAppRepository.java": "package ls.augment.com;final class AtomicWorkbenchAppRepository {static final class App {android.content.ComponentName component;App(String name){component=new android.content.ComponentName(name);}String key(){return component.flattenToString();}}}",
    "ls/augment/com/AtomicWorkbenchProtocol.java": "package ls.augment.com;final class AtomicWorkbenchProtocol {static final int TX_CLOSE=6;}",
    "ls/augment/com/AtomicWorkbenchProvider.java": "package ls.augment.com;final class AtomicWorkbenchProvider {static int removed;static void stopNavigation(Object pending){}static void remove(Object pending){removed++;}}",
    "ls/augment/com/AtomicWorkbenchTransfer.java": "package ls.augment.com;final class AtomicWorkbenchTransfer {static final String EXTRA_DELIVERY=\"transfer_delivery\";int accepted;void acceptPending(){accepted++;}void setForeground(boolean value){}void close(){}}",
    "ls/augment/com/AtomicWorkbenchTaskUiSnapshot.java": "package ls.augment.com;final class AtomicWorkbenchTaskUiSnapshot {AtomicWorkbenchTaskUiSnapshot(android.os.Bundle state){throw new IllegalArgumentException(\"not_a_task_snapshot_fixture\");}}",
}

ROOT_HEAD = r'''package ls.augment.com;import android.os.*;import android.content.*;import java.util.*;
final class RootHarness {
 final Context context=new Context();final AtomicWorkbenchEngine backend=new AtomicWorkbenchEngine();boolean focusPrimaryHomeOnClose;String closeReason="none";
 final List<String> events=new ArrayList<>();
 PasteHost pasteHost;
 static class ClosedResource {void close(){}}ClosedResource media,notifications;boolean extractionGeometryCleanupPending;void clearExtractionGeometry(){}
 static class PasteHost {boolean failClose,pending=true;int closes,maintains;
  void close(){closes++;if(failClose)throw new IllegalStateException("paste cleanup pending");}
  void maintain(){maintains++;}}
 static class Backend {boolean primary,failObserve,failClose,success=true,pending,focused;int closes;
  boolean primaryHomeIsForeground(){if(failObserve)throw new IllegalStateException("snapshot unavailable");return primary;}
  Bundle close(boolean focus){closes++;focused=focus;if(failClose)throw new IllegalStateException("restore failed");Bundle b=new Bundle();b.putBoolean("success",success);b.putBoolean("recovery_pending",pending);return b;}}
 AtomicWorkbenchEngine backend(){return backend;}
 // This fixture supplies an already-readable legacy backend; actual scope read/retry is
 // exercised by the real Root/TaskOperations constructor extraction in task-engine.
 void ensureTaskBackend(boolean explicit){if(!explicit)throw new AssertionError("unexpected background storage retry");}
 void lifecycle(String event,String detail,Throwable failure){events.add(event+" "+detail);}
 static Bundle failureState(Throwable t,boolean pending){Bundle b=new Bundle();b.putBoolean("success",false);b.putBoolean("recovery_pending",pending);return b;}
 Bundle close(String reason){closeReason=reason;inspectCloseIntent(reason);return closeOnce();}
 static String decode(Parcel data){return readCloseReason(data);}
'''

CLIENT_HEAD = r'''package ls.augment.com;import android.os.*;import java.util.*;
final class AtomicWorkbenchClient {
 final Object navigationLock=new Object();long navigationGeneration;boolean navigationStopped;
 boolean closed,dead,failRequest,requestKillsEndpoint;int homeCalls;AtomicWorkbenchClient recoveryClient;IBinder endpoint=new IBinder(){};
 Object pending=new Object(),deathRecipient=new Object();String observedReason,recoveryReason;int calls,reconnects;
 final List<String> events=new ArrayList<>();Bundle response=new Bundle();
 AtomicWorkbenchClient(){response.putBoolean("success",true);}
 interface ParcelWriter {void write(Parcel data)throws Exception;}
 static void requireWorkerThread(){}boolean endpointDead(){return dead;}
 java.util.function.Consumer<String> failureListener=ignored->{};void setFailureListener(java.util.function.Consumer<String> listener){failureListener=listener;}
 static int connections;static Runnable connectHook;static AtomicWorkbenchClient nextConnection;
 static AtomicWorkbenchClient connect(Object context){connections++;AtomicWorkbenchClient c=nextConnection==null?new AtomicWorkbenchClient():nextConnection;nextConnection=null;if(connectHook!=null){Runnable hook=connectHook;connectHook=null;hook.run();}return c;}
 Bundle showNativeHome(int id,android.view.Surface output,int width,int height,int density){homeCalls++;if(response.getInt("display_id",-1)>0){Bundle w=rootWindow(id);w.putInt("display_id",response.getInt("display_id"));w.putBoolean("native_home",true);}return response;}
 Bundle taskShelfState(){return new Bundle();}
 final java.util.Map<Integer,Bundle> rootWindows=new java.util.LinkedHashMap<>();boolean parked,failResume,failOutputs,failPark;int focusWindowCalls,lastFocusWindow=-2;int parks,resumes,outputUpdates,hostFocusCalls,statusQueries,failStatusAt=-1,omitWindowsStatusAt=-1;long outputSequence;
 Bundle rootWindow(int id){return rootWindows.computeIfAbsent(id,key->{Bundle b=new Bundle();b.putInt("window_id",id);b.putInt("display_id",88+id);b.putInt("user_id",0);b.putString("display_name","owned-"+id);b.putString("display_unique_id","unique-"+id);b.putString("window_session","11111111-1111-1111-1111-11111111111"+id);b.putString("state","active");b.putInt("task_count",1);b.putBoolean("success",true);b.putBoolean("output_attached",true);b.putBoolean("output_attached_known",true);return b;});}
 Bundle status(){statusQueries++;Bundle b=new Bundle(response);b.putBoolean("ui_parked",parked);if(statusQueries==failStatusAt)b.putBoolean("success",false);if(statusQueries!=omitWindowsStatusAt&&!b.containsKey("windows")){java.util.ArrayList<Bundle> windows=new java.util.ArrayList<>();for(Bundle w:rootWindows.values())windows.add(new Bundle(w));b.putParcelableArrayList("windows",windows);}return b;}
 Bundle resumeUi(long sequence){resumes++;if(!failResume)parked=false;Bundle b=status();b.putBoolean("success",!failResume);return b;}
 Bundle parkUi(long sequence){parks++;if(failPark)throw new IllegalStateException("fixed park result unknown");parked=true;for(Bundle w:rootWindows.values())w.putBoolean("output_attached",false);return status();}
 Bundle focusWindow(int id){focusWindowCalls++;lastFocusWindow=id;Bundle w=rootWindows.get(id);Bundle r=w==null?new Bundle(response):new Bundle(w);r.putBoolean("success",true);r.putInt("focused_window_id",id);return r;}Bundle focusHostInput(){hostFocusCalls++;return status();}
 Bundle updateOutput(int id,Bundle identity,long sequence,android.view.Surface output){outputUpdates++;Bundle w=rootWindow(id);w.putBoolean("output_attached",!failOutputs&&output!=null);w.putBoolean("output_attached_known",true);Bundle r=new Bundle(w);r.putBoolean("success",!failOutputs);return r;}

 void clearGestureTarget(){}void publishGestureTarget(int display,int window,int task,String unique){}
 void record(String event,int window,Object component,int display,String detail,Throwable error){events.add(event+" "+detail);}
 Bundle request(int code,ParcelWriter writer)throws Exception{if(code!=AtomicWorkbenchProtocol.TX_CLOSE)throw new AssertionError("wrong opcode");
  calls++;Parcel data=new Parcel();writer.write(data);observedReason=RootHarness.decode(data);
  if(failRequest){if(requestKillsEndpoint)dead=true;throw new IllegalStateException("request interrupted");}return response;}
 Bundle closeThroughRecoveryClient(String reason){reconnects++;recoveryReason=reason;return response;}
'''

TEST = r'''package ls.augment.com;import android.os.*;public class TestLifecycle {
 static int cases,checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 interface Case{void run()throws Exception;}static void test(String name,Case body)throws Exception{body.run();cases++;System.out.println("PASS production lifecycle: "+name);}
 static void rejected(Case body)throws Exception{boolean rejected=false;try{body.run();}catch(IllegalArgumentException expected){rejected=true;}check(rejected,"invalid reason/payload accepted");}
 public static void main(String[] args)throws Exception{
  test("transient stop followed by start does not close active workbench",()->{
   var gate=new AtomicWorkbenchLifecyclePolicy.Gate();gate.started();int stop=gate.stopped();check(gate.shouldClose(stop),"real leave not pending");gate.started();check(!gate.shouldClose(stop),"transient stop remained destructive");
   check(AtomicWorkbenchLifecyclePolicy.STOP_GRACE_MS>0&&AtomicWorkbenchLifecyclePolicy.STOP_GRACE_MS<=500,"unbounded lifecycle wait");});
  test("legacy explicit-close gate keeps surface-loss tickets until responsibility reset",()->{
   var gate=new AtomicWorkbenchLifecyclePolicy.Gate();gate.started();int lost=gate.surfaceLost();check(gate.shouldClose(lost),"lost surface ignored");gate.started();check(gate.shouldClose(gate.pending())&&gate.surfaceMissing(),"restart forgot broken display surface");
   int current=gate.pending();gate.closing();check(!gate.shouldClose(current),"close duplicated by queued timer");gate.restored();check(!gate.surfaceMissing(),"new session blocked after restore");});
  test("latest stop owns cleanup and old timers cannot close new session",()->{
   var gate=new AtomicWorkbenchLifecyclePolicy.Gate();gate.started();int a=gate.stopped();gate.started();int b=gate.stopped();check(!gate.shouldClose(a)&&gate.shouldClose(b),"stale timer wins");gate.closing();gate.restored();gate.started();check(!gate.shouldClose(b),"old session closed new one");});
  test("explicit known reasons and legacy empty payload are compatible",()->{
   check(RootHarness.decode(new Parcel()).equals("recovery_retry"),"legacy close rejected");
   for(String reason:new String[]{"user_exit","navigation","host_stopped","host_destroyed","surface_lost","config_reset","recovery_retry","launch_failure","connection_replaced","abandoned_connect"}){
    Parcel data=new Parcel();data.writeString(reason);check(RootHarness.decode(data).equals(reason),"reason changed");}
   rejected(()->AtomicWorkbenchLifecyclePolicy.requireReason(null));rejected(()->AtomicWorkbenchLifecyclePolicy.requireReason("token=secret"));
   Parcel trailing=new Parcel();trailing.writeString("user_exit");trailing.writeString("extra");rejected(()->RootHarness.decode(trailing));});
  test("actual unlocked interactive primary HOME requests final HOME focus",()->{
   for(String reason:new String[]{"host_stopped","surface_lost"}){RootHarness r=new RootHarness();r.backend.primary=true;Bundle b=r.close(reason);check(r.backend.focused&&b.getBoolean("primary_home_focus_requested"),"physical HOME foreground intent lost");check(b.getString("close_reason").equals(reason),"close reason missing");}});
  test("app swipe staying on VD cannot infer physical HOME exit",()->{
   RootHarness r=new RootHarness();r.close("host_stopped");check(!r.backend.focused&&r.backend.closes==1,"VD gesture manufactured physical HOME intent");});
  test("lockscreen and screen off close safely without stealing HOME focus",()->{
   RootHarness locked=new RootHarness();locked.backend.primary=true;locked.context.keyguard.locked=true;locked.close("host_stopped");check(!locked.backend.focused&&locked.backend.closes==1,"locked device focused HOME");
   RootHarness off=new RootHarness();off.backend.primary=true;off.context.power.interactive=false;off.close("surface_lost");check(!off.backend.focused,"screen off focused HOME");});
  test("explicit user exit and navigation restore all tasks without focus inference",()->{
   for(String reason:new String[]{"user_exit","navigation","host_destroyed","recovery_retry","config_reset"}){RootHarness r=new RootHarness();r.backend.primary=true;r.close(reason);check(!r.backend.focused&&r.backend.closes==1,"non-lifecycle close stole foreground");}});
  test("missing or failed system observation still runs cleanup conservatively",()->{
   RootHarness missing=new RootHarness();missing.backend.primary=true;missing.context.keyguard=null;missing.close("host_stopped");check(!missing.backend.focused,"missing lock state assumed unlocked");
   RootHarness failed=new RootHarness();failed.backend.failObserve=true;failed.close("surface_lost");check(failed.backend.closes==1&&!failed.backend.focused,"failed snapshot blocked cleanup or guessed intent");check(failed.events.stream().anyMatch(s->s.contains("observation=unavailable")),"missing observation evidence");});
  test("Root restore exception cannot return a completed cleanup",()->{
   RootHarness r=new RootHarness();r.backend.failClose=true;Bundle b=r.close("user_exit");check(!b.getBoolean("success")&&b.getBoolean("recovery_pending"),"failed restore acknowledged");check(r.events.stream().anyMatch(s->s.startsWith("ROOT_CLOSE_RESULT")),"failed close has no tail evidence");});
  test("paste cleanup failure retains its obligation while backend still returns actual tasks",()->{
   RootHarness r=new RootHarness();r.pasteHost=new RootHarness.PasteHost();r.pasteHost.failClose=true;
   Bundle b=r.close("user_exit");check(r.backend.closes==1&&b.getBoolean("success"),"paste close failure blocked backend task restoration");
   check(r.pasteHost.closes==1&&r.pasteHost.maintains==1&&r.pasteHost.pending,"paste cleanup responsibility or maintenance lost");
   r.pasteHost.failClose=false;r.pasteHost.pending=false;r.close("recovery_retry");
   check(r.backend.closes==2&&r.pasteHost.closes==2&&r.pasteHost.maintains==2,"retry skipped original cleanup owner");});
  test("backend restoration failure still maintains the same paste cleanup owner",()->{
   RootHarness r=new RootHarness();r.pasteHost=new RootHarness.PasteHost();r.pasteHost.failClose=true;r.backend.failClose=true;
   Bundle b=r.close("user_exit");check(!b.getBoolean("success")&&b.getBoolean("recovery_pending"),"backend failure was certified complete");
   check(r.backend.closes==1&&r.pasteHost.closes==1&&r.pasteHost.maintains==1&&r.pasteHost.pending,"backend failure skipped retained paste maintenance");});
  test("Client transmits reason and closes only after acknowledged full restoration",()->{
   AtomicWorkbenchClient c=new AtomicWorkbenchClient();c.response.putBoolean("recovery_pending",true);c.close("surface_lost");check(c.observedReason.equals("surface_lost")&&!c.closed&&c.endpoint!=null,"pending restore lost client responsibility");
   c.response.putBoolean("recovery_pending",false);c.close("surface_lost");check(c.closed&&c.endpoint==null&&c.calls==2,"confirmed cleanup did not release endpoint");});
  test("alive failed endpoint is retained and never replaced during restore",()->{
   AtomicWorkbenchClient c=new AtomicWorkbenchClient();c.failRequest=true;boolean failed=false;try{c.close("user_exit");}catch(IllegalStateException expected){failed=true;}
   check(failed&&!c.closed&&c.reconnects==0&&c.endpoint!=null,"alive owner replaced or failure hidden");});
  test("dead endpoint and retained recovery client preserve close intent",()->{
   AtomicWorkbenchClient dead=new AtomicWorkbenchClient();dead.dead=true;dead.close("host_stopped");check(dead.recoveryReason.equals("host_stopped"),"dead endpoint lost reason");
   AtomicWorkbenchClient race=new AtomicWorkbenchClient();race.failRequest=true;race.requestKillsEndpoint=true;race.close("surface_lost");check(race.reconnects==1&&race.recoveryReason.equals("surface_lost"),"death during close lost reason");
   AtomicWorkbenchClient outer=new AtomicWorkbenchClient(),inner=new AtomicWorkbenchClient();outer.recoveryClient=inner;outer.close("navigation");check(inner.observedReason.equals("navigation")&&outer.closed,"recovery chain lost intent");});
  test("invalid close reason never reaches endpoint",()->{
   AtomicWorkbenchClient c=new AtomicWorkbenchClient();rejected(()->c.close("private contents"));check(c.calls==0&&!c.closed,"invalid payload crossed process boundary");});
  ActivityHarness.run();
  System.out.println("LIFECYCLE RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''

ACTIVITY_HEAD = r'''package ls.augment.com;import android.os.*;import android.content.Intent;import android.content.ComponentName;import android.view.MotionEvent;import java.util.*;import static ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.*;import ls.augment.com.AtomicWorkbenchWindowLayoutPlan.RailSide;
class ActivityBase {Runnable dispatchHook;protected void onStart(){}protected void onStop(){}protected void onDestroy(){}protected void onNewIntent(Intent intent){}public void onWindowFocusChanged(boolean focus){}public boolean dispatchTouchEvent(MotionEvent event){if(dispatchHook!=null)dispatchHook.run();return true;}}
final class ModuleNavigation {static String returned;static void returnTo(Object host,String route){returned=route;}}
final class ResetWriteFence {static boolean staleValue;static boolean stale(long generation){return staleValue;}}
final class AtomicWorkbenchCleanup {static final List<AtomicWorkbenchClient> owners=new ArrayList<>();
 static void take(AtomicWorkbenchClient c,String reason){AtomicWorkbenchLifecyclePolicy.requireReason(reason);c.setFailureListener(null);if(!owners.contains(c))owners.add(c);}
 static boolean pending(){return !owners.isEmpty();}}
final class ActivityHarness extends ActivityBase {
 // Presentation-only boundary: these older fixtures never return storage-scope metadata.
 // The actual scope observer/typed facts/pinned transport are executed by test-atomic-workbench-storage-scope-ui.py.
 int scopeObservationCallbacks,scopeCancellationCallbacks;
 void observeTaskStorageScope(Bundle response){if(response!=null&&response.containsKey("task_backend_state"))throw new AssertionError("storage scope facts require the dedicated real-method suite");scopeObservationCallbacks++;}
 void cancelTaskStorageRecheck(){scopeCancellationCallbacks++;}
 int taskStorageNotice;long taskStorageProbeInFlight;String statusMessage,taskStorageStatusProblem;

 static int cases,checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 interface Case {void run()throws Exception;}static void test(String name,Case body)throws Exception{AtomicWorkbenchCleanup.owners.clear();AtomicWorkbenchClient.connectHook=null;AtomicWorkbenchClient.nextConnection=null;ResetWriteFence.staleValue=false;body.run();cases++;System.out.println("PASS actual Activity callbacks: "+name);}
 static class Queue {long now;boolean delayPosts,delayExecutions;final List<Runnable> jobs=new ArrayList<>();final List<Runnable> posts=new ArrayList<>();final List<Runnable> callbacks=new ArrayList<>();final List<Long> deadlines=new ArrayList<>();
  void post(Runnable r){if(delayPosts)posts.add(r);else r.run();}void execute(Runnable r){if(delayExecutions)jobs.add(r);else r.run();}void drainWorkers(){delayExecutions=false;while(!jobs.isEmpty())jobs.remove(0).run();}void removeCallbacks(Runnable r){for(int i=callbacks.size()-1;i>=0;i--)if(callbacks.get(i)==r){callbacks.remove(i);deadlines.remove(i);}}
  void drainPosts(){delayPosts=false;while(!posts.isEmpty())posts.remove(0).run();}
  void postDelayed(Runnable r,long wait){callbacks.add(r);deadlines.add(now+wait);}
  void advance(long delta){now+=delta;for(int i=0;i<callbacks.size();)if(deadlines.get(i)<=now){Runnable r=callbacks.remove(i);deadlines.remove(i);r.run();}else i++;}}
 static class Dialog {void dismiss(){}}
 static class PasteCoordinator {int cancelled,closed;void cancelAll(){cancelled++;}void close(){closed++;}}
 static class FakeSurface extends android.view.Surface {long frames=1;boolean configured=true;FakeSurface getHolder(){return this;}FakeSurface getSurface(){return this;}String diagnosticState(){return "fixed";}long lastFrameTimestampNanos(){return frames*1000000;}long lastFrameObservedNanos(){return 2000000000;}long frameCount(){return frames;}boolean isFrameFromConfiguredGeometry(){return valid&&configured&&frames>0;}}
 static final int COUNT=4;
 static class Swipe {void close(){}}static class Slot {final int id;Slot(int id){this.id=id;}final Swipe swipe=new Swipe();boolean outputAwaitingFrame,outputRetainsProducer;long outputFrameBoundary;int surfaceLifecycle=1;String displayUniqueId="",displayName="",windowSession="";boolean ready,wasActive,nativeHome;int displayId=-1;String message="";FakeSurface surface=new FakeSurface();void clear(){ready=false;displayId=-1;message="";}}
 static class Search {String text="";void setText(String value){text=value;}}
 static class EntryProof {String problem="";long triggered=1900;RailSide side=RailSide.RIGHT;EntryKey key(){return new EntryKey(0,0,1,1,"a".repeat(64),triggered);}EntryProof(){}EntryProof(Intent i){problem=i.getStringExtra("proof_error")==null?"":i.getStringExtra("proof_error");}}
 final AtomicWorkbenchWindowPresentationPolicy presentationPolicy=new AtomicWorkbenchWindowPresentationPolicy();Receipt pendingPresentationFocus,homePresentationReceipt,taskPresentationReceipt;EntryProof pendingLayoutProof;final Runnable entrySideDispatch=this::dispatchEntrySide;
 void closeTaskReferenceManagement(){}Object taskReferenceControls;
 final AtomicWorkbenchLifecyclePolicy.Gate lifecycleGate=new AtomicWorkbenchLifecyclePolicy.Gate();
 final AtomicWorkbenchWorkspaceModel model=new AtomicWorkbenchWorkspaceModel();final Slot[] slots={new Slot(0),new Slot(1),new Slot(2),new Slot(3)};
 final boolean[] pendingHomeSurfaces=new boolean[4];
 final String[] pendingTaskAllocations=new String[4];static class PendingTask{int sourceSlot;}PendingTask pendingTaskOperation;boolean taskQueryPending;
 AtomicWorkbenchTaskUiSnapshot lastTaskSnapshot;long taskSnapshotElapsed=-1,extractionInputRevision=-1;int gestureWindow=-1;
 boolean extractionGeometryPending,extractionGeometryAttempted;final Runnable extractionGeometryTick=()->{};void invalidateExtractionGeometry(){}void queryPendingTaskOperation(){}
 static class NotificationCards {void reset(){}void close(){}}NotificationCards notificationCards;static class CardPager {void resetNotificationPages(){}void resetNavigationSource(){}}CardPager cardPager;
 final Queue main=new Queue(),WORKER=new Queue();final Runnable poll=()->{},cleanupPoll=this::refreshCleanupWait,homePresentationPoll=()->{};Runnable deferredOperation;
 int homePresentationWindow=-1,homePresentationEpoch;long homePresentationStarted,homePresentationFrame,homePresentationStartedUptime,homePresentationLastProducerNanos,homePresentationLastWaitLog,homePresentationPollGeneration;int homePresentationSurfaceLifecycle;boolean homePresentationAllowReuse,homePresentationPolling;String homePresentationLastLoggedReason="",homePresentationRejectReason="";Bundle homePresentationState;
 final Object sessionLock=new Object();long sessionGeneration=1L,pollGeneration,outputTransition,outputSequence;boolean outputsParked,outputsSyncing,outputFocusPending,outputsNeedRetry,outputSyncAgain;
 AtomicWorkbenchClient client=new AtomicWorkbenchClient();Dialog closeDialog,settingsDialog;
 AtomicWorkbenchTransfer transfer=new AtomicWorkbenchTransfer();Intent pendingTransfer;String pendingTransferPackage;final Runnable transferDispatch=()->{};
 PasteCoordinator pasteCoordinator=new PasteCoordinator();boolean textDeliveryActive,hostDialogActive,hostDragActive;int hostInputPending,hostInputRequests;boolean lastHostInputEnter;
 void queueHostInput(boolean enter){hostInputRequests++;lastHostInputEnter=enter;hostInputPending++;}
 boolean destroyed,active,closing,surfaceUnavailable,busy,polling,exitRequested,recoveryPending,incomingPending,appListRequested,nativeHomePending,waitingForCleanup,mediaBusy,connectionRetryRequired,mediaRetryRequired,presentationNeedsRetry,entryFocusLogged,appsLoaded=true;
 final List<String> diagnostics=new ArrayList<>();
 static class TextTool {void close(){}}TextTool textTool;static class Ui {void closeHostDialogs(){}}Ui ui;boolean isFinishing(){return exitRequested;}int coverDismisses;int epoch,focusedWindow=-1,focusCalls,partialCloseCalls,desktopReturns,finishes,displayWidth=1080,displayHeight=2400,density=420,page,incomingTaskId=-1;long launchGeneration;String restoreNotice,returnRoute,entryProblemText,statusText,operationNotice,stripSignature="",gridSignature="";
 ComponentName incomingComponent;EntryProof incomingProof;static class Workspace{int getWidth(){return 1001;}int getHeight(){return 1651;}}Workspace workspace=new Workspace();Search search=new Search();Intent intent=new Intent();
 final ArrayList<AtomicWorkbenchAppRepository.App> apps=new ArrayList<>();int entryLaunches,nativeHomeAttempts,appliedStatuses;
 Object getApplicationContext(){return this;}Intent getIntent(){return intent;}void setIntent(Intent i){intent=i;}boolean readIncoming(Intent i){Object component=i.extras.get("component");incomingComponent=component==null?null:new ComponentName(component.toString());incomingPending=incomingComponent!=null;incomingProof="gesture".equals(i.getStringExtra(AtomicWorkbenchConfig.EXTRA_ENTRY))?new EntryProof(i):null;return true;}
 String entryProblem(EntryProof p){return p==null?"missing proof":p.problem;}AtomicWorkbenchAppRepository.App findApp(String key){for(var app:apps)if(app.key().equals(key))return app;return null;}
 void launchApp(AtomicWorkbenchAppRepository.App app,int task,EntryProof proof){entryLaunches++;}
 void tryNativeHome(){if(nativeHomePending&&!incomingPending&&entryProblemText==null&&canInteract()){nativeHomePending=false;nativeHomeAttempts++;}}
 void switchToDesktop(int side){focusedWindow=-1;model.showDesktop();}
 int homePresentationRetryWindow=-1;
 boolean prepareHomeSurface(Slot slot){return slot.surface.getHolder().isValid();}
 void hideHostKeyboard(){}void publishGestureTarget(){}void dismissHomeTransitionCover(){coverDismisses++;}boolean completeHomePresentation(){busy=false;return true;}boolean canReuseHomeFrame(Slot slot){return false;}void acceptHomePresentation(Bundle response){homePresentationState=response;busy=false;}void captureHomeTransitionCover(){}static String readinessText(Bundle state,String key){return state.getString(key,"");}void releaseHostSearchInput(){}
 boolean mainLayoutPresented=true,hostTouchActive;boolean mainLayoutMatches(int id){return true;}
 void cancelGesture(){}void stopMedia(){}void refreshAppearance(){}void lifecycleDiagnostic(String event,String detail){diagnostics.add(event+" "+detail);}boolean isChangingConfigurations(){return false;}
 void showStatus(String text){statusText=text;}void renderWorkspace(){}void invalidateMainLayout(int id){mainLayoutPresented=false;}
 static final java.util.List<android.view.Surface> duplicates=new java.util.ArrayList<>();static android.view.Surface duplicateOutput(android.view.Surface original){if(original==null||!original.isValid())return null;android.view.Surface copy=new android.view.Surface();duplicates.add(copy);return copy;}
void schedulePoll(){}void scheduleMedia(){}void finish(){finishes++;}
 void rejectIncoming(String text){incomingPending=false;incomingComponent=null;incomingProof=null;entryProblemText=text;}int lastFocused=-2;void focusWindow(int id){focusWindow(id,null);}void focusWindow(int id,EntryProof proof){focusCalls++;lastFocused=id;actualFocusWindow(id,proof);}void requestCloseWindow(int id){partialCloseCalls++;}
 void returnDesktopFocusAfterClose(){desktopReturns++;}void applyWindowStatus(int id,Bundle response){appliedStatuses++;slots[id].ready=response.containsKey("output_attached")?response.getBoolean("output_attached")&&response.getBoolean("output_attached_known"):response.getBoolean("ready");slots[id].displayId=response.getInt("display_id",-1);slots[id].displayUniqueId=response.getString("display_unique_id",slots[id].displayUniqueId);slots[id].displayName=response.getString("display_name",slots[id].displayName);slots[id].windowSession=response.getString("window_session",slots[id].windowSession);slots[id].nativeHome=response.getBoolean("native_home",slots[id].nativeHome);}
 static Bundle success(){Bundle b=new Bundle();b.putBoolean("success",true);return b;}
 static Bundle failure(String message){Bundle b=new Bundle();b.putString("message",message);return b;}
 static AtomicWorkbenchMediaOpenRequest mediaRequest(){Bundle b=new Bundle();b.putString("open_source_id","aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");b.putString("open_component","player/.Main");b.putString("open_package","player");b.putInt("open_user_id",0);b.putInt("open_owner_uid",10001);b.putLong("open_deadline_elapsed",2000);return AtomicWorkbenchMediaOpenRequest.fromDescriptor(b);}
 static String safeMessage(Exception error){return error.getClass().getSimpleName();}
 static boolean restored(Bundle b){return b.getBoolean("success")&&!b.getBoolean("recovery_pending");}
 AtomicWorkbenchWorkspaceModel.LaunchPlan launch(){return launch("app/.Main");}AtomicWorkbenchWorkspaceModel.LaunchPlan launch(String component){var p=model.planLaunch(component);check(model.commitLaunch(p),"fixture launch rejected");busy=true;epoch++;if(client!=null)client.rootWindow(p.windowId);mainLayoutPresented=true;slots[p.windowId].outputAwaitingFrame=false;slots[p.windowId].surface.frames++;return p;}
 void lostSurface(){slots[0].surface.valid=false;onWindowSurfaceDestroyed(0);}
'''

ACTIVITY_TEST = r'''
 static void run()throws Exception{
  test("share reentry preserves current windows and does not replay a gesture entry",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.launch();a.busy=false;AtomicWorkbenchClient original=a.client;long generation=a.sessionGeneration;int epoch=a.epoch;
   Intent share=new Intent();share.extras.put(AtomicWorkbenchTransfer.EXTRA_DELIVERY,true);a.onNewIntent(share);
   check(a.transfer.accepted==1&&a.client==original&&a.sessionGeneration==generation&&a.epoch==epoch&&a.model.appCount()==1,"share delivery discarded live workspace ownership");
   check(AtomicWorkbenchCleanup.owners.isEmpty()&&!a.nativeHomePending,"share delivery started cleanup or native HOME");});
  test("retiring a workspace revokes queued content dispatch",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.pendingTransfer=new Intent();a.pendingTransferPackage="chat";a.operationNotice="old unknown operation";a.main.postDelayed(a.transferDispatch,200);
   a.retireSession("user_exit",true);
   check(a.pendingTransfer==null&&a.pendingTransferPackage==null&&!a.main.callbacks.contains(a.transferDispatch),"retired session retained delayed content delivery");check(a.operationNotice==null,"retired session retained obsolete operation notice");});
  test("entry focus acknowledgment is actual callback and once per fresh entry",()->{
   ActivityHarness a=new ActivityHarness();a.incomingProof=new EntryProof();a.onWindowFocusChanged(false);check(a.diagnostics.isEmpty(),"unfocused window acknowledged entry");
   a.onWindowFocusChanged(true);check(a.diagnostics.size()==1&&a.diagnostics.get(0).contains("UI_ENTRY_FOCUSED gesture=true;request_elapsed=1900;window_focused=true;visual_content=UNVERIFIED"),"actual focus did not correlate gesture or claimed pixels");
   a.onWindowFocusChanged(true);a.onWindowFocusChanged(false);a.onWindowFocusChanged(true);check(a.diagnostics.size()==1,"ordinary focus changes repeated entry acknowledgment");
   a.onNewIntent(new Intent());a.diagnostics.clear();a.onWindowFocusChanged(true);check(a.diagnostics.size()==1,"fresh intent did not reset focus acknowledgment");});
  test("destroyed entry cannot publish focus acknowledgment",()->{ActivityHarness a=new ActivityHarness();a.destroyed=true;a.onWindowFocusChanged(true);check(a.diagnostics.isEmpty()&&!a.entryFocusLogged,"destroyed Activity acknowledged entry");});
  test("connection death clears pending presentation and in-memory cover",()->{ActivityHarness a=new ActivityHarness();a.onStart();a.client=null;AtomicWorkbenchClient c=a.ensureClient(a.sessionGeneration);a.homePresentationWindow=0;a.busy=true;int before=a.coverDismisses;c.failureListener.accept("dead Root");check(a.homePresentationWindow==-1&&a.coverDismisses>before&&!a.busy&&a.recoveryPending,"dead connection retained visual cover or active reveal");});
  test("launch finishes while stopped then resumes exact result after output admission",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();int request=a.epoch;a.onStop();a.main.advance(100);
   Bundle result=success();a.launchDone(request,result,plan,true,-1);check(a.busy&&a.deferredOperation!=null&&a.model.hasWindow(plan.windowId),"result lost or applied in background");
   a.onStart();check(!a.busy&&a.deferredOperation==null&&a.model.hasWindow(plan.windowId),"launch result not resumed");a.main.advance(400);
   check(a.client!=null&&!a.client.closed&&a.model.hasWindow(plan.windowId),"transient stop closed completed app");});
  test("closeWindow completed during stop applies removal and subsequent desktop intent on start",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();int request=a.epoch;AtomicWorkbenchClient c=a.client;a.onStop();a.closeDone(request,success(),plan.windowId,c);
   check(a.busy&&a.model.hasWindow(plan.windowId)&&a.desktopReturns==0,"partial close result prematurely discarded/applied");
   a.onStart();check(!a.busy&&!a.model.hasWindow(plan.windowId)&&a.desktopReturns==1,"closed window left busy/stale model");a.main.advance(400);check(a.client==c&&!c.closed,"short stop closed remaining session");});
  test("all four other mutating callbacks retain and resume success",()->{
   for(int kind=0;kind<4;kind++){ActivityHarness a=new ActivityHarness();a.onStart();var p=a.launch();a.onStop();Bundle b=success();b.putInt("display_id",88);AtomicWorkbenchClient c=a.client;
    if(kind==0)a.focusDone(a.epoch,b,p.windowId,c);if(kind==1)a.appFocusDone(a.epoch,b,p.windowId,c);if(kind==2)a.homeDone(a.epoch,b,p.windowId);if(kind==3)a.desktopDone(a.epoch,b,-1,c);
    check(a.busy&&a.deferredOperation!=null,"callback not retained");a.onStart();check(!a.busy&&a.deferredOperation==null,"callback remained stuck after restart");}});
  test("failed launch retains explicit recovery state instead of merely clearing busy",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var p=a.launch();a.onStop();a.launchDone(a.epoch,failure("root unavailable"),p,false,-1);a.onStart();
   check(!a.busy&&a.recoveryPending&&a.model.hasWindow(p.windowId),"failed unknown result silently lost responsibility");});
  test("failed partial restore retains model and recovery state after restart",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var p=a.launch();a.onStop();Bundle failed=failure("restore incomplete");failed.putBoolean("recovery_pending",true);a.closeDone(a.epoch,failed,p.windowId,a.client);a.onStart();
   check(!a.busy&&a.recoveryPending&&a.model.hasWindow(p.windowId),"failed restore falsely removed window");});
  test("sustained stop parks exact owner and resumes retained completion",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();AtomicWorkbenchClient c=a.client;long generation=a.sessionGeneration;int request=a.epoch;a.onStop();a.launchDone(request,success(),plan,true,-1);a.main.advance(3600000);
   check(a.client==c&&!c.closed&&c.calls==0&&c.parks==1&&a.outputsParked&&a.model.hasWindow(plan.windowId),"sustained stop closed instead of parking");check(a.busy&&a.deferredOperation!=null&&a.sessionGeneration==generation,"background discarded in-flight responsibility");
   a.onStart();check(a.client==c&&a.sessionGeneration==generation&&a.deferredOperation==null&&!a.busy&&!a.outputsParked&&a.model.hasWindow(plan.windowId),"restart replaced owner or lost deferred completion");});
  test("explicit close and stale epoch cannot replay prior completion",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var p=a.launch();a.onStop();int request=a.epoch;a.launchDone(request,success(),p,true,-1);a.requestCloseAll(true,"user_exit");a.onStart();
   a.launchDone(request,success(),p,true,-1);check(a.deferredOperation==null&&!a.model.hasWindow(p.windowId)&&a.exitRequested,"closed session result replayed");});
  test("explicit exit with pending recovery leaves host and retains exact recovery owner",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var p=a.launch();AtomicWorkbenchClient owner=a.client;owner.response.putBoolean("success",false);owner.response.putBoolean("recovery_pending",true);a.requestCloseAll(true,"user_exit");
   check(a.finishes==1&&a.exitRequested&&!a.recoveryPending,"pending restore trapped explicit exit or contaminated UI");
   check(a.client==null&&AtomicWorkbenchCleanup.owners.contains(owner)&&!owner.closed&&owner.endpoint!=null,"exit dropped or certified recovery ownership");
   check(!a.model.hasWindow(p.windowId)&&owner.failureListener==null,"exit preserved UI or retained old UI callback");
   check(owner.calls==0&&a.statusText==null,"exit waited synchronously or displayed old failure");});
  test("navigation with pending recovery returns requested route without discarding journal responsibility",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.launch();AtomicWorkbenchClient owner=a.client;owner.response.putBoolean("recovery_pending",true);a.returnRoute="home";ModuleNavigation.returned=null;a.requestCloseAll(true,"navigation");
   check("home".equals(ModuleNavigation.returned)&&AtomicWorkbenchCleanup.owners.contains(owner)&&!owner.closed&&!a.recoveryPending&&a.model.appCount()==0,"navigation blocked or dropped recovery owner");});
  test("explicit exit after live endpoint exception still leaves recovery reachable",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.launch();AtomicWorkbenchClient owner=a.client;owner.failRequest=true;a.requestCloseAll(true,"user_exit");
   check(a.finishes==1&&AtomicWorkbenchCleanup.owners.contains(owner)&&!owner.closed&&!a.recoveryPending&&owner.reconnects==0&&owner.calls==0,"transport failure trapped exit or replaced live owner");});
  test("automatic recovery failure does not navigate or finish the user interface",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.launch();AtomicWorkbenchClient owner=a.client;owner.response.putBoolean("recovery_pending",true);a.requestCloseAll(false,"surface_lost");
   check(a.finishes==0&&!a.exitRequested&&a.recoveryPending&&a.client==owner,"automatic restore failure unexpectedly left UI");});
  test("lost main Surface keeps task ownership and reconnects replacement",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();a.busy=false;a.focusedWindow=plan.windowId;a.slots[plan.windowId].ready=true;AtomicWorkbenchClient c=a.client;
   check(a.mainReady(),"fixture not ready");a.lostSurface();check(!a.mainReady()&&!a.slots[plan.windowId].ready,"invalid output admitted main input");a.onStop();a.onStart();a.main.advance(400);
   check(a.client==c&&!c.closed&&c.calls==0&&a.model.hasWindow(plan.windowId)&&a.outputsNeedRetry&&!a.slots[plan.windowId].ready,"Surface loss discarded task or claimed ready output");
   a.slots[plan.windowId].surface.valid=true;a.slots[plan.windowId].surfaceLifecycle++;a.syncWorkspaceOutputs();check(a.client==c&&a.model.hasWindow(plan.windowId)&&a.slots[plan.windowId].ready&&!a.outputsParked,"replacement Surface failed to reconnect retained task");});
  test("stopped worker and replaced epoch cannot start a queued mutation",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.launch();int r=a.epoch;a.onStop();check(!a.mutationAllowed(r),"stopped host started new mutation");a.onStart();check(a.mutationAllowed(r),"valid resumed operation rejected");a.epoch++;check(!a.mutationAllowed(r),"stale request launched");});
  test("first HOME reply retains actual ownership across lost in-flight output",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();AtomicWorkbenchClient c=a.client;c.response.putInt("display_id",88);a.main.delayPosts=true;a.showNativeHome(-1);
   check(c.homeCalls==1&&a.pendingHomeSurfaces[0]&&a.busy&&!a.model.hasWindow(0),"real HOME request did not reserve empty Surface before reply");
   a.onStop();a.slots[0].surface.valid=false;a.onWindowSurfaceDestroyed(0);a.main.drainPosts();a.onStart();a.main.advance(400);
   check(a.client==c&&!c.closed&&c.calls==0&&a.model.hasWindow(0)&&!a.pendingHomeSurfaces[0]&&!a.slots[0].ready,"lost in-flight HOME ownership discarded or fake frame accepted");
   a.slots[0].surface.valid=true;a.slots[0].surfaceLifecycle++;a.syncWorkspaceOutputs();check(a.model.hasWindow(0)&&a.slots[0].ready&&c.homeCalls==1,"HOME output reconnect relaunched or lost task");});
  test("confirmed HOME ownership survives output loss without automatic close",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.pendingHomeSurfaces[1]=true;a.busy=true;int request=++a.epoch;Bundle result=success();result.putInt("display_id",89);a.homeDone(request,result,1);
   check(a.model.hasWindow(1)&&!a.pendingHomeSurfaces[1],"HOME ownership not transferred");AtomicWorkbenchClient c=a.client;a.slots[1].surface.valid=false;a.onWindowSurfaceDestroyed(1);a.main.advance(400);
   check(a.client==c&&!c.closed&&c.calls==0&&a.model.hasWindow(1)&&!a.slots[1].ready&&!a.surfaceUnavailable,"confirmed HOME Surface loss closed or falsified task state");});
  test("unknown HOME failure retains obligation and explicit absence clears only that lease",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.pendingHomeSurfaces[2]=true;a.busy=true;a.homeDone(++a.epoch,failure("reply unavailable"),2);
   check(a.pendingHomeSurfaces[2]&&!a.model.hasWindow(2),"unknown HOME ownership discarded");a.slots[2].surface.valid=false;a.onWindowSurfaceDestroyed(2);check(a.pendingHomeSurfaces[2]&&a.client!=null&&!a.client.closed,"unknown in-flight HOME lost cleanup owner");
   ActivityHarness b=new ActivityHarness();b.onStart();b.pendingHomeSurfaces[2]=true;b.busy=true;Bundle empty=failure("not created");empty.putInt("display_id",-1);b.homeDone(++b.epoch,empty,2);
   check(!b.pendingHomeSurfaces[2],"explicit absence retained phantom Surface");b.onWindowSurfaceDestroyed(2);check(!b.surfaceUnavailable&&b.client!=null,"unowned empty slot caused cleanup");});
  test("healthy singleTask reentry reuses windows and requires fresh gesture handoff",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.launch();a.busy=false;long generation=a.sessionGeneration;AtomicWorkbenchClient old=a.client;int mainId=a.model.mainWindowId();String component=a.model.component(mainId);
   a.appsLoaded=false;a.incomingPending=false;a.search.text="existing query";a.model.setMainExpanded(true);a.onStart();check(a.sessionGeneration==generation&&a.model.appCount()==1&&a.client==old,"ordinary start discarded current session");
   Intent raw=new Intent();raw.extras.put("component","unproved/.Main");a.onNewIntent(raw);check(a.sessionGeneration==generation&&a.client==old&&a.model.appCount()==1&&a.model.component(mainId).equals(component)&&!a.model.mainExpanded(),"healthy singleTask discarded or rearranged workspace");
   check(AtomicWorkbenchCleanup.owners.isEmpty()&&!a.incomingPending&&!raw.extras.isEmpty()&&a.getIntent().extras.isEmpty()&&a.search.text.equals("existing query"),"raw reentry adopted handoff or erased query");
   Intent gesture=new Intent();gesture.extras.put("entry","gesture");gesture.extras.put("component","new/.Main");a.onNewIntent(gesture);check(a.client==old&&a.sessionGeneration==generation&&a.incomingPending&&a.incomingProof!=null&&a.incomingComponent.flattenToString().equals("new/.Main"),"fresh gesture failed to join retained session");});
  test("pending cleanup cannot be adopted as a new Activity connection",()->{
   ActivityHarness a=new ActivityHarness();AtomicWorkbenchClient old=a.client;a.onStart();a.requestCloseAll(true,"user_exit");
   ActivityHarness next=new ActivityHarness();next.client=null;next.onStart();int before=AtomicWorkbenchClient.connections;boolean blocked=false;
   try{next.ensureClient(next.sessionGeneration);}catch(CleanupPending expected){blocked=true;}
   check(blocked&&next.client==null&&AtomicWorkbenchClient.connections==before&&AtomicWorkbenchCleanup.owners.contains(old),"new session inherited owner or created duplicate while cleanup pending");});
  test("late connection goes only to cleanup and cannot attach to new generation",()->{
   ActivityHarness a=new ActivityHarness();a.client=null;a.onStart();long oldGeneration=a.sessionGeneration;AtomicWorkbenchClient late=new AtomicWorkbenchClient();AtomicWorkbenchClient.nextConnection=late;
   AtomicWorkbenchClient.connectHook=()->a.onNewIntent(new Intent());boolean rejected=false;
   try{a.ensureClient(oldGeneration);}catch(IllegalStateException expected){rejected=true;}
   check(rejected&&a.client==null&&AtomicWorkbenchCleanup.owners.contains(late)&&late.failureListener==null,"late authorization published into new session");
   check(!a.connectionRetryRequired&&!a.recoveryPending&&a.model.appCount()==0,"late authorization dirtied new UI");});
  test("old failure listener and close completion cannot mutate new session",()->{
   ActivityHarness a=new ActivityHarness();a.client=null;a.onStart();AtomicWorkbenchClient c=a.ensureClient(a.sessionGeneration);var oldFailure=c.failureListener;a.launch();a.main.delayPosts=true;a.requestCloseAll(false,"host_stopped");
   a.onNewIntent(new Intent());long generation=a.sessionGeneration;int epoch=a.epoch;oldFailure.accept("old error");a.main.drainPosts();
   check(a.sessionGeneration==generation&&a.epoch==epoch&&!a.recoveryPending&&!a.closing&&a.model.appCount()==0,"old close/failure changed new session");});
  test("cleanup response with no target session never rebuilds removed HOME",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.model.setHostedWindow(0,true);a.model.setEmptyHomeWindow(0,true);var plan=a.launch();check(plan.replacesEmptyHome,"fixture did not replace HOME");
   Bundle result=cleanupPending();result.putInt("display_id",999);result.putString("message","old root failure");a.launchDone(a.epoch,result,plan,true,-1);
   check(!a.model.hasWindow(plan.windowId)&&a.model.appCount()==0&&a.slots[0].displayId==-1&&a.appliedStatuses==0&&!a.recoveryPending,"old cleanup display or removed HOME transplanted into new slot");
   check(a.statusText.contains("释放桌面资源")&&!a.statusText.contains("old root"),"old failure leaked into fresh UI");});
  test("cleanup response retains still-live HOME but never applies another slot detail",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.model.setHostedWindow(0,true);a.model.setEmptyHomeWindow(0,true);var plan=a.launch();Bundle result=cleanupPending();result.putBoolean("no_session",false);result.putBoolean("cleanup_barrier",false);
   a.launchDone(a.epoch,result,plan,true,-1);check(a.model.hasWindow(0)&&a.model.component(0)==null&&a.appliedStatuses==0&&!a.waitingForCleanup,"live HOME discarded or foreign detail applied");});
  test("cleanup HOME failure with absent target removes phantom and protects other windows",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.model.setHostedWindow(0,true);a.model.setHostedWindow(1,true);a.pendingHomeSurfaces[0]=true;a.busy=true;a.homeDone(++a.epoch,cleanupPending(),0);
   check(!a.model.hasWindow(0)&&a.model.hasWindow(1)&&!a.pendingHomeSurfaces[0]&&a.appliedStatuses==0&&!a.recoveryPending,"HOME cleanup failure retained phantom or removed unrelated slot");});
  test("recreated and history intents cannot replay old App handoff",()->{
   Intent source=new Intent();for(String key:new String[]{"entry","component","task","revision","checksum","trigger","build","generation"})source.extras.put(key,"old");
   check(prepareEntryIntent(source,true).extras.isEmpty()&&source.extras.size()==8,"system recreation retained handoff or mutated original");
   source.flags=Intent.FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY;check(prepareEntryIntent(source,false).extras.isEmpty(),"recent history replayed handoff");
   source.flags=0;check(prepareEntryIntent(source,false).extras.size()==8,"explicit fresh entry lost handoff");});
  test("current new handoff survives cleanup barrier then revalidates proof",()->{
   for(boolean expired:new boolean[]{false,true}){ActivityHarness a=new ActivityHarness();AtomicWorkbenchClient old=a.client;a.onStart();a.recoveryPending=true;a.apps.add(new AtomicWorkbenchAppRepository.App("new/.Main"));Intent next=new Intent();next.extras.put("component","new/.Main");a.onNewIntent(next);a.incomingProof=new EntryProof();
    check(a.waitingForCleanup&&a.incomingPending&&a.entryLaunches==0,"barrier consumed latest entry");
    if(expired)a.incomingProof.problem="expired";AtomicWorkbenchCleanup.owners.remove(old);a.refreshCleanupWait();
    check(!a.waitingForCleanup&&!a.incomingPending&&a.entryLaunches==(expired?0:1),"current proof not revalidated or valid request lost");
    check(!expired||"expired".equals(a.entryProblemText),"expired request became fresh application launch");}});
  test("current desktop entry resumes after cleanup without restoring old windows",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.launch();AtomicWorkbenchClient old=a.client;a.recoveryPending=true;a.onNewIntent(new Intent());check(a.nativeHomePending&&a.waitingForCleanup&&a.nativeHomeAttempts==0,"new desktop entry consumed by barrier");
   AtomicWorkbenchCleanup.owners.remove(old);a.refreshCleanupWait();check(a.nativeHomeAttempts==1&&a.model.appCount()==0&&a.client==null,"cleanup resurrected old model or lost new desktop entry");});
  test("long stop keeps current handoff but real destruction retires it",()->{
   ActivityHarness a=new ActivityHarness();a.appsLoaded=false;a.onStart();a.incomingPending=true;a.incomingComponent=new ComponentName("new/.Main");a.intent.extras.put("component","new/.Main");a.onStop();a.main.advance(3600000);
   check(a.incomingPending&&a.incomingComponent!=null&&!a.intent.extras.isEmpty(),"parked Activity discarded live handoff");AtomicWorkbenchClient c=a.client;a.onDestroy();
   check(a.destroyed&&a.client==null&&AtomicWorkbenchCleanup.owners.contains(c)&&!a.incomingPending&&a.incomingComponent==null&&a.intent.extras.isEmpty(),"destroyed Activity retained UI or lost cleanup responsibility");
   ActivityHarness next=new ActivityHarness();next.readIncoming(prepareEntryIntent(a.getIntent(),true));next.onStart();check(!next.incomingPending&&next.entryLaunches==0,"destroyed entry replayed after recreation");});
  test("status reply during short stop releases poll lock without applying stale UI",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.main.delayPosts=true;a.pollStatus();check(a.polling,"poll did not start");a.onStop();a.main.drainPosts();check(!a.polling,"stopped reply left permanent poll lock");a.onStart();a.main.advance(400);a.pollStatus();check(!a.polling&&a.client!=null,"resumed status could not run");});
  test("status reply after operation epoch change releases only its own poll lock",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.main.delayPosts=true;a.pollStatus();a.epoch++;a.main.drainPosts();check(!a.polling&&!a.recoveryPending,"old operation epoch stranded poll or applied failure");
   a.main.delayPosts=true;a.pollStatus();a.requestCloseAll(false,"host_stopped");check(!a.polling,"close did not revoke poll ownership");a.main.drainPosts();a.client=new AtomicWorkbenchClient();a.pollStatus();check(!a.polling&&a.client!=null,"client replacement kept old poll lock");});
  test("old session poll cannot release the next session in-flight poll",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.main.delayPosts=true;a.pollStatus();Runnable oldReply=a.main.posts.remove(0);a.retireSession("connection_replaced",false);a.client=new AtomicWorkbenchClient();a.main.delayPosts=false;a.onStart();a.main.delayPosts=true;a.pollStatus();check(a.polling,"new poll missing");oldReply.run();check(a.polling,"old result released new poll lock");a.main.drainPosts();check(!a.polling,"new poll did not complete");});
  test("polling cannot steal a physical host tap before its click callback selects the side window",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var launch=a.model.planLaunch("app/.Main");a.model.commitLaunch(launch);a.client.rootWindow(launch.windowId);a.model.promote(launch.windowId);a.slots[launch.windowId].ready=true;a.slots[launch.windowId].outputAwaitingFrame=false;a.mainLayoutPresented=true;
   a.client.response.putInt("focused_window_id",-1);a.dispatchHook=()->{a.pollStatus();check(a.hostTouchActive,"host gesture not marked before dispatch");};
   a.dispatchTouchEvent(new MotionEvent(MotionEvent.ACTION_DOWN));check(a.hostTouchActive&&a.focusCalls==0,"DOWN poll refocused the old main");
   a.pollStatus();check(a.focusCalls==0,"between-packet poll refocused the old main");
   a.dispatchTouchEvent(new MotionEvent(MotionEvent.ACTION_UP));check(!a.hostTouchActive&&a.focusCalls==0,"UP callback lost the host tap to auto-focus");
   a.dispatchHook=null;a.pollStatus();check(a.focusCalls==1,"idle main focus recovery was disabled");
   a.dispatchTouchEvent(new MotionEvent(MotionEvent.ACTION_DOWN));a.dispatchTouchEvent(new MotionEvent(MotionEvent.ACTION_CANCEL));check(!a.hostTouchActive,"cancel stranded host touch state");
   a.dispatchTouchEvent(new MotionEvent(MotionEvent.ACTION_DOWN));a.onStop();check(!a.hostTouchActive,"stop retained host touch state");
  });
  test("stopping revokes pending text delivery and invokes real coordinator cancellation boundary",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.textDeliveryActive=true;a.hostTouchActive=true;AtomicWorkbenchClient owner=a.client;
   a.onStop();check(!a.textDeliveryActive&&!a.hostTouchActive&&a.pasteCoordinator.cancelled==1,"stop left pending text delivery or skipped cancellation");
   check(a.client==owner&&!owner.closed,"stop synchronously discarded Root owner before lifecycle decision");});
  test("main input readiness rejects host Dialog and pending host focus transitions",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var p=a.model.planLaunch("app/.Main");a.model.commitLaunch(p);a.slots[p.windowId].ready=true;a.slots[p.windowId].outputAwaitingFrame=false;a.mainLayoutPresented=true;a.focusedWindow=p.windowId;
   check(a.mainReady(),"host gate fixture not ready");a.hostDialogActive=true;check(!a.mainReady(),"host Dialog leaked main input eligibility");
   a.hostDialogActive=false;a.hostInputPending=1;check(!a.mainReady(),"pending host focus leaked main input eligibility");
   a.hostInputPending=0;check(a.mainReady(),"completed host transition stranded main readiness");});
  test("actual poll requests host focus once and respects drag and pending transition gates",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var p=a.model.planLaunch("app/.Main");a.model.commitLaunch(p);a.client.rootWindow(p.windowId);a.slots[p.windowId].ready=true;a.slots[p.windowId].outputAwaitingFrame=false;a.mainLayoutPresented=true;
   a.client.response.putInt("focused_window_id",p.windowId);a.hostDialogActive=true;a.pollStatus();
   check(a.hostInputRequests==1&&a.lastHostInputEnter&&a.hostInputPending==1&&a.focusCalls==0,"host Dialog poll failed to request isolated host input");
   a.pollStatus();check(a.hostInputRequests==1&&a.focusCalls==0,"pending host transition was duplicated");
   a.hostInputPending=0;a.hostDragActive=true;a.pollStatus();check(a.hostInputRequests==1&&a.focusCalls==0,"poll stole live drag focus for host Dialog");
   a.hostDragActive=false;a.hostDialogActive=false;a.hostInputPending=1;a.client.response.putInt("focused_window_id",-1);a.pollStatus();
   check(a.focusCalls==0,"pending host transition prematurely restored main input");
   a.hostInputPending=0;a.pollStatus();check(a.focusCalls==1,"completed host transition disabled normal main focus recovery");});
  test("stop fences queued reconnect before any obsolete Root resume or attach",()->{
   ActivityHarness a=new ActivityHarness();var plan=a.model.planLaunch("app/.Main");a.model.commitLaunch(plan);AtomicWorkbenchClient c=a.client;c.rootWindow(plan.windowId);a.WORKER.delayExecutions=true;a.onStart();a.onStop();a.WORKER.drainWorkers();
   check(c.resumes==0&&c.outputUpdates==0&&c.parks==1&&a.outputsParked&&a.model.hasWindow(plan.windowId),"stopped queued reconnect resumed or attached old output");check(a.client==c&&!c.closed&&c.calls==0,"queued output fence discarded original owner");});
  test("late output acknowledgement after stop cannot revive ready UI",()->{
   ActivityHarness a=new ActivityHarness();var plan=a.launch();a.busy=false;a.main.delayPosts=true;a.onStart();AtomicWorkbenchClient c=a.client;int updates=c.outputUpdates;a.onStop();a.main.drainPosts();
   check(!a.active&&a.outputsParked&&!a.slots[plan.windowId].ready&&a.client==c&&c.calls==0,"late output acknowledgement revived stopped UI");a.onStart();check(a.client==c&&c.outputUpdates>updates&&!a.outputsParked,"later start did not resync exact retained owner");});
  test("unconfirmed park and failed resume retain owner and delayed mutation",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();AtomicWorkbenchClient c=a.client;c.failPark=true;a.onStop();check(a.outputsParked&&a.client==c&&c.calls==0&&a.model.hasWindow(plan.windowId),"unconfirmed park lost original obligation");
   a.launchDone(a.epoch,success(),plan,true,-1);c.failResume=true;a.onStart();check(a.outputsParked&&a.deferredOperation!=null&&a.busy&&a.client==c,"failed resume consumed mutation or replaced owner");c.failPark=c.failResume=false;a.syncWorkspaceOutputs();check(!a.outputsParked&&a.deferredOperation==null&&!a.busy&&a.model.hasWindow(plan.windowId),"fresh resume did not release retained completion");});
  test("failed or incomplete fresh status cannot release a retained completion",()->{
   for(boolean missing:new boolean[]{false,true}){ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();AtomicWorkbenchClient c=a.client;a.onStop();a.launchDone(a.epoch,success(),plan,true,-1);int updates=c.outputUpdates;int fresh=c.statusQueries+3;if(missing)c.omitWindowsStatusAt=fresh;else c.failStatusAt=fresh;a.onStart();
    check(a.outputsParked&&a.deferredOperation!=null&&a.busy&&a.client==c&&c.outputUpdates==updates,"unconfirmed fresh snapshot released retained mutation");check(!c.closed&&a.model.hasWindow(plan.windowId)&&c.calls==0,"failed fresh snapshot discarded original tasks");
    c.omitWindowsStatusAt=c.failStatusAt=-1;a.syncWorkspaceOutputs();check(!a.outputsParked&&a.deferredOperation==null&&!a.busy&&c.outputUpdates>updates,"fresh snapshot retry did not admit retained result");}});
  test("fresh output status wins over older retained operation details",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();int request=a.epoch;a.onStop();a.completeOperation(request,()->{a.busy=false;a.slots[plan.windowId].ready=false;a.slots[plan.windowId].displayUniqueId="old-operation-identity";});a.onStart();
   check(a.deferredOperation==null&&a.slots[plan.windowId].ready&&a.slots[plan.windowId].displayUniqueId.equals("unique-"+plan.windowId),"old retained result overwrote fresh output state");});
  test("HOME reconnect calls actual focus RPC and captures fresh proof boundaries",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();a.busy=false;int id=plan.windowId;AtomicWorkbenchClient c=a.client;c.rootWindow(id).putBoolean("native_home",true);a.slots[id].nativeHome=true;
   a.homePresentationWindow=id;a.homePresentationEpoch=a.epoch;a.homePresentationStarted=12;a.homePresentationSurfaceLifecycle=0;a.homePresentationFrame=0;a.homePresentationPolling=true;Bundle oldProof=new Bundle();a.homePresentationState=oldProof;int priorEpoch=a.epoch;long priorPoll=a.homePresentationPollGeneration;
   a.onStop();a.slots[id].surfaceLifecycle++;a.slots[id].surface.frames=5;a.onStart();
   check(c.focusWindowCalls==1&&c.lastFocusWindow==id&&a.epoch>priorEpoch&&a.homePresentationEpoch==a.epoch,"HOME reconnect reused old proof without actual fresh focus");
   check(a.homePresentationState!=oldProof&&a.homePresentationSurfaceLifecycle==a.slots[id].surfaceLifecycle&&a.homePresentationFrame==5&&a.homePresentationStarted==1000&&a.homePresentationPollGeneration>priorPoll,"HOME reconnect inherited obsolete Surface or deadline proof");check(c.homeCalls==0&&c.calls==0&&a.model.hasWindow(id),"HOME reconnect reopened or closed original task");});
  test("HOME reconnect with changed source clears obsolete proof without focusing another window",()->{
   for(int kind=0;kind<3;kind++){ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();a.busy=true;int id=plan.windowId;a.homePresentationWindow=id;a.homePresentationEpoch=a.epoch;a.homePresentationState=new Bundle();a.slots[id].nativeHome=true;if(kind==0)a.model.removeWindow(id);if(kind==1)a.slots[id].nativeHome=false;if(kind==2)a.slots[id].surface.valid=false;
    a.resumePendingHomeAfterOutputs();check(a.homePresentationWindow==-1&&a.homePresentationState==null&&!a.busy&&a.client.focusWindowCalls==0&&a.statusText!=null,"changed HOME proof focused another task or remained stale");}});
  test("parked or obsolete HOME presentation never steals current focus",()->{
   for(boolean parked:new boolean[]{false,true}){ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();int id=plan.windowId;a.homePresentationWindow=id;a.homePresentationEpoch=parked?a.epoch:a.epoch-1;a.outputsParked=parked;a.slots[id].nativeHome=true;int epoch=a.epoch;
    a.resumePendingHomeAfterOutputs();check(a.homePresentationWindow==id&&a.client.focusWindowCalls==0&&a.epoch==epoch,"obsolete or parked HOME acquired fresh focus");}});
  test("invalid gesture reentry preserves healthy session and performs no handoff",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();a.busy=false;AtomicWorkbenchClient c=a.client;long generation=a.sessionGeneration;Intent bad=new Intent();bad.extras.put("entry","gesture");bad.extras.put("component","wrong/.Main");bad.extras.put("proof_error","expired fixed proof");a.onNewIntent(bad);
   check(a.client==c&&a.sessionGeneration==generation&&a.model.hasWindow(plan.windowId)&&!a.incomingPending&&a.entryLaunches==0&&AtomicWorkbenchCleanup.owners.isEmpty(),"invalid gesture discarded healthy owner or launched handoff");check(a.getIntent().extras.size()==1&&a.statusText.equals("expired fixed proof"),"invalid gesture proof was not revoked");});
  test("reset reentry retires exact old owner and fences old completion",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();int request=a.epoch;AtomicWorkbenchClient c=a.client;long generation=a.sessionGeneration;ResetWriteFence.staleValue=true;a.onNewIntent(new Intent());a.launchDone(request,success(),plan,true,-1);
   check(a.client==null&&a.sessionGeneration>generation&&AtomicWorkbenchCleanup.owners.contains(c)&&a.model.appCount()==0&&a.deferredOperation==null,"reset reentry adopted old owner or late operation");});
  test("destroy during queued reconnect hands owner to cleanup and rejects late producer batch",()->{
   ActivityHarness a=new ActivityHarness();var plan=a.launch();AtomicWorkbenchClient c=a.client;a.WORKER.delayExecutions=true;a.onStart();a.onDestroy();a.WORKER.drainWorkers();
   check(a.destroyed&&a.client==null&&a.model.appCount()==0&&AtomicWorkbenchCleanup.owners.contains(c)&&c.resumes==0&&c.outputUpdates==0,"destroyed Activity published late output or lost cleanup owner");check(a.pasteCoordinator.closed==1&&a.exitRequested,"destroy failed to close text service or retire UI");});
  test("rejected media open removes only the unissued proposal and protects other tasks",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var other=a.launch();a.busy=false;var plan=a.model.planLaunch("player/.Main");check(a.model.commitLaunch(plan),"media fixture rejected");a.busy=true;int request=++a.epoch;AtomicWorkbenchClient c=a.client;
   Bundle b=failure("fixed media source expired");b.putBoolean("media_open_rejected",true);a.launchDone(request,b,plan,true,-1,mediaRequest());
   check(!a.model.hasWindow(plan.windowId)&&a.model.hasWindow(other.windowId)&&a.client==c&&!a.recoveryPending&&!a.closing&&a.partialCloseCalls==0&&c.calls==0&&AtomicWorkbenchCleanup.owners.isEmpty(),"media rejection entered global or partial launch recovery");check(!a.busy&&a.statusText.equals("fixed media source expired")&&a.appliedStatuses==0,"rejected unissued media proposal applied unknown output");});
  test("rejected media HOME replacement retains the real display and applies its fresh identity",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();a.model.setHostedWindow(0,true);a.model.setEmptyHomeWindow(0,true);var plan=a.launch("player/.Main");check(plan.replacesEmptyHome,"media fixture did not replace HOME");AtomicWorkbenchClient c=a.client;
   Bundle b=failure("source changed");b.putBoolean("media_open_rejected",true);b.putInt("display_id",88);b.putString("display_unique_id","retained-home");b.putBoolean("native_home",true);a.launchDone(a.epoch,b,plan,true,-1,mediaRequest());
   check(a.model.hasWindow(0)&&a.model.component(0)==null&&a.slots[0].displayId==88&&a.slots[0].displayUniqueId.equals("retained-home")&&a.slots[0].nativeHome,"media rejection discarded or replaced actual HOME");check(a.client==c&&!a.recoveryPending&&!a.busy&&a.partialCloseCalls==0&&c.calls==0,"media HOME rejection requested destructive recovery");});
  test("rejected media reply with an actual display preserves its ownership",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch("player/.Main");AtomicWorkbenchClient c=a.client;Bundle b=failure("changed source");b.putBoolean("media_open_rejected",true);b.putInt("display_id",88);b.putString("display_unique_id","real-owned-display");a.launchDone(a.epoch,b,plan,true,-1,mediaRequest());
   check(a.model.hasWindow(plan.windowId)&&a.slots[plan.windowId].displayUniqueId.equals("real-owned-display")&&a.client==c&&a.appliedStatuses==1,"actual media reply lost real display ownership");check(!a.recoveryPending&&a.partialCloseCalls==0&&c.calls==0&&!a.busy,"actual media rejection recovered unrelated tasks");});
  test("unconfirmed media open keeps the proposal and original owner without automatic replay or recovery",()->{
   for(boolean home:new boolean[]{false,true})for(boolean stopped:new boolean[]{false,true}){ActivityHarness a=new ActivityHarness();a.onStart();if(home){a.model.setHostedWindow(0,true);a.model.setEmptyHomeWindow(0,true);}var plan=a.launch("player/.Main");AtomicWorkbenchClient c=a.client;int request=a.epoch;if(stopped)a.onStop();Bundle b=failure("unconfirmed binder completion");b.putBoolean("operation_unconfirmed",true);a.launchDone(request,b,plan,true,-1,mediaRequest());
    if(stopped){check(a.busy&&a.deferredOperation!=null,"background media uncertainty discarded callback");a.onStart();}
    check(a.client==c&&a.model.hasWindow(plan.windowId)&&"player/.Main".equals(a.model.component(plan.windowId))&&!a.recoveryPending&&!a.closing&&a.partialCloseCalls==0&&c.calls==0,"unconfirmed media result auto-recovered or discarded original responsibility");check(!a.busy&&a.deferredOperation==null&&a.statusText!=null&&AtomicWorkbenchCleanup.owners.isEmpty(),"unconfirmed media result stayed busy or lost feedback");a.syncWorkspaceOutputs();check(a.operationNotice!=null&&a.operationNotice.equals(a.statusText)&&c.calls==0&&a.partialCloseCalls==0,"fresh output resync cleared unconfirmed media feedback");}});
  test("obsolete rejected media callback cannot remove a newer proposal",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch("player/.Main");int old=a.epoch;a.epoch++;Bundle b=failure("old source");b.putBoolean("media_open_rejected",true);a.launchDone(old,b,plan,true,-1,mediaRequest());
   check(a.model.hasWindow(plan.windowId)&&a.busy&&a.appliedStatuses==0&&a.partialCloseCalls==0&&!a.recoveryPending,"obsolete media rejection changed newer operation");});
  test("rejected focus on a media source preserves current main and other tasks",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();a.busy=false;var other=a.model.planLaunch("other/.Main");a.model.commitLaunch(other);int main=a.model.mainWindowId();a.busy=true;int request=++a.epoch;AtomicWorkbenchClient c=a.client;Bundle b=failure("media identity changed");b.putBoolean("media_open_rejected",true);b.putInt("display_id",88);a.appFocusDone(request,b,plan.windowId,c);
   check(a.model.mainWindowId()==main&&a.model.hasWindow(plan.windowId)&&a.model.hasWindow(other.windowId)&&a.client==c&&!a.recoveryPending&&!a.busy&&a.partialCloseCalls==0&&c.calls==0,"rejected media focus promoted target or recovered workspace");});
  test("unknown status keeps the healthy session through a fresh poll and singleTask reentry",()->{
   ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();a.busy=false;AtomicWorkbenchClient c=a.client;a.slots[plan.windowId].ready=true;a.focusedWindow=-1;long generation=a.sessionGeneration;int epoch=a.epoch;
   c.response=failure("fixed status result unknown");c.response.putBoolean("operation_unconfirmed",true);c.omitWindowsStatusAt=c.statusQueries+1;int applied=a.appliedStatuses,focuses=c.focusWindowCalls;a.pollStatus();
   check(!a.recoveryPending&&a.client==c&&a.sessionGeneration==generation&&a.model.hasWindow(plan.windowId)&&!a.closing&&AtomicWorkbenchCleanup.owners.isEmpty(),"unknown status converted healthy owner into recovery");
   check(!a.polling&&a.appliedStatuses==applied&&c.focusWindowCalls==focuses&&a.epoch==epoch&&a.statusText.equals("完整工作区状态尚未确认，原窗口和任务已保留。")&&a.operationNotice!=null,"unknown status reused stale ready output or lost notice");
   c.response=success();c.omitWindowsStatusAt=-1;a.pollStatus();check(!a.recoveryPending&&a.client==c&&a.appliedStatuses>applied&&c.focusWindowCalls>focuses&&a.model.hasWindow(plan.windowId),"later fresh status failed to restore current focus");
   a.onNewIntent(new Intent());check(a.client==c&&a.sessionGeneration==generation&&a.model.hasWindow(plan.windowId)&&!a.closing&&!a.recoveryPending&&AtomicWorkbenchCleanup.owners.isEmpty()&&c.calls==0,"unknown status made later singleTask retire or clean up workspace");});
  test("unconfirmed media focus keeps the selected main and never claims its old focus",()->{
   for(boolean stopped:new boolean[]{false,true}){ActivityHarness a=new ActivityHarness();a.onStart();var player=a.launch("player/.Main");a.busy=false;var other=a.model.planLaunch("other/.Main");check(a.model.commitLaunch(other),"focus fixture rejected");int main=a.model.mainWindowId();AtomicWorkbenchClient c=a.client;c.rootWindow(other.windowId);a.focusedWindow=main;a.slots[player.windowId].displayId=88+player.windowId;a.slots[player.windowId].displayUniqueId="unique-"+player.windowId;a.busy=true;int request=++a.epoch,applied=a.appliedStatuses;if(stopped)a.onStop();Bundle b=failure("focus dispatch result unknown");b.putBoolean("operation_unconfirmed",true);a.appFocusDone(request,b,player.windowId,c,mediaRequest());
    if(stopped){check(a.busy&&a.deferredOperation!=null&&a.appliedStatuses==applied,"background unknown media focus applied early");a.onStart();}
    check(!a.busy&&a.focusedWindow==-2&&a.model.mainWindowId()==main&&a.model.hasWindow(player.windowId)&&a.model.hasWindow(other.windowId)&&a.client==c&&!a.recoveryPending&&a.partialCloseCalls==0&&c.calls==0&&AtomicWorkbenchCleanup.owners.isEmpty(),"unconfirmed media focus consumed ownership or claimed old focus");
    check((stopped||a.appliedStatuses==applied)&&a.slots[player.windowId].displayId==88+player.windowId&&a.slots[player.windowId].displayUniqueId.equals("unique-"+player.windowId)&&a.operationNotice!=null&&a.operationNotice.equals(a.statusText),"unknown media focus applied an empty reply or lost feedback");}});
  test("partial or unknown zero-task snapshot cannot close a formerly active window",()->{
   for(int kind=0;kind<3;kind++){ActivityHarness a=new ActivityHarness();a.onStart();var plan=a.launch();a.busy=false;a.hostTouchActive=true;AtomicWorkbenchClient c=a.client;a.slots[plan.windowId].wasActive=true;Bundle w=c.rootWindow(plan.windowId);w.putInt("task_count",0);w.putBoolean("success",kind==2);w.putBoolean("operation_unconfirmed",kind!=0);w.putBoolean("output_attached",false);int prior=a.partialCloseCalls;a.pollStatus();
    check(a.partialCloseCalls==prior&&a.client==c&&a.model.hasWindow(plan.windowId)&&!a.recoveryPending&&c.calls==0&&AtomicWorkbenchCleanup.owners.isEmpty(),"partial zero-task snapshot auto-closed actual window");check(!a.polling&&!a.closing,"partial zero-task snapshot stuck or retired owner");
    w.putBoolean("success",true);w.putBoolean("operation_unconfirmed",false);a.pollStatus();check(a.partialCloseCalls==prior+1&&a.client==c,"trusted successful zero-task snapshot no longer retired finished window");}});
  System.out.println("ACTIVITY LIFECYCLE RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


# External dependency adaptation; the new physical hold behavior is tested separately by its owner.
_HOLD_SIGNATURES=['private static final class NativeShieldLayoutHold', 'private void beginNativeShieldLayout(', 'private boolean nativeShieldLayoutCurrent(', 'private boolean deferNativeShieldLayout()', 'private boolean acceptNativeShieldClick(', 'private void cancelNativeShieldLayout(', 'private void retireNativeShieldLayout(', 'private void finishNativeShieldTouch(', 'private void postNativeShieldLayoutFlush(', 'private void nativeShieldLayoutDiagnostic(']
_HOLD_FIELDS='\n NativeShieldLayoutHold nativeShieldLayoutHold;boolean nativeShieldLayoutDeferred,nativeShieldDispatchingUp;\n long nativeShieldTouchSequence,nativeShieldDownTime,nativeShieldEventTime;\n static final java.util.concurrent.atomic.AtomicInteger NATIVE_SHIELD_DIAGNOSTIC_PENDING=new java.util.concurrent.atomic.AtomicInteger();\n static final java.util.concurrent.atomic.AtomicLong NATIVE_SHIELD_DIAGNOSTIC_DROPPED=new java.util.concurrent.atomic.AtomicLong();\n'

_candidate=(SRC / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
ACTIVITY_HEAD+=_HOLD_FIELDS+"\n".join(member(_candidate,s) for s in _HOLD_SIGNATURES)+"\nvoid layoutWorkspace(){}\n"
ACTIVITY_HEAD=ACTIVITY_HEAD.replace('void post(Runnable r){if(delayPosts)posts.add(r);else r.run();}', 'boolean post(Runnable r){if(delayPosts)posts.add(r);else r.run();return true;}')
ACTIVITY_HEAD=ACTIVITY_HEAD.replace('final Swipe swipe=new Swipe();', 'final Swipe swipe=new Swipe();final android.view.View shield=new android.view.View();boolean retainedEmptyTaskDisplay;')
ACTIVITY_HEAD=ACTIVITY_HEAD.replace('Object getApplicationContext(){return this;}', 'android.content.Context getApplicationContext(){return new android.content.Context();}')
ACTIVITY_HEAD=ACTIVITY_HEAD.replace('final Queue main=new Queue(),WORKER=new Queue();', 'static final Queue APP_READER=new Queue();final Queue main=new Queue(),WORKER=new Queue();')
SOURCES['android/view/View.java']='package android.view;public class View{public void cancelPendingInputEvents(){}}'
SOURCES['android/os/Process.java']='package android.os;public class Process{public static int myUid(){return 10515;}}'
SOURCES['ls/augment/com/AtomicWorkbenchDiagnostics.java']='package ls.augment.com;public class AtomicWorkbenchDiagnostics{public static void record(android.content.Context c,long g,String e,int w,int u,String component,int d,String detail,Throwable t){}}'
SOURCES['android/view/MotionEvent.java']=SOURCES['android/view/MotionEvent.java'].replace('public int getActionMasked(){return action;}', 'public int getActionMasked(){return action;}public long getDownTime(){return 1000;}public long getEventTime(){return 1000;}')


_retire_old='   a.retireSession("user_exit",true);'
_retire_new='   a.hostTouchActive=true;\n   NativeShieldLayoutHold retiredTouch=new NativeShieldLayoutHold(0,a.epoch,a.sessionGeneration,a.nativeShieldTouchSequence,1000,1000,new Lease(0,88,"vd","unique","session"),a.presentationRoles(),RailSide.RIGHT);\n   a.nativeShieldLayoutHold=retiredTouch;retiredTouch.terminal=true;a.main.delayPosts=true;\n   long touchSequence=a.nativeShieldTouchSequence;a.postNativeShieldLayoutFlush(retiredTouch,touchSequence,a.sessionGeneration);Runnable retiredFlush=a.main.posts.remove(0);\n   a.retireSession("user_exit",true);\n   check(!a.hostTouchActive&&a.nativeShieldLayoutHold==null&&retiredTouch.cancelled&&a.nativeShieldTouchSequence>touchSequence,"actual session retirement retained pending physical shield input");\n   retiredFlush.run();check(!a.hostTouchActive&&a.nativeShieldLayoutHold==null,"old FIFO callback revived retired session touch");'
assert ACTIVITY_TEST.count(_retire_old)==1
ACTIVITY_TEST=ACTIVITY_TEST.replace(_retire_old,_retire_new,1)

# Dependency adapter for the actual failed-session cleanup path. Existing TESTs and drivers are unchanged.
ACTIVITY_HEAD += "\n AtomicWorkbenchClient connectionCleanupClient;long connectionCleanupSession=-1L;\n" + member(_candidate, "private void handleConnectionFailure(") + "\n"

def main():
    root = (SRC / "AtomicWorkbenchRoot.java").read_text(encoding="utf-8")
    client = (SRC / "AtomicWorkbenchClient.java").read_text(encoding="utf-8")
    sources = dict(SOURCES)
    sources["ls/augment/com/AtomicWorkbenchEngine.java"] = "package ls.augment.com;final class AtomicWorkbenchEngine extends RootHarness.Backend {}"
    sources["ls/augment/com/RootHarness.java"] = ROOT_HEAD + "\n".join(member(root, signature) for signature in (
        "private Bundle closeOnce()", "private static String readCloseReason", "private void inspectCloseIntent")) + "}"
    sources["ls/augment/com/AtomicWorkbenchClient.java"] = CLIENT_HEAD + member(client, "public void stopNavigation()") + member(client, "public synchronized Bundle close(String reason)") + "}"
    sources["ls/augment/com/TestLifecycle.java"] = TEST
    activity = (SRC / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
    body = ACTIVITY_HEAD + "\n".join(member(activity, signature) for signature in (
        "private Roles presentationRoles()", "private Lease presentationLease(", "private Receipt beginPresentationFocus(", "private Receipt proposalPresentation(", "private Receipt bindPresentationReply(", "private boolean confirmPresentationPromotion(", "private void invalidatePresentationGeometry()", "private void dispatchEntrySide()", "private void requireCurrentEntry(", "private static final class EntryRejected", "private boolean mutationAllowed", "private void completeOperation", "private void resumeDeferredOperation", "private void onWindowSurfaceDestroyed", "private void showNativeHome(int emptySide)",
        "@Override protected void onStart()", "@Override public void onWindowFocusChanged", "@Override public boolean dispatchTouchEvent", "@Override protected void onStop()", "private void scheduleLifecycleClose",
        "private void requestCloseAll(boolean finishWhenRestored)", "private void requestCloseAll(boolean finishWhenRestored, String requestedReason)",
        "private void retireSession", "private void showCleanupPending", "private void refreshCleanupWait", "private static Bundle cleanupPending()",
        "private static final class CleanupPending", "private AtomicWorkbenchClient ensureClient", "@Override protected void onNewIntent", "private static Intent prepareEntryIntent", "private static void clearEntryExtras", "private void tryIncoming()", "private void pollStatus()",
        "private boolean canInteract()", "private boolean mainReady()", "private boolean shouldCloseExitedWindow(int id, Bundle window)", "private void syncWorkspaceOutputs", "private boolean outputSessionCurrent", "private static Bundle findWindow", "private static Bundle outputIdentity", "private void parkWorkspaceOutputs", "private void resumePendingHomeAfterOutputs", "private void clearHomePresentation", "private void beginHomePresentation", "@Override protected void onDestroy()"))
    body += member(activity, "private void focusWindow(int id, EntryProof proof)").replace("private void focusWindow(int id, EntryProof proof)", "private void actualFocusWindow(int id, EntryProof proof)", 1)
    for signature, header in (
        ("private void launchSourceApp(AtomicWorkbenchAppRepository.App app, int taskId, EntryProof proof, AtomicWorkbenchWorkspaceOpenRequest mediaOpen)", "void launchDone(int request,Bundle response,AtomicWorkbenchWorkspaceModel.LaunchPlan plan,boolean openAttempted,int taskId){launchDone(request,response,plan,openAttempted,taskId,null);}\nvoid launchDone(int request,Bundle response,AtomicWorkbenchWorkspaceModel.LaunchPlan plan,boolean openAttempted,int taskId,AtomicWorkbenchMediaOpenRequest mediaRequest){AtomicWorkbenchWorkspaceOpenRequest mediaOpen=AtomicWorkbenchWorkspaceOpenRequest.media(mediaRequest);Slot slot=slots[plan.windowId];Receipt launchPresentation=presentationPolicy.begin(plan.windowId,sessionGeneration,request,presentationRoles(),presentationLease(plan.windowId));EntryProof proof=null;"),
        ("private void focusWindow(int id, EntryProof proof)", "void focusDone(int request,Bundle response,int id,AtomicWorkbenchClient connected){Receipt presentation=beginPresentationFocus(id,request);"),
        ("private void focusSourceAppWindow(int id, ComponentName component, AtomicWorkbenchWorkspaceOpenRequest mediaOpen, EntryProof proof)", "void appFocusDone(int request,Bundle response,int id,AtomicWorkbenchClient connected){appFocusDone(request,response,id,connected,null);}\nvoid appFocusDone(int request,Bundle response,int id,AtomicWorkbenchClient connected,AtomicWorkbenchMediaOpenRequest mediaRequest){AtomicWorkbenchWorkspaceOpenRequest mediaOpen=AtomicWorkbenchWorkspaceOpenRequest.media(mediaRequest);Receipt presentation=beginPresentationFocus(id,request);"),
        ("private void showNativeHome(int emptySide)", "void homeDone(int request,Bundle response,int id){Slot slot=slots[id];Receipt presentation=beginPresentationFocus(id,request);if(client!=null&&response.getInt(\"display_id\",-1)>0){Bundle w=client.rootWindow(id);w.putInt(\"display_id\",response.getInt(\"display_id\"));w.putBoolean(\"native_home\",true);}"),
        ("private void switchToDesktop(int emptySide)", "void desktopDone(int request,Bundle response,int emptySide,AtomicWorkbenchClient connected){"),
        ("private void requestCloseWindow(int id)", "void closeDone(int request,Bundle response,int id,AtomicWorkbenchClient connected){"),
    ):
        body += header + callback(activity, signature) + "}\n"
    sources["ls/augment/com/ActivityHarness.java"] = body + ACTIVITY_TEST
    if "containsKey(" not in sources["android/os/Bundle.java"]:
        sources["android/os/Bundle.java"] = sources["android/os/Bundle.java"].replace(
            "public void putBoolean", "public boolean containsKey(String key){return data.containsKey(key);}public void putBoolean", 1)
    for signature, boundary in ((" get(String ", "public Object get(String key){return data.get(key);}"),
                                (" keySet()", "public java.util.Set<String> keySet(){return data.keySet();}")):
        if signature not in sources["android/os/Bundle.java"]:
            sources["android/os/Bundle.java"] = sources["android/os/Bundle.java"].rsplit("}", 1)[0] + boundary + "}"
    variants = [("production", sources, None)]
    for label, filename, old, new, expected in (
        ("PASTE_FAILURE_CANNOT_BLOCK_TASK_RETURN", "RootHarness.java", "catch (RuntimeException pending) { }", "catch (RuntimeException pending) { return failureState(pending, true); }", "paste close failure blocked backend task restoration"),
        ("PASTE_MAINTENANCE_MUST_CONTINUE", "RootHarness.java", "if (pasteHost != null) pasteHost.maintain();", "", "paste cleanup responsibility or maintenance lost"),
        ("DIALOG_BLOCKS_MAIN_INPUT", "ActivityHarness.java", "&& !hostDialogActive && hostInputPending == 0", "&& hostInputPending == 0", "host Dialog leaked main input eligibility"),
        ("PENDING_HOST_FOCUS_BLOCKS_MAIN_INPUT", "ActivityHarness.java", "hostInputPending == 0", "hostInputPending >= 0", "pending host focus leaked main input eligibility"),
        ("STOP_CANCELS_TEXT_DELIVERY", "ActivityHarness.java", "if (pasteCoordinator != null) pasteCoordinator.cancelAll();", "", "stop left pending text delivery or skipped cancellation"),
        ("STOP_PARKS_INSTEAD_OF_LEGACY_AUTO_CLOSE", "ActivityHarness.java", "parkWorkspaceOutputs();", 'scheduleLifecycleClose(lifecycleGate.pending(), "host_stopped");', "sustained stop closed instead of parking"),
        ("SURFACE_LOSS_RETAINS_ORIGINAL_TASKS", "ActivityHarness.java", "slots[id].outputAwaitingFrame = slots[id].outputRetainsProducer = false;\n            if (active) main.post(this::syncWorkspaceOutputs);", 'slots[id].outputAwaitingFrame = slots[id].outputRetainsProducer = false; requestCloseAll(false, "surface_lost");', "Surface loss discarded task or claimed ready output"),
        ("HEALTHY_SINGLE_TASK_REUSES_SESSION", "ActivityHarness.java", "if (client != null && !closing && !recoveryPending && !ResetWriteFence.stale(launchGeneration))", "if (false)", "healthy singleTask discarded or rearranged workspace"),
        ("HOME_RECONNECT_REQUIRES_ACTUAL_FOCUS", "ActivityHarness.java", "if (model.hasWindow(id) && slots[id].nativeHome && slots[id].surface.getHolder().isValid()) focusWindow(id);", "if (model.hasWindow(id) && slots[id].nativeHome && slots[id].surface.getHolder().isValid()) { }", "HOME reconnect reused old proof without actual fresh focus"),
        ("HOME_RECONNECT_REQUIRES_CURRENT_EPOCH", "ActivityHarness.java", "|| homePresentationEpoch != epoch", "", "obsolete or parked HOME acquired fresh focus"),
        ("STOP_FENCES_QUEUED_OUTPUT_BATCH", "ActivityHarness.java", "return active && !destroyed && !closing && transition == outputTransition", "return !destroyed && !closing", "stopped queued reconnect resumed or attached old output"),
        ("ACTUAL_DESTROY_RETIRES_OWNER", "ActivityHarness.java", 'retireSession("host_destroyed", true);', "", "destroyed Activity retained UI or lost cleanup responsibility"),
        ("RESUME_REQUIRES_CONFIRMED_PHASES", "ActivityHarness.java", 'outputsParked = !admitted || response == null || response.getBoolean("ui_parked", true);', 'outputsParked = response == null || response.getBoolean("ui_parked", true);', "failed resume consumed mutation or replaced owner"),
        ("RESUME_REQUIRES_FRESH_WINDOW_SNAPSHOT", "ActivityHarness.java", "boolean admitted = resumeConfirmed && snapshotConfirmed;", "boolean admitted = resumeConfirmed;", "unconfirmed fresh snapshot released retained mutation"),
        ("MEDIA_REJECTION_MUST_NOT_RECOVER_TASKS", "ActivityHarness.java", 'if (response.getBoolean(mediaOpen==null?"media_open_rejected":mediaOpen.rejectedKey(),false))', "if (false)", "media rejection entered global or partial launch recovery"),
        ("MEDIA_UNCONFIRMED_RETAINS_RESPONSIBILITY", "ActivityHarness.java", 'if (mediaOpen != null && response.getBoolean("operation_unconfirmed",false))', "if (false)", "unconfirmed media result auto-recovered or discarded original responsibility"),
        ("MEDIA_UNCONFIRMED_NOTICE_SURVIVES_RESYNC", "ActivityHarness.java", "else if (operationNotice != null) showStatus(operationNotice);", "", "fresh output resync cleared unconfirmed media feedback"),
        ("UNKNOWN_STATUS_MUST_NOT_RETIRE_HEALTHY_SESSION", "ActivityHarness.java", 'if (response.getBoolean("operation_unconfirmed", false))', "if (false)", "unknown status converted healthy owner into recovery"),
        ("UNKNOWN_MEDIA_FOCUS_CANNOT_APPLY_EMPTY_REPLY", "ActivityHarness.java", 'if (mediaOpen != null && response.getBoolean("operation_unconfirmed", false))', "if (false)", "unknown media focus applied an empty reply or lost feedback"),
        ("ZERO_TASK_RETIRE_REQUIRES_SUCCESS", "ActivityHarness.java", 'window.getBoolean("success", false) && !window.getBoolean("operation_unconfirmed", false)', '!window.getBoolean("operation_unconfirmed", false)', "partial zero-task snapshot auto-closed actual window"),
        ("ZERO_TASK_RETIRE_REJECTS_UNKNOWN", "ActivityHarness.java", '&& !window.getBoolean("operation_unconfirmed", false)', '', "partial zero-task snapshot auto-closed actual window"),
    ):
        key = "ls/augment/com/" + filename
        assert old in sources[key], "negative control source boundary changed: " + label
        changed = dict(sources); changed[key] = sources[key].replace(old, new)
        variants.append((label, changed, expected))
    # Keep the deferred callback, but restore the old order after fresh status. This
    # catches stale operation details overwriting the admitted output identity.
    key = "ls/augment/com/ActivityHarness.java"
    before = "if (!outputsParked) resumeDeferredOperation();"
    after = "resumePendingHomeAfterOutputs();"
    sync = member(sources[key], "private void syncWorkspaceOutputs")
    assert sync.count(before) == 1 and sync.count(after) == 1
    changed = dict(sources)
    reordered = sync.replace(before, "", 1).replace(
        after, "if (!outputsParked) resumeDeferredOperation(); " + after, 1)
    changed[key] = sources[key].replace(sync, reordered, 1)
    variants.append(("FRESH_STATUS_WINS_AFTER_RETAINED_COMPLETION", changed,
                     "old retained result overwrote fresh output state"))
    for label, current, expected in variants:
      with tempfile.TemporaryDirectory(prefix="lsa-workbench-lifecycle-") as temporary:
        work = Path(temporary)
        files = []
        for name, content in current.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            files.append(str(path))
        subprocess.run([SUPPORT["JAVAC"], "-J-Duser.language=en", "-J-Dfile.encoding=UTF-8", "--release", "17", "-encoding", "UTF-8", "-cp", str(_CAPACITY_JSON), "-d", str(work),
                        str(SRC / "AtomicWorkbenchLifecyclePolicy.java"), str(SRC / "AtomicWorkbenchWorkspaceModel.java"), str(SRC / "AtomicWorkbenchMediaOpenRequest.java"), str(SRC / "AtomicWorkbenchWindowPresentationPolicy.java"), str(SRC / "AtomicWorkbenchWindowLayoutPlan.java"), *files], check=True, timeout=60, env=SUPPORT["ENV"])
        completed = subprocess.run([SUPPORT["JAVA"], "-cp", str(work)+os.pathsep+str(_CAPACITY_JSON), "ls.augment.com.TestLifecycle"],
                                   capture_output=expected is not None, text=True, timeout=30, env=SUPPORT["ENV"])
        if expected is None:
            completed.check_returncode()
        else:
            assert completed.returncode != 0 and expected in completed.stdout + completed.stderr, "uncaught lifecycle mutation: " + label + "\n" + completed.stdout + completed.stderr
            print("PASS rejected lifecycle negative:", label)



# Existing lifecycle scope controls catalog loading, not preference/PM I/O.
# Keep the actual receiver body and actual onStart/onStop registration branches.
ACTIVITY_HEAD+='\nboolean appPackagesRegistered;int appLoadRequests,appReceiverRegistrations,appReceiverUnregistrations;android.content.BroadcastReceiver appRegistered;\n'
ACTIVITY_HEAD+=member(_candidate,'private final android.content.BroadcastReceiver appPackages=')+';\n'
ACTIVITY_HEAD+=r'''
void loadApps(){appLoadRequests++;}
android.content.Intent registerReceiver(android.content.BroadcastReceiver receiver,android.content.IntentFilter filter,int flags){
 if(receiver!=appPackages||appRegistered!=null||flags!=android.content.Context.RECEIVER_NOT_EXPORTED||!filter.actions.equals(new java.util.HashSet<>(java.util.Arrays.asList(android.content.Intent.ACTION_PACKAGE_ADDED,android.content.Intent.ACTION_PACKAGE_REMOVED,android.content.Intent.ACTION_PACKAGE_CHANGED)))||!filter.schemes.equals(java.util.Set.of("package")))throw new AssertionError("unexpected app receiver registration");
 appRegistered=receiver;appReceiverRegistrations++;return null;}
void unregisterReceiver(android.content.BroadcastReceiver receiver){if(receiver!=appRegistered)throw new AssertionError("wrong app receiver retired");appRegistered=null;appReceiverUnregistrations++;}
'''
SOURCES['android/content/Context.java']=SOURCES['android/content/Context.java'].rsplit('}',1)[0]+'public static final int RECEIVER_NOT_EXPORTED=4;}'
SOURCES['android/content/Intent.java']=SOURCES['android/content/Intent.java'].rsplit('}',1)[0]+'public static final String ACTION_PACKAGE_ADDED="android.intent.action.PACKAGE_ADDED",ACTION_PACKAGE_REMOVED="android.intent.action.PACKAGE_REMOVED",ACTION_PACKAGE_CHANGED="android.intent.action.PACKAGE_CHANGED";}'
SOURCES['android/content/BroadcastReceiver.java']='package android.content;public abstract class BroadcastReceiver{public abstract void onReceive(Context context,Intent intent);}'
SOURCES['android/content/IntentFilter.java']='package android.content;public final class IntentFilter{public final java.util.Set<String>actions=new java.util.HashSet<>(),schemes=new java.util.HashSet<>();public void addAction(String value){actions.add(value);}public void addDataScheme(String value){schemes.add(value);}}'



# Shared workspace request is real production code. This lifecycle harness runs
# extracted completion callbacks only; unexpected dispatch is a failing boundary.
for _name in ['AtomicWorkbenchWorkspaceOpenRequest.java','AtomicWorkbenchNotificationOpenRequest.java']:
    SOURCES['ls/augment/com/'+_name]=(SRC/_name).read_text(encoding='utf-8')
CLIENT_HEAD+=r"""
 Bundle openMediaWindow(int id,android.view.Surface s,int w,int h,int d,android.content.ComponentName c,AtomicWorkbenchMediaOpenRequest target)throws Exception{throw new AssertionError("unexpected dispatch in callback-only lifecycle");}
 Bundle focusMediaWindow(int id,android.content.ComponentName c,AtomicWorkbenchMediaOpenRequest target)throws Exception{throw new AssertionError("unexpected dispatch in callback-only lifecycle");}
 Bundle openNotificationWindow(int id,android.view.Surface s,int w,int h,int d,android.content.ComponentName c,AtomicWorkbenchNotificationOpenRequest target)throws Exception{throw new AssertionError("notification dispatch is outside original lifecycle cases");}
 Bundle focusNotificationWindow(int id,android.content.ComponentName c,AtomicWorkbenchNotificationOpenRequest target)throws Exception{throw new AssertionError("notification dispatch is outside original lifecycle cases");}
"""

_CAPACITY_FIXTURE = 'package ls.augment.com;import android.os.Bundle;import java.util.*;\nfinal class CapacityFixtureState {\n static Bundle owner(int id,Bundle actual){\n  Bundle b=actual==null?new Bundle():new Bundle(actual);b.putInt("window_id",id);\n  if(!b.containsKey("display_id"))b.putInt("display_id",-1);\n  if(!b.containsKey("success"))b.putBoolean("success",true);\n  if(!b.containsKey("state"))b.putString("state","closed");\n  for(String k:new String[]{"window_session","display_name","display_unique_id"})if(!b.containsKey(k))b.putString(k,"");\n  for(String k:new String[]{"recovery_pending","operation_unconfirmed","task_recovery_pending","input_focus_cleanup_pending","guard_cleanup_pending","input_cancel_pending","input_rebind_pending","output_transition_pending"})if(!b.containsKey(k))b.putBoolean(k,false);\n  if(!b.containsKey("output_attached_known"))b.putBoolean("output_attached_known",true);\n  if(!b.containsKey("output_attached"))b.putBoolean("output_attached",false);\n  if(!b.containsKey("task_count"))b.putInt("task_count",0);return b;\n }\n static Bundle raw(Bundle envelope,Map<Integer,Bundle> actual){\n  Bundle b=new Bundle(envelope);ArrayList<Bundle> states=new ArrayList<>();\n  boolean success=!Boolean.FALSE.equals(b.get("success")),pending=Boolean.TRUE.equals(b.get("recovery_pending")),unknown=Boolean.TRUE.equals(b.get("operation_unconfirmed"));\n  for(int id=0;id<AtomicWorkbenchSlotDomain.POOL_SIZE;id++){\n   Bundle state=owner(id,actual.get(id));states.add(state);success&=state.getBoolean("success");pending|=state.getBoolean("recovery_pending");unknown|=state.getBoolean("operation_unconfirmed");\n  }\n  b.putBoolean("success",success);b.putBoolean("recovery_pending",pending);b.putBoolean("operation_unconfirmed",unknown);\n  b.putParcelableArrayList("windows",states);b.putBundle("legacy_recovery",owner(-1,null));return b;\n }\n}'

# Capacity dependency adapter: actual pure policies, strict Protocol and reader.
_CAPACITY_JSON=SUPPORT["ROOT"]/'audit-output/release-test20497/dependencies/json-20240303.jar'
for _name in ['AtomicWorkbenchPoolTopology.java','AtomicWorkbenchCapacityLayoutPlan.java','AtomicWorkbenchSlotDomain.java','AtomicWorkbenchRecoveryScope.java','AtomicWorkbenchProtocol.java']:
    SOURCES['ls/augment/com/'+_name]=(SRC/_name).read_text(encoding='utf-8')
_bundle=SOURCES['android/os/Bundle.java']
if ' deepCopy()' not in _bundle:
    _bundle=_bundle.rsplit('}',1)[0]+r"""
public Bundle deepCopy(){Bundle b=new Bundle();for(String k:data.keySet())b.data.put(k,copyValue(data.get(k)));return b;}
private static Object copyValue(Object v){if(v instanceof Bundle)return ((Bundle)v).deepCopy();if(v instanceof java.util.ArrayList<?>){java.util.ArrayList<Object> list=new java.util.ArrayList<>();for(Object x:(java.util.ArrayList<?>)v)list.add(copyValue(x));return list;}return v;}}
"""
SOURCES['android/os/Bundle.java']=_bundle
SOURCES['ls/augment/com/CapacityFixtureState.java']=_CAPACITY_FIXTURE
ACTIVITY_HEAD=ACTIVITY_HEAD.replace('static final int COUNT=4;', 'static final int COUNT=AtomicWorkbenchWorkspaceModel.WINDOW_COUNT;')
ACTIVITY_HEAD=ACTIVITY_HEAD.replace('new Slot(0),new Slot(1),new Slot(2),new Slot(3)', 'new Slot(0),new Slot(1),new Slot(2),new Slot(3),new Slot(4),new Slot(5),new Slot(6),new Slot(7)')
ACTIVITY_HEAD=ACTIVITY_HEAD.replace('new boolean[4]', 'new boolean[COUNT]').replace('new String[4]', 'new String[COUNT]')
ACTIVITY_HEAD+='\n int emptySideSlots=3;\n'
_CAPACITY_SIGNATURES=['private int[] presentationOrder(', 'private boolean outputPresented(', 'private static final class FocusOutput', 'private FocusOutput captureFocusOutput(', 'private boolean focusOutputCurrent(', 'private Bundle attachFocusOutput(', 'private static Bundle focusOutputFailure(', 'private static ArrayList<Bundle> poolWindowsOrNull(', 'private static Bundle poolStatus(']
ACTIVITY_HEAD+='\n'+ '\n'.join(member(_candidate,s) for s in _CAPACITY_SIGNATURES)+'\n'
_snapshot=SOURCES['ls/augment/com/AtomicWorkbenchTaskUiSnapshot.java']
_snapshot=_snapshot.rsplit('}',1)[0]+'AtomicWorkbenchTaskUiSnapshot(android.os.Bundle state,AtomicWorkbenchRecoveryScope.ReaderProfile reader){throw new IllegalArgumentException("not_a_task_snapshot_fixture");}}'
SOURCES['ls/augment/com/AtomicWorkbenchTaskUiSnapshot.java']=_snapshot
ROOT_HEAD+=member((SRC/'AtomicWorkbenchRoot.java').read_text(encoding='utf-8'),'private Bundle recoveryState(')
ROOT_HEAD=ROOT_HEAD.replace('static class Backend {','static class Backend {AtomicWorkbenchRecoveryScope.ReaderProfile recoveryDomain(){return AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8;}')
_old_status=member(CLIENT_HEAD,'Bundle status()')
_new_status=r"""Bundle status(){statusQueries++;Bundle b=new Bundle(response);b.putBoolean("ui_parked",parked);if(statusQueries==failStatusAt)b.putBoolean("success",false);
 if(statusQueries==omitWindowsStatusAt)return b;
 return AtomicWorkbenchProtocol.recoveryState(CapacityFixtureState.raw(b,rootWindows),AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8);}"""
CLIENT_HEAD=CLIENT_HEAD.replace(_old_status,_new_status,1)
CLIENT_HEAD+='\n static java.util.ArrayList<Bundle> recoveryPoolWindows(Bundle b){return AtomicWorkbenchProtocol.recoveryPoolWindows(b);}\n'

if __name__ == "__main__":
    main()
