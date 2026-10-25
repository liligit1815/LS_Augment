"""Original mobile PNG provenance plus production loader/policy/painter regression."""
from pathlib import Path
from hashlib import sha256
import argparse
import subprocess
import tempfile
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
JAVA = Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--material-root', type=Path,
                    default=ROOT / '素材/iOS状态栏素材/res/drawable-xxhdpi')
parser.add_argument('--dual-material-root', type=Path,
                    default=ROOT / '素材/状态栏素材/双信号')
parser.add_argument('--render', type=Path, help='Save a Java2D rendering of production layout/painters for visual review')
parser.add_argument('--render-spacing', type=Path, help='Save native-size and enlarged activity spacing in both themes')
args = parser.parse_args()
assets = ROOT / 'android/app/src/main/assets'
copied = assets / 'signal/ios'
# Captured from the user's original files, so this regression is also reproducible
# when the Downloads folder is unavailable on a different development machine.
EXPECTED = {
    'stat_sys_signal_0_darkmode.png': '7c68bb6759ac6726a0cd08e17c269d69318bce51e7158f3563e51b7c715c4f81',
    'stat_sys_signal_0.png': '0422fafced74a5df5d5832a677468fdeb145679e10f06b98cd4bbb6bffa9c8b0',
    'stat_sys_signal_1_darkmode.png': 'eadf0f0264bd7daf30c14c86d28318e6a25a2641057ea710e47e5b0059e8b08f',
    'stat_sys_signal_1.png': '799e07725776dfd4d11464530d3d0606377cf38437fc841d0d3f11f7189dcacf',
    'stat_sys_signal_2_darkmode.png': '1a38a10768404dd9487ff6afd78ce3d982cb30f91daaee00e1e77344aab1e2ff',
    'stat_sys_signal_2.png': 'baffd9c921cb3b3f7cab952b79565777f492c63bb49712cf142be881334aa3a2',
    'stat_sys_signal_3_darkmode.png': '65ef99b71455a59f6009ca630e153fd053bd98f63d7d23364e654a21ed2a204e',
    'stat_sys_signal_3.png': '405d6d6445e15b953aa1b461d0fd11300eafa5322e7407c57fe8960bb298769f',
    'stat_sys_signal_4_darkmode.png': 'b2777b66432408a184b2cf44f94198caf3e96bdf71cbed69a40f0abd58c9a68a',
    'stat_sys_signal_4.png': 'd21e57d6f5356e79a90ccdc15730c845f7989e5e3b88aa2e2b6924910f77ad63',
    'stat_sys_signal_5_darkmode.png': 'b2777b66432408a184b2cf44f94198caf3e96bdf71cbed69a40f0abd58c9a68a',
    'stat_sys_signal_5.png': 'd21e57d6f5356e79a90ccdc15730c845f7989e5e3b88aa2e2b6924910f77ad63',
    'stat_sys_signal_null_darkmode.png': 'c87d1e2cf3890256be8d43f7ec2e13b29d2a3d6c266dfa926192543a5a927947',
    'stat_sys_signal_null.png': '46f9809538ba960a935be669f9083911857de1a2e16b39146ee158986fe55044',
}
DUAL_EXPECTED = {
    'stat_sys_signal_0.png': '239e7be01984f987036de0de6236c3b368eba3ae2344b7291e4144d782f730e7',
    'stat_sys_signal_1.png': '11a743ac35b9200f4942013ba3274b9ac206df821e3af50138fd6a6437473833',
    'stat_sys_signal_1_darkmode.png': '211036297a0288b8f024097687a2f3a3a63500e6d4a5efa78e31d1b88f8968d9',
    'stat_sys_signal_2.png': 'fb1a3807b627fbdc99e111057f01682eafcd70a7d6fcc64febd07bbebe3e854c',
    'stat_sys_signal_2_darkmode.png': '3dbcce9367cf02449048d008f3dcf7de093b923a9f6eba0921b9b88211e8eef2',
    'stat_sys_signal_3.png': 'f14d2a8e266e87e66c9fcca00b95f41ae735bd639928bd43cf2c4325a1dcc70d',
    'stat_sys_signal_3_darkmode.png': '4cfd7f94d3307e4e853d1ad252a4fe00d42cd26dda32300da8fb8e09e1083444',
    'stat_sys_signal_4.png': '44136b2445b9d1b8e0e563cc2ecb3003c7634d44493286609a2655a22a3d0ce9',
    'stat_sys_signal_4_darkmode.png': '70bf63b5ae914f86321c8b44154189d1a556358ecca69e06857179cc50f02e81',
}
checks = 0
assert {p.name for p in copied.glob('*.png')} == set(EXPECTED)
for name in sorted(copied.glob('*.png')):
    original = args.material_root / name.name
    assert sha256(name.read_bytes()).hexdigest() == EXPECTED[name.name], name.name
    if original.exists():
        assert sha256(name.read_bytes()).digest() == sha256(original.read_bytes()).digest(), name.name
    image = Image.open(name).convert('RGBA')
    assert image.size == (61, 60) and image.getbbox()[0] == 8 and image.getbbox()[2] == 55
    checks += 2
assert len(list(copied.glob('*.png'))) == 14
normal = Image.open(copied / 'stat_sys_signal_0.png').convert('RGBA')
dark = Image.open(copied / 'stat_sys_signal_0_darkmode.png').convert('RGBA')
assert normal.getpixel((14, 42))[3] == 92 and dark.getpixel((14, 42))[3] == 102
for level in range(5):
    image = Image.open(copied / f'stat_sys_signal_{level}.png').convert('RGBA')
    assert [image.getpixel(point)[3] == 255 for point in [(14, 42), (25, 37), (37, 29), (49, 18)]] == [i < level for i in range(4)]
    checks += 1
assert (copied / 'stat_sys_signal_4.png').read_bytes() == (copied / 'stat_sys_signal_5.png').read_bytes()
print(f'PASS original iOS mobile signal PNGs: {checks + 3} assertions; 14 source SHA-256 matches')

dual = copied / 'dual'
assert {p.name for p in dual.glob('*.png')} == set(DUAL_EXPECTED)
for name, expected in DUAL_EXPECTED.items():
    packaged = dual / name
    assert sha256(packaged.read_bytes()).hexdigest() == expected, name
    original = args.dual_material_root / name
    if original.exists():
        assert packaged.read_bytes() == original.read_bytes(), name
    image = Image.open(packaged).convert('RGBA')
    assert image.size == (61, 60) and image.getchannel('A').getbbox() == (8, 13, 55, 50), name
assert not (dual / 'stat_sys_signal_0_darkmode.png').exists(), 'the supplied dark zero is the old single-row icon'
for level in range(5):
    light = Image.open(dual / f'stat_sys_signal_{level}.png').convert('RGBA')
    upper = [light.getpixel((x, 34))[3] for x in (12, 25, 38, 50)]
    lower = [light.getpixel((x, 45))[3] for x in (12, 25, 38, 50)]
    assert upper == lower == [254 if column < level else 92 for column in range(4)]
    assert not light.getchannel('A').crop((8, 39, 55, 41)).getbbox(), 'two-pixel separation between the SIMs'
    if level:
        dark = Image.open(dual / f'stat_sys_signal_{level}_darkmode.png').convert('RGBA')
        assert light.getchannel('A').tobytes() == dark.getchannel('A').tobytes()
        assert light.getpixel((12, 34))[:3] == (255, 255, 255)
        assert dark.getpixel((12, 34))[:3] == (0, 0, 0)
print('PASS original iOS dual-card PNGs: 9 source SHA-256 matches, independent upper bars/lower dots, both foreground variants')

FILES = {
    'android/content/Context.java': '''package android.content;public class Context{
 public final String packageName;public final android.content.res.AssetManager assets;
 public Context(String name,String path){packageName=name;assets=new android.content.res.AssetManager(path);}
 public Context getApplicationContext(){return this;}public String getPackageName(){return packageName;}
 public Context createPackageContext(String name,int flags){return new Context(name,assets.root);}
 public android.content.res.AssetManager getAssets(){return assets;}}
''',
    'android/content/res/AssetManager.java': '''package android.content.res;public class AssetManager{
 public static final java.util.List<String> threads=new java.util.ArrayList<>();
 public final String root;public AssetManager(String path){root=path;}public java.io.InputStream open(String name)throws Exception{
 threads.add(Thread.currentThread().getName());
 return new java.io.FileInputStream(new java.io.File(root,name));}}
''',
    'android/os/Looper.java': 'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
    'android/os/Handler.java': '''package android.os;public class Handler{
 public static final java.util.concurrent.BlockingQueue<Runnable> pending=new java.util.concurrent.LinkedBlockingQueue<>();
 public Handler(Looper looper){}public void post(Runnable callback){pending.add(callback);}}
''',
    'android/graphics/Bitmap.java': '''package android.graphics;public class Bitmap{
 public java.awt.image.BufferedImage image;public boolean recycled;public Bitmap(java.awt.image.BufferedImage value){image=value;}
 public int getWidth(){return image.getWidth();}public int getHeight(){return image.getHeight();}public void recycle(){recycled=true;}}
''',
    'android/graphics/BitmapFactory.java': '''package android.graphics;public class BitmapFactory{
 public static java.util.List<String> threads=new java.util.ArrayList<>();public static class Options{public boolean inScaled;}
 public static Bitmap decodeStream(java.io.InputStream stream,Object unused,Options options)throws Exception{
 threads.add(Thread.currentThread().getName());if(options.inScaled)throw new AssertionError("asset decoded with density scaling");
 return new Bitmap(javax.imageio.ImageIO.read(stream));}}
''',
    'android/graphics/Paint.java': '''package android.graphics;public class Paint{
 public static final int ANTI_ALIAS_FLAG=1,FILTER_BITMAP_FLAG=2;public PorterDuffColorFilter filter;public int color;
 public Paint(int flags){}public void setColor(int value){color=value;}public void setColorFilter(PorterDuffColorFilter value){filter=value;}}
''',
    'android/graphics/Path.java': '''package android.graphics;public class Path{
 public final java.awt.geom.Path2D.Float shape=new java.awt.geom.Path2D.Float();public void reset(){shape.reset();}
 public void moveTo(float x,float y){shape.moveTo(x,y);}public void lineTo(float x,float y){shape.lineTo(x,y);}
 public void quadTo(float a,float b,float c,float d){shape.quadTo(a,b,c,d);}public void close(){shape.closePath();}}
''',
    'android/graphics/PorterDuff.java': 'package android.graphics;public class PorterDuff{public enum Mode{SRC_IN}}',
    'android/graphics/PorterDuffColorFilter.java': '''package android.graphics;public class PorterDuffColorFilter{
 public final int color;public final PorterDuff.Mode mode;public PorterDuffColorFilter(int c,PorterDuff.Mode m){color=c;mode=m;}}
''',
    'android/graphics/Rect.java': '''package android.graphics;public class Rect{
 public int left,top,right,bottom;public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
 public int width(){return right-left;}public int height(){return bottom-top;}}
''',
    'android/graphics/RectF.java': '''package android.graphics;public class RectF{
 public float left,top,right,bottom;public void set(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}
 public float width(){return right-left;}public float height(){return bottom-top;}}
''',
    'android/graphics/Canvas.java': '''package android.graphics;public class Canvas{
 public Bitmap bitmap;public Rect source;public RectF destination;public PorterDuffColorFilter filter;public int draws;
 public final java.awt.image.BufferedImage pixels;public java.awt.Graphics2D g;
 public final java.util.ArrayList<java.awt.Graphics2D> stack=new java.util.ArrayList<>();
 public Canvas(){this(256,256);}public Canvas(int width,int height){pixels=new java.awt.image.BufferedImage(width,height,java.awt.image.BufferedImage.TYPE_INT_ARGB);g=pixels.createGraphics();
 g.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING,java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
 g.setRenderingHint(java.awt.RenderingHints.KEY_INTERPOLATION,java.awt.RenderingHints.VALUE_INTERPOLATION_BILINEAR);}
 public int save(){stack.add(g);g=(java.awt.Graphics2D)g.create();return stack.size();}
 public void restoreToCount(int n){while(stack.size()>=n){g.dispose();g=stack.remove(stack.size()-1);}}
 public void translate(float x,float y){g.translate(x,y);}public void scale(float x,float y){g.scale(x,y);}
 public void drawRoundRect(float l,float t,float r,float b,float rx,float ry,Paint paint){g.setColor(new java.awt.Color(paint.color,true));g.fill(new java.awt.geom.RoundRectangle2D.Float(l,t,r-l,b-t,rx*2,ry*2));}
 public void drawPath(Path path,Paint paint){g.setColor(new java.awt.Color(paint.color,true));g.fill(path.shape);}
 public void drawBitmap(Bitmap bitmap,Rect source,RectF destination,Paint paint){this.bitmap=bitmap;this.source=source;
 this.destination=new RectF();this.destination.set(destination.left,destination.top,destination.right,destination.bottom);filter=paint.filter;draws++;
 java.awt.image.BufferedImage tinted=new java.awt.image.BufferedImage(bitmap.getWidth(),bitmap.getHeight(),java.awt.image.BufferedImage.TYPE_INT_ARGB);
 for(int y=0;y<bitmap.getHeight();y++)for(int x=0;x<bitmap.getWidth();x++){
  int original=bitmap.image.getRGB(x,y);int color=filter==null?original:filter.color;
  int alpha=filter==null?original>>>24:Math.round((original>>>24)*(color>>>24)/255f);
  tinted.setRGB(x,y,(alpha<<24)|(color&0xffffff));}
 g.drawImage(tinted,Math.round(destination.left),Math.round(destination.top),Math.round(destination.right),Math.round(destination.bottom),
 source.left,source.top,source.right,source.bottom,null);}}
''',
    'ls/augment/com/StatusBarIconSpacingSpec.java': '''package ls.augment.com;public class StatusBarIconSpacingSpec{
 public static final Insets ZERO=new Insets(0,0,0,0);public static class Insets{
 public final int start,top,end,bottom;public Insets(int s,int t,int e,int b){start=s;top=t;end=e;bottom=b;}
 public boolean isZero(){return start==0&&top==0&&end==0&&bottom==0;}public int horizontal(){return start+end;}
 public int vertical(){return top+bottom;}public int left(boolean rtl){return rtl?end:start;}}}
''',
    'TestIosSignal.java': r'''import ls.augment.com.*;import android.graphics.*;import android.content.Context;
public class TestIosSignal{
 static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static boolean near(float a,float b){return Math.abs(a-b)<.001;}
 // Java2D uses premultiplied intermediates when composing faint pixels; allow its
 // one-LSB round trip error without weakening alpha/reception assertions.
 static boolean sameColor(int actual,int expected){for(int shift:new int[]{0,8,16})if(Math.abs(((actual>>shift)&255)-((expected>>shift)&255))>2)return false;return true;}
 static void await()throws Exception{Runnable callback=android.os.Handler.pending.poll(5,java.util.concurrent.TimeUnit.SECONDS);check(callback!=null,"worker completed");callback.run();}
 static DualSignalLayout plan(float height,boolean ios,boolean single){return DualSignalLayout.spaced(height,false,
  single?new int[]{0}:new int[]{0,1},single?new float[][]{{0,0,0}}:new float[][]{{0,0,0},{0,0,0}},0,null,1,false,ios);}
 static DualSignalPainter renderer(Context context,IosSignalPainter png,boolean ios,boolean single,int upper,int lower,Runnable ready){
  DualSignalPainter painter=new DualSignalPainter();
  if(ios)painter.setArtwork((canvas,id,layer,l,t,r,b,color)->{
   if(!id.startsWith("row")||!"whole".equals(layer))return false;
   int row=id.charAt(3)-'0';return png.drawRow(context,canvas,l,t,r,b,row==0?upper:lower,4,false,color,row,single,ready);
  });
  return painter;
 }
 static void renderStyles(Context context,IosSignalPainter png,Runnable ready,String output)throws Exception{
  Canvas image=new Canvas(1120,470);
  String[] titles={"iOS single", "iOS dual: SIM 1=4 / SIM 2=1", "iOS dual: SIM 1=1 / SIM 2=4", "Honor dual: 5 / 2"};
  for(int theme=0;theme<2;theme++){
   image.g.setColor(theme==0?java.awt.Color.WHITE:new java.awt.Color(0x202124));image.g.fillRect(0,theme*235,1120,235);
   int color=theme==0?0xff262626:0xffeeeeee;
   for(int mode=0;mode<4;mode++){
    boolean ios=mode!=3,single=mode==0;int upper=mode==2?1:mode==3?5:4,lower=mode==1?1:mode==3?2:4;
    image.g.setColor(new java.awt.Color(color,true));image.g.setFont(new java.awt.Font("SansSerif",java.awt.Font.PLAIN,15));
    image.g.drawString(titles[mode],18+mode*280,26+theme*235);
    DualSignalLayout layout=plan(37,ios,single);DualSignalPainter painter=renderer(context,png,ios,single,upper,lower,ready);
    int save=image.save();image.translate(38+mode*280,theme*235+53);image.scale(2,2);
    painter.drawSpaced(image,0,0,layout,upper,lower,ios?4:5,ios?4:5,color,0,0,null);image.restoreToCount(save);
    image.g.setColor(new java.awt.Color(theme==0?0xdddddd:0x555555));image.g.drawLine(18+mode*280,theme*235+53,258+mode*280,theme*235+53);
    image.g.drawLine(18+mode*280,theme*235+127,258+mode*280,theme*235+127);
    DualSignalLayout actual=plan(24,ios,single);
    painter.drawSpaced(image,38+mode*280,theme*235+155,actual,upper,lower,ios?4:5,ios?4:5,color,0,0,null);
    image.g.setColor(new java.awt.Color(color,true));image.g.setFont(new java.awt.Font("SansSerif",java.awt.Font.PLAIN,13));
    image.g.drawString("above: 37 px height at 2x",18+mode*280,theme*235+206);
    image.g.drawString("below: 24 px height at 1x",18+mode*280,theme*235+223);
   }
  }
  javax.imageio.ImageIO.write(image.pixels,"png",new java.io.File(output));
 }
 static void renderSpacing(Context context,IosSignalPainter png,Runnable ready,String output)throws Exception{
  Canvas image=new Canvas(1120,420);
  for(int theme=0;theme<2;theme++){
   image.g.setColor(theme==0?java.awt.Color.WHITE:new java.awt.Color(0x202124));image.g.fillRect(0,theme*210,1120,210);
   int color=theme==0?0xff363636:0xffeeeeee;
   for(int mode=0;mode<4;mode++){
    boolean ios=mode<2;int traffic=mode%2==0?0:3;
    image.g.setColor(new java.awt.Color(color,true));image.g.setFont(new java.awt.Font("SansSerif",java.awt.Font.PLAIN,15));
    image.g.drawString((ios?"iOS":"Honor")+(traffic==0?" idle":" active"),20+mode*280,24+theme*210);
    DualSignalPainter renderer=renderer(context,png,ios,false,4,3,ready);
    for(int size=0;size<2;size++){
     DualSignalLayout layout=DualSignalLayout.spaced(30,true,new int[]{0,1},new float[][]{{1.4f,0,0},{1.4f,0,0}},0,null,1,false,ios);
     int save=image.save();image.translate(20+mode*280,theme*210+(size==0?48:106));image.scale(size==0?1:2.5f,size==0?1:2.5f);
     renderer.drawSpaced(image,0,0,layout,4,3,4,4,color,traffic,0,(canvas,row,badge,box,tint)->{
      canvas.g.setColor(new java.awt.Color(tint,true));canvas.g.setFont(new java.awt.Font("SansSerif",java.awt.Font.BOLD,1).deriveFont(box.height));
      java.awt.Shape glyph=canvas.g.getFont().createGlyphVector(canvas.g.getFontRenderContext(),row==0?"4G":"5G").getOutline();var bounds=glyph.getBounds2D();
      var tx=new java.awt.geom.AffineTransform();tx.translate(box.x,box.y);tx.scale(box.width/bounds.getWidth(),box.height/bounds.getHeight());tx.translate(-bounds.getX(),-bounds.getY());canvas.g.fill(tx.createTransformedShape(glyph));
     });image.restoreToCount(save);
    }
   }
  }
  javax.imageio.ImageIO.write(image.pixels,"png",new java.io.File(output));
 }
 public static void main(String[] args)throws Exception{
  for(int bars:new int[]{4,5})for(int level=-1;level<=bars+2;level++)for(boolean unavailable:new boolean[]{false,true})for(int color:new int[]{0xffffffff,0xff000000,0xff123456}){
   String name=IosSignalPolicy.filename(level,bars,unavailable,color);
   check(name.contains(unavailable||level<0?"_null":"_"+Math.round(Math.max(0,Math.min(bars,level))*4f/bars)),"four-column asset maps real native levels");
   check(name.contains("darkmode")==IosSignalPolicy.darkArtwork(color),"actual region foreground determines variant");
   check(!name.startsWith("dual/")&&name.equals(IosSignalPolicy.filename(level,bars,unavailable,color,true)),"single-card always uses the original single-row materials");
   int mapped=unavailable||level<0?0:Math.round(Math.max(0,Math.min(bars,level))*4f/bars);
   String dual=IosSignalPolicy.filename(level,bars,unavailable,color,false);
   check(dual.equals("dual/stat_sys_signal_"+mapped+(mapped>0&&IosSignalPolicy.darkArtwork(color)?"_darkmode":"")+".png"),"dual-card state selects combined source and excludes corrupt dark zero");
  }
  Context systemui=new Context("com.android.systemui",args[0]);int[] replies={0};Runnable ready=()->replies[0]++;
  check(!IosSignalAssets.ready(systemui,"stat_sys_signal_3_darkmode.png",ready),"initial cache miss does not claim readiness");
  await();check(replies[0]==1,"ready invalidates on the UI queue");
  check(IosSignalAssets.ready(systemui,"stat_sys_signal_3_darkmode.png",ready),"module context decoded a SystemUI-requested PNG");
  check(IosSignalAssets.cached("stat_sys_signal_3_darkmode.png").getWidth()==61,"original bitmap dimensions retained");
  IosSignalPainter painter=new IosSignalPainter();Canvas c=new Canvas();
  check(painter.drawRow(systemui,c,7,11,114,51,4,5,false,0xff123456,ready),"native five-level signal maps to matching four-column artwork");
  check(c.draws==1&&near(c.destination.width()/c.destination.height(),47f/42f),"PNG uses original ink aspect, never stretched to Honor proportions");
  check(c.destination.left>=7&&c.destination.right<=114&&c.destination.top>=11&&c.destination.bottom<=51,"ink remains in its row cell");
  check(c.source.left==8&&c.source.top==7&&c.source.right==55&&c.source.bottom==49,"crop includes the unavailable X and preserves baseline");
  check(c.filter.color==0xff123456&&c.filter.mode==android.graphics.PorterDuff.Mode.SRC_IN,"native tint leaves original alpha mask intact");
  check(c.bitmap.image.getRGB(49,18)>>>24==102,"inactive source column alpha is unchanged");
  for(float height:new float[]{12,18,24,42}){
   float width=height*47f/42f;Canvas nativeFrame=new Canvas();
   check(painter.drawRow(systemui,nativeFrame,3,5,3+width,5+height,4,5,false,0xff123456,ready),"real iOS row dimensions draw the supplied bitmap");
   check(near(nativeFrame.destination.width(),width)&&near(nativeFrame.destination.height(),height),"original PNG fills the measured iOS ink frame without hidden Honor-width letterboxing");
  }
  Canvas loading=new Canvas();check(!painter.drawRow(systemui,loading,0,0,107,40,0,4,true,0xffffffff,ready)&&loading.draws==0,"loading never synthesizes a fake signal");
  await();check(painter.drawRow(systemui,loading,0,0,107,40,0,4,true,0xffffffff,ready),"unavailable row loads the supplied X icon");
  for(String name:new String[]{"stat_sys_signal_0.png","stat_sys_signal_1.png","stat_sys_signal_2.png","stat_sys_signal_3.png","stat_sys_signal_4.png","stat_sys_signal_5.png","stat_sys_signal_null.png","stat_sys_signal_0_darkmode.png","stat_sys_signal_1_darkmode.png","stat_sys_signal_2_darkmode.png","stat_sys_signal_3_darkmode.png","stat_sys_signal_4_darkmode.png","stat_sys_signal_5_darkmode.png","stat_sys_signal_null_darkmode.png"}){
   if(!IosSignalAssets.ready(systemui,name,ready))await();check(IosSignalAssets.cached(name)!=null,"all packaged states decode");
  }
  for(String name:new String[]{"dual/stat_sys_signal_0.png","dual/stat_sys_signal_1.png","dual/stat_sys_signal_2.png","dual/stat_sys_signal_3.png","dual/stat_sys_signal_4.png","dual/stat_sys_signal_1_darkmode.png","dual/stat_sys_signal_2_darkmode.png","dual/stat_sys_signal_3_darkmode.png","dual/stat_sys_signal_4_darkmode.png"}){
   if(!IosSignalAssets.ready(systemui,name,ready))await();check(IosSignalAssets.cached(name)!=null,"all correct dual-row assets decode");
  }
  int decodes=BitmapFactory.threads.size(),opens=android.content.res.AssetManager.threads.size();
  int[] centers={4,17,30,42};
  for(int color:new int[]{0xff000000,0xffffffff,0xff123456})for(int upper=0;upper<=4;upper++)for(int lower=0;lower<=4;lower++){
   Canvas pair=new Canvas();
   check(painter.drawRow(systemui,pair,0,0,47,26,upper,4,false,color,0,false,ready),"upper row uses its SIM's level");
   check(pair.source.left==8&&pair.source.top==13&&pair.source.right==55&&pair.source.bottom==39,"upper selects tall-bars section only");
   check(near(pair.destination.width(),47)&&near(pair.destination.height(),26),"upper keeps 47:26 source aspect");
   check(painter.drawRow(systemui,pair,0,28,47,37,lower,4,false,color,1,false,ready),"lower row uses its independent SIM's level");
   check(pair.source.left==8&&pair.source.top==41&&pair.source.right==55&&pair.source.bottom==50,"lower selects short-dots section only");
   check(pair.draws==2&&near(pair.destination.width(),47)&&near(pair.destination.height(),9),"lower keeps 47:9 source aspect inside 47:37 complete glyph");
   for(int column=0;column<4;column++){
    int upperPixel=pair.pixels.getRGB(centers[column],21),lowerPixel=pair.pixels.getRGB(centers[column],32);
    check((upperPixel>>>24)==(column<upper?254:92),"actual rendered upper alpha follows only upper SIM reception");
    check((lowerPixel>>>24)==(column<lower?254:92),"actual rendered lower alpha follows only lower SIM reception");
    check(sameColor(upperPixel,color)&&sameColor(lowerPixel,color),"both theme variants preserve the native foreground color");
   }
   check((pair.pixels.getRGB(17,26)>>>24)==0&&(pair.pixels.getRGB(17,27)>>>24)==0,"complete glyph preserves the two-pixel inter-SIM gap");
  }
  for(float height:new float[]{12,18,24,37}){
   float scale=height/37f,width=47*scale;Canvas frame=new Canvas();
   check(painter.drawRow(systemui,frame,3,5,3+width,5+26*scale,4,4,false,0xff000000,0,false,ready),"upper scales to measured native frame");
   check(near(frame.destination.width(),width)&&near(frame.destination.height(),26*scale),"upper fills correct non-square row without stretching");
   check(painter.drawRow(systemui,frame,3,5+28*scale,3+width,5+height,1,4,false,0xff000000,1,false,ready),"lower scales in same native frame");
   check(near(frame.destination.width(),width)&&near(frame.destination.height(),9*scale),"lower fills proportional dot row without repeated full artwork");
  }
  Canvas unavailable=new Canvas();
  check(painter.drawRow(systemui,unavailable,0,0,47,26,4,4,true,0xff000000,0,false,ready),"unavailable dual row uses unlit correct-shape artwork");
  check(unavailable.bitmap==IosSignalAssets.cached("dual/stat_sys_signal_0.png"),"dark unavailable avoids faulty supplied dark-zero single row");
  check((unavailable.pixels.getRGB(4,21)>>>24)==92,"unavailable dual state remains inactive rather than showing a strong connection");
  check(!painter.drawRow(systemui,new Canvas(),0,0,47,26,4,4,false,0xff000000,2,false,ready),"invalid physical row fails closed");
  check(BitmapFactory.threads.size()==decodes&&android.content.res.AssetManager.threads.size()==opens,"reception and theme redraws only read cached pixels, without asset I/O");
  for(boolean single:new boolean[]{true,false}){
   DualSignalLayout layout=plan(single?42:37,true,single);Canvas planned=new Canvas();
   renderer(systemui,painter,true,single,4,1,ready).drawSpaced(planned,0,0,layout,4,1,4,4,0xff000000,0,0,null);
   check(planned.draws==(single?1:2),"production shared painter draws exactly one artwork section per physical card");
   check(layout.plan.rows.length==(single?1:2),"production plan respects single/dual-card mode");
   if(single){
    check(planned.bitmap==IosSignalAssets.cached("stat_sys_signal_4_darkmode.png"),"single physical card selects original single-row source");
    check(planned.source.top==7&&planned.source.bottom==49,"single physical card never selects a combined source section");
   }else{
    for(int column=0;column<4;column++){
     check((planned.pixels.getRGB(centers[column],21)>>>24)==254,"production plan preserves tall upper SIM bars");
     check((planned.pixels.getRGB(centers[column],32)>>>24)==(column==0?254:92),"production plan preserves short lower SIM dots and independent level");
    }
    check(near(layout.plan.rows[0].signal.height,26)&&near(layout.plan.rows[1].signal.y,28)&&near(layout.plan.rows[1].signal.height,9),"production plan consumes the complete 47 by 37 artwork exactly once");
   }
   check(planned.stack.isEmpty(),"production painter restores the transformed canvas");
  }
  check(BitmapFactory.threads.stream().allMatch("LS-ios-signal"::equals),"all decode work stays off UI/layout/draw threads");
  check(android.content.res.AssetManager.threads.stream().allMatch("LS-ios-signal"::equals),"all asset opens stay off UI/layout/draw threads");
  check(!IosSignalAssets.ready(systemui,"missing.png",ready),"missing material fails closed");await();
  check(!IosSignalAssets.ready(systemui,"missing.png",ready)&&android.os.Handler.pending.isEmpty(),"failed decode is cached rather than retried each draw");
  if(args.length>1)renderStyles(systemui,painter,ready,args[1]);
  if(args.length>2)renderSpacing(systemui,painter,ready,args[2]);
  System.out.println("PASS production iOS signal assets/policy/painter: "+checks+" assertions");
 }
}'''
}
with tempfile.TemporaryDirectory(prefix='duo-ios-signal-') as folder:
    folder = Path(folder)
    sources = []
    for name, code in FILES.items():
        path = folder / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(code, encoding='utf-8')
        sources.append(str(path))
    sources.extend(str(ROOT / 'android/app/src/main/java/ls/augment/com' / name)
                   for name in ['IosSignalPolicy.java', 'IosSignalAssets.java', 'IosSignalPainter.java',
                                'DualSignalLayout.java', 'DualSignalPainter.java', 'ArtworkLayers.java'])
    subprocess.run([str(JAVA / 'javac.exe'), '-encoding', 'UTF-8', '-d', str(folder), *sources], check=True)
    for output in (args.render, args.render_spacing):
        if output:
            output.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run([str(JAVA / 'java.exe'), '-Djava.awt.headless=true', '-cp', str(folder),
                    'TestIosSignal', str(assets), *([str(args.render or args.render_spacing)] if args.render or args.render_spacing else []),
                    *([str(args.render_spacing)] if args.render_spacing else [])], check=True)
