"""Run the actual Quickstep display routing hook against controlled Android boundaries."""
from pathlib import Path
import os
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-home-hook.py")))
SUPPORT = BASE["SUPPORT"]
SOURCES = {key: value for key, value in BASE["SOURCES"].items() if key.startswith("android/") or key.startswith("io/") or key.endswith("AugmentModule.java")}
SOURCES["ls/augment/com/hook/AugmentModule.java"]=SOURCES["ls/augment/com/hook/AugmentModule.java"].replace(
    "public Object getArg(int i){return args[i];}",
    "public Object getArg(int i){return args[i];}public java.util.List<Object> getArgs(){return java.util.Arrays.asList(args);}")
SOURCES.update({
    "android/annotation/SuppressLint.java": "package android.annotation;public @interface SuppressLint {String[] value();}",
    "android/os/IBinder.java": "package android.os;public interface IBinder {boolean isBinderAlive();}",
    "android/content/res/Resources.java": "package android.content.res;public class Resources {public static class Theme {public boolean resolveAttribute(int a,android.util.TypedValue v,boolean resolve){v.type=28;v.data=0xff112233;return true;}}}",
    "android/util/TypedValue.java": "package android.util;public class TypedValue {public static final int TYPE_FIRST_COLOR_INT=28,TYPE_LAST_COLOR_INT=31;public int resourceId,type,data;}",
    "android/app/ActivityOptions.java": "package android.app;public class ActivityOptions {public int display=-1;public ActivityOptions setLaunchDisplayId(int d){display=d;return this;}}",
    "android/os/Process.java": "package android.os;public class Process {public static int uid=10066;public static int myUid(){return uid;}}",
    "android/content/Context.java": '''package android.content;public class Context {public static final String DISPLAY_SERVICE="display",ACTIVITY_SERVICE="activity";public android.hardware.display.DisplayManager displays=new android.hardware.display.DisplayManager();public android.app.ActivityManager activities=new android.app.ActivityManager();public android.content.pm.PackageManager pm=new android.content.pm.PackageManager();public ContentResolver resolver=new ContentResolver();public String pkg="launcher";public Object getSystemService(String s){return ACTIVITY_SERVICE.equals(s)?activities:displays;}public android.content.pm.PackageManager getPackageManager(){return pm;}public String getPackageName(){return pkg;}public int getForeColor(){return 0xffe1d2c3;}public android.content.res.Resources.Theme getTheme(){return new android.content.res.Resources.Theme();}public int getColor(int id){return 0xff112233;}public ContentResolver getContentResolver(){return resolver;}public int getDisplayId(){return displays.display==null?-1:displays.display.id;}}''',
    "android/net/Uri.java": "package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}",
    "android/os/Bundle.java": '''package android.os;import java.util.*;public class Bundle {Map<String,Object>d=new HashMap<>();public void putString(String k,String v){d.put(k,v);}public String getString(String k,String v){return d.get(k)instanceof String?(String)d.get(k):v;}public void putInt(String k,int v){d.put(k,v);}public int getInt(String k,int v){return d.get(k)instanceof Integer?(Integer)d.get(k):v;}public void putLong(String k,long v){d.put(k,v);}public long getLong(String k,long v){return d.get(k)instanceof Long?(Long)d.get(k):v;}public void putBoolean(String k,boolean v){d.put(k,v);}public boolean getBoolean(String k,boolean v){return d.get(k)instanceof Boolean?(Boolean)d.get(k):v;}}''',
    "android/os/SystemClock.java": "package android.os;public class SystemClock {public static long now=1000;public static long elapsedRealtime(){return now;}}",
    "android/content/ContentResolver.java": '''package android.content;public class ContentResolver {public android.os.Bundle target=new android.os.Bundle(),lastBegin;public int reads,begins,ends;public boolean fail,rejectBegin;public android.os.Bundle call(android.net.Uri u,String method,String arg,android.os.Bundle b){if("native_gesture".equals(method)){if(fail)throw new SecurityException("denied");android.os.Bundle r=new android.os.Bundle();if("begin".equals(arg)){begins++;lastBegin=b;r.putBoolean("success",!rejectBegin);}else if("end".equals(arg)){ends++;r.putBoolean("success",true);}else throw new AssertionError("invalid gesture edge");return r;}reads++;if(fail)throw new SecurityException("denied");if(!"gesture_target".equals(method)||arg!=null||b!=null)throw new AssertionError("invalid provider request");return target;}}''',
    "android/view/InputDevice.java": "package android.view;public class InputDevice {public static final int SOURCE_TOUCHSCREEN=4098;}",
    "android/view/InputEvent.java": "package android.view;public class InputEvent {public int display;public int getDisplayId(){return display;}public void setDisplayId(int d){display=d;}}",
    "android/view/MotionEvent.java": '''package android.view;public class MotionEvent extends InputEvent {public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3;public int action,source=4098,pointers=1;public long down=900;public float y=2675;public boolean recycled;public static MotionEvent obtain(MotionEvent e){MotionEvent c=new MotionEvent();c.display=e.display;c.action=e.action;c.source=e.source;c.pointers=e.pointers;c.down=e.down;c.y=e.y;return c;}public int getActionMasked(){return action;}public int getSource(){return source;}public int getPointerCount(){return pointers;}public long getDownTime(){return down;}public void recycle(){recycled=true;}}''',
    "android/content/pm/PackageManager.java": '''package android.content.pm;public class PackageManager {public static final int MATCH_DEFAULT_ONLY=65536;public int uid=10055;public String home="launcher.Home",pkg="launcher";public ApplicationInfo getApplicationInfo(String p,int f){ApplicationInfo a=new ApplicationInfo();a.uid=uid;return a;}public ResolveInfo resolveActivity(android.content.Intent i,int f){ResolveInfo r=new ResolveInfo();r.activityInfo.name=home;r.activityInfo.packageName=pkg;return r;}}''',
    "android/hardware/display/DisplayManager.java": '''package android.hardware.display;public class DisplayManager {public android.view.Display display=new android.view.Display();public android.view.Display getDisplay(int id){return display!=null&&display.id==id?display:null;}}''',
    "android/app/ActivityManager.java": '''package android.app;import java.util.*;public class ActivityManager {public List<RunningTaskInfo> tasks=new ArrayList<>();public boolean fail,denied,ignoreLimit;public int requestedLimit;public List<RunningTaskInfo> getRunningTasks(int limit){requestedLimit=limit;if(denied)throw new SecurityException("Recents privilege unavailable");if(fail)throw new IllegalStateException("snapshot failed");return tasks==null||ignoreLimit?tasks:new ArrayList<>(tasks.subList(0,Math.min(limit,tasks.size())));}public static class RunningTaskInfo {public boolean isVisible=true;public int taskId=72,displayId=88,userId=0,type=2;public android.content.ComponentName baseActivity=new android.content.ComponentName("launcher","launcher.Home"),topActivity=baseActivity;public int getActivityType(){return type;}}}''',
    "com/android/quickstep/BaseContainerInterface.java": "package com.android.quickstep;public class BaseContainerInterface {}",
    "com/android/quickstep/GestureState.java": "package com.android.quickstep;public class GestureState {public int display=88;public int getDisplayId(){return display;}}",
    "com/android/quickstep/TaskAnimationManager.java": '''package com.android.quickstep;public class TaskAnimationManager {public android.content.Context mCtx=new android.content.Context();public int originalCalls,observedDisplay;public boolean fail,mRecentsAnimationStartPending,startAccepted=true;public void lambda$startRecentsAnimation$0(BaseContainerInterface c,android.content.Intent i,android.app.ActivityOptions o,GestureState g){originalCalls++;observedDisplay=o.display;mRecentsAnimationStartPending=startAccepted;if(fail)throw new IllegalStateException("native animation already started");}}''',
    "com/android/quickstep/LauncherActivityInterface.java": '''package com.android.quickstep;public class LauncherActivityInterface extends BaseContainerInterface {public android.content.Context activity;public android.content.Context getCreatedContainer(){return activity;}}''',
    "com/android/quickstep/OverviewComponentObserver.java": '''package com.android.quickstep;public class OverviewComponentObserver {public android.content.Context mContext;public BaseContainerInterface mDefaultDisplayContainerInterface,fallback=new BaseContainerInterface();public int nativeCalls;public BaseContainerInterface getContainerInterface(int d){nativeCalls++;return d==0?mDefaultDisplayContainerInterface:fallback;}}''',
    "com/android/quickstep/TopTaskTracker.java": '''package com.android.quickstep;public class TopTaskTracker {public int observedDisplay=-1;public Object getCachedTopTask(boolean filter,int d){observedDisplay=d;return new Object();}}''',
    "com/android/quickstep/fallback/window/RecentsDisplayModel.java": "package com.android.quickstep.fallback.window;public class RecentsDisplayModel {public void storeDisplayResource(int d){}}",
    "com/android/quickstep/TouchInteractionService.java": r'''package com.android.quickstep;
public class TouchInteractionService extends android.content.Context {
 public ls.augment.com.hook.AugmentModule module;public Rotation mRotationTouchHelper=new Rotation();public Model mRecentsDisplayModel=new Model();public OverviewComponentObserver observer=new OverviewComponentObserver();public TopTaskTracker tracker=new TopTaskTracker();public int calls,monitorDisplay=-1,receiverDisplay=-1,eventDisplay=-1;public boolean failNative;public BaseContainerInterface chosen;public android.view.MotionEvent received;
 public static class Rotation {public void setOrientationTransformIfNeeded(android.view.MotionEvent e){}public boolean isInSwipeUpTouchRegion(android.view.MotionEvent e){return e.y>=2600;}}
 public static class Model extends com.android.quickstep.fallback.window.RecentsDisplayModel {public TaskAnimationManager manager=new TaskAnimationManager();public boolean missing,recover;public int initialized;public TaskAnimationManager getTaskAnimationManager(int d){return missing?null:manager;}public void storeDisplayResource(int d){initialized++;if(recover)missing=false;}}
 public Object getInputMonitorCompat(int d){monitorDisplay=d;return new Object();}public Object getInputEventReceiver(int d){receiverDisplay=d;return new Object();}
 public void onInputEvent(android.view.InputEvent input)throws Throwable {calls++;received=(android.view.MotionEvent)input;int d=input.getDisplayId();eventDisplay=d;
   module.invoke(this,"getInputMonitorCompat",new Class<?>[]{int.class},d);module.invoke(this,"getInputEventReceiver",new Class<?>[]{int.class},d);
   module.invoke(tracker,"getCachedTopTask",new Class<?>[]{boolean.class,int.class},false,0);chosen=(BaseContainerInterface)module.invoke(observer,"getContainerInterface",new Class<?>[]{int.class},d);
   if(failNative)throw new IllegalStateException("native failed after starting");
 }
}''',
    "ls/augment/com/hook/TestQuickstep.java": r'''package ls.augment.com.hook;
import com.android.quickstep.*;import android.app.*;import android.content.*;import java.lang.reflect.*;
public class TestQuickstep {static int tests,checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}interface Case{void run()throws Throwable;}static void test(String s,Case c)throws Throwable{c.run();tests++;System.out.println("PASS production Quickstep: "+s);}
static class Fixture {AugmentModule module=new AugmentModule();TaskAnimationManager manager=new TaskAnimationManager();GestureState gesture=new GestureState();ActivityOptions options=new ActivityOptions();ActivityManager.RunningTaskInfo home=new ActivityManager.RunningTaskInfo();
 Fixture()throws Exception{for(Class<?> c:new Class<?>[]{AtomicWorkbenchQuickstepHook.class,AtomicWorkbenchQuickstepInputHook.class}){Field f=c.getDeclaredField("installed");f.setAccessible(true);f.set(null,false);}manager.mCtx.activities.tasks.add(home);android.os.Process.uid=10066;AtomicWorkbenchQuickstepHook.install(module,getClass().getClassLoader());check(module.callbacks.size()==6,"hook unavailable "+module.logs);}
 void route()throws Throwable{module.invoke(manager,"lambda$startRecentsAnimation$0",new Class<?>[]{BaseContainerInterface.class,Intent.class,ActivityOptions.class,GestureState.class},new BaseContainerInterface(),new Intent("main"),options,gesture);check(manager.originalCalls==1,"native gesture did not run exactly once");}
 void denied()throws Throwable{route();check(options.display==-1,"unowned gesture redirected");}}
static class InputFixture extends Fixture {TouchInteractionService service=new TouchInteractionService();android.view.MotionEvent event=new android.view.MotionEvent();ActivityManager.RunningTaskInfo host=new ActivityManager.RunningTaskInfo();LauncherActivityInterface launcher=new LauncherActivityInterface();
 InputFixture()throws Exception {service.module=module;service.activities=manager.mCtx.activities;service.pm=manager.mCtx.pm;service.displays=manager.mCtx.displays;host.taskId=91;host.displayId=0;host.type=1;host.topActivity=new ComponentName("ls.augment.com","ls.augment.com.AtomicWorkbenchActivity");service.activities.tasks.add(0,host);service.observer.mContext=service;launcher.activity=service;service.observer.mDefaultDisplayContainerInterface=launcher;
  android.os.Bundle t=service.resolver.target;t.putBoolean("active",true);t.putString("display_unique_id","unique-88");t.putInt("display_id",88);t.putInt("host_task_id",91);t.putInt("owner_uid",10055);t.putInt("user",0);t.putLong("session",12);t.putLong("updated_elapsed",1000);android.os.SystemClock.now=1000;}
 void input()throws Throwable{module.invoke(service,"onInputEvent",new Class<?>[]{android.view.InputEvent.class},event);}
 void pass()throws Throwable{input();check(service.calls==1&&service.eventDisplay==0&&service.monitorDisplay==0,"physical route changed without authentication");check(event.display==0&&!event.recycled,"caller event mutated");}
 void blocked()throws Throwable{input();check(service.calls==0&&service.monitorDisplay==-1&&service.receiverDisplay==-1,"failed main route navigated physical host");check(event.display==0&&!event.recycled,"rejected caller event mutated");}
}
public static void main(String[] args)throws Throwable {
 test("actual gesture display reaches native animation options",()->{Fixture f=new Fixture();f.route();check(f.options.display==88&&f.manager.observedDisplay==88,"native animation lost owned display");check(f.manager.mCtx.activities.requestedLimit==128,"task snapshot must be bounded beyond a three-task wrapper");});
 test("native acceptance is recorded separately from options routing",()->{Fixture f=new Fixture();f.manager.startAccepted=false;f.route();check(f.options.display==88&&f.module.logs.stream().anyMatch(s->s.contains("phase=native_returned;native_result=not_pending")),"native rejection was confused with launch options success");});
 test("physical display gesture retains original options",()->{Fixture f=new Fixture();f.gesture.display=0;f.denied();});
 test("foreign display gesture unchanged",()->{Fixture f=new Fixture();f.gesture.display=99;f.denied();});
 test("no HOME lease leaves original native route",()->{Fixture f=new Fixture();f.manager.mCtx.activities.tasks.clear();f.denied();});
 test("foreground ordinary app does not hide HOME lease",()->{Fixture f=new Fixture();ActivityManager.RunningTaskInfo app=new ActivityManager.RunningTaskInfo();app.type=1;f.manager.mCtx.activities.tasks.add(0,app);f.route();check(f.options.display==88,"background HOME not used for swipe");});
 test("HOME behind multiple apps still authenticates",()->{Fixture f=new Fixture();for(int i=0;i<10;i++){ActivityManager.RunningTaskInfo app=new ActivityManager.RunningTaskInfo();app.type=1;f.manager.mCtx.activities.tasks.add(0,app);}f.route();check(f.options.display==88,"three-task truncation hid real HOME");});
 test("wrong task display rejected",()->{Fixture f=new Fixture();f.home.displayId=0;f.denied();});
 test("matching component without HOME activity type rejected",()->{Fixture f=new Fixture();f.home.type=1;f.denied();});
 test("null and ordinary tasks cannot authenticate",()->{Fixture f=new Fixture();f.manager.mCtx.activities.tasks.clear();f.manager.mCtx.activities.tasks.add(null);f.denied();});
 test("task scan stays bounded on malformed oversized response",()->{Fixture f=new Fixture();f.manager.mCtx.activities.ignoreLimit=true;for(int i=0;i<128;i++){ActivityManager.RunningTaskInfo app=new ActivityManager.RunningTaskInfo();app.type=1;f.manager.mCtx.activities.tasks.add(0,app);}f.denied();});
 test("missing ActivityManager preserves native gesture",()->{Fixture f=new Fixture();f.manager.mCtx.activities=null;f.denied();});
 test("null task snapshot preserves native gesture",()->{Fixture f=new Fixture();f.manager.mCtx.activities.tasks=null;f.denied();});
 test("restricted Recents snapshot preserves native gesture",()->{Fixture f=new Fixture();f.manager.mCtx.activities.denied=true;f.denied();check(f.module.errors==1,"missing privilege failure evidence");});
 test("forged display owner rejected",()->{Fixture f=new Fixture();f.manager.mCtx.displays.display.owner=10055;f.denied();});
 test("untrusted display rejected",()->{Fixture f=new Fixture();f.manager.mCtx.displays.display.flags=0;f.denied();});
 test("nonvirtual display rejected",()->{Fixture f=new Fixture();f.manager.mCtx.displays.display.type=1;f.denied();});
 test("wrong installed module UID rejected",()->{Fixture f=new Fixture();f.manager.mCtx.pm.uid=10056;f.denied();});
 test("malformed owned display name rejected",()->{Fixture f=new Fixture();f.manager.mCtx.displays.display.name="DuoAtomic-10055-w9-x";f.denied();});
 test("foreign user HOME rejected",()->{Fixture f=new Fixture();f.home.userId=10;f.denied();});
 test("current secondary user can authenticate only its actual HOME",()->{Fixture f=new Fixture();android.os.Process.uid=1010066;f.manager.mCtx.pm.uid=1010055;f.manager.mCtx.displays.display.name="DuoAtomic-1010055-w0-12345678-1234-1234-1234-123456789abc";f.home.userId=10;f.route();check(f.options.display==88,"current secondary-user HOME rejected");});
 test("display name cannot borrow another user's UID",()->{Fixture f=new Fixture();f.manager.mCtx.pm.uid=1010055;f.manager.mCtx.displays.display.name="DuoAtomic-1010055-w0-12345678-1234-1234-1234-123456789abc";f.denied();});
 test("different primary launcher rejected",()->{Fixture f=new Fixture();f.manager.mCtx.pm.pkg="other";f.denied();});
 test("reused display without actual primary HOME rejected",()->{Fixture f=new Fixture();f.home.baseActivity=new ComponentName("launcher","launcher.SecondaryHome");f.denied();});
 test("snapshot failure preserves original native gesture",()->{Fixture f=new Fixture();f.manager.mCtx.activities.fail=true;f.denied();check(f.module.errors==1,"missing route failure evidence");});
 test("physical bottom gesture uses main display manager and physical input resources",()->{InputFixture f=new InputFixture();f.input();check(f.service.calls==1&&f.service.eventDisplay==88,"gesture source was not routed before manager selection");check(f.service.monitorDisplay==0&&f.service.receiverDisplay==0,"gesture attempted to pilfer virtual monitor");check(f.service.tracker.observedDisplay==88,"old physical gesture state leaked host task");check(f.service.chosen==f.launcher&&f.service.observer.nativeCalls==0,"moved native launcher still used fallback handler");check(f.event.display==0&&!f.event.recycled&&f.service.received!=f.event&&f.service.received.recycled,"original event was mutated or copied event leaked");});
 test("hidden recently active physical HOME does not mask visible host",()->{InputFixture f=new InputFixture();ActivityManager.RunningTaskInfo hidden=new ActivityManager.RunningTaskInfo();hidden.displayId=0;hidden.isVisible=false;f.service.activities.tasks.add(0,hidden);f.input();check(f.service.eventDisplay==88&&f.service.calls==1,"hidden HOME blocked physical-main route");});
 test("invisible host never hijacks an ordinary visible physical app",()->{InputFixture f=new InputFixture();f.host.isVisible=false;ActivityManager.RunningTaskInfo app=new ActivityManager.RunningTaskInfo();app.displayId=0;app.type=1;app.topActivity=new ComponentName("other","other.Main");f.service.activities.tasks.add(app);f.pass();check(f.service.resolver.reads==0,"hidden workbench acquired navigation after leaving");});
 test("role change cancels pinned stream instead of navigating a side pane",()->{InputFixture f=new InputFixture();f.input();int calls=f.service.calls;f.service.resolver.target.putInt("display_id",99);f.event.action=2;f.input();check(f.service.calls==calls&&f.service.resolver.reads==2,"old main MOVE reached a pane after it became secondary");f.event.action=1;f.input();check(f.service.calls==calls,"old main UP navigated the side pane");f.module.invoke(f.service,"getInputMonitorCompat",new Class<?>[]{int.class},88);check(f.service.monitorDisplay==88,"source resource override escaped dispatch");f.event.action=2;f.input();check(f.service.calls==calls,"orphan event after completed route navigated physical host");});
 test("unchanged main continues the same stream without refetching tasks",()->{InputFixture f=new InputFixture();f.input();f.event.action=2;f.input();f.event.action=1;f.input();check(f.service.calls==3&&f.service.eventDisplay==88&&f.service.resolver.reads==3,"valid main continuation lost its target");check(f.service.received.recycled&&f.event.display==0&&!f.event.recycled,"caller event was retained or changed");});
 test("ordinary app physical gestures never query workbench metadata",()->{InputFixture f=new InputFixture();f.host.topActivity=new ComponentName("other","other.Main");f.pass();check(f.service.resolver.reads==0,"unrelated app exposed routing discovery");});
 test("content tap retains physical event and native region recognition",()->{InputFixture f=new InputFixture();f.event.y=1500;f.pass();check(f.service.resolver.reads==0,"ordinary content tap became navigation");});
 test("inactive or old main session cancels physical host navigation",()->{InputFixture f=new InputFixture();f.service.resolver.target.putBoolean("active",false);f.blocked();InputFixture old=new InputFixture();old.service.resolver.target.putLong("updated_elapsed",-2000);old.blocked();InputFixture future=new InputFixture();future.service.resolver.target.putLong("updated_elapsed",1001);future.blocked();});
 test("target needs exact live host task owner and user",()->{for(String key:new String[]{"host_task_id","owner_uid","user"}){InputFixture f=new InputFixture();f.service.resolver.target.putInt(key,-1);f.blocked();}});
 test("wrong HOME display and reused display cannot navigate physical host",()->{InputFixture f=new InputFixture();f.home.displayId=99;f.blocked();InputFixture forged=new InputFixture();forged.service.displays.display.owner=10055;forged.blocked();});
 test("missing ROM display manager cancels physical host navigation",()->{InputFixture f=new InputFixture();f.service.mRecentsDisplayModel.missing=true;f.blocked();});
 test("ROM resource factory initializes only authenticated main display",()->{InputFixture f=new InputFixture();f.service.mRecentsDisplayModel.missing=f.service.mRecentsDisplayModel.recover=true;f.input();check(f.service.eventDisplay==88&&f.service.mRecentsDisplayModel.initialized==1,"ROM display factory not used");InputFixture forged=new InputFixture();forged.home.displayId=99;forged.service.mRecentsDisplayModel.missing=forged.service.mRecentsDisplayModel.recover=true;forged.blocked();check(forged.service.mRecentsDisplayModel.initialized==0,"unauthenticated display acquired ROM resources");});
 test("provider failure cancels the workbench gesture",()->{InputFixture f=new InputFixture();f.service.resolver.fail=true;f.blocked();check(f.module.errors==1,"provider failure not diagnosed");});
 test("other input source and multiple initial pointers remain native",()->{InputFixture f=new InputFixture();f.event.source=8194;f.pass();InputFixture many=new InputFixture();many.event.pointers=2;many.pass();});
 test("virtual main input is authenticated and retains its own monitor",()->{InputFixture f=new InputFixture();f.event.display=88;f.input();check(f.service.eventDisplay==88&&f.service.monitorDisplay==88&&f.service.resolver.reads==1,"virtual main gesture bypassed auth or stole physical monitor");});
 test("native exception is never replayed on physical display",()->{InputFixture f=new InputFixture();f.service.failNative=true;boolean failed=false;try{f.input();}catch(IllegalStateException expected){failed=true;}check(failed&&f.service.calls==1,"partial animation was replayed");f.module.invoke(f.service,"getInputMonitorCompat",new Class<?>[]{int.class},88);check(f.service.monitorDisplay==88,"exception leaked resource proxy");});
 test("native animation failure cannot replay the launch",()->{Fixture f=new Fixture();f.manager.fail=true;boolean failed=false;try{f.route();}catch(IllegalStateException expected){failed=true;}check(failed&&f.manager.originalCalls==1,"native recents launch repeated after partial failure");});
 test("returned launcher on physical display does not replace virtual fallback",()->{InputFixture f=new InputFixture();f.launcher.activity=new Context(){public int getDisplayId(){return 0;}};f.event.display=99;f.input();check(f.service.chosen==f.service.observer.fallback&&f.service.observer.nativeCalls==1,"foreign VD captured stale launcher");});
 test("native stream defers focus repair only until matching UP",()->{InputFixture f=new InputFixture();f.input();check(f.service.resolver.begins==1&&f.service.resolver.ends==0,"DOWN did not acquire deferral");check(f.service.resolver.lastBegin.getLong("down_time",-1)==f.event.down&&f.service.resolver.lastBegin.getInt("display_id",-1)==88,"deferral lost stream identity");f.event.action=2;f.input();check(f.service.resolver.begins==1&&f.service.resolver.ends==0,"MOVE reacquired stream");f.event.action=1;f.input();check(f.service.resolver.ends==1&&f.service.calls==3,"UP did not retire native deferral");f.input();check(f.service.resolver.ends==1,"late UP retired twice");});
 test("rejected focus coordination never dispatches or replays native input",()->{InputFixture f=new InputFixture();f.service.resolver.rejectBegin=true;f.input();check(f.service.calls==0&&f.service.resolver.begins==1&&f.service.resolver.ends==0,"uncoordinated DOWN reached native consumer");});
 test("role cancellation releases only its acquired stream",()->{InputFixture f=new InputFixture();f.input();f.service.resolver.target.putBoolean("active",false);f.event.action=2;f.input();check(f.service.calls==1&&f.service.resolver.ends==1,"cancelled role retained focus deferral");f.event.action=3;f.input();check(f.service.resolver.ends==1,"cancel repeated old stream release");});
 test("native dispatch exception releases focus deferral",()->{InputFixture f=new InputFixture();f.service.failNative=true;try{f.input();}catch(IllegalStateException expected){}check(f.service.calls==1&&f.service.resolver.begins==1&&f.service.resolver.ends==1,"exception retained focus deferral or replayed event");});
 System.out.println("QUICKSTEP RESULT "+tests+" cases; "+checks+" assertions");
}}
''',
})

# Match the framework's protective fallback in the boundary shim. A production input hook
# must explicitly pass through native failures so a partly dispatched gesture is not replayed.
_module = "ls/augment/com/hook/AugmentModule.java"
SOURCES[_module] = SOURCES[_module].replace(
    "public int errors;", "public int errors;public final Map<Method,io.github.libxposed.api.XposedInterface.ExceptionMode> modes=new HashMap<>();"
).replace(
    "setExceptionMode(io.github.libxposed.api.XposedInterface.ExceptionMode mode){return this;}",
    "setExceptionMode(io.github.libxposed.api.XposedInterface.ExceptionMode mode){modes.put(method,mode);return this;}"
).replace(
    "return callback==null?original.run(args):callback.run(new Chain(owner,args,original));",
    "if(callback==null)return original.run(args);try{return callback.run(new Chain(owner,args,original));}catch(Throwable failure){if(modes.getOrDefault(m,io.github.libxposed.api.XposedInterface.ExceptionMode.PROTECTIVE)==io.github.libxposed.api.XposedInterface.ExceptionMode.PROTECTIVE)return original.run(args);throw failure;}"
)

# This suite isolates ingress authentication, stream ownership and launch-option
# preservation. The actual per-display window/animation helper is executed by
# test-atomic-workbench-native-recents.py, including the ROM flag-off branches.
SOURCES["ls/augment/com/hook/AtomicWorkbenchQuickstepTargetHook.java"] = '''package ls.augment.com.hook;
final class AtomicWorkbenchQuickstepTargetHook {
 static final class Scope implements AutoCloseable {boolean allowed=true;public void close(){}}
 static void install(AugmentModule m,ClassLoader l){}
 static void prepare(AugmentModule m,AtomicWorkbenchQuickstepInputHook.Route r){}
 static void cancel(AugmentModule m,AtomicWorkbenchQuickstepInputHook.Route r){}
 static AtomicWorkbenchQuickstepInputHook.Route windowRoute(){return null;}
 static Object registeredContainer(Object o,int d){return null;}
 static Object cachedTask(AtomicWorkbenchQuickstepInputHook.Route r,Object t,Object ignored)throws Exception{return t.getClass().getMethod("getCachedTopTask",boolean.class,int.class).invoke(t,false,r.target);}
 static Object container(AugmentModule m,AtomicWorkbenchQuickstepInputHook.Route r,Object o)throws Exception {java.lang.reflect.Field f=o.getClass().getField("mDefaultDisplayContainerInterface");return f.get(o);}
 static Scope launch(AugmentModule m,Object manager,Object container,Object gesture){return new Scope();}
}'''
SOURCES[_module] = SOURCES[_module].replace("deoptimize(Method m)", "deoptimize(java.lang.reflect.Executable m)")
SOURCES[_module] = SOURCES[_module].replace("public Object invoke(Object owner,", '''public NativeInvoker getInvoker(Method m){return new NativeInvoker(m);}public static class NativeInvoker {final Method method;NativeInvoker(Method m){method=m;}public Object invokeSpecial(Object owner,Object...args)throws InvocationTargetException,IllegalAccessException {try{return java.lang.invoke.MethodHandles.privateLookupIn(owner.getClass(),java.lang.invoke.MethodHandles.lookup()).findSpecial(method.getDeclaringClass(),method.getName(),java.lang.invoke.MethodType.methodType(method.getReturnType(),method.getParameterTypes()),owner.getClass()).bindTo(owner).invokeWithArguments(args);}catch(Throwable nativeFailure){throw new InvocationTargetException(nativeFailure);}}}public Object invoke(Object owner,''')


def main():
    with tempfile.TemporaryDirectory(prefix="lsa-quickstep-") as temporary:
        SUPPORT["compile_run"](Path(temporary), SOURCES,
            ["hook/AtomicWorkbenchQuickstepHook.java", "hook/AtomicWorkbenchQuickstepInputHook.java", "hook/AtomicWorkbenchLauncherCrashHook.java"], "ls.augment.com.hook.TestQuickstep")
    sdk = Path(os.environ.get("ANDROID_HOME", str(SUPPORT["ROOT"] / "audit-output/android-sdk"))) / "platforms/android-36/android.jar"
    if sdk.is_file():
        with tempfile.TemporaryDirectory(prefix="lsa-quickstep-sdk-") as temporary:
            work = Path(temporary)
            files = []
            for name in ("io/github/libxposed/api/XposedInterface.java", "ls/augment/com/hook/AugmentModule.java"):
                path = work / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(SOURCES[name], encoding="utf-8")
                files.append(str(path))
            subprocess.run([SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-cp", str(sdk),
                            "-d", str(work / "classes"), str(SUPPORT["SRC"] / "hook/AtomicWorkbenchQuickstepHook.java"),
                            str(SUPPORT["SRC"] / "hook/AtomicWorkbenchQuickstepInputHook.java"),
                            str(SUPPORT["SRC"] / "hook/AtomicWorkbenchQuickstepCapabilities.java"),str(SUPPORT["SRC"] / "hook/HookCompatibility.java"),
                            str(SUPPORT["SRC"] / "hook/AtomicWorkbenchQuickstepTargetHook.java"),
                            str(SUPPORT["SRC"] / "hook/RecentsLoadPlan.java"),
                            str(SUPPORT["SRC"] / "hook/AtomicWorkbenchLauncherCrashHook.java"),
                            *files], check=True, timeout=45, env=SUPPORT["ENV"])
        print("PASS production Quickstep hook compiles against Android 36 public SDK")


if __name__ == "__main__":
    main()
