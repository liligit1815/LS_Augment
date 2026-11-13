"""Execute production two-finger recognition and original-task validation with pointer streams."""
from pathlib import Path
import os, subprocess, tempfile

root = Path(__file__).resolve().parents[1]
step = root / 'android/app/src/main/java/ls/augment/com/step'
pane = (step / 'UpperPane.java').read_text(encoding='utf-8')
def method(signature):
    a = pane.index(signature); b = pane.index('{', a) + 1; depth = 1
    while depth:
        depth += (pane[b] == '{') - (pane[b] == '}'); b += 1
    return pane[a:b]

sources = {
'android/view/MotionEvent.java':r'''
package android.view;
public class MotionEvent {
 public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5,ACTION_POINTER_UP=6;
 int action,index;long time;int[] ids;float[] x,y;
 public MotionEvent(int a,long t,int index,int[] ids,float[] x,float[] y){action=a;time=t;this.index=index;this.ids=ids;this.x=x;this.y=y;}
 public int getActionMasked(){return action;}public int getActionIndex(){return index;}public long getEventTime(){return time;}
 public int getPointerCount(){return ids.length;}public int getPointerId(int n){return ids[n];}
 public int findPointerIndex(int id){for(int n=0;n<ids.length;n++)if(ids[n]==id)return n;return -1;}
 public float getRawX(){return x[0];}public float getRawY(){return y[0];}public float getRawX(int n){return x[n];}public float getRawY(int n){return y[n];}
}''',
'ls/augment/com/step/UpperGestureCases.java':r'''
package ls.augment.com.step;
import android.view.MotionEvent;import java.util.*;
class LiveWorkspace {
 static class Lease {int id=42;boolean alive=true;Object checkedInfo(){return alive?this:null;}}
 static class Geometry{int width=1216,contentHeight=684;}
 Geometry geometry=new Geometry();int upperId=42;Map<Integer,Lease> leases=new HashMap<>();String action;int actions;
 void upperActionFor(int id,String action,Runnable callback){if(id!=upperId)throw new AssertionError("stale id");this.action=action;actions++;}
}
class UpperPane {
 static class Owner {boolean user=true;int dp(int v){return Math.round(v*3.25f);}boolean currentUser(){return user;}}
 Owner owner=new Owner();LiveWorkspace host=new LiveWorkspace();boolean visible=true,allowed=true;
 boolean canSwitch(){return allowed;}
 TARGET
 FINISH
}
class TopGestureMonitor {
 static class Pilfer {int calls;void invoke(Object p){calls++;}}
 UpperPane pane=new UpperPane();boolean horizontal;Pilfer pilfer=new Pilfer();Object platform;
 boolean inside(MotionEvent e,int n){return e.getRawX(n)>=0&&e.getRawX(n)<1216&&e.getRawY(n)>=0&&e.getRawY(n)<684;}
}
public class UpperGestureCases {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 TopGestureMonitor monitor=new TopGestureMonitor();UpperAppGesture g=new UpperAppGesture(monitor);long time;
 LiveWorkspace.Lease original=new LiveWorkspace.Lease();
 UpperGestureCases(){monitor.pane.host.leases.put(42,original);}
 void event(int op,int index,int[] ids,float[] x,float[] y)throws Exception{time+=30;g.onTouch(new MotionEvent(op,time,index,ids,x,y));}
 void down()throws Exception{event(0,0,new int[]{7},new float[]{500},new float[]{340});}
 void pair()throws Exception{event(5,1,new int[]{7,11},new float[]{500,700},new float[]{340,340});}
 void move(float dx1,float dy1,float dx2,float dy2)throws Exception{event(2,0,new int[]{7,11},new float[]{500+dx1,700+dx2},new float[]{340+dy1,340+dy2});}
 void lift(float dy)throws Exception{event(6,1,new int[]{7,11},new float[]{500,700},new float[]{340+dy,340+dy});}
 void up(float dy)throws Exception{event(1,0,new int[]{7},new float[]{500},new float[]{340+dy});}
 void begin()throws Exception{down();pair();}
 void rejected(String reason)throws Exception{lift(220);up(220);check(monitor.pane.host.actions==0,reason);}
 public static void main(String[] args)throws Exception{
  for(int direction:new int[]{-1,1}){
   UpperGestureCases c=new UpperGestureCases();c.begin();c.move(1,90*direction,2,92*direction);
   check(c.monitor.pilfer.calls==1&&c.monitor.pane.host.actions==0,"lock cancels native stream but does not dispatch early");
   c.move(2,220*direction,1,218*direction);c.lift(220*direction);
   check(c.monitor.pane.host.actions==0,"wait for final finger");c.up(220*direction);c.up(220*direction);
   check(c.monitor.pane.host.actions==1&&c.monitor.pilfer.calls==1,"exactly one action and one pilfer");
   check(c.monitor.pane.host.action.equals(direction<0?"dismiss":"release"),"up to background and down to main");
  }
  UpperGestureCases c=new UpperGestureCases();c.begin();c.move(0,100,0,100);c.lift(100);c.up(100);check(c.monitor.pane.host.actions==0,"short drag cannot move task");
  c=new UpperGestureCases();c.begin();c.move(-60,0,60,0);c.move(0,220,0,220);c.rejected("pinch rejection persists through later translation");check(c.monitor.pilfer.calls==0,"pinch never stolen");
  c=new UpperGestureCases();c.begin();c.move(0,-100,0,100);c.rejected("opposing fingers cannot dismiss");
  c=new UpperGestureCases();c.begin();c.move(150,30,150,30);c.rejected("two horizontal fingers stay native");check(c.monitor.pilfer.calls==0,"horizontal pair never stolen");
  c=new UpperGestureCases();c.down();c.time+=260;c.pair();c.move(0,220,0,220);c.rejected("late second finger cannot hijack native scrolling");
  c=new UpperGestureCases();c.down();c.event(5,1,new int[]{7,11},new float[]{500,700},new float[]{400,400});c.move(0,220,0,220);c.rejected("first finger already scrolling");
  c=new UpperGestureCases();c.begin();c.event(5,2,new int[]{7,11,13},new float[]{500,700,800},new float[]{340,340,340});c.move(0,220,0,220);c.rejected("third finger blocks whole stream");
  c=new UpperGestureCases();c.begin();c.move(0,220,0,220);c.event(3,0,new int[]{7,11},new float[]{500,700},new float[]{560,560});c.up(220);check(c.monitor.pane.host.actions==0,"cancel after direction lock cannot dispatch");
  for(int change=0;change<6;change++){
   c=new UpperGestureCases();c.begin();c.move(0,220,0,220);c.lift(220);
   switch(change){case 0:c.monitor.pane.visible=false;break;case 1:c.monitor.pane.allowed=false;break;case 2:c.monitor.pane.host.upperId=43;break;
    case 3:c.monitor.pane.host.leases.put(42,new LiveWorkspace.Lease());break;case 4:c.original.alive=false;break;case 5:c.monitor.pane.owner.user=false;break;}
   c.up(220);check(c.monitor.pane.host.actions==0,"changed page/session/user/task identity rejected "+change);
  }
  c=new UpperGestureCases();c.monitor.pane.visible=false;c.begin();c.move(0,220,0,220);c.rejected("wallpaper/music do not operate hidden app");
  c=new UpperGestureCases();c.monitor.horizontal=true;c.begin();c.move(0,220,0,220);c.rejected("already owned page swipe cannot become task operation");
  c=new UpperGestureCases();c.begin();c.time+=1600;c.move(0,220,0,220);c.rejected("held gesture timeout");
  c=new UpperGestureCases();c.begin();c.move(0,90,0,90);c.move(0,-220,0,-220);c.rejected("direction reversal cannot operate task");
  c=new UpperGestureCases();c.down();c.event(5,1,new int[]{7,11},new float[]{500,700},new float[]{340,700});c.move(0,220,0,220);c.rejected("both fingers must start inside top");
  c=new UpperGestureCases();c.begin();c.event(2,0,new int[]{11,7},new float[]{700,500},new float[]{560,560});
  c.event(6,1,new int[]{11,7},new float[]{700,500},new float[]{560,560});c.event(1,0,new int[]{11},new float[]{700},new float[]{560});
  check(c.monitor.pane.host.actions==1,"stable pointer IDs survive array reordering and first finger lifting first");
  System.out.println("PASS "+checks+" production two-finger task gesture and identity checks");
 }
}
'''.replace(' TARGET', method('    LiveWorkspace.Lease gestureTarget(')).replace(' FINISH', method('    void finishGesture('))}
java = Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='step-upper-gestures-') as tmp:
    folder = Path(tmp)
    for name, code in sources.items():
        file = folder / name; file.parent.mkdir(parents=True, exist_ok=True); file.write_text(code, encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,*folder.rglob('*.java'),step/'UpperAppGesture.java'],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.UpperGestureCases'],check=True)
