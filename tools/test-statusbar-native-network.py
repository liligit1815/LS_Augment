"""Exercise actual position-only network sizing and Geometry across repeated draws."""
from pathlib import Path
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarGridHook.java'


def extract(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


source = SOURCE.read_text(encoding='utf-8')
geometry = extract(source, 'private static final class Geometry {')
methods = '\n'.join(extract(source, marker) for marker in (
    'boolean isNativeNetwork(View view)', 'TextView firstText(View view)',
    'float nativeIconHeight(View view,float fallback)',
    'void applyNativeNetworkSize(View parent)',
))

HARNESS = r'''package ls.augment.com.hook;
import java.util.*;
public final class TestStatusBarNativeNetwork {
 static class Rect {int left,top,right,bottom;Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}int width(){return right-left;}int height(){return bottom-top;}boolean isEmpty(){return left>=right||top>=bottom;}}
 static class View {
  static final int VISIBLE=0,GONE=8;String slot="other";int left,top,width,height,visibility=VISIBLE;
  float x,y,sx=1,sy=1,alpha=1,transitionAlpha=1,pivotX;Rect ink;
  View(int l,int t,int w,int h){left=l;top=t;width=w;height=h;pivotX=w/2f;ink=new Rect(0,0,w,h);}
  int getLeft(){return left;}int getTop(){return top;}int getRight(){return left+width;}int getWidth(){return width;}int getVisibility(){return visibility;}
  float getTranslationX(){return x;}float getTranslationY(){return y;}float getScaleX(){return sx;}float getScaleY(){return sy;}float getAlpha(){return alpha;}float getTransitionAlpha(){return transitionAlpha;}float getPivotX(){return pivotX;}
  void setTranslationX(float v){x=v;}void setTranslationY(float v){y=v;}void setScaleX(float v){sx=v;}void setScaleY(float v){sy=v;}void setAlpha(float v){alpha=v;}
 }
 static class ViewGroup extends View {
  final List<View> children=new ArrayList<>();ViewGroup(){super(0,0,150,24);}void add(View v){children.add(v);}int getChildCount(){return children.size();}View getChildAt(int i){return children.get(i);}
 }
 static class TextView extends View {float textSize;TextView(int l,int t,int w,int h,float sp){super(l,t,w,h);textSize=sp;slot="NET_SPEED";}float getTextSize(){return textSize;}}
 static class Resources {Object getDisplayMetrics(){return null;}}
 static class Context {Resources getResources(){return new Resources();}}
 static class ConfigSchema {static final String STATUSBAR_NATIVE_NETWORK_SIZE_SP="network_sp";}
 static class FeatureSettings {static int requested=16;static int integer(Context c,String k,int fallback,int min,int max){return requested;}}
 static class SystemUiHook {static String slotOf(View v){return v.slot;}}
 static class Spec {final Item item=new Item();Item get(String key){return item;}}
 static class Item {float size=13;}
 // GEOMETRY
 static class State {
  final Context context=new Context();final Spec spec=new Spec();final Map<View,Geometry> geometry=new IdentityHashMap<>();
  int px(float value){return Math.round(value);}Rect iconBounds(View v){return v.ink;}
  Geometry own(View v){Geometry g=geometry.get(v);if(g==null){g=new Geometry(v);geometry.put(v,g);}return g;}
  void observe(){for(Map.Entry<View,Geometry> e:geometry.entrySet())e.getValue().observe(e.getKey());}
  void restore(){for(Map.Entry<View,Geometry> e:geometry.entrySet())e.getValue().restore(e.getKey());geometry.clear();}
  // METHODS
 }
 static int checks;
 static void close(float expected,float actual,String why){checks++;if(Math.abs(expected-actual)>.0001f)throw new AssertionError(why+": expected "+expected+", got "+actual);}
 static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static float left(View v){return v.left+v.x+v.pivotX+(v.ink.left-v.pivotX)*v.sx;}
 static float right(View v){return v.left+v.x+v.pivotX+(v.ink.right-v.pivotX)*v.sx;}
 public static void main(String[] args){
  State state=new State();ViewGroup group=new ViewGroup();
  View before=new View(0,2,20,20);before.x=1;before.y=4;
  TextView network=new TextView(30,0,30,24,12);network.ink=new Rect(2,4,26,16);network.x=2;network.y=3;
  View after=new View(60,2,20,24);after.ink=new Rect(0,2,20,22);after.x=1;after.y=5;
  group.add(before);group.add(network);group.add(after);
  float nativeNetworkLeft=left(network),originalGap=left(after)-right(network);
  close(20,state.nativeIconHeight(group,13),"native icon reference must ignore network line height");
  state.applyNativeNetworkSize(group);
  float parentScale=13f/state.nativeIconHeight(group,13);
  close(16,network.textSize*network.sy*parentScale,"16sp network remains 16sp after 13/20 whole-group scaling");
  close(nativeNetworkLeft,left(network),"expansion preserves native text leading edge around a nonzero pivot");
  close(originalGap,left(after)-right(network),"following icon retains native gap after text width expansion");
  check(left(after)>=right(network),"expanded native speed overlaps its next sibling");
  close(1,before.x,"preceding sibling must not shift");close(3,network.y,"network native row remains unchanged");close(5,after.y,"following icon remains in its original row");
  float networkX=network.x,networkSx=network.sx,afterX=after.x;
  for(int i=0;i<20;i++){state.observe();state.applyNativeNetworkSize(group);}
  close(networkX,network.x,"repeated draws must not accumulate network translation");
  close(networkSx,network.sx,"repeated draws must not compound network scale");
  close(afterX,after.x,"repeated draws must not accumulate sibling shifts");
  state.restore();close(2,network.x,"disable restores native network X");close(3,network.y,"disable restores native network Y");
  close(1,network.sx,"disable restores native network X scale");close(1,network.sy,"disable restores native network Y scale");
  close(1,after.x,"disable restores shifted sibling X");close(5,after.y,"disable restores sibling Y");
  FeatureSettings.requested=0;state.applyNativeNetworkSize(group);close(1,network.sx,"default font size leaves the native geometry alone");
  check(state.geometry.isEmpty(),"default native size need not take ownership of children");
  // StatusIconContainer can lay every child at zero and position icons with
  // native translations. Expansions must follow those visual positions too.
  FeatureSettings.requested=16;State translatedState=new State();ViewGroup translatedGroup=new ViewGroup();
  View translatedBefore=new View(0,2,20,20);translatedBefore.x=1;
  TextView translatedNetwork=new TextView(0,0,30,24,12);translatedNetwork.ink=new Rect(2,4,26,16);translatedNetwork.x=32;
  View translatedAfter=new View(0,2,20,24);translatedAfter.ink=new Rect(0,2,20,22);translatedAfter.x=61;
  translatedGroup.add(translatedBefore);translatedGroup.add(translatedNetwork);translatedGroup.add(translatedAfter);
  float translatedGap=left(translatedAfter)-right(translatedNetwork);
  translatedState.applyNativeNetworkSize(translatedGroup);
  close(translatedGap,left(translatedAfter)-right(translatedNetwork),"zero-layout translated siblings retain their visual gap after expansion");
  check(left(translatedAfter)>=right(translatedNetwork),"translated sibling overlaps expanded network text");
  float translatedAfterX=translatedAfter.x;translatedState.observe();translatedState.applyNativeNetworkSize(translatedGroup);
  close(translatedAfterX,translatedAfter.x,"translated sibling does not drift on a repeated draw");
  translatedState.restore();close(61,translatedAfter.x,"translated sibling restores its OEM translation");
  System.out.println("StatusBar native network: "+checks+" actual-method sizing, expansion, stability and restoration assertions passed");
 }
}
'''.replace('// GEOMETRY', geometry).replace('// METHODS', methods)

with tempfile.TemporaryDirectory(prefix='lsa-statusbar-network-') as directory:
    temporary = Path(directory)
    files = []
    sources = {
        'ls/augment/com/hook/TestStatusBarNativeNetwork.java': HARNESS,
        'android/util/TypedValue.java': '''package android.util;public final class TypedValue {public static final int COMPLEX_UNIT_SP=2;public static float applyDimension(int unit,float value,Object metrics){return value;}}''',
    }
    for name, text in sources.items():
        target = temporary / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding='utf-8')
        files.append(str(target))
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory, *files], check=True)
    subprocess.run(['java', '-cp', directory, 'ls.augment.com.hook.TestStatusBarNativeNetwork'], check=True, timeout=20)
