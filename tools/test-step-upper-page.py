"""Run actual upper-page rendering and its frame-commit acknowledgement together."""
from pathlib import Path
import os,subprocess,tempfile
r=Path(__file__).resolve().parents[1];step=r/'android/app/src/main/java/ls/augment/com/step'
def extract(file,signature):
 s=(step/file).read_text(encoding='utf-8');a=s.index(signature);b=s.index('{',a)+1;depth=1
 while depth:
  depth+=(s[b]=='{')-(s[b]=='}');b+=1
 return s[a:b]
code=r'''
public class UpperPage {
 static int checks;static void check(boolean pass,String why){checks++;if(!pass)throw new AssertionError(why);}
 static class WindowManager {static class LayoutParams {int y,height;}}
 static class View {
  static final int VISIBLE=0,INVISIBLE=4,GONE=8;int visibility,height;Object parent;WindowManager.LayoutParams lp=new WindowManager.LayoutParams();Runnable frame;
  Object getLayoutParams(){return lp;}Object getParent(){return parent;}int getHeight(){return height;}
  void setVisibility(int v){visibility=v;}void setRotationX(int v){}void setAlpha(int v){}
  void getLocationOnScreen(int[] at){at[0]=0;at[1]=lp.y;}
  View getViewTreeObserver(){return this;}void registerFrameCommitCallback(Runnable r){frame=r;}
  void invalidate(){if(visibility==VISIBLE && frame!=null){Runnable r=frame;frame=null;r.run();}}
 }
 static class WorkspaceDeck {static final int NAVIGATION=5,UPPER=2;}
 static class Deck extends View {int page;void jump(int id){page=id;}void leaveUpperPage(){page=0;}}
 static class Owner {boolean closed;View bar=new View(),band=new View();Deck deck=new Deck();Owner(){deck.parent=new View();}void windowsUpdate(WindowManager.LayoutParams lp){bar.height=lp.height;}}
 static class Roll {boolean running;void reset(){running=false;}}
 static class Geometry {int top=684;}static class Handler {void post(Runnable r){r.run();}}
 static class Fence {boolean busy(){return true;}}
 static class Bundle {}static class ResultReceiver {int replies,code;void send(int c,Bundle b){replies++;code=c;}}
 static class Clock {static long uptimeMillis(){return 1;}}
 static class Host {
  boolean closing;int upperId=42,upperNavigationId=43;Geometry geometry=new Geometry();Owner quickBar;Fence fence=new Fence();Handler main=new Handler();
  void publishViewState(){}
  AWAIT
 }
 Owner owner=new Owner();Host host=new Host();Roll roll=new Roll();boolean visible;View face=new View(),promote=new View(),add=new View();
 UpperPage(){host.quickBar=owner;}
 RENDER
 public static void main(String[] args){
  UpperPage p=new UpperPage();p.render(true,true);
  check(p.owner.bar.height==1 && p.owner.bar.lp.y==0,"native app gets full top region");
  check(p.owner.deck.page==WorkspaceDeck.UPPER,"visible video publishes its own page for screen-off bookmark");
  p.host.upperId=43;p.render(true,true);check(p.owner.deck.page==WorkspaceDeck.NAVIGATION,"visible navigation publishes navigation rather than stale video page");
  check(p.owner.band.visibility==View.GONE && ((View)p.owner.deck.parent).visibility==View.GONE && p.face.visibility==View.GONE,"no controls cover native app");
  ResultReceiver reply=new ResultReceiver();p.host.awaitUpperCaption(reply,0);
  check(reply.replies==1 && reply.code==1,"visible render host acknowledges physical input frame");
  p.render(false,true);check(p.owner.bar.height==684 && p.owner.band.visibility==View.VISIBLE && ((View)p.owner.deck.parent).visibility==View.VISIBLE,"horizontal return restores toolbar page");
  p.render(true,false);check(p.face.visibility==View.VISIBLE && ((View)p.owner.deck.parent).visibility==View.GONE,"empty upper page has one add affordance, no duplicate deck text");
  p.render(false,false);check(p.face.visibility==View.GONE && ((View)p.owner.deck.parent).visibility==View.VISIBLE,"empty page can return to controls");
  System.out.println("PASS "+checks+" production upper page and frame acknowledgement checks");
 }
}
'''.replace('AWAIT',extract('LiveWorkspace.java','    void awaitUpperCaption(').replace('android.os.SystemClock','Clock')).replace('RENDER',extract('UpperPane.java','    void render(boolean taskFace,boolean occupied)'))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-upper-page-') as directory:
 p=Path(directory);f=p/'UpperPage.java';f.write_text(code,encoding='utf-8');subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f],check=True);subprocess.run([java/'java','-cp',p,'UpperPage'],check=True)
