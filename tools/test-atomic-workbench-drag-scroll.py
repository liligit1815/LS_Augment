"""Run production frame scrolling against a controllable viewport and UI clock."""
from pathlib import Path
import runpy
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
SOURCES = {
    "android/os/SystemClock.java": "package android.os;public class SystemClock {public static long now;public static long uptimeMillis(){return now;}}",
    "android/view/View.java": r'''package android.view;
public class View {public int x,y,width=300,height=60;public boolean attached=true,shown=true;
 public void getLocationInWindow(int[] out){out[0]=x;out[1]=y;}public int getWidth(){return width;}public int getHeight(){return height;}
 public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown;}}
''',
    "android/view/DragEvent.java": r'''package android.view;
public class DragEvent {public static final int ACTION_DRAG_STARTED=1,ACTION_DRAG_LOCATION=2,ACTION_DROP=3,ACTION_DRAG_ENDED=4,ACTION_DRAG_ENTERED=5,ACTION_DRAG_EXITED=6;
 final int action;final float x,y;public DragEvent(int action,float x,float y){this.action=action;this.x=x;this.y=y;}
 public int getAction(){return action;}public float getX(){return x;}public float getY(){return y;}}
''',
    "android/widget/HorizontalScrollView.java": r'''package android.widget;
public class HorizontalScrollView extends android.view.View {public int scroll,maximum=1200;public final java.util.List<Runnable> frames=new java.util.ArrayList<>();
 public boolean canScrollHorizontally(int direction){return direction<0?scroll>0:scroll<maximum;}
 public void scrollBy(int x,int y){scroll=Math.max(0,Math.min(maximum,scroll+x));}
 public void postOnAnimation(Runnable run){frames.add(run);}public void removeCallbacks(Runnable run){frames.removeIf(item->item==run);}
 public void advance(long millis){android.os.SystemClock.now+=millis;var pending=new java.util.ArrayList<>(frames);frames.clear();for(Runnable run:pending)run.run();}}
''',
}
TEST = r'''package ls.augment.com;
import android.view.*;import android.widget.*;
public class TestDragScroll {
 static int cases,checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static void test(String name,Runnable body){body.run();cases++;System.out.println("PASS drag scrolling: "+name);}
 static void location(AtomicWorkbenchDragScroller controller,View source,float x,float y){controller.event(source,new DragEvent(DragEvent.ACTION_DRAG_LOCATION,x,y));}
 public static void main(String[] args){
  test("edge speed has correct direction smooth proximity and a clamped narrow viewport",()->{
   check(AtomicWorkbenchDragScrollPolicy.velocity(0,0,300,40,420)==-420,"left edge direction");
   check(AtomicWorkbenchDragScrollPolicy.velocity(300,0,300,40,420)==420,"right edge direction");
   check(AtomicWorkbenchDragScrollPolicy.velocity(150,0,300,40,420)==0,"center must be idle");
   check(AtomicWorkbenchDragScrollPolicy.velocity(280,0,300,40,420)<AtomicWorkbenchDragScrollPolicy.velocity(290,0,300,40,420),"proximity speed not increasing");
   check(AtomicWorkbenchDragScrollPolicy.velocity(10,0,20,40,420)==0,"narrow viewport edge regions overlap");
  });
  test("invalid and outside pointers cannot start a hidden runaway scroll",()->{
   for(float pointer:new float[]{Float.NaN,Float.NEGATIVE_INFINITY,-1,301})check(AtomicWorkbenchDragScrollPolicy.velocity(pointer,0,300,40,420)==0,"invalid pointer started scroll");
   check(AtomicWorkbenchDragScrollPolicy.velocity(1,0,0,40,420)==0,"zero viewport started scroll");
   check(AtomicWorkbenchDragScrollPolicy.velocity(1,0,300,-1,420)==0,"negative edge started scroll");
   check(AtomicWorkbenchDragScrollPolicy.distance(420,1000)==AtomicWorkbenchDragScrollPolicy.distance(420,64),"stalled frame jumped by wall clock");
   check(AtomicWorkbenchDragScrollPolicy.distance(420,-1)==0,"backward clock moved content");
  });
  test("tile-local pointer is transformed into the actual viewport before scrolling",()->{
   HorizontalScrollView viewport=new HorizontalScrollView();viewport.x=100;viewport.y=300;
   View tile=new View();tile.x=370;tile.y=310;
   AtomicWorkbenchDragScroller controller=new AtomicWorkbenchDragScroller(viewport,1);
   location(controller,tile,25,15);check(viewport.frames.size()==1,"right tile edge did not schedule");
   viewport.advance(16);check(viewport.scroll>0,"correct local pointer did not scroll right");
   location(controller,tile,25,100);check(viewport.frames.isEmpty(),"outside vertical bounds continued scrolling");
   controller.close();
  });
  test("stationary edge pointer advances all the way to the final target then stops",()->{
   HorizontalScrollView viewport=new HorizontalScrollView();viewport.maximum=50;
   AtomicWorkbenchDragScroller controller=new AtomicWorkbenchDragScroller(viewport,1);location(controller,viewport,300,30);
   for(int i=0;i<30;i++)viewport.advance(16);
   check(viewport.scroll==50&&viewport.frames.isEmpty(),"end boundary never reached or kept scheduling");
   controller.close();
  });
  test("returning to the middle stops and another edge resumes with the opposite direction",()->{
   HorizontalScrollView viewport=new HorizontalScrollView();viewport.scroll=100;
   AtomicWorkbenchDragScroller controller=new AtomicWorkbenchDragScroller(viewport,1);location(controller,viewport,0,30);viewport.advance(16);
   int left=viewport.scroll;check(left<100,"left edge did not scroll");
   location(controller,viewport,150,30);viewport.advance(100);check(viewport.scroll==left&&viewport.frames.isEmpty(),"middle pointer did not stop");
   location(controller,viewport,300,30);viewport.advance(16);check(viewport.scroll>left,"opposite edge did not resume");controller.close();
  });
  for(int end:new int[]{DragEvent.ACTION_DRAG_EXITED,DragEvent.ACTION_DROP,DragEvent.ACTION_DRAG_ENDED})test("drag lifetime end cancels its queued frame: "+end,()->{
   HorizontalScrollView viewport=new HorizontalScrollView();AtomicWorkbenchDragScroller controller=new AtomicWorkbenchDragScroller(viewport,1);
   location(controller,viewport,300,30);controller.event(viewport,new DragEvent(end,300,30));viewport.advance(100);
   check(viewport.scroll==0&&viewport.frames.isEmpty(),"ended drag retained scrolling");controller.close();
  });
  test("detach hide close and a late callback cannot leave background scrolling",()->{
   for(String reason:new String[]{"detach","hide","close"}){
    HorizontalScrollView viewport=new HorizontalScrollView();AtomicWorkbenchDragScroller controller=new AtomicWorkbenchDragScroller(viewport,1);
    location(controller,viewport,300,30);Runnable late=viewport.frames.get(0);
    if(reason.equals("detach"))viewport.attached=false;else if(reason.equals("hide"))viewport.shown=false;else controller.close();
    viewport.advance(16);late.run();check(viewport.scroll==0&&viewport.frames.isEmpty(),"lifetime leak: "+reason);controller.close();
   }
  });
  System.out.println("DRAG SCROLL RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    sources = dict(SOURCES)
    sources["ls/augment/com/TestDragScroll.java"] = TEST
    with tempfile.TemporaryDirectory(prefix="lsa-drag-scroll-") as directory:
        SUPPORT["compile_run"](Path(directory), sources,
                               ["AtomicWorkbenchDragScrollPolicy.java", "AtomicWorkbenchDragScroller.java"],
                               "ls.augment.com.TestDragScroll")


if __name__ == "__main__":
    main()
