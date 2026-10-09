"""Execute the Bluetooth hook and real vector painter; optionally export a Java2D preview.

The facade records drawing and layout, not Android GPU or actual Bluetooth IPC.
"""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = {
"android/graphics/Rect.java": "package android.graphics;public class Rect {public int left,top,right,bottom;public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public int width(){return right-left;}}",
"android/graphics/Paint.java": """package android.graphics;public class Paint {
 public static final int ANTI_ALIAS_FLAG=1;public enum Style{FILL,STROKE}public enum Cap{ROUND,BUTT}public enum Join{ROUND}public enum Align{LEFT}
 public int color;public float stroke=1,textSize=12;public Style style=Style.FILL;public Cap cap=Cap.BUTT;
 public Paint(int f){}public void setColor(int c){color=c;}public void setAlpha(int a){color=(color&0xffffff)|(a<<24);}
 public void setStyle(Style s){style=s;}public void setStrokeWidth(float s){stroke=s;}public void setStrokeCap(Cap c){cap=c;}
 public Typeface typeface;public void setStrokeJoin(Join j){}public void setTypeface(Typeface t){typeface=t;}public void setTextSize(float s){textSize=s;}
 public void setTextAlign(Align a){}public float ascent(){return -textSize*.8f;}public float descent(){return textSize*.2f;}}
""",
"android/graphics/Typeface.java": "package android.graphics;public class Typeface {public static final int NORMAL=0;public static Typeface create(String s,int n){return new Typeface();}}",
"android/graphics/RectF.java": """package android.graphics;public class RectF {public float left,top,right,bottom;
 public void set(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}public float width(){return right-left;}}
""",
"android/graphics/Path.java": """package android.graphics;import java.awt.geom.*;public class Path {
 public enum Direction{CW}public Path2D.Float shape=new Path2D.Float();public void reset(){shape.reset();}
 public void moveTo(float x,float y){shape.moveTo(x,y);}public void lineTo(float x,float y){shape.lineTo(x,y);}
 public void addRoundRect(RectF r,float x,float y,Direction d){shape.append(new RoundRectangle2D.Float(r.left,r.top,r.width(),r.bottom-r.top,x*2,y*2),false);}}
""",
"android/graphics/Canvas.java": """package android.graphics;import java.awt.*;import java.awt.geom.*;import java.awt.image.*;import java.util.*;
 public class Canvas {
 public BufferedImage image=new BufferedImage(700,360,BufferedImage.TYPE_INT_ARGB);public Graphics2D g=image.createGraphics();
 public java.util.List<Graphics2D> stack=new ArrayList<>();public int paths,ovals,rects,arcs;public float sweep;public String text="";public int lastColor;
 public record Ring(boolean arc,float left,float top,float right,float bottom,float stroke,int color,Rectangle2D ink){}
 public java.util.List<Ring> rings=new ArrayList<>();
 private void recordRing(RectF r,Paint p,boolean arc){float half=p.stroke/2;Shape ink=new Rectangle2D.Float(r.left-half,r.top-half,r.width()+p.stroke,r.bottom-r.top+p.stroke);
 rings.add(new Ring(arc,r.left,r.top,r.right,r.bottom,p.stroke,p.color,g.getTransform().createTransformedShape(ink).getBounds2D()));}
 public Canvas(){g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);}
 public int save(){stack.add(g);g=(Graphics2D)g.create();return stack.size();}
 public void restoreToCount(int n){while(stack.size()>=n){g.dispose();g=stack.remove(stack.size()-1);}}
 public void translate(float x,float y){g.translate(x,y);}public void scale(float x,float y){g.scale(x,y);}
 public void clipPath(Path p){g.clip(p.shape);}
 private void paint(Shape shape,Paint p){lastColor=p.color;g.setColor(new Color(p.color,true));
 g.setStroke(new BasicStroke(p.stroke,p.cap==Paint.Cap.ROUND?BasicStroke.CAP_ROUND:BasicStroke.CAP_BUTT,BasicStroke.JOIN_ROUND));
 if(p.style==Paint.Style.FILL)g.fill(shape);else g.draw(shape);}
 public void drawPath(Path path,Paint p){paths++;paint(path.shape,p);}
 public void drawRoundRect(RectF r,float x,float y,Paint p){paint(new RoundRectangle2D.Float(r.left,r.top,r.width(),r.bottom-r.top,x*2,y*2),p);}
 public void drawOval(RectF r,Paint p){ovals++;recordRing(r,p,false);paint(new Ellipse2D.Float(r.left,r.top,r.width(),r.bottom-r.top),p);}
 public void drawArc(RectF r,float start,float degrees,boolean center,Paint p){arcs++;sweep=degrees;recordRing(r,p,true);paint(new Arc2D.Float(r.left,r.top,r.width(),r.bottom-r.top,-start,-degrees,Arc2D.OPEN),p);}
 public void drawRect(float l,float t,float r,float b,Paint p){rects++;paint(new Rectangle2D.Float(l,t,r-l,b-t),p);}
 public Typeface lastTypeface;public void drawText(String s,float x,float y,Paint p){text=s;lastTypeface=p.typeface;lastColor=p.color;g.setColor(new Color(p.color,true));g.setFont(new Font("SansSerif",Font.PLAIN,1).deriveFont(p.textSize));g.drawString(s,x,y);}
 public void png(String path)throws Exception{javax.imageio.ImageIO.write(image,"png",new java.io.File(path));}}
""",
"android/content/Context.java": "package android.content;public class Context {}",
"android/content/res/ColorStateList.java": "package android.content.res;public class ColorStateList {public int color;public ColorStateList(int c){color=c;}public int getDefaultColor(){return color;}public int getColorForState(int[] s,int d){return color;}}",
"android/widget/ImageView.java": "package android.widget;public class ImageView extends android.view.View {public android.content.res.ColorStateList tint;public android.content.res.ColorStateList getImageTintList(){return tint;}}",
"android/content/res/Resources.java": "package android.content.res;public class Resources {public static class Metrics {public float density=1;}public Metrics getDisplayMetrics(){return new Metrics();}}",
"android/os/Looper.java": "package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}",
"android/os/Handler.java": "package android.os;public class Handler {public Handler(Looper l){}public void post(Runnable r){r.run();}}",
"android/view/ViewGroup.java": "package android.view;public class ViewGroup {public static class LayoutParams {public int width=24;}}",
"android/view/View.java": """package android.view;import android.content.*;import android.content.res.*;public class View {
 public int width=24,height=20,invalidations,layouts;public ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();
 public Context getContext(){return new Context();}public Resources getResources(){return new Resources();}
 public int getWidth(){return width;}public int getHeight(){return height;}public int getMeasuredHeight(){return height;}
 public Object getParent(){return null;}public int getVisibility(){return 0;}
 public int[] getDrawableState(){return new int[0];}
 public int getPaddingLeft(){return 0;}public int getPaddingRight(){return 0;}public void requestLayout(){layouts++;}public void invalidate(){invalidations++;}
 public ViewGroup.LayoutParams getLayoutParams(){return params;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;requestLayout();}
 public void setMeasuredDimension(int w,int h){width=w;height=h;}
 public static class MeasureSpec {public static final int EXACTLY=0x40000000;public static int makeMeasureSpec(int s,int m){return s|m;}public static int getSize(int s){return s&0x3fffffff;}}}
""",
"ls/augment/com/ConfigSchema.java": "package ls.augment.com;public class ConfigSchema {public static final String STATUSBAR_BLUETOOTH_STYLE=\"style\";}",
"ls/augment/com/hook/AugmentModule.java": "package ls.augment.com.hook;public class AugmentModule {}",
"ls/augment/com/hook/StatusBarAssetsHook.java": "package ls.augment.com.hook;public class StatusBarAssetsHook {public static void bluetoothBattery(int n){}public static android.graphics.Typeface typeface(android.view.View v,String role,android.graphics.Typeface fallback){return fallback;}public static boolean drawLayer(android.view.View v,android.graphics.Canvas c,String id,String layer,float l,float t,float r,float b,int color){return false;}}",
"ls/augment/com/hook/RedMagicLegacyUiHook.java": "package ls.augment.com.hook;public class RedMagicLegacyUiHook {public static boolean positionOnly;public static boolean positionSizeOnly(android.content.Context c){return positionOnly;}}",
"ls/augment/com/hook/StatusBarGridHook.java": "package ls.augment.com.hook;public class StatusBarGridHook {public static int dirty;public static void invalidateLayout(android.view.View view){dirty++;}}",
"ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;public class FeatureSettings {
 public static void diagnostic(android.content.Context c,String key,String value){}
 public static int style;public static Runnable listener;public static int integer(android.content.Context c,String k,int a,int b,int d){return style;}
 public static boolean addSnapshotListener(android.content.Context c,Runnable r){listener=r;return true;}}
""",
"ls/augment/com/hook/SystemUiAdapter.java": """package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;public class SystemUiAdapter {
 public static android.content.Context context(Object owner){return new android.content.Context();}
 public static final Object PASS=new Object();public interface Patch{Object apply(Object o,Object[] a,Object r)throws Throwable;}
 public static Map<String,Patch[]> hooks=new HashMap<>();
 public static int hookNamed(AugmentModule m,ClassLoader l,String n,String c,String method,int args,Patch before,Patch after){hooks.put(method,new Patch[]{before,after});return 1;}
 public static Object field(Object o,String name){try{return o.getClass().getField(name).get(o);}catch(Exception e){return null;}}
 public static Object call(Object o,String name,Object...args)throws ReflectiveOperationException {
 for(Method m:o.getClass().getMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length)return m.invoke(o,args);throw new NoSuchMethodException(name);}
 public static Object run(String n,Object o,Object[] a)throws Throwable {Patch[] p=hooks.get(n);Object result=p[0]==null?PASS:p[0].apply(o,a,null);
 if(result!=PASS)return result;if(n.equals("onMeasure")){android.view.View v=(android.view.View)o;v.width=android.view.View.MeasureSpec.getSize((Integer)a[0])/2;}
 if(p[1]!=null)p[1].apply(o,a,null);return PASS;}}
""",
"ls/augment/com/hook/TestBluetoothIcon.java": """package ls.augment.com.hook;import android.graphics.*;import android.view.*;import ls.augment.com.BluetoothIconPainter;
 public class TestBluetoothIcon {
 public static class Icon extends android.widget.ImageView {public String mSlot="bluetooth";public float mIconAppearAmount=1,mDotAppearAmount=2;public int mVisibleState=0,mCurrentSetColor=0xff123456,mDrawableColor=0,mDecorColor=0;}
 static void check(boolean b,String s){if(!b)throw new AssertionError(s);}
 static void measure(Icon icon)throws Throwable{SystemUiAdapter.run("onMeasure",icon,new Object[]{View.MeasureSpec.makeMeasureSpec(icon.params.width,View.MeasureSpec.EXACTLY),20});}
 public static void main(String[] args)throws Throwable {
 BluetoothIconHook.install(new AugmentModule(),TestBluetoothIcon.class.getClassLoader());Icon icon=new Icon();
 measure(icon);Canvas c=new Canvas();check(SystemUiAdapter.run("onDraw",icon,new Object[]{c})==SystemUiAdapter.PASS,"native by default");
 FeatureSettings.style=2;SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{80});measure(icon);
 check(icon.width==48&&icon.params.width==48,"reserve width without native double scale");
 check(BluetoothIconHook.contentBounds(icon).width()>=47&&BluetoothIconHook.contentBounds(icon).top>0,"grid sizes painted ink, excluding empty viewport margins");
 c=new Canvas();check(SystemUiAdapter.run("onDraw",icon,new Object[]{c})==null,"custom drawn");
 check(c.text.equals("80%")&&c.sweep==288&&c.lastColor==0xff123456,"real percentage, arc and theme tint");
 int before=icon.invalidations,layouts=icon.layouts,dirty=StatusBarGridHook.dirty;
 FeatureSettings.listener.run();check(icon.invalidations==before&&icon.layouts==layouts&&StatusBarGridHook.dirty==dirty,"unrelated and duplicate snapshots do not refresh Bluetooth");
 SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{81});
 check(icon.invalidations==before+1&&icon.layouts==layouts&&StatusBarGridHook.dirty==dirty,"new percentage redraws without native layout or unnecessary repacking");
 SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{81});
 check(icon.invalidations==before+1&&icon.layouts==layouts,"duplicate battery update is deduplicated");
 FeatureSettings.style=1;FeatureSettings.listener.run();
 check(icon.params.width==36&&icon.invalidations==before+2&&icon.layouts==layouts+1&&StatusBarGridHook.dirty==dirty+1,"style updates only the changed native allocation and painted bounds");
 FeatureSettings.style=2;FeatureSettings.listener.run();
 check(icon.params.width==48&&icon.invalidations==before+3&&icon.layouts==layouts+2&&StatusBarGridHook.dirty==dirty+2,"ring selection requests one layout for its changed width");
 SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{80});
 icon.mCurrentSetColor=0;
 for(int palette:new int[]{0x99000000,0xd8ffffff}){icon.tint=new android.content.res.ColorStateList(palette);c=new Canvas();SystemUiAdapter.run("onDraw",icon,new Object[]{c});check(c.lastColor==palette,"phone ImageView palette follows light/dark including native opacity");}
 icon.tint=null;icon.mDecorColor=0xff555555;c=new Canvas();SystemUiAdapter.run("onDraw",icon,new Object[]{c});check(c.lastColor==0xff555555,"native decor fallback when no image tint");icon.mCurrentSetColor=0xff123456;
 icon.mVisibleState=1;icon.mDotAppearAmount=1;check(SystemUiAdapter.run("onDraw",icon,new Object[]{new Canvas()})==SystemUiAdapter.PASS,"overflow dot preserved");icon.mVisibleState=0;icon.mDotAppearAmount=2;
 icon.mIconAppearAmount=.5f;check(SystemUiAdapter.run("onDraw",icon,new Object[]{new Canvas()})==SystemUiAdapter.PASS,"native transition preserved");icon.mIconAppearAmount=1;
 SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{-1});measure(icon);c=new Canvas();SystemUiAdapter.run("onDraw",icon,new Object[]{c});
 check(icon.params.width==24&&c.paths==1&&c.text.isEmpty(),"unknown level restores width and draws only Bluetooth");
 FeatureSettings.style=1;SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{80});measure(icon);check(icon.params.width==36,"capsule width");
 FeatureSettings.style=0;FeatureSettings.listener.run();check(icon.params.width==24,"off restores original width");
 check(BluetoothIconHook.contentBounds(icon)==null,"off restores native content bounds");
 FeatureSettings.style=2;RedMagicLegacyUiHook.positionOnly=true;FeatureSettings.listener.run();check(icon.params.width==24,"position-only preserves native");
 before=icon.invalidations;layouts=icon.layouts;dirty=StatusBarGridHook.dirty;
 FeatureSettings.style=1;FeatureSettings.listener.run();SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{70});
 check(icon.invalidations==before&&icon.layouts==layouts&&StatusBarGridHook.dirty==dirty,"native position-only mode ignores custom styles and battery updates");
 RedMagicLegacyUiHook.positionOnly=false;Icon other=new Icon();other.mSlot="alarm_clock";measure(other);check(other.params.width==24,"unrelated slots untouched");
 Icon wide=new Icon();wide.params.width=64;measure(wide);before=wide.invalidations;layouts=wide.layouts;
 check(wide.width==64,"known custom battery overrides OEM scaling even when native allocation already fits");
 FeatureSettings.style=2;FeatureSettings.listener.run();
 check(wide.params.width==64&&wide.invalidations==before+1&&wide.layouts==layouts,"style change in an already sufficient native allocation only redraws and repacks");
 SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{-1});
 check(wide.params.width==64&&wide.invalidations==before+2&&wide.layouts==layouts+1,"unknown battery requests one remeasure to restore OEM scaling even when allocation stays unchanged");
 measure(wide);check(wide.width==32&&wide.layouts==layouts+1,"unknown battery uses the original scaled OEM measurement without duplicate layout requests");
 SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{80});
 check(wide.params.width==64&&wide.invalidations==before+3&&wide.layouts==layouts+2,"returning battery data requests one remeasure when exact custom measurement becomes active");
 measure(wide);check(wide.width==64&&wide.layouts==layouts+2,"known battery restores exact custom width without duplicate layout requests");
 FeatureSettings.style=0;FeatureSettings.listener.run();
 check(wide.params.width==64&&wide.layouts==layouts+3,"native style requests one remeasure even when original width equals custom allocation");
 measure(wide);check(wide.width==32&&wide.layouts==layouts+3,"native selection restores scaled OEM measured width");
 FeatureSettings.style=1;FeatureSettings.listener.run();
 check(wide.params.width==64&&wide.layouts==layouts+4,"native to known custom style requests one remeasure at unchanged allocated width");
 measure(wide);check(wide.width==64&&wide.layouts==layouts+4,"native to custom selection restores full measured viewport");
 SystemUiAdapter.run("updateBluetoothWithLevelInner",null,new Object[]{81});
 check(wide.layouts==layouts+4,"percentage update within the same measurement mode does not request layout");
 FeatureSettings.listener.run();check(wide.layouts==layouts+4,"duplicate snapshot does not request remeasure");
 BluetoothIconPainter painter=new BluetoothIconPainter();
 for(int style:new int[]{1,2})for(int level:new int[]{-1,0,1,80,100,101})for(int color:new int[]{0xff222222,0xffffffff}){
 Canvas recording=new Canvas();painter.draw(recording,4,8,104,36,style,level,color);
 check(recording.stack.isEmpty(),"canvas state restored");
 if(level<0||level>100)check(recording.text.isEmpty()&&recording.ovals==0,"no fake battery");
 else if(style==2){check(recording.text.equals(level+"%")&&Math.abs(recording.sweep-level*3.6)<.001,"exact ring level");
 check(recording.ovals==1&&recording.arcs==1&&recording.rings.size()==2,"single track and battery arc retained");
 for(Canvas.Ring ring:recording.rings)check(ring.left()==36&&ring.top()==2&&ring.right()==50&&ring.bottom()==16
 &&Math.abs(ring.stroke()-2.1f)<.0001,"shared ring preserves original Bluetooth geometry and stroke");
 check((recording.rings.get(0).color()>>>24)==Math.round((color>>>24)*.23f)
 &&recording.rings.get(1).color()==color,"shared ring preserves original track opacity and active tint");}}
 Canvas full=new Canvas();painter.draw(full,0,0,42,18,1,100,0xff000000);check(full.rects==1,"reference capsule carries the battery fill");
 Canvas empty=new Canvas();painter.draw(empty,0,0,42,18,1,0,0xff000000);check(empty.rects==0,"zero battery has no active fill");
 android.graphics.Typeface custom=new android.graphics.Typeface();painter.setTypeface(custom);Canvas typography=new Canvas();painter.draw(typography,0,0,52,18,2,80,0xff000000);check(typography.lastTypeface==custom,"imported font reaches the actual percentage Paint");
 java.util.List<String> layers=new java.util.ArrayList<>();painter.setArtwork((target,id,layer,l,t,r,b,color)->{layers.add(layer);if(layer.equals("background"))check(target.text.isEmpty(),"background precedes native battery text");if(layer.equals("foreground"))check(target.text.equals("80%"),"foreground follows native battery text");return false;});
 painter.draw(new Canvas(),0,0,52,18,2,80,0xff000000);check(layers.equals(java.util.List.of("whole","background","foreground")),"layer fallback preserves exact draw order");
 painter.setArtwork((target,id,layer,l,t,r,b,color)->layer.equals("whole"));Canvas replaced=new Canvas();painter.draw(replaced,0,0,52,18,2,80,0xff000000);check(replaced.text.isEmpty()&&replaced.ovals==0,"ready whole artwork suppresses native percentage and ring");painter.setArtwork(null);painter.setTypeface(null);
 if(args.length>0){Canvas preview=new Canvas();preview.g.setColor(new java.awt.Color(0xf0f0f0));preview.g.fillRect(0,0,700,180);
 preview.g.setColor(new java.awt.Color(0x343139));preview.g.fillRect(0,180,700,180);
 painter.draw(preview,25,36,260,100,1,80,0xff555555);painter.draw(preview,365,36,280,100,2,80,0xff555555);
 painter.draw(preview,25,216,260,100,1,80,0xffeeeeee);painter.draw(preview,365,216,280,100,2,80,0xffeeeeee);preview.png(args[0]);}
 System.out.println("Bluetooth runtime: passed (levels, theme, layout restoration, native transitions)");}}
""",
}

with tempfile.TemporaryDirectory(prefix="ls-bluetooth-") as tmp:
    work = Path(tmp)
    for name, content in FILES.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
    src = ROOT / "android/app/src/main/java/ls/augment/com"
    java_home = os.environ.get("JAVA_HOME")
    javac = str(Path(java_home) / "bin/javac") if java_home else "javac"
    java = str(Path(java_home) / "bin/java") if java_home else "java"
    subprocess.run([javac, "-encoding", "UTF-8", "-d", str(work), *map(str, work.rglob("*.java")),
                    str(src / "ArtworkLayers.java"), str(src / "StatusBarRingPainter.java"),
                    str(src / "BluetoothIconPainter.java"), str(src / "hook/BluetoothIconHook.java")], check=True)
    subprocess.run([java, "-Djava.awt.headless=true", "-cp", str(work), "ls.augment.com.hook.TestBluetoothIcon", *sys.argv[1:]], check=True)
