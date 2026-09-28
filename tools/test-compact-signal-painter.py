"""Run the production painter against a recording canvas and optionally render its paths."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
files = {
    'android/graphics/Paint.java': '''package android.graphics;
public class Paint {public static final int ANTI_ALIAS_FLAG=1;public int color;
 public Paint(int flags){}public void setColor(int c){color=c;}}
''',
    'android/graphics/Canvas.java': '''package android.graphics;
import java.util.*;import java.awt.*;import java.awt.geom.*;import java.awt.image.*;
public class Canvas {
 public record Bar(float l,float t,float r,float b,float rx,float ry,int color){}
 public final List<Bar> bars=new ArrayList<>();
 public void drawRoundRect(float l,float t,float r,float b,float rx,float ry,Paint p){bars.add(new Bar(l,t,r,b,rx,ry,p.color));}
 public void png(String path)throws Exception{
  BufferedImage image=new BufferedImage(640,240,BufferedImage.TYPE_INT_ARGB);Graphics2D g=image.createGraphics();
  g.setColor(Color.WHITE);g.fillRect(0,0,640,240);
  g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
  for(Bar b:bars){g.setColor(new Color(b.color,true));g.fill(new RoundRectangle2D.Float(b.l,b.t,b.r-b.l,b.b-b.t,2*b.rx,2*b.ry));}
  g.dispose();javax.imageio.ImageIO.write(image,"png",new java.io.File(path));
 }
}
'''.replace('public final List<Bar>', 'public final java.util.List<Bar>'),
    'TestCompactSignal.java': '''import android.graphics.*;import ls.augment.com.CompactSignalPainter;
public class TestCompactSignal {
 static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static boolean near(float a,float b){return Math.abs(a-b)<.001;}
 public static void main(String[] args)throws Exception{
  CompactSignalPainter painter=new CompactSignalPainter();
  for(int count:new int[]{4,5})for(int rows:new int[]{1,2})for(int level=0;level<=count;level++){
   Canvas c=new Canvas();painter.draw(c,7,11,107,82,level,count-level,count,count,rows,0xff112233,28);
   check(c.bars.size()==count*rows,"native four/five-bar count retained");
   for(int row=0;row<rows;row++)for(int i=0;i<count;i++){
    Canvas.Bar b=c.bars.get(row*count+i);
    check(b.l()>=7&&b.r()<=114.001&&b.t()>=11&&b.b()<=93.001,"all bars in bounds");
    check(near(b.rx(),0)&&near(b.ry(),0),"rectangular supplied material");
    if(i==0)check(b.b()-b.t()>0,"shortest bar visible");
    else {Canvas.Bar previous=c.bars.get(row*count+i-1);check(previous.r()<b.l()&&previous.t()>b.t()&&near(previous.b(),b.b()),"separate progressively taller bars share baseline");}
    int lit=row==0?level:count-level;check(b.color()==(i<lit?0xff112233:0x47112233),"independent SIM level and inactive tint");
   }
   if(rows==2)check(c.bars.get(count-1).b()<c.bars.get(2*count-1).t(),"rows never touch");
  }
  for(int color:new int[]{0xff000000,0xffffffff}){
   Canvas dual=new Canvas();painter.draw(dual,0,0,107,85,5,2,5,5,2,color,28);
   check(dual.bars.size()==10,"light and dark both retain two SIM rows");
   check(dual.bars.get(0).color()==color&&dual.bars.get(6).color()==color,"active tint follows light/dark");
   check(near(dual.bars.get(4).b(),40.5f)&&near(dual.bars.get(9).t(),44.5f),"supplied 4 pixel row gap");
  }
  Canvas empty=new Canvas();painter.draw(empty,0,0,0,20,4,4,2,-1,28);check(empty.bars.isEmpty(),"unmeasured icon draws nothing");
  if(args.length>0){Canvas preview=new Canvas();painter.draw(preview,40,50,160.5f,123,5,5,5,5,2,0xff202124,28);
   painter.draw(preview,260,50,160.5f,123,4,2,5,5,2,0xff1264eb,28);
   painter.draw(preview,500,95,40,30.77f,5,3,5,5,2,0xff202124,28);preview.png(args[0]);}
  System.out.println("PASS compact signal painter: "+checks+" checks");
 }
}
''',
    'ls/augment/com/CompactSignalPainter.java': (ROOT / 'android/app/src/main/java/ls/augment/com/CompactSignalPainter.java').read_text(encoding='utf-8'),
}
with tempfile.TemporaryDirectory(prefix='duo-signal-') as tmp:
    sources = []
    for name, source in files.items():
        path = Path(tmp) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        sources.append(str(path))
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', tmp, *sources], check=True)
    subprocess.run(['java', '-Djava.awt.headless=true', '-cp', tmp, 'TestCompactSignal', *sys.argv[1:]], check=True)
