"""Run the production painter entry point through a full 120 Hz shade gesture workload."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarAssetsHook.java').read_text(encoding='utf-8')

def extract(marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

harness = r'''import java.util.*;import java.lang.ref.WeakReference;
public class TestAssetsHotPath {
 static class Canvas {}
 static class Rect {Rect(int l,int t,int r,int b){}}
 static class Resources {Metrics getDisplayMetrics(){return new Metrics();}}
 static class Metrics {float density=1;}
 static class View {boolean shown=true;View parent;View getParent(){return parent;}Resources getResources(){return new Resources();}}
 static class ViewGroup extends View {String surface="main";}
 static class SystemClock {static long time;static long uptimeMillis(){return time;}}
 static class StatusBarGridHook {static int scopeChecks;static boolean inBar(View owner){scopeChecks++;return true;}static boolean isBarRoot(View owner){return owner instanceof ViewGroup;}}
 static class Artwork {int draws;boolean inkFit;void draw(Canvas c,Rect r,Object binding,int color,float density,int alpha,boolean fit){draws++;inkFit=fit;}void dispose(){}}
 static class Resource {Artwork art=new Artwork();Object binding=new Object();long retryAt;boolean drawn;String error="";}
 static class Entry {static int updates,created;boolean virtual,hidden,renderEligible=true,capable=true;long seenAt;String id;WeakReference<View> stateSource,view;WeakReference<ViewGroup> root;Map<String,Resource> resources=new HashMap<>();
  Entry(View v,ViewGroup owner,String id,boolean supported,String reason){created++;this.id=id;root=new WeakReference<>(owner);view=new WeakReference<>(v);stateSource=new WeakReference<>(v);resources.put("whole",new Resource());}
  boolean inScope(View target){for(View at=target;at!=null;at=at.parent)if(at==root.get())return true;return false;}
  String surface(){return root.get().surface;}
  void update(){updates++;}
  // CANRENDER
 }
 static String activeSurface="main";static boolean displayed(View target){return target.shown;}static boolean parentReplaced(View target){return false;}static boolean virtualCovered(View target,String id){return false;}
 static final Map<View,Map<String,Entry>> PARTS=new WeakHashMap<>();
 static final Set<String> BOUND_IDS=new HashSet<>();static boolean artworkActive;static int tickSchedules;
 static boolean isHidden(View owner,String id){return false;}static boolean bound(String id){return BOUND_IDS.contains(id);}
 static boolean inAssetSurface(View owner){return StatusBarGridHook.inBar(owner);}static boolean observingSurface(String surface){return surface.equals(activeSurface);}
 static String surfaceOf(View view){return view instanceof ViewGroup?((ViewGroup)view).surface:"";}
 static class StatusBarSurfaceSpec {static boolean valid(String value){return Arrays.asList("main","lock","notification","control").contains(value);}}
 static boolean supported(String id){return true;}static void scheduleArtworkTick(){tickSchedules++;}
 static void circleChanged(View owner){}
 // PRODUCTION
 static int checks;static void check(boolean pass,String why){checks++;if(!pass)throw new AssertionError(why);}
 public static void main(String[] args){
  ViewGroup root=new ViewGroup();View view=new View();view.parent=root;Canvas canvas=new Canvas();
  // Ten seconds of 120 Hz drawing, twenty painter components, three layers each.
  int calls=1200*20*3;
  for(int i=0;i<calls;i++)drawLayer(view,view,canvas,"battery.fill","whole",0,0,20,20,-1);
  check(StatusBarGridHook.scopeChecks==0&&Entry.updates==0&&Entry.created==0&&PARTS.isEmpty(),"empty theme performs zero hierarchy lookups, state updates and entry allocations across 72,000 draw calls");
  artworkActive=true;BOUND_IDS.add("wifi.signal");
  for(int i=0;i<calls;i++)drawLayer(view,view,canvas,"battery.fill","whole",0,0,20,20,-1);
  check(StatusBarGridHook.scopeChecks==0&&Entry.updates==0&&Entry.created==0,"unbound components have identical zero-work budget when another icon is customized");
  BOUND_IDS.add("battery.fill");
  for(int i=0;i<calls;i++){SystemClock.time=i;drawLayer(view,view,canvas,"battery.fill","whole",0,0,20,20,-1);}
  check(Entry.created==1&&Entry.updates==1&&tickSchedules==1,"active component is registered once; subsequent frames never update state or reschedule maintenance");
  Entry entry=PARTS.get(view).get("battery.fill");check(entry.resources.get("whole").art.draws==calls,"registered component still paints every requested frame");
  check(entry.seenAt==calls-1,"virtual component visibility timestamp remains current without discovery work");
  check(!entry.resources.get("whole").art.inkFit,"ordinary painter call preserves full-canvas fit");
  drawLayer(view,view,canvas,"battery.fill","whole",0,0,20,20,-1,true);
  check(entry.resources.get("whole").art.inkFit,"explicit dual-row fit is forwarded to its cached artwork");
  int rendered=entry.resources.get("whole").art.draws;view.parent=new ViewGroup();drawLayer(view,view,canvas,"battery.fill","whole",0,0,20,20,-1);check(entry.resources.get("whole").art.draws==rendered,"moving the view outside its registered root immediately blocks drawing before the next maintenance tick");view.parent=root;
  activeSurface="lock";drawLayer(view,view,canvas,"battery.fill","whole",0,0,20,20,-1);check(entry.resources.get("whole").art.draws==rendered,"switching active surface immediately blocks the old page before cached eligibility updates");activeSurface="main";
  artworkActive=false;int before=entry.resources.get("whole").art.draws;
  for(int i=0;i<calls;i++)drawLayer(view,view,canvas,"battery.fill","whole",0,0,20,20,-1);
  check(entry.resources.get("whole").art.draws==before&&Entry.updates==1,"turning off customization immediately stops the painter fast path");
  System.out.println("Status-bar hot path: "+checks+" assertions, "+(calls*4)+" production drawLayer calls passed");
 }
}'''

assert 'getDeclaredMethod(owner==View.class' not in source
assert 'addOnPreDrawListener' not in source
assert '"android.widget.ImageView","setImageResource"' not in source
with tempfile.TemporaryDirectory(prefix='statusbar-hotpath-') as tmp:
    path = Path(tmp) / 'TestAssetsHotPath.java'
    generated = harness.replace('// PRODUCTION', extract('static boolean drawLayer(View owner,View stateSource,') + '\n' + extract('static boolean drawLayer(View owner,View stateSource,Canvas canvas,String id,String layer,float left,float top,float right,float bottom,int color,boolean fitStaticPngInk)') + '\n' + extract('private static Entry virtualEntry('))
    generated = generated.replace('// CANRENDER', extract('boolean canRender()'))
    path.write_text(generated, encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, str(path)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestAssetsHotPath'], check=True)
