"""Execute the production native-size fingerprint during OEM horizontal relayout."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT/'android/app/src/main/java/ls/augment/com/hook/RedMagicSystemUiHook.java').read_text(encoding='utf-8')
start = source.index('String inputs(){')
end = source.index('String planInputs()', start)
method = source[start:end]
harness = r'''
public class SignalSizeTransition {
 static int checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static class Resources {String config="portrait/density3";String getConfiguration(){return config;}}
 static class Drawable {String bounds="0,0,16,20";String getBounds(){return bounds;}}
 static class View {
  int x=2,y=3,w=16,h=20,left,top,dir;View parent;Resources resources=new Resources();Drawable drawable=new Drawable();String matrix="identity";
  ViewGroup.MarginLayoutParams margin=new ViewGroup.MarginLayoutParams();
  Resources getResources(){return resources;}int getHeight(){return h;}int getWidth(){return w;}int getLeft(){return x;}int getRight(){return x+w;}int getBottom(){return y+h;}
  int getLayoutDirection(){return dir;}int getTop(){return y;}int getPaddingLeft(){return left;}int getPaddingTop(){return top;}
  Object getParent(){return parent;}Object getLayoutParams(){return margin;}Drawable getDrawable(){return drawable;}String getImageMatrix(){return matrix;}
 }
 static class ViewGroup extends View {static class MarginLayoutParams {int start,end,topMargin,bottomMargin;int getMarginStart(){return start;}int getMarginEnd(){return end;}}}
 static class Drawing {View owner=new ViewGroup(),position=new View(),container=new ViewGroup();boolean ios;
  Drawing(){position.parent=container;container.parent=owner;owner.h=42;}
  boolean iosStyle(){return ios;}
  // PRODUCTION
 }
 public static void main(String[] args){
  Drawing d=new Drawing();String original=d.inputs();
  for(int i=0;i<100;i++){
   d.position.x=i;d.container.x=i*2;d.container.w=32+i;d.owner.w=65+i;
   check(original.equals(d.inputs()),"4G/5G/5G+ horizontal reflow must keep a stable row size");
  }
  d.position.w++;check(!original.equals(d.inputs()),"actual signal width change recaptures native shape");d.position.w--;
  d.position.h++;check(!original.equals(d.inputs()),"actual signal height change recaptures native shape");d.position.h--;
  d.container.y++;check(!original.equals(d.inputs()),"vertical realignment recaptures native origin");d.container.y--;
  d.position.drawable.bounds="0,0,17,22";check(!original.equals(d.inputs()),"drawable bounds change");d.position.drawable.bounds="0,0,16,20";
  d.position.matrix="scale2";check(!original.equals(d.inputs()),"real image scale change");d.position.matrix="identity";
  d.ios=true;check(!original.equals(d.inputs()),"style change");d.ios=false;
  d.owner.resources.config="landscape/density4";check(!original.equals(d.inputs()),"display configuration change");d.owner.resources.config="portrait/density3";
  d.owner.dir=1;check(!original.equals(d.inputs()),"RTL change");d.owner.dir=0;
  d.position.margin.topMargin++;check(!original.equals(d.inputs()),"native margin change");d.position.margin.topMargin--;
  d.position.drawable=null;check(!original.equals(d.inputs()),"missing drawable remains distinguishable");
  System.out.println("Signal size transitions: "+checks+" production-body assertions passed");
 }
}
'''.replace('// PRODUCTION', method)
java = Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
with tempfile.TemporaryDirectory(prefix='duo-signal-transition-') as folder:
    path = Path(folder)/'SignalSizeTransition.java'
    path.write_text(harness, encoding='utf-8')
    subprocess.run([str(java/'javac'), '-encoding', 'UTF-8', '-d', folder, str(path)], check=True, timeout=30)
    subprocess.run([str(java/'java'), '-cp', folder, 'SignalSizeTransition'], check=True, timeout=30)
