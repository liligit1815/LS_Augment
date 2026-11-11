"""Run the production renderer/recovery handoff with delayed and racing surface commits."""
import os
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
STEP = ROOT / 'android/app/src/main/java/ls/augment/com/step'

def method(name, signature):
    text = (STEP / name).read_text(encoding='utf-8')
    start = text.index(signature)
    end = text.index('{', start) + 1
    depth = 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end]

harness = r'''
package ls.augment.com.step;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.Consumer;
public class ExitImeCases {
    static int checks;
    static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
    static class SystemClock {static long now=100;static long uptimeMillis(){return now;}}
    static class StepRuntime {static List<String> traces=new ArrayList<>();static void diagnostic(String s,String d){traces.add(s+":"+d);}}
    static class Shell {static Executor executor=Runnable::run;}
    static class ActivityManager {static class RunningTaskInfo {}}
    static class Rect {int width(){return 1216;}int height(){return 2688;}}
    static class Bundle {
        Map<String,Object> values=new HashMap<>();
        void putBoolean(String k,boolean v){values.put(k,v);}void putInt(String k,int v){values.put(k,v);}
        String getString(String k){return "RESTORED";}void putString(String k,String v){values.put(k,v);}
    }
    static class Main {List<Runnable> queue=new ArrayList<>();void postDelayed(Runnable r,long delay){queue.add(r);}
        void tick(){List<Runnable> copy=new ArrayList<>(queue);queue.clear();copy.forEach(Runnable::run);}}
    static class Tx {Runnable committed;CountDownLatch applying,allow;int writes;boolean applied;
        void ack(){check(applied,"only applied frames acknowledged");committed.run();}}
    static class NativeWorkspaceGuard {static List<Tx> all=new ArrayList<>();static CountDownLatch applying,allow;
        static Object surfaceTransaction(){Tx t=new Tx();t.applying=applying;t.allow=allow;all.add(t);return t;}}
    static class SurfaceCommit {static void observe(Object tx,Executor executor,Runnable committed){((Tx)tx).committed=()->executor.execute(committed);}}
    static Object call(Object o,String name,Object... args)throws Exception {
        if(o instanceof ActivityManager.RunningTaskInfo)return 6;
        if(o instanceof Tx t){
            if(name.equals("apply")){if(t.applying!=null){t.applying.countDown();if(!t.allow.await(2,TimeUnit.SECONDS))throw new AssertionError("writer blocked");}t.applied=true;}
            else if(!name.equals("close"))t.writes++;
        }
        return null;
    }
    static class Lease {ActivityManager.RunningTaskInfo checkedInfo(){return new ActivityManager.RunningTaskInfo();}Object checkedLeash(){return this;}}
    static class Fence {boolean busy(){return false;}}
    static class Host {
        volatile boolean closing,closed;Object flipStage,organizer=new Object();final Object organizerLock=new Object();
        Fence fence=new Fence();SideSlots slots=new SideSlots();Map<Integer,Lease> leases=new HashMap<>();
        final PreviewFrames previewFrames=new PreviewFrames();long previewDrainStarted;boolean previewDrainReported;
        Rect logical=new Rect();WorkspaceLayout geometry=new WorkspaceLayout(1216,2688,3.25f,false);
        int visibleSlots=2,previewWidth=geometry.sideWidth,dragSlot=-1,exitPage;float shiftProgress,dragX;int[] shiftFrom;
        boolean retainOnExit,exitTopFace,homeExit;String session="test",exitReason="test recovery";Main main=new Main();int ends,cleaned,slotCallbacks;
        Host(){slots.replace(0,-1,42);leases.put(42,new Lease());}
        Object surface(){return this;}void commitSlotFrame(Runnable done){slotCallbacks++;done.run();}
        void cleanup(){cleaned++;}void rpc(String verb,Bundle args,Consumer<Bundle> done){check(verb.equals("end"),"only recovery request");ends++;done.accept(args);}
        RENDER
        END
    }
    static void geometry(){
        for(boolean left:new boolean[]{false,true})for(int[] size:new int[][]{{1216,2688},{1080,2400},{2400,1080}}){
            WorkspaceLayout l=new WorkspaceLayout(size[0],size[1],3.25f,left);
            for(int adjust:new int[]{0,16,32,48})for(int edge:new int[]{size[1]/2,3*size[1]/4}){
                int bottom=WorkspaceImeGeometry.visibleBottom(size[1],edge);
                WorkspaceImeGeometry.Pose p=WorkspaceImeGeometry.pose(l,true,edge,bottom,l.gap*2);
                check(p.y==l.top,"top editors stay below toolbar; mode="+adjust);
                if(edge>l.top+l.gap*2)check(p.y+p.scale*bottom<=edge-l.gap*2+.01,"native bottom editor above docked keyboard");
                else check(p.scale==l.mainScale,"no valid viewport preserves native layout");
                check(WorkspaceImeGeometry.visibleBottom(edge-20,edge)==edge-20,"legacy resized window retained");
                check(WorkspaceImeGeometry.top(l,false,edge,bottom,14)==l.top,"floating keyboard preserves original layout");
            }
        }
        WorkspaceLayout device=new WorkspaceLayout(1216,2688,3.25f,false);
        for(int edge:new int[]{1594,1659}){
            WorkspaceImeGeometry.Pose p=WorkspaceImeGeometry.pose(device,true,edge,edge,14);
            check(p.y==681 && p.y+p.scale*edge<=edge-14+.01f,"recorded devices: both top and bottom editors visible");
            check(Math.abs((p.x+p.scale*1216/2)-(device.mainX+device.mainScale*1216/2))<.01f,"main pane stays horizontally centered");
        }
        check(WorkspaceImeGeometry.visibleBottom(0,100)==0 && WorkspaceImeGeometry.visibleBottom(100,0)==0,"missing bounds rejected");
    }
    static void commits()throws Exception {
        PreviewFrames f=new PreviewFrames();long a=f.add(),b=f.add();f.seal();f.commit(b);f.commit(999);
        check(!f.ready() && f.pending()==1,"out-of-order/foreign callback cannot finish another frame");
        f.commit(a);f.commit(a);check(f.ready(),"duplicate late callback harmless");
        try{f.add();throw new AssertionError("late writer");}catch(IllegalStateException expected){checks++;}
        Host h=new Host();h.render(()->{});h.render(()->{});h.closing=true;h.requestEnd();
        check(h.ends==0,"restoration waits for both submitted frames");
        NativeWorkspaceGuard.all.get(1).ack();h.main.tick();check(h.ends==0,"latest callback cannot hide older pending frame");
        NativeWorkspaceGuard.all.get(0).ack();h.main.tick();check(h.ends==1 && h.cleaned==1,"recovery after all commits");
        check(h.slotCallbacks==0,"late render callback cannot reopen closed slot operation");
        int count=NativeWorkspaceGuard.all.size();h.render(null);check(NativeWorkspaceGuard.all.size()==count,"queued renderer cannot reparent restored tasks");
        Host lost=new Host();lost.render(null);lost.closing=true;lost.requestEnd();SystemClock.now+=1801;lost.main.tick();
        check(lost.ends==1,"missing preview callback requests server recovery instead of indefinite wait");
        check(StepRuntime.traces.stream().anyMatch(x->x.contains("recover_unconfirmed_preview")),"unconfirmed preview never reported committed");
    }
    static void race()throws Exception {
        Host h=new Host();CountDownLatch applying=NativeWorkspaceGuard.applying=new CountDownLatch(1);
        CountDownLatch allow=NativeWorkspaceGuard.allow=new CountDownLatch(1);
        List<Throwable> errors=Collections.synchronizedList(new ArrayList<>());
        Thread writer=new Thread(()->{try{h.render(null);}catch(Throwable e){errors.add(e);}});writer.start();
        check(applying.await(2,TimeUnit.SECONDS),"writer holds organizer lock during submit");
        h.closing=true;Thread recovery=new Thread(h::requestEnd);recovery.start();
        long until=java.lang.System.nanoTime()+TimeUnit.SECONDS.toNanos(2);
        while(recovery.getState()!=Thread.State.BLOCKED && java.lang.System.nanoTime()<until)Thread.yield();
        check(recovery.getState()==Thread.State.BLOCKED,"restore serialized behind in-flight renderer");
        allow.countDown();writer.join(2000);recovery.join(2000);
        check(errors.isEmpty() && !writer.isAlive() && !recovery.isAlive() && h.ends==0,"submit finishes before recovery can begin");
        NativeWorkspaceGuard.all.get(NativeWorkspaceGuard.all.size()-1).ack();h.main.tick();check(h.ends==1,"commit opens recovery gate");
        NativeWorkspaceGuard.applying=NativeWorkspaceGuard.allow=null;
        Host queued=new Host();Thread late;
        synchronized(queued.organizerLock){
            late=new Thread(()->{try{queued.render(null);}catch(Throwable e){errors.add(e);}});late.start();
            until=java.lang.System.nanoTime()+TimeUnit.SECONDS.toNanos(2);
            while(late.getState()!=Thread.State.BLOCKED && java.lang.System.nanoTime()<until)Thread.yield();
            check(late.getState()==Thread.State.BLOCKED,"renderer passed outer gate before waiting on organizer");queued.closing=true;
        }
        late.join(2000);check(queued.previewFrames.pending()==0 && errors.isEmpty(),"inner closing gate rejects stale renderer");
    }
    public static void main(String[] args)throws Exception{geometry();commits();race();System.out.println("PASS "+checks+" Step exit/IME checks: production render, reordered/missing commits, writer races, native viewport");}
}
'''.replace('RENDER', method('LiveWorkspace.java', 'void render(Runnable committed)')
                     + '\n' + method('LiveWorkspace.java', 'void stagePreviews(Object tx,boolean requireAll)')) \
   .replace('END', method('LiveWorkspace.java', 'void requestEnd()'))

java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='step-exit-ime-') as temp:
    folder = Path(temp)
    file = folder / 'ExitImeCases.java'
    file.write_text(harness, encoding='utf-8')
    sources = ['PreviewFrames', 'WorkspaceLayout', 'WorkspaceImeGeometry', 'PreviewGeometry', 'SideSlots']
    subprocess.run([java / 'javac', '-encoding', 'UTF-8', '-d', folder, file,
                    *[STEP / (name + '.java') for name in sources]], check=True)
    subprocess.run([java / 'java', '-cp', folder, 'ls.augment.com.step.ExitImeCases'], check=True)
