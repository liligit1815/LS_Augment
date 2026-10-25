"""Exercise the production ROOT launch bridge and Platform lifecycle with fake OS services.

The Binder/service boundaries are test doubles; launch, polling, classification and cleanup
are production code. No phone, ROOT process, live application, or personal file is used.
"""
from pathlib import Path
import os
import runpy
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
ROOT = SUPPORT["ROOT"]

DIAGNOSTICS = r'''package ls.augment.com;import java.util.*;
final class AtomicWorkbenchDiagnostics {
 static final List<String> events=new ArrayList<>();
 static void emit(String event,int window,int display,String component,int result,String detail,Throwable error){
  events.add(event+"|"+window+"|"+display+"|"+component+"|"+result+"|"+detail+"|"+(error==null?"":error));
 }
}'''

JOURNAL = r'''package ls.augment.com;import java.util.*;
final class AtomicWorkbenchJournal {
 static final String PACKAGE="ls.augment.com";static AtomicWorkbenchJournal latest;Record saved;boolean locked,failClear;
 AtomicWorkbenchJournal(android.content.Context c,int uid,int user,int id){latest=this;}
 void acquireLock(){locked=true;}boolean isLocked(){return locked;}void releaseLock(){locked=false;}
 boolean originalStorageMissing(){return false;}boolean exists(){return saved!=null;}Record read(){return saved;}
 void clear()throws Exception{if(failClear)throw new java.io.IOException("injected cleanup failure");saved=null;}
 void save(Record record){saved=record;}
 void archiveRecreatedHome(Record record,int replacementTaskId){}
 static final class TaskOrigin {final int taskId,displayId,userId;final String component;
  TaskOrigin(int id,int display,int user,String component){taskId=id;displayId=display;userId=user;this.component=component;}}
 static final class Record {final int ownerUid,userId,windowId;int displayId=-1,width,height,density,imePolicy=-1,hiddenTaskId=-1,homeTaskId=-1,homeOriginDisplay=0;String homeComponent="";boolean homeOnly,homeMigrationPending;
  int homeTransferDisplay=-1;String homeTransferName="",homeTransferUniqueId="";
  String state="prepared",component="",displayName="owned",uniqueId="owned-unique";final ArrayList<TaskOrigin> tasks=new ArrayList<>();
  Record(int uid,int user,int id){ownerUid=uid;userId=user;windowId=id;}}
}'''

SOURCES = {
    "ls/augment/com/FakeFocusController.java": r'''package ls.augment.com;
final class FakeFocusController implements AtomicWorkbenchPlatform.FocusController {
 static int suspends,resumes,closes;static boolean failSuspend,failResume,failClose,mutateIdentity;
 static android.content.Context context;static android.view.Display display;static android.os.Bundle lastIdentity;
 static String replyMode="";static Runnable onResume;static final java.util.List<String> events=new java.util.ArrayList<>();
 final android.content.Context owner;FakeFocusController(android.content.Context owner){this.owner=owner;}
 static void reset(){suspends=resumes=closes=0;failSuspend=failResume=failClose=mutateIdentity=false;context=null;display=null;lastIdentity=null;replyMode="";onResume=null;events.clear();}
 public android.os.Bundle control(String action,android.os.Bundle identity)throws Exception {
  lastIdentity=new android.os.Bundle(identity);
  if(mutateIdentity)identity.putInt("display_id",-900);
  if(action.equals("suspend")){suspends++;context=owner;display=((android.hardware.display.DisplayManager)owner.getSystemService(android.content.Context.DISPLAY_SERVICE)).getDisplay(lastIdentity.getInt("display_id"));events.add("suspend:"+lastIdentity.getInt("display_id"));if(failSuspend)throw new java.io.IOException("managed focus callback missing");}
  else if(action.equals("resume")){resumes++;events.add("resume");if(failResume)throw new java.io.IOException("managed detach callback missing");if(onResume!=null)onResume.run();}
  else if(action.equals("close")){closes++;events.add("close");if(failClose)throw new java.io.IOException("managed detach pending");}
  else throw new IllegalArgumentException("unexpected focus action");
  if(replyMode.equals("null"))return null;
  android.os.Bundle reply=new android.os.Bundle();
  reply.putBoolean("success",!replyMode.equals("false_suspended"));
  if(!replyMode.equals("missing_cleanup"))reply.putBoolean("cleanup_pending",replyMode.equals("pending"));
  if(!replyMode.equals("missing_focus"))reply.putBoolean("focus_suspended",replyMode.equals("contradictory_success")?!action.equals("suspend"):action.equals("suspend")||replyMode.equals("false_suspended"));
  if(replyMode.equals("missing_success"))reply.remove("success");
  return reply;
 }
}''',
    "android/os/Bundle.java": SUPPORT["BUNDLE"],
    "android/os/Process.java": "package android.os;public class Process {public static int uid=0;public static int myUid(){return uid;}}",
    "android/os/SystemClock.java": "package android.os;public class SystemClock {public static long now=1000;public static long uptimeMillis(){return now;}public static long elapsedRealtime(){return now;}}",
    "android/os/UserHandle.java": "package android.os;public class UserHandle {public final int id;public UserHandle(int id){this.id=id;}}",
    "android/os/Handler.java": r'''package android.os;import java.util.*;public class Handler {
     final List<Runnable> pending=new ArrayList<>();public boolean postDelayed(Runnable r,long delay){pending.add(r);return true;}
     public void advance(long delta){SystemClock.now+=delta;List<Runnable> run=new ArrayList<>(pending);pending.clear();for(Runnable r:run)r.run();}
    }''',
    "android/content/Intent.java": r'''package android.content;import java.util.*;public class Intent {
     public static final String ACTION_MAIN="android.intent.action.MAIN",ACTION_SEND="android.intent.action.SEND",ACTION_SEND_MULTIPLE="android.intent.action.SEND_MULTIPLE",EXTRA_TEXT="text",EXTRA_STREAM="stream",CATEGORY_LAUNCHER="android.intent.category.LAUNCHER",CATEGORY_HOME="android.intent.category.HOME";
     public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000,FLAG_GRANT_READ_URI_PERMISSION=1;public String action,pkg,type;public int flags;public ComponentName component;public Intent selector;public android.net.Uri data;public ClipData clip;public final Map<String,Object> extras=new HashMap<>();public final Set<String> categories=new HashSet<>();
     public Intent(String action){this.action=action;}public Intent addCategory(String category){categories.add(category);return this;}
     public Intent setComponent(ComponentName value){component=value;return this;}public ComponentName getComponent(){return component;}
     public Intent addFlags(int value){flags|=value;return this;}public Intent setPackage(String value){pkg=value;return this;}
     public String getAction(){return action;}public int getFlags(){return flags;}public Set<String> getCategories(){return categories;}
     public Intent setType(String type){this.type=type;return this;}public String getType(){return type;}public String resolveTypeIfNeeded(ContentResolver resolver){return type;}public Intent getSelector(){return selector;}public android.net.Uri getData(){return data;}
     public Intent putExtra(String key,Object value){extras.put(key,value);return this;}public CharSequence getCharSequenceExtra(String key){return (CharSequence)extras.get(key);}
     public android.os.Bundle getBundleExtra(String key){return (android.os.Bundle)extras.get(key);}
     public <T>T getParcelableExtra(String key,Class<T> type){return type.cast(extras.get(key));}@SuppressWarnings("unchecked")public <T>ArrayList<T>getParcelableArrayListExtra(String key,Class<T> type){return (ArrayList<T>)extras.get(key);}
     public <T>Intent putParcelableArrayListExtra(String key,ArrayList<T> value){extras.put(key,value);return this;}public void setClipData(ClipData value){clip=value;}
    }''',
    "android/net/Uri.java": '''package android.net;public class Uri {final String text;private Uri(String text){this.text=text;}public static Uri parse(String text){return new Uri(text);}public String getScheme(){return text.substring(0,text.indexOf(':'));}public String getAuthority(){int start=text.indexOf("://")+3,end=text.indexOf('/',start);return text.substring(start,end<0?text.length():end);}}''',
    "android/content/ClipData.java": '''package android.content;public class ClipData {public final java.util.List<Item> items=new java.util.ArrayList<>();public ClipData(String label,String[] types,Item item){items.add(item);}public void addItem(Item item){items.add(item);}public static class Item{public final android.net.Uri uri;public Item(android.net.Uri uri){this.uri=uri;}}}''',
    "android/content/ContentResolver.java": "package android.content;public class ContentResolver {}",
    "android/content/Context.java": r'''package android.content;import android.os.*;import android.content.pm.*;import android.hardware.display.*;
    public class Context {public static final String DISPLAY_SERVICE="display";public final DisplayManager displays=new DisplayManager();public final PackageManager packages=new PackageManager();
     public Object getSystemService(String name){return displays;}public PackageManager getPackageManager(){return packages;}public ContentResolver getContentResolver(){return new ContentResolver();}
     public Context createContextAsUser(UserHandle user,int flags){packages.user=user.id;return this;}public String getPackageName(){return "android";}
     public void startActivityAsUser(Intent intent,Bundle options,UserHandle user){throw new AssertionError("Context start loses the system result; must never be called");}
    }''',
    "android/content/pm/ApplicationInfo.java": "package android.content.pm;public class ApplicationInfo {public boolean enabled=true;public int uid=10055;}",
    "android/content/pm/ActivityInfo.java": "package android.content.pm;public class ActivityInfo {public int flags=0x10000;public boolean enabled=true,exported=true;public ApplicationInfo applicationInfo=new ApplicationInfo();public String permission,packageName,name;}",
    "android/content/pm/ResolveInfo.java": "package android.content.pm;public class ResolveInfo {public ActivityInfo activityInfo;}",
    "android/content/pm/PackageManager.java": r'''package android.content.pm;import android.content.*;import java.util.*;public class PackageManager {
     public static class NameNotFoundException extends Exception {public NameNotFoundException(String pkg){super(pkg);}}
     public final Map<String,Integer> packageUids=new HashMap<>();public final Set<String> missingPackages=new HashSet<>();
     public ApplicationInfo getApplicationInfo(String pkg,int flags)throws NameNotFoundException {if(missingPackages.contains(pkg))throw new NameNotFoundException(pkg);ApplicationInfo info=new ApplicationInfo();info.uid=packageUids.getOrDefault(pkg,user*100000+10055);return info;}
     public static final int MATCH_DEFAULT_ONLY=0x10000;public ResolveInfo resolveActivity(Intent intent,int flags){ResolveInfo r=new ResolveInfo();r.activityInfo=getActivityInfo(new ComponentName("launcher","launcher.Home"),0);return r;}
     public int user;public boolean receiverExported=true;public ActivityInfo getActivityInfo(ComponentName component,int flags){ActivityInfo info=new ActivityInfo();info.exported=receiverExported;info.applicationInfo.uid=packageUids.getOrDefault(component.getPackageName(),user*100000+10055);info.packageName=component.getPackageName();info.name=component.getClassName();return info;}
     public final List<String> receiverNames=new ArrayList<>(List.of("sample.Main"));public Intent lastShareQuery;
     public List<ResolveInfo> queryIntentActivities(Intent intent,int flags){lastShareQuery=intent;List<ResolveInfo> result=new ArrayList<>();
      if(intent.component!=null){ResolveInfo direct=new ResolveInfo();direct.activityInfo=getActivityInfo(intent.component,0);return List.of(direct);}
      for(String name:receiverNames){ResolveInfo value=new ResolveInfo();value.activityInfo=getActivityInfo(new ComponentName(intent.pkg,name),0);result.add(value);}return result;}
    }''',
    "android/app/ActivityOptions.java": r'''package android.app;import android.os.Bundle;public class ActivityOptions {
     int display=-1,task=-1;public static ActivityOptions makeBasic(){return new ActivityOptions();}public ActivityOptions setLaunchDisplayId(int value){display=value;return this;}
     public ActivityOptions setLaunchTaskId(int value){task=value;return this;}
     public Bundle toBundle(){Bundle result=new Bundle();result.putInt("launchDisplayId",display);result.putInt("launchTaskId",task);return result;}
    }''',
    "android/app/IApplicationThread.java": "package android.app;public interface IApplicationThread {}",
    "android/app/ProfilerInfo.java": "package android.app;public class ProfilerInfo {}",
    "android/app/ActivityTaskManager.java": "package android.app;public class ActivityTaskManager {public static Object service;public static Object getService(){return service;}}",
    "android/view/Surface.java": "package android.view;public class Surface {public boolean released;public boolean isValid(){return !released;}public void release(){released=true;}}",
    "android/view/Display.java": r'''package android.view;public class Display {
     public static final int DEFAULT_DISPLAY=0,FLAG_PRIVATE=4,FLAG_PRESENTATION=8,FLAG_TRUSTED=128,FLAG_OWN_FOCUS=256;public final int id;public final String name;public int flags=FLAG_PRIVATE|FLAG_TRUSTED|FLAG_OWN_FOCUS;
     public Display(int id,String name){this.id=id;this.name=name;}public int getDisplayId(){return id;}public String getName(){return name;}
     public int owner;public String unique;public int getFlags(){return flags;}public int getOwnerUid(){return owner;}public String getUniqueId(){return unique==null?"display-"+id:unique;}
    }''',
    "android/hardware/display/VirtualDisplay.java": r'''package android.hardware.display;import android.view.*;public class VirtualDisplay {
     public final Display display;public boolean released;public VirtualDisplay(Display display){this.display=display;}public Display getDisplay(){return display;}
     public void release(){released=true;}public void resize(int w,int h,int d){}public void setSurface(Surface surface){}
    }''',
    "android/hardware/display/DisplayManager.java": r'''package android.hardware.display;import android.view.*;public class DisplayManager {
     public static final int VIRTUAL_DISPLAY_FLAG_PUBLIC=1,VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY=8,VIRTUAL_DISPLAY_FLAG_PRESENTATION=2,
      VIRTUAL_DISPLAY_FLAG_SUPPORTS_TOUCH=64,VIRTUAL_DISPLAY_FLAG_TRUSTED=1024,VIRTUAL_DISPLAY_FLAG_OWN_FOCUS=16384;
     public VirtualDisplay latest;public int requestedFlags;public boolean forcePrivate,forcePresentation;public VirtualDisplay createVirtualDisplay(String name,int w,int h,int d,Surface surface,int flags){requestedFlags=flags;latest=new VirtualDisplay(new Display(88,name));if((flags&VIRTUAL_DISPLAY_FLAG_PUBLIC)!=0&&!forcePrivate)latest.display.flags&=~Display.FLAG_PRIVATE;if((flags&VIRTUAL_DISPLAY_FLAG_PRESENTATION)!=0||forcePresentation)latest.display.flags|=Display.FLAG_PRESENTATION;return latest;}
     public Display getDisplay(int id){return latest!=null&&!latest.released&&latest.display.id==id?latest.display:null;}
    }''',
    "android/view/InputEvent.java": "package android.view;public class InputEvent {public void setDisplayId(int id){}}",
    "android/hardware/input/InputManagerGlobal.java": r'''package android.hardware.input;import android.view.InputEvent;public class InputManagerGlobal {
     public static InputManagerGlobal getInstance(){return new InputManagerGlobal();}public boolean injectInputEvent(InputEvent event,int mode){return true;}
    }''',
    "android/view/WindowManagerGlobal.java": r'''package android.view;public class WindowManagerGlobal {
     public static final WindowService service=new WindowService();public static Object getWindowManagerService(){return service;}public static class WindowService {
      public final java.util.Map<Integer,Integer> policies=new java.util.HashMap<>();public int forced=-1;public boolean deny;
      public void setDisplayImePolicy(int display,int policy){if(deny)throw new SecurityException("IME policy refused");policies.put(display,policy);}
      public int getDisplayImePolicy(int display){return forced>=0?forced:policies.getOrDefault(display,0);}}
    }''',
    "ls/augment/com/AtomicWorkbenchJournal.java": JOURNAL,
    "ls/augment/com/AtomicWorkbenchDiagnostics.java": DIAGNOSTICS,
}


def main():
    sdk = Path(os.environ.get("ANDROID_HOME", str(ROOT / "audit-output/android-sdk"))) / "platforms/android-36/android.jar"
    if not sdk.is_file():
        raise RuntimeError("SDK36 android.jar is required for the production launch tests")
    sources = SUPPORT["migration_sources"]()
    sources.pop("ls/augment/com/TestAtomicWorkbenchMigration.java")
    sources.update(SOURCES)
    sources["ls/augment/com/TestAtomicWorkbenchLaunch.java"] = TEST
    with tempfile.TemporaryDirectory(prefix="lsa-workbench-launch-") as temporary:
        SUPPORT["compile_run"](Path(temporary), sources,
            ["AtomicWorkbenchPlatform.java", "AtomicWorkbenchLaunchBridge.java", "AtomicWorkbenchProtocol.java"],
            "ls.augment.com.TestAtomicWorkbenchLaunch", sdk)


TEST = r'''package ls.augment.com;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import java.util.*;
public final class TestAtomicWorkbenchLaunch {
 static int tests,checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 interface Case {void run()throws Exception;}static void test(String name,Case body)throws Exception{body.run();tests++;System.out.println("PASS production launch: "+name);}
 public static class Task {public int taskId=77,displayId,userId;public ComponentName baseActivity=new ComponentName("sample","sample.Main"),topActivity=baseActivity;
  public android.window.WindowContainerToken token=new android.window.WindowContainerToken();public int getActivityType(){return 1;}}
 public static class TaskService {
  public final List<Task> tasks=new ArrayList<>();public int response,starts,recents,requestedUser=-1,requestedDisplay=-1;public Object caller=new Object();public Intent intent;public String resolvedType;
  public boolean createTask,routeToPrimary,failMove,neutralArguments,failInitialPoll,failNextOwnedSnapshot,leakOwnedSnapshot;public RuntimeException failure;
  public List<Task> getAllRootTaskInfos(){return new ArrayList<>(tasks);}public List<Task> getAllRootTaskInfosOnDisplay(int display){if(failNextOwnedSnapshot){failNextOwnedSnapshot=false;throw new IllegalStateException("injected initial task query failure");}List<Task> result=new ArrayList<>();for(Task task:tasks)if(task.displayId==display||leakOwnedSnapshot)result.add(task);return result;}
  public int focused=-1,focusCalls;public List<Task> getTasks(int max,boolean visible,boolean filter,int display){return new ArrayList<>(tasks);}public void setFocusedTask(int task){focusCalls++;focused=task;FakeFocusController.events.add("focus:"+task);}
  public Task getFocusedRootTaskInfo(){for(Task task:tasks)if(task.taskId==focused)return task;return null;}
  public void moveRootTaskToDisplay(int id,int display){if(failMove)throw new IllegalStateException("injected move failure");FakeFocusController.events.add("move:"+id+":"+display);for(Task task:tasks)if(task.taskId==id)task.displayId=display;}
  public int startActivityAsUser(IApplicationThread caller,String pkg,String feature,Intent intent,String type,IBinder token,String who,int request,int flags,ProfilerInfo profiler,Bundle options,int user){
   starts++;FakeFocusController.events.add("start");this.caller=caller;this.intent=intent;resolvedType=type;requestedUser=user;requestedDisplay=options.getInt("launchDisplayId");
   neutralArguments="android".equals(pkg)&&feature==null&&type==null&&token==null&&who==null&&request==-1&&flags==0&&profiler==null;if(failure!=null)throw failure;
   if(createTask){Task task=new Task();task.userId=user;task.displayId=routeToPrimary?0:requestedDisplay;tasks.add(task);}failNextOwnedSnapshot=failInitialPoll;return response;
  }
  public int startActivityFromRecents(int id,Bundle options){recents++;for(Task task:tasks)if(task.taskId==id&&response>=0&&response<=3)task.displayId=options.getInt("launchDisplayId");return response;}
 }
 public static class WrongReturnService {public void startActivityAsUser(IApplicationThread caller,String pkg,String feature,Intent intent,String type,IBinder token,String who,int request,int flags,ProfilerInfo profiler,Bundle options,int user){throw new AssertionError("unsupported interface invoked");}}
 static final class Fixture {
  final TaskService service=new TaskService();final Context context=new Context();final Handler handler=new Handler();final Surface surface=new Surface();final AtomicWorkbenchPlatform platform;
  Fixture(){this(0);}Fixture(int user){SystemClock.now=1000;FakeFocusController.reset();ActivityTaskManager.service=service;AtomicWorkbenchDiagnostics.events.clear();WindowManagerGlobal.service.policies.clear();WindowManagerGlobal.service.forced=-1;WindowManagerGlobal.service.deny=false;platform=new AtomicWorkbenchPlatform(context,user*100000+10055,user,handler,2,null,new FakeFocusController(context));}
  Bundle open(){return platform.open(surface,1080,2400,420,"sample/sample.Main");}
  boolean diagnostic(String text){return AtomicWorkbenchDiagnostics.events.stream().anyMatch(event->event.contains(text));}
 }
 public static void main(String[] args)throws Exception{
  test("guard suspension authenticates its root-owned display and restoration precedes task focus",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");var display=f.context.displays.latest.display;
   f.platform.suspendInputFocus();check(FakeFocusController.display==display&&FakeFocusController.context==f.context,"guard used another display or context");
   check(!f.platform.readyForInput()&&f.platform.status().getBoolean("input_focus_suspended"),"demoted display admitted input");FakeFocusController.events.clear();
   check(f.platform.focusWindow().getBoolean("success"),"restore failed");check(FakeFocusController.events.equals(List.of("resume","focus:77")),"task focus preceded real guard removal");
   check(f.platform.readyForInput()&&f.platform.hasInputFocus()&&f.platform.hasLiveDisplay()&&!f.surface.released&&f.service.tasks.get(0).displayId==88,"restore changed display/task/surface lifetime");});
  for(String identity:new String[]{"owner","unique","name"})test("changed display "+identity+" is rejected before creating a guard",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");
   if(identity.equals("owner"))f.context.displays.latest.display.owner=12345;
   else if(identity.equals("unique"))f.context.displays.latest.display.unique="reused-display";
   else f.context.displays.latest=new android.hardware.display.VirtualDisplay(new Display(88,"other-owner-name"));
   try{f.platform.suspendInputFocus();throw new AssertionError("foreign display accepted");}catch(SecurityException expected){checks++;}
   check(FakeFocusController.suspends==0,"foreign guard was added");check(f.platform.hasLiveDisplay()&&f.service.tasks.get(0).displayId==88,"identity failure migrated unrelated task");});
  test("guard acknowledgement failure blocks input and supports explicit restoration retry",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");FakeFocusController.failSuspend=true;
   try{f.platform.suspendInputFocus();throw new AssertionError("unacknowledged guard accepted");}catch(java.io.IOException expected){checks++;}
   check(!f.platform.readyForInput()&&f.platform.status().getBoolean("input_focus_failure"),"guard failure admitted input");FakeFocusController.failSuspend=false;
   check(f.platform.focusWindow().getBoolean("success")&&f.platform.readyForInput(),"guard cleanup and old focus could not be retried");});
  test("failed guard resume prevents task focus and never closes its task owner",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");f.platform.suspendInputFocus();FakeFocusController.failResume=true;int focused=f.service.focusCalls;
   Bundle failed=f.platform.focusAppWindow("sample/sample.Main");check(!failed.getBoolean("success")&&failed.getBoolean("input_focus_failure")&&f.service.focusCalls==focused,"task focused before guard removal ack");
   check(f.platform.hasLiveDisplay()&&!f.surface.released&&f.service.tasks.get(0).displayId==88,"guard failure lost task/display responsibility");FakeFocusController.failResume=false;
   check(f.platform.focusAppWindow("sample/sample.Main").getBoolean("success")&&f.platform.readyForInput(),"guard retry failed");});
  test("sharing resumes the selected display before launching the exact public receiver",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");f.platform.suspendInputFocus();FakeFocusController.events.clear();
   Intent share=new Intent(Intent.ACTION_SEND).setType("text/plain").setComponent(new ComponentName("sample","sample.Main")).putExtra(Intent.EXTRA_TEXT,"synthetic text");
   check(f.platform.share(share,"sample").getBoolean("success"),"guarded share failed");check(FakeFocusController.events.equals(List.of("resume","start")),"share started under guard");
   check("sample.Main".equals(f.service.intent.getComponent().getClassName())&&f.service.requestedDisplay==88,"guard change lost exact receiver or display");});
  test("guard removal failure cannot block task migration and remains independently retryable",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");f.platform.suspendInputFocus();FakeFocusController.failClose=true;
   Bundle closed=f.platform.close();check(!closed.getBoolean("success")&&closed.getBoolean("input_focus_cleanup_pending")&&closed.getBoolean("recovery_pending"),"unremoved guard responsibility discarded");
   check(f.service.tasks.get(0).displayId==0&&!f.platform.hasLiveDisplay()&&f.surface.released&&AtomicWorkbenchJournal.latest.saved==null,"guard blocked task migration or released task evidence early");
   check(f.platform.hasRecoveryPending(),"root may exit while guard still owned");FakeFocusController.failClose=false;
   check(f.platform.close().getBoolean("success")&&!f.platform.hasRecoveryPending(),"guard-only cleanup retry failed");});
  test("normal close removes the guard before migrating the original app task",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");f.platform.suspendInputFocus();FakeFocusController.events.clear();
   check(f.platform.closeWindow().getBoolean("success"),"guarded close failed");check(FakeFocusController.events.indexOf("close")>=0&&FakeFocusController.events.indexOf("close")<FakeFocusController.events.indexOf("move:77:0"),"display task moved before removing guard");});
  for(String mode:new String[]{"null","missing_cleanup","missing_focus","missing_success","pending","false_suspended","contradictory_success"})test("managed focus "+mode+" reply retains exact cleanup identity after returning tasks",()->{
   Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");FakeFocusController.replyMode=mode;FakeFocusController.mutateIdentity=true;
   try{f.platform.suspendInputFocus();throw new AssertionError("unconfirmed managed focus accepted");}catch(IllegalStateException expected){checks++;}
   Bundle failed=f.platform.status();check(!f.platform.readyForInput()&&failed.getBoolean("input_focus_failure")&&failed.getBoolean("input_focus_cleanup_pending"),"uncertain bridge reply lost input barrier or cleanup ownership: "+mode);
   check(FakeFocusController.lastIdentity.getInt("window_id")==2&&FakeFocusController.lastIdentity.getInt("display_id")==88,"bridge did not receive exact window/display identity");
   String name=FakeFocusController.lastIdentity.getString("display_name"),unique=FakeFocusController.lastIdentity.getString("unique_id");
   Bundle closed=f.platform.close();check(!closed.getBoolean("success")&&closed.getBoolean("recovery_pending")&&closed.getBoolean("input_focus_cleanup_pending"),"failed bridge cleanup was reported successful: "+mode);
   check(f.service.tasks.get(0).displayId==0&&!f.platform.hasLiveDisplay()&&f.surface.released,"bridge uncertainty blocked real task return: "+mode);
   check(FakeFocusController.lastIdentity.getInt("display_id")==88&&name.equals(FakeFocusController.lastIdentity.getString("display_name"))&&unique.equals(FakeFocusController.lastIdentity.getString("unique_id")),"released display identity was recomputed or callback mutated owned lease");
   FakeFocusController.replyMode="";FakeFocusController.mutateIdentity=false;Bundle repaired=f.platform.close();
   check(repaired.getBoolean("success")&&!f.platform.hasRecoveryPending()&&!repaired.getBoolean("input_focus_cleanup_pending"),"exact managed detach retry did not finish: "+mode);
  });
  test("false success with still-suspended bridge cannot promote or discard its owner",()->{
   Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");f.platform.suspendInputFocus();int focusCalls=f.service.focusCalls;
   FakeFocusController.replyMode="false_suspended";Bundle failed=f.platform.focusWindow();
   check(!failed.getBoolean("success")&&f.service.focusCalls==focusCalls&&!f.platform.readyForInput(),"failed suspended reply promoted task");
   check(failed.getBoolean("input_focus_cleanup_pending")&&f.platform.hasRecoveryPending(),"success=false/focus_suspended=true dropped detach ownership");
   FakeFocusController.replyMode="";check(f.platform.focusWindow().getBoolean("success")&&f.platform.readyForInput(),"valid managed detach retry cannot restore app");
  });
  test("contradictory success on resume and close cannot discard a still-suspended bridge owner",()->{
   Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"open failed");f.platform.suspendInputFocus();int focusCalls=f.service.focusCalls;
   FakeFocusController.replyMode="contradictory_success";Bundle failed=f.platform.focusWindow();
   check(!failed.getBoolean("success")&&f.service.focusCalls==focusCalls&&!f.platform.readyForInput(),"success=true still-suspended resume promoted task");
   check(failed.getBoolean("input_focus_cleanup_pending")&&f.platform.hasRecoveryPending(),"contradictory resume dropped bridge ownership");
   Bundle closed=f.platform.close();check(!closed.getBoolean("success")&&closed.getBoolean("recovery_pending")&&f.service.tasks.get(0).displayId==0&&!f.platform.hasLiveDisplay(),"contradictory close either claimed clean or blocked real task return");
   check(FakeFocusController.lastIdentity.getInt("display_id")==88,"contradictory close lost exact retired display identity");
   FakeFocusController.replyMode="";Bundle repaired=f.platform.close();check(repaired.getBoolean("success")&&!f.platform.hasRecoveryPending(),"valid close cannot recover contradictory bridge ack");
  });
  test("app displays support the wallpaper UID without advertising automatic cast or mirror routes",()->{Fixture f=new Fixture();f.service.createTask=true;Bundle result=f.open();
   check(result.getBoolean("success"),result.getString("message"));int flags=f.context.displays.requestedFlags;
   check((flags&3)==1&&(flags&8)!=0,"app display lost wallpaper access, advertised PRESENTATION or dropped own-content isolation");
   check((f.context.displays.latest.display.getFlags()&Display.FLAG_PRIVATE)==0,"wallpaper UID cannot access private display");});
  for(boolean presentation:new boolean[]{false,true})test("ROM cannot silently make app display private or presentation: "+presentation,()->{Fixture f=new Fixture();
   f.context.displays.forcePresentation=presentation;f.context.displays.forcePrivate=!presentation;Bundle result=f.open();
   check(!result.getBoolean("success")&&f.service.starts==0&&!f.platform.hasLiveDisplay(),"incompatible display accepted or target app launched");});
  test("share routes only public receiver on the existing app display with resolved MIME",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"source window failed");int starts=f.service.starts;
   Intent share=new Intent(Intent.ACTION_SEND).setType("image/png").putExtra(Intent.EXTRA_STREAM,android.net.Uri.parse("content://ls.augment.com.workbench.transfer/item/token"));
   share.putExtra("untrusted_extra","discard").addFlags(2|64);Bundle shared=f.platform.share(share,"sample");
   check(shared.getBoolean("success")&&shared.getBoolean("share_started")&&f.service.starts==starts+1,shared.getString("message"));
   check(f.service.requestedDisplay==88&&"image/png".equals(f.service.resolvedType)&&f.service.intent.component.getPackageName().equals("sample"),"share lost receiver/display/MIME");
   check(!f.service.intent.extras.containsKey("untrusted_extra")&&(f.service.intent.flags&(2|64))==0&&f.service.intent.clip.items.size()==1,"share copied arbitrary extras, write grants or stale clip");});
  test("foreign content, arbitrary components, absent targets and private receivers do not start",()->{for(String bad:new String[]{"uri","component","package","receiver","action","text"}){Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"window failed");int starts=f.service.starts;
   Intent share=new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT,"share me");String target="sample";
   if(bad.equals("uri"))share.putExtra(Intent.EXTRA_STREAM,android.net.Uri.parse("content://foreign/private"));if(bad.equals("component"))share.setComponent(new ComponentName("sample","sample.Hidden"));
   if(bad.equals("package"))target="absent";if(bad.equals("receiver"))f.context.packages.receiverExported=false;if(bad.equals("action"))share.action=Intent.ACTION_MAIN;if(bad.equals("text"))share.putExtra(Intent.EXTRA_TEXT,"x".repeat(32769));
   check(!f.platform.share(share,target).getBoolean("success")&&f.service.starts==starts,"unsafe share launched: "+bad);
  }});
  test("an exact receiver branch is preserved and rechecked through an implicit MIME query",()->{
   Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"window failed");
   f.context.packages.receiverNames.add("sample.ShareBranch");
   Intent share=new Intent(Intent.ACTION_SEND).setType("image/png").setComponent(new ComponentName("sample","sample.ShareBranch"))
       .putExtra(Intent.EXTRA_STREAM,android.net.Uri.parse("content://ls.augment.com.workbench.transfer/item/token"));
   check(f.platform.share(share,"sample").getBoolean("success"),"explicit public share branch rejected");
   check("sample.ShareBranch".equals(f.service.intent.component.getClassName()),"first package receiver replaced user's selected branch");
   Intent query=f.context.packages.lastShareQuery;
   check(query.component==null&&"sample".equals(query.pkg)&&"image/png".equals(query.type)&&Intent.ACTION_SEND.equals(query.action),"explicit query bypassed intent-filter matching");
   int starts=f.service.starts;f.context.packages.receiverNames.remove("sample.ShareBranch");
   check(!f.platform.share(share,"sample").getBoolean("success")&&f.service.starts==starts,"removed Activity filter still dispatched");
  });
  test("a share-only application needs no launcher and saves physical task origins before launch",()->{
   Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"window failed");
   Task original=new Task();original.taskId=90;original.displayId=0;original.baseActivity=new ComponentName("destination","destination.OnlyShare");original.topActivity=original.baseActivity;f.service.tasks.add(original);
   f.context.packages.receiverNames.clear();f.context.packages.receiverNames.add("destination.OnlyShare");
   Intent share=new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT,"sample text").setComponent(original.baseActivity);
   check(f.platform.share(share,"destination").getBoolean("success"),"share-only receiver required launcher/present app");
   check(f.service.requestedDisplay==88&&f.service.intent.component.equals(original.baseActivity),"share-only target left selected workspace");
   check(AtomicWorkbenchJournal.latest.saved.tasks.stream().anyMatch(t->t.taskId==90&&t.displayId==0&&t.userId==0),"physical target task origin not saved before dispatch");
  });
  test("exact receivers cannot steal another display's task or use another package's component",()->{
   Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"window failed");
   Task foreign=new Task();foreign.taskId=91;foreign.displayId=99;foreign.baseActivity=new ComponentName("destination","destination.OnlyShare");foreign.topActivity=foreign.baseActivity;f.service.tasks.add(foreign);
   f.context.packages.receiverNames.clear();f.context.packages.receiverNames.add("destination.OnlyShare");
   Intent share=new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT,"sample text").setComponent(foreign.baseActivity);int starts=f.service.starts;
   check(!f.platform.share(share,"destination").getBoolean("success")&&f.service.starts==starts&&foreign.displayId==99,"other workspace task was stolen");
   check(!f.platform.share(share,"sample").getBoolean("success")&&f.service.starts==starts,"cross-package explicit component accepted");
  });
  test("text and multiple files use a clean readable share payload and reject over-capacity",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"window failed");
   Intent text=new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT,"selected text");check(f.platform.share(text,"sample").getBoolean("success"),"plain text share failed");
   check(f.service.intent.clip==null&&(f.service.intent.flags&1)==0&&"selected text".contentEquals(f.service.intent.getCharSequenceExtra(Intent.EXTRA_TEXT)),"text-only share invented grants or lost text");
   ArrayList<android.net.Uri> streams=new ArrayList<>();for(int i=0;i<16;i++)streams.add(android.net.Uri.parse("content://ls.augment.com.workbench.transfer/item/"+i));
   Intent multiple=new Intent(Intent.ACTION_SEND_MULTIPLE).setType("image/*").putParcelableArrayListExtra(Intent.EXTRA_STREAM,streams);check(f.platform.share(multiple,"sample").getBoolean("success")&&f.service.intent.clip.items.size()==16,"multiple file payload or read clip lost");
   int starts=f.service.starts;streams.add(android.net.Uri.parse("content://ls.augment.com.workbench.transfer/item/17"));check(!f.platform.share(multiple,"sample").getBoolean("success")&&f.service.starts==starts,"over-capacity multi share launched");});
  test("rejected share start preserves its app display and reports no completed send",()->{Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"window failed");f.service.response=-94;
   Bundle rejected=f.platform.share(new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT,"selected text"),"sample");
   check(!rejected.getBoolean("success")&&!rejected.getBoolean("share_started")&&f.platform.hasLiveDisplay()&&f.platform.readyForInput(),"rejected share claimed sent or closed target app");});
  test("mixed display snapshots cannot claim a primary task or a different user's app",()->{for(boolean wrongUser:new boolean[]{false,true}){Fixture f=new Fixture();f.open();f.service.leakOwnedSnapshot=true;Task foreign=new Task();foreign.displayId=wrongUser?88:0;foreign.userId=wrongUser?1:0;f.service.tasks.add(foreign);f.handler.advance(160);
   check(!f.platform.readyForInput()&&f.platform.status().getInt("task_count")==0,"foreign task activated this display");
   int starts=f.service.starts;Bundle rejected=f.platform.share(new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT,"selected text"),"sample");
   check(!rejected.getBoolean("success")&&f.service.starts==starts,"foreign snapshot enabled target share receiver");
  }});
  test("virtual editor uses physical-screen IME policy without changing physical display settings",()->{Fixture f=new Fixture();f.service.createTask=true;Bundle result=f.open();
   check(result.getBoolean("success")&&result.getInt("ime_policy",-1)==1,"virtual editor kept local IME policy");
   check(WindowManagerGlobal.service.policies.get(88)==1&&!WindowManagerGlobal.service.policies.containsKey(0),"IME policy changed the physical screen or wrong VD");
   check(f.diagnostic("route=phone_display")&&f.diagnostic("actual=1"),"verified keyboard route missing from diagnostics");});
  test("ROM retaining local IME fails opening before app launch and releases display",()->{Fixture f=new Fixture();WindowManagerGlobal.service.forced=0;Bundle result=f.open();
   check(!result.getBoolean("success")&&f.service.starts==0&&!f.platform.hasLiveDisplay()&&f.surface.released,"local keyboard silently accepted or display leaked");
   check(f.diagnostic("actual=0"),"mismatched IME policy not diagnosed");});
  test("IME policy denial cannot report successful workspace input",()->{Fixture f=new Fixture();WindowManagerGlobal.service.deny=true;Bundle result=f.open();
   check(!result.getBoolean("success")&&f.service.starts==0&&!f.platform.readyForInput()&&!f.platform.hasLiveDisplay(),"policy denial still launched or accepted input");});
  test("real bridge sends null caller and preserves component, MAIN, NEW_TASK, user and display",()->{Fixture f=new Fixture(10);f.service.createTask=true;Bundle result=f.open();
   check(result.getBoolean("success"),result.getString("message"));check(f.service.starts==1&&f.service.caller==null&&f.service.neutralArguments,"unregistered app_process caller or wrong attribution leaked to system");
   check(f.service.requestedUser==10&&f.service.requestedDisplay==88,"user/display route lost");check(f.service.intent.getComponent().flattenToString().equals("sample/sample.Main"),"component lost");
   check(Intent.ACTION_MAIN.equals(f.service.intent.getAction())&&f.service.intent.getCategories().contains(Intent.CATEGORY_LAUNCHER)&&(f.service.intent.getFlags()&Intent.FLAG_ACTIVITY_NEW_TASK)!=0,"launcher semantics lost");
   check("active".equals(result.getString("state"))&&f.platform.readyForInput(),"real task not confirmed");});
  test("missing exact system signature fails closed",()->{boolean failed=false;try{AtomicWorkbenchLaunchBridge.verifyAvailable(new Object());}catch(Exception expected){failed=true;}check(failed,"missing method accepted");});
  test("wrong result type fails before invoking an incompatible API",()->{boolean failed=false;try{AtomicWorkbenchLaunchBridge.start(new WrongReturnService(),new Intent(Intent.ACTION_MAIN).setComponent(new ComponentName("sample","sample.Main")),new Bundle(),0);}catch(IllegalStateException expected){failed=true;}check(failed,"non-int system method accepted");});
  test("launch bridge rejects an ordinary app process before Binder invocation",()->{TaskService service=new TaskService();boolean failed=false;android.os.Process.uid=10055;
   try{AtomicWorkbenchLaunchBridge.start(service,new Intent(Intent.ACTION_MAIN).setComponent(new ComponentName("sample","sample.Main")),new Bundle(),0);}catch(SecurityException expected){failed=true;}finally{android.os.Process.uid=0;}
   check(failed&&service.starts==0,"ordinary app used root-only launch API");});
  for(int resultCode:new int[]{0,1,2,3})test("accepted start result "+resultCode+" still requires a real task",()->{Fixture f=new Fixture();f.service.response=resultCode;Bundle result=f.open();
   check(result.getBoolean("success")&&"launching".equals(result.getString("state"))&&!f.platform.readyForInput(),"API acceptance pretended app running");
   Task task=new Task();task.displayId=88;f.service.tasks.add(task);f.handler.advance(160);check("active".equals(f.platform.status().getString("state")),"observed task did not become active");});
  for(int resultCode:new int[]{-94,-92,-91,-96,100,101,102,777})test("rejected start result "+resultCode+" is surfaced before waiting",()->{Fixture f=new Fixture();f.service.response=resultCode;Bundle result=f.open();
   check(!result.getBoolean("success"),"failed system result accepted: "+resultCode);check(f.service.starts==1&&!f.platform.readyForInput(),"failure escaped bridge");
   check(result.getString("message").contains(Integer.toString(resultCode)),"system code missing from failure");check(f.surface.released&&!f.platform.hasLiveDisplay()&&!f.platform.hasRecoveryPending(),"failed empty launch not cleaned");});
  test("Binder exception preserves its cause and releases the empty display",()->{Fixture f=new Fixture();f.service.failure=new SecurityException("injected service denial");Bundle result=f.open();
   check(!result.getBoolean("success")&&result.getString("message").contains("injected service denial"),"service exception was swallowed");check(!f.platform.hasLiveDisplay()&&f.surface.released,"exception left blank display");});
  test("synchronous first-poll failure cannot be overwritten by an open-success result",()->{Fixture f=new Fixture();f.service.failInitialPoll=true;Bundle result=f.open();
   check(!result.getBoolean("success")&&result.getString("message").contains("injected initial task query failure"),"first poll failure overwritten by open success");check(!f.platform.hasLiveDisplay()&&f.surface.released,"first-poll failure did not clean up");});
  test("no target task times out at seven seconds without claiming an app was moved",()->{Fixture f=new Fixture();Bundle initial=f.open();check(initial.getBoolean("success"),initial.getString("message"));
   f.handler.advance(6999);check(f.platform.hasLiveDisplay()&&!f.platform.readyForInput(),"deadline fired early");f.handler.advance(1);Bundle result=f.platform.status();
   check(!result.getBoolean("success")&&"closed".equals(result.getString("state")),"empty launch did not time out");check(!result.getString("message").contains("已恢复到手机主屏"),"empty display falsely claimed task migration");
   check(f.surface.released&&!f.platform.hasRecoveryPending(),"empty timeout leaked display or responsibility");check(f.diagnostic("timeout"),"timeout missing from diagnostics");});
  test("target started on the primary screen remains a failed workspace launch and is diagnosed",()->{Fixture f=new Fixture();f.service.createTask=true;f.service.routeToPrimary=true;f.open();f.handler.advance(7000);Bundle result=f.platform.status();
   check(!result.getBoolean("success")&&!f.platform.hasLiveDisplay(),"wrong-screen target reported active");check(f.service.tasks.get(0).displayId==0,"foreign display task moved during cleanup");
   check(f.diagnostic("display=0")||f.diagnostic("displayId=0")||f.diagnostic("display:0"),"actual primary-screen task location absent from diagnostic: "+AtomicWorkbenchDiagnostics.events);});
  test("cleanup failure retains durable responsibility and cannot report launch success",()->{Fixture f=new Fixture();f.service.response=-94;AtomicWorkbenchJournal.latest.failClear=true;Bundle result=f.open();
   check(!result.getBoolean("success")&&result.getBoolean("recovery_pending"),"cleanup failure responsibility discarded");check(AtomicWorkbenchJournal.latest.saved!=null,"failed cleanup erased recovery journal");
   AtomicWorkbenchJournal.latest.failClear=false;check(f.platform.close().getBoolean("success")&&!f.platform.hasRecoveryPending(),"cleanup responsibility cannot be retried");});
  test("existing-task takeover preserves task identity and never uses the new-app bridge",()->{Fixture f=new Fixture();Task task=new Task();f.service.tasks.add(task);Bundle result=f.platform.openTask(f.surface,1080,2400,420,"sample/sample.Main",77);
   check(result.getBoolean("success")&&f.service.recents==1&&f.service.starts==0&&task.taskId==77&&task.displayId==88,"takeover restarted the application");});
  System.out.println("WORKBENCH LAUNCH RESULT "+tests+" passed; "+checks+" assertions");
 }
}'''


if __name__ == "__main__":
    main()
