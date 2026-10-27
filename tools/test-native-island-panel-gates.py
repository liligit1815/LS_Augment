"""Execute the production panel getter gates, including actual scene ID inheritance."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/NativeIslandScenes.java').read_text(encoding='utf-8')
def method(marker):
    start=source.index(marker);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]

files={
 'android/view/View.java':'package android.view;public class View {public boolean listener=true;public boolean hasOnClickListeners(){return listener;}}',
 'android/widget/ImageView.java':'package android.widget;public class ImageView extends android.view.View {}',
 'ls/augment/com/hook/NativeIslandMedia.java':'package ls.augment.com.hook;class NativeIslandMedia {boolean live=true;boolean ready(){return live;}}',
 'ls/augment/com/hook/NativeIslandCards.java':'package ls.augment.com.hook;class NativeIslandCards {Object island;android.view.View view;android.view.View panel(Object value){return value==island?view:null;}}',
 'android/view/WindowManager.java':'package android.view;public interface WindowManager {class LayoutParams {public int width;} void updateViewLayout(View v,LayoutParams p);}',
 'com/zte/tools/AppTools.java':'package com.zte.tools;public class AppTools {public static boolean DYNAMIC_ISLAND_WATER_DROP;}',
 'com/zte/customize/OperatorUtils.java':'package com.zte.customize;public class OperatorUtils {public static boolean LARGE_RADIUS_PANEL;}',
 'com/zte/utils/ResourceUtil.java':'package com.zte.utils;public class ResourceUtil {public static int getDimensionPixelSizeInDefaultDpi(int id){return id;}}',
 'android/media/session/MediaController.java':'''package android.media.session;public class MediaController {
 public String pkg="music";public Object state=new Object();public String getPackageName(){return pkg;}public Object getPlaybackState(){return state;}}''',
 'ls/augment/com/EnhancementOption.java':'package ls.augment.com;public class EnhancementOption {public static EnhancementOption toggle(String k,String t,String l,String h){return new EnhancementOption();}}',
 'ls/augment/com/NativeFeatureGroups.java':'package ls.augment.com;public class NativeFeatureGroups {public static class Feature {public Feature(String a,String b,String c,String[] d,String e,String f,Feature[] g){}}}',
 'com/zte/feature/dynamicisland/islands/RecorderIsland.java':'package com.zte.feature.dynamicisland.islands;public class RecorderIsland extends android.view.View {}',
 'com/zte/feature/dynamicisland/islands/CountDownIsland.java':'package com.zte.feature.dynamicisland.islands;public class CountDownIsland extends android.view.View {}',
 'com/zte/feature/dynamicisland/islands/FlashlightIsland.java':'package com.zte.feature.dynamicisland.islands;public class FlashlightIsland extends android.view.View {}',
 'com/zte/feature/dynamicisland/islands/MediaIsland.java':'''package com.zte.feature.dynamicisland.islands;public class MediaIsland extends android.view.View {
 public Object mMediaData;public String mMediaPkg="music";public int mCurrentUser;}''',
}
harness='''package ls.augment.com.hook;
import java.util.*;import java.lang.reflect.*;import android.view.View;import android.view.WindowManager;import android.widget.ImageView;import ls.augment.com.NativeIslandSceneOptions;
public class TestNativeIslandPanelGates {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 final TestContext context=new TestContext();final Set<String> supportedScenes=new HashSet<>(),enhancedScenes=new HashSet<>();
 final Map<Object,View> panels=new IdentityHashMap<>();Object media;NativeIslandMedia mediaBridge;NativeIslandCards cardsBridge;boolean usable=true;static int user;
 static TestNativeIslandPanelGates selected;final View root=new View();final Manager permanent=new Manager();
 final ClassLoader loader=TestNativeIslandPanelGates.class.getClassLoader();int panelWindowBefore=-1,panelWindowApplied=-1;
 static class TestContext extends HashMap<String,Boolean> {final Resources res=new Resources();Resources getResources(){return res;}}
 static class Resources {int id=1118,widthPixels=1216;int getIdentifier(String n,String t,String p){return id;}Resources getDisplayMetrics(){return this;}}
 static class Manager {public Object current;public boolean mDynamicPanelShowing;public WindowManager.LayoutParams mParams=new WindowManager.LayoutParams();public WindowManager mWindowManager=(v,p)->{};public Object getPermanentIsland(){return current;}}
 static Object call(Object owner,String name)throws Exception{return owner.getClass().getMethod(name).invoke(owner);}
 static String reason(Exception e){return e.getClass().getSimpleName();}void report(String value){}
 boolean usable(){return usable;}static int currentUser(){return user;}
 static class FeatureSettings {static boolean enabled(Map<String,Boolean> c,String k){return c.getOrDefault(k,false);}}
 static Object field(Object o,String name){if(o==null)return null;for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())try{
 Field f=t.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(Exception ignored){}return null;}
 static class ChildRecorder extends com.zte.feature.dynamicisland.islands.RecorderIsland {}
 static class Panel extends View {public android.media.session.MediaController mMediaController;
 public ImageView mPanelPrev=new ImageView(),mPanelPlayPause=new ImageView(),mPanelNext=new ImageView();}
 // METHODS
 public static void main(String[] args){TestNativeIslandPanelGates g=new TestNativeIslandPanelGates();
 Object[] scenes={new ChildRecorder(),new com.zte.feature.dynamicisland.islands.FlashlightIsland(),new com.zte.feature.dynamicisland.islands.CountDownIsland()};
 String[] ids={"record","torch","countdown"};
 for(int i=0;i<ids.length;i++){String id=ids[i];Object scene=scenes[i];View panel=new View();g.panels.put(scene,panel);g.enhancedScenes.add(id);g.supportedScenes.add(id);
 g.context.clear();check(g.completedPanel(scene)==null,"default OFF preserves OEM null panel");
 g.context.put(NativeIslandSceneOptions.key(id),true);check(g.completedPanel(scene)==null,"child alone cannot enable panel");
 g.context.put(NativeIslandSceneOptions.ENABLED,true);check(g.completedPanel(scene)==panel,"selected existing panel exposed, including inherited scene");
 g.context.put(NativeIslandSceneOptions.key(id),false);check(g.completedPanel(scene)==null,"scene OFF takes effect before config callback");
 g.context.put(NativeIslandSceneOptions.key(id),true);g.supportedScenes.remove(id);check(g.completedPanel(scene)==null,"missing capability preserves native behavior");g.supportedScenes.add(id);
 g.usable=false;check(g.completedPanel(scene)==null,"detached/closed host cannot lend panel");g.usable=true;
 }
 com.zte.feature.dynamicisland.islands.MediaIsland music=new com.zte.feature.dynamicisland.islands.MediaIsland();g.media=music;Panel p=new Panel();g.panels.put(music,p);
 g.context.put(NativeIslandSceneOptions.key("media"),true);g.enhancedScenes.add("media");g.supportedScenes.add("media");
 check(g.completedPanel(music)==null,"media without data has no synthetic controls");music.mMediaData=new Object();
 check(g.completedPanel(music)==null,"media without controller stays native");p.mMediaController=new android.media.session.MediaController();
 check(g.completedPanel(music)==p,"bound media session exposes native panel");p.mMediaController.pkg="other";
 g.mediaBridge=new NativeIslandMedia();g.mediaBridge.live=false;
 check(g.completedPanel(music)==null,"retired bridge cannot expose previous controller");g.mediaBridge.live=true;
 check(g.completedPanel(music)==null,"stale different package controller rejected");p.mMediaController.pkg="music";p.mMediaController.state=null;
 check(g.completedPanel(music)==null,"destroyed playback session rejected");p.mMediaController.state=new Object();user=10;
 check(g.completedPanel(music)==null,"previous user media rejected");user=0;p.mPanelNext.listener=false;
 check(g.completedPanel(music)==null,"unbound native actions are not exposed");p.mPanelNext.listener=true;
 g.context.put(NativeIslandSceneOptions.ENABLED,false);check(g.completedPanel(music)==null&&!g.hasEnhancements(),"master OFF disables every completion gate");
 check(g.completedPanel(new View())==null,"unknown scene keeps original getter result");
 selected=g;g.context.put(NativeIslandSceneOptions.ENABLED,true);g.permanent.current=scenes[2];g.permanent.mDynamicPanelShowing=true;
 WindowManager.LayoutParams wp=g.permanent.mParams;wp.width=884;
 adjustWindow(new View(),wp);check(wp.width==884,"unrelated window unchanged");
 adjustWindow(g.root,wp);check(wp.width==1118,"ordinary capsule window expands to OEM animation width");
 adjustWindow(g.root,wp);check(g.panelWindowBefore==884,"repeated window updates retain original size");
 g.context.put(NativeIslandSceneOptions.key("countdown"),false);adjustWindow(g.root,wp);check(wp.width==884&&g.panelWindowBefore==-1,"scene OFF releases window width");
 g.context.put(NativeIslandSceneOptions.key("countdown"),true);wp.width=1200;adjustWindow(g.root,wp);check(wp.width==1200&&g.panelWindowBefore==-1,"older wide native window retained");
 wp.width=884;g.context.res.widthPixels=1024;adjustWindow(g.root,wp);check(wp.width==1024,"narrow display clamps to actual screen width");
 g.permanent.mDynamicPanelShowing=false;adjustWindow(g.root,wp);check(wp.width==884,"native panel close restores window size");
 g.permanent.mDynamicPanelShowing=true;g.context.res.id=0;adjustWindow(g.root,wp);check(wp.width==884,"missing OEM size preserves window");
 g.context.res.id=1118;adjustWindow(g.root,wp);g.restorePanelWindow();check(wp.width==884&&g.panelWindowBefore==-1,"host release restores owned dimensions");
 adjustWindow(g.root,wp);wp.width=1100;g.permanent.mDynamicPanelShowing=false;adjustWindow(g.root,wp);check(wp.width==1100,"external window change is not overwritten on release");
 g.cardsBridge=new NativeIslandCards();g.cardsBridge.island=new View();g.cardsBridge.view=new View();
 g.permanent.current=g.cardsBridge.island;g.permanent.mDynamicPanelShowing=true;wp.width=884;g.context.res.widthPixels=1216;
 adjustWindow(g.root,wp);check(wp.width==1118,"verified OEM app card uses same native panel width path");
 g.cardsBridge.view=null;adjustWindow(g.root,wp);check(wp.width==884,"retired card host releases panel width");
 System.out.println("PASS native island panel gates: "+checks+" checks");}
}'''
harness=harness.replace('// METHODS','\n'.join(method(m) for m in (
 'private boolean enhancing(', 'private boolean hasEnhancements(', 'private View completedPanel(', 'private boolean mediaPanelReady(',
 'static void adjustWindow(', 'private void restorePanelWindow('))).replace('NativeIslandScenes owner', 'TestNativeIslandPanelGates owner')
files['ls/augment/com/hook/TestNativeIslandPanelGates.java']=harness
with tempfile.TemporaryDirectory(prefix='duo-island-panel-gates-') as folder:
    paths=[]
    for name,text in files.items():
        p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8');paths.append(str(p))
    paths += [str(ROOT/'android/app/src/main/java/ls/augment/com/NativeIslandSceneOptions.java'),
              str(ROOT/'android/app/src/main/java/ls/augment/com/hook/NativeIslandScenePolicy.java'),
              str(ROOT/'android/app/src/main/java/ls/augment/com/hook/NativeIslandSceneContract.java')]
    java=Path(os.environ['JAVA_HOME'])/'bin';suffix='.exe' if os.name=='nt' else ''
    subprocess.run([str(java/('javac'+suffix)),'-encoding','UTF-8','-d',folder,*paths],check=True)
    subprocess.run([str(java/('java'+suffix)),'-cp',folder,'ls.augment.com.hook.TestNativeIslandPanelGates'],check=True)
