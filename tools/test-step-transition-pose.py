"""Execute production HOME/RECENTS root calibration and identity/ownership fallbacks."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'NativeTransitionPose.java').read_text(encoding='utf-8')
def method(signature):
    start=source.index(signature);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]
methods='\n'.join(method(sig) for sig in ['static final class Pose','static Method exact(', 'static void capture(',
    'static boolean contains(', 'static boolean owns(', 'static WorkspaceTransform spec(',
    'static WorkspaceTransform inherited(', 'static void stage(', 'static void applyPose(', 'static void refresh(']).replace('android.graphics.Point','Point')
harness=r'''
package ls.augment.com.step;
import java.util.*;import java.lang.reflect.*;
public class TransitionPoseCases {
    static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
    static void near(float a,float b,String why){check(Math.abs(a-b)<.0001,why+": "+a+" / "+b);}
    static class IBinder {}
    static class Rect {int left,top,w=1216,h=2688;int width(){return w;}int height(){return h;}}
    static class Point {int x,y;}
    static class Spec {float scale,offsetX,offsetY;Spec(float s,float x,float y){scale=s;offsetX=x;offsetY=y;}}
    static class Surface {static int sequence;int layer=++sequence;boolean valid=true;}
    static class Parent {Object parent;Spec cache;Rect bounds=new Rect();}
    static class Info {Object token=new Object();}
    static class Task extends Parent {int user,mode=1,type=1;Object display;Surface surface=new Surface();Info info=new Info();boolean owned,wall;
        Task(int type){this.type=type;display=Wm.display;parent=common;}}
    static class Change {Task task;Change(Task t){task=t;}}
    static class Target {Info info;Surface leash;Target(Task t){info=t.info;leash=t.surface;}}
    static class Root {int display;Point offset=new Point();Surface leash=new Surface();}
    static class TransitionInfo {int roots=1;Root root=new Root();List<Target> targets=new ArrayList<>();}
    static Map<Surface,WorkspaceTransform> presented=new HashMap<>();static int rootWrites;
    static class Tx {Map<Surface,WorkspaceTransform> values=new HashMap<>();int writes;boolean applied;Runnable committed;}
    static class Handler {void post(Runnable r){r.run();}}
    static class SurfaceCommit {static void observe(Object tx,java.util.concurrent.Executor executor,Runnable done){((Tx)tx).committed=()->executor.execute(done);}}
    static Object surfaceTransaction(){return new Tx();}static Object pendingCommit;
    static void trackCommit(Object tx,Object group){check(ending,"root recovery is part of server commit barrier");}
    static class Wm {static Object context=new Object(),lock=new Object(),display=new Object();static boolean active=true;static Spec ownedSpec,applyingSpec;static Handler handler=new Handler();}
    static Object current;
    static class WorkspaceZoom {static boolean entered=true;static Object motion;}
    static class WorkspaceUsers {static boolean allows(Object context,int principal,int user){return user==principal || user==10;}}
    static class StepMembers {static float getFloatField(Object o,String name){Spec s=(Spec)o;return switch(name){case "scale"->s.scale;case "offsetX"->s.offsetX;case "offsetY"->s.offsetY;default->throw new AssertionError(name);};}}
    static class OwnershipBridge {static Method method(Class<?> type,String n,Class<?>...args)throws NoSuchMethodException{
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Method m=c.getDeclaredMethod(n,args);m.setAccessible(true);return m;}catch(NoSuchMethodException ignored){}throw new NoSuchMethodException(n);}}
    static final IdentityHashMap<Object,Pose> poses=new IdentityHashMap<>();
    static Method ancestor,wallpaper;static IBinder owner=new IBinder();static boolean active=true,ending;static Object flip;
    static int principal;static Rect logical=new Rect();static String session="session";static Parent common;
    static boolean ownsTask(Object task){return ((Task)task).owned;}
    static void validSurface(Object surface){if(!(surface instanceof Surface s) || !s.valid)throw new IllegalStateException("invalid surface");}
    static void diagnostic(String stage,String text){}
    public static Object common(ArrayList<?> changes,Object first){return common;}
    public static boolean wall(Object task){return ((Task)task).wall;}
    static Object field(Object o,String n){
        if(o==Wm.display)return current;if(o instanceof Change c)return c.task;
        if(o instanceof Task t && n.equals("mUserId"))return t.user;
        if(o instanceof Parent p && n.equals("mLastMagnificationSpec"))return p.cache;
        if(o instanceof Info i && n.equals("token"))return i.token;throw new AssertionError(n);
    }
    static Object call(Object o,String n,Object... a){
        if(o instanceof Surface s)return n.equals("isValid")?s.valid:s.layer;
        if(o instanceof Tx t){if(n.equals("apply")){presented.putAll(t.values);rootWrites++;t.applied=true;if(t.committed!=null)t.committed.run();return null;}if(n.equals("close"))return null;
            Surface s=(Surface)a[0];WorkspaceTransform old=t.values.getOrDefault(s,new WorkspaceTransform(1,0,0));
            if(n.equals("setMatrix"))t.values.put(s,new WorkspaceTransform((Float)a[1],old.x,old.y));
            else if(n.equals("setPosition"))t.values.put(s,new WorkspaceTransform(old.scale,(Float)a[1],(Float)a[2]));else throw new AssertionError(n);t.writes++;return t;}
        if(o instanceof Task t){switch(n){case "getDisplayContent":return t.display;case "getRootTask":return t;case "getWindowingMode":return t.mode;
            case "getActivityType":return t.type;case "getSurfaceControl":return t.surface;case "getTaskInfo":return t.info;
            case "clearMagnificationSpec":t.cache=null;((Tx)a[0]).values.put(t.surface,new WorkspaceTransform(1,0,0));return null;}}
        if(o instanceof Parent p)return n.equals("getParent")?p.parent:p.bounds;
        if(o instanceof TransitionInfo i)return switch(n){case "getRootCount"->i.roots;case "getRoot"->i.root;case "getChanges"->i.targets;default->throw new AssertionError(n);};
        if(o instanceof Root r)return switch(n){case "getDisplayId"->r.display;case "getLeash"->r.leash;case "getOffset"->r.offset;default->throw new AssertionError(n);};
        if(o instanceof Target t)return n.equals("getTaskInfo")?t.info:t.leash;throw new AssertionError(n);
    }
    METHODS
    static class Fixture {Task home,app;ArrayList<Change> changes=new ArrayList<>();TransitionInfo info=new TransitionInfo();Tx tx=new Tx();Object transition=new Object();
        Fixture(){poses.clear();presented.clear();rootWrites=0;active=true;ending=false;Wm.active=true;flip=null;WorkspaceZoom.entered=true;WorkspaceZoom.motion=null;owner=new IBinder();
            current=Wm.ownedSpec=new Spec(.7466518f,0,681);common=new Parent();common.parent=Wm.display;
            home=new Task(2);app=new Task(1);for(Task t:new Task[]{home,app}){changes.add(new Change(t));info.targets.add(new Target(t));t.cache=Wm.ownedSpec;}}
        void capture()throws Exception{TransitionPoseCases.capture(transition,info,changes,tx);}
    }
    public static class Legacy {public static Object calculateTransitionInfo(int a,int b,ArrayList<?> c,Tx tx){return null;}}
    public static class Inherited extends Legacy {}
    public static class Wrong {public Object calculateTransitionInfo(int a,int b,ArrayList<?> c,Tx tx){return null;}}
    public static class BadReturn {public static int calculateTransitionInfo(int a,int b,ArrayList<?> c,Tx tx){return 0;}}
    static void capabilities()throws Exception{
        check(exact(Legacy.class,"calculateTransitionInfo",Object.class,true,int.class,int.class,ArrayList.class,Tx.class)!=null,"legacy static contract");
        check(exact(Inherited.class,"calculateTransitionInfo",Object.class,true,int.class,int.class,ArrayList.class,Tx.class).getDeclaringClass()==Legacy.class,"OEM inherited contract");
        for(Class<?> type:new Class<?>[]{Object.class,Wrong.class,BadReturn.class})try{exact(type,"calculateTransitionInfo",Object.class,true,int.class,int.class,ArrayList.class,Tx.class);throw new AssertionError("unknown contract");}catch(NoSuchMethodException expected){checks++;}
    }
    static void calibrated()throws Exception{
        for(int activity:new int[]{2,3})for(boolean inherited:new boolean[]{false,true}){
            Fixture f=new Fixture();f.home.type=activity;if(inherited)common.cache=Wm.ownedSpec;f.capture();
            check(!f.tx.values.containsKey(f.info.root.leash),"Shell deferred start transaction never carries workspace root matrix");
            WorkspaceTransform root=presented.get(f.info.root.leash),parent=spec(common.cache);
            WorkspaceTransform physical=root.then(parent);near(physical.scale,.7466518f,"one workspace scale during HOME/RECENTS");near(physical.y,681,"same main origin");
            check(f.home.cache==null && f.app.cache==null && owns(f.home),"original task never gets a second scale under animation root");
            common.cache=null;refresh(f.tx);root=presented.get(f.info.root.leash);near(root.scale,.7466518f,"ancestor migration recalibrates root");
            common.cache=new Spec(.5f,10,20);refresh(f.tx);physical=presented.get(f.info.root.leash).then(spec(common.cache));
            near(physical.scale,.7466518f,"nested native scale calibrated");near(physical.y,681,"nested native offset calibrated");
            current=Wm.applyingSpec=new Spec(.8f,0,500);refresh(f.tx);
            check(owns(f.home),"owned in-progress IME/zoom spec keeps animation isolation");
            physical=presented.get(f.info.root.leash).then(spec(common.cache));near(physical.scale,.8f,"animation follows current owned geometry");
            Wm.applyingSpec=null;
            ending=true;pendingCommit=new Object();Wm.active=false;active=false;current=null;refresh(f.tx);check(presented.get(f.info.root.leash).identity(),"exit removes root transform before old animation finishes");
            call(f.tx,"apply");check(presented.get(f.info.root.leash).identity(),"late Shell start cannot resurrect exited root pose");
            check(!owns(f.home),"exit releases target exclusion");int writes=rootWrites;owner=new IBinder();refresh(f.tx);check(writes==rootWrites,"late transition cannot modify new owner");pendingCommit=null;
        }
        Fixture external=new Fixture();external.capture();current=new Spec(2,10,10);refresh(external.tx);
        check(presented.get(external.info.root.leash).identity() && !owns(external.home),"external magnifier regains its native children");
        Fixture profile=new Fixture();profile.app.user=10;profile.capture();check(owns(profile.app),"allowed managed profile retained");
    }
    static void rejected()throws Exception{
        for(int kind=0;kind<16;kind++){
            Fixture f=new Fixture();switch(kind){case 0:f.info.roots=2;break;case 1:f.info.root.display=1;break;
                case 2:f.info.root.offset.x=1;break;case 3:f.info.root.leash.valid=false;break;case 4:f.app.mode=6;break;
                case 5:f.app.user=99;break;case 6:f.app.owned=true;break;case 7:f.app.type=4;break;
                case 8:common.bounds.left=2;break;case 9:common.bounds.w=900;break;case 10:common.cache=new Spec(Float.NaN,0,0);break;
                case 11:f.info.targets.get(0).leash=new Surface();break;case 12:f.info.targets.get(0).info=new Info();break;
                case 13:f.app.display=new Object();break;case 14:common.parent=null;break;case 15:f.app.surface.valid=false;break;}
            try{f.capture();throw new AssertionError("unsafe capture "+kind);}catch(ReflectiveOperationException|IllegalStateException|IllegalArgumentException expected){checks++;}
            check(f.tx.writes==0 && poses.isEmpty() && f.home.cache!=null,"unsupported target preserves native transaction/cache "+kind);
        }
        for(int kind=0;kind<8;kind++){
            Fixture f=new Fixture();switch(kind){case 0:active=false;break;case 1:ending=true;break;case 2:Wm.active=false;break;
                case 3:current=new Spec(2,0,0);break;case 4:WorkspaceZoom.entered=false;break;case 5:WorkspaceZoom.motion=new Object();break;
                case 6:flip=new Object();break;case 7:f.home.type=1;break;}
            f.capture();check(f.tx.writes==0 && poses.isEmpty(),"unowned/app-only transition remains native "+kind);
        }
    }
    public static void main(String[] args)throws Exception{ancestor=TransitionPoseCases.class.getMethod("common",ArrayList.class,Object.class);wallpaper=TransitionPoseCases.class.getMethod("wall",Object.class);
        capabilities();calibrated();rejected();System.out.println("PASS "+checks+" production transition pose checks: HOME/RECENTS, native parent calibration, exit/new owner, inherited/missing contracts and unknown targets");}
}
'''.replace('METHODS',methods)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-transition-pose-') as tmp:
    folder=Path(tmp);test=folder/'TransitionPoseCases.java';test.write_text(harness,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,test,STEP/'WorkspaceTransform.java'],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.TransitionPoseCases'],check=True)
