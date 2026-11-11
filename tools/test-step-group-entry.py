"""Exercise production group visibility, identity/drawing gates and delayed host readiness."""
import os, re, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
def nested(name):
    s=(STEP/(name+'.java')).read_text(encoding='utf8')
    return re.sub(r'^(package|import) .*?;\s*','',s,flags=re.M).replace('final class '+name,'static final class '+name,1)
def method(name):
    s=(STEP/'LiveWorkspace.java').read_text(encoding='utf8');a=s.index('    void '+name+'(');b=s.index('{',a)+1;depth=1
    while depth:depth+=(s[b]=='{')-(s[b]=='}');b+=1
    return s[a:b]
native=r'''
package ls.augment.com.step;
import java.util.*;import java.util.function.Consumer;
public class GroupNativeCases {
 static int checks,done,failed;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static void rejects(Runnable r,String why){try{r.run();throw new AssertionError(why);}catch(IllegalStateException expected){checks++;}}
 static class IBinder {}
 static class Intent {SurfaceControl stage;int[] ids;int[] getIntArrayExtra(String k){return ids;}<T>T getParcelableExtra(String k,Class<T> t){return t.cast(stage);}}
 static class Handler {ArrayDeque<Runnable> now=new ArrayDeque<>(),later=new ArrayDeque<>();void post(Runnable r){now.add(r);}void postDelayed(Runnable r,long t){later.add(r);}void drain(){while(!now.isEmpty())now.remove().run();}}
 static class View {boolean attached=true,hardware=true;List<Runnable> frames=new ArrayList<>();boolean isAttachedToWindow(){return attached;}boolean isHardwareAccelerated(){return hardware;}View getViewTreeObserver(){return this;}void registerFrameCommitCallback(Runnable r){frames.add(r);}void invalidate(){}void frame(){frames.remove(0).run();}}
 static class SurfaceControl {
  static int count;int id=++count,releases;float alpha=1;boolean valid=true,shown,blocked;SurfaceControl parent;
  boolean isValid(){return valid;}void release(){releases++;}
  static class Builder {SurfaceControl s=new SurfaceControl();Builder setName(String n){return this;}Builder setParent(SurfaceControl p){s.parent=p;return this;}Builder setHidden(boolean b){s.shown=!b;return this;}SurfaceControl build(){return s;}}
  static class Transaction implements AutoCloseable {List<Runnable> ops=new ArrayList<>();Transaction setAlpha(SurfaceControl s,float a){ops.add(()->s.alpha=a);return this;}Transaction setVisibility(SurfaceControl s,boolean b){ops.add(()->s.shown=b);return this;}Transaction reparent(SurfaceControl s,SurfaceControl p){ops.add(()->s.parent=p);return this;}void apply(){ops.forEach(Runnable::run);ops.clear();}public void close(){}}
 }
 static class NativeWorkspaceGuard {static void validSurface(Object s){GroupNativeCases.validSurface(s);}}
 static class WorkspaceSurfaceInput {static boolean supported=true;static void blockChildren(SurfaceControl.Transaction tx,SurfaceControl s){if(!supported)throw new IllegalStateException("missing input capability");s.blocked=true;}}
 static class Wm {static boolean active=true;static Object context=new Object(),display=new Object(),ownedSpec=new Object();}
 static class WorkspaceZoom {static boolean entered;}
 static class WorkspaceReadmit {static boolean available=true;static Object pending;}
 static class WorkspaceUsers {static boolean allows(Object c,int p,int u){return u==0;}}
 static class Task {Object parent=new Object(),display=Wm.display,bounds;SurfaceControl surface=new SurfaceControl();boolean running=true,window=true,drawn=true,reported=true;int mode=6;}
 static class SavedTask {int user,id,layerId;boolean dirty=true;Object token=new Object(),parent;Task task=new Task();SavedTask(int i){id=i;layerId=task.surface.id;parent=task.parent;task.bounds=logical;}}
 static Object logical=new Object(),actualSpec=Wm.ownedSpec;static boolean active=true,ending,screen=true,identity=true;static IBinder owner=new IBinder();static int principal;
 static SideSlots slots=new SideSlots();static Map<Integer,SavedTask> saved=new HashMap<>();
 static Object liveTask(int id,Object token){SavedTask r=saved.get(id);return identity&&r!=null&&token==r.token?r.task:null;}
 static boolean interactive(Object c){return screen;}static boolean runningActivity(Object t){return t instanceof Task && ((Task)t).running;}
 static void validSurface(Object s){if(!(s instanceof SurfaceControl)||!((SurfaceControl)s).valid)throw new IllegalStateException("surface");}
 static Object field(Object o,String k){return actualSpec;}
 static void diagnostic(String a,String b){}
 static Object call(Object o,String n,Object... a){
  if(o instanceof Task t)return switch(n){case "getParent"->t.parent;case "getDisplayContent"->t.display;case "getWindowingMode"->t.mode;case "getBounds"->t.bounds;case "getSurfaceControl"->t.surface;case "topRunningActivity"->t;case "findMainWindow"->t.window?t:null;case "isDrawn"->t.drawn;case "isReportedDrawn"->t.reported;default->throw new AssertionError(n);};
  if(o instanceof SurfaceControl s&&n.equals("getLayerId"))return s.id;
  if(o instanceof SurfaceControl.Builder&&n.equals("setContainerLayer"))return o;
  if(o instanceof SurfaceControl.Transaction t&&n.equals("setAlpha"))return t.setAlpha((SurfaceControl)a[0],(Float)a[1]);
  throw new AssertionError(n);
 }
 PRODUCTION
 static Intent fresh(int count){
  NativeEntry.reset();owner=new IBinder();active=Wm.active=screen=identity=true;ending=false;actualSpec=Wm.ownedSpec;WorkspaceReadmit.pending=null;WorkspaceReadmit.available=true;WorkspaceZoom.entered=false;
  slots=new SideSlots();saved.clear();for(int n=0;n<count;n++){SavedTask r=new SavedTask(10+n);saved.put(r.id,r);slots.replace(n,-1,r.id);}
  Intent i=new Intent();i.ids=slots.snapshot();i.stage=new SurfaceControl();i.stage.alpha=0;return i;
 }
 public static void main(String[] a)throws Exception{
  for(int count:new int[]{0,1,3,5}){
   Intent i=fresh(count);NativeEntry.prepare(i);check(i.stage.alpha==0,"preparation cannot reveal any side");
   rejects(()->NativeEntry.checkReady(i),"animation not committed");SurfaceControl.Transaction tx=new SurfaceControl.Transaction();NativeEntry.frame(tx,.5f);
   check(i.stage.alpha==0,"common alpha deferred until display transaction");tx.apply();check(i.stage.alpha==.5f,"one parent controls the whole set");
   NativeEntry.revealed=true;WorkspaceZoom.entered=true;NativeEntry.checkReady(i);checks++;
   rejects(()->NativeEntry.prepare(i),"no duplicate entry");NativeEntry.reset();check(i.stage.releases==1,"server releases its stage handle");
   for(SavedTask r:saved.values())check(r.task.surface.releases==0,"original surfaces remain owned");
  }
  for(int kind=0;kind<19;kind++){
   Intent i=fresh(3);SavedTask r=saved.get(11);
   switch(kind){case 0:r.dirty=false;break;case 1:r.user=10;break;case 2:identity=false;break;case 3:r.task.parent=new Object();break;case 4:r.task.display=new Object();break;case 5:r.task.mode=1;break;case 6:r.task.bounds=new Object();break;case 7:r.task.surface.id++;break;case 8:r.task.running=false;break;case 9:WorkspaceReadmit.available=false;break;case 10:r.task.window=false;break;case 11:r.task.drawn=false;break;case 12:r.task.reported=false;break;case 13:WorkspaceReadmit.pending=r;break;case 14:actualSpec=new Object();break;case 15:screen=false;break;case 16:i.ids[0]=-1;break;case 17:r.task.surface.valid=false;break;case 18:ending=true;break;}
   rejects(()->NativeEntry.prepare(i),"identity/drawing rejection "+kind);check(NativeEntry.stage==null&&i.stage.alpha==0,"failed set remains invisible");
  }
  Intent i=fresh(3);NativeEntry.prepare(i);NativeEntry.revealed=true;WorkspaceZoom.entered=true;saved.get(12).task.drawn=false;
  rejects(()->NativeEntry.checkReady(i),"drawing rechecked after presentation callbacks");saved.get(12).task.drawn=true;owner=new IBinder();
  rejects(()->NativeEntry.checkReady(i),"new session cannot inherit readiness");rejects(()->NativeEntry.frame(new SurfaceControl.Transaction(),1),"late animation rejected");
  SurfaceControl parent=new SurfaceControl();WorkspaceEntry e=new WorkspaceEntry(parent);check(e.surface.alpha==0&&e.surface.shown&&e.surface.blocked,"staging gates composition and child input without hiding WM windows");
  check(e.parent(parent)==e.surface,"renderer always uses staging parent");rejects(()->e.parent(new SurfaceControl()),"changed native preview parent rejected");
  Handler h=new Handler();View p=new View(),bar=new View();done=failed=0;e.frames(h,()->done++,s->failed++,p,bar);
  p.frame();h.drain();check(done==0,"panel alone not ready");bar.frame();h.drain();check(done==1,"both views acknowledged");h.later.remove().run();check(failed==0,"completed deadline harmless");
  e.frames(h,()->done++,s->failed++,p,bar);e.cancelFrames();p.frame();bar.frame();h.drain();h.later.remove().run();check(done==1&&failed==0,"cancelled generation ignores all callbacks");
  e.frames(h,()->done++,s->failed++,p,bar);h.later.remove().run();p.frame();bar.frame();h.drain();check(done==1&&failed==1,"late draw after deadline cannot succeed");
  View missing=new View();missing.hardware=false;e.frames(h,()->done++,s->failed++,p,missing);p.frame();h.drain();check(done==1&&failed==2,"unknown drawing capability fails closed");
  e.close();e.close();check(e.surface.releases==1&&e.surface.parent==null,"stage removed once after restoration");
  WorkspaceSurfaceInput.supported=false;try{new WorkspaceEntry(parent);throw new AssertionError("missing input adapter");}catch(IllegalStateException expected){checks++;}
  System.out.println("PASS "+checks+" production group surface, view-frame, identity and drawing checks");
 }
}
'''.replace('PRODUCTION',nested('NativeEntry')+'\n'+nested('WorkspaceEntry'))
host=r'''
package ls.augment.com.step;
import java.util.*;import java.util.function.Consumer;
public class GroupHostCases {
 static int checks,reports;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class Queue {ArrayDeque<Runnable> pending=new ArrayDeque<>();void post(Runnable r){pending.add(r);}void execute(Runnable r){post(r);}void postDelayed(Runnable r,long ms){}void drain(){while(!pending.isEmpty())pending.remove().run();}}
 static class Shell {static Queue executor=new Queue();}
 static class SystemClock {static long elapsedRealtime(){return 1;}}
 static class CornerEntry {static long completedAt;}
 static class StepRuntime {static void report(Object sink,int code,String detail,int id){check(code==11,"only final ready");reports++;}}
 static class Bundle {Map<String,Object> map=new HashMap<>();void putIntArray(String k,int[] v){map.put(k,v);}int[] getIntArray(String k){return (int[])map.get(k);}boolean getBoolean(String k){return Boolean.TRUE.equals(map.get(k));}}
 static class View {void getLocationOnScreen(int[] p){p[0]=800;p[1]=320;}int getWidth(){return 280;}}
 static class Entry {boolean preparing=true,finishing,complete;Runnable frames;void frames(Queue q,Runnable done,Consumer<String> fail,View... v){frames=done;}void painted(){Runnable r=frames;frames=null;r.run();}}
 static class Deck {void restorePage(int p){}}
 static class Upper {void render(boolean a,boolean b){}void render(boolean a){}}
 static class WorkspaceDeck {static final int NAVIGATION=5;}
 static class Bar {Deck deck=new Deck();Upper upper;View bar=new View();}
 static class Geometry {int sideX=800,top=320;}
 static class Ownership {String path(){return "exact";}}
 static class Input {int released,ended;Runnable pending;void release(Runnable r){released++;pending=r;}void endEntryHold(){ended++;}void frame(){Runnable r=pending;pending=null;r.run();}}
 Queue main=new Queue();Entry entry=new Entry();Bar quickBar=new Bar();Input input=new Input();View panel=new View();Geometry geometry=new Geometry();Ownership ownership=new Ownership();
 OperationFence fence=new OperationFence();SideSlots slots=new SideSlots();int[] retained={11,22,33};int restorePage,upperId=-1,upperAppId=44,upperNavigationId=-1,previewWidth=280,zooms,published;boolean closing,closed,restoreTopFace,renewable=true;
 Object reportTo;Runnable renew=()->{},rendered,zoomed,upperDone;Consumer<Bundle> reply;String failure;
 void render(Runnable done){rendered=done;}void zoom(boolean enter,Runnable done){check(enter,"entry animation");zooms++;zoomed=done;}void upperActionFor(int id,String action,Runnable done){upperDone=done;}
 void fail(String s){failure=s;closing=true;fence.close();}void publishViewState(){published++;}void rpc(String a,Bundle b,Consumer<Bundle> done){check(a.equals("entryReady"),"final server readiness");reply=done;}
 METHODS
 static GroupHostCases prepared(){
  reports=0;Shell.executor=new Queue();GroupHostCases h=new GroupHostCases();h.slots.replace(0,-1,11);h.slots.replace(1,-1,22);h.slots.replace(2,-1,33);return h;
 }
 static void toZoom(GroupHostCases h){h.finishReadmission();Shell.executor.drain();h.rendered.run();h.main.drain();h.entry.painted();}
 Bundle response(){Bundle b=new Bundle();b.map.put("entryReady",true);b.putIntArray("slots",slots.snapshot());return b;}
 public static void main(String[] args){
  GroupHostCases h=prepared();h.finishReadmission();h.finishReadmission();check(h.zooms==0&&reports==0,"no animation/ready during preparation");Shell.executor.drain();
  check(h.rendered!=null&&h.entry.frames==null,"wait for final preview transaction");h.rendered.run();h.main.drain();check(h.zooms==0,"wait for both hidden final UI frames");h.entry.painted();
  check(h.zooms==1&&h.input.released==0&&reports==0,"begin one unified entry with input still held");h.zoomed.run();h.finishEntry();
  check(h.reply==null&&h.fence.busy()&&reports==0,"wait for visible final UI frames");h.entry.painted();check(h.reply!=null&&reports==0,"UI frames need native confirmation");
  h.reply.accept(h.response());check(h.input.released==1&&!h.entry.complete&&reports==0,"native confirmation still waits for input frame");h.input.frame();
  check(h.entry.complete&&reports==1&&h.published==1&&!h.fence.busy(),"only whole completion publishes readiness");h.finishEntry();check(reports==1,"no duplicate readiness");
  h=prepared();final int[] callbacks={0};h.releaseStepInput(()->callbacks[0]++);check(h.input.released==0&&callbacks[0]==1,"per-task completion does not release input during entry");h.entry.complete=true;h.releaseStepInput(()->callbacks[0]++);check(h.input.released==1&&callbacks[0]==1,"ordinary operation still waits for release");h.input.frame();
  h=prepared();h.restoreTopFace=true;h.upperId=44;h.quickBar.upper=new Upper();toZoom(h);h.zoomed.run();check(h.upperDone!=null&&!h.entry.finishing&&reports==0,"restored top window participates in final readiness");h.upperDone.run();check(h.entry.finishing,"top restoration precedes final gate");
  h=prepared();h.finishReadmission();Shell.executor.drain();h.closing=true;h.rendered.run();h.main.drain();check(h.zooms==0&&reports==0,"exit cancels queued preparation");
  h=prepared();toZoom(h);h.zoomed.run();h.entry.painted();Bundle bad=h.response();bad.putIntArray("slots",new int[]{9});try{h.reply.accept(bad);throw new AssertionError("mismatched ready");}catch(IllegalStateException expected){checks++;}check(h.input.released==0&&reports==0,"mismatched group cannot release/announce");
  System.out.println("PASS "+checks+" production preparation, unified entry and final readiness checks");
 }
}
'''.replace('METHODS','\n'.join(method(n) for n in ['finishReadmission','releaseStepInput','finishEntry'])).replace('android.os.SystemClock','SystemClock')
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-group-entry-') as tmp:
    p=Path(tmp)
    for name,source in [('GroupNativeCases',native),('GroupHostCases',host)]:
        path=p/(name+'.java');path.write_text(source,encoding='utf8')
        subprocess.run([java/'javac','-encoding','UTF-8','-d',p,path,STEP/'SideSlots.java',STEP/'OperationFence.java',STEP/'CommitBarrier.java'],check=True)
        subprocess.run([java/'java','-cp',p,'ls.augment.com.step.'+name],check=True)
