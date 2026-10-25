"""Execute the status-bar editor's signal toggle/save code against local widgets.

The production related-feature route, toggle listener, save callback and battery
mode code are extracted verbatim. ConfigEditDraft and AppConfig are compiled
unchanged. Only Android widgets, execution queues and durable-storage boundaries
are doubles; this test never installs an APK or operates the attached phone.
"""
from pathlib import Path
import argparse
import os
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'


def body(source, marker):
    opening = source.index('{', source.index(marker))
    tokens = re.finditer(r'//[^\n]*|/\*[\s\S]*?\*/|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|[{}]', source[opening:])
    depth = 0
    for token in tokens:
        if token.group() == '{':
            depth += 1
        elif token.group() == '}':
            depth -= 1
            if depth == 0:
                return source[opening + 1:opening + token.start()]
    raise AssertionError('Unclosed production block: ' + marker)


TEMPLATE = r'''package ls.augment.com;
import android.content.*;import android.os.*;import java.util.*;import java.util.concurrent.*;
public final class TestSignalStyleEditor {
 static final String DUAL=SystemUiOptions.SIGNAL_DUAL,STYLE=SystemUiOptions.SIGNAL_DUAL_STYLE,TRI=ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,OTHER=ConfigSchema.STATUSBAR_CLOCK_SIZE_SP;
 static int checks;static boolean background;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static final FakeContext sharedContext=new FakeContext();
 final FakeContext context=sharedContext;final AppConfig config=new AppConfig(context);
 final ConfigEditDraft draft=new ConfigEditDraft();final Map<String,Switch> controls=new LinkedHashMap<>();
 final UiKit ui=new UiKit();final LinearLayout content=new LinearLayout();final Switch masterControl=new Switch(this);
 final Queue main=new Queue(false),worker=new Queue(true);final Runnable autoSave=()->save();
 Map<String,String> previewBackup;boolean loading,saving,dirty,destroyed;int rerenders;
 UiKit.Fold masterFold,sectionFold,connectivityFold,nativeBatteryFold,dualAppearanceFold;Preview preview=new Preview();
 final Grid grid=new Grid();
 /*METHODS*/
 void previewPreferenceChanged(String key){SharedPreferences prefs=null;/*LISTENER*/}
 void restoredGuard(){/*RESTORE_GUARD*/}
 void runOnUiThread(Runnable task){main.post(task);}boolean isDestroyed(){return destroyed;}
 void addFeatureBlock(LinearLayout p,View row){p.children.add(row);}
 void refreshRuntimeFeedback(){}
 Clock previewClock(){return new Clock();}
 void renderKeepingScroll(){rerenders++;for(Map.Entry<String,Switch> entry:controls.entrySet()){
  boolean old=loading;loading=true;entry.getValue().setChecked(ConfigSchema.truthy(draft.get(entry.getKey())));loading=old;}}
 boolean positionSizeOnly(){return ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY));}
 static TestSignalStyleEditor fresh(boolean tri,boolean dual){
  Toast.shown.clear();TestSignalStyleEditor h=new TestSignalStyleEditor();
  check(h.config.save(Map.of(TRI,tri?"1":"0",DUAL,dual?"1":"0",STYLE,"0",OTHER,"0",ConfigSchema.STATUSBAR_GRID,"grid")).success,"initialize local canonical state");
  for(Map.Entry<String,String> entry:h.config.snapshot().entrySet())h.draft.seed(entry.getKey(),entry.getValue());
  h.toggle(h.content,DUAL,"双排信号图标");return h;
 }
 Switch signal(){return controls.get(DUAL);}
 void settle(){worker.next();main.all();}
 void canonical(boolean tri,boolean dual){check(config.save(Map.of(TRI,tri?"1":"0",DUAL,dual?"1":"0")).success,"external canonical update");}
 void click(boolean enabled){signal().setChecked(enabled);}
 static void blocked(TestSignalStyleEditor h,String why){
  check(!h.signal().isChecked(),why+": actual widget resets immediately");
  check(!ConfigSchema.truthy(h.draft.get(DUAL)),why+": rejected dual never stays in draft");
  check(!h.draft.unsaved().containsKey(DUAL),why+": rejected dual has no restorable intent");
  check(!h.config.getBoolean(DUAL),why+": canonical dual stays disabled");
  check(Toast.shown.contains(SignalStylePolicy.CONFLICT_MESSAGE),why+": exact useful conflict prompt");
 }
 public static void main(String[] args){
  TestSignalStyleEditor clock=fresh(false,false);
  clock.draft.put(ConfigSchema.SYSTEMUI_MASTER,"0");clock.draft.put(ConfigSchema.STATUSBAR_CLOCK_CUSTOM,"0");
  clock.toggle(clock.content,ConfigSchema.STATUSBAR_CLOCK_CUSTOM,"自定义时钟文字");
  clock.controls.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM).setChecked(true);
  check(clock.masterControl.isChecked()&&ConfigSchema.truthy(clock.draft.get(ConfigSchema.SYSTEMUI_MASTER)),"clock activation enables required master in the same UI edit");
  clock.save();clock.settle();
  check(clock.config.getBoolean(ConfigSchema.STATUSBAR_CLOCK_CUSTOM)&&clock.config.getBoolean(ConfigSchema.SYSTEMUI_MASTER),"clock and master are committed together");
  clock.controls.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM).setChecked(false);clock.save();clock.settle();
  check(!clock.config.getBoolean(ConfigSchema.STATUSBAR_CLOCK_CUSTOM)&&clock.config.getBoolean(ConfigSchema.SYSTEMUI_MASTER),"clock off preserves other status bar functions");
  clock.draft.put(ConfigSchema.SYSTEMUI_MASTER,"0");clock.masterControl.setChecked(false);
  clock.controls.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM).setChecked(true);clock.save();
  clock.context.prefs(AppConfig.PREFS).failNext=1;clock.settle();
  check(!clock.config.getBoolean(ConfigSchema.STATUSBAR_CLOCK_CUSTOM),"failed activation never partially enables the stored clock");
  check(clock.draft.hasPending(),"failed clock activation remains retryable");
  clock.save();clock.settle();check(clock.config.getBoolean(ConfigSchema.SYSTEMUI_MASTER)&&clock.config.getBoolean(ConfigSchema.STATUSBAR_CLOCK_CUSTOM),"retry commits both dependencies");
  TestSignalStyleEditor h=fresh(true,false);h.click(true);blocked(h,"already enabled three-in-one");
  check(h.worker.tasks.isEmpty()&&!h.draft.hasPending(),"blocked click never submits a save");
  h.click(true);blocked(h,"repeated conflict click");

  h=fresh(false,false);h.canonical(true,false);h.click(true);blocked(h,"stale open editor sees newer three-in-one");

  h=fresh(true,false);h.draft.put(TRI,"0");h.click(true);
  check(h.signal().isChecked()&&h.draft.unsaved().get(DUAL).equals("1"),"explicit three-in-one off draft admits signal enable");
  h.save();h.settle();check(h.config.getBoolean(DUAL)&&!h.config.getBoolean(TRI),"off plus signal enable commits together");
  check(h.signal().isChecked()&&!h.draft.hasPending(),"successful enable remains selected without retry");

  h=fresh(false,false);h.click(true);h.draft.put(OTHER,"12");h.save();h.canonical(true,false);
  h.settle();blocked(h,"three-in-one activates after UI admission before durable save");
  check(h.draft.unsaved().get(OTHER).equals("12"),"conflict rollback preserves another unsaved parameter");
  check(!h.draft.unsaved().containsKey(DUAL),"conflict dual is not requeued forever");
  h.save();h.settle();check(h.config.get(OTHER).equals("12")&&!h.config.getBoolean(DUAL),"other parameter can save after rejected dual");

  h=fresh(false,false);h.click(true);h.save();h.context.prefs(AppConfig.PREFS).failNext=1;h.settle();
  check(!h.signal().isChecked()&&!ConfigSchema.truthy(h.draft.get(DUAL)),"durable commit failure resets dual to canonical off; widget="+h.signal().isChecked()+", draft="+h.draft.get(DUAL)+", stored="+h.config.get(DUAL)+", pending="+h.draft.unsaved()+", toasts="+Toast.shown);
  check(!h.draft.unsaved().containsKey(DUAL),"failed dual does not resurrect after reopen");
  check(!h.config.getBoolean(DUAL),"failed commit keeps actual setting off");
  h.click(true);h.save();h.settle();check(h.signal().isChecked()&&h.config.getBoolean(DUAL),"explicit retry after failure can succeed");

  h=fresh(false,true);h.draft.put(TRI,"1");h.save();h.settle();
  check(h.config.getBoolean(TRI)&&!h.config.getBoolean(DUAL),"real AppConfig derives signal off from successful three-in-one save");
  check(!h.signal().isChecked()&&!ConfigSchema.truthy(h.draft.get(DUAL)),"save acknowledgement applies derived canonical off to existing widget");
  check(!h.draft.hasPending(),"canonical reconciliation does not create a synthetic edit");
  h=fresh(false,false);h.click(true);h.draft.put(TRI,"1");h.save();h.settle();
  check(h.config.getBoolean(TRI)&&!h.config.getBoolean(DUAL),"real combined batch three-in-one plus signal on derives canonical signal off");
  check(!h.signal().isChecked()&&!ConfigSchema.truthy(h.draft.get(DUAL))&&!h.draft.hasPending(),"combined batch acknowledges derived off instead of retaining requested on");

  h=fresh(false,true);h.setBatteryMode(true,true);
  check(!h.signal().isChecked()&&!ConfigSchema.truthy(h.draft.get(DUAL)),"battery page three-in-one selection turns signal preview off");
  h.save();h.settle();check(h.config.getBoolean(TRI)&&!h.config.getBoolean(DUAL),"battery page uses same exclusive canonical state");

  h=fresh(false,false);h.click(true);h.save();h.click(false);h.settle();
  check(!h.signal().isChecked()&&h.draft.unsaved().get(DUAL).equals("0"),"old success cannot overwrite newer explicit off edit");
  h.save();h.settle();check(!h.config.getBoolean(DUAL)&&!h.draft.hasPending(),"later off edit wins after queued success");

  h=fresh(false,false);h.click(true);h.save();h.canonical(true,false);
  h.click(false);h.draft.force(TRI,"0");h.click(true);h.settle();
  check(h.signal().isChecked()&&h.draft.unsaved().get(DUAL).equals("1"),"old failure cannot erase newer enable admitted with explicit three-in-one off");
  check(h.draft.unsaved().get(TRI).equals("0"),"old failure preserves newer opponent off edit");
  h.save();h.settle();check(h.config.getBoolean(DUAL)&&!h.config.getBoolean(TRI),"newer valid edit commits after old rejected batch");

  h=fresh(false,false);h.click(true);h.save();h.worker.next();h.canonical(true,false);h.main.all();
  check(!h.signal().isChecked()&&!ConfigSchema.truthy(h.draft.get(DUAL)),"acknowledgement reads latest canonical state after a later durable update");
  check(!h.draft.hasPending(),"late canonical reconciliation has no unwanted save loop");

  h=fresh(false,true);h.canonical(true,false);h.previewPreferenceChanged(TRI);
  check(h.main.tasks.size()==1,"canonical three-in-one event schedules UI refresh");h.main.all();
  check(!h.signal().isChecked()&&ConfigSchema.truthy(h.draft.get(TRI)),"open editor follows three-in-one changes from another screen");
  check(!h.draft.hasPending(),"external pair refresh never submits a synthetic edit");
  h.canonical(false,true);h.previewPreferenceChanged(DUAL);h.main.all();
  check(h.signal().isChecked()&&!ConfigSchema.truthy(h.draft.get(TRI)),"open editor follows Settings signal choice back to merged");

  h=fresh(false,false);h.previewBackup=Map.of(DUAL,"0");h.canonical(false,true);h.previewPreferenceChanged(DUAL);h.main.all();
  check(!h.signal().isChecked()&&!ConfigSchema.truthy(h.draft.get(DUAL)),"external update cannot replace a preset preview draft");
  h.previewBackup=null;h.refreshStoredSignalModes();check(h.signal().isChecked(),"ending preview can refresh the current canonical choice");
  h=fresh(false,false);h.destroyed=true;h.canonical(false,true);h.previewPreferenceChanged(DUAL);h.main.all();
  check(!h.signal().isChecked(),"destroyed editor ignores external canonical UI callbacks");

  h=fresh(true,false);h.draft.force(DUAL,"1");h.draft.put(OTHER,"11");h.restoredGuard();h.renderKeepingScroll();
  check(!h.signal().isChecked()&&!ConfigSchema.truthy(h.draft.get(DUAL)),"restored rejected-on draft is cleared before constructing a checked control");
  check(h.draft.unsaved().get(OTHER).equals("11"),"recreation conflict guard retains other unsaved settings");
  h=fresh(true,false);h.draft.force(TRI,"0");h.draft.force(DUAL,"1");h.restoredGuard();h.renderKeepingScroll();
  check(h.signal().isChecked()&&h.draft.unsaved().get(TRI).equals("0"),"restoring explicit three-in-one off and signal on stays valid");
  h=fresh(true,false);h.draft.put(STYLE,"1");h.click(true);blocked(h,"iOS preset selection does not bypass three-in-one admission");
  check("1".equals(h.draft.get(STYLE))&&"1".equals(h.draft.unsaved().get(STYLE)),"rejected enable keeps the user's selected style pending");
  h.save();h.settle();check("1".equals(h.config.get(STYLE))&&!h.config.getBoolean(DUAL),"saved iOS style stays disabled while three-in-one remains active");
  h=fresh(false,true);h.draft.put(STYLE,"1");h.save();h.settle();
  check(h.config.getBoolean(DUAL)&&"1".equals(h.config.get(STYLE)),"an active dual style changes without clearing the gate");
  h.click(false);h.save();h.settle();check(!h.config.getBoolean(DUAL)&&"1".equals(h.config.get(STYLE)),"disabling dual preserves saved iOS style");
  System.out.println("PASS signal editor "+checks+" assertions (real toggle/save/battery code, ConfigEditDraft and AppConfig; no device)");
 }
 static class Queue {
  final boolean worker;final List<Runnable> tasks=new ArrayList<>();Queue(boolean worker){this.worker=worker;}
  void execute(Runnable task){tasks.add(task);}void post(Runnable task){tasks.add(task);}void postDelayed(Runnable task,long delay){tasks.add(task);}
  void removeCallbacks(Runnable task){tasks.removeIf(item->item==task);}void next(){Runnable task=tasks.remove(0);boolean old=background;background=worker;try{task.run();}finally{background=old;}}
  void all(){int budget=20;while(!tasks.isEmpty()){if(--budget==0)throw new AssertionError("UI save/reconciliation loop");next();}}
 }
 static class View {}
 static class LinearLayout extends View {final List<View> children=new ArrayList<>();}
 static class CompoundButton extends View {
  boolean checked;OnCheckedChangeListener listener;boolean isChecked(){return checked;}
  void setChecked(boolean value){check(!background,"widget writes stay on UI thread");if(checked==value)return;checked=value;if(listener!=null)listener.onCheckedChanged(this,value);}
  void setOnCheckedChangeListener(OnCheckedChangeListener listener){this.listener=listener;}
  interface OnCheckedChangeListener {void onCheckedChanged(CompoundButton button,boolean checked);}
 }
 static class Switch extends CompoundButton {Switch(Object context){}}
 static class UiKit {LinearLayout featureRow(String title,String summary,Switch control){return new LinearLayout();}static class Fold {void sync(){}void show(boolean enabled){}}}
 static class FeatureDescriptions {static String forKey(String key,String fallback){return fallback;}}
 static class Preview {void invalidate(){check(!background,"preview invalidation stays on UI thread");}}
 static class Grid {String serialize(){return "grid";}}
 static class Clock {boolean valid=true;}
 static class Toast {static final int LENGTH_LONG=1;static final List<String> shown=new ArrayList<>();final String value;Toast(String value){this.value=value;}
  static Toast makeText(Object context,String value,int length){return new Toast(value);}void show(){check(!background,"Toast stays on UI thread");shown.add(value);}}
 /*FAULTS*/
}
'''


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--source', type=Path, default=SRC / 'StatusBarEditorController.java', help='Optional saved source to demonstrate the original regression')
    args = parser.parse_args()
    source = args.source.read_text(encoding='utf-8')
    # Verify the user-facing signal route actually reaches the tested listener.
    related = body(source, 'private void related(String destination,LinearLayout parent)')
    assert 'StatusBarPresets.ownsRelatedKey(feature.toggleKey)' in related
    assert 'toggle(parent,feature.toggleKey,feature.title)' in related
    assert 'dualAppearanceSection(parent,feature.title)' in related
    presets = (SRC / 'StatusBarPresets.java').read_text(encoding='utf-8')
    assert 'SystemUiOptions.SIGNAL_DUAL.equals(key)' in body(presets, 'static boolean ownsRelatedKey(String key)')
    signatures = [
        'private LinearLayout toggle(LinearLayout parent,String key, String label)',
        'private void changed()',
        'private void save()',
        'private boolean nativeBatteryEnabled()',
        'private void setBatteryMode(boolean threeInOne,boolean enabled)',
    ]
    # Signal-specific reconciliation helpers are production methods too. Additional
    # dependencies may be added here as the implementation grows; no logic is copied.
    for match in re.finditer(r'    private (?:boolean|void|String) (?:signal\w*|\w*[Ss]ignal\w*)\([^\n]*\)\s*\{', source):
        signature = match.group().strip().rstrip('{').rstrip()
        if signature not in signatures:
            signatures.append(signature)
    methods = '\n'.join(signature + '{' + body(source, signature) + '}' for signature in signatures)
    if args.source.resolve() != (SRC / 'StatusBarEditorController.java').resolve() and 'private void refreshStoredSignalModes()' not in signatures:
        # Old source is expected to fail its first widget assertion; this unused
        # forward declaration lets that red test compile before the new helper exists.
        methods += '\nprivate void refreshStoredSignalModes(){}'
    listener = body(source, 'previewPreferenceListener=(prefs,key)->')
    guard_marker = 'if(ConfigSchema.truthy(draft.get(SystemUiOptions.SIGNAL_DUAL))&&signalEnableBlocked())'
    guard = source[source.index(guard_marker):source.index('        grid = StatusBarGridSpec.parse', source.index(guard_marker))] if guard_marker in source else ''
    if args.source.resolve() == (SRC / 'StatusBarEditorController.java').resolve():
        assert guard and source.index(guard_marker) < source.index('masterControl=new Switch(this)')
    helper = ROOT / 'tools/test-app-config-async.py'
    scope = {'__file__': str(helper)}
    exec(compile(helper.read_text(encoding='utf-8').split("with tempfile.TemporaryDirectory(prefix='ls-app-config-async-')", 1)[0], str(helper), 'exec'), scope)
    sources = dict(scope['sources'])
    sources.pop('ls/augment/com/TestAppConfigAsync.java')
    constants = sorted(set(re.findall(r'ConfigSchema\.([A-Z][A-Z0-9_]+)', methods)) - set(re.findall(r'ConfigSchema\.([A-Z][A-Z0-9_]+)', (SRC / 'AppConfig.java').read_text(encoding='utf-8'))))
    schema = sources['ls/augment/com/ConfigSchema.java']
    schema = schema.replace('static Map<String,String> defaults()', ''.join(f'static final String {name}="{name}";' for name in constants) + 'static Map<String,String> defaults()')
    schema = schema.replace('values.put("flag","0");', ''.join(f'values.put({name},"0");' for name in constants) + 'values.put("flag","0");')
    schema = schema.replace('values.put("flag","0");', 'values.put("ls_augment_rm_signal_dual_style","0");values.put("flag","0");')
    sources['ls/augment/com/ConfigSchema.java'] = schema
    sources['ls/augment/com/SystemUiOptions.java'] = sources['ls/augment/com/SystemUiOptions.java'].replace('static final String SIGNAL_DUAL=', 'static final String PREFIX="ls_augment_rm_",ISLAND=PREFIX+"island_enabled",SIGNAL_DUAL_STYLE="ls_augment_rm_signal_dual_style";static final String SIGNAL_DUAL=')
    sources['ls/augment/com/TestSignalStyleEditor.java'] = TEMPLATE.replace('/*METHODS*/', methods).replace('/*FAULTS*/', scope['fault_classes']).replace('/*LISTENER*/', listener).replace('/*RESTORE_GUARD*/', guard)
    java_home = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
    javac = str(java_home / 'bin/javac.exe') if os.name == 'nt' else 'javac'
    java = str(java_home / 'bin/java.exe') if os.name == 'nt' else 'java'
    with tempfile.TemporaryDirectory(prefix='ls-signal-editor-') as folder:
        work = Path(folder)
        paths = []
        for name, code in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(code, encoding='utf-8')
            paths.append(path)
        paths += [SRC / name for name in ('AppConfig.java', 'FrameworkConfigSync.java', 'DurablePreferences.java', 'RuntimeStateStore.java', 'RemoteConfig.java', 'ResetWriteFence.java', 'SignalStylePolicy.java', 'ConfigEditDraft.java')]
        subprocess.run([javac, '-encoding', 'UTF-8', '--release', '17', '-d', folder, *map(str, paths)], check=True)
        subprocess.run([java, '-cp', folder, 'ls.augment.com.TestSignalStyleEditor'], check=True, timeout=20)


if __name__ == '__main__':
    main()
