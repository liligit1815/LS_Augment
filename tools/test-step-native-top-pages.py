"""Execute the production native upper-task transactions with two independently held pages."""
from pathlib import Path
import os, subprocess, tempfile
root=Path(__file__).resolve().parents[1]
step=root/'android/app/src/main/java/ls/augment/com/step'
sources={
'android/os/IBinder.java':'package android.os; public interface IBinder {}',
'android/os/ResultReceiver.java':'package android.os; public class ResultReceiver {public ResultReceiver(Object h){} protected void onReceiveResult(int c,Bundle b){} public void send(int c,Bundle b){onReceiveResult(c,b);}}',
'android/os/SystemClock.java':'package android.os; public class SystemClock {public static long uptimeMillis(){return 1;}}',
'android/os/Bundle.java':'''package android.os; public class Bundle extends java.util.HashMap<String,Object>{public void putInt(String k,int v){put(k,v);}public void putBoolean(String k,boolean v){put(k,v);}public void putParcelable(String k,Object v){put(k,v);}public int getInt(String k){return (Integer)get(k);}public boolean getBoolean(String k){return (Boolean)get(k);}}''',
'android/content/Intent.java':'''package android.content; public class Intent extends android.os.Bundle {public Intent putExtra(String k,Object v){put(k,v);return this;}public String getStringExtra(String k){return (String)get(k);}public int getIntExtra(String k,int d){return containsKey(k)?(Integer)get(k):d;}public boolean getBooleanExtra(String k,boolean d){return containsKey(k)?(Boolean)get(k):d;}public <T>T getParcelableExtra(String k){return (T)get(k);}}''',
'android/graphics/Rect.java':'''package android.graphics; public class Rect {public int left,top,right,bottom;public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public Rect(Rect r){this(r.left,r.top,r.right,r.bottom);}public int width(){return right-left;}public int height(){return bottom-top;}public boolean equals(Object o){return o instanceof Rect r&&left==r.left&&top==r.top&&right==r.right&&bottom==r.bottom;}}''',
'android/graphics/Point.java':'package android.graphics; public class Point {}',
'android/view/SurfaceControl.java':'''package android.view; public class SurfaceControl {public int getLayerId(){return 7;}public static class Transaction {public boolean applied;public void apply(){applied=true;}public void close(){}}}''',
'android/app/ActivityManager.java':'package android.app; public class ActivityManager {}',
'com/android/server/wm/TaskDisplayArea.java':'package com.android.server.wm; public class TaskDisplayArea {}',
'com/android/server/wm/Task.java':'''package com.android.server.wm; import android.graphics.*; public class Task {public boolean supportsMultiWindowInDisplayArea(TaskDisplayArea a){return true;}public TaskDisplayArea getTaskDisplayArea(){return new TaskDisplayArea();}public boolean isForceHidden(){return false;}public Point getRelativePosition(){return new Point();}}''',
'ls/augment/com/step/TopCases.java':r'''
package ls.augment.com.step;
import android.os.*;import android.content.Intent;import android.graphics.Rect;import android.view.SurfaceControl;
import java.util.*;import static ls.augment.com.step.NativeWorkspaceGuard.*;
class StepRuntime {
 static Object call(Object o,String n,Object... a){return StepMembers.callMethod(o,n,a);}static Object field(Object o,String n){return StepMembers.getObjectField(o,n);}
 static boolean interactive(Object c){return true;}static ResultReceiver remote(ResultReceiver r){return r;}
 static class Handler{List<Runnable> queued=new ArrayList<>();void postDelayed(Runnable r,long delay){queued.add(r);}}
 static class Wm {static Object lock=new Object();static Handler handler=new Handler();static Context context=new Context();static ClassLoader loader=TopCases.class.getClassLoader();static Display display=new Display();}
 static class Context {Context getResources(){return this;}Context getDisplayMetrics(){return this;}float density=3.25f;int densityDpi=520;}
 static class Display {SurfaceControl.Transaction getPendingTransaction(){return new SurfaceControl.Transaction();}}
}
class StepHook {}class StepHooks{static void hookMethod(java.lang.reflect.Method m,StepHook h){}}
class OwnershipBridge {static java.lang.reflect.Method method(Class<?> c,String n,Class<?>... a)throws NoSuchMethodException{return c.getMethod(n,a);}}
class WorkspaceUsers{static boolean allows(Object c,int p,int u){return p==u;}}
class WorkspaceCapacity{static boolean canAdd(int c,boolean upper){return c>=0&&c<=5;}}
class WorkspaceResize{static boolean supportsUpper(Object t){return true;}}
class WorkspaceMainFocus{static boolean matches(Object t){return t==main;}}
class WorkspaceLayout{int contentHeight=684;static WorkspaceLayout create(int w,int h,float d,boolean l,int n,int inset,boolean reflow){return new WorkspaceLayout();}}
class UpperAppLayout{static boolean available=true;static Rect landscapeCanvas(Rect r,int s,int dpi){return new Rect(0,0,2773,1560);}}
class WorkspaceBackFocus{static boolean mainPreferred;}
class WorkspaceReadmit{static boolean available=true;}
class UpperTaskPresentation{static boolean owns(Object t){return NativeTopTask.held(t)!=null;}}
class UpperMotion{static int mainChanges,plays;static float lastScale;static void position(SurfaceControl.Transaction tx,SurfaceControl sc,Rect b,Rect v,float x,float y,float p){lastScale=p;}static void mainScale(float p){mainChanges++;}static void play(SavedTask r,boolean entering,Runnable done){plays++;done.run();}static void play(SavedTask r,boolean entering,boolean main,Runnable done){if(main)mainChanges++;done.run();}}
class ParkedWorkspace{static int UPPER=5,NAVIGATION=6;}
class NativeWorkspaceGuard {
 static class Binder implements IBinder{}
 static class Parent {Rect getBounds(){return logical;}}
 static class Window {boolean drawn=true;boolean isDrawn(){return drawn;}}
 static class Activity {Window window=new Window();Window findMainWindow(){return window;}boolean isReportedDrawn(){return window.drawn;}}
 static class Task {int mUserId,id,type=1,mode=1;boolean focus=true,hidden,toFront=true;Rect bounds=logical;Parent parent=new Parent();SurfaceControl surface=new SurfaceControl();Object token;Activity activity=new Activity();Activity topRunningActivity(){return activity;}
  Object getParent(){return parent;}SurfaceControl getSurfaceControl(){return surface;}int getWindowingMode(){return mode;}int getActivityType(){return type;}Rect getBounds(){return bounds;}boolean isFocusable(){return focus;}boolean isForceHidden(){return hidden;}void clearMagnificationSpec(SurfaceControl.Transaction t){}
 }
 static class SavedTask{Task task;int id,user,layerId=7;Object token,parent;boolean dirty;SavedTask(int id){this.id=id;task=new Task();task.id=id;task.token=token=new Binder();parent=task.parent;}}
 static class CommitBarrier{List<SurfaceControl.Transaction> surfaces=new ArrayList<>();int add(){return 1;}void seal(){}void commit(int i){}String snapshot(){return "mock";}}
 static class Slots{int count(){return 5;}}
 static class Readmitting{boolean matches(int s,int id,int u,Object t){return true;}void consumed(int s){}}
 static Slots slots=new Slots();static Readmitting readmitting=new Readmitting();static Map<Integer,SavedTask> saved=new HashMap<>();
 static IBinder owner=new Binder();static int principal,layoutCount=5,layoutInset;static boolean sideLeft=true,mainReflow=true,active=true,ending;
 static Rect logical=new Rect(0,0,1216,2688);static Task main;static CommitBarrier pendingCommit;static Object unpublishedSurface,flip;static Set<Integer> gone=new HashSet<>();
 static boolean drawOccluded,checkRevealOrder,nativeAcknowledged;static Bundle result;static ResultReceiver events=new ResultReceiver(null){protected void onReceiveResult(int c,Bundle b){if(checkRevealOrder&&!nativeAcknowledged)throw new AssertionError("retained upper uncovered before its unhide transaction committed");drawOccluded=false;((ResultReceiver)b.get("ready")).send(1,new Bundle());}};
 static class Wct{Task boundsTarget;List<Runnable> changes=new ArrayList<>();Task task(Object token){for(SavedTask s:saved.values())if(s.token==token)return s.task;throw new AssertionError("token");}
  void setWindowingMode(Object token,int mode){changes.add(()->task(token).mode=mode);}void setBounds(Object token,Rect bounds){changes.add(()->task(token).bounds=bounds);}void setAlwaysOnTop(Object token,boolean b){}
  void setFocusable(Object token,boolean b){changes.add(()->task(token).focus=b);}void setHidden(Object token,boolean b){changes.add(()->task(token).hidden=b);}void setBoundsChangeTransaction(Object token,Object tx){boundsTarget=task(token);}void reorder(Object token,boolean b){changes.add(()->task(token).toFront=b);}
 }
 static Object transaction(){return new Wct();}static Object surfaceTransaction(){return new SurfaceControl.Transaction();}
 static Object liveTask(int id,Object token){SavedTask s=saved.get(id);return !gone.contains(id)&&s!=null&&s.task.token==token?s.task:null;}
 static boolean runningActivity(Object t){return true;}static void trackCommit(Object tx,CommitBarrier b){b.surfaces.add((SurfaceControl.Transaction)tx);}static void apply(Object w){Wct c=(Wct)w;c.changes.forEach(Runnable::run);drawOccluded=c.boundsTarget!=null && c.boundsTarget.mode==6 && !c.boundsTarget.hidden;}
 static void rememberMain(Object t){main=(Task)t;}static void restore(Object w,SavedTask s,CommitBarrier b){Wct c=(Wct)w;c.setWindowingMode(s.token,1);c.setBounds(s.token,logical);c.setFocusable(s.token,true);c.setHidden(s.token,false);main=s.task;}
 static void restore(Object w,SavedTask s,CommitBarrier b,Object shared){if(shared==null)throw new AssertionError("hidden outgoing exchange needs the incoming commit carrier");restore(w,s,b);}
 static void verifyRestored(SavedTask s){if(s.task.mode!=1||!s.task.bounds.equals(logical)||s.task.hidden||!s.task.focus)throw new AssertionError("restore");}
 static void replay(){}static void replay(CommitBarrier b,SavedTask s){}static void traceHandoff(String n,int a,int b,int c){}
 static void awaitCommit(CommitBarrier b,IBinder o,long d,Runnable ok,Runnable fail){if(drawOccluded)throw new AssertionError("app draw waits for wallpaper host to reveal its window");for(SurfaceControl.Transaction t:b.surfaces)if(!t.applied)throw new AssertionError("configuration relaunch discarded deferred window transaction");if(!b.surfaces.isEmpty())nativeAcknowledged=true;pendingCommit=null;ok.run();}
 static void finish(String why){throw new AssertionError(why);}static Bundle base(){return new Bundle();}static void respond(ResultReceiver r,int code,Bundle b,String message){result=b;}
}
public class TopCases {
 static boolean bridge;
 static int checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static SavedTask add(int id){SavedTask s=new SavedTask(id);saved.put(id,s);return s;}
 static void action(SavedTask s,String action,boolean nav)throws Exception{
  checkRevealOrder="show".equals(action);nativeAcknowledged=false;
  SavedTask home=saved.get(1);
  NativeTopTask.change(new Intent().putExtra("task",s.id).putExtra("token",s.token).putExtra("topAction",action).putExtra("navigation",nav)
   .putExtra("bounds",new Rect(0,0,1216,684)).putExtra("home",1).putExtra("homeToken",home.token).putExtra("frameBridge",bridge),null);
 }
 static void swap(SavedTask incoming,SavedTask outgoing)throws Exception{
  checkRevealOrder=false;nativeAcknowledged=false;
  NativeTopTask.change(new Intent().putExtra("task",incoming.id).putExtra("token",incoming.token).putExtra("topAction","swap")
   .putExtra("previous",outgoing.id).putExtra("previousToken",outgoing.token).putExtra("bounds",new Rect(0,0,1216,684)).putExtra("frameBridge",bridge),null);
 }
 public static void main(String[] args)throws Exception{
  SavedTask home=add(1);home.task.type=2;SavedTask video=add(42),map=add(43);main=video.task;
  action(video,"take",false);check(NativeTopTask.app==video&&NativeTopTask.upper==video&&result.getInt("upperApp")==42,"take original video");
  action(video,"park",false);check(video.task.hidden&&!video.task.focus&&video.dirty,"park keeps video lease");
  main=map.task;action(map,"take",true);check(NativeTopTask.navigation==map&&NativeTopTask.app==video&&result.getInt("upperNavigation")==43,"navigation coexists with video and five side slots");
  check(map.task.mode==6&&!map.task.hidden&&video.task.hidden&&video.task.mode==6,"only map is visible");
  for(int i=0;i<4;i++){
   action(video,"show",false);check(!video.task.hidden&&map.task.hidden&&!map.task.focus,"switch map to retained video");
   action(map,"show",true);check(video.task.hidden&&!map.task.hidden&&!video.task.focus,"switch video to retained map");
  }
  video.task.activity.window.drawn=false;Bundle beforeDraw=result;
  action(video,"show",false);check(result==beforeDraw&&!StepRuntime.Wm.handler.queued.isEmpty(),"native visibility commit does not substitute for a recreated app buffer");
  video.task.activity.window.drawn=true;StepRuntime.Wm.handler.queued.remove(0).run();
  check(result!=beforeDraw&&result.getInt("upper")==video.id,"drawn native window releases page reveal");
  action(map,"show",true);
  Object old=video.parent;video.task.parent=new Parent();try{action(video,"show",false);throw new AssertionError("foreign parent");}catch(IllegalStateException expected){checks++;}video.task.parent=(Parent)old;
  action(video,"release",false);check(!video.dirty&&video.task.mode==1&&NativeTopTask.app==null,"return inactive video to main");
  check(map.dirty&&!map.task.hidden&&NativeTopTask.upper==map&&NativeTopTask.navigation==map&&NativeTopTask.bounds!=null,"returning hidden video preserves visible navigation and geometry");
  action(map,"show",true);check(!map.task.hidden&&result.getInt("upperApp")==-1,"remaining map can reopen");
  action(map,"release",true);check(!map.dirty&&map.task.mode==1&&!NativeTopTask.occupied()&&NativeTopTask.bounds==null,"last release restores and clears native state");
  check(result.getInt("released")==43&&result.getInt("upperNavigation")==-1,"host receives released identity");
  main=video.task;action(video,"resume",false);check(video.dirty&&video.task.hidden&&NativeTopTask.app==video,"old retained-video resume path still works");
  action(video,"show",false);action(video,"release",false);
  main=map.task;action(map,"resume",true);check(map.dirty&&map.task.hidden&&NativeTopTask.navigation==map,"navigation has its own retained role after unlock");
  action(map,"show",true);action(map,"release",true);
  main=map.task;action(map,"take",true);main=video.task;action(video,"take",false);
  check(map.task.hidden && !map.task.focus && !video.task.hidden && NativeTopTask.navigation==map && NativeTopTask.app==video,"adding video while navigation is visible parks only navigation in the same transaction");
  action(video,"release",false);action(map,"release",true);
  main=map.task;action(map,"take",true);main=video.task;action(video,"take",false);
  try{action(map,"dismiss",true);throw new AssertionError("hidden navigation dismissed");}catch(IllegalStateException expected){checks++;}
  action(video,"dismiss",false);
  check(!video.dirty && video.task.mode==1 && !video.task.toFront && NativeTopTask.app==null,"up removes current task to background without closing its task");
  check(NativeTopTask.navigation==map && map.dirty && map.task.hidden,"removing video preserves hidden navigation");
  action(map,"show",true);action(map,"release",true);
  check(map.task.toFront && NativeTopTask.navigation==null,"down returns original navigation to main");
  SavedTask next=add(44);main=map.task;action(map,"take",true);main=video.task;action(video,"take",false);action(video,"park",false);
  main=next.task;swap(next,video);
  check(NativeTopTask.app==next && NativeTopTask.upper==next && next.dirty && next.task.mode==6 && !next.task.hidden,"wallpaper exchange adopts original main task");
  check(!video.dirty && video.task.mode==1 && !video.task.hidden && video.task.focus && video.task.toFront && main==video.task,"outgoing upper is restored as main in the same transaction");
  check(result.getInt("released")==video.id && result.getInt("upperApp")==next.id,"host receives both exchanged identities");
  check(NativeTopTask.navigation==map && map.dirty && map.task.hidden,"exchange preserves independent navigation page");
  action(next,"park",false);swap(video,next);
  check(NativeTopTask.app==video && main==next.task && !next.dirty && next.task.mode==1,"exchange works in reverse with the same two task ids");
  action(video,"park",false);
  for(int change=0;change<5;change++){
   Object originalParent=video.task.parent,originalToken=video.token;int originalUser=video.user,originalLayer=video.layerId,originalMode=video.task.mode;
   switch(change){case 0:video.task.parent=new Parent();break;case 1:video.token=new Binder();break;case 2:video.user=10;break;case 3:video.layerId=99;break;case 4:video.task.mode=5;break;}
   try{swap(next,video);throw new AssertionError("changed outgoing identity accepted");}catch(IllegalStateException expected){checks++;}
   check(NativeTopTask.app==video && next.task.mode==1 && !next.dirty,"failed exchange has no partial adoption "+change);
   video.task.parent=(Parent)originalParent;video.token=originalToken;video.user=originalUser;video.layerId=originalLayer;video.task.mode=originalMode;
  }
  // A stale host can reference a different saved task without mutating the real outgoing task.
  try{swap(next,map);throw new AssertionError("stale previous id");}catch(IllegalStateException expected){checks++;}
  action(video,"release",false);action(map,"release",true);
  check(UpperMotion.mainChanges==0,"top return never animates the entire main display or desktop");
  main=map.task;action(map,"take",true);main=video.task;swap(video,map);
  check(NativeTopTask.app==video && NativeTopTask.navigation==null && main==map.task,"explicit main/top swap accepts the visible navigation task");
  int plays=UpperMotion.plays;action(video,"park",false);action(video,"show",false);
  check(UpperMotion.plays==plays && UpperMotion.lastScale==1f && NativeTopTask.progress==1f,"retained pages reopen at full size without black shrink/grow frames");
  main=map.task;action(map,"take",true);action(map,"park",true);action(video,"show",false);
  gone.add(map.id);NativeTopTask.removed(owner,map);
  check(NativeTopTask.app==video && NativeTopTask.upper==video && NativeTopTask.navigation==null && !map.dirty,"removing hidden navigation preserves visible upper app");
  check(result.getInt("removed")==map.id && !result.getBoolean("selectedRemoved"),"hidden removal tells host to preserve selected page");
  IBinder previousOwner=owner;owner=new Binder();gone.add(video.id);NativeTopTask.removed(previousOwner,video);
  check(NativeTopTask.app==video && video.dirty,"stale removal cannot touch a new owner");
  owner=previousOwner;pendingCommit=new CommitBarrier();NativeTopTask.removed(owner,video);
  check(video.dirty && !StepRuntime.Wm.handler.queued.isEmpty(),"removal waits for existing handoff barrier");
  pendingCommit=null;StepRuntime.Wm.handler.queued.remove(0).run();
  check(NativeTopTask.upper==null && NativeTopTask.app==null && !video.dirty && !saved.containsKey(video.id),"finished top task retires locally without closing main or sides");
  check(result.getBoolean("selectedRemoved"),"host receives selected page removal");
  gone.clear();SavedTask bridged=add(81),peer=add(82);main=bridged.task;bridge=true;
  int legacyPlays=UpperMotion.plays;Bundle beforeBridge=result;bridged.task.activity.window.drawn=false;
  action(bridged,"take",false);
  check(result==beforeBridge && NativeTopTask.progress==1 && UpperMotion.plays==legacyPlays,"frame bridge keeps target full size and waits for new app draw");
  bridged.task.activity.window.drawn=true;StepRuntime.Wm.handler.queued.remove(0).run();
  check(result.getInt("upper")==bridged.id,"drawn incoming task completes bridge");
  main=peer.task;beforeBridge=result;bridged.task.activity.window.drawn=false;swap(peer,bridged);
  check(result==beforeBridge,"swap waits for both the landscape incoming and portrait outgoing buffer");
  bridged.task.activity.window.drawn=true;StepRuntime.Wm.handler.queued.remove(0).run();
  check(result.getInt("released")==bridged.id && main==bridged.task,"both original task identities survive bridged swap");
  beforeBridge=result;peer.task.activity.window.drawn=false;action(peer,"release",false);
  check(result==beforeBridge,"return does not remove bridge before portrait redraw");
  peer.task.activity.window.drawn=true;StepRuntime.Wm.handler.queued.remove(0).run();
  check(result.getInt("released")==peer.id && UpperMotion.mainChanges==0,"return reveals only drawn original main task without desktop zoom");
  System.out.println("PASS "+checks+" production dual upper-task transaction checks");
 }
}
'''}
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-native-top-pages-') as directory:
 p=Path(directory)
 for name,code in sources.items():
  f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(code,encoding='utf-8')
 files=list(p.rglob('*.java'))+[step/'NativeTopTask.java',step/'StepMembers.java']
 subprocess.run([java/'javac','-encoding','UTF-8','-d',p,*files],check=True)
 subprocess.run([java/'java','-cp',p,'ls.augment.com.step.TopCases'],check=True)
