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
 static class Rect{int right=112;}
 static class View {float transition=1;int minimum=65,visibility=0;ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();Map<String,View> children=new HashMap<>();
  float getTransitionAlpha(){return transition;}void setTransitionAlpha(float x){transition=x;}
  int getMinimumWidth(){return minimum;}void setMinimumWidth(int x){minimum=x;}
  ViewGroup.LayoutParams getLayoutParams(){return params;}void setLayoutParams(ViewGroup.LayoutParams p){params=p;}
  int getPaddingRight(){return 0;}int getWidth(){return params.width;}int getHeight(){return 42;}
  void requestLayout(){}void invalidate(){}Overlay overlay=new Overlay();Overlay getOverlay(){return overlay;}}
 static class ViewGroup{static class LayoutParams{int width=65;}}
 static class Overlay{boolean removed;void remove(Object d){removed=true;}}
 static class Drawing{boolean refreshed;void refresh(){refreshed=true;}Rect contentBounds(){return new Rect();}void setBounds(int a,int b,int c,int d){}void invalidateSelf(){}}
 static View find(View v,String id){return v.children.get(id);}
 static class Pair{
  View anchor=new View(),collapsed=new View(),anchorSignal=new View();
  Drawing drawable=new Drawing();int anchorWidth=-2,secondWidth=65,secondMinimum=65;
  boolean widthExpanded,widthCollapsed,ready=true;
  float firstTransitionAlpha=.7f,secondTransitionAlpha=.6f;
  Map<View,Float> badges=new WeakHashMap<>();
  Pair(){anchor.params.width=-2;anchorSignal.transition=.7f;collapsed.transition=.6f;}
  boolean canDraw(){return ready;}
  // APPLY
  // RESTORE
  // WIDTH
 }
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
    check(pair.apply(compact),"pair applies");
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
   Pair single=new Pair();single.collapsed=null;
   check(single.apply(compact),"single physical SIM supported without a second native view");
   single.restore();check(single.anchor.params.width==-2&&single.anchorSignal.transition==.7f,"single SIM restores native state");
  }
  Pair changed=new Pair();View type=new View();changed.anchor.children.put("mobile_type",type);changed.apply(false);
  type.transition=.4f;changed.apply(false);changed.restore();check(type.transition==.4f,"later native render alpha becomes restore baseline");
  System.out.println("PASS dual signal lifecycle: "+checks+" assertions");
 }
}
'''
harness=harness.replace('/* CIRCLE */',circle).replace('/* STACK */',stack).replace('/* COMPACT */',compact)
harness=harness.replace('// APPLY',method('boolean apply(')).replace('// RESTORE',method('void restore()')).replace('// WIDTH',method('void restoreWidth()'))
with tempfile.TemporaryDirectory(prefix='dual-signal-lifecycle-') as tmp:
    path=Path(tmp)/'TestDualLifecycle.java'
    path.write_text(harness,encoding='utf-8')
    subprocess.run(['javac','-encoding','UTF-8','-d',tmp,str(path)],check=True)
    subprocess.run(['java','-cp',tmp,'TestDualLifecycle'],check=True)
