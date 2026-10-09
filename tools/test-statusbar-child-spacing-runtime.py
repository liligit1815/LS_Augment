"""Run production child-spacing/measurement methods with Android-shaped facades.

These fixtures exercise actual implementation bodies, not a second spacing policy.
They are deliberately not represented as ROM or physical-device evidence.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(os.environ.get('DUO_SOURCE_ROOT', Path(__file__).resolve().parents[1]))
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'


def extract(path, marker):
    source = path.read_text(encoding='utf-8')
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


SOURCES = {
    'android/view/View.java': r'''package android.view;
public class View {
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8,LAYOUT_DIRECTION_RTL=1;
 public String semantic="";public int direction,visibility,requests;public float density=1;public boolean grid;
 public ViewGroup parent;public ViewGroup.LayoutParams params=new ViewGroup.MarginLayoutParams(16,16);
 public float getScaleX(){return 1;}public float getScaleY(){return 1;}public float getRotation(){return 0;}public float getTranslationX(){return 0;}public float getTranslationY(){return 0;}
 public Object getParent(){return parent;}public ViewGroup.LayoutParams getLayoutParams(){return params;}public int getVisibility(){return visibility;}public int getLayoutDirection(){return direction;}public void requestLayout(){requests++;}
 public interface OnLayoutChangeListener {void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob);}
 public void addOnLayoutChangeListener(OnLayoutChangeListener listener){}
}''',
    'android/view/ViewGroup.java': r'''package android.view;import java.util.*;
public class ViewGroup extends View {
 public java.util.List<View> children=new ArrayList<>();public boolean clip=true,paddingClip=true;
 public void add(View view){children.add(view);view.parent=this;view.grid=grid;}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}
 public boolean getClipChildren(){return clip;}public boolean getClipToPadding(){return paddingClip;}public void setClipChildren(boolean value){clip=value;}public void setClipToPadding(boolean value){paddingClip=value;}
 public static class LayoutParams {public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
 public static class MarginLayoutParams extends LayoutParams {
  public int leftMargin,topMargin,rightMargin,bottomMargin,start=Integer.MIN_VALUE,end=Integer.MIN_VALUE;
  public MarginLayoutParams(int w,int h){super(w,h);}public boolean isMarginRelative(){return start!=Integer.MIN_VALUE||end!=Integer.MIN_VALUE;}
  public int getMarginStart(){return start==Integer.MIN_VALUE?leftMargin:start;}public int getMarginEnd(){return end==Integer.MIN_VALUE?rightMargin:end;}
  public void setMarginStart(int value){start=value;}public void setMarginEnd(int value){end=value;}
  public void resolveLayoutDirection(int dir){if(start!=Integer.MIN_VALUE){if(dir==1)rightMargin=start;else leftMargin=start;}if(end!=Integer.MIN_VALUE){if(dir==1)leftMargin=end;else rightMargin=end;}}
 }
}''',
    'android/widget/FrameLayout.java': 'package android.widget;public class FrameLayout extends android.view.ViewGroup {public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams {public int gravity=-1;public LayoutParams(int w,int h){super(w,h);}}}',
    'android/view/Gravity.java': 'package android.view;public class Gravity {public static final int TOP=48,START=8388611;}',
    'android/widget/RelativeLayout.java': 'package android.widget;public class RelativeLayout extends android.view.ViewGroup {}',
    'android/widget/LinearLayout.java': 'package android.widget;public class LinearLayout extends android.view.ViewGroup {public static final int HORIZONTAL=0,VERTICAL=1;public int orientation;public int getOrientation(){return orientation;}}',
    'android/widget/ImageView.java': 'package android.widget;public class ImageView extends android.view.View {public enum ScaleType {FIT_XY,CENTER}public ScaleType scale=ScaleType.FIT_XY;public android.graphics.drawable.Drawable drawable=new android.graphics.drawable.Drawable();public ScaleType getScaleType(){return scale;}public android.graphics.drawable.Drawable getDrawable(){return drawable;}}',
    'android/graphics/drawable/Drawable.java': 'package android.graphics.drawable;public class Drawable {public boolean mirrored;public boolean isAutoMirrored(){return mirrored;}}',
    'android/graphics/RectF.java': r'''package android.graphics;public class RectF {public float left,top,right,bottom;public RectF(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}public boolean isEmpty(){return right<=left||bottom<=top;}}''',
}

HARNESS = r'''package ls.augment.com.hook;
import android.view.*;import android.widget.*;import android.graphics.*;import java.util.*;import ls.augment.com.*;
public class TestChildSpacingRuntime {
 static int checks,semanticCalls;static void check(boolean ok,String reason){checks++;if(!ok)throw new AssertionError(reason);}
 static void eq(int actual,int expected,String why){check(actual==expected,why+": "+actual+" != "+expected);}
 static final Map<View,MarginRecord> MARGINS=new WeakHashMap<>();static final Map<ViewGroup,SizeRecord> CHILD_BOXES=new WeakHashMap<>();static final Map<ViewGroup,Boolean> COMPOSITES=new WeakHashMap<>();static final Map<ViewGroup,int[]> CHILD_EXTENTS=new WeakHashMap<>();
 static final Map<ViewGroup,Boolean> COMPOSITE_ACTIVE=new WeakHashMap<>();
 static final Map<View,StatusBarIconSpacingSpec.Insets> EDGES=new IdentityHashMap<>();static final Map<View,String> PRIVACY_IDS=new WeakHashMap<>();
 static boolean hasChildWork(View view){return !EDGES.isEmpty();}
 static StatusBarIconSpacingSpec.Insets insets(View view){return StatusBarIconSpacingSpec.supported(semanticId(view))?EDGES.getOrDefault(view,StatusBarIconSpacingSpec.ZERO):StatusBarIconSpacingSpec.ZERO;}static String semanticId(View view){semanticCalls++;return view.semantic.isEmpty()?PRIVACY_IDS.getOrDefault(view,""):view.semantic;}
 static StatusBarIconSpacingSpec.Insets insets(View view,String id){return insets(view);}
 static class StatusBarHeaderSpacingHook {static int capacity=10000;static boolean fitsVerticalPixels(View child,int px){return px<=capacity;}static StatusBarIconSpacingSpec.Insets bounded(View child,String id,StatusBarIconSpacingSpec.Insets value){return value;}static void refresh(View child){}}
 static float density(View view){return view.density;}static void watch(ViewGroup view){}
 static class StatusBarGridHook {static boolean ownsIconLayout(View view){return view.grid;}static boolean isBarRoot(View view){return view instanceof PhoneStatusBarView;}}
 static class RedMagicSystemUiHook {static boolean ownsStackedChildBoundary(View view){return false;}}
 static class StatusBarAssetsHook {static String semanticId(View view){return TestChildSpacingRuntime.semanticId(view);}static android.graphics.drawable.Drawable nativeDrawable(ImageView view){return view.drawable instanceof StatusBarAssetDrawable?((StatusBarAssetDrawable)view.drawable).original:view.drawable;}}
 static class StatusBarAssetDrawable extends android.graphics.drawable.Drawable {final android.graphics.drawable.Drawable original=new android.graphics.drawable.Drawable();}
 // This suite exercises the native branch. The custom adapter executes in test-wifi-asset-spacing-runtime.py.
 static class StatusBarWifiAssetSpacingHook {static boolean includeBoundary(View child,RectF bounds){return false;}static int[] margins(View c,View s,View a,String contract){return null;}}
 static void publishWifiContract(ViewGroup parent,String id,String reason){}
 static class ModernStatusBarWifiView extends FrameLayout {}static class ModernStatusBarMobileView extends FrameLayout {}static class PhoneStatusBarView extends LinearLayout {}static class OngoingPrivacyChip extends FrameLayout {}static class StatusIconContainer extends LinearLayout {}
 static Object cachedField(Object owner,String field){try{return owner.getClass().getField(field).get(owner);}catch(Exception ex){return null;}}
 enum PrivacyType {TYPE_CAMERA,TYPE_MICROPHONE,TYPE_LOCATION,TYPE_MEDIA_PROJECTION,UNKNOWN}
 static class Builder {public List<PrivacyType> types;Builder(PrivacyType... value){types=Arrays.asList(value);}}
 // METHODS
 static ImageView image(String id,ViewGroup parent,int width,int height){ImageView v=new ImageView();v.semantic=id;v.params=parent instanceof FrameLayout?new FrameLayout.LayoutParams(width,height):new ViewGroup.MarginLayoutParams(width,height);parent.add(v);return v;}
 static FrameLayout frame(ViewGroup parent,int width,int height){FrameLayout v=new FrameLayout();v.params=new ViewGroup.MarginLayoutParams(width,height);parent.add(v);return v;}
 static ViewGroup.MarginLayoutParams margins(View view){return (ViewGroup.MarginLayoutParams)view.params;}
 static void edge(View view,int s,int t,int e,int b){EDGES.put(view,new StatusBarIconSpacingSpec.Insets(s,t,e,b));}
 // Android FrameLayout/LinearLayout's extent accounting, bounded to these fixtures.
 static int[] measure(View view){if(!(view instanceof ViewGroup))return new int[]{Math.max(0,view.params.width),Math.max(0,view.params.height)};
  ViewGroup group=(ViewGroup)view;int w=0,h=0;boolean horizontal=group instanceof LinearLayout&&((LinearLayout)group).getOrientation()==0;
  for(View child:group.children){if(child.visibility==View.GONE)continue;int[] box=measure(child);ViewGroup.MarginLayoutParams p=margins(child);int cw=box[0]+p.getMarginStart()+p.getMarginEnd(),ch=box[1]+p.topMargin+p.bottomMargin;w=horizontal?w+cw:Math.max(w,cw);h=Math.max(h,ch);}
  return new int[]{view.params.width>=0?view.params.width:w,view.params.height>=0?view.params.height:h};
 }
 public static void main(String[] args){
  ModernStatusBarMobileView empty=new ModernStatusBarMobileView();FrameLayout emptyGroup=frame(empty,42,42);ImageView emptySignal=image("mobile1.signal",emptyGroup,42,42);
  int initialSemantics=semanticCalls;for(int i=0;i<1200;i++){refreshComposite(empty);observeIcon(emptySignal);}
  eq(semanticCalls,initialSemantics,"empty configuration performs no child semantic/reflection lookup across 1200 frame callbacks");check(MARGINS.isEmpty()&&CHILD_BOXES.isEmpty(),"empty configuration allocates no child margin/size records");
  ModernStatusBarWifiView wifi=new ModernStatusBarWifiView();wifi.grid=true;wifi.semantic="wifi";wifi.params=new ViewGroup.MarginLayoutParams(-2,-1);FrameLayout group=frame(wifi,-2,16);ImageView signal=image("wifi.signal",group,16,16),activity=image("wifi.activity_inout",group,16,16);
  edge(wifi,9,9,9,9);edge(signal,3,4,5,6);edge(activity,1,2,2,1);observeIcon(wifi);refreshComposite(wifi);
  eq(margins(signal).getMarginStart(),3,"real FrameLayout child start consumed");eq(margins(signal).topMargin,4,"real FrameLayout child top consumed");eq(group.params.height,29,"fixed OEM parent reserves common plus traffic vertical space");eq(signal.params.height,16,"native dynamic glyph height untouched");eq(measure(wifi)[0],27,"wrap content includes both layers external horizontal reserve");eq(margins(wifi).getMarginStart(),0,"whole Wi-Fi edge reserved only by grid adapter");
  eq(margins(activity).getMarginStart(),4,"traffic inherits fan start before adding own gap");eq(margins(activity).topMargin,6,"traffic inherits fan top before adding own gap");
  for(int i=0;i<200;i++)refreshComposite(wifi);eq(group.params.height,29,"repeated updates cannot accumulate fixed container growth");eq(measure(wifi)[0],27,"repeated wrapper scan cannot add margins twice");check(!group.clip&&!wifi.clip,"grid internal clips release for measured union");
  RectF bounds=new RectF(0,0,16,16);includeChildBoundary(signal,bounds);check(bounds.left==-3&&bounds.right==24&&bounds.top==-4&&bounds.bottom==25,"grid content union retains complete common reserve");
  group.direction=signal.direction=activity.direction=View.LAYOUT_DIRECTION_RTL;refreshComposite(wifi);bounds=new RectF(0,0,16,16);includeChildBoundary(signal,bounds);check(bounds.left==-5&&bounds.right==22,"RTL compensates fan right reserve so native right arrows cannot drift inward");
  group.params.height=20;margins(signal).topMargin=7;refreshComposite(wifi);eq(group.params.height,33,"OEM height update replaces original baseline");eq(margins(signal).topMargin,11,"OEM margin update reapplies only configured addition");
  restoreChildBoxes(wifi);group.params.height=30;refreshComposite(wifi);eq(group.params.height,43,"native writer can intentionally choose previous applied height without confusing ownership");
  restoreChildBoxes(wifi);group.params.height=20;refreshComposite(wifi);
  EDGES.remove(signal);EDGES.remove(activity);refreshComposite(wifi);eq(group.params.height,20,"closing restores latest OEM fixed height");eq(margins(signal).topMargin,7,"closing preserves latest OEM margin");eq(margins(signal).getMarginStart(),0,"closing clears independent start");check(group.clip&&wifi.clip,"closing restores original internal clips");
  edge(signal,2,3,4,5);refreshComposite(wifi);signal.visibility=View.GONE;refreshComposite(wifi);eq(group.params.height,20,"gone child does not enlarge fixed parent");signal.visibility=View.VISIBLE;refreshComposite(wifi);eq(group.params.height,28,"native visibility returning restores spacing");
  ModernStatusBarMobileView mobile=new ModernStatusBarMobileView();mobile.semantic="mobile1";mobile.grid=true;mobile.params=new ViewGroup.MarginLayoutParams(-2,-1);LinearLayout row=new LinearLayout();row.params=new ViewGroup.MarginLayoutParams(-2,16);mobile.add(row);ImageView roaming=image("mobile1.roaming",row,5,16);FrameLayout signalBox=frame(row,16,16);ImageView bar=image("mobile1.signal",signalBox,16,16);FrameLayout typeBox=frame(signalBox,16,16);ImageView type=image("mobile1.type",typeBox,16,16);edge(roaming,1,0,2,0);edge(bar,2,3,2,1);edge(type,1,2,5,4);refreshComposite(mobile);
  eq(typeBox.params.width,22,"fixed type parent reserves its independent horizontal edges");eq(signalBox.params.width,22,"overlay nested growth uses maximum, not sum of overlapping glyphs");eq(row.params.height,22,"linear row receives nested vertical extent exactly once");eq(measure(mobile)[0],30,"roaming and signal cells keep distinct horizontal reservations");
  bar.semantic="unknown:mobile.signal";refreshComposite(mobile);check(!MARGINS.containsKey(bar),"unmapped subscription drops old SIM child spacing");
  FrameLayout switcher=new FrameLayout();switcher.semantic="user_switcher";switcher.params=new ViewGroup.MarginLayoutParams(28,28);ImageView avatar=image("user_avatar",switcher,-1,-1);edge(avatar,3,2,5,4);refreshComposite(switcher);eq(switcher.params.width,36,"inner avatar boundary grows button allocation");eq(switcher.params.height,34,"avatar match-parent content retains both vertical edges");eq(avatar.params.width,-1,"native match-parent avatar contract retained");
  OngoingPrivacyChip chip=new OngoingPrivacyChip();chip.params=new ViewGroup.MarginLayoutParams(-2,24);LinearLayout icons=new LinearLayout();icons.params=new ViewGroup.MarginLayoutParams(-2,16);chip.add(icons);ImageView camera=image("",icons,16,16),mic=image("",icons,16,16);bindPrivacyTypes(new Builder(PrivacyType.TYPE_CAMERA,PrivacyType.TYPE_MICROPHONE),icons);check(semanticId(camera).equals("privacy.camera")&&semanticId(mic).equals("privacy.microphone"),"privacy children bind exact builder enum order without IDs or descriptions");edge(camera,1,2,3,4);edge(mic,5,0,6,0);refreshComposite(chip);eq(margins(camera).getMarginStart(),1,"known privacy semantic survives spacing observer");eq(measure(icons)[0],47,"independent privacy child margins take part in native linear measurement");eq(chip.params.height,30,"privacy chip fixed height includes child vertical reserve");
  bindPrivacyTypes(new Builder(PrivacyType.TYPE_MICROPHONE,PrivacyType.TYPE_LOCATION),icons);check(semanticId(camera).equals("privacy.microphone")&&semanticId(mic).equals("privacy.location"),"recycled child identities follow new native builder types");bindPrivacyTypes(new Builder(PrivacyType.TYPE_CAMERA),icons);check(semanticId(camera).isEmpty()&&semanticId(mic).isEmpty(),"mismatched builder evidence clears stale identity rather than guessing");
  ModernStatusBarWifiView pair=new ModernStatusBarWifiView();pair.semantic="wifi";pair.params=new ViewGroup.MarginLayoutParams(-2,-1);FrameLayout carrier=frame(pair,46,42);ImageView fan=image("wifi.signal",carrier,46,42),arrows=image("wifi.activity_inout",carrier,46,42);fan.density=arrows.density=3.25f;
  Object nativeFan=fan.drawable,nativeArrows=arrows.drawable,nativeFanParams=fan.params,nativeArrowsParams=arrows.params;
  // Every combination of the eight 0/24dp extremes, including single-edge and
  // paired extremes. Layout calculations use actual applied production margins.
  for(int mask=0;mask<256;mask++){
   int[] v=new int[8];for(int i=0;i<8;i++)v[i]=(mask&(1<<i))==0?0:24;
   edge(fan,v[0],v[1],v[2],v[3]);edge(arrows,v[4],v[5],v[6],v[7]);
   for(int dir:new int[]{0,1,0}){carrier.direction=fan.direction=arrows.direction=dir;margins(fan).resolveLayoutDirection(dir);margins(arrows).resolveLayoutDirection(dir);refreshComposite(pair);int[] size=measure(carrier);ViewGroup.MarginLayoutParams fp=margins(fan),ap=margins(arrows);
    int fanX=dir==0?fp.leftMargin:size[0]-46-fp.rightMargin,arrowX=dir==0?ap.leftMargin:size[0]-46-ap.rightMargin;
    eq(size[0],46+Math.round((v[0]+v[2]+v[4]+v[6])*3.25f),"pair whole horizontal extent");
    eq(size[1],42+Math.round((v[1]+v[3]+v[5]+v[7])*3.25f),"pair whole vertical extent");
    eq(fanX,Math.round((dir==0?v[0]:v[2])*3.25f),"fan origin stable under native TOP START direction");
    eq(arrowX-fanX,Math.round((dir==0?v[4]:v[6])*3.25f),"right-hand painted arrow moves only outward in either direction");
    eq(ap.topMargin-fp.topMargin,Math.round(v[5]*3.25f),"painted arrow moves only down from native anchor");
    check(fan.drawable==nativeFan&&arrows.drawable==nativeArrows&&fan.params==nativeFanParams&&arrows.params==nativeArrowsParams,"dynamic art and native param identity retained");
   }
  }
  edge(fan,8,2,3,1);edge(arrows,1,3,6,2);fan.direction=arrows.direction=0;refreshComposite(pair);
  eq(carrier.params.height,69,"four rounded vertical dp edges consume exact combined pixels");
  StatusBarHeaderSpacingHook.capacity=26;refreshComposite(pair);eq(carrier.params.height,42,"one pixel insufficient rejects pair vertical reserve rather than clipping");eq(margins(fan).topMargin,0,"fan uses native vertical position when pair cannot fit");eq(margins(arrows).topMargin,0,"traffic uses same native vertical position when pair cannot fit");
  StatusBarHeaderSpacingHook.capacity=27;refreshComposite(pair);eq(carrier.params.height,69,"exact combined pixel capacity accepted");StatusBarHeaderSpacingHook.capacity=10000;
  arrows.visibility=View.GONE;refreshComposite(pair);eq(carrier.params.height,52,"gone arrow removes its own reserve from fan too");eq(carrier.params.width,82,"gone arrow leaves only signal horizontal reserve");
  arrows.visibility=View.INVISIBLE;refreshComposite(pair);eq(carrier.params.height,69,"invisible arrow keeps native allocated slot and its reserve");check(arrows.visibility==View.INVISIBLE,"spacing cannot force traffic visible");arrows.visibility=View.VISIBLE;
  for(int gravity:new int[]{17,85,8388693}){((FrameLayout.LayoutParams)arrows.params).gravity=gravity;refreshComposite(pair);check(wifiContract(fan,arrows).equals("gravity"),"unsupported center/end/bottom has explicit contract reason");eq(carrier.params.height,42,"unsupported gravity restores native height");eq(margins(fan).getMarginStart(),0,"unsupported gravity removes prior fan addition");}
  ((FrameLayout.LayoutParams)arrows.params).gravity=-1;refreshComposite(pair);eq(carrier.params.height,69,"supported anchor returning reapplies safe reserve");
  arrows.drawable=new StatusBarAssetDrawable();refreshComposite(pair);check(wifiContract(fan,arrows).equals("native"),"unmatched wrapper exposes its actual original drawable rather than claiming custom art");eq(carrier.params.width,105,"wrapper with no effective custom series preserves native anchor spacing");arrows.drawable=(android.graphics.drawable.Drawable)nativeArrows;
  arrows.drawable.mirrored=true;refreshComposite(pair);check(wifiContract(fan,arrows).equals("mirror"),"auto mirrored art excluded from right-anchor assumption");eq(margins(arrows).getMarginStart(),0,"mirror fallback clears inherited prefix");arrows.drawable.mirrored=false;
  arrows.scale=ImageView.ScaleType.CENTER;refreshComposite(pair);check(wifiContract(fan,arrows).equals("scale"),"unproven scale reports exact reason");arrows.scale=ImageView.ScaleType.FIT_XY;
  arrows.params.width=45;refreshComposite(pair);check(wifiContract(fan,arrows).equals("size"),"mismatched native canvas cannot reuse anchor");arrows.params.width=46;
  arrows.drawable=null;refreshComposite(pair);check(wifiContract(fan,arrows).equals("drawable"),"unbound live drawable cannot claim observation");arrows.drawable=(android.graphics.drawable.Drawable)nativeArrows;
  refreshComposite(pair);restoreChildBoxes(pair);carrier.params.height=48;fan.params.height=arrows.params.height=48;refreshComposite(pair);eq(carrier.params.height,75,"OEM equal dimension rebind recalculates from new native height");
  EDGES.remove(fan);EDGES.remove(arrows);refreshComposite(pair);eq(carrier.params.width,46,"closing restores native shared width");eq(carrier.params.height,48,"closing restores new native height");check(margins(fan).getMarginStart()==0&&margins(fan).bottomMargin==0&&margins(arrows).getMarginStart()==0&&margins(arrows).bottomMargin==0,"closing restores both layers exactly");
  EDGES.clear();for(ViewGroup owner:new ArrayList<>(COMPOSITES.keySet()))refreshComposite(owner);
  check(COMPOSITE_ACTIVE.isEmpty()&&MARGINS.isEmpty(),"closing all spacing restores every active owner once before entering the empty fast path");
  eq(carrier.params.height,48,"off fast path preserves latest OEM box height");initialSemantics=semanticCalls;for(int i=0;i<1200;i++)refreshComposite(pair);eq(semanticCalls,initialSemantics,"after restoration empty callbacks do not rewalk signal/type children");
  StatusBarIconSpacingSpec shared=StatusBarIconSpacingSpec.empty().with("all","wifi.activity_inout",new StatusBarIconSpacingSpec.Insets(0,1,0,2)).with("notification","wifi.activity_inout",new StatusBarIconSpacingSpec.Insets(0,7,0,8));
  eq(StatusBarWifiSpacingPolicy.peerVertical(shared,"all","wifi.signal"),15,"all editor budgets effective notification override not just shared peer");eq(StatusBarWifiSpacingPolicy.peerVertical(shared,"control","wifi.signal"),3,"control uses inherited peer");eq(StatusBarWifiSpacingPolicy.peerVertical(shared,"notification","wifi.signal"),15,"notification uses its explicit peer");
  StatusBarHeaderSpacingObservation observationProfile=new StatusBarHeaderSpacingObservation(100000,10000,20453,0,0,3250,1000,0,0);
  StatusBarWifiSpacingObservation observed=new StatusBarWifiSpacingObservation("asset",observationProfile);StatusBarWifiSpacingObservation parsed=StatusBarWifiSpacingObservation.parse(observed.serialize());check(parsed!=null&&parsed.reason.equals("asset"),"observed unsupported reason survives compact transport");check(parsed.profile.current(11000,100000,20453,0,0,3250,1000,0),"same current device profile accepted");check(!parsed.profile.current(11000,100000,20452,0,0,3250,1000,0),"previous build observation cannot enable new editor");check(!parsed.profile.current(11000,100000,20453,0,1,3250,1000,0),"rotation invalidates carrier evidence");check(!parsed.profile.current(611000,100000,20453,0,0,3250,1000,0),"stale evidence cannot enable controls");check(StatusBarWifiSpacingObservation.parse("native;HSC1|truncated")==null&&StatusBarWifiSpacingObservation.parse("forged;"+observationProfile.serialize())==null,"incomplete and unknown contract status rejected");
  System.out.println("Independent icon child production facades: "+checks+" assertions passed (not device evidence)");
 }
}'''

markers = ['static void observeIcon(View view)', 'static void includeChildBoundary(',
           'private static int[] wifiChildMargins(', 'private static boolean wifiAnchor(', 'private static String wifiContract(',
           'static boolean composite(', 'private static ViewGroup compositeOwner(',
           'static void refreshComposite(', 'private static void observeChildren(',
           'private static void restoreChildBoxes(',
           'private static int[] resizeChildren(', 'private static final class SizeRecord',
           'private static final class MarginRecord']
methods = '\n'.join(extract(JAVA / 'hook/StatusBarIconLayoutHook.java', marker) for marker in markers)
methods += '\n' + extract(JAVA / 'hook/StatusBarAssetsHook.java', 'private static void bindPrivacyTypes(')
SOURCES['ls/augment/com/hook/TestChildSpacingRuntime.java'] = HARNESS.replace('// METHODS', methods)

with tempfile.TemporaryDirectory(prefix='duo-child-spacing-') as tmp:
    folder = Path(tmp)
    paths = []
    for name, source in SOURCES.items():
        path = folder / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        paths.append(str(path))
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '--release', '17', '-d', tmp, *paths,
                    *(str(JAVA / name) for name in ['StatusBarIconSpacingSpec.java', 'StatusBarSurfaceSpec.java', 'StatusBarIconCatalog.java', 'StatusBarWifiSpacingPolicy.java', 'StatusBarWifiSpacingObservation.java', 'StatusBarHeaderSpacingObservation.java'])], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'ls.augment.com.hook.TestChildSpacingRuntime'], check=True, timeout=15)
