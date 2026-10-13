"""Execute production geometry, native-apply interception and tint replay bodies.

Models repeated OEM reset/apply passes, exceptions, theme callbacks during native
layout, and transformed tint regions without needing SystemUI on a device.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com/hook'


def extract(text, marker, body_only=False):
    start = text.index(marker)
    brace = text.index('{', start)
    end, depth = brace + 1, 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[brace if body_only else start:end]


grid = (JAVA / 'StatusBarGridHook.java').read_text(encoding='utf-8')
native = (JAVA / 'StatusBarNativeIconHook.java').read_text(encoding='utf-8')
tint = (JAVA / 'StatusBarTintHook.java').read_text(encoding='utf-8')
harness = r'''
import java.util.*;import java.lang.ref.*;import java.lang.reflect.*;
public class TestNativeLifecycle {
 static int checks;
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static class Rect {int left,top,right,bottom;Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}boolean isEmpty(){return left>=right||top>=bottom;}}
 static class RectF {float left,top,right,bottom;RectF(Rect r){left=r.left;top=r.top;right=r.right;bottom=r.bottom;}
  boolean isEmpty(){return left>=right||top>=bottom;}float width(){return right-left;}
  public boolean equals(Object other){if(!(other instanceof RectF r))return false;return left==r.left&&top==r.top&&right==r.right&&bottom==r.bottom;}}
 static class Matrix {float sx=1,sy=1,x,y;void mapRect(RectF r){r.left=r.left*sx+x;r.right=r.right*sx+x;r.top=r.top*sy+y;r.bottom=r.bottom*sy+y;}}
 static class View {public boolean mNeedsUnderflow=true,mShouldRestrictIcons=true;float x,y,sx=1,sy=1,alpha=1;ViewGroup parent;Rect ink=new Rect(0,0,20,20);int invalidates;
  int left,top,right,bottom,measuredWidth,measuredHeight;
  static class MeasureSpec {static final int EXACTLY=0x40000000;static int makeMeasureSpec(int size,int mode){return size|mode;}}
  int getLeft(){return left;}int getTop(){return top;}int getRight(){return right;}int getBottom(){return bottom;}
  int getMeasuredWidth(){return measuredWidth;}int getMeasuredHeight(){return measuredHeight;}
  void measure(int w,int h){measuredWidth=w&0x3fffffff;measuredHeight=h&0x3fffffff;}
  void layout(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
  float getTranslationX(){return x;}float getTranslationY(){return y;}float getScaleX(){return sx;}float getScaleY(){return sy;}float getAlpha(){return alpha;}
  void setTranslationX(float f){x=f;}void setTranslationY(float f){y=f;}void setScaleX(float f){sx=f;}void setScaleY(float f){sy=f;}void setAlpha(float f){alpha=f;}
  Object getParent(){return parent;}Object getContext(){return null;}void invalidate(){invalidates++;}
  void transformMatrixToGlobal(Matrix m){m.sx=sx;m.sy=sy;m.x=x;m.y=y;}
 }
 static class ViewGroup extends View {List<View> children=new ArrayList<>();void add(View v){children.add(v);v.parent=this;}int getChildCount(){return children.size();}View getChildAt(int i){return children.get(i);}}
 static class State {boolean active=true,layoutDirty;Map<View,Geometry> geometry=new IdentityHashMap<>();}
 static State state=new State();static State stateFor(View v){return state;}
 static class StatusBarGridHook {static boolean owned=true;static void invalidateLayout(View v){state.layoutDirty=true;}static boolean ownsIconLayout(View v){return owned;}static boolean hasGridTransform(View v){return owned;}}
 static class DualSignalTint {static final Set<View> watched=Collections.newSetFromMap(new IdentityHashMap<>());static boolean managed(View v){return watched.contains(v);}}
 static class StatusBarContentBounds {static Rect of(View v){return v.ink;}}
 static class FeatureSettings {static int style=1;static int integer(Object c,Object k,int d,int min,int max){return style;}static void diagnosticError(Object c,String k,String p,Throwable e){}}
 static class ConfigSchema {static String STATUSBAR_BLUETOOTH_STYLE="style";}
 // GEOMETRY
 // PREPARE
 interface Proceed {Object run()throws Throwable;}
 static class Chain {Object owner;List<Object> args;Proceed original;Chain(Object o,List<Object>a,Proceed p){owner=o;args=a;original=p;}Object getThisObject(){return owner;}List<Object> getArgs(){return args;}Object proceed()throws Throwable{return original.run();}}
 public static class NativeState {public boolean flag;int cancels;public void cancelAnimations(View v){cancels++;}}
 static Object apply(Chain chain,Field animationFlag,Method cancel)throws Throwable /* NATIVE */
 static Object capacity(Chain chain,Field underflow,Field restrict)throws Throwable /* CAPACITY */
 static Object area(Chain chain)throws Throwable /* AREA */
 static Map<View,Registration> RECEIVERS=new WeakHashMap<>();static Method applyDark;static boolean replaying;
 static long paletteGeneration;static final Map<View,Long> REFRESHED=new WeakHashMap<>();
 // REGISTRATION
 // SCREEN
 // MANAGED
 // REFRESH_ENTRY
 // REFRESH_DIRTY
 // REFRESH_BODY
 // UNDER
 public static class Dispatcher {int calls;boolean fail;public void applyDark(View v){calls++;if(!replaying){paletteGeneration++;for(Registration r:RECEIVERS.values())if(r.dispatcher.get()==this)r.dirty=true;}if(fail)throw new IllegalStateException("mock callback");}}
 public static void main(String[] args)throws Throwable {
  ViewGroup root=new ViewGroup();View icon=new View();root.add(icon);icon.x=12;icon.y=3;icon.sx=.8f;icon.sy=.8f;
  Geometry g=new Geometry(icon);state.geometry.put(icon,g);
  for(int i=0;i<100;i++){
   icon.x=-400-i;icon.y=30;icon.sx=2;icon.sy=2;icon.alpha=0;g.mark(icon);
   prepareNativeIcons(root);
   check(icon.x==12&&icon.y==3&&icon.sx==.8f&&icon.sy==.8f&&icon.alpha==1,"OEM reads native baseline, never grid or hidden alpha");
   // OEM moves its slot. Record that update before the next grid writes.
   icon.x=12;g.observe(icon);
  }
  icon.x=99;g.observe(icon);icon.x=-200;g.mark(icon);prepareNativeIcons(root);check(icon.x==99,"new OEM baseline survives");
  icon.x=-500;g.mark(icon);state.active=false;prepareNativeIcons(root);check(icon.x==-500,"inactive grid does not interfere");state.active=true;g.restore(icon);
  NativeState ns=new NativeState();Field flag=NativeState.class.getField("flag");Method cancel=NativeState.class.getMethod("cancelAnimations",View.class);
  Field underflow=View.class.getField("mNeedsUnderflow"),restrict=View.class.getField("mShouldRestrictIcons");
  capacity(new Chain(root,List.of(),()->{check(!root.mNeedsUnderflow&&!root.mShouldRestrictIcons,"grid gets full Bluetooth width before native overflow hides it");return null;}),underflow,restrict);
  check(root.mNeedsUnderflow&&root.mShouldRestrictIcons,"overflow flags restored after grid calculation");
  try{capacity(new Chain(root,List.of(),()->{throw new IllegalStateException();}),underflow,restrict);}catch(IllegalStateException expected){}
  check(root.mNeedsUnderflow&&root.mShouldRestrictIcons,"overflow flags restored after failure");
  FeatureSettings.style=0;capacity(new Chain(root,List.of(),()->{check(!root.mNeedsUnderflow&&!root.mShouldRestrictIcons,"native Bluetooth uses grid capacity while grid owns placement");return null;}),underflow,restrict);FeatureSettings.style=1;
  StatusBarGridHook.owned=false;capacity(new Chain(root,List.of(),()->{check(root.mNeedsUnderflow&&root.mShouldRestrictIcons,"native layouts retain overflow");return null;}),underflow,restrict);StatusBarGridHook.owned=true;
  apply(new Chain(ns,List.of(icon),()->{check(ns.flag,"OEM applies without competing position animation");icon.alpha=0;return null;}),flag,cancel);
  check(!ns.flag&&ns.cancels==1&&icon.alpha==0,"native hidden state preserved and flag restored");
  try{apply(new Chain(ns,List.of(icon),()->{throw new IllegalStateException();}),flag,cancel);throw new AssertionError();}catch(IllegalStateException expected){}
  check(!ns.flag,"exception restores temporary flag");
  StatusBarGridHook.owned=false;apply(new Chain(ns,List.of(icon),()->{check(!ns.flag,"native-only animation unchanged");return null;}),flag,cancel);check(ns.cancels==2,"native-only animations not cancelled");StatusBarGridHook.owned=true;
  icon.x=95;icon.sx=.5f;Rect dark=new Rect(90,0,106,100);
  check((Boolean)area(new Chain(null,List.of(dark,icon),()->false)),"tint uses transformed 10px width, not native 20px allocation");
  icon.x=105;check(!(Boolean)area(new Chain(null,List.of(dark,icon),()->true)),"moved icon outside dark area gets native light tint");
  check((Boolean)area(new Chain(null,List.of(new Rect(0,0,0,0),icon),()->false)),"empty region covers entire bar");
  StatusBarGridHook.owned=false;
  check((Boolean)area(new Chain(null,List.of(dark,icon),()->true)),"unmanaged icon delegates to native tint region");
  DualSignalTint.watched.add(icon);icon.x=95;
  check((Boolean)area(new Chain(null,List.of(dark,icon),()->false)),"dual-signal owner uses transformed tint region without grid");
  DualSignalTint.watched.remove(icon);StatusBarGridHook.owned=true;
  Dispatcher dispatcher=new Dispatcher();applyDark=Dispatcher.class.getMethod("applyDark",View.class);View second=new View();root.add(second);
  RECEIVERS.put(icon,new Registration(dispatcher));RECEIVERS.put(second,new Registration(dispatcher));refresh(root);check(dispatcher.calls==2,"both palette/contrast callbacks replay after placement");
  for(int i=0;i<20;i++)refresh(root);check(dispatcher.calls==2,"replays cannot dirty each other or loop every frame");
  icon.x+=2;refresh(root);check(dispatcher.calls==3,"moving one icon refreshes only its tint");
  for(Registration r:RECEIVERS.values())r.dirty=true;refresh(root);check(dispatcher.calls==5,"theme change refreshes even at unchanged final coordinates");
  icon.x++;refreshDirty(root);check(dispatcher.calls==5,"unchanged palette does not replay geometry-only movement");
  paletteGeneration++;RECEIVERS.get(second).dirty=true;refreshDirty(root);
  check(dispatcher.calls==6,"palette-only refresh delivers only dirty receivers");
  for(int i=0;i<20;i++)refreshDirty(root);check(dispatcher.calls==6,"palette-only frames do not replay the same generation");
  refresh(root);check(dispatcher.calls==7,"geometry refresh still delivers movement skipped by palette-only refresh");
  StatusBarGridHook.owned=false;DualSignalTint.watched.add(icon);
  paletteGeneration++;for(Registration r:RECEIVERS.values())r.dirty=true;refreshDirty(root);
  check(dispatcher.calls==8&&!RECEIVERS.get(icon).dirty&&RECEIVERS.get(second).dirty,"only managed dual-signal owner replays outside grid");
  DualSignalTint.watched.remove(icon);StatusBarGridHook.owned=true;
  refresh(root);check(dispatcher.calls==9,"restoring grid ownership delivers retained dirty receiver");
  Dispatcher otherDispatcher=new Dispatcher();View foreign=new View();root.add(foreign);
  Registration otherRegistration=new Registration(otherDispatcher);otherRegistration.dirty=false;RECEIVERS.put(foreign,otherRegistration);
  long generation=paletteGeneration;dispatcher.applyDark(icon);
  check(paletteGeneration==generation+1&&!otherRegistration.dirty,"native palette delivery advances its generation without dirtying another dispatcher");
  refreshDirty(root);check(dispatcher.calls==12&&otherDispatcher.calls==0,"native palette delivery replays only its managed receivers");
  dispatcher.fail=true;icon.x++;refresh(root);check(!replaying,"failed native callback releases guard");
  System.out.println("Status bar lifecycle/tint: "+checks+" production-body assertions passed");
 }
}
'''
replacements = {
    '// GEOMETRY': extract(grid, 'private static final class Geometry'),
    '// PREPARE': extract(grid, 'static void prepareNativeIcons('),
    '/* NATIVE */': extract(native, '"systemui.grid.native_apply."+container', True),
    '/* CAPACITY */': extract(native, '"systemui.grid.bluetooth_capacity"', True).replace('ls.augment.com.ConfigSchema','ConfigSchema'),
    '/* AREA */': extract(tint, '"systemui.grid.tint_area"', True),
    '// REGISTRATION': extract(tint, 'private static final class Registration'),
    '// SCREEN': extract(tint, 'static RectF screenBounds('),
    '// MANAGED': extract(tint, 'private static boolean managed(View view)'),
    '// REFRESH_ENTRY': extract(tint, 'static void refresh(View root)'),
    '// REFRESH_DIRTY': extract(tint, 'static void refreshDirty(View root)'),
    '// REFRESH_BODY': extract(tint, 'private static void refresh(View root,boolean geometryChanged)'),
    '// UNDER': extract(tint, 'private static boolean under('),
}
for key, value in replacements.items():
    harness = harness.replace(key, value)
with tempfile.TemporaryDirectory(prefix='lsa-icon-lifecycle-') as tmp:
    source = Path(tmp) / 'TestNativeLifecycle.java'
    source.write_text(harness, encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', tmp, str(source)], check=True)
    subprocess.run(['java', '-cp', tmp, 'TestNativeLifecycle'], check=True, timeout=20)
