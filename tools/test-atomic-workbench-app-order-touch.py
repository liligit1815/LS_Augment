"""Run the complete page-local app-order controller and shared edge policy with controlled Views."""
from pathlib import Path
import runpy, subprocess, tempfile

S = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-engine.py')))
STUBS = {
    'android/graphics/Rect.java': 'package android.graphics;public class Rect {public int left,top,right,bottom;public boolean contains(int x,int y){return x>=left&&x<right&&y>=top&&y<bottom;}}',
    'android/os/SystemClock.java': 'package android.os;public class SystemClock {public static long now=1;public static long uptimeMillis(){return now;}}',
    'android/view/ViewParent.java': 'package android.view;public class ViewParent {public boolean blocked;public void requestDisallowInterceptTouchEvent(boolean value){blocked=value;}}',
    'android/view/MotionEvent.java': '''package android.view;public class MotionEvent {public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;public int action,count=1,id;public long down;public float x,y;public MotionEvent(int a,long d,float px,float py){action=a;down=d;x=px;y=py;}public int getActionMasked(){return action;}public long getDownTime(){return down;}public int getPointerCount(){return count;}public int getPointerId(int at){return id;}public float getRawX(){return x;}public float getRawY(){return y;}}''',
    'android/view/View.java': '''package android.view;public class View {public interface OnTouchListener{boolean onTouch(View v,MotionEvent e);}public interface OnLongClickListener{boolean onLongClick(View v);}public OnTouchListener touch;public OnLongClickListener longClick;public boolean attached=true,shown=true;public int x,y=100,width=1000,height=400,cancelledLongPress,nativeClicks;public boolean pressed;public void setPressed(boolean value){pressed=value;}float translation=5,elevation=3;public final ViewParent parent=new ViewParent();public void setOnTouchListener(OnTouchListener value){touch=value;}public void setOnLongClickListener(OnLongClickListener value){longClick=value;}public boolean event(MotionEvent e){boolean used=touch.onTouch(this,e);if(!used){if(e.action==0)pressed=true;if(e.action==1){if(pressed)nativeClicks++;pressed=false;}if(e.action==3)pressed=false;}return used;}public boolean begin(){return longClick.onLongClick(this);}public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown;}public ViewParent getParent(){return parent;}public void getLocationOnScreen(int[] xy){xy[0]=x;xy[1]=y;}public boolean getGlobalVisibleRect(android.graphics.Rect r){r.left=x;r.top=y;r.right=x+width;r.bottom=y+height;return attached&&shown;}public float getTranslationY(){return translation;}public void setTranslationY(float value){translation=value;}public float getElevation(){return elevation;}public void setElevation(float value){elevation=value;}public void cancelLongPress(){cancelledLongPress++;}}''',
    'android/widget/ScrollView.java': '''package android.widget;public class ScrollView extends android.view.View {public int offset;public final java.util.ArrayDeque<Runnable> frames=new java.util.ArrayDeque<>();public int getScrollY(){return offset;}public boolean canScrollVertically(int direction){return direction<0?offset>0:offset<1200;}public void scrollBy(int x,int y){offset=Math.max(0,Math.min(1200,offset+y));}public void postOnAnimation(Runnable r){frames.add(r);}public void removeCallbacks(Runnable r){frames.removeIf(value->value==r);}public void tick(){android.os.SystemClock.now+=32;if(!frames.isEmpty())frames.remove().run();}}''',
    'ls/augment/com/TestAppOrderTouch.java': r'''package ls.augment.com;
import android.view.*;import android.widget.*;
public class TestAppOrderTouch {
 static int cases,checks;static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}static void test(String name,Runnable action){action.run();cases++;System.out.println("PASS local app order: "+name);}
 static class Child extends View{}
 static class F implements AtomicWorkbenchAppOrderTouch.Host {final View row=new View(),handle=new Child();final ScrollView viewport=new ScrollView();final AtomicWorkbenchAppOrderTouch drag=new AtomicWorkbenchAppOrderTouch(viewport,1,this);boolean allowed=true,throwTarget;String target="before",sourceSaved,beforeSaved;int saves;F(){drag.bind(handle,row,"source",5);}public boolean current(String key,View row,int ticket){return allowed&&row.isAttachedToWindow()&&row.isShown()&&ticket==5;}public String target(String source,float x,float y){if(throwTarget)throw new IllegalStateException("target changed");return target;}public void move(String source,String before){saves++;sourceSaved=source;beforeSaved=before;}boolean event(int action,long down,float y){return handle.event(new MotionEvent(action,down,500,y));}void start(long down,float y){check(!event(0,down,y),"DOWN bypassed normal Button handler");check(handle.begin(),"fresh own long press rejected");}}
 public static void main(String[] args){
 test("long click needs a current real pointer; ordinary click remains a Button action",()->{F f=new F();check(!f.handle.begin()&&!f.drag.active(),"orphan/accessibility long click acquired pointer drag");check(!f.event(0,10,300)&&!f.event(1,10,300),"normal Button click consumed");check(f.saves==0&&f.handle.nativeClicks==1,"ordinary Button click lost or reordered");});
 test("stationary center long press never scrolls and CANCEL restores the original row",()->{F f=new F();f.start(10,300);check(f.drag.active()&&f.viewport.frames.isEmpty()&&f.viewport.offset==0,"center scrolled without motion");check(f.handle.parent.blocked,"ScrollView may steal active sequence");check(f.event(3,10,300),"CANCEL not consumed");check(!f.drag.active()&&f.row.getTranslationY()==5&&f.row.getElevation()==3&&!f.handle.parent.blocked,"CANCEL did not restore row lease");check(f.saves==0&&f.viewport.frames.isEmpty(),"CANCEL saved or retained timer");});
 test("real MOVE and UP dispatch one source/target pair after restoring visual state",()->{F f=new F();f.start(11,300);check(f.event(2,11,355)&&f.row.getTranslationY()==60,"source row did not follow pointer");check(f.event(1,11,355)&&!f.drag.active(),"UP did not retire drag");check(f.saves==1&&f.sourceSaved.equals("source")&&f.beforeSaved.equals("before"),"drop target changed");f.event(1,11,355);check(f.saves==1&&f.row.getTranslationY()==5,"late UP repeated move");});
 test("outside/source drops and changed target never write preferences",()->{for(String target:new String[]{null,"source"}){F f=new F();f.target=target;f.start(12,300);f.event(1,12,300);check(f.saves==0&&!f.drag.active(),"invalid target wrote preferences");}F f=new F();f.start(13,300);f.allowed=false;f.event(1,13,300);check(f.saves==0&&!f.drag.active(),"changed host wrote preferences");});
 test("multiple and mismatched pointers cancel without handing off to another pointer",()->{for(int mode=0;mode<2;mode++){F f=new F();f.start(14,300);MotionEvent e=new MotionEvent(2,14,500,350);if(mode==0)e.count=2;else e.id=9;check(f.handle.event(e)&&!f.drag.active()&&f.saves==0,"foreign pointer retained drag");}});
 test("late old sequence cannot cancel or click a newer pending/active gesture",()->{F f=new F();f.start(15,300);f.event(3,15,300);check(!f.event(0,16,300),"new DOWN consumed");check(f.event(1,15,300),"late old UP reached Button");check(f.handle.begin(),"old UP cancelled new pending long press");f.event(2,15,100);check(f.drag.active(),"old MOVE cancelled new active pointer");f.event(1,16,350);check(f.saves==1,"new valid drop lost");});
 test("actual edge coordinates scroll and preserve row offset across content motion",()->{F f=new F();f.start(17,495);check(f.viewport.frames.size()==1,"real edge pointer did not schedule frame");f.viewport.tick();check(f.viewport.offset>0&&f.row.getTranslationY()==5+f.viewport.offset,"scrolled row lost pointer anchor");f.event(2,17,300);check(f.viewport.frames.isEmpty(),"center move retained edge timer");f.drag.cancel();check(f.row.getTranslationY()==5&&f.saves==0,"scroll cancel did not restore source");});
 test("STOP/rebuild/close revoke pending and active leases and all timers",()->{for(int mode=0;mode<3;mode++){F f=new F();f.start(18,495);if(mode==0)f.drag.cancel();if(mode==1){f.allowed=false;f.viewport.tick();}if(mode==2)f.drag.close();check(!f.drag.active()&&f.viewport.frames.isEmpty()&&f.saves==0,"lifecycle retained drag/timer");f.event(1,18,495);check(f.saves==0,"late lifecycle UP wrote");}});
 test("concurrent visual changes are preserved and native target exceptions never replay",()->{F f=new F();f.start(19,300);f.row.setTranslationY(88);f.row.setElevation(77);f.drag.cancel();check(f.row.getTranslationY()==88&&f.row.getElevation()==77,"unrelated row properties overwritten");F fail=new F();fail.start(20,300);fail.throwTarget=true;try{fail.event(1,20,300);throw new AssertionError("native target exception lost");}catch(IllegalStateException expected){checks++;}check(!fail.drag.active()&&fail.saves==0&&fail.row.getTranslationY()==5,"target failure left lease or moved data");});
 test("detached/hidden or stale row cannot acquire a new pointer drag",()->{for(int mode=0;mode<3;mode++){F f=new F();if(mode==0)f.row.attached=false;if(mode==1)f.row.shown=false;if(mode==2)f.allowed=false;f.event(0,21,300);check(!f.handle.begin()&&!f.drag.active()&&f.saves==0,"invalid row acquired local drag");}});
 System.out.println("APP ORDER LOCAL TOUCH PASS "+cases+" cases / "+checks+" assertions");}}
''',
}


def execute(folder, mutation=None):
    sources = dict(STUBS)
    for name in ('AtomicWorkbenchAppOrderTouch.java', 'AtomicWorkbenchDragScrollPolicy.java'):
        value = (S['SRC']/name).read_text(encoding='utf-8')
        if mutation and name == 'AtomicWorkbenchAppOrderTouch.java':
            assert mutation[0] in value
            value = value.replace(*mutation, 1)
        sources['ls/augment/com/'+name] = value
    paths=[]
    for name,value in sources.items():
        path=Path(folder)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value,encoding='utf-8');paths.append(str(path))
    compiled=subprocess.run([S['JAVAC'],'--release','17','-encoding','UTF-8','-d',str(Path(folder)/'classes'),*paths],env=S['ENV'],capture_output=True)
    assert compiled.returncode==0,compiled.stderr.decode(errors='replace')
    return subprocess.run([S['JAVA'],'-cp',str(Path(folder)/'classes'),'ls.augment.com.TestAppOrderTouch'],env=S['ENV'],capture_output=True,text=True,encoding='utf-8')


def main():
    with tempfile.TemporaryDirectory(prefix='duo-local-order-') as folder:
        result=execute(folder);print(result.stdout,end='');assert result.returncode==0,result.stderr
    for name,mutation in {
        'cancelled click dispatches move': ('if (target != null && !key.equals(target))', 'if (true)'),
        'old sequence cancels new gesture': ('if (event.getDownTime() != down) return true;', 'if (event.getDownTime() != down) { cancel(); return true; }'),
        'lifecycle leaves timer': ('stopTimer(); Touch old = active;', 'Touch old = active;'),
        'scroll loses pointer anchor': ('+ viewport.getScrollY() - scrollAtStart', ''),
        'cleanup overwrites unrelated row': ('if (Float.compare(row.getTranslationY(), appliedTranslation) == 0)', 'if (true)'),
    }.items():
        with tempfile.TemporaryDirectory(prefix='duo-local-order-negative-') as folder:
            result=execute(folder,mutation);assert result.returncode!=0,'negative survived: '+name;print('EXPECTED FAILURE '+name)
    print('OFFLINE ONLY; NATIVE PHONE POINTER/FOCUS ACCEPTANCE STILL REQUIRED')


if __name__=='__main__':main()
