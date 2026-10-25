"""Execute actual Engine task fences/allocation against the existing explicit Platform adapter."""
from pathlib import Path
import runpy
import tempfile

ENGINE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-engine.py')))
MODELS = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-models.py')))
LIFECYCLE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-lifecycle.py')))
PLATFORM = ENGINE['PLATFORM'].replace('final int id;', 'final int id;int allocations;long allocationGeneration;Surface allocationSurface;')
PLATFORM = PLATFORM.replace('throw new AssertionError("task allocation outside legacy coordinator scope");', 'allocations++;allocationGeneration=g;allocationSurface=s;live=true;state="active";Bundle b=status();b.putString("allocation_id",a);b.putInt("task_count",0);b.putBoolean("retained_empty_task_display",true);return b;')
SOURCES = {
    'android/os/Bundle.java': ENGINE['BUNDLE'],
    'android/os/Handler.java': 'package android.os;public class Handler{}',
    'android/content/Context.java': 'package android.content;public class Context{}',
    'android/content/Intent.java': 'package android.content;public class Intent{}',
    'android/content/ComponentName.java': ENGINE['migration_sources']()['android/content/ComponentName.java'],
    'android/view/Surface.java': 'package android.view;public class Surface{public boolean released;public void release(){released=true;}}',
    'android/view/KeyEvent.java': 'package android.view;public class KeyEvent{public static final int ACTION_DOWN=0;public int getAction(){return 0;}}',
    'android/view/MotionEvent.java': 'package android.view;public class MotionEvent{public static final int ACTION_DOWN=0;final int a;public MotionEvent(int a){this.a=a;}public int getActionMasked(){return a;}}',
    'ls/augment/com/AtomicWorkbenchPlatform.java': PLATFORM,
}
TEST = ENGINE['ENGINE_TEST'].split(' public static void main(String[] args){', 1)[0] + r'''
 static final class Tasks implements AtomicWorkbenchEngine.TaskController{
 boolean pending,failCleanup;int maintains;Bundle reply(){Bundle b=new Bundle();b.putBoolean("success",true);return b;}
 public Bundle change(Bundle b){return reply();}public Bundle query(String id){return reply();}public Bundle shelf(){return reply();}public Bundle cancel(String id){return reply();}
 public Bundle cleanup(){Bundle b=reply();b.putBoolean("success",!failCleanup);b.putBoolean("cleanup_pending",failCleanup);b.putBoolean("had_responsibility",pending);if(!failCleanup)pending=false;return b;}
 public void maintain(){maintains++;}public boolean hasPending(){return pending;}public boolean blocksWindow(int id){return pending&&id==0;}
 }
 public static void main(String[]args){
  test("empty allocation preserves physical foreground and has no input-role side effect",()->{Fixture f=new Fixture();f.engine.configureTaskOperations(new Tasks());AtomicWorkbenchPlatform.globalFocus=200;Surface surface=new Surface();long revision=f.engine.inputRevision();Bundle b=f.engine.allocateTaskDisplay(0,surface,1080,2400,420,9,"a".repeat(32));check(b.getBoolean("success")&&f.slot(0).allocations==1&&!surface.released,"allocation did not transfer surface once");check(f.engine.activeInputWindow()==-1&&AtomicWorkbenchPlatform.globalFocus==200&&f.slot(-1).focusCalls==0&&f.slot(0).opens==0&&f.slot(0).homeOpens==0,"allocation focused/launched another task");check(f.engine.inputRevision()>revision,"new output did not fence stale UI metadata");});
  test("allocation rejects reused output generation across slots",()->{Fixture f=new Fixture();f.engine.configureTaskOperations(new Tasks());f.engine.allocateTaskDisplay(0,new Surface(),1080,2400,420,9,"a".repeat(32));Surface stale=new Surface();Bundle b=f.engine.allocateTaskDisplay(1,stale,1080,2400,420,8,"b".repeat(32));check(!b.getBoolean("success")&&stale.released&&f.slot(1).allocations==0,"old producer allocated another slot");});
  test("existing task/display is never closed or recreated by allocation",()->{Fixture f=new Fixture();f.open(0);f.engine.configureTaskOperations(new Tasks());Surface incoming=new Surface();Bundle b=f.engine.allocateTaskDisplay(0,incoming,1080,2400,420,9,"a".repeat(32));check(!b.getBoolean("success")&&incoming.released&&f.slot(0).allocations==0&&f.slot(0).partialCloses==0&&f.slot(0).fullCloses==0&&f.slot(0).live,"allocation destroyed existing task/display");});
  test("pending exact task blocks side close HOME focus launch share and stale input",()->{Fixture f=new Fixture();f.open(0);f.engine.focusWindow(0);Tasks task=new Tasks();f.engine.configureTaskOperations(task);task.pending=true;int clicks=f.slot(0).clicks,focus=f.slot(0).focusCalls;Surface home=new Surface(),open=new Surface();check(!f.engine.closeWindow(0).getBoolean("success")&&!f.engine.showNativeHome(0,home,1080,2400,420).getBoolean("success")&&!f.engine.openWindow(0,open,1080,2400,420,"app0/.Main").getBoolean("success"),"pending task admitted destructive window action");check(home.released&&open.released&&f.slot(0).partialCloses==0&&f.slot(0).homeOpens==0&&f.slot(0).opens==1,"blocked action touched backend or leaked surface");check(!f.engine.focusWindow(0).getBoolean("success")&&!f.engine.shareWindow(0,new android.content.Intent(),"app0").getBoolean("success"),"pending task admitted new focus/share");check(f.engine.inject(0,new MotionEvent(0))&&f.engine.key(0,new KeyEvent())&&f.slot(0).clicks==clicks&&f.slot(0).focusCalls==focus,"pending task forwarded stale physical input");Bundle state=f.engine.windowState(0);check(!state.getBoolean("success")&&state.getBoolean("operation_unconfirmed")&&!state.getBoolean("recovery_pending"),"task uncertainty became global task recovery");});
  test("task cleanup failure never blocks original backend task migration",()->{Fixture f=new Fixture();f.open(0);f.open(1);Tasks task=new Tasks();task.pending=task.failCleanup=true;f.engine.configureTaskOperations(task);Bundle b=f.engine.close();check(!b.getBoolean("success")&&b.getBoolean("recovery_pending")&&task.hasPending(),"failed task cleanup falsely completed");check(f.slot(0).fullCloses==1&&f.slot(1).fullCloses==1&&!f.slot(0).live&&!f.slot(1).live,"new task responsibility blocked existing backend task return");});
  test("original input cancellation failure prevents task action and preserves generation",()->{Fixture f=new Fixture();f.open(0);long before=f.engine.inputRevision();f.slot(0).failCancel=true;Bundle b=f.engine.cancelTaskWindowInput(0,before);check(!b.getBoolean("success")&&f.engine.inputRevision()==before&&f.slot(0).live,"failed pre-task CANCEL advanced or destroyed owner");});
  test("task-only responsibility contributes to no-session and maintenance truth",()->{Fixture f=new Fixture();Tasks task=new Tasks();task.pending=true;f.engine.configureTaskOperations(task);f.engine.retryWindowRecovery();check(task.maintains==1,"task maintenance not driven by existing phone engine tick");Bundle b=f.engine.close();check(b.getBoolean("success")&&!b.getBoolean("no_session"),"cleaned task responsibility claimed no session/no changes");});
  test("explicit unreadable task scope never becomes clean merely because visible windows returned",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.engine.taskOperationsUnavailable("task_storage_unavailable");Bundle state=f.engine.status();check(!state.getBoolean("success")&&state.getBoolean("recovery_pending")&&state.getBoolean("operation_unconfirmed")&&f.engine.hasRecoveryPending(),"unreadable historical task scope became verified status");Bundle closed=f.engine.close();check(!closed.getBoolean("success")&&closed.getBoolean("recovery_pending")&&closed.getBoolean("operation_unconfirmed")&&!closed.getBoolean("no_session"),"unreadable historical task scope completed close");check(f.slot(0).fullCloses==1&&f.slot(1).fullCloses==1&&!f.slot(0).live&&!f.slot(1).live,"unknown history prevented actual visible task return");});
  test("never-configured legacy Engine does not pretend it read a task Shelf",()->{Fixture f=new Fixture();Bundle state=f.engine.status();check("not_configured".equals(state.getString("task_backend_state"))&&!state.getBoolean("task_scope_verified")&&!state.getBoolean("task_storage_unverified")&&!state.getBoolean("task_backend_available"),"default Engine invented verified or failed history");Bundle b=f.engine.close();check(b.getBoolean("success")&&b.getBoolean("no_session")&&!b.getBoolean("recovery_pending")&&!f.engine.hasRecoveryPending(),"default legacy Engine acquired unknown task responsibility");});
  test("unknown history never fabricates a task cleanup or omits empty-slot cleanup",()->{Fixture f=new Fixture();f.engine.taskOperationsUnavailable("task_storage_unavailable");Bundle b=f.engine.close();check(!b.getBoolean("success")&&!b.getBoolean("no_session")&&!b.containsKey("task_cleanup")&&b.getBoolean("task_storage_unverified")&&!b.getBoolean("task_scope_verified")&&"storage_unverified".equals(b.getString("task_backend_state"))&&"task_storage_unavailable".equals(b.getString("task_backend_reason")),"unknown history fabricated scope proof or cleanup receipt");check(f.slot(-1).fullCloses==1,"legacy cleanup skipped");for(int id=0;id<4;id++)check(f.slot(id).fullCloses==1,"an actual slot cleanup was skipped");});
  test("scope warning preserves actual Platform and HOME failure details",()->{Fixture f=new Fixture();f.open(0);f.open(1);f.slot(1).failFull=true;f.engine.taskOperationsUnavailable("task_storage_unavailable");Bundle b=f.engine.close();check(!b.getBoolean("success")&&b.getString("message").contains("窗口 2")&&b.getString("message").contains("历史任务记录"),"scope warning replaced actual window failure");check(f.slot(0).fullCloses==1&&f.slot(1).fullCloses==1,"scope or one window failure blocked other task return");Fixture h=new Fixture();h.open(0);h.slot(0).nativeHome=true;h.slot(0).failHomeRestore=true;h.engine.taskOperationsUnavailable("task_storage_unavailable");Bundle hb=h.engine.close();check(!hb.getBoolean("success")&&hb.getString("message").contains("recovering")&&hb.getString("message").contains("历史任务记录")&&h.slot(0).homeRestores>0,"HOME failure was hidden by scope warning");});
  test("published controller clears bootstrap uncertainty but not actual cleanup pending",()->{Fixture f=new Fixture();f.engine.taskOperationsUnavailable("task_storage_unavailable");Tasks t=new Tasks();t.pending=t.failCleanup=true;f.engine.configureTaskOperations(t);Bundle s=f.engine.status();check(f.engine.taskOperationsConfigured()&&!f.engine.taskStorageUnverified()&&s.getBoolean("task_scope_verified")&&s.getBoolean("task_backend_available")&&"ready".equals(s.getString("task_backend_state")),"successful controller attachment stayed bootstrap-unknown");Bundle b=f.engine.close();check(!b.getBoolean("success")&&b.getBoolean("recovery_pending")&&b.getBundle("task_cleanup").getBoolean("had_responsibility"),"readable scope bypassed actual cleanup confirmation");t.failCleanup=false;check(f.engine.close().getBoolean("success")&&!f.engine.hasRecoveryPending(),"confirmed cleanup could not converge");});
  test("an installed controller cannot be replaced or demoted",()->{Fixture f=new Fixture();Tasks t=new Tasks();f.engine.configureTaskOperations(t);boolean replaced=false,demoted=false;try{f.engine.configureTaskOperations(new Tasks());}catch(IllegalStateException expected){replaced=true;}try{f.engine.taskOperationsUnavailable("task_storage_unavailable");}catch(IllegalStateException expected){demoted=true;}check(replaced&&demoted&&f.engine.taskOperationsConfigured()&&!f.engine.taskStorageUnverified(),"existing controller responsibility was replaced or hidden");});
  System.out.println("TASK ENGINE RESULT "+tests+" cases; "+checks+" assertions");
 }
}'''

# Actual Root retry/close/completion methods and actual TaskOperations read-before-publication
# constructor, with explicit bounded storage/clock/Handler/Platform adapters. No disk or phone IO.
ROOT_HEAD = r'''package ls.augment.com;import android.os.*;import android.content.*;import java.util.*;
final class ScopeRoot {
 final Context context=new Context();final int appUid=10055,userId=0;
 final Handler engine=new Handler(Looper.worker);final HandlerThread engineThread=new HandlerThread();
 AtomicWorkbenchEngine backend;int taskBackendRetryAttempt,recoveryAttempt,clears;long taskBackendRetryElapsed;
 boolean finished,closing,focusPrimaryHomeOnClose,extractionGeometryCleanupPending;String closeReason="none";
 final List<String> events=new ArrayList<>();final Runnable checkOwner=()->{};
 static class Resource {void close(){}}Resource media,notifications;
 static class PasteHost {void close(){}void maintain(){}}PasteHost pasteHost;
 void clearExtractionGeometry(){}void clearInputs(){clears++;}int currentUserId(){return userId;}
 void requireReferenceSession(){}Bundle systemSessionMetadata(){return new Bundle();}
 Bundle readHomeReadiness(Bundle b){throw new AssertionError("unexpected readiness query");}
 Bundle controlInputFocus(String a,Bundle b){throw new AssertionError("unexpected focus mutation");}
 void lifecycle(String event,String detail,Throwable error){events.add(event+" "+detail);}
 static Bundle failureState(Throwable t,boolean pending){Bundle b=new Bundle();b.putBoolean("success",false);b.putBoolean("recovery_pending",pending);return b;}
}
'''
ROOT_TEST = r'''package ls.augment.com;import android.os.*;
public final class TestRootRecoveryScope {
 static int tests,checks;interface Run{void run()throws Exception;}static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void test(String name,Run body)throws Exception{AtomicWorkbenchTaskShelfStore.reset();AtomicWorkbenchTaskOperations.reset();Looper.current=Looper.worker;SystemClock.now=1000;Handler.mainPosts=0;try{body.run();}catch(Exception unexpected){throw new AssertionError("unexpected exception in "+name,unexpected);}tests++;System.out.println("PASS Root recovery scope: "+name);}
 static void reject(Run body)throws Exception{boolean rejected=false;try{body.run();}catch(IllegalStateException expected){rejected=true;}check(rejected,"off-lane or invalid mutation accepted");}
 public static void main(String[]args)throws Exception{
  test("actual constructor read fails before controller publication without rebuilding Engine",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failReads=2;var original=r.backend();check(original.taskStorageUnverified()&&!original.taskOperationsConfigured()&&AtomicWorkbenchTaskShelfStore.constructs==1&&AtomicWorkbenchTaskShelfStore.reads==1,"read failure published controller or was not attempted");check(r.backend()==original&&AtomicWorkbenchTaskShelfStore.reads==1,"ordinary backend getter retried IO");var p=original.taskPlatform(0);original.openWindow(0,new android.view.Surface(),1080,2400,420,"app/.Main");r.closing=true;Bundle b=r.closeOnce();check(r.backend==original&&original.taskPlatform(0)==p&&p.fullCloses==1&&!p.live&&!b.getBoolean("success")&&b.getBoolean("recovery_pending"),"failed reread rebuilt owner or blocked visible task migration");check(AtomicWorkbenchTaskShelfStore.reads==2&&AtomicWorkbenchTaskOperations.cleanups==0,"failed read was skipped or fake cleanup ran");});
  test("actual close retries full read then requires actual cleanup confirmation",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failReads=1;r.backend();var original=r.backend;r.closing=true;AtomicWorkbenchTaskOperations.failCleanup=true;Bundle first=r.closeOnce();check(AtomicWorkbenchTaskShelfStore.reads==2&&r.backend==original&&original.taskOperationsConfigured()&&!original.taskStorageUnverified()&&AtomicWorkbenchTaskOperations.cleanups==1,"successful retry did not publish exactly one read controller");check(!first.getBoolean("success")&&first.getBoolean("recovery_pending"),"successful read was incorrectly a successful cleanup");AtomicWorkbenchTaskOperations.failCleanup=false;Bundle second=r.closeOnce();check(second.getBoolean("success")&&!second.getBoolean("recovery_pending")&&AtomicWorkbenchTaskShelfStore.reads==2&&AtomicWorkbenchTaskOperations.cleanups==2,"installed controller was rebuilt or genuine cleanup cannot finish");});
  test("first close on cold Root attempts storage once and still visits all slots",()->{ScopeRoot r=new ScopeRoot();r.closing=true;AtomicWorkbenchTaskShelfStore.failReads=10;Bundle b=r.closeOnce();check(AtomicWorkbenchTaskShelfStore.constructs==1&&AtomicWorkbenchTaskShelfStore.reads==1&&!b.getBoolean("success"),"cold close double read or false completion");for(int id=0;id<4;id++)check(r.backend.taskPlatform(id).fullCloses==1,"cold failed read skipped actual slot close");});
  test("nonclosing maintenance retry is bounded and status remains observation only",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failReads=10;r.backend();check(r.taskBackendRetryElapsed==3000,"first retry budget wrong");for(int i=0;i<3;i++){r.backend().status();r.maintainWindows.run();}check(AtomicWorkbenchTaskShelfStore.reads==1,"status or early maintenance retried storage");SystemClock.now=3000;r.maintainWindows.run();check(AtomicWorkbenchTaskShelfStore.reads==2&&r.taskBackendRetryElapsed==7000,"eligible maintenance omitted read/backoff");AtomicWorkbenchTaskShelfStore.failReads=0;SystemClock.now=7000;r.maintainWindows.run();check(r.backend.taskOperationsConfigured()&&AtomicWorkbenchTaskShelfStore.reads==3&&AtomicWorkbenchTaskOperations.maintains>0&&AtomicWorkbenchTaskOperations.cleanups==0,"maintenance failed to heal or invoked global cleanup");r.maintainWindows.run();r.ensureTaskBackend(true);check(AtomicWorkbenchTaskShelfStore.reads==3,"installed controller replaced during maintenance/explicit retry");});
  test("explicit close may retry before maintenance delay but cannot fake an empty scope",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failReads=10;r.backend();r.closing=true;SystemClock.now=1001;Bundle b=r.closeOnce();check(AtomicWorkbenchTaskShelfStore.reads==2&&!b.getBoolean("success")&&b.getBoolean("task_storage_unverified")&&!b.getBoolean("no_session"),"explicit close skipped read or guessed no historical session");});
  test("persistent constructor LinkageError keeps pending without replacing visible backend",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failConstructs=true;var original=r.backend();check(original.taskStorageUnverified()&&AtomicWorkbenchTaskShelfStore.reads==0,"failed constructor was treated as a completed read");r.closing=true;Bundle b=r.closeOnce();check(r.backend==original&&!b.getBoolean("success")&&b.getBoolean("recovery_pending")&&AtomicWorkbenchTaskShelfStore.constructs==2,"permanent failure lost owner/scope responsibility");});
  test("retry is serialized on engine lane and never executes task mutations",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failReads=1;r.backend();int reads=AtomicWorkbenchTaskShelfStore.reads;Looper.current=Looper.main;reject(()->r.ensureTaskBackend(true));check(AtomicWorkbenchTaskShelfStore.reads==reads,"off-lane call reached Store");Looper.current=Looper.worker;r.ensureTaskBackend(true);r.backend.status();check(AtomicWorkbenchTaskOperations.actions==0&&AtomicWorkbenchTaskOperations.cleanups==0,"read retry/status dispatched a task operation");});
  test("final actual finish guard retains unknown scope even after all visible slots closed",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failReads=10;r.backend();r.closing=true;r.closeOnce();r.finishLater();check(!r.finished&&Handler.mainPosts==0&&r.engine.waiting.containsKey(r.recover)&&r.events.stream().anyMatch(e->e.startsWith("ROOT_FINISH_DEFERRED")),"finish guard exited with unreadable history");});
  test("actual recover retains Root on failure and converges using existing backoff",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failReads=2;r.backend();r.closing=true;r.scheduleRecovery();check(r.engine.waiting.get(r.recover)==0,"initial recovery not immediate");r.engine.run(r.recover);check(!r.finished&&r.recoveryAttempt==1&&r.engine.waiting.get(r.recover)==2000L,"failed scope recovery exited or changed first backoff");AtomicWorkbenchTaskShelfStore.failReads=0;r.engine.run(r.recover);check(r.finished&&Handler.mainPosts==1&&!r.engine.waiting.containsKey(r.recover)&&AtomicWorkbenchTaskOperations.cleanups==1,"read+cleanup confirmation did not retire Root");});
  test("restarted Root cannot inherit a false clean receipt from absent controller",()->{AtomicWorkbenchTaskShelfStore.failReads=10;ScopeRoot a=new ScopeRoot();a.backend();a.closing=true;check(!a.closeOnce().getBoolean("success"),"first Root falsely clean");ScopeRoot b=new ScopeRoot();b.closing=true;check(!b.closeOnce().getBoolean("success")&&b.backend.taskStorageUnverified()&&AtomicWorkbenchTaskShelfStore.reads==3,"new Root skipped its own historical scope read");});
  test("blocking failed read starts backoff at failure return rather than attempt start",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failReads=10;AtomicWorkbenchTaskShelfStore.advanceDuringRead=8000;r.backend();check(SystemClock.now==9000&&r.taskBackendRetryElapsed==11000,"blocked IO exhausted its own backoff before returning");SystemClock.now=10000;r.maintainWindows.run();check(AtomicWorkbenchTaskShelfStore.reads==1,"maintenance immediately repeated a slow failed read");});
  test("retry delay saturates safely and stays bounded to thirty seconds",()->{ScopeRoot r=new ScopeRoot();AtomicWorkbenchTaskShelfStore.failReads=100;r.backend();for(int i=0;i<8;i++){SystemClock.now+=40000;r.ensureTaskBackend(true);}check(r.taskBackendRetryElapsed-SystemClock.now==30000&&r.taskBackendRetryAttempt==5,"retry delay grew unbounded");ScopeRoot near=new ScopeRoot();SystemClock.now=Long.MAX_VALUE-1000;near.backend();check(near.taskBackendRetryElapsed==Long.MAX_VALUE,"retry timestamp overflowed into immediate retry");});
  System.out.println("ROOT RECOVERY SCOPE RESULT "+tests+" cases; "+checks+" assertions");
 }
}'''


def root_scope_sources():
    root = (MODELS['SRC'] / 'AtomicWorkbenchRoot.java').read_text(encoding='utf-8')
    operations = (MODELS['SRC'] / 'AtomicWorkbenchTaskOperations.java').read_text(encoding='utf-8')
    member = LIFECYCLE['member']
    signatures = ('private AtomicWorkbenchEngine backend()', 'private void ensureTaskBackend(',
                  'private Bundle closeOnce()', 'private synchronized void scheduleRecovery',
                  'private final Runnable recover', 'private final Runnable maintainWindows', 'private void finishLater()',
                  'private void requestRecovery()', 'private void requestRecovery(String reason)')
    # Visibility is widened only for the offline entry points; each actual method body is intact.
    bodies = '\n'.join(member(root, signature).replace('private ', '', 1) + (';' if 'Runnable' in signature else '') for signature in signatures)
    sources = dict(SOURCES)
    sources['android/os/Looper.java'] = 'package android.os;public class Looper{public static final Looper worker=new Looper(),main=new Looper();public static Looper current=worker;public static Looper myLooper(){return current;}public static Looper getMainLooper(){return main;}}'
    sources['android/os/Handler.java'] = r'''package android.os;import java.util.*;public class Handler{public static int mainPosts;final Looper looper;public final Map<Runnable,Long>waiting=new LinkedHashMap<>();public Handler(Looper l){looper=l;}public Looper getLooper(){return looper;}public boolean post(Runnable r){return postDelayed(r,0);}public boolean postDelayed(Runnable r,long delay){if(looper==Looper.main)mainPosts++;else waiting.put(r,delay);return true;}public void removeCallbacks(Runnable r){waiting.remove(r);}public void run(Runnable r){waiting.remove(r);r.run();}}'''
    sources['android/os/HandlerThread.java'] = 'package android.os;public class HandlerThread{public void quitSafely(){}}'
    sources['android/os/SystemClock.java'] = 'package android.os;public class SystemClock{public static long now;public static long elapsedRealtime(){return now;}}'
    sources['android/os/Binder.java'] = 'package android.os;public class Binder{public static long clearCallingIdentity(){return 1;}public static void restoreCallingIdentity(long v){}}'
    sources['ls/augment/com/AtomicWorkbenchPlatform.java'] = PLATFORM.replace('final class AtomicWorkbenchPlatform {', '''final class AtomicWorkbenchPlatform {
 interface ReadinessReader{Bundle read(Bundle b)throws Exception;}interface FocusController{Bundle control(String a,Bundle b)throws Exception;}
 AtomicWorkbenchPlatform(android.content.Context c,int uid,int user,Handler h,int id,ReadinessReader r,FocusController f){this(c,uid,user,h,id);}
''')
    sources['ls/augment/com/AtomicWorkbenchDiagnostics.java'] = 'package ls.augment.com;final class AtomicWorkbenchDiagnostics{static void flush(long t){}static void emit(String event,int window,int user,String component,int display,String detail,Throwable error){}}'
    sources['ls/augment/com/AtomicWorkbenchTaskAuthority.java'] = 'package ls.augment.com;import android.os.*;final class AtomicWorkbenchTaskAuthority{interface Authentication{Bundle get()throws Exception;}AtomicWorkbenchTaskAuthority(android.content.Context c,Authentication a){}}'
    sources['ls/augment/com/AtomicWorkbenchTaskShelfStore.java'] = r'''package ls.augment.com;final class AtomicWorkbenchTaskShelfStore{static int constructs,reads,failReads;static long advanceDuringRead;static boolean failConstructs;static void reset(){constructs=reads=failReads=0;advanceDuringRead=0;failConstructs=false;}AtomicWorkbenchTaskShelfStore(android.content.Context c,int uid,int user){constructs++;if(failConstructs)throw new LinkageError("fixed storage boundary");}Object read()throws Exception{reads++;android.os.SystemClock.now+=advanceDuringRead;if(failReads>0){failReads--;throw new Exception("fixed storage read boundary");}return new Object();}}'''
    constructor = member(operations, 'AtomicWorkbenchTaskOperations(AtomicWorkbenchEngine engine, AtomicWorkbenchTaskAuthority authority,\n                                 AtomicWorkbenchTaskShelfStore store,ReferenceAuthorization referenceAuthorization)')
    sources['ls/augment/com/AtomicWorkbenchTaskOperations.java'] = r'''package ls.augment.com;import android.os.*;final class AtomicWorkbenchTaskOperations implements AtomicWorkbenchEngine.TaskController{
 interface ReferenceAuthorization{void requireCurrent()throws Exception;}final AtomicWorkbenchEngine engine;final AtomicWorkbenchTaskAuthority authority;final AtomicWorkbenchTaskShelfStore store;final ReferenceAuthorization referenceAuthorization;Object snapshot;
 static int actions,cleanups,maintains;static boolean failCleanup;static void reset(){actions=cleanups=maintains=0;failCleanup=false;}
 Object readStore()throws Exception{return store.read();}
''' + constructor + r'''
 public Bundle change(Bundle b){actions++;throw new AssertionError("unexpected task mutation");}public Bundle query(String id){actions++;throw new AssertionError("unexpected task query");}public Bundle shelf(){actions++;throw new AssertionError("unexpected shelf query");}public Bundle cancel(String id){actions++;throw new AssertionError("unexpected cancel");}
 public Bundle cleanup(){cleanups++;Bundle b=new Bundle();b.putBoolean("success",!failCleanup);b.putBoolean("cleanup_pending",failCleanup);return b;}public void maintain(){maintains++;}public boolean hasPending(){return failCleanup;}public boolean blocksWindow(int id){return false;}
}'''
    sources['ls/augment/com/ScopeRoot.java'] = ROOT_HEAD.rsplit('}', 1)[0] + bodies + '}'
    sources['ls/augment/com/TestRootRecoveryScope.java'] = ROOT_TEST
    return sources


def main():
    sources = dict(SOURCES); sources['ls/augment/com/TestAtomicWorkbenchEngine.java'] = TEST
    production = ['AtomicWorkbenchEngine.java', 'AtomicWorkbenchProtocol.java']
    sources, production = ENGINE['output_support'](sources, production)
    with tempfile.TemporaryDirectory(prefix='duo-task-engine-') as directory:
        work = Path(directory)
        MODELS['compile_run'](work / 'base', sources, production, 'ls.augment.com.TestAtomicWorkbenchEngine')
        controls = [
            ('no focus during allocation', 'return decorate(id, platform.allocateTaskDisplay(', 'activeWindow = id; return decorate(id, platform.allocateTaskDisplay('),
            ('global output high-water', 'generation <= outputGeneration || generation <= 0', 'generation <= 0'),
            ('pending side close', 'if (taskController != null && taskController.blocksWindow(id)) return taskOperationBlocked(id);\n        ++inputRevision;\n        if (activeWindow == id)', '++inputRevision;\n        if (activeWindow == id)'),
            ('cleanup must continue task return', 'success = false; pending = true;\n        }\n        ArrayList<Bundle> entries', 'return taskCleanup;\n        }\n        ArrayList<Bundle> entries'),
            ('explicit failure is not default null controller', 'taskStorageUnverified = true;', ''),
            ('successful attachment retires bootstrap uncertainty', 'taskStorageUnverified = false;', ''),
            ('unknown scope remains recovery pending', 'if (taskStorageUnverified()) return true;', ''),
            ('close cannot certify unreadable scope', 'if (taskStorageUnverified()) {\n            success = false; pending = true;', 'if (false) {\n            success = false; pending = true;'),
            ('status cannot certify unreadable scope', 'if (taskStorageUnverified()) {\n            top.putBoolean', 'if (false) {\n            top.putBoolean'),
            ('unconfigured scope has not been read', 'taskController != null && !unknown', '!unknown'),
        ]
        for number, (label, old, new) in enumerate(controls):
            result = MODELS['compile_run'](work / f'negative-{number}', sources, production, 'ls.augment.com.TestAtomicWorkbenchEngine',
                replacements={'ls/augment/com/AtomicWorkbenchEngine.java': (old, new)}, capture=True)
            assert result.returncode != 0 and b'AssertionError' in result.stderr, 'task engine negative escaped or failed compilation: ' + label
            print('PASS task Engine production negative:', label)
        print('TASK ENGINE NEGATIVE CONTROLS', len(controls), 'passed')
        root_sources = root_scope_sources()
        root_sources, root_production = ENGINE['output_support'](root_sources, ['AtomicWorkbenchEngine.java', 'AtomicWorkbenchProtocol.java'])
        MODELS['compile_run'](work / 'root-scope-base', root_sources, root_production, 'ls.augment.com.TestRootRecoveryScope')
        root_controls = [
            ('Root initial setup must read storage', 'ScopeRoot.java', 'ensureTaskBackend(true);\n            engine.postDelayed', 'engine.postDelayed'),
            ('Root retry retains installed controller', 'ScopeRoot.java', 'if (current == null || current.taskOperationsConfigured()) return;', 'if (current == null) return;'),
            ('Root bounded maintenance backoff', 'ScopeRoot.java', 'if (!explicitRetry && now < taskBackendRetryElapsed) return;', ''),
            ('Root actual read before publication', 'AtomicWorkbenchTaskOperations.java', 'snapshot = readStore();', 'snapshot = null;'),
            ('Root failed setup retains unknown scope', 'ScopeRoot.java', 'current.taskOperationsUnavailable("task_storage_unavailable");', ''),
            ('Root close retries unreadable storage', 'ScopeRoot.java', 'else ensureTaskBackend(true);', ''),
            ('Root explicit close is not delayed maintenance', 'ScopeRoot.java', 'else ensureTaskBackend(true);', 'else ensureTaskBackend(false);'),
            ('Root readable storage is not cleanup confirmation', 'ScopeRoot.java', 'result = current.close(focusPrimaryHomeOnClose);', 'result = new Bundle(); result.putBoolean("success", true);'),
            ('Root maintenance eventually rereads storage', 'ScopeRoot.java', 'ensureTaskBackend(false);', ''),
            ('Root final scope guard must retain unknown owner', 'ScopeRoot.java', 'if (current != null && current.hasRecoveryPending()) {', 'if (false) {'),
            ('Root same engine lane required', 'ScopeRoot.java', 'if (Looper.myLooper() != engine.getLooper()) throw new IllegalStateException("task_backend_worker_required");', ''),
            ('Root original recovery delay remains meaningful', 'ScopeRoot.java', 'recoveryAttempt == 0 ? 0 : Math.min(30000L, 1000L << Math.min(recoveryAttempt, 5))', '0'),
            ('Root slow failure cannot consume its own retry delay', 'ScopeRoot.java', 'long failedAt = android.os.SystemClock.elapsedRealtime();', 'long failedAt = now;'),
        ]
        for number, (label, name, old, new) in enumerate(root_controls):
            result = MODELS['compile_run'](work / f'root-scope-negative-{number}', root_sources, root_production, 'ls.augment.com.TestRootRecoveryScope',
                replacements={'ls/augment/com/' + name: (old, new)}, capture=True)
            assert result.returncode != 0 and b'AssertionError' in result.stderr, 'Root recovery-scope negative escaped or failed compilation: ' + label
            print('PASS actual Root recovery-scope production negative:', label)
        print('ROOT RECOVERY SCOPE NEGATIVE CONTROLS', len(root_controls), 'passed')


if __name__ == '__main__':
    main()
