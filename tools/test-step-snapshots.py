"""Run production snapshot geometry, ownership and typed API resolution against adversarial state changes."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/step/WorkspaceSnapshots.java').read_text(encoding='utf-8')
def extract(signature):
    start=source.index(signature);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end].replace("android.os.SystemClock.uptimeMillis()","(System.nanoTime()/1000000)")
harness=r'''
import java.lang.reflect.*;import java.util.*;
public class SnapshotCases {
    static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    static class Rect {int left,top,right,bottom;Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}int width(){return right-left;}int height(){return bottom-top;}}
    static class Point {int x,y;Point(int x,int y){this.x=x;this.y=y;}}
    static class Builder {Point size;int orientation,rotation,mode=6;}
    static class Surface {boolean valid=true;}
    static class App {Object state=new Object();Surface surface=new Surface();Task task;boolean side,retained=true,fills=true;Rect bounds=new Rect(0,0,2688,1216);}
    static class Task {App app=new App();Object display=Wm.display;int user,mode=1,type=1;Object root=this;Task(){app.task=this;}}
    static class ChildTask extends Task {}
    static class Wm {static Object lock=new Object(),display=new Object(),context=new Object();}
    static Object focused;static boolean active=true,ending;static Method record;static Object controller;static ThreadLocal<Object> recording=new ThreadLocal<>();
    static ThreadLocal<Frame> captureRoot=new ThreadLocal<>();
    static class Recorder {int count;void recordSnapshot(Task task){count++;check(recording.get()==task,"native recorder retains exact outgoing identity");}}
    static void diagnostic(String stage,String detail){}
    static Object flip;static int principal;static Rect logical=new Rect(0,0,1216,2688);static boolean available=true;static Class<?> taskType=Task.class;
    static class WorkspaceUsers {static boolean allows(Object c,int principal,int user){return principal==user;}}
    static class LocalLandscape {
        static boolean changing,scene=true;static Map<Object,Token> tokens=new IdentityHashMap<>();
        static class Token {Object state,surface;int rotation;Token(App a,int r){state=a.state;surface=a.surface;rotation=r;}}
        static boolean scene(){return scene;}static boolean side(Object a){return ((App)a).side;}static boolean retained(Object a){return ((App)a).retained;}
        static boolean owned(Object a){return tokens.containsKey(a)&&tokens.get(a).state==((App)a).state;}
        static Method exact(Class<?> c,String n,Class<?> result,Class<?>...args)throws ReflectiveOperationException{
            for(Class<?> at=c;at!=null;at=at.getSuperclass())try{Method m=at.getDeclaredMethod(n,args);if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers()))throw new NoSuchMethodException(n);return m;}catch(NoSuchMethodException absent){}
            throw new NoSuchMethodException(n);
        }
    }
    static Object field(Object o,String n){if(o instanceof App a)return a.state;return ((Task)o).user;}
    static Object call(Object o,String n,Object...args){
        if(o==Wm.display)return focused;
        if(o instanceof Builder b){switch(n){case "setTaskSize"->b.size=(Point)args[0];case "setOrientation"->b.orientation=(Integer)args[0];case "setRotation"->b.rotation=(Integer)args[0];case "setWindowingMode"->b.mode=(Integer)args[0];default->throw new AssertionError(n);}return b;}
        if(o instanceof Surface s)return s.valid;
        if(o instanceof Task t)return switch(n){case "getRootTask"->t.root;case "getActivityType"->t.type;case "getWindowingMode"->t.mode;case "getDisplayContent"->t.display;case "topRunningActivity"->t.app;default->throw new AssertionError(n);};
        App a=(App)o;return switch(n){case "getTask"->a.task;case "getSurfaceControl"->a.surface;case "fillsParent"->a.fills;case "getFixedRotationTransformDisplayBounds"->a.bounds;default->throw new AssertionError(n);};
    }
    METHODS
    static Task owned(boolean side,int rotation){Task t=new Task();t.app.side=side;t.mode=side?6:1;LocalLandscape.tokens.put(t.app,new LocalLandscape.Token(t.app,rotation));return t;}
    static class Container{}
    static class NewController {String prepare(Container c,int value){return "native";}}
    static class OldController {String prepare(Task c,int value){return "native";}}
    static class InheritedController extends OldController{}
    static class WrongController {int prepare(Container c,int value){return 0;}}
    static class StaticController {static String prepare(Container c,int value){return "bad";}}
    public static void main(String[] args)throws Exception{
        record=Recorder.class.getDeclaredMethod("recordSnapshot",Task.class);Recorder nativeRecorder=new Recorder();controller=nativeRecorder;
        Task outgoing=owned(false,1);focused=outgoing;
        recordTask(outgoing,"no_lock");check(nativeRecorder.count==0,"unlocked handoff never records");
        synchronized(Wm.lock){
            recordTask(outgoing,"restore_previous_main");check(nativeRecorder.count==1&&recording.get()==null,"direct reorder records through native policy and cleans context");
            active=false;recordTask(outgoing,"inactive");active=true;
            ending=true;recordTask(outgoing,"ending");ending=false;
            flip=new Object();recordTask(outgoing,"transition");flip=null;
            focused=new Task();recordTask(outgoing,"other_foreground");focused=outgoing;
            outgoing.display=new Object();recordTask(outgoing,"other_display");outgoing.display=Wm.display;
            outgoing.user=10;recordTask(outgoing,"other_user");outgoing.user=0;
            outgoing.mode=5;recordTask(outgoing,"freeform");outgoing.mode=1;
            outgoing.type=2;recordTask(outgoing,"home");outgoing.type=1;
            outgoing.root=new Object();recordTask(outgoing,"nested_task");outgoing.root=outgoing;
            check(nativeRecorder.count==1,"only outgoing standard root in active exact scene is recorded");
            Object previousRecording=new Object();recording.set(previousRecording);recordTask(outgoing,"admit_side");check(recording.get()==previousRecording,"nested caller context restored");recording.remove();
            Method nativeMethod=record;record=null;recordTask(outgoing,"missing_api");record=nativeMethod;
            check(nativeRecorder.count==2,"missing recorder capability leaves native behavior unchanged");
            for(boolean side:new boolean[]{false,true})for(int rotation:new int[]{1,3}){
                Task t=owned(side,rotation);Frame f=frame(t);check(f!=null&&f.current(),"owned stable frame admitted");
                Builder b=new Builder();describe(f,b);check(b.mode==1&&b.orientation==2&&b.rotation==rotation&&b.size.x==2688&&b.size.y==1216,"temporary side hosting never leaks into native fullscreen thumbnail metadata");
                int mode=t.mode;t.mode=5;check(!f.current(),"changed native mode invalidates capture");t.mode=mode;
                check(f.width==2688&&f.height==1216&&f.rotation==rotation,"app landscape metadata preserved");
                check(f.crop.width()==2688&&f.crop.height()==1216,"both roles capture the complete original landscape frame");
                check(f.crop.left==0&&f.crop.top==0,"capture starts below rotation and task scaling");
                check(Math.abs(f.crop.width()*.6f-1612.8f)<.01f,"native snapshot fraction remains unchanged");
                check(Math.abs(f.crop.height()*.6f-729.6f)<1,"native height keeps the original aspect");
                check(captureSurface(t)==null,"capture root override inactive outside native createSnapshot");
                captureRoot.set(f);check(captureSurface(t)==t.app.surface,"both roles capture below their rotation leash");
                check(captureSurface(t.app)==null&&captureSurface(new Task())==null,"other windows and tasks preserve native surfaces");
                t.mode=5;check(captureSurface(t)==null,"changed ownership cannot redirect capture");t.mode=mode;captureRoot.remove();
                Object prior=t.app.state;t.app.state=new Object();check(!f.current()&&frame(t)==null,"foreign rotation never exempted");t.app.state=prior;
                Surface old=t.app.surface;t.app.surface=new Surface();check(!f.current()&&frame(t)==null,"recreated surface never uses old geometry");t.app.surface=old;
                t.app.task=new Task();check(!f.current(),"reparented app invalidates capture");t.app.task=t;
                flip=new Object();check(!f.current()&&frame(t)==null,"in-flight promotion retains native skip");flip=null;
                LocalLandscape.changing=true;check(!f.current()&&frame(t)==null,"unfinished transform retains native skip");LocalLandscape.changing=false;
                LocalLandscape.scene=false;check(!f.current()&&frame(t)==null,"exit cannot keep a capture exception");LocalLandscape.scene=true;
            }
            Task t=owned(false,1);t.user=10;check(frame(t)==null,"other user excluded");t.user=0;
            t.display=new Object();check(frame(t)==null,"other display excluded");t.display=Wm.display;
            t.app.fills=false;check(frame(t)==null,"translucent stack remains native");t.app.fills=true;
            t.app.retained=false;check(frame(t)==null,"unowned native task mode excluded");t.app.retained=true;
            t.app.bounds=new Rect(0,0,1920,1080);check(frame(t)==null,"unverified geometry excluded");t.app.bounds=new Rect(0,0,2688,1216);
            t.app.surface.valid=false;check(frame(t)==null,"invalid surface excluded");t.app.surface.valid=true;
            available=false;check(frame(t)==null,"missing capability preserves native pipeline");available=true;
            check(frame(new Object())==null,"WindowToken is never treated as Task");
            ChildTask child=new ChildTask();LocalLandscape.tokens.put(child.app,new LocalLandscape.Token(child.app,1));check(frame(child)!=null,"Task subclasses supported");
        }
        check(frame(owned(false,1))==null,"WM lock is required");
        check(method(NewController.class,"prepare",String.class,Container.class,int.class).getParameterTypes()[0]==Container.class,"generic WindowContainer API");
        check(method(OldController.class,"prepare",String.class,Container.class,int.class).getParameterTypes()[0]==Task.class,"older Task API");
        check(method(InheritedController.class,"prepare",String.class,Container.class,int.class).getDeclaringClass()==OldController.class,"inherited implementation");
        for(Class<?> bad:new Class<?>[]{WrongController.class,StaticController.class,Object.class}){
            boolean rejected=false;try{method(bad,"prepare",String.class,Container.class,int.class);}catch(ReflectiveOperationException missing){rejected=true;}
            check(rejected,"wrong/static/absent capability rejected");
        }
        System.out.println("PASS "+checks+" production snapshot geometry/ownership/capability checks");
    }
}
'''.replace('METHODS','\n'.join(extract(s) for s in ['static final class Frame','static Method method(','static Frame frame(','static void describe(','static void recordTask(','static Object captureSurface(']))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-snapshot-') as tmp:
    p=Path(tmp);test=p/'SnapshotCases.java';test.write_text(harness,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',p,test],check=True)
    subprocess.run([java/'java','-cp',p,'SnapshotCases'],check=True)
