"""Exercise the actual editor refresh method with late and revoked OEM evidence."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / "android/app/src/main/java/ls/augment/com/FeatureEditorController.java").read_text(encoding="utf-8")
start = source.index("    private void refreshFanAvailability() {")
end = source.index("    private boolean fanVerifiedLevels()", start)
refresh = source[start:end]
assert "fold.sync(!fanRefreshingAvailability)" in source
JAVA = r'''import java.util.*;
public class TestFanAvailability {
 static class View {static final int GONE=8,VISIBLE=0;}
 static class Button {boolean enabled;void setEnabled(boolean v){enabled=v;}}
 class Switch extends Button {boolean checked;void setChecked(boolean v){if(v==checked)return;checked=v;for(UiKit.Fold f:folds)f.sync(!fanRefreshingAvailability);if(!loading)writes++;}boolean isChecked(){return checked;}}
 static class TextView {String text="";int visibility;void setText(String v){text=v;}void setVisibility(int v){visibility=v;}}
 static class AppConfig {static String FAN_FIXED_ENABLED="fixed",FAN_TILE_ENHANCEMENT_ENABLED="tile",FAN_SCREEN_OFF_ENABLED="screen";Map<String,Boolean> values=new HashMap<>();boolean getBoolean(String k){return values.getOrDefault(k,false);}}
 static class FanFeatureAvailability {static boolean levels,screen;static boolean screen(Object c){return screen;}static String reason(Object c,String k){return (k.equals("screen")?screen:levels)?"":"waiting:"+k;}}
 class UiKit {class Fold {Switch control;boolean expanded,wasEnabled;Fold(Switch c){control=c;}void sync(boolean expand){if(control.checked!=wasEnabled)expanded=control.checked&&expand;wasEnabled=control.checked;}}}
 Map<String,Switch> switches=new HashMap<>();Map<String,Boolean> fanSuspendedSwitches=new HashMap<>();
 List<UiKit.Fold> folds=new ArrayList<>();Button fanMeasure=new Button();TextView fanUnavailable=new TextView();AppConfig config=new AppConfig();
 boolean fanLevelsAvailable,fanScreenAvailable,loading,fanRefreshingAvailability;int writes;
 boolean fanVerifiedLevels(){return FanFeatureAvailability.levels;}
 REFRESH
 static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 void test(){
  for(String k:new String[]{"fixed","tile","screen"})switches.put(k,new Switch());
  folds.add(new UiKit().new Fold(switches.get("fixed")));config.values.put("fixed",true);config.values.put("screen",true);
  refreshFanAvailability();check(!fanMeasure.enabled&&!switches.get("fixed").enabled,"pending remains disabled");
  check(fanUnavailable.text.contains("fixed")&&fanUnavailable.text.contains("screen"),"pending reasons independent");
  FanFeatureAvailability.levels=true;refreshFanAvailability();
  check(switches.get("fixed").enabled&&switches.get("fixed").checked&&fanMeasure.enabled,"late proof enables controls and loads saved selection");
  check(!switches.get("screen").enabled&&fanUnavailable.text.equals("waiting:screen"),"levels cannot unlock unaudited screen policy");
  check(writes==0&&!folds.get(0).expanded&&!loading&&!fanRefreshingAvailability,"late evidence never saves or opens configuration");
  switches.get("fixed").setChecked(false);int edited=writes;
  FanFeatureAvailability.screen=true;refreshFanAvailability();
  check(switches.get("screen").checked&&switches.get("screen").enabled,"screen evidence independently arrives");
  check(!switches.get("fixed").checked&&writes==edited,"other draft unchanged");
  check(fanUnavailable.visibility==View.GONE,"completed notice removed");
  FanFeatureAvailability.levels=false;refreshFanAvailability();
  check(!switches.get("fixed").enabled&&!fanMeasure.enabled&&fanUnavailable.visibility==View.VISIBLE,"proof loss disables and explains");
  FanFeatureAvailability.levels=true;refreshFanAvailability();
  check(!switches.get("fixed").checked&&writes==edited,"proof recovery retains unsaved draft");
  for(int i=0;i<100;i++)refreshFanAvailability();check(writes==edited,"steady polling never writes");
 }
 public static void main(String[] args){new TestFanAvailability().test();System.out.println("PASS fan editor asynchronous capability refresh: "+checks);}
}'''.replace("REFRESH", refresh)
def java(name):
    return shutil.which(name) or str(Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")) / "bin" / (name + ".exe"))
with tempfile.TemporaryDirectory(prefix="lsa-fan-availability-") as temp:
    harness = Path(temp) / "TestFanAvailability.java"
    harness.write_text(JAVA, encoding="utf-8")
    subprocess.run([java("javac"), "-encoding", "UTF-8", "--release", "17", "-d", temp, str(harness)], check=True)
    subprocess.run([java("java"), "-cp", temp, "TestFanAvailability"], check=True)
