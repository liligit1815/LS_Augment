"""Extract and run the actual status-bar refresh method across a snapshot publication race.

The fake parser publishes B immediately after refresh has read A's layout. The
queued B listener then runs. A render must never be recorded under B's signature
and suppress that listener. Requires a JDK; performs no Android or device I/O.
"""
from pathlib import Path
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarGridHook.java'


def extract_refresh(source):
    start = source.index('void refresh(){')
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


SNAPSHOT = '''package ls.augment.com;
import java.util.*;
public final class ConfigSnapshot {
  private final Map<String,String> values;
  public ConfigSnapshot(Map<String,String> source) { values = Map.copyOf(source); }
  public String get(String key) { return values.get(key); }
}
'''


HARNESS = r'''package ls.augment.com.hook;
import java.util.*;
import ls.augment.com.ConfigSnapshot;
public class TestStatusBarSnapshotRefresh {
  static final class ConfigSchema {
    static final String SYSTEMUI_MASTER = "ls_augment_systemui_master";
    static final String STATUSBAR_GRID = "ls_augment_statusbar_grid";
    static final String STATUSBAR_HEIGHT_DP = "ls_augment_statusbar_height_dp";
    static final String STATUSBAR_POSITION_SIZE_ONLY = "ls_augment_statusbar_position_size_only";
    static boolean truthy(String value) { return "1".equals(value); }
    static List<String> keys() { return List.of(SYSTEMUI_MASTER, STATUSBAR_GRID, STATUSBAR_HEIGHT_DP, STATUSBAR_POSITION_SIZE_ONLY, "ls_augment_rm_battery_width_dp", "ls_augment_statusbar_layout_mode", "ls_augment_statusbar_sheet"); }
  }
  static final class FeatureSettings {
    static volatile ConfigSnapshot current;
    static final String SYSTEMUI_ACTIVE = "active", SYSTEMUI_LAYOUT_STATE = "state",
        SYSTEMUI_MASTER=ConfigSchema.SYSTEMUI_MASTER,STATUSBAR_CLOCK_CUSTOM="clock_custom";
    static ConfigSnapshot snapshot(Object context) { return current; }
    static boolean enabled(Object context, String key) { return ConfigSchema.truthy(current.get(key)); }
    static String text(Object context, String key, String fallback) { return current.get(key); }
    static int integer(Object context, String key, int fallback, int min, int max) { return Integer.parseInt(current.get(key)); }
    static void diagnostic(Object context, String key, String value) { }
  }
  static final class StatusBarGridSpec {
    static Runnable afterParse;
    final String layout;
    StatusBarGridSpec(String value) { layout = value; }
    static StatusBarGridSpec parse(String value) {
      Runnable callback = afterParse; afterParse = null;
      if (callback != null) callback.run();
      return new StatusBarGridSpec(value);
    }
  }
  static final class Root { int iconLayoutRefreshes; void requestLayout() { } void invalidate() { } }
  static final class StatusBarIconLayoutHook { static void gridModeChanged(Root root) { root.iconLayoutRefreshes++; } }
  static final String GRID_CLOCK_TAG="generated_clock";
  static final class Clock {final boolean generated;Clock(boolean generated){this.generated=generated;}Object getTag(){return generated?GRID_CLOCK_TAG:null;}}
  static boolean clockEnabled(boolean generated){Object context=new Object();Clock clock=new Clock(generated);
    // PRODUCTION_CLOCK_GATE
    return enabled;}
  static boolean assetsEnabled(){ConfigSnapshot snapshot=FeatureSettings.current;
    // PRODUCTION_ASSET_GATE
    return on;}
  static final class SystemUiHook { static void refreshGridClock(Root root) { } }
  static final class TargetReflection { static void call(Root root, String method) { } }
  static final class State {
    final Object context = new Object(); final Root root = new Root();
    boolean attached = true, active,layoutDirty;
    String lastConfig = "", lastRaw = "", lastLayoutConfig="";
    static class Icon {Object source=new Object();void invalidate(){}} Icon connectivityIcon;
    boolean isKeyguard(Root r){return false;}
    boolean colorOnlySetting(String key){return key.endsWith("_colors");}
    StatusBarGridSpec spec;
    int applications, appliedHeight, metricsStarted, metricsStopped;
    void restore() { applications++; }
    void applyHeight(int height) { appliedHeight = height; }
    void startMetrics() { metricsStarted++; }
    void stopMetrics() { metricsStopped++; }
    // PRODUCTION_REFRESH
    // PRODUCTION_POSITION_ONLY
  }
  static int assertions;
  static void check(boolean value, String reason) { assertions++; if (!value) throw new AssertionError(reason); }
  static ConfigSnapshot config(boolean enabled, String layout, int height) {
    return new ConfigSnapshot(Map.of(ConfigSchema.SYSTEMUI_MASTER, enabled ? "1" : "0",
        ConfigSchema.STATUSBAR_GRID, layout, ConfigSchema.STATUSBAR_HEIGHT_DP, Integer.toString(height)));
  }
  public static void main(String[] args) throws Exception {
    State state = new State();
    ConfigSnapshot a = config(true, "layout_A", 31), b = config(true, "layout_B", 55);
    FeatureSettings.current = a;
    StatusBarGridSpec.afterParse = () -> {
      Thread publisher = new Thread(() -> FeatureSettings.current = b, "ConfigPublisher");
      publisher.start();
      try { publisher.join(); } catch (InterruptedException error) { throw new AssertionError(error); }
    };
    state.refresh();
    // Run the listener that B's publication queued after the in-progress A refresh.
    state.refresh();
    check("layout_B".equals(state.spec.layout), "B listener was deduplicated while A remained rendered");
    check(state.appliedHeight == 55, "B height was not applied");
    check(state.lastConfig.contains("layout_B"), "B signature was not committed");
    check(state.applications == 2, "A and B must each receive one coherent application");
    check(state.root.iconLayoutRefreshes == 2, "both applied layouts must refresh native child-spacing ownership");
    state.refresh();
    check(state.applications == 2, "unchanged B should still be deduplicated");
    check(state.root.iconLayoutRefreshes == 2, "unchanged snapshot must not redo native child-spacing restoration");

    // Inspect A before the queued listener to detect mixed A layout / B height too.
    State coherent = new State(); FeatureSettings.current = a;
    StatusBarGridSpec.afterParse = () -> FeatureSettings.current = b;
    coherent.refresh();
    check("layout_A".equals(coherent.spec.layout), "in-progress A layout changed");
    check(coherent.appliedHeight == 31, "A render mixed B height into A layout");
    check(coherent.lastConfig.contains("layout_A") && !coherent.lastConfig.contains("layout_B"), "A render stored B signature");
    coherent.refresh();
    check("layout_B".equals(coherent.spec.layout), "queued listener did not converge to B");

    int beforeDisable=state.root.iconLayoutRefreshes;
    FeatureSettings.current = config(false, "layout_C", 40); state.refresh();
    check(!state.active && state.appliedHeight == 0 && state.metricsStopped == 1, "disable failed to restore native layout");
    check(state.root.iconLayoutRefreshes==beforeDisable+1,"disable must restore native child clipping/margin ownership immediately");
    FeatureSettings.current = config(true, "layout_D", 40); state.refresh();
    check(state.active && "layout_D".equals(state.spec.layout) && state.appliedHeight == 40, "re-enable did not apply latest layout");
    check(state.root.iconLayoutRefreshes==beforeDisable+2,"reenable must refresh child-spacing ownership for new grid mode");
    int widthBefore = state.applications;
    FeatureSettings.current = new ConfigSnapshot(Map.of(ConfigSchema.SYSTEMUI_MASTER, "1",
        ConfigSchema.STATUSBAR_GRID, "layout_D", ConfigSchema.STATUSBAR_HEIGHT_DP, "40",
        "ls_augment_rm_battery_width_dp", "100"));
    state.refresh();
    check(state.applications == widthBefore + 1, "battery-only width change did not request a fresh grid layout");
    state.refresh();
    check(state.applications == widthBefore + 1, "unchanged battery width should remain deduplicated");
    FeatureSettings.current=config(true,"negative_height",-4);state.refresh();
    check(state.appliedHeight==-4,"negative height survives snapshot refresh");
    FeatureSettings.current=config(false,"negative_height",-4);state.refresh();
    check(state.appliedHeight==0,"master off restores native after negative height");
    for(String archived:new String[]{"", "obsolete invalid table", "SS2;old_table_with_image"}){
      FeatureSettings.current=new ConfigSnapshot(Map.of(ConfigSchema.SYSTEMUI_MASTER,"1",
          ConfigSchema.STATUSBAR_GRID,"component_layout",ConfigSchema.STATUSBAR_HEIGHT_DP,"36",
          ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"1","ls_augment_statusbar_layout_mode","sheet",
          "ls_augment_statusbar_sheet",archived));
      state.refresh();
      check(state.active&&state.spec.layout.equals("component_layout")&&state.appliedHeight==36,
          "old table mode and archived content cannot replace the component configuration");
      check(state.positionOnly(),"old table mode cannot bypass position-only native preset");
    }
    for(String oldMode:new String[]{"regions","sheet","unknown"})for(int flags=0;flags<8;flags++){
      boolean master=(flags&1)!=0,position=(flags&2)!=0,custom=(flags&4)!=0;
      FeatureSettings.current=new ConfigSnapshot(Map.of(ConfigSchema.SYSTEMUI_MASTER,master?"1":"0",
          ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,position?"1":"0",FeatureSettings.STATUSBAR_CLOCK_CUSTOM,custom?"1":"0",
          "ls_augment_statusbar_layout_mode",oldMode,"ls_augment_statusbar_sheet","archived table"));
      check(clockEnabled(false)==(master&&!position&&custom),"legacy mode cannot change the real native-clock custom gate");
      check(clockEnabled(true)==(master&&!position),"generated component clock follows master and native preset only");
      check(assetsEnabled()==(master&&!position),"legacy mode cannot secretly activate icon/font replacements");
    }
    int before = state.applications; state.attached = false;
    FeatureSettings.current = config(true, "layout_E", 60); state.refresh();
    check(state.applications == before, "detached root received layout mutations");
    System.out.println("Status-bar snapshot refresh: " + assertions + " assertions passed");
  }
}
'''


def main():
    method = extract_refresh(SOURCE.read_text(encoding='utf-8'))
    with tempfile.TemporaryDirectory(prefix='lsa-statusbar-snapshot-') as directory:
        root = Path(directory)
        snapshot = root / 'ConfigSnapshot.java'
        build = root / 'BuildConfig.java'
        build.write_text('package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=4242;}', encoding='utf-8')
        test = root / 'TestStatusBarSnapshotRefresh.java'
        snapshot.write_text(SNAPSHOT, encoding='utf-8')
        source = SOURCE.read_text(encoding='utf-8')
        position_start = source.index('boolean positionOnly(){')
        position = source[position_start:source.index('}', position_start)+1]
        hooks = SOURCE.parent
        clock_source = (hooks / 'SystemUiHook.java').read_text(encoding='utf-8')
        clock_start = clock_source.index('boolean enabled = FeatureSettings.enabled(context, FeatureSettings.SYSTEMUI_MASTER)')
        clock_gate = clock_source[clock_start:clock_source.index(';', clock_start)+1].replace('ls.augment.com.ConfigSchema.', 'ConfigSchema.')
        assets_source = (hooks / 'StatusBarAssetsHook.java').read_text(encoding='utf-8')
        assets_start = assets_source.index('boolean on = ConfigSchema.truthy(snapshot.get(ConfigSchema.SYSTEMUI_MASTER))')
        asset_gate = assets_source[assets_start:assets_source.index(';', assets_start)+1]
        test.write_text(HARNESS.replace('// PRODUCTION_REFRESH', method).replace('// PRODUCTION_POSITION_ONLY', position)
                        .replace('// PRODUCTION_CLOCK_GATE', clock_gate).replace('// PRODUCTION_ASSET_GATE', asset_gate), encoding='utf-8')
        subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory, str(snapshot), str(build), str(test)], check=True)
        subprocess.run(['java', '-cp', directory, 'ls.augment.com.hook.TestStatusBarSnapshotRefresh'], check=True, timeout=15)


if __name__ == '__main__':
    main()
