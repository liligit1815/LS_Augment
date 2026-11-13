"""Exercise the actual upper monitor against a competing game gesture monitor."""
from pathlib import Path
import os, subprocess, tempfile

ROOT = Path(__file__).resolve().parents[1]
STEP = ROOT / 'android/app/src/main/java/ls/augment/com/step'

def method(file, signature):
    source = (STEP / file).read_text(encoding='utf-8')
    start = source.index(signature); end = source.index('{', start) + 1; depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}'); end += 1
    return source[start:end]

monitor = '\n'.join(method('TopGestureMonitor.java', s) for s in
                    ['void reset()', 'boolean inside(', 'void onTouch('])
toolbar = '\n'.join(method('WorkspaceSideToolbar.java', s) for s in
                    ['boolean handleContains(', 'boolean ownsGesture(', 'int edgeStart('])
harness = r'''
package ls.augment.com.step;
import java.lang.reflect.*;
public class UpperEdgeCases {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class InputDevice {static final int SOURCE_TOUCHSCREEN=4098;}
 static class MotionEvent {
  static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;
  int action,count=1,display,source=4098;float x,y;
  MotionEvent(int a,float x,float y){action=a;this.x=x;this.y=y;}
  boolean isFromSource(int s){return source==s;}int getActionMasked(){return action;}
  float getRawX(){return x;}float getRawY(){return y;}float getRawX(int n){return x;}float getRawY(int n){return y;}
  int getPointerCount(){return count;}int getPointerId(int n){return n;}
 }
 static class Geometry {int contentHeight=684,width=1216;}
 static class Host {Geometry geometry=new Geometry();}
 static class Roll {boolean running;void settle(boolean b){}}
 static class Deck {int switches;void fromUpper(int n){switches++;}}
 static class Owner {boolean closed;WorkspaceSideToolbar sideToolbar;Deck deck=new Deck();int dp(int n){return n;}}
 static class Pane {Host host=new Host();Owner owner=new Owner();Roll roll=new Roll();boolean visible;boolean canSwitch(){return true;}}
 static class AppGesture {void reset(){}boolean onTouch(MotionEvent e){return false;}}
 static class WorkspaceBackFocus {static void observe(MotionEvent e){}}
 static class WorkspaceSideToolbar {
  Owner owner;int edgeY=250,edgeHeight=170,edgeWidth=20,width=1216,height=684,opens;
  boolean panelAttached,edgeTracking,ready=true;
  boolean usable(){return ready;}void setOpen(boolean b){if(b){opens++;panelAttached=true;}}
  TOOLBAR
 }
 public static class Platform {int claims;public void pilfer(){claims++;}}
 static Object call(Object o,String name){return ((MotionEvent)o).display;}
 static class Monitor {
  Pane pane=new Pane();AppGesture appGesture=new AppGesture();Platform platform=new Platform();Method pilfer;
  int first=-1,second=-1,edge=-1;float x1,y1;boolean active,horizontal,edgeRejected,edgeOpened,edgeClaimed,edgeHandle;
  Monitor()throws Exception{pilfer=Platform.class.getMethod("pilfer");WorkspaceSideToolbar t=new WorkspaceSideToolbar();pane.owner.sideToolbar=t;t.owner=pane.owner;}
  MONITOR
  void event(int a,float x,float y)throws Exception{onTouch(new MotionEvent(a,x,y));}
 }
 public static void main(String[] args)throws Exception{
  for(boolean right:new boolean[]{false,true}){
   float x=right?1208:8, inward=right?-100:100;
   Monitor m=new Monitor();m.event(0,x,320);
   check(m.platform.claims==1,"handle claims DOWN before game's first MOVE");
   m.pane.owner.sideToolbar.edgeTracking=false; // original handle receives CANCEL after pilfer
   m.event(2,x+inward,320);m.event(1,x+inward,320);
   check(m.pane.owner.sideToolbar.opens==1 && m.platform.claims==1,"monitor completes claimed handle swipe exactly once");
   m=new Monitor();m.event(0,x,320);m.event(1,x,320);check(m.pane.owner.sideToolbar.opens==1,"handle tap remains available");
   m=new Monitor();m.event(0,x,320);m.event(3,x,320);check(m.pane.owner.sideToolbar.opens==0 && m.edge<0,"cancel never opens");
   m=new Monitor();m.event(0,x,320);m.event(2,x,380);m.event(1,x,380);check(m.pane.owner.sideToolbar.opens==0,"handle vertical gesture stays rejected");
   m=new Monitor();m.event(0,x,100);check(m.platform.claims==0,"content edge retains native DOWN");
   m.event(2,x+inward,100);m.event(1,x+inward,100);check(m.platform.claims==1 && m.pane.owner.sideToolbar.opens==1,"content inward swipe claims only after direction");
   m=new Monitor();m.event(0,x,100);m.event(1,x,100);check(m.platform.claims==0 && m.pane.owner.sideToolbar.opens==0,"content edge tap untouched");
   m=new Monitor();m.event(0,x,100);m.event(2,x,180);m.event(1,x,180);check(m.platform.claims==0 && m.pane.owner.sideToolbar.opens==0,"content edge scroll untouched");
   m=new Monitor();m.event(0,x,900);m.event(2,x+inward,900);m.event(1,x+inward,900);check(m.platform.claims==0 && m.pane.owner.sideToolbar.opens==0,"main game gesture untouched");
   m=new Monitor();m.pane.owner.sideToolbar.ready=false;m.event(0,x,320);m.event(2,x+inward,320);check(m.platform.claims==0,"inactive toolbar never takes gesture");
  }
  System.out.println("PASS "+checks+" upper edge ownership checks");
 }
}
'''.replace('MONITOR', monitor).replace('TOOLBAR', toolbar)
java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='step-upper-edge-') as folder:
    folder = Path(folder); source = folder / 'UpperEdgeCases.java'
    source.write_text(harness, encoding='utf-8')
    subprocess.run([java / 'javac', '-encoding', 'UTF-8', '-d', folder, source, STEP / 'GameSpacePanelMotion.java'], check=True)
    subprocess.run([java / 'java', '-cp', folder, 'ls.augment.com.step.UpperEdgeCases'], check=True)
