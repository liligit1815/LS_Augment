"""Run the production island surface against Android drawing/lifecycle facades (no GPU claims)."""
import argparse
import ast
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
# Reuse only literal Android facade definitions, without executing the other test suite.
tree = ast.parse((ROOT / 'tools/test-liquid-glass-control-center-runtime.py').read_text('utf-8'))
base = next(ast.literal_eval(node.value) for node in tree.body if isinstance(node, ast.Assign)
            and any(isinstance(target, ast.Name) and target.id == 'FILES' for target in node.targets))
names = ['android/content/Context', 'android/content/res/Resources', 'android/content/res/ColorStateList',
         'android/util/DisplayMetrics', 'android/graphics/Canvas', 'android/graphics/Rect',
         'android/graphics/ColorFilter', 'android/graphics/Outline', 'android/graphics/PorterDuff',
         'android/graphics/drawable/Drawable', 'android/graphics/drawable/GradientDrawable',
         'android/view/ViewParent', 'android/view/View', 'android/view/ViewGroup',
         'ls/augment/com/LayerBackdropSource', 'ls/augment/com/LiquidGlassDrawable']
files = {name + '.java': base[name + '.java'] for name in names}
files['android/graphics/Color.java']='package android.graphics;public class Color {public static final int WHITE=0xffffffff;}'
files['ls/augment/com/LiquidGlassDrawable.java'] = files['ls/augment/com/LiquidGlassDrawable.java'].replace(
    'public void setControlSurface(', 'public boolean isBackdropLight(){return false;} public void setClarity(float value){} public void setAnimatedFallback(boolean value){} public void setRadiusDp(float value){} public void setControlSurface(')
files['android/view/View.java'] = files['android/view/View.java'].replace(
    'public int width=', 'public static final int VISIBLE=0;public int windowVisibility;'
    'public int getWindowVisibility(){return windowVisibility;}'
    'public final ViewTreeObserver observer=new ViewTreeObserver();'
    'public ViewTreeObserver getViewTreeObserver(){return observer;}'
    'public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}'
    'public int width=').replace('for(OnAttachStateChangeListener l:listeners)',
                                'for(OnAttachStateChangeListener l:new java.util.ArrayList<>(listeners))')
files['ls/augment/com/LayerBackdropSource.java'] = files['ls/augment/com/LayerBackdropSource.java'].replace(
    'public class LayerBackdropSource {', 'public class LayerBackdropSource implements LiquidGlassDrawable.BackdropSource {')
files['ls/augment/com/LayerBackdropSource.java'] = files['ls/augment/com/LayerBackdropSource.java'].replace(
    'public boolean drawRegion(', 'public boolean draw(Canvas c,int w,int h){return isValid();}public boolean drawRegion(')
files['android/view/ViewTreeObserver.java'] = '''package android.view;import java.util.*;
public class ViewTreeObserver {public interface OnPreDrawListener{boolean onPreDraw();}
public final List<OnPreDrawListener> listeners=new ArrayList<>();public boolean isAlive(){return true;}
public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}
public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}
public void dispatch(){for(OnPreDrawListener l:new ArrayList<>(listeners))l.onPreDraw();}}
'''
files['android/graphics/drawable/DrawableWrapper.java'] = '''package android.graphics.drawable;import android.graphics.*;
public class DrawableWrapper extends Drawable implements Drawable.Callback {
private Drawable value;public DrawableWrapper(Drawable d){setDrawable(d);}
public void setDrawable(Drawable d){if(value!=null)value.setCallback(null);value=d;if(d!=null)d.setCallback(this);}
@Override public void draw(Canvas c){if(value!=null)value.draw(c);}
@Override protected void onBoundsChange(Rect r){if(value!=null)value.setBounds(r);}
@Override public void setAlpha(int a){if(value!=null)value.setAlpha(a);}
public void invalidateDrawable(Drawable d){invalidateSelf();}public void scheduleDrawable(Drawable d,Runnable r,long t){scheduleSelf(r,t);}
public void unscheduleDrawable(Drawable d,Runnable r){unscheduleSelf(r);}}
'''
files['ls/augment/com/hook/TestIslandGlass.java'] = '''package ls.augment.com.hook;
import android.view.*;import android.graphics.*;import android.graphics.drawable.*;import ls.augment.com.*;import java.util.*;
public class TestIslandGlass {
static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
static Object field(Object value,String name)throws Exception{var f=value.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(value);}
static class NativeSubclass extends GradientDrawable {}
public static void main(String[] args)throws Exception{
List<String> diagnostics=new ArrayList<>();View view=new View();
for(Drawable unknown:new Drawable[]{null,new Drawable()}){
view.setBackground(unknown);check(IslandGlassBackground.attach(view,diagnostics::add)==null,"unknown background stays native");
check(view.getBackground()==unknown,"missing capability does not replace native drawable");}
GradientDrawable asymmetric=new GradientDrawable();asymmetric.radii=new float[]{1,2,1,2,1,2,1,2};view.setBackground(asymmetric);
check(IslandGlassBackground.attach(view,diagnostics::add)==null,"asymmetric shape stays native");
check(diagnostics.get(diagnostics.size()-1).contains("nonuniform_corners"),"precise capability diagnostic");
for(GradientDrawable nativeShape:new GradientDrawable[]{new GradientDrawable(),new NativeSubclass()}){
view=new View();view.setBackground(nativeShape);view.setPadding(1,2,3,4);
IslandGlassBackground installed=IslandGlassBackground.attach(view,diagnostics::add);
check(installed!=null&&view.getBackground()==installed,"base and subclass attach");
check(view.getPaddingLeft()==1&&view.getPaddingBottom()==4,"native padding preserved");
check(nativeShape.getCallback()==installed,"native callbacks delegated after View clears them");
check(view.observer.listeners.size()==1&&view.listeners.size()==1,"one lifecycle owner");
LayerBackdropSource source=(LayerBackdropSource)field(installed,"source");
LiquidGlassDrawable glass=(LiquidGlassDrawable)field(installed,"glass");
check(glass.light&&!glass.controlSurface,"clear material avoids heavy control-surface blur");
Canvas canvas=new Canvas();view.observer.dispatch();installed.draw(canvas);
check(canvas.events.contains("glass"),"verified frame selects glass");
source.available=false;canvas.events.clear();view.observer.dispatch();installed.draw(canvas);
check(canvas.events.equals(List.of("fallback")),"missing capture uses declared translucent fallback");
check(diagnostics.get(diagnostics.size()-1).contains("test-unavailable"),"capture failure is diagnosed");
glass.fallback=false;canvas.events.clear();installed.draw(canvas);
check(canvas.events.equals(List.of("native")),"failed material draws original");
int requests=LayerBackdropSource.requests;view.shown=false;view.observer.dispatch();
check(LayerBackdropSource.requests==requests,"hidden surface does not request captures");view.shown=true;
source.available=true;glass.fallback=true;installed.setBounds(0,0,350,200);view.observer.dispatch();
check(glass.getBounds().width()==350&&glass.getBounds().height()==200,"expanded geometry reaches renderer");
GradientDrawable nextShape=new GradientDrawable();
check(installed.replaceNative(nextShape),"known native transition shape accepted");
check(view.getBackground()==installed&&field(installed,"source")==source,"open/close retains the same glass and capture owner");
check(!installed.replaceNative(new Drawable()),"unknown transition shape keeps native fallback");
nativeShape=nextShape;
glass.failGpu=true;installed.draw(canvas);requests=LayerBackdropSource.requests;view.observer.dispatch();
check(source.released&&LayerBackdropSource.requests==requests,"failed renderer releases capture instead of polling");
installed.release();installed.release();
check(source.released&&glass.released,"capture and material released once");
check(view.observer.listeners.isEmpty()&&view.listeners.isEmpty(),"all lifecycle callbacks removed");
check(view.getBackground()==nativeShape&&nativeShape.getCallback()==view,"original restored with native ownership");
check(view.getPaddingLeft()==1&&view.getPaddingBottom()==4,"restore preserves padding");
}
view=new View();view.setBackground(new GradientDrawable());var glass=IslandGlassBackground.attach(view,diagnostics::add);
Drawable replacement=new GradientDrawable();view.setBackground(replacement);view.observer.dispatch();
check(view.getBackground()==replacement,"OEM background replacement is not overwritten");
check(view.observer.listeners.isEmpty()&&view.listeners.isEmpty(),"OEM replacement releases obsolete surface");
view=new View();Drawable original=new GradientDrawable();view.setBackground(original);glass=IslandGlassBackground.attach(view,diagnostics::add);view.detach();
check(view.getBackground()==original&&view.listeners.isEmpty()&&view.observer.listeners.isEmpty(),"window detachment restores and releases");
check(LayerBackdropSource.created==LayerBackdropSource.releases,"all capture owners released");
check(LiquidGlassDrawable.created==LiquidGlassDrawable.releases,"all optical owners released");
System.out.println("Island glass lifecycle checks passed: "+checks+" (Android facade; no GPU validation)");
}}
'''

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--java-home', type=Path, required=True)
    args = parser.parse_args()
    files['ls/augment/com/hook/IslandGlassBackground.java'] = (
        ROOT / 'android/app/src/main/java/ls/augment/com/hook/IslandGlassBackground.java').read_text('utf-8')
    with tempfile.TemporaryDirectory(prefix='duo-island-glass-') as directory:
        target = Path(directory)
        sources = []
        for name, content in files.items():
            path = target / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, 'utf-8')
            sources.append(str(path))
        import os
        suffix = '.exe' if os.name == 'nt' else ''
        subprocess.run([str(args.java_home / 'bin' / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', str(target), *sources], check=True)
        subprocess.run([str(args.java_home / 'bin' / ('java' + suffix)), '-cp', str(target), 'ls.augment.com.hook.TestIslandGlass'], check=True)

if __name__ == '__main__':
    main()
