"""Execute production task guards, restoration matrices, gesture gating and recorder dispatch."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
def method(file,signature):
    source=(STEP/file).read_text(encoding='utf-8');start=source.index(signature);opening=source.index('{',start);depth=1;end=opening+1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]
methods='\n'.join(method('NativeWorkspaceGuard.java',sig) for sig in [
    'static boolean ownsTask(', 'static boolean ownsMagnification(', 'static boolean canAdoptPromotion(', 'static boolean isPromotedTask(',
    'static void restore(Object wct, SavedTask r, CommitBarrier group,Object sharedSurface)', 'static void stageMainTransform('])
methods=methods.replace('ActivityManager.RunningTaskInfo','Info')
gate='\n'.join(method('WorkspaceGestureGate.java',sig) for sig in ['static boolean accepts(', 'static boolean deferFor(', 'static void beginGesture(']).replace('ls.augment.com.BuildConfig.VERSION_CODE','123')
recorder=method('WorkspaceRecorder.java','static void finish(Object tile,Request request)')
harness=r'''
package ls.augment.com.step;
import java.util.*;
import java.lang.reflect.*;
public class TestNativeFeedback {
    static int layoutCount=3,layoutInset;
    static boolean mainReflow;
    static int checks,tracked,created;
    static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
    static class Rect {int w=1080,h=2400;Rect(){}Rect(Rect r){w=r.w;h=r.h;}int width(){return w;}int height(){return h;}}
    static class Point {int x=7,y=11;}
    static class Surface {int id=7;}
    static class Spec {float scale,x,y;Spec(float s,float x,float y){scale=s;this.x=x;this.y=y;}}
    static class Parent {Surface surface=new Surface();Spec mLastMagnificationSpec;Object parent=Wm.display;}
    static class Info {int taskId=42,userId,displayId;Object token=new Object(),topActivity=new Object();boolean visible=true;}
    static class Task {int mode=1,type=1;Info info=new Info();Parent parent=new Parent();Object display=Wm.display,root=this;Surface surface=new Surface();Spec mLastMagnificationSpec;}
    static class SubTask extends Task {}
    static class WrongCache {int mLastMagnificationSpec;}
    static class FinalCache {final Spec mLastMagnificationSpec=null;}
    static class StaticCache {static Spec mLastMagnificationSpec;}
    static class SavedTask {int id=42,user,requestedMode=1,layerId=7;boolean dirty=true;Task task=new Task();Object token=task.info.token,parent=task.parent;Rect bounds=new Rect();Point position=new Point();TaskIdentity identity=new TaskIdentity(42,0,0,token);}
    static class Wm {static boolean active=true;static Object display=new Object(),ownedSpec=new Object(),spec=ownedSpec;static Context context=new Context();static Object newSpec(float s,float x,float y){return new Spec(s,x,y);}}
    static class Context {Resources getResources(){return new Resources();}}
    static class Resources {Metrics getDisplayMetrics(){return new Metrics();}}
    static class Metrics {float density=1;}
    static class WorkspaceUsers {static boolean allowed=true;static boolean allows(Context c,int p,int user){return allowed && user==0;}}
    static class StepMembers {
        static int getIntField(Object o,String field){Info t=(Info)o;return switch(field){case "userId"->t.userId;case "displayId"->t.displayId;default->throw new AssertionError(field);};}
        static boolean getBooleanField(Object o,String field){return ((Info)o).visible;}
        static float getFloatField(Object o,String field){Spec s=(Spec)o;return switch(field){case "scale"->s.scale;case "offsetX"->s.x;case "offsetY"->s.y;default->throw new AssertionError(field);};}
        static Field findField(Class<?> c,String n)throws Exception{for(Class<?> t=c;t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(n);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(n);}
    }
    static Object field(Object o,String key){return o instanceof Parent p?p.mLastMagnificationSpec:o==Wm.display?Wm.spec:((Info)o).token;}
    static class Intent {
        Map<String,Object> data=new HashMap<>();Intent put(String k,Object v){data.put(k,v);return this;}
        int getIntExtra(String k,int fallback){return (Integer)data.getOrDefault(k,fallback);}
        Object getParcelableExtra(String k){return data.get(k);}
    }
    static class Tx {List<String> names=new ArrayList<>();Map<String,Object[]> calls=new HashMap<>();}
    static class CommitBarrier {}
    static class NativeTopTask {static SavedTask upper;static SavedTask held(Object task){return upper!=null && upper.task==task?upper:null;}}
    static class NativeFlip {boolean ownsTransforms;SavedTask[] actors=new SavedTask[6];WorkspaceLayout to=new WorkspaceLayout(1080,2400,1,true);boolean moves(SavedTask r){return Arrays.asList(actors).contains(r);}}
    static Map<Integer,SavedTask> saved=new HashMap<>();static SideSlots slots=new SideSlots();
    static boolean active=true,ending,sideLeft;static NativeFlip flip;static Object pendingCommit;static int principal;
    static Rect logical=new Rect();static Task current;static Tx lastTx;
    static Object liveTask(int id,Object token){return current!=null && current.info.taskId==id && current.info.token==token?current:null;}
    static Object surfaceTransaction(){created++;return lastTx=new Tx();}
    static void validSurface(Object o){if(!(o instanceof Surface))throw new IllegalStateException();}
    static void trackCommit(Object t,CommitBarrier group){tracked++;}
    static void report(Object reply,int code,String msg,int id){}
    static Object call(Object target,String name,Object... args){
        if(target instanceof Tx t){t.names.add(name);t.calls.put(name,args);return t;}
        if(target instanceof Surface s && name.equals("getLayerId"))return s.id;
        if(target instanceof Parent p)return name.equals("getParent")?p.parent:p.surface;
        if(target instanceof Task t)return switch(name){
            case "getTaskInfo"->t.info;case "getParent"->t.parent;case "getRootTask"->t.root;
            case "getDisplayContent"->t.display;case "getWindowingMode"->t.mode;case "getActivityType"->t.type;
            case "getSurfaceControl"->t.surface;case "clearMagnificationSpec"->{t.mLastMagnificationSpec=null;yield null;}default->throw new AssertionError(name);};
        throw new AssertionError(name);
    }
    METHODS
    static SavedTask reset(){
        active=true;ending=false;sideLeft=false;flip=null;pendingCommit=null;Wm.active=true;Wm.spec=Wm.ownedSpec;WorkspaceUsers.allowed=true;
        saved.clear();slots.clear();created=tracked=0;NativeTopTask.upper=null;
        SavedTask r=new SavedTask();saved.put(42,r);slots.replace(0,-1,42);current=r.task;return r;
    }
    static Intent request(SavedTask r){return new Intent().put("task",42).put("slot",0).put("token",r.token);}
    static void restoration()throws Exception{
        WorkspaceTransform.requireCache(SubTask.class,Spec.class);checks++;
        for(Class<?> bad:new Class<?>[]{Object.class,WrongCache.class,FinalCache.class,StaticCache.class}){
            try{WorkspaceTransform.requireCache(bad,Spec.class);throw new AssertionError("unknown cache");}catch(NoSuchFieldException expected){checks++;}
        }
        SavedTask r=reset();Tx wct=new Tx();restore(wct,r,new CommitBarrier(),null);
        WorkspaceLayout geometry=new WorkspaceLayout(1080,2400,1,false);
        check(created==1 && tracked==1,"legacy restoration still commits");
        check((Float)lastTx.calls.get("setMatrix")[1]==geometry.mainScale,"restore directly at main scale");
        check((Float)lastTx.calls.get("setPosition")[1]==geometry.mainX+7f,"native offset adds position, without scaling twice");
        check(wct.calls.get("setBoundsChangeTransaction")[1]==lastTx,"legacy deferred transaction retained");
        check(r.task.mLastMagnificationSpec!=null && r.task.mLastMagnificationSpec.scale==geometry.mainScale,"native cache owns staged scale so a parent replay can clear it");
        r=reset();r.task.parent.mLastMagnificationSpec=new Spec(geometry.mainScale,geometry.mainX,geometry.top);
        restore(new Tx(),r,new CommitBarrier(),null);
        check((Float)lastTx.calls.get("setMatrix")[1]==1f && r.task.mLastMagnificationSpec==null,"already scaled native parent does not produce .75 squared");
        check((Float)lastTx.calls.get("setPosition")[2]==11f,"parent workspace offset not added twice");
        r=reset();r.task.parent.mLastMagnificationSpec=new Spec(.5f,30,40);Parent outer=new Parent();outer.mLastMagnificationSpec=new Spec(.8f,20,25);r.task.parent.parent=outer;
        restore(new Tx(),r,new CommitBarrier(),null);float local=(Float)lastTx.calls.get("setMatrix")[1];
        check(Math.abs(local*.4f-geometry.mainScale)<.00001,"nested parent magnification composes to exact physical size");
        r=reset();r.task.parent.mLastMagnificationSpec=new Spec(Float.NaN,0,0);
        try{stageMainTransform(r,new Tx(),r.task.surface,geometry);throw new AssertionError("invalid parent");}catch(IllegalArgumentException expected){checks++;}
        r=reset();r.task=new SubTask();stageMainTransform(r,new Tx(),r.task.surface,geometry);
        check(r.task.mLastMagnificationSpec.scale==geometry.mainScale,"OEM task subclass uses inherited native magnification cache");
        r=reset();flip=new NativeFlip();flip.actors[1]=r;Tx shared=new Tx();wct=new Tx();restore(wct,r,new CommitBarrier(),shared);
        check(created==0 && tracked==0 && !wct.calls.containsKey("setBoundsChangeTransaction"),"flip uses caller's single landing transaction");
        check((Float)shared.calls.get("setMatrix")[1]==flip.to.mainScale && (Float)shared.calls.get("setPosition")[1]==flip.to.mainX+7f,"promoted task lands on destination side");
        check(ownsTask(r.task),"promoted actor stays isolated while band owns it");slots.replace(0,42,-1);
        check(ownsTask(r.task),"all animation actors protected after logical role change");flip=null;check(!ownsTask(r.task),"normal magnification resumes after landing");
        r=reset();ending=true;restore(new Tx(),r,new CommitBarrier(),null);
        check((Float)lastTx.calls.get("setMatrix")[1]==1f && (Float)lastTx.calls.get("setPosition")[1]==7f,"exit restores actual native geometry");
        r=reset();r.task.mode=5;restore(new Tx(),r,new CommitBarrier(),null);check(created==0 && !r.dirty,"native floating owner preserved");
        r=reset();r.task.parent=new Parent();restore(new Tx(),r,new CommitBarrier(),null);check(created==0 && !r.dirty,"foreign parent preserved");
    }
    static void promotions(){
        SavedTask preparing=reset();slots.clear();flip=new NativeFlip();flip.actors[0]=preparing;
        check(ownsTask(preparing.task),"pending flip retains logical ownership against competing operations");
        check(!ownsMagnification(preparing.task),"HOME preparation preserves native main magnification before reparent");
        flip.ownsTransforms=true;
        check(ownsMagnification(preparing.task),"first physical transaction takes magnification ownership");
        flip.ownsTransforms=false;preparing.task.mode=6;slots.replace(0,-1,42);flip.actors[0]=null;flip.actors[1]=preparing;
        check(ownsMagnification(preparing.task),"existing preview stays physical during preparation");
        flip=null;slots.clear();NativeTopTask.upper=preparing;
        check(ownsMagnification(preparing.task),"upper task physical isolation preserved");
        active=false;check(!ownsMagnification(preparing.task),"inactive lease cannot own magnification");
        SavedTask r=reset();check(canAdoptPromotion(request(r)),"exact native fullscreen promotion admitted");
        check(!ownsTask(r.task),"native promoted task no longer inherits side magnification isolation");
        r.task.mode=6;check(ownsTask(r.task),"actual preview remains isolated");
        for(int kind=0;kind<15;kind++){
            r=reset();Intent i=request(r);
            switch(kind){case 0:active=false;break;case 1:ending=true;break;case 2:flip=new NativeFlip();break;
                case 3:pendingCommit=new Object();break;case 4:i.put("slot",-1);break;case 5:r.dirty=false;break;
                case 6:i.put("token",new Object());break;case 7:WorkspaceUsers.allowed=false;break;
                case 8:r.task.root=new Object();break;case 9:r.task.parent=new Parent();break;
                case 10:r.task.display=new Object();break;case 11:r.task.mode=6;break;
                case 12:r.task.surface.id=99;break;case 13:r.task.info.visible=false;break;case 14:Wm.spec=new Object();break;}
            check(!canAdoptPromotion(i),"reject changed promotion identity/state "+kind);
        }
    }
    static class StepRuntime {
        static boolean enabled=true,interactive=true;static class Shell {static Object context=new Object();}
        static void diagnostic(String s,String d){}static boolean interactive(Object context){return interactive;}
    }
    static class SystemClock {static long now=100;static long uptimeMillis(){return now;}}
    static class NativeTiles {static Object tile;static Object find(int user,String name){return user==0?tile:null;}}
    static class Recorder {
        static java.lang.reflect.Field needed;static Class<?> central;static Method dependency,shade,expanded,moving,complete;
        static class Request {int user;long until=500;}
        RECORDER
    }
    public static class Shade {
        public static boolean need=true;public boolean visible,animating;public int actions=1,starts;
        public boolean isExpandedVisible(){return visible;}public boolean isExpandingOrCollapsing(){return animating;}
        public void runPostCollapseActions(){starts+=actions;actions=0;}
        public Shade getShadeController(){return this;}
    }
    static Shade currentShade;
    public static Object get(Class<?> type){return currentShade;}
    static void recorder()throws Exception {
        Recorder.needed=Shade.class.getField("need");Recorder.central=Shade.class;
        Recorder.dependency=TestNativeFeedback.class.getMethod("get",Class.class);Recorder.shade=Shade.class.getMethod("getShadeController");
        Recorder.expanded=Shade.class.getMethod("isExpandedVisible");Recorder.moving=Shade.class.getMethod("isExpandingOrCollapsing");
        Recorder.complete=Shade.class.getMethod("runPostCollapseActions");
        Object tile=NativeTiles.tile=new Object();currentShade=new Shade();Recorder.Request r=new Recorder.Request();
        Recorder.finish(tile,r);check(currentShade.starts==1 && currentShade.actions==0,"closed shade executes OEM action");
        Recorder.finish(tile,r);check(currentShade.starts==1,"drained OEM queue cannot duplicate start");
        for(int kind=0;kind<7;kind++){
            currentShade=new Shade();StepRuntime.enabled=StepRuntime.interactive=Shade.need=true;SystemClock.now=100;r=new Recorder.Request();NativeTiles.tile=tile;
            switch(kind){case 0:currentShade.visible=true;break;case 1:currentShade.animating=true;break;case 2:Shade.need=false;break;
                case 3:StepRuntime.enabled=false;break;case 4:r.user=10;break;case 5:SystemClock.now=600;break;case 6:NativeTiles.tile=new Object();break;}
            Recorder.finish(tile,r);check(currentShade.starts==0,"recorder preserves native guard "+kind);
        }
    }
    static class Gate {
        static long validUntil=500;static Map<Object,Boolean> consumers=new WeakHashMap<>();
        GATE
    }
    static void gestures(){
        check(Gate.accepts(1000,123,4500,100),"authenticated fresh lease");
        check(!Gate.accepts(10045,123,4500,100),"launcher cannot forge native lease");
        check(!Gate.accepts(1000,122,4500,100),"stale loaded version");
        check(!Gate.accepts(1000,123,99,100) && !Gate.accepts(1000,123,99999,100),"bounded expiry");
        Object consumer=new Object();check(Gate.deferFor(consumer,false,0,false,100),"DOWN defers native animation");
        // OEM MOVE starts tracking when needDeferDown is true and its original
        // pilfer/slop threshold is crossed. The choice stays fixed for this consumer.
        check(Gate.deferFor(consumer,false,0,true,600),"same gesture retains native deferred branch after start/expiry");
        Gate.beginGesture(consumer);
        check(!Gate.deferFor(consumer,false,0,false,600),"reused OEM consumer starts a new native gesture after exit");
        check(!Gate.deferFor(new Object(),false,0,false,600),"new gesture after exit uses native path");
        check(!Gate.deferFor(new Object(),false,1,false,100),"other display unchanged");
        check(!Gate.deferFor(new Object(),false,0,true,100),"already running recents unchanged");
        check(Gate.deferFor(new Object(),true,1,true,600),"native deferred setting preserved");
    }
    public static void main(String[] args)throws Exception{restoration();promotions();recorder();gestures();System.out.println("PASS "+checks+" Step native feedback checks: matrices, shared landing, promotion ownership, gesture lease, OEM recording queue");}
}
'''.replace('METHODS',methods).replace('RECORDER',recorder).replace('GATE',gate)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-feedback-') as tmp:
    folder=Path(tmp);test=folder/'TestNativeFeedback.java';test.write_text(harness,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,test,STEP/'WorkspaceLayout.java',STEP/'WorkspaceTransform.java',STEP/'SideSlots.java',STEP/'TaskIdentity.java'],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.TestNativeFeedback'],check=True)
