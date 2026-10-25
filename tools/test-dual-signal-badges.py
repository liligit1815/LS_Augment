"""Exercise the production combined painter: all badge toggles, colors and bar counts."""
import ast
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
tree = ast.parse((ROOT / 'tools/test-bluetooth-icon-runtime.py').read_text(encoding='utf-8'))
facade = next(ast.literal_eval(node.value) for node in tree.body if isinstance(node, ast.Assign)
              and any(isinstance(t, ast.Name) and t.id == 'FILES' for t in node.targets))
files = {k: v for k, v in facade.items() if k.startswith('android/graphics/')}
files['android/graphics/Path.java'] = files['android/graphics/Path.java'].replace(
    'public void moveTo', 'public void quadTo(float a,float b,float c,float d){shape.quadTo(a,b,c,d);}public void close(){shape.closePath();}public void moveTo')
files['android/graphics/Canvas.java'] = files['android/graphics/Canvas.java'].replace(
    'public Canvas(){', '''public record Mark(java.awt.geom.Rectangle2D bounds,int color){}
 public java.util.List<Mark> marks=new ArrayList<>();
 public void drawRoundRect(float l,float t,float r,float b,float rx,float ry,Paint p){
   paint(new RoundRectangle2D.Float(l,t,r-l,b-t,rx*2,ry*2),p);}
 public Canvas(){''').replace('lastColor=p.color;g.setColor',
    'marks.add(new Mark(g.getTransform().createTransformedShape(shape).getBounds2D(),p.color));lastColor=p.color;g.setColor', 1)
files['TestDual.java'] = r'''import android.graphics.*;import ls.augment.com.*;
public class TestDual {
 static int checks;
 static void check(boolean value,String name){checks++;if(!value)throw new AssertionError(name);}
 static void label(Canvas c,int row,float x,float y,float w,float h,int color){
  String text=row==0?"5A":"4G";
  c.g.setColor(new java.awt.Color(color,true));c.g.setFont(new java.awt.Font("SansSerif",java.awt.Font.BOLD,1).deriveFont(h));
  java.awt.Shape glyph=c.g.getFont().createGlyphVector(c.g.getFontRenderContext(),text).getOutline();var bounds=glyph.getBounds2D();
  var tx=new java.awt.geom.AffineTransform();tx.translate(x,y);tx.scale(w/bounds.getWidth(),h/bounds.getHeight());tx.translate(-bounds.getX(),-bounds.getY());c.g.fill(tx.createTransformedShape(glyph));
 }
 public static void main(String[] args)throws Exception{
  DualSignalPainter painter=new DualSignalPainter();
  for(int rows:new int[]{1,2})for(boolean arrows:new boolean[]{false,true})
  for(int a:new int[]{4,5})for(int b:new int[]{4,5})for(int activity=0;activity<=4;activity++)
  for(int color:new int[]{0x99000000,0xd8ffffff}){
   DualSignalLayout layout=rows==1?DualSignalLayout.single(35,arrows,0):new DualSignalLayout(75,arrows);Canvas canvas=new Canvas();
   painter.draw(canvas,0,0,layout,a,b-1,a,b,rows,color,activity);
   int count=rows==2?a+b:a;
   int expectedArrows=!arrows?0:activity==3?2:activity==1||activity==2?1:0;
   check(canvas.marks.size()==count+expectedArrows,"only actual per-subscription traffic draws arrows");
   for(int i=0;i<count;i++){
    var mark=canvas.marks.get(i);var bounds=mark.bounds();
    check(bounds.getMinX()>=0&&bounds.getMaxX()<=85&&bounds.getMinY()>=0&&bounds.getMaxY()<=75,"narrow Honor signal ink stays in its fixed-height box");
    check(Math.abs(bounds.getWidth()-12.5)<.001,"every Honor column has a slimmer consistent width");
    check(bounds.getHeight()>=15,"shortest reference bar remains legible");
    if(rows==1)check(bounds.getMinY()>=0&&bounds.getMaxY()<=35,"single SIM consumes only one row without upper whitespace");
    if(rows==2&&a==b&&i<a){var lower=canvas.marks.get(a+i).bounds();check(lower.getX()==bounds.getX(),"dual columns exactly aligned");}
   }
   check(canvas.stack.isEmpty(),"canvas state restored");
   for(int i=count;i<canvas.marks.size();i++){
    check(canvas.marks.get(i).color()==color,"active arrows retain native tint");
    for(int j=0;j<count;j++)check(!canvas.marks.get(i).bounds().intersects(canvas.marks.get(j).bounds()),"slimmer Honor rows leave clear space around both inset traffic arrows");
   }
  }
  for(int row:new int[]{-1,0,1}){
   Canvas c=new Canvas();painter.draw(c,0,0,new DualSignalLayout(75,true),4,3,4,4,2,0xffffffff,3,row,null);
   check(c.marks.size()==(row<0?8:10),"no activity owner never invents a data SIM");
   for(int i=8;i<c.marks.size();i++){
    var box=c.marks.get(i).bounds();
    check(row==0?box.getMaxY()<35:box.getMinY()>=40,"traffic arrows follow the active SIM row");
   }
  }
  for(int rows:new int[]{1,2})for(boolean arrows:new boolean[]{false,true})for(float aspect:new float[]{0,.8f,1.5f,2.5f}){
   DualSignalLayout layout=rows==1?DualSignalLayout.single(35,arrows,aspect):new DualSignalLayout(75,arrows,aspect);Canvas c=new Canvas();java.util.List<Integer> labels=new java.util.ArrayList<>();
   painter.draw(c,0,0,layout,5,4,5,5,rows,0xff333333,3,(target,index,x,y,w,h,color)->{
    labels.add(index);check(x+w<layout.signalX,"type label never overlaps signal or arrows");
    check(y+h<=75&&y>=0,"labels inside icon height");
    check(rows==2||y>=0&&y+h<=35,"single SIM label stays inside the one real row");
    check(color==0xff333333,"type uses same native tint");
   });
   check(labels.size()==(aspect>0?rows:0),"one independent network-type badge per visible SIM");
   if(rows==2&&aspect>0)check(labels.get(0)==0&&labels.get(1)==1,"type labels preserve data/secondary row identity");
   check(Math.abs(layout.width-layout.signalX-86)<.001,"type adds separate column without widening the compact bars");
  }
  for(int slot:new int[]{0,1})for(boolean rtl:new boolean[]{false,true})for(boolean spaced:new boolean[]{false,true}){
   DualSignalLayout one=DualSignalLayout.spaced(24,true,new int[]{slot},new float[][]{{1.2f,.5f,.6f}},0,
     (physical,part)->spaced?new StatusBarIconSpacingSpec.Insets(1,2,3,4):StatusBarIconSpacingSpec.ZERO,1,rtl);
   check(one.plan.rows.length==1&&one.plan.rows[0].slot==slot,"one actual subscription produces one physical row");
   check(one.plan.rows[0].signal.y==(spaced?2:0),"single signal starts at its configured top boundary, never at a second-row offset");
   check(Math.abs(one.height-(spaced?30:24))<.001,"single row reserves actual vertical boundaries exactly once");
   Canvas c=new Canvas();painter.drawSpaced(c,0,0,one,4,0,4,4,0xff333333,3,0,null);
   check(c.marks.size()==6,"single spaced painter contains four signal columns and two actual traffic arrows");
   for(var mark:c.marks)check(mark.bounds().getMinY()>=0&&mark.bounds().getMaxY()<=one.height+.001,"every one-row signal and activity mark lies in its allocated height");
  }
  for(int rows:new int[]{1,2})for(boolean arrows:new boolean[]{false,true})for(int active=0;active<rows;active++)for(boolean spaced:new boolean[]{false,true}){
   int[] slots=rows==1?new int[]{1}:new int[]{0,1};float[][] aspects=rows==1?new float[][]{{1.2f,.5f,.6f}}:new float[][]{{1.2f,.5f,.6f},{.8f,0,.6f}};
   DualSignalLayout ios=DualSignalLayout.spaced(rows==1?24:42,arrows,slots,aspects,active,
     (slot,part)->spaced?new StatusBarIconSpacingSpec.Insets(1,2,3,4):StatusBarIconSpacingSpec.ZERO,1,false,true);
   int[] pngs={0};Canvas c=new Canvas();painter.setArtwork((target,id,layer,l,t,r,b,color)->{
    if(!id.startsWith("row")||!layer.equals("whole"))return false;
    int row=Integer.parseInt(id.substring(3,4));pngs[0]++;
    float expectedHeight=rows==1?42:row==0?26:9;
    check(Math.abs((r-l)/(b-t)-47f/expectedHeight)<.001,"production painter preserves each original asymmetric iOS crop aspect");
    check(Math.abs((r-l)-47)<.001&&Math.abs((b-t)-expectedHeight)<.001,"the artwork receives exactly its source crop units");return true;
   });
   painter.drawSpaced(c,0,0,ios,5,3,5,4,0xff123456,3,active,null);
   check(pngs[0]==rows,"each physical iOS SIM draws one real PNG row");
   check(c.marks.size()==(arrows?2:0),"PNG never falls through to duplicate Honor bars");
   if(rows==2){var upper=ios.plan.rows[0];var lower=ios.plan.rows[1];float u=ios.unit();
    check(Math.abs(upper.signal.height/u-26)<.001&&Math.abs(lower.signal.height/u-9)<.001,"iOS upper bars and lower dots use distinct heights");
    check(Math.abs(upper.badges[0].height-lower.badges[0].height)<.001,"both SIM type badges stay equally readable despite the short lower dots");
    if(!spaced)check(Math.abs(lower.signal.y-(upper.signal.y+upper.signal.height)-2*u)<.001,"the supplied iOS two-pixel gutter is preserved");
   }
   for(var row:ios.plan.rows){check(row.signal.x>=0&&row.signal.y>=0&&row.signal.x+row.signal.width<=ios.width+.001&&row.signal.y+row.signal.height<=ios.height+.001,"asymmetric signal crop remains inside the allocated complete glyph");}
   for(var mark:c.marks){var arrow=ios.plan.rows[active].activity;var signal=ios.plan.rows[active].signal;
    check(mark.bounds().getMinX()>=arrow.x-.001&&mark.bounds().getMaxX()<=arrow.x+arrow.width+.001,"iOS activity stays inside its measured column");
    check(mark.bounds().getMaxX()<=signal.x+.001,"iOS activity never overlaps the narrower supplied bars");
    check(mark.bounds().getMinY()>=0&&mark.bounds().getMaxY()<=ios.height+.001,"iOS arrows remain inside the corresponding actual row");
   }
   if(!spaced){
    var arrow=ios.plan.rows[active].activity;var signal=ios.plan.rows[active].signal;float u=ios.unit();
    if(arrows){
     check(Math.abs(signal.x-(arrow.x+arrow.width)-2*u)<.001,"iOS arrow-to-signal default gutter is a compact two source units");
     float lastBadge=0;for(var badge:ios.plan.rows[0].badges)if(badge!=null)lastBadge=Math.max(lastBadge,badge.x+badge.width);
     check(Math.abs(arrow.x-lastBadge-2*u)<.001,"iOS badge-to-arrow default gutter is two source units");
     check(rows==1||Math.abs(arrow.height-14*u)<.001,"dual iOS traffic arrows use compact height without changing signal height");
     if(rows==2)check((signal.x-lastBadge)/u<25,"idle reserved traffic frame is under 25 source units rather than 36");
     Canvas idle=new Canvas();painter.drawSpaced(idle,0,0,ios,5,3,5,4,0xff123456,0,active,null);
     check(idle.marks.isEmpty(),"idle activity draws no ghost arrows while preserving the same compact frame");
    }
   }
  }
  for(boolean iosStyle:new boolean[]{false,true}){
   DualSignalLayout small=DualSignalLayout.spaced(30,false,new int[]{0,1},new float[][]{{0,0,0},{0,0,0}},-1,null,1,false,iosStyle);
   DualSignalLayout large=DualSignalLayout.spaced(60,false,new int[]{0,1},new float[][]{{0,0,0},{0,0,0}},-1,null,1,false,iosStyle);
   for(int r=0;r<2;r++){
    var a=small.plan.rows[r].signal;var b=large.plan.rows[r].signal;
    check(Math.abs(b.width/a.width-2)<.001&&Math.abs(b.height/a.height-2)<.001,"matching nearby icon height scales both axes uniformly for either style");
    check(Math.abs(b.y-a.y*2)<.001,"both native SIM baselines use the same uniform scale");
   }
  }
  DualSignalLayout asymmetric=DualSignalLayout.spaced(37,false,new int[]{1,0},new float[][]{{1,0,0},{1,0,0}},-1,
    (slot,part)->part.equals("signal")?(slot==1?new StatusBarIconSpacingSpec.Insets(1,2,3,4):new StatusBarIconSpacingSpec.Insets(5,6,7,8)):StatusBarIconSpacingSpec.ZERO,1,false,true);
  check(asymmetric.plan.rows[0].slot==1&&asymmetric.plan.rows[1].slot==0,"asymmetric iOS crop order keeps actual physical SIM identity");
  check(Math.abs(asymmetric.plan.rows[0].signal.y-2)<.001&&Math.abs(asymmetric.plan.rows[1].signal.y-40)<.001,"each iOS row applies its own boundaries while retaining the supplied compact baseline");
  check(Math.abs(asymmetric.height-57)<.001,"custom vertical boundaries are reserved once per physical SIM");
  painter.setArtwork(null);
  if(args.length>0){Canvas preview=new Canvas();preview.g.setColor(java.awt.Color.WHITE);preview.g.fillRect(0,0,700,180);
   preview.g.setColor(java.awt.Color.BLACK);preview.g.fillRect(0,180,700,180);
   for(int theme=0;theme<2;theme++)for(int mode=0;mode<3;mode++){
    int color=theme==0?0x99000000:0xd8ffffff;DualSignalLayout layout=new DualSignalLayout(85,true,mode==0?0:1.5f);
    painter.draw(preview,20+mode*225,20+theme*180,layout,5,5,5,5,mode==2?1:2,color,3,TestDual::label);
    painter.draw(preview,20+mode*225,135+theme*180,new DualSignalLayout(24,true,mode==0?0:1.5f),5,5,5,5,mode==2?1:2,color,3,TestDual::label);
   }preview.png(args[0]);}
  if(args.length>1){Canvas reference=new Canvas();painter.draw(reference,3,16,new DualSignalLayout(85,true),5,5,5,5,2,0xff000000,3);reference.png(args[1]);}
  System.out.println("PASS reference dual/single SIM: "+checks+" assertions");
 }
}'''
with tempfile.TemporaryDirectory(prefix='dual-signal-') as tmp:
    paths=[]
    for name, content in files.items():
        path=Path(tmp)/name
        path.parent.mkdir(parents=True,exist_ok=True)
        path.write_text(content,encoding='utf-8')
        paths.append(str(path))
    src=ROOT/'android/app/src/main/java/ls/augment/com'
    subprocess.run(['javac','-encoding','UTF-8','-d',tmp,*paths,
                    *[str(src/name) for name in ['ArtworkLayers.java','CompactSignalPainter.java','DualSignalLayout.java','DualSignalPainter.java',
                                                'StatusBarIconSpacingSpec.java','StatusBarIconCatalog.java','StatusBarSurfaceSpec.java']]],check=True)
    subprocess.run(['java','-Djava.awt.headless=true','-cp',tmp,'TestDual',*sys.argv[1:]],check=True)
