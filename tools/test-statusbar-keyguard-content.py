"""Run production lockscreen carrier ownership against configuration and native fades."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarGridHook.java').read_text(encoding='utf-8')


def block(signature):
    start = source.index(signature)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


layout = block('void layout()')
observe_start = layout.index('for(Map.Entry<View,Geometry> e:geometry.entrySet())')
observe = layout[observe_start:layout.index(';', observe_start) + 1]
carrier_start = layout.index('View carrier=findView(root,"keyguard_carrier_text");')
carrier_layout = layout[carrier_start:layout.index('for(Map.Entry<String,TextView> e:metrics.entrySet())', carrier_start)]

harness = '''import java.util.*;
public class TestKeyguardContent {
  static class View {
    float x,y,sx=1,sy=1,alpha=1; View parent;
    float getTranslationX(){return x;} void setTranslationX(float value){x=value;}
    float getTranslationY(){return y;} void setTranslationY(float value){y=value;}
    float getScaleX(){return sx;} void setScaleX(float value){sx=value;}
    float getScaleY(){return sy;} void setScaleY(float value){sy=value;}
    float getAlpha(){return alpha;} void setAlpha(float value){alpha=value;}
  }
  static class ViewGroup extends View {
    View carrier;
    void setClipChildren(boolean value){} void setClipToPadding(boolean value){}
    void removeView(View child){}
  }
  static class KeyguardStatusBarView extends ViewGroup {}
  static class PhoneStatusBarView extends ViewGroup {}
  static class TextView extends View {}
  static class ConnectivityIconView extends View {void close(){}}
  static class StatusBarGridLayout {static class Node {}}
  static final String KEYGUARD=KeyguardStatusBarView.class.getName();
  static final Map<ViewGroup,State> STATES=new IdentityHashMap<>();
  static View findView(ViewGroup root,String name){return root.carrier;}
  static boolean isDescendant(View view,View root){return view.parent==root;}
  // KEYGUARD
  // GEOMETRY
  static class State {
    final ViewGroup root;
    final Map<View,Geometry> geometry=new IdentityHashMap<>();
    final Map<ViewGroup,boolean[]> clips=new IdentityHashMap<>();
    final Map<String,Object> groups=new HashMap<>();
    final List<String> companions=new ArrayList<>();
    boolean onlyPosition; TextView keyguardClock; ConnectivityIconView connectivityIcon;
    State(ViewGroup root){this.root=root;STATES.put(root,this);}
    boolean positionOnly(){return onlyPosition;}
    void addCompanion(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,
        String id,String base,View view,int order,boolean joined){
      if(view!=null)companions.add(id);
    }
    // OWN
    // REPLACE
    // UPDATE
    // RESTORE
    void frame(){
      // OBSERVE
      companions.clear();
      List<StatusBarGridLayout.Node> nodes=new ArrayList<>();
      Map<String,View> views=new HashMap<>();
      // CARRIER_LAYOUT
    }
  }
  static int count;
  static void check(boolean condition,String reason){count++;if(!condition)throw new AssertionError(reason);}
  static void alpha(View view,float expected,String reason){
    check(Math.abs(view.alpha-expected)<.0001f,reason+": "+view.alpha);
  }
  static State create(boolean keyguard,float nativeAlpha){
    ViewGroup root=keyguard?new KeyguardStatusBarView():new PhoneStatusBarView();
    root.carrier=new TextView();root.carrier.parent=root;root.carrier.alpha=nativeAlpha;
    return new State(root);
  }
  public static void main(String[] args){
    State full=create(true,.72f);View carrier=full.root.carrier;
    carrier.x=7;carrier.y=2;carrier.sx=.8f;carrier.sy=.9f;
    full.keyguardClock=new TextView();full.frame();
    alpha(carrier,0,"custom lockscreen clock replaces native carrier");
    check(full.companions.isEmpty(),"carrier reserves no grid space beside custom clock");
    full.keyguardClock.alpha=0;full.frame();
    alpha(carrier,0,"hiding configured clock does not reveal unconfigured carrier");
    check(full.companions.isEmpty(),"hidden configured clock has no leftover carrier slot");
    full.frame();full.restore();
    alpha(carrier,.72f,"repeated frames retain original alpha for disable/detach restore");
    check(full.geometry.isEmpty(),"restore releases ownership");
    check(carrier.x==7&&carrier.y==2&&carrier.sx==.8f&&carrier.sy==.9f,
        "replacement preserves native position and scale");

    State mode=create(true,.66f);mode.keyguardClock=new TextView();mode.frame();
    mode.onlyPosition=true;mode.frame();
    alpha(mode.root.carrier,.66f,"switching to position-only restores native carrier");
    check(mode.companions.equals(List.of("clock.carrier")),"position-only keeps native carrier in layout");
    mode.onlyPosition=false;mode.frame();alpha(mode.root.carrier,0,"switching back replaces carrier");
    mode.keyguardClock=null;mode.frame();
    alpha(mode.root.carrier,.66f,"missing injected clock restores carrier fallback");
    check(mode.companions.equals(List.of("clock.carrier")),"fallback carrier remains in layout");

    State nativeOnly=create(true,.45f);nativeOnly.frame();
    alpha(nativeOnly.root.carrier,.45f,"native clock path preserves original opacity");
    check(nativeOnly.companions.contains("clock.carrier"),"native carrier participates without injected clock");
    State phone=create(false,.61f);phone.keyguardClock=new TextView();phone.frame();
    alpha(phone.root.carrier,.61f,"phone surface is never replaced by keyguard policy");
    check(phone.companions.contains("clock.carrier"),"phone companion behavior is retained");

    State animated=create(true,.8f);animated.keyguardClock=new TextView();animated.frame();
    animated.root.carrier.alpha=.35f;animated.root.carrier.x=23;animated.frame();
    alpha(animated.root.carrier,0,"native animation cannot reveal replaced content on next frame");
    animated.restore();alpha(animated.root.carrier,.35f,"restore respects newly observed native fade");
    check(animated.root.carrier.x==23,"restore respects native position animation");
    animated.frame();animated.root.carrier.alpha=.2f;animated.restore();
    alpha(animated.root.carrier,.2f,"restore observes a fade arriving after the last frame");

    State transparent=create(true,0);transparent.keyguardClock=new TextView();transparent.frame();
    transparent.restore();alpha(transparent.root.carrier,0,"originally transparent carrier stays transparent");
    State missing=create(true,1);missing.root.carrier=null;missing.keyguardClock=new TextView();missing.frame();
    check(missing.geometry.isEmpty(),"missing carrier requires no ownership");
    check(missing.companions.isEmpty(),"missing carrier adds no layout slot");

    State oldOwner=create(true,.55f);oldOwner.keyguardClock=new TextView();oldOwner.frame();
    State newOwner=create(false,1);newOwner.root.carrier=oldOwner.root.carrier;
    newOwner.root.carrier.parent=newOwner.root;newOwner.frame();
    alpha(newOwner.root.carrier,.55f,"OEM reparent to phone restores alpha before new capture");
    check(oldOwner.geometry.isEmpty(),"reparent releases old keyguard ownership");
    newOwner.restore();alpha(newOwner.root.carrier,.55f,"new owner's restore retains native opacity");
    System.out.println("Status bar keyguard content: "+count+" assertions passed");
  }
}
'''
for marker, production in {
    'KEYGUARD': block('private static boolean isKeyguard('),
    'GEOMETRY': block('private static final class Geometry'),
    'OWN': block('Geometry own('),
    'REPLACE': block('boolean replaceKeyguardCarrier('),
    'UPDATE': block('void updateKeyguardCarrier('),
    'RESTORE': block('void restore(){for(Map.Entry<View,Geometry>'),
    'OBSERVE': observe,
    'CARRIER_LAYOUT': carrier_layout,
}.items():
    harness = harness.replace('// ' + marker, production)

with tempfile.TemporaryDirectory(prefix='lsa-keyguard-content-') as directory:
    test = Path(directory) / 'TestKeyguardContent.java'
    test.write_text(harness, encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory, str(test)], check=True)
    subprocess.run(['java', '-cp', directory, 'TestKeyguardContent'], check=True, timeout=15)
