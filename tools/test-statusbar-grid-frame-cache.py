"""Exercise production grid frame reuse and invalidation with Android-shaped view inputs.

This is a runtime facade for cache decisions, not an on-device visual/performance claim.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarGridHook.java').read_text(encoding='utf-8')


def extract(marker, source=SOURCE):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


HARNESS = r'''import java.util.*;
public class TestGridFrameCache {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 interface ViewParent{}
 static class Rect {
  static int allocations;int left,top,right=16,bottom=16;
  Rect(){allocations++;}Rect(Rect from){this();set(from);}Rect(int l,int t,int r,int b){this();set(l,t,r,b);}
  void set(Rect from){set(from.left,from.top,from.right,from.bottom);}void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
  public boolean equals(Object value){if(!(value instanceof Rect))return false;Rect other=(Rect)value;return left==other.left&&top==other.top&&right==other.right&&bottom==other.bottom;}
  public int hashCode(){return Objects.hash(left,top,right,bottom);}
 }
 static class Matrix {float x,y,sx=1,sy=1;Matrix(){}Matrix(Matrix from){x=from.x;y=from.y;sx=from.sx;sy=from.sy;}public boolean equals(Object o){return o instanceof Matrix&&x==((Matrix)o).x&&y==((Matrix)o).y&&sx==((Matrix)o).sx&&sy==((Matrix)o).sy;}}
 static class Typeface{}
 static class Drawable {Rect box=new Rect();int w=16,h=16,level;int getIntrinsicWidth(){return w;}int getIntrinsicHeight(){return h;}int getLevel(){return level;}Rect getBounds(){return box;}}
 static class SystemClock {static long now;static long elapsedRealtime(){return now;}}
 static class View {
  static final int VISIBLE=0,GONE=8;ViewGroup parent;ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();boolean attached=true,requested;int visibility,windowVisibility,direction,l,t,r=16,b=16,mw=16,mh=16,pl,pt,pr,pb,scrollX,scrollY;
  float alpha=1,transitionAlpha=1,x,y,sx=1,sy=1,pivotX,pivotY,rotation,rotationX,rotationY;Rect clip;boolean clipOutline;
  ViewParent getParent(){return parent;}ViewGroup.LayoutParams getLayoutParams(){return params;}boolean isAttachedToWindow(){return attached;}int getWindowVisibility(){return windowVisibility;}int getVisibility(){return visibility;}boolean isLayoutRequested(){return requested;}
  int getLeft(){return l;}int getTop(){return t;}int getRight(){return r;}int getBottom(){return b;}int getMeasuredWidth(){return mw;}int getMeasuredHeight(){return mh;}int getLayoutDirection(){return direction;}
  int getPaddingLeft(){return pl;}int getPaddingTop(){return pt;}int getPaddingRight(){return pr;}int getPaddingBottom(){return pb;}int getScrollX(){return scrollX;}int getScrollY(){return scrollY;}
  float getAlpha(){return alpha;}float getTransitionAlpha(){return transitionAlpha;}float getTranslationX(){return x;}float getTranslationY(){return y;}float getScaleX(){return sx;}float getScaleY(){return sy;}
  float getPivotX(){return pivotX;}float getPivotY(){return pivotY;}float getRotation(){return rotation;}float getRotationX(){return rotationX;}float getRotationY(){return rotationY;}void setAlpha(float value){alpha=value;}
  // A shared mutable return is intentional: the witness must keep a value snapshot.
  Rect getClipBounds(){return clip;}boolean getClipBounds(Rect out){if(clip==null){out.set(0,0,0,0);return false;}out.set(clip);return true;}
  void setClipBounds(Rect value){clip=value;}boolean getClipToOutline(){return clipOutline;}void setClipToOutline(boolean value){clipOutline=value;}
 }
 static class ViewGroup extends View implements ViewParent {List<View> children=new ArrayList<>();boolean clipChildren=true,clipPadding=true;static class LayoutParams{int width=16,height=16;}void add(View v){children.add(v);v.parent=this;}int getChildCount(){return children.size();}View getChildAt(int index){return children.get(index);}boolean getClipChildren(){return clipChildren;}void setClipChildren(boolean value){clipChildren=value;}boolean getClipToPadding(){return clipPadding;}void setClipToPadding(boolean value){clipPadding=value;}}
 static class TextView extends View {CharSequence text="00:00";Typeface font=new Typeface();float size=14,letters;int color=-1;CharSequence getText(){return text;}Typeface getTypeface(){return font;}float getTextSize(){return size;}float getLetterSpacing(){return letters;}int getCurrentTextColor(){return color;}}
 static class ImageView extends View {enum ScaleType{FIT_XY,CENTER}ScaleType scaleType=ScaleType.FIT_XY;Drawable image=new Drawable();Matrix imageMatrix=new Matrix();Drawable getDrawable(){return image;}Matrix getImageMatrix(){return imageMatrix;}ScaleType getScaleType(){return scaleType;}}
 static class MFVBatteryViewLayout extends ViewGroup {public int mBateryLevel=80,mShowMode;public boolean mIsCharing,mTextHollowEffectAvailable;}
 static class SystemUiAdapter {static Object field(Object owner,String name){try{return owner.getClass().getField(name).get(owner);}catch(Exception ignored){return null;}}}
 static class ConnectivityIconView extends View{}
 // Tint replay itself is covered by the lifecycle and Android tint suites.
 static class StatusBarTintHook {static int dirtyRefreshes;static View lastRoot;static void refreshDirty(View root){dirtyRefreshes++;lastRoot=root;}}
 // CLIPPING
 // WITNESS
 // VISIBLE
 // OVERLAY_ALPHA
 static class State {
  final ViewGroup root=new ViewGroup();final List<FrameWitness> frameWitnesses=new ArrayList<>();final Map<View,Object> geometry=new IdentityHashMap<>();boolean active=true,layoutDirty=true,packingSuspended,ready=true;Object packingCapacityBlock;
  final List<View> placedViews=new ArrayList<>();final Map<ViewGroup,boolean[]> clips=new IdentityHashMap<>();final StatusBarClipping explicitClips=new StatusBarClipping();
  View alphaAnchor;ViewGroup overlay;ConnectivityIconView connectivityIcon;Rect batteryInk;long batteryInkAt;int layouts,capacityChecks;
  void layout(){layouts++;clearRequested(root);for(View view:placedViews)releasePlacedClips(view);if(batteryInk!=null)batteryInkAt=SystemClock.now;}
  void clearRequested(View view){if(view.visibility!=View.VISIBLE)return;view.requested=false;if(view instanceof ViewGroup)for(View child:((ViewGroup)view).children)clearRequested(child);}
  boolean syncNativeIconCapacity(){capacityChecks++;return ready;}boolean connectivityPlaced(){return true;}
  void releasePlacedClips(View v){
   // RELEASE_CLIPS
  }
  void restorePlacedClips(){
   // RESTORE_CLIPS
  }
  // METHODS
 }
 static void repack(State state,Runnable mutation,String reason){int before=state.layouts;mutation.run();state.beforeDraw();check(state.layouts==before+1,reason);state.beforeDraw();check(state.layouts==before+1,"fresh witnesses settle after "+reason);}
 static void stableAfterClipRelease(State state,String reason){
  int layouts=state.layouts,capacity=state.capacityChecks,rects=Rect.allocations;
  for(int i=0;i<1200;i++)state.beforeDraw();
  check(state.layouts==layouts&&state.capacityChecks==capacity,"1200 released frames reuse the cache after "+reason);
  check(Rect.allocations==rects,"steady clipping probes allocate no Rects after "+reason);
 }
 static void clipRepack(State state,Runnable mutation,String reason){repack(state,mutation,reason);stableAfterClipRelease(state,reason);}
 static void clippingCacheLifecycle(){
  State state=new State();ViewGroup area=new ViewGroup();TextView clock=new TextView();
  state.root.add(area);area.add(clock);state.placedViews.add(clock);state.geometry.put(clock,new Object());
  Rect initialClock=new Rect(12,2,108,32),initialArea=new Rect(6,0,130,36);
  clock.setClipBounds(initialClock);clock.setClipToOutline(true);area.setClipBounds(initialArea);area.setClipToOutline(true);
  state.beforeDraw();
  check(clock.getClipBounds()==null&&!clock.getClipToOutline(),"first placement releases the real clock clip and outline before taking witnesses");
  check(area.getClipBounds()==null&&!area.getClipToOutline()&&!area.getClipChildren()&&!area.getClipToPadding(),"first placement releases ancestor clips before taking witnesses");
  stableAfterClipRelease(state,"initial placement");
  Rect latestClock=new Rect(40,1,111,31),latestArea=new Rect(18,0,132,35);
  clipRepack(state,()->clock.setClipBounds(latestClock),"OEM clock clipBounds write without text/geometry/requestLayout changes repacks once");
  check(clock.getClipBounds()==null,"repack releases the new hour-clipping rectangle");
  clipRepack(state,()->area.setClipBounds(latestArea),"OEM ancestor clipBounds write without native layout repacks once");
  check(area.getClipBounds()==null,"repack releases the new ancestor rectangle");
  clipRepack(state,()->clock.setClipToOutline(true),"OEM clock clipToOutline write repacks once");
  check(!clock.getClipToOutline(),"repack releases the new clock outline");
  clipRepack(state,()->area.setClipToOutline(true),"OEM ancestor clipToOutline write repacks once");
  check(!area.getClipToOutline(),"repack releases the new ancestor outline");
  clipRepack(state,()->area.setClipChildren(true),"OEM ancestor clipChildren write repacks once");
  check(!area.getClipChildren(),"repack releases ancestor child clipping");
  clipRepack(state,()->area.setClipToPadding(true),"OEM ancestor clipToPadding write repacks once");
  check(!area.getClipToPadding(),"repack releases ancestor padding clipping");
  clipRepack(state,()->state.root.setClipChildren(true),"OEM status-bar root clipChildren write repacks once");
  clipRepack(state,()->state.root.setClipToPadding(true),"OEM status-bar root clipToPadding write repacks once");
  state.active=false;state.restorePlacedClips();state.beforeDraw();
  check(latestClock.equals(clock.getClipBounds())&&latestArea.equals(area.getClipBounds()),"disable restores the latest native explicit rectangles rather than the initial ones");
  check(clock.getClipToOutline()&&area.getClipToOutline(),"disable restores native outlines");
  check(area.getClipChildren()&&area.getClipToPadding()&&state.root.getClipChildren()&&state.root.getClipToPadding(),"disable restores original native ancestor clipping flags");
  int disabledLayouts=state.layouts;for(int i=0;i<1200;i++)state.beforeDraw();
  check(state.layouts==disabledLayouts&&latestClock.equals(clock.getClipBounds()),"disabled frames preserve restored native clips without packing");
  state.active=true;state.beforeDraw();check(state.layouts==disabledLayouts+1,"reenabling releases restored native clips with one pack");
  stableAfterClipRelease(state,"reenabling");
  state.active=false;state.restorePlacedClips();state.beforeDraw();
  check(latestClock.equals(clock.getClipBounds())&&area.getClipChildren(),"second lifecycle restores native clipping again");

  // Snapshot semantics matter even for a native view the grid does not place.
  View nativeView=new View();Rect shared=new Rect(7,1,83,29);nativeView.setClipBounds(shared);
  FrameWitness snapshot=new FrameWitness(nativeView,false);
  nativeView.setClipBounds(new Rect(shared));check(snapshot.matches(),"equal-valued clip replacement does not invalidate by identity");
  nativeView.setClipBounds(shared);check(snapshot.matches(),"the original equal-valued clip still matches");
  shared.left=27;check(!snapshot.matches(),"in-place shared Rect mutation invalidates the copied clipBounds witness");
  nativeView.setClipBounds(null);check(!snapshot.matches(),"native clip removal invalidates a nonempty snapshot");

  State mixed=new State();ViewGroup mixedArea=new ViewGroup();TextView mixedClock=new TextView();
  mixed.root.add(mixedArea);mixedArea.add(mixedClock);mixed.placedViews.add(mixedClock);
  mixed.root.setClipToPadding(false);mixedArea.setClipChildren(false);mixed.beforeDraw();
  stableAfterClipRelease(mixed,"mixed native clipping baseline");
  mixed.active=false;mixed.restorePlacedClips();
  check(mixed.root.getClipChildren()&&!mixed.root.getClipToPadding()&&!mixedArea.getClipChildren()&&mixedArea.getClipToPadding(),"restore retains each ancestor's independent original clipping flags");
 }
 static void paletteOnlyFrames(){
  State state=new State();int before=StatusBarTintHook.dirtyRefreshes;
  state.beforeDraw();check(StatusBarTintHook.dirtyRefreshes==before,"initial geometry pass does not use palette-only refresh");
  for(int i=0;i<1200;i++)state.beforeDraw();
  check(StatusBarTintHook.dirtyRefreshes==before+1200&&StatusBarTintHook.lastRoot==state.root,"stable frames check palette dirtiness for their actual root");
  check(state.layouts==1&&state.capacityChecks==1,"palette checks preserve cached geometry and native capacity");
  before=StatusBarTintHook.dirtyRefreshes;state.layoutDirty=true;state.beforeDraw();
  check(state.layouts==2&&StatusBarTintHook.dirtyRefreshes==before,"dirty geometry takes the layout path instead of palette-only refresh");
  state.root.alpha=0;state.beforeDraw();state.root.alpha=1;state.active=false;state.beforeDraw();
  check(StatusBarTintHook.dirtyRefreshes==before,"invisible or inactive roots skip palette-only refresh");
  state.active=true;state.beforeDraw();state.packingSuspended=true;state.beforeDraw();
  check(StatusBarTintHook.dirtyRefreshes==before,"reenabling and suspended packing cannot reuse the stable palette path");
 }
 public static void main(String[] args){
  paletteOnlyFrames();
  State state=new State();ViewGroup area=new ViewGroup();TextView clock=new TextView();ImageView signal=new ImageView();MFVBatteryViewLayout battery=new MFVBatteryViewLayout();
  state.root.add(area);area.add(clock);area.add(signal);area.add(battery);state.alphaAnchor=battery;state.overlay=new ViewGroup();state.connectivityIcon=new ConnectivityIconView();state.root.add(state.overlay);state.root.add(state.connectivityIcon);
  ImageView lightsOut=new ImageView();lightsOut.visibility=View.GONE;lightsOut.requested=true;state.root.add(lightsOut);
  ViewGroup userSwitcher=new ViewGroup();TextView hiddenChild=new TextView();userSwitcher.visibility=View.GONE;userSwitcher.requested=true;hiddenChild.requested=true;userSwitcher.add(hiddenChild);state.root.add(userSwitcher);
  state.beforeDraw();for(int i=0;i<1200;i++)state.beforeDraw();check(state.layouts==1&&state.capacityChecks==1,"1200 unchanged frames perform one pack/native-capacity traversal");
  check(lightsOut.requested&&userSwitcher.requested&&hiddenChild.requested,"GONE pending-layout flags remain set, matching the on-device source of cache invalidation");
  int hiddenBefore=state.layouts;for(int i=0;i<1200;i++){hiddenChild.text="hidden:"+i;hiddenChild.r=i+1;lightsOut.image.box.right=i+1;state.beforeDraw();}
  check(state.layouts==hiddenBefore,"GONE subtree requests and changing hidden content do not trigger measurement or packing");
  repack(state,()->lightsOut.visibility=View.VISIBLE,"lights-out indicator becoming visible immediately repacks its latest image bounds");
  repack(state,()->lightsOut.visibility=View.GONE,"lights-out indicator becoming hidden immediately releases its packed space");
  repack(state,()->userSwitcher.visibility=View.VISIBLE,"GONE ancestor becoming visible refreshes descendant content and geometry");
  check(!hiddenChild.requested,"native visible traversal measures the latest pending child");
  repack(state,()->userSwitcher.visibility=View.GONE,"hiding an ancestor invalidates the visible pack once");
  int fadeBefore=state.layouts;for(int i=1;i<=100;i++){area.alpha=i/100f;state.beforeDraw();check(state.overlay.alpha==area.alpha&&state.connectivityIcon.alpha==area.alpha,"ancestor fade remains continuous without repacking");}check(state.layouts==fadeBefore,"nonzero ancestor alpha fractions do not allocate/measure a new grid");
  repack(state,()->signal.imageMatrix.x=3,"in-place image matrix change invalidates without layout callback");
  repack(state,()->signal.scaleType=ImageView.ScaleType.CENTER,"scale type changes invalidate identical drawable/view geometry");
  repack(state,()->signal.transitionAlpha=0,"non-owned child transition-alpha zero crossing removes its content bounds");
  repack(state,()->signal.transitionAlpha=.3f,"non-owned child transition-alpha return restores content bounds");
  int before=state.layouts;signal.transitionAlpha=.8f;state.beforeDraw();check(state.layouts==before,"nonzero child transition fade retains the same occupied content");
  repack(state,()->signal.alpha=0,"non-owned child alpha zero crossing removes its content bounds");repack(state,()->signal.alpha=1,"non-owned child opacity return invalidates");
  repack(state,()->area.alpha=0,"group opacity zero crossing invalidates compound content");repack(state,()->area.alpha=1,"group opacity return restores compound content");
  repack(state,()->clock.text="12:34","new clock/network content invalidates before a frame");repack(state,()->clock.font=new Typeface(),"native font change invalidates");repack(state,()->clock.color=0xff222222,"native color update reaches replacement labels");
  repack(state,()->signal.image=new Drawable(),"native drawable replacement invalidates");repack(state,()->signal.image.box.right=20,"mutable drawable canvas geometry invalidates");
  repack(state,()->battery.mBateryLevel=99,"OEM battery level changes immediately with identical view/drawable geometry");repack(state,()->battery.mIsCharing=true,"OEM charging changes immediately without requestLayout");repack(state,()->battery.mShowMode=1,"OEM percent mode changes immediately");repack(state,()->battery.mTextHollowEffectAvailable=true,"OEM battery hollow-text flag invalidates");
  state.batteryInk=new Rect();state.batteryInkAt=0;SystemClock.now=999;before=state.layouts;state.beforeDraw();check(state.layouts==before,"mutable vendor-drawable fallback remains bounded to 1Hz");SystemClock.now=1000;state.beforeDraw();check(state.layouts==before+1,"1Hz vendor-drawable sampling cannot be starved by frame reuse");
  repack(state,()->signal.params.width=40,"OEM fixed box update invalidates before native layout");repack(state,()->signal.x=14,"external native transform invalidates");repack(state,()->signal.requested=true,"pending native layout cannot use old frame witnesses");repack(state,()->state.layoutDirty=true,"configuration and native icon events request a full pack");
  before=state.layouts;state.root.alpha=0;state.beforeDraw();for(int i=0;i<1200;i++)state.beforeDraw();check(state.layouts==before,"fully invisible roots perform zero packs");state.root.alpha=1;state.beforeDraw();check(state.layouts==before+1,"returning visible root recalculates its presentation");
  before=state.layouts;state.root.windowVisibility=View.GONE;state.beforeDraw();check(state.layouts==before,"hidden status-bar window performs no packing");state.root.windowVisibility=0;state.beforeDraw();
  state.active=false;before=state.layouts;state.beforeDraw();check(state.layouts==before,"disabled grid does not pack or suppress native content");state.active=true;state.beforeDraw();check(state.layouts==before+1,"reenabling invalidates the old stable frame");
  state.packingSuspended=true;before=state.layouts;state.beforeDraw();state.beforeDraw();check(state.layouts==before+2,"temporary capacity rejection retains live retry/recovery checks");
  check(state.overlay.alpha==0&&state.connectivityIcon.alpha==0,"pre-draw must keep retained custom content hidden during native fallback");
  for(float alpha:new float[]{1,.25f,0,1}){area.alpha=alpha;state.beforeDraw();check(state.overlay.alpha==0&&state.connectivityIcon.alpha==0,"native fades cannot reveal stale fallback labels or replacements");}
  clippingCacheLifecycle();
  System.out.println("Grid production frame reuse: "+checks+" assertions passed; unchanged/hidden 120 Hz workloads bounded (facade, not device evidence)");
 }
}'''

members = '\n'.join(extract(marker) for marker in ('boolean beforeDraw()', 'boolean unchangedFrame()', 'void captureFrame(', 'void syncOverlayAlpha('))
witness = extract('private static final class FrameWitness').replace('android.graphics.Typeface', 'Typeface').replace('android.graphics.drawable.Drawable', 'Drawable')
clipping_source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarClipping.java').read_text(encoding='utf-8')
clipping = extract('final class StatusBarClipping', clipping_source).replace('final class StatusBarClipping', 'static final class StatusBarClipping', 1)
release_clips = extract('explicitClips.release(v);ViewParent parent=v.getParent();while(parent instanceof ViewGroup)')
restore_start = SOURCE.index('explicitClips.restore();for(Map.Entry<ViewGroup,boolean[]>')
restore_end = SOURCE.index('clips.clear();', restore_start) + len('clips.clear();')
restore_clips = SOURCE[restore_start:restore_end]
generated = HARNESS.replace('// WITNESS', witness).replace('// CLIPPING', clipping).replace('// RELEASE_CLIPS', release_clips).replace('// RESTORE_CLIPS', restore_clips).replace('// VISIBLE', extract('private static boolean visibleFrame(')).replace('// OVERLAY_ALPHA', extract('private static float overlayAlpha(')).replace('// METHODS', members)
with tempfile.TemporaryDirectory(prefix='duo-grid-frame-') as tmp:
    path = Path(tmp) / 'TestGridFrameCache.java'
    path.write_text(generated, encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '--release', '17', '-d', tmp, str(path)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestGridFrameCache'], check=True, timeout=20)
