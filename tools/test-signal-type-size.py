"""Run actual OEM badge cropping/drawing and layout with recorded/rasterized output.

Android graphics are a Java2D facade, not a phone/GPU. Both production classes
are compiled unchanged. Negative controls require actual drawing assertions to
reject per-row shrinking and shrinking both rows to fit HD/roaming content.
"""
from pathlib import Path
import argparse
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'


def sources():
    tree = ast.parse((ROOT / 'tools/test-bluetooth-icon-runtime.py').read_text(encoding='utf-8'))
    shared = next(ast.literal_eval(n.value) for n in tree.body if isinstance(n, ast.Assign)
                  and any(isinstance(t, ast.Name) and t.id == 'FILES' for t in n.targets))
    files = {k: v for k, v in shared.items() if k.startswith('android/graphics/')}
    files['android/graphics/Rect.java'] = files['android/graphics/Rect.java'].rsplit('}', 1)[0] + '''
 public Rect(Rect r){this(r.left,r.top,r.right,r.bottom);}public int height(){return bottom-top;}
 public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}}
'''
    files['android/graphics/RectF.java'] = files['android/graphics/RectF.java'].rsplit('}', 1)[0] + '''
 public RectF(){}public RectF(float l,float t,float r,float b){set(l,t,r,b);}public float height(){return bottom-top;}}
'''
    files['android/graphics/Paint.java'] = files['android/graphics/Paint.java'].rsplit('}', 1)[0] + '''
 public static final int FILTER_BITMAP_FLAG=2;public PorterDuffColorFilter filter;
 public void setColorFilter(PorterDuffColorFilter value){filter=value;}}
'''
    files['android/graphics/PorterDuff.java'] = 'package android.graphics;public class PorterDuff {public enum Mode {SRC_IN}}'
    files['android/graphics/PorterDuffColorFilter.java'] = 'package android.graphics;public class PorterDuffColorFilter {public final int color;public PorterDuffColorFilter(int c,PorterDuff.Mode m){color=c;}}'
    files['android/graphics/Bitmap.java'] = '''package android.graphics;import java.awt.image.*;
public class Bitmap {public enum Config{ARGB_8888}public final BufferedImage image;public boolean recycled;
 public Bitmap(BufferedImage pixels){image=pixels;}public int getWidth(){return image.getWidth();}public int getHeight(){return image.getHeight();}
 public static Bitmap createBitmap(int w,int h,Config c){return new Bitmap(new BufferedImage(w,h,BufferedImage.TYPE_INT_ARGB));}
 public static Bitmap createBitmap(Bitmap b,int l,int t,int w,int h){if(l==0&&t==0&&w==b.getWidth()&&h==b.getHeight())return b;
  Bitmap copy=createBitmap(w,h,Config.ARGB_8888);copy.image.setRGB(0,0,w,h,b.image.getRGB(l,t,w,h,null,0,w),0,w);return copy;}
 public void getPixels(int[] pixels,int offset,int stride,int x,int y,int w,int h){image.getRGB(x,y,w,h,pixels,offset,stride);}public void recycle(){recycled=true;}}
'''
    files['android/graphics/Canvas.java'] = files['android/graphics/Canvas.java'].replace(
        'public Canvas(){', 'public Canvas(Bitmap b){image=b.image;g=image.createGraphics();}public Canvas(){').rsplit('}', 1)[0] + '''
 public RectF lastBitmap;public int bitmapDraws;
 public void drawBitmap(Bitmap bitmap,Rect source,RectF target,Paint p){
  if(bitmap.recycled)throw new AssertionError("recycled artwork");bitmapDraws++;lastBitmap=new RectF(target.left,target.top,target.right,target.bottom);
  BufferedImage image=bitmap.image;
  if(p!=null&&p.filter!=null){image=new BufferedImage(bitmap.getWidth(),bitmap.getHeight(),BufferedImage.TYPE_INT_ARGB);int color=p.filter.color;
   for(int y=0;y<image.getHeight();y++)for(int x=0;x<image.getWidth();x++)image.setRGB(x,y,(((bitmap.image.getRGB(x,y)>>>24)*(color>>>24)/255)<<24)|(color&0xffffff));}
  AffineTransform transform=new AffineTransform();transform.translate(target.left,target.top);transform.scale(target.width()/bitmap.getWidth(),target.height()/bitmap.getHeight());
  g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,RenderingHints.VALUE_INTERPOLATION_BILINEAR);g.drawImage(image,transform,null);
 }}
'''
    files['android/content/res/Resources.java'] = 'package android.content.res;public class Resources {}'
    files['android/graphics/drawable/Drawable.java'] = '''package android.graphics.drawable;import android.graphics.*;import android.content.res.Resources;
public abstract class Drawable {private Rect bounds=new Rect(0,0,0,0);public int[] state={};public int level;
 public abstract void draw(Canvas c);public int getIntrinsicWidth(){return -1;}public int getIntrinsicHeight(){return -1;}
 public Rect getBounds(){return bounds;}public void setBounds(int l,int t,int r,int b){bounds.set(l,t,r,b);}public void setBounds(Rect r){bounds=new Rect(r);}
 public int[] getState(){return state;}public int getLevel(){return level;}public void setState(int[] s){state=s;}public void setLevel(int v){level=v;}
 public void clearColorFilter(){}public void setTint(int color){}public void setAlpha(int alpha){}public Drawable mutate(){return this;}
 public ConstantState getConstantState(){return null;}public abstract static class ConstantState{public abstract Drawable newDrawable(Resources r);}}
'''
    files['android/widget/ImageView.java'] = '''package android.widget;import android.graphics.drawable.Drawable;import android.content.res.Resources;
public class ImageView {public Drawable drawable;public int width,height;public ImageView(Drawable d,int w,int h){drawable=d;width=w;height=h;}
 public Drawable getDrawable(){return drawable;}public int getWidth(){return width;}public int getHeight(){return height;}public Resources getResources(){return new Resources();}}
'''
    files['ls/augment/com/hook/StatusBarAssetDrawable.java'] = '''package ls.augment.com.hook;import android.graphics.*;import android.graphics.drawable.Drawable;
class StatusBarAssetDrawable extends Drawable {final Drawable source;StatusBarAssetDrawable(Drawable d){source=d;}Drawable original(){return source;}public void draw(Canvas c){throw new AssertionError("custom wrapper must be unwrapped");}}
'''
    files['ls/augment/com/hook/TestSignalTypeSize.java'] = HARNESS
    return files


HARNESS = r'''package ls.augment.com.hook;
import android.graphics.*;import android.graphics.drawable.Drawable;import android.widget.ImageView;import ls.augment.com.*;
public class TestSignalTypeSize {
 static int checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static void near(float a,float b,String why){check(Math.abs(a-b)<.002f,why+": "+a+" / "+b);}
 static class InkDrawable extends Drawable {
  final Bitmap image;final boolean constant,intrinsic;int draws;
  InkDrawable(Bitmap image,boolean constant,boolean intrinsic){this.image=image;this.constant=constant;this.intrinsic=intrinsic;}
  public int getIntrinsicWidth(){return intrinsic?image.getWidth():-1;}public int getIntrinsicHeight(){return intrinsic?image.getHeight():-1;}
  public void draw(Canvas c){draws++;Rect b=getBounds();c.drawBitmap(image,null,new RectF(b.left,b.top,b.right,b.bottom),new Paint(1));}
  public ConstantState getConstantState(){return constant?new ConstantState(){public Drawable newDrawable(android.content.res.Resources r){return new InkDrawable(image,true,intrinsic);}}:null;}
 }
 static class SubclassDrawable extends InkDrawable {SubclassDrawable(Bitmap b,boolean c,boolean i){super(b,c,i);}}
 static Bitmap glyph(String label,int scale,int padding){
  java.awt.Font font=new java.awt.Font("SansSerif",java.awt.Font.BOLD,48);
  Bitmap scratch=Bitmap.createBitmap(256,100,Bitmap.Config.ARGB_8888);var g=scratch.image.createGraphics();
  var shape=font.createGlyphVector(g.getFontRenderContext(),label).getOutline();var ink=shape.getBounds2D();g.dispose();
  Bitmap result=Bitmap.createBitmap((int)Math.ceil(ink.getWidth()*scale)+padding*2,(int)Math.ceil(ink.getHeight()*scale)+padding*2,Bitmap.Config.ARGB_8888);
  g=result.image.createGraphics();g.setColor(java.awt.Color.WHITE);g.translate(padding,padding);g.scale(scale,scale);g.translate(-ink.getX(),-ink.getY());g.fill(shape);g.dispose();return result;
 }
 static SignalTypeBadge badge(Bitmap pixels,boolean modern,boolean subclass,boolean intrinsic,boolean wrapped){
  InkDrawable d=subclass?new SubclassDrawable(pixels,modern,intrinsic):new InkDrawable(pixels,modern,intrinsic);d.setBounds(7,9,25,31);
  Drawable source=wrapped?new StatusBarAssetDrawable(new StatusBarAssetDrawable(d)):d;
  ImageView view=new ImageView(source,pixels.getWidth(),pixels.getHeight());SignalTypeBadge badge=new SignalTypeBadge();badge.refresh(view);
  check(d.getBounds().left==7&&d.getBounds().top==9&&d.getBounds().right==25&&d.getBounds().bottom==31,"old non-clonable bounds mutated");
  int draws=d.draws;badge.refresh(view);check(d.draws==draws,"unchanged native artwork rerasterized");return badge;
 }
 static RectF draw(SignalTypeBadge badge,DualSignalLayout.Box box){
  Canvas canvas=new Canvas(Bitmap.createBitmap(256,160,Bitmap.Config.ARGB_8888));badge.draw(canvas,0,0,box.width,box.height,0xffffffff);
  check(canvas.bitmapDraws==1,"visible network type missing");return canvas.lastBitmap;
 }
 static Rect pixels(SignalTypeBadge badge,DualSignalLayout.Box box,int color){
  Canvas canvas=new Canvas(Bitmap.createBitmap(256,160,Bitmap.Config.ARGB_8888));badge.draw(canvas,8,8,box.width,box.height,color);
  int l=256,t=160,r=0,b=0;for(int y=0;y<160;y++)for(int x=0;x<256;x++)if((canvas.image.getRGB(x,y)>>>24)>16){l=Math.min(l,x);t=Math.min(t,y);r=Math.max(r,x+1);b=Math.max(b,y+1);}
  check(r>l&&b>t,"actual raster has no visible type ink");return new Rect(l,t,r,b);
 }
 static DualSignalLayout layout(boolean ios,int rows,boolean rtl,float scale,boolean spaced,float[][] aspects){
  return DualSignalLayout.spaced((rows==1?24:ios?37:75)*scale,true,rows==1?new int[]{1}:new int[]{1,0},aspects,rows-1,
   (slot,part)->spaced?new StatusBarIconSpacingSpec.Insets(slot+1,2,3,1):StatusBarIconSpacingSpec.ZERO,scale,rtl,ios);
 }
 public static void main(String[] args)throws Exception{
  SignalTypeBadge five=badge(glyph("5G",1,3),true,false,true,false);
  SignalTypeBadge padded=badge(glyph("5G",2,15),false,true,false,true);
  SignalTypeBadge four=badge(glyph("4G",1,7),true,true,true,false);
  SignalTypeBadge plus=badge(glyph("5G+",1,7),false,false,true,false);
  for(SignalTypeBadge type:new SignalTypeBadge[]{five,padded,four,plus})
  for(boolean ios:new boolean[]{false,true})for(int rows:new int[]{1,2})for(boolean rtl:new boolean[]{false,true})
  for(float scale:new float[]{.75f,1,1.5f})for(boolean spaced:new boolean[]{false,true})for(int mask=0;mask<8;mask++){
   float[][] aspects=rows==1?new float[][]{{type.aspect(),(mask&1)!=0?.65f:0,(mask&2)!=0?1.5f:0}}
    :new float[][]{{type.aspect(),(mask&1)!=0?.65f:0,(mask&2)!=0?1.5f:0},{type.aspect(),0,(mask&4)!=0?2.2f:0}};
   var plan=layout(ios,rows,rtl,scale,spaced,aspects);
   var baseline=layout(ios,rows,rtl,scale,spaced,rows==1?new float[][]{{type.aspect(),0,0}}:new float[][]{{type.aspect(),0,0},{type.aspect(),0,0}});
   float inkHeight=plan.badgeUnits*plan.unit(),firstHeight=-1;
   for(int r=0;r<rows;r++){
    var row=plan.plan.rows[r];var nativeRow=baseline.plan.rows[r];var actual=draw(type,row.badges[0]);
    near(actual.height(),inkHeight,"actual type ink shrank when HD/roaming changed");near(actual.width(),type.aspect()*inkHeight,"type aspect changed");
    near(actual.height(),draw(type,nativeRow.badges[0]).height(),"additional badge changed 5G size");
    if(r==0)firstHeight=actual.height();else near(actual.height(),firstHeight,"SIM rows have different actual ink size");
    near(row.signal.width,nativeRow.signal.width,"signal column width changed");near(row.signal.height,nativeRow.signal.height,"signal column height changed");
    near(row.signal.y,nativeRow.signal.y,"signal baseline changed");near(row.activity.width,nativeRow.activity.width,"traffic size changed");
    float right=-1;for(var box:row.badges)if(box!=null){
     check(box.x>=right-.002&&box.x>=0&&box.y>=0,"badge overlap or negative origin");right=box.x+box.width;
     check(right<=plan.width+.002&&box.y+box.height<=plan.height+.002,"uncropped badge escaped measured bounds");
    }
    check(right<=row.signal.x+.002,"badges overlap signal bars");if(ios&&r==rows-1)check(right<=row.activity.x+.002,"badges overlap activity column");
    check(row.signal.x+row.signal.width<=plan.width+.002,"expanded label column not included in host measurement");
   }
   near(plan.height,baseline.height,"HD/roaming changed row allocation");check(plan.plan.rows[0].slot==1,"physical SIM identity changed");
  }
  // Same visible glyph with different resource density/padding and legacy drawable capabilities.
  var sized=layout(false,2,false,1,false,new float[][]{{five.aspect(),.65f,1.5f},{padded.aspect(),0,0}});
  near(draw(five,sized.plan.rows[0].badges[0]).height(),draw(padded,sized.plan.rows[1].badges[0]).height(),"OEM density/padding altered actual ink height");
  Rect bright=pixels(five,sized.plan.rows[0].badges[0],0xffffffff),dark=pixels(five,sized.plan.rows[0].badges[0],0xff000000);
  Rect second=pixels(padded,sized.plan.rows[1].badges[0],0xffffffff);
  check(bright.width()==dark.width()&&bright.height()==dark.height(),"native tint changed visible glyph bounds");
  check(Math.abs(bright.height()-second.height())<=1&&Math.abs(bright.width()-second.width())<=1,"same glyph at different density/padding rasterized at different sizes");
  SignalTypeBadge absent=new SignalTypeBadge();absent.refresh(null);near(absent.aspect(),0,"missing native type invented a label");
  Canvas empty=new Canvas(Bitmap.createBitmap(16,16,Bitmap.Config.ARGB_8888));absent.draw(empty,0,0,10,10,0xffffffff);check(empty.bitmapDraws==0,"missing interface draws fabricated 5G");
  SignalTypeBadge transparent=badge(Bitmap.createBitmap(20,20,Bitmap.Config.ARGB_8888),false,false,true,false);near(transparent.aspect(),0,"transparent resource invented a badge");
  // Retain the pre-spaced API and its caller-owned combined label box.
  var legacy=new DualSignalLayout(75,false,1.5f);near(legacy.labelWidth,48,"legacy API size changed");near(legacy.signalX,53,"legacy label gap changed");
  var narrow=layout(false,2,false,1,false,new float[][]{{five.aspect(),0,0},{five.aspect(),0,0}});
  near(narrow.plan.rows[0].signal.x,five.aspect()*32+5,"plain two-row layout changed");
  if(args.length>0){Canvas preview=new Canvas();preview.g.setColor(new java.awt.Color(0xff101010,true));preview.g.fillRect(0,0,700,360);
   for(int style=0;style<2;style++){boolean ios=style==1;var p=layout(ios,2,false,1.5f,false,new float[][]{{five.aspect(),.65f,1.5f},{padded.aspect(),0,0}});
    preview.g.setColor(java.awt.Color.WHITE);preview.g.setFont(new java.awt.Font("SansSerif",0,16));preview.g.drawString(ios?"iOS layout - native badge size":"Honor layout - native badge size",20,25+style*170);
    for(int r=0;r<2;r++){var row=p.plan.rows[r];float ox=20,oy=40+style*170;var box=row.badges[0];
     (r==0?five:padded).draw(preview,ox+box.x,oy+box.y,box.width,box.height,0xffffffff);
     if(r==0)for(int i=1;i<3;i++){var mark=row.badges[i];SignalTypeBadge extra=badge(glyph(i==1?"R":"HD",1,4),true,false,true,false);extra.draw(preview,ox+mark.x,oy+mark.y,mark.width,mark.height,0xffaaaaaa);}
     preview.g.setColor(java.awt.Color.WHITE);for(int i=0;i<5;i++){float height=row.signal.height*(i+1)/5;preview.g.fill(new java.awt.geom.RoundRectangle2D.Float(ox+row.signal.x+i*row.signal.width/5,oy+row.signal.y+row.signal.height-height,row.signal.width/7,height,3,3));}
    }
   }preview.png(args[0]);}
  System.out.println("PASS actual signal type ink: "+checks+" assertions; HD/roaming, same glyph across densities, legacy/clone/subclass/wrapped/missing drawables, both styles and layout boundaries");
 }
}'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--render', type=Path)
    args = parser.parse_args()
    java_home = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8'))
    javac = str(java_home / 'bin/javac.exe') if (java_home / 'bin/javac.exe').exists() else 'javac'
    java = str(java_home / 'bin/java.exe') if (java_home / 'bin/java.exe').exists() else 'java'
    if args.render:
        args.render.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='duo-type-size-') as temporary:
        work = Path(temporary)
        files = []
        for name, content in sources().items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding='utf-8')
            files.append(str(path))
        production = [SRC / name for name in ('hook/SignalTypeBadge.java', 'StatusBarIconSpacingSpec.java', 'StatusBarIconCatalog.java', 'StatusBarSurfaceSpec.java')]
        layout = (SRC / 'DualSignalLayout.java').read_text(encoding='utf-8')
        variants = [None,
                    'aspects[r][i]*Math.min(badgeHeight,original.labelWidth/total[r])',
                    'aspects[r][i]*Math.min(badgeHeight,original.labelWidth/max)']
        for index, replacement in enumerate(variants):
            path = work / str(index) / 'DualSignalLayout.java'
            path.parent.mkdir()
            changed = layout if replacement is None else layout.replace('widths[r][i]=aspects[r][i]*badgeHeight;', 'widths[r][i]=' + replacement + ';')
            assert replacement is None or changed != layout, 'mutation anchor missing'
            path.write_text(changed, encoding='utf-8')
            classes = path.parent / 'classes'
            subprocess.run([javac, '-encoding', 'UTF-8', '--release', '17', '-d', str(classes), *files, *map(str, production), str(path)], check=True)
            command = [java, '-Djava.awt.headless=true', '-cp', str(classes), 'ls.augment.com.hook.TestSignalTypeSize']
            if args.render and index == 0:
                command.append(str(args.render.resolve()))
            result = subprocess.run(command, capture_output=True, text=True, timeout=60)
            if index == 0:
                print(result.stdout + result.stderr, end='')
                result.check_returncode()
            else:
                assert result.returncode != 0 and 'actual type ink shrank' in result.stderr, result.stdout + result.stderr
                print('PASS rejected size regression:', 'individual row fit' if index == 1 else 'both rows fit the widest badge group')


if __name__ == '__main__':
    main()
