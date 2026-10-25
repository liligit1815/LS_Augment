"""Production glass capture and blur, with pixel-backed software/Window facades.

The TextureView double models the NX809J ROM's opaque software cache (black)
and a distinct composited Window copy (real pixels). It is not a GPU/phone test.
"""
from pathlib import Path
import runpy
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
MEMBER = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))["member"]

STUBS = {
"android/content/Context.java": "package android.content;public class Context {public Context getApplicationContext(){return this;}}",
"android/content/res/Configuration.java": "package android.content.res;public class Configuration {public int revision=1;public int hashCode(){return revision;}}",
"android/content/res/Resources.java": "package android.content.res;public class Resources {public final Configuration configuration=new Configuration();public Configuration getConfiguration(){return configuration;}}",
"android/os/Looper.java": "package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}",
"android/os/Handler.java": "package android.os;public class Handler {public Handler(Looper l){}}",
"android/app/Activity.java": r'''package android.app;
public class Activity extends android.content.Context {public boolean destroyed,finishing;public android.view.Window window=new android.view.Window();public final android.content.res.Resources resources=new android.content.res.Resources();
 public android.view.Window getWindow(){return window;}public boolean isDestroyed(){return destroyed;}public boolean isFinishing(){return finishing;}
 public android.content.res.Resources getResources(){return resources;}public android.view.View findViewById(int id){return window.decor;}}
''',
"android/R.java": "package android;public class R {public static class id {public static final int content=1;}}",
"android/graphics/Rect.java": r'''package android.graphics;public class Rect {
 public int left,top,right,bottom;public Rect(){}public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public Rect(Rect r){this(r.left,r.top,r.right,r.bottom);}
 public int width(){return right-left;}public int height(){return bottom-top;}public static boolean intersects(Rect a,Rect b){return a.left<b.right&&b.left<a.right&&a.top<b.bottom&&b.top<a.bottom;}
 public boolean intersect(int l,int t,int r,int b){if(left<r&&l<right&&top<b&&t<bottom){left=Math.max(left,l);top=Math.max(top,t);right=Math.min(right,r);bottom=Math.min(bottom,b);return true;}return false;}}
''',
"android/graphics/Bitmap.java": r'''package android.graphics;import java.util.*;public class Bitmap {
 public enum Config {ARGB_8888}public final int width,height;public int[] pixels;public boolean recycled;public static boolean failNext;
 private Bitmap(int w,int h){if(w<=0||h<=0)throw new IllegalArgumentException();width=w;height=h;pixels=new int[w*h];}
 public static Bitmap createBitmap(int w,int h,Config c){if(failNext){failNext=false;throw new OutOfMemoryError("private pixels");}return new Bitmap(w,h);}
 public int getWidth(){return width;}public int getHeight(){return height;}public boolean isRecycled(){return recycled;}public void recycle(){recycled=true;}
 public void eraseColor(int c){Arrays.fill(pixels,c);}public int getPixel(int x,int y){return pixels[y*width+x];}
 public void getPixels(int[] p,int o,int s,int x,int y,int w,int h){for(int row=0;row<h;row++)System.arraycopy(pixels,(y+row)*width+x,p,o+row*s,w);}
 public void setPixels(int[] p,int o,int s,int x,int y,int w,int h){for(int row=0;row<h;row++)System.arraycopy(p,o+row*s,pixels,(y+row)*width+x,w);}}
''',
"android/graphics/Paint.java": "package android.graphics;public class Paint {public static final int FILTER_BITMAP_FLAG=2;public Paint(int f){}}",
"android/graphics/Canvas.java": r'''package android.graphics;import java.util.*;public class Canvas {
 public Bitmap target;private double sx=1,sy=1,tx,ty;private final ArrayDeque<double[]> stack=new ArrayDeque<>();
 public Canvas(Bitmap b){target=b;}public int save(){stack.push(new double[]{sx,sy,tx,ty});return stack.size();}public void restore(){double[] v=stack.pop();sx=v[0];sy=v[1];tx=v[2];ty=v[3];}
 public void scale(float x,float y){sx*=x;sy*=y;}public void translate(float x,float y){tx+=x*sx;ty+=y*sy;}
 public void fill(int w,int h,int color){if(color==0)return;for(int y=Math.max(0,(int)ty);y<Math.min(target.height,(int)Math.ceil(ty+h*sy));y++)for(int x=Math.max(0,(int)tx);x<Math.min(target.width,(int)Math.ceil(tx+w*sx));x++)target.pixels[y*target.width+x]=color;}
 public void drawBitmap(Bitmap b,Rect source,Rect d,Paint p){if(b.recycled)throw new IllegalStateException();Rect s=source==null?new Rect(0,0,b.width,b.height):source;
  for(int y=Math.max(0,d.top);y<Math.min(target.height,d.bottom);y++)for(int x=Math.max(0,d.left);x<Math.min(target.width,d.right);x++){
   int px=Math.min(s.right-1,s.left+(x-d.left)*s.width()/d.width()),py=Math.min(s.bottom-1,s.top+(y-d.top)*s.height()/d.height());target.pixels[y*target.width+x]=b.getPixel(px,py);}}}
''',
"android/graphics/Matrix.java": "package android.graphics;public class Matrix {public void setScale(float x,float y){}public void postTranslate(float x,float y){}}",
"android/graphics/Shader.java": "package android.graphics;public class Shader {public enum TileMode {CLAMP}}",
"android/graphics/BitmapShader.java": "package android.graphics;public class BitmapShader {public final Bitmap bitmap;public BitmapShader(Bitmap b,Shader.TileMode x,Shader.TileMode y){bitmap=b;}public void setLocalMatrix(Matrix m){}}",
"android/view/View.java": r'''package android.view;import android.graphics.*;public class View {
 public static final int VISIBLE=0,GONE=8;public int x,y,width=300,height=300,color=0xffddeeff,visibility,invalidations;public boolean attached=true,hardware=true;public float alpha=1;public View root=this;public android.content.res.Resources resources=new android.content.res.Resources();
 public int getVisibility(){return visibility;}public float getAlpha(){return alpha;}public int getWidth(){return width;}public int getHeight(){return height;}
 public boolean isAttachedToWindow(){return attached;}public boolean isHardwareAccelerated(){return hardware;}public View getRootView(){return root;}public void getLocationOnScreen(int[] out){out[0]=x;out[1]=y;}
 public boolean getGlobalVisibleRect(Rect out){out.left=x;out.top=y;out.right=x+width;out.bottom=y+height;return attached&&visibility==VISIBLE&&width>0&&height>0;}
 public void invalidate(){invalidations++;}public android.content.res.Resources getResources(){return resources;}public void draw(Canvas c){c.fill(width,height,color);}}
''',
"android/view/ViewGroup.java": r'''package android.view;import java.util.*;import android.graphics.*;public class ViewGroup extends View {
 public final List<View> children=new ArrayList<>();public void add(View v){v.root=root;children.add(v);}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}
 public void draw(Canvas c){super.draw(c);for(View v:children)if(v.visibility==VISIBLE&&v.alpha>.01f){c.save();c.translate(v.x-x,v.y-y);
  // ROM View.draw builds an opaque software cache for TextureView's layer type 2.
  // TextureView.draw on that software Canvas returns without drawing its producer.
  if(v instanceof TextureView)c.fill(v.width,v.height,0xff000000);else v.draw(c);c.restore();}}}
''',
"android/view/TextureView.java": "package android.view;public class TextureView extends View {}",
"android/view/SurfaceView.java": "package android.view;public class SurfaceView extends View {}",
"android/view/WindowManager.java": "package android.view;public interface WindowManager {public class LayoutParams {public static final int FLAG_SECURE=8192;public int flags;}}",
"android/view/Window.java": "package android.view;public class Window {public ViewGroup decor=new ViewGroup();public android.graphics.Bitmap composited;public final WindowManager.LayoutParams attrs=new WindowManager.LayoutParams();public View getDecorView(){return decor;}public WindowManager.LayoutParams getAttributes(){return attrs;}}",
"android/view/PixelCopy.java": r'''package android.view;import java.util.*;import android.graphics.*;public class PixelCopy {
 public static final int SUCCESS=0,ERROR_UNKNOWN=1,ERROR_TIMEOUT=2,ERROR_SOURCE_NO_DATA=3,ERROR_SOURCE_INVALID=4,ERROR_DESTINATION_INVALID=5;
 public interface OnPixelCopyFinishedListener {void onPixelCopyFinished(int status);}public record Request(Window window,Rect crop,Bitmap bitmap,OnPixelCopyFinishedListener done){}
 public static final ArrayDeque<Request> requests=new ArrayDeque<>();public static int count;public static boolean fail;
 public static void request(Window w,Rect r,Bitmap b,OnPixelCopyFinishedListener l,android.os.Handler h){if(fail){fail=false;throw new IllegalArgumentException("private source");}count++;requests.add(new Request(w,new Rect(r),b,l));}
 public static void complete(int status){Request r=requests.remove();if(status==SUCCESS)new Canvas(r.bitmap).drawBitmap(r.window.composited,r.crop,new Rect(0,0,r.bitmap.width,r.bitmap.height),new Paint(2));r.done.onPixelCopyFinished(status);}
 public static void reset(){requests.clear();count=0;fail=false;}}
''',
"ls/augment/com/AtomicWorkbenchDiagnostics.java": r'''package ls.augment.com;public class AtomicWorkbenchDiagnostics {
 public static final java.util.List<String> events=java.util.Collections.synchronizedList(new java.util.ArrayList<>());
 static void record(android.content.Context c,long g,String e,int w,int u,String component,int display,String detail,Throwable error){if(!ResetWriteFence.stale(g))events.add(e+";"+detail);}}
''',
"ls/augment/com/UiKit.java": r'''package ls.augment.com;public class UiKit {
 final android.app.Activity activity;final int background=0xffe8f4ff;final Appearance appearance=new Appearance();UiKit(android.app.Activity a){activity=a;}int dp(int x){return x;}
 static class Appearance {Scene glassScene;}static class Scene {void bitmap(){}}}
'''
}

HEAD = r'''package ls.augment.com;import android.graphics.*;import android.view.*;
final class LiquidGlassLayout extends View {
 static boolean capturing;final UiKit ui;final GlassWindowBackdrop windowBackdrop;boolean contentSurface,navigationLens,dirty=true,captureDisabled,failed;
 Bitmap bitmap;Canvas bitmapCanvas;BitmapShader texture;Object optics,lensOptics;int[] pixels,scratch;final int[] ownLocation=new int[2],sourceLocation=new int[2];
 int capturedWidth,capturedHeight,capturedConfiguration,captureRequest,generation;long signature;float density=1;
 final Rect visibleBounds=new Rect();final Matrix textureMatrix=new Matrix();
 LiquidGlassLayout(UiKit u){ui=u;resources=u.activity.resources;windowBackdrop=new GlassWindowBackdrop(u.activity,this);}
 void prepareOptics(){}void updateSharedBackdrop(){}void sample(){captureIfNeeded();}
}
'''

TEST = r'''package ls.augment.com;
import android.app.*;import android.graphics.*;import android.view.*;import java.util.*;
public class TestGlassWindowBackdrop {
 static int checks,cases;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}static void test(Runnable r){PixelCopy.reset();r.run();cases++;}
 static final int RED=0xffdd4433,BLUE=0xff3377ee,GREEN=0xff44bb77,WHITE=0xffffffff;
 static class F {
  Activity a=new Activity();UiKit ui=new UiKit(a);LiquidGlassLayout lens=new LiquidGlassLayout(ui);ViewGroup source=a.window.decor;TextureView video=new TextureView();
  F(){source.width=300;source.height=300;source.color=GREEN;video.x=0;video.y=0;video.width=170;video.height=300;source.add(video);
   lens.x=20;lens.y=60;lens.width=240;lens.height=160;
   a.window.composited=Bitmap.createBitmap(300,300,Bitmap.Config.ARGB_8888);a.window.composited.eraseColor(GREEN);
   for(int y=0;y<300;y++)for(int x=0;x<170;x++)a.window.composited.pixels[y*300+x]=RED;
   // A visible sibling covering part of the Texture must remain above the real producer.
   View overlay=new View();overlay.x=40;overlay.y=80;overlay.width=40;overlay.height=40;overlay.color=WHITE;source.add(overlay);
   for(int y=80;y<120;y++)for(int x=40;x<80;x++)a.window.composited.pixels[y*300+x]=WHITE;
  }
  void ready(){lens.sample();check(PixelCopy.requests.size()==1,"no bounded Window copy");PixelCopy.complete(PixelCopy.SUCCESS);}
  int pixel(int screenX,int screenY){int x=(screenX-lens.x+18)/2,y=(screenY-lens.y+18)/2;return lens.bitmap.getPixel(x,y);}
  void fallback(String why){check(lens.bitmap==null&&lens.texture==null&&lens.captureDisabled,"unsafe result survived "+why);}
 }
 public static void main(String[] args)throws Exception {
 test(()->{F f=new F();Bitmap b=Bitmap.createBitmap(300,300,Bitmap.Config.ARGB_8888);f.source.draw(new Canvas(b));check(b.getPixel(100,150)==0xff000000,"negative control did not reproduce opaque ROM black cache");f.ready();check(f.pixel(100,150)==RED,"Window pixels remained black");check(f.pixel(220,150)==GREEN,"right-side page pixels displaced");check(f.pixel(60,100)==WHITE,"Texture overlay ordering was lost");});
 test(()->{F f=new F();f.source.children.remove(f.video);f.lens.sample();check(PixelCopy.count==0&&f.lens.generation==1,"ordinary dialog no longer uses software capture");check(f.pixel(220,150)==GREEN,"ordinary software page pixels changed");});
 test(()->{F f=new F();f.video.visibility=View.GONE;f.lens.sample();check(PixelCopy.count==0,"hidden texture triggered capture");});
 test(()->{F f=new F();f.video.x=500;f.lens.sample();check(PixelCopy.count==0,"offscreen texture triggered capture");});
 test(()->{F f=new F();f.a.window.attrs.flags=8192;f.lens.sample();f.fallback("secure");check(PixelCopy.count==0,"secure window was read");});
 test(()->{F f=new F();f.source.children.remove(f.video);f.a.window.attrs.flags=8192;f.lens.sample();f.fallback("secure plain page");check(PixelCopy.count==0,"secure plain page copied");});
 test(()->{F f=new F();f.lens.root=f.source;f.lens.sample();f.fallback("same window feedback");check(PixelCopy.count==0,"captured own glass window");});
 test(()->{F f=new F();f.source.hardware=false;f.lens.sample();f.fallback("no hardware");check(PixelCopy.count==0,"software window copied");});
 test(()->{F f=new F();f.a.destroyed=true;f.lens.sample();f.fallback("destroyed");check(PixelCopy.count==0,"destroyed Activity copied");});
 test(()->{F f=new F();f.lens.attached=false;f.lens.sample();check(PixelCopy.count==0,"detached owner copied");});
 test(()->{F f=new F();f.lens.width=5000;f.lens.height=5000;f.lens.sample();f.fallback("size cap");check(PixelCopy.count==0,"unbounded capture allocated");});
 test(()->{F f=new F();f.lens.sample();Bitmap b=PixelCopy.requests.peek().bitmap();f.lens.refreshBackdrop();f.lens.sample();check(PixelCopy.count==1,"cancel started a second in-flight allocation");PixelCopy.complete(0);check(b.isRecycled()&&f.lens.bitmap==null,"canceled result promoted");f.ready();});
 test(()->{F f=new F();f.lens.sample();f.lens.attached=false;PixelCopy.complete(0);check(f.lens.bitmap==null,"detached callback retained pixels");});
 test(()->{F f=new F();f.lens.sample();f.lens.width++;PixelCopy.complete(0);f.fallback("resized");});
 test(()->{F f=new F();f.lens.sample();f.lens.x++;PixelCopy.complete(0);f.fallback("moved");});
 test(()->{F f=new F();f.lens.sample();f.source.width++;PixelCopy.complete(0);f.fallback("window resized");});
 test(()->{F f=new F();f.lens.sample();f.a.window.attrs.flags=8192;PixelCopy.complete(0);f.fallback("secure during copy");});
 test(()->{F f=new F();f.lens.sample();f.a.resources.configuration.revision++;PixelCopy.complete(0);f.fallback("theme changed during copy");});
 test(()->{F f=new F();f.ready();f.a.resources.configuration.revision++;f.lens.sample();check(f.lens.bitmap==null&&f.lens.texture==null,"old theme bitmap retained while recapturing");PixelCopy.complete(0);check(f.lens.bitmap!=null,"new config copy unavailable");});
 test(()->{F f=new F();f.lens.sample();ResetWriteFence.begin();ResetWriteFence.end();PixelCopy.complete(0);f.fallback("reset");});
 test(()->{F f=new F();f.lens.sample();f.a.window=new Window();PixelCopy.complete(0);f.fallback("window replaced");});
 for(int status:new int[]{1,2,3,4,5})test(()->{F f=new F();f.lens.sample();Bitmap b=PixelCopy.requests.peek().bitmap();PixelCopy.complete(status);f.fallback("copy error "+status);check(b.isRecycled(),"failed native target leaked");int count=PixelCopy.count;for(int i=0;i<20;i++)f.lens.sample();check(PixelCopy.count==count,"fallback retried every draw");});
 test(()->{F f=new F();PixelCopy.fail=true;f.lens.sample();f.fallback("request exception");});
 test(()->{F f=new F();Bitmap.failNext=true;f.lens.sample();f.fallback("allocation failure");});
 test(()->{F f=new F();f.lens.x=-12;f.lens.y=-8;f.lens.width=240;f.lens.height=160;f.ready();check(f.lens.bitmap.getPixel(0,0)==f.ui.background,"out-of-window gutter not themed");check(f.pixel(110,60)==RED,"clipped copy stretched Texture geometry");check(f.pixel(200,60)==GREEN,"clip displaced page boundary");});
 test(()->{F f=new F();f.ready();int count=PixelCopy.count;for(int i=0;i<30;i++)f.lens.sample();check(PixelCopy.count==count,"static dialog captured every frame");f.a.window.attrs.flags=8192;f.lens.sample();f.fallback("secure after accepted capture");});
 test(()->{F f=new F();f.source.children.clear();SurfaceView s=new SurfaceView();s.width=170;s.height=300;f.source.add(s);f.lens.sample();f.fallback("separate SurfaceView");check(PixelCopy.count==0,"Window copy falsely claimed a separate compositor layer");});
 test(()->{F f=new F();f.lens.sample();Bitmap b=PixelCopy.requests.peek().bitmap();Bitmap.failNext=true;PixelCopy.complete(0);f.fallback("compose allocation failure");check(b.isRecycled(),"failed composition retained native target");});
 test(()->{F f=new F();f.source.children.clear();ViewGroup parent=f.source;for(int i=0;i<55;i++){ViewGroup child=new ViewGroup();parent.add(child);parent=child;}f.lens.sample();f.fallback("bounded tree depth");check(PixelCopy.count==0,"unknown deep tree fell back to unsafe software or unverified Window");});
 test(()->{F f=new F();Bitmap[] accepted={null};int[] calls={0};f.lens.windowBackdrop.capture(18,f.ui.background,(b,r)->{calls[0]++;accepted[0]=b;throw new IllegalStateException("consumer installed it");});boolean threw=false;try{PixelCopy.complete(0);}catch(IllegalStateException expected){threw=true;}check(threw&&calls[0]==1,"consumer failure invoked a second completion");check(accepted[0]!=null&&!accepted[0].isRecycled(),"transferred bitmap recycled by producer");});
 test(()->{F f=new F();int before=AtomicWorkbenchDiagnostics.events.size();for(int i=0;i<100;i++)f.lens.windowBackdrop.diagnostic("activity_window_pixel_copy","theme_fallback","source_invalid");
  long until=System.currentTimeMillis()+1000;while(AtomicWorkbenchDiagnostics.events.size()==before&&System.currentTimeMillis()<until)try{Thread.sleep(5);}catch(Exception e){throw new RuntimeException(e);}
  long count=AtomicWorkbenchDiagnostics.events.stream().filter(x->x.equals("GLASS_BACKDROP;source=activity_window_pixel_copy;status=theme_fallback;reason=source_invalid")).count();check(count>=1,"fixed metadata was not sent through existing diagnostic journal");check(AtomicWorkbenchDiagnostics.events.size()<=before+2,"identical draw status spammed diagnostics");});
 System.out.println("GLASS WINDOW BACKDROP RESULT "+cases+" cases; "+checks+" assertions; opaque-black negative control passed");
 }
}
'''


def main():
    source = (SUPPORT["SRC"] / "LiquidGlassLayout.java").read_text(encoding="utf-8")
    methods = "\n".join(MEMBER(source, signature) for signature in [
        "void refreshBackdrop()", "private void captureIfNeeded()", "private void finishCapture(int gutter)",
        "private void captureFallback(String source,String reason)"])
    shell = HEAD.rsplit("}", 1)[0] + methods + "\n}\n"
    with tempfile.TemporaryDirectory(prefix="lsa-glass-window-") as temporary:
        SUPPORT["compile_run"](Path(temporary), {**STUBS, "ls/augment/com/LiquidGlassLayout.java": shell,
            "ls/augment/com/TestGlassWindowBackdrop.java": TEST},
            ["GlassWindowBackdrop.java", "GlassBackdropBlur.java", "ResetWriteFence.java"],
            "ls.augment.com.TestGlassWindowBackdrop")


if __name__ == "__main__":
    main()
