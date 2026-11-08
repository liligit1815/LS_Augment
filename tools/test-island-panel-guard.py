"""Run the native animation callback bridge without any manager Hook or Android device."""
from pathlib import Path
import importlib.util, os, subprocess, tempfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('panel_fixture', ROOT/'tools/test-island-panel-runtime.py')
fixture = importlib.util.module_from_spec(spec)
spec.loader.exec_module(fixture)
FILES = dict(fixture.FILES)
FILES['ls/augment/com/hook/FeatureRuntimeLog.java'] = '''package ls.augment.com.hook;
import java.util.*;class FeatureRuntimeLog {static final List<String> logs=new ArrayList<>();
static void event(String s,String d){logs.add(s+":"+d);}static String failure(Throwable e){return e.getClass().getName();}}'''
FILES['com/zte/feature/dynamicisland/DynamicIslandAnimation.java'] = '''package com.zte.feature.dynamicisland;
public class DynamicIslandAnimation {public static int calls;public static void startStatusBarAnimation(android.view.View v,boolean show){calls++;v.setAlpha(show?.35f:0f);}}'''
FILES['ls/augment/com/hook/TestIslandPanelGuard.java'] = '''package ls.augment.com.hook;
import java.lang.reflect.*;import android.view.*;import com.zte.feature.dynamicisland.DynamicPermanentIsland;
public class TestIslandPanelGuard {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public interface Callback {
  void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland island,boolean remove,boolean change);
  void onPermanentIslandPanelCloseAnimationStart();
  int unchanged(int value);void nativeFailure();
 }
 public static class Factory {public Callback mCallback;Factory(Callback c){mCallback=c;}}
 public static class Animation {public Object mPermanentAnimation;Animation(Callback c){mPermanentAnimation=new Factory(c);}
  public void startDisposableChangeAnimation(Object a,Object b){} }
 public static class Manager implements Callback {
  public View mDynamicIslandPanelRoot;public boolean mDynamicPanelClosing=true,mDynamicPanelShowing=true;
  public ViewGroup mDynamicPanelContainer=new ViewGroup();public View mDynamicIslandRoot=new View();
  public Object mWindowManager=new Object(),mParams=new Object(),mDisposableIsland;
  public View mPhoneStatusBarView=new View();
  public DynamicPermanentIsland selected=new DynamicPermanentIsland(),mTempIsland=selected;
  public Animation mDynamicAnimation=new Animation(this);int originals,heights,removes,starts;
  public DynamicPermanentIsland getPermanentIsland(){return selected;}
  public void updateDynamicWindowHeightParams(boolean v){check(!v,"compact height");heights++;}
  public void removePermanentIslandInner(DynamicPermanentIsland i){removes++;}
  public void onPermanentIslandPanelCloseAnimationStart(){starts++;mDynamicPanelClosing=true;}
  // Actual archived failing operation. No Hook exists in this harness.
  public void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland i,boolean r,boolean d){originals++;
   mDynamicPanelShowing=false;mDynamicPanelClosing=false;mDynamicPanelContainer.removeAllViews();mDynamicIslandPanelRoot.setVisibility(View.GONE);}
  public int unchanged(int n){return n+5;}
  public void nativeFailure(){throw new IllegalArgumentException("original");}
  Manager(){mDynamicPanelContainer.addView(selected.panel);}
 }
 public static class Child extends Manager {}
 public static class OverrideStart extends Manager {
  @Override public void onPermanentIslandPanelCloseAnimationStart(){mDynamicPanelClosing=true;mPhoneStatusBarView.setAlpha(.35f);}
 }
 public static class PrivateFactory {private Callback mCallback;PrivateFactory(Callback c){mCallback=c;}}
 public static class FactoryChild extends PrivateFactory {FactoryChild(Callback c){super(c);}}
 public interface WrongCallback {void onPermanentIslandPanelCloseAnimationEnd(Object i,boolean r,boolean d);}
 public static class WrongFactory {public WrongCallback mCallback=(i,r,d)->{};}
 static Callback callback(Manager m)throws Exception {
  Object f=m.mDynamicAnimation.mPermanentAnimation;
  for(Class<?> c=f.getClass();c!=null;c=c.getSuperclass())try{Field field=c.getDeclaredField("mCallback");field.setAccessible(true);return (Callback)field.get(f);}catch(NoSuchFieldException ignored){}
  throw new AssertionError();
 }
 static void end(Manager m,DynamicPermanentIsland scene)throws Exception{callback(m).onPermanentIslandPanelCloseAnimationEnd(scene,false,false);}
 public static void main(String[] args)throws Exception {
  Manager raw=new Manager();boolean crashed=false;try{end(raw,raw.selected);}catch(NullPointerException e){crashed=true;}
  check(crashed,"baseline native callback crashes");
  Manager m=new Manager();int[] complete={0};
  check(IslandPanelGuard.prepare(m,m.selected,()->complete[0]++),"ordinary callback admitted");
  Callback proxy=callback(m);check(Proxy.isProxyClass(proxy.getClass()),"callback field replaced and read back");
  proxy.onPermanentIslandPanelCloseAnimationStart();check(m.starts==1,"native start preserved");
  check(proxy.unchanged(7)==12,"unrelated callback return preserved");
  try{proxy.nativeFailure();throw new AssertionError("native exception swallowed");}catch(IllegalArgumentException e){check(e.getMessage().equals("original"),"original exception unwrapped");}
  end(m,m.selected);check(m.originals==0,"close protected without a manager hook");
  check(!m.mDynamicPanelShowing&&!m.mDynamicPanelClosing&&m.mTempIsland==null,"close flags restored");
  check(m.heights==1&&m.selected.panel.parent==null&&complete[0]==1,"ordinary panel detached and completion notified");
  end(m,m.selected);check(m.heights==1&&complete[0]==1,"duplicate callback cannot remove twice");
  m.mDynamicPanelShowing=true;check(IslandPanelGuard.prepare(m,m.selected,()->complete[0]++),"next expansion reuses bridge");
  check(callback(m)==proxy,"no nested wrappers");end(m,m.selected);check(m.heights==2&&complete[0]==2,"next generation closes");
  m=new Manager();DynamicPermanentIsland old=m.selected;check(IslandPanelGuard.prepare(m,old,null),"register before active-host release");
  m.selected=new DynamicPermanentIsland();end(m,old);
  check(m.mDynamicPanelShowing&&m.heights==0&&m.originals==0,"old animation cannot close new selection or crash");
  m=new Manager();old=m.selected;check(IslandPanelGuard.prepare(m,old,null),"pending callback retained");
  m.selected=null;IslandPanelGuard.withdrawing(m,old);end(m,old);
  check(m.heights==1&&m.removes==1,"withdraw completes after selection cleared");
  m=new Manager();old=m.selected;View retiredPanel=old.panel;
  check(IslandPanelGuard.prepare(m,old,null),"prepare before source is disabled");old.panel=null;
  end(m,old);check(retiredPanel.parent==null&&m.heights==1,"disabled getter still detaches captured panel");
  m=new Manager();old=m.selected;retiredPanel=old.panel;
  check(IslandPanelGuard.prepare(m,old,null),"prepare old scene before replacement");
  IslandPanelGuard.withdrawing(m,old);m.selected=new DynamicPermanentIsland();m.mTempIsland=m.selected;
  m.mDynamicPanelContainer.addView(m.selected.panel);old.panel=null;end(m,old);
  check(retiredPanel.parent==null&&m.selected.panel.parent==m.mDynamicPanelContainer,"stale callback detaches only its captured old panel");
  check(m.removes==1&&m.heights==0&&m.mDynamicPanelShowing&&m.mDynamicPanelClosing&&m.mTempIsland==m.selected,"withdrawal completes without changing new scene state");
  m=new Manager();int[] first={0},second={0};
  check(IslandPanelGuard.prepare(m,m.selected,()->first[0]++),"prepare direct route");
  check(IslandPanelGuard.prepare(m,m.selected,()->second[0]++),"common route preparation is idempotent");
  end(m,m.selected);check(first[0]==1&&second[0]==0,"nested routes preserve original completion owner");
  m=new Manager();check(IslandPanelGuard.prepare(m,m.selected,null),"prepare deferred scene removal");
  check(IslandPanelGuard.deferRemoval(m,m.selected),"selected scene removal reuses native close in progress");
  check(!IslandPanelGuard.deferRemoval(new Manager(),m.selected),"foreign removal stays native");
  end(m,m.selected);check(m.removes==1&&!IslandPanelGuard.deferRemoval(m,m.selected),"one deferred removal completes and ended transitions cannot defer");
  m=new Manager();check(IslandPanelGuard.prepare(m,m.selected,null),"prepare dynamic mode check");
  m.mDynamicIslandPanelRoot=new View();end(m,m.selected);
  check(m.originals==1&&m.mDynamicIslandPanelRoot.visibility==View.GONE,"new real fullscreen root uses native callback");
  m=new Manager();m.mDynamicIslandPanelRoot=new View();check(IslandPanelGuard.prepare(m,m.selected,null),"fullscreen unchanged");
  check(callback(m)==m,"fullscreen never wrapped");
  Child child=new Child();child.mDynamicAnimation.mPermanentAnimation=new FactoryChild(child);
  check(IslandPanelGuard.prepare(child,child.selected,null),"inherited private factory callback and manager supported");end(child,child.selected);
  check(child.originals==0&&child.heights==1,"subclass ordinary close protected");
  m=new Manager();m.mDynamicAnimation.mPermanentAnimation=null;check(!IslandPanelGuard.prepare(m,m.selected,null),"missing animation capability rejects expansion");
  m=new Manager();m.mDynamicAnimation.mPermanentAnimation=new WrongFactory();check(!IslandPanelGuard.prepare(m,m.selected,null),"wrong callback signature rejected");
  m=new Manager();Manager foreign=new Manager();((Factory)m.mDynamicAnimation.mPermanentAnimation).mCallback=foreign;
  check(!IslandPanelGuard.prepare(m,m.selected,null)&&callback(m)==foreign,"foreign callback preserved");
  m=new Manager();check(IslandPanelGuard.prepare(m,m.selected,null),"prepare foreign-scene control");
  crashed=false;try{end(m,new DynamicPermanentIsland());}catch(NullPointerException e){crashed=true;}
  check(crashed&&m.originals==1,"unowned scene keeps original failure, no global swallow");
  check(!IslandPanelGuard.owns(foreign,m.selected),"ownership bound to exact manager");
  check(FeatureRuntimeLog.logs.stream().anyMatch(s->s.contains("ISLAND_PANEL_CLOSE_END")&&s.contains("transition=")),"close correlation logged");
  check(FeatureRuntimeLog.logs.stream().anyMatch(s->s.contains("duplicate_end")),"duplicate branch logged");
  check(FeatureRuntimeLog.logs.stream().anyMatch(s->s.contains("native_unowned")),"native ownership branch logged");
  check(FeatureRuntimeLog.logs.stream().anyMatch(s->s.contains("state=unavailable")),"missing capability logged");
  check(FeatureRuntimeLog.logs.stream().anyMatch(s->s.contains("ISLAND_PANEL_NATIVE_ERROR")),"original failure logged");
  IslandPanelStatusBar.observeCalls(Manager.class);
  m=new Manager();m.mPhoneStatusBarView.setAlpha(0f);IslandPanelGuard.prepare(m,m.selected,null);
  check(IslandPanelGuard.restoresStatusBar(m,m.selected),"captured bar uses the shared restoration path");
  com.zte.feature.dynamicisland.DynamicIslandAnimation.calls=0;
  callback(m).onPermanentIslandPanelCloseAnimationStart();
  check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==1&&m.mPhoneStatusBarView.getAlpha()==.35f,"ordinary close starts OEM fade without forcing final alpha");
  check(IslandPanelStatusBar.ownsFade(m.mPhoneStatusBarView),"native music fade is not treated as hidden status bar");
  IslandPanelGuard.closeStarted(m);end(m,m.selected);end(m,m.selected);
  check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==1,"bridge, hook and duplicate end cannot restart fade");
  android.os.SystemClock.now+=700;
  check(!IslandPanelStatusBar.ownsFade(m.mPhoneStatusBarView),"fade visibility lease expires after close");
  m=new Manager();m.mPhoneStatusBarView.setAlpha(0f);IslandPanelGuard.prepare(m,m.selected,null);
  com.zte.feature.dynamicisland.DynamicIslandAnimation.calls=0;
  IslandPanelStatusBar.shown(m.mPhoneStatusBarView);
  com.zte.feature.dynamicisland.DynamicIslandAnimation.startStatusBarAnimation(m.mPhoneStatusBarView,true);
  callback(m).onPermanentIslandPanelCloseAnimationStart();end(m,m.selected);
  check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==1,"existing native fade is observed and never duplicated");
  m=new Manager();m.mPhoneStatusBarView.setAlpha(0f);IslandPanelGuard.prepare(m,m.selected,null);
  com.zte.feature.dynamicisland.DynamicIslandAnimation.calls=0;old=m.selected;m.selected=null;end(m,old);
  check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==1,"withdraw after selection cleared restores status bar at completion");
  m=new Manager();m.mPhoneStatusBarView.setAlpha(0f);IslandPanelGuard.prepare(m,m.selected,null);old=m.selected;
  m.selected=new DynamicPermanentIsland();m.mTempIsland=m.selected;IslandPanelGuard.prepare(m,m.selected,null);
  com.zte.feature.dynamicisland.DynamicIslandAnimation.calls=0;end(m,old);
  check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==0&&m.mPhoneStatusBarView.getAlpha()==0f,"old scene completion cannot reveal bar under new panel");
  end(m,m.selected);check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==1,"new scene owns its eventual restoration");
  m=new Manager();m.mPhoneStatusBarView.setAlpha(0f);IslandPanelGuard.prepare(m,m.selected,null);old=m.selected;
  m.selected=null;m.mTempIsland=new DynamicPermanentIsland();com.zte.feature.dynamicisland.DynamicIslandAnimation.calls=0;end(m,old);
  check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==0&&m.mPhoneStatusBarView.getAlpha()==0f,"foreign temporary panel is protected even while selection is empty");
  m=new Manager();m.mPhoneStatusBarView=null;IslandPanelGuard.prepare(m,m.selected,null);
  check(!IslandPanelGuard.restoresStatusBar(m,m.selected),"missing bar leaves pre-existing host fallback available");
  end(m,m.selected);check(!m.mDynamicPanelShowing,"missing status bar does not break safe close");
  m=new Manager();m.mPhoneStatusBarView.setAlpha(0f);IslandPanelGuard.prepare(m,m.selected,null);
  m.mPhoneStatusBarView=new View();m.mPhoneStatusBarView.setAlpha(0f);com.zte.feature.dynamicisland.DynamicIslandAnimation.calls=0;end(m,m.selected);
  check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==0,"replacement status bar is never touched by stale lease");
  m=new OverrideStart();m.mPhoneStatusBarView.setAlpha(0f);IslandPanelGuard.prepare(m,m.selected,null);
  com.zte.feature.dynamicisland.DynamicIslandAnimation.calls=0;callback(m).onPermanentIslandPanelCloseAnimationStart();end(m,m.selected);
  check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==0,"unobserved subclass override keeps its running native fade");
  Field observed=IslandPanelStatusBar.class.getDeclaredField("observedCalls");observed.setAccessible(true);observed.setBoolean(null,false);
  m=new Manager();m.mPhoneStatusBarView.setAlpha(0f);IslandPanelGuard.prepare(m,m.selected,null);com.zte.feature.dynamicisland.DynamicIslandAnimation.calls=0;
  callback(m).onPermanentIslandPanelCloseAnimationStart();check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==0,"unobserved original start preserved");
  end(m,m.selected);check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==1,"hidden bar gets OEM fallback at close end");
  m=new Manager();m.mPhoneStatusBarView.setAlpha(.4f);IslandPanelGuard.prepare(m,m.selected,null);com.zte.feature.dynamicisland.DynamicIslandAnimation.calls=0;end(m,m.selected);
  check(com.zte.feature.dynamicisland.DynamicIslandAnimation.calls==0,"unobserved in-flight native fade is not restarted");
  System.out.println("PASS IslandPanelGuard: "+checks+" callback/lifecycle/contract checks; no manager Hook, no device commands");
 }
}'''
for name in ['IslandPanelGuard', 'NativeIslandPanelCompat']:
    FILES[f'ls/augment/com/hook/{name}.java'] = (ROOT/f'android/app/src/main/java/ls/augment/com/hook/{name}.java').read_text('utf-8')
java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
suffix = '.exe' if os.name == 'nt' else ''
from island_panel_test_support import add_status_bar_support
add_status_bar_support(FILES)
with tempfile.TemporaryDirectory(prefix='duo-panel-guard-') as folder:
    folder = Path(folder); paths=[]
    for name, data in FILES.items():
        p=folder/name; p.parent.mkdir(parents=True,exist_ok=True); p.write_text(data,'utf-8'); paths.append(str(p))
    compile_cmd=[str(java/f'javac{suffix}'),'-encoding','UTF-8','-d',str(folder),*paths]
    run_cmd=[str(java/f'java{suffix}'),'-cp',str(folder),'ls.augment.com.hook.TestIslandPanelGuard']
    subprocess.run(compile_cmd,check=True);subprocess.run(run_cmd,check=True)
    p=folder/'ls/augment/com/hook/IslandPanelGuard.java'; original=p.read_text('utf-8')
    for before, after, expected in [
        ('boolean ending=method.equals(close);','boolean ending=false;','NullPointerException'),
        ('if(record.ended) {','if(false) {','duplicate callback cannot remove twice'),
        ('if (current!=owner) throw','if (false) throw','foreign callback preserved'),
        ('IslandPanelStatusBar.restore(owner,record.statusBar,false);',';','ordinary close starts OEM fade'),
        ('&&(temporary==null||temporary==island)','', 'foreign temporary panel is protected'),
    ]:
        assert before in original
        p.write_text(original.replace(before,after,1),'utf-8')
        subprocess.run(compile_cmd,check=True,capture_output=True)
        result=subprocess.run(run_cmd,capture_output=True,text=True)
        assert result.returncode and expected in result.stderr,result.stderr
        print('PASS rejected regression:',expected)
        p.write_text(original,'utf-8')
