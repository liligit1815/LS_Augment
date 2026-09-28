"""Run the production Dock hook with Android, OEM launcher and libxposed doubles.

Requires Python 3 and a JDK on PATH (or JAVA_HOME). This verifies the hook's
ordering, lifecycle and configuration behavior, not compositor/GPU rendering.
All generated Java sources and classes live in a temporary directory.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"

files = {
    "android/content/Context.java": """package android.content;
public class Context {public Context getApplicationContext(){return this;}}
""",
    "android/util/DisplayMetrics.java": """package android.util;
public class DisplayMetrics {public float density=1;}
""",
    "android/content/res/Resources.java": """package android.content.res;
public class Resources {public final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();
 public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}}
""",
    "android/graphics/Rect.java": """package android.graphics;
public class Rect {public int left,top,right,bottom;public Rect(){}public Rect(int l,int t,int r,int b){set(l,t,r,b);}
 public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public void set(Rect r){set(r.left,r.top,r.right,r.bottom);}
 public void offset(int x,int y){left+=x;right+=x;top+=y;bottom+=y;}public int width(){return right-left;}public int height(){return bottom-top;}
 public void union(Rect r){left=Math.min(left,r.left);top=Math.min(top,r.top);right=Math.max(right,r.right);bottom=Math.max(bottom,r.bottom);}
 public String toShortString(){return left+","+top+"-"+right+","+bottom;}
 public boolean equals(Object o){if(!(o instanceof Rect))return false;Rect r=(Rect)o;return left==r.left&&top==r.top&&right==r.right&&bottom==r.bottom;}
 public int hashCode(){return left+top*31+right*37+bottom*41;}}
""",
    "android/graphics/Canvas.java": """package android.graphics;import java.util.*;
public class Canvas {public boolean hardware=true;public int saves;public Rect clip;public final List<String> events=new ArrayList<>();
 public boolean isHardwareAccelerated(){return hardware;}public int save(){return ++saves;}
 public void clipRect(Rect r){clip=new Rect();clip.set(r);}public void restoreToCount(int n){saves=n-1;clip=null;}}
""",
    "android/graphics/drawable/Drawable.java": """package android.graphics.drawable;
public class Drawable {public final android.graphics.Rect bounds=new android.graphics.Rect();public int alpha=255,opacity=-1;
 public int getAlpha(){return alpha;}public int getOpacity(){return opacity;}
 public android.graphics.Rect getBounds(){return bounds;}}
""",
    "android/graphics/PixelFormat.java": "package android.graphics;public class PixelFormat {public static final int TRANSPARENT=-2,TRANSLUCENT=-3;}",
    "android/graphics/drawable/ColorDrawable.java": """package android.graphics.drawable;public class ColorDrawable extends Drawable {
 public ColorDrawable(int color){alpha=color>>>24;opacity=alpha==0?-2:alpha==255?-1:-3;}}
""",
    "android/os/Looper.java": """package android.os;
public class Looper {private static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}}
""",
    "android/os/Handler.java": """package android.os;import java.util.*;
public class Handler {public static final List<Runnable> queue=new ArrayList<>();public Handler(Looper l){}
 public boolean postDelayed(Runnable r,long delay){queue.add(r);return true;}
 public void removeCallbacks(Runnable r){queue.removeIf(item->item==r);}
 public static int pending(){return queue.size();}
 public static void tick(){List<Runnable> due=new ArrayList<>(queue);queue.clear();for(Runnable r:due)r.run();}}
""",
    "android/view/MotionEvent.java": """package android.view;
public class MotionEvent {public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3;
 final int action;final float x,y;public MotionEvent(int a,float px,float py){action=a;x=px;y=py;}
 public int getActionMasked(){return action;}public float getX(){return x;}public float getY(){return y;}}
""",
    "android/view/ViewParent.java": "package android.view;public interface ViewParent {}",
    "android/view/View.java": """package android.view;import java.util.*;import android.content.Context;
public class View implements ViewParent {public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public int visibility=VISIBLE,windowVisibility=VISIBLE;
 public int width=64,height=64,left,top,invalidations,paddingTop;public boolean attached=true,shown=true;public ViewGroup parent;
 public float scaleX=1,scaleY=1,rotation,rotationX,rotationY;public ViewParent getParent(){return parent;}
 public float getScaleX(){return scaleX;}public float getScaleY(){return scaleY;}public float getRotation(){return rotation;}
 public float getRotationX(){return rotationX;}public float getRotationY(){return rotationY;}
 public android.graphics.drawable.Drawable background;public android.graphics.drawable.Drawable getBackground(){return background;}
 public int getPaddingTop(){return paddingTop;}
 private final Context context=new Context();private final android.content.res.Resources resources=new android.content.res.Resources();
 public final List<OnAttachStateChangeListener> attachListeners=new ArrayList<>();
 public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}
 public int getWidth(){return width;}public int getHeight(){return height;}public int getVisibility(){return visibility;}
 public int getWindowVisibility(){return windowVisibility;}public boolean isAttachedToWindow(){return attached;}
 public boolean isShown(){return attached&&shown&&visibility==VISIBLE&&(parent==null||parent.isShown());}
 public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){attachListeners.add(l);}
 public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){attachListeners.remove(l);}
 public void invalidate(){invalidations++;}public void invalidate(android.graphics.Rect r){invalidate();}
 public void detach(){attached=false;for(OnAttachStateChangeListener l:new ArrayList<>(attachListeners))l.onViewDetachedFromWindow(this);}
 public void attach(){attached=true;for(OnAttachStateChangeListener l:new ArrayList<>(attachListeners))l.onViewAttachedToWindow(this);}}
""",
    "android/view/ViewGroup.java": """package android.view;import java.util.*;import android.graphics.Rect;
public class ViewGroup extends View {public final List<View> children=new ArrayList<>();
 public void addView(View v){children.add(v);v.parent=this;}public void removeAllViews(){for(View v:children)v.parent=null;children.clear();}
 public int getChildCount(){return children.size();}public View getChildAt(int n){return children.get(n);}
 public void offsetDescendantRectToMyCoords(View v,Rect r){while(v!=this){if(v==null)throw new IllegalArgumentException("not a descendant");r.offset(v.left,v.top);v=v.parent;}}}
""",
    "android/widget/TextView.java": """package android.widget;
public class TextView extends android.view.View {public int color=0xffffffff;public CharSequence text="Dock app";public float textSize=14;
 public final android.graphics.drawable.Drawable[] compound=new android.graphics.drawable.Drawable[4];
 public android.graphics.drawable.Drawable[] getCompoundDrawables(){return compound;}
 public int getCurrentTextColor(){return color;}public CharSequence getText(){return text;}public float getTextSize(){return textSize;}}
""",
    "io/github/libxposed/api/XposedInterface.java": """package io.github.libxposed.api;import java.util.List;
public interface XposedInterface {interface Hooker {Object intercept(Chain c)throws Throwable;}
 interface Chain {Object getThisObject();Object getArg(int index);List<Object> getArgs();Object proceed()throws Throwable;}}
""",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.*;
public class AugmentModule {public static AugmentModule active;public final Map<Method,Hooker> hooks=new LinkedHashMap<>();
 public final List<String> registrations=new ArrayList<>(),errors=new ArrayList<>(),info=new ArrayList<>();
 public interface Original {Object run()throws Throwable;}
 static class Call implements Chain {final Object owner;final Object[] args;final Original original;
  Call(Object o,Object[] a,Original n){owner=o;args=a;original=n;}public Object getThisObject(){return owner;}
  public Object getArg(int i){return args[i];}public List<Object> getArgs(){return Arrays.asList(args);}public Object proceed()throws Throwable{return original.run();}}
 void logFeatureError(String k,Throwable e){errors.add(k+":"+e);}void logFeatureInfo(String s){info.add(s);}
 public static Object dispatch(Object owner,Class<?> type,String name,Class<?>[] types,Object[] args,Original original){
  try {Method m=type.getDeclaredMethod(name,types);Hooker h=active.hooks.get(m);return h==null?original.run():h.intercept(new Call(owner,args,original));}
  catch(RuntimeException|Error e){throw e;}catch(Throwable t){throw new RuntimeException(t);}}}
""",
    "ls/augment/com/hook/OemHooks.java": """package ls.augment.com.hook;import java.lang.reflect.*;import io.github.libxposed.api.XposedInterface.Hooker;
class OemHooks {static int methods(AugmentModule module,ClassLoader loader,String type,String name,Class<?> result,int argc,String key,Hooker hook){
 int count=0;try{for(Method m:Class.forName(type,false,loader).getDeclaredMethods()){
  if(!m.getName().equals(name)||m.getReturnType()!=result||m.getParameterCount()!=argc||Modifier.isAbstract(m.getModifiers()))continue;
  if(!key.isEmpty())throw new AssertionError("Dock callbacks must observe disabled state for restoration");
  module.hooks.put(m,hook);module.registrations.add(name);count++;}}
 catch(ReflectiveOperationException e){module.logFeatureError(name,e);}return count;}
 static Object invoke(Object owner,String name,Object...args)throws ReflectiveOperationException{
  for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())try{Method m=c.getDeclaredMethod(name);m.setAccessible(true);return m.invoke(owner);}
  catch(NoSuchMethodException ignored){}throw new NoSuchMethodException(name);}}
""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;import java.util.*;import android.content.Context;
class FeatureSettings {static final Map<String,Boolean> values=new HashMap<>();static final Map<String,String> diagnostics=new HashMap<>();
 static void diagnostic(Context c,String key,String value){diagnostics.put(key,value);}
 static boolean enabled(Context c,String key){return values.getOrDefault(key,false);}}
""",
    "ls/augment/com/BuildConfig.java": "package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20366;}",
    "ls/augment/com/LayerBackdropSource.java": """package ls.augment.com;import android.view.View;import android.graphics.Rect;import java.lang.ref.WeakReference;
public class LayerBackdropSource {public static int created,totalRequests,releases;public final WeakReference<View> host;
 public int requests;public boolean released;public Rect region;
 public LayerBackdropSource(View v){host=new WeakReference<>(v);created++;}public void setRegion(Rect r){region=new Rect();region.set(r);}
 public void request(){if(released)return;requests++;totalRequests++;}
 public void release(){if(!released)releases++;released=true;}
 public String failureReason(){return "test_backdrop_unavailable";}}
""",
    "ls/augment/com/LiquidGlassDrawable.java": """package ls.augment.com;import java.lang.ref.WeakReference;import android.view.View;import android.graphics.*;
public class LiquidGlassDrawable {public static int created,releases;public final WeakReference<View> host;public final LayerBackdropSource source;
 public boolean foregroundLight,iconOnly,opaque,motion,released,ready=true,prepareResult=true,failDraw,pressed,failed,failPreparePermanent,failGpu,fallbackAllowed=true;public Rect bounds;
 public int draws,interactions;public float x,y;
 public LiquidGlassDrawable(View v,LayerBackdropSource s,float radius){host=new WeakReference<>(v);source=s;created++;}
 public void setForegroundIsLight(boolean value){foregroundLight=value;}public void setBounds(Rect r){bounds=new Rect();bounds.set(r);}
 public void setIconOnly(boolean value){iconOnly=value;}
 public void updatePreferences(boolean lessTransparency,boolean lessMotion){opaque=lessTransparency;motion=lessMotion;}
 public boolean prepare(){if(released)throw new AssertionError("using released drawable");if(failPreparePermanent)failed=true;ready=prepareResult&&!failed;return ready;}
 public String failureReason(){return "test_renderer_unavailable";}public boolean isReady(){return ready&&!released&&!failed;}public boolean isFailed(){return failed;}
 public void draw(Canvas c){if(c.clip==null||!c.clip.equals(bounds))throw new AssertionError("glass not clipped to its region");
  if(failDraw)throw new IllegalStateException("test renderer exception");if(failGpu){failed=true;ready=false;return;}c.events.add("glass");draws++;}
 public boolean drawFallback(Canvas c){if(c.clip==null||!c.clip.equals(bounds))throw new AssertionError("fallback not clipped");
  if(!fallbackAllowed)return false;c.events.add("translucent-fallback");return true;}
 public void setInteraction(float px,float py,boolean down){if(released)throw new AssertionError("touching released drawable");interactions++;x=px;y=py;pressed=down;}
 public void release(){if(released)throw new AssertionError("drawable released twice");released=true;releases++;}}
""",
    "com/android/launcher3/K5.java": "package com.android.launcher3;public class K5 extends android.view.ViewGroup {}",
    "com/android/launcher3/BubbleTextView.java": "package com.android.launcher3;public class BubbleTextView extends android.widget.TextView {}",
    "com/android/launcher3/CellLayout.java": """package com.android.launcher3;import android.view.ViewGroup;
public class CellLayout extends ViewGroup {public final K5 cells=new K5();public boolean missingContainer,failContainer;
 public CellLayout(){width=400;height=110;cells.left=20;cells.top=10;addView(cells);}
 public ViewGroup getShortcutsAndWidgets(){if(failContainer)throw new IllegalStateException("OEM container error");return missingContainer?null:cells;}}
""",
    "com/android/launcher3/Hotseat.java": """package com.android.launcher3;
import android.graphics.Canvas;import android.view.MotionEvent;import ls.augment.com.hook.AugmentModule;
public class Hotseat extends CellLayout {public int nativeDraws,nativeTouches;public boolean touchResult=true,failNativeDraw;
 public MotionEvent lastNativeTouch;
 protected void onDraw(Canvas c){AugmentModule.dispatch(this,Hotseat.class,"onDraw",new Class[]{Canvas.class},new Object[]{c},()->{
  nativeDraws++;c.events.add("native-background");if(failNativeDraw)throw new IllegalStateException("native draw failed");return null;});}
 public void drawFrame(Canvas c){onDraw(c);c.events.add("native-icons");}
 public boolean dispatchTouchEvent(MotionEvent event){return (Boolean)AugmentModule.dispatch(this,Hotseat.class,"dispatchTouchEvent",
  new Class[]{MotionEvent.class},new Object[]{event},()->{nativeTouches++;lastNativeTouch=event;return touchResult;});}}
""",
    "ls/augment/com/hook/TestLiquidGlassDockRuntime.java": """package ls.augment.com.hook;
import java.lang.ref.Reference;import java.lang.reflect.*;import java.util.*;import android.graphics.*;import android.os.Handler;
import android.view.*;import android.widget.TextView;import com.android.launcher3.Hotseat;import ls.augment.com.*;
public class TestLiquidGlassDockRuntime {
 static int checks;static AugmentModule module;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static void setting(String key,boolean value){FeatureSettings.values.put(key,value);}
 static Map<?,?> states()throws Exception{Field f=LiquidGlassDockHook.class.getDeclaredField("STATES");f.setAccessible(true);return (Map<?,?>)f.get(null);}
 static Object state(Hotseat v)throws Exception{return states().get(v);}
 static Object field(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 static LiquidGlassDrawable glass(Hotseat v)throws Exception{return (LiquidGlassDrawable)field(state(v),"glass");}
 static LayerBackdropSource source(Hotseat v)throws Exception{return (LayerBackdropSource)field(state(v),"source");}
 static Hotseat host(){Hotseat h=new Hotseat();TextView icon=new TextView();icon.left=12;icon.top=4;h.cells.addView(icon);return h;}
 static Canvas draw(Hotseat h){Canvas c=new Canvas();h.drawFrame(c);return c;}
 static void onlyNative(Canvas c,String reason){check(c.events.equals(Arrays.asList("native-background","native-icons")),reason);}
 static void material(Canvas c){check(c.events.equals(Arrays.asList("native-background","glass","native-icons")),"native background, glass, then icons");
  check(c.saves==0&&c.clip==null,"Canvas state restored");}
 static void fallback(Canvas c){check(c.events.equals(Arrays.asList("native-background","translucent-fallback","native-icons")),"missing sampled backdrop retains a visible capsule under native icons");
  check(c.saves==0&&c.clip==null,"fallback restores Canvas state");}
 static void released(LayerBackdropSource s,LiquidGlassDrawable d,String reason){check(s.released&&d.released,reason);}
 static void close(Hotseat h)throws Exception{h.detach();check(state(h)==null,"detach removes state");}

 static void installAndDefaults()throws Exception{
  module=new AugmentModule();AugmentModule.active=module;LiquidGlassDockHook.install(module,TestLiquidGlassDockRuntime.class.getClassLoader());
  check(module.registrations.equals(Arrays.asList("onDraw","dispatchTouchEvent")),"exact native drawing and touch hooks install in order");
  LiquidGlassDockHook.install(module,TestLiquidGlassDockRuntime.class.getClassLoader());check(module.hooks.size()==2&&module.registrations.size()==2,"installation is idempotent");
  for(EnhancementOption option:GlassOptions.options())check("0".equals(option.defaultValue),"all glass settings default off");
  Hotseat h=host();onlyNative(draw(h),"disabled rendering unchanged");check(state(h)==null&&LayerBackdropSource.created==0&&Handler.pending()==0,"disabled hook allocates no sampling or callbacks");
  check(FeatureSettings.diagnostics.get("ls_augment_rm_glass_dock_state").contains(";disabled"),"disabled state is available in exported device diagnostics");
  MotionEvent event=new MotionEvent(MotionEvent.ACTION_DOWN,12,13);h.touchResult=false;
  check(!h.dispatchTouchEvent(event)&&h.nativeTouches==1&&h.lastNativeTouch==event,"disabled touch and exact event unchanged");
  setting(GlassOptions.DOCK,true);Canvas software=new Canvas();software.hardware=false;h.drawFrame(software);
  onlyNative(software,"software canvas keeps OEM");check(state(h)==null,"software draw creates no material");
  check(FeatureSettings.diagnostics.get("ls_augment_rm_glass_dock_state").contains("hardware=false"),"hardware gate is visible without allocating a material");
  h.shown=false;onlyNative(draw(h),"hidden host keeps OEM");h.shown=true;h.attached=false;onlyNative(draw(h),"detached host keeps OEM");h.attached=true;
  check(state(h)==null,"hidden and detached hosts create no state");
  h.failNativeDraw=true;try{draw(h);throw new AssertionError("native exception swallowed");}catch(IllegalStateException expected){}
  check(state(h)==null&&h.nativeDraws==5,"native draw runs exactly once and its failure is preserved");
 }
 static void lifecycle()throws Exception{
  Hotseat h=host();material(draw(h));Object state=state(h);LayerBackdropSource s=source(h);LiquidGlassDrawable g=glass(h);
  check(s.requests==1&&g.draws==1,"first valid frame samples and draws once");
  check(g.bounds.equals(new Rect(20,2,108,90))&&s.region.equals(g.bounds),"descendant coordinates and generous padding map into Hotseat coordinates");
  check(h.attachListeners.size()==1&&Handler.pending()==1,"one attach listener and one refresh callback");
  for(int i=0;i<8;i++)draw(h);check(state(h)==state&&source(h)==s&&glass(h)==g&&h.attachListeners.size()==1&&Handler.pending()==1,"repeated draw does not duplicate state, material or callbacks");
  int before=h.invalidations;Handler.tick();check(h.invalidations==before+1&&Handler.pending()==1,"refresh invalidates once and remains bounded");
  setting(GlassOptions.DOCK,false);onlyNative(draw(h),"disable preserves native frame");released(s,g,"disable releases both material owners");
  check(state(h)==null&&h.attachListeners.isEmpty()&&Handler.pending()==0,"disable removes state, listener and queued refresh");
  setting(GlassOptions.DOCK,true);material(draw(h));s=source(h);g=glass(h);h.detach();released(s,g,"detach releases material");
  check(state(h)==null&&Handler.pending()==0&&h.attachListeners.isEmpty(),"detached host has no pending callback");
  h.attach();material(draw(h));check(source(h)!=s&&glass(h)!=g,"reattach creates fresh material");
  s=source(h);g=glass(h);setting(GlassOptions.DOCK,false);Handler.tick();released(s,g,"timer notices disabled switch without another draw");
  check(state(h)==null&&Handler.pending()==0,"timer disable leaves no state");setting(GlassOptions.DOCK,true);
 }
 static void invalidGeometryAndContent()throws Exception{
  Hotseat h=host();draw(h);LayerBackdropSource s=source(h);LiquidGlassDrawable g=glass(h);h.cells.removeAllViews();
  onlyNative(draw(h),"empty Dock keeps OEM");released(s,g,"empty Dock stops existing source");int requests=LayerBackdropSource.totalRequests;
  draw(h);Handler.tick();draw(h);check(LayerBackdropSource.totalRequests==requests&&source(h)==null&&glass(h)==null,"empty Dock does not recreate or request sampling");
  TextView icon=new TextView();h.cells.addView(icon);material(draw(h));s=source(h);g=glass(h);h.missingContainer=true;
  onlyNative(draw(h),"unknown container keeps OEM");released(s,g,"unsupported container stops source");h.missingContainer=false;material(draw(h));
  s=source(h);g=glass(h);h.height=500;icon.height=240;onlyNative(draw(h),"oversize Dock safely falls back");released(s,g,"unsupported geometry stops source");
  check(module.info.stream().anyMatch(v->v.contains("unsupported_dock_geometry:400x500:density=1.0:icons=")),"unsupported geometry includes real dimensions");
  icon.height=64;material(draw(h));s=source(h);g=glass(h);icon.visibility=View.INVISIBLE;
  onlyNative(draw(h),"invisible children do not count as Dock geometry");released(s,g,"all hidden icons stop sampling");
  icon.visibility=View.VISIBLE;icon.width=0;onlyNative(draw(h),"zero size icon does not create geometry");
  icon.width=64;h.height=110;material(draw(h));close(h);
  // A full-height host from match_parent XML must not make the icon material full height.
  h=host();h.height=2000;material(draw(h));check(glass(h).bounds.height()==88,"match_parent Hotseat still uses its small icon region");close(h);
  h=host();h.getResources().metrics.density=3;h.width=1200;h.height=360;h.cells.left=60;h.cells.top=30;
  View large=h.cells.getChildAt(0);large.left=36;large.top=12;large.width=192;large.height=192;
  material(draw(h));check(glass(h).bounds.height()==264,"ordinary high density Dock passes dp-based height limit");close(h);
  // OEM keeps a hidden label's layout region; a visible 64px icon must not inherit its 240px height.
  h=host();h.height=400;TextView cell=(TextView)h.cells.getChildAt(0);cell.width=112;cell.height=240;cell.paddingTop=8;cell.color=0x00ffffff;
  android.graphics.drawable.Drawable iconImage=new android.graphics.drawable.Drawable();iconImage.bounds.set(0,0,64,64);cell.compound[1]=iconImage;
  material(draw(h));check(glass(h).bounds.equals(new Rect(44,10,132,98))&&glass(h).iconOnly,"hidden native labels use drawable bounds and icon-only optics");
  check(cell.height==240&&cell.width==112&&cell.paddingTop==8&&cell.compound[1]==iconImage,"measuring the glass never changes native cell layout or icon");
  cell.compound[1]=null;onlyNative(draw(h),"unknown tall cell is not misidentified as icon geometry");close(h);
 }
 static void preferencesAndInput()throws Exception{
  Hotseat h=host();material(draw(h));LayerBackdropSource s=source(h);LiquidGlassDrawable g=glass(h);
  for(int action:new int[]{MotionEvent.ACTION_DOWN,MotionEvent.ACTION_MOVE,MotionEvent.ACTION_UP,MotionEvent.ACTION_CANCEL}){
   MotionEvent event=new MotionEvent(action,59,33);h.touchResult=(action%2==0);int nativeCalls=h.nativeTouches;
   check(h.dispatchTouchEvent(event)==h.touchResult&&h.nativeTouches==nativeCalls+1&&h.lastNativeTouch==event,"touch result and event preserved "+action);
   check(g.x==59&&g.y==33&&g.pressed==(action!=MotionEvent.ACTION_UP&&action!=MotionEvent.ACTION_CANCEL),"host-local optical interaction "+action);
  }
  setting(GlassOptions.DOCK_REDUCE_MOTION,true);draw(h);check(glass(h)==g&&g.motion,"reduce motion updates existing renderer");
  setting(GlassOptions.DOCK_REDUCE_TRANSPARENCY,true);material(draw(h));released(s,g,"opaque transition releases old capture and renderer");
  LayerBackdropSource opaqueSource=source(h);LiquidGlassDrawable opaque=glass(h);
  check(opaque!=g&&opaque.opaque&&opaque.motion&&opaqueSource.requests==0,"opaque material has no capture request");
  int requests=LayerBackdropSource.totalRequests;draw(h);Handler.tick();draw(h);check(LayerBackdropSource.totalRequests==requests,"opaque repeat frames never sample");
  setting(GlassOptions.DOCK_REDUCE_TRANSPARENCY,false);material(draw(h));released(opaqueSource,opaque,"transparent transition releases opaque material");
  check(source(h).requests==1&&!glass(h).opaque,"return to transparent creates and requests fresh source");
  setting(GlassOptions.DOCK_REDUCE_MOTION,false);close(h);
  setting(GlassOptions.DOCK_REDUCE_TRANSPARENCY,true);h=host();material(draw(h));check(source(h).requests==0,"initial opaque enable does not capture");close(h);
  setting(GlassOptions.DOCK_REDUCE_TRANSPARENCY,false);
 }
 static void contrastAndFallback()throws Exception{
  Hotseat h=host();TextView first=(TextView)h.cells.getChildAt(0);material(draw(h));check(glass(h).foregroundLight,"white native labels choose dark material");
  first.color=0xa6000000;material(draw(h));check(!glass(h).foregroundLight&&first.color==0xa6000000,"easy-mode dark labels choose light material without rewriting text");
  LayerBackdropSource s=source(h);LiquidGlassDrawable g=glass(h);TextView second=new TextView();second.left=90;h.cells.addView(second);
  onlyNative(draw(h),"mixed dark and light labels fall back");released(s,g,"mixed contrast releases source");
  second.text="";material(draw(h));check(!glass(h).foregroundLight,"empty label does not force contrast");
  second.text="visible";second.color=0x00ffffff;material(draw(h));check(!glass(h).foregroundLight,"transparent label does not force contrast");
  second.color=0xffffffff;second.textSize=0;material(draw(h));check(!glass(h).foregroundLight,"zero-size label does not force contrast");
  second.textSize=14;second.visibility=View.GONE;material(draw(h));check(!glass(h).foregroundLight,"gone label does not force contrast");
  first.text="";material(draw(h));check(glass(h).iconOnly,"icon-only Dock no longer forces a white-label contrast floor");
  g=glass(h);g.prepareResult=false;fallback(draw(h));
  check(module.info.stream().anyMatch(v->v.contains("translucent_fallback:test_renderer_unavailable:test_backdrop_unavailable")),"fallback diagnoses renderer and source separately without claiming active refraction");
  h.background=new android.graphics.drawable.Drawable();onlyNative(draw(h),"unsupported capture preserves theme-supplied native View background");h.background=null;
  h.background=new android.graphics.drawable.ColorDrawable(0);fallback(draw(h));check(glass(h)==g,"transparent ColorDrawable does not suppress a fallback tray");
  h.background=new android.graphics.drawable.Drawable();h.background.opacity=PixelFormat.TRANSPARENT;fallback(draw(h));
  h.background.opacity=PixelFormat.TRANSLUCENT;h.background.alpha=0;fallback(draw(h));
  h.background.alpha=180;onlyNative(draw(h),"visible translucent theme background remains native");h.background=null;
  g.fallbackAllowed=false;onlyNative(draw(h),"unsafe host rejected by shared fallback renderer keeps OEM");g.fallbackAllowed=true;
  g.prepareResult=true;material(draw(h));s=source(h);g.failDraw=true;int errors=module.errors.size();Canvas canvas=draw(h);
  onlyNative(canvas,"renderer exception leaves native rendering available");check(canvas.saves==0&&canvas.clip==null,"renderer exception restores Canvas clip");
  released(s,g,"renderer exception disposes material");check(state(h)==null&&Handler.pending()==0&&module.errors.size()==errors+1,"renderer exception removes lifecycle callback and reports once");
  material(draw(h));close(h);
 }
 static void deviceLikeStructure()throws Exception{
  // Log evidence: NX809J is 1216px wide at density 520/160; the real container is
  // K5 with five BubbleTextViews. Cell padding/size below are explicit fixture
  // dimensions, not claimed measurements from the log (which lacked dock geometry).
  Hotseat h=new Hotseat();h.width=1216;h.height=352;h.getResources().metrics.density=3.25f;
  h.cells.left=8;h.cells.top=24;h.cells.width=1200;h.cells.height=328;
  h.background=new android.graphics.drawable.ColorDrawable(0);
  for(int i=0;i<5;i++){
   com.android.launcher3.BubbleTextView icon=new com.android.launcher3.BubbleTextView();
   icon.left=i*240;icon.top=12;icon.width=240;icon.height=260;icon.paddingTop=8;icon.color=0x00ffffff;
   android.graphics.drawable.Drawable image=new android.graphics.drawable.Drawable();image.bounds.set(0,0,174,174);icon.compound[1]=image;h.cells.addView(icon);
  }
  android.graphics.drawable.Drawable nativeBackground=h.background;material(draw(h));LiquidGlassDrawable g=glass(h);
  check(g.bounds.equals(new Rect(2,5,1214,257))&&g.iconOnly,"five-icon OEM structure produces one bounded capsule above the gesture margin");
  g.prepareResult=false;fallback(draw(h));String detail=FeatureSettings.diagnostics.get("ls_augment_rm_glass_dock_state");
  check(detail.contains("build=20366;")&&detail.contains("translucent_fallback:")&&detail.contains("host=1216x352")
    &&detail.contains("container=com.android.launcher3.K5")&&detail.contains("visible_icons=5")&&detail.contains("density=3.25")
    &&detail.contains("background=android.graphics.drawable.ColorDrawable,alpha=0"),"export identifies running build, hook branch, native hierarchy, geometry and transparent background");
  check(h.background==nativeBackground&&h.cells.getChildCount()==5,"tray never replaces native background or reparents icons");
  for(int i=0;i<5;i++){View icon=h.cells.getChildAt(i);check(icon.left==i*240&&icon.top==12&&icon.width==240&&icon.height==260,"native icon layout remains unchanged");}
  ViewGroup parent=new ViewGroup();parent.addView(h);parent.scaleX=.92f;g.fallbackAllowed=false;
  onlyNative(draw(h),"shared renderer can reject unsafe transformed ancestor");
  check(FeatureSettings.diagnostics.get("ls_augment_rm_glass_dock_state").contains("transform=android.view.ViewGroup,0.92,1.0"),"transformed-host reason includes offending ancestor");
  parent.scaleX=1;g.fallbackAllowed=true;fallback(draw(h));close(h);
 }
 static void permanentRendererFailure()throws Exception{
  for(boolean failDuringDraw:new boolean[]{false,true}){
   Hotseat h=host();material(draw(h));LayerBackdropSource s=source(h);LiquidGlassDrawable g=glass(h);
   if(failDuringDraw)g.failGpu=true;else g.failPreparePermanent=true;
   fallback(draw(h));
   check(g.isFailed()&&s.released,"permanent renderer failure releases source "+failDuringDraw);
   int requests=LayerBackdropSource.totalRequests,created=LayerBackdropSource.created;
   for(int i=0;i<3;i++){Handler.tick();fallback(draw(h));}
   check(LayerBackdropSource.totalRequests==requests&&LayerBackdropSource.created==created,"failed renderer never restarts background sampling");
   setting(GlassOptions.DOCK_REDUCE_TRANSPARENCY,true);material(draw(h));
   check(g.released&&glass(h)!=g&&glass(h).opaque,"opaque mode can recover from failed transparent material");
   close(h);setting(GlassOptions.DOCK_REDUCE_TRANSPARENCY,false);
  }
 }
 // Deterministic strong-reference walk: unlike forced-GC tests this is not VM-timing dependent.
 // Capture/render doubles deliberately have the same weak-host ownership as production.
 static boolean reaches(Object root,Object target,Set<Object> seen)throws Exception{
  if(root==target)return true;if(root==null||root instanceof Reference<?>||!seen.add(root))return false;
  if(root instanceof Map<?,?>){Map<?,?> map=(Map<?,?>)root;for(Map.Entry<?,?> e:map.entrySet()){
   if(!(map instanceof WeakHashMap<?,?>)&&reaches(e.getKey(),target,seen))return true;if(reaches(e.getValue(),target,seen))return true;}return false;}
  if(root instanceof Iterable<?>){for(Object v:(Iterable<?>)root)if(reaches(v,target,seen))return true;return false;}
  Class<?> c=root.getClass();if(c.isArray()){if(c.getComponentType().isPrimitive())return false;for(Object v:(Object[])root)if(reaches(v,target,seen))return true;return false;}
  if(c.getName().startsWith("java.")||c.isEnum())return false;
  for(;c!=null&&!c.getName().startsWith("java.");c=c.getSuperclass())for(Field f:c.getDeclaredFields()){
   if(Modifier.isStatic(f.getModifiers())||f.getType().isPrimitive())continue;f.setAccessible(true);if(reaches(f.get(root),target,seen))return true;}
  return false;
 }
 static boolean reaches(Object root,Object target)throws Exception{return reaches(root,target,Collections.newSetFromMap(new IdentityHashMap<>()));}
 static void retention()throws Exception{
  Hotseat h=host();draw(h);Object state=state(h);
  check(states() instanceof WeakHashMap<?,?>,"host registry uses weak keys");
  check(field(state,"host") instanceof Reference<?> && ((Reference<?>)field(state,"host")).get()==h,"State host field is weak");
  check(!reaches(state,h)&&!reaches(Handler.queue,h)&&!reaches(states(),h)&&!reaches(module,h),"State, pending callbacks, registry values and hook closures have no strong path to host");
  int invalidations=h.invalidations;h.shown=false;Handler.tick();check(h.invalidations==invalidations,"hidden host refresh does not invalidate");
  h.shown=true;h.windowVisibility=View.GONE;Handler.tick();check(h.invalidations==invalidations,"hidden window refresh does not invalidate");
  close(h);check(Handler.pending()==0&&h.attachListeners.isEmpty(),"retention test leaves no queued work");
 }
 public static void main(String[] args)throws Exception{
  installAndDefaults();lifecycle();invalidGeometryAndContent();preferencesAndInput();contrastAndFallback();deviceLikeStructure();permanentRendererFailure();retention();
  check(states().isEmpty()&&Handler.pending()==0,"all hosts and timers released after test");
  check(LayerBackdropSource.created==LayerBackdropSource.releases&&LiquidGlassDrawable.created==LiquidGlassDrawable.releases,"every created source and renderer reaches released state");
  check(module.errors.size()==1,"only deliberate renderer fault was reported");
  System.out.println("PASS production LiquidGlassDockHook runtime: "+checks+" checks");
 }
}
""",
}

for name in ("EnhancementOption.java", "GlassOptions.java", "LiquidGlassPolicy.java",
             "LiquidGlassDockPolicy.java", "hook/LiquidGlassDockHook.java"):
    files["ls/augment/com/" + name] = (SRC / name).read_text(encoding="utf-8")


def java_tool(name):
    found = shutil.which(name)
    if found:
        return found
    java_home = os.environ.get("JAVA_HOME")
    if java_home:
        candidate = Path(java_home) / "bin" / (name + (".exe" if os.name == "nt" else ""))
        if candidate.is_file():
            return str(candidate)
    raise SystemExit(f"JDK tool {name!r} not found; set JAVA_HOME or add its bin directory to PATH")


with tempfile.TemporaryDirectory(prefix="lsa-liquid-glass-dock-") as temp:
    sources = []
    for name, source in files.items():
        path = Path(temp) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding="utf-8")
        sources.append(str(path))
    subprocess.run([java_tool("javac"), "-encoding", "UTF-8", "-d", temp, *sources], check=True)
    subprocess.run([java_tool("java"), "-cp", temp,
                    "ls.augment.com.hook.TestLiquidGlassDockRuntime"], check=True)
