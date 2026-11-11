"""Production crop geometry, edge ownership, and automatic lyric recovery."""
from pathlib import Path
import os, subprocess, tempfile
root=Path(__file__).resolve().parents[1]
src=root/'android/app/src/main/java/ls/augment/com'
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
def method(file,signature):
 s=(src/file).read_text(encoding='utf-8');a=s.index(signature);b=s.index('{',a)+1;depth=1
 while depth:depth+=(s[b]=='{')-(s[b]=='}');b+=1
 return s[a:b]
def run(name,code,extra=()):
 with tempfile.TemporaryDirectory(prefix='step-four-') as tmp:
  p=Path(tmp);f=p/(name+'.java');f.write_text(code,encoding='utf-8')
  subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f,*extra],check=True)
  subprocess.run([java/'java','-cp',p,'ls.augment.com.'+name],check=True)
run('CropCases',r'''
package ls.augment.com;
public class CropCases {
 static int checks;static void ok(boolean b){checks++;if(!b)throw new AssertionError(checks);}
 public static void main(String[] args){
  WallpaperCropTransform p=new WallpaperCropTransform();
  for(int[] image:new int[][]{{100,200},{200,100},{1600,900},{1,500},{500,1}}){
   for(float zoom:new float[]{-1,1,1.3f,4,9})for(float offset:new float[]{-9,0,.2f,9}){
    p.zoom=zoom;p.x=offset;p.y=-offset;p.constrain(1216,684,image[0],image[1]);float r=p.ratio(1216,684,image[0],image[1]);
    ok(p.zoom>=1&&p.zoom<=4);ok(1216*(.5+p.x)-image[0]*r/2<=.01);ok(1216*(.5+p.x)+image[0]*r/2>=1215.99);
    ok(684*(.5+p.y)-image[1]*r/2<=.01);ok(684*(.5+p.y)+image[1]*r/2>=683.99);
    float x=p.x,y=p.y;p.constrain(1920,1080,image[0],image[1]);ok(Math.abs(p.x-x)<.001&&Math.abs(p.y-y)<.001);
   }
  }
  p.zoom=1;p.x=p.y=0;p.zoomAt(2,.75f,.25f);ok(Math.abs(p.x+.25f)<.001&&Math.abs(p.y-.25f)<.001);
  p.zoomAt(1,.75f,.25f);ok(Math.abs(p.x)<.001&&Math.abs(p.y)<.001);
  System.out.println("PASS "+checks+" crop coverage/focal zoom/output pose checks");
 }
}''',[src/'WallpaperCropTransform.java'])
run('EdgeCases',r'''
package ls.augment.com;
public class EdgeCases {
 static int checks;static void ok(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static class InputDevice{static int SOURCE_TOUCHSCREEN=1;}
 static class MotionEvent{
  static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;
  int op,n=1;float x,y;MotionEvent(int a,float b,float c){op=a;x=b;y=c;}
  boolean isFromSource(int s){return true;}int getActionMasked(){return op;}int getPointerCount(){return n;}int getPointerId(int i){return i;}
  float getRawX(){return x;}float getRawY(){return y;}
 }
 static Object call(Object x,String name){return 0;}
 static class GameSpacePanelMotion{static boolean inward(float x,float y,boolean right,int slop){return (right?-x:x)>slop&&Math.abs(x)>Math.abs(y)*1.25f;}}
 static class WorkspaceSideToolbar{
  boolean panelAttached,usable=true,edgeTracking;int opens;
  boolean usable(){return usable;}
  boolean ownsGesture(float x,float y){return panelAttached||edgeTracking||y>=238&&y<446&&(x<20||x>=1196);}
  int edgeStart(float x,float y){return !usable||panelAttached||y<0||y>=684||x<0||x>=1216?-1:x<78?0:x>=1138?1:-1;}
  void setOpen(boolean b){opens++;panelAttached=b;}
 }
 static class Deck{int pages;void fromUpper(int d){pages+=d;}}
 static class Owner{WorkspaceSideToolbar sideToolbar=new WorkspaceSideToolbar();Deck deck=new Deck();int dp(int n){return n*3;}}
 static class Geometry{int width=1216;}
 static class Host{Geometry geometry=new Geometry();}
 static class Pane{Owner owner=new Owner();Host host=new Host();boolean visible=true;boolean canSwitch(){return true;}}
 static class Pilfer{int count;void invoke(Object p){count++;}}
 Pane pane=new Pane();Pilfer pilfer=new Pilfer();Object platform;int edge=-1,first=-1,second=-1;float x1,y1;boolean edgeRejected,edgeOpened,horizontal;
 void reset(){edge=-1;first=second=-1;edgeRejected=edgeOpened=horizontal=false;}
 boolean inside(MotionEvent e,int n){return e.x>=0&&e.x<1216&&e.y>=0&&e.y<684;}
 EDGE_HANDLER
 void e(int a,float x,float y)throws Exception{onTouch(new MotionEvent(a,x,y));}
 public static void main(String[] args)throws Exception{
  for(boolean nativePage:new boolean[]{false,true})for(float[] point:new float[][]{{50,100},{50,600},{1160,100},{1160,600}}){
   EdgeCases c=new EdgeCases();c.pane.visible=nativePage;c.e(0,point[0],point[1]);c.e(2,point[0]+(point[0]<600?200:-200),point[1]);c.e(1,600,point[1]);
   ok(c.pane.owner.sideToolbar.opens==1&&c.pilfer.count==1,"edge opened once");ok(c.pane.owner.deck.pages==0,"edge never pages");
  }
  EdgeCases c=new EdgeCases();c.e(0,50,100);c.e(2,50,250);c.e(2,400,250);c.e(1,400,250);ok(c.pane.owner.sideToolbar.opens==0,"vertical rejects entire stream");
  c=new EdgeCases();c.e(0,50,100);MotionEvent multi=new MotionEvent(5,50,100);multi.n=2;c.onTouch(multi);c.e(2,400,100);c.e(1,400,100);ok(c.pilfer.count==0,"pinch stays native");
  c=new EdgeCases();c.e(0,50,100);c.e(1,50,100);ok(c.pilfer.count==0,"edge taps preserved");
  c.e(0,50,100);c.e(3,50,100);c.e(0,900,400);c.e(2,300,400);c.e(1,300,400);ok(c.pane.owner.deck.pages==1,"cancel then center paging");
  c=new EdgeCases();c.e(0,50,900);c.e(2,400,900);c.e(1,400,900);ok(c.pilfer.count==0,"main untouched");
  c=new EdgeCases();c.pane.owner.sideToolbar.usable=false;c.e(0,50,100);c.e(2,100,100);c.e(1,100,100);ok(c.pane.owner.sideToolbar.opens==0,"busy sidebar not opened");
  c=new EdgeCases();c.e(0,12,342);c.pane.owner.sideToolbar.edgeTracking=true;c.e(2,300,342);c.e(1,300,342);ok(c.pilfer.count==0,"actual handle owns its stream");
  System.out.println("PASS "+checks+" edge arbitration checks");
 }
}'''.replace('EDGE_HANDLER',method('step/TopGestureMonitor.java','    void onTouch(')))
run('LyricsCases',r'''
package ls.augment.com;
public class LyricsCases {
 static int checks;static void ok(boolean b){checks++;if(!b)throw new AssertionError(checks);}
 static class SystemClock{static long now;static long elapsedRealtime(){return now;}}
 static class StepRuntime{static boolean awake;static boolean interactive(Object c){return awake;}}
 static class LyricLookup{enum Status{FOUND,INSTRUMENTAL,NO_MATCH,INSUFFICIENT}}
 static class Lines{boolean empty=true;boolean empty(){return empty;}boolean timeline(){return !empty;}}
 static class Owner{Object ctx;}
 Owner owner=new Owner();Object controller=new Object();Lines lines=new Lines();boolean closed,fetching,manualLyrics;String liveLine="",titleText="song",artist="artist";
 LyricLookup.Status lyricStatus=LyricLookup.Status.NO_MATCH;int autoAttempts,calls;long duration=1000,nextAutoLookup;
 void findLyrics(int source,boolean manual){calls++;fetching=true;}
 ENSURE
 public static void main(String[] args){
  LyricsCases c=new LyricsCases();c.ensureLyrics();ok(c.calls==0&&c.autoAttempts==0);
  StepRuntime.awake=true;c.ensureLyrics();ok(c.calls==1);c.ensureLyrics();ok(c.calls==1);
  c.fetching=false;SystemClock.now=34999;c.ensureLyrics();ok(c.calls==1);SystemClock.now=35000;c.ensureLyrics();ok(c.calls==2);
  c.fetching=false;SystemClock.now=70000;c.ensureLyrics();ok(c.calls==3);c.fetching=false;SystemClock.now=200000;c.ensureLyrics();ok(c.calls==3);
  c=new LyricsCases();c.duration=0;c.ensureLyrics();ok(c.calls==0&&c.autoAttempts==0);c.duration=1000;c.ensureLyrics();ok(c.calls==1);
  c=new LyricsCases();c.lines.empty=false;c.ensureLyrics();ok(c.calls==0);c.lines.empty=true;c.liveLine="session lyric";c.ensureLyrics();ok(c.calls==0);
  c.liveLine="";c.lyricStatus=LyricLookup.Status.INSTRUMENTAL;c.ensureLyrics();ok(c.calls==0);
  System.out.println("PASS "+checks+" lyric wake/retry/source-priority checks");
 }
}'''.replace('ENSURE',method('step/PlayerCard.java','    void ensureLyrics(')))
