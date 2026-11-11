"""Run production panel dispatch/lifetime against timed gestures and OEM contract variants."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
JDK = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'

def member(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

FILES = {
'android/content/Context.java': 'package android.content;public class Context {}',
'android/os/Looper.java': 'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/SystemClock.java': 'package android.os;public class SystemClock{public static long now;public static long elapsedRealtime(){return now;}}',
'android/os/Handler.java': '''package android.os;import java.util.*;public class Handler{
static Map<Runnable,Long> jobs=new LinkedHashMap<>();public Handler(Looper l){}public void removeCallbacks(Runnable r){jobs.remove(r);}
public void postDelayed(Runnable r,long ms){jobs.put(r,SystemClock.now+ms);}public void post(Runnable r){postDelayed(r,0);}
public static void advance(long ms){SystemClock.now+=ms;for(var e:new ArrayList<>(jobs.entrySet()))if(e.getValue()<=SystemClock.now&&jobs.remove(e.getKey())!=null)e.getKey().run();}
public static void reset(){jobs.clear();SystemClock.now=0;}}
''',
'android/graphics/Matrix.java': '''package android.graphics;public class Matrix{
public float scale=1;public boolean isIdentity(){return scale==1;}public boolean invert(Matrix m){if(scale==0)return false;m.scale=1/scale;return true;}
public void mapPoints(float[] p){p[0]*=scale;p[1]*=scale;}}
''',
'android/view/MotionEvent.java': '''package android.view;public class MotionEvent{
public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;
public int action,pointers=1;public float x,y;public long time;public boolean recycled;
public MotionEvent(int a,float x,float y,long t){action=a;this.x=x;this.y=y;time=t;}
public int getActionMasked(){return action;}public int getPointerCount(){return pointers;}public float getX(){return x;}public float getY(){return y;}public long getEventTime(){return time;}
public static MotionEvent obtain(MotionEvent e){return new MotionEvent(e.action,e.x,e.y,e.time);}public void setAction(int a){action=a;}public void recycle(){recycled=true;}}
''',
'android/view/ViewConfiguration.java': '''package android.view;public class ViewConfiguration{
public static ViewConfiguration get(android.content.Context c){return new ViewConfiguration();}public int getScaledTouchSlop(){return 8;}public static int getLongPressTimeout(){return 500;}}
''',
'android/view/ViewTreeObserver.java': '''package android.view;import java.util.*;public class ViewTreeObserver{
public interface OnPreDrawListener{boolean onPreDraw();}List<OnPreDrawListener> listeners=new ArrayList<>();
public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}
public boolean isAlive(){return true;}public void draw(){for(var l:new ArrayList<>(listeners))l.onPreDraw();}}
''',
'android/view/View.java': '''package android.view;import java.util.*;public class View{
public static final int VISIBLE=0;public boolean attached=true,shown=true,clickable,longClickable;public int visibility,left,top,width=100,height=100,scrollX,scrollY;
public Object delegate;public android.graphics.Matrix matrix=new android.graphics.Matrix();final ViewTreeObserver observer=new ViewTreeObserver();
public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
List<OnAttachStateChangeListener> listeners=new ArrayList<>();public android.content.Context getContext(){return new android.content.Context();}
public boolean isShown(){return shown;}public boolean isAttachedToWindow(){return attached;}public int getVisibility(){return visibility;}
public boolean isClickable(){return clickable;}public boolean isLongClickable(){return longClickable;}
public Object getTouchDelegate(){return delegate;}public int getLeft(){return left;}public int getTop(){return top;}public int getWidth(){return width;}public int getHeight(){return height;}
public int getScrollX(){return scrollX;}public int getScrollY(){return scrollY;}public android.graphics.Matrix getMatrix(){return matrix;}
public ViewTreeObserver getViewTreeObserver(){return observer;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}
public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}
public void detach(){attached=false;for(var l:new ArrayList<>(listeners))l.onViewDetachedFromWindow(this);}}
''',
'android/view/ViewGroup.java': '''package android.view;import java.util.*;public class ViewGroup extends View{
public List<View> children=new ArrayList<>();public int downs,ups,cancels;public boolean consume;public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}
public boolean dispatchTouchEvent(MotionEvent e){if(e.action==0)downs++;if(e.action==1)ups++;if(e.action==3)cancels++;return consume;}}
''',
'ls/augment/com/hook/FeatureRuntimeLog.java': 'package ls.augment.com.hook;class FeatureRuntimeLog{static String last;static void event(String a,String b){last=a+":"+b;}}',
'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;import java.lang.reflect.*;class SystemUiAdapter{
static Object field(Object o,String n){if(o==null)return null;for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(NoSuchFieldException e){}catch(Exception e){throw new RuntimeException(e);}return null;}
static Object call(Object o,String n,Object...a)throws ReflectiveOperationException{for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(n)&&m.getParameterCount()==a.length){m.setAccessible(true);return m.invoke(o,a);}throw new NoSuchMethodException(n);}}
''',
'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;import android.view.*;class AugmentModule{
interface Interceptor{Object run(Chain c)throws Throwable;}static class Builder{Method method;Interceptor callback;Builder(Method m){method=m;}Builder intercept(Interceptor c){callback=c;return this;}}
static class Chain{final ViewGroup view;final MotionEvent event;Chain(ViewGroup v,MotionEvent e){view=v;event=e;}
Object getThisObject(){return view;}List<Object> getArgs(){return List.of(event);}Object proceed(){return view.dispatchTouchEvent(event);}Object proceed(Object[] a){return view.dispatchTouchEvent((MotionEvent)a[0]);}}
Map<Method,Interceptor> hooks=new HashMap<>();Builder prepareFeatureHook(Method m,String n,boolean b){return new Builder(m);}void registerFeatureHook(Builder b){hooks.put(b.method,b.callback);}
boolean send(ViewGroup v,MotionEvent e)throws Throwable{Interceptor h=hooks.get(v.getClass().getMethod("dispatchTouchEvent",MotionEvent.class));return h==null?v.dispatchTouchEvent(e):(Boolean)h.run(new Chain(v,e));}}
''',
}
for widget in ('AbsSeekBar', 'EditText'):
    FILES[f'android/widget/{widget}.java'] = f'package android.widget;public class {widget} extends android.view.View{{}}'
FILES['android/webkit/WebView.java'] = 'package android.webkit;public class WebView extends android.view.View{}'
for name in ('IslandPanelInteraction', 'NativeIslandSceneContract'):
    FILES[f'ls/augment/com/hook/{name}.java'] = (SRC / 'hook' / (name + '.java')).read_text('utf-8')
FILES['ls/augment/com/IslandActivityPolicy.java'] = (SRC / 'IslandActivityPolicy.java').read_text('utf-8')

HARNESS = '''package ls.augment.com.hook;
import android.view.*;import android.os.*;import java.util.*;import ls.augment.com.IslandActivityPolicy;
public class PanelInteractionTest{
static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
static final AugmentModule module=new AugmentModule();
static class Animation{int closes;public void startPermanentPanelCloseAnimation(Object island,boolean remove,boolean temporary){
check(!remove&&!temporary,"blank/idle close keeps live scene");closes++;}}
static class Manager{boolean mDynamicPanelShowing=true,mDynamicPanelClosing;Object current=new Object(),mTempIsland;
Animation mDynamicAnimation=new Animation();public Object getPermanentIsland(){return current;}}
static class ChildManager extends Manager{}
static class Fullscreen extends Manager{View mDynamicIslandPanelRoot=new View();int hides;public void hidePanelIsland(boolean remove){check(!remove,"fullscreen collapse only");hides++;}}
static class Missing{boolean mDynamicPanelShowing=true;Object current=new Object();public Object getPermanentIsland(){return current;}}
static class Wrong extends Manager{public String mDynamicPanelShowing="wrong";}
static class ChildPanel extends ViewGroup{}
static class Fixture{Object owner=new Object();Manager manager=new ChildManager();ViewGroup panel=new ChildPanel();int changes;
Fixture(){Handler.reset();panel.width=300;panel.height=200;}
void bind(boolean timed){IslandPanelInteraction.bind(owner,manager,manager.current,panel,timed,()->changes++);}
void event(int action,float x,float y)throws Throwable{module.send(panel,new MotionEvent(action,x,y,SystemClock.now));}
void tap(float x,float y)throws Throwable{event(0,x,y);Handler.advance(40);event(1,x,y);}
void end(){manager.mDynamicPanelShowing=false;panel.detach();IslandPanelInteraction.release(owner);}
View button(){View b=new View();b.left=20;b.top=20;b.width=60;b.height=50;b.clickable=true;panel.children.add(b);return b;}}

// Execute the real notification expiry/arbitration method with the real panel lifetime.
static class MediaController{Object getSessionToken(){return this;}}
static class Power{boolean isInteractive(){return true;}}
static class IslandDownloadPolicy{static class Entry<T>{String key;StatusBarNotification source=new StatusBarNotification();}}
static class StatusBarNotification{String getPackageName(){return "test";}}
static class Downloads{Activities activities=new Activities();void clear(){}}static class Activities{IslandDownloadPolicy.Entry<StatusBarNotification> choose(String k){return null;}}
static class Host{final Fixture f;Host(Fixture f){this.f=f;}boolean holdsActivity(){return IslandPanelInteraction.holds(f.owner);}
boolean managesNativeScenes(){return true;}boolean showDownload(Object n,Object icon,String app,java.util.function.BiConsumer<Object,Object> action){return true;}
boolean showNotice(StatusBarNotification n,String a,String b,String c,Object i,java.util.function.BiConsumer<Object,Object> action,java.util.function.Consumer<Object> snooze){return true;}
boolean show(Object...a){return true;}}
static class State{
boolean enabled=true,screenOff,holdingArtwork,charging,playing;int ownerUser=0,activity=IslandActivityPolicy.NOTICE,battery;long noticeUntil=6000,artworkMissingSince=-1;
StatusBarNotification notice=new StatusBarNotification();MediaController media;IslandDownloadPolicy.Entry<StatusBarNotification> download;Downloads downloads=new Downloads();Host nativeHost;Power power=new Power();
IslandActivityPolicy.ChargingActivity chargeActivity=new IslandActivityPolicy.ChargingActivity();Map<Object,IslandActivityPolicy.MediaActivity> mediaActivities=new HashMap<>();
String title="",subtitle="";Object icon;Handler MAIN=new Handler(Looper.getMainLooper());Runnable tick=()->{};int hides;
State(Fixture f){nativeHost=new Host(f);}boolean locked(){return false;}int currentUser(){return 0;}boolean option(String k){return true;}
MediaController selectMedia(){return null;}boolean sameSession(MediaController a,MediaController b){return a==b;}boolean hostVisible(){return true;}
void clearNotice(){notice=null;}void hide(){hides++;}void dismiss(){}void updateContent(){}void diagnostic(String s){}String appLabel(String p){return p;}
void downloadAction(Object a,Object b){}void noticeAction(Object a,Object b){}void snoozeNotice(Object a){}
long earlier(long a,long b){return a==0?b:Math.min(a,b);}
// REFRESH
}
public static void main(String[] args)throws Throwable{
IslandPanelInteraction.install(module);
Fixture f=new Fixture();f.bind(true);State state=new State(f);
Handler.advance(6000);state.refreshState();check(state.notice!=null&&state.hides==0,"six-second notification cannot withdraw an expanded panel");
Handler.advance(1999);check(f.manager.mDynamicAnimation.closes==0,"eight-second idle deadline has not arrived");
Handler.advance(1);check(f.manager.mDynamicAnimation.closes==1,"one OEM close at eight seconds");state.refreshState();
check(state.notice!=null,"expired source retained through close animation");f.end();state.refreshState();check(state.notice==null&&state.hides==1,"expired notification exits after native close completes");

f=new Fixture();f.manager.mDynamicPanelShowing=false;f.bind(true);state=new State(f);Handler.advance(6000);state.refreshState();
check(state.notice==null,"compact notification keeps its six-second expiry");f.end();
f=new Fixture();f.button();f.bind(true);state=new State(f);Handler.advance(7900);f.event(0,30,30);Handler.advance(12000);state.refreshState();
check(state.notice!=null&&f.manager.mDynamicAnimation.closes==0,"holding a button suspends both expiry paths");
f.event(1,30,30);check(f.panel.ups==1&&f.panel.cancels==0,"button receives its original UP");Handler.advance(7999);
check(f.manager.mDynamicAnimation.closes==0,"idle timer restarts on release");Handler.advance(1);check(f.manager.mDynamicAnimation.closes==1,"released button gets full idle period");f.end();

f=new Fixture();f.bind(true);f.tap(150,100);check(f.manager.mDynamicAnimation.closes==1&&f.panel.cancels==1&&f.panel.ups==0,"blank tap cancels recipient then uses OEM close");
Handler.advance(9000);check(f.manager.mDynamicAnimation.closes==1,"blank tap leaves no second timer close");f.end();
for(int scenario=0;scenario<4;scenario++){
 f=new Fixture();f.bind(true);f.event(0,150,100);
 if(scenario==0)f.event(2,190,100);
 if(scenario==1){MotionEvent multi=new MotionEvent(5,150,100,SystemClock.now);multi.pointers=2;module.send(f.panel,multi);}
 if(scenario==2){f.event(3,150,100);}
 if(scenario==3)Handler.advance(600);
 f.event(1,150,100);check(f.manager.mDynamicAnimation.closes==0,"drag/multi/cancel/long press never means blank tap: "+scenario);f.end();
}
f=new Fixture();View b=f.button();b.matrix.scale=2;f.bind(false);f.tap(120,30);
check(f.manager.mDynamicAnimation.closes==0&&f.panel.ups==1,"scaled button hit keeps original dispatch");
f.panel.scrollX=15;f.tap(10,30);check(f.manager.mDynamicAnimation.closes==0,"scroll offset respected");f.end();
f=new Fixture();f.panel.delegate=new Object();f.bind(false);f.tap(150,100);check(f.manager.mDynamicAnimation.closes==0,"touch delegate region is protected");f.end();
f=new Fixture();View slider=new android.widget.AbsSeekBar();f.panel.children.add(slider);f.bind(false);f.tap(50,50);
check(f.manager.mDynamicAnimation.closes==0,"nonclickable seek bar protected");f.end();
f=new Fixture();f.bind(false);Handler.advance(20000);check(f.manager.mDynamicAnimation.closes==0,"original scenes receive no added timeout");f.tap(150,100);
check(f.manager.mDynamicAnimation.closes==1,"original scene blank tap uses same native close");f.end();
f=new Fixture();f.manager=new Fullscreen();f.bind(true);f.tap(150,100);
check(((Fullscreen)f.manager).hides==1&&f.manager.mDynamicAnimation.closes==0,"fullscreen uses hidePanelIsland, not ordinary animation");f.end();
f=new Fixture();f.bind(true);f.manager.current=new Object();Handler.advance(8000);
check(f.manager.mDynamicAnimation.closes==0&&!IslandPanelInteraction.holds(f.owner),"stale timer cannot close another selected scene");f.end();
f=new Fixture();f.bind(true);Handler.advance(7000);f.bind(true);Handler.advance(1000);
check(f.manager.mDynamicAnimation.closes==1,"rebind/content updates do not renew idle lease");f.end();
f=new Fixture();f.bind(true);Handler.advance(7000);IslandPanelInteraction.activity(f.owner);Handler.advance(1000);
check(f.manager.mDynamicAnimation.closes==0,"explicit control action renews the same timer");f.end();Handler.advance(8000);
check(f.manager.mDynamicAnimation.closes==0,"detach cancels old timer");
f=new Fixture();f.bind(true);Handler.advance(7000);f.panel.detach();check(!IslandPanelInteraction.holds(f.owner),"reparent gap releases notification lease");
f.panel.attached=true;f.panel.getViewTreeObserver().draw();f.bind(true);Handler.advance(1000);
check(f.manager.mDynamicAnimation.closes==0&&IslandPanelInteraction.holds(f.owner),"reparented panel can reacquire a fresh lease");f.end();
ViewGroup unknown=new ViewGroup();Missing missing=new Missing();Object owner=new Object();IslandPanelInteraction.bind(owner,missing,missing.current,unknown,true,null);
check(!IslandPanelInteraction.holds(owner),"missing close capability does not retain notification");module.send(unknown,new MotionEvent(0,5,5,0));module.send(unknown,new MotionEvent(1,5,5,40));
check(unknown.ups==1&&unknown.cancels==0,"missing close capability keeps native touch behavior");
Wrong wrong=new Wrong();IslandPanelInteraction.bind(owner,wrong,wrong.current,unknown,true,null);check(!IslandPanelInteraction.holds(owner),"wrong state field type rejected");
System.out.println("PASS island panel interaction: "+checks+" checks (production dispatch/lifetime + notification arbitration; no device acceptance)");
}}
'''
source = (SRC / 'hook/DynamicIslandHook.java').read_text('utf-8')
FILES['ls/augment/com/hook/PanelInteractionTest.java'] = HARNESS.replace('// REFRESH', member(source, 'void refreshState('))

with tempfile.TemporaryDirectory(prefix='duo-panel-interaction-') as folder:
    folder = Path(folder)
    paths = []
    for name, source in FILES.items():
        path = folder / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, 'utf-8')
        paths.append(path)
    compile_cmd = [JDK / 'javac', '-encoding', 'UTF-8', '-d', folder, *paths]
    run_cmd = [JDK / 'java', '-cp', folder, 'ls.augment.com.hook.PanelInteractionTest']
    subprocess.run(compile_cmd, check=True)
    subprocess.run(run_cmd, check=True)
    for name, old, new, expected in [
        ('PanelInteractionTest', 'if(now>=noticeUntil&&!noticePanel)', 'if(now>=noticeUntil)', 'six-second notification cannot withdraw'),
        ('IslandPanelInteraction', 'touching=true;MAIN.removeCallbacks(timeout);', 'touching=false;', 'holding a button suspends both expiry paths'),
        ('IslandPanelInteraction', 'binding.dismiss();', '', 'blank tap cancels recipient then uses OEM close'),
    ]:
        path = folder / f'ls/augment/com/hook/{name}.java'
        original = path.read_text('utf-8')
        assert old in original
        path.write_text(original.replace(old, new, 1), 'utf-8')
        subprocess.run(compile_cmd, check=True, capture_output=True)
        result = subprocess.run(run_cmd, capture_output=True, text=True)
        assert result.returncode and expected in result.stderr, result.stderr
        path.write_text(original, 'utf-8')
        print('PASS rejected regression:', expected)
