"""Exercise new physical region geometry, full app fit and independent upper capacity."""
import os,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=r'''
package ls.augment.com.step;
public class Regions {
 static int checks;
 static void check(boolean pass,String message){checks++;if(!pass)throw new AssertionError(message);}
 static void near(float a,float b,float error,String why){check(Math.abs(a-b)<=error,why+" "+a+" "+b);}
 public static void main(String[] args){
  for(int[] screen:new int[][]{{1216,2688},{1080,2400},{1440,3200},{1600,2560}})
   for(float density:new float[]{2f,2.75f,3.25f})for(int count=3;count<=5;count++)
    for(boolean left:new boolean[]{false,true}){
     WorkspaceLayout l=WorkspaceLayout.create(screen[0],screen[1],density,left,count,24,true);
     check(l.gap==0 && l.reflow,"no workspace gutter");near(l.contentHeight,l.width*9/16f,.5f,"fixed 16:9 content");
     check(l.contentHeight+l.railHeight==l.height,"regions tile screen");
     near(l.mainLogicalHeight*l.mainScale,l.railHeight,.5f,"main native reflow fills height");
     near(l.width*l.mainScale+l.sideWidth,l.width,.1f,"main and side tile width");
     check(left?l.mainX==l.sideWidth && l.sideX==0:l.mainX==0 && l.sideX==l.width-l.sideWidth,"both positions exact");
     int end=0;
     for(int n=0;n<count;n++){
      check(l.rowTop(n,count)==end,"adjacent slots meet");end+=l.rowHeight(n,count);
      PreviewGeometry fit=new PreviewGeometry(l.width,l.height,l.sideWidth,l.rowHeight(n,count));
      check(fit.x<=1 && fit.y<=1.5f,"side margins at most pixel rounding");
      near(fit.scale*l.width+2*fit.x,l.sideWidth,.01f,"side preserves full width");
      near(fit.scale*l.height+2*fit.y,l.rowHeight(n,count),.01f,"side preserves full height");
     }
     check(end==l.railHeight,"all side rows cover body");
    }
  check(WorkspaceCapacity.fitsLayout(5,true),"five sides with upper allowed");
  check(WorkspaceCapacity.canAdd(5,false) && !WorkspaceCapacity.canAdd(5,true),"upper is sixth independent slot");
  WorkspaceLayout old=WorkspaceLayout.create(1216,2688,3.25f,false,3,0,false);
  check(!old.reflow,"missing native capability retains established geometry");
  System.out.println("PASS "+checks+" seamless region and native viewport assertions");
 }
}
'''
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-regions-') as directory:
 p=Path(directory);sourcefile=p/'Regions.java';sourcefile.write_text(source,encoding='utf-8')
 subprocess.run([java/'javac','-encoding','UTF-8','-d',p,sourcefile]+[STEP/(n+'.java') for n in ['WorkspaceLayout','PreviewGeometry','SideSlots','WorkspaceCapacity']],check=True)
 subprocess.run([java/'java','-cp',p,'ls.augment.com.step.Regions'],check=True)
