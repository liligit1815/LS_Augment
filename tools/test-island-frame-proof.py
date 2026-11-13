"""Production draw proof: actual attachment, clipping, frame revision and retirement."""
import os, subprocess, tempfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
FILES={
'android/graphics/Rect.java':'''package android.graphics;public class Rect{public boolean empty;public boolean isEmpty(){return empty;}}''',
'android/view/ViewParent.java':'package android.view;public interface ViewParent{ViewParent getParent();}',
'android/view/ViewTreeObserver.java':'''package android.view;import java.util.*;public class ViewTreeObserver{
 public interface OnDrawListener{void onDraw();}public List<OnDrawListener> listeners=new ArrayList<>();public boolean alive=true;
 public void addOnDrawListener(OnDrawListener l){listeners.add(l);}public void removeOnDrawListener(OnDrawListener l){listeners.remove(l);}public boolean isAlive(){return alive;}
 public void draw(){for(OnDrawListener l:new ArrayList<>(listeners))l.onDraw();}}
''',
'android/view/View.java':'''package android.view;import java.util.*;import android.graphics.Rect;public class View implements ViewParent{
 public static final int VISIBLE=0;public boolean attached=true,shown=true,rect=true,empty;public int width=120,height=35,visibility;public float alpha=1;public ViewParent parent;
 public ViewTreeObserver observer=new ViewTreeObserver();public List<Runnable> posts=new ArrayList<>();public int invalidations;
 public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown;}public int getWindowVisibility(){return visibility;}
 public int getWidth(){return width;}public int getHeight(){return height;}public float getAlpha(){return alpha;}public ViewParent getParent(){return parent;}
 public boolean getGlobalVisibleRect(Rect r){r.empty=empty;return rect;}public ViewTreeObserver getViewTreeObserver(){return observer;}
 public boolean post(Runnable r){posts.add(r);return true;}public void invalidate(){invalidations++;}
 public void flush(){for(Runnable r:new ArrayList<>(posts)){posts.remove(r);r.run();}}
}
''',
'ls/augment/com/hook/TestFrames.java':'''package ls.augment.com.hook;import android.view.View;import java.util.Set;
public class TestFrames{
 static int checks,callbacks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}static void changed(){callbacks++;}
 public static void main(String[] args){
 IslandFrameProof proof=new IslandFrameProof();View v=new View();v.attached=false;
 check(!proof.confirm(v,1,TestFrames::changed)&&v.observer.listeners.isEmpty(),"unattached queue never owns");v.attached=true;v.width=0;
 check(!proof.confirm(v,1,TestFrames::changed),"unmeasured cannot own");v.width=120;
 check(!proof.confirm(v,1,TestFrames::changed)&&v.invalidations==1,"laid out view still requires a draw");
 check(!proof.confirm(v,1,TestFrames::changed)&&v.observer.listeners.size()==1&&v.invalidations==1,"one pending proof per revision");
 v.observer.draw();check(callbacks==0&&!proof.confirm(v,1,TestFrames::changed),"onDraw alone is not committed");v.flush();
 check(callbacks==1&&proof.confirm(v,1,TestFrames::changed)&&v.observer.listeners.isEmpty(),"one drawn frame commits and removes observer");
 check(!proof.confirm(v,2,TestFrames::changed),"updated content needs its own frame");v.observer.draw();v.shown=false;v.flush();
 check(callbacks==1&&!proof.confirm(v,2,TestFrames::changed),"hidden after draw cannot commit");v.shown=true;
 check(!proof.confirm(v,2,TestFrames::changed),"hidden revision retries only on caller request");v.observer.draw();proof.forget(v);v.flush();
 check(callbacks==1&&v.observer.listeners.isEmpty(),"retirement invalidates queued draw callback");
 proof.confirm(v,3,TestFrames::changed);v.observer.draw();proof.confirm(v,4,TestFrames::changed);v.flush();
 check(callbacks==1,"old revision callback cannot commit replacement");v.observer.draw();v.flush();check(proof.confirm(v,4,TestFrames::changed),"replacement owns only its frame");
 View parent=new View();v.parent=parent;parent.alpha=.001f;check(!proof.confirm(v,4,TestFrames::changed),"transparent ancestor revokes proof");parent.alpha=1;
 for(int i=0;i<4;i++){v.rect=i!=0;v.empty=i==1;v.visibility=i==2?8:0;v.height=i==3?0:35;check(!proof.confirm(v,4,TestFrames::changed),"clipped/invisible/unmeasured view cannot own "+i);}
 v.height=35;v.visibility=0;v.empty=false;v.rect=true;
 proof.confirm(v,5,TestFrames::changed);proof.retain(Set.of());check(v.observer.listeners.isEmpty(),"removed view drops observers and history");
 check(!proof.confirm(v,4,TestFrames::changed),"retained history cannot resurrect an earlier claim");proof.clear();check(v.observer.listeners.isEmpty(),"host close removes callbacks");
 System.out.println("PASS production frame proof: "+checks+" checks");
}}
'''}
FILES['ls/augment/com/hook/IslandFrameProof.java']=(ROOT/'android/app/src/main/java/ls/augment/com/hook/IslandFrameProof.java').read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='duo-frame-') as temporary:
    folder=Path(temporary)
    for name,source in FILES.items():
        path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8')
    java=Path(os.environ['JAVA_HOME'])/'bin'
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',temporary,*map(str,folder.rglob('*.java'))],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',temporary,'ls.augment.com.hook.TestFrames'],check=True)
