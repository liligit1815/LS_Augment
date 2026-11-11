"""Execute production desktop routing, including both LauncherApps entry signatures."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/step/WorkspaceRoutes.java').read_text(encoding='utf-8')
desktop=source[source.index('    static void installDesktop('):source.index('    static void installLauncherApps(')]
assert 'p.setResult(' not in desktop, 'pre-promotion must preserve native security and launch delivery'
methods = source[source.index('    static void installLauncherApps('):source.rfind('\n}')]
methods = methods.replace('"com.android.server.pm.LauncherAppsService$LauncherAppsImpl"', 'Impl.class.getName()')
methods = methods.replace('"android.app.IApplicationThread"', 'IApplicationThread.class.getName()')
methods = methods.replace('android.graphics.Rect', 'Rect').replace('android.os.Process.myUid()', '1000')
methods = methods.replace('static boolean routeNative(', 'static boolean routeNativeUnderTest(')
harness = r'''
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import java.lang.reflect.*;
public class TestRoutes {
    interface Parcelable {} interface IBinder {} interface IApplicationThread {}
    static class Rect {}
    static class ComponentName {
        String name; ComponentName(String n){name=n;} String getPackageName(){return name.split("/")[0];}
        public boolean equals(Object o){return o instanceof ComponentName && name.equals(((ComponentName)o).name);}
        public int hashCode(){return name.hashCode();}
    }
    static class Bundle extends HashMap<String,Object> implements Parcelable {
        void putString(String k,String v){put(k,v);} void putInt(String k,int v){put(k,v);}
        int getInt(String k){return (int)get(k);} void putLong(String k,long v){put(k,v);}
        Parcelable getParcelable(String k){return (Parcelable)get(k);}
        void putParcelable(String k,Parcelable v){put(k,v);}
    }
    static class Intent {
        static String ACTION_MAIN="main",CATEGORY_HOME="home",CATEGORY_LAUNCHER="launcher";
        static int FLAG_ACTIVITY_CLEAR_TASK=1,FLAG_ACTIVITY_CLEAR_TOP=2,FLAG_ACTIVITY_MULTIPLE_TASK=4,
                FLAG_ACTIVITY_NEW_DOCUMENT=8,FLAG_ACTIVITY_FORWARD_RESULT=16;
        String action; ComponentName component; Set<String> categories=new HashSet<>();
        int flags; Object data,selector; Bundle extras;
        Intent(String a){action=a;} Intent addCategory(String c){categories.add(c);return this;}
        String getAction(){return action;} boolean hasCategory(String c){return categories.contains(c);}
        Object getData(){return data;} Object getSelector(){return selector;} Bundle getExtras(){return extras;}
        int getFlags(){return flags;} ComponentName getComponent(){return component;}
    }
    static class UserHandle {int id;UserHandle(int i){id=i;}static UserHandle of(int id){return new UserHandle(id);}static UserHandle getUserHandleForUid(int uid){return new UserHandle(uid/100000);}}
    static class Binder {static int uid=10045;static int getCallingUid(){return uid;}static long clearCallingIdentity(){int old=uid;uid=1000;return old;}static void restoreCallingIdentity(long id){uid=(int)id;}}
    static class Looper {static Object current=new Object();static Object myLooper(){return current;}}
    static class Handler {Object loop=new Object();Object getLooper(){return loop;}}
    static class SystemClock {static long uptimeMillis(){return 100;}}
    static class ResultReceiver implements Parcelable {
        ResultReceiver(Handler h){} void send(int code,Bundle data){onReceiveResult(code,data);}
        protected void onReceiveResult(int code,Bundle data){}
    }
    static ResultReceiver remote(ResultReceiver r){return r;}
    static class ApplicationInfo {static int FLAG_SYSTEM=1;int uid=10045,flags=1;}
    static class ActivityInfo {ApplicationInfo applicationInfo=new ApplicationInfo();String packageName="home";}
    static class ResolveInfo {ActivityInfo activityInfo=new ActivityInfo();}
    static class PackageManager {static int MATCH_DEFAULT_ONLY=1;ResolveInfo home=new ResolveInfo();ResolveInfo resolveActivity(Intent i,int flags){return home;}}
    static class LauncherActivityInfo {ComponentName component;LauncherActivityInfo(ComponentName c){component=c;}ComponentName getComponentName(){return component;}}
    static class LauncherApps {
        boolean enabled=true,fail;List<LauncherActivityInfo> entries=new ArrayList<>();
        boolean isActivityEnabled(ComponentName c,UserHandle user){check(!Thread.holdsLock(Wm.lock),"launcher capability checked outside WM lock");check(Binder.uid==1000,"query uses server context identity");if(fail)throw new IllegalStateException();return enabled;}
        List<LauncherActivityInfo> getActivityList(String pkg,UserHandle user){return entries;}
    }
    static class Context {PackageManager pm=new PackageManager();LauncherApps launcher=new LauncherApps();PackageManager getPackageManager(){return pm;}<T>T getSystemService(Class<T> type){return type.cast(launcher);}}
    static class ActivityOptions {int mode,display=-1;Rect bounds;int getLaunchDisplayId(){return display;}Rect getLaunchBounds(){return bounds;}}
    static class StepMembers {static Object callStaticMethod(Class<?> c,String m,Bundle b){return b.get("options");}static Object callStaticMethod(Class<?> c,String m,int user){return UserHandle.of(user);}}
    static class ActivityManager {static class RunningTaskInfo {ComponentName baseActivity,origActivity;Intent baseIntent;int taskId,mode=6;}}
    static class Task {ActivityManager.RunningTaskInfo info=new ActivityManager.RunningTaskInfo();int type=2;}
    static class Token implements Parcelable {}
    static class Wm {static Object lock=new Object(),display=new Object();static Handler handler=new Handler();static Context context=new Context();static Task front=new Task();}
    static class WorkspaceUsers {
        static boolean missing;static int id(UserHandle u){return u.id;}
        static boolean allows(Context c,int principal,int user){
            check(Binder.uid==1000,"foreground/profile query uses the server identity");
            if(missing)throw new IllegalStateException("missing user service");
            return principal==0 && user==0;
        }
    }
    static class NativeWorkspaceGuard {
        static Task sessionHome;static boolean homeValid=true;
        static Object eligibleMain(Task home){return homeValid?home:null;}
        static boolean active=true,ending;static int principal;static Object pendingCommit,flip;
        static Map<Integer,SavedTask> saved=new LinkedHashMap<>();static Slots slots=new Slots();static ResultReceiver events;
        static class SavedTask {int id,user;boolean dirty=true,live=true;Token token=new Token();Task task=new Task();}
        static class Slots {int[] snapshot(){return saved.keySet().stream().filter(i->saved.get(i)!=NativeTopTask.app).mapToInt(i->i).toArray();}}
        static Task liveTask(int id,Object token){SavedTask r=saved.get(id);return r!=null && r.live && token==r.token?r.task:null;}
        static Bundle base(){return new Bundle();}
    }
    static class NativeTopTask {static NativeWorkspaceGuard.SavedTask app,navigation;}
    static class WorkspaceMainFocus {
        static boolean unique=true;
        static boolean secondary(Object t){return NativeTopTask.app!=null && t==NativeTopTask.app.task;}
        static boolean matches(Object t){check(Binder.uid==1000,"main identity query uses server identity");return unique && t==NativeWorkspaceGuard.sessionHome;}
    }
    static boolean unlocked=true;
    static void diagnostic(String stage,String detail){}
    static boolean interactive(Context c){return unlocked;}
    static Object field(Object o,String name){if(o==Wm.display && name.equals("mCurrentFocus"))return Wm.front;throw new AssertionError(name);}
    static Object call(Object o,String name,Object... args){
        if(o instanceof ActivityOptions && name.equals("getLaunchWindowingMode"))return ((ActivityOptions)o).mode;
        if(o instanceof Task){Task t=(Task)o;if(name.equals("getTask"))return t;if(name.equals("getActivityType"))return t.type;if(name.equals("getTaskInfo"))return t.info;if(name.equals("getWindowingMode"))return t.info.mode;}
        if(o instanceof ActivityManager.RunningTaskInfo && name.equals("getWindowingMode"))return ((ActivityManager.RunningTaskInfo)o).mode;
        throw new AssertionError(name);
    }
    static int reports,dispatches,reply=1,checks;static boolean falseReceipt;
    static void report(ResultReceiver r,int code,String message,int task){reports++;}
    static class StepHook {
        static class MethodHookParam {Object[] args;Object thisObject;boolean handled;MethodHookParam(Object obj,Object... a){thisObject=obj;args=a;}}
        protected void beforeHookedMethod(MethodHookParam p){}
    }
    static class StepHooks {
        static class Module {void deoptimize(Method m){}}
        static Module module=new Module();static Map<Method,StepHook> hooks=new LinkedHashMap<>();
        static void hookMethod(Method m,StepHook h){hooks.put(m,h);}
    }
    static class OwnershipBridge {
        static int variant;
        static Method method(Class<?> type,String name,Class<?>... args)throws NoSuchMethodException{
            if(name.equals("startActivityAsUser") && (variant==0 || args.length!=variant))throw new NoSuchMethodException();
            Method m=type.getDeclaredMethod(name,args);m.setAccessible(true);return m;
        }
    }
    static class Impl {
        boolean access=true,launchable=true;int originals,validations;
        boolean canAccessProfile(int user,String why){validations++;return access;}
        Intent getMainActivityLaunchIntent(ComponentName c,UserHandle u,boolean enabled){return launchable?new Intent("main"):null;}
        void startActivityAsUser(IApplicationThread caller,String pkg,String feature,ComponentName c,Rect bounds,Bundle options,UserHandle u){originals++;}
        void startActivityAsUser(IBinder token,IApplicationThread caller,String pkg,String feature,ComponentName c,Rect bounds,Bundle options,UserHandle u){originals++;}
    }
    static class SubImpl extends Impl {}
    METHODS
    // Each independent launch probe starts from the same side-task fixture.
    static boolean routeNative(ComponentName c,int user,int id,String pkg,Bundle options)throws Exception{
        boolean dirty=task.dirty;int mode=task.task.info.mode;
        try{return routeNativeUnderTest(c,user,id,pkg,options);}
        finally{task.dirty=dirty;task.task.info.mode=mode;}
    }
    static void check(boolean condition,String why){checks++;if(!condition)throw new AssertionError(why);}
    static ComponentName component=new ComponentName("app/Main");
    static NativeWorkspaceGuard.SavedTask task;
    static void reset(){
        NativeWorkspaceGuard.active=true;NativeWorkspaceGuard.ending=false;NativeWorkspaceGuard.pendingCommit=null;NativeWorkspaceGuard.flip=null;
        NativeWorkspaceGuard.principal=0;NativeWorkspaceGuard.saved.clear();
        NativeTopTask.app=null;WorkspaceMainFocus.unique=true;NativeWorkspaceGuard.homeValid=true;NativeWorkspaceGuard.sessionHome=new Task();
        task=new NativeWorkspaceGuard.SavedTask();task.id=42;task.task.info.taskId=42;task.task.info.baseActivity=component;
        NativeWorkspaceGuard.saved.put(42,task);Binder.uid=10045;Wm.context=new Context();Wm.front=new Task();
        unlocked=true;Looper.current=new Object();dispatches=0;reply=1;WorkspaceUsers.missing=false;falseReceipt=false;
        NativeWorkspaceGuard.events=new ResultReceiver(Wm.handler){protected void onReceiveResult(int code,Bundle data){
            check(!Thread.holdsLock(Wm.lock),"route must release WM lock before Shell call");
            check(Binder.uid==10045,"original caller restored before host dispatch");
            check(code==96 && data.getInt("id")==42 && data.get("token")==task.token,"exact task identity");
            dispatches++;
            if(reply==1 && !falseReceipt){task.dirty=false;task.task.info.mode=1;}
            ((ResultReceiver)data.get("routeReply")).send(reply,new Bundle());
        }};
    }
    static boolean route()throws Exception{return routeNative(component,0,-1,"home",null);}
    static void rejected(String why)throws Exception{check(!route() && dispatches==0,why);}
    public static void main(String[] argv)throws Exception {
        reset();check(route() && dispatches==1,"desktop route");check(Binder.uid==10045,"original caller restored for native launch checks");
        reset();NativeTopTask.app=task;check(route() && dispatches==1,"top task is routed through exact restoration");
        reset();NativeTopTask.app=task;task.task.type=1;Wm.front=task.task;
        check(route() && dispatches==1,"top input focus permits the unique visible session HOME launch");
        check(Binder.uid==10045,"top-focus query restores launcher identity");
        WorkspaceMainFocus.unique=false;dispatches=0;rejected("hidden or ambiguous main cannot impersonate HOME");
        WorkspaceMainFocus.unique=true;NativeWorkspaceGuard.homeValid=false;rejected("stale HOME identity rejected");
        reset();NativeTopTask.app=task;Wm.front=null;rejected("missing focus does not admit top HOME fallback");
        reset();NativeTopTask.app=task;task.dirty=false;rejected("released top lease rejected");
        reset();NativeTopTask.app=task;task.live=false;rejected("replaced top identity rejected");
        reset();NativeTopTask.app=task;task.user=10;rejected("foreign top user rejected");
        reset();NativeTopTask.app=task;check(routeNative(null,0,42,null,null),"recents restores exact top task");
        reset();NativeTopTask.app=task;NativeWorkspaceGuard.SavedTask side=new NativeWorkspaceGuard.SavedTask();
        side.id=43;side.task.info.taskId=43;side.task.info.baseActivity=component;NativeWorkspaceGuard.saved.put(43,side);
        rejected("top and side sharing launcher identity remain ambiguous");
        reset();WorkspaceUsers.missing=true;
        try{route();throw new AssertionError("missing service must retain native path");}
        catch(IllegalStateException expected){check(Binder.uid==10045 && dispatches==0,"failing user query restores original caller");}
        reset();check(!routeNative(component,-2,-1,"home",null) && dispatches==0,"unresolved current-user sentinel remains native");
        check(Binder.uid==10045,"denied user restores caller");
        reset();check(!routeNative(component,10,-1,"home",null) && dispatches==0,"foreign user remains native");
        reset();task.task.info.origActivity=component;task.task.info.baseActivity=new ComponentName("app/Actual");check(route(),"launcher alias");
        reset();task.task.info.baseIntent=new Intent("main");task.task.info.baseIntent.component=component;task.task.info.baseActivity=new ComponentName("app/Splash");check(route(),"base launch component after splash");
        reset();task.task.info.baseActivity=new ComponentName("app/Other");rejected("same package different activity");
        reset();task.task.info.baseActivity=new ComponentName("app/Player");Wm.context.launcher.entries.add(new LauncherActivityInfo(component));
        check(route(),"unique enabled launcher returns task whose splash/base intent was replaced");
        Wm.context.launcher.entries.add(new LauncherActivityInfo(new ComponentName("app/Second")));dispatches=0;rejected("multi-entry app cannot use package fallback");
        reset();task.task.info.baseActivity=new ComponentName("app/Player");Wm.context.launcher.entries.add(new LauncherActivityInfo(component));Wm.context.launcher.enabled=false;rejected("disabled launcher entry");
        reset();task.task.info.baseActivity=new ComponentName("app/Player");Wm.context.launcher.entries.add(new LauncherActivityInfo(new ComponentName("app/Second")));rejected("single different launcher entry");
        reset();task.task.info.baseActivity=new ComponentName("app/Player");Wm.context.launcher.entries.add(new LauncherActivityInfo(component));NativeWorkspaceGuard.saved.put(43,task);rejected("multiple related tasks remain native");
        reset();task.task.info.baseActivity=new ComponentName("app/Player");Wm.context.launcher.fail=true;rejected("missing launcher capability remains native");
        reset();Wm.context.launcher.fail=true;check(route(),"exact component preserves old path without new capability");check(Binder.uid==10045,"failed query restores caller identity");
        reset();task.live=false;rejected("stale token/task");
        reset();task.dirty=false;rejected("released lease");
        reset();task.task.info.mode=1;rejected("already full screen");
        reset();NativeWorkspaceGuard.saved.put(43,task);rejected("ambiguous tasks");
        reset();task.user=10;rejected("different profile");
        reset();Binder.uid=10046;rejected("foreign uid");
        reset();check(!routeNative(component,0,-1,"spoofed",null),"foreign calling package");
        reset();Wm.context.pm.home.activityInfo.applicationInfo.flags=0;rejected("non-system home");
        reset();Wm.front.type=1;rejected("main not home");
        check(routeNative(null,0,42,null,null),"recents exact task can promote over app");
        reset();NativeWorkspaceGuard.pendingCommit=new Object();rejected("pending commit");
        reset();NativeWorkspaceGuard.flip=new Object();rejected("active flip");
        reset();NativeWorkspaceGuard.ending=true;rejected("closing workspace");
        reset();NativeWorkspaceGuard.active=false;rejected("inactive workspace");
        reset();unlocked=false;rejected("locked device");
        reset();Looper.current=Wm.handler.loop;rejected("no blocking service handler");
        reset();synchronized(Wm.lock){rejected("no blocking locked WM");}
        for(int mode:new int[]{0,1,5,6}){reset();Bundle b=new Bundle();ActivityOptions o=new ActivityOptions();o.mode=mode;b.put("options",o);check(routeNative(component,0,-1,"home",b)==(mode==0||mode==1),"windowing mode "+mode);}
        reset();Bundle b=new Bundle();ActivityOptions o=new ActivityOptions();o.display=1;b.put("options",o);check(!routeNative(component,0,-1,"home",b),"secondary display");
        o.display=0;o.bounds=new Rect();check(!routeNative(component,0,-1,"home",b),"bounded launch");
        reset();reply=0;check(!route(),"host refusal retains native launch");
        reset();falseReceipt=true;check(!route() && dispatches==1,"host receipt cannot replace final server task verification");
        for(int variant:new int[]{7,8,0}){
            reset();StepHooks.hooks.clear();OwnershipBridge.variant=variant;installLauncherApps(TestRoutes.class.getClassLoader());
            check(StepHooks.hooks.size()==(variant==0?0:1),"independent signature detection "+variant);
            if(variant==0)continue;
            Method method=StepHooks.hooks.keySet().iterator().next();StepHook hook=StepHooks.hooks.get(method);
            for(Impl impl:new Impl[]{new Impl(),new SubImpl()}){
                reset();Object[] args=variant==8?new Object[]{null,null,"home",null,component,null,null,new UserHandle(0)}
                        :new Object[]{null,"home",null,component,null,null,new UserHandle(0)};
                StepHook.MethodHookParam p=new StepHook.MethodHookParam(impl,args);hook.beforeHookedMethod(p);
                check(dispatches==1 && !p.handled,"new and inherited receivers retain native launch");method.invoke(impl,args);check(impl.originals==1,"native launch exactly once");
                impl.access=false;dispatches=0;hook.beforeHookedMethod(p);check(dispatches==0 && !p.handled,"profile denial");
                impl.access=true;impl.launchable=false;hook.beforeHookedMethod(p);check(dispatches==0 && !p.handled,"non-launcher component");
            }
        }
        reset();Intent intent=new Intent("main").addCategory("launcher");intent.component=component;
        Object[] args={null,"home",null,intent,null,null,null,-1,0,null,null,0};check(before(args,false),"legacy ATMS preserved");
        args[5]=new IBinder(){};dispatches=0;
        check(before(args,false) && dispatches==1,"Activity launcher resultTo token with requestCode -1 is not a result request");
        intent.extras=new Bundle();intent.extras.putString("launcher-source","desktop");dispatches=0;
        check(before(args,false) && dispatches==1 && "desktop".equals(intent.extras.get("launcher-source")),"launcher metadata survives pre-promotion unchanged");
        Object callerToken=args[5];Object launch=args[3];
        check(args[5]==callerToken && args[3]==launch,"original caller and intent remain available to native dispatch");
        args[6]="result-owner";dispatches=0;check(!before(args,false)&&dispatches==0,"named result route remains native");args[6]=null;
        args[7]=2;check(!before(args,false)&&dispatches==0,"actual result request remains native");args[7]=-1;
        intent.flags=Intent.FLAG_ACTIVITY_CLEAR_TASK;dispatches=0;check(!before(args,false)&&dispatches==0,"destructive intent retains native semantics");
        System.out.println("PASS "+checks+" desktop routing checks: old/new signatures, subclasses, identity, security, busy state, native delivery");
    }
}
'''.replace('METHODS', methods)
java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='step-desktop-route-') as temp:
    folder = Path(temp)
    path = folder / 'TestRoutes.java'
    path.write_text(harness, encoding='utf-8')
    subprocess.run([java/'javac', '-encoding', 'UTF-8', '-d', folder, path], check=True)
    subprocess.run([java/'java', '-cp', folder, 'TestRoutes'], check=True)
