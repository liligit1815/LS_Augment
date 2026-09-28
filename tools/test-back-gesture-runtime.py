"""Execute the production gesture interceptor with OEM-shaped views and nested/failed draws."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
files = {
 'android/animation/Animator.java': 'package android.animation;public class Animator{public interface AnimatorListener{}}',
 'ls/augment/com/GestureArtwork.java': 'package ls.augment.com;import android.graphics.Bitmap;import android.view.View;public class GestureArtwork{public Bitmap image;public int starts,stops;public GestureArtwork(Bitmap b){image=b;}public Bitmap frame(){return image;}public void start(View v){starts++;}public void stop(){stops++;}public static byte[] read(java.io.InputStream in){return new byte[0];}public static GestureArtwork decode(byte[] b,boolean square,boolean mirror){return new GestureArtwork(new Bitmap());}}',

 'android/content/Context.java': 'package android.content; public class Context {public Context getApplicationContext(){return this;} public ContentResolver getContentResolver(){return new ContentResolver();}}',
 'android/content/ContentResolver.java': 'package android.content; public class ContentResolver {public java.io.InputStream openInputStream(android.net.Uri u){return null;}}',
 'android/content/res/Resources.java': 'package android.content.res; public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
 'android/util/DisplayMetrics.java': 'package android.util;public class DisplayMetrics {public float density=1;}',
 'android/net/Uri.java': 'package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}',
 'android/os/Looper.java': 'package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}',
 'android/os/Handler.java': 'package android.os;public class Handler {public Handler(Looper l){}public boolean post(Runnable r){return true;}public static java.util.List<Runnable> delayed=new java.util.ArrayList<>();public boolean postDelayed(Runnable r,long d){delayed.add(r);return true;}}',
 'android/os/SystemClock.java': 'package android.os;public class SystemClock {public static long elapsedRealtime(){return 10000;}}',
 'android/graphics/Bitmap.java': '''package android.graphics;public class Bitmap {public enum Config{ARGB_8888} public boolean recycled;
 public boolean isRecycled(){return recycled;}public void recycle(){recycled=true;}public int getWidth(){return 24;}public int getHeight(){return 24;}
 public static Bitmap createBitmap(int w,int h,Config c){return new Bitmap();}}''',
 'android/graphics/BitmapFactory.java': '''package android.graphics;public class BitmapFactory {public static class Options {public boolean inJustDecodeBounds;public int outWidth=24,outHeight=24,inSampleSize;public Bitmap.Config inPreferredConfig;}
 public static Bitmap decodeByteArray(byte[] b,int a,int n,Options o){return new Bitmap();}}''',
 'android/graphics/Paint.java': 'package android.graphics;public class Paint {public static final int ANTI_ALIAS_FLAG=1,FILTER_BITMAP_FLAG=2;public Paint(){}public Paint(int flags){}private int alpha=180;public int getAlpha(){return alpha;}public void setAlpha(int a){alpha=a;}}',
 'android/graphics/RectF.java': 'package android.graphics;public class RectF {public float left,top,right,bottom;public void set(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}public float width(){return right-left;}public float height(){return bottom-top;}public boolean isEmpty(){return left>=right||top>=bottom;}public float centerX(){return (left+right)/2;}public float centerY(){return (top+bottom)/2;}}',
 'android/graphics/Path.java': 'package android.graphics;public class Path {public RectF bounds=new RectF();public void computeBounds(RectF r,boolean exact){r.set(bounds.left,bounds.top,bounds.right,bounds.bottom);}}',
 'android/graphics/Rect.java': 'package android.graphics;public class Rect {public int left,top,right,bottom;public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}}',
 'android/graphics/Canvas.java': '''package android.graphics;public class Canvas {public int saves,visiblePaths,bitmapCalls;public boolean clipped,mirrored,failBitmap;public Bitmap seen;public float left,right;public int alpha;
 public Canvas(){}public Canvas(Bitmap b){}public void scale(float a,float b,float c,float d){if(a<0)mirrored=true;}public void drawBitmap(Bitmap b,float x,float y,Paint p){}
 public int save(){return ++saves;}public void restoreToCount(int c){saves=c-1;clipped=false;}public void clipRect(int a,int b,int c,int d){clipped=true;}
 public void drawPath(Path p,Paint paint){if(!clipped)visiblePaths++;}
 public void drawBitmap(Bitmap b,Rect src,RectF dst,Paint p){if(failBitmap)throw new IllegalStateException("bitmap draw failed");bitmapCalls++;seen=b;left=dst.left;right=dst.right;alpha=p.getAlpha();}}
 ''',
 'android/view/View.java': '''package android.view;public class View {public android.content.Context getContext(){return new android.content.Context();}
 public android.content.res.Resources getResources(){return new android.content.res.Resources();}public int getWidth(){return 200;}public int getHeight(){return 400;}}''',
 'io/github/libxposed/api/XposedInterface.java': 'package io.github.libxposed.api;public interface XposedInterface {interface HookHandle {void unhook();}}',
 'ls/augment/com/ConfigSnapshot.java': '''package ls.augment.com;import java.util.*;public class ConfigSnapshot {
 public final Map<String,String> values=new HashMap<>();public String get(String k){return values.getOrDefault(k,k.endsWith("asset")?"":k.endsWith("scale_percent")?"100":"0");}public static ConfigSnapshot safeDefaults(){return new ConfigSnapshot();}}''',
 'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;class FeatureSettings {
 static ls.augment.com.ConfigSnapshot snapshot(android.content.Context c){return ls.augment.com.ConfigSnapshot.safeDefaults();}
 static void addSnapshotListener(android.content.Context c,Runnable r){}static void diagnostic(android.content.Context c,String k,String v){}}''',
 'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.HookHandle;
 public class AugmentModule {public static AugmentModule active;public int failAt=-1,built,removed;final Map<Method,Interceptor> hooks=new HashMap<>();
 interface Interceptor {Object run(Chain c)throws Throwable;}static class Chain {Object target;Method method;Object[] args;
 Chain(Object t,Method m,Object[] a){target=t;method=m;args=a;}Object getThisObject(){return target;}Object getArg(int i){return args[i];}
 Object proceed()throws Throwable {try{return method.invoke(target,args);}catch(InvocationTargetException e){throw e.getCause();}}}
 class Builder {Method method;Builder(Method m){method=m;}HookHandle intercept(Interceptor i){if(++built==failAt)throw new IllegalStateException("partial install");hooks.put(method,i);return ()->{hooks.remove(method);removed++;};}}
 Builder prepareFeatureHook(Method m,String id,boolean before){return new Builder(m);}void registerFeatureHook(HookHandle h){}public void deoptimize(Method m){}
 void logFeatureInfo(String s){}void logFeatureError(String s,Throwable e){}
 public static Object call(Object target,Class<?> type,String name,Class<?>[] parameters,Object... args)throws Throwable {
 Method m=type.getDeclaredMethod(name,parameters);Interceptor i=active.hooks.get(m);Chain c=new Chain(target,m,args);return i==null?c.proceed():i.run(c);}}
 ''',
 'com/zte/feature/fullscreen_gesture/GestureIcon.java': '''package com.zte.feature.fullscreen_gesture;import android.graphics.Bitmap;
 public class GestureIcon {public static Bitmap mBack=new Bitmap(),mSide=new Bitmap();public static boolean gesture=true;
 public static Bitmap getIcon(boolean hover){return gesture&&!hover?mBack:mSide;}}''',
 'com/zte/feature/fullscreen_gesture/SeaWaveView.java': '''package com.zte.feature.fullscreen_gesture;
 import android.graphics.*;import android.content.Context;import ls.augment.com.hook.AugmentModule;
 public class SeaWaveView extends android.view.View {public int mPosition,calls,seenAlpha,seenLeft;public boolean mIsHover,fail,draw=true,nest;
 public Rect mIconRect=new Rect();public Paint mIconPaint=new Paint();public Bitmap seen;public SeaWaveView nested;
 public Path mPath=new Path(),mLinePath=new Path();public Paint mWavePaint=new Paint(),mLinePaint=new Paint();public float mScale=1;public boolean waveFail;public int waveCalls;
 public void drawWave(Canvas canvas){waveCalls++;mPath.bounds.set(mPosition==0?0:176,50,mPosition==0?24:200,350);mLinePath.bounds=mPath.bounds;canvas.drawPath(mPath,mWavePaint);canvas.drawPath(mLinePath,mLinePaint);if(waveFail)throw new IllegalStateException("OEM wave failed");}
 public void init(Context c){}public void onActionDown(float a,float b,float c){}public void onActionUp(float a,android.animation.Animator.AnimatorListener b){}public void updateIconRect(){mIconRect.set(20,40,44,64);}
 public void onDraw(Canvas c) throws Throwable{drawIcon(c);}
 public void drawIcon(Canvas canvas)throws Throwable {calls++;if(!draw)return;updateIconRect();
 if(nest)AugmentModule.call(nested,SeaWaveView.class,"drawIcon",new Class[]{Canvas.class},canvas);
 seen=(Bitmap)AugmentModule.call(null,GestureIcon.class,"getIcon",new Class[]{boolean.class},mIsHover);seenAlpha=mIconPaint.getAlpha();seenLeft=mIconRect.left;
 if(fail)throw new IllegalStateException("OEM draw failed");}}
 ''',
 'ls/augment/com/hook/TestBackGestureRuntime.java': '''package ls.augment.com.hook;
 import java.lang.reflect.*;import java.util.*;import android.graphics.*;import com.zte.feature.fullscreen_gesture.*;import ls.augment.com.*;
 public class TestBackGestureRuntime {
 static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static void set(String name,Object v)throws Exception{Field f=BackGestureIconHook.class.getDeclaredField(name);f.setAccessible(true);f.set(null,v);}
 static Object state(boolean enabled,Bitmap left,Bitmap right)throws Exception {
 ConfigSnapshot s=new ConfigSnapshot();s.values.put(BackGestureIconPolicy.ENABLED,enabled?"1":"0");
 for(int side=0;side<2;side++){s.values.put(BackGestureIconPolicy.key(side,"mode"),"1");s.values.put(BackGestureIconPolicy.key(side,"asset"),(side==0?"a":"b").repeat(64));
 s.values.put(BackGestureIconPolicy.key(side,"background_asset"),"c".repeat(64));
 s.values.put(BackGestureIconPolicy.key(side,"opacity_percent"),"50");s.values.put(BackGestureIconPolicy.key(side,"inset_dp"),"10");s.values.put(BackGestureIconPolicy.key(side,"scale_percent"),"100");}
 Class<?> type=Class.forName("ls.augment.com.hook.BackGestureIconHook$State");Constructor<?> constructor=type.getDeclaredConstructor(ConfigSnapshot.class);constructor.setAccessible(true);Object result=constructor.newInstance(s);
 Field images=type.getDeclaredField("images");images.setAccessible(true);GestureArtwork[] a=(GestureArtwork[])images.get(result);a[0]=left==null?null:new GestureArtwork(left);a[1]=right==null?null:new GestureArtwork(right);return result;}
 static void down(SeaWaveView view)throws Throwable{AugmentModule.call(view,SeaWaveView.class,"onActionDown",new Class[]{float.class,float.class,float.class},1f,1f,1f);}
 static void draw(SeaWaveView view)throws Throwable{AugmentModule.call(view,SeaWaveView.class,"drawIcon",new Class[]{Canvas.class},new Canvas());}
 public static void main(String[] args)throws Throwable {
 AugmentModule bad=new AugmentModule();bad.failAt=3;AugmentModule.active=bad;
 check(BackGestureIconHook.install(bad,TestBackGestureRuntime.class.getClassLoader())==0&&bad.hooks.isEmpty()&&bad.removed==2,"partial install rollback");
 AugmentModule module=new AugmentModule();AugmentModule.active=module;check(BackGestureIconHook.install(module,TestBackGestureRuntime.class.getClassLoader())==6,"all hooks installed");
 Bitmap a=new Bitmap(),b=new Bitmap();Object settings=state(true,a,b);set("requested",settings);set("ready",settings);
 SeaWaveView left=new SeaWaveView(),right=new SeaWaveView();right.mPosition=1;
 for(int i=0;i<5;i++){down(left);draw(left);down(right);draw(right);check(left.seen==a&&right.seen==b,"independent sides");}
 check(left.seenAlpha==90&&right.seenAlpha==90&&left.seenLeft==30&&right.seenLeft==10,"native alpha and inward offsets");
 check(left.mIconPaint.getAlpha()==180&&left.mIconRect.left==20,"paint and rect restored after draw");
 check(GestureIcon.mBack!=a&&GestureIcon.mBack!=b,"OEM static bitmap never overwritten");
 check(AugmentModule.call(null,GestureIcon.class,"getIcon",new Class[]{boolean.class},false)==GestureIcon.mBack,"unscoped getIcon stays native");
 left.mIsHover=true;draw(left);check(left.seen==GestureIcon.mSide&&left.seenAlpha==180&&left.seenLeft==20,"hover preserved");left.mIsHover=false;
 GestureIcon.gesture=false;draw(left);check(left.seen==GestureIcon.mSide&&left.seenLeft==20,"other navigation action preserved");GestureIcon.gesture=true;
 SeaWaveView bottom=new SeaWaveView();bottom.mPosition=2;draw(bottom);check(bottom.seen==GestureIcon.mBack,"bottom bypass");
 left.nest=true;left.nested=bottom;draw(left);check(bottom.seen==GestureIcon.mBack&&left.seen==a,"nested bypass shadows and restores outer context");left.nest=false;
 int before=left.calls;left.fail=true;try{draw(left);throw new AssertionError("missing exception");}catch(IllegalStateException expected){}
 check(left.calls==before+1&&left.mIconPaint.getAlpha()==180&&left.mIconRect.left==20,"failure restores without repeating original");left.fail=false;
 check(AugmentModule.call(null,GestureIcon.class,"getIcon",new Class[]{boolean.class},false)==GestureIcon.mBack,"failure removes thread context");
 Bitmap next=new Bitmap();Object changed=state(true,next,b);set("ready",changed);set("requested",changed);draw(left);check(left.seen==a,"freeze current gesture");down(left);draw(left);check(left.seen==next,"apply on next gesture");
 set("requested",state(false,next,b));draw(left);check(left.seen==GestureIcon.mBack,"master off bypasses even captured session");
 Object missing=state(true,null,b);set("ready",missing);set("requested",missing);down(left);draw(left);down(right);draw(right);check(left.seen==GestureIcon.mBack&&right.seen==b,"missing left does not break right");
 left.draw=false;Bitmap previous=left.seen;draw(left);check(left.seen==previous,"OEM visibility guard not bypassed");
 // Background pair uses original path computation once, with reversible clipping.
 Object skin=state(true,a,b);Field bg=skin.getClass().getDeclaredField("backgrounds");bg.setAccessible(true);Bitmap wave=new Bitmap();((GestureArtwork[])bg.get(skin))[0]=new GestureArtwork(wave);((GestureArtwork[])bg.get(skin))[1]=new GestureArtwork(wave);
 set("requested",skin);set("ready",skin);down(left);down(right);
 Canvas lc=new Canvas(),rc=new Canvas();
 AugmentModule.call(left,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},lc);AugmentModule.call(right,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},rc);
 check(lc.seen==wave&&rc.seen==wave&&lc.visiblePaths==0&&rc.visiblePaths==0,"skin replaces pixels without native wave underneath");
 check(lc.left==0&&rc.right==200&&!lc.mirrored&&rc.mirrored,"background follows native bounds and mirrors only on right");
 check(lc.saves==0&&!lc.clipped&&left.waveCalls==1,"native wave executes once and canvas restored");
 left.mScale=.5f;Canvas fade=new Canvas();AugmentModule.call(left,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},fade);check(fade.alpha==128,"background follows gesture progress");left.mScale=1;
 left.mIsHover=true;Canvas hover=new Canvas();AugmentModule.call(left,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},hover);check(hover.bitmapCalls==0&&hover.visiblePaths==2,"hover wave stays native");left.mIsHover=false;
 GestureIcon.gesture=false;Canvas other=new Canvas();AugmentModule.call(left,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},other);check(other.visiblePaths==2&&other.bitmapCalls==0,"non-return background stays native");GestureIcon.gesture=true;
 Canvas bottomWave=new Canvas();AugmentModule.call(bottom,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},bottomWave);check(bottomWave.visiblePaths==2,"bottom wave unaffected");
 left.waveFail=true;Canvas failed=new Canvas();int waveBefore=left.waveCalls;
 try{AugmentModule.call(left,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},failed);throw new AssertionError("missing wave exception");}catch(IllegalStateException expected){}
 check(left.waveCalls==waveBefore+1&&failed.saves==0&&!failed.clipped,"OEM failure restores clip without replay");left.waveFail=false;
 Canvas unavailable=new Canvas();unavailable.failBitmap=true;AugmentModule.call(left,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},unavailable);
 check(unavailable.visiblePaths==2&&unavailable.saves==0,"bitmap error draws preserved native paths");
 set("requested",state(false,a,b));Canvas off=new Canvas();AugmentModule.call(left,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},off);check(off.bitmapCalls==0&&off.visiblePaths==2,"master off restores wave too");
 Object backgroundOnly=state(true,null,null);((GestureArtwork[])bg.get(backgroundOnly))[0]=new GestureArtwork(wave);
 set("requested",backgroundOnly);set("ready",backgroundOnly);down(left);Canvas solo=new Canvas();
 AugmentModule.call(left,SeaWaveView.class,"drawWave",new Class[]{Canvas.class},solo);
 check(solo.seen==wave&&solo.visiblePaths==0,"background works without a custom icon");
 java.lang.reflect.Field artField=backgroundOnly.getClass().getDeclaredField("backgrounds");artField.setAccessible(true);
 GestureArtwork art=((GestureArtwork[])artField.get(backgroundOnly))[0];int stopped=art.stops;
 AugmentModule.call(left,SeaWaveView.class,"onActionUp",new Class[]{float.class,android.animation.Animator.AnimatorListener.class},1f,null);
 down(left);int afterNew=art.stops;for(Runnable callback:new java.util.ArrayList<>(android.os.Handler.delayed))callback.run();android.os.Handler.delayed.clear();
 check(art.stops==afterNew,"stale up timer cannot stop the next gesture");
 AugmentModule.call(left,SeaWaveView.class,"onActionUp",new Class[]{float.class,android.animation.Animator.AnimatorListener.class},1f,null);
 for(Runnable callback:new java.util.ArrayList<>(android.os.Handler.delayed))callback.run();android.os.Handler.delayed.clear();
 check(art.stops>afterNew,"current up stops animated resources after exit");
 System.out.println("PASS production back gesture interceptors: "+checks+" checks");
 }
 }''',
}
for name in ('BackGestureIconPolicy.java', 'hook/BackGestureIconHook.java'):
    files['ls/augment/com/' + name] = (SRC / name).read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='lsa-gesture-') as temp:
    sources=[]
    for name, source in files.items():
        path=Path(temp)/name
        path.parent.mkdir(parents=True,exist_ok=True)
        path.write_text(source,encoding='utf-8')
        sources.append(str(path))
    subprocess.run(['javac','-encoding','UTF-8','-d',temp,*sources],check=True)
    subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestBackGestureRuntime'],check=True)
