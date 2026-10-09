"""Run production appearance hooks against a small Android/OEM lifecycle facade.

Exercises ownership, restoration and async stale-result rules. It deliberately
does not claim Android raster output, GPU quality, gestures or device support.
"""
from pathlib import Path
import ast
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
# Reuse checked-in framework facades as data; do not execute the other runner.
tree = ast.parse((ROOT / "tools/test-liquid-glass-control-center-runtime.py").read_text(encoding="utf-8"))
assignment = next(n for n in tree.body if isinstance(n, ast.Assign) and any(isinstance(t, ast.Name) and t.id == "FILES" for t in n.targets))
FILES = {k: v for k, v in ast.literal_eval(assignment.value).items() if not k.startswith("ls/")}

FILES.update({
"android/content/res/Configuration.java": """package android.content.res;public class Configuration {public static final int UI_MODE_NIGHT_MASK=48,UI_MODE_NIGHT_YES=32;public int uiMode;}""",
"android/content/res/Resources.java": """package android.content.res;public class Resources {final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();final Configuration config=new Configuration();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}public Configuration getConfiguration(){return config;}public int getIdentifier(String n,String t,String p){return n.hashCode();}}""",
"android/content/res/ColorStateList.java": """package android.content.res;public class ColorStateList {final int color;public ColorStateList(int c){color=c;}public int getDefaultColor(){return color;}public int getColorForState(int[] s,int d){return color;}}""",
"android/graphics/RectF.java": """package android.graphics;public class RectF {public float left,top,right,bottom;public RectF(){}public RectF(float l,float t,float r,float b){set(l,t,r,b);}public void set(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}public void set(Rect r){set(r.left,r.top,r.right,r.bottom);}public float width(){return right-left;}public float height(){return bottom-top;}public float centerX(){return (left+right)/2;}public float centerY(){return (top+bottom)/2;}}""",
"android/graphics/Shader.java": """package android.graphics;public class Shader {public enum TileMode {CLAMP}}""",
"android/graphics/LinearGradient.java": """package android.graphics;public class LinearGradient extends Shader {public LinearGradient(float a,float b,float c,float d,int[] colors,float[] stops,TileMode mode){}}""",
"android/graphics/RadialGradient.java": """package android.graphics;public class RadialGradient extends Shader {public RadialGradient(float a,float b,float c,int[] colors,float[] stops,TileMode mode){}}""",
"android/graphics/Paint.java": """package android.graphics;public class Paint {public static final int ANTI_ALIAS_FLAG=1,FILTER_BITMAP_FLAG=2;public int alpha=255,color;public Paint(int f){}public void setShader(Shader s){}public void setAlpha(int a){alpha=a;}public void setColor(int c){color=c;}}""",
"android/graphics/Path.java": """package android.graphics;public class Path {public enum Direction {CW}public void reset(){}public void addRoundRect(RectF r,float a,float b,Direction d){}public void addRoundRect(RectF r,float[] a,Direction d){}}""",
"android/graphics/PorterDuffColorFilter.java": """package android.graphics;public class PorterDuffColorFilter extends ColorFilter {public int getColor(){return 0xffffffff;}}""",
"android/graphics/BlendModeColorFilter.java": """package android.graphics;public class BlendModeColorFilter extends ColorFilter {public int getColor(){return 0xffffffff;}}""",
"android/graphics/Bitmap.java": """package android.graphics;public class Bitmap {public enum Config {ARGB_8888,HARDWARE}public static int created;int width,height,generation=1;boolean recycled;public int[] pixels;public Bitmap(int w,int h,int color){width=w;height=h;pixels=new int[w*h];java.util.Arrays.fill(pixels,color);created++;}public static Bitmap createBitmap(int w,int h,Config c){return new Bitmap(w,h,0xff112233);}public int getWidth(){return width;}public int getHeight(){return height;}public int getGenerationId(){return generation;}public boolean isRecycled(){return recycled;}public Config getConfig(){return Config.ARGB_8888;}public Bitmap copy(Config c,boolean mutable){Bitmap b=new Bitmap(width,height,0);b.pixels=pixels.clone();return b;}public void recycle(){recycled=true;}public void getPixels(int[] out,int o,int s,int x,int y,int w,int h){System.arraycopy(pixels,0,out,0,w*h);}public void setPixels(int[] in,int o,int s,int x,int y,int w,int h){System.arraycopy(in,0,pixels,0,w*h);generation++;}}""",
"android/media/MediaDescription.java": """package android.media;public class MediaDescription {final android.graphics.Bitmap bitmap;MediaDescription(android.graphics.Bitmap b){bitmap=b;}public android.graphics.Bitmap getIconBitmap(){return bitmap;}}""",
"android/media/MediaMetadata.java": """package android.media;public class MediaMetadata {public static final String METADATA_KEY_ALBUM_ART=\"album\",METADATA_KEY_ART=\"art\";public final android.graphics.Bitmap bitmap;public MediaMetadata(android.graphics.Bitmap b){bitmap=b;}public MediaDescription getDescription(){return new MediaDescription(bitmap);}public android.graphics.Bitmap getBitmap(String key){return bitmap;}}""",
"android/media/session/MediaController.java": """package android.media.session;public class MediaController {final Object token=new Object();public Object getSessionToken(){return token;}}""",
"android/os/Looper.java": """package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}""",
"android/os/Handler.java": """package android.os;public class Handler {static final java.util.Queue<Runnable> queue=new java.util.concurrent.ConcurrentLinkedQueue<>();public Handler(Looper l){}public boolean post(Runnable r){queue.add(r);return true;}public static void drain(){Runnable r;while((r=queue.poll())!=null)r.run();}}""",
"android/view/ViewTreeObserver.java": """package android.view;public class ViewTreeObserver {public interface OnPreDrawListener {boolean onPreDraw();}public final java.util.List<OnPreDrawListener> listeners=new java.util.ArrayList<>();public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}public boolean isAlive(){return true;}public void draw(){for(OnPreDrawListener l:new java.util.ArrayList<>(listeners))l.onPreDraw();}}""",
"android/widget/ImageView.java": """package android.widget;public class ImageView extends android.view.View {public android.content.res.ColorStateList getImageTintList(){return null;}public android.graphics.ColorFilter getColorFilter(){return null;}}""",
"ls/augment/com/ConfigSnapshot.java": """package ls.augment.com;public class ConfigSnapshot {public final java.util.Map<String,String> values=new java.util.HashMap<>();public String get(String key){return values.get(key);}}""",
"ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;import android.content.Context;public class FeatureSettings {static final ls.augment.com.ConfigSnapshot snapshot=new ls.augment.com.ConfigSnapshot();static final java.util.Set<Runnable> listeners=new java.util.HashSet<>();static final java.util.Map<String,String> diagnostic=new java.util.HashMap<>();static boolean enabled(Context c,String k){return \"1\".equals(snapshot.get(k));}static int integer(Context c,String k,int d,int min,int max){try{return Math.max(min,Math.min(max,Integer.parseInt(snapshot.get(k))));}catch(Exception e){return d;}}static ls.augment.com.ConfigSnapshot snapshot(Context c){return snapshot;}static void addSnapshotListener(Context c,Runnable r){listeners.add(r);}static void removeSnapshotListener(Runnable r){listeners.remove(r);}static void diagnostic(Context c,String k,String v){diagnostic.put(k,v);}static void put(String key,String value){snapshot.values.put(key,value);for(Runnable r:new java.util.ArrayList<>(listeners))r.run();}}""",
"ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;public class AugmentModule {}""",
"ls/augment/com/hook/SystemUiAdapter.java": """package ls.augment.com.hook;import java.lang.reflect.*;public class SystemUiAdapter {static final Object PASS=new Object();interface Patch {Object apply(Object o,Object[] a,Object r)throws Throwable;}static int hookNamed(AugmentModule m,ClassLoader l,String n,String c,String method,int count,Patch before,Patch after){return 1;}static Object field(Object o,String n){if(o==null)return null;for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(ReflectiveOperationException e){}return null;}static Object call(Object o,String name,Object...args)throws ReflectiveOperationException{if(o==null)return null;for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(o,args);}throw new NoSuchMethodException(name);}}""",
"com/zte/controlcenter/view/ControlCenterPanelView.java": """package com.zte.controlcenter.view;public class ControlCenterPanelView extends android.view.ViewGroup {public android.view.ViewGroup allTilesLayout=new android.view.ViewGroup(),bigTilesLayout=new android.view.ViewGroup();public TopPanel topPanel=new TopPanel();public ControlCenterPanelView(){addView(allTilesLayout);addView(bigTilesLayout);addView(topPanel);}public static class TopPanel extends android.view.ViewGroup {public android.view.View brightness,volume,player;public android.widget.SeekBar mVolumeSlider;}}""",
"com/zte/controlcenter/view/ControlCenterMediaPlayerView.java": """package com.zte.controlcenter.view;public class ControlCenterMediaPlayerView extends android.view.ViewGroup {public android.media.MediaMetadata mMediaMetadata;public android.media.session.MediaController mMediaController=new android.media.session.MediaController();public boolean mIsMediaSessionDestroyed;public String mCurrentPlayPkg=\"music\";public android.widget.TextView mTitleText=new android.widget.TextView();public ControlCenterMediaPlayerView(){setBackground(new android.graphics.drawable.GradientDrawable());addView(mTitleText);}public boolean isSupportMediaControl(String pkg){return pkg.equals(\"music\");}}""",
})

# Extend reused framework facades without changing the older runner.
FILES["android/graphics/Bitmap.java"] = FILES["android/graphics/Bitmap.java"].replace("public static Bitmap createBitmap", "public static Bitmap createScaledBitmap(Bitmap b,int w,int h,boolean filter){return new Bitmap(w,h,b.pixels[0]);}public static Bitmap createBitmap")
FILES["android/graphics/Color.java"] = FILES["android/graphics/Color.java"].replace("public static float luminance", "public static int rgb(int r,int g,int b){return 0xff000000|r<<16|g<<8|b;}public static float luminance")
FILES["android/view/View.java"] = FILES["android/view/View.java"].replace("public Context getContext()", "final ViewTreeObserver observer=new ViewTreeObserver();public ViewTreeObserver getViewTreeObserver(){return observer;}public int[] getDrawableState(){return new int[0];}public Context getContext()")
FILES["android/graphics/drawable/Drawable.java"] = FILES["android/graphics/drawable/Drawable.java"].replace("public void setColorFilter", "public ColorFilter getColorFilter(){return null;}public void setColorFilter")
FILES["android/graphics/drawable/GradientDrawable.java"] = FILES["android/graphics/drawable/GradientDrawable.java"].replace("RECTANGLE=0", "RECTANGLE=0,OVAL=1").replace("public float radius", "public void setCornerRadius(float r){radius=r;radii=null;invalidateSelf();}public void setCornerRadii(float[] r){radii=r;invalidateSelf();}public float radius")
FILES["android/graphics/drawable/LayerDrawable.java"] = FILES["android/graphics/drawable/LayerDrawable.java"].replace("public class LayerDrawable extends Drawable implements Drawable.Callback {", "public class LayerDrawable extends Drawable implements Drawable.Callback {public int getNumberOfLayers(){return 2;}public Drawable getDrawable(int i){return findDrawableByLayerId(i+1);}")
for kind in ("InsetDrawable", "ScaleDrawable", "ClipDrawable"):
    FILES[f"android/graphics/drawable/{kind}.java"] = f"package android.graphics.drawable;public class {kind} extends Drawable {{public Drawable getDrawable(){{return null;}}}}"
FILES["android/graphics/Canvas.java"] = FILES["android/graphics/Canvas.java"].replace("public class Canvas {", """public class Canvas {Bitmap bitmap;public Canvas(){}public Canvas(Bitmap b){bitmap=b;}public int save(){stack.add(alpha);return stack.size();}public void clipPath(Path p){}public void drawRoundRect(RectF r,float x,float y,Paint p){record(\"fill\");}public void drawPath(Path p,Paint paint){record(\"fill\");}public void drawRect(RectF r,Paint p){record(\"wash\");}public void drawBitmap(Bitmap b,Rect source,Rect target,Paint p){if(bitmap!=null)java.util.Arrays.fill(bitmap.pixels,b.pixels[0]);record(\"bitmap\");}public void drawBitmap(Bitmap b,Rect source,RectF target,Paint p){record(\"bitmap\");}""")

FILES["ls/augment/com/hook/TestControlCenterAppearanceRuntime.java"] = r"""
package ls.augment.com.hook;
import android.view.*;import android.graphics.*;import android.graphics.drawable.*;import android.widget.*;
import com.zte.controlcenter.view.*;import com.zte.qs.tileimpl.*;import java.lang.reflect.*;import java.util.concurrent.*;
import static ls.augment.com.ControlCenterAppearanceOptions.*;
public class TestControlCenterAppearanceRuntime {
static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
static Object call(Object owner,String method,Object...args)throws Exception{Class<?> c=owner instanceof Class?(Class<?>)owner:owner.getClass();for(Method m:c.getDeclaredMethods())if(m.getName().equals(method)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(owner instanceof Class?null:owner,args);}throw new NoSuchMethodException(method);}
static Object field(Object owner,String name)throws Exception{Field f=owner.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(owner);}
static void await(Object state)throws Exception{long end=System.currentTimeMillis()+5000;while(System.currentTimeMillis()<end){android.os.Handler.drain();if(!(Boolean)field(state,"busy"))return;Thread.sleep(5);}throw new AssertionError("worker timeout");}
public static void main(String[]args)throws Exception{
ControlCenterPanelView panel=new ControlCenterPanelView();QSTileViewWide wide=new QSTileViewWide();QSTileViewCircle circle=new QSTileViewCircle();panel.allTilesLayout.addView(wide);panel.allTilesLayout.addView(circle);wide.setPadding(2,3,4,5);
Object state=call(ControlCenterAppearanceHook.class,"watch",panel);
check(wide.getBackground()==wide.colorBackgroundDrawable,"disabled leaves native background reference");
float nativeRadius=wide.colorBackgroundDrawable.radius;FeatureSettings.put(CORNERS,"1");FeatureSettings.put(RADIUS,"18");call(state,"prepare");
check(wide.getBackground()!=wide.colorBackgroundDrawable&&wide.colorBackgroundDrawable.radius==18,"rounded material wraps exact native background");
check(wide.getPaddingLeft()==2&&wide.getPaddingBottom()==5,"background changes preserve padding");
check(circle.iconFrame.width==64&&circle.width==200,"circle hit region and measured dimensions unchanged");
wide.colorBackgroundDrawable.setCornerRadii(new float[]{8,8,9,9,10,10,11,11});call(state,"prepare");FeatureSettings.put(CORNERS,"0");
check(wide.getBackground()==wide.colorBackgroundDrawable&&wide.colorBackgroundDrawable.radii[2]==9,"disable restores latest native theme geometry");
FeatureSettings.put(TILES,"1");call(state,"prepare");Canvas canvas=new Canvas();wide.getBackground().draw(canvas);check(canvas.events.contains("native")&&!canvas.events.contains("fill"),"inactive tile draws native state");
wide.lastState=2;call(state,"prepare");canvas=new Canvas();wide.getBackground().draw(canvas);check(canvas.events.contains("fill"),"only actual active state is painted");
Field disabledField=ControlCenterAppearanceHook.class.getDeclaredField("DISABLED");disabledField.setAccessible(true);java.util.Map<View,Boolean> disabled=(java.util.Map<View,Boolean>)disabledField.get(null);disabled.put(wide,true);call(state,"prepare");canvas=new Canvas();wide.getBackground().draw(canvas);check(!canvas.events.contains("fill"),"policy-disabled active tile remains native");disabled.put(wide,false);call(state,"prepare");
FeatureSettings.put(TILE_OPACITY,"0");canvas=new Canvas();wide.getBackground().draw(canvas);check(canvas.events.contains("native"),"zero opacity draws original background");
FeatureSettings.put(TILE_OPACITY,"100");wide.lastState=0;call(state,"prepare");canvas=new Canvas();wide.getBackground().draw(canvas);check(!canvas.events.contains("fill"),"unavailable state is never recolored");
FeatureSettings.put(TILES,"0");check(wide.getBackground()==wide.colorBackgroundDrawable,"disabling fill restores exact native animated drawable");
check(wide.colorBackgroundDrawable.getCallback()==wide,"restored native animations retain their View callback");
ViewGroup sliderFrame=new ViewGroup();SeekBar slider=new SeekBar();slider.progress=new LayerDrawable();sliderFrame.addView(slider);panel.topPanel.addView(sliderFrame);panel.topPanel.volume=sliderFrame;panel.topPanel.mVolumeSlider=slider;LayerDrawable progress=(LayerDrawable)slider.getProgressDrawable();GradientDrawable track=(GradientDrawable)progress.findDrawableByLayerId(1);float oldTrack=track.radius;FeatureSettings.put(CORNERS,"1");call(state,"prepare");check(track.radius==18,"slider original track receives same dp radius");progress.setLevel(3333);check(progress.findDrawableByLayerId(2).getLevel()==3333,"slider native progress level stays live");FeatureSettings.put(CORNERS,"0");check(track.radius==oldTrack&&slider.getProgressDrawable()==progress,"slider closes back to original drawable and radius");
ControlCenterMediaPlayerView media=new ControlCenterMediaPlayerView();panel.topPanel.addView(media);Drawable nativeMedia=media.getBackground();media.mMediaMetadata=new android.media.MediaMetadata(new Bitmap(700,350,0xff234567));
Object ms=call(ControlCenterMediaAppearanceHook.class,"watch",media);FeatureSettings.put(MEDIA,"1");await(ms);call(ms,"refresh");await(ms);
check(field(ms,"artwork")!=null,"artwork from OEM selected session publishes");Object art=field(ms,"artwork");Bitmap prepared=(Bitmap)field(art,"bitmap");check(prepared.getWidth()==256&&prepared.getHeight()==128,"cover cache is bounded and keeps aspect ratio");
int created=Bitmap.created;for(int i=0;i<100;i++)media.getBackground().draw(new Canvas());check(created==Bitmap.created,"drawing never decodes or allocates a cover bitmap");
call(ms,"refresh");await(ms);check(Bitmap.created==created,"unchanged metadata reuses cache");
Field workerField=ControlCenterMediaAppearanceHook.class.getDeclaredField("WORKER");workerField.setAccessible(true);ThreadPoolExecutor worker=(ThreadPoolExecutor)workerField.get(null);CountDownLatch gate=new CountDownLatch(1);worker.execute(()->{try{gate.await();}catch(InterruptedException e){Thread.currentThread().interrupt();}});
media.mMediaMetadata=new android.media.MediaMetadata(new Bitmap(500,500,0xffc08040));call(ms,"refresh");media.mMediaMetadata=new android.media.MediaMetadata(new Bitmap(400,600,0xff123456));call(ms,"refresh");gate.countDown();await(ms);
check(((Bitmap)field(field(ms,"artwork"),"bitmap")).getHeight()==256,"late old-song worker cannot overwrite latest cover");
media.mMediaMetadata=new android.media.MediaMetadata(null);call(ms,"refresh");check(field(ms,"artwork")==null,"missing cover clears previous song");
media.mMediaMetadata=new android.media.MediaMetadata(new Bitmap(50,50,0xff654321));call(ms,"refresh");await(ms);media.mIsMediaSessionDestroyed=true;call(ms,"refresh");check(field(ms,"artwork")==null,"destroyed session clears background even if metadata remains");
FeatureSettings.put(MEDIA,"0");check(media.getBackground()==nativeMedia,"disable restores OEM media background reference");
check(nativeMedia.getCallback()==media,"media native drawable callback restored");
FeatureSettings.put(CORNERS,"1");media.width=30;media.height=40;media.getViewTreeObserver().draw();check(((GradientDrawable)nativeMedia).radius==15,"media radius follows resize and clamps to short edge");
media.detach();panel.detach();check(media.getBackground()==nativeMedia&&wide.getBackground()==wide.colorBackgroundDrawable,"detach releases every owned background");check(FeatureSettings.listeners.isEmpty(),"detach removes configuration listeners");
check(!ControlCenterAppearanceHook.ownsMaterial(new View(),new View(),false),"unrecognized view is never claimed from glass");
FeatureSettings.put(CORNERS,"0");FeatureSettings.put(TILES,"1");FeatureSettings.put(MEDIA,"0");
check(ControlCenterAppearanceHook.ownsMaterial(wide,wide,false)&&ControlCenterAppearanceHook.ownsMaterial(circle.iconFrame,circle,false)&&!ControlCenterAppearanceHook.ownsMaterial(sliderFrame,sliderFrame,true)&&!ControlCenterAppearanceHook.ownsMaterial(media,media,false),"tile fill priority claims only tile surfaces, including inactive states for stable ownership");
FeatureSettings.put(TILES,"0");FeatureSettings.put(MEDIA,"1");
check(!ControlCenterAppearanceHook.ownsMaterial(wide,wide,false)&&ControlCenterAppearanceHook.ownsMaterial(media,media,false),"media cover priority leaves tiles available to glass");
FeatureSettings.put(MEDIA,"0");FeatureSettings.put(CORNERS,"1");
check(ControlCenterAppearanceHook.ownsMaterial(wide,wide,false)&&ControlCenterAppearanceHook.ownsMaterial(media,media,false)&&ControlCenterAppearanceHook.ownsMaterial(sliderFrame,sliderFrame,true),"uniform corner priority covers tile media and actual slider surfaces");
FeatureSettings.put(CORNERS,"0");
check(!ControlCenterAppearanceHook.ownsMaterial(wide,wide,false)&&!ControlCenterAppearanceHook.ownsMaterial(media,media,false)&&!ControlCenterAppearanceHook.ownsMaterial(sliderFrame,sliderFrame,true),"all appearance switches off release every known surface to glass");
System.out.println("PASS production CC appearance lifecycle: "+checks+" checks; facade only, GPU and OEM visuals unverified");
}}
"""

for source in ("EnhancementOption", "ControlCenterAppearanceOptions", "ControlCenterAppearancePolicy"):
    FILES[f"ls/augment/com/{source}.java"] = (ROOT / f"android/app/src/main/java/ls/augment/com/{source}.java").read_text(encoding="utf-8")
for source in ("ControlCenterNativeDrawable", "ControlCenterAppearanceHook", "ControlCenterMediaAppearanceHook"):
    FILES[f"ls/augment/com/hook/{source}.java"] = (ROOT / f"android/app/src/main/java/ls/augment/com/hook/{source}.java").read_text(encoding="utf-8")

def java_tool(name):
    path = shutil.which(name)
    if path:
        return path
    home = Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8"))
    candidate = home / "bin" / (name + (".exe" if os.name == "nt" else ""))
    if candidate.is_file():
        return str(candidate)
    raise SystemExit("A local JDK is required for development tests")

with tempfile.TemporaryDirectory(prefix="duo-cc-appearance-") as directory:
    sources=[]
    for name,content in FILES.items():
        path=Path(directory)/name
        path.parent.mkdir(parents=True,exist_ok=True)
        path.write_text(content,encoding="utf-8")
        sources.append(str(path))
    subprocess.run([java_tool("javac"),"-encoding","UTF-8","-d",directory,*sources],check=True)
    subprocess.run([java_tool("java"),"-cp",directory,"ls.augment.com.hook.TestControlCenterAppearanceRuntime"],check=True)
