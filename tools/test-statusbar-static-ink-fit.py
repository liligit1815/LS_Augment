"""Exercise production static-PNG ink fitting using ImageIO-decoded alpha pixels.

The Canvas facade tracks the actual nontransparent pixel-cell bounds after the
production transforms, so a transparent-margin image cannot pass just because
the drawable's outer bounds filled its destination. No user files are needed.
"""
from pathlib import Path
import os
import re
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
FILES = {
    'android/graphics/PorterDuff.java': 'package android.graphics; public class PorterDuff { public enum Mode { SRC_IN } }',
    'android/graphics/PorterDuffColorFilter.java': 'package android.graphics; public class PorterDuffColorFilter { public PorterDuffColorFilter(int c, PorterDuff.Mode m){} }',
    'android/graphics/Rect.java': '''package android.graphics;
public class Rect {
 public int left,top,right,bottom;
 public Rect(){} public Rect(int l,int t,int r,int b){set(l,t,r,b);}
 public Rect(Rect r){this(r.left,r.top,r.right,r.bottom);}
 public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
 public int width(){return right-left;} public int height(){return bottom-top;}
 public boolean isEmpty(){return width()<=0||height()<=0;}
 public float exactCenterX(){return (left+right)/2f;} public float exactCenterY(){return (top+bottom)/2f;}
 public String toString(){return left+","+top+","+right+","+bottom;}
}''',
    'android/graphics/Bitmap.java': '''package android.graphics;
import java.awt.image.BufferedImage;
public class Bitmap {
 public final int width,height; public final int[] argb; public final boolean alphaChannel;public int reads; public boolean failRead,recycled;
 public Bitmap(BufferedImage image){width=image.getWidth();height=image.getHeight();alphaChannel=image.getColorModel().hasAlpha();argb=image.getRGB(0,0,width,height,null,0,width);}
 public int getWidth(){return width;} public int getHeight(){return height;} public boolean isRecycled(){return recycled;}
 public boolean hasAlpha(){return alphaChannel;}
 public int getPixel(int x,int y){reads++;if(failRead)throw new IllegalStateException("pixel read fixture failure");return argb[y*width+x];}
 public void getPixels(int[] target,int offset,int stride,int x,int y,int w,int h){
  reads++;if(failRead)throw new IllegalStateException("pixel read fixture failure");
  for(int row=0;row<h;row++)System.arraycopy(argb,(y+row)*width+x,target,offset+row*stride,w);
 }
}''',
    'android/graphics/Canvas.java': '''package android.graphics;
import java.util.ArrayList;
public class Canvas {
 public static class Box {
  public double left,top,right,bottom;
  Box(double l,double t,double r,double b){left=l;top=t;right=r;bottom=b;}
  public double width(){return right-left;}public double height(){return bottom-top;}
  public double centerX(){return (left+right)/2;}public double centerY(){return (top+bottom)/2;}
 }
 static class State {
  double sx=1,sy=1,tx,ty;Box clip=new Box(-1e9,-1e9,1e9,1e9);
  State copy(){State s=new State();s.sx=sx;s.sy=sy;s.tx=tx;s.ty=ty;s.clip=new Box(clip.left,clip.top,clip.right,clip.bottom);return s;}
 }
 private State state=new State();private final ArrayList<State> stack=new ArrayList<>();
 public int saves,draws;public double lastScaleX,lastScaleY; public Box ink,painted;
 public int save(){stack.add(state.copy());saves=stack.size();return saves;}
 public void restoreToCount(int count){while(stack.size()>=count)state=stack.remove(stack.size()-1);saves=stack.size();}
 public void translate(float x,float y){state.tx+=state.sx*x;state.ty+=state.sy*y;}
 public void scale(float x,float y){state.sx*=x;state.sy*=y;lastScaleX=state.sx;lastScaleY=state.sy;}
 public void clipRect(Rect r){Box b=transform(r.left,r.top,r.right,r.bottom);state.clip=new Box(Math.max(state.clip.left,b.left),Math.max(state.clip.top,b.top),Math.min(state.clip.right,b.right),Math.min(state.clip.bottom,b.bottom));}
 private Box transform(double l,double t,double r,double b){double x1=state.tx+state.sx*l,x2=state.tx+state.sx*r,y1=state.ty+state.sy*t,y2=state.ty+state.sy*b;return new Box(Math.min(x1,x2),Math.min(y1,y2),Math.max(x1,x2),Math.max(y1,y2));}
 public void paintBitmap(Bitmap bitmap,Rect bounds,int alpha){
  draws++;int left=bitmap.width,top=bitmap.height,right=0,bottom=0;
  for(int y=0;y<bitmap.height;y++)for(int x=0;x<bitmap.width;x++)if((bitmap.argb[y*bitmap.width+x]>>>24)>0){left=Math.min(left,x);right=Math.max(right,x+1);top=Math.min(top,y);bottom=Math.max(bottom,y+1);}
  if(right<=left||bottom<=top||alpha==0){ink=null;painted=null;return;}
  double sx=bounds.width()/(double)bitmap.width,sy=bounds.height()/(double)bitmap.height;
  record(transform(bounds.left+left*sx,bounds.top+top*sy,bounds.left+right*sx,bounds.top+bottom*sy));
 }
 public void paintRect(Rect bounds,int alpha){draws++;if(alpha==0){ink=null;painted=null;return;}record(transform(bounds.left,bounds.top,bounds.right,bounds.bottom));}
 private void record(Box box){ink=box;painted=new Box(Math.max(box.left,state.clip.left),Math.max(box.top,state.clip.top),Math.min(box.right,state.clip.right),Math.min(box.bottom,state.clip.bottom));}
 public boolean restored(){return saves==0&&state.sx==1&&state.sy==1&&state.tx==0&&state.ty==0;}
}''',
    'android/os/Looper.java': 'package android.os; public class Looper { public static Looper getMainLooper(){return new Looper();} }',
    'android/os/Handler.java': 'package android.os; public class Handler { public Handler(Looper l){} public void postAtTime(Runnable r,long t){} public void removeCallbacks(Runnable r){} public void removeCallbacksAndMessages(Object x){} }',
    'android/view/View.java': 'package android.view; public class View { public boolean isAttachedToWindow(){return true;} public boolean isShown(){return true;} public void postInvalidateOnAnimation(){} }',
    'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable;
import android.graphics.*;
public class Drawable {
 public interface Callback {void invalidateDrawable(Drawable d);void scheduleDrawable(Drawable d,Runnable r,long t);void unscheduleDrawable(Drawable d,Runnable r);}
 public Rect bounds=new Rect();public int alpha=255;public Callback callback;
 public void setCallback(Callback c){callback=c;} public void setColorFilter(Object c){} public void setAlpha(int a){alpha=a;}
 public int getIntrinsicWidth(){return 61;} public int getIntrinsicHeight(){return 60;}
 public void setBounds(int l,int t,int r,int b){bounds.set(l,t,r,b);} public void setBounds(Rect r){setBounds(r.left,r.top,r.right,r.bottom);}
 public void draw(Canvas c){c.paintRect(bounds,alpha);}
}''',
    'android/graphics/drawable/BitmapDrawable.java': '''package android.graphics.drawable;
import android.graphics.*;
public class BitmapDrawable extends Drawable {
 public final Bitmap bitmap;public final int intrinsicWidth,intrinsicHeight;
 public BitmapDrawable(Bitmap b){this(b,b.getWidth(),b.getHeight());}
 public BitmapDrawable(Bitmap b,int w,int h){bitmap=b;intrinsicWidth=w;intrinsicHeight=h;}
 public Bitmap getBitmap(){return bitmap;} public int getIntrinsicWidth(){return intrinsicWidth;} public int getIntrinsicHeight(){return intrinsicHeight;}
 @Override public void draw(Canvas canvas){canvas.paintBitmap(bitmap,bounds,alpha);}
}''',
    'android/graphics/drawable/AnimatedImageDrawable.java': '''package android.graphics.drawable;
public class AnimatedImageDrawable extends Drawable {
 public static final int REPEAT_INFINITE=-1;private boolean running;
 public boolean isRunning(){return running;}public void setRepeatCount(int n){}public void start(){running=true;}public void stop(){running=false;}
}''',
    'ls/augment/com/hook/TestStaticInkFit.java': r'''package ls.augment.com.hook;
import android.graphics.*;import android.graphics.drawable.*;import android.view.View;
import java.awt.image.BufferedImage;import java.io.*;import javax.imageio.ImageIO;import ls.augment.com.StatusBarThemeSpec;
public final class TestStaticInkFit {
 static int checks;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static void near(double actual,double expected,double tolerance,String message){check(Math.abs(actual-expected)<=tolerance,message+": expected="+expected+", actual="+actual);}
 static final Rect AREA=new Rect(0,0,107,40);
 static final StatusBarThemeSpec.Binding NORMAL=new StatusBarThemeSpec.Binding("mobile1","default","whole","a".repeat(64),true,100,0,0,100,false);
 static boolean productionRoute(String part,String layer,boolean hasSecondSim){Object rowTwo=hasSecondSim?new Object():null;return @ROUTING_EXPRESSION@;}
 static byte[] png(int width,int height,int left,int top,int right,int bottom)throws Exception {
  BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_ARGB);
  for(int y=top;y<bottom;y++)for(int x=left;x<right;x++)image.setRGB(x,y,0xff1267ab);
  ByteArrayOutputStream out=new ByteArrayOutputStream();check(ImageIO.write(image,"PNG",out),"ImageIO writes a real PNG fixture");return out.toByteArray();
 }
 static BitmapDrawable decode(byte[] png)throws Exception{return new BitmapDrawable(new Bitmap(ImageIO.read(new ByteArrayInputStream(png))));}
 static Canvas draw(StatusBarArtwork art,boolean fit){Canvas canvas=new Canvas();art.draw(canvas,AREA,NORMAL,0xff000000,1,255,fit);check(canvas.restored(),"each path restores caller Canvas");return canvas;}
 static void equalBox(Canvas.Box a,Canvas.Box b,String message){check(a!=null&&b!=null,message+" has ink");near(a.left,b.left,.001,message+" left");near(a.top,b.top,.001,message+" top");near(a.right,b.right,.001,message+" right");near(a.bottom,b.bottom,.001,message+" bottom");}
 public static void main(String[] args)throws Exception {
  byte[] marginPng=png(61,60,8,11,55,49);BitmapDrawable margin=decode(marginPng);
  Rect ink=StatusBarArtwork.staticPngInkBounds(margin,marginPng);
  check(ink!=null&&ink.left==8&&ink.top==11&&ink.right==55&&ink.bottom==49,"PNG alpha scan returns true 47x38 ink bounds");
  check(margin.bitmap.reads==1,"decode-worker alpha scan reads the bitmap pixel array once");
  StatusBarArtwork art=new StatusBarArtwork(margin,new View(),ink);
  Canvas old=draw(art,false),fitted=draw(art,true);
  near(old.ink.width(),47*40d/60,.01,"single-row legacy visible width remains 31.33 px");
  near(old.ink.height(),38*40d/60,.01,"single-row legacy visible height remains 25.33 px");
  near(fitted.ink.width(),47*40d/38,.02,"double-row ink fit exposes 49.47 px visible width");
  near(fitted.ink.height(),40,.02,"double-row ink fit fills 40 px height without changing aspect ratio");
  near(fitted.ink.width()/fitted.ink.height(),47d/38,.001,"non-square artwork keeps its ratio");
  near(fitted.ink.centerX(),AREA.exactCenterX(),.6,"visible ink is horizontally centered");
  near(fitted.ink.centerY(),AREA.exactCenterY(),.6,"visible ink is vertically centered");
  near(fitted.painted.height(),40,.6,"fitted opaque pixels remain in clipping region");
  int reads=margin.bitmap.reads;boolean allFramesRestored=true;
  for(int i=0;i<100;i++)for(boolean fit:new boolean[]{false,true}){
   Canvas frame=new Canvas();art.draw(frame,AREA,NORMAL,0xff000000,1,255,fit);allFramesRestored&=frame.restored();
  }
  check(allFramesRestored,"100 repeated frames on both paths restore Canvas state");
  check(margin.bitmap.reads==reads,"repeated rendering never re-reads source bitmap pixels");
  Canvas oldOverload=new Canvas();art.draw(oldOverload,AREA,NORMAL,0xff000000,1);
  equalBox(old.ink,oldOverload.ink,"existing draw overload does not opt into fit");
  Canvas alphaCanvas=new Canvas();StatusBarThemeSpec.Binding faded=new StatusBarThemeSpec.Binding("mobile1","default","whole","a".repeat(64),true,100,0,0,50,false);
  art.draw(alphaCanvas,AREA,faded,0xff000000,1,64,true);check(margin.alpha==32,"ink fit preserves user opacity times native alpha");
  StatusBarThemeSpec.Binding transformed=new StatusBarThemeSpec.Binding("mobile1","default","whole","a".repeat(64),true,50,3,-2,100,true);
  Canvas transformedCanvas=new Canvas();art.draw(transformedCanvas,AREA,transformed,0xff000000,2,255,true);
  near(transformedCanvas.ink.width(),fitted.ink.width()*.5,.02,"user scale applies after ink fit");
  near(transformedCanvas.ink.centerX(),AREA.exactCenterX()+6,.6,"user x offset retains dp conversion");
  near(transformedCanvas.ink.centerY(),AREA.exactCenterY()-4,.6,"user y offset retains dp conversion");
  check(transformedCanvas.lastScaleX<0&&transformedCanvas.lastScaleY>0&&transformedCanvas.restored(),"mirror and caller transform remain isolated");
  BitmapDrawable dense=new BitmapDrawable(decode(marginPng).bitmap,122,120);
  StatusBarArtwork densityArt=new StatusBarArtwork(dense,new View(),StatusBarArtwork.staticPngInkBounds(dense,marginPng));
  Canvas densityFit=draw(densityArt,true);
  near(densityFit.ink.width(),fitted.ink.width(),.02,"bitmap pixel bounds map to density-scaled intrinsic width");
  near(densityFit.ink.height(),fitted.ink.height(),.02,"bitmap pixel bounds map to density-scaled intrinsic height");
  byte[] opaquePng=png(61,60,0,0,61,60);BitmapDrawable opaque=decode(opaquePng);
  StatusBarArtwork opaqueArt=new StatusBarArtwork(opaque,new View(),StatusBarArtwork.staticPngInkBounds(opaque,opaquePng));
  equalBox(draw(opaqueArt,false).ink,draw(opaqueArt,true).ink,"fully opaque odd-width PNG is an exact identity change");
  BufferedImage rgbImage=new BufferedImage(61,60,BufferedImage.TYPE_INT_RGB);
  for(int y=0;y<60;y++)for(int x=0;x<61;x++)rgbImage.setRGB(x,y,0xff1267ab);
  ByteArrayOutputStream rgbOutput=new ByteArrayOutputStream();ImageIO.write(rgbImage,"PNG",rgbOutput);
  byte[] rgbPng=rgbOutput.toByteArray();BitmapDrawable rgb=decode(rgbPng);Rect rgbInk=StatusBarArtwork.staticPngInkBounds(rgb,rgbPng);
  check(!rgb.bitmap.hasAlpha()&&rgb.bitmap.reads==0,"RGB PNG full-bounds fast path avoids pixel scanning");
  check(rgbInk!=null&&rgbInk.left==0&&rgbInk.top==0&&rgbInk.right==61&&rgbInk.bottom==60,"RGB PNG reports its complete area");
  StatusBarArtwork rgbArt=new StatusBarArtwork(rgb,new View(),rgbInk);
  equalBox(draw(rgbArt,false).ink,draw(rgbArt,true).ink,"PNG without an alpha channel retains exact legacy geometry");
  byte[] blankPng=png(61,60,0,0,0,0);BitmapDrawable blank=decode(blankPng);Rect blankInk=StatusBarArtwork.staticPngInkBounds(blank,blankPng);
  check(blankInk==null,"fully transparent PNG has no fake 1px content bounds");
  Canvas blankCanvas=draw(new StatusBarArtwork(blank,new View(),blankInk),true);
  check(blankCanvas.ink==null,"fully transparent PNG still paints no content");near(blankCanvas.lastScaleX,40d/60,.001,"empty PNG keeps legacy fitting geometry");
  BitmapDrawable unreadable=decode(marginPng);unreadable.bitmap.failRead=true;
  check(StatusBarArtwork.staticPngInkBounds(unreadable,marginPng)==null,"pixel read exception falls back without failing drawable load");
  Canvas unreadableCanvas=draw(new StatusBarArtwork(unreadable,new View(),null),true);
  equalBox(old.ink,unreadableCanvas.ink,"pixel scan failure retains previous drawing geometry");
  BitmapDrawable notPng=decode(marginPng);int beforeNonPng=notPng.bitmap.reads;
  check(StatusBarArtwork.staticPngInkBounds(notPng,new byte[]{'G','I','F','8','9','a'})==null,"non-PNG raster is excluded");
  check(notPng.bitmap.reads==beforeNonPng,"non-PNG paths do not scan bitmap pixels");
  byte[] invalidMagic=marginPng.clone();invalidMagic[7]=0;
  check(StatusBarArtwork.staticPngInkBounds(notPng,invalidMagic)==null&&notPng.bitmap.reads==beforeNonPng,"all eight PNG signature bytes must match before pixel scanning");
  check(StatusBarArtwork.staticPngInkBounds(notPng,new byte[0])==null,"truncated input falls back");
  AnimatedImageDrawable animation=new AnimatedImageDrawable();
  check(StatusBarArtwork.staticPngInkBounds(animation,marginPng)==null,"animated drawable never receives static cropping");
  StatusBarArtwork animationArt=new StatusBarArtwork(animation,new View(),null);
  equalBox(draw(animationArt,false).ink,draw(animationArt,true).ink,"animation keeps its complete original frame");
  check(StatusBarArtwork.staticPngInkBounds(new Drawable(),marginPng)==null,"non-bitmap drawable is excluded");
  // An alpha=1 boundary is real content, even though most interior cells are opaque.
  BufferedImage faintImage=ImageIO.read(new ByteArrayInputStream(marginPng));faintImage.setRGB(2,3,0x011267ab);
  ByteArrayOutputStream faintBytes=new ByteArrayOutputStream();ImageIO.write(faintImage,"PNG",faintBytes);
  byte[] faintPng=faintBytes.toByteArray();Rect faint=StatusBarArtwork.staticPngInkBounds(decode(faintPng),faintPng);
  check(faint!=null&&faint.left==2&&faint.top==3&&faint.right==55&&faint.bottom==49,"all nonzero alpha contributes to ink bounds");
  check(productionRoute("row0.signal","whole",true),"first compact SIM signal row opts in");
  check(productionRoute("row1.signal","whole",true),"second compact SIM signal row opts in");
  check(productionRoute("row0.signal","whole",false),"single-SIM compact signal row still opts in");
  check(!productionRoute("row0.signal","background",true),"signal background layer retains its original canvas");
  check(!productionRoute("row1.signal","foreground",true),"signal foreground layer retains its original canvas");
  check(!productionRoute("data.activity","whole",true),"data activity is not mistaken for signal artwork");
  check(!productionRoute("wifi.signal","whole",true),"non-compact signal paths do not opt in");
  System.out.println("Static PNG ink fitting: "+checks+" assertions passed (ImageIO alpha pixels, production transforms)");
 }
}''',
}


with tempfile.TemporaryDirectory(prefix='statusbar-static-ink-') as tmp:
    work = Path(tmp)
    routing_source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/RedMagicSystemUiHook.java').read_text(encoding='utf-8')
    expressions = re.findall(r'boolean\s+fitSignalInk\s*=\s*([^;]+);', routing_source)
    if len(expressions) != 1:
        raise AssertionError('Expected one production compact-signal ink-fit routing expression')
    FILES['ls/augment/com/hook/TestStaticInkFit.java'] = FILES['ls/augment/com/hook/TestStaticInkFit.java'].replace('@ROUTING_EXPRESSION@', expressions[0])
    for name, source in FILES.items():
        target = work / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(source, encoding='utf-8')
    src = ROOT / 'android/app/src/main/java/ls/augment/com'
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([
        str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', str(work),
        *map(str, work.rglob('*.java')),
        str(src / 'StatusBarThemeSpec.java'), str(src / 'StatusBarSurfaceSpec.java'),
        str(src / 'StatusBarIconCatalog.java'), str(src / 'hook/StatusBarArtwork.java'),
    ], check=True)
    subprocess.run([str(jdk / 'java'), '-Djava.awt.headless=true', '-cp', str(work),
                    'ls.augment.com.hook.TestStaticInkFit'], check=True)
