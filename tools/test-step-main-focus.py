"""Exercise the production live-focus resolver with stale snapshots and native identities."""
from pathlib import Path
import os, subprocess, tempfile

root=Path(__file__).resolve().parents[1]
step=root/'android/app/src/main/java/ls/augment/com/step'
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
sources={
'android/annotation/SuppressLint.java':'package android.annotation;public @interface SuppressLint {String[] value();}',
'android/app/TaskInfo.java':r'''
package android.app;
public class TaskInfo {
 public int taskId,userId,displayId,mode=1,type=1;public boolean isFocused,isVisible=true,parent;public Object topActivity=new Object(),token=new Object();
 public int getActivityType(){return type;}public int getWindowingMode(){return mode;}public boolean hasParentTask(){return parent;}
}
''',
'android/app/ActivityManager.java':'package android.app;public class ActivityManager {public static class RunningTaskInfo extends TaskInfo{}}',
'android/app/ActivityTaskManager.java':r'''
package android.app;
public class ActivityTaskManager {public static class RootTaskInfo extends TaskInfo{}public static Object service;public static Object getService(){return service;}}
''',
'ls/augment/com/step/FocusCases.java':r'''
package ls.augment.com.step;
import android.app.*;import android.app.ActivityManager.RunningTaskInfo;import java.util.*;import java.util.function.*;
class StepHook {}class StepHooks {static void hookMethod(java.lang.reflect.Method m,StepHook h){}}
class StepRuntime {
 static class Shell{static Object context=new Object();}
 static class Wm{static Object lock=new Object(),context=new Object();static Display display=new Display();}
 static Object call(Object o,String n,Object... a){return StepMembers.callMethod(o,n,a);}
 static Object field(Object o,String n){return StepMembers.getObjectField(o,n);}static void diagnostic(String s,String d){}
}
class WorkspaceUsers {static int id(Object u){return (Integer)u;}static boolean allows(Object c,int p,int u){return p==u || u==999;}}
class LiveWorkspace {
 SideSlots slots=new SideSlots();int upperId=-1;boolean holdsUpper(int id){return upperId>=0 && upperId==id;}Object quickUser=0;Map<Integer,RunningTaskInfo> tasks=new HashMap<>();RunningTaskInfo legacy;
 RunningTaskInfo info(int id){return tasks.get(id);}RunningTaskInfo cachedFocus(){return legacy;}
 static int number(Object t,String n){return (Integer)StepRuntime.field(t,n);}static boolean flag(Object t,String n){return (Boolean)StepRuntime.field(t,n);}
 static boolean root(RunningTaskInfo t){return !t.parent;}
}
class NativeWorkspaceGuard {
 static boolean active=true,ending;static int principal;static SideSlots slots=new SideSlots();
 static boolean runningActivity(Object t){return t instanceof Task x && x.running;}
}
class Saved {Object task;Saved(Object t){task=t;}}
class NativeTopTask {static Saved upper;static Saved held(Object task){return upper!=null && upper.task==task?upper:null;}}
class Display {Object current;Object getFocusedRootTask(){return current;}}
class Area {List<Task> tasks=new ArrayList<>();Task getRootTask(Predicate<Object> p,boolean top){
 if(top){for(Task t:tasks)if(p.test(t))return t;}else{for(int i=tasks.size()-1;i>=0;i--)if(p.test(tasks.get(i)))return tasks.get(i);}return null;}}
class Task {
 int mTaskId,mUserId,mode=1,type=1;boolean running=true,focusable=true;Object display=StepRuntime.Wm.display,root=this;Area area;RunningTaskInfo info=new RunningTaskInfo();
 Object getDisplayContent(){return display;}Object getRootTask(){return root;}int getWindowingMode(){return mode;}int getActivityType(){return type;}
 boolean isFocusable(){return focusable;}Object getTaskInfo(){return info;}Area getTaskDisplayArea(){return area;}
}
public class FocusCases {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static class Service {TaskInfo selected;List<TaskInfo> roots=new ArrayList<>();
  public TaskInfo getFocusedRootTaskInfo(){return selected;}public List<TaskInfo> getAllRootTaskInfos(){return roots;}}
 public static class ChildService extends Service{}public static class MissingService{}
 public static class FailedService extends Service {public TaskInfo getFocusedRootTaskInfo(){throw new SecurityException();}}
 static RunningTaskInfo info(int id,int mode){RunningTaskInfo i=new RunningTaskInfo();i.taskId=id;i.mode=mode;return i;}
 static void refused(Runnable r,String why){try{r.run();throw new AssertionError(why);}catch(IllegalStateException expected){checks++;}}
 public static void main(String[] args){
  LiveWorkspace h=new LiveWorkspace();RunningTaskInfo main=info(10,1),side=info(20,6),upper=info(30,6);
  h.tasks.put(10,main);h.tasks.put(20,side);h.tasks.put(30,upper);h.slots.replace(0,-1,20);h.upperId=30;
  Service s=new ChildService();s.selected=main;s.roots.addAll(List.of(side,main,upper));ActivityTaskManager.service=s;
  ActivityTaskManager.RootTaskInfo liveMain=new ActivityTaskManager.RootTaskInfo();liveMain.taskId=10;liveMain.token=main.token;
  s.selected=liveMain;s.roots.set(1,liveMain);
  side.isFocused=true;main.isFocused=false;
  check(WorkspaceMainFocus.read(h)==main,"live native root wins over stale side focused bit; inherited query supported");
  s.selected=side;check(WorkspaceMainFocus.read(h)==main,"owned side focus resolves unique visible main");
  s.selected=upper;check(WorkspaceMainFocus.read(h)==main,"upper focus resolves main without moving upper");
  RunningTaskInfo another=info(40,1);s.roots.add(another);refused(()->WorkspaceMainFocus.read(h),"ambiguous fullscreen roots rejected");s.roots.remove(another);
  liveMain.isVisible=false;check(WorkspaceMainFocus.read(h)==null,"hidden main cannot be inferred");liveMain.isVisible=true;
  liveMain.userId=10;check(WorkspaceMainFocus.read(h)==null,"other user's main excluded");liveMain.userId=main.userId=999;check(WorkspaceMainFocus.read(h)==main,"unlocked native clone retained");liveMain.userId=main.userId=0;
  liveMain.displayId=1;check(WorkspaceMainFocus.read(h)==null,"other display excluded");liveMain.displayId=0;
  liveMain.parent=true;check(WorkspaceMainFocus.read(h)==null,"child task excluded");liveMain.parent=false;
  h.tasks.put(10,info(10,1));s.selected=liveMain;refused(()->WorkspaceMainFocus.read(h),"reused task ID rejected");h.tasks.put(10,main);
  main.mode=6;refused(()->WorkspaceMainFocus.read(h),"native role and organizer role disagreement rejected");main.mode=1;
  ActivityTaskManager.service=new MissingService();h.legacy=main;check(WorkspaceMainFocus.read(h)==main,"missing new interface preserves legacy path");
  ActivityTaskManager.service=new FailedService();refused(()->WorkspaceMainFocus.read(h),"failed live query must not choose stale fallback");
  Task m=new Task(),a=new Task(),b=new Task();m.mTaskId=10;a.mTaskId=20;a.mode=6;b.mTaskId=30;b.mode=6;
  Area area=new Area();area.tasks.addAll(List.of(a,b,m));m.area=a.area=b.area=area;
  NativeWorkspaceGuard.slots.replace(0,-1,20);NativeTopTask.upper=new Saved(b);
  synchronized(StepRuntime.Wm.lock){
   StepRuntime.Wm.display.current=m;check(WorkspaceMainFocus.matches(m),"server accepts exact live main despite stale focused bit");
   StepRuntime.Wm.display.current=a;check(WorkspaceMainFocus.matches(m),"server verifies unique main below owned side");
   StepRuntime.Wm.display.current=b;check(WorkspaceMainFocus.matches(m),"server verifies unique main below upper app");
   Task other=new Task();other.mTaskId=40;other.area=area;area.tasks.add(other);check(!WorkspaceMainFocus.matches(m),"server rejects ambiguous visible main");area.tasks.remove(other);
   StepRuntime.Wm.display.current=other;check(!WorkspaceMainFocus.matches(m),"unowned focused app cannot be replaced");
   StepRuntime.Wm.display.current=m;m.info.isVisible=false;check(!WorkspaceMainFocus.matches(m),"server rejects hidden root");m.info.isVisible=true;
   m.mUserId=10;check(!WorkspaceMainFocus.matches(m),"server rejects changed user");m.mUserId=0;
   m.display=new Object();check(!WorkspaceMainFocus.matches(m),"server rejects changed display");m.display=StepRuntime.Wm.display;
   m.root=new Object();check(!WorkspaceMainFocus.matches(m),"server rejects replaced root");m.root=m;
   m.mode=5;check(!WorkspaceMainFocus.matches(m),"OEM floating window remains native");m.mode=1;
   m.running=false;check(!WorkspaceMainFocus.matches(m),"ended main is rejected");m.running=true;
   NativeWorkspaceGuard.ending=true;check(!WorkspaceMainFocus.matches(m),"restoration blocks handoff");NativeWorkspaceGuard.ending=false;
   check(!WorkspaceMainFocus.matches(a),"side can never be incoming main");
  }
  check(!WorkspaceMainFocus.matches(m),"unlocked framework read cannot authorize handoff");
  System.out.println("PASS "+checks+" live main focus cases");
 }
}
'''}
with tempfile.TemporaryDirectory(prefix='step-main-focus-') as directory:
    p=Path(directory)
    for name,code in sources.items():
        f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(code,encoding='utf-8')
    files=list(p.rglob('*.java'))+[step/n for n in ('WorkspaceMainFocus.java','StepMembers.java','SideSlots.java')]
    subprocess.run([java/'javac','-encoding','UTF-8','-d',p,*files],check=True)
    subprocess.run([java/'java','-cp',p,'ls.augment.com.step.FocusCases'],check=True)
