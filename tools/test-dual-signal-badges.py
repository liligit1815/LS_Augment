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
   DualSignalLayout layout=new DualSignalLayout(85,arrows);Canvas canvas=new Canvas();
   painter.draw(canvas,0,0,layout,a,b-1,a,b,rows,color,activity);
   int count=rows==2?a+b:a;
   int expectedArrows=!arrows?0:activity==3?2:activity==1||activity==2?1:0;
   check(canvas.marks.size()==count+expectedArrows,"only actual per-subscription traffic draws arrows");
   for(int i=0;i<count;i++){
    var mark=canvas.marks.get(i);var bounds=mark.bounds();
    check(bounds.getMinX()>=0&&bounds.getMaxX()<=108&&bounds.getMinY()>=0&&bounds.getMaxY()<=85,"signal ink in fixed box");
    check(Math.abs(bounds.getWidth()-15.5)<.001,"every bar has reference width");
    check(bounds.getHeight()>=17.5,"shortest reference bar remains legible");
    if(rows==1)check(bounds.getMinY()>=45,"single SIM uses lower reference row only");
    if(rows==2&&a==b&&i<a){var lower=canvas.marks.get(a+i).bounds();check(lower.getX()==bounds.getX(),"dual columns exactly aligned");}
   }
   check(canvas.stack.isEmpty(),"canvas state restored");
   for(int i=count;i<canvas.marks.size();i++)check(canvas.marks.get(i).color()==color,"active arrows retain native tint");
  }
  for(int row:new int[]{-1,0,1}){
   Canvas c=new Canvas();painter.draw(c,0,0,new DualSignalLayout(85,true),4,3,4,4,2,0xffffffff,3,row,null);
   check(c.marks.size()==(row<0?8:10),"no activity owner never invents a data SIM");
   for(int i=8;i<c.marks.size();i++){
    var box=c.marks.get(i).bounds();
    check(row==0?box.getMaxY()<45:box.getMinY()>=44,"traffic arrows follow the active SIM row");
   }
  }
  for(int rows:new int[]{1,2})for(boolean arrows:new boolean[]{false,true})for(float aspect:new float[]{0,.8f,1.5f,2.5f}){
   DualSignalLayout layout=new DualSignalLayout(85,arrows,aspect);Canvas c=new Canvas();java.util.List<Integer> labels=new java.util.ArrayList<>();
   painter.draw(c,0,0,layout,5,4,5,5,rows,0xff333333,3,(target,index,x,y,w,h,color)->{
    labels.add(index);check(x+w<layout.signalX,"type label never overlaps signal or arrows");
    check(y+h<=85&&y>=0,"labels inside icon height");
    check(rows==2||y>=45,"single SIM label stays in lower row");
    check(color==0xff333333,"type uses same native tint");
   });
   check(labels.size()==(aspect>0?rows:0),"one independent network-type badge per visible SIM");
   if(rows==2&&aspect>0)check(labels.get(0)==0&&labels.get(1)==1,"type labels preserve data/secondary row identity");
   check(Math.abs(layout.width-layout.signalX-108)<.001,"type adds separate column without distorting bars");
  }
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
