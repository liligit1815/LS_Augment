"""Exercise the production IME handoff against delayed native hide and ownership changes."""
import os,re,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'WorkspaceImeHandoff.java').read_text(encoding='utf-8')
source=re.sub(r'^(package|import) .*?;\s*','',source,flags=re.M).replace('final class WorkspaceImeHandoff {','static final class WorkspaceImeHandoff {').replace('android.os.SystemClock','SystemClock')
harness=r'''
package ls.augment.com.step;
import java.lang.reflect.*;import java.util.*;
public class ImeHandoffCases {
 static int checks,readyCount,hideCount,failures,lastDisplay,lastReason;
 static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static class SystemClock {static long now;static long uptimeMillis(){return now;}}
 static class Handler {List<Runnable> pending=new ArrayList<>();void postDelayed(Runnable r,long t){pending.add(r);}void next(){pending.remove(0).run();}}
 static class Wm {static Object lock=new Object(),display=new Object(),service=new Object();static Handler handler=new Handler();}
 static class Task {int mode=1;Object parent=new Object();}
 static class Window {Object display=Wm.display;Task task;Window(Task t){task=t;}}
 static class Input {Window window;Input(Window w){window=w;}}
 static class SavedTask {int id=7;Object token=new Object();Task task=new Task();Object parent=task.parent;}
 static class NativeFlip {SavedTask[] actors={new SavedTask()};int outgoing=7;boolean valid=true;void validate(){if(!valid)throw new IllegalStateException("changed");}}
 static NativeFlip flip;static boolean ending;static Task focused,live;static Object token;static Input input;
 public static class Source {boolean shown=true;public boolean isVisible(){return shown;}}
 public static class Provider {Source source=new Source();public Source getSource(){return source;}}
 public static class Controller {Provider provider=new Provider();public Provider getImeSourceProvider(){return provider;}}
 static class WorkspaceIme {static boolean available=true;static Controller controller=new Controller();static Method sourceProvider,source,visible;}
 static class StepMembers {static Field findField(Class<?> c,String n)throws NoSuchFieldException{return c.getDeclaredField(n);}}
 static class OwnershipBridge {static Method method(Class<?> c,String n,Class<?>... args)throws NoSuchMethodException{for(Class<?> k=c;k!=null;k=k.getSuperclass())try{Method m=k.getDeclaredMethod(n,args);m.setAccessible(true);return m;}catch(NoSuchMethodException ignored){}throw new NoSuchMethodException(n);}}
 public static class ScopedIme {public void hideInputMethod(int reason,int display){hideCount++;lastReason=reason;lastDisplay=display;}}
 public static class InheritedIme extends ScopedIme {}
 public static class LegacyIme {public void hideCurrentInputMethod(int reason){throw new AssertionError("global hide");}}
 public static class WrongResult {public int hideInputMethod(int reason,int display){return 0;}}
 public static class StaticHide {public static void hideInputMethod(int reason,int display){}}
 static Object liveTask(int id,Object t){return id==7 && t==token?live:null;}
 static Object call(Object o,String n,Object... args){
  if(o==Wm.display)return switch(n){case "getImeInputTarget"->input;case "getFocusedRootTask"->focused;case "getDisplayId"->0;default->throw new AssertionError(n);};
  if(o instanceof Input i)return i.window;
  if(o instanceof Window w)return n.equals("getTask")?w.task:w.display;
  if(o instanceof Task t)return n.equals("getParent")?t.parent:t.mode;
  throw new AssertionError(n);
 }
 static void diagnostic(String k,String v){}
 static void finish(String why){failures++;ending=true;}
 NATIVE
 static NativeFlip reset()throws Exception{
  readyCount=hideCount=failures=0;ending=false;SystemClock.now=0;Wm.handler=new Handler();
  flip=new NativeFlip();SavedTask r=flip.actors[0];focused=live=r.task;token=r.token;input=new Input(new Window(r.task));
  WorkspaceIme.available=true;WorkspaceIme.controller=new Controller();
  WorkspaceIme.sourceProvider=Controller.class.getMethod("getImeSourceProvider");WorkspaceIme.source=Provider.class.getMethod("getSource");WorkspaceIme.visible=Source.class.getMethod("isVisible");
  WorkspaceImeHandoff.probed=true;WorkspaceImeHandoff.service=new ScopedIme();WorkspaceImeHandoff.hide=WorkspaceImeHandoff.scopedHide(ScopedIme.class);WorkspaceImeHandoff.reason=37;
  return flip;
 }
 public static void main(String[] args)throws Exception{
  check(WorkspaceImeHandoff.scopedHide(InheritedIme.class).getDeclaringClass()==ScopedIme.class,"inherited display API accepted");
  for(Class<?> type:new Class<?>[]{LegacyIme.class,WrongResult.class,StaticHide.class,Object.class}){
   try{WorkspaceImeHandoff.scopedHide(type);throw new AssertionError("unknown signature");}catch(NoSuchMethodException expected){checks++;}
  }
  NativeFlip f=reset();WorkspaceImeHandoff.prepare(f,()->readyCount++);
  check(hideCount==1 && lastDisplay==0 && lastReason==37,"native hide scoped to owning display");
  check(readyCount==0 && Wm.handler.pending.size()==1,"task movement waits for visible source readback");
  Wm.handler.next();check(readyCount==0 && hideCount==1,"waiting does not resubmit hide to a newer editor");
  WorkspaceIme.controller.provider.source.shown=false;Wm.handler.next();check(readyCount==1 && failures==0 && Wm.handler.pending.isEmpty(),"hidden source permits exactly one handoff");
  for(int k=0;k<11;k++){
   f=reset();switch(k){case 0:WorkspaceIme.available=false;break;case 1:WorkspaceImeHandoff.hide=null;break;case 2:WorkspaceIme.controller.provider.source.shown=false;break;case 3:input=null;break;case 4:input.window.display=new Object();break;case 5:input.window.task=new Task();break;case 6:live=null;break;case 7:f.actors[0].task.parent=new Object();break;case 8:f.actors[0].task.mode=6;break;case 9:focused=new Task();break;case 10:f.actors[0]=null;break;}
   WorkspaceImeHandoff.prepare(f,()->readyCount++);check(hideCount==0 && readyCount==1,"native behavior preserved for unowned/missing case "+k);
  }
  for(int k=0;k<5;k++){
   f=reset();WorkspaceImeHandoff.prepare(f,()->readyCount++);
   switch(k){case 0:flip=new NativeFlip();break;case 1:ending=true;break;case 2:SystemClock.now=901;break;case 3:input.window=new Window(new Task());break;case 4:f.valid=false;break;}
   Wm.handler.next();check(readyCount==0 && hideCount==1,"stale/timeout callback cannot advance or hide again "+k);
   check(failures==(k<2?0:1),"identity/timeout failure restored safely "+k);
  }
  System.out.println("PASS "+checks+" native IME handoff checks: scoped and inherited API, delayed hide, missing capability, identity, timeout and stale callbacks");
 }
}
'''.replace('NATIVE',source)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-ime-handoff-') as tmp:
 folder=Path(tmp);test=folder/'ImeHandoffCases.java';test.write_text(harness,encoding='utf-8')
 subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,test],check=True)
 subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.ImeHandoffCases'],check=True)
