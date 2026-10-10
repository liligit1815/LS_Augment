"""Exercise production grid frame reuse and invalidation with Android-shaped view inputs.

This is a runtime facade for cache decisions, not an on-device visual/performance claim.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarGridHook.java').read_text(encoding='utf-8')


def extract(marker):
    start = SOURCE.index(marker)
    end = SOURCE.index('{', start) + 1
    depth = 1
    while depth:
        depth += (SOURCE[end] == '{') - (SOURCE[end] == '}')
        end += 1
    return SOURCE[start:end]


HARNESS = r'''import java.util.*;
public class TestGridFrameCache {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 interface ViewParent{}
 static class Rect {int left,top,right=16,bottom=16;}
 static class Matrix {float x,y,sx=1,sy=1;Matrix(){}Matrix(Matrix from){x=from.x;y=from.y;sx=from.sx;sy=from.sy;}public boolean equals(Object o){return o instanceof Matrix&&x==((Matrix)o).x&&y==((Matrix)o).y&&sx==((Matrix)o).sx&&sy==((Matrix)o).sy;}}
 static class Typeface{}
 static class Drawable {Rect box=new Rect();int w=16,h=16,level;int getIntrinsicWidth(){return w;}int getIntrinsicHeight(){return h;}int getLevel(){return level;}Rect getBounds(){return box;}}
 static class SystemClock {static long now;static long elapsedRealtime(){return now;}}
 static class View {
  static final int VISIBLE=0,GONE=8;ViewGroup parent;ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();boolean attached=true,requested;int visibility,windowVisibility,direction,l,t,r=16,b=16,mw=16,mh=16,pl,pt,pr,pb,scrollX,scrollY;
  float alpha=1,transitionAlpha=1,x,y,sx=1,sy=1,pivotX,pivotY,rotation,rotationX,rotationY;
  ViewParent getParent(){return parent;}ViewGroup.LayoutParams getLayoutParams(){return params;}boolean isAttachedToWindow(){return attached;}int getWindowVisibility(){return windowVisibility;}int getVisibility(){return visibility;}boolean isLayoutRequested(){return requested;}
  int getLeft(){return l;}int getTop(){return t;}int getRight(){return r;}int getBottom(){return b;}int getMeasuredWidth(){return mw;}int getMeasuredHeight(){return mh;}int getLayoutDirection(){return direction;}
  int getPaddingLeft(){return pl;}int getPaddingTop(){return pt;}int getPaddingRight(){return pr;}int getPaddingBottom(){return pb;}int getScrollX(){return scrollX;}int getScrollY(){return scrollY;}
  float getAlpha(){return alpha;}float getTransitionAlpha(){return transitionAlpha;}float getTranslationX(){return x;}float getTranslationY(){return y;}float getScaleX(){return sx;}float getScaleY(){return sy;}
  float getPivotX(){return pivotX;}float getPivotY(){return pivotY;}float getRotation(){return rotation;}float getRotationX(){return rotationX;}float getRotationY(){return rotationY;}void setAlpha(float value){alpha=value;}
 }
 static class ViewGroup extends View implements ViewParent {List<View> children=new ArrayList<>();static class LayoutParams{int width=16,height=16;}void add(View v){children.add(v);v.parent=this;}int getChildCount(){return children.size();}View getChildAt(int index){return children.get(index);}}
 static class TextView extends View {CharSequence text="00:00";Typeface font=new Typeface();float size=14,letters;int color=-1;CharSequence getText(){return text;}Typeface getTypeface(){return font;}float getTextSize(){return size;}float getLetterSpacing(){return letters;}int getCurrentTextColor(){return color;}}
 static class ImageView extends View {enum ScaleType{FIT_XY,CENTER}ScaleType scaleType=ScaleType.FIT_XY;Drawable image=new Drawable();Matrix imageMatrix=new Matrix();Drawable getDrawable(){return image;}Matrix getImageMatrix(){return imageMatrix;}ScaleType getScaleType(){return scaleType;}}
 static class MFVBatteryViewLayout extends ViewGroup {public int mBateryLevel=80,mShowMode;public boolean mIsCharing,mTextHollowEffectAvailable;}
 static class SystemUiAdapter {static Object field(Object owner,String name){try{return owner.getClass().getField(name).get(owner);}catch(Exception ignored){return null;}}}
 static class ConnectivityIconView extends View{}
 // WITNESS
 // VISIBLE
 // OVERLAY_ALPHA
 static class State {
  final ViewGroup root=new ViewGroup();final List<FrameWitness> frameWitnesses=new ArrayList<>();final Map<View,Object> geometry=new IdentityHashMap<>();boolean active=true,layoutDirty=true,packingSuspended,ready=true;Object packingCapacityBlock;
  View alphaAnchor;ViewGroup overlay;ConnectivityIconView connectivityIcon;Rect batteryInk;long batteryInkAt;int layouts,capacityChecks;
  void layout(){layouts++;clearRequested(root);if(batteryInk!=null)batteryInkAt=SystemClock.now;}
  void clearRequested(View view){if(view.visibility!=View.VISIBLE)return;view.requested=false;if(view instanceof ViewGroup)for(View child:((ViewGroup)view).children)clearRequested(child);}
  boolean syncNativeIconCapacity(){capacityChecks++;return ready;}boolean connectivityPlaced(){return true;}
  // METHODS
 }
 static void repack(State state,Runnable mutation,String reason){int before=state.layouts;mutation.run();state.beforeDraw();check(state.layouts==before+1,reason);state.beforeDraw();check(state.layouts==before+1,"fresh witnesses settle after "+reason);}
 public static void main(String[] args){
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
  System.out.println("Grid production frame reuse: "+checks+" assertions passed; unchanged/hidden 120 Hz workloads bounded (facade, not device evidence)");
 }
}'''

members = '\n'.join(extract(marker) for marker in ('boolean beforeDraw()', 'boolean unchangedFrame()', 'void captureFrame(', 'void syncOverlayAlpha('))
witness = extract('private static final class FrameWitness').replace('android.graphics.Typeface', 'Typeface').replace('android.graphics.drawable.Drawable', 'Drawable')
generated = HARNESS.replace('// WITNESS', witness).replace('// VISIBLE', extract('private static boolean visibleFrame(')).replace('// OVERLAY_ALPHA', extract('private static float overlayAlpha(')).replace('// METHODS', members)
with tempfile.TemporaryDirectory(prefix='duo-grid-frame-') as tmp:
    path = Path(tmp) / 'TestGridFrameCache.java'
    path.write_text(generated, encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '--release', '17', '-d', tmp, str(path)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestGridFrameCache'], check=True, timeout=20)
