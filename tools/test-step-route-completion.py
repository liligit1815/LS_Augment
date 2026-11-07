"""Run the production promotion completion check with lagging focus and stale replies."""
from pathlib import Path
import os,subprocess,tempfile
root=Path(__file__).resolve().parents[1]
source=(root/'android/app/src/main/java/ls/augment/com/step/WorkspaceRoutes.java').read_text(encoding='utf-8')
method=source[source.index('    static boolean promote('):source.index('    static void hostRoute(')]
java=r'''
import java.util.*;
import java.util.function.Consumer;
class RouteCompletion {
 static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}
 static class SystemClock {static long now;static long uptimeMillis(){return now;}}
 static class ActivityManager {static class RunningTaskInfo {int taskId=7,mode=6;Object token=new Object();}}
 static class Fence {boolean busy;boolean busy(){return busy;}}
 static class Slots {boolean occupied=true;int task(int i){return 7;}int index(int id){return occupied?0:-1;}}
 static class Handler {ArrayDeque<Runnable> work=new ArrayDeque<>();void post(Runnable r){work.add(r);}void postDelayed(Runnable r,long ms){work.add(r);}}
 static class Quick {Object picker;Tools tools=new Tools();}static class Tools {Object clipboard;}
 static class LiveWorkspace {
  Object retained;Quick quickBar=new Quick();Fence fence=new Fence();Slots slots=new Slots();Handler main=new Handler();
  boolean closing,closed,accept=true;ActivityManager.RunningTaskInfo info=new ActivityManager.RunningTaskInfo();
  void preflight(){} ActivityManager.RunningTaskInfo info(int id){return info;}
  ActivityManager.RunningTaskInfo focused(){throw new AssertionError("focus notification may depend on original launch continuing");}
  void change(int slot){fence.busy=accept;}
 }
 static Object field(Object o,String n){return ((ActivityManager.RunningTaskInfo)o).token;}
 static Object call(Object o,String n){return ((ActivityManager.RunningTaskInfo)o).mode;}
 METHOD
 static int replies;static boolean result;
 static LiveWorkspace begin(){SystemClock.now=0;replies=0;result=false;LiveWorkspace h=new LiveWorkspace();check(promote(h,0,ok->{replies++;result=ok;}));return h;}
 static void settle(LiveWorkspace h){h.fence.busy=false;h.slots.occupied=false;h.info.mode=1;}
 static void tick(LiveWorkspace h){h.main.work.remove().run();}
 public static void main(String[] args){
  LiveWorkspace h=begin();tick(h);check(replies==0);settle(h);tick(h);check(replies==1 && result && h.main.work.isEmpty());
  h=begin();h.info.mode=1;h.slots.occupied=false;SystemClock.now=2400;tick(h);check(replies==1 && !result); // busy timeout cannot succeed
  h=begin();settle(h);h.slots.occupied=true;tick(h);check(replies==1 && !result);
  h=begin();settle(h);h.info.token=new Object();tick(h);check(replies==1 && !result);
  h=begin();settle(h);h.info.taskId=8;tick(h);check(replies==1 && !result);
  h=begin();settle(h);h.info.mode=6;tick(h);check(replies==1 && !result);
  h=begin();settle(h);h.info=null;tick(h);check(replies==1 && !result);
  h=begin();h.closing=true;tick(h);check(replies==1 && !result);
  h=begin();h.closed=true;tick(h);check(replies==1 && !result);
  h=new LiveWorkspace();h.accept=false;check(!promote(h,0,ok->{throw new AssertionError();}) && h.main.work.isEmpty());
  System.out.println("PASS "+checks+" production route completion checks");
 }
}
'''.replace('METHOD',method)
with tempfile.TemporaryDirectory(prefix='step-route-completion-') as temp:
 p=Path(temp);f=p/'RouteCompletion.java';f.write_text(java,encoding='utf-8')
 j=Path(os.environ['JAVA_HOME'])/'bin'
 subprocess.run([j/'javac','-encoding','UTF-8','-d',p,f],check=True)
 subprocess.run([j/'java','-cp',p,'RouteCompletion'],check=True)
