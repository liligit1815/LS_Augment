"""Exercise the ordinary NativeIslandScenes resize hook, including the reported WMS rebound."""
from pathlib import Path
import importlib.util
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
spec = importlib.util.spec_from_file_location('panel_runtime', ROOT/'tools/test-island-panel-runtime.py')
base = importlib.util.module_from_spec(spec); spec.loader.exec_module(base)
files = dict(base.FILES)
files['android/content/Context.java'] = '''package android.content;
public class Context {public Resources getResources(){return new Resources();}
 public static class Resources {public int getIdentifier(String n,String t,String p){return 1;}public Metrics getDisplayMetrics(){return new Metrics();}}
 public static class Metrics {public int widthPixels=1000;}}
'''
files['android/view/WindowManager.java'] = '''package android.view;
public interface WindowManager {void updateViewLayout(View v,LayoutParams p);
 class LayoutParams {public int width=200,height=50,x=0,y=14,gravity=49,windowAnimations=123,privateFlags=512;
 public static final int PRIVATE_FLAG_NO_MOVE_ANIMATION=64;
 public boolean canPlayMoveAnimation(){return (privateFlags&64)==0;}
 public void setCanPlayMoveAnimation(boolean v){privateFlags=v?privateFlags&~64:privateFlags|64;}}}
'''
files['com/zte/tools/AppTools.java'] = 'package com.zte.tools;public class AppTools {public static boolean DYNAMIC_ISLAND_WATER_DROP;}'
files['com/zte/customize/OperatorUtils.java'] = 'package com.zte.customize;public class OperatorUtils {public static boolean LARGE_RADIUS_PANEL;}'
files['com/zte/utils/ResourceUtil.java'] = 'package com.zte.utils;public class ResourceUtil {public static int getDimensionPixelSizeInDefaultDpi(int id){return 450;}}'
files['ls/augment/com/hook/FeatureRuntimeLog.java'] = 'package ls.augment.com.hook;class FeatureRuntimeLog {static void event(String s,String d){}}'
for name in ('IslandWindowMotion','NativeIslandPanelCompat','NativeIslandSceneContract'):
    files[f'ls/augment/com/hook/{name}.java'] = (JAVA/f'{name}.java').read_text('utf-8')
source = (JAVA/'NativeIslandScenes.java').read_text('utf-8')
methods = '\n'.join(base.method(source, m) for m in ('static void adjustWindow(', 'private void restorePanelWindow(', 'private void reportMotion('))
files['ls/augment/com/hook/NativeIslandScenes.java'] = '''package ls.augment.com.hook;
import android.view.*;import android.content.*;import java.lang.reflect.*;import static ls.augment.com.hook.SystemUiAdapter.*;
class NativeIslandScenes {
 static NativeIslandScenes selected;final Object permanent;final View root;final Context context=new Context();
 final ClassLoader loader=getClass().getClassLoader();boolean closed;boolean complete=true;String lastMotion="";
 int panelWindowBefore=-1,panelWindowApplied=-1;final IslandWindowMotion panelWindowMotion=new IslandWindowMotion();
 NativeIslandScenes(TestPanelMotion.Manager m){permanent=m;root=m.mDynamicIslandRoot;selected=this;}
 View completedPanel(Object scene){return complete?new View():null;}void report(String v){}static String reason(Throwable e){return e.toString();}
 void finish(){closed=true;restorePanelWindow();panelWindowMotion.restoreAll(this::reportMotion);}
 // METHODS
}'''.replace('// METHODS', methods)
files['ls/augment/com/hook/TestPanelMotion.java'] = '''package ls.augment.com.hook;
import android.view.*;import com.zte.feature.dynamicisland.DynamicPermanentIsland;
public class TestPanelMotion {
 static int checks;static void check(boolean b,String label){checks++;if(!b)throw new AssertionError(label);}
 public static class Manager {
  public View mDynamicIslandPanelRoot,mDynamicIslandRoot=new View();public ViewGroup mDynamicPanelContainer=new ViewGroup();
  public boolean mDynamicPanelClosing,mDynamicPanelShowing;public DynamicPermanentIsland selected=new DynamicPermanentIsland(),mTempIsland;
  public WindowManager.LayoutParams mParams=new WindowManager.LayoutParams();public int updates;
  public WindowManager mWindowManager=(v,p)->{updates++;NativeIslandScenes.adjustWindow(v,p);};
  public DynamicPermanentIsland getPermanentIsland(){return selected;}
  public void updateDynamicWindowHeightParams(boolean v){}public void removePermanentIslandInner(DynamicPermanentIsland i){}
  public void onPermanentIslandPanelCloseAnimationEnd(DynamicPermanentIsland i,boolean r,boolean d){}
 }
 public static class Child extends Manager {}
 static int left(WindowManager.LayoutParams p){return (1000-p.width)/2+p.x;}
 public static void main(String[] a){
  for(Manager m:new Manager[]{new Manager(),new Child()}){
   NativeIslandScenes s=new NativeIslandScenes(m);WindowManager.LayoutParams p=m.mParams;
   m.mDynamicPanelShowing=true;NativeIslandScenes.adjustWindow(s.root,p);int openLeft=left(p);
   check(p.width==450&&!p.canPlayMoveAnimation(),"ordinary expansion uses OEM width without extra WMS move");
   m.mDynamicPanelShowing=false;NativeIslandScenes.adjustWindow(s.root,p);int compactLeft=left(p);
   int firstSurfaceLeft=compactLeft+(p.canPlayMoveAnimation()?openLeft-compactLeft:0);
   check(p.width==200&&firstSurfaceLeft==compactLeft,"ordinary collapse cannot replay old left edge");
   check(p.gravity==49&&p.windowAnimations==123&&p.y==14&&p.height==50,"OEM animation style and touch geometry remain intact");
   for(int i=0;i<4;i++){m.selected=new DynamicPermanentIsland();m.mDynamicPanelShowing=true;NativeIslandScenes.adjustWindow(s.root,p);
    m.mDynamicPanelShowing=false;NativeIslandScenes.adjustWindow(s.root,p);check(p.width==200&&!p.canPlayMoveAnimation(),"scene replacement keeps common resize policy");}
   s.complete=false;m.selected=null;NativeIslandScenes.adjustWindow(s.root,p);
   check(!p.canPlayMoveAnimation(),"withdrawal does not reintroduce window movement");
   WindowManager.LayoutParams other=new WindowManager.LayoutParams();NativeIslandScenes.adjustWindow(new View(),other);
   check(other.canPlayMoveAnimation()&&other.width==200,"foreign window untouched");
   p.privateFlags|=1024;s.finish();check(p.canPlayMoveAnimation()&&p.privateFlags==1536,"release restores original move policy and preserves unrelated flags");
   NativeIslandScenes.adjustWindow(s.root,p);check(p.canPlayMoveAnimation(),"closed owner cannot suppress native movement again");
  }
  Manager m=new Manager();m.mParams.setCanPlayMoveAnimation(false);NativeIslandScenes s=new NativeIslandScenes(m);
  NativeIslandScenes.adjustWindow(s.root,m.mParams);s.finish();check(!m.mParams.canPlayMoveAnimation(),"original native suppression retained");
  m=new Manager();m.mDynamicIslandPanelRoot=new View();s=new NativeIslandScenes(m);s.complete=false;
  NativeIslandScenes.adjustWindow(s.root,m.mParams);check(m.mParams.canPlayMoveAnimation(),"real fullscreen root stays native");
  System.out.println("PASS ordinary panel motion: "+checks+" checks (WMS policy model, not device video)");
 }
}'''
java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
suffix = '.exe' if os.name == 'nt' else ''
with tempfile.TemporaryDirectory(prefix='duo-panel-motion-') as directory:
    directory=Path(directory);paths=[]
    for name,data in files.items():
        p=directory/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(data,'utf-8');paths.append(str(p))
    compile_cmd=[str(java/f'javac{suffix}'),'-encoding','UTF-8','-d',str(directory),*paths]
    run=[str(java/f'java{suffix}'),'-cp',str(directory),'ls.augment.com.hook.TestPanelMotion']
    subprocess.run(compile_cmd,check=True);subprocess.run(run,check=True)
    p=directory/'ls/augment/com/hook/NativeIslandScenes.java'
    p.write_text(p.read_text('utf-8').replace('owner.panelWindowMotion.suppress(params, owner::reportMotion);','{}'),'utf-8')
    subprocess.run(compile_cmd,check=True,capture_output=True)
    failed=subprocess.run(run,capture_output=True,text=True)
    assert failed.returncode and 'ordinary expansion uses OEM width' in failed.stderr,failed.stderr
    print('PASS rejected regression: missing ordinary-window suppression')
