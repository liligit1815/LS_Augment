"""Exercise production screenshot hooks against verified OEM crop/save geometry.

The native fixtures replay ZteScreenshot 16.0.000.000.2604151512 (160000):
CropEvent's minimum checks and int inverse-mapped output size, CropRect's two
int truncations, and LongSnapModel's correctY + notify continuation. Android
rendering, ART interception and file persistence are facades, not device proof.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com/hook/ScreenshotCropHook.java"

FILES = {
    "android/content/Context.java": '''package android.content;public class Context {
public String pkg="com.android.ztescreenshot";public String getPackageName(){return pkg;}}''',
    "android/graphics/Rect.java": '''package android.graphics;public class Rect {
public int left,top,right,bottom;public Rect(){}public Rect(Rect r){this(r.left,r.top,r.right,r.bottom);}
public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
public int width(){return right-left;}public int height(){return bottom-top;}
public String toString(){return left+","+top+","+right+","+bottom;}}''',
    "android/graphics/RectF.java": '''package android.graphics;public class RectF {
public float left,top,right,bottom;public RectF(){}public RectF(RectF r){this(r.left,r.top,r.right,r.bottom);}
public RectF(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}
public float width(){return right-left;}public float height(){return bottom-top;}
public void round(Rect r){r.left=Math.round(left);r.top=Math.round(top);r.right=Math.round(right);r.bottom=Math.round(bottom);}
public String toString(){return left+","+top+","+right+","+bottom;}}''',
    "android/graphics/Matrix.java": '''package android.graphics;public class Matrix {
private float[] m={1,0,0,0,1,0,0,0,1};public Matrix(){}public Matrix(Matrix v){m=v.m.clone();}
public void setValues(float[] values){m=values.clone();}public void getValues(float[] values){System.arraycopy(m,0,values,0,9);}
public boolean invert(Matrix out){float det=m[0]*m[4]-m[1]*m[3];if(det==0||!Float.isFinite(det))return false;
out.m=new float[]{m[4]/det,-m[1]/det,(m[1]*m[5]-m[4]*m[2])/det,
-m[3]/det,m[0]/det,(m[3]*m[2]-m[0]*m[5])/det,0,0,1};return true;}
public boolean mapRect(RectF r){float[] x={r.left,r.right,r.left,r.right},y={r.top,r.top,r.bottom,r.bottom};
float l=Float.POSITIVE_INFINITY,t=l,right=Float.NEGATIVE_INFINITY,b=right;
for(int i=0;i<4;i++){float a=m[0]*x[i]+m[1]*y[i]+m[2],c=m[3]*x[i]+m[4]*y[i]+m[5];
l=Math.min(l,a);t=Math.min(t,c);right=Math.max(right,a);b=Math.max(b,c);}
r.left=l;r.top=t;r.right=right;r.bottom=b;return true;}}''',
    "android/graphics/Bitmap.java": '''package android.graphics;public class Bitmap {
public enum Config {ARGB_8888}public final int width,height;public Rect source;public int nativeTag;
public Bitmap(int w,int h){if(w<=0||h<=0)throw new IllegalArgumentException("nonpositive native bitmap:"+w+"x"+h);width=w;height=h;}
public int getWidth(){return width;}public int getHeight(){return height;}public boolean isRecycled(){return false;}
public static Bitmap createBitmap(int w,int h,Config c){return new Bitmap(w,h);}
public static Bitmap createBitmap(Bitmap input,int x,int y,int w,int h){
if(x<0||y<0||w<=0||h<=0||x+w>input.width||y+h>input.height)throw new IllegalArgumentException("native crop bounds");
Bitmap result=new Bitmap(w,h);result.source=new Rect(x,y,x+w,y+h);result.nativeTag=input.nativeTag;return result;}}''',
    "ls/augment/com/SystemOptions.java": '''package ls.augment.com;public class SystemOptions {
public static String key(String s){return "ls_augment_rm_"+s;}}''',
    "ls/augment/com/hook/FeatureSettings.java": '''package ls.augment.com.hook;import android.content.Context;
final class FeatureSettings {static volatile boolean on;static final Context context=new Context();
static final java.util.Map<String,String> diagnostics=new java.util.HashMap<>();
static Context from(Object owner){return context;}static boolean enabled(Context c,String k){
if(!k.equals("ls_augment_rm_screenshot_crop_unlimited"))throw new AssertionError("wrong switch:"+k);return on;}
static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}}''',
    "ls/augment/com/hook/AugmentModule.java": '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;final class AugmentModule {
interface Hooker {Object intercept(Chain c)throws Throwable;}interface Chain {Object getThisObject();Object getArg(int n);Object proceed()throws Throwable;}
final Map<Method,Hooker> hooks=new HashMap<>();int errors;static class Builder {Method method;Hooker hook;
Builder(Method m){method=m;}Builder intercept(Hooker h){hook=h;return this;}}
Builder prepareFeatureHook(Method m,String id,boolean observer){return new Builder(m);}void registerFeatureHook(Builder b){hooks.put(b.method,b.hook);}
void logFeatureInfo(String s){}void logFeatureError(String s,Throwable e){errors++;}
Object call(Object owner,String name,Class<?>[] types,Object...args)throws Throwable {
Method m=owner.getClass().getDeclaredMethod(name,types);m.setAccessible(true);Hooker h=hooks.get(m);
Chain c=new Chain(){public Object getThisObject(){return owner;}public Object getArg(int i){return args[i];}
public Object proceed()throws Throwable {try{return m.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}};
return h==null?c.proceed():h.intercept(c);}}''',
    "com/android/ztescreenshot/edit/event/CropEvent.java": '''package com.android.ztescreenshot.edit.event;
import android.graphics.*;
public class CropEvent {
private float MIN_CROP_BOX_SIZE=164f;private Matrix mMatrix=new Matrix();private RectF mCropBox;
private boolean mDrawingCropBox;private int mTouchArea;public int calls;public float observed;
public RuntimeException failure;public Runnable reenter;public Rect lastSource;
public CropEvent(RectF r,Matrix m){mCropBox=r;mMatrix=m;}
public float minimum(){return MIN_CROP_BOX_SIZE;}public RectF box(){return mCropBox;}
public void drawing(boolean b){mDrawingCropBox=b;}public void area(int a){mTouchArea=a;}
public void touchMove(float x,float y){calls++;observed=MIN_CROP_BOX_SIZE;
if(failure!=null)throw failure;if(reenter!=null){Runnable r=reenter;reenter=null;r.run();}
if(mDrawingCropBox){mCropBox.right=x;mCropBox.bottom=y;return;}
// These are the OEM eight edge/corner minimum assignments. Bounds stay native.
boolean l=mTouchArea==1||mTouchArea==2||mTouchArea==7;
boolean r=mTouchArea==3||mTouchArea==4||mTouchArea==8;
boolean t=mTouchArea==1||mTouchArea==3||mTouchArea==5;
boolean b=mTouchArea==2||mTouchArea==4||mTouchArea==6;
if(l)mCropBox.left=Math.max(0,Math.min(x,mCropBox.right-MIN_CROP_BOX_SIZE));
if(r)mCropBox.right=Math.min(1000,Math.max(x,mCropBox.left+MIN_CROP_BOX_SIZE));
if(t)mCropBox.top=Math.max(0,Math.min(y,mCropBox.bottom-MIN_CROP_BOX_SIZE));
if(b)mCropBox.bottom=Math.min(1000,Math.max(y,mCropBox.top+MIN_CROP_BOX_SIZE));}
public void touchUp(float x,float y){calls++;observed=MIN_CROP_BOX_SIZE;if(failure!=null)throw failure;
if(mDrawingCropBox){mCropBox.right=x;mCropBox.bottom=y;
if(mCropBox.width()<MIN_CROP_BOX_SIZE||mCropBox.height()<MIN_CROP_BOX_SIZE)mCropBox=new RectF();
mDrawingCropBox=false;}}
// Native output int(size) and round(source bounds), with rendering replaced by sentinels.
public Bitmap crop(Bitmap bitmap){calls++;if(failure!=null)throw failure;
if(mCropBox.width()>0f&&mCropBox.height()>0f){Matrix matrix=new Matrix();mMatrix.invert(matrix);
RectF rectF=new RectF(mCropBox);matrix.mapRect(rectF);
if(rectF.width()>0f&&rectF.height()>0f){Bitmap out=Bitmap.createBitmap((int)rectF.width(),(int)rectF.height(),Bitmap.Config.ARGB_8888);
Rect rect=new Rect();rectF.round(rect);lastSource=rect;out.source=rect;out.nativeTag=bitmap.nativeTag;return out;}}
return bitmap;}
// The similarly-named wrong overload is deliberately unrelated.
public void touchMove(double x,double y){throw new AssertionError("wrong overload");}
}''',
    "com/android/ztescreenshot/cropimage/CropBase.java": '''package com.android.ztescreenshot.cropimage;
import android.graphics.*;public class CropBase {
protected static float mBitmapMinScale=1,mBitmapXMinTran=0;
protected Rect clipRect;protected float scale=1,mBitmapScale=1,mBitmapXTran=0,mBitmapYTran=0;
protected float mBitmapWidth=1000,mBitmapHeight=1000;protected int translateX,translateY,mImageViewPadding,mImageViewWidth=1000,mImageViewHeight=1000;
public void configure(Rect r,float s,float display,float initial,int w,int h){clipRect=r;scale=s;mBitmapScale=display;mBitmapMinScale=initial;
mBitmapWidth=w;mBitmapHeight=h;mImageViewWidth=(int)(w*display);mImageViewHeight=(int)(h*display);}
public Rect box(){return clipRect;}}
''',
    "com/android/ztescreenshot/cropimage/CropRect.java": '''package com.android.ztescreenshot.cropimage;
import android.graphics.*;public class CropRect extends CropBase {
public boolean area=true;public int calls;public RuntimeException failure;
// Replay native crop: both int truncations, edge clipping and native clear side effect.
public Bitmap crop(Bitmap bitmap){calls++;if(failure!=null)throw failure;
if(clipRect==null||clipRect.width()==0||clipRect.height()==0)return bitmap;
int i=clipRect.left,i2=clipRect.top,iWidth=clipRect.width(),iHeight=clipRect.height();
if(translateX!=0)i-=translateX;if(translateY!=0)i2-=translateY;
if(scale!=1f){i=(int)(i*scale);i2=(int)(i2*scale);iWidth=(int)(iWidth*scale);iHeight=(int)(iHeight*scale);}
if(!area)clipRect=null;float f=mBitmapMinScale,f2=mBitmapScale/f;
int x=(int)((i-((mBitmapXTran-mBitmapXMinTran)/f))/f2),y=(int)((i2-(mBitmapYTran/f))/f2);
int width=(int)(iWidth/f2),height=(int)(iHeight/f2);if(x<0)x=0;if(y<0)y=0;
if(width+x>bitmap.getWidth())width=bitmap.getWidth()-x;if(height+y>bitmap.getHeight())height=bitmap.getHeight()-y;
return Bitmap.createBitmap(bitmap,x,y,width,height);}}
''',
    "com/android/ztescreenshot/longcapture/supersnap/model/DeftModel.java": '''package com.android.ztescreenshot.longcapture.supersnap.model;
public class DeftModel {public int notifications,lastEvent;public Runnable observer;
public void notifyChanged(int event){notifications++;lastEvent=event;if(observer!=null)observer.run();}}
''',
    "com/android/ztescreenshot/longcapture/supersnap/model/LongSnapModel.java": '''package com.android.ztescreenshot.longcapture.supersnap.model;
public class LongSnapModel extends DeftModel {private int mCutStartY,mCutEndY,mScrollingCutY;public int calls,correctCalls;
public RuntimeException failure;public LongSnapModel(int first,int total){mCutStartY=first;mScrollingCutY=total;}
public int first(){return mCutStartY;}public int last(){return mCutEndY;}
public int correctY(int i){correctCalls++;if(failure!=null)throw failure;if(i<0)i=0;return i>mScrollingCutY?mScrollingCutY:i;}
public void setCutEndY(int i,boolean z){calls++;int i2=mCutStartY;if(i<i2+100)i=i2+100;
mCutEndY=correctY(i);if(z)notifyChanged(103);}}
''',
    "ls/augment/com/hook/TestScreenshotCrop.java": '''package ls.augment.com.hook;
import android.graphics.*;import com.android.ztescreenshot.edit.event.CropEvent;
import com.android.ztescreenshot.cropimage.CropRect;import com.android.ztescreenshot.longcapture.supersnap.model.LongSnapModel;
public class TestScreenshotCrop {
static int checks;static final Class<?>[] TOUCH={float.class,float.class},IMAGE={Bitmap.class},CUT={int.class,boolean.class};
static void check(boolean v,String message){checks++;if(!v)throw new AssertionError(message);}
static Matrix matrix(float sx,float sy,float x,float y){Matrix m=new Matrix();m.setValues(new float[]{sx,0,x,0,sy,y,0,0,1});return m;}
static Bitmap input(){Bitmap b=new Bitmap(1000,1000);b.nativeTag=7654;return b;}
static Bitmap save(AugmentModule m,CropEvent c)throws Throwable{return (Bitmap)m.call(c,"crop",IMAGE,input());}
static void output(Bitmap b){check(b.width>=1&&b.height>=1,"native output must have positive pixels");
check(b.nativeTag==7654,"native bitmap/save identity metadata preserved");
check(b.source.left>=0&&b.source.top>=0&&b.source.right<=1000&&b.source.bottom<=1000,"native source bounds preserved");}
public static void main(String[] args)throws Throwable {
AugmentModule m=new AugmentModule();ClassLoader loader=TestScreenshotCrop.class.getClassLoader();
ScreenshotCropHook.install(m,loader,"com.android.gallery3d");check(m.hooks.isEmpty(),"wrong package untouched");
if(args.length>0){ScreenshotCropHook.install(m,loader,"com.android.ztescreenshot");
check(m.hooks.size()==2&&m.errors==1,"incompatible editor preflight prevents any partial editor hooks");
for(java.lang.reflect.Method method:m.hooks.keySet())check(method.getDeclaringClass()!=CropEvent.class,"partial editor hook registered");
System.out.println("PASS ScreenshotCropHook incompatible OEM editor shape fails closed");return;}
ScreenshotCropHook.install(m,loader,"com.android.ztescreenshot");check(m.hooks.size()==5,"all five exact native callbacks installed");
ScreenshotCropHook.install(m,loader,"com.android.ztescreenshot");check(m.hooks.size()==5,"duplicate install skipped");
check(!m.hooks.containsKey(CropEvent.class.getMethod("touchMove",double.class,double.class)),"wrong overload untouched");
for(int area=1;area<=8;area++)for(boolean on:new boolean[]{false,true,false}){
FeatureSettings.on=on;CropEvent c=new CropEvent(new RectF(200,200,500,500),new Matrix());c.area(area);
boolean left=area==1||area==2||area==7,top=area==1||area==3||area==5;
m.call(c,"touchMove",TOUCH,left?499f:201f,top?499f:201f);
float w=c.box().width(),h=c.box().height();
if(area!=5&&area!=6)check(on?w<10:w==164,"width minimum area="+area+" on="+on+" width="+w);
if(area!=7&&area!=8)check(on?h<10:h==164,"height minimum area="+area+" on="+on+" height="+h);
check(c.minimum()==164&&c.calls==1,"original minimum/native call restored");if(on)output(save(m,c));}
for(boolean on:new boolean[]{false,true,false}){FeatureSettings.on=on;CropEvent c=new CropEvent(new RectF(20,20,20,20),new Matrix());c.drawing(true);
m.call(c,"touchUp",TOUCH,23f,24f);check(on?c.box().width()==3:c.box().width()==0,"small new selection acceptance is gated");
check(c.minimum()==164,"new selection minimum restored");if(on)output(save(m,c));}
FeatureSettings.on=true;
for(float sx:new float[]{.1f,.4f,1f,2f,23f})for(float sy:new float[]{.25f,.4f,1f,3.7f,61f})
for(float position:new float[]{.1234f,37.4321f,499.99997f,998.75f})for(float span:new float[]{.3f,.99999f,1f,1.00001f}){
Matrix transform=matrix(sx,sy,.123f,.357f);RectF box=new RectF(position,position,position+span,position+.2f);transform.mapRect(box);
CropEvent c=new CropEvent(box,transform);RectF identity=c.box();output(save(m,c));check(c.box()==identity,"save restores exact crop box identity");}
// The source widths below one are faithfully cast to zero by the native fixture.
FeatureSettings.on=false;CropEvent zero=new CropEvent(new RectF(2.3f,5.4f,2.31f,5.41f),matrix(.4f,.4f,.123f,.357f));
boolean nativeThrew=false;try{save(m,zero);}catch(IllegalArgumentException expected){nativeThrew=true;}
check(nativeThrew,"disabled subpixel output retains the native exception");FeatureSettings.on=true;output(save(m,zero));
for(float sx:new float[]{.4f,1.7f}){Matrix oneMatrix=matrix(sx,sx,3.333f,7.777f);RectF oneBox=new RectF(.01f,.01f,.5f,.5f);oneMatrix.mapRect(oneBox);
CropEvent c=new CropEvent(oneBox,oneMatrix);Bitmap one=(Bitmap)m.call(c,"crop",IMAGE,new Bitmap(1,1));
check(one.width==1&&one.height==1&&one.source.left==0&&one.source.right==1,"one-pixel images retain native rounded bounds");}
CropEvent hot=new CropEvent(new RectF(200,200,500,500),new Matrix());hot.area(8);
FeatureSettings.on=true;m.call(hot,"touchMove",TOUCH,210f,0f);check(hot.box().width()==10,"opened event enabled");
FeatureSettings.on=false;m.call(hot,"touchMove",TOUCH,210f,0f);check(hot.box().width()==164,"same event hot disable restores native minimum");
FeatureSettings.on=true;CropEvent nested=new CropEvent(new RectF(200,200,500,500),new Matrix());nested.area(8);
nested.reenter=()->{try{m.call(nested,"touchUp",TOUCH,0f,0f);}catch(Throwable e){throw new AssertionError(e);}};
m.call(nested,"touchMove",TOUCH,210f,0f);check(nested.minimum()==164&&nested.calls==2,"nested temporary minimum restored");
CropEvent concurrent=new CropEvent(new RectF(200,200,500,500),new Matrix());concurrent.area(8);
java.util.concurrent.CountDownLatch inside=new java.util.concurrent.CountDownLatch(1),release=new java.util.concurrent.CountDownLatch(1),started=new java.util.concurrent.CountDownLatch(1),done=new java.util.concurrent.CountDownLatch(1);
java.util.concurrent.atomic.AtomicReference<Throwable> asyncError=new java.util.concurrent.atomic.AtomicReference<>();
concurrent.reenter=()->{inside.countDown();try{if(!release.await(5,java.util.concurrent.TimeUnit.SECONDS))throw new AssertionError("release timed out");}catch(InterruptedException e){throw new AssertionError(e);}};
Thread enabledThread=new Thread(()->{try{m.call(concurrent,"touchMove",TOUCH,210f,0f);}catch(Throwable e){asyncError.set(e);}});
enabledThread.start();check(inside.await(5,java.util.concurrent.TimeUnit.SECONDS),"enabled call entered native code");FeatureSettings.on=false;
Thread disabledThread=new Thread(()->{started.countDown();try{m.call(concurrent,"touchUp",TOUCH,0f,0f);}catch(Throwable e){asyncError.set(e);}finally{done.countDown();}});
disabledThread.start();started.await();check(!done.await(100,java.util.concurrent.TimeUnit.MILLISECONDS),"concurrent disabled call waits for field restoration");
release.countDown();enabledThread.join(5000);disabledThread.join(5000);
check(asyncError.get()==null&&!enabledThread.isAlive()&&!disabledThread.isAlive(),"concurrent native calls finish without exceptions");
check(concurrent.minimum()==164&&concurrent.observed==164,"concurrent disabled native call sees original minimum");FeatureSettings.on=true;
CropEvent failure=new CropEvent(new RectF(200,200,500,500),new Matrix());failure.failure=new IllegalStateException("native failure");
try{m.call(failure,"touchMove",TOUCH,210f,0f);throw new AssertionError("missing failure");}
catch(IllegalStateException e){check(e==failure.failure&&failure.minimum()==164&&failure.calls==1,"native exception preserved and field restored");}
FeatureSettings.context.pkg="other.host";CropEvent wrong=new CropEvent(new RectF(200,200,500,500),new Matrix());wrong.area(8);
m.call(wrong,"touchMove",TOUCH,201f,0f);check(wrong.box().width()==164,"wrong context cannot activate");FeatureSettings.context.pkg="com.android.ztescreenshot";
for(float ratio:new float[]{.5f,1f,2f,7.5f})for(float scale:new float[]{.25f,.4f,1f,3f})for(boolean area:new boolean[]{false,true}){
CropRect crop=new CropRect();Rect original=new Rect(20,20,21,21);crop.configure(original,scale,ratio,1,1000,1000);crop.area=area;
Bitmap out=(Bitmap)m.call(crop,"crop",IMAGE,input());output(out);check(crop.calls==1,"area native continuation exactly once");
check(area?crop.box()==original:crop.box()==null,"area box identity/native clear preserved");}
for(boolean on:new boolean[]{false,true,false}){FeatureSettings.on=on;LongSnapModel longCrop=new LongSnapModel(30,500);
longCrop.observer=()->check(longCrop.first()==30,"observer sees true start coordinate");
m.call(longCrop,"setCutEndY",CUT,35,true);check(longCrop.last()==(on?35:130),"long minimum gated");
check(longCrop.notifications==1&&longCrop.lastEvent==103&&longCrop.correctCalls==1,"native correction/notification exactly once");}
FeatureSettings.on=true;
for(int first:new int[]{0,30})for(int requested:new int[]{-99,0,1,35,500,2000})for(boolean notify:new boolean[]{false,true}){
LongSnapModel c=new LongSnapModel(first,500);m.call(c,"setCutEndY",CUT,requested,notify);
check(c.last()==Math.min(500,Math.max(first+1,requested)),"long crop keeps source boundary and one pixel");
check(c.notifications==(notify?1:0)&&c.correctCalls==1,"long native notify toggle/correction preserved");}
check(FeatureSettings.diagnostics.containsKey("ls_augment_screenshot_crop_state"),"enabled execution evidence published");
check(m.errors==0,"verified native shapes install without errors");
System.out.println("PASS ScreenshotCropHook: "+checks+" OEM geometry/gating/output/exception assertions (no device claim)");}
}''',
}


def java_tools():
    candidates = [Path(os.environ.get("JAVA_HOME", "")) / "bin",
                  Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")]
    for candidate in candidates:
        if (candidate / "javac.exe").is_file():
            return str(candidate / "javac.exe"), str(candidate / "java.exe")
    return shutil.which("javac"), shutil.which("java")


def exercise(source, expect_failure=False, missing_editor=False):
    javac, java = java_tools()
    if not javac or not java:
        raise RuntimeError("JDK required for the screenshot native-geometry regression")
    with tempfile.TemporaryDirectory(prefix="duo-screenshot-crop-") as directory:
        base = Path(directory)
        all_sources = dict(FILES)
        if missing_editor:
            name = "com/android/ztescreenshot/edit/event/CropEvent.java"
            all_sources[name] = all_sources[name].replace("public Bitmap crop(Bitmap bitmap)", "public Bitmap cropFuture(Bitmap bitmap)")
        all_sources["ls/augment/com/hook/ScreenshotCropHook.java"] = source
        files = []
        for name, content in all_sources.items():
            file = base / name
            file.parent.mkdir(parents=True, exist_ok=True)
            file.write_text(content, encoding="utf-8")
            files.append(str(file))
        subprocess.run([javac, "-encoding", "UTF-8", "--release", "17", "-d", directory, *files], check=True)
        result = subprocess.run([java, "-cp", directory, "ls.augment.com.hook.TestScreenshotCrop", *(["missing"] if missing_editor else [])],
                                capture_output=True, text=True, timeout=30)
        if expect_failure:
            if result.returncode == 0:
                raise AssertionError("Unsafe minimum mutation was accepted")
            print("PASS negative mutation rejected")
        else:
            print(result.stdout.strip())
            if result.returncode:
                raise AssertionError(result.stderr)


if __name__ == "__main__":
    source = SOURCE.read_text(encoding="utf-8")
    exercise(source)
    exercise(source, missing_editor=True)
    # The suite must notice a lingering low minimum after a hot disable.
    exercise(source.replace("minimum.setFloat(owner, original);", "minimum.setFloat(owner, 0f);"), True)
