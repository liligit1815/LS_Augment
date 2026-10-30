"""Run production device availability and editor load/restore/save methods offline.

Extracts complete methods from FeatureEditorController, the real generic
feature-switch initialization, and the full-brightness driver probe. Android
widgets, Root results, scheduling, config persistence and unrelated status
editors are facades; no device rendering or physical driver support is asserted.
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
    "android/content/Context.java": "package android.content;public class Context {public static final SharedPreferences diagnostics=new SharedPreferences();public SharedPreferences getSharedPreferences(String name,int mode){return diagnostics;}}",
    "android/content/SharedPreferences.java": "package android.content;public class SharedPreferences {public final java.util.Map<String,String> values=new java.util.HashMap<>();public int getInt(String key,int fallback){return values.containsKey(key)?Integer.parseInt(values.get(key)):fallback;}public String getString(String key,String fallback){return values.getOrDefault(key,fallback);}}",
    "ls/augment/com/FanHardwareIdentity.java": "package ls.augment.com;public class FanHardwareIdentity {public static String current(){return \"firmware-test\";}}",
    "android/os/Build.java": "package android.os;public class Build {public static String DEVICE,MODEL,PRODUCT,FINGERPRINT=\"fixture\";}",
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
    "android/view/View.java": "package android.view;public class View {public static final int GONE=8;public void setVisibility(int value){}}",
    "android/widget/TextView.java": "package android.widget;public class TextView extends android.view.View {public void setTag(Object value){}}",
    "ls/augment/com/NativeIslandSceneOptions.java": "package ls.augment.com;class NativeIslandSceneOptions {static final String ENABLED=\"ls_augment_native_island_scene_support\";}",
    "ls/augment/com/SystemUiOptions.java": "package ls.augment.com;class SystemUiOptions {static final String ISLAND=\"ls_augment_rm_dynamic_island\",VOLUME_SAME_SIDE=\"ls_augment_rm_volume_same_side\",ISLAND_STATUS_AVOIDANCE=\"ls_augment_rm_island_status_avoidance\";}",
    "ls/augment/com/NativeIslandMode.java": "package ls.augment.com;class NativeIslandMode{static String MODERN=\"fullscreen\";static String detect(Object c){return \"ordinary\";}static String name(String m){return \"星云岛\";}}",
    "ls/augment/com/MagicIslandPolicy.java": "package ls.augment.com;class MagicIslandPolicy{static String detail(String id){return \"\";}}",
    "ls/augment/com/VolumePositionSettings.java": "package ls.augment.com;class VolumePositionSettings {static boolean multiAppEnabled(Object context){return true;}}",
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

GENERIC = r"""package ls.augment.com;import android.os.*;import android.widget.*;import android.view.View;import java.util.*;
class GenericFeatureHost extends Host {
final UiKit ui=new UiKit();final Map<String,String> draft=new HashMap<>();int writes;String saved;
GenericFeatureHost(String value){saved=value;draft.put(BrightnessRange.ENABLED,value);}
String value(String key){return draft.getOrDefault(key,"0");}
boolean deviceFeatureAvailable(String key){return DeviceFeatureAvailability.available(key,android.os.Build.DEVICE,android.os.Build.MODEL,android.os.Build.PRODUCT);}
// Island capability queries are unrelated to brightness and must not be invoked here.
boolean nativeIslandEnabled(){throw new AssertionError("brightness queried island enable state");}
String nativeIslandUnavailable(){throw new AssertionError("brightness queried island unavailable state");}
String nativeSceneUnavailable(String key){throw new AssertionError("brightness queried island scene capability");}
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
 for(String key:FAN_KEYS){
  check(DeviceFeatureAvailability.available(key,"NX809J","NX809J","NX809J"),"verified model available "+key);
  check(DeviceFeatureAvailability.unavailableReason(key,"NX809J","NX809J","NX809J").isEmpty(),"verified model has no unsupported reason");
  check(!DeviceFeatureAvailability.available(key,"NX789J","NX789J","NX789J"),"log device not falsely supported "+key);
  check(!DeviceFeatureAvailability.unavailableReason(key,"NX789J","NX789J","NX789J").isEmpty(),"unsupported device has reason "+key);
 }
 check(DeviceFeatureAvailability.available("unrelated_key","NX789J","NX789J","NX789J"),"unrelated features unchanged");
 for(String name:new String[]{"NX809J","NX789J","unknown","",null}) {
  check(DeviceFeatureAvailability.available(BrightnessRange.ENABLED,name,name,name),"brightness is not model gated: "+name);
  check(DeviceFeatureAvailability.unavailableReason(BrightnessRange.ENABLED,name,name,name).isEmpty(),"brightness has no model restriction text: "+name);
 }
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
 check(brightness.isChecked()&&brightness.isEnabled(),"brightness stays available on previously excluded NX789J");
 check(generic.saved.equals("1")&&generic.value(BrightnessRange.ENABLED).equals("1")&&generic.writes==0,"brightness rendering preserves saved/draft values and cannot enqueue reset");
 check("native description".equals(generic.ui.lastSummary),"brightness retains the shared help entry");
 check(generic.ui.lastText==null,"brightness adds no small text below its feature row");
 brightness.userToggle(false);check(generic.writes==1&&generic.value(BrightnessRange.ENABLED).equals("0"),"previously excluded model brightness can save changes");
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
static void brightnessProbe(){
 for(String name:new String[]{"NX809J","NX789J","unknown",null}) {
  device(name);RootShell.output="8190\n";RootShell.success=true;BrightnessProbeHost probe=new BrightnessProbeHost();probe.run();
  check(probe.ready&&probe.checked&&probe.error.isEmpty(),"real compatible driver probe accepts model "+name);
  check(RootShell.command.equals("cat /sys/class/backlight/panel0-backlight/max_brightness"),"only the fixed read-only backlight interface is probed");
 }
 for(String output:new String[]{"","4095","8191","not a driver value"}) {
  RootShell.output=output;RootShell.success=true;BrightnessProbeHost probe=new BrightnessProbeHost();probe.run();
  check(!probe.ready&&probe.checked&&probe.error.contains("保持原厂亮度条"),"incompatible/missing interface keeps native brightness: "+output);
 }
 RootShell.output="8190";RootShell.success=false;BrightnessProbeHost probe=new BrightnessProbeHost();probe.run();
 check(!probe.ready&&probe.checked&&!probe.error.isEmpty(),"Root failure cannot enable the driver transport despite plausible output");
}
static void modernCapability(){
 device("NX819J");AppConfig c=configured("1");FeatureEditorController e=new FeatureEditorController(c);e.load();
 for(String key:FAN_KEYS)check(!e.switches.get(key).isEnabled(),"new device native until verified "+key);
 android.content.Context.diagnostics.values.put(FanCapabilityEvidence.LEVELS,"hardware_identity=firmware-test;capability=verified_levels_1_5;level_writes=1;fan_enable_writes=0");
 android.content.Context.diagnostics.values.put(FanCapabilityEvidence.SCREEN,"hardware_identity=firmware-test;scope=running_session;hooks=2;fan_enable_writes=0");
 e=new FeatureEditorController(c);e.load();
 for(String key:FAN_KEYS)check(e.switches.get(key).isEnabled()&&e.switches.get(key).isChecked(),"matching capability enables saved setting "+key);
 e.saveNow();check(c.writes.isEmpty(),"availability refresh does not rewrite saved configuration");
 String levels=android.content.Context.diagnostics.values.get(FanCapabilityEvidence.LEVELS);
 check(!FanCapabilityEvidence.levels(levels,"other-firmware"),"old firmware proof rejected");
 check(!FanCapabilityEvidence.levels(levels.replace("level_writes=1","level_writes=10"),"firmware-test"),"partial token never accepted");
 check(!FanCapabilityEvidence.levels(levels.replace("fan_enable_writes=0","fan_enable_writes=1"),"firmware-test"),"unsafe enable contract rejected");
 check(!FanCapabilityEvidence.screen("hardware_identity=firmware-test;scope=running_session;hooks=1","firmware-test"),"partial hook install rejected");
 android.content.Context.diagnostics.values.clear();
}
public static void main(String[] args){policy();unsupported();supported();modernCapability();brightnessProbe();System.out.println("PASS device availability + production load/restore/bundle/save + brightness interface probe: "+checks+" assertions (offline UI/Root facades)");}
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
    if not any(name in initialization for name in ("DeviceFeatureAvailability", "deviceFeatureAvailable", "FanFeatureAvailability")):
        raise RuntimeError("Production generic feature availability initialization is not ready")
    initialization = initialization.replace('gateMemory.contains("value:"+key)', 'false')
    initialization = initialization.replace('gateMemory.getString("value:"+key,value(key))', 'value(key)')
    initialization = initialization.replace('gateMemory.getBoolean("open:"+key,active)', 'active')
    files = dict(STUBS)
    files["ls/augment/com/FeatureEditorController.java"] = EDITOR.replace("@@METHODS@@", methods)
    files["ls/augment/com/GenericFeatureHost.java"] = GENERIC.replace("@@INITIALIZATION@@", initialization)
    files["ls/augment/com/TestDeviceFeatureAvailability.java"] = TEST
    brightness = (SRC / "FullBrightnessControl.java").read_text(encoding="utf-8")
    node = re.search(r'private static final String NODE\s*=\s*"([^"]+)";', brightness)
    if not node:
        raise RuntimeError("Missing production brightness node")
    files["ls/augment/com/BrightnessProbeHost.java"] = """package ls.augment.com;
class BrightnessProbeHost {
int physicalMax,calibratedMin,calibratedMax;final android.content.SharedPreferences calibration=new android.content.SharedPreferences();
private static final String NODE="@@NODE@@";boolean ready,checked;String error="",driverMaximum="",probeState="";
void run(){probe();}
@@PROBE@@
}
class RootShell {static boolean success;static String output,command;
static class Result {String output=RootShell.output;boolean isSuccess(){return RootShell.success;}}
static Result run(String value,Object input,int timeout,int maximum){command=value;return new Result();}}
""".replace("@@NODE@@", node.group(1)).replace("@@PROBE@@", method(brightness, "probe")+"\n"+method(brightness,"calibrationHelp"))
    availability = (SRC / "DeviceFeatureAvailability.java").read_text(encoding="utf-8")
    app_source = (SRC / "AppConfig.java").read_text(encoding="utf-8")
    schema_source = (SRC / "ConfigSchema.java").read_text(encoding="utf-8")
    names = set(re.findall(r"AppConfig\.(\w+)", methods + availability + EDITOR + TEST + (SRC / "FanFeatureAvailability.java").read_text(encoding="utf-8"))) - {"SaveResult"}
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
        paths += [str(SRC / name) for name in ("DeviceFeatureAvailability.java", "BrightnessRange.java", "FanScreenOffPolicy.java", "FanTilePolicy.java", "FanFeatureAvailability.java", "FanCapabilityEvidence.java")]
        subprocess.run([str(jdk / ("javac" + suffix)), "-J-Duser.language=en", "-J-Duser.country=US", "-encoding", "UTF-8", "--release", "17", "-d", str(folder / "classes"), *paths], check=True, timeout=60)
        subprocess.run([str(jdk / ("java" + suffix)), "-Dfile.encoding=UTF-8", "-cp", str(folder / "classes"), "ls.augment.com.TestDeviceFeatureAvailability"], check=True, timeout=30)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
