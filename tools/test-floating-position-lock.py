"""Exercise production overlay gesture handling without phone operations."""
import os
from pathlib import Path
import subprocess
import tempfile
ROOT=Path(__file__).resolve().parents[1]
S={
'android/content/Context.java':'''package android.content;public class Context {public final SharedPreferences prefs=new SharedPreferences();public SharedPreferences getSharedPreferences(String n,int m){return prefs;}}''',
'android/content/SharedPreferences.java':'''package android.content;import java.util.*;public class SharedPreferences {public Map<String,Boolean> data=new HashMap<>();public boolean getBoolean(String k,boolean d){return data.getOrDefault(k,d);}public Editor edit(){return new Editor();}public class Editor {String key;boolean value;public Editor putBoolean(String k,boolean v){key=k;value=v;return this;}public boolean commit(){data.put(key,value);return true;}}}''',
'android/os/Looper.java':'''package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}''',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler {static final List<Runnable> queued=new ArrayList<>();public Handler(Looper l){}public void postDelayed(Runnable r,long t){queued.add(r);}public void removeCallbacks(Runnable r){queued.removeIf(v->v==r);}public static void fire(){List<Runnable> copy=new ArrayList<>(queued);queued.clear();for(Runnable r:copy)r.run();}}''',
'android/view/MotionEvent.java':'''package android.view;public class MotionEvent {public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;public int action;public float x,y;public MotionEvent(int a,float x,float y){action=a;this.x=x;this.y=y;}public static MotionEvent obtain(MotionEvent e){return new MotionEvent(e.action,e.x,e.y);}public int getActionMasked(){return action;}public float getRawX(){return x;}public float getRawY(){return y;}public void setAction(int a){action=a;}public void recycle(){}}''',
'android/view/View.java':'''package android.view;import android.content.*;import java.util.*;public class View {public Context context=new Context();public List<Integer> events=new ArrayList<>();public OnAttachStateChangeListener listener;public boolean attached=true;public Context getContext(){return context;}public boolean isAttachedToWindow(){return attached;}public void performHapticFeedback(int v){}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listener=l;}public boolean dispatchTouchEvent(MotionEvent e){events.add(e.action);return true;}public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}}''',
'android/view/ViewGroup.java':'''package android.view;public class ViewGroup extends View {public boolean dispatchTouchEvent(MotionEvent e){return super.dispatchTouchEvent(e);}}''',
'android/view/ViewConfiguration.java':'''package android.view;public class ViewConfiguration {public static int getLongPressTimeout(){return 500;}public static ViewConfiguration get(android.content.Context c){return new ViewConfiguration();}public int getScaledTouchSlop(){return 8;}}''',
'android/view/HapticFeedbackConstants.java':'package android.view;public class HapticFeedbackConstants {public static final int LONG_PRESS=1;}',
'android/widget/Toast.java':'''package android.widget;public class Toast {public static final int LENGTH_SHORT=0;public static Toast makeText(android.content.Context c,String s,int t){return new Toast();}public void show(){}}''',
'ls/augment/com/GameOptions.java':'''package ls.augment.com;public class GameOptions {public static final String MONITOR_PIN="monitorPin",PERFORMANCE_MONITOR="monitor",SHOULDER_PIN="shoulderPin",QUICK_SWITCH="shoulder";}''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;public class FeatureSettings {static boolean on=true;static boolean enabled(android.content.Context c,String key){return on;}static void diagnostic(android.content.Context c,String k,String v){}}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;public class AugmentModule {public interface Chain {Object getThisObject();Object getArg(int i);Object proceed()throws Throwable;}public interface Hook {Object run(Chain c)throws Throwable;}Map<Method,Hook> hooks=new HashMap<>();Builder prepareFeatureHook(Method m,String k,boolean b){return new Builder(m);}void registerFeatureHook(Builder b){hooks.put(b.method,b.hook);}void logFeatureError(String s,Throwable e){throw new AssertionError(s,e);}class Builder {Method method;Hook hook;Builder(Method m){method=m;}Builder intercept(Hook h){hook=h;return this;}}}''',
'cn/nubia/tgk/widget/TgkCaseShowView.java':'package cn.nubia.tgk.widget;public class TgkCaseShowView extends android.view.ViewGroup {}',
'ls/augment/com/hook/TestPin.java':'''package ls.augment.com.hook;import android.view.*;import android.os.Handler;import ls.augment.com.GameOptions;
public class TestPin {static int checks;static AugmentModule module=new AugmentModule();static void check(boolean ok,String m){checks++;if(!ok)throw new AssertionError(m);}
static void send(View view,int action,float x)throws Throwable {MotionEvent e=new MotionEvent(action,x,10);module.hooks.get(ViewGroup.class.getDeclaredMethod("dispatchTouchEvent",MotionEvent.class)).run(new AugmentModule.Chain(){public Object getThisObject(){return view;}public Object getArg(int i){return e;}public Object proceed(){return view.dispatchTouchEvent(e);}});check(e.action==action,"original event unchanged");}
static void exercise(View view,String key)throws Throwable {
send(view,0,10);Handler.fire();check(view.context.prefs.getBoolean(key,false),"long press fixes position");check(view.events.equals(java.util.Arrays.asList(0,3)),"one native cancel, no synthetic click/up");
send(view,2,100);send(view,1,100);check(view.events.size()==2,"fixed drag cannot reach OEM");
send(view,0,10);send(view,1,10);check(view.events.get(view.events.size()-1)==1,"short tap remains native while fixed");
send(view,0,10);Handler.fire();check(!view.context.prefs.getBoolean(key,true),"second long press unlocks");send(view,1,10);
send(view,0,10);send(view,2,100);Handler.fire();check(!view.context.prefs.getBoolean(key,true),"drag cancels long press");send(view,1,100);
send(view,0,10);view.attached=false;view.listener.onViewDetachedFromWindow(view);Handler.fire();check(!view.context.prefs.getBoolean(key,true),"detach cancels timer");view.attached=true;
FeatureSettings.on=false;send(view,0,10);Handler.fire();send(view,2,100);send(view,1,100);check(!view.context.prefs.getBoolean(key,true),"disabled leaves native gestures");FeatureSettings.on=true;
}
public static void main(String[] args)throws Throwable {FloatingPositionLock.install(module);FloatingPositionLock.install(module);check(module.hooks.size()==2,"one registration per dispatch implementation");ViewGroup monitor=new ViewGroup();FloatingPositionLock.monitor(monitor);exercise(monitor,GameOptions.MONITOR_PIN);exercise(new cn.nubia.tgk.widget.TgkCaseShowView(),GameOptions.SHOULDER_PIN);ViewGroup unrelated=new ViewGroup();send(unrelated,0,10);Handler.fire();send(unrelated,1,10);check(unrelated.events.equals(java.util.Arrays.asList(0,1)),"unrelated views remain native");System.out.println("Floating position lock: "+checks+" production gesture assertions passed");}}
'''
}
with tempfile.TemporaryDirectory(prefix='duo-pin-') as directory:
    base=Path(directory);files=[]
    for name,text in S.items():
        p=base/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8');files.append(str(p))
    files.append(str(ROOT/'android/app/src/main/java/ls/augment/com/hook/FloatingPositionLock.java'))
    jdk=Path(os.environ['JAVA_HOME'])/'bin';ext='.exe' if os.name=='nt' else ''
    subprocess.run([str(jdk/('javac'+ext)),'-encoding','UTF-8','-d',directory,*files],check=True)
    subprocess.run([str(jdk/('java'+ext)),'-cp',directory,'ls.augment.com.hook.TestPin'],check=True)
