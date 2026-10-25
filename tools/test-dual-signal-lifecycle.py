"""Run production pair construction, identity matching and ownership against fake OEM views.
Actual Android tint delivery and GPU rendering belong to their separate device/framework tests.
"""
from pathlib import Path
import subprocess
import tempfile
import re
import argparse

ROOT=Path(__file__).resolve().parents[1]
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--source-root',type=Path,default=ROOT);args=parser.parse_args()
source=(args.source_root/'android/app/src/main/java/ls/augment/com/hook/RedMagicSystemUiHook.java').read_text(encoding='utf-8')
full_source=source
circle=re.search(r'boolean circle\s*=\s*(.*?);',source,re.S)[1].replace('FeatureSettings.enabled(view.getContext(),ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)','group').replace('StatusBarGridHook.ownsConnectivityReplacement(view)','ownsReplacement')
stack=re.search(r'boolean stack = (.*);',source)[1].replace('FeatureSettings.enabled(view.getContext(), SystemUiOptions.SIGNAL_DUAL)','enabled')
compact=re.search(r'!pair.apply\((.*?)\)\)',source)[1]
style_geometry=re.search(r'b\.append\(":ios="\)\.append\((.*?)\);',source)
style_geometry=style_geometry[1].replace('iosStyle()','"1".equals(FeatureSettings.style)') if style_geometry else 'false'
source=source[source.index('private static final class SignalPair'):source.index('/** Compact bars')]
def method(marker,text=source):
    start=text.index(marker)
    end=text.index('{',start)+1
    depth=1
    while depth:
        depth+=(text[end]=='{')-(text[end]=='}')
        end+=1
    return text[start:end]
harness=r'''
import java.util.*;
import java.lang.ref.WeakReference;
import ls.augment.com.ConnectivityIconState;
public class TestDualLifecycle {
 static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static boolean[] decision(boolean bar,boolean grid,boolean positionOnly,boolean group,boolean enabled){
  return decision(bar,grid,positionOnly,group,enabled,false);
 }
 static boolean[] decision(boolean bar,boolean grid,boolean positionOnly,boolean group,boolean enabled,boolean ownsReplacement){
  boolean circle=/* CIRCLE */;boolean stack=/* STACK */;return new boolean[]{stack,/* COMPACT */};
 }
 static class Rect{int left=0,top=0,right=112,bottom=42;}
 public static class View {static final int VISIBLE=0;float transition=1;int minimum=65,visibility=0,measuredWidth=65,subId=-1;boolean layoutRequested;View parent;ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();Map<String,View> children=new HashMap<>();
  public int getSubId(){return subId;}ViewTreeObserver observer=new ViewTreeObserver();ViewTreeObserver getViewTreeObserver(){return observer;}
  float getTransitionAlpha(){return transition;}void setTransitionAlpha(float x){transition=x;}
  int getMinimumWidth(){return minimum;}void setMinimumWidth(int x){minimum=x;}
  ViewGroup.LayoutParams getLayoutParams(){return params;}void setLayoutParams(ViewGroup.LayoutParams p){params=p;requestLayout();}
  int getPaddingRight(){return 0;}int getWidth(){return measuredWidth;}int getMeasuredWidth(){return measuredWidth;}int getHeight(){return 42;}
  View getParent(){return parent;}boolean isLayoutRequested(){return layoutRequested;}Object getContext(){return this;}
  void requestLayout(){layoutRequested=true;}void finishLayout(){measuredWidth=params.width<0?65:params.width;layoutRequested=false;for(View child:children.values())child.finishLayout();}
  Object getDrawable(){return this;}void invalidate(){}Overlay overlay=new Overlay();Overlay getOverlay(){return overlay;}}
 static class ViewGroup extends View{static class LayoutParams{int width=65;}}
 static class ViewTreeObserver{interface OnGlobalLayoutListener{void onGlobalLayout();}boolean removed;boolean isAlive(){return true;}void addOnGlobalLayoutListener(OnGlobalLayoutListener l){}void removeOnGlobalLayoutListener(OnGlobalLayoutListener l){removed=true;}}
 static class Overlay{boolean removed,failRemove;void add(Object d){}void remove(Object d){removed=true;if(failRemove)throw new IllegalStateException("injected overlay failure");}}
 static class Geometry{float left,top;float height(){return 42;}}
 static class Plan{boolean hasSpacing;}
 static class Layout{Plan plan=new Plan();}
 static class Drawing{static int constructions;boolean refreshed,readyToDraw;float gridScale=1;int inputVersion;Geometry reference=new Geometry();Layout currentLayout=new Layout();Runnable invalidIdentity;
  final int capturedOwnerWidth,capturedOtherWidth;
  final View owner,otherOwner;final ConnectivityIconSource source;String fallbackReason="slot_unknown";
  Drawing(View owner,View otherOwner,View position,View first,View second,ConnectivityIconSource source){constructions++;this.owner=owner;this.otherOwner=otherOwner;this.source=source;capturedOwnerWidth=owner.getWidth();capturedOtherWidth=otherOwner==null?-1:otherOwner.getWidth();}
  void refresh(){refreshed=true;}Rect contentBounds(){return reference==null?null:new Rect();}
  Geometry nativeGeometry(){return new Geometry();}Geometry geometry(){return reference;}Layout layout(Geometry g){return g==null?null:currentLayout;}
  String inputs(){return "native:"+inputVersion+":"+/* STYLE_GEOMETRY */;}
  // PLAN_INPUTS
  void setBounds(int a,int b,int c,int d){}void invalidateSelf(){}}
 static class StatusBarIconLayoutHook{static View releaseNext;static boolean releaseStackedChildBoundaries(View v){if(v!=releaseNext)return false;releaseNext=null;v.requestLayout();return true;}static void refreshComposite(View v){}}
 static class FeatureSettings{static String lastDiagnostic,style="0";static void diagnostic(Object context,String key,String value){lastDiagnostic=value;}static Snapshot snapshot(Object c){return new Snapshot();}static boolean enabled(Object c,String key){return true;}}
 static class Snapshot{String get(String key){return key.equals(SystemUiOptions.SIGNAL_DUAL_STYLE)?FeatureSettings.style:"saved-spacing";}}
 static class ConfigSchema{static String SYSTEMUI_MASTER="master";}
 static class SystemUiOptions{static String SIGNAL_DUAL_STYLE="style";}
 static class RedMagicLegacyUiHook{static boolean positionSizeOnly(Object c){return false;}}
 static class StatusBarAssetsHook{static String surfaceFor(View v){return "main";}static boolean virtualWholeReady(View v,String key){return false;}}
 static class DualSignalTint{static void watch(View owner,View signal){}static void unwatch(View owner){}static Integer color(View owner,View signal){return 0xff112233;}}
 static class ConnectivityIconSource{ConnectivityIconState state;ConnectivityIconSource(int active,boolean single){state=radioState(active,single);}}
 static ConnectivityIconState radioState(int active,boolean single){return new ConnectivityIconState(50,false,false,0,false,active,
   single?List.of(new ConnectivityIconState.Sim(2,0,4)):List.of(new ConnectivityIconState.Sim(1,1,2),new ConnectivityIconState.Sim(2,0,4)));}
 static class SystemClock{static long now=1000;static long uptimeMillis(){return now;}}
 static class RootState{Pair pair;long checked;
  void refreshPair(View one,View two,ConnectivityIconSource signalSource,boolean forced){
   // ROOT_THROTTLE
   checked=SystemClock.uptimeMillis();
   // ROOT_PAIR_SELECTION
  }
 }static Map<View,RootState> ROOTS=new HashMap<>();
 static View find(View v,String id){return v==null?null:v.children.get(id);}
 static Object field(Object owner,String name){return owner instanceof View?((View)owner).subId:null;}
 static class Fixture{
  final View one=new View(),two,first=new View(),second;final ConnectivityIconSource source;
  Fixture(boolean single,int active){two=single?null:new View();second=single?null:new View();source=new ConnectivityIconSource(active,single);
   one.subId=2;one.params.width=-2;first.transition=.7f;first.parent=one;one.children.put("mobile_signal",first);
   ViewGroup root=new ViewGroup();one.parent=root;
   if(two!=null){two.subId=1;two.transition=.6f;two.parent=root;second.parent=two;two.children.put("mobile_signal",second);}
  }
 }
 static class Pair{
  // FIELDS
  boolean ready=true;
  Pair(){this(false);}
  Pair(boolean single){this(new Fixture(single,2));}
  Pair(Fixture fixture){this(fixture.one,fixture.two,fixture.first,fixture.second,fixture.source);}
  // CONSTRUCTOR
  // CREATE
  boolean canDraw(){return ready&&drawable.geometry()!=null;}
  void publish(String reason){published=reason;}
  void finishLayout(){anchor.finishLayout();if(collapsed!=null)collapsed.finishLayout();first.finishLayout();if(second!=null)second.finishLayout();nativeLayout.onGlobalLayout();}
  // METHODS
 }
 static boolean settle(Pair pair,boolean compact){for(int i=0;i<6;i++){if(!pair.apply(compact))return false;if(pair.drawable.readyToDraw)return true;pair.finishLayout();}throw new AssertionError("layout never settled");}
 public static void main(String[] args){
  {Fixture bootstrap=new Fixture(false,2);RootState state=new RootState();int before=Drawing.constructions;
  state.refreshPair(bootstrap.one,bootstrap.two,bootstrap.source,false);
  check(state.pair!=null&&Drawing.constructions==before+1,"stable cold-start native views create a pair without an extra layout loop");
  check(settle(state.pair,true),"old dual composite is ready before card count changes");
  check(bootstrap.one.getWidth()==112&&bootstrap.two.getWidth()==0,"fixture keeps the real expanded and collapsed measured widths");
  SystemClock.now+=201;before=Drawing.constructions;
  state.refreshPair(bootstrap.one,null,bootstrap.source,false);
  check(state.pair==null&&Drawing.constructions==before,"dual-to-single replacement waits before constructing from stale measured widths");
  check(bootstrap.one.params.width==-2&&bootstrap.two.params.width==65&&bootstrap.first.transition==.7f&&bootstrap.two.transition==.6f,
    "old native widths and visible signal strengths are restored before waiting");
  check(bootstrap.one.getWidth()==112&&bootstrap.two.getWidth()==0,"restored layout parameters do not pretend the OEM has completed measure");
  SystemClock.now+=16;state.refreshPair(bootstrap.one,null,bootstrap.source,false);
  check(state.pair==null&&Drawing.constructions==before,"another frame cannot construct while native layout is still requested");
  bootstrap.one.finishLayout();bootstrap.two.finishLayout();SystemClock.now+=16;
  state.refreshPair(bootstrap.one,null,bootstrap.source,false);
  check(state.pair!=null&&state.pair.two==null&&Drawing.constructions==before+1,
    "the first naturally completed layout creates the single pair without waiting for the 200ms refresh throttle");
  check(state.pair.drawable.capturedOwnerWidth==65&&state.pair.nativeWidthBudget==65,
    "single geometry and budget capture the restored OEM width, not the former composite");
  check(settle(state.pair,true),"new single composite settles");
  SystemClock.now+=201;before=Drawing.constructions;
  state.refreshPair(bootstrap.one,bootstrap.two,bootstrap.source,false);
  check(state.pair==null&&Drawing.constructions==before,"single-to-dual replacement also waits for the expanded owner to restore");
  bootstrap.one.finishLayout();bootstrap.two.finishLayout();SystemClock.now+=16;
  state.refreshPair(bootstrap.one,bootstrap.two,bootstrap.source,false);
  check(state.pair!=null&&state.pair.two==bootstrap.two&&Drawing.constructions==before+1,
    "single-to-dual settles immediately on its first fresh natural frame");
  check(state.pair.drawable.capturedOwnerWidth==65&&state.pair.drawable.capturedOtherWidth==65&&state.pair.nativeWidthBudget==130,
    "paired geometry captures both native SIM allocations without inheriting expanded or zero widths");
  check(settle(state.pair,true),"restored dual composite settles");
  View rebound=new View();rebound.parent=bootstrap.one;rebound.requestLayout();bootstrap.one.children.put("mobile_signal",rebound);
  SystemClock.now+=201;before=Drawing.constructions;
  state.refreshPair(bootstrap.one,bootstrap.two,bootstrap.source,false);
  check(state.pair==null&&Drawing.constructions==before,"rebinding the native ImageView declines geometry capture while the new child awaits layout");
  bootstrap.one.finishLayout();bootstrap.two.finishLayout();SystemClock.now+=16;
  state.refreshPair(bootstrap.one,bootstrap.two,bootstrap.source,false);
  check(state.pair!=null&&state.pair.first==rebound&&Drawing.constructions==before+1,"a settled rebound child becomes the new native signal source");
  state.pair.restore();bootstrap.one.finishLayout();bootstrap.two.finishLayout();}
  for(int initial:new int[]{2,1}){
   Pair physical=new Pair(new Fixture(false,initial));
   check(physical.anchor==physical.one&&physical.collapsed==physical.two&&physical.anchorSignal==physical.first,"real constructor keeps SIM1/SIM2 owners independent of initial active data");
   for(int active:new int[]{2,1,2}){
    int previous=physical.drawable.source.state.activeDataSubscription;String before=physical.drawable.planInputs();physical.drawable.source.state=radioState(active,false);
    check(physical.matches(physical.one,physical.two,physical.drawable.source),"a data switch retains the existing physical native pair");
    if(active!=previous)check(!before.equals(physical.drawable.planInputs()),"production plan inputs track changed active subscription");
    check(settle(physical,false),"same pair refreshes after a data switch");
    check(physical.anchor==physical.one&&physical.collapsed==physical.two,"render ownership does not swap after refresh");
   }
   physical.restore();
  }
  for(boolean grid:new boolean[]{false,true})for(boolean position:new boolean[]{false,true})for(boolean group:new boolean[]{false,true})for(boolean replacement:new boolean[]{false,true}){
   boolean[] enabled=decision(true,grid,position,group,true,replacement);
   check(enabled[0]==!replacement,"dual signal yields only to a placed replacement, not its saved configuration");
   check(!decision(true,grid,position,group,false,replacement)[0],"dual switch off restores native signal in every preset");
   check(!decision(false,grid,position,group,true,replacement)[0],"non-statusbar roots remain unchanged");
   check(enabled[1]==!grid,"suspended grid must reclaim native collapsed SIM width");
  }
  check(decision(true,false,false,true,true,false)[0],"crowding restores dual SIM even when three-in-one remains configured");
  check(decision(true,false,false,true,true,false)[1],"component fallback releases grid width ownership");
  check(!decision(true,true,false,true,true,true)[0],"placed three-in-one owns connectivity");
  check(decision(true,true,false,true,true,false)[0],"components without active battery replacement keep dual SIM rendering");
  for(boolean compact:new boolean[]{false,true}){
   Pair pair=new Pair();View type=new View(),arrows=new View();type.transition=.8f;arrows.transition=.5f;arrows.visibility=8;
   pair.anchor.children.put("mobile_type",type);pair.anchor.children.put("data_inout",arrows);
   for(int i=0;i<100;i++){
    check(settle(pair,compact),"pair applies after its host layout completes");
    check(pair.anchor.params.width==112,"badges receive layout width");
    check(type.transition==0&&arrows.transition==0&&pair.anchorSignal.transition==0,"OEM overlay copies suppressed");
    check(pair.collapsed.transition==0,"secondary native slot suppressed");
    check(arrows.visibility==8,"native activity visibility untouched");
    check(pair.collapsed.params.width==(compact?0:65),"only non-grid path collapses allocation");
   }
   pair.restore();
   check(pair.anchor.params.width==-2&&pair.collapsed.params.width==65,"native widths restored");
   check(pair.anchorSignal.transition==.7f&&pair.collapsed.transition==.6f,"signal render alpha restored");
   check(type.transition==.8f&&arrows.transition==.5f,"network and traffic alpha restored");
   check(pair.badges.isEmpty()&&pair.anchor.overlay.removed,"overlay state released");
  }
  Pair unready=new Pair();unready.ready=false;check(!unready.apply(false)&&unready.anchor.params.width==-2,"unready source remains native");
  for(boolean compact:new boolean[]{false,true}){
   Pair single=new Pair(true);
   check(settle(single,compact),"single physical SIM supported without a second native view");
   single.restore();check(single.anchor.params.width==-2&&single.anchorSignal.transition==.7f,"single SIM restores native state");
  }
  Pair changed=new Pair();View type=new View();changed.anchor.children.put("mobile_type",type);settle(changed,false);
  type.transition=.4f;settle(changed,false);changed.restore();check(type.transition==.4f,"later native render alpha becomes restore baseline");
  Pair waiting=new Pair();View badge=new View();badge.transition=.8f;waiting.anchor.children.put("mobile_type",badge);
  check(waiting.apply(true)&&waiting.ownedWait>=0&&!waiting.drawable.readyToDraw,"host width mutation waits for a completed OEM layout");
  check(waiting.anchorSignal.transition==.7f&&waiting.collapsed.transition==.6f&&badge.transition==.8f,"native renders remain visible while layout is pending");
  check(waiting.apply(true)&&!waiting.drawable.readyToDraw,"repeated apply cannot skip the pending layout epoch");
  waiting.nativeLayout.onGlobalLayout();check(waiting.apply(true)&&!waiting.drawable.readyToDraw,"global callback alone cannot bypass outstanding layout requests");
  waiting.finishLayout();check(waiting.apply(true)&&waiting.drawable.readyToDraw&&badge.transition==0,"settled layout commits overlay suppression");
  waiting.restore();waiting.restore();check(waiting.closed&&waiting.observer.removed&&waiting.anchor.params.width==-2,"restore is idempotent and releases the layout listener");
  check(!waiting.apply(true)&&waiting.anchorSignal.transition==.7f,"closed pair cannot reacquire native render ownership");
  Pair released=new Pair();check(settle(released,true),"baseline pair ready before public boundary handoff");
  StatusBarIconLayoutHook.releaseNext=released.anchor;
  check(released.apply(true)&&released.nativeWait>=0&&released.drawable.reference==null,"public boundary release requests a fresh native geometry pass");
  check(released.anchor.params.width==-2&&released.collapsed.params.width==65&&released.anchorSignal.transition==.7f,"boundary handoff releases owned widths and alpha");
  check(released.apply(true)&&!released.drawable.readyToDraw,"handoff does not draw before native layout completes");
  released.finishLayout();check(settle(released,true)&&released.drawable.reference!=null,"native geometry is reacquired after completed layout");
  Pair nativeChanged=new Pair();check(settle(nativeChanged,false),"baseline ready before native input change");nativeChanged.drawable.inputVersion++;
  check(nativeChanged.apply(false)&&nativeChanged.nativeWait>=0&&nativeChanged.anchor.params.width==-2,"native input change restores host before recapturing geometry");
  nativeChanged.finishLayout();check(settle(nativeChanged,false),"native input change settles without recursive expansion");
  nativeChanged.anchor.params.width=140;nativeChanged.anchor.requestLayout();nativeChanged.drawable.inputVersion++;
  check(nativeChanged.apply(false)&&nativeChanged.anchor.params.width==140,"fresh OEM width is preserved during native handoff");
  nativeChanged.finishLayout();check(settle(nativeChanged,false),"pair can render from a changed OEM baseline");nativeChanged.restore();
  check(nativeChanged.anchor.params.width==140,"restore preserves the latest OEM width instead of the original width");
  Pair styleChanged=new Pair();check(settle(styleChanged,true),"Honor baseline is ready before iOS selection");
  for(String style:new String[]{"1","0","1","0"}){
   String old=styleChanged.drawable.inputs();FeatureSettings.style=style;
   check(!old.equals(styleChanged.drawable.inputs()),"actual production geometry inputs change when switching Honor and iOS");
   check(styleChanged.apply(true)&&styleChanged.nativeWait>=0,"style switch requests a native geometry pass instead of painting inside the old frame");
   check(styleChanged.anchor.params.width==-2&&styleChanged.collapsed.params.width==65,"style remeasurement first restores the OEM width of both physical SIMs");
   check(!styleChanged.drawable.readyToDraw&&styleChanged.anchorSignal.transition==.7f,"native strength stays visible while style geometry awaits layout");
   styleChanged.finishLayout();check(settle(styleChanged,true),"style switch settles and commits the new reference once");
  }
  styleChanged.restore();check(styleChanged.anchor.params.width==-2&&styleChanged.collapsed.params.width==65,"repeated style switches retain reversible native ownership");
  Pair crowded=new Pair();crowded.drawable.currentLayout.plan.hasSpacing=true;crowded.nativeWidthBudget=90;
  check(!crowded.apply(true)&&"capacity".equals(crowded.stopReason),"spacing exceeding native SIM allocation declines overlay");
  check(crowded.anchor.params.width==-2&&crowded.anchorSignal.transition==.7f&&"native_fallback:space_insufficient".equals(FeatureSettings.lastDiagnostic),"capacity fallback leaves native state and records the reason");
  Fixture shared=new Fixture(false,2);
  Pair owner=Pair.create(shared.one,shared.two,shared.source);
  check(owner!=null&&Pair.create(shared.one,shared.two,shared.source)==null,"overlapping roots cannot capture already owned mobile nodes");
  check(settle(owner,true),"owned pair settles");
  owner.anchor.overlay.failRemove=true;owner.restore("disabled");
  check(owner.closed&&!owner.drawable.readyToDraw&&owner.drawable.invalidIdentity==null,"failed cleanup closes and cancels callbacks first");
  check(owner.first.transition==.7f&&owner.collapsed.params.width==65&&owner.anchor.params.width==-2,"overlay failure does not skip restoring native alpha and widths");
  check(owner.restoreFailure.contains("overlay:IllegalStateException"),"cleanup phase failure is recorded");
  owner.restore();shared.one.overlay.failRemove=false;
  check(Pair.create(shared.one,shared.two,shared.source)!=null,"cleanup releases ownership even when an operation fails");
  System.out.println("PASS dual signal lifecycle: "+checks+" assertions");
 }
}
'''
harness=harness.replace('/* CIRCLE */',circle).replace('/* STACK */',stack).replace('/* COMPACT */',compact).replace('/* STYLE_GEOMETRY */',style_geometry)
# Keep the lifecycle fields and ownership helpers in sync with production. The
# fake views model asynchronous measure/layout rather than assuming apply is synchronous.
fields=source[source.index('final View one, two;'):source.index('SignalPair(View one,')]
fields=fields.replace('ImageView','View').replace('SignalDrawable','Drawing').replace('SignalPair','Pair')
markers=['boolean matches(', 'private static Object subscription(', 'boolean apply(', 'static boolean nativeLayoutSettled(', 'boolean layoutSettled()', 'boolean needsRefresh()', 'void showNative()', 'void restoreAnchorWidth()',
         'void beginNativeLayout(', 'boolean nativeSpace(', 'void restore()', 'void restore(String reason)', 'void restoreWidth()',
         'private static boolean occupied(', 'private void releaseOwner(', 'private void cleanup(']
def adapt(code):return code.replace('ImageView','View').replace('SignalDrawable','Drawing').replace('SignalPair','Pair')
harness=harness.replace('// FIELDS',fields).replace('// CONSTRUCTOR',adapt(method('SignalPair(View one,'))).replace('// METHODS',adapt('\n'.join(method(marker) for marker in markers)))
harness=harness.replace('// CREATE',adapt(method('static SignalPair create(')))
harness=harness.replace('// ROOT_PAIR_SELECTION',adapt(method('if (pair == null || !pair.matches(',full_source)))
throttle=re.search(r'if \(!forced && SystemClock\.uptimeMillis\(\) - checked < 200[^\n]+',full_source)[0]
harness=harness.replace('// ROOT_THROTTLE',adapt(throttle))
harness=harness.replace('// PLAN_INPUTS',method('String planInputs()',full_source).replace('SignalPair','Pair'))
with tempfile.TemporaryDirectory(prefix='dual-signal-lifecycle-') as tmp:
    path=Path(tmp)/'TestDualLifecycle.java'
    path.write_text(harness,encoding='utf-8')
    subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',tmp,str(path),str(args.source_root/'android/app/src/main/java/ls/augment/com/ConnectivityIconState.java'),str(args.source_root/'android/app/src/main/java/ls/augment/com/StatusBarIconSpacingSpec.java'),
                    '-sourcepath',str(args.source_root/'android/app/src/main/java')],check=True)
    subprocess.run([str(JAVA/'java.exe'),'-cp',tmp,'TestDualLifecycle'],check=True)
