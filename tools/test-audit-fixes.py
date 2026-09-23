"""Regression tests execute production draft/quota/store plus the editor's actual save methods."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
editor = (SRC / 'StatusBarEditorController.java').read_text(encoding='utf-8')
save = editor[editor.index('    private void save()'):editor.index('    @Override protected void onPause()')]
assert 'static final ExecutorService worker' in editor
assert 'worker.shutdown()' not in editor
sources = {
    'android/os/SystemClock.java': 'package android.os; public class SystemClock { public static long now;public static long elapsedRealtime(){return now;} }',
    'android/os/Bundle.java': '''package android.os;import java.util.*;
public class Bundle {public Map<String,Object> data=new HashMap<>();
public void putBundle(String k,Bundle v){data.put(k,v);}public void putString(String k,String v){data.put(k,v);}
public void putInt(String k,int v){data.put(k,v);}public void putBoolean(String k,boolean v){data.put(k,v);}
public Bundle getBundle(String k){return (Bundle)data.get(k);}}''',
    'android/content/Context.java': '''package android.content;public abstract class Context {
public abstract SharedPreferences getSharedPreferences(String name,int mode);}''',
    'android/content/SharedPreferences.java': '''package android.content;import java.util.Map;
public interface SharedPreferences {Map<String,?> getAll();Editor edit();
interface Editor {Editor putString(String key,String value);void apply();}}''',
    'ls/augment/com/ConfigSchema.java': '''package ls.augment.com;final class ConfigSchema {
static final String STATUSBAR_CLOCK_CUSTOM="custom";
static boolean truthy(String s){return "1".equals(s);}static String normalize(String k,String v){return v;}
static boolean contains(String k){return "ls_augment_reserved".equals(k);}}''',
    'ls/augment/com/AppConfig.java': '''package ls.augment.com;import java.util.*;
final class AppConfig {static final String DIAGNOSTICS="diagnostics";
static Map<String,String> disk=new LinkedHashMap<>();static boolean succeed=true;
static class SaveResult {boolean success;String message="failure";SaveResult(boolean s){success=s;}}
SaveResult save(Map<String,String> values){if(succeed)disk.putAll(values);return new SaveResult(succeed);}}''',
    'ls/augment/com/FakeContext.java': '''package ls.augment.com;import java.util.*;import android.content.*;
final class FakeContext extends Context {
final Prefs prefs=new Prefs();public SharedPreferences getSharedPreferences(String name,int mode){return prefs;}
static class Prefs implements SharedPreferences {
 final Map<String,String> values=new LinkedHashMap<>();int writes;
 public Map<String,?> getAll(){return new LinkedHashMap<>(values);}
 public Editor edit(){return new Editor(){final Map<String,String> pending=new LinkedHashMap<>();
 public Editor putString(String key,String value){pending.put(key,value);return this;}
 public void apply(){values.putAll(pending);writes++;}};}
}}''',
    'ls/augment/com/StatusBarSaveHarness.java': '''package ls.augment.com;
import java.util.*;import android.os.Bundle;
class SaveBase {protected void onSaveInstanceState(Bundle state){}}
final class StatusBarSaveHarness extends SaveBase {
 static final Worker worker=new Worker();final ConfigEditDraft draft=new ConfigEditDraft();
 final AppConfig config=new AppConfig();boolean dirty,saving,destroyed;int tab;
 Map<String,String> rawInputs=new LinkedHashMap<>();Main main=new Main();Runnable autoSave=()->save();
 Map<String,String> previewBackup,lastLayoutBackup;String selectedComponent="clock";
 boolean connectivityExpanded,nativeBatteryExpanded;UiKit.Fold connectivityFold,nativeBatteryFold;
 Map<String,UiKit.Fold> componentFolds=new LinkedHashMap<>();
 Map<String,View> advancedViews=new LinkedHashMap<>();
 Map<String,Boolean> expandedComponents=new LinkedHashMap<>(),advancedExpanded=new LinkedHashMap<>();
 Map<Integer,Integer> scrollPositions=new LinkedHashMap<>();Scroll configScroll=new Scroll();
 // Android presentation boundaries; production save/state methods remain verbatim.
 static class View {static final int VISIBLE=0;int visibility;int getVisibility(){return visibility;}}
 static class Scroll {int y;int getScrollY(){return y;}}
 static class UiKit {static class Fold {View content=new View();}}
 void cancelPreset(){previewBackup=null;}
 static final class Main {void removeCallbacks(Runnable r){}void post(Runnable r){r.run();}}
 static final class Worker {final Deque<Runnable> tasks=new ArrayDeque<>();void execute(Runnable r){tasks.add(r);}void drain(){while(!tasks.isEmpty())tasks.remove().run();}}
 static final class Clock {boolean valid=true;}
 static final class Toast {static final int LENGTH_LONG=1;static Toast makeText(Object c,String t,int d){return new Toast();}void show(){}}
 boolean positionSizeOnly(){return true;}Clock previewClock(){return new Clock();}
 void runOnUiThread(Runnable r){r.run();}boolean isDestroyed(){return destroyed;}
 StatusBarSaveHarness(){AppConfig.disk.forEach(draft::seed);}
''' + save + '''
 static void verify(){
  AppConfig.disk.clear();AppConfig.disk.put("left","0");AppConfig.disk.put("right","0");
  StatusBarSaveHarness a=new StatusBarSaveHarness();a.draft.put("left","10");a.save();
  StatusBarSaveHarness b=new StatusBarSaveHarness();worker.drain();
  b.draft.put("right","20");b.save();worker.drain();
  TestAuditFixes.check(AppConfig.disk.equals(Map.of("left","10","right","20")),"production save lost update");
  Bundle state=new Bundle();b.onSaveInstanceState(state);
  TestAuditFixes.check(state.getBundle("draft-edits").data.isEmpty(),"saved-state included untouched/saved fields");
  b.draft.put("right","30");AppConfig.succeed=false;b.save();worker.drain();
  TestAuditFixes.check(b.draft.hasPending(),"production save failure cannot retry");
  b.onSaveInstanceState(state);
  TestAuditFixes.check(state.getBundle("draft-edits").data.equals(Map.of("right","30")),"failed edit not retained alone");
  AppConfig.succeed=true;b.save();worker.drain();
  TestAuditFixes.check(AppConfig.disk.equals(Map.of("left","10","right","30")),"production retry overwrote other page");
  b.previewBackup=new LinkedHashMap<>();b.draft.put("left","40");b.save();
  TestAuditFixes.check(worker.tasks.isEmpty(),"preset preview was persisted without confirmation");
  b.previewBackup=null;b.save();worker.drain();
  b.tab=2;b.configScroll.y=140;b.connectivityExpanded=true;
  b.componentFolds.put("clock",new UiKit.Fold());b.advancedViews.put("font",new View());
  b.lastLayoutBackup=Map.of("left","10");b.onSaveInstanceState(state);
  TestAuditFixes.check(Boolean.TRUE.equals(state.data.get("connectivity-expanded")),"fold state missing");
  TestAuditFixes.check(state.getBundle("tab-scroll").data.get("2").equals(140),"scroll state missing");
  TestAuditFixes.check(state.getBundle("expanded-components").data.get("clock").equals(true),"component fold missing");
  TestAuditFixes.check(state.getBundle("layout-undo").data.get("left").equals("10"),"layout undo missing");
 }
}''',
}
with tempfile.TemporaryDirectory(prefix='ls-audit-fixes-') as directory:
    work = Path(directory)
    files = []
    for name, source in sources.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        files.append(path)
    files += [SRC / name for name in ('ConfigEditDraft.java', 'DiagnosticWritePolicy.java', 'ProviderDiagnostics.java')]
    files.append(ROOT / 'tools/TestAuditFixes.java')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory,
                    *map(str, files)], check=True)
    subprocess.run(['java', '-cp', directory, 'ls.augment.com.TestAuditFixes'], check=True, timeout=20)
