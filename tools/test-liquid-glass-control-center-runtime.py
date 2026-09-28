"""Exercise the production Control Center hook against an Android/OEM facade.

Validates material attachment and restoration, native state/foreground, slider
layer ownership, shared sampling and fallback. This does not validate GPU optics.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = {
"android/animation/ValueAnimator.java": """package android.animation;public class ValueAnimator {public static boolean enabled;public static boolean areAnimatorsEnabled(){return enabled;}}""",
"android/os/SystemClock.java": """package android.os;public class SystemClock {public static long now=1000;public static long uptimeMillis(){return now;}}""",
"android/util/DisplayMetrics.java": """package android.util;public class DisplayMetrics {public float density=1;}""",
"android/R.java": """package android;public final class R {public static final class id {public static final int background=1,progress=2;}}""",
"android/content/Context.java": """package android.content;public class Context {}""",
"android/content/res/Resources.java": """package android.content.res;public class Resources {final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}public int getIdentifier(String name,String type,String pkg){return name.hashCode();}}""",
"android/content/res/ColorStateList.java": """package android.content.res;public class ColorStateList {final int color;public ColorStateList(int c){color=c;}public int getDefaultColor(){return color;}}""",
"android/graphics/Color.java": """package android.graphics;public class Color {public static final int BLACK=0xff000000,WHITE=0xffffffff;public static float luminance(int c){return (((c>>16)&255)*.2126f+((c>>8)&255)*.7152f+(c&255)*.0722f)/255;}}""",
"android/graphics/Rect.java": """package android.graphics;public class Rect {public int left,top,right,bottom;
public Rect(){}public Rect(int l,int t,int r,int b){set(l,t,r,b);}public Rect(Rect r){set(r);}
public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public void set(Rect r){set(r.left,r.top,r.right,r.bottom);}
public int width(){return right-left;}public int height(){return bottom-top;}public boolean isEmpty(){return width()<=0||height()<=0;}
public void offset(int x,int y){left+=x;right+=x;top+=y;bottom+=y;}public boolean contains(int x,int y){return x>=left&&x<right&&y>=top&&y<bottom;}
public boolean contains(Rect r){return !r.isEmpty()&&r.left>=left&&r.top>=top&&r.right<=right&&r.bottom<=bottom;}
public boolean equals(Object o){if(!(o instanceof Rect))return false;Rect r=(Rect)o;return left==r.left&&top==r.top&&right==r.right&&bottom==r.bottom;}}""",
"android/graphics/Canvas.java": """package android.graphics;public class Canvas {public boolean hardware=true;public boolean isHardwareAccelerated(){return hardware;}
public final java.util.List<String> events=new java.util.ArrayList<>();public final java.util.List<Integer> eventAlphas=new java.util.ArrayList<>();
public final java.util.List<Integer> stack=new java.util.ArrayList<>();public int layersCreated;int alpha=255;
public int saveLayerAlpha(Object bounds,int opacity){layersCreated++;stack.add(alpha);alpha=Math.round(alpha*opacity/255f);return stack.size();}
public void restoreToCount(int save){while(stack.size()>=save){alpha=stack.remove(stack.size()-1);}}
public void record(String name){events.add(name);eventAlphas.add(alpha);}}""",
"android/graphics/ColorFilter.java": """package android.graphics;public class ColorFilter {}""",
"android/graphics/Outline.java": """package android.graphics;public class Outline {}""",
"android/graphics/PixelFormat.java": """package android.graphics;public class PixelFormat {public static final int TRANSLUCENT=-3;}""",
"android/graphics/PorterDuff.java": """package android.graphics;public class PorterDuff {public enum Mode {SRC_IN}}""",
"android/graphics/drawable/Drawable.java": """package android.graphics.drawable;
import android.graphics.*;import android.content.res.ColorStateList;
public class Drawable {
public interface Callback {void invalidateDrawable(Drawable d);void scheduleDrawable(Drawable d,Runnable r,long t);void unscheduleDrawable(Drawable d,Runnable r);}
public String tag="native";public int draws,alpha=255;final Rect bounds=new Rect();private Callback callback;private int level;private int[] state=new int[0];
public void draw(Canvas c){draws++;c.record(tag);}public void setCallback(Callback c){callback=c;}public Callback getCallback(){return callback;}
public void invalidateSelf(){if(callback!=null)callback.invalidateDrawable(this);}public void scheduleSelf(Runnable r,long t){if(callback!=null)callback.scheduleDrawable(this,r,t);}
public void unscheduleSelf(Runnable r){if(callback!=null)callback.unscheduleDrawable(this,r);}
public void setBounds(int l,int t,int r,int b){setBounds(new Rect(l,t,r,b));}public void setBounds(Rect r){if(!bounds.equals(r)){bounds.set(r);onBoundsChange(r);}}
public Rect getBounds(){return bounds;}protected void onBoundsChange(Rect r){}public void setAlpha(int a){alpha=a;invalidateSelf();}public int getAlpha(){return alpha;}
public void setColorFilter(ColorFilter f){}public void setTintList(ColorStateList t){}public void setTintMode(PorterDuff.Mode m){}
public boolean isStateful(){return true;}protected boolean onStateChange(int[] s){return true;}protected boolean onLevelChange(int l){return true;}
public boolean setState(int[] s){state=s;return onStateChange(s);}public int[] getState(){return state;}public boolean setLevel(int l){level=l;return onLevelChange(l);}public int getLevel(){return level;}
public boolean setVisible(boolean v,boolean r){return true;}public void setHotspot(float x,float y){}public void setHotspotBounds(int l,int t,int r,int b){}
public boolean getPadding(Rect p){p.set(0,0,0,0);return false;}public int getIntrinsicWidth(){return -1;}public int getIntrinsicHeight(){return -1;}
public int getMinimumWidth(){return 0;}public int getMinimumHeight(){return 0;}public void getOutline(Outline o){}public void jumpToCurrentState(){}public int getOpacity(){return 0;}
}""",
"android/graphics/drawable/GradientDrawable.java": """package android.graphics.drawable;import android.content.res.ColorStateList;public class GradientDrawable extends Drawable {public static final int RECTANGLE=0;public float radius=16;public float[] radii;public int getShape(){return RECTANGLE;}public float getCornerRadius(){return radius;}public float[] getCornerRadii(){return radii;}public int[] colors={0xff8178ff,0xff8178ff};public int[] getColors(){return colors;}public ColorStateList getColor(){return null;}}""",
"android/graphics/drawable/LayerDrawable.java": """package android.graphics.drawable;import android.graphics.Canvas;
public class LayerDrawable extends Drawable implements Drawable.Callback {
public final java.util.Map<Integer,Drawable> layers=new java.util.LinkedHashMap<>();public LayerDrawable(){setDrawableByLayerId(1,new GradientDrawable());setDrawableByLayerId(2,new Drawable());layers.get(1).tag="native-track";layers.get(2).tag="white-progress";}
public Drawable findDrawableByLayerId(int id){return layers.get(id);}public boolean setDrawableByLayerId(int id,Drawable d){Drawable old=layers.put(id,d);if(old!=null)old.setCallback(null);d.setCallback(this);return true;}
@Override public void draw(Canvas c){for(Drawable d:layers.values())d.draw(c);}
@Override protected boolean onLevelChange(int level){for(Drawable d:layers.values())d.setLevel(level);return true;}
public void invalidateDrawable(Drawable d){invalidateSelf();}public void scheduleDrawable(Drawable d,Runnable r,long t){scheduleSelf(r,t);}public void unscheduleDrawable(Drawable d,Runnable r){unscheduleSelf(r);}}""",
"android/view/ViewParent.java": """package android.view;public interface ViewParent {}""",
"android/view/View.java": """package android.view;import android.content.Context;import android.content.res.Resources;import android.graphics.*;import android.graphics.drawable.Drawable;
public class View implements ViewParent,Drawable.Callback {
public int width=200,height=80,left,top,id,invalidations;public boolean attached=true,shown=true;public ViewGroup parent;
public Drawable background;public final java.util.List<OnAttachStateChangeListener> listeners=new java.util.ArrayList<>();final Context context=new Context();final Resources resources=new Resources();
private int pl,pt,pr,pb;
public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
public Context getContext(){return context;}public Resources getResources(){return resources;}public ViewParent getParent(){return parent;}
public View findViewById(int n){return id==n?this:null;}public int getWidth(){return width;}public int getHeight(){return height;}public boolean isShown(){return shown&&attached;}public boolean isAttachedToWindow(){return attached;}
public Drawable getBackground(){return background;}public void setBackground(Drawable d){if(background!=null)background.setCallback(null);background=d;
if(d!=null){d.setCallback(this);Rect p=new Rect();d.getPadding(p);setPadding(p.left,p.top,p.right,p.bottom);d.setBounds(0,0,width,height);}}
public int getPaddingLeft(){return pl;}public int getPaddingTop(){return pt;}public int getPaddingRight(){return pr;}public int getPaddingBottom(){return pb;}
public void setPadding(int l,int t,int r,int b){pl=l;pt=t;pr=r;pb=b;}public void invalidate(){invalidations++;}public void postInvalidateOnAnimation(){invalidate();}
public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}public void detach(){attached=false;for(OnAttachStateChangeListener l:listeners)l.onViewDetachedFromWindow(this);}
public void invalidateDrawable(Drawable d){invalidate();}public void scheduleDrawable(Drawable d,Runnable r,long t){}public void unscheduleDrawable(Drawable d,Runnable r){}
}""",
"android/view/ViewGroup.java": """package android.view;import android.graphics.Rect;public class ViewGroup extends View {
public final java.util.List<View> children=new java.util.ArrayList<>();public void addView(View v){children.add(v);v.parent=this;}
public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}
@Override public View findViewById(int id){View found=super.findViewById(id);if(found!=null)return found;for(View v:children){found=v.findViewById(id);if(found!=null)return found;}return null;}
public void offsetDescendantRectToMyCoords(View v,Rect r){while(v!=this){if(v==null)throw new IllegalArgumentException();r.offset(v.left,v.top);v=v.parent;}}
}""",
"android/view/MotionEvent.java": """package android.view;public class MotionEvent {public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3;public int getActionMasked(){return ACTION_UP;}public float getX(){return 0;}public float getY(){return 0;}}""",
"android/widget/SeekBar.java": """package android.widget;import android.graphics.drawable.Drawable;public class SeekBar extends android.view.View {public Drawable progress;public Drawable getProgressDrawable(){return progress;}}""",
"android/widget/TextView.java": """package android.widget;public class TextView extends android.view.View {public int color=0xff000000;public int getCurrentTextColor(){return color;}}""",
"ls/augment/com/GlassOptions.java": """package ls.augment.com;public class GlassOptions {public static final String CONTROL_CENTER="enabled",CC_REDUCE_TRANSPARENCY="opaque",CC_REDUCE_MOTION="motion";}""",
"ls/augment/com/LayerBackdropSource.java": """package ls.augment.com;import android.view.View;import android.graphics.*;
public class LayerBackdropSource {public static int created,releases,requests;public boolean available=true,released;public long revision=1;public String reason="test-unavailable";
public LayerBackdropSource(View v){created++;}public void setRegion(Rect r){}public void request(){requests++;}public boolean isValid(){return available&&!released;}
public boolean drawRegion(Canvas c,Rect r,int w,int h){c.events.add("region");return isValid();}public long revision(){return revision;}
public String failureReason(){return reason;}public void release(){if(released)throw new AssertionError("double source release");released=true;releases++;}}""",
"ls/augment/com/LiquidGlassDrawable.java": """package ls.augment.com;import android.view.View;import android.graphics.*;import android.graphics.drawable.Drawable;
public class LiquidGlassDrawable extends Drawable {
public interface BackdropSource {boolean draw(Canvas c,int w,int h);default boolean isValid(){return true;}default long revision(){return -1;}}
public static int created,releases;public final BackdropSource source;public boolean ready,released,light,iconOnly,controlSurface,opaque,motion,fallback=true,throwPrepare,failed,failGpu;public int tint;public float strength,radius;public String forcedReason;
public LiquidGlassDrawable(View v,BackdropSource b,float r){source=b;radius=r;created++;}public void setIconOnly(boolean v){iconOnly=v;}public void setControlSurface(boolean v){controlSurface=v;}
public void setMaterialTint(int c,float s){tint=c;strength=s;}public void setForegroundIsLight(boolean v){light=v;}public void invalidateBackdrop(){}
public void updatePreferences(boolean o,boolean m){opaque=o;motion=m;}public boolean prepare(){if(throwPrepare)throw new IllegalStateException("test failure");return ready=forcedReason==null&&!failed&&!released&&(opaque||source.isValid());}
public String failureReason(){return forcedReason!=null?forcedReason:failed?"renderer_unavailable":ready?"":"backdrop_unavailable";}
public boolean isReady(){return ready&&!released&&!failed;}public boolean isFailed(){return failed;}@Override public void draw(Canvas c){if(!c.isHardwareAccelerated())return;if(failGpu){failed=true;ready=false;return;}if(!opaque&&!source.isValid()){ready=false;return;}c.record(opaque?"solid-glass":"glass");}
public boolean drawFallback(Canvas c){if(!c.isHardwareAccelerated()||!fallback||released)return false;c.record("fallback");return true;}public void setInteraction(float x,float y,boolean p){}
public void release(){if(released)throw new AssertionError("double glass release");released=true;releases++;}}
""",
"ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;public class AugmentModule {}""",
"ls/augment/com/hook/SystemUiAdapter.java": """package ls.augment.com.hook;import java.lang.reflect.*;
public class SystemUiAdapter {static final Object PASS=new Object();interface Patch {Object apply(Object o,Object[] a,Object r)throws Throwable;}
static int hookNamed(AugmentModule m,ClassLoader l,String ns,String c,String name,int n,Patch b,Patch a){return 1;}
static Object field(Object o,String name){if(o==null)return null;for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(ReflectiveOperationException e){}return null;}
static Object call(Object o,String name,Object...args)throws ReflectiveOperationException {Method m=o.getClass().getMethod(name);return m.invoke(o,args);}}
""",
"ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;import android.content.Context;public class FeatureSettings {
static boolean active=true,opaque,motion;static int listeners,diagnosticWrites;static String diagnostic;
static boolean enabled(Context c,String key){return key.equals("enabled")?active:key.equals("opaque")?opaque:motion;}
static void addSnapshotListener(Context c,Runnable r){listeners++;}static void removeSnapshotListener(Runnable r){listeners--;}
static void diagnostic(Context c,String key,String value){diagnostic=value;diagnosticWrites++;}}
""",
"com/zte/qs/tileimpl/QSTileViewWide.java": """package com.zte.qs.tileimpl;import android.graphics.drawable.GradientDrawable;import android.widget.TextView;
public class QSTileViewWide extends android.view.ViewGroup {public GradientDrawable colorBackgroundDrawable=new GradientDrawable();public int lastState=1;public TextView label=new TextView();
public QSTileViewWide(){setBackground(colorBackgroundDrawable);addView(label);}public TextView getLabel(){return label;}}""",
"com/zte/qs/tileimpl/QSTileViewCircle.java": """package com.zte.qs.tileimpl;import android.graphics.drawable.GradientDrawable;import android.widget.TextView;import android.view.ViewGroup;
public class QSTileViewCircle extends ViewGroup {public GradientDrawable colorBackgroundDrawable=new GradientDrawable();public int lastState=2;public TextView label=new TextView();public ViewGroup iconFrame=new ViewGroup();
public QSTileViewCircle(){iconFrame.width=64;iconFrame.height=64;iconFrame.setBackground(colorBackgroundDrawable);addView(iconFrame);addView(label);}public TextView getLabel(){return label;}}""",
"ls/augment/com/hook/TestControlCenterGlass.java": """package ls.augment.com.hook;
import android.view.*;import android.widget.*;import android.graphics.*;import android.graphics.drawable.*;
import java.lang.reflect.*;import ls.augment.com.*;import com.zte.qs.tileimpl.*;
public class TestControlCenterGlass {
static int checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
public static class Top extends ViewGroup {public View player,brightness,volume;public SeekBar mVolumeSlider;}
public static class Panel extends ViewGroup {public ViewGroup allTilesLayout=new ViewGroup(),bigTilesLayout=new ViewGroup();public Top topPanel=new Top();
public Panel(){width=1000;height=2000;addView(allTilesLayout);addView(bigTilesLayout);addView(topPanel);}}
static Object field(Object o,String n)throws Exception{for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(NoSuchFieldException e){}throw new NoSuchFieldException(n);}
static Object call(Object o,String n)throws Exception{Method m=o.getClass().getDeclaredMethod(n);m.setAccessible(true);return m.invoke(o);}
static Object watch(Panel p)throws Exception{Method m=LiquidGlassControlCenterHook.class.getDeclaredMethod("watch",View.class);m.setAccessible(true);return m.invoke(null,p);}
static LiquidGlassDrawable glass(View view)throws Exception{return (LiquidGlassDrawable)field(field(view.getBackground(),"surface"),"glass");}
static void draw(View v,Canvas c){v.getBackground().draw(c);}
static void canvasForCircle(QSTileViewCircle circle){draw(circle.iconFrame,new Canvas());}
public static void main(String[] args)throws Exception {
Panel p=new Panel();Drawable panelBackground=new Drawable();p.setBackground(panelBackground);
QSTileViewWide wide=new QSTileViewWide();wide.left=20;wide.top=20;wide.setPadding(9,10,11,12);p.topPanel.addView(wide);p.bigTilesLayout=null;
QSTileViewCircle circle=new QSTileViewCircle();circle.top=120;p.allTilesLayout.addView(circle);
View player=new View();player.left=240;player.top=20;player.height=180;Drawable nativePlayer=new Drawable();player.setBackground(nativePlayer);p.topPanel.player=player;p.topPanel.addView(player);
ViewGroup volume=new ViewGroup();volume.left=500;volume.top=20;volume.width=80;volume.height=180;SeekBar seek=new SeekBar();LayerDrawable layers=new LayerDrawable();seek.progress=layers;volume.addView(seek);p.topPanel.volume=volume;p.topPanel.mVolumeSlider=seek;p.topPanel.addView(volume);
Drawable nativeTrack=layers.findDrawableByLayerId(android.R.id.background),nativeFill=layers.findDrawableByLayerId(android.R.id.progress);
layers.setLevel(5100);
Object state=watch(p);call(state,"prepare");
check(p.getBackground()==panelBackground,"no full-panel replacement");
check(wide.getBackground()!=wide.colorBackgroundDrawable,"actual TopPanel wide tile material replaced even with legacy bigTilesLayout absent");
check(circle.getBackground()==null&&circle.iconFrame.getBackground()!=circle.colorBackgroundDrawable,"circle icon frame owns glass while label remains outside");
check(player.getBackground()!=nativePlayer,"media material replaced");
check(wide.getPaddingLeft()==9&&wide.getPaddingTop()==10&&wide.getPaddingRight()==11&&wide.getPaddingBottom()==12,"custom padding survives material install");
check(layers.findDrawableByLayerId(1)!=nativeTrack&&layers.findDrawableByLayerId(2)==nativeFill,"only slider background layer is wrapped");
check(nativeFill.getLevel()==5100,"installing material preserves the native clipped fill level");
check(LayerBackdropSource.created==1,"all controls share one compositor source");
check(FeatureSettings.diagnostic.equals("active_control_backdrops:ready=4/4;failed=0"),"diagnostic counts the actual top-panel wide tile, circle, media and slider surfaces");
LiquidGlassDrawable gw=glass(wide),gc=glass(circle.iconFrame),gv=glass(volume);
gw.forcedReason="host_unavailable";call(state,"prepare");check(FeatureSettings.diagnostic.contains("ready=3/4;failed=0;reason=host_unavailable")&&FeatureSettings.diagnostic.contains("glass=host_unavailable"),"partial availability reports the host reason without claiming all controls are ready");
int unchangedDiagnostics=FeatureSettings.diagnosticWrites;call(state,"prepare");check(FeatureSettings.diagnosticWrites==unchangedDiagnostics,"unchanged per-frame diagnostics do not write again");gw.forcedReason=null;
LayerBackdropSource diagnosticSource=(LayerBackdropSource)field(state,"source");diagnosticSource.available=false;diagnosticSource.reason="";call(state,"prepare");
check(FeatureSettings.diagnostic.startsWith("translucent_fallback:ready=0/4;failed=0;reason=frame_pending_or_host_unavailable")&&FeatureSettings.diagnostic.contains("glass=backdrop_unavailable"),"empty source reason becomes an explicit pending-or-host diagnostic with glass detail");
gw.failed=true;diagnosticSource.reason="capture_pending";call(state,"prepare");check(FeatureSettings.diagnostic.contains("failed=1;reason=renderer_unavailable")&&FeatureSettings.diagnostic.contains("source=capture_pending"),"permanent renderer failure takes priority over source unavailability while preserving source detail");
gw.failed=false;diagnosticSource.available=true;diagnosticSource.reason="test-unavailable";call(state,"prepare");
check(!gw.light&&gw.strength==0,"inactive native dark label matches glass");
check(!gc.iconOnly&&gc.controlSurface&&gc.light&&gc.strength==.62f,"active monochrome circle retains foreground contrast and controlled backdrop on stronger native tint");
check(gv.radius==16,"slider material uses the native 16dp track corners, not a half-width capsule");
circle.lastState=1;canvasForCircle(circle);check(!gc.light&&!gc.iconOnly&&gc.strength==0,"inactive dark circle glyph retains readable light backing");circle.lastState=2;
wide.lastState=2;wide.label.color=Color.WHITE;wide.colorBackgroundDrawable.colors=new int[]{0xff007acc,0xff007acc};
Canvas canvas=new Canvas();draw(wide,canvas);
check(gw.light&&gw.tint==0xff007acc&&gw.strength==.62f,"child-only display-list redraw updates actual state tint");
check(canvas.events.equals(java.util.List.of("glass")),"native opaque tile fill no longer covers glass");
check(canvas.layersCreated==0,"steady-state tile material draws directly without an offscreen alpha layer");
int invalidations=p.invalidations;wide.colorBackgroundDrawable.invalidateSelf();check(p.invalidations>invalidations,"native background animation invalidates panel");
canvas=new Canvas();draw(volume,canvas);layers.draw(canvas);check(canvas.events.equals(java.util.List.of("glass","white-progress")),"slider white progress is retained over glass");
check(canvas.layersCreated==0,"steady-state slider has no unnecessary offscreen layer");
canvas=new Canvas();canvas.hardware=false;layers.draw(canvas);check(canvas.events.equals(java.util.List.of("native-track","white-progress")),"software track-only draw cannot reuse hardware success to mask native track");
canvas=new Canvas();canvas.hardware=false;draw(wide,canvas);check(canvas.events.equals(java.util.List.of("native")),"hardware-ready material preserves native background on software Canvas");
canvas=new Canvas();canvas.hardware=false;draw(volume,canvas);layers.draw(canvas);check(canvas.events.equals(java.util.List.of("native-track","white-progress")),"software slider draw restores both native track and progress");
canvas=new Canvas();draw(volume,canvas);layers.draw(canvas);check(canvas.events.equals(java.util.List.of("glass","white-progress")),"software fallback does not poison the next hardware frame");
android.animation.ValueAnimator.enabled=true;
canvas=new Canvas();draw(volume,canvas);check(canvas.eventAlphas.equals(java.util.List.of(255)),"enabling animation does not fade an already visible material backwards");
canvas=new Canvas();canvas.hardware=false;draw(volume,canvas);
int animationInvalidations=volume.invalidations;
canvas=new Canvas();draw(volume,canvas);layers.draw(canvas);
check(canvas.events.equals(java.util.List.of("glass","native-track","white-progress"))&&canvas.eventAlphas.equals(java.util.List.of(0,255,255)),"slider material starts invisible while exact native track and fill remain visible");
android.os.SystemClock.now+=80;canvas=new Canvas();draw(volume,canvas);layers.draw(canvas);
check(canvas.eventAlphas.equals(java.util.List.of(128,127,255)),"glass and original track crossfade together without dimming the white fill");
check(canvas.layersCreated==2,"only fractional material and track blends use alpha layers");
layers.setLevel(6700);check(nativeFill.getLevel()==6700,"native slider updates still reach the original fill during the material transition");
check(canvas.stack.isEmpty()&&volume.invalidations>animationInvalidations,"appearance animation balances canvas layers and schedules next frame");
android.os.SystemClock.now+=80;canvas=new Canvas();draw(volume,canvas);layers.draw(canvas);
check(canvas.events.equals(java.util.List.of("glass","white-progress"))&&canvas.eventAlphas.equals(java.util.List.of(255,255)),"native track fully disappears after the 160ms transition");
canvas=new Canvas();canvas.hardware=false;draw(wide,canvas);canvas=new Canvas();draw(wide,canvas);
check(canvas.events.equals(java.util.List.of("glass","native"))&&canvas.eventAlphas.equals(java.util.List.of(0,255)),"tile transition starts with its current original state fully visible");
android.os.SystemClock.now+=80;canvas=new Canvas();draw(wide,canvas);check(canvas.eventAlphas.equals(java.util.List.of(128,127)),"tile appearance interpolates continuously");
gw.throwPrepare=true;canvas=new Canvas();draw(wide,canvas);check(canvas.events.equals(java.util.List.of("native"))&&canvas.eventAlphas.equals(java.util.List.of(255))&&canvas.stack.isEmpty(),"material failure during transition restores full native background immediately");gw.throwPrepare=false;
FeatureSettings.motion=true;call(state,"refresh");canvas=new Canvas();draw(wide,canvas);check(canvas.events.equals(java.util.List.of("glass"))&&canvas.eventAlphas.equals(java.util.List.of(255)),"reduced motion bypasses appearance animation");
FeatureSettings.motion=false;call(state,"refresh");android.animation.ValueAnimator.enabled=false;
LiquidGlassDrawable previousSlider=glass(volume);((GradientDrawable)nativeTrack).radius=40;volume.getResources().getDisplayMetrics().density=2;call(state,"prepare");gv=glass(volume);
check(previousSlider.released&&gv.radius==20,"native corner and density changes rebuild the material using matching dp geometry");
check(layers.findDrawableByLayerId(2)==nativeFill&&nativeFill.getLevel()==6700,"radius refresh retains the original white fill and its current progress");
LayerBackdropSource source=(LayerBackdropSource)field(state,"source");source.available=false;
canvas=new Canvas();layers.draw(canvas);check(canvas.events.contains("native-track"),"stale success cannot swallow track after source invalidation");
canvas=new Canvas();draw(volume,canvas);layers.draw(canvas);check(canvas.events.equals(java.util.List.of("fallback","white-progress")),"unavailable capture uses local translucent fallback and native progress");
int transientRequests=LayerBackdropSource.requests;call(state,"prepare");check(!source.released&&LayerBackdropSource.requests>transientRequests,"temporary missing backdrop retains the capture recovery path");
gv.fallback=false;canvas=new Canvas();draw(volume,canvas);layers.draw(canvas);check(canvas.events.equals(java.util.List.of("native-track","white-progress")),"unavailable fallback restores native slider background");
gw.throwPrepare=true;canvas=new Canvas();draw(wide,canvas);check(canvas.events.equals(java.util.List.of("native")),"runtime material error preserves native background drawing");gw.throwPrepare=false;
source.available=true;gw.failGpu=true;canvas=new Canvas();draw(wide,canvas);check(gw.failed&&canvas.events.equals(java.util.List.of("fallback")),"AGSL GPU failure enters fallback");
LiquidGlassDrawable failedGlass=gw;LayerBackdropSource failedSource=source;
FeatureSettings.opaque=true;call(state,"refresh");check(failedGlass.released&&failedSource.released&&wide.getBackground()==wide.colorBackgroundDrawable,"opaque toggle releases failed renderer and restores native background before rebuilding");
call(state,"prepare");gw=glass(wide);source=(LayerBackdropSource)field(state,"source");check(gw!=failedGlass&&gw.opaque&&!gw.failed,"reduced transparency creates a healthy solid material after GPU failure");
canvas=new Canvas();draw(wide,canvas);check(canvas.events.equals(java.util.List.of("solid-glass")),"opaque recovery draws solid glass instead of translucent fallback");
int oldRequests=LayerBackdropSource.requests;call(state,"prepare");check(oldRequests==LayerBackdropSource.requests,"opaque mode does not request captures");
Drawable newerMedia=new Drawable();player.setBackground(newerMedia);call(state,"prepare");check(field(player.getBackground(),"original")==newerMedia,"theme resource replacement is rewrapped");
check(nativePlayer.getCallback()==null,"superseded native material releases stale callback");
FeatureSettings.active=false;call(state,"refresh");
check(wide.getBackground()==wide.colorBackgroundDrawable&&circle.iconFrame.getBackground()==circle.colorBackgroundDrawable,"disable restores exact tile originals");
check(player.getBackground()==newerMedia,"disable restores latest OEM media background");
check(layers.findDrawableByLayerId(1)==nativeTrack&&layers.findDrawableByLayerId(2)==nativeFill,"disable restores native slider identities");
check(wide.colorBackgroundDrawable.getCallback()==wide,"restored native drawable callback returns to view");
check(wide.getPaddingLeft()==9&&wide.getPaddingBottom()==12,"disable preserves native custom padding");
check(source.released,"disable releases compositor source");
FeatureSettings.active=true;FeatureSettings.opaque=false;call(state,"refresh");call(state,"prepare");
source=(LayerBackdropSource)field(state,"source");for(View v:new View[]{wide,circle.iconFrame,player,volume})glass(v).failed=true;
int failedRequests=LayerBackdropSource.requests,failedCreated=LayerBackdropSource.created;call(state,"prepare");
check(source.released&&LayerBackdropSource.requests==failedRequests,"all permanently failed renderers stop capture without another request");
for(int i=0;i<3;i++){call(state,"prepare");canvas=new Canvas();draw(wide,canvas);check(canvas.events.equals(java.util.List.of("fallback")),"permanently failed renderers retain translucent fallback "+i);}
check(LayerBackdropSource.created==failedCreated&&LayerBackdropSource.requests==failedRequests,"failed surfaces do not recreate or keep requesting compositor capture");
QSTileViewWide added=new QSTileViewWide();added.left=20;added.top=400;p.topPanel.addView(added);call(state,"prepare");
check(LayerBackdropSource.created==failedCreated+1&&!((LayerBackdropSource)field(state,"source")).released&&!glass(added).failed,"a newly available healthy native control restarts shared capture");
canvas=new Canvas();draw(added,canvas);check(canvas.events.equals(java.util.List.of("glass")),"new control can render while older failed controls retain fallback");
glass(added).failed=true;call(state,"prepare");failedCreated=LayerBackdropSource.created;
LiquidGlassDrawable failedBeforeRefresh=glass(wide);FeatureSettings.motion=true;call(state,"refresh");call(state,"prepare");
check(failedBeforeRefresh.released&&!glass(wide).failed&&LayerBackdropSource.created==failedCreated+1,"configuration refresh rebuilds terminally failed surfaces and shared source");
canvas=new Canvas();draw(wide,canvas);check(canvas.events.equals(java.util.List.of("glass")),"reconfigured renderer can use backdrop again");
p.detach();
check(FeatureSettings.listeners==0&&wide.getBackground()==wide.colorBackgroundDrawable,"detach removes listener and restores native views");
check(LayerBackdropSource.created==LayerBackdropSource.releases&&LiquidGlassDrawable.created==LiquidGlassDrawable.releases,"all shared sources and local materials released exactly once");
Panel unsupported=new Panel();ViewGroup unsupportedFrame=new ViewGroup();SeekBar unsupportedSeek=new SeekBar();LayerDrawable unsupportedLayers=new LayerDrawable();
GradientDrawable asymmetric=(GradientDrawable)unsupportedLayers.findDrawableByLayerId(1);asymmetric.radii=new float[]{8,8,16,16,8,8,16,16};unsupportedSeek.progress=unsupportedLayers;unsupportedFrame.addView(unsupportedSeek);unsupported.topPanel.volume=unsupportedFrame;unsupported.topPanel.mVolumeSlider=unsupportedSeek;unsupported.topPanel.addView(unsupportedFrame);
Object unsupportedState=watch(unsupported);call(unsupportedState,"prepare");
check(unsupportedFrame.getBackground()==null&&unsupportedLayers.findDrawableByLayerId(1)==asymmetric,"asymmetric native slider keeps its complete native outline and fill rather than adding a mismatched material");
unsupported.detach();
System.out.println("PASS production LiquidGlassControlCenterHook runtime: "+checks+" checks (facade; GPU and real OEM visuals unverified)");
}}
""",
}


def java_tool(name):
    found = shutil.which(name)
    if found:
        return found
    home = os.environ.get("JAVA_HOME")
    if home:
        candidate = Path(home) / "bin" / (name + (".exe" if os.name == "nt" else ""))
        if candidate.is_file():
            return str(candidate)
    raise SystemExit("Set JAVA_HOME or add a JDK to PATH")


FILES["ls/augment/com/hook/LiquidGlassControlCenterHook.java"] = (
    ROOT / "android/app/src/main/java/ls/augment/com/hook/LiquidGlassControlCenterHook.java"
).read_text(encoding="utf-8")
with tempfile.TemporaryDirectory(prefix="lsa-control-center-glass-") as directory:
    sources = []
    for name, content in FILES.items():
        path = Path(directory) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        sources.append(str(path))
    subprocess.run([java_tool("javac"), "-encoding", "UTF-8", "-d", directory, *sources], check=True)
    subprocess.run([java_tool("java"), "-cp", directory, "ls.augment.com.hook.TestControlCenterGlass"], check=True)
