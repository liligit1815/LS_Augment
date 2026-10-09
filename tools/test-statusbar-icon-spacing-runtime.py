"""Execute production boundary placement/restoration bodies with lightweight view facades.
The facades model Android layout inputs; passing is not on-device visual evidence.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'

def extract(path, marker):
    source = path.read_text(encoding='utf-8')
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

HARNESS = r'''import java.util.*;import ls.augment.com.*;
public class TestIconSpacingRuntime {
 static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}static void close(float a,float b,String why){check(Math.abs(a-b)<.001f,why+":"+a+" != "+b);}
 static class View {static final int LAYOUT_DIRECTION_RTL=1;int direction,requests;float density=1;ViewGroup.MarginLayoutParams params=new ViewGroup.MarginLayoutParams();int getLayoutDirection(){return direction;}Object getLayoutParams(){return params;}void requestLayout(){requests++;}}
 static class ViewGroup extends View {static class MarginLayoutParams {
  int leftMargin=2,topMargin=3,rightMargin=5,bottomMargin=7,start=Integer.MIN_VALUE,end=Integer.MIN_VALUE;
  boolean isMarginRelative(){return start!=Integer.MIN_VALUE||end!=Integer.MIN_VALUE;}int getMarginStart(){return start==Integer.MIN_VALUE?leftMargin:start;}int getMarginEnd(){return end==Integer.MIN_VALUE?rightMargin:end;}
  void setMarginStart(int value){start=value;}void setMarginEnd(int value){end=value;}void resolveLayoutDirection(int dir){if(start!=Integer.MIN_VALUE){if(dir==1)rightMargin=start;else leftMargin=start;}if(end!=Integer.MIN_VALUE){if(dir==1)leftMargin=end;else rightMargin=end;}}
 }}
 static float density(View v){return v.density;}
 // MARGIN_RECORD
 static class Rect {int w,h;Rect(int w,int h){this.w=w;this.h=h;}int width(){return w;}int height(){return h;}}
 static class StatusBarGridLayout {static class Box {float x,y,width,height,scale;Box(float x,float y,float w,float h,float scale){this.x=x;this.y=y;width=w;height=h;this.scale=scale;}}}
 static class StatusBarIconLayoutHook {static Map<View,StatusBarIconSpacingSpec.Insets> edges=new IdentityHashMap<>();static StatusBarIconSpacingSpec.Insets insets(View v){return edges.getOrDefault(v,StatusBarIconSpacingSpec.ZERO);}}
 static class Grid {
  float density=1.375f;Map<String,List<View>> groups=new HashMap<>();Map<View,Rect> contentBounds=new IdentityHashMap<>();Map<View,Float> iconHeights=new IdentityHashMap<>();Map<String,StatusBarIconSpacingSpec.Insets> nodeInsets=new HashMap<>();Map<View,float[]> placed=new IdentityHashMap<>();
  int px(float dp){return Math.round(dp*density);}float spacingPx(int dp){return dp*density;}void move(View v,float x,float y,float w,float h){placed.put(v,new float[]{x,y,w,h});}
  // PLACE
 }
 public static void main(String[] args){
  View v=new View();MarginRecord record=new MarginRecord(v.params);StatusBarIconSpacingSpec.Insets edges=new StatusBarIconSpacingSpec.Insets(3,4,6,8);
  for(int i=0;i<200;i++)record.apply(v,edges);check(v.params.getMarginStart()==5&&v.params.topMargin==7&&v.params.getMarginEnd()==11&&v.params.bottomMargin==15,"repeated maintenance cannot accumulate extra edges");
  v.params.topMargin=23;record.restore(v);check(v.params.leftMargin==2&&v.params.rightMargin==5&&v.params.topMargin==23&&v.params.bottomMargin==7&&!v.params.isMarginRelative(),"closing after one OEM edge update restores the other three without replacing native top");
  v=new View();record=new MarginRecord(v.params);record.apply(v,edges);v.params.topMargin=23;record.apply(v,edges);check(v.params.getMarginStart()==5&&v.params.getMarginEnd()==11&&v.params.topMargin==27,"one rewritten OEM edge cannot absorb our unchanged side additions");record.restore(v);check(v.params.leftMargin==2&&v.params.rightMargin==5&&v.params.topMargin==23,"new native baseline survives later reset");
  v=new View();v.direction=1;v.params.setMarginStart(10);v.params.setMarginEnd(20);v.params.resolveLayoutDirection(1);record=new MarginRecord(v.params);record.apply(v,edges);check(v.params.rightMargin==13&&v.params.leftMargin==26,"relative RTL margins mirror correctly");v.params.setMarginEnd(40);record.restore(v);check(v.params.getMarginStart()==10&&v.params.getMarginEnd()==40,"reset preserves an externally rewritten logical end");
  v=new View();record=new MarginRecord(v.params);record.apply(v,edges);v.density=2;record.apply(v,edges);check(v.params.getMarginStart()==8&&v.params.getMarginEnd()==17,"density changes replace previous increments instead of multiplying stored margins");record.restore(v);check(v.params.leftMargin==2&&v.params.rightMargin==5,"density change remains reversible");
  Grid grid=new Grid();View parent=new View(),a=new View(),b=new View();grid.groups.put("icons",List.of(a,b));grid.contentBounds.put(a,new Rect(16,16));grid.contentBounds.put(b,new Rect(24,16));grid.iconHeights.put(a,16f);grid.iconHeights.put(b,16f);
  StatusBarIconSpacingSpec.Insets ea=new StatusBarIconSpacingSpec.Insets(3,2,9,4),eb=new StatusBarIconSpacingSpec.Insets(4,1,2,0);StatusBarIconLayoutHook.edges.put(a,ea);StatusBarIconLayoutHook.edges.put(b,eb);
  float d=grid.density,scale=.8f,width=(16+ea.horizontal()*d+24+eb.horizontal()*d+grid.px(1))*scale,height=(16+ea.vertical()*d)*scale;StatusBarGridLayout.Box box=new StatusBarGridLayout.Box(100,50,width,height,scale);
  grid.place("icons",parent,box);float[] leftA=grid.placed.get(a).clone(),leftB=grid.placed.get(b).clone();check(leftA[0]+leftA[2]<leftB[0],"distinct icon content rectangles never overlap");close(leftB[0]-(leftA[0]+leftA[2]),(ea.end+eb.start)*d*scale+grid.px(1)*scale,"both adjacent margins count independently at fractional density");check(leftA[1]>=box.y&&leftA[1]+leftA[3]<=box.y+box.height,"top/bottom reservation stays within packed row");
  parent.direction=a.direction=b.direction=1;grid.place("icons",parent,box);float[] rightA=grid.placed.get(a),rightB=grid.placed.get(b);check(rightA[0]>rightB[0],"RTL also mirrors original child order");close(rightA[0],2*box.x+box.width-leftA[0]-leftA[2],"RTL keeps asymmetric logical boundary geometry");close(rightB[0],2*box.x+box.width-leftB[0]-leftB[2],"second RTL item mirrors independently");
  View battery=new View();grid.nodeInsets.put("battery",ea);StatusBarGridLayout.Box single=new StatusBarGridLayout.Box(20,30,(16+ea.horizontal()*d)*scale,(16+ea.vertical()*d)*scale,scale);grid.place("battery",battery,single);float[] cell=grid.placed.get(battery);close(cell[2],16*scale,"battery/summary node excludes reserved margins from glyph scale");close(cell[0],20+ea.start*d*scale,"single-node left boundary uses fractional density without rounding drift");
  System.out.println("Icon boundary production placement/restoration facades: "+checks+" assertions passed (not device evidence)");
 }
}'''
body = HARNESS.replace('// MARGIN_RECORD', extract(JAVA / 'hook/StatusBarIconLayoutHook.java', 'private static final class MarginRecord'))
body = body.replace('// PLACE', extract(JAVA / 'hook/StatusBarGridHook.java', 'void place(String id,View view,StatusBarGridLayout.Box box)'))
with tempfile.TemporaryDirectory(prefix='duo-icon-spacing-') as tmp:
    path = Path(tmp) / 'TestIconSpacingRuntime.java'
    path.write_text(body, encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, str(path),
                    *(str(JAVA / name) for name in ['StatusBarIconSpacingSpec.java', 'StatusBarSurfaceSpec.java', 'StatusBarIconCatalog.java'])], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestIconSpacingRuntime'], check=True, timeout=15)
