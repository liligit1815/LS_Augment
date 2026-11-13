"""Exercise the production wallpaper tap filter and task-action guards."""
from pathlib import Path
import os, subprocess, tempfile

root = Path(__file__).resolve().parents[1]
source = (root / 'android/app/src/main/java/ls/augment/com/step/WorkspaceDeck.java').read_text(encoding='utf-8')

def method(signature):
    a = source.index(signature); b = source.index('{', a) + 1; depth = 1
    while depth:
        depth += (source[b] == '{') - (source[b] == '}'); b += 1
    return source[a:b]

code = r'''
public class WallpaperTapCases {
 static int checks;
 static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static class MotionEvent {
  static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;
  int action,count;float x,y;long time;
  MotionEvent(int a,int n,float x,float y,long t){action=a;count=n;this.x=x;this.y=y;time=t;}
  int getActionMasked(){return action;}int getPointerCount(){return count;}
  float getX(){return x;}float getY(){return y;}long getEventTime(){return time;}long getDownTime(){return 0;}
 }
 static class ViewConfiguration {
  static ViewConfiguration get(Object ctx){return new ViewConfiguration();}
  int getScaledTouchSlop(){return 10;}static int getLongPressTimeout(){return 500;}
 }
 static class View {int clicks;void performClick(){clicks++;}}
 static class Host {boolean topAvailable=true;int upperAppId=-1,actions;void change(int slot){check(slot==-1,"only upper slot");actions++;}}
 static class Upper {boolean allowed=true,visible;boolean canSwitch(){return allowed;}}
 static class Owner {
  Object sideToolbar=new Object();Host host=new Host();Upper upper=new Upper();boolean valid=true;String note;
  void checkAction(){if(!valid)throw new IllegalStateException("stale");}
  void logUnavailable(String value){note=value;}void note(RuntimeException e){note=e.getMessage();}
 }
 Object ctx=new Object(),paging;View networks=new View();Owner owner=new Owner();
 boolean closed,blocked,interrupted,wallpaperTap,dragging,vertical;
 static final int CONTROLS=0;int page;float offset,downX=100,downY=100;
 int indexOfChild(View v){return 0;}
 TOUCH
 TAKE
 void event(int action,int count,float x,float y,long time){wallpaperTouch(networks,new MotionEvent(action,count,x,y,time));}
 void down(){event(0,1,100,100,0);}
 void up(){event(1,1,100,100,100);}
 public static void main(String[] args){
  WallpaperTapCases c=new WallpaperTapCases();c.down();c.event(2,1,105,106,40);c.up();c.up();
  check(c.networks.clicks==1,"short tap clicks once despite duplicate up");
  for(int axis=0;axis<2;axis++){
   c=new WallpaperTapCases();c.down();c.event(2,1,axis==0?140:100,axis==1?140:100,30);c.up();
   check(c.networks.clicks==0,"drag returning to start is not tap "+axis);
  }
  c=new WallpaperTapCases();c.down();c.event(5,2,100,100,20);c.up();check(c.networks.clicks==0,"two fingers never click");
  c=new WallpaperTapCases();c.down();c.event(3,1,100,100,20);c.up();check(c.networks.clicks==0,"cancel never clicks");
  c=new WallpaperTapCases();c.down();c.event(1,1,100,100,501);check(c.networks.clicks==0,"long press never clicks");
  for(int guard=0;guard<7;guard++){
   c=new WallpaperTapCases();
   switch(guard){case 0:c.blocked=true;break;case 1:c.interrupted=true;break;case 2:c.offset=.1f;break;case 3:c.page=1;break;}
   c.down();
   switch(guard){case 4:c.blocked=true;break;case 5:c.vertical=true;break;case 6:c.dragging=true;break;}
   c.up();check(c.networks.clicks==0,"edge, page or gesture ownership prevents click "+guard);
  }
  c=new WallpaperTapCases();c.takeMainFromWallpaper();check(c.owner.host.actions==1,"touch and accessibility share real upper action");
  c=new WallpaperTapCases();c.owner.host.upperAppId=42;c.takeMainFromWallpaper();check(c.owner.host.actions==1,"occupied upper uses the same transactional exchange action");
  for(int guard=0;guard<9;guard++){
   c=new WallpaperTapCases();
   switch(guard){case 0:c.closed=true;break;case 1:c.page=1;break;case 2:c.paging=new Object();break;
    case 3:c.owner.sideToolbar=null;break;case 4:c.owner.valid=false;break;case 5:c.owner.host.topAvailable=false;break;
    case 6:c.owner.upper=null;break;case 7:c.owner.upper.allowed=false;break;case 8:c.owner.upper.visible=true;break;}
   c.takeMainFromWallpaper();check(c.owner.host.actions==0,"stale session or disabled capability preserved "+guard);
  }
  System.out.println("PASS "+checks+" production wallpaper click and action guard checks");
 }
}
'''.replace('TOUCH',method('    boolean wallpaperTouch(')).replace('TAKE',method('    void takeMainFromWallpaper('))
java = Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='step-wallpaper-tap-') as directory:
    path=Path(directory); file=path/'WallpaperTapCases.java'; file.write_text(code,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',path,file],check=True)
    subprocess.run([java/'java','-cp',path,'WallpaperTapCases'],check=True)
