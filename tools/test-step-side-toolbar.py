"""Execute the production drawer state machine against deterministic window/animation fixtures."""
from pathlib import Path
import os, re, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'WorkspaceSideToolbar.java').read_text(encoding='utf-8')
def method(signature):
    a=source.index(signature); b=source.index('{',a)+1; depth=1
    while depth:
        depth+=(source[b]=='{')-(source[b]=='}'); b+=1
    return source[a:b]

code=r'''
package ls.augment.com.step;
import java.util.*;
public class SidebarCases {
 static class StepRuntime {static void diagnostic(String a,String b){}}
 static class android {static class util {static class Log {static String getStackTraceString(Throwable t){return t.toString();}}}}
 static int checks;
 static void check(boolean yes,String why){checks++;if(!yes)throw new AssertionError(why);}
 static void near(float a,float b,String why){check(Math.abs(a-b)<.001f,why+" "+a+" "+b);}
 static class Animator {}
 static class AnimatorListenerAdapter {public void onAnimationEnd(Animator a){}}
 static class AccelerateDecelerateInterpolator {}
 static class ValueAnimator extends Animator {
  interface Update {void update(ValueAnimator a);}
  float start,end,value;long duration;boolean started;Update update;AnimatorListenerAdapter listener;
  static ValueAnimator ofFloat(float a,float b){ValueAnimator v=new ValueAnimator();v.start=a;v.end=b;v.value=a;return v;}
  void setDuration(long v){duration=v;}void setInterpolator(AccelerateDecelerateInterpolator ignored){}
  void addUpdateListener(Update u){update=u;}void addListener(AnimatorListenerAdapter l){listener=l;}
  Float getAnimatedValue(){return value;}void start(){started=true;}void cancel(){if(listener!=null)listener.onAnimationEnd(this);}
  void fraction(float f){value=start+(end-start)*f;update.update(this);}
  void end(){fraction(1);listener.onAnimationEnd(this);}
 }
 static class View {
  float alpha,translation;boolean attached,touchTracking;WindowManager.LayoutParams lp;
  final ViewTreeObserver observer=new ViewTreeObserver();final List<Runnable> posted=new ArrayList<>();
  ViewTreeObserver getViewTreeObserver(){return observer;}
  void postOnAnimation(Runnable r){posted.add(r);}void post(Runnable r){posted.add(r);}void removeCallbacks(Runnable r){posted.remove(r);}
  void frame(){List<Runnable> run=new ArrayList<>(posted);posted.clear();for(Runnable r:run)r.run();}
  void setTranslationX(float v){translation=v;}void setAlpha(float v){alpha=v;}
  boolean isAttachedToWindow(){return attached;}Object getLayoutParams(){return lp;}
 }
 static class ViewTreeObserver {
  interface OnPreDrawListener {boolean onPreDraw();}
  final List<OnPreDrawListener> listeners=new ArrayList<>();
  void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}
  boolean isAlive(){return true;}void draw(){for(OnPreDrawListener l:new ArrayList<>(listeners))l.onPreDraw();}
 }
 static class WindowManager {
  int adds,removes;View last,failView;Set<View> views=new HashSet<>();
  static class LayoutParams {
   static final int FLAG_NOT_FOCUSABLE=1,FLAG_NOT_TOUCH_MODAL=2,FLAG_ALT_FOCUSABLE_IM=4,FLAG_HARDWARE_ACCELERATED=8,
       FLAG_NOT_TOUCHABLE=16,LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS=1;
   int width,height,type,flags,x,y,gravity,layoutInDisplayCutoutMode;float alpha;String title;
   LayoutParams(int w,int h,int t,int f,int format){width=w;height=h;type=t;flags=f;}
   void setTitle(String t){title=t;}void setFitInsetsTypes(int t){}
  }
  void addView(View v,LayoutParams lp){if(v==failView)throw new IllegalStateException("missing panel window capability");check(views.add(v),"not registered twice before or after traversal");v.lp=lp;adds++;last=v;}
  void removeViewImmediate(View v){check(views.remove(v),"remove owned window even before first traversal");v.attached=false;removes++;}
  void updateViewLayout(View v,LayoutParams lp){v.lp=lp;}
 }
 static class PixelFormat {static final int TRANSLUCENT=-3;}
 static class Gravity {static final int TOP=1,LEFT=2;}
 static class StepMaterial {static final int STATUS_BAR_SUB_PANEL=2017;}
 static class Host {boolean toolbarAutoCollapse=true;void close(String reason){}void log(String reason){}}
 static class Owner {Host host=new Host();boolean closed;int actions,errors;void checkAction(){actions++;}void note(RuntimeException e){errors++;}}
 static class Lamp {float phase=1;void phase(float value){phase=value;}}
 static class Level {void releasePreview(){}}
 static class Drawer {
  static final String TITLE="RedMagicDuoStepSideToolbar",LEFT=TITLE+"LeftHandle",RIGHT=TITLE+"RightHandle";
  final WindowManager windows=new WindowManager();final Owner owner=new Owner();
  final View root=new View(),left=new View(),right=new View(),leftHandle=new View(),rightHandle=new View();
  final Set<View> registered=Collections.newSetFromMap(new IdentityHashMap<>());
  int width=1216,height=684,edgeWidth=44,edgeY=254,edgeHeight=176,appGeneration,slop=12;
  boolean closed,opened,panelAttached,attached,edgeTracking,allowed=true;float chromeAlpha=1,progress;
  Runnable afterClose;ValueAnimator animator,lampAnimator;
  final Lamp leftLamp=new Lamp(),rightLamp=new Lamp();final Level brightness=new Level(),volume=new Level();final Runnable states=()->{};
  ViewTreeObserver.OnPreDrawListener motionReady;Runnable motionStart;
  boolean usable(){return allowed && !closed && !owner.closed;}
  void refreshApps(){}void refreshTools(){}void refreshStates(){}
  METHODS
 }
 public static void main(String[] args){
  Drawer ready=new Drawer();ready.setOpen(true);ValueAnimator waiting=ready.animator;
  check(!waiting.started && ready.progress==0,"new surface stays at closed pose before first draw");
  ready.setOpen(true);check(ready.animator==waiting,"repeated request preserves pending opening");
  ready.root.observer.draw();check(!waiting.started && ready.root.posted.size()==1,"first closed frame precedes animation clock");
  ready.root.frame();check(waiting.started && ready.motionStart==null,"next frame starts full OEM animation");
  waiting.fraction(.3f);ready.setOpen(true);check(ready.animator==waiting && ready.progress==.3f,"same-direction input does not restart active motion");
  ready.close();check(ready.root.posted.isEmpty() && ready.root.observer.listeners.isEmpty(),"close removes first-frame work");
  for(boolean drawn:new boolean[]{false,true}){
   Drawer gone=new Drawer();gone.setOpen(true);ValueAnimator stale=gone.animator;
   ViewTreeObserver.OnPreDrawListener listener=gone.motionReady;Runnable start=gone.motionStart;
   if(drawn)gone.root.observer.draw();gone.close();listener.onPreDraw();start.run();gone.root.frame();
   check(!stale.started && gone.root.posted.isEmpty() && gone.root.observer.listeners.isEmpty(),"stale draw or frame cannot animate a disposed panel");
   Drawer reverse=new Drawer();reverse.setOpen(true);stale=reverse.animator;
   listener=reverse.motionReady;start=reverse.motionStart;if(drawn)reverse.root.observer.draw();reverse.setOpen(false);
   listener.onPreDraw();start.run();reverse.root.frame();check(!stale.started && !reverse.panelAttached,"close before first draw cancels opening cleanly");
   reverse.setOpen(true);ValueAnimator latest=reverse.animator;Runnable latestStart=reverse.motionStart;
   listener.onPreDraw();start.run();check(reverse.motionStart==latestStart && reverse.animator==latest,"old callbacks do not erase the new opening");
   reverse.root.observer.draw();reverse.root.frame();check(latest.started,"reopen after cancellation animates normally");reverse.close();
  }
  for(int count=1;count<=5;count++)for(boolean leftSide:new boolean[]{true,false}){
   WorkspaceLayout l=WorkspaceLayout.create(1216,2688,2.75f,leftSide,count,0,true);
   Drawer d=new Drawer();d.width=l.width;d.height=l.contentHeight;
   int[] before={l.mainX,l.sideX,l.sideWidth,l.top,l.railHeight,l.rowHeight(0,count)};
   d.setOpen(true);ValueAnimator first=d.animator;
   check(d.panelAttached && d.root.lp.width==1216 && d.root.lp.height==684 && d.root.lp.y==0,"only fixed 16:9 top covered");
   check(first.duration==300 && (d.root.lp.flags&WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE)!=0,"stock duration without stealing task focus");
   first.fraction(.4f);near(d.progress,.4f,"opening position");near(d.left.alpha,.4f,"left fades with position");near(d.right.alpha,.4f,"right fades with position");
   near(d.left.translation,-d.right.translation,"opposite translations");near(d.right.translation,119.34375f,"native 335/1152 travel");
   d.setOpen(false);ValueAnimator reverse=d.animator;check(reverse.duration==120,"reverse starts at current position");
   first.end();check(d.panelAttached && d.animator==reverse,"cancelled callback cannot remove current window");
   reverse.fraction(.5f);near(d.progress,.2f,"closing from interrupted opening");
   d.afterClose=()->{throw new AssertionError("stale action");};d.setOpen(true);check(d.afterClose==null,"reopen clears stale pending action");
   d.animator.end();near(d.progress,1,"open completes");check(d.windows.adds==1,"rapid reversals never attach twice");
   int[] delivered={0};d.runAction(()->delivered[0]++);d.animator.end();check(delivered[0]==1 && !d.panelAttached,"default action runs once only after closing");
   check(Arrays.equals(before,new int[]{l.mainX,l.sideX,l.sideWidth,l.top,l.railHeight,l.rowHeight(0,count)}),"main and every side boundary unchanged");
   d.setOpen(true);d.animator.end();d.afterClose(()->delivered[0]++);d.allowed=false;d.animator.end();check(delivered[0]==1,"changed user/session cannot run pending action");
   d.allowed=true;d.setOpen(true);d.animator.end();d.owner.host.toolbarAutoCollapse=false;
   d.runAction(()->delivered[0]++);check(delivered[0]==2 && d.opened && d.panelAttached && d.animator==null,"disabled auto-collapse executes action and leaves panel open");
   d.owner.host.toolbarAutoCollapse=true;check(d.opened,"changing preference alone does not collapse panel");
   d.runAction(()->delivered[0]++);ValueAnimator closing=d.animator;d.afterClose=()->delivered[0]++;
   d.add(d.leftHandle,d.params(44,176,0,254,Drawer.LEFT));d.add(d.rightHandle,d.params(44,176,1172,254,Drawer.RIGHT));
   d.setChromeAlpha(.5f);check((d.root.lp.flags&16)!=0 && (d.leftHandle.lp.flags&16)!=0,"entry/exit shields cannot leak touch");
   d.setChromeAlpha(1);check((d.root.lp.flags&16)==0,"touch restored at settled geometry");
   d.close();closing.end();check(d.windows.views.isEmpty() && d.registered.isEmpty() && delivered[0]==2,"close disposes all windows and callbacks before traversal too");
   d.close();
  }
  Drawer d=new Drawer();check(d.ownsGesture(0,300) && d.ownsGesture(1215,300),"both edge handles excluded from upper paging");
  check(!d.ownsGesture(600,300) && !d.ownsGesture(0,800),"native app center and lower regions keep input");
  d.edgeWidth=HANDLE_WIDTH;
  check(!d.ownsGesture(1188,382) && !d.ownsGesture(36,300),"native edge-adjacent player and back buttons retain input");
  check(d.ownsGesture(12,342) && d.ownsGesture(1204,342),"edge swipes still open both sides");
  d.edgeTracking=true;check(d.ownsGesture(600,300),"edge stream remains owned after crossing handle");
  for(int failure=0;failure<3;failure++){
   Drawer partial=new Drawer();partial.windows.failView=failure==0?partial.root:failure==1?partial.leftHandle:partial.rightHandle;
   try{partial.attach();throw new AssertionError("missing window capability accepted");}catch(IllegalStateException expected){checks++;}
   check(partial.registered.isEmpty() && partial.windows.views.isEmpty(),"legacy fallback leaves no hidden or partial windows");
  }
  Drawer probe=new Drawer();probe.attach();check(probe.windows.views.size()==2 && !probe.windows.views.contains(probe.root),"probe removed before first frame; only handles remain");probe.close();
  Drawer retry=new Drawer();retry.attach();retry.windows.failView=retry.root;retry.setOpen(true);
  check(!retry.panelAttached && !retry.opened && retry.progress==0 && retry.windows.views.size()==2,"failed opening keeps workspace and edge handles, without an invisible panel");
  retry.windows.failView=null;retry.setOpen(true);retry.animator.end();check(retry.panelAttached && retry.progress==1,"next swipe can retry the native panel");retry.close();
  for(boolean right:new boolean[]{true,false}){
   float inward=right?-30:30;
   check(GameSpacePanelMotion.inward(inward,2,right,12),"inward swipe opens");
   check(GameSpacePanelMotion.outward(-inward,2,right,12),"outward swipe closes");
   check(!GameSpacePanelMotion.inward(inward,50,right,12),"vertical scrolling does not open");
   near(GameSpacePanelMotion.translation(576,0,right),right?167.5f:-167.5f,"recording coordinate travel");
   Drawer reversing=new Drawer();reversing.attach();reversing.setOpen(true);reversing.animator.end();
   reversing.setOpen(false);reversing.animator.fraction(.5f);reversing.root.touchTracking=true;
   float edge=right?1210:6;
   check(reversing.panelSwipe(edge,300,inward,0),"closing panel accepts inward edge reversal");
   check(reversing.opened && reversing.animator.duration==150,"edge reversal continues from current half position");
   reversing.animator.end();reversing.setOpen(false);reversing.animator.end();
   check(reversing.panelAttached && reversing.windows.views.contains(reversing.root),"completed closing keeps current input stream shielded");
   check(!reversing.panelSwipe(600,300,inward,50),"vertical content swipe cannot reopen completed closing");
   check(reversing.panelSwipe(edge,300,inward,0),"held invisible panel can reopen before gesture ends");
   reversing.root.touchTracking=false;reversing.animator.end();
   reversing.root.touchTracking=true;int[] fired={0};reversing.afterClose(()->fired[0]++);reversing.animator.end();
   check(fired[0]==0 && reversing.panelAttached,"pending action waits for finger release");
   reversing.root.touchTracking=false;reversing.finish();
   check(fired[0]==1 && !reversing.panelAttached,"finger release removes shield and dispatches pending action once");
   reversing.finish();check(fired[0]==1,"repeat finish never redelivers action");reversing.close();
  }
  check(Drawer.physical(Drawer.TITLE) && Drawer.physical(Drawer.LEFT) && !Drawer.physical(null) && !Drawer.physical("unowned"),"exact physical window titles");
  check(Drawer.physical(2017,Drawer.TITLE,10343,10343) && !Drawer.physical(2017,Drawer.TITLE,-1,-1)
      && !Drawer.physical(2038,Drawer.TITLE,10343,10343) && !Drawer.physical(2017,Drawer.TITLE,10000,10343),"only trusted SystemUI panels escape task magnification");
  Drawer lit=new Drawer();lit.setOpen(true);check(lit.lampAnimator==null,"sweep waits for slide completion");
  lit.animator.end();ValueAnimator sweep=lit.lampAnimator;
  check(sweep!=null&&sweep.duration==1800&&sweep.started,"slide completion starts bounded entry sweep");
  lit.setOpen(true);check(lit.lampAnimator==sweep,"repeated open does not interrupt an active lamp sweep");
  sweep.fraction(.45f);near(lit.leftLamp.phase,lit.rightLamp.phase,"both lamps share their entry clock");
  check(GameSpacePanelMotion.lampLevel(.45f,.3f)>1,"entry briefly lights the complete border");
  near(GameSpacePanelMotion.lampLevel(1,.3f),.3f,"entry settles to decoration, not an invented CPU reading");
  lit.setOpen(false);check(lit.lampAnimator==null,"closing cancels lamp animation");
  float held=lit.leftLamp.phase;sweep.end();near(lit.leftLamp.phase,held,"cancelled lamp callback cannot relight panel");
  lit.animator.end();lit.setOpen(true);near(lit.leftLamp.phase,0,"fresh opening resets entry illumination");
  lit.animator.end();lit.close();check(lit.lampAnimator==null&&lit.root.posted.isEmpty(),"dispose clears lamp and status callbacks");
  System.out.println("PASS "+checks+" production sidebar lifecycle, interruption, input and workspace checks");
 }
}
'''
signatures=['    static boolean physical(CharSequence', '    static boolean physical(int', '    WindowManager.LayoutParams params(', '    void attach(', '    boolean handleContains(', '    boolean ownsGesture(',
            '    void setChromeAlpha(', '    void afterClose(', '    void runAction(', '    void setOpen(', '    void stopMotion(', '    void startLamp(', '    void stopLamp(', '    void apply(',
            '    void finish(', '    boolean panelSwipe(', '    void add(', '    void remove(', '    @Override public void close(']
code=code.replace('HANDLE_WIDTH',str(round(int(re.search(r'edgeWidth=owner.dp\((\d+)\)',source)[1])*3.25)))
code=code.replace('METHODS','\n'.join(method(s).replace('@Override public void close','public void close') for s in signatures))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-side-toolbar-') as tmp:
    folder=Path(tmp); f=folder/'SidebarCases.java';f.write_text(code,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,f,STEP/'GameSpacePanelMotion.java',STEP/'WorkspaceLayout.java'],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.SidebarCases'],check=True)
