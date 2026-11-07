"""Run production status-bar entry and authenticated readiness with deterministic Android boundaries."""
import os
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
STEP = ROOT / 'android/app/src/main/java/ls/augment/com/step'


def nested(source, name):
    return 'static ' + source[source.index('final class ' + name):]


def adapt(source):
    for prefix in ('android.view.', 'android.os.', 'android.app.', 'ls.augment.com.'):
        source = source.replace(prefix, '')
    return source


corner = nested((STEP / 'CornerEntry.java').read_text(encoding='utf-8'), 'CornerEntry')
corner = corner.replace('"com.android.systemui.statusbar.phone.PhoneStatusBarView"', 'barClass')
# Replace only the platform thread boundary, so tests control configuration races.
corner = corner.replace('new Thread(', 'new Worker(')
policy=(STEP/'CornerEntryPolicy.java').read_text(encoding='utf-8')
policy='static '+policy[policy.index('final class CornerEntryPolicy'):]
runtime = (STEP / 'StepRuntime.java').read_text(encoding='utf-8')
shell = runtime[runtime.index('        static void onSwitchChanged()'):runtime.index('        static Object factory, transitions;')]
native = (STEP / 'NativeWorkspaceGuard.java').read_text(encoding='utf-8')
receiver = native[native.index('                    // Check framework-provided sender identity'):native.index('            }, new IntentFilter(ACTION)')]
caller = (STEP / 'WorkspaceCaller.java').read_text(encoding='utf-8')
caller = caller[caller.index('public final class'):].replace('public final class', 'static final class', 1)

harness = r'''
import java.util.*;
import java.lang.reflect.*;
public class TestEntry {
    static int checks;
    static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
    static class BuildConfig {static final int VERSION_CODE=20722;}
    static class Bundle extends HashMap<String,Object> {
        void putLong(String k,long v){put(k,v);}
        void putString(String k,String v){put(k,v);}
        void putInt(String k,int v){put(k,v);} int getInt(String k){return containsKey(k)?(int)get(k):0;}
        void putBoolean(String k,boolean v){put(k,v);} boolean getBoolean(String k){return Boolean.TRUE.equals(get(k));}
    }
    static class Intent {
        Bundle data=new Bundle();String action,target;
        Intent(){} Intent(String a){action=a;} Intent setPackage(String p){target=p;return this;}
        Intent putExtra(String k,Object v){data.put(k,v);return this;} Intent putExtras(Bundle b){data.putAll(b);return this;}
        String getStringExtra(String k){return (String)data.get(k);}
    }
    static class Handler {
        List<Runnable> immediate=new ArrayList<>();Map<Runnable,Integer> delayed=new LinkedHashMap<>();
        void post(Runnable r){immediate.add(r);} void postDelayed(Runnable r,int delay){delayed.put(r,delay);}
        void removeCallbacks(Runnable r){delayed.remove(r);}
        void drain(){while(!immediate.isEmpty())immediate.remove(0).run();}
        void at(int delay){for(var e:new ArrayList<>(delayed.entrySet()))if(e.getValue()==delay && delayed.remove(e.getKey())!=null)e.getKey().run();}
    }
    static class ResultReceiver {
        ResultReceiver(Handler h){} protected void onReceiveResult(int code,Bundle data){}
        void send(int code,Bundle data){onReceiveResult(code,data);}
    }
    static class BroadcastOptions {
        boolean shared;static BroadcastOptions makeBasic(){return new BroadcastOptions();}
        BroadcastOptions setShareIdentityEnabled(boolean b){shared=b;return this;}
        Bundle toBundle(){Bundle b=new Bundle();b.putBoolean("shared",shared);return b;}
    }
    static class Resolver {
        Bundle config=new Bundle();boolean fail;
        Resolver(){config.putBoolean("enabled",true);}
        Bundle call(Object uri,String op,Object arg,Object extras){if(fail)throw new IllegalStateException();return config;}
    }
    static class Context {
        Resolver resolver=new Resolver();WindowManager manager=new WindowManager();List<Intent> sent=new ArrayList<>();boolean fail;
        Resolver getContentResolver(){return resolver;}
        <T>T getSystemService(Class<T> type){return type.cast(manager);}
        void sendBroadcast(Intent intent,Object permission,Bundle options){
            if(fail)throw new IllegalStateException("transport");
            check(options.getBoolean("shared"),"framework-provided sender identity requested");
            check("android".equals(intent.target) && NativeWorkspaceGuard.ACTION.equals(intent.action),"actual task receiver route");
            sent.add(intent);
        }
    }
    static class Rect {int width(){return 1080;}int height(){return 2400;}}
    static class Metrics {int widthPixels=1080;float density=1;}
    static class Resources {Metrics metrics=new Metrics();Metrics getDisplayMetrics(){return metrics;}}
    static class Display {int id,rotation;int getDisplayId(){return id;}int getRotation(){return rotation;}}
    static class WindowManager {
        static class LayoutParams extends ViewGroup.LayoutParams {static final int TYPE_STATUS_BAR=2000;int type=TYPE_STATUS_BAR;}
        static class WindowMetrics {Rect getBounds(){return new Rect();}}
        WindowMetrics getMaximumWindowMetrics(){return new WindowMetrics();}
    }
    static class View {
        boolean shown=true,attached=true;int height=60;View root=this;Context context;Display display=new Display();
        Resources resources=new Resources();ViewGroup.LayoutParams params=new WindowManager.LayoutParams();
        View(){context=StepRuntime.Shell.context;}
        boolean isShown(){return shown;}boolean isAttachedToWindow(){return attached;}Display getDisplay(){return display;}
        View getRootView(){return root;}ViewGroup.LayoutParams getLayoutParams(){return params;}int getHeight(){return height;}
        Context getContext(){return context;}Resources getResources(){return resources;}
    }
    static class ViewGroup extends View {
        static class LayoutParams {}
        boolean dispatchTouchEvent(MotionEvent e){return false;}
    }
    static class Bar extends ViewGroup {}
    static class SubBar extends Bar {}
    static class UnknownBar extends View {}
    static String barClass=Bar.class.getName();
    static class InputDevice {static final int SOURCE_TOUCHSCREEN=4098;}
    static class MotionEvent {
        static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;
        int action,count=1,id,source=4098;float x,y;long time;
        MotionEvent(int a,float px,float py,long t){action=a;x=px;y=py;time=t;}
        int getActionMasked(){return action;}int getPointerCount(){return count;}int getPointerId(int index){return id;}
        boolean isFromSource(int s){return source==s;}float getRawX(){return x;}float getRawY(){return y;}long getEventTime(){return time;}
        static MotionEvent obtain(MotionEvent e){return new MotionEvent(e.action,e.x,e.y,e.time);}
        void setAction(int a){action=a;}void recycle(){}
    }
    static class SystemClock {static long elapsedRealtime(){return 10000;}}
    static class WorkspaceLayout {int top=200;WorkspaceLayout(int w,int h,float density,boolean upper){}}
    static class StepMaterial {static int dp(Context c,int n){return n;}}
    static class WorkspacePrefsProvider {static final Object URI=new Object();}
    static class Worker {
        static List<Runnable> queue=new ArrayList<>();Runnable action;
        Worker(Runnable r,String name){action=r;}void start(){queue.add(action);}
        static void drain(){while(!queue.isEmpty())queue.remove(0).run();}
    }
    static class LiveWorkspace {
        static boolean running;static int opens;static Intent last;
        static boolean running(){return running;}static void open(Object sink,Intent i){opens++;last=i;}
    }
    static class StepHook {
        static class MethodHookParam {Object thisObject;Object[] args;boolean handled;void setResult(Object r){handled=true;}}
        protected void beforeHookedMethod(MethodHookParam p){}
    }
    static class StepHooks {
        static Map<Method,StepHook> hooks=new LinkedHashMap<>();static int cancels;
        static void hookMethod(Method m,StepHook h){hooks.put(m,h);}
        static void invokeOriginalMethod(Method m,Object view,Object[] args){
            check(((MotionEvent)args[0]).action==MotionEvent.ACTION_CANCEL,"native stream cancelled at takeover");cancels++;
        }
    }
    static class OwnershipBridge {
        static Method method(Class<?> c,String name,Class<?>... args)throws NoSuchMethodException {
            for(;c!=null;c=c.getSuperclass())try{return c.getDeclaredMethod(name,args);}catch(NoSuchMethodException ignored){}
            throw new NoSuchMethodException(name);
        }
    }
    static class Answer {boolean ready;String details;Answer(boolean r,String d){ready=r;details=d;}}
    static class StepRuntime {
        static boolean enabled=true,unlocked=true;static List<String> logs=new ArrayList<>();static List<Answer> answers=new ArrayList<>();
        static boolean interactive(Context c){return unlocked;}
        static void report(Object sink,int code,String msg,int task){logs.add(msg);}
        static void diagnostic(String stage,String detail){logs.add(stage+":"+detail);}
        static ResultReceiver remote(ResultReceiver r){return r;}
        static void answer(Intent request,boolean ready,String detail){answers.add(new Answer(ready,detail));}
        static class Shell {
            static Handler main=new Handler();static Context context=new Context();static Object factory,executor,transitions;
            static int probeGeneration;static boolean serverReady;static String handshake="not_requested";
            SHELL
        }
    }
    CALLER
    static class NativeWorkspaceGuard {
        static final String ACTION="native.task.control";static int systemUiUid=10045,rejectedSenders,delivered=10045,executions;
        static boolean registered=true;
        static int getSentFromUid(){return delivered;}
        static void diagnostic(String s,String d){StepRuntime.diagnostic(s,d);}
        static void answer(Intent i,boolean ready,String detail){
            Bundle b=new Bundle();b.putInt("version",BuildConfig.VERSION_CODE);
            ((ResultReceiver)i.data.get("reply")).send(ready?1:0,b);
        }
        static void execute(Intent i){executions++;}
        static void receive(Intent i){
            RECEIVER
    }
    CORNER
    static View view;static Method dispatch;
    static void reset()throws Exception {
        StepRuntime.enabled=true;StepRuntime.unlocked=true;StepRuntime.logs.clear();StepRuntime.answers.clear();
        StepRuntime.Shell.main=new Handler();StepRuntime.Shell.context=new Context();
        StepRuntime.Shell.factory=new Object();StepRuntime.Shell.executor=new Object();StepRuntime.Shell.transitions=new Object();
        StepRuntime.Shell.serverReady=true;StepRuntime.Shell.handshake="ready";StepRuntime.Shell.probeGeneration++;
        CornerEntry.candidate=null;CornerEntry.owned=null;CornerEntry.opening=false;CornerEntry.supported=true;
        StepHooks.cancels=0;LiveWorkspace.opens=0;LiveWorkspace.running=false;Worker.queue.clear();
        NativeWorkspaceGuard.registered=true;NativeWorkspaceGuard.delivered=10045;NativeWorkspaceGuard.executions=0;
        view=new SubBar();dispatch=OwnershipBridge.method(Bar.class,"dispatchTouchEvent",MotionEvent.class);
    }
    static boolean event(int action,float x,float y,long time)throws Throwable {return event(new MotionEvent(action,x,y,time));}
    static boolean event(MotionEvent e)throws Throwable {
        StepHook.MethodHookParam p=new StepHook.MethodHookParam();CornerEntry.handle(view,e,dispatch,p);return p.handled;
    }
    static void down()throws Throwable {check(!event(0,10,20,100),"down preserves native handling");}
    static void finish(){Worker.drain();StepRuntime.Shell.main.drain();}
    static Intent request(){StepRuntime.Shell.checkEntry(new Intent());return StepRuntime.Shell.context.sent.isEmpty()?null:StepRuntime.Shell.context.sent.get(0);}
    static void reply(Intent i,int code,int version){Bundle b=new Bundle();b.putInt("version",version);((ResultReceiver)i.data.get("reply")).send(code,b);}
    static void answer(boolean ready,String detail){
        check(StepRuntime.answers.size()==1,"one check result");Answer a=StepRuntime.answers.get(0);
        check(a.ready==ready && a.details.contains(detail),"truthful result: "+detail);
    }
    public static void main(String[] args)throws Throwable {
        check(CornerEntryPolicy.edge(1216,3.25f)==234,"guide and native corner width on current device");
        check(CornerEntryPolicy.height(125,3.25f)==125,"actual status bar bounds the guide height");
        check(CornerEntryPolicy.direction(1216,125,3.25f,30,124)==1,"left status-bar corner accepted");
        check(CornerEntryPolicy.direction(1216,125,3.25f,1180,124)==-1,"right status-bar corner accepted");
        check(CornerEntryPolicy.direction(1216,125,3.25f,30,125)==0,"below native bar not advertised or accepted");
        check(CornerEntryPolicy.direction(1216,125,3.25f,608,30)==0,"middle status bar stays native");
        check(CornerEntryPolicy.direction(1216,0,3.25f,30,0)==0,"missing bar has no invented gesture region");
        check(CornerEntryPolicy.edge(2688,3.25f)==234,"landscape keeps physical dp width");
        check(CornerEntryPolicy.direction(1216,125,3.25f,Float.NaN,30)==0,"invalid pointer cannot enter");
        check(!CornerEntryPolicy.completedAfter(100,200,99),"old successful entry cannot complete new guide");
        check(!CornerEntryPolicy.completedAfter(100,200,0),"never-entered guide cannot complete");
        check(!CornerEntryPolicy.completedAfter(100,200,201),"future completion rejected");
        check(CornerEntryPolicy.completedAfter(100,200,150),"real completion after guide start accepted");
        reset();down();check(event(1,75,21,180),"fast swipe crossing threshold only on UP must trigger");finish();
        check(LiveWorkspace.opens==1 && StepHooks.cancels==1 && CornerEntry.owned==null,"UP launches once, closes native stream");
        reset();event(0,1070,20,100);check(event(1,1000,20,180),"right edge UP");finish();
        check(LiveWorkspace.opens==1 && !LiveWorkspace.last.data.getBoolean("leftSide"),"right side routing");
        reset();down();check(event(2,80,20,180),"existing MOVE path");check(event(1,90,20,190),"owns remaining UP");finish();
        check(LiveWorkspace.opens==1 && StepHooks.cancels==1 && LiveWorkspace.last.data.getBoolean("normalEntry"),"MOVE does not duplicate launch");
        for(int kind=0;kind<9;kind++){
            reset();down();MotionEvent e=new MotionEvent(1,80,20,180);
            switch(kind){case 0:e.x=20;break;case 1:e.y=60;break;case 2:e.x=0;break;case 3:e.time=700;break;
                case 4:e.count=2;break;case 5:e.id=3;break;case 6:view.display.rotation=1;break;
                case 7:e.action=3;break;case 8:e.action=5;break;}
            check(!event(e),"native invalid gesture "+kind);finish();check(LiveWorkspace.opens==0 && StepHooks.cancels==0,"no invalid takeover "+kind);
        }
        for(int kind=0;kind<11;kind++){
            reset();switch(kind){case 0:StepRuntime.enabled=false;break;case 1:StepRuntime.Shell.serverReady=false;break;
                case 2:view.shown=false;break;case 3:view.attached=false;break;case 4:view.display.id=1;break;
                case 5:StepRuntime.Shell.factory=null;break;case 6:LiveWorkspace.running=true;break;
                case 7:StepRuntime.unlocked=false;break;case 8:((WindowManager.LayoutParams)view.params).type=2040;break;
                case 9:view.height=2400;break;case 10:CornerEntry.opening=true;break;}
            down();check(!event(1,80,20,180),"entry guard retains native stream "+kind);finish();check(LiveWorkspace.opens==0,"guard no launch "+kind);
        }
        reset();event(0,500,20,100);check(!event(1,570,20,180),"middle bar unchanged");
        reset();MotionEvent mouse=new MotionEvent(0,10,20,100);mouse.source=8194;event(mouse);check(!event(1,80,20,180),"non-touch unchanged");
        reset();down();event(1,80,20,180);StepRuntime.Shell.context.resolver.config.putBoolean("enabled",false);finish();check(LiveWorkspace.opens==0,"fresh saved switch blocks launch");
        reset();down();event(1,80,20,180);Worker.drain();StepRuntime.unlocked=false;StepRuntime.Shell.main.drain();check(LiveWorkspace.opens==0,"lock during async read blocks launch");
        reset();down();event(1,80,20,180);StepRuntime.Shell.context.resolver.fail=true;finish();check(LiveWorkspace.opens==0 && !CornerEntry.opening,"provider failure releases pending entry");
        reset();StepHooks.hooks.clear();barClass=Bar.class.getName();CornerEntry.install(TestEntry.class.getClassLoader());
        check(CornerEntry.supported && StepHooks.hooks.size()==1,"inherited dispatch installed");
        StepHook hook=StepHooks.hooks.values().iterator().next();StepHook.MethodHookParam p=new StepHook.MethodHookParam();
        p.thisObject=new ViewGroup();p.args=new Object[]{new MotionEvent(0,10,20,100)};hook.beforeHookedMethod(p);
        check(CornerEntry.candidate==null,"shared parent hook excludes unrelated views");
        CornerEntry.supported=false;StepHooks.hooks.clear();barClass=UnknownBar.class.getName();CornerEntry.install(TestEntry.class.getClassLoader());
        check(!CornerEntry.supported && StepHooks.hooks.isEmpty(),"unknown host preserves native");
        CornerEntry.supported=false;barClass="missing.StatusBar";CornerEntry.install(TestEntry.class.getClassLoader());check(!CornerEntry.supported,"missing class preserves native");

        reset();StepRuntime.Shell.factory=null;check(request()==null,"missing components do not claim ready");answer(false,"未接入");
        reset();Intent i=request();check("readiness".equals(i.getStringExtra("operation")),"enabled uses native readiness");NativeWorkspaceGuard.receive(i);
        answer(true,"通信正常");check(StepRuntime.Shell.serverReady && NativeWorkspaceGuard.executions==0,"verified route without task mutation");
        reset();i=request();StepRuntime.Shell.main.at(2500);answer(false,"通信超时");
        check(!StepRuntime.Shell.serverReady && StepRuntime.Shell.context.sent.size()==2,"cached ready invalidated and retry restarted");
        reply(i,1,BuildConfig.VERSION_CODE);check(!StepRuntime.Shell.serverReady && StepRuntime.answers.size()==1,"late reply ignored");
        reset();i=request();reply(i,1,BuildConfig.VERSION_CODE-1);answer(false,"版本未匹配");check(!StepRuntime.Shell.serverReady,"version mismatch blocks gesture");
        reset();i=request();NativeWorkspaceGuard.registered=false;NativeWorkspaceGuard.receive(i);answer(false,"尚未就绪");
        reset();StepRuntime.enabled=false;i=request();check("probe".equals(i.getStringExtra("operation")),"OFF can query capability");NativeWorkspaceGuard.receive(i);
        answer(true,"通信正常");check(!StepRuntime.enabled && !StepRuntime.Shell.serverReady && NativeWorkspaceGuard.executions==0,"OFF probe does not enable or launch");
        reset();i=request();StepRuntime.enabled=false;StepRuntime.Shell.onSwitchChanged();reply(i,1,BuildConfig.VERSION_CODE);answer(false,"配置已变化");
        check(!StepRuntime.Shell.serverReady,"stale generation cannot enable entry");
        reset();StepRuntime.Shell.serverReady=false;StepRuntime.Shell.queryServer(StepRuntime.Shell.probeGeneration,1000);
        Intent old=StepRuntime.Shell.context.sent.get(0);StepRuntime.Shell.checkEntry(new Intent());i=StepRuntime.Shell.context.sent.get(1);
        reply(i,1,BuildConfig.VERSION_CODE);reply(old,0,BuildConfig.VERSION_CODE);check(StepRuntime.Shell.serverReady,"older background failure cannot undo fresh success");
        reset();StepRuntime.Shell.serverReady=false;StepRuntime.Shell.queryServer(StepRuntime.Shell.probeGeneration,1000);
        old=StepRuntime.Shell.context.sent.get(0);StepRuntime.Shell.main.at(1000);i=StepRuntime.Shell.context.sent.get(1);
        reply(i,1,BuildConfig.VERSION_CODE);reply(old,0,BuildConfig.VERSION_CODE);check(StepRuntime.Shell.serverReady,"late background failure preserves established readiness");
        reset();StepRuntime.Shell.context.fail=true;request();answer(false,"通信超时");check(!StepRuntime.Shell.serverReady,"transport failure blocks entry");
        reset();i=request();NativeWorkspaceGuard.delivered=-1;NativeWorkspaceGuard.receive(i);check(StepRuntime.answers.isEmpty(),"unshared identity rejected");
        NativeWorkspaceGuard.delivered=1000;NativeWorkspaceGuard.receive(i);check(StepRuntime.answers.isEmpty(),"non-SystemUI UID rejected");
        StepRuntime.Shell.main.at(2500);answer(false,"通信超时");check(NativeWorkspaceGuard.executions==0,"unauthorized probe never executes tasks");
        System.out.println("PASS "+checks+" Step entry checks: UP/MOVE, native guards, subclasses, authenticated probe, OFF, stale replies, timeout and retry");
    }
}
'''
harness = harness.replace('SHELL', adapt(shell)).replace('CALLER', caller).replace('RECEIVER', receiver).replace('CORNER', policy+'\n'+adapt(corner))
java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='step-entry-') as temp:
    folder = Path(temp)
    path = folder / 'TestEntry.java'
    path.write_text(harness, encoding='utf-8')
    subprocess.run([java/'javac', '-encoding', 'UTF-8', '-d', folder, path], check=True)
    subprocess.run([java/'java', '-cp', folder, 'TestEntry'], check=True)
    if '--baseline' in sys.argv:
        # Replay the same fast-UP assertion with the actual pre-fix CornerEntry.
        # The surrounding stubs do not supply or reimplement gesture decisions.
        baseline = subprocess.run(['git', 'show', 'a0c2ed267d329a2750e7dbcd45d4026211bec012:android/app/src/main/java/ls/augment/com/step/CornerEntry.java'],
                                  cwd=ROOT, check=True, capture_output=True, encoding='utf-8').stdout
        baseline = nested(baseline, 'CornerEntry').replace('"com.android.systemui.statusbar.phone.PhoneStatusBarView"', 'barClass').replace('new Thread(', 'new Worker(')
        # Only the newer diagnostic caller needs this inert old-version fixture method.
        baseline = baseline.replace('static boolean supported;', 'static String snapshot(){return "baseline";} static boolean supported;')
        path.write_text(harness.replace(adapt(corner), adapt(baseline)), encoding='utf-8')
        subprocess.run([java/'javac', '-encoding', 'UTF-8', '-d', folder, path], check=True)
        result = subprocess.run([java/'java', '-cp', folder, 'TestEntry'], capture_output=True, encoding='utf-8')
        assert result.returncode != 0 and 'fast swipe crossing threshold only on UP must trigger' in result.stderr, result.stderr
        print('PASS test20714 baseline rejected at the fast-UP regression')
