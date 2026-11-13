"""Exercise continuous production region geometry and the OEM recognizer's scoped edge lease."""
from pathlib import Path
import os, subprocess, tempfile

root=Path(__file__).resolve().parents[1]
step=root/'android/app/src/main/java/ls/augment/com/step'
sources={
'android/graphics/RectF.java':'''package android.graphics; public class RectF {
 public float left,top,right,bottom; public RectF(){}public RectF(float l,float t,float r,float b){set(l,t,r,b);}
 public void set(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}
 public float width(){return right-left;}public float height(){return bottom-top;}public float centerX(){return (left+right)/2;}public float centerY(){return (top+bottom)/2;}public boolean isEmpty(){return width()<=0||height()<=0;}
}''',
'android/view/InputDevice.java':'package android.view; public class InputDevice {public static final int SOURCE_TOUCHSCREEN=4098;}',
'android/view/MotionEvent.java':'''package android.view; public class MotionEvent {
 public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3;
 public int action,display;public long down=7;public float x,y;public boolean touch=true;
 public MotionEvent(int a,float x,float y){action=a;this.x=x;this.y=y;}
 public int getActionMasked(){return action;}public int getDisplayId(){return display;}public long getDownTime(){return down;}
 public float getRawX(){return x;}public float getRawY(){return y;}public boolean isFromSource(int s){return touch;}
}''',
'com/zte/feature/fullscreen_gesture/GestureController.java':'''package com.zte.feature.fullscreen_gesture;
 public class GestureController {public int mGestureEdgeLeft=68,mGestureEdgeRight=1148;public void onPointerEvent(android.view.MotionEvent e){}}''',
'com/zte/feature/fullscreen_gesture/GestureStubView.java':'''package com.zte.feature.fullscreen_gesture;
 public class GestureStubView {public GestureController mGestureController;public boolean onTouchEvent(android.view.MotionEvent e){return true;}}''',
'ls/augment/com/step/RegionCases.java':r'''
package ls.augment.com.step;
import android.graphics.RectF;import android.view.MotionEvent;import java.lang.reflect.*;
import com.zte.feature.fullscreen_gesture.GestureController;
class LocalLandscape {static Method exact(Class<?> c,String n,Class<?> r,Class<?>...a)throws ReflectiveOperationException{return c.getMethod(n,a);}}
class StepHooks {static StepHook hook;static Module module=new Module();static void hookMethod(Method m,StepHook h){hook=h;}static class Module{void deoptimize(Method m){}}}
class StepRuntime {static Object call(Object o,String n,Object...a){return StepMembers.callMethod(o,n,a);}static void diagnostic(String a,String b){}}
class WorkspaceBackFocus {static int calls;static void observe(MotionEvent e){calls++;}}
class LiveWorkspace {static LiveWorkspace current;boolean ready=true,closing,closed;WorkspaceLayout geometry;Fence fence=new Fence();static class Fence {boolean blocked;boolean busy(){return blocked;}}}
public class RegionCases {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class Child extends GestureController {}
 static void event(GestureController c,MotionEvent e,boolean mapped,boolean blocked)throws Throwable{
  StepHook.MethodHookParam p=new StepHook.MethodHookParam(c,new Object[]{e});int left=c.mGestureEdgeLeft,right=c.mGestureEdgeRight;
  StepHooks.hook.beforeHookedMethod(p);
  check(p.handled==blocked,"native recognizer blocked only during workspace handoff");
  WorkspaceLayout l=LiveWorkspace.current.geometry;
  check(c.mGestureEdgeLeft==(mapped?Math.round(l.mainX+left*l.mainScale):left),"main left edge uses same calibrated transform");
  check(c.mGestureEdgeRight==(mapped?Math.round(l.mainX+right*l.mainScale):right),"main right edge uses same calibrated transform");
  StepHooks.hook.afterHookedMethod(p);check(c.mGestureEdgeLeft==left&&c.mGestureEdgeRight==right,"native bounds restored after every callback");
 }
 public static void main(String[] args)throws Throwable{
  WorkspaceNativeGesture.install(RegionCases.class.getClassLoader());check(WorkspaceNativeGesture.available,"runtime native signatures accepted");
  for(boolean left:new boolean[]{false,true})for(int count=1;count<=5;count++){
   LiveWorkspace h=LiveWorkspace.current=new LiveWorkspace();WorkspaceLayout l=h.geometry=WorkspaceLayout.create(1216,2688,3.25f,left,count,0,true);
   GestureController c=count%2==0?new Child():new GestureController();
   event(c,new MotionEvent(0,l.mainX+4,l.top+900),true,false);
   event(c,new MotionEvent(2,l.mainX+220,l.top+900),true,false);event(c,new MotionEvent(1,l.mainX+220,l.top+900),true,false);
   event(c,new MotionEvent(0,l.sideX+4,l.top+900),false,false);event(c,new MotionEvent(1,l.sideX+4,l.top+900),false,false);
   event(c,new MotionEvent(0,l.mainX+4,l.top-1),false,false);event(c,new MotionEvent(3,l.mainX+4,l.top-1),false,false);
   MotionEvent other=new MotionEvent(0,l.mainX+4,l.top+900);other.display=2;event(c,other,false,false);
   h.fence.blocked=true;event(c,new MotionEvent(0,l.mainX+4,l.top+900),false,true);h.fence.blocked=false;
   event(c,new MotionEvent(2,l.mainX+220,l.top+900),false,true);event(c,new MotionEvent(1,l.mainX+220,l.top+900),false,true);
   event(c,new MotionEvent(0,l.mainX+4,l.top+900),true,false);h.geometry=WorkspaceLayout.create(1216,2688,3.25f,!left,count,0,true);
   event(c,new MotionEvent(3,l.mainX+4,l.top+900),false,false);h.geometry=l;
   RectF main=new RectF(l.mainX,l.top,l.mainX+1216*l.mainScale,2688),top=new RectF(0,0,1216,684),box=new RectF(),fit=new RectF();
   for(RectF[] path:new RectF[][]{{main,top},{top,main}})for(int w:new int[]{1216,2688})for(int i=0;i<=100;i++){
    RegionMotion.interpolate(path[0],path[1],i/100f,box);RegionMotion.cover(w,w==1216?2672:1512,box,fit);
    check(fit.left<=box.left+.01f&&fit.right>=box.right-.01f&&fit.top<=box.top+.01f&&fit.bottom>=box.bottom-.01f,"content fills moving region without blank bands");
    check(Math.abs(fit.width()/fit.height()-w/(float)(w==1216?2672:1512))<.001,"aspect ratio preserved through every orientation transition");
   }
   RegionMotion.interpolate(main,top,-1,box);check(box.left==main.left&&box.bottom==main.bottom,"clamped source");
   RegionMotion.interpolate(main,top,2,box);check(box.left==top.left&&box.bottom==top.bottom,"exact landing");
  }
  check(WorkspaceNativeGesture.streams.isEmpty()&&WorkspaceNativeGesture.blocked.isEmpty(),"ended streams do not hold old workspace owners");
  System.out.println("PASS "+checks+" region-motion/native-edge checks: both sides, 1–5 slots, aspect ratio, endpoints, subclasses, stale layout, foreign displays and guarded input");
 }
}
'''}
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-region-motion-') as tmp:
    p=Path(tmp)
    for name,code in sources.items():
        f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(code,encoding='utf-8')
    files=list(p.rglob('*.java'))+[step/(n+'.java') for n in ['WorkspaceNativeGesture','RegionMotion','WorkspaceLayout','StepMembers','StepHook']]
    subprocess.run([java/'javac','-encoding','UTF-8','-d',p,*files],check=True)
    subprocess.run([java/'java','-cp',p,'ls.augment.com.step.RegionCases'],check=True)
