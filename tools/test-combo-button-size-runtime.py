"""Execute production button hooks against the OEM wrap-content contract, without a device."""
import argparse
import importlib.util
from pathlib import Path
import re
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('monitor_fixture',ROOT/'tools/test-game-performance-monitor-runtime.py')
fixture=importlib.util.module_from_spec(spec);spec.loader.exec_module(fixture)

STUBS={key:fixture.STUBS[key] for key in (
    'io/github/libxposed/api/XposedInterface.java','ls/augment/com/hook/AugmentModule.java')}
STUBS.update({
'android/content/Context.java':'''package android.content; public class Context {
 public android.content.res.Resources getResources(){return new android.content.res.Resources();}}''',
'android/content/res/Resources.java':'''package android.content.res;public class Resources {
 public android.util.DisplayMetrics getDisplayMetrics(){return android.util.DisplayMetrics.current;}}''',
'android/util/DisplayMetrics.java':'''package android.util;public class DisplayMetrics {
 public static final DisplayMetrics current=new DisplayMetrics();public int widthPixels=1000,heightPixels=600;public float density=1;}''',
'android/graphics/Paint.java':'''package android.graphics;public class Paint {
 private float size=20;public float getTextSize(){return size;}public void setTextSize(float value){size=value;}}''',
'android/graphics/drawable/Drawable.java':'''package android.graphics.drawable;public class Drawable {
 public int width=100,height=80;public int getIntrinsicWidth(){return width;}public int getIntrinsicHeight(){return height;}}''',
'android/view/View.java':'''package android.view;public class View {
 public int measuredWidth,measuredHeight,requests,invalidates;public boolean attached;
 public android.content.Context getContext(){return new android.content.Context();}
 public android.content.res.Resources getResources(){return getContext().getResources();}
 public boolean isAttachedToWindow(){return attached;}public void requestLayout(){requests++;}public void invalidate(){invalidates++;}
 public int getMeasuredWidth(){return measuredWidth;}public int getMeasuredHeight(){return measuredHeight;}
 protected final void setMeasuredDimension(int w,int h){measuredWidth=w;measuredHeight=h;}}
''',
'android/view/ViewGroup.java':'''package android.view;public class ViewGroup extends View {
 public static class LayoutParams {public static final int WRAP_CONTENT=-2;public int width=-2,height=-2;}}''',
'android/view/WindowManager.java':'''package android.view;public interface WindowManager {
 class LayoutParams extends ViewGroup.LayoutParams {public int x,y;}
 void updateViewLayout(View view,ViewGroup.LayoutParams params);}
''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import java.util.*;import android.content.Context;
public class FeatureSettings {
 public static boolean on;public static int percent=100;
 public static final List<Runnable> listeners=new ArrayList<>();public static final List<String> diagnostics=new ArrayList<>();
 public static final List<Throwable> errors=new ArrayList<>();
 public static boolean enabled(Context c,String key,boolean fallback){return on;}
 public static int integer(Context c,String key,int fallback,int min,int max){return Math.max(min,Math.min(max,percent));}
 public static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}
 public static void fire(){for(Runnable r:listeners)r.run();}
 public static void diagnostic(Context c,String key,String value){diagnostics.add(value);}
 public static void diagnosticError(Context c,String key,String phase,Throwable e){errors.add(e);}}
''',
})

OEM='''package cn.nubia.gamehelper.view;
import android.view.*;import android.graphics.*;import android.graphics.drawable.*;import java.lang.reflect.*;
import ls.augment.com.hook.AugmentModule;
public class DraggableProgressView extends View {
 public WindowManager.LayoutParams mLayoutParams=new WindowManager.LayoutParams();
 public int updates,nativeMeasures,nativeAdds,nativeRemoves;public WindowManager mWindowManager=(v,p)->{updates++;};
 public Drawable mDrawable=new Drawable();public float mStrokeWidth=10,mDistance=4;public Paint mTextPaint=new Paint();
 private void call(String name,Class<?>[] types,Object[] args,AugmentModule.Original original)throws Throwable {
  AugmentModule.dispatch(this,DraggableProgressView.class.getDeclaredMethod(name,types),args,original);}
 public void addToWindow(int x,int y)throws Throwable {call("addToWindow",new Class<?>[]{int.class,int.class},new Object[]{x,y},a->{
  nativeAdds++;mLayoutParams.x=(Integer)a[0];mLayoutParams.y=(Integer)a[1];attached=true;return null;});}
 public void removeFromWindow()throws Throwable {call("removeFromWindow",new Class<?>[0],new Object[0],a->{nativeRemoves++;attached=false;return null;});}
 protected void onMeasure(int w,int h)throws Throwable {call("onMeasure",new Class<?>[]{int.class,int.class},new Object[]{w,h},a->{
  nativeMeasures++;setMeasuredDimension(mDrawable.getIntrinsicWidth(),mDrawable.getIntrinsicHeight());return null;});}
 public void measureNow()throws Throwable {onMeasure(1000,600);}
}
'''
HARNESS='''package ls.augment.com.hook;
import cn.nubia.gamehelper.view.DraggableProgressView;
public class TestComboButtonSize {
 static int checks;static void check(boolean ok,String text){checks++;if(!ok)throw new AssertionError(text);}
 static void eq(float expected,float actual,String text){check(Math.abs(expected-actual)<.001f,text+" expected="+expected+" actual="+actual);}
 static class Derived extends DraggableProgressView {}
 public static void main(String[] args)throws Throwable {
  AugmentModule module=new AugmentModule();ComboButtonSizeHook.install(module,TestComboButtonSize.class.getClassLoader());
  if(args.length>0){eq(0,module.hooks.size(),"unknown contract cannot install partial hooks");eq(1,module.errors.size(),"missing capability reported");return;}
  eq(3,module.hooks.size(),"add measure remove contract");eq(0,module.errors.size(),"known contract installed");
  FeatureSettings.on=true;FeatureSettings.percent=150;
  DraggableProgressView preview=new DraggableProgressView();preview.measureNow();eq(100,preview.getMeasuredWidth(),"non-window preview untouched");
  for(DraggableProgressView view:new DraggableProgressView[]{new DraggableProgressView(),new Derived()}){
   FeatureSettings.on=false;view.addToWindow(990,590);view.measureNow();
   eq(100,view.getMeasuredWidth(),"disabled native width");eq(990,view.mLayoutParams.x,"disabled native position");
   FeatureSettings.on=true;
   for(int percent:new int[]{50,100,200,150,50,200}){
    FeatureSettings.percent=percent;FeatureSettings.fire();view.measureNow();
    eq(percent,view.getMeasuredWidth(),"actual root width follows percent");eq(percent*.8f,view.getMeasuredHeight(),"aspect ratio");
    eq(percent/10f,view.mStrokeWidth,"ring size does not accumulate");eq(percent*.2f,view.mTextPaint.getTextSize(),"countdown font follows size");
    eq(-2,view.mLayoutParams.width,"input window wraps measured root");check(view.mLayoutParams.x+view.getMeasuredWidth()<=1000,"right edge contained");
    check(view.mLayoutParams.y+view.getMeasuredHeight()<=600,"bottom edge contained");
   }
   check(view.requests>0&&view.invalidates>0&&view.updates>0,"live refresh reaches window manager");
   view.addToWindow(30,40);view.measureNow();eq(20,view.mStrokeWidth,"repeated add never recaptures scaled style");
   view.mDrawable.width=60;view.mDrawable.height=60;view.measureNow();eq(120,view.getMeasuredWidth(),"new native icon baseline");
   FeatureSettings.on=false;FeatureSettings.fire();view.measureNow();eq(60,view.getMeasuredWidth(),"disable restores native icon");
   eq(10,view.mStrokeWidth,"disable restores native ring");eq(20,view.mTextPaint.getTextSize(),"disable restores native text");
   FeatureSettings.on=true;view.measureNow();view.removeFromWindow();eq(10,view.mStrokeWidth,"remove restores reused view style");
   int updates=view.updates;FeatureSettings.fire();eq(updates,view.updates,"removed window not updated");
   view.addToWindow(30,40);view.measureNow();eq(20,view.mStrokeWidth,"readd retains native style baseline");view.removeFromWindow();
  }
  DraggableProgressView fixed=new DraggableProgressView();fixed.mLayoutParams.width=200;fixed.addToWindow(3,4);fixed.measureNow();
  eq(100,fixed.getMeasuredWidth(),"unknown fixed geometry left native");eq(10,fixed.mStrokeWidth,"unknown geometry style untouched");
  DraggableProgressView large=new DraggableProgressView();large.mDrawable.width=800;large.mDrawable.height=800;
  large.addToWindow(950,550);large.measureNow();eq(600,large.getMeasuredWidth(),"screen bounds cap scale without distortion");
  eq(600,large.getMeasuredHeight(),"screen cap aspect");eq(0,large.mLayoutParams.y,"screen cap position");
  eq(1,FeatureSettings.listeners.size(),"single weak-window listener");eq(0,FeatureSettings.errors.size(),"no swallowed runtime errors");
  System.out.println("PASS combo button runtime checks="+checks);
 }
}
'''

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--jdk',type=Path,required=True);args=parser.parse_args()
    jdk=args.jdk/'bin' if (args.jdk/'bin').is_dir() else args.jdk
    options=(ROOT/'android/app/src/main/java/ls/augment/com/GameOptions.java').read_text(encoding='utf-8')
    declarations=re.findall(r'public static final (?:String|int) COMBO_BUTTON_SIZE[^;]+;',options)
    with tempfile.TemporaryDirectory(prefix='duo-combo-size-') as folder:
        for variant in ('known','wrong-field','missing-method'):
            target=Path(folder)/variant;generated=dict(STUBS)
            native=OEM
            if variant=='wrong-field':native=native.replace('public WindowManager mWindowManager','public Object mWindowManager').replace('=(v,p)->{updates++;};','=new Object();')
            if variant=='missing-method':native=native.replace('public void removeFromWindow()','public void removedUnknown()')
            generated['cn/nubia/gamehelper/view/DraggableProgressView.java']=native
            generated['ls/augment/com/GameOptions.java']='package ls.augment.com;public class GameOptions {'+''.join(declarations)+'}'
            generated['ls/augment/com/hook/TestComboButtonSize.java']=HARNESS if variant=='known' else HARNESS[:HARNESS.index('  FeatureSettings.on=true;')]+ '\n }\n}\n'
            sources=[]
            for relative,source in generated.items():
                path=target/relative;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8');sources.append(str(path))
            sources.append(str(ROOT/'android/app/src/main/java/ls/augment/com/hook/ComboButtonSizeHook.java'))
            sources.append(str(ROOT/'android/app/src/main/java/ls/augment/com/ComboButtonSizeConfig.java'))
            subprocess.run([str(jdk/'javac.exe'),'-encoding','UTF-8','-d',str(target/'classes'),*sources],check=True)
            subprocess.run([str(jdk/'java.exe'),'-cp',str(target/'classes'),'ls.augment.com.hook.TestComboButtonSize',*([variant] if variant!='known' else [])],check=True)
            print('PASS',variant)
if __name__=='__main__':main()
