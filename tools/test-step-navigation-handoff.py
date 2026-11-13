"""Exercise the production map handoff while Shell is still completing its transition."""
from pathlib import Path
import os, subprocess, tempfile
root=Path(__file__).resolve().parents[1]
step=root/'android/app/src/main/java/ls/augment/com/step'
sources={
'android/annotation/SuppressLint.java':'package android.annotation;public @interface SuppressLint {String[] value();}',
'android/Manifest.java':'package android;public class Manifest {public static class permission {public static String REORDER_TASKS="reorder";}}',
'android/content/pm/PackageManager.java':'package android.content.pm;public class PackageManager {public static final int PERMISSION_GRANTED=0;}',
'android/os/SystemClock.java':'package android.os; public class SystemClock {public static long now;public static long uptimeMillis(){return now;}}',
'android/app/Notification.java':'package android.app; public class Notification {public static final String CATEGORY_NAVIGATION="navigation";public static final int FLAG_ONGOING_EVENT=2;public String category;public int flags;}',
'android/app/ActivityManager.java':'''package android.app; public class ActivityManager {public void moveTaskToFront(int id,int flags){}public static class RunningTaskInfo {public int taskId,mode=1;public Object token;public Component baseActivity;public int getWindowingMode(){return mode;}public int getActivityType(){return 1;}}public static class Component {public String getPackageName(){return "map";}}}''',
'android/service/notification/StatusBarNotification.java':'package android.service.notification; public class StatusBarNotification {public int getUserId(){return 0;}public android.app.Notification getNotification(){return null;}public String getPackageName(){return "map";}}',
'android/util/SparseArray.java':'package android.util; public class SparseArray<T> {public int size(){return 0;}public T valueAt(int n){return null;}}',
'ls/augment/com/step/NavigationCases.java':r'''
package ls.augment.com.step;
import android.app.ActivityManager;import android.os.SystemClock;import java.util.*;
class StepRuntime {
 static Object call(Object o,String n,Object... a){return StepMembers.callMethod(o,n,a);}static Object field(Object o,String n){return StepMembers.getObjectField(o,n);}
}
class OwnershipBridge {static java.lang.reflect.Method method(Class<?> c,String n,Class<?>... a)throws Exception{return c.getMethod(n,a);}}
class StepHook {}class StepHooks{static void hookMethod(java.lang.reflect.Method m,StepHook h){}}
class WorkspaceRoutes {static boolean promote(LiveWorkspace h,int s,java.util.function.Consumer<Boolean> done){done.accept(true);return true;}}
class LiveWorkspace {
 boolean ready=true,closing;int upperId=-1,upperAppId=-1,upperNavigationId=-1,changes;Object organizerLock=new Object(),organizer;
 Handler main=new Handler();Fence fence=new Fence();Transitions nativeTransitions=new Transitions();Slots slots=new Slots();ActivityManager.RunningTaskInfo task=new ActivityManager.RunningTaskInfo(),front=task;
 LiveWorkspace(){task.taskId=42;task.token=new Object();}
 static class Handler {ArrayDeque<Runnable> queue=new ArrayDeque<>();void post(Runnable r){queue.add(r);}void postDelayed(Runnable r,long d){queue.add(r);}void next(){queue.remove().run();}}
 static class Fence {boolean busy;boolean busy(){return busy;}}
 static class Transitions {boolean idle;boolean isIdle(){return idle;}}
 static class Slots {int index(int id){return -1;}}
 ActivityManager.RunningTaskInfo info(int id){return task!=null&&task.taskId==id?task:null;}ActivityManager.RunningTaskInfo focused(){return front;}
 void change(int slot,int resume,boolean navigation){if(!nativeTransitions.idle||fence.busy||front!=task)throw new AssertionError("unsafe admission");changes++;}
 void upperActionFor(int id,String a,Runnable r){}void upperAction(String a,Runnable r){r.run();}void log(String s){}
 static boolean root(ActivityManager.RunningTaskInfo t){return true;}static int number(Object t,String n){return 0;}
}
class WorkspaceDeck {
 static final int NAVIGATION=5;boolean closed;Owner owner=new Owner();Context ctx=new Context();int page=-1;
 static class Owner {LiveWorkspace host=new LiveWorkspace();Upper upper=new Upper();java.util.concurrent.Executor worker=Runnable::run;int userId,refusals;void logUnavailable(String s){refusals++;}}
 static class Upper {boolean visible;boolean canSwitch(){return true;}}
 static class Context {int checkSelfPermission(String p){return 0;}String getPackageName(){return "systemui";}<T>T getSystemService(Class<T> type){return type.cast(new ActivityManager());}}
 void navigationChanged(boolean active){}void jump(int target){page=target;}
}
public class NavigationCases {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static WorkspaceNavigation start(){SystemClock.now=0;WorkspaceNavigation n=new WorkspaceNavigation(new WorkspaceDeck());n.opening=true;n.focus(42,n.host.task.token);return n;}
 public static void main(String[] args){
  WorkspaceNavigation n=start();n.host.main.next();check(n.host.changes==0&&n.opening&&n.host.main.queue.size()==1,"focused map waits for Shell transition");
  n.host.nativeTransitions.idle=true;n.host.fence.busy=true;n.host.main.next();check(n.host.changes==0&&n.opening,"wait for Step fence too");
  n.host.fence.busy=false;n.host.main.next();check(n.host.changes==0&&n.opening,"first idle observation is not transition completion");
  SystemClock.now=80;n.host.nativeTransitions.idle=false;n.host.main.next();
  SystemClock.now=120;n.host.nativeTransitions.idle=true;n.host.main.next();
  SystemClock.now=200;n.host.main.next();check(n.host.changes==0&&n.opening,"queued follow-up resets stable interval");
  SystemClock.now=280;n.host.main.next();check(n.host.changes==1&&!n.opening&&n.deck.page==WorkspaceDeck.NAVIGATION,"admit once both owners remain settled");
  n=start();n.host.task.token=new Object();n.host.main.next();check(n.host.changes==0&&!n.opening&&n.deck.owner.refusals==1,"replacement task identity rejected");
  n=start();SystemClock.now=2300;n.host.main.next();check(n.host.changes==0&&!n.opening&&n.deck.owner.refusals==1,"timeout preserves native map");
  n=start();n.deck.closed=true;n.host.main.next();check(n.host.changes==0&&!n.opening&&n.host.main.queue.isEmpty(),"closed workspace cancels handoff");
  n=start();n.host.nativeTransitions.idle=true;n.host.front=null;n.host.main.next();check(n.host.changes==0&&n.opening,"wrong focus cannot admit another task");
  System.out.println("PASS "+checks+" production navigation transition handoff checks");
 }
}
'''}
java=Path(os.environ['JAVA_HOME'])/'bin'
with tempfile.TemporaryDirectory(prefix='step-navigation-handoff-') as directory:
 p=Path(directory)
 for name,code in sources.items():
  f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(code,encoding='utf-8')
 files=list(p.rglob('*.java'))+[step/'WorkspaceNavigation.java',step/'StepMembers.java']
 subprocess.run([java/'javac','-encoding','UTF-8','-d',p,*files],check=True)
 subprocess.run([java/'java','-cp',p,'ls.augment.com.step.NavigationCases'],check=True)
