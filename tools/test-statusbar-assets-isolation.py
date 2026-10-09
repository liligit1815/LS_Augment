"""Exercise the production visibility, overflow and surface-isolation decisions."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarAssetsHook.java').read_text(encoding='utf-8')


def method(marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


harness = r'''import java.util.*;import java.lang.reflect.Method;import org.json.JSONObject;
public class TestAssetsIsolation {
 static class View {static final int VISIBLE=0;boolean attached=true,shown=true,bar;int visibility,window,width=20,height=20;float alpha=1,transition=1;String id="",moduleReason="",gridReason="";View parent;Map<String,Object> fields=new HashMap<>();
  boolean isAttachedToWindow(){return attached;}boolean isShown(){return shown;}int getWindowVisibility(){return window;}int getVisibility(){return visibility;}int getWidth(){return width;}int getHeight(){return height;}float getAlpha(){return alpha;}float getTransitionAlpha(){return transition;}View getParent(){return parent;}}
 static class ViewGroup extends View {String surface="control";}
 static Map<ViewGroup,Object> ROOTS=new HashMap<>();
 static String surfaceOf(View v){return v instanceof ViewGroup?((ViewGroup)v).surface:"";}
 static class StatusBarSurfaceSpec {static boolean valid(String value){return Arrays.asList("main","lock","notification","control").contains(value);}}
 static class NotificationIconContainer extends View{}
 static class QSPanel extends View{}
 static class ModernStatusBarView extends View {public Object binding=new Object();boolean condition;int predicateCalls;public boolean isIconVisible(){predicateCalls++;return condition;}}
 static class ModernStatusBarSatelliteView extends ModernStatusBarView{}
 static class UnrelatedView extends View {public boolean isIconVisible(){throw new AssertionError("ordinary views must not query Modern predicate");}}
 static Map<Class<?>,ModernVisibility> MODERN_VISIBILITY=new HashMap<>();
 static class StatusBarGridHook {static boolean isBarRoot(View v){return v.bar;}static String hiddenReason(View v){return v.gridReason;}}
 static class RedMagicLegacyUiHook {static String hiddenReason(View v){return v.moduleReason;}}
 static class StatusBarIconCatalog {static Object find(String id){return null;}}
 static String wifiId(View v){return "wifi";}static String mobileId(View v){return "mobile1";}
 static View find(View v,String id){return null;}
 static class JSONArray {final String label;JSONArray(String label){this.label=label;}}
 static boolean interactive=true;static String activeSurface="";static long mainObservedAt,lockObservedAt;
 static JSONArray mainSnapshot=new JSONArray("unseen"),lockSnapshot=new JSONArray("unseen"),notificationSnapshot=new JSONArray("unseen"),controlSnapshot=new JSONArray("unseen");
 static long notificationObservedAt,controlObservedAt;
 static boolean enabled=true,powerSave;static long scanCount,stateUpdateCount,drawCallbackCount,inventoryCount;static Map<Object,Object> DRAW_HOOKS=new HashMap<>();static Map<String,byte[]> BYTES=new HashMap<>();
 static class Art {boolean playing;Art(boolean value){playing=value;}boolean running(){return playing;}}
 static class Resource {Art art;Resource(Art value){art=value;}}
 static class Entry {Map<String,Resource> resources=new HashMap<>();}
 static List<Entry> entries=new ArrayList<>();static List<Entry> allEntries(){return entries;}
 static Object cachedField(Object raw,String...names){View v=(View)raw;for(String name:names)if(v.fields.containsKey(name))return v.fields.get(name);return null;}
 static String name(View v){return v.id;}
 // METHODS
 static int checks;static void check(boolean ok,String reason){checks++;if(!ok)throw new AssertionError(reason);}
 public static void main(String[] args)throws Exception{
  View root=new View();root.bar=true;View icon=new View();icon.parent=root;
  check(displayed(icon)&&nativeIcon(icon),"attached native icon remains eligible");
  icon.fields.put("mVisibleState",1);icon.fields.put("mDotAppearAmount",1f);check(!nativeIcon(icon)&&overflowDot(icon),"overflow dot cannot become replacement artwork");
  root.alpha=0;check(!overflowDot(icon),"hidden statusbar never publishes placeholder overflow dots");root.alpha=1;
  icon.moduleReason="hidden by module";check(!overflowDot(icon),"module-hidden icon cannot claim dot state");icon.moduleReason="";
  icon.gridReason="replaced by module";check(!overflowDot(icon),"module replacement takes precedence over overflow state");icon.gridReason="";
  icon.fields.put("mDotAppearAmount",0f);check(!overflowDot(icon),"unpainted dot placeholder is hidden");icon.fields.remove("mDotAppearAmount");
  check(!overflowDot(icon),"visible-state flag without observed dot does not claim an overflow indicator");
  View dot=new View();dot.parent=icon;dot.fields.put("mDotAppearAmount",1f);icon.fields.put("dotView",dot);check(overflowDot(icon),"visible Modern dot child reports overflow");
  dot.shown=false;check(!overflowDot(icon),"hidden Modern dot child is not overflow");dot.shown=true;dot.width=0;check(!overflowDot(icon),"zero-sized spare dot is not overflow");
  icon.fields.remove("dotView");icon.fields.put("mDotAppearAmount",1f);
  icon.fields.put("mVisibleState",2);check(!nativeIcon(icon)&&!overflowDot(icon),"native hidden state remains hidden");
  icon.fields.put("mVisibleState",0);icon.fields.put("mIconAppearAmount",.5f);check(!nativeIcon(icon),"native transition is preserved");
  icon.fields.put("mIconAppearAmount",1f);check(nativeIcon(icon),"stable fully appeared icon eligible");
  ModernStatusBarSatelliteView spare=new ModernStatusBarSatelliteView();spare.parent=root;spare.fields.put("iconVisibleState",0);
  check(!nativeIcon(spare),"attached Modern satellite placeholder obeys false binding visibility");
  View nested=new View();nested.parent=spare;check(!nativeIcon(nested),"native Modern condition also protects its nested assets");
  spare.condition=true;check(nativeIcon(spare)&&nativeIcon(nested),"true Modern condition permits stable native icon and subparts");
  spare.fields.put("iconVisibleState",2);check(!nativeIcon(spare)&&!overflowDot(spare),"Modern iconVisibleState hidden alias is respected");
  spare.fields.put("iconVisibleState",1);View modernDot=new View();modernDot.parent=spare;modernDot.fields.put("mVisibleState",1);modernDot.fields.put("mDotAppearAmount",1f);spare.fields.put("dotView",modernDot);
  check(!nativeIcon(spare)&&overflowDot(spare),"Modern native dot state is never replaced with artwork");
  spare.condition=false;check(!overflowDot(spare)&&!overflowDot(modernDot),"inactive Modern placeholder cannot report its preinitialized dot child as overflow");
  spare.fields.put("iconVisibleState",0);spare.binding=null;int queried=spare.predicateCalls;check(!nativeIcon(spare)&&spare.predicateCalls==queried,"unbound Modern placeholder is hidden without invoking an uninitialized binding");
  UnrelatedView ordinary=new UnrelatedView();check(nativeIcon(ordinary),"non-Modern classes never invoke an unrelated same-named predicate");int types=MODERN_VISIBILITY.size();nativeIcon(ordinary);check(MODERN_VISIBILITY.size()==types,"visibility reflection metadata is reused per class");
  root.alpha=0;check(!displayed(icon),"transparent root pauses every descendant animation");root.alpha=1;
  root.transition=0;check(!displayed(icon),"OEM transition alpha is respected");root.transition=1;
  icon.window=8;check(!displayed(icon),"hidden window pauses artwork");icon.window=0;
  icon.shown=false;check(!displayed(icon),"ancestor visibility pauses artwork");icon.shown=true;
  icon.attached=false;check(!displayed(icon)&&!privacyWindow(icon),"detached views do not render or register privacy overlays");icon.attached=true;
  check(notification(new NotificationIconContainer()),"notification-container subtree is excluded");
  View notification=new View();notification.id="notification_icon_area";check(notification(notification),"notification resource alias excluded");
  check(!notification(icon),"ordinary system icons remain eligible");
  QSPanel shade=new QSPanel();icon.parent=shade;check(!privacyWindow(icon),"shade privacy icons cannot be replaced by statusbar assets");
  icon.parent=root;check(privacyWindow(icon),"real bar privacy indicator eligible");
  icon.parent=null;check(privacyWindow(icon),"separate attached privacy-event window supported");
  List<String> states=new ArrayList<>(List.of("level3","default","no_internet","disconnected"));states.sort(Comparator.comparingInt(TestAssetsIsolation::statePriority));check(states.equals(List.of("disconnected","no_internet","level3","default")),"exceptional connectivity state beats strength and default artwork");
  check(semantic(icon,"","camera").equals("privacy.camera")&&semantic(icon,"","microphone").equals("privacy.microphone"),"native privacy slots have explicit supported semantic identities");
  captureSurface("main",new JSONArray("main-before-boot"),10);check(mainObservedAt==0,"unknown active surface stays unobserved");
  activeSurface="lock";captureSurface("lock",new JSONArray("hidden-lock"),20);check(lockObservedAt==20&&lockSnapshot.label.equals("hidden-lock"),"active lock remains observed even when its bar is intentionally hidden");
  captureSurface("main",new JSONArray("inactive-main"),30);check(mainObservedAt==0&&mainSnapshot.label.equals("unseen"),"attached inactive main does not acquire a fresh snapshot");
  activeSurface="main";captureSurface("main",new JSONArray("visible-main"),40);captureSurface("lock",new JSONArray("inactive-lock"),50);
  check(mainObservedAt==40&&mainSnapshot.label.equals("visible-main")&&lockObservedAt==20&&lockSnapshot.label.equals("hidden-lock"),"inactive lock retains both its prior rows and observation time");
  ViewGroup control=new ViewGroup();ROOTS.put(control,new Object());captureSurface("control",new JSONArray("controls"),55);check(controlObservedAt==55&&controlSnapshot.label.equals("controls"),"visible independent control header has its own snapshot");
  control.surface="notification";captureSurface("notification",new JSONArray("notifications"),56);check(notificationObservedAt==56&&controlObservedAt==55,"notification header cannot freshen a control snapshot");
  control.shown=false;captureSurface("notification",new JSONArray("invisible"),57);check(notificationObservedAt==56,"attached hidden header does not acquire a current observation");
  interactive=false;captureSurface("main",new JSONArray("screen-off"),60);check(mainObservedAt==40&&mainSnapshot.label.equals("visible-main"),"screen-off runtime reports cannot freshen cached page observations");
  Entry physical=new Entry(),part=new Entry();physical.resources.put("whole",new Resource(new Art(false)));physical.resources.put("loading",new Resource(null));part.resources.put("foreground",new Resource(new Art(true)));entries.add(physical);entries.add(part);BYTES.put("one",new byte[3]);BYTES.put("two",new byte[5]);
  JSONObject report=runtime();check(report.values.get("loadedDrawables").equals(2)&&report.values.get("playingAnimations").equals(1)&&report.values.get("cachedSourceBytes").equals(8),"runtime sums physical and virtual loaded resources, actual players and shared source bytes");
  part.resources.get("foreground").art.playing=false;report=runtime();check(report.values.get("playingAnimations").equals(0)&&report.values.get("interactive").equals(false),"screen-off report proves all actual players stopped");
  System.out.println("Status-bar asset isolation: "+checks+" assertions passed");
 }
}'''
members = '\n'.join(method(marker) for marker in [
    'private static boolean nativeIcon(', 'private static boolean displayed(',
    'private static boolean notification(', 'private static boolean privacyWindow(',
    'private static boolean overflowDot(',
    'private static int statePriority(',
    'private static String semantic(', 'private static boolean observingSurface(',
    'private static void captureSurface(',
    'private static void storeSurfaceSnapshot(',
    'private static JSONObject runtime(',
    'private static String privacySurface(',
    'private static boolean nativeCondition(', 'private static boolean nativeConditions(',
    'private static final class ModernVisibility ',
])
with tempfile.TemporaryDirectory(prefix='statusbar-assets-isolation-') as tmp:
    path = Path(tmp) / 'TestAssetsIsolation.java'
    path.write_text(harness.replace('// METHODS', members), encoding='utf-8')
    json_dir = Path(tmp) / 'org/json'
    json_dir.mkdir(parents=True)
    (json_dir / 'JSONException.java').write_text('package org.json;public class JSONException extends Exception{}', encoding='utf-8')
    (json_dir / 'JSONObject.java').write_text('package org.json;import java.util.*;public class JSONObject {public Map<String,Object> values=new HashMap<>();public JSONObject put(String name,Object value)throws JSONException{values.put(name,value);return this;}}', encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, *map(str, Path(tmp).rglob('*.java'))], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestAssetsIsolation'], check=True)
