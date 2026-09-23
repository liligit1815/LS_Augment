"""Run the production overlay visibility policy against lock/unlock and native fades."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarGridHook.java').read_text(encoding='utf-8')
start = source.index('private static float overlayAlpha(')
end = source.index('{', start) + 1
depth = 1
while depth:
    depth += (source[end] == '{') - (source[end] == '}')
    end += 1
method = source[start:end]
harness = '''public class TestOverlayVisibility {
  static class View {
    static final int VISIBLE=0, INVISIBLE=4, GONE=8;
    View parent; int visibility=VISIBLE; float alpha=1,transition=1;
    View(View parent){this.parent=parent;}
    Object getParent(){return parent;} int getVisibility(){return visibility;}
    float getAlpha(){return alpha;} float getTransitionAlpha(){return transition;}
  }
  // PRODUCTION
  static int count;
  static void check(float actual,float expected,String reason){count++;
    if(Math.abs(actual-expected)>.0001f)throw new AssertionError(reason+": "+actual);}
  public static void main(String[] args){
    View root=new View(null),end=new View(root),icons=new View(end),battery=new View(icons);
    check(overlayAlpha(root,battery),1,"unlocked native region");
    battery.alpha=0;check(overlayAlpha(root,battery),1,"replacement hides native battery without hiding itself");
    battery.visibility=View.GONE;check(overlayAlpha(root,battery),1,"native battery style can be independently hidden");
    end.visibility=View.INVISIBLE;check(overlayAlpha(root,battery),0,"locked phone region is invisible while root remains visible");
    end.visibility=View.GONE;check(overlayAlpha(root,battery),0,"gone native region");
    end.visibility=View.VISIBLE;check(overlayAlpha(root,battery),1,"unlock restores component");
    end.alpha=.5f;icons.alpha=.4f;check(overlayAlpha(root,battery),.2f,"nested fade multiplication");
    icons.transition=.25f;check(overlayAlpha(root,battery),.05f,"native transition fade");
    root.alpha=.2f;root.transition=.5f;check(overlayAlpha(root,battery),.05f,"root fade already inherited, never squared");
    end.alpha=0;check(overlayAlpha(root,battery),0,"zero alpha ancestor");
    check(overlayAlpha(root,null),0,"no anchor");
    check(overlayAlpha(root,new View(null)),0,"detached battery");
    View otherRoot=new View(null);icons.parent=otherRoot;
    check(overlayAlpha(root,battery),0,"reparented native region cannot draw in old surface");
    View keyguardRoot=new View(null),keyguardIcons=new View(keyguardRoot),keyguardBattery=new View(keyguardIcons);
    check(overlayAlpha(keyguardRoot,keyguardBattery),1,"lockscreen copy follows its own visible region");
    keyguardIcons.visibility=View.INVISIBLE;
    check(overlayAlpha(keyguardRoot,keyguardBattery),0,"lockscreen copy disappears during shade transition");
    System.out.println("Status bar overlay visibility: "+count+" assertions passed");
  }
}
'''
with tempfile.TemporaryDirectory(prefix='lsa-overlay-visibility-') as directory:
    test = Path(directory) / 'TestOverlayVisibility.java'
    test.write_text(harness.replace('// PRODUCTION', method), encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory, str(test)], check=True)
    subprocess.run(['java', '-cp', directory, 'TestOverlayVisibility'], check=True, timeout=15)
