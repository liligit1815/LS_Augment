"""Exercise the production entrance pre-draw gate, including bounded native fallback."""
from pathlib import Path
import os,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
s=(ROOT/'android/app/src/main/java/ls/augment/com/hook/VolumePositionHook.java').read_text(encoding='utf8')
a=s.index('        @Override public boolean onPreDraw(){',s.index('private static final class Entrance'))
b=s.index('        boolean dimensionsReady(',a)
method=s[a:b]
java='''import java.lang.ref.WeakReference;
class android {static class os {static class SystemClock {static long now;static long uptimeMillis(){return now;}}}}
class Animator {int cancelled;void cancel(){cancelled++;}}
class View {boolean layout;int invalidations;float alpha=.4f,x=-40;Animator animation=new Animator();Object getContext(){return this;}boolean isLayoutRequested(){return layout;}void postInvalidateOnAnimation(){invalidations++;}Animator animate(){return animation;}void setTranslationX(float v){x=v;}void setAlpha(float v){alpha=v;}}
class Base {public boolean onPreDraw(){return true;}}
public class TestEntranceGate extends Base {
 boolean firstFrame=true,nativeOnly,positionChanged,failed,owned,enabled=true,measured=true;long waitingSince;int restored;
 View view=new View();WeakReference<View> reference=new WeakReference<>(view);
 void refresh(){}boolean enabled(Object c){return enabled;}boolean dimensionsReady(View v){return measured;}void status(View v,String s){}void restoreNative(View v){restored++;}
'''+method+'''
 static int checks;static void require(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}
 public static void main(String[] args){
  TestEntranceGate g=new TestEntranceGate();android.os.SystemClock.now=10;
  require(!g.onPreDraw()&&g.view.invalidations==1&&g.view.animation.cancelled==0);
  g.owned=true;g.view.layout=true;require(!g.onPreDraw());g.view.layout=false;g.positionChanged=true;require(!g.onPreDraw());
  g.measured=false;require(!g.onPreDraw());g.measured=true;
  require(g.onPreDraw()&&g.view.animation.cancelled==1&&g.view.alpha==1&&g.view.x==0);
  g.view.alpha=.2f;g.view.x=-20;require(g.onPreDraw()&&g.view.animation.cancelled==1&&g.view.alpha==.2f&&g.view.x==-20);
  g=new TestEntranceGate();android.os.SystemClock.now=500;require(!g.onPreDraw()&&g.nativeOnly&&g.restored==1);require(g.onPreDraw()&&g.restored==1);
  g=new TestEntranceGate();g.enabled=false;require(g.onPreDraw()&&g.view.animation.cancelled==0);
  g=new TestEntranceGate();g.nativeOnly=true;require(g.onPreDraw()&&g.restored==0);
  g=new TestEntranceGate();g.failed=true;require(!g.onPreDraw()&&g.restored==1&&g.view.animation.cancelled==0);
  g=new TestEntranceGate();g.waitingSince=-1;android.os.SystemClock.now=5000;require(!g.onPreDraw()&&!g.nativeOnly&&g.waitingSince==5000);
  System.out.println("Volume entrance first-frame gate: "+checks+" checks passed");
 }
}
'''
bin=Path(os.environ['JAVA_HOME'])/'bin'
suffix='.exe' if os.name=='nt' else ''
with tempfile.TemporaryDirectory(prefix='duo-volume-first-frame-') as t:
 p=Path(t)/'TestEntranceGate.java';p.write_text(java,encoding='utf8')
 subprocess.run([str(bin/('javac'+suffix)),'-encoding','UTF-8',str(p)],check=True)
 subprocess.run([str(bin/('java'+suffix)),'-cp',t,'TestEntranceGate'],check=True)
