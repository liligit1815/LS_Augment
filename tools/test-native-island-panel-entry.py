"""Exercise actual scene click/show hook wiring with the native close callback and no host singleton."""
from pathlib import Path
import importlib.util
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
spec = importlib.util.spec_from_file_location('panel_fixture', ROOT / 'tools/test-island-panel-runtime.py')
fixture = importlib.util.module_from_spec(spec)
spec.loader.exec_module(fixture)
files = dict(fixture.FILES)
files['com/zte/feature/dynamicisland/DynamicPermanentIsland.java'] = '''package com.zte.feature.dynamicisland;
public class DynamicPermanentIsland extends android.view.View {
 public int mCurState=1;public android.view.View panel=new android.view.View();
 public android.view.View getPanelIsland(){return panel;}
 public static boolean visible(int state){return state==1;}
}'''
files['com/zte/feature/dynamicisland/PermanentIslandManager.java'] = '''package com.zte.feature.dynamicisland;
import android.view.*;
public class PermanentIslandManager {
 public interface Callback {
  void onPermanentIslandPanelCloseAnimationStart();
  void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland island,boolean remove,boolean disposable);
 }
 public static class Factory {public Callback mCallback;Factory(Callback c){mCallback=c;}}
 public static class Animation {public Factory mPermanentAnimation;public int closes;Animation(Callback c){mPermanentAnimation=new Factory(c);}
  public void startPermanentPanelCloseAnimation(DynamicPermanentIsland i,boolean r,boolean d){closes++;mPermanentAnimation.mCallback.onPermanentIslandPanelCloseAnimationStart();}}
 public View mDynamicIslandPanelRoot,mDynamicIslandRoot=new View();
 public ViewGroup mDynamicPanelContainer=new ViewGroup();public Object mWindowManager=new Object(),mParams=new Object();
 public boolean mDynamicPanelShowing,mDynamicPanelClosing,mAnimProcessing,mPriorityProcessing,mOnKeyguard,throttled;
 public DynamicPermanentIsland selected=new DynamicPermanentIsland(),mTempIsland;
 public Animation mDynamicAnimation;public int opens,originalClicks,originalEnds,heights;
 public DynamicPermanentIsland getPermanentIsland(){return selected;}
 public boolean forceNotClick(){return throttled;}
 public void onClick(){originalClicks++;}
 public void onLongClick(){showPermanentPanelIsland();}
 public void showPermanentPanelIsland(){if(mAnimProcessing||mPriorityProcessing||mDynamicPanelShowing)return;
  opens++;mDynamicPanelShowing=true;mDynamicPanelContainer.addView(selected.panel);}
 public void updateDynamicWindowHeightParams(boolean expanded){if(!expanded)heights++;}
 public void removePermanentIslandInner(DynamicPermanentIsland island){}
}
'''
# The real callback contract is implemented by the manager, including inherited fields/methods.
files['com/zte/feature/dynamicisland/SceneManager.java'] = '''package com.zte.feature.dynamicisland;
import android.view.View;
public class SceneManager extends PermanentIslandManager implements PermanentIslandManager.Callback {
 public SceneManager(){mDynamicAnimation=new Animation(this);}
 public void onPermanentIslandPanelCloseAnimationStart(){mDynamicPanelClosing=true;}
 public void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland island,boolean remove,boolean disposable){
  originalEnds++;mDynamicPanelShowing=false;mDynamicPanelClosing=false;
  mDynamicPanelContainer.removeAllViews();mDynamicIslandPanelRoot.setVisibility(View.GONE);
 }
 public void end(DynamicPermanentIsland island){mDynamicAnimation.mPermanentAnimation.mCallback.onPermanentIslandPanelCloseAnimationStart();
  mDynamicAnimation.mPermanentAnimation.mCallback.onPermanentIslandPanelCloseAnimationEnd(island,false,false);}
}
'''
files['ls/augment/com/hook/AugmentModule.java'] = '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
class AugmentModule {
 interface Interceptor {Object intercept(Chain chain)throws Throwable;}
 static class Chain {final Object owner;final Method method;Chain(Object o,Method m){owner=o;method=m;}
  Object getThisObject(){return owner;}List<Object> getArgs(){return List.of();}
  Object proceed(Object[] args)throws Throwable{try{return method.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}}
 class Builder {final Method method;Interceptor handler;Builder(Method m){method=m;}
  Builder intercept(Interceptor i){handler=i;return this;}}
 final Map<Method,Interceptor> hooks=new HashMap<>();
 Builder prepareFeatureHook(Method m,String id,boolean b){return new Builder(m);}
 void registerFeatureHook(Builder b){hooks.put(b.method,b.handler);}
 void logFeatureError(String stage,Throwable error){throw new AssertionError(stage,error);}
 void run(Object owner,String method)throws Throwable{
  Method m=com.zte.feature.dynamicisland.PermanentIslandManager.class.getMethod(method);
  Interceptor i=hooks.get(m);Chain c=new Chain(owner,m);if(i==null)c.proceed(new Object[0]);else i.intercept(c);}
}'''
files['ls/augment/com/hook/FeatureRuntimeLog.java'] = '''package ls.augment.com.hook;
class FeatureRuntimeLog {static void event(String s,String d){}static String failure(Throwable e){return e.toString();}}'''
source = (SOURCE / 'NativeIslandScenes.java').read_text('utf-8')
methods = '\n'.join(fixture.method(source, marker) for marker in (
    'private static int installPanelClicks(', 'private boolean preparePanelExpansion(', 'private void closeOrdinaryPanel('))
files['ls/augment/com/hook/NativeIslandScenes.java'] = '''package ls.augment.com.hook;
import java.lang.reflect.*;import android.view.*;import ls.augment.com.NativeIslandSceneOptions;import static ls.augment.com.hook.SystemUiAdapter.*;
class NativeIslandScenes {
 static final String OEM="com.zte.feature.dynamicisland.";static NativeIslandScenes selected;
 final Object permanent;final Method visibleState;Object completed;boolean enabled=true,closed;int changed;String diagnostic;
 NativeIslandScenes(com.zte.feature.dynamicisland.PermanentIslandManager m)throws Exception{
  permanent=m;completed=m.selected;visibleState=m.selected.getClass().getMethod("visible",int.class);selected=this;}
 boolean usable(){return selected==this&&enabled&&!closed;}
 View completedPanel(Object island){return island==completed&&enabled?(View)field(island,"panel"):null;}
 void scheduleChanged(){if(!closed)changed++;}void report(String s){diagnostic=s;}
 void closePanel(){closeOrdinaryPanel();}static String reason(Throwable e){return e.toString();}
 static int install(AugmentModule m){return installPanelClicks(m,NativeIslandScenes.class.getClassLoader());}
 // METHODS
}
'''.replace('// METHODS', methods)
for name in ['IslandPanelGuard', 'NativeIslandPanelCompat', 'NativeIslandSceneContract']:
    files[f'ls/augment/com/hook/{name}.java'] = (SOURCE / f'{name}.java').read_text('utf-8')
files['ls/augment/com/NativeIslandSceneOptions.java'] = (SOURCE.parent / 'NativeIslandSceneOptions.java').read_text('utf-8')
files['ls/augment/com/EnhancementOption.java'] = 'package ls.augment.com;public class EnhancementOption {public static EnhancementOption toggle(String...a){return new EnhancementOption();}}'
files['ls/augment/com/NativeFeatureGroups.java'] = 'package ls.augment.com;public class NativeFeatureGroups {public static class Feature {public Feature(String a,String b,String c,String[] d,String e,String f,Feature[] g){}}}'
for name in ['RecorderIsland','FlashlightIsland','CountDownIsland','MediaIsland','CallIsland','FaceDetectIsland','MeetingIsland','AIIsland','AIMemIsland']:
    files[f'com/zte/feature/dynamicisland/islands/{name}.java'] = f'package com.zte.feature.dynamicisland.islands;public class {name} extends com.zte.feature.dynamicisland.DynamicPermanentIsland {{}}'
files['com/zte/feature/dynamicisland/islands/ChildRecorder.java'] = 'package com.zte.feature.dynamicisland.islands;public class ChildRecorder extends RecorderIsland {}'
files['ls/augment/com/hook/TestNativePanelEntry.java'] = '''package ls.augment.com.hook;
import com.zte.feature.dynamicisland.*;import android.view.*;import java.lang.reflect.*;
public class TestNativePanelEntry {
 static int checks;static void check(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
 static class Fixture {final SceneManager manager=new SceneManager();final NativeIslandScenes scenes;
  final AugmentModule module=new AugmentModule();Fixture()throws Exception{
   scenes=new NativeIslandScenes(manager);check(NativeIslandScenes.install(module)==3,"click, long press and show installed");}
  void click()throws Throwable{module.run(manager,"onClick");}
  void show()throws Throwable{module.run(manager,"showPermanentPanelIsland");}
  void end(){manager.end(manager.selected);}}
 public static void main(String[] args)throws Throwable {
  SceneManager raw=new SceneManager();raw.showPermanentPanelIsland();boolean crashed=false;
  try{raw.end(raw.selected);}catch(NullPointerException expected){crashed=true;}
  check(crashed,"reported null-root close reproduced without the fix");
  Fixture f=new Fixture();f.click();
  check(f.manager.opens==1&&f.manager.originalClicks==0,"enhanced click opens OEM panel");
  check(IslandPanelGuard.owns(f.manager,f.manager.selected),"scene route must register ownership without active host");
  check(Proxy.isProxyClass(f.manager.mDynamicAnimation.mPermanentAnimation.mCallback.getClass()),"bridge installed before native animation");
  f.end();check(f.manager.originalEnds==0&&f.manager.heights==1,"direct native callback closes safely without manager hook");
  check(!f.manager.mDynamicPanelShowing&&!f.manager.mDynamicPanelClosing&&f.manager.selected.panel.parent==null,"panel detached and close flags cleared");
  check(f.scenes.changed==1,"scene state refresh scheduled after close");
  f.click();f.click();check(f.manager.opens==2,"repeat click does not reopen an expanded panel");
  f.end();check(f.manager.heights==2&&f.scenes.changed==2,"second expansion has one close completion");
  f.show();f.end();check(f.manager.heights==3,"OEM show entry including long press is also protected");
  f=new Fixture();f.show();check(IslandPanelGuard.owns(f.manager,f.manager.selected),"show entry prepares before any click");f.end();
  f=new Fixture();f.click();DynamicPermanentIsland old=f.manager.selected;
  f.manager.selected=new DynamicPermanentIsland();f.manager.end(old);
  check(f.manager.mDynamicPanelShowing&&f.manager.heights==0,"late close does not collapse a replacement scene");
  f=new Fixture();f.click();f.scenes.closed=true;NativeIslandScenes.selected=null;f.end();
  check(f.manager.originalEnds==0&&f.manager.heights==1&&f.scenes.changed==0,"callback stays safe after scene host release");
  f=new Fixture();f.manager.mDynamicAnimation.mPermanentAnimation=null;f.click();
  check(f.manager.opens==0&&f.manager.originalClicks==1,"missing callback keeps original click behavior");
  check(f.scenes.diagnostic.contains("animation_callback_bridge"),"specific missing capability recorded");
  f.show();check(f.manager.opens==0,"missing bridge cannot open an enhanced panel through OEM show");
  f=new Fixture();f.scenes.completed=null;f.click();
  check(f.manager.originalClicks==1&&!IslandPanelGuard.owns(f.manager,f.manager.selected),"unmodified scene remains native");
  f.show();check(f.manager.opens==1&&!IslandPanelGuard.owns(f.manager,f.manager.selected),"unmodified native show remains native");
  f=new Fixture();f.scenes.enabled=false;f.click();check(f.manager.originalClicks==1,"disabled enhancement remains native");
  f=new Fixture();f.manager.mOnKeyguard=true;f.click();check(f.manager.originalClicks==1,"lock screen retains original click");
  f=new Fixture();f.manager.selected.mCurState=0;f.click();check(f.manager.originalClicks==1,"hidden scene retains original click");
  f=new Fixture();f.manager.throttled=true;f.click();check(f.manager.opens==0&&!IslandPanelGuard.owns(f.manager,f.manager.selected),"native throttle retained");
  f=new Fixture();f.manager.mAnimProcessing=true;f.click();check(f.manager.opens==0&&!IslandPanelGuard.owns(f.manager,f.manager.selected),"animation in progress does not acquire a new owner");
  f=new Fixture();SceneManager foreign=new SceneManager();f.module.run(foreign,"onClick");
  check(foreign.originalClicks==1&&!IslandPanelGuard.owns(foreign,foreign.selected),"other manager untouched");
  f=new Fixture();f.manager.mDynamicIslandPanelRoot=new View();f.click();f.end();
  check(f.manager.originalEnds==1&&f.manager.mDynamicIslandPanelRoot.visibility==View.GONE,"real fullscreen root retains native close");
  for(String name:new String[]{"RecorderIsland","FlashlightIsland","CountDownIsland","MediaIsland","CallIsland","FaceDetectIsland","MeetingIsland","AIIsland","AIMemIsland","ChildRecorder"}) {
   f=new Fixture();f.manager.selected=(DynamicPermanentIsland)Class.forName("com.zte.feature.dynamicisland.islands."+name).getConstructor().newInstance();
   f.scenes.completed=null;f.module.run(f.manager,"onLongClick");
   check(f.manager.opens==1&&IslandPanelGuard.owns(f.manager,f.manager.selected),"stock long press prepared: "+name);
   f.end();check(f.manager.originalEnds==0&&f.manager.heights==1,"stock ordinary close safe: "+name);
  }
  f=new Fixture();f.manager.selected=new com.zte.feature.dynamicisland.islands.RecorderIsland();f.scenes.completed=null;
  f.manager.selected.panel=null;f.click();check(f.manager.originalClicks==1&&!IslandPanelGuard.owns(f.manager,f.manager.selected),"stock scene without panel retains original click");
  f=new Fixture();f.click();f.scenes.completed=null;f.scenes.closePanel();f.scenes.closePanel();
  check(f.manager.mDynamicAnimation.closes==1,"disable/control-panel/sleep close cannot start duplicate native animations");
  f.end();check(!f.manager.mDynamicPanelShowing,"owned panel closes after enhancement is disabled");
  f=new Fixture();f.manager.showPermanentPanelIsland();f.scenes.closePanel();
  check(IslandPanelGuard.pending(f.manager,f.manager.selected),"forced close of a previously opened supplemented panel prepares its callback");f.end();
  f=new Fixture();f.scenes.completed=null;f.manager.showPermanentPanelIsland();f.scenes.closePanel();
  check(f.manager.mDynamicAnimation.closes==0,"unknown unowned panel retains its native lifecycle");
  System.out.println("PASS native scene panel entry: "+checks+" checks (no active host, no manager close hook, no device)");
 }
}'''
java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
suffix = '.exe' if os.name == 'nt' else ''
from island_panel_test_support import add_status_bar_support
add_status_bar_support(files)
with tempfile.TemporaryDirectory(prefix='duo-native-panel-entry-') as folder:
    folder = Path(folder)
    paths = []
    for name, data in files.items():
        path = folder / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(data, 'utf-8')
        paths.append(str(path))
    compile_cmd = [str(java / f'javac{suffix}'), '-encoding', 'UTF-8', '-d', str(folder), *paths]
    run_cmd = [str(java / f'java{suffix}'), '-cp', str(folder), 'ls.augment.com.hook.TestNativePanelEntry']
    subprocess.run(compile_cmd, check=True)
    subprocess.run(run_cmd, check=True)
    path = folder / 'ls/augment/com/hook/NativeIslandScenes.java'
    original = path.read_text('utf-8')
    for before, after, expected in [
        ('if (owner.preparePanelExpansion(owner.permanent)) {', 'if (true) {', 'scene route must register ownership'),
        ('if (owner != null && !owner.preparePanelExpansion(chain.getThisObject())) return null;', '', 'OEM show entry including long press is also protected'),
    ]:
        assert before in original
        path.write_text(original.replace(before, after, 1), 'utf-8')
        subprocess.run(compile_cmd, check=True, capture_output=True)
        result = subprocess.run(run_cmd, capture_output=True, text=True)
        assert result.returncode and expected in result.stderr, result.stderr
        path.write_text(original, 'utf-8')
        print('PASS rejected regression:', expected)
