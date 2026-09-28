"""Run production LayerBackdropSource against a deterministic Android/Binder facade.

This exercises lifecycle and safety boundaries on the host, not GPU rendering or real
OEM permissions. Generated facade files and classes stay in a temporary directory.
"""
import argparse
import os
from pathlib import Path
import shutil
import subprocess
import tempfile

STUBS = {
"android/graphics/Point.java": "package android.graphics;public class Point {public int x,y;}",
"android/graphics/Rect.java": """package android.graphics;
public class Rect {public int left,top,right,bottom; public Rect(){} public Rect(Rect r){set(r);}
 public Rect(int l,int t,int r,int b){set(l,t,r,b);} public void set(Rect r){set(r.left,r.top,r.right,r.bottom);}
 public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
 public int width(){return right-left;} public int height(){return bottom-top;}
 public boolean isEmpty(){return width()<=0||height()<=0;} public void offset(int x,int y){left+=x;right+=x;top+=y;bottom+=y;}
 public boolean equals(Object o){if(!(o instanceof Rect))return false;Rect r=(Rect)o;return left==r.left&&top==r.top&&right==r.right&&bottom==r.bottom;}}
""",
"android/graphics/Bitmap.java": """package android.graphics;
public class Bitmap {public enum Config{ARGB_8888} public final int w,h;public boolean recycled;public int[] pixels;
 public Bitmap(int w,int h){this.w=w;this.h=h;pixels=new int[w*h];java.util.Arrays.fill(pixels,0xff334455);}
 public int getWidth(){return w;} public int getHeight(){return h;} public boolean isRecycled(){return recycled;}
 public Bitmap copy(Config c,boolean mutable){Bitmap b=new Bitmap(w,h);b.pixels=pixels.clone();return b;}
 public void recycle(){recycled=true;} public int getPixel(int x,int y){return pixels[y*w+x];}
 public void getPixels(int[] out,int offset,int stride,int x,int y,int width,int height){for(int row=0;row<height;row++)System.arraycopy(pixels,(y+row)*w+x,out,offset+row*stride,width);}}
""",
"android/graphics/Canvas.java": """package android.graphics; public class Canvas {public int draws;public Rect source,destination;
public void drawBitmap(Bitmap b,Rect s,Rect d,Paint p){if(b.isRecycled())throw new IllegalStateException();draws++;source=s==null?null:new Rect(s);destination=new Rect(d);}}""",
"android/graphics/Paint.java": "package android.graphics; public class Paint {public static final int FILTER_BITMAP_FLAG=2;public Paint(int f){}}",
"android/hardware/HardwareBuffer.java": """package android.hardware;public class HardwareBuffer {
public static final long USAGE_PROTECTED_CONTENT=16384;public int width,height;public long usage;public boolean closed;
public HardwareBuffer(int w,int h,long u){width=w;height=h;usage=u;}public int getWidth(){return width;}public int getHeight(){return height;}
public long getUsage(){return usage;}public void close(){closed=true;}}""",
"android/os/SystemClock.java": "package android.os;public class SystemClock {public static long now=1000;public static long uptimeMillis(){return now;}}",
"android/os/Looper.java": "package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}",
"android/os/HandlerThread.java": "package android.os;public class HandlerThread {public HandlerThread(String s){}public void start(){}public Looper getLooper(){return new Looper();}}",
"android/os/Handler.java": """package android.os;import java.util.*;public class Handler {
static class Job {long time,order;Runnable run;Job(long t,Runnable r){time=t;run=r;order=next++;}}
static long next;static PriorityQueue<Job> queue=new PriorityQueue<>(Comparator.<Job>comparingLong(j->j.time).thenComparingLong(j->j.order));
public Handler(Looper l){}public boolean post(Runnable r){return postDelayed(r,0);}public boolean postDelayed(Runnable r,long d){queue.add(new Job(SystemClock.now+d,r));return true;}
public void removeCallbacks(Runnable r){queue.removeIf(j->j.run==r);}public static void reset(){queue.clear();SystemClock.now=1000;}
public static void advance(long millis){long target=SystemClock.now+millis;int limit=10000;while(!queue.isEmpty()&&queue.peek().time<=target){if(--limit==0)throw new AssertionError("Unbounded polling");Job j=queue.remove();SystemClock.now=j.time;j.run.run();}SystemClock.now=target;}}
""",
"android/view/ViewParent.java": "package android.view;public interface ViewParent {}",
"android/view/Display.java": "package android.view;public class Display {public int getDisplayId(){return 0;}public void getRealSize(android.graphics.Point p){p.x=1080;p.y=2400;}}",
"android/view/ViewGroup.java": "package android.view;public class ViewGroup extends View {public static class LayoutParams {}}",
"android/view/WindowManager.java": "package android.view;public interface WindowManager {class LayoutParams extends ViewGroup.LayoutParams {public static final int FLAG_SECURE=8192;public int flags;}}",
"android/view/View.java": """package android.view;import android.graphics.Rect;public class View implements ViewParent {
public static final int VISIBLE=0;public boolean attached=true,shown=true;public int visibility=0,x,y,invalidations;
public float scaleX=1,scaleY=1,rotation,rotationX,rotationY;public ViewParent parent;public ViewGroup.LayoutParams params=new WindowManager.LayoutParams();
public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown;}public int getWindowVisibility(){return visibility;}
public void getLocationOnScreen(int[] p){p[0]=x;p[1]=y;}public Display getDisplay(){return new Display();}
public void invalidate(){invalidations++;}public void invalidate(Rect r){invalidations++;}public float getScaleX(){return scaleX;}public float getScaleY(){return scaleY;}
public float getRotation(){return rotation;}public float getRotationX(){return rotationX;}public float getRotationY(){return rotationY;}
public ViewParent getParent(){return parent;}public View getRootView(){return parent instanceof View?((View)parent).getRootView():this;}
public ViewGroup.LayoutParams getLayoutParams(){return params;}}
""",
"android/view/SurfaceControl.java": """package android.view;public class SurfaceControl {public int id;public boolean valid=true,released;
public SurfaceControl(int id){this.id=id;}public SurfaceControl(SurfaceControl other,String name){id=other.id;valid=other.valid;}
public boolean isValid(){return valid&&!released;}public int getLayerId(){return id;}public void release(){released=true;}}""",
"android/view/IWindowManager.java": """package android.view;import android.window.ScreenCapture;public interface IWindowManager {
void captureDisplay(int id,ScreenCapture.CaptureArgs args,ScreenCapture.ScreenCaptureListener listener);}""",
"android/view/WindowManagerGlobal.java": """package android.view;import java.util.*;import android.window.ScreenCapture;
public class WindowManagerGlobal {public final Object mLock=new Object();public final List<Object> mRoots=new ArrayList<>(),mWindowlessRoots=new ArrayList<>();
public static final WindowManagerGlobal INSTANCE=new WindowManagerGlobal();public static final Service SERVICE=new Service();
public static WindowManagerGlobal getInstance(){return INSTANCE;}public static IWindowManager getWindowManagerService(){return SERVICE;}
public static class Root {public View view;public SurfaceControl surface;public Root(View v,int id){view=v;surface=new SurfaceControl(id);}public View getView(){return view;}public SurfaceControl getSurfaceControl(){return surface;}}
public static class Service implements IWindowManager {public int calls;public ScreenCapture.CaptureArgs args;public ScreenCapture.ScreenCaptureListener listener;
 public void captureDisplay(int id,ScreenCapture.CaptureArgs a,ScreenCapture.ScreenCaptureListener l){calls++;args=a;listener=l;}
 public void complete(ScreenCapture.ScreenshotHardwareBuffer b,int status){ScreenCapture.ScreenCaptureListener l=listener;listener=null;l.consumer.accept(b,status);}}
}
""",
"android/window/ScreenCapture.java": """package android.window;import android.graphics.*;import android.hardware.HardwareBuffer;import android.view.SurfaceControl;import java.util.function.ObjIntConsumer;
public class ScreenCapture {public static boolean ignoreSecureFlag,ignoreExclusions;
 public static class CaptureArgs {public boolean mCaptureSecureLayers=true,mAllowProtected=true;public SurfaceControl[] mExcludeLayers;public Rect crop;public float sx,sy;
 public static class Builder {CaptureArgs args=new CaptureArgs();public Builder(){}public Builder setCaptureSecureLayers(boolean b){if(!ignoreSecureFlag)args.mCaptureSecureLayers=b;return this;}
 public Builder setAllowProtected(boolean b){args.mAllowProtected=b;return this;}public Builder setExcludeLayers(SurfaceControl[] l){if(!ignoreExclusions)args.mExcludeLayers=l;return this;}
 public Builder setSourceCrop(Rect r){args.crop=r;return this;}public Builder setFrameScale(float x,float y){args.sx=x;args.sy=y;return this;}public CaptureArgs build(){return args;}}}
 public static class ScreenCaptureListener {public ObjIntConsumer<Object> consumer;public ScreenCaptureListener(ObjIntConsumer<Object> c){consumer=c;}}
 public static class ScreenshotHardwareBuffer {public final HardwareBuffer buffer;public final Bitmap bitmap;public boolean secure;
 public ScreenshotHardwareBuffer(int w,int h,long usage){buffer=new HardwareBuffer(w,h,usage);bitmap=new Bitmap(w,h);}public HardwareBuffer getHardwareBuffer(){return buffer;}
 public boolean containsSecureLayers(){return secure;}public Bitmap asBitmap(){return bitmap;}}
}
""",
"ls/augment/com/LiquidGlassDrawable.java": """package ls.augment.com;import android.graphics.Canvas;public class LiquidGlassDrawable {
public interface BackdropSource {boolean draw(Canvas c,int w,int h);default boolean isValid(){return true;}default long revision(){return -1;}}}""",
}

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--jdk',help='JDK bin directory; defaults to JAVA_HOME/bin or javac on PATH')
    args=parser.parse_args()
    root=Path(__file__).resolve().parents[1]
    configured=args.jdk or (str(Path(os.environ['JAVA_HOME'])/'bin') if os.environ.get('JAVA_HOME') else None)
    javac=shutil.which('javac')
    if configured is None and javac is None:
        parser.error('Set JAVA_HOME, put javac on PATH, or pass --jdk <JDK bin directory>')
    jdk=Path(configured) if configured else Path(javac).resolve().parent
    suffix='.exe' if (jdk/'javac.exe').exists() else ''
    with tempfile.TemporaryDirectory(prefix='ls-glass-host-') as temp:
        target=Path(temp)
        sources=[]
        for name,content in STUBS.items():
            path=target/name
            path.parent.mkdir(parents=True,exist_ok=True)
            path.write_text(content,encoding='utf-8')
            sources.append(str(path))
        sources += [str(root/'android/app/src/main/java/ls/augment/com'/name) for name in ('LayerBackdropSource.java','LiquidGlassPolicy.java')]
        sources += [str(root/'tools/TestLayerBackdropSource.java')]
        subprocess.run([str(jdk/('javac'+suffix)),'-encoding','UTF-8','-d',str(target/'classes'),*sources],check=True)
        subprocess.run([str(jdk/('java'+suffix)),'-cp',str(target/'classes'),'TestLayerBackdropSource'],check=True)

if __name__=='__main__':
    main()
