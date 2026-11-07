"""Run the production NativeFlip state machine with deterministic frame and surface transactions."""
import os,re,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'NativeFlip.java').read_text(encoding='utf8')
source=re.sub(r'^(package|import) .*?;\s*','',source,flags=re.M).replace('final class NativeFlip {','static final class NativeFlip {').replace('android.os.Bundle','Bundle').replace('android.view.SurfaceControl','SurfaceControl')
harness=r'''
package ls.augment.com.step;
import java.util.*;
public class MotionCases {
    static int checks,replies;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
    interface Parcelable {}
    static class ResultReceiver {}
    static class Bundle {Map<String,Object> data=new HashMap<>();void putBoolean(String k,boolean v){data.put(k,v);}}
    static class Intent extends Bundle {
        Intent put(String k,Object v){data.put(k,v);return this;}
        int getIntExtra(String k,int d){return (Integer)data.getOrDefault(k,d);}
        boolean getBooleanExtra(String k,boolean d){return (Boolean)data.getOrDefault(k,d);}
        Object getParcelableExtra(String k){return data.get(k);}
        <T>T getParcelableExtra(String k,Class<T> c){return c.cast(data.get(k));}
        Parcelable[] getParcelableArrayExtra(String k){return (Parcelable[])data.get(k);}
        <T>T[] getParcelableArrayExtra(String k,Class<T> c){return (T[])data.get(k);}
    }
    static class Rect {int width(){return 1080;}int height(){return 2400;}}
    static class SurfaceControl implements Parcelable {
        static int ids;int id=++ids;boolean valid=true,visible;float x,y,sx=1,sy=1,alpha=1;SurfaceControl parent;
        boolean isValid(){return valid;}void release(){}
        static class Transaction implements AutoCloseable {
            List<Runnable> ops=new ArrayList<>(),commits=new ArrayList<>();boolean closed;
            Transaction reparent(SurfaceControl s,SurfaceControl p){ops.add(()->s.parent=p);return this;}
            Transaction setScale(SurfaceControl s,float x,float y){ops.add(()->{s.sx=x;s.sy=y;});return this;}
            Transaction setPosition(SurfaceControl s,float x,float y){ops.add(()->{s.x=x;s.y=y;});return this;}
            Transaction setAlpha(SurfaceControl s,float a){ops.add(()->s.alpha=a);return this;}
            Transaction setVisibility(SurfaceControl s,boolean b){ops.add(()->s.visible=b);return this;}
            void apply(){check(!closed,"live transaction");List<Runnable> o=new ArrayList<>(ops),c=new ArrayList<>(commits);ops.clear();commits.clear();o.forEach(Runnable::run);c.forEach(Runnable::run);}
            public void close(){closed=true;}
        }
    }
    static class Choreographer {
        interface FrameCallback {void doFrame(long t);}
        static Choreographer clock=new Choreographer();ArrayDeque<FrameCallback> pending=new ArrayDeque<>();
        static Choreographer getInstance(){return clock;}void postFrameCallback(FrameCallback c){pending.add(c);}
        void removeFrameCallback(FrameCallback c){pending.remove(c);}
        void frame(long t){FrameCallback c=pending.poll();if(c!=null)c.doFrame(t);}
    }
    static class PathInterpolator {PathInterpolator(float a,float b,float c,float d){}float getInterpolation(float t){return t;}}
    static class SurfaceCommit {static void observe(SurfaceControl.Transaction tx,java.util.concurrent.Executor e,Runnable r){tx.commits.add(()->e.execute(r));}}
    static class Handler {void post(Runnable r){r.run();}void postDelayed(Runnable r,long delay){}}
    static class Metrics {float density=2.5f;}static class Resources {Metrics getDisplayMetrics(){return new Metrics();}}
    static class Context {Resources getResources(){return new Resources();}}
    static class Wm {static Object lock=new Object(),display=new Object(),ownedSpec=new Object();static boolean active=true;static Handler handler=new Handler();static Context context=new Context();}
    static class Point {int x,y;}
    static class Task {SurfaceControl sc=new SurfaceControl();Object parent=new Object();int mode;boolean focused;}
    static class SavedTask {int id,user,layerId;Object token=new Object(),parent;Task task=new Task();boolean dirty=true;Point position=new Point();
        SavedTask(int id,int mode){this.id=id;task.mode=mode;task.focused=mode==1;layerId=task.sc.id;parent=task.parent;}}
    static class WorkspaceUsers {static boolean allows(Context c,int p,int u){return u==0;}}
    static class WorkspaceIme {static void cancel(){}}
    static class WorkspaceImeHandoff {static void prepare(NativeFlip f,Runnable r){r.run();}}
    static class NativeBackdrop {static Runnable pending;NativeBackdrop(Intent i,SavedTask r){}void prepare(NativeFlip f,Runnable r){pending=r;}}
    static class StepMembers {static float getFloatField(Object o,String n){return new WorkspaceLayout(1080,2400,2.5f,sideLeft).top;}}
    static NativeFlip flip;static boolean ending,sideLeft;static int principal;static Rect logical=new Rect();
    static SideSlots slots=new SideSlots();static Map<Integer,SavedTask> saved=new HashMap<>();static Map<Object,SurfaceControl> parents=new HashMap<>();
    static Object liveTask(int id,Object token){SavedTask s=saved.get(id);return s!=null && s.token==token?s.task:null;}
    static Object field(Object o,String key){if(o==Wm.display)return Wm.ownedSpec;if(o instanceof Task t)return t.focused;throw new AssertionError(key);}
    static Object call(Object o,String key,Object... a){
        if(o instanceof SurfaceControl s && key.equals("getLayerId"))return s.id;
        if(o instanceof Task t)return switch(key){case "getParent"->t.parent;case "getSurfaceControl"->t.sc;case "getWindowingMode"->t.mode;case "getTaskInfo"->t;case "clearMagnificationSpec"->null;default->throw new AssertionError(key);};
        if(o instanceof SurfaceControl.Transaction tx){if(key.equals("setWindowCrop"))return tx;if(key.equals("setMatrix"))return tx.setScale((SurfaceControl)a[0],(Float)a[1],(Float)a[4]);throw new AssertionError(key);}
        if(key.equals("getSurfaceControl"))return parents.computeIfAbsent(o,k->new SurfaceControl());
        throw new AssertionError(key);
    }
    static void validSurface(Object s){if(!(s instanceof SurfaceControl c) || !c.valid)throw new IllegalStateException();}
    static Bundle base(){return new Bundle();}
    static void respond(ResultReceiver reply,int code,Bundle b,String message){replies++;}
    static void finish(String why){ending=true;if(flip!=null)flip.cancelAnimator();}
    static void stageMagnification(Object tx){check(tx instanceof SurfaceControl.Transaction,"native parent normalization shares first frame transaction");check(flip.ownsTransforms,"physical isolation starts inside the first surface transaction");}
    NATIVE
    static Intent reset(boolean returning,boolean left){
        saved.clear();parents.clear();slots.clear();Choreographer.clock=new Choreographer();ending=false;sideLeft=left;replies=0;
        SavedTask out=new SavedTask(1,1),in=new SavedTask(2,6),peer=new SavedTask(3,6);
        saved.put(1,out);saved.put(2,in);saved.put(3,peer);slots.replace(0,-1,2);slots.replace(1,-1,3);
        WorkspaceLayout from=new WorkspaceLayout(1080,2400,2.5f,left),to=new WorkspaceLayout(1080,2400,2.5f,returning?left:!left);
        SurfaceControl[] lanes=new SurfaceControl[SideSlots.MAX_COUNT+1];lanes[0]=returning?null:new SurfaceControl();lanes[1]=new SurfaceControl();lanes[2]=new SurfaceControl();
        Intent request=new Intent().put("slot",0).put("task",returning?-1:1).put("previous",2).put("visible",3).put("leftSide",left)
            .put("fromX",from.mainX).put("toX",to.mainX).put("top",from.top).put("width",from.sideWidth).put("height",from.rowHeight(0,3)).put("rowTop",0)
            .put("band",new SurfaceControl()).put("lanes",lanes).put("hints",new SurfaceControl[2]).put("token",out.token);
        return request;
    }
    static void timeline(boolean returning,boolean left)throws Exception {
        Intent request=reset(returning,left);flip=new NativeFlip(request);NativeFlip f=flip;f.start(new ResultReceiver());
        SurfaceControl actor=f.surfaces[1],lane=(SurfaceControl)f.lanes[1];
        check(actor.parent==lane && actor.sx==1,"original task attached once at unit transform");
        check(Math.abs(lane.x-f.starts[1].x)<.001,"first frame preserves source location");
        Choreographer.clock.frame(1);Choreographer.clock.frame(160_000_001);
        check(lane.sx>f.starts[1].scale && lane.sx<f.ends[1].scale,"intermediate expansion is visible");
        check(!f.committed && replies==0,"no success before final frame commit");
        Choreographer.clock.frame(320_000_001);
        check(f.committed && replies==1 && Choreographer.clock.pending.isEmpty(),"one completion after final transaction");
        check(Math.abs(lane.sx-f.to.mainScale)<.001 && Math.abs(lane.x-f.to.mainX)<.001,"lands at main region on correct side");
        f.checkRoles(request);SurfaceControl preview=new SurfaceControl();SurfaceControl.Transaction tx=new SurfaceControl.Transaction();f.land(tx,preview);tx.apply();
        check(f.band.visible==returning && f.surfaces[2].parent==preview,"peer previews land; returning empty backing survives until host frame");
        tx=new SurfaceControl.Transaction();f.restoreParents(tx);tx.apply();
        check(actor.parent==parents.get(f.actors[1].parent) && actor.sx==1,"interruption restores native parent and scale");
        f.close();check(f.animationTx==null && f.callback==null,"frame driver and transaction released");
    }
    public static void main(String[] args)throws Exception {
        for(boolean returning:new boolean[]{false,true})for(boolean left:new boolean[]{false,true})timeline(returning,left);
        Intent empty=reset(false,false);slots.replace(0,2,-1);
        WorkspaceLayout same=new WorkspaceLayout(1080,2400,2.5f,false);
        empty.put("previous",-1).put("toX",same.mainX);
        NativeBackdrop.pending=null;flip=new NativeFlip(empty);flip.start(new ResultReceiver());
        check(NativeBackdrop.pending!=null && !flip.attached && flip.frames==0,"empty admission must wait for real HOME before moving original task");
        check(!flip.ownsTransforms,"HOME preparation does not prematurely remove the native main transform");
        NativeBackdrop.pending.run();check(flip.attached && flip.frames==1,"HOME ready starts the real-surface animation");flip.close();
        Intent request=reset(false,false);flip=new NativeFlip(request);flip.start(new ResultReceiver());Choreographer.clock.frame(1);flip.cancelAnimator();
        Choreographer.clock.frame(400_000_000);check(replies==0 && Choreographer.clock.pending.isEmpty(),"cancelled animation cannot send late success");
        request=reset(true,false);flip=new NativeFlip(request);flip.start(new ResultReceiver());Choreographer.clock.frame(1);saved.get(2).task.parent=new Object();
        Choreographer.clock.frame(320_000_001);check(ending && replies==0,"changed native parent fails final identity check");
        request=reset(true,false).put("background",true);try{new NativeFlip(request);throw new AssertionError("background return");}catch(IllegalStateException expected){checks++;}
        request=reset(true,false).put("previous",99);try{new NativeFlip(request);throw new AssertionError("stale slot");}catch(IllegalStateException expected){checks++;}
        System.out.println("PASS "+checks+" production Step animation checks: desktop promotion, exchange, continuous poses, cancellation, stale identity and landing");
    }
}
'''.replace('NATIVE',source)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-motion-') as temp:
    folder=Path(temp);file=folder/'MotionCases.java';file.write_text(harness,encoding='utf8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,file,*[STEP/(n+'.java') for n in ['SideSlots','WorkspaceLayout','WorkspaceMotion','PreviewGeometry']]],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.MotionCases'],check=True)
