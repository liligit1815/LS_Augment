"""Execute the real horizontal/vertical percentage hook with native view doubles."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = {
    "android/content/Context.java": """package android.content;public class Context {}""",
    "android/util/DisplayMetrics.java": """package android.util;public class DisplayMetrics {public float density=1,scaledDensity=1;}""",
    "android/content/res/Resources.java": """package android.content.res;public class Resources {public final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}public int getIdentifier(String name,String type,String pkg){return name.hashCode();}}""",
    "android/view/ViewParent.java": """package android.view;public interface ViewParent {}""",
    "android/view/ViewTreeObserver.java": """package android.view;public class ViewTreeObserver {public interface OnPreDrawListener {boolean onPreDraw();}public final java.util.Set<OnPreDrawListener> listeners=new java.util.HashSet<>();public boolean isAlive(){return true;}public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}public void draw(){for(var l:new java.util.ArrayList<>(listeners))l.onPreDraw();}}""",
    "android/view/View.java": """package android.view;public class View implements ViewParent {
public static final int VISIBLE=0,GONE=8;public int id,width=400,height=40,visibility;public float x,y;public boolean attached=true;public ViewParent parent;
public final android.content.Context context=new android.content.Context();public final android.content.res.Resources resources=new android.content.res.Resources();public final ViewTreeObserver tree=new ViewTreeObserver();public final Overlay overlay=new Overlay();public final java.util.Set<OnAttachStateChangeListener> listeners=new java.util.HashSet<>();
public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}public android.content.Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}public int getId(){return id;}public int getWidth(){return width;}public int getHeight(){return height;}public float getX(){return x;}public float getY(){return y;}public int getVisibility(){return visibility;}public boolean isAttachedToWindow(){return attached;}public ViewParent getParent(){return parent;}public View findViewById(int id){return this.id==id?this:null;}public ViewTreeObserver getViewTreeObserver(){return tree;}public Overlay getOverlay(){return overlay;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}public void attach(){attached=true;for(var l:new java.util.ArrayList<>(listeners))l.onViewAttachedToWindow(this);}public void detach(){attached=false;for(var l:new java.util.ArrayList<>(listeners))l.onViewDetachedFromWindow(this);}public static class Overlay{public final java.util.Set<android.graphics.drawable.Drawable> items=new java.util.HashSet<>();public void add(android.graphics.drawable.Drawable d){items.add(d);}public void remove(android.graphics.drawable.Drawable d){items.remove(d);}}
}""",
    "android/view/ViewGroup.java": """package android.view;public class ViewGroup extends View {public final java.util.List<View> children=new java.util.ArrayList<>();public void add(View v){children.add(v);v.parent=this;}public View findViewById(int id){View own=super.findViewById(id);if(own!=null)return own;for(View v:children){View found=v.findViewById(id);if(found!=null)return found;}return null;}}""",
    "android/widget/SeekBar.java": """package android.widget;public class SeekBar extends android.view.View {public int progress=127,min,max=254;public int getProgress(){return progress;}public int getMin(){return min;}public int getMax(){return max;}}""",
    "android/graphics/Rect.java": """package android.graphics;public class Rect {int w,h;public int width(){return w;}public int height(){return h;}public void set(int l,int t,int r,int b){w=r-l;h=b-t;}}""",
    "android/graphics/Canvas.java": """package android.graphics;public class Canvas {public String text;public float x,y;public void drawText(String t,float x,float y,Paint p){text=t;this.x=x;this.y=y;}}""",
    "android/graphics/ColorFilter.java": """package android.graphics;public class ColorFilter {}""",
    "android/graphics/PixelFormat.java": """package android.graphics;public class PixelFormat {public static final int TRANSLUCENT=-3;}""",
    "android/graphics/Typeface.java": """package android.graphics;public class Typeface {public static final int NORMAL=0;public static Typeface create(String name,int style){return new Typeface();}}""",
    "android/graphics/Paint.java": """package android.graphics;public class Paint {public static final int ANTI_ALIAS_FLAG=1;public enum Align{CENTER}public enum Style{STROKE}public float size;public Paint(int flags){}public void setTextAlign(Align a){}public void setTypeface(Typeface t){}public void setTextSize(float v){size=v;}public void setColor(int v){}public void setAlpha(int v){}public void setColorFilter(ColorFilter f){}public void set(Paint p){size=p.size;}public void setStyle(Style s){}public void setStrokeWidth(float v){}public FontMetrics getFontMetrics(){FontMetrics f=new FontMetrics();f.ascent=-size*.8f;f.descent=size*.2f;return f;}public static class FontMetrics{public float ascent,descent;}}""",
    "android/graphics/drawable/Drawable.java": """package android.graphics.drawable;public abstract class Drawable {public int invalidations;final android.graphics.Rect bounds=new android.graphics.Rect();public android.graphics.Rect getBounds(){return bounds;}public void setBounds(int l,int t,int r,int b){bounds.set(l,t,r,b);}public void invalidateSelf(){invalidations++;}public abstract void draw(android.graphics.Canvas c);public abstract void setAlpha(int a);public abstract void setColorFilter(android.graphics.ColorFilter f);public abstract int getOpacity();}""",
    "ls/augment/com/SystemUiOptions.java": """package ls.augment.com;public class SystemUiOptions {public static final String QS_VOLUME_PERCENT="volume",QS_BRIGHTNESS_PERCENT="brightness";}""",
    "ls/augment/com/AudioGainState.java": """package ls.augment.com;public class AudioGainState {public long request;public int stream,total,current,device;public String configuration="";public boolean extended(){return false;}public int percent(){return 0;}public static boolean wanted(Object snapshot,int stream){return false;}}""",
    "ls/augment/com/AudioGainPolicy.java": """package ls.augment.com;public class AudioGainPolicy {public static String stream(int stream){return "";}}""",
    "ls/augment/com/hook/AudioGainStateClient.java": """package ls.augment.com.hook;public class AudioGainStateClient {public static class Watch{public Watch(android.view.View v,Runnable r,java.util.function.LongConsumer c){}public ls.augment.com.AudioGainState state(){return null;}public void bind(int stream){}public void close(){}}}""",
    "ls/augment/com/hook/FullBrightnessHook.java": """package ls.augment.com.hook;public class FullBrightnessHook {static String selected;static String label(android.widget.SeekBar s){return selected;}}""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;public class FeatureSettings {static boolean enabled=true;static final java.util.Set<Runnable> listeners=new java.util.HashSet<>();static final java.util.Map<String,String> diagnostics=new java.util.HashMap<>();static boolean enabled(android.content.Context c,String key){return enabled;}static Object snapshot(android.content.Context c){return null;}static void addSnapshotListener(android.content.Context c,Runnable r){listeners.add(r);}static void removeSnapshotListener(Runnable r){listeners.remove(r);}static void diagnostic(android.content.Context c,String k,String v){diagnostics.put(k,v);}static void change(boolean value){enabled=value;for(var l:new java.util.ArrayList<>(listeners))l.run();}}""",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;public class AugmentModule {}""",
    "ls/augment/com/hook/SystemUiAdapter.java": """package ls.augment.com.hook;public class SystemUiAdapter {static final Object PASS=new Object();interface Patch{Object apply(Object owner,Object[] args,Object result)throws Throwable;}static final java.util.Map<String,Patch> hooks=new java.util.HashMap<>();static int hook(AugmentModule module,ClassLoader loader,String cls,String method,int args,Patch before,Patch after){hooks.put(cls+"."+method,after);return 1;}static Object field(Object owner,String name){return null;}static boolean set(Object owner,String name,Object value){return false;}static Object call(Object owner,String name,Object...args)throws ReflectiveOperationException{return null;}}""",
    "com/zte/controlcenter/view/ToggleSliderView.java": """package com.zte.controlcenter.view;public class ToggleSliderView extends android.view.ViewGroup {public final android.widget.SeekBar slider=new android.widget.SeekBar();public ToggleSliderView(){id="brightness_slider".hashCode();slider.id="slider".hashCode();slider.x=48;slider.width=352;add(slider);}}""",
    "com/zte/controlcenter/view/CCToggleSliderView.java": """package com.zte.controlcenter.view;public class CCToggleSliderView extends android.view.ViewGroup {public final android.view.ViewGroup frame=new android.view.ViewGroup();public final android.widget.SeekBar slider=new android.widget.SeekBar();public final android.view.View toggle=new android.view.View();public CCToggleSliderView(){id="brightness_slider".hashCode();frame.id="slider_frame".hashCode();frame.width=60;frame.height=230;slider.id="slider".hashCode();toggle.id="toggle".hashCode();toggle.y=184;toggle.height=28;frame.add(slider);frame.add(toggle);add(frame);}}""",
    "ls/augment/com/hook/TestControlCenterPercentRuntime.java": r"""package ls.augment.com.hook;
import android.view.*;import android.graphics.*;import android.graphics.drawable.*;import com.zte.controlcenter.view.*;
public class TestControlCenterPercentRuntime {
static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}static void watch(View view,String cls,String method)throws Throwable{SystemUiAdapter.hooks.get("com.zte.controlcenter.view."+cls+"."+method).apply(view,new Object[0],null);}static Canvas render(View holder){check(holder.overlay.items.size()==1,"one owned label");Canvas canvas=new Canvas();holder.overlay.items.iterator().next().draw(canvas);return canvas;}
public static void main(String[] args)throws Throwable{
ControlCenterSliderPercentHook.install(new AugmentModule(),TestControlCenterPercentRuntime.class.getClassLoader());
ToggleSliderView horizontal=new ToggleSliderView();watch(horizontal,"ToggleSliderView","onAttachedToWindow");Canvas c=render(horizontal);check(c.text.equals("50%"),"unified panel percentage");check(c.x==224&&c.y>0&&c.y<40,"center inside native track excluding automatic button");
check(FeatureSettings.diagnostics.get("ls_augment_rm_qs_brightness_percent_runtime").contains("horizontal"),"binding orientation is observable");
int callbacks=FeatureSettings.listeners.size();Drawable label=horizontal.overlay.items.iterator().next();int writes=label.invalidations;for(int i=0;i<5000;i++)horizontal.tree.draw();check(label.invalidations==writes,"stable pre-draw must not keep redrawing");
for(int p:new int[]{0,64,127,254}){horizontal.slider.progress=p;horizontal.tree.draw();c=render(horizontal);check(c.text.equals(ControlCenterPercent.of(p,0,254)+"%"),"native horizontal progress");}
horizontal.slider.x=60;horizontal.slider.width=280;horizontal.slider.y=8;horizontal.tree.draw();c=render(horizontal);check(c.x==200&&c.y>8&&c.y<48,"geometry refreshed after orientation change");
watch(horizontal,"ToggleSliderView","onAttachedToWindow");check(FeatureSettings.listeners.size()==callbacks&&horizontal.tree.listeners.size()==1,"duplicate attach is idempotent");
FeatureSettings.change(false);check(horizontal.overlay.items.isEmpty(),"disable removes owned label");FullBrightnessHook.selected="110%";horizontal.tree.draw();check(render(horizontal).text.equals("110%"),"full range labels survive percentage switch off");
FullBrightnessHook.selected=null;FeatureSettings.change(true);horizontal.detach();check(horizontal.overlay.items.isEmpty()&&horizontal.tree.listeners.isEmpty()&&FeatureSettings.listeners.isEmpty(),"detach releases label and listeners");horizontal.attach();check(render(horizontal).text.equals("100%")&&horizontal.tree.listeners.size()==1,"reattach restores current percentage once");
CCToggleSliderView vertical=new CCToggleSliderView();watch(vertical,"CCToggleSliderView","onFinishInflate");c=render(vertical.frame);check(c.text.equals("50%")&&c.x==30&&c.y<vertical.toggle.y,"vertical layout retains upright label above toggle");
vertical.toggle.visibility=View.GONE;vertical.frame.tree.draw();check(render(vertical.frame).text.equals("50%"),"hidden auto icon keeps percentage");
horizontal.slider.max=0;horizontal.tree.draw();check(horizontal.overlay.items.isEmpty(),"uninitialized horizontal range hidden");horizontal.slider.max=254;horizontal.tree.draw();check(render(horizontal).text.equals("100%"),"range recovery");
horizontal.slider.height=0;horizontal.tree.draw();check(horizontal.overlay.items.isEmpty(),"unlaid-out track hidden");horizontal.slider.height=40;horizontal.tree.draw();render(horizontal);
vertical.detach();horizontal.detach();check(FeatureSettings.listeners.isEmpty(),"all snapshots released");System.out.println("PASS ControlCenterPercentRuntime "+checks+" checks; 5000 stable pre-draws");
}}
""",
}
for name in ("ControlCenterPercent", "ControlCenterSliderPercentHook"):
    FILES[f"ls/augment/com/hook/{name}.java"] = (ROOT / f"android/app/src/main/java/ls/augment/com/hook/{name}.java").read_text(encoding="utf-8")


def java_tool(name):
    found = shutil.which(name)
    if found:
        return found
    return str(Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")) / "bin" / (name + (".exe" if os.name == "nt" else "")))


with tempfile.TemporaryDirectory(prefix="duo-brightness-percent-") as directory:
    sources = []
    for name, content in FILES.items():
        path = Path(directory) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        sources.append(str(path))
    subprocess.run([java_tool("javac"), "-encoding", "UTF-8", "-d", directory, *sources], check=True)
    subprocess.run([java_tool("java"), "-cp", directory, "ls.augment.com.hook.TestControlCenterPercentRuntime"], check=True)
