"""Execute the real opt-in trace/adapter with deterministic native-shaped callbacks. No phone/Gradle.
Android transport is doubled; focused javac separately checks actual API signatures. These tests do
not claim that a ROM received injected input or that a bitmap reached the screen.
"""
from pathlib import Path
import argparse, importlib.util, os, subprocess, tempfile, json
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
spec=importlib.util.spec_from_file_location('drawing',ROOT/'tools/test-back-gesture-runtime.py')
drawing=importlib.util.module_from_spec(spec);spec.loader.exec_module(drawing)
STUBS=dict(drawing.files)
for key in ['ls/augment/com/hook/TestBackGestureRuntime.java','com/zte/feature/fullscreen_gesture/SeaWaveView.java']:
    STUBS.pop(key,None)
STUBS.update({
'io/github/libxposed/api/XposedInterface.java':'''package io.github.libxposed.api;public interface XposedInterface{int PRIORITY_LOWEST=-10000;enum ExceptionMode{PROTECTIVE}interface HookHandle{void unhook();}interface Chain{Object getThisObject();Object getArg(int i);Object proceed()throws Throwable;}interface Hooker{Object intercept(Chain c)throws Throwable;}interface HookBuilder{HookBuilder setId(String id);HookBuilder setPriority(int p);HookBuilder setExceptionMode(ExceptionMode mode);HookHandle intercept(Hooker h);}}''',
'android/content/Intent.java':'''package android.content;public class Intent {public final java.util.Map<String,Object> v=new java.util.HashMap<>();String action;public Intent(String a){action=a;}public String getAction(){return action;}public Intent putExtra(String k,Object x){v.put(k,x);return this;}public String getStringExtra(String k){return (String)v.get(k);}public long getLongExtra(String k,long d){return v.containsKey(k)?((Number)v.get(k)).longValue():d;}public int getIntExtra(String k,int d){return v.containsKey(k)?((Number)v.get(k)).intValue():d;}public float getFloatExtra(String k,float d){return v.containsKey(k)?((Number)v.get(k)).floatValue():d;}}''',
'android/content/IntentFilter.java':'''package android.content;public class IntentFilter{public IntentFilter(String a){}}''',
'android/content/BroadcastReceiver.java':'''package android.content;public abstract class BroadcastReceiver{public int uid=10042;public String pkg="ls.augment.com";public int getSentFromUid(){return uid;}public String getSentFromPackage(){return pkg;}public abstract void onReceive(Context c,Intent i);}''',
'android/content/pm/PackageManager.java':'''package android.content.pm;public class PackageManager{public int getPackageUid(String name,int flags){return 10042;}}''',
'android/content/Context.java':'''package android.content;public class Context{public static final int RECEIVER_EXPORTED=2;public BroadcastReceiver receiver;public boolean failRegistration;public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return new ContentResolver();}public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,String p,android.os.Handler h,int flags){if(failRegistration)throw new IllegalStateException();receiver=r;return null;}}''',
'android/os/SystemClock.java':'''package android.os;public class SystemClock{public static long now=1000;public static long uptimeMillis(){return now;}public static long elapsedRealtime(){return now;}}''',
'android/os/Handler.java':'''package android.os;public class Handler{public static final java.util.List<Runnable> posted=new java.util.ArrayList<>(),delayed=new java.util.ArrayList<>();public Handler(Looper l){}public boolean post(Runnable r){posted.add(r);return true;}public boolean postDelayed(Runnable r,long d){delayed.add(r);return true;}public static void drain(){while(!posted.isEmpty()){java.util.List<Runnable> q=new java.util.ArrayList<>(posted);posted.clear();for(Runnable r:q)r.run();}}}''',
'android/view/View.java':'''package android.view;public class View{public static final int VISIBLE=0;public int getVisibility(){return 0;}public boolean isShown(){return true;}public android.content.Context getContext(){return new android.content.Context();}public int getWidth(){return 1216;}public int getHeight(){return 2688;}}''',
'android/view/MotionEvent.java':'''package android.view;public class MotionEvent{public static final int ACTION_DOWN=0,ACTION_MOVE=2,ACTION_CANCEL=3;public final int a,h;public final long d,t;public final float x,y;public MotionEvent(int a,long d,long t,float x,float y,int h){this.a=a;this.d=d;this.t=t;this.x=x;this.y=y;this.h=h;}public int getActionMasked(){return a;}public long getDownTime(){return d;}public long getEventTime(){return t;}public float getRawX(){return x;}public float getRawY(){return y;}public int getHistorySize(){return h;}}''',
'ls/augment/com/hook/BackGestureIconHook.java':'''package ls.augment.com.hook;final class BackGestureIconHook{static boolean current=true;static boolean probeCurrent(long r,long g){return current&&r==73&&g==8;}}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.*;
public class AugmentModule{public static AugmentModule active;int failAt=-1,built,removed,errors;final Map<Method,List<Hooker>> hooks=new HashMap<>();
class Chain implements io.github.libxposed.api.XposedInterface.Chain{Object target;Method method;Object[] args;int index;List<Hooker> callbacks;
Chain(Object t,Method m,Object[] a){target=t;method=m;args=a;callbacks=hooks.getOrDefault(m,Collections.emptyList());}public Object getThisObject(){return target;}public Object getArg(int i){return args[i];}
public Object proceed()throws Throwable{if(index<callbacks.size())return callbacks.get(index++).intercept(this);try{return method.invoke(target,args);}catch(InvocationTargetException e){throw e.getCause();}}}
class Builder implements HookBuilder{Method m;Builder(Method m){this.m=m;}public HookBuilder setId(String s){return this;}public HookBuilder setPriority(int p){return this;}public HookBuilder setExceptionMode(ExceptionMode m){return this;}public HookHandle intercept(Hooker i){if(++built==failAt)throw new IllegalStateException("install");hooks.computeIfAbsent(m,k->new ArrayList<>()).add(i);return ()->{hooks.get(m).remove(i);removed++;};}}
HookBuilder hook(Method m){return new Builder(m);}void registerFeatureHook(HookHandle h){}void deoptimize(Method m){}void logFeatureError(String s,Throwable t){errors++;}
public static Object call(Object target,String name,Class<?>[] p,Object...a)throws Throwable{Method m=target.getClass().getDeclaredMethod(name,p);return active.new Chain(target,m,a).proceed();}
public static void icon(boolean custom){BackGestureProbeHook.iconReturned(custom);}}
''',
'com/zte/feature/fullscreen_gesture/GestureController.java':'''package com.zte.feature.fullscreen_gesture;import android.view.MotionEvent;import ls.augment.com.hook.AugmentModule;
public class GestureController{public int mSwipeStatus=8,mDragDirection=0;public boolean mIsGestureAnimationEnabled=true,without,failCancel;public final SeaWaveView wave=new SeaWaveView();public int received;
public void onPointerEvent(MotionEvent e)throws Throwable{received++;AugmentModule.call(this,without?"processPointerEventWithoutAnimating":"processPointerEvent",new Class[]{MotionEvent.class},e);}
public void processPointerEventWithoutAnimating(MotionEvent e){}
public void processPointerEvent(MotionEvent e)throws Throwable{if(e.a==0){mSwipeStatus=8;}
if(e.a==2){if(mSwipeStatus==8){mSwipeStatus=2;AugmentModule.call(wave,"onActionDown",new Class[]{float.class,float.class,float.class},e.y,0f,-1f);}AugmentModule.call(wave,"onActionMove",new Class[]{float.class},e.x-1);}
if(e.a==3){mSwipeStatus=4;wave.mReadyState=SeaWaveView.Ready.NONE;if(failCancel)throw new IllegalStateException("native cancel");}}}''',
'com/zte/feature/fullscreen_gesture/SeaWaveView.java':'''package com.zte.feature.fullscreen_gesture;import android.graphics.*;import ls.augment.com.hook.AugmentModule;
public class SeaWaveView extends android.view.View{public enum Ready{NONE,FIRST,SECOND}public int mCount,mPosition;public float mScale;public Ready mReadyState=Ready.NONE;public Rect mIconRect=new Rect();public Paint mIconPaint=new Paint();public boolean mIconNeedDraw,mIconShown,mIsHover,custom=true;public int nativeDrawCalls;
public void onActionDown(float a,float b,float c){mScale=0;}
public void onActionMove(float offset){mReadyState=Ready.FIRST;if(mCount<1){mCount++;return;}mScale=offset/20;mCount=0;}
public void onDraw(Canvas c){}public void drawWave(Canvas c){}public void drawIcon(Canvas c){nativeDrawCalls++;if(mScale<=.1)return;mIconNeedDraw=true;mIconShown=true;mIconRect.set(0,100,52,152);AugmentModule.icon(custom);}}
''',
})
TEST=r'''
package ls.augment.com.hook;
import android.content.*;import android.os.*;import android.view.*;import android.graphics.*;import ls.augment.com.*;import com.zte.feature.fullscreen_gesture.*;
public class TestProbe {
 static int checks;static Context context;static String nonce="0123456789abcdef0123456789abcdef";
 static void check(boolean x,String m){checks++;if(!x)throw new AssertionError(m);}
 static Object get(String n)throws Exception{var f=BackGestureProbeHook.class.getDeclaredField(n);f.setAccessible(true);return f.get(null);}
 static void set(String n,Object v)throws Exception{var f=BackGestureProbeHook.class.getDeclaredField(n);f.setAccessible(true);f.set(null,v);}
 static Intent arm(String n){return new Intent(BackGestureProbeTrace.ACTION).putExtra("command","arm").putExtra("nonce",n).putExtra("side",0).putExtra("startX",1f).putExtra("startY",500f).putExtra("pid",1234).putExtra("build",20454).putExtra("processStarted",100L).putExtra("revision",73L).putExtra("generation",8L);}
 static BackGestureProbeTrace arm()throws Exception{context.receiver.onReceive(context,arm(nonce));return (BackGestureProbeTrace)get("armed");}
 static void input(GestureController c,int a,long down,long time,int history)throws Throwable{SystemClock.now=time;AugmentModule.call(c,"onPointerEvent",new Class[]{MotionEvent.class},new MotionEvent(a,down,time,a==0?1:200,500,history));}
 static void draw(GestureController c,long time)throws Throwable{SystemClock.now=time;AugmentModule.call(c.wave,"onDraw",new Class[]{Canvas.class},new Canvas());AugmentModule.call(c.wave,"drawWave",new Class[]{Canvas.class},new Canvas());AugmentModule.call(c.wave,"drawIcon",new Class[]{Canvas.class},new Canvas());}
 static void install()throws Exception{AugmentModule.active=new AugmentModule();BackGestureProbeHook.install(AugmentModule.active,TestProbe.class.getClassLoader());check((Boolean)get("installed"),"all native contracts installed");context=new Context();BackGestureProbeHook.attach(context);check(context.receiver!=null,"receiver registered after installation");}
 static void identity()throws Exception{
  check(!BackGestureProbeTrace.authorized(-1,10042,"ls.augment.com"),"hidden sender rejected");
  for(int uid:new int[]{-1,1000,2000,10043}){context.receiver.uid=uid;context.receiver.onReceive(context,arm(nonce));check(get("armed")==null,"untrusted uid rejected "+uid);}
  context.receiver.uid=10042;context.receiver.pkg="ls.augment.com.test";context.receiver.onReceive(context,arm(nonce));check(get("armed")==null,"wrong source package rejected");context.receiver.pkg="ls.augment.com";
  for(String key:new String[]{"pid","build","processStarted","revision","generation","side"}){Intent bad=arm(nonce).putExtra(key,-1);context.receiver.onReceive(context,bad);check(get("armed")==null,"identity/side rejects "+key);}
  context.receiver.onReceive(context,arm("invalid"));check(get("armed")==null,"invalid nonce rejected");
 }
 static void observed()throws Throwable{
  SystemClock.now=1000;BackGestureProbeTrace trace=arm();check(trace!=null,"valid module ARM");check(FeatureSettings.diagnostics.containsKey(BackGestureProbeTrace.KEY+"_arm"),"ACK before DOWN");FeatureSettings.diagnostics.clear();
  GestureController c=new GestureController();input(c,0,1100,1100,0);
  for(int i=1;i<=8;i++)input(c,2,1100,1100+i*7,i==3?2:0);
  check(trace.eventCount==9&&trace.moveCount==8&&trace.waveDownCount==1,"real callbacks recorded, not input queue assumptions");
  check(trace.moves[0][2]==0&&trace.moves[0][3]==1&&trace.moves[1][2]==1&&trace.moves[1][3]==0,"native every-other MOVE mCount retained");
  check(trace.events[3][3]==2&&trace.events[3][8]==1,"history and process route distinguish batching");
  check(trace.lastMoveReceived==1156,"last native receipt monotonic time");
  boolean heldRejected=false;try{trace.json(0);}catch(IllegalStateException e){heldRejected=true;}check(heldRejected,"cannot format held trace");
  draw(c,1280);draw(c,1400);check(trace.iconGetCount==2&&trace.customReturnCount==2&&trace.waveDrawCount==2&&trace.onDrawCount==2,"actual draw and selected icon counted");
  check(trace.selectedIcon[0]==180&&trace.selectedIcon[3]==52,"actual selected alpha/rect observed at return point");
  check(trace.draws[1][0]==300&&trace.draws[1][2]==1&&trace.draws[1][4]==180,"actual post-draw geometry/state logged");
  check(Handler.posted.isEmpty(),"no publication runnable queued while held");Handler.drain();check(FeatureSettings.diagnostics.isEmpty(),"no new publication while held");
  input(c,3,1100,1440,0);check(trace.closed&&trace.cancelReturned==1440,"native CANCEL completion seals trace");
  check(FeatureSettings.diagnostics.isEmpty(),"completion only queued, native callback performs no publication");
  Handler.drain();check(FeatureSettings.diagnostics.size()==7,"seven nonce-labelled bounded parts published after cancel");
  for(String v:FeatureSettings.diagnostics.values())check(v.length()<=2000&&v.contains(nonce)&&v.contains("\"downTime\":1100"),"provider parts fit and correlate");
  check(trace.settledBefore(1276,120)&&!trace.settledBefore(1275,120),"actual MOVE receipt defines 120ms boundary");
  check(c.received==10&&c.mSwipeStatus==4&&c.wave.nativeDrawCalls==2,"native event and draw behavior preserved");
  int before=trace.drawCount;draw(c,1470);check(trace.drawCount==before,"cancel animation excluded from held record");
 }
 static void stale()throws Throwable{
  SystemClock.now=2000;FeatureSettings.diagnostics.clear();BackGestureProbeTrace t=arm();FeatureSettings.diagnostics.clear();GestureController c=new GestureController();
  input(c,0,1900,2010,0);check(t.downTime==0,"queued DOWN predating ARM rejected");input(c,0,2020,2020,0);
  GestureController other=new GestureController();input(other,2,2020,2027,0);input(c,2,2021,2028,0);check(t.eventCount==1,"different controller or downTime cannot join");
  context.receiver.onReceive(context,arm("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"));check(get("armed")==t,"cannot rearm an active finger");
  input(c,2,2020,2034,0);input(c,3,2020,2040,0);
  context.receiver.onReceive(context,new Intent(BackGestureProbeTrace.ACTION).putExtra("command","disarm").putExtra("nonce","bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"));check(get("armed")==t,"foreign DISARM nonce ignored");
  context.receiver.onReceive(context,new Intent(BackGestureProbeTrace.ACTION).putExtra("command","disarm").putExtra("nonce",nonce));Handler.drain();check(get("armed")==null&&FeatureSettings.diagnostics.isEmpty(),"DISARM cancels queued completion and view reference");
  SystemClock.now=3000;t=arm();FeatureSettings.diagnostics.clear();input(c,0,3010,3010,0);for(Runnable r:new java.util.ArrayList<>(Handler.delayed))r.run();Handler.delayed.clear();Handler.drain();check(t.expired&&get("armed")==null&&FeatureSettings.diagnostics.isEmpty(),"timeout releases memory without publishing an unacknowledged held finger");
 }
 static void noWave()throws Throwable{
  SystemClock.now=5000;BackGestureProbeTrace t=arm();FeatureSettings.diagnostics.clear();GestureController c=new GestureController();c.without=true;input(c,0,5010,5010,0);input(c,2,5010,5020,0);input(c,3,5010,5030,0);Handler.drain();
  check(t.events[1][8]==0&&t.events[1][9]==1&&t.moveCount==0&&t.drawCount==0,"continuous no-animation path remains distinguishable from no received input");
  check(t.eventCount==3&&t.phase.equals("cancelled"),"no-wave trace can still prove actual CANCEL");
 }
 static void cancelFailureAndIdle()throws Throwable{
  SystemClock.now=5500;BackGestureProbeTrace t=arm();FeatureSettings.diagnostics.clear();GestureController c=new GestureController();c.failCancel=true;
  input(c,0,5510,5510,0);input(c,2,5510,5517,0);boolean propagated=false;
  try{input(c,3,5510,5520,0);}catch(IllegalStateException expected){propagated=true;}
  check(propagated&&t.errors==1&&t.phase.equals("native_error"),"native CANCEL exception propagates and never certifies success");
  check(get("trackedView")==null,"actual terminal callback releases the View reference immediately");Handler.drain();
  check(FeatureSettings.diagnostics.get(BackGestureProbeTrace.KEY).contains("native_error"),"cancel error is explicitly labelled after completion");
  SystemClock.now=5600;t=arm();FeatureSettings.diagnostics.clear();c=new GestureController();input(c,0,5610,5610,0);input(c,1,5610,5620,0);Handler.drain();
  check(t.phase.equals("up_not_cancel")&&FeatureSettings.diagnostics.isEmpty(),"unexpected UP cannot publish a CANCEL observation");
  context.receiver.onReceive(context,new Intent(BackGestureProbeTrace.ACTION).putExtra("command","disarm").putExtra("nonce",nonce));
  int oldEvents=t.eventCount;input(c,0,5630,5630,0);input(c,2,5630,5637,0);draw(c,5640);input(c,3,5630,5650,0);Handler.drain();
  check(t.eventCount==oldEvents&&FeatureSettings.diagnostics.isEmpty(),"unarmed native events neither accumulate nor publish");
 }
 static void bounded()throws Exception{
  BackGestureProbeTrace t=new BackGestureProbeTrace(nonce,73,8,1234,20454,100,0,6000,1,500);check(!t.begin(1,6001,6001,6001,4,500),"wrong edge start rejected");check(t.begin(1,6001,6001,6001,1,500),"bounded model begin");
  for(int i=0;i<100;i++){t.input(2,6002+i,6002+i,0,2,0,true);t.move(6002+i,200,0,1,3,1);t.draw(6002+i,3,1,0,255,0,100,52,152,1216,2688,7);}
  check(t.eventCount==100&&t.moveCount==100&&t.drawCount==100&&t.overflow==176,"fixed buffers signal every dropped observation");t.returned(-1,4,6300,3);
  for(int p=0;p<=BackGestureProbeTrace.PARTS;p++)check(t.json(p).length()<=2000,"full bounded serialization part "+p);
  for(int fps:new int[]{144,240}){
   BackGestureProbeTrace rate=new BackGestureProbeTrace(nonce,73,8,1234,20454,100,0,7000,1,500);rate.begin(1,7001,7001,7001,1,500);
   for(int i=0;i<350*fps/1000;i++)rate.draw(7001+Math.round(i*1000f/fps),3,1,0,255,0,100,52,152,1216,2688,7);
   check(rate.overflow==0&&rate.draws[rate.drawCount-1][0]>=340,"high refresh retains second-sample draw at "+fps);
   rate.returned(-1,4,7350,3);for(int p=0;p<=BackGestureProbeTrace.PARTS;p++)check(rate.json(p).length()<=2000,"high refresh parts fit "+fps+"/"+p);
  }
 }
 static void rollback()throws Exception{
  set("installed",false);set("receiver",null);set("armed",null);set("trackedView",null);AugmentModule bad=new AugmentModule();bad.failAt=4;
  BackGestureProbeHook.install(bad,TestProbe.class.getClassLoader());check(!(Boolean)get("installed")&&bad.removed==3,"partial diagnostic installation unhooks all own callbacks");
  BackGestureProbeHook.attach(new Context());check(get("receiver")==null,"unavailable adapter never registers receiver");
  AugmentModule.active=new AugmentModule();BackGestureProbeHook.install(AugmentModule.active,TestProbe.class.getClassLoader());Context blocked=new Context();blocked.failRegistration=true;BackGestureProbeHook.attach(blocked);check(get("receiver")==null&&get("context")==null,"receiver registration error is diagnostic unavailable");
 }
 public static void main(String[]a)throws Throwable{install();identity();observed();stale();noWave();cancelFailureAndIdle();bounded();rollback();System.out.println("Back gesture diagnostic assertions: "+checks);}
}
'''

def run(overrides=None,negative=False):
    files=dict(STUBS)
    for name in ('BackGestureProbeTrace.java','hook/BackGestureProbeHook.java'):
        files['ls/augment/com/'+name]=(overrides or {}).get(name,(SRC/name).read_text(encoding='utf-8'))
    files['ls/augment/com/hook/TestProbe.java']=TEST
    with tempfile.TemporaryDirectory(prefix='duo-gesture-probe-') as directory:
        source=[]
        for name,text in files.items():
            file=Path(directory)/name;file.parent.mkdir(parents=True,exist_ok=True);file.write_text(text,encoding='utf-8');source.append(str(file))
        compiled=subprocess.run([str(JAVA/'javac.exe'),'-J-Duser.language=en','-encoding','UTF-8','-d',directory,*source],capture_output=True,text=True,errors='replace')
        if compiled.returncode:raise AssertionError(compiled.stdout+compiled.stderr)
        result=subprocess.run([str(JAVA/'java.exe'),'-cp',directory,'ls.augment.com.hook.TestProbe'],capture_output=True,text=True,timeout=20)
        if negative:
            if result.returncode==0 or 'AssertionError' not in result.stderr:raise AssertionError(result.stdout+result.stderr)
            return result.stderr.splitlines()[0]
        if result.returncode:raise AssertionError(result.stdout+result.stderr)
        print(result.stdout.strip());return result.stdout.strip()

def mutations():
    trace=(SRC/'BackGestureProbeTrace.java').read_text(encoding='utf-8');hook=(SRC/'hook/BackGestureProbeHook.java').read_text(encoding='utf-8')
    variants=[('accept-hidden-sender','BackGestureProbeTrace.java','sender==moduleUid','true'),
              ('ignore-downTime','BackGestureProbeTrace.java','downTime==down','true'),
              ('accept-pre-arm-down','BackGestureProbeTrace.java','||down<armedAt',''),
              ('format-while-held','BackGestureProbeTrace.java','if(!"armed".equals(phase)&&!closed)','if(false)'),
              ('omit-actual-move-time','BackGestureProbeTrace.java','if(action==2)lastMoveReceived=now;',''),
              ('publish-before-cancel','hook/BackGestureProbeHook.java','if(trace.closed&&trace.cancelReceived>0){BackGestureProbeTrace finished=trace;','if(true){BackGestureProbeTrace finished=trace;'),
              ('stale-publish-after-disarm','hook/BackGestureProbeHook.java','armed!=trace||trace.expired||',''),
              ('skip-native-proceed','hook/BackGestureProbeHook.java','Object result=chain.proceed();completed=true;return result;','completed=true;return null;')]
    results=[]
    for name,file,old,new in variants:
        original=trace if file=='BackGestureProbeTrace.java' else hook
        if old not in original:raise AssertionError('mutation anchor missing '+name)
        results.append(dict(name=name,rejected=run({file:original.replace(old,new,1)},True)))
    return results

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--mutations',action='store_true');parser.add_argument('--output',type=Path);args=parser.parse_args()
    report={'positive':run()}
    if args.mutations:report['mutations']=mutations()
    if args.output:args.output.parent.mkdir(parents=True,exist_ok=True);args.output.write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
