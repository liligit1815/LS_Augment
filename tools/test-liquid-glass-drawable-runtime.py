"""Run the production LiquidGlassDrawable against a small Android drawing facade.

Exercises the real Java preparation, CPU blur, shader-uniform configuration,
fallback, cache, safety, and lifecycle branches. This does NOT compile or execute
AGSL, simulate optical pixels, or validate GPU rendering on a device. All generated
Java facade files and classes live in a temporary directory.
"""
import argparse
import os
from pathlib import Path
import shutil
import subprocess
import tempfile


STUBS = {
    "android/content/ContentResolver.java": "package android.content;public class ContentResolver {}",
    "android/content/Context.java": """package android.content;public class Context {
 public ContentResolver getContentResolver(){return new ContentResolver();}}
""",
    "android/util/DisplayMetrics.java": "package android.util;public class DisplayMetrics {public float density=1;}",
    "android/content/res/Configuration.java": """package android.content.res;public class Configuration {
 public static final int UI_MODE_NIGHT_MASK=48,UI_MODE_NIGHT_YES=32;public int uiMode;}
""",
    "android/content/res/Resources.java": """package android.content.res;public class Resources {
 public final Configuration configuration=new Configuration();public final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();
 public Configuration getConfiguration(){return configuration;}public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}}
""",
    "android/os/SystemClock.java": """package android.os;public class SystemClock {
 public static long now=2000;public static long uptimeMillis(){return now;}}
""",
    "android/provider/Settings.java": """package android.provider;public class Settings {public static class Secure {
 public static int highContrast;public static int getInt(android.content.ContentResolver c,String key,int fallback){return highContrast;}}}
""",
    "android/animation/ValueAnimator.java": """package android.animation;import java.util.*;
public class ValueAnimator {public static boolean enabled=true;public static final List<ValueAnimator> active=new ArrayList<>();
 public boolean cancelled;public float value;public long duration;public AnimatorUpdateListener listener;
 public interface AnimatorUpdateListener {void onAnimationUpdate(ValueAnimator animator);}
 public static boolean areAnimatorsEnabled(){return enabled;}public static ValueAnimator ofFloat(float... values){return new ValueAnimator();}
 public ValueAnimator setDuration(long millis){duration=millis;return this;}public void addUpdateListener(AnimatorUpdateListener l){listener=l;}
 public Object getAnimatedValue(){return value;}public void start(){active.add(this);}public void cancel(){cancelled=true;active.remove(this);}
 public void advance(float fraction){if(cancelled)return;value=fraction;listener.onAnimationUpdate(this);}}
""",
    "android/graphics/Color.java": """package android.graphics;public class Color {
 public static final int TRANSPARENT=0,WHITE=0xffffffff;public static int red(int c){return (c>>>16)&255;}
 public static int green(int c){return (c>>>8)&255;}public static int blue(int c){return c&255;}}
""",
    "android/graphics/ColorFilter.java": "package android.graphics;public class ColorFilter {}",
    "android/graphics/PixelFormat.java": "package android.graphics;public class PixelFormat {public static final int TRANSLUCENT=-3;}",
    "android/graphics/Rect.java": """package android.graphics;public class Rect {
 public int left,top,right,bottom;public Rect(){}public Rect(Rect r){set(r);}public Rect(int l,int t,int r,int b){set(l,t,r,b);}
 public void set(Rect r){set(r.left,r.top,r.right,r.bottom);}public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
 public int width(){return right-left;}public int height(){return bottom-top;}public boolean isEmpty(){return width()<=0||height()<=0;}
 public boolean equals(Object o){if(!(o instanceof Rect))return false;Rect r=(Rect)o;return left==r.left&&top==r.top&&right==r.right&&bottom==r.bottom;}}
""",
    "android/graphics/RectF.java": """package android.graphics;public class RectF {
 public float left,top,right,bottom;public RectF(){}public RectF(RectF r){set(r.left,r.top,r.right,r.bottom);}
 public void set(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}}
""",
    "android/graphics/Matrix.java": """package android.graphics;public class Matrix {
 public float sx=1,sy=1;public void setScale(float x,float y){sx=x;sy=y;}}
""",
    "android/graphics/Shader.java": "package android.graphics;public class Shader {public enum TileMode {CLAMP}}",
    "android/graphics/BitmapShader.java": """package android.graphics;public class BitmapShader extends Shader {
 public final Bitmap bitmap;public Matrix matrix;public BitmapShader(Bitmap b,TileMode x,TileMode y){bitmap=b;}
 public void setLocalMatrix(Matrix m){matrix=m;}}
""",
    "android/graphics/LinearGradient.java": """package android.graphics;public class LinearGradient extends Shader {
 public final int[] colors;public final float[] positions;public final float x1,y1;
 public LinearGradient(float x0,float y0,float x1,float y1,int first,int last,TileMode mode){this(x0,y0,x1,y1,new int[]{first,last},null,mode);}
 public LinearGradient(float x0,float y0,float x1,float y1,int[] colors,float[] positions,TileMode mode){
  this.x1=x1;this.y1=y1;this.colors=colors.clone();this.positions=positions==null?null:positions.clone();}}
""",
    "android/graphics/RuntimeShader.java": """package android.graphics;import java.util.*;
public class RuntimeShader extends Shader {public static boolean rejectConstruction;public static int creations;
 public final String source;public final Map<String,float[]> uniforms=new LinkedHashMap<>();public final Map<String,Shader> inputs=new LinkedHashMap<>();
 public RuntimeShader(String s){creations++;if(rejectConstruction)throw new IllegalArgumentException("facade shader compile fault");source=s;}
 public void setFloatUniform(String name,float... values){for(float f:values)if(!Float.isFinite(f))throw new IllegalArgumentException("nonfinite uniform");uniforms.put(name,values.clone());}
 public void setInputShader(String name,Shader value){inputs.put(name,value);}}
""",
    "android/graphics/Bitmap.java": """package android.graphics;import java.util.*;
public class Bitmap {public enum Config {ARGB_8888}public final int width,height;public final int[] pixels;public static int creations;
 public Bitmap(int w,int h){width=w;height=h;pixels=new int[w*h];creations++;}
 public static Bitmap createBitmap(int w,int h,Config c){return new Bitmap(w,h);}public int getWidth(){return width;}public int getHeight(){return height;}
 public void eraseColor(int c){Arrays.fill(pixels,c);}public void getPixels(int[] p,int offset,int stride,int x,int y,int w,int h){
  for(int row=0;row<h;row++)System.arraycopy(pixels,(y+row)*width+x,p,offset+row*stride,w);}
 public void setPixels(int[] p,int offset,int stride,int x,int y,int w,int h){for(int row=0;row<h;row++)System.arraycopy(p,offset+row*stride,pixels,(y+row)*width+x,w);}}
""",
    "android/graphics/Paint.java": """package android.graphics;public class Paint {
 public static final int ANTI_ALIAS_FLAG=1,FILTER_BITMAP_FLAG=2;public enum Style {FILL,STROKE}
 public int color=0xff000000,alpha=255;public float strokeWidth;public Shader shader;public Style style=Style.FILL;public ColorFilter filter;
 public Paint(int flags){}public void setColor(int c){color=c;alpha=c>>>24;}public void setAlpha(int a){alpha=a;}
 public void setShader(Shader s){shader=s;}public void setStyle(Style s){style=s;}public void setStrokeWidth(float width){strokeWidth=width;}
 public void setColorFilter(ColorFilter f){filter=f;}}
""",
    "android/graphics/Canvas.java": """package android.graphics;import java.util.*;
public class Canvas {public boolean hardware=true,rejectShaderDraw;public final Bitmap bitmap;public final List<Command> commands=new ArrayList<>();
 public float x,y,sx=1,sy=1;public final List<float[]> stack=new ArrayList<>();public Canvas(){bitmap=null;}public Canvas(Bitmap b){bitmap=b;hardware=false;}
 public boolean isHardwareAccelerated(){return hardware;}public int save(){stack.add(new float[]{x,y,sx,sy});return stack.size();}
 public void translate(float dx,float dy){x+=dx;y+=dy;}public void scale(float dx,float dy){sx*=dx;sy*=dy;}
 public void restoreToCount(int n){if(n<1||n>stack.size())throw new IllegalArgumentException("bad save count");float[] s=stack.get(n-1);
  x=s[0];y=s[1];sx=s[2];sy=s[3];while(stack.size()>=n)stack.remove(stack.size()-1);}
 public void drawColor(int color){if(bitmap==null)throw new AssertionError("backdrop draw outside sample bitmap");bitmap.eraseColor(color);}
 public void drawRoundRect(RectF rect,float rx,float ry,Paint paint){if(rejectShaderDraw&&paint.shader instanceof RuntimeShader)throw new IllegalStateException("facade GPU fault");
  commands.add(new Command(rect,rx,ry,paint,x,y));}
 public static class Command {public final RectF rect;public final float rx,ry,x,y,strokeWidth;public final int color,alpha;
  public final Shader shader;public final Paint.Style style;public final Map<String,float[]> uniforms=new LinkedHashMap<>();
  Command(RectF r,float rx,float ry,Paint p,float x,float y){rect=new RectF(r);this.rx=rx;this.ry=ry;this.x=x;this.y=y;
   color=p.color;alpha=p.alpha;shader=p.shader;style=p.style;strokeWidth=p.strokeWidth;
   if(shader instanceof RuntimeShader)for(Map.Entry<String,float[]> e:((RuntimeShader)shader).uniforms.entrySet())uniforms.put(e.getKey(),e.getValue().clone());}}}
""",
    "android/graphics/drawable/Drawable.java": """package android.graphics.drawable;import android.graphics.*;
public abstract class Drawable {private final Rect bounds=new Rect();public Object callback;public int invalidations;
 public Rect getBounds(){return bounds;}public void setBounds(int l,int t,int r,int b){setBounds(new Rect(l,t,r,b));}
 public void setBounds(Rect r){if(!bounds.equals(r)){bounds.set(r);onBoundsChange(bounds);}}protected void onBoundsChange(Rect r){}
 public void invalidateSelf(){invalidations++;}public void setCallback(Object c){callback=c;}public abstract void draw(Canvas c);
 public abstract void setAlpha(int value);public int getAlpha(){return 255;}public abstract void setColorFilter(ColorFilter filter);public abstract int getOpacity();}
""",
    "android/view/ViewParent.java": "package android.view;public interface ViewParent {}",
    "android/view/ViewGroup.java": "package android.view;public class ViewGroup extends View {public static class LayoutParams {}}",
    "android/view/WindowManager.java": """package android.view;public interface WindowManager {
 class LayoutParams extends ViewGroup.LayoutParams {public static final int FLAG_SECURE=8192;public int flags;}}
""",
    "android/view/View.java": """package android.view;import android.graphics.Rect;public class View implements ViewParent {
 public static final int VISIBLE=0;public boolean attached=true,shown=true,hardware=true;public int invalidations;
 public float scaleX=1,scaleY=1,rotation,rotationX,rotationY;public ViewParent parent;public ViewGroup.LayoutParams params=new WindowManager.LayoutParams();
 public final android.content.res.Resources resources=new android.content.res.Resources();public final android.content.Context context=new android.content.Context();
 public android.content.res.Resources getResources(){return resources;}public android.content.Context getContext(){return context;}
 public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown&&(parent==null||!(parent instanceof View)||((View)parent).isShown());}
 public boolean isHardwareAccelerated(){return hardware;}public void invalidate(Rect r){invalidations++;}
 public float getScaleX(){return scaleX;}public float getScaleY(){return scaleY;}public float getRotation(){return rotation;}
 public float getRotationX(){return rotationX;}public float getRotationY(){return rotationY;}public ViewParent getParent(){return parent;}
 public View getRootView(){return parent instanceof View?((View)parent).getRootView():this;}public ViewGroup.LayoutParams getLayoutParams(){return params;}}
""",
    "TestLiquidGlassDrawable.java": """import android.animation.ValueAnimator;import android.graphics.*;import android.os.SystemClock;
import android.provider.Settings;import android.view.*;import java.util.*;import ls.augment.com.*;
public class TestLiquidGlassDrawable {
 static int checks;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static void near(float actual,float expected,String message){check(Math.abs(actual-expected)<.00001f,message+": "+actual);}
 static class Source implements LiquidGlassDrawable.BackdropSource {boolean valid=true,drawResult=true;long generation=1;int samples,color=0xffaabbcc;Canvas sampledCanvas;
  public boolean isValid(){return valid;}public long revision(){return generation;}
  public boolean draw(Canvas c,int w,int h){samples++;sampledCanvas=c;check(!c.hardware,"source draws only into software sample buffer");
   check(c.bitmap!=null&&w>0&&h>0,"source gets local positive bounds");if(drawResult)c.drawColor(color);return drawResult;}}
 static class Fixture {final View view=new View();final Source source=new Source();final LiquidGlassDrawable glass=new LiquidGlassDrawable(view,source,38);
  Fixture(){glass.setBounds(20,30,220,130);}}
 static Canvas draw(LiquidGlassDrawable g){Canvas c=new Canvas();g.draw(c);restored(c);return c;}
 static void restored(Canvas c){check(c.stack.isEmpty()&&c.x==0&&c.y==0&&c.sx==1&&c.sy==1,"draw restores caller Canvas state");}
 static Canvas.Command optical(Canvas c){check(c.commands.size()==2,"optical material and one independent rim draw");
  Canvas.Command body=c.commands.get(0);check(body.shader instanceof RuntimeShader,"real renderer configures optical RuntimeShader");
  check(c.commands.get(1).style==Paint.Style.STROKE&&c.commands.get(1).shader instanceof LinearGradient,"rim is an explicit gradient stroke");return body;}
 static float uniform(Canvas.Command command,String name){float[] values=command.uniforms.get(name);check(values!=null&&values.length==1,"scalar uniform "+name);return values[0];}
 static void uniformsAndTint(){Fixture f=new Fixture();f.glass.setForegroundIsLight(true);check(f.glass.prepare(),"verified source prepares");
  Canvas.Command first=optical(draw(f.glass));near(uniform(first,"iconOnly"),0,"text surface remains contrast protected");near(uniform(first,"whiteText"),1,"light label mode retained");
  f.glass.setIconOnly(true);Canvas.Command clear=optical(draw(f.glass));near(uniform(clear,"iconOnly"),1,"icon-only uniforms choose clear optics instead of label darkening");
  near(clear.x,20,"material uses bounds origin X");near(clear.y,30,"material uses bounds origin Y");near(clear.rect.right,200,"shader shape width is local");
  near(clear.rect.bottom,100,"shader shape height is local");near(clear.rx,38,"requested capsule corner radius survives");
  float[] strength={-1,0,.25f,.65f,1,Float.NaN,Float.POSITIVE_INFINITY,Float.NEGATIVE_INFINITY};
  float[] expected={0,0,.25f,.65f,.65f,0,0,0};
  for(int i=0;i<strength.length;i++){f.glass.setMaterialTint(0xff2080e0,strength[i]);Canvas.Command tinted=optical(draw(f.glass));
   near(uniform(tinted,"tintAmount"),expected[i],"tint strength clamps finite values and rejects nonfinite input");float[] rgb=tinted.uniforms.get("tint");
   check(rgb!=null&&rgb.length==3,"RGB tint uses 3 components");near(rgb[0],32/255f,"red tint");near(rgb[1],128/255f,"green tint");near(rgb[2],224/255f,"blue tint");}
  check(f.source.samples==1,"changing optical uniforms never recaptures backdrop");f.glass.release();}
 static void cacheAndStaleFrames(){Fixture f=new Fixture();check(f.glass.prepare(),"first generation prepares");int bitmaps=Bitmap.creations;
  check(f.source.samples==1,"first preparation samples once");for(int i=0;i<4;i++){SystemClock.now+=2000;check(f.glass.prepare(),"same shared revision stays prepared");optical(draw(f.glass));}
  check(f.source.samples==1&&Bitmap.creations==bitmaps,"identical shared revision reuses sample and CPU-blurred texture across polling intervals");
  f.source.generation++;SystemClock.now+=100;check(f.glass.prepare()&&f.source.samples==2,"changed generation refreshes pixels");
  f.source.valid=false;check(!f.glass.prepare()&&!f.glass.isReady(),"invalid source revokes cached readiness");check(draw(f.glass).commands.isEmpty(),"invalid cached source never draws old sampled pixels");
  f.source.valid=true;check(f.glass.prepare()&&f.source.samples==3,"source recovery resamples even at unchanged generation");
  f.source.valid=false;check(draw(f.glass).commands.isEmpty()&&!f.glass.isReady(),"draw rechecks validity if source expires after prepare");
  f.source.valid=true;check(f.glass.prepare(),"fresh source returns");f.glass.invalidateBackdrop();SystemClock.now+=100;
  int samples=f.source.samples;check(f.glass.prepare()&&f.source.samples==samples+1,"explicit invalidation refreshes unchanged generation");
  f.glass.setBounds(20,30,240,150);check(!f.glass.isReady()&&f.glass.prepare(),"new geometry invalidates and rebuilds texture");
  optical(draw(f.glass));check(f.source.sampledCanvas.stack.isEmpty(),"sample source Canvas stack is balanced");f.glass.release();}
 static void unavailableFallback(){Fixture f=new Fixture();f.source.valid=false;check(!f.glass.prepare(),"unavailable source cannot claim refraction");
  f.glass.setIconOnly(true);Canvas c=new Canvas();check(f.glass.drawFallback(c),"capture-free fallback produces visible material");restored(c);
  check(c.commands.size()==2&&c.commands.get(0).shader instanceof LinearGradient,"fallback has a translucent body and rim");
  for(int color:((LinearGradient)c.commands.get(0).shader).colors)check((color>>>24)>0&&(color>>>24)<255,"fallback body is translucent");
  check(!f.glass.isReady()&&!f.glass.isFailed()&&f.source.samples==0,"fallback neither samples nor declares successful optics");
  check("backdrop_unavailable".equals(f.glass.failureReason()),"fallback retains honest failure diagnostic");
  f.glass.setMaterialTint(0xff0099ff,1);Canvas tinted=new Canvas();check(f.glass.drawFallback(tinted),"fallback can retain active control tint");
  check(tinted.commands.size()==3&&tinted.commands.get(1).shader==null,"fallback tint is separate bounded overlay");
  check(tinted.commands.get(1).alpha==Math.round(255*.65f),"fallback tint follows same strength ceiling");
  f.glass.setBounds(20,30,320,150);Canvas resized=new Canvas();check(f.glass.drawFallback(resized),"fallback resizes without capture");
  near(((LinearGradient)resized.commands.get(0).shader).y1,120,"fallback gradient resized to fresh bounds");restored(resized);f.glass.release();}
 static void refuse(Fixture f,String reason){Canvas c=new Canvas();check(!f.glass.drawFallback(c)&&c.commands.isEmpty(),reason);restored(c);check(f.source.samples==0,"rejected fallback never samples");}
 static void safety(){Fixture f=new Fixture();f.source.valid=false;WindowManager.LayoutParams p=(WindowManager.LayoutParams)f.view.params;
  p.flags=WindowManager.LayoutParams.FLAG_SECURE;refuse(f,"secure window rejects fallback");check(!f.glass.prepare(),"secure window rejects real renderer");p.flags=0;
  f.view.scaleX=.98f;refuse(f,"scaled host rejects fallback");f.view.scaleX=1;f.view.rotation=1;refuse(f,"rotated host rejects fallback");f.view.rotation=0;
  View parent=new View();f.view.parent=parent;parent.scaleY=.8f;refuse(f,"scaled ancestor rejects fallback");parent.scaleY=1;
  ((WindowManager.LayoutParams)parent.params).flags=WindowManager.LayoutParams.FLAG_SECURE;refuse(f,"secure ancestor root rejects fallback");f.view.parent=null;
  f.view.attached=false;refuse(f,"detached host rejects fallback");f.view.attached=true;f.view.shown=false;refuse(f,"hidden host rejects fallback");f.view.shown=true;
  f.view.hardware=false;refuse(f,"software host rejects fallback");f.view.hardware=true;Canvas software=new Canvas();software.hardware=false;
  check(!f.glass.drawFallback(software)&&software.commands.isEmpty(),"software Canvas rejects fallback");
  f.glass.setBounds(0,0,0,0);refuse(f,"empty bounds reject fallback");f.glass.release();}
 static void opaquePreference(){Fixture f=new Fixture();f.source.valid=false;f.glass.updatePreferences(true,false);f.glass.setForegroundIsLight(true);
  check(f.glass.prepare()&&f.glass.isReady(),"reduced transparency is ready without capture");Canvas dark=draw(f.glass);
  check(dark.commands.size()==2&&dark.commands.get(0).shader==null&&dark.commands.get(0).alpha==255,"reduced transparency paints explicit opaque body");
  check(dark.commands.get(0).color==0xff202126&&f.source.samples==0,"opaque body respects white-label contrast and never samples");
  f.glass.setForegroundIsLight(false);Canvas light=draw(f.glass);check(light.commands.get(0).color==0xfff1f2f4,"dark-label opaque body is light");
  check("reduced_transparency".equals(f.glass.failureReason()),"opaque preference has explicit diagnostic");
  f.glass.updatePreferences(false,false);check(!f.glass.prepare()&&!f.glass.isReady(),"returning to transparency requires valid backdrop");f.glass.release();}
 static void rejectionAndFaults(){Fixture f=new Fixture();f.source.drawResult=false;check(!f.glass.prepare()&&!f.glass.isReady(),"source declining its draw prevents ready texture");
  check(draw(f.glass).commands.isEmpty(),"source draw failure cannot expose empty bitmap");f.source.drawResult=true;f.source.color=0x40ffffff;
  check(!f.glass.prepare()&&"incomplete_backdrop".equals(f.glass.failureReason()),"transparent source holes are rejected before blur");
  f.source.color=0xffaaccee;check(f.glass.prepare(),"opaque verified source recovers");Canvas broken=new Canvas();broken.rejectShaderDraw=true;
  f.glass.draw(broken);check(f.glass.isFailed()&&!f.glass.isReady()&&"gpu_draw_failed".equals(f.glass.failureReason()),"draw exception records renderer failure");restored(broken);
  int samples=f.source.samples;check(!f.glass.prepare()&&f.source.samples==samples,"failed renderer stops sampling");Canvas fallback=new Canvas();
  check(f.glass.drawFallback(fallback)&&fallback.commands.size()==2,"failed shader can still use explicitly unfiltered-free fallback");restored(fallback);f.glass.release();
  RuntimeShader.rejectConstruction=true;Fixture badCompile=new Fixture();check(!badCompile.glass.prepare()&&badCompile.glass.isFailed(),"RuntimeShader construction failure handled");
  RuntimeShader.rejectConstruction=false;badCompile.glass.release();}
 static void interactionAndRelease(){Fixture f=new Fixture();check(f.glass.prepare(),"interactive material prepares");f.glass.setInteraction(500,-100,true);
  Canvas.Command pressed=optical(draw(f.glass));near(uniform(pressed,"pressure"),1,"press updates optics only");near(pressed.uniforms.get("light")[0],1,"light X clamped");near(pressed.uniforms.get("light")[1],0,"light Y clamped");
  f.glass.setInteraction(50,60,false);check(ValueAnimator.active.size()==1,"release starts one optical animation");ValueAnimator anim=ValueAnimator.active.get(0);
  f.glass.updatePreferences(false,true);check(anim.cancelled&&ValueAnimator.active.isEmpty(),"reduced motion cancels optical animation");
  f.glass.setInteraction(20,40,true);near(uniform(optical(draw(f.glass)),"pressure"),0,"reduced motion suppresses pressure");
  f.glass.updatePreferences(false,false);f.glass.setInteraction(50,60,false);check(ValueAnimator.active.size()==1,"animation enabled again");anim=ValueAnimator.active.get(0);
  f.glass.release();check(!f.glass.isReady()&&anim.cancelled&&ValueAnimator.active.isEmpty(),"release cancels animation and revokes readiness");
  int samples=f.source.samples,invalidations=f.view.invalidations;check(!f.glass.prepare()&&f.source.samples==samples,"released material cannot sample again");
  check(draw(f.glass).commands.isEmpty(),"released material cannot draw cached optics");Canvas c=new Canvas();check(!f.glass.drawFallback(c)&&c.commands.isEmpty(),"released material cannot draw fallback");
  f.glass.setInteraction(30,40,true);check(f.view.invalidations==invalidations&&ValueAnimator.active.isEmpty(),"released interaction schedules no work");f.glass.release();
  check(ValueAnimator.active.isEmpty(),"repeated release remains inert");}
 static Canvas.Command shaderBody(Canvas c){Canvas.Command found=null;for(Canvas.Command cmd:c.commands)if(cmd.shader instanceof RuntimeShader){
  check(found==null,"one optical texture draw per frame");found=cmd;}check(found!=null,"optical body exists");return found;}
 static void controlReveal(){Fixture f=new Fixture();f.glass.setControlSurface(true);check(f.glass.prepare(),"control source prepared");
  Canvas first=draw(f.glass);check(first.commands.size()==3,"first control frame blends fallback body and optical body with a single rim");
  check(first.commands.get(0).shader instanceof LinearGradient,"reveal starts from honest fallback material");
  check(shaderBody(first).alpha==0,"first optical frame starts transparent instead of popping in");
  near(uniform(shaderBody(first),"controlSurface"),1,"control profile is sent to shader");
  int samples=f.source.samples;SystemClock.now+=90;check(f.glass.prepare(),"in-progress reveal keeps valid material");
  Canvas.Command midway=shaderBody(draw(f.glass));check(midway.alpha>0&&midway.alpha<255,"optical alpha progresses continuously");
  check(f.source.samples==samples,"animation does not recapture or reblur unchanged pixels");
  SystemClock.now+=90;check(optical(draw(f.glass)).alpha==255,"reveal completes and removes fallback overdraw");
  f.source.generation++;SystemClock.now+=250;check(f.glass.prepare(),"next live generation is sampled");
  check(optical(draw(f.glass)).alpha==255,"routine live updates do not repeat the entrance fade");
  f.source.valid=false;check(!f.glass.prepare()&&draw(f.glass).commands.isEmpty(),"lost source rejects stale texture immediately during transition lifecycle");
  Canvas fallback=new Canvas();check(f.glass.drawFallback(fallback),"unavailable source still has a separate safe fallback");
  f.source.valid=true;check(f.glass.prepare()&&shaderBody(draw(f.glass)).alpha==0,"recovered source reveals from fallback again");
  f.glass.updatePreferences(false,true);check(optical(draw(f.glass)).alpha==255,"reduced motion completes an in-progress reveal immediately");
  f.glass.release();Fixture disabled=new Fixture();disabled.glass.setControlSurface(true);ValueAnimator.enabled=false;
  check(disabled.glass.prepare()&&optical(draw(disabled.glass)).alpha==255,"system animation disable prevents reveal animation");
  disabled.glass.release();ValueAnimator.enabled=true;}
 static class StripedSource extends Source {@Override public boolean draw(Canvas c,int w,int h){
  super.draw(c,w,h);for(int y=0;y<c.bitmap.height;y++)for(int x=0;x<c.bitmap.width;x++)
   c.bitmap.pixels[y*c.bitmap.width+x]=(x/6)%2==0?0xff000000:0xffffffff;return true;}}
 static long roughness(Bitmap b){long result=0;int row=(b.height/2)*b.width;for(int x=1;x<b.width;x++)
  result+=Math.abs(Color.red(b.pixels[row+x])-Color.red(b.pixels[row+x-1]));return result;}
 static Bitmap texture(Canvas.Command body){return ((BitmapShader)((RuntimeShader)body.shader).inputs.get("backdrop")).bitmap;}
 static void controlBackdropCalming(){View view=new View();StripedSource source=new StripedSource();
  LiquidGlassDrawable glass=new LiquidGlassDrawable(view,source,24);glass.setBounds(0,0,200,100);glass.updatePreferences(false,true);
  check(glass.prepare(),"default tray samples patterned source");long trayDetail=roughness(texture(optical(draw(glass))));
  glass.setControlSurface(true);check(!glass.isReady()&&glass.prepare(),"changing profile invalidates the cached blur even with unchanged source revision");
  long controlDetail=roughness(texture(optical(draw(glass))));check(controlDetail<trayDetail,"production control blur attenuates more background detail than tray blur");
  check(source.samples==2,"profile change performs one bounded resample");glass.setControlSurface(true);check(glass.prepare()&&source.samples==2,"unchanged profile reuses its texture");
  glass.setControlSurface(false);check(glass.prepare(),"switching back restores tray profile");
  check(roughness(texture(optical(draw(glass))))==trayDetail,"tray detail is restored rather than double-blurred");glass.release();}
 static void scaledControlFallback(){Fixture f=new Fixture();f.glass.setControlSurface(true);View parent=new View();f.view.parent=parent;
  parent.scaleX=.94f;parent.scaleY=.94f;check(!f.glass.prepare()&&f.source.samples==0,"opening scale never samples an unverified transformed backdrop");
  Canvas local=new Canvas();check(f.glass.drawFallback(local),"capture-free control gradient can follow normal local opening scale");restored(local);
  check(!f.glass.isReady()&&f.source.samples==0,"scaled fallback is not optical capture");
  for(float scale:new float[]{0,-1,.1f,2f,Float.NaN,Float.POSITIVE_INFINITY}){parent.scaleX=scale;refuse(f,"unsupported control scale rejects fallback");}
  parent.scaleX=.94f;parent.rotation=1;refuse(f,"control rotation stays excluded");parent.rotation=0;
  parent.rotationX=1;refuse(f,"3D control rotation stays excluded");parent.rotationX=0;
  ((WindowManager.LayoutParams)parent.params).flags=WindowManager.LayoutParams.FLAG_SECURE;refuse(f,"scaled control cannot bypass secure-window exclusion");
  ((WindowManager.LayoutParams)parent.params).flags=0;f.view.shown=false;refuse(f,"hidden scaled control cannot paint");f.view.shown=true;
  parent.scaleX=parent.scaleY=1;check(f.glass.prepare()&&f.source.samples==1,"stable geometry begins verified capture normally");
  parent.scaleX=.94f;check(draw(f.glass).commands.isEmpty(),"scaled control cannot reuse a previously valid optical texture");f.glass.release();}
 public static void main(String[] args){uniformsAndTint();cacheAndStaleFrames();unavailableFallback();safety();opaquePreference();rejectionAndFaults();interactionAndRelease();controlReveal();controlBackdropCalming();scaledControlFallback();
  check(ValueAnimator.active.isEmpty(),"all test animations released");System.out.println("PASS production LiquidGlassDrawable runtime: "+checks+" checks (Java facade; AGSL/GPU not executed)");}
}
""",
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", help="JDK bin directory; defaults to JAVA_HOME/bin or javac on PATH")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    configured = args.jdk or (str(Path(os.environ["JAVA_HOME"]) / "bin") if os.environ.get("JAVA_HOME") else None)
    javac = shutil.which("javac")
    if configured is None and javac is None:
        parser.error("Set JAVA_HOME, put javac on PATH, or pass --jdk <JDK bin directory>")
    jdk = Path(configured) if configured else Path(javac).resolve().parent
    suffix = ".exe" if (jdk / "javac.exe").exists() else ""
    with tempfile.TemporaryDirectory(prefix="lsa-glass-drawable-") as temp:
        target = Path(temp)
        sources = []
        for name, content in STUBS.items():
            path = target / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            sources.append(str(path))
        sources += [str(root / "android/app/src/main/java/ls/augment/com" / name)
                    for name in ("LiquidGlassDrawable.java", "LiquidGlassPolicy.java", "GlassBackdropBlur.java")]
        subprocess.run([str(jdk / ("javac" + suffix)), "-encoding", "UTF-8", "-d", str(target / "classes"), *sources], check=True)
        subprocess.run([str(jdk / ("java" + suffix)), "-cp", str(target / "classes"), "TestLiquidGlassDrawable"], check=True)


if __name__ == "__main__":
    main()
