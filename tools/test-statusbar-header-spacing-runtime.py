"""Execute production CCHeader capacity/growth/restore bodies with measured-view facades.
These are offline Android-shaped fixtures, not evidence from a running phone.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'


def java_executable(name):
    executable = name + ('.exe' if os.name == 'nt' else '')
    candidates = []
    if os.environ.get('JAVA_HOME'):
        candidates.append(Path(os.environ['JAVA_HOME']) / 'bin' / executable)
    if os.name == 'nt':
        candidates.append(Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin') / executable)
    for candidate in candidates:
        if candidate.is_file():
            return str(candidate)
    resolved = shutil.which(executable)
    if resolved:
        return resolved
    raise RuntimeError('Java executable unavailable: ' + executable + '; set JAVA_HOME to a JDK')


def extract(path, marker):
    source = path.read_text(encoding='utf-8')
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


HARNESS = r'''import java.util.*;import ls.augment.com.*;
public class TestHeaderSpacingRuntime {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}static void eq(int a,int b,String why){check(a==b,why+": "+a+" != "+b);}
 static class Rect {int bottom;}
 static class RectF {float left,top,right,bottom;RectF(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}float height(){return bottom-top;}void offset(float x,float y){left+=x;right+=x;top+=y;bottom+=y;}}
 static class Matrix {float x,y,sx=1,sy=1;void mapRect(RectF bounds){bounds.left*=sx;bounds.right*=sx;bounds.top*=sy;bounds.bottom*=sy;bounds.offset(x,y);}void getValues(float[] result){Arrays.fill(result,0);result[0]=sx;result[2]=x;result[4]=sy;result[5]=y;result[8]=1;}}
 static class DisplayMetrics {float density=3.25f;}static class Resources {DisplayMetrics metrics=new DisplayMetrics();DisplayMetrics getDisplayMetrics(){return metrics;}}
 static class View {static int VISIBLE=0,GONE=8;String id="";ViewGroup parent;ViewGroup.LayoutParams params=new ViewGroup.MarginLayoutParams();int left,top,right,bottom,measuredWidth,measuredHeight,visibility,requests,clipBottom=-1;float alpha=1;Resources resources=new Resources();
  ViewGroup.LayoutParams getLayoutParams(){return params;}ViewGroup getParent(){return parent;}int getVisibility(){return visibility;}float getAlpha(){return alpha;}int getLeft(){return left;}int getTop(){return top;}int getRight(){return right;}int getBottom(){return bottom;}int getWidth(){return right-left;}int getHeight(){return bottom-top;}int getMeasuredWidth(){return measuredWidth;}int getMeasuredHeight(){return measuredHeight;}Resources getResources(){return resources;}
  Matrix matrix=new Matrix();Matrix getMatrix(){return matrix;}int getScrollX(){return 0;}int getScrollY(){return 0;}float getScaleX(){return 1;}float getScaleY(){return 1;}float getTranslationX(){return matrix.x;}float getTranslationY(){return matrix.y;}
  void requestLayout(){requests++;}void addOnLayoutChangeListener(Object listener){}void removeOnLayoutChangeListener(Object listener){}void getLocationOnScreen(int[] result){result[0]=0;result[1]=0;for(View at=this;at!=null;at=at.parent){result[0]+=at.left;result[1]+=at.top;}}boolean getGlobalVisibleRect(Rect rect){int[] p=new int[2];getLocationOnScreen(p);rect.bottom=p[1]+(clipBottom>=0?clipBottom:getHeight());return getWidth()>0&&getHeight()>0;}
 }
 static class ViewGroup extends View {List<View> children=new ArrayList<>();int paddingBottom;void add(View child){children.add(child);child.parent=this;}int getChildCount(){return children.size();}View getChildAt(int i){return children.get(i);}int getPaddingBottom(){return paddingBottom;}
  static class LayoutParams {int width=-2,height=42;}static class MarginLayoutParams extends LayoutParams {int bottomMargin;}
 }
 static View find(View root,String name){if(root.id.equals(name))return root;if(root instanceof ViewGroup)for(View child:((ViewGroup)root).children){View found=find(child,name);if(found!=null)return found;}return null;}
 static State current;static State stateFor(View view,boolean create){return current;}
 static class NotificationAppearanceHook {static float limit=-1;static float iconSpacingBottom(View root){return limit;}}
 static final Map<View,StatusBarIconSpacingSpec.Insets> requests=new IdentityHashMap<>(),effective=new IdentityHashMap<>();
 static class StatusBarIconLayoutHook {
  static boolean hasChildWork(View root){return !requests.isEmpty();}static void restoreInactiveComposites(View root){}
  static int extra;static void refreshHeaderComposites(ViewGroup row){extra=0;for(Map.Entry<View,StatusBarIconSpacingSpec.Insets> item:requests.entrySet()){View child=item.getKey();StatusBarIconSpacingSpec.Insets applied=bounded(child,child.id,item.getValue());effective.put(child,applied);extra=Math.max(extra,Math.round(applied.top*3.25f)+Math.round(applied.bottom*3.25f));}}
  static int headerExtraHeight(View root){return extra;}
  static List<View> spacingChildren(View root){return new ArrayList<>(requests.keySet());}static StatusBarIconSpacingSpec.Insets insets(View child){return requests.getOrDefault(child,StatusBarIconSpacingSpec.ZERO);}
 }
 // BOUNDED
 static class State {
  java.lang.ref.WeakReference<ViewGroup> header,row=new java.lang.ref.WeakReference<>(null);Object layout=new Object();ViewGroup.LayoutParams params;int nativeHeight,appliedHeight,capacity=-1;boolean applied,busy,awaitingNativeLayout,requestedVertical;int publications;long reportedAt,lastOccupancy;String signature="";
  final Rect occupancyVisible=new Rect();final int[] occupancyLocation=new int[2];final float[] occupancyMatrix=new float[9];
  State(ViewGroup value){header=new java.lang.ref.WeakReference<>(value);}void publish(ViewGroup root,ViewGroup target,int safe,int extra){publications++;}
  void invalidateCapacity(){capacity=-1;}
  // REFRESH
  // SAFE
  // RESTORE
  // OCCUPANCY
  // BOX
  // PREPARE
  // BEFORE_DRAW
 }
 static View box(String id,int l,int t,int r,int b){View v=new View();v.id=id;v.left=l;v.top=t;v.right=r;v.bottom=b;v.measuredWidth=r-l;v.measuredHeight=b-t;return v;}
 public static void main(String[] args){
  ViewGroup root=new ViewGroup();root.right=988;root.bottom=374;ViewGroup parent=new ViewGroup();parent.left=381;parent.right=988;parent.bottom=373;root.add(parent);ViewGroup row=new ViewGroup();row.id="status_icons_group";row.top=150;row.right=607;row.bottom=192;row.measuredHeight=42;parent.add(row);View footer=box("qs_footer_actions_container",0,275,607,373);parent.add(footer);
  View signal=box("wifi.signal",0,0,46,42),activity=box("wifi.activity_inout",0,0,46,42);row.add(signal);row.add(activity);requests.put(signal,new StatusBarIconSpacingSpec.Insets(8,2,3,1));requests.put(activity,new StatusBarIconSpacingSpec.Insets(1,3,6,2));current=new State(root);current.refresh();
  eq(current.capacity,83,"safe height stops before native footer, not header bottom");eq(row.params.height,59,"EXACT native 42px row gets real 17px vertical reservation");eq(signal.params.height,42,"signal glyph layout height remains native");eq(activity.params.height,42,"activity glyph layout height remains native");
  check(7+42+3<=row.params.height&&10+42+7<=row.params.height,"both distinct four-edge rules fit fully inside enlarged row");
  for(int i=0;i<100;i++)current.refresh();eq(row.params.height,59,"repeated refresh does not accumulate row extent");
  row.bottom=row.top+row.params.height;current.refresh();eq(current.capacity,83,"capacity uses native baseline rather than already-grown row");
  requests.clear();View mobile=box("mobile1.signal",0,0,65,42),type=box("mobile1.type",0,0,65,42);row.add(mobile);row.add(type);requests.put(mobile,new StatusBarIconSpacingSpec.Insets(6,2,2,1));requests.put(type,new StatusBarIconSpacingSpec.Insets(1,1,5,3));current.refresh();eq(row.params.height,55,"mobile signal/type reserve the larger 13px vertical extent once");check(3+42+10<=row.params.height,"type has full top 1dp and bottom 3dp without clipping");
  requests.clear();current.refresh();eq(row.params.height,42,"closing restores original row height");
  requests.put(signal,new StatusBarIconSpacingSpec.Insets(8,2,3,1));current.refresh();current.restoreNative();eq(row.params.height,42,"native update starts from unmodified height");row.params.height=52;current.refresh();eq(current.nativeHeight,52,"native writer can choose former applied height as new baseline");eq(row.params.height,62,"spacing added to latest native baseline");requests.clear();current.refresh();eq(row.params.height,52,"closing restores latest native baseline");
  row.params.height=42;current.restoreNative();current.refresh();requests.put(signal,new StatusBarIconSpacingSpec.Insets(8,24,3,24));current.refresh();eq(row.params.height,42,"oversized vertical request cannot cross the footer or shrink glyph");StatusBarIconSpacingSpec.Insets fallback=effective.get(signal);check(fallback.start==8&&fallback.end==3&&fallback.top==0&&fallback.bottom==0,"over-capacity rejects vertical pair while retaining independent horizontal edges");
  footer.top=195;requests.put(signal,new StatusBarIconSpacingSpec.Insets(8,2,3,1));current.refresh();eq(current.capacity,3,"tight native profile exposes only actual spare height");eq(row.params.height,42,"unfit representative request preserves native vertical placement");
  footer.top=190;current.refresh();eq(current.capacity,0,"footer intersecting original row cannot be ignored");eq(row.params.height,42,"pre-existing footer intersection cannot become a larger overlap");
  footer.top=192;current.refresh();eq(current.capacity,0,"footer exactly touching original bottom leaves no vertical expansion");
  footer.top=275;footer.alpha=0;current.refresh();eq(current.capacity,83,"transparent VISIBLE footer still reserves its space");long occupied=State.occupancy(row,root);footer.alpha=1;eq((int)State.occupancy(row,root),(int)occupied,"alpha fade never changes safe occupancy");
  footer.visibility=4;current.refresh();eq(current.capacity,83,"INVISIBLE footer still occupies native layout space");occupied=State.occupancy(row,root);footer.visibility=8;check(State.occupancy(row,root)!=occupied,"GONE visibility change is observable even with identical root/row bounds");
  footer.visibility=8;current.refresh();eq(current.capacity,181,"native hidden footer no longer consumes layout space");eq(row.params.height,52,"native capacity becoming available resumes saved vertical rule");
  requests.put(signal,new StatusBarIconSpacingSpec.Insets(8,20,3,20));current.refresh();eq(row.params.height,172,"large valid request may use actual GONE-footer capacity");occupied=State.occupancy(row,root);footer.visibility=0;check(State.occupancy(row,root)!=occupied,"footer return invalidates pre-draw occupancy without layout change");current.refresh();eq(row.params.height,42,"returning footer rejects oversized vertical pair before another frame");requests.put(signal,new StatusBarIconSpacingSpec.Insets(8,2,3,1));
  footer.visibility=0;footer.top=275;footer.left=700;footer.right=750;current.refresh();eq(current.capacity,181,"sideways non-overlapping sibling does not limit row");footer.left=0;footer.right=607;
  footer.visibility=8;View date=box("date_view",0,260,500,373);root.add(date);current.refresh();eq(current.capacity,68,"wide root-level date crossing right column bounds safe expansion");occupied=State.occupancy(row,root);date.matrix.y=-70;check(State.occupancy(row,root)!=occupied,"animated root-level sibling invalidates occupancy without layout");current.refresh();eq(current.capacity,0,"translated date touching original icon row leaves no extra height");date.visibility=8;
  View clock=box("time_group",0,20,988,140);root.add(clock);current.refresh();eq(current.capacity,181,"large clock above native icon region does not invent a taller native baseline");eq(current.nativeHeight,42,"clock coexistence preserves original 42px baseline");clock.bottom=180;current.refresh();eq(current.capacity,0,"large clock overlapping native icon region blocks expansion");clock.visibility=8;footer.visibility=0;
  current.refresh();current.prepareNative();eq(current.capacity,-1,"native writer invalidates previous capacity immediately");check(current.awaitingNativeLayout,"native write waits for fresh layout geometry");row.params.height=44;current.refresh();eq(row.params.height,44,"no old capacity reapplication before native layout");check(!current.beforeDraw(),"fresh measured frame reserves space before it can be drawn");eq(current.nativeHeight,44,"pre-draw uses newly written native baseline");eq(row.params.height,54,"new baseline receives representative vertical margin without a clipped frame");requests.clear();current.refresh();current.restoreNative();row.params.height=42;current.refresh();requests.put(signal,new StatusBarIconSpacingSpec.Insets(8,2,3,1));
  ViewGroup.LayoutParams replacement=new ViewGroup.MarginLayoutParams();replacement.height=45;row.params=replacement;current.refresh();eq(current.nativeHeight,45,"replacement layout params capture fresh OEM baseline");eq(row.params.height,55,"replacement params grow once");
  current.restoreNative();row.params.height=-2;current.refresh();eq(row.params.height,-2,"unsupported OEM wrap-content mode is not silently made fixed");
  StatusBarHeaderSpacingObservation value=new StatusBarHeaderSpacingObservation(100000,5000,20452,0,0,3250,1000,0,25);
  check(StatusBarHeaderSpacingObservation.parse(value.serialize()).current(5100,100001,20452,0,0,3250,1000,0),"capacity round trip and current profile");check(!value.current(5100,100001,20452,0,1,3250,1000,0),"rotation invalidates capacity");check(!value.current(5100,100001,20452,0,0,3250,1300,0),"font profile invalidates capacity");check(!value.current(610001,100001,20452,0,0,3250,1000,0),"stale capacity rejected");eq(value.maximum(3),22,"slider maximum reserves the opposite edge");check(!value.accepts(new StatusBarIconSpacingSpec.Insets(0,24,0,2)),"UI rejects combined vertical overflow");
  check(StatusBarHeaderSpacingObservation.child("mobile1.type")&&!StatusBarHeaderSpacingObservation.child("privacy.dot"),"header policy cannot take over independent privacy windows");
  row.params.height=42;current.restoreNative();current.refresh();NotificationAppearanceHook.limit=210;current.refresh();eq(current.capacity,18,"clock viewport budget is an independent absolute bottom");NotificationAppearanceHook.limit=190;current.refresh();eq(current.capacity,0,"unavailable clock space cannot grow the native row");NotificationAppearanceHook.limit=-1;current.refresh();eq(current.capacity,83,"native clock mode releases only its own absolute constraint");
  row.matrix.y=100;check(!current.beforeDraw(),"target-only translation invalidates occupancy without native layout");eq(current.capacity,0,"translated target cannot reserve space over its footer");row.matrix.y=0;current.refresh();current.beforeDraw();
  parent.matrix.sy=2;check(!current.beforeDraw(),"ancestor-only matrix change invalidates occupancy without layout");eq(current.capacity,0,"scaled ancestor respects root visible bottom");parent.matrix.sy=1;current.refresh();current.beforeDraw();
  root.clipBottom=192;check(!current.beforeDraw(),"visible clipping change invalidates occupancy without layout");eq(current.capacity,0,"viewport shrinking to original row bottom rejects extra vertical spacing");root.clipBottom=-1;current.refresh();current.beforeDraw();
  NotificationAppearanceHook.limit=190;check(!current.beforeDraw(),"clock viewport limit change invalidates occupancy without layout");eq(current.capacity,0,"clock-only limit shrinks shared spacing capacity");NotificationAppearanceHook.limit=-1;current.refresh();
  requests.clear();current.refresh();eq(row.params.height,42,"turning off after cached capacity transitions restores latest native row height");
  System.out.println("Native header spacing production facades: "+checks+" assertions passed (not device evidence)");
 }
}'''
path = JAVA / 'hook/StatusBarHeaderSpacingHook.java'
for placeholder, marker in [('BOUNDED', 'static StatusBarIconSpacingSpec.Insets bounded('),
                            ('REFRESH', 'void refresh(){'), ('SAFE', 'private static int safeHeight('),
                            ('RESTORE', 'void restoreNative(){')]:
    HARNESS = HARNESS.replace('// ' + placeholder, extract(path, marker))
HARNESS = HARNESS.replace('// OCCUPANCY', extract(path, 'private long occupancy(') + '\n' + extract(path, 'private long transformInput('))
HARNESS = HARNESS.replace('State.occupancy(', 'current.occupancy(')
HARNESS = HARNESS.replace('// BOX', extract(path, 'private static RectF boxInRoot('))
HARNESS = HARNESS.replace('// PREPARE', extract(path, 'void prepareNative(){'))
HARNESS = HARNESS.replace('// BEFORE_DRAW', extract(path, 'private boolean beforeDraw(){'))
with tempfile.TemporaryDirectory(prefix='duo-header-spacing-') as tmp:
    java = Path(tmp) / 'TestHeaderSpacingRuntime.java'
    java.write_text(HARNESS, encoding='utf-8')
    subprocess.run([java_executable('javac'), '-encoding', 'UTF-8', '--release', '17', '-d', tmp, str(java),
                    *(str(JAVA / name) for name in ['StatusBarHeaderSpacingObservation.java', 'StatusBarIconSpacingSpec.java', 'StatusBarSurfaceSpec.java', 'StatusBarIconCatalog.java'])], check=True)
    subprocess.run([java_executable('java'), '-cp', tmp, 'TestHeaderSpacingRuntime'], check=True, timeout=15)
