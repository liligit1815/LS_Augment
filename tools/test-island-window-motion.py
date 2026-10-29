"""Exercise the production window geometry and scoped move-animation policy without a phone."""
import argparse
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
JAVA=ROOT/'android/app/src/main/java/ls/augment/com/hook'

def method(text,marker):
    start=text.index(marker);end=text.index('{',start)+1;depth=1
    while depth:
        depth+=(text[end]=='{')-(text[end]=='}');end+=1
    return text[start:end]

PARAMS='''package android.view;public interface WindowManager {class LayoutParams {
 public int width=1053,height=510,x,y,windowAnimations=123,privateFlags=0x200,gravity=49;
 public static final int PRIVATE_FLAG_NO_MOVE_ANIMATION=0x40;
 public boolean canPlayMoveAnimation(){return (privateFlags&PRIVATE_FLAG_NO_MOVE_ANIMATION)==0;}
 public void setCanPlayMoveAnimation(boolean enable){privateFlags=enable?privateFlags&~PRIVATE_FLAG_NO_MOVE_ANIMATION:privateFlags|PRIVATE_FLAG_NO_MOVE_ANIMATION;}
}}'''
HARNESS='''package ls.augment.com.hook;import java.util.*;import android.view.WindowManager;
public class TestIslandWindowMotion {
 static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static List<String> reports=new ArrayList<>();
 static class OldParams {public int privateFlags=0x100;public static final int PRIVATE_FLAG_NO_MOVE_ANIMATION=0x800;}
 static class ChildParams extends WindowManager.LayoutParams {}
 static class ChildOld extends OldParams {}
 static class Unknown {public int privateFlags=0x20;}
 static class WrongType {public String privateFlags="native";public static final int PRIVATE_FLAG_NO_MOVE_ANIMATION=0x40;}
 static class WrongMask {public int privateFlags=0x20;public static final int PRIVATE_FLAG_NO_MOVE_ANIMATION=3;}
 static class NoOp {public boolean canPlayMoveAnimation(){return true;}public void setCanPlayMoveAnimation(boolean enabled){}}
 static class Failing {boolean enabled=true;public boolean canPlayMoveAnimation(){return enabled;}
  public void setCanPlayMoveAnimation(boolean value){if(!value)throw new IllegalStateException();enabled=value;}}
 static class Context {Context getResources(){return this;}Context getDisplayMetrics(){return this;}int widthPixels=1216;}
 static class Host {
  boolean acquired=true,selected=true,panel;Object current=new Object(),permanent=new Object();final Context context=new Context();
  int nativeX=0,nativeY=5,nativeWidth=1053,nativeHeight=90,width=360,height=96,offsetX=0,offsetY=9;
  final IslandWindowMotion windowMotion=new IslandWindowMotion();
  boolean ownsSelected(Object owner){return selected;}boolean expanded(){return panel;}int dp(int n){return n*3;}
  Object field(Object owner,String name){return panel;}void reportMotion(String s){reports.add(s);}
  // WINDOW
 }
 static int left(Host h,WindowManager.LayoutParams p){return (h.context.widthPixels-p.width)/2+p.x;}
 public static void main(String[] args){
  IslandWindowMotion policy=new IslandWindowMotion();WindowManager.LayoutParams params=new WindowManager.LayoutParams();
  check(policy.suppress(params,reports::add)&&!params.canPlayMoveAnimation(),"methods disable only window move animation");
  check(params.windowAnimations==123&&params.gravity==49&&params.width==1053,"native view/show geometry untouched by policy");
  params.privateFlags|=0x400;policy.suppress(params,reports::add);policy.restore(params,reports::add);
  check(params.canPlayMoveAnimation()&&params.privateFlags==0x600,"restore original move policy while preserving unrelated live flags");
  params.setCanPlayMoveAnimation(false);policy.suppress(params,reports::add);policy.restoreAll(reports::add);
  check(!params.canPlayMoveAnimation(),"pre-existing native suppression remains disabled");
  ChildParams child=new ChildParams();check(policy.suppress(child,reports::add)&&!child.canPlayMoveAnimation(),"inherited API supported");policy.restoreAll(reports::add);
  OldParams old=new OldParams();check(policy.suppress(old,reports::add)&&old.privateFlags==0x900,"fallback reads runtime named mask, not a hardcoded bit");
  old.privateFlags|=0x200;policy.restoreAll(reports::add);check(old.privateFlags==0x300,"fallback preserves unrelated changes");
  ChildOld oldChild=new ChildOld();check(policy.suppress(oldChild,reports::add)&&oldChild.privateFlags==0x900,"inherited field interface supported");policy.restoreAll(reports::add);
  Unknown unknown=new Unknown();check(!policy.suppress(unknown,reports::add)&&unknown.privateFlags==0x20,"missing constant preserves native state");
  WrongType wrong=new WrongType();check(!policy.suppress(wrong,reports::add)&&wrong.privateFlags.equals("native"),"wrong field type preserved");
  WrongMask mask=new WrongMask();check(!policy.suppress(mask,reports::add)&&mask.privateFlags==0x20,"invalid multiple-bit mask rejected");
  check(!policy.suppress(new NoOp(),reports::add),"ineffective setter is not reported as working");
  Failing failing=new Failing();check(!policy.suppress(failing,reports::add)&&failing.enabled,"setter failure stays native");
  check(reports.stream().anyMatch(s->s.startsWith("move_animation_unavailable:")),"missing capability diagnosed");

  Host h=new Host();params=new WindowManager.LayoutParams();h.panel=true;h.window(params);int expandedLeft=left(h,params);
  h.panel=false;h.window(params);int compactLeft=left(h,params);
  check(compactLeft>expandedLeft,"centered width reduction moves native window left edge rightward");
  // WMS starts a movement transform at oldLeft-newLeft if allowed. This is the extra leftward frame in the video.
  int initialSurfaceLeft=compactLeft+(params.canPlayMoveAnimation()?expandedLeft-compactLeft:0);
  check(initialSurfaceLeft==compactLeft,"production collapse must never replay previous left edge");
  check(params.width==360&&params.height==96&&params.x==0&&params.y==9,"compact bounds and hit area stay configured");
  check(params.windowAnimations==123,"production does not disable native show animations");
  h.panel=true;h.window(params);check(params.width==1053&&params.x==0&&!params.canPlayMoveAnimation(),"expansion retains native size without WMS movement");
  h.panel=false;h.offsetX=-33;h.window(params);check(params.x==-33&&!params.canPlayMoveAnimation(),"configured offset uses same motion policy");
  h.offsetX=81;h.width=540;h.window(params);check(params.x==81&&params.width==540&&!params.canPlayMoveAnimation(),"hot geometry stays stable");
  h.context.widthPixels=900;h.panel=true;h.window(params);check(params.width==900,"narrow screen panel remains bounded");
  WindowManager.LayoutParams untouched=new WindowManager.LayoutParams();check(untouched.canPlayMoveAnimation(),"other windows unaffected");
  h.selected=false;h.panel=false;h.window(params);
  check(params.canPlayMoveAnimation()&&params.width==h.nativeWidth&&params.height==h.nativeHeight,"native handoff restores movement and geometry");
  h.selected=true;h.current=new Object();h.window(params);check(!params.canPlayMoveAnimation(),"reacquisition suppresses movement again");
  h.current=null;h.window(params);check(params.canPlayMoveAnimation(),"empty owned host restores native policy");
  h.acquired=false;h.current=new Object();h.window(params);check(params.canPlayMoveAnimation(),"inactive host cannot mutate move policy");
  System.out.println("Island window motion checks passed: "+checks+" (geometry and WMS policy model, not a device video)");
 }
}'''

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--java-home',type=Path,required=True);args=parser.parse_args()
    import os
    suffix='.exe' if os.name=='nt' else ''
    source=(JAVA/'NativeIslandHost.java').read_text('utf-8')
    harness=HARNESS.replace('// WINDOW',method(source,'private void window('))
    files={'android/view/WindowManager.java':PARAMS,'ls/augment/com/hook/TestIslandWindowMotion.java':harness,
           'ls/augment/com/hook/IslandWindowMotion.java':(JAVA/'IslandWindowMotion.java').read_text('utf-8')}
    with tempfile.TemporaryDirectory(prefix='duo-island-motion-') as directory:
        target=Path(directory);paths=[]
        for name,text in files.items():
            p=target/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,'utf-8');paths.append(str(p))
        compile_cmd=[str(args.java_home/'bin'/('javac'+suffix)),'-encoding','UTF-8','-d',str(target),*paths]
        run=[str(args.java_home/'bin'/('java'+suffix)),'-cp',str(target),'ls.augment.com.hook.TestIslandWindowMotion']
        subprocess.run(compile_cmd,check=True);subprocess.run(run,check=True)
        p=target/'ls/augment/com/hook/TestIslandWindowMotion.java'
        original=p.read_text('utf-8');old='windowMotion.suppress(params,this::reportMotion);';assert old in original
        p.write_text(original.replace(old,'',1),'utf-8');subprocess.run(compile_cmd,check=True,capture_output=True)
        result=subprocess.run(run,capture_output=True,text=True)
        assert result.returncode and 'production collapse must never replay previous left edge' in result.stderr,result.stderr
        print('PASS rejected regression: removal of window-move suppression')

if __name__=='__main__':main()
