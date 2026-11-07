"""Execute the production recorder tap scope, including policy, lifecycle and failure isolation."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
STEP = ROOT / 'android/app/src/main/java/ls/augment/com/step'
sources = {
'android/view/View.java': '''package android.view;
public class View {public boolean attached=true,shown=true,enabled=true;
 public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown;}public boolean isEnabled(){return enabled;}}
''',
'android/os/Looper.java': '''package android.os;
public class Looper {static final Looper MAIN=new Looper();public static boolean main=true;
 public static Looper myLooper(){return main?MAIN:null;}public static Looper getMainLooper(){return MAIN;}}
''',
'ls/augment/com/step/TapCases.java': r'''
package ls.augment.com.step;
import android.view.View;
import java.lang.reflect.*;
import java.util.*;
class StepRuntime {
 static boolean enabled=true,interactive=true;
 static class Shell {static Object context=new Object();}
 static boolean interactive(Object c){return interactive;}
 static void diagnostic(String k,String s){}
}
class LiveWorkspace {static LiveWorkspace current;boolean closed,closing;Bar quickBar=new Bar();}
class Bar {boolean closed,foreground=true;int userId;View recorder=new View();boolean currentUser(){return foreground;}}
class StepHook {
 protected void afterHookedMethod(MethodHookParam p){}
 static class MethodHookParam {Object thisObject,result;MethodHookParam(Object o,Object result){thisObject=o;this.result=result;}
  boolean hasThrowable(){return false;}Object getResult(){return result;}void setResult(Object v){result=v;}}
}
class StepHooks {
 static Map<Method,StepHook> hooks=new HashMap<>();
 static void hookMethod(Method m,StepHook h){hooks.put(m,h);}
 static boolean call(Object receiver,boolean result){
  try {StepHook hook=hooks.get(OwnershipBridge.method(receiver.getClass(),"isFalseTap",int.class));
   if(hook==null)return result;StepHook.MethodHookParam p=new StepHook.MethodHookParam(receiver,result);
   hook.afterHookedMethod(p);return (Boolean)p.result;
  }catch(Exception e){throw new RuntimeException(e);}
 }
}
class OwnershipBridge {
 static Method method(Class<?> c,String name,Class<?>... args)throws NoSuchMethodException{
  Method m=c.getMethod(name,args);m.setAccessible(true);return m;
 }
}
class StepMembers {
 static Field findField(Class<?> c,String name)throws NoSuchFieldException{
  for(Class<?> t=c;t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}
  throw new NoSuchFieldException(name);
 }
}
class NativeTiles {static Method click;}
public class TapCases {
 static int checks;
 static void check(boolean ok,String reason){checks++;if(!ok)throw new AssertionError(reason);}
 public static class Manager {boolean reject=true;public boolean isFalseTap(int penalty){return StepHooks.call(this,reject);}}
 public static class ChildManager extends Manager {}
 public static class BaseTile {public Object mFalsingManager=new ChildManager();}
 public static class Tile extends BaseTile {
  boolean disabled,fail;int started;Object received;
  public void click(Object source){
   received=source;
   if(fail)throw new IllegalStateException("native failure");
   if(mFalsingManager instanceof Manager manager && manager.isFalseTap(1))return;
   if(disabled)return; // QSTile's existing asynchronous policy gate must remain reachable.
   started++;
  }
 }
 static Tile reset()throws Exception{
  StepRuntime.enabled=StepRuntime.interactive=android.os.Looper.main=true;
  LiveWorkspace.current=new LiveWorkspace();NativeTiles.click=Tile.class.getMethod("click",Object.class);
  WorkspaceRecorderTap.active.remove();return new Tile();
 }
 static void click(Tile tile)throws Exception{
  View button=LiveWorkspace.current==null?new View():LiveWorkspace.current.quickBar==null?new View():LiveWorkspace.current.quickBar.recorder;
  WorkspaceRecorderTap.click(tile,0,button,"native expandable");
 }
 public static void main(String[] args)throws Exception{
  Tile tile=reset();click(tile);
  check(tile.started==1 && tile.received.equals("native expandable"),"visible unlocked Step button reaches native click");
  check(((Manager)tile.mFalsingManager).isFalseTap(1),"native QS falsing unchanged after Step call");
  check(WorkspaceRecorderTap.active.get()==null,"tap scope cleared");
  tile=reset();tile.disabled=true;click(tile);check(tile.started==0,"native admin/disabled policy still runs");
  tile=reset();tile.mFalsingManager=new Object();click(tile);check(tile.started==1,"unknown falsing shape keeps native behavior");
  for(int reason=0;reason<13;reason++){
   tile=reset();Bar bar=LiveWorkspace.current.quickBar;View button=bar.recorder;
   switch(reason){
    case 0:StepRuntime.enabled=false;break;case 1:StepRuntime.interactive=false;break;
    case 2:LiveWorkspace.current.closed=true;break;case 3:LiveWorkspace.current.closing=true;break;
    case 4:bar.closed=true;break;case 5:bar.userId=10;break;case 6:bar.foreground=false;break;
    case 7:button.attached=false;break;case 8:button.shown=false;break;case 9:button.enabled=false;break;
    case 10:android.os.Looper.main=false;break;case 11:LiveWorkspace.current=null;break;case 12:LiveWorkspace.current.quickBar=null;break;
   }
   WorkspaceRecorderTap.click(tile,0,button,new Object());check(tile.started==0,"refuse foreign or stale input "+reason);
  }
  tile=reset();WorkspaceRecorderTap.click(tile,0,new View(),new Object());check(tile.started==0,"other overlay cannot impersonate recorder");
  tile=reset();tile.fail=true;
  try{click(tile);throw new AssertionError("native failure must propagate");}catch(InvocationTargetException expected){}
  check(WorkspaceRecorderTap.active.get()==null,"scope cleared after native failure");
  tile=reset();Manager other=new Manager();WorkspaceRecorderTap.active.set(new WorkspaceRecorderTap.Tap(other,LiveWorkspace.current.quickBar.recorder,0));
  check(!WorkspaceRecorderTap.owns(tile.mFalsingManager),"exact manager instance required");
  WorkspaceRecorderTap.Tap previous=WorkspaceRecorderTap.active.get();click(tile);
  check(WorkspaceRecorderTap.active.get()==previous,"nested invocation restores outer scope");
  WorkspaceRecorderTap.active.remove();
  System.out.println("PASS "+checks+" recorder tap checks: real click path, inherited capabilities, policy, user/lock/lifecycle gates, exception cleanup");
 }
}
'''
}
java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='step-recorder-') as temp:
    folder = Path(temp)
    files = []
    for name, content in sources.items():
        file = folder / name
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(content, encoding='utf8')
        files.append(file)
    subprocess.run([java/'javac', '-encoding', 'UTF-8', '-d', folder, *files, STEP/'WorkspaceRecorderTap.java'], check=True)
    subprocess.run([java/'java', '-cp', folder, 'ls.augment.com.step.TapCases'], check=True)
