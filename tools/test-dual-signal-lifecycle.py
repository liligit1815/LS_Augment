"""Run the production pair's apply/restore methods against OEM view state changes."""
from pathlib import Path
import subprocess
import tempfile
import re

ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/hook/RedMagicSystemUiHook.java').read_text(encoding='utf-8')
circle=re.search(r'boolean circle\s*=\s*(.*?);',source,re.S)[1].replace('FeatureSettings.enabled(view.getContext(),ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)','group').replace('StatusBarGridHook.ownsConnectivityReplacement(view)','ownsReplacement')
stack=re.search(r'boolean stack = (.*);',source)[1].replace('FeatureSettings.enabled(view.getContext(), SystemUiOptions.SIGNAL_DUAL)','enabled')
compact=re.search(r'!pair.apply\((.*?)\)\)',source)[1]
source=source[source.index('private static final class SignalPair'):source.index('/** Compact bars')]
def method(marker):
    start=source.index(marker)
    end=source.index('{',start)+1
    depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}')
        end+=1
    return source[start:end]
harness=r'''
import java.util.*;
public class TestDualLifecycle {
 static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static boolean[] decision(boolean bar,boolean grid,boolean positionOnly,boolean group,boolean enabled){
  return decision(bar,grid,positionOnly,group,enabled,false);
 }
 static boolean[] decision(boolean bar,boolean grid,boolean positionOnly,boolean group,boolean enabled,boolean ownsReplacement){
  boolean circle=/* CIRCLE */;boolean stack=/* STACK */;return new boolean[]{stack,/* COMPACT */};
 }
 static class Rect{int left=0,top=0,right=112,bottom=42;}
 static class View {float transition=1;int minimum=65,visibility=0,measuredWidth=65;boolean layoutRequested;View parent;ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();Map<String,View> children=new HashMap<>();
  float getTransitionAlpha(){return transition;}void setTransitionAlpha(float x){transition=x;}
  int getMinimumWidth(){return minimum;}void setMinimumWidth(int x){minimum=x;}
  ViewGroup.LayoutParams getLayoutParams(){return params;}void setLayoutParams(ViewGroup.LayoutParams p){params=p;requestLayout();}
  int getPaddingRight(){return 0;}int getWidth(){return measuredWidth;}int getMeasuredWidth(){return measuredWidth;}int getHeight(){return 42;}
  View getParent(){return parent;}boolean isLayoutRequested(){return layoutRequested;}Object getContext(){return this;}
  void requestLayout(){layoutRequested=true;}void finishLayout(){measuredWidth=params.width<0?65:params.width;layoutRequested=false;for(View child:children.values())child.finishLayout();}
  void invalidate(){}Overlay overlay=new Overlay();Overlay getOverlay(){return overlay;}}
 static class ViewGroup extends View{static class LayoutParams{int width=65;}}
 static class ViewTreeObserver{interface OnGlobalLayoutListener{void onGlobalLayout();}boolean removed;boolean isAlive(){return true;}void removeOnGlobalLayoutListener(OnGlobalLayoutListener l){removed=true;}}
 static class Overlay{boolean removed;void remove(Object d){removed=true;}}
 static class Geometry{float left,top;float height(){return 42;}}
 static class Plan{boolean hasSpacing;}
 static class Layout{Plan plan=new Plan();}
 static class Drawing{boolean refreshed,readyToDraw;float gridScale=1;int inputVersion;Geometry reference=new Geometry();Layout currentLayout=new Layout();
  void refresh(){refreshed=true;}Rect contentBounds(){return reference==null?null:new Rect();}
  Geometry nativeGeometry(){return new Geometry();}Geometry geometry(){return reference;}Layout layout(Geometry g){return g==null?null:currentLayout;}
  String inputs(){return "native:"+inputVersion;}String planInputs(){return "plan";}
  void setBounds(int a,int b,int c,int d){}void invalidateSelf(){}}
 static class StatusBarIconLayoutHook{static View releaseNext;static boolean releaseStackedChildBoundaries(View v){if(v!=releaseNext)return false;releaseNext=null;v.requestLayout();return true;}static void refreshComposite(View v){}}
 static class FeatureSettings{static String lastDiagnostic;static void diagnostic(Object context,String key,String value){lastDiagnostic=value;}}
 static View find(View v,String id){return v.children.get(id);}
 static class Pair{
  // FIELDS
  boolean ready=true;
  Pair(){this(false);}
  Pair(boolean single){one=new View();two=single?null:new View();first=new View();second=single?null:new View();anchor=one;collapsed=two;anchorSignal=first;dataSubscription=1;
   anchor.params.width=-2;anchorSignal.transition=.7f;if(collapsed!=null)collapsed.transition=.6f;firstTransitionAlpha=.7f;secondTransitionAlpha=single?1:.6f;
   secondWidth=single?0:65;secondMinimum=single?0:65;anchorWidth=-2;nativeWidthBudget=single?65:130;drawable=new Drawing();observer=new ViewTreeObserver();
   ViewGroup root=new ViewGroup();anchor.parent=root;if(collapsed!=null)collapsed.parent=root;first.parent=one;if(second!=null)second.parent=two;}
  boolean canDraw(){return ready&&drawable.geometry()!=null;}
  void publish(String reason){published=reason;}
  void finishLayout(){anchor.finishLayout();if(collapsed!=null)collapsed.finishLayout();first.finishLayout();if(second!=null)second.finishLayout();nativeLayout.onGlobalLayout();}
  // METHODS
 }
 static boolean settle(Pair pair,boolean compact){for(int i=0;i<6;i++){if(!pair.apply(compact))return false;if(pair.drawable.readyToDraw)return true;pair.finishLayout();}throw new AssertionError("layout never settled");}
 public static void main(String[] args){
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
  Pair crowded=new Pair();crowded.drawable.currentLayout.plan.hasSpacing=true;crowded.nativeWidthBudget=90;
  check(!crowded.apply(true)&&"capacity".equals(crowded.stopReason),"spacing exceeding native SIM allocation declines overlay");
  check(crowded.anchor.params.width==-2&&crowded.anchorSignal.transition==.7f&&"native_fallback:space_insufficient".equals(FeatureSettings.lastDiagnostic),"capacity fallback leaves native state and records the reason");
  System.out.println("PASS dual signal lifecycle: "+checks+" assertions");
 }
}
'''
harness=harness.replace('/* CIRCLE */',circle).replace('/* STACK */',stack).replace('/* COMPACT */',compact)
# Keep the lifecycle fields and ownership helpers in sync with production. The
# fake views model asynchronous measure/layout rather than assuming apply is synchronous.
fields=source[source.index('final View one, two;'):source.index('SignalPair(View one,')]
fields=fields.replace('ImageView','View').replace('SignalDrawable','Drawing')
markers=['boolean apply(', 'boolean layoutSettled()', 'void showNative()', 'void restoreAnchorWidth()',
         'void beginNativeLayout(', 'boolean nativeSpace(', 'void restore()', 'void restore(String reason)', 'void restoreWidth()']
harness=harness.replace('// FIELDS',fields).replace('// METHODS','\n'.join(method(marker) for marker in markers))
with tempfile.TemporaryDirectory(prefix='dual-signal-lifecycle-') as tmp:
    path=Path(tmp)/'TestDualLifecycle.java'
    path.write_text(harness,encoding='utf-8')
    subprocess.run(['javac','-encoding','UTF-8','-d',tmp,str(path)],check=True)
    subprocess.run(['java','-cp',tmp,'TestDualLifecycle'],check=True)
