"""Run production device availability and editor load/restore/save methods offline.

Extracts complete methods from FeatureEditorController and the real generic
feature-switch initialization. Android widgets, scheduling, config persistence
and unrelated status editors are facades; no device rendering is asserted.
"""
from pathlib import Path
import argparse
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"


def block(source, start):
    opening = source.index("{", start)
    depth, quoted, escaped, line_comment, block_comment = 1, None, False, False, False
    index = opening + 1
    while depth:
        char = source[index]
        following = source[index:index + 2]
        if line_comment:
            if char == "\n":
                line_comment = False
        elif block_comment:
            if following == "*/":
                block_comment = False
                index += 1
        elif quoted:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == quoted:
                quoted = None
        elif following == "//":
            line_comment = True
            index += 1
        elif following == "/*":
            block_comment = True
            index += 1
        elif char in ('"', "'"):
            quoted = char
        elif char == "{":
            depth += 1
        elif char == "}":
            depth -= 1
        index += 1
    return source[start:index]


def method(source, name, arguments=None):
    pattern = r"(?m)^\s*(?:@Override\s+)?(?:private|protected|public)\s+(?:static\s+)?[\w<>?, ]+\s+" + re.escape(name) + r"\s*\(([^)]*)\)\s*\{"
    for match in re.finditer(pattern, source):
        if arguments is None or match.group(1).strip() == arguments:
            return block(source, match.start())
    raise RuntimeError("Required production method is not ready: " + name + "(" + (arguments or "") + ")")


def constants(source, owner, names):
    result = []
    declarations = dict(re.findall(r"(?:public\s+)?static\s+final\s+String\s+(\w+)\s*=\s*([^;]+);", source))
    for name in sorted(names):
        if name not in declarations:
            raise RuntimeError("Missing real constant " + owner + "." + name)
        result.append("static final String " + name + "=" + declarations[name] + ";")
    return "\n".join(result)


STUBS = {
    "android/content/Context.java": "package android.content;public class Context {}",
    "android/os/Build.java": "package android.os;public class Build {public static String DEVICE,MODEL,PRODUCT;}",
    "android/os/Bundle.java": """package android.os;import java.util.*;
public class Bundle {
private final Map<String,Object> values=new LinkedHashMap<>();
public void putString(String key,String value){values.put(key,value);}public String getString(String key){return (String)values.get(key);}
public void putBoolean(String key,boolean value){values.put(key,value);}public boolean getBoolean(String key,boolean fallback){return values.containsKey(key)?(Boolean)values.get(key):fallback;}
public void putBundle(String key,Bundle value){values.put(key,value);}public Bundle getBundle(String key){return (Bundle)values.get(key);}
public void putStringArrayList(String key,ArrayList<String> value){values.put(key,value);}
@SuppressWarnings("unchecked") public ArrayList<String> getStringArrayList(String key){return (ArrayList<String>)values.get(key);}
public boolean containsKey(String key){return values.containsKey(key);}public Set<String> keySet(){return values.keySet();}public boolean isEmpty(){return values.isEmpty();}}
""",
    "android/widget/Switch.java": """package android.widget;public class Switch {
public interface Listener {void changed(Switch button,boolean value);}private boolean checked,enabled=true;private Listener listener;
public int callbacks;public Switch(Object context){}public void setTag(Object tag){}public void setEnabled(boolean value){enabled=value;}public boolean isEnabled(){return enabled;}
public boolean isChecked(){return checked;}public void setChecked(boolean value){if(checked==value)return;checked=value;if(listener!=null){callbacks++;listener.changed(this,value);}}
public void setOnCheckedChangeListener(Listener value){listener=value;}public void userToggle(boolean value){if(enabled)setChecked(value);}}
""",
    "android/widget/EditText.java": "package android.widget;public class EditText {private String text=" + '""' + ";public String getText(){return text;}public void setText(String value){text=value;}public void setError(String value){}}",
    "android/widget/Button.java": "package android.widget;public class Button {public boolean enabled;}",
    "android/widget/TextView.java": "package android.widget;public class TextView {public void setTag(Object value){}}",
    "android/widget/LinearLayout.java": """package android.widget;public class LinearLayout {
public static final int VERTICAL=1;public LinearLayout(Object context){}public void setOrientation(int value){}public void setTag(Object value){}
public void addView(Object view,Object params){}public void setPadding(int a,int b,int c,int d){}}
""",
    "ls/augment/com/UiKit.java": """package ls.augment.com;import android.os.Bundle;import android.widget.*;
class UiKit {String lastSummary,lastText;int muted;
int dp(int value){return value;}Object wrap(){return null;}Object margins(int a,int b,int c,int d){return null;}
TextView text(String value,int size,int color,boolean bold){lastText=value;return new TextView();}
LinearLayout featureRow(String title,String description,Switch control){lastSummary=description;return new LinearLayout(null);}
void saveState(Bundle state){}void setButtonEnabled(Button button,boolean value){if(button!=null)button.enabled=value;}
static class Fold {final Switch control;boolean expanded;Fold(Switch control){this.control=control;}void sync(){expanded=control.isChecked();}}
}
""",
    "ls/augment/com/Host.java": """package ls.augment.com;class Host extends android.content.Context {
protected void onSaveInstanceState(android.os.Bundle state){}boolean isDestroyed(){return false;}}
""",
    "ls/augment/com/StatusBarLayoutSpec.java": """package ls.augment.com;import java.util.*;class StatusBarLayoutSpec {
static class Position {}static class ParseResult {boolean valid;StatusBarLayoutSpec spec=new StatusBarLayoutSpec();}
static ParseResult parse(String value){return new ParseResult();}Map<String,Position> positions(){return Map.of();}
static String serialize(Map<String,Position> values){return "";}}
""",
    "ls/augment/com/ScreenAutomation.java": "package ls.augment.com;class ScreenAutomation {static void sync(Object owner){}}",
}

EDITOR = r"""package ls.augment.com;
import android.os.*;import android.widget.*;import java.util.*;
class FeatureEditorController extends Host {
static final String MODULE_FAN_CONTROL="fan_control",MODULE_SHOULDER="shoulder",MODULE_AUDIO_GAIN="audio_gain",MODULE_AUTOMATION="automation";
String section=MODULE_FAN_CONTROL;boolean embedded=true,loading,dirty;long changeGeneration,queuedGeneration=-1;int pendingSaves;
final AppConfig config;final UiKit ui=new UiKit();final Button save=new Button();final LinearLayout page=new LinearLayout(this);
final Map<String,Switch> switches=new LinkedHashMap<>();final Map<String,EditText> inputs=new LinkedHashMap<>();
final Map<String,Slider> sliders=new LinkedHashMap<>();final Map<String,Choice> choices=new LinkedHashMap<>();
final Map<String,Long> fanEditedKeys=new LinkedHashMap<>();final List<UiKit.Fold> folds=new ArrayList<>();
final Map<String,StatusBarLayoutSpec.Position> positionValues=new LinkedHashMap<>();
final Map<String,PositionControl> positionControls=new LinkedHashMap<>();final Map<String,IconControl> iconControls=new LinkedHashMap<>();
final Scheduler main=new Scheduler();final Executor executor=new Executor();final Runnable statusPoll=()->{};
final Runnable statusAutoSave=()->save(true);
FeatureEditorController(AppConfig config){this.config=config;
 for(String key:TestDeviceFeatureAvailability.FAN_KEYS){addSwitch(page,key,key,"",false);switches.get(key).setEnabled(deviceFeatureAvailable(key));folds.add(new UiKit.Fold(switches.get(key)));}
 choices.put(ConfigSchema.FAN_FIXED_LEVEL,new Choice(ConfigSchema.FAN_FIXED_LEVEL));}
static class Scheduler {final List<Runnable> delayed=new ArrayList<>();void removeCallbacks(Runnable r){delayed.removeIf(value->value==r);}void postDelayed(Runnable r,long delay){delayed.add(r);}void post(Runnable r){r.run();}}
static class Executor {boolean isShutdown(){return false;}void execute(Runnable r){r.run();}}
class Choice {final String key;String selected="1";Choice(String key){this.key=key;}void select(String value){selected=value;}}
static class Bar {void setProgress(int value){}}static class Slider {String key;boolean percent;int min,max,step=1;Bar bar=new Bar();void render(){}void setValue(int value){}String serialized(){return "0";}}
static class PositionControl {String id;void load(StatusBarLayoutSpec.Position value){}}
static class IconControl {String id;void load(StatusBarLayoutSpec.Position value){}void save(Map<String,StatusBarLayoutSpec.Position> value){}}
boolean isFreeformModule(){return false;}boolean isRapidModule(){return false;}boolean isStatusModule(){return false;}boolean isInlineGroupModule(){return false;}
void refreshRapidCompatibilityAsync(){}void renderRuntimeStatus(){}void toast(String value){}String restartHint(){return "";}
AppConfig.SaveResult saveConfiguration(Map<String,String> updates){return config.save(updates);}
void load(){loadValues();}void restore(Bundle state){restoreDraft(state);}void saveNow(){save(true);}
Bundle rotate(){Bundle state=new Bundle();onSaveInstanceState(state);return state;}
void choiceEdit(String key,String value){choices.get(key).select(value);markFanEdited(key);markDirty();}
@@METHODS@@
}
"""

GENERIC = r"""package ls.augment.com;import android.os.*;import android.widget.*;import java.util.*;
class GenericFeatureHost extends Host {
final UiKit ui=new UiKit();final Map<String,String> draft=new HashMap<>();int writes;String saved;
GenericFeatureHost(String value){saved=value;draft.put(BrightnessRange.ENABLED,value);}
String value(String key){return draft.getOrDefault(key,"0");}
boolean deviceFeatureAvailable(String key){return DeviceFeatureAvailability.available(key,android.os.Build.DEVICE,android.os.Build.MODEL,android.os.Build.PRODUCT);}
Switch brightness(){
 NativeFeatureGroups.Feature f=new NativeFeatureGroups.Feature();String key=BrightnessRange.ENABLED;EnhancementOption option=new EnhancementOption();
 LinearLayout card=new LinearLayout(this);Map<String,Gate> gateMemory=Map.of();
 @@INITIALIZATION@@
 toggle.setOnCheckedChangeListener((view,on)->{writes++;draft.put(key,on?"1":"0");});return toggle;
}
static class Gate {}
}
class EnhancementOption {}class FeatureHelp {static String forOption(EnhancementOption option){return "native description";}}
class NativeFeatureGroups {static class Feature {String id="systemui:full_brightness",title="完整亮度",toggleKey=BrightnessRange.ENABLED,comparison="boolean",noOpValue="0";}}
class ValueOverrideState {static boolean active(String comparison,String value,String none){return !value.equals(none);}}
"""

TEST = r"""package ls.augment.com;
import android.os.*;import android.widget.*;import java.util.*;
public final class TestDeviceFeatureAvailability {
static int checks;static final String[] FAN_KEYS={AppConfig.FAN_FIXED_ENABLED,AppConfig.FAN_TILE_ENHANCEMENT_ENABLED,AppConfig.FAN_SCREEN_OFF_ENABLED};
static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
static void device(String name){Build.DEVICE=Build.MODEL=Build.PRODUCT=name;}
static AppConfig configured(String value){AppConfig c=new AppConfig();for(String key:FAN_KEYS)c.values.put(key,value);c.values.put(ConfigSchema.FAN_FIXED_LEVEL,"3");return c;}
static void policy(){
 for(String key:new String[]{BrightnessRange.ENABLED,FAN_KEYS[0],FAN_KEYS[1],FAN_KEYS[2]}){
  check(DeviceFeatureAvailability.available(key,"NX809J","NX809J","NX809J"),"verified model available "+key);
  check(DeviceFeatureAvailability.unavailableReason(key,"NX809J","NX809J","NX809J").isEmpty(),"verified model has no unsupported reason");
  check(!DeviceFeatureAvailability.available(key,"NX789J","NX789J","NX789J"),"log device not falsely supported "+key);
  check(!DeviceFeatureAvailability.unavailableReason(key,"NX789J","NX789J","NX789J").isEmpty(),"unsupported device has reason "+key);
 }
 check(DeviceFeatureAvailability.available("unrelated_key","NX789J","NX789J","NX789J"),"unrelated features unchanged");
 check(BrightnessRange.supportedDevice("nx809j",null)&&BrightnessRange.supportedDevice(null,"nx809j"),"brightness original device/model aliases retained");
 check(!BrightnessRange.supportedDevice(null,null)&&!BrightnessRange.supportedDevice("NX789J","NX789J"),"unknown and log device brightness rejected");
 check(!DeviceFeatureAvailability.available(BrightnessRange.ENABLED,"NX789J","NX789J","NX809J"),"product alias cannot expand brightness hardware contract");
 for(String key:FAN_KEYS)check(DeviceFeatureAvailability.available(key,"other","other","NX809J"),"existing fan product alias remains supported "+key);
}
static void unsupported(){
 device("NX789J");AppConfig config=configured("1");FeatureEditorController e=new FeatureEditorController(config);e.load();
 check(config.writes.isEmpty()&&!e.dirty&&e.fanEditedKeys.isEmpty(),"load creates no edit or write");
 for(String key:FAN_KEYS){check(!e.switches.get(key).isChecked()&&!e.switches.get(key).isEnabled(),"unsupported saved 1 shows off and disabled "+key);check(config.get(key).equals("1"),"saved value preserved "+key);}
 e.saveNow();check(config.writes.isEmpty(),"opening unsupported page performs no save");
 for(UiKit.Fold fold:e.folds)check(!fold.expanded,"unsupported configuration stays folded");
 Bundle state=e.rotate();for(String key:FAN_KEYS)check(state.getBundle("editor-values").getString(key).equals("1"),"rotation serializes saved value instead of forced display 0");
 FeatureEditorController rotated=new FeatureEditorController(config);rotated.load();rotated.restore(state);rotated.saveNow();
 check(config.writes.isEmpty()&&rotated.fanEditedKeys.isEmpty(),"real restoreDraft plus save never writes untouched unsupported keys");
 for(String key:FAN_KEYS)check(!rotated.switches.get(key).isChecked(),"restoreDraft cannot reopen unsupported saved switch");
 FeatureEditorController standalone=new FeatureEditorController(config);standalone.embedded=false;standalone.load();standalone.restore(state);standalone.saveNow();
 check(config.writes.isEmpty()&&standalone.fanEditedKeys.isEmpty(),"standalone rotation may mark draft dirty but never writes forced display values");
 Bundle old=new Bundle();Bundle oldValues=new Bundle();ArrayList<String> edited=new ArrayList<>();
 for(String key:FAN_KEYS){oldValues.putString(key,"0");edited.add(key);}oldValues.putString(ConfigSchema.FAN_FIXED_LEVEL,"5");edited.add(ConfigSchema.FAN_FIXED_LEVEL);
 old.putBundle("editor-values",oldValues);old.putStringArrayList("fan-edited-keys",edited);
 FeatureEditorController legacy=new FeatureEditorController(config);legacy.load();legacy.restore(old);legacy.saveNow();
 check(config.writes.isEmpty()&&legacy.fanEditedKeys.isEmpty(),"stale edited-key Bundle cannot clear saved fan flags or send unsupported speed");
 for(String key:FAN_KEYS)check(config.get(key).equals("1")&&!legacy.switches.get(key).isChecked(),"old draft does not mutate saved flags");
 check(config.get(ConfigSchema.FAN_FIXED_LEVEL).equals("3"),"unsupported old speed edit preserved original saved speed");
 for(String key:FAN_KEYS)oldValues.putString(key,"1");
 FeatureEditorController oldOn=new FeatureEditorController(config);oldOn.load();oldOn.restore(old);oldOn.saveNow();
 check(config.writes.isEmpty()&&oldOn.fanEditedKeys.isEmpty(),"old checked and edited Bundle is re-gated under loading without phantom edits");
 for(String key:FAN_KEYS)check(!oldOn.switches.get(key).isChecked(),"legacy checked draft remains visually off "+key);
 legacy.fanEditedKeys.put(FAN_KEYS[0],legacy.changeGeneration+1);legacy.fanEditedKeys.put(ConfigSchema.FAN_FIXED_LEVEL,legacy.changeGeneration+1);
 legacy.dirty=true;legacy.changeGeneration++;legacy.queuedGeneration=-1;legacy.saveNow();
 check(config.writes.isEmpty(),"save itself rejects stale unsupported edited keys");
 GenericFeatureHost generic=new GenericFeatureHost("1");Switch brightness=generic.brightness();
 check(!brightness.isChecked()&&!brightness.isEnabled(),"generic unsupported brightness switch shows off and disabled");
 check(generic.saved.equals("1")&&generic.value(BrightnessRange.ENABLED).equals("1")&&generic.writes==0,"brightness rendering preserves saved/draft values and cannot enqueue reset");
 check(generic.ui.lastSummary!=null&&!generic.ui.lastSummary.equals("native description")&&!generic.ui.lastSummary.isEmpty(),"generic row displays unsupported reason");
 check(generic.ui.lastText!=null&&generic.ui.lastText.contains("NX789J"),"unsupported reason is also shown as explicit visible machine text");
 brightness.userToggle(true);check(generic.writes==0,"disabled brightness cannot be toggled by user");
}
static void supported(){
 device("NX809J");AppConfig config=configured("0");FeatureEditorController e=new FeatureEditorController(config);e.load();
 for(String key:FAN_KEYS)check(e.switches.get(key).isEnabled()&&!e.switches.get(key).isChecked(),"verified fan controls retain initial behavior");
 e.switches.get(FAN_KEYS[0]).userToggle(true);e.saveNow();
 check(config.writes.size()==1&&config.get(FAN_KEYS[0]).equals("1"),"verified fixed fan edit still saves");
 Map<String,String> written=config.writes.get(0);check(!written.containsKey(FAN_KEYS[1])&&!written.containsKey(FAN_KEYS[2]),"only explicitly edited fan switch is saved");
 check("1".equals(written.get(AppConfig.GAME_MASTER))&&written.containsKey(ConfigSchema.FAN_TILE_REQUEST),"existing fixed fan command and master side effects retained");
 config.writes.clear();e.choiceEdit(ConfigSchema.FAN_FIXED_LEVEL,"5");Bundle state=e.rotate();
 FeatureEditorController restored=new FeatureEditorController(config);restored.load();restored.restore(state);restored.saveNow();
 check(config.writes.size()==1&&config.get(ConfigSchema.FAN_FIXED_LEVEL).equals("5"),"real restoreDraft retains verified unsaved speed edit");
 config.writes.clear();Bundle clean=restored.rotate();FeatureEditorController next=new FeatureEditorController(config);next.load();next.restore(clean);next.saveNow();
 check(config.writes.isEmpty(),"verified rotation after save cannot rewrite clean values");
 FeatureEditorController standalone=new FeatureEditorController(config);standalone.embedded=false;standalone.load();standalone.restore(clean);standalone.saveNow();
 check(config.writes.isEmpty(),"verified standalone rotation after save cannot rewrite clean values");
 GenericFeatureHost generic=new GenericFeatureHost("1");Switch brightness=generic.brightness();
 check(brightness.isChecked()&&brightness.isEnabled()&&generic.writes==0,"verified brightness initializes unchanged with no write");
 brightness.userToggle(false);check(generic.writes==1&&generic.value(BrightnessRange.ENABLED).equals("0"),"verified brightness user edit still reaches listener");
 device("NX789J");restored.section="unrelated";check(restored.fanSettingAvailableForTest(ConfigSchema.FAN_FIXED_LEVEL),"non-fan section filter unchanged");
}
public static void main(String[] args){policy();unsupported();supported();System.out.println("PASS device feature availability + production load/restore/bundle/save: "+checks+" assertions (offline UI facades)");}
}
"""


def sources():
    editor_source = (SRC / "FeatureEditorController.java").read_text(encoding="utf-8")
    names = ["deviceFeatureAvailable", "applyDeviceAvailability", "persistedSwitchValue", "fanSettingAvailable",
             "loadValues", "restoreDraft", "onSaveInstanceState", "markFanEdited", "markDirty", "enabledIn", "addSwitch"]
    methods = "\n".join(method(editor_source, name) for name in names)
    methods += "\n" + method(editor_source, "save", "boolean automatic")
    if "fanVerifiedLevels(" in methods:
        methods += "\n" + method(editor_source, "fanVerifiedLevels")
    methods += "\nboolean fanSettingAvailableForTest(String key){return fanSettingAvailable(key);}\n"
    generic_source = (SRC / "EnhancementSettingsActivity.java").read_text(encoding="utf-8")
    feature = method(generic_source, "feature")
    start = feature.index("Switch toggle=")
    initialization = feature[start:feature.index("LinearLayout content=", start)]
    # The initialization must include the production availability check, not a facade substitute.
    if "DeviceFeatureAvailability" not in initialization and "deviceFeatureAvailable" not in initialization:
        raise RuntimeError("Production generic feature availability initialization is not ready")
    initialization = initialization.replace('gateMemory.contains("value:"+key)', 'false')
    initialization = initialization.replace('gateMemory.getString("value:"+key,value(key))', 'value(key)')
    initialization = initialization.replace('gateMemory.getBoolean("open:"+key,active)', 'active')
    files = dict(STUBS)
    files["ls/augment/com/FeatureEditorController.java"] = EDITOR.replace("@@METHODS@@", methods)
    files["ls/augment/com/GenericFeatureHost.java"] = GENERIC.replace("@@INITIALIZATION@@", initialization)
    files["ls/augment/com/TestDeviceFeatureAvailability.java"] = TEST
    availability = (SRC / "DeviceFeatureAvailability.java").read_text(encoding="utf-8")
    app_source = (SRC / "AppConfig.java").read_text(encoding="utf-8")
    schema_source = (SRC / "ConfigSchema.java").read_text(encoding="utf-8")
    names = set(re.findall(r"AppConfig\.(\w+)", methods + availability + EDITOR + TEST)) - {"SaveResult"}
    app_constants = constants(app_source, "AppConfig", names)
    fan_policy = (SRC / "FanTilePolicy.java").read_text(encoding="utf-8")
    schema_names = set(re.findall(r"ConfigSchema\.(\w+)", app_constants + methods + availability + EDITOR + TEST + fan_policy)) - {"normalize", "truthy", "selectionUpdates"}
    files["ls/augment/com/ConfigSchema.java"] = "package ls.augment.com;class ConfigSchema {\n" + constants(schema_source, "ConfigSchema", schema_names) + "\nstatic String normalize(String key,String value){return value;}static boolean truthy(String value){return value.equals(\"1\");}}"
    files["ls/augment/com/AppConfig.java"] = """package ls.augment.com;import java.util.*;class AppConfig {
@@CONSTANTS@@
final Map<String,String> values=new HashMap<>();final List<Map<String,String>> writes=new ArrayList<>();
String get(String key){return values.getOrDefault(key,"0");}boolean getBoolean(String key){return get(key).equals("1");}
float getFloat(String key,float fallback){try{return Float.parseFloat(get(key));}catch(NumberFormatException e){return fallback;}}
static class SaveResult {boolean success=true;String message="saved";}
SaveResult save(Map<String,String> changes){writes.add(new LinkedHashMap<>(changes));values.putAll(changes);return new SaveResult();}
}
""".replace("@@CONSTANTS@@", app_constants)
    return files


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", type=Path, default=Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin"))
    args = parser.parse_args()
    jdk = args.jdk / "bin" if (args.jdk / "bin").is_dir() else args.jdk
    suffix = ".exe" if (jdk / "javac.exe").exists() else ""
    with tempfile.TemporaryDirectory(prefix="duo-device-availability-ui-") as temporary:
        folder = Path(temporary)
        paths = []
        for name, content in sources().items():
            path = folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            paths.append(str(path))
        paths += [str(SRC / name) for name in ("DeviceFeatureAvailability.java", "BrightnessRange.java", "FanScreenOffPolicy.java", "FanTilePolicy.java")]
        subprocess.run([str(jdk / ("javac" + suffix)), "-J-Duser.language=en", "-J-Duser.country=US", "-encoding", "UTF-8", "--release", "17", "-d", str(folder / "classes"), *paths], check=True, timeout=60)
        subprocess.run([str(jdk / ("java" + suffix)), "-Dfile.encoding=UTF-8", "-cp", str(folder / "classes"), "ls.augment.com.TestDeviceFeatureAvailability"], check=True, timeout=30)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
