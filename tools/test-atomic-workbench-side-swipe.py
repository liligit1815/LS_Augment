"""Execute actual side shield policy+Android listener, including View default click/long-click dispatch."""
from pathlib import Path
import argparse
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
JDK = Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8"))
PRODUCTION = ["AtomicWorkbenchSideSwipePolicy", "AtomicWorkbenchSideSwipe"]
STUBS = {
    "android/view/animation/OvershootInterpolator.java": "package android.view.animation;public class OvershootInterpolator {public OvershootInterpolator(float tension){}}",
    "android/content/Context.java": "package android.content;public class Context {}",
    "android/util/DisplayMetrics.java": "package android.util;public class DisplayMetrics {public float density=1;}",
    "android/content/res/Resources.java": "package android.content.res;public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}",
    "android/view/ViewConfiguration.java": "package android.view;public class ViewConfiguration {public static ViewConfiguration get(android.content.Context c){return new ViewConfiguration();}public int getScaledTouchSlop(){return 8;}public int getScaledMinimumFlingVelocity(){return 50;}public static int getLongPressTimeout(){return 500;}}",
    "android/view/ViewParent.java": "package android.view;public interface ViewParent {void requestDisallowInterceptTouchEvent(boolean d);}",
    "android/view/MotionEvent.java": '''package android.view;public class MotionEvent {
 public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5,ACTION_POINTER_UP=6;
 public static int live;public int action,pointers=1;public float x,y,rawX,rawY;public long time;boolean recycled;
 public MotionEvent(int a,float x,float y,float rx,float ry,long t,int count){action=a;this.x=x;this.y=y;rawX=rx;rawY=ry;time=t;pointers=count;live++;}
 public static MotionEvent obtain(MotionEvent e){return new MotionEvent(e.action,e.x,e.y,e.rawX,e.rawY,e.time,e.pointers);}
 public int getActionMasked(){return action;}public void setAction(int a){action=a;}public int getPointerCount(){return pointers;}
 public float getX(){return x;}public float getY(){return y;}public float getRawX(){return rawX;}public float getRawY(){return rawY;}public long getEventTime(){return time;}
 public void offsetLocation(float dx,float dy){x+=dx;y+=dy;}public void recycle(){if(recycled)throw new AssertionError("event recycled twice");recycled=true;live--;}}
''',
    "android/view/VelocityTracker.java": '''package android.view;public class VelocityTracker {
 public static int live;boolean first=true;float startX,startY,x,y,vx,vy;long start,time;public static VelocityTracker obtain(){live++;return new VelocityTracker();}
 public void addMovement(MotionEvent e){if(first){first=false;startX=e.getX();startY=e.getY();start=e.getEventTime();}x=e.getX();y=e.getY();time=e.getEventTime();}
 public void computeCurrentVelocity(int units){vx=time>start?(x-startX)*units/(time-start):0;vy=time>start?(y-startY)*units/(time-start):0;}
 public float getXVelocity(){return vx;}public float getYVelocity(){return vy;}public void recycle(){live--;}}
''',
    "android/view/ViewPropertyAnimator.java": '''package android.view;public class ViewPropertyAnimator {final View view;float x,y;public int cancels,starts;public ViewPropertyAnimator(View v){view=v;}
 public void cancel(){cancels++;}public ViewPropertyAnimator translationX(float f){x=f;return this;}public ViewPropertyAnimator translationY(float f){y=f;return this;}public ViewPropertyAnimator setInterpolator(android.view.animation.OvershootInterpolator i){return this;}public ViewPropertyAnimator setDuration(long d){return this;}public void start(){starts++;view.setTranslationX(x);view.setTranslationY(y);}}
''',
    "android/view/View.java": '''package android.view;public class View {
 public interface OnTouchListener{boolean onTouch(View v,MotionEvent e);}public OnTouchListener listener;public float tx,ty;public int width=100,height=100,clicks,longClicks,nativeCancels,cancelLongPresses;public boolean pressed,longClicked;
 public ViewParent parent;final ViewPropertyAnimator animator=new ViewPropertyAnimator(this);public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){return new android.content.res.Resources();}
 public void setOnTouchListener(OnTouchListener l){listener=l;}public ViewParent getParent(){return parent;}public int getWidth(){return width;}public int getHeight(){return height;}
 public void setTranslationX(float x){tx=x;}public void setTranslationY(float y){ty=y;}public float getTranslationX(){return tx;}public float getTranslationY(){return ty;}public ViewPropertyAnimator animate(){return animator;}
 public void cancelLongPress(){cancelLongPresses++;}public void setPressed(boolean p){pressed=p;}public boolean performLongClick(){longClicked=true;longClicks++;return true;}
 public boolean dispatchTouchEvent(MotionEvent e){if(listener!=null&&listener.onTouch(this,e))return true;return onTouchEvent(e);}
 public boolean onTouchEvent(MotionEvent e){switch(e.getActionMasked()){case 0:pressed=true;longClicked=false;break;case 1:if(pressed&&!longClicked)clicks++;pressed=false;break;case 3:nativeCancels++;pressed=false;break;}return true;}}
''',
}
TEST = r'''package ls.augment.com;import android.view.*;import java.util.*;
public final class TestSideSwipe {
 static int cases,checks;interface Case{void run();}static void yes(boolean v,String n){checks++;if(!v)throw new AssertionError(n);}static void test(String n,Case c){int e=MotionEvent.live,v=VelocityTracker.live;c.run();yes(e==MotionEvent.live&&v==VelocityTracker.live,"gesture resources leaked");cases++;System.out.println("PASS side swipe: "+n);}
 static final class F implements ViewParent {final View shield=new View(),frame=new View();final ArrayList<AtomicWorkbenchSideSwipePolicy.Action> actions=new ArrayList<>();final AtomicWorkbenchSideSwipe swipe;boolean disallowed;
  F(int sign){this(sign,null);}F(int sign,AtomicWorkbenchSideSwipe.Callback callback){frame.tx=10;frame.ty=20;shield.parent=this;swipe=AtomicWorkbenchSideSwipe.install(shield,frame,sign,callback==null?actions::add:callback);}
  public void requestDisallowInterceptTouchEvent(boolean d){disallowed=d;}
  boolean event(int a,float x,float y,long t,int pointers){MotionEvent e=new MotionEvent(a,x-frame.tx,y-frame.ty,x,y,t,pointers);try{return shield.dispatchTouchEvent(e);}finally{e.recycle();}}
  void down(){event(0,200,300,1000,1);}void finish(){swipe.close();}
 }
 static AtomicWorkbenchSideSwipePolicy policy(int sign){return new AtomicWorkbenchSideSwipePolicy(8,40,50,100,500,sign);}
 public static void main(String[] args){
  test("ordinary tap remains real View click with DOWN returning false",()->{F f=new F(1);MotionEvent d=new MotionEvent(0,0,0,200,300,1000,1);yes(!f.swipe.onTouch(f.shield,d),"DOWN stole native click");f.shield.onTouchEvent(d);d.recycle();f.event(2,203,302,1010,1);f.event(1,203,302,1100,1);yes(f.shield.clicks==1&&f.actions.isEmpty()&&f.shield.nativeCancels==0,"ordinary tap changed View behavior");f.finish();});
  test("vertical dominant upward drag follows actual frame and shelves once",()->{F f=new F(1);f.down();f.event(2,205,280,1050,1);yes(f.frame.ty==0&&f.frame.tx==10&&f.disallowed,"frame did not follow upward raw motion");f.event(1,208,250,1150,1);yes(f.actions.equals(List.of(AtomicWorkbenchSideSwipePolicy.Action.UP))&&f.shield.clicks==0&&f.shield.nativeCancels==1&&f.shield.cancelLongPresses==1&&!f.disallowed,"swipe replayed or promoted click");yes(f.frame.tx==10&&f.frame.ty==20,"committed frame not returned to stable origin");f.event(1,208,250,1151,1);yes(f.actions.size()==1,"duplicate UP committed again");f.finish();});
  for(int sign:new int[]{-1,1})test("outward screen direction "+sign,()->{F f=new F(sign);f.down();f.event(2,200+sign*15,300,1030,1);yes(f.frame.tx==10+sign*15,"first raw translation wrong");f.event(2,200+sign*35,302,1060,1);yes(f.frame.tx==10+sign*35,"frame translation fed back into pointer delta");f.event(1,200+sign*55,302,1120,1);yes(f.actions.equals(List.of(AtomicWorkbenchSideSwipePolicy.Action.OUT))&&f.shield.clicks==0,"outward sign did not reach exact action");f.finish();});
  test("diagonal tie prefers vertical",()->{F f=new F(1);f.down();f.event(2,220,280,1020,1);yes(f.frame.tx==10&&f.frame.ty==0,"diagonal tie captured horizontal");f.event(1,240,260,1100,1);yes(f.actions.equals(List.of(AtomicWorkbenchSideSwipePolicy.Action.UP)),"diagonal action wrong");f.finish();});
  test("axis locks after capture and never changes to another action",()->{F f=new F(1);f.down();f.event(2,220,298,1020,1);f.event(2,225,200,1060,1);yes(f.frame.ty==20&&f.frame.tx==35,"captured horizontal axis changed");f.event(1,255,190,1120,1);yes(f.actions.equals(List.of(AtomicWorkbenchSideSwipePolicy.Action.OUT)),"direction switched after capture");f.finish();});
  for(int[] delta:new int[][]{{-50,0},{0,50}})test("unsupported direction cancels native click and does not mutate",()->{F f=new F(1);f.down();f.event(2,200+delta[0],300+delta[1],1020,1);f.event(1,200+delta[0],300+delta[1],1080,1);yes(f.actions.isEmpty()&&f.shield.clicks==0&&f.shield.nativeCancels==1&&f.frame.tx==10&&f.frame.ty==20,"unsupported drag became click or action");f.finish();});
  test("small slow captured drag cancels and springs back",()->{F f=new F(1);f.down();f.event(2,210,300,1050,1);f.event(1,215,300,2000,1);yes(f.actions.isEmpty()&&f.shield.clicks==0&&f.frame.tx==10&&f.frame.animate().starts>0,"short slow drag committed");f.finish();});
  test("fast correctly directed fling below distance confirms",()->{F f=new F(1);f.down();f.event(2,210,300,1020,1);f.event(1,215,300,1050,1);yes(f.actions.equals(List.of(AtomicWorkbenchSideSwipePolicy.Action.OUT)),"actual velocity did not confirm short fling");f.finish();});
  test("velocity is measured in raw space after frame translation",()->{F f=new F(1);f.down();f.event(2,210,300,1050,1);f.event(1,215,300,1150,1);yes(f.actions.equals(List.of(AtomicWorkbenchSideSwipePolicy.Action.OUT)),"translated local coordinates corrupted fling velocity");f.finish();});
  test("UP-only displacement still cancels native long press before consume",()->{F f=new F(1);f.down();f.event(1,250,300,1100,1);yes(f.actions.size()==1&&f.shield.nativeCancels==1&&!f.shield.pressed&&f.shield.cancelLongPresses==1,"capture on UP left native View pressed or timer pending");f.finish();});
  test("returning to origin rejects despite previous large translation",()->{F f=new F(1);f.down();f.event(2,260,300,1050,1);f.event(1,200,300,1120,1);yes(f.actions.isEmpty()&&f.shield.clicks==0&&f.frame.tx==10,"return-to-origin committed");f.finish();});
  test("native long click remains native and cannot turn into swipe",()->{F f=new F(1);f.down();f.shield.performLongClick();f.swipe.markLongPressed();f.event(2,260,230,1600,1);f.event(1,270,210,1700,1);yes(f.shield.longClicks==1&&f.shield.clicks==0&&f.actions.isEmpty()&&f.shield.nativeCancels==0,"long click converted to drag");f.finish();});
  test("elapsed long-press cutoff works without a custom callback wrapper",()->{F f=new F(1);f.down();f.event(2,260,230,1600,1);f.event(1,260,230,1700,1);yes(f.actions.isEmpty()&&f.shield.nativeCancels==0,"late move captured after native long-press interval");f.finish();});
  for(boolean captured:new boolean[]{false,true})test("second pointer cancels and drains to final UP captured="+captured,()->{F f=new F(1);f.down();if(captured)f.event(2,220,300,1020,1);f.event(5,240,300,1030,2);f.event(6,240,300,1040,2);f.event(2,280,300,1050,1);f.event(1,280,300,1100,1);yes(f.actions.isEmpty()&&f.shield.clicks==0&&f.shield.nativeCancels==1&&f.frame.tx==10,"multi-pointer gesture clicked or committed");f.finish();});
  test("ACTION_CANCEL resets frame and does not deliver task callback",()->{F f=new F(1);f.down();f.event(2,240,300,1020,1);f.event(3,240,300,1050,1);yes(f.actions.isEmpty()&&f.shield.clicks==0&&f.frame.tx==10&&!f.disallowed,"cancel committed or retained frame");f.finish();});
  test("UI cancellation drains old UP and a new native tap recovers",()->{F f=new F(1);f.down();f.swipe.cancel();f.event(1,200,300,1100,1);yes(f.actions.isEmpty()&&f.shield.clicks==0,"cancelled pending tap promoted");f.down();f.event(1,200,300,1100,1);yes(f.shield.clicks==1,"new tap did not recover");f.finish();});
  test("changing side during gesture cancels old sign until next DOWN",()->{F f=new F(1);f.down();f.event(2,220,300,1020,1);f.swipe.setOutwardSign(-1);f.event(1,260,300,1100,1);yes(f.actions.isEmpty(),"side change committed old direction");f.down();f.event(1,150,300,1100,1);yes(f.actions.equals(List.of(AtomicWorkbenchSideSwipePolicy.Action.OUT)),"new outward direction ignored");f.finish();});
  test("close during capture retires resources and cannot replay",()->{F f=new F(1);f.down();f.event(2,240,300,1020,1);f.finish();f.event(1,260,300,1100,1);yes(f.actions.isEmpty()&&f.shield.clicks==0&&f.frame.tx==10,"closed swipe retained mutation");f.finish();});
  test("clock rollback and nonfinite pointer abort fail closed",()->{for(boolean badClock:new boolean[]{true,false}){AtomicWorkbenchSideSwipePolicy p=policy(1);p.down(0,0,1000);var d=p.move(badClock?20:Float.NaN,0,badClock?999:1010,1);yes(d.consume&&d.cancelNative,"invalid stream not cancelled");yes(p.up(100,0,1100,1,1000,0).action==AtomicWorkbenchSideSwipePolicy.Action.NONE,"invalid stream committed");}});
  test("multi-pointer MOVE still cancels if pointer boundary was missed",()->{AtomicWorkbenchSideSwipePolicy p=policy(1);p.down(0,0,1000);var d=p.move(60,0,1020,2);yes(d.consume&&d.cancelNative&&!d.captured&&p.up(60,0,1100,1,1000,0).action==AtomicWorkbenchSideSwipePolicy.Action.NONE,"multi-pointer gesture clicked or committed");});
  test("cross-axis velocity and reversed direction cannot confirm",()->{AtomicWorkbenchSideSwipePolicy p=policy(1);p.down(0,0,1000);p.move(2,-10,1020,1);yes(p.up(2,-15,1100,1,5000,0).action==AtomicWorkbenchSideSwipePolicy.Action.NONE,"cross-axis velocity committed");p.down(0,0,1000);p.move(10,0,1020,1);yes(p.up(-5,0,1100,1,5000,0).action==AtomicWorkbenchSideSwipePolicy.Action.NONE,"wrong net direction committed");});
  test("target snapshot lifecycle and reentrant action retire exactly once",()->{int[] counts={0,0,0};F[] owner={null};owner[0]=new F(1,new AtomicWorkbenchSideSwipe.Callback(){public void onDown(){counts[0]++;}public void onAction(AtomicWorkbenchSideSwipePolicy.Action a){yes(counts[0]==1&&counts[2]==0,"target snapshot ended before commit callback");counts[1]++;owner[0].swipe.cancel();}public void onFinished(){counts[2]++;}});F f=owner[0];f.down();f.event(1,250,300,1100,1);f.event(1,250,300,1110,1);f.finish();yes(Arrays.equals(counts,new int[]{1,1,1}),"reentrant action replayed callbacks");});
  test("disabled main and empty shield retain native click without target capture or frame motion",()->{int[] snapshots={0};F f=new F(1,new AtomicWorkbenchSideSwipe.Callback(){public void onDown(){snapshots[0]++;}public void onAction(AtomicWorkbenchSideSwipePolicy.Action a){throw new AssertionError("disabled shield committed");}});f.swipe.setEnabled(false);MotionEvent d=new MotionEvent(0,190,280,200,300,1000,1);yes(!f.swipe.onTouch(f.shield,d),"disabled DOWN consumed native View");f.shield.onTouchEvent(d);d.recycle();f.event(2,260,250,1020,1);f.event(1,260,250,1100,1);yes(snapshots[0]==0&&f.frame.tx==10&&f.frame.ty==20&&f.shield.clicks==1&&f.shield.nativeCancels==0,"disabled shield captured target or translated frame");f.finish();});
  for(boolean captured:new boolean[]{false,true})test("disable drains previous stream without replay captured="+captured,()->{int[] finished={0};F f=new F(1,new AtomicWorkbenchSideSwipe.Callback(){public void onAction(AtomicWorkbenchSideSwipePolicy.Action a){throw new AssertionError("disabled old stream committed");}public void onFinished(){finished[0]++;}});f.down();if(captured)f.event(2,230,300,1020,1);f.swipe.setEnabled(false);f.swipe.setEnabled(false);MotionEvent m=new MotionEvent(2,250,280,260,300,1030,1);yes(f.swipe.onTouch(f.shield,m),"disabled old stream stopped consuming");m.recycle();f.event(1,270,300,1100,1);yes(f.shield.clicks==0&&f.shield.nativeCancels==1&&f.frame.tx==10&&f.frame.ty==20&&finished[0]==1,"disable replayed click/action or retained translation");f.down();f.event(1,200,300,1100,1);yes(f.shield.clicks==1&&finished[0]==1,"new disabled native tap remained blocked");f.finish();});
  test("reenabling before old UP cannot revive captured action and next DOWN works",()->{F f=new F(1);f.down();f.event(2,230,300,1020,1);f.swipe.setEnabled(false);f.swipe.setEnabled(true);f.event(1,270,300,1100,1);yes(f.actions.isEmpty()&&f.shield.clicks==0,"reenable revived old gesture");f.down();f.event(1,250,300,1100,1);yes(f.actions.equals(List.of(AtomicWorkbenchSideSwipePolicy.Action.OUT)),"reenable did not admit new gesture");f.finish();});
  System.out.println("SIDE SWIPE RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def run(directory, mutation=None, sdk=False):
    sources = dict(STUBS) if not sdk else {}
    if not sdk: sources["ls/augment/com/TestSideSwipe.java"] = TEST
    for name in PRODUCTION:
        source = (SRC / (name + ".java")).read_text(encoding="utf-8")
        if mutation and name == mutation[0]:
            assert source.count(mutation[1]) == 1, mutation[1]
            source = source.replace(mutation[1], mutation[2])
        sources["ls/augment/com/" + name + ".java"] = source
    files = []
    for name, source in sources.items():
        path = directory / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(source, encoding="utf-8"); files.append(str(path))
    cmd = [str(JDK / "bin/javac.exe"), "-J-Duser.language=en", "-J-Dfile.encoding=UTF-8", "--release", "17", "-encoding", "UTF-8", "-d", str(directory / "classes")]
    if sdk: cmd += ["-cp", str(ROOT / "audit-output/android-sdk/platforms/android-36/android.jar")]
    result = subprocess.run(cmd + files, capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=45)
    if result.returncode: raise AssertionError(result.stdout + result.stderr)
    if sdk: return result
    return subprocess.run([str(JDK / "bin/java.exe"), "-cp", str(directory / "classes"), "ls.augment.com.TestSideSwipe"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=30)


def main():
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument("--negative-controls", action="store_true"); args = parser.parse_args()
    for sdk in (False, True):
        with tempfile.TemporaryDirectory(prefix="duo-side-swipe-") as temporary:
            result = run(Path(temporary), sdk=sdk); print(result.stdout, end="")
            if result.returncode: raise AssertionError(result.stderr)
            if sdk: print("PASS side swipe actual Android adapter SDK36 compile")
    if not args.negative_controls: return
    mutations = [
        ("AtomicWorkbenchSideSwipe", 'callbackActive = true; callback.onDown(); return consume;', 'callbackActive = true; callback.onDown(); return true;', "DOWN stole native click"),
        ("AtomicWorkbenchSideSwipePolicy", 'Math.abs(dy) >= Math.abs(dx)', 'Math.abs(dy) > Math.abs(dx)', "diagonal tie captured horizontal"),
        ("AtomicWorkbenchSideSwipe", 'frame.setTranslationX(restX + decision.x);', 'frame.setTranslationX(decision.x);', "frame did not follow upward raw motion"),
        ("AtomicWorkbenchSideSwipe", 'shield.onTouchEvent(cancelled);', '/* MUTANT omit native cancel */', "swipe replayed or promoted click"),
        ("AtomicWorkbenchSideSwipePolicy", 'longPressed || time - downTime >= longPressMillis', 'false', "long click converted to drag"),
        ("AtomicWorkbenchSideSwipePolicy", 'pointers != 1 || ', '', "multi-pointer gesture clicked or committed"),
        ("AtomicWorkbenchSideSwipe", 'raw.offsetLocation(event.getRawX() - event.getX(), event.getRawY() - event.getY());', '/* MUTANT local velocity instead of raw */', "translated local coordinates corrupted fling velocity"),
        ("AtomicWorkbenchSideSwipe", 'enabled = value;', 'enabled = true;', "disabled shield committed"),
        ("AtomicWorkbenchSideSwipe", 'if (!enabled && policy == null) return false;', 'if (!enabled) return false;', "disabled old stream stopped consuming"),
    ]
    for mutation in mutations:
        with tempfile.TemporaryDirectory(prefix="duo-side-swipe-negative-") as temporary:
            result = run(Path(temporary), mutation)
            if result.returncode == 0 or mutation[3] not in result.stdout + result.stderr: raise AssertionError(result.stdout + result.stderr)
            print("PASS side swipe negative control: " + mutation[3])


if __name__ == "__main__": main()
