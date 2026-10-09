"""Execute the production animation owner against controllable Drawable/View lifecycles."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = {
    'android/graphics/PorterDuff.java': 'package android.graphics;public class PorterDuff {public enum Mode {SRC_IN}}',
    'android/graphics/PorterDuffColorFilter.java': 'package android.graphics;public class PorterDuffColorFilter {public int color;public PorterDuffColorFilter(int c,PorterDuff.Mode m){color=c;}}',
    'android/graphics/Rect.java': '''package android.graphics;public class Rect {public int left,top,right,bottom;public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public boolean isEmpty(){return right<=left||bottom<=top;}public int width(){return right-left;}public int height(){return bottom-top;}public float exactCenterX(){return (left+right)/2f;}public float exactCenterY(){return (top+bottom)/2f;}}''',
    'android/graphics/Bitmap.java': '''package android.graphics;public class Bitmap {public boolean isRecycled(){return false;}public int getWidth(){return 80;}public int getHeight(){return 40;}public boolean hasAlpha(){return false;}public void getPixels(int[] p,int o,int s,int x,int y,int w,int h){}}''',
    'android/graphics/drawable/BitmapDrawable.java': '''package android.graphics.drawable;import android.graphics.Bitmap;public class BitmapDrawable extends Drawable {public Bitmap getBitmap(){return null;}}''',
    'android/graphics/Canvas.java': '''package android.graphics;public class Canvas {public int saves;public float scaleX,scaleY;public int save(){return ++saves;}public void restoreToCount(int n){saves=n-1;}public void clipRect(Rect r){}public void translate(float x,float y){}public void scale(float x,float y){scaleX=x;scaleY=y;}}''',
    'android/os/Looper.java': 'package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}',
    'android/os/Handler.java': '''package android.os;public class Handler {public int pending;public Handler(Looper l){}public void postAtTime(Runnable r,long at){pending++;}public void removeCallbacks(Runnable r){pending=0;}public void removeCallbacksAndMessages(Object x){pending=0;}}''',
    'android/view/View.java': '''package android.view;public class View {public boolean attached=true,shown=true;public int invalidations;public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown;}public void postInvalidateOnAnimation(){invalidations++;}}''',
    'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable;import android.graphics.*;public class Drawable {public interface Callback{void invalidateDrawable(Drawable d);void scheduleDrawable(Drawable d,Runnable r,long t);void unscheduleDrawable(Drawable d,Runnable r);}public Callback callback;public int alpha=255,draws;public Object filter;public void setCallback(Callback c){callback=c;}public void setColorFilter(Object c){filter=c;if(callback!=null)callback.invalidateDrawable(this);}public void setAlpha(int a){alpha=a;if(callback!=null)callback.invalidateDrawable(this);}public int getIntrinsicWidth(){return 80;}public int getIntrinsicHeight(){return 40;}public void setBounds(int l,int t,int r,int b){}public void draw(Canvas canvas){draws++;}}''',
    'android/graphics/drawable/AnimatedImageDrawable.java': '''package android.graphics.drawable;public class AnimatedImageDrawable extends Drawable {public static final int REPEAT_INFINITE=-1;public int starts,stops,repeats;public boolean running;public boolean isRunning(){return running;}public void setRepeatCount(int r){repeats=r;}public void start(){starts++;running=true;}public void stop(){stops++;running=false;}}''',
    'ls/augment/com/hook/TestArtwork.java': r'''package ls.augment.com.hook;
import android.graphics.*;import android.graphics.drawable.*;import android.view.*;import ls.augment.com.*;
public class TestArtwork {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static void main(String[] args)throws Exception{
  View view=new View();AnimatedImageDrawable animation=new AnimatedImageDrawable();StatusBarArtwork owner=new StatusBarArtwork(animation,view);
  check(owner.animated(),"animated media retains its animated drawable");owner.playing(true);owner.playing(true);
  check(animation.starts==1&&animation.repeats==-1,"visible animation starts once, loops, does not restart per frame");
  check(owner.running(),"runtime counter reads the drawable actual playing state");animation.running=false;check(!owner.running(),"runtime counter does not confuse a requested animation with actual playback");animation.running=true;
  owner.invalidateDrawable(animation);check(view.invalidations==1,"drawable invalidation reaches its exact target");
  owner.playing(false);check(animation.stops==1&&!owner.running(),"screen-off/hidden budget transition stops playback");owner.playing(true);check(animation.starts==2,"visibility recovery restarts playback");
  view.shown=false;owner.invalidateDrawable(animation);check(animation.stops==2&&view.invalidations==1,"hidden view does not schedule animation frames");
  view.shown=true;owner.playing(true);view.attached=false;owner.invalidateDrawable(animation);check(animation.stops==3,"detaching target stops animation");view.attached=true;
  StatusBarThemeSpec.Binding tinted=new StatusBarThemeSpec.Binding("wifi","default","whole","a".repeat(64),false,100,0,0,50,true);
  Canvas canvas=new Canvas();owner.draw(canvas,new Rect(0,0,100,100),tinted,0xff123456,1);
  check(animation.alpha==128&&animation.filter instanceof PorterDuffColorFilter,"tint and opacity apply to the actual drawable");
  check(canvas.scaleX<0&&canvas.scaleY>0&&canvas.saves==0,"mirror and canvas state are isolated");
  int invalidations=view.invalidations;
  for(int frame=0;frame<100;frame++)owner.draw(canvas,new Rect(0,0,100,100),tinted,0xff123456,1);
  check(view.invalidations==invalidations,"drawing an unchanged paused animation must not schedule another frame");
  StatusBarThemeSpec.Binding original=new StatusBarThemeSpec.Binding("wifi","default","whole","a".repeat(64),true,100,0,0,100,false);
  owner.draw(canvas,new Rect(0,0,100,100),original,0xff123456,1);check(animation.filter==null&&animation.alpha==255,"original-color mode restores drawable colors");
  invalidations=view.invalidations;for(int frame=0;frame<100;frame++)owner.draw(canvas,new Rect(0,0,100,100),original,0xff123456,1);
  check(view.invalidations==invalidations,"original-color drawing must remain idle between decoder frames");
  owner.draw(canvas,new Rect(0,0,100,100),tinted,0xff123456,1,64);check(animation.alpha==32,"native inactive-arrow alpha multiplies user opacity rather than becoming fully bright");
  owner.draw(canvas,new Rect(0,0,100,100),original,0xff123456,1,0);check(animation.alpha==0,"native transparent state cannot be revealed by replacement art");
  int before=animation.draws;owner.dispose();owner.dispose();owner.playing(true);owner.draw(canvas,new Rect(0,0,100,100),original,-1,1);
  check(animation.callback==null&&animation.draws==before,"dispose is idempotent and drops all drawable callbacks");
  Drawable still=new Drawable();StatusBarArtwork staticOwner=new StatusBarArtwork(still,new View());staticOwner.playing(true);
  check(!staticOwner.animated(),"static media does not create an animation loop");staticOwner.dispose();
  System.out.println("Status-bar artwork lifecycle: "+checks+" assertions passed");
 }
}''',
}

with tempfile.TemporaryDirectory(prefix='statusbar-artwork-') as tmp:
    work = Path(tmp)
    for name, source in FILES.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
    src = ROOT / 'android/app/src/main/java/ls/augment/com'
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', str(work),
                    *map(str, work.rglob('*.java')), str(src / 'StatusBarThemeSpec.java'), str(src / 'StatusBarSurfaceSpec.java'),
                    str(src / 'StatusBarIconCatalog.java'), str(src / 'hook/StatusBarArtwork.java')], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', str(work), 'ls.augment.com.hook.TestArtwork'], check=True)
