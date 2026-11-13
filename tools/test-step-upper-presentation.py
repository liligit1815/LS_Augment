"""Exercise production upper ownership, native transition repair and physical Back region selection."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
def method(file,signature):
    s=(STEP/file).read_text('utf-8');a=s.index(signature);b=s.index('{',a)+1;depth=1
    while depth:depth+=(s[b]=='{')-(s[b]=='}');b+=1
    return s[a:b]
code=r'''
package ls.augment.com.step;
import java.util.*;
class StepHook{}class StepHooks{static void hookMethod(java.lang.reflect.Method m,StepHook h){}}
public class UpperPresentationCases {
 static int checks;
 static void check(boolean yes,String why){checks++;if(!yes)throw new AssertionError(why);}
 static Object call(Object o,String n,Object... a){return StepMembers.callMethod(o,n,a);}
 static Object field(Object o,String n){return StepMembers.getObjectField(o,n);}
 static void diagnostic(String a,String b){}static boolean interactive(Object c){return unlocked;}
 static boolean active=true,ending,unlocked=true;static Object pendingCommit,flip;static int principal;
 static Map<Integer,SavedTask> saved=new HashMap<>();static Rect logical=new Rect(1216,2688);
 static class Point {int x,y;}
 static class Rect {int right,bottom;Rect(int w,int h){right=w;bottom=h;}int width(){return right;}int height(){return bottom;}}
 static class SurfaceControl {
  int layer=7;boolean valid=true;int getLayerId(){return layer;}boolean isValid(){return valid;}
  static class Transaction{List<String> writes=new ArrayList<>();Map<SurfaceControl,Boolean> visible=new HashMap<>();
   Transaction reparent(SurfaceControl s,SurfaceControl p){writes.add("parent");return this;}
   Transaction setAlpha(SurfaceControl s,float a){check(a==1,"restore native opacity");writes.add("alpha");return this;}
   Transaction setVisibility(SurfaceControl s,boolean on){visible.put(s,on);writes.add("visible");return this;}}
 }
 static class Parent {SurfaceControl surface=new SurfaceControl();SurfaceControl getSurfaceControl(){return surface;}}
 static class Task extends Parent {
  int mode=6;boolean live=true,hidden;Parent parent=new Parent();Rect bounds=NativeTopTask.bounds;Point at=new Point();
  Parent getParent(){return parent;}int getWindowingMode(){return mode;}Object getDisplayContent(){return Wm.display;}
  Rect getBounds(){return bounds;}Point getRelativePosition(){return at;}boolean isForceHidden(){return hidden;}
 }
 static class SavedTask {int id,user,layerId=7;boolean dirty=true;Object token=new Object();Task task=new Task();Parent parent=task.parent;SavedTask(int n){id=n;}}
 static class NativeTopTask {
  static SavedTask app,navigation,upper;static boolean hidden;static Rect bounds=new Rect(2773,1560),viewport=new Rect(1216,684);
  static SavedTask held(Object task){return app!=null && app.task==task?app:navigation!=null && navigation.task==task?navigation:null;}
  static boolean held(int id){return app!=null && app.id==id || navigation!=null && navigation.id==id;}
 }
 static class UpperMotion {static Object current;static void position(SurfaceControl.Transaction tx,SurfaceControl s,Rect b,Rect v,float x,float y,float p){check(p==1,"stable native transition never shrinks top");tx.writes.add("position");}}
 static class WorkspaceUsers {static boolean allows(Object c,int p,int u){return p==u;}}
 static class WindowManager {static int TRANSIT_CHANGE=6;}
 static class WindowConfiguration {int mode;WindowConfiguration(int m){mode=m;}int getWindowingMode(){return mode;}}
 static class Configuration {WindowConfiguration windowConfiguration;Configuration(int m){windowConfiguration=new WindowConfiguration(m);}}
 static class Info {int taskId;Object token;Configuration configuration;Info(SavedTask r){taskId=r.id;token=r.token;configuration=new Configuration(r.task.mode);}}
 static class Change {Info taskInfo;SurfaceControl leash;int mode=6;Change(SavedTask r){taskInfo=new Info(r);leash=r.task.surface;}Object getTaskInfo(){return taskInfo;}Object getLeash(){return leash;}int getMode(){return mode;}}
 static class TransitionInfo {List<Change> changes=new ArrayList<>();List<Change> getChanges(){return changes;}}
 static class SideLifecycle {static boolean available=true;}
 static class Service {int focuses;void updateFocusedWindowLocked(int reason,boolean update){focuses++;}}
 static class Display {Monitor mInputMonitor=new Monitor();}
 static class Monitor {int updates;void updateInputWindowsLw(boolean force){updates++;}}
 static class Wm {static Object lock=new Object(),context=new Object();static Display display=new Display();static Service service=new Service();}
 static Object liveTask(int id,Object token){SavedTask r=saved.get(id);return r!=null && r.token==token && r.task.live?r.task:null;}
 static boolean runningActivity(Object t){return ((Task)t).live;}
 static void validSurface(Object s){if(!((SurfaceControl)s).valid)throw new IllegalStateException();}
 static class UpperTaskPresentation {OWNS STAGE ISOLATE}
 static class SideTransitionTargets {SIDETARGET}
 static class Slots {int id=44;int[] snapshot(){return new int[]{id};}int index(int n){return n==id?0:-1;}}
 static Slots slots=new Slots();static boolean settled=true;
 static boolean settledSideSnapshot(int[] expected){return settled && active && !ending && pendingCommit==null && flip==null;}
 static class WorkspaceBackFocus {static boolean mainPreferred;SELECT}
 static void fresh(){saved.clear();NativeTopTask.app=new SavedTask(42);NativeTopTask.navigation=new SavedTask(43);NativeTopTask.upper=NativeTopTask.app;
  saved.put(42,NativeTopTask.app);saved.put(43,NativeTopTask.navigation);NativeTopTask.navigation.task.hidden=true;
  NativeTopTask.hidden=false;active=unlocked=SideLifecycle.available=true;ending=false;pendingCommit=flip=UpperMotion.current=null;WorkspaceBackFocus.mainPreferred=false;}
 public static void main(String[] args)throws Exception{
  synchronized(Wm.lock){
   for(int scenario=0;scenario<8;scenario++){
    fresh();settled=true;SavedTask side=new SavedTask(44),app=new SavedTask(1);app.task.mode=1;saved.put(44,side);
    Change held=new Change(side),main=new Change(app);TransitionInfo info=new TransitionInfo();info.changes.add(held);info.changes.add(main);
    switch(scenario){case 1:settled=false;break;case 2:held.mode=1;break;case 3:held.taskInfo.token=new Object();break;
     case 4:held.leash=new SurfaceControl(){int getLayerId(){return 99;}};break;case 5:main.taskInfo.configuration.windowConfiguration.mode=6;break;
     case 6:pendingCommit=new Object();break;case 7:ending=true;break;}
    SideTransitionTargets.isolate(info);
    check(info.changes.contains(held)==(scenario!=0),"only settled verified side CHANGE excluded "+scenario);
    check(info.changes.contains(main),"main animation never removed "+scenario);
   }
   fresh();SurfaceControl.Transaction tx=new SurfaceControl.Transaction();UpperTaskPresentation.stage(tx);
   check(tx.writes.size()==8 && tx.visible.get(NativeTopTask.app.task.surface) && !tx.visible.get(NativeTopTask.navigation.task.surface),"native back transition restores only displayed top and keeps peer hidden");
   check(UpperTaskPresentation.owns(NativeTopTask.app.task),"upper window excluded from main system-bar appearance with exact owner");
   for(int scenario=0;scenario<7;scenario++){
    fresh();TransitionInfo info=new TransitionInfo();Change upper=new Change(NativeTopTask.app),nav=new Change(NativeTopTask.navigation);
    SavedTask main=new SavedTask(1);main.task.mode=1;Change lower=new Change(main);info.changes.add(upper);info.changes.add(nav);if(scenario!=1&&scenario!=6)info.changes.add(lower);
    if(scenario==6)upper.taskInfo.configuration.windowConfiguration.mode=1;
    if(scenario==2)upper.mode=2;if(scenario==3)upper.taskInfo.token=new Object();if(scenario==4)pendingCommit=new Object();if(scenario==5)upper.leash=new SurfaceControl(){int getLayerId(){return 99;}};
    tx=new SurfaceControl.Transaction();UpperTaskPresentation.isolateTransition(info,tx);
    check(info.changes.contains(lower)==(scenario!=1&&scenario!=6),"main targets preserved "+scenario);
    check(info.changes.contains(upper)==(scenario!=0),"only verified stable CHANGE upper excluded from remote main animation "+scenario);
    check(info.changes.contains(nav)==(scenario==1||scenario==4||scenario==6),"independent navigation isolation follows same ownership "+scenario);
   }
   fresh();
   NativeTopTask.hidden=true;tx=new SurfaceControl.Transaction();UpperTaskPresentation.stage(tx);check(!tx.visible.containsValue(true),"parked pages stay hidden");
   for(int mode=0;mode<8;mode++){
    fresh();SavedTask r=NativeTopTask.app;switch(mode){case 0:r.task.parent=new Parent();break;case 1:r.layerId=99;break;case 2:r.user=10;break;case 3:r.task.mode=5;break;case 4:r.task.live=false;break;case 5:r.dirty=false;break;case 6:saved.put(42,new SavedTask(42));break;case 7:ending=true;break;}
    check(!UpperTaskPresentation.owns(r.task),"foreign identity preserves native appearance and surfaces "+mode);
   }
   for(int mode=0;mode<4;mode++){
    fresh();switch(mode){case 0:pendingCommit=new Object();break;case 1:UpperMotion.current=new Object();break;case 2:ending=true;break;case 3:active=false;break;}
    tx=new SurfaceControl.Transaction();UpperTaskPresentation.stage(tx);check(tx.writes.isEmpty(),"handoff and exit retain transform ownership "+mode);
   }
   fresh();check(WorkspaceBackFocus.select(2,1200) && WorkspaceBackFocus.mainPreferred,"lower Back chooses main");int updates=Wm.service.focuses;
   check(WorkspaceBackFocus.select(2,1200) && Wm.service.focuses==updates,"same region avoids repeated focus IPC writes");
   check(WorkspaceBackFocus.select(500,200) && !WorkspaceBackFocus.mainPreferred,"touching native upper restores its keyboard and Back target");
   for(float[] point:new float[][]{{-1,10},{1216,10},{10,-1},{10,2688},{Float.NaN,10},{10,Float.POSITIVE_INFINITY}})
    check(!WorkspaceBackFocus.select(point[0],point[1]),"invalid physical coordinates never choose a task");
   SideLifecycle.available=false;check(!WorkspaceBackFocus.select(1,1000),"missing focus-selection capability keeps native behavior");SideLifecycle.available=true;
   unlocked=false;check(!WorkspaceBackFocus.select(1,1000),"locked phone cannot redirect input");
   fresh();NativeTopTask.hidden=true;check(!WorkspaceBackFocus.select(1,1000),"hidden top never intercepts Back");
  }
  fresh();check(!UpperTaskPresentation.owns(NativeTopTask.app.task),"ownership reads require the native global lock");
  System.out.println("PASS "+checks+" native upper transition / appearance / Back region checks");
 }
}
'''.replace('OWNS',method('UpperTaskPresentation.java','    static boolean owns(')).replace('STAGE',method('UpperTaskPresentation.java','    static void stage(')).replace('ISOLATE',method('UpperTaskPresentation.java','    static void isolateTransition(').replace('android.view.WindowManager','WindowManager')).replace('SELECT',method('WorkspaceBackFocus.java','    static boolean select('))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
code=code.replace('SIDETARGET',method('SideTransitionTargets.java','    static void isolate(').replace('android.view.WindowManager','WindowManager'))
with tempfile.TemporaryDirectory(prefix='step-upper-presentation-') as tmp:
    p=Path(tmp);f=p/'UpperPresentationCases.java';f.write_text(code,'utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f,STEP/'StepMembers.java'],check=True)
    subprocess.run([java/'java','-cp',p,'ls.augment.com.step.UpperPresentationCases'],check=True)
