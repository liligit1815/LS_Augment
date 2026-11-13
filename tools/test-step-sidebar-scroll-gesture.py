"""Run the actual toolbar root against a child retaining touch while stopping a fling."""
from pathlib import Path
import os,subprocess,tempfile
root=Path(__file__).resolve().parents[1];step=root/'android/app/src/main/java/ls/augment/com/step'
s=(step/'WorkspaceSideToolbar.java').read_text(encoding='utf-8');a=s.index('    final class PanelRoot');b=s.index('{',a)+1;depth=1
while depth:depth+=(s[b]=='{')-(s[b]=='}');b+=1
panel=s[a:b]
sources={
'android/graphics/Rect.java':'package android.graphics;public class Rect {public int l,t,r,b;public boolean contains(int x,int y){return x>=l&&x<r&&y>=t&&y<b;}}',
'android/view/View.java':'package android.view;public class View {public static final int VISIBLE=0;}',
'android/view/WindowInsets.java':'package android.view;public class WindowInsets {public static class Cutout{public int getSafeInsetTop(){return 0;}}public Cutout getDisplayCutout(){return null;}}',
'android/os/Bundle.java':'package android.os; public class Bundle {}',
'android/view/accessibility/AccessibilityNodeInfo.java':'package android.view.accessibility; public class AccessibilityNodeInfo {public static final int ACTION_DISMISS=1;public static class AccessibilityAction{public static final AccessibilityAction ACTION_DISMISS=new AccessibilityAction();}public void addAction(AccessibilityAction a){}}',
'android/view/MotionEvent.java':'''package android.view; public class MotionEvent {public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3;int action,count;float x,y;public MotionEvent(int a,float x,float y,int c){action=a;this.x=x;this.y=y;count=c;}public int getActionMasked(){return action;}public int getPointerCount(){return count;}public float getX(){return x;}public float getY(){return y;}}''',
'android/widget/FrameLayout.java':r'''package android.widget;
import android.view.MotionEvent;import android.view.accessibility.AccessibilityNodeInfo;
public class FrameLayout {
 public boolean disallow,childFling=true,child=true;public int childEvents,cancellations;
 public FrameLayout(Object ctx){}public void setContentDescription(String s){}public void setAccessibilityPaneTitle(String s){}public void setOnClickListener(java.util.function.Consumer<Object> l){}
 public void requestDisallowInterceptTouchEvent(boolean b){disallow=b;}public void post(Runnable r){r.run();}
 public android.view.WindowInsets onApplyWindowInsets(android.view.WindowInsets i){return i;}public void offsetDescendantRectToMyCoords(Object v,android.graphics.Rect r){}
 public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo i){}public boolean performAccessibilityAction(int a,android.os.Bundle b){return false;}
 public boolean performClick(){return true;}public boolean onTouchEvent(MotionEvent e){return true;}public boolean onInterceptTouchEvent(MotionEvent e){return false;}
 public boolean dispatchTouchEvent(MotionEvent e){
  if(e.getActionMasked()==MotionEvent.ACTION_DOWN){disallow=false;child=true;}
  boolean intercepted=!disallow&&onInterceptTouchEvent(e);
  if(intercepted&&child){child=false;cancellations++;}
  if(!child)return onTouchEvent(e);
  childEvents++;
  if(e.getActionMasked()==MotionEvent.ACTION_DOWN&&childFling)requestDisallowInterceptTouchEvent(true);
  return true;
 }
}''',
'ls/augment/com/step/WorkspaceSideToolbar.java':r'''
package ls.augment.com.step;
import android.view.*;import android.widget.*;import android.graphics.Rect;
public class WorkspaceSideToolbar {
 static class Owner {int dp(int n){return n;}}Owner owner=new Owner();int contentTop=4;void layoutContent(int top){contentTop=top;}
 static class LevelControl {int left;LevelControl(int x){left=x;}int getVisibility(){return 0;}void getDrawingRect(Rect r){r.l=left;r.t=200;r.r=left+130;r.b=500;}}
 LevelControl brightness=new LevelControl(300),volume=new LevelControl(786);
 Object context=new Object();int slop=10,width=1216,edgeY=238,edgeHeight=208,edgeWidth=52,closes,opens,finishes;boolean opened=true;
 void setOpen(boolean b){opened=b;if(b)opens++;else closes++;}void finish(){finishes++;}
 boolean panelSwipe(float x,float y,float dx,float dy){boolean right=x>width/2f;if(GameSpacePanelMotion.outward(dx,dy,right,slop)){setOpen(false);return true;}if(!opened&&y>=edgeY&&y<edgeY+edgeHeight&&(x<edgeWidth||x>=width-edgeWidth)&&GameSpacePanelMotion.inward(dx,dy,right,slop)){setOpen(true);return true;}return false;}
 PANEL
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void event(PanelRoot p,int a,float x,float y,int n){p.dispatchTouchEvent(new MotionEvent(a,x,y,n));}
 public static void main(String[] args){
  for(boolean right:new boolean[]{false,true}){
   WorkspaceSideToolbar t=new WorkspaceSideToolbar();PanelRoot p=t.new PanelRoot();float x=right?1100:150,dx=right?80:-80;
   event(p,0,x,342,1);check(!p.disallow,"fling child cannot hide direction from toolbar");event(p,2,x+dx,342,1);
   check(t.closes==1&&!t.opened&&p.cancellations==1,"outward swipe cancels fling child and closes");event(p,1,x+dx,342,1);check(!p.touchTracking&&t.finishes==1,"close retains target until finger finishes");
   t=new WorkspaceSideToolbar();p=t.new PanelRoot();event(p,0,x,500,1);event(p,2,x,400,1);event(p,2,x+dx,450,1);event(p,1,x+dx,450,1);
   check(t.opened&&p.childEvents==4&&p.cancellations==0,"vertical scroll keeps its complete child event stream");
   t=new WorkspaceSideToolbar();p=t.new PanelRoot();event(p,0,x,342,1);event(p,2,x+dx,342,2);check(t.opened&&p.cancellations==0,"multitouch does not close");
  }
  WorkspaceSideToolbar t=new WorkspaceSideToolbar();t.opened=false;PanelRoot p=t.new PanelRoot();event(p,0,10,300,1);event(p,2,100,300,1);check(t.opened&&t.opens==1,"inward edge can reverse a closing panel");
  for(int x:new int[]{350,830}){
   t=new WorkspaceSideToolbar();p=t.new PanelRoot();event(p,0,x,300,1);check(p.levelGesture&&p.disallow,"level control owns its pointer stream");
   event(p,2,x-120,400,1);event(p,1,x-120,400,1);
   check(t.opened&&p.cancellations==0&&!p.levelGesture,"brightness/volume dragging cannot close panel and releases ownership on up");
  }
  System.out.println("PASS "+checks+" production sidebar scroll/fling touch-stream checks");
 }
}
'''.replace(' PANEL',panel)}
java=Path(os.environ['JAVA_HOME'])/'bin'
with tempfile.TemporaryDirectory(prefix='step-sidebar-fling-') as directory:
 p=Path(directory)
 for name,code in sources.items():
  f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(code,encoding='utf-8')
 subprocess.run([java/'javac','-encoding','UTF-8','-d',p,*p.rglob('*.java'),step/'GameSpacePanelMotion.java'],check=True)
 subprocess.run([java/'java','-cp',p,'ls.augment.com.step.WorkspaceSideToolbar'],check=True)
