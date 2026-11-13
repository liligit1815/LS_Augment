"""Run native reflow ownership and verification against transition states."""
from pathlib import Path
import os, subprocess, tempfile

root=Path(__file__).resolve().parents[1]
source=(root/'android/app/src/main/java/ls/augment/com/step/WorkspaceMainBounds.java').read_text(encoding='utf8')
def method(signature):
    a=source.index(signature);b=source.index('{',a)+1;depth=1
    while depth:
        depth+=(source[b]=='{')-(source[b]=='}');b+=1
    return source[a:b]

code=r'''
import java.util.*;
public class BoundsOwnership {
 static int checks,principal;static boolean active=true;
 static class Rect {
  int l,t,r,b;Rect(int l,int t,int r,int b){this.l=l;this.t=t;this.r=r;this.b=b;}
  int width(){return r-l;}int height(){return b-t;}boolean isEmpty(){return width()<=0||height()<=0;}
  public boolean equals(Object o){return o instanceof Rect x&&l==x.l&&t==x.t&&r==x.r&&b==x.b;}
 }
 static class Layout {int width=1216,mainLogicalHeight=2354;}
 static Layout layout=new Layout();static Rect logical=new Rect(0,0,1216,2688);
 static class Wm {static Object display=new Object(),context=new Object();}
 static class WorkspaceUsers {static boolean allows(Object c,int p,int u){return p==u;}}
 static IdentityHashMap<Object,Object> touched=new IdentityHashMap<>();
 static class Parent {}
 static class Task {
  int mode=1,type=1,user,updates;Object parent=new Parent(),display=Wm.display,root=this;
  Rect requested=new Rect(0,0,0,0),bounds=logical;boolean accepts=true,changesOwner;
 }
 static boolean scene(){return active;}
 static Object field(Object o,String n){return n.equals("mUserId")?((Task)o).user:42;}
 static Object call(Object o,String n,Object... args){
  if(o instanceof Parent && n.equals("getConfiguration"))return o;
  Task t=(Task)o;
  return switch(n){
   case "getActivityType"->t.type;case "getDisplayContent"->t.display;case "getRootTask"->t.root;
   case "getWindowingMode"->t.mode;case "getRequestedOverrideBounds"->t.requested;
   case "getParent"->t.parent;case "getBounds"->t.bounds;case "topRunningActivity"->null;
   case "onConfigurationChanged"->{t.updates++;if(t.changesOwner)t.requested=new Rect(0,0,2772,1560);
    if(eligible(t)&&t.accepts)t.bounds=new Rect(0,0,layout.width,layout.mainLogicalHeight);yield null;}
   default->throw new AssertionError(n);
  };
 }
 static void ensure(Object app){}
 ELIGIBLE
 REFRESH
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 public static void main(String[] args)throws Exception{
  Task t=new Task();check(eligible(t),"ordinary fullscreen admitted");refreshTask(t);check(t.bounds.height()==2354,"ordinary main actually reflows");
  t=new Task();t.requested=logical;check(eligible(t),"native full-display bounds retained");
  t=new Task();t.type=2;check(eligible(t),"home remains reflowed");
  t=new Task();t.requested=new Rect(0,0,2772,1560);t.accepts=false;check(!eligible(t),"fullscreen transition with top landscape bounds is not main");refreshTask(t);check(t.bounds==logical,"foreign explicit bounds remain native without false recovery");
  t=new Task();t.requested=new Rect(10,10,500,600);check(!eligible(t),"other feature bounds preserved");
  t=new Task();t.mode=6;check(!eligible(t),"freeform remains native");
  t=new Task();t.root=new Task();check(!eligible(t),"child task remains native");
  t=new Task();t.display=new Object();check(!eligible(t),"other display remains native");
  t=new Task();t.user=10;check(!eligible(t),"foreign user remains native");
  t=new Task();touched.put(t,new Parent());check(!eligible(t),"changed parent remains native");
  t=new Task();t.accepts=false;try{refreshTask(t);throw new AssertionError("real rejection must retain recovery");}catch(IllegalStateException expected){check(expected.getMessage().contains("task=42"),"real rejection keeps identity diagnostics");}
  t=new Task();t.changesOwner=true;t.accepts=false;refreshTask(t);check(!eligible(t),"ownership checked again after synchronous native callback");
  t=new Task();active=false;check(!eligible(t),"outside session remains native");
  System.out.println("PASS "+checks+" production main reflow ownership checks");
 }
}
'''.replace('ELIGIBLE',method('    static boolean eligible(')).replace('REFRESH',method('    static void refreshTask('))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-bounds-') as d:
    p=Path(d);f=p/'BoundsOwnership.java';f.write_text(code,encoding='utf8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f],check=True)
    subprocess.run([java/'java','-cp',p,'BoundsOwnership'],check=True)
