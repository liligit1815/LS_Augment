"""Run the VPN hook and shared Bluetooth/VPN vector artwork with Android facades.

The Java2D raster checks cover shape, scaling, native color/alpha, ink bounds,
restoration, and imported-artwork precedence. Device GPU verification is separate.
"""
import ast
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
FILES = {
    "android/content/res/Resources.java": "package android.content.res;public class Resources {public static float density=1;public static class Metrics {public float density=Resources.density;}public Metrics getDisplayMetrics(){return new Metrics();}}",
    "android/content/Context.java": "package android.content;public class Context {public android.content.res.Resources getResources(){return new android.content.res.Resources();}}",
    "android/content/res/ColorStateList.java": "package android.content.res;public class ColorStateList {public int color;public ColorStateList(int c){color=c;}public int getColorForState(int[] s,int d){return color;}public int getDefaultColor(){return color;}}",
    "android/os/Looper.java": "package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}",
    "android/os/Handler.java": "package android.os;public class Handler {public Handler(Looper l){}public void post(Runnable r){r.run();}}",
    "android/view/View.java": """package android.view;public class View {
public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public int visibility,width=24,height=20,paddingLeft,paddingRight,invalidations,layouts;
public android.content.Context getContext(){return new android.content.Context();}
public android.content.res.Resources getResources(){return getContext().getResources();}
public int getVisibility(){return visibility;}public int getWidth(){return width;}public int getHeight(){return height;}
public int getPaddingLeft(){return paddingLeft;}public int getPaddingRight(){return paddingRight;}
public int[] getDrawableState(){return new int[0];}public void invalidate(){invalidations++;}public void requestLayout(){layouts++;}}
""",
    "android/widget/ImageView.java": "package android.widget;public class ImageView extends android.view.View {public Object drawable=new Object();public android.content.res.ColorStateList tint;public Object getDrawable(){return drawable;}public android.content.res.ColorStateList getImageTintList(){return tint;}}",
    "ls/augment/com/ConfigSchema.java": "package ls.augment.com;public class ConfigSchema {public static final String STATUSBAR_VPN_STYLE=\"vpn\";}",
    "ls/augment/com/hook/AugmentModule.java": "package ls.augment.com.hook;public class AugmentModule {}",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;public class FeatureSettings {
public static int style;public static Runnable listener;public static String diagnostic;
public static int integer(android.content.Context c,String k,int f,int min,int max){return style;}
public static boolean addSnapshotListener(android.content.Context c,Runnable r){listener=r;return true;}
public static void diagnostic(android.content.Context c,String k,String v){diagnostic=k+"="+v;}}
""",
    "ls/augment/com/hook/RedMagicLegacyUiHook.java": "package ls.augment.com.hook;public class RedMagicLegacyUiHook {public static boolean positionOnly;public static boolean positionSizeOnly(android.content.Context c){return positionOnly;}}",
    "ls/augment/com/hook/StatusBarGridHook.java": "package ls.augment.com.hook;public class StatusBarGridHook {public static int dirty;public static void invalidateLayout(android.view.View view){dirty++;}}",
    "ls/augment/com/hook/StatusBarAssetsHook.java": """package ls.augment.com.hook;public class StatusBarAssetsHook {
public static boolean policyHidden,hidden,artwork;public static boolean hiddenByPolicy(android.view.View v){return policyHidden;}
public static boolean isHidden(android.view.View v,String id){if(!id.equals("vpn"))throw new AssertionError("VPN hiding semantic id");return hidden;}
public static class LayoutRendering {public boolean current;public LayoutRendering(boolean c){current=c;}}
public static LayoutRendering layoutRendering(android.view.View v){return new LayoutRendering(artwork);}}
""",
    "ls/augment/com/hook/SystemUiAdapter.java": """package ls.augment.com.hook;public class SystemUiAdapter {
public static final Object PASS=new Object();public interface Patch {Object apply(Object o,Object[] a,Object r)throws Throwable;}
public static java.util.Map<String,Patch[]> hooks=new java.util.HashMap<>();
public static int hookNamed(AugmentModule m,ClassLoader l,String namespace,String c,String method,int n,Patch before,Patch after){
 if(!namespace.equals("vpn"))throw new AssertionError("independent hook namespace");hooks.put(method,new Patch[]{before,after});return 1;}
public static Object field(Object o,String n){try{return o.getClass().getField(n).get(o);}catch(Exception e){return null;}}
public static Object run(String n,Object o,Object...a)throws Throwable {Patch[] p=hooks.get(n);Object r=p[0]==null?PASS:p[0].apply(o,a,null);
 if(r!=PASS)return r;if(p[1]!=null)p[1].apply(o,a,null);return PASS;}}
""",
    "ls/augment/com/hook/TestVpnIcon.java": """package ls.augment.com.hook;
import android.graphics.*;import ls.augment.com.VpnIconPainter;import ls.augment.com.BluetoothIconPainter;
public class TestVpnIcon {
public static class Icon extends android.widget.ImageView {public String mSlot="vpn";public float mIconAppearAmount=1;public int mVisibleState=0,mCurrentSetColor=0xff000000,mDrawableColor,mDecorColor;}
static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
static boolean near(double a,double b){return Math.abs(a-b)<.0001;}
static Object draw(Icon i,Canvas c)throws Throwable{return SystemUiAdapter.run("onDraw",i,c);}
static int runs(Canvas canvas,int x,int size){int count=0;boolean painted=false;for(int y=0;y<size;y++){
 boolean next=(canvas.image.getRGB(x,y)>>>24)>0;if(next&&!painted)count++;painted=next;}return count;}
static int maxAlpha(Canvas canvas,int size){int max=0;for(int y=0;y<size;y++)for(int x=0;x<size;x++)max=Math.max(max,canvas.image.getRGB(x,y)>>>24);return max;}
static boolean solidColor(Canvas canvas,int size,int color){if((color>>>24)==0)return maxAlpha(canvas,size)==0;
 for(int y=0;y<size;y++)for(int x=0;x<size;x++){int pixel=canvas.image.getRGB(x,y);if((pixel>>>24)!=(color>>>24))continue;
  for(int shift:new int[]{0,8,16})if(Math.abs(((pixel>>>shift)&255)-((color>>>shift)&255))>1)return false;return true;}return false;}
static void boundsMatch(Icon icon,Canvas canvas,String why){Rect r=VpnIconHook.contentBounds(icon);var ink=canvas.rings.get(0).ink();
 check(r!=null&&r.left==(int)Math.floor(ink.getMinX())&&r.top==(int)Math.floor(ink.getMinY())
 &&r.right==(int)Math.ceil(ink.getMaxX())&&r.bottom==(int)Math.ceil(ink.getMaxY()),why);}
public static void main(String[] args)throws Throwable {
 check(VpnIconHook.install(new AugmentModule(),TestVpnIcon.class.getClassLoader())==3,"set/measure/draw hooks installed");
 Icon icon=new Icon();check(draw(icon,new Canvas())==SystemUiAdapter.PASS,"native by default");
 SystemUiAdapter.run("set",icon,new Object());FeatureSettings.style=1;FeatureSettings.listener.run();
 Canvas c=new Canvas();check(draw(icon,c)==null&&c.ovals==1,"vector available immediately after native icon observed");
 check(FeatureSettings.listener!=null,"config listener observes native icon");
 boundsMatch(icon,c,"actual ink extents guide grid sizing");
 check(FeatureSettings.diagnostic.contains("art=shared-ring"),"diagnostic identifies shared crisp artwork");
 for(int color:new int[]{0xff000000,0x99000000,0xffffffff,0xd8ffffff,0xff445566}){
  icon.mCurrentSetColor=color;c=new Canvas();check(draw(icon,c)==null&&c.ovals==1&&c.lastColor==color,"native colors and opacity pass to vector artwork");}
 icon.mCurrentSetColor=0;icon.tint=new android.content.res.ColorStateList(0x88ffffff);c=new Canvas();draw(icon,c);check(c.lastColor==0x88ffffff,"ImageView tint fallback follows phone native palette");
 icon.tint=null;icon.mDrawableColor=0xff123456;c=new Canvas();draw(icon,c);check(c.lastColor==0xff123456,"drawable color fallback");
 icon.mDrawableColor=0;icon.mDecorColor=0xffabcdef;c=new Canvas();draw(icon,c);check(c.lastColor==0xffabcdef,"decor color fallback");
 icon.mDecorColor=0;c=new Canvas();draw(icon,c);check(c.lastColor==0xffffffff,"native white fallback");
 icon.mVisibleState=1;check(draw(icon,new Canvas())==SystemUiAdapter.PASS&&VpnIconHook.contentBounds(icon)==null,"overflow dot drawn and measured natively");
 icon.mVisibleState=2;check(draw(icon,new Canvas())==SystemUiAdapter.PASS,"native hidden state preserved");icon.mVisibleState=0;
 icon.mIconAppearAmount=.5f;check(draw(icon,new Canvas())==SystemUiAdapter.PASS&&VpnIconHook.contentBounds(icon)==null,"native appear/disappear animation preserved");icon.mIconAppearAmount=1;
 icon.visibility=android.view.View.GONE;check(draw(icon,new Canvas())==SystemUiAdapter.PASS,"hidden VPN never forced visible");icon.visibility=0;
 icon.drawable=null;check(draw(icon,new Canvas())==SystemUiAdapter.PASS,"no replacement without native VPN drawable");icon.drawable=new Object();
 icon.mSlot="alarm_clock";check(draw(icon,new Canvas())==SystemUiAdapter.PASS&&VpnIconHook.contentBounds(icon)==null,"unrelated slots untouched");icon.mSlot="vpn";
 StatusBarAssetsHook.policyHidden=true;check(draw(icon,new Canvas())==SystemUiAdapter.PASS&&VpnIconHook.contentBounds(icon)==null,"native drawable wrapper retains hidden-by-policy suppression");StatusBarAssetsHook.policyHidden=false;
 StatusBarAssetsHook.hidden=true;check(draw(icon,new Canvas())==SystemUiAdapter.PASS&&VpnIconHook.contentBounds(icon)==null,"scoped and legacy VPN hiding precede built-in style");StatusBarAssetsHook.hidden=false;
 StatusBarAssetsHook.artwork=true;check(draw(icon,new Canvas())==SystemUiAdapter.PASS&&VpnIconHook.contentBounds(icon)==null,"imported whole/background/foreground artwork stays with native drawable wrapper");StatusBarAssetsHook.artwork=false;
 c=new Canvas();check(draw(icon,c)==null&&c.ovals==1,"clearing imported artwork immediately restores ring");
 RedMagicLegacyUiHook.positionOnly=true;check(draw(icon,new Canvas())==SystemUiAdapter.PASS&&VpnIconHook.contentBounds(icon)==null,"position/size-only mode keeps native appearance");RedMagicLegacyUiHook.positionOnly=false;
 for(int style:new int[]{0,1,0,1}){FeatureSettings.style=style;int before=icon.invalidations,layouts=icon.layouts,dirty=StatusBarGridHook.dirty;FeatureSettings.listener.run();
 check(icon.invalidations==before+1&&icon.layouts==layouts&&StatusBarGridHook.dirty==dirty+1,"native/ring selection redraws and repacks painted bounds without native measure/layout");
 FeatureSettings.listener.run();check(icon.invalidations==before+1&&icon.layouts==layouts&&StatusBarGridHook.dirty==dirty+1,"unrelated or duplicate snapshots do not refresh VPN");
 check((draw(icon,new Canvas())==SystemUiAdapter.PASS)==(style==0),"selection restores native and ring immediately");}
 int before=icon.invalidations,layouts=icon.layouts,dirty=StatusBarGridHook.dirty;
 RedMagicLegacyUiHook.positionOnly=true;FeatureSettings.listener.run();
 check(icon.invalidations==before+1&&icon.layouts==layouts&&StatusBarGridHook.dirty==dirty+1,"position-only change redraws native without native measure/layout");
 FeatureSettings.listener.run();check(icon.invalidations==before+1,"unchanged position-only mode is deduplicated");
 RedMagicLegacyUiHook.positionOnly=false;FeatureSettings.listener.run();check(icon.invalidations==before+2&&icon.layouts==layouts,"leaving position-only restores selected ring without native measure/layout");
 check(icon.width==24&&icon.height==20,"native view allocation never changed");
 for(float density:new float[]{1,1.5f,3})for(int width:new int[]{20,24,47,88})for(int height:new int[]{12,20,55})for(int padding:new int[]{0,3}){
  android.content.res.Resources.density=density;icon.width=width;icon.height=height;icon.paddingLeft=padding;icon.paddingRight=padding+1;
  c=new Canvas();check(draw(icon,c)==null,"ring renders at native allocation and density");boundsMatch(icon,c,"grid bound equals drawn vector ink at every tested density and padding");
  check(c.stack.isEmpty(),"hook vector restores canvas state");}
 android.content.res.Resources.density=1;icon.width=24;icon.height=20;icon.paddingLeft=icon.paddingRight=0;
 VpnIconPainter painter=new VpnIconPainter(icon.getContext());check(painter.isReady(),"vector ready without module image loading");
 RectF ink=new RectF();VpnIconPainter.inkBounds(ink);check(near(ink.left,.95)&&near(ink.top,.95)&&near(ink.right,17.05)&&near(ink.bottom,17.05),"ink excludes Bluetooth reference viewport whitespace");
 BluetoothIconPainter bluetooth=new BluetoothIconPainter();Canvas reference=new Canvas();bluetooth.draw(reference,0,0,52,18,2,100,0xff000000);
 Canvas.Ring original=reference.rings.get(0);
 for(int size:new int[]{18,36,54,90,126})for(int color:new int[]{0xff000000,0x99000000,0xffffffff,0xd8ffffff,0xff445566,0x80557799,0x00445566}){
  c=new Canvas();check(painter.draw(c,0,0,size,size,color),"real vector painter draws multiple sizes and colors");
  check(c.ovals==1&&c.arcs==0&&c.paths==0&&c.rects==0&&c.text.isEmpty()&&c.rings.size()==1,"VPN is one full ring without battery number, track or old inner circle");
  Canvas.Ring ring=c.rings.get(0);double scale=size/18.;var painted=ring.ink();
  check(near(ring.left(),original.left()-34)&&near(ring.top(),original.top())&&near(ring.right(),original.right()-34)&&near(ring.bottom(),original.bottom())
   &&near(ring.stroke(),original.stroke()),"VPN reuses original Bluetooth circle and stroke proportions");
  check(near(painted.getMinX(),.95*scale)&&near(painted.getMinY(),.95*scale)
   &&near(painted.getMaxX(),17.05*scale)&&near(painted.getMaxY(),17.05*scale),"vector ink scales proportionately without bitmap crop");
  check((c.image.getRGB(size/2,size/2)>>>24)==0&&(c.image.getRGB(size/2,size*5/18)>>>24)==0,"transparent center has no inner ring or square background");
  check(maxAlpha(c,size)==(color>>>24),"vector honors complete native opacity including fully transparent tint");
  check(solidColor(c,size,color),"actual raster keeps native RGB on fully covered ring pixels");
  check(runs(c,size/2,size)==((color>>>24)==0?0:2),"center scan contains exactly top and bottom edges of one ring");
  check(c.lastColor==color&&c.stack.isEmpty(),"native palette and caller canvas state preserved");
 }
 c=new Canvas();check(painter.draw(c,2,4,30,18,0xff000000),"rectangular allocation draws");var centered=c.rings.get(0).ink();
 check(near(centered.getMinX(),8.95)&&near(centered.getMinY(),4.95)&&near(centered.getMaxX(),25.05)&&near(centered.getMaxY(),21.05),"square vector centered in rectangular native viewport");
 for(float[] size:new float[][]{{0,18},{18,0},{-1,18},{18,-1}}){c=new Canvas();check(!painter.draw(c,0,0,size[0],size[1],0xffffffff)&&c.rings.isEmpty()&&c.stack.isEmpty(),"nonpositive allocation falls back to native without changing canvas");}
 System.out.println("VPN runtime: "+checks+" actual-source vector/hook assertions passed");
}}
""",
}

# Reuse the Bluetooth runtime's Java2D facade directly, as the signal painter
# tests already do. Parse the literal without running its independent test suite.
tree = ast.parse((ROOT / "tools/test-bluetooth-icon-runtime.py").read_text(encoding="utf-8"))
bluetooth_facades = next(ast.literal_eval(node.value) for node in tree.body if isinstance(node, ast.Assign)
                         and any(isinstance(target, ast.Name) and target.id == "FILES" for target in node.targets))
FILES.update({name: value for name, value in bluetooth_facades.items() if name.startswith("android/graphics/")})

with tempfile.TemporaryDirectory(prefix="ls-vpn-") as tmp:
    work = Path(tmp)
    for name, content in FILES.items():
        file = work / name
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(content, encoding="utf-8")
    java_home = os.environ.get("JAVA_HOME")
    javac = str(Path(java_home) / "bin/javac") if java_home else "javac"
    java = str(Path(java_home) / "bin/java") if java_home else "java"
    subprocess.run([javac, "-encoding", "UTF-8", "--release", "17", "-d", str(work),
                    *map(str, work.rglob("*.java")), str(SRC / "ArtworkLayers.java"),
                    str(SRC / "StatusBarRingPainter.java"), str(SRC / "BluetoothIconPainter.java"),
                    str(SRC / "VpnIconPainter.java"), str(SRC / "hook/VpnIconHook.java")], check=True)
    subprocess.run([java, "-Djava.awt.headless=true", "-cp", str(work), "ls.augment.com.hook.TestVpnIcon"],
                   check=True, timeout=15)
