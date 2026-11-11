"""Execute production capsule hooks against queued OEM renderers and concurrent scene fixtures."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
files = {
    'android/os/SystemClock.java':'package android.os;public class SystemClock {public static long elapsedRealtime(){return 10;}}',
    'android/widget/TextView.java':'package android.widget;public class TextView extends android.view.View {public String text="old";public void setText(CharSequence value){text=value.toString();}}',
    'android/view/View.java': '''package android.view;public class View {
 public static final int VISIBLE=0,GONE=8;public int visibility=8;public boolean attached=true,shown=true;
 public void setVisibility(int v){visibility=v;}public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown&&attached;}}''',
    'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;import java.lang.reflect.*;
 final class SystemUiAdapter {static Object call(Object o,String n,Object...args)throws Exception{
 for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(n)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(o,args);}throw new NoSuchMethodException(n);}}''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
 public class AugmentModule {
 public interface Callback {Object run(Chain c)throws Throwable;}public interface Original {Object run(Object[] args)throws Throwable;}
 public static class Chain {Object owner;Object[] args;Original original;Chain(Object o,Object[] a,Original r){owner=o;args=a;original=r;}
 public Object getThisObject(){return owner;}public Object getArg(int n){return args[n];}public List<Object> getArgs(){return Arrays.asList(args);}
 public Object proceed()throws Throwable{return original.run(args);}public Object proceed(Object...a)throws Throwable{return original.run(a);}}
 public static class Hook {Method method;Callback cb;Hook(Method m){method=m;}public Hook intercept(Callback c){cb=c;return this;}}
 public static Map<Method,Callback> hooks=new HashMap<>();public List<String> logs=new ArrayList<>();
 public Hook prepareFeatureHook(Method m,String n,boolean safe){return new Hook(m);}public void registerFeatureHook(Hook h){hooks.put(h.method,h.cb);}
 public void logFeatureInfo(String s){logs.add(s);}public void logFeatureError(String s,Throwable e){throw new AssertionError(s,e);}
 public static Object run(Object o,String name,Class<?>[] types,Object[] args,Original body){try{
 Method m=null;for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{m=c.getDeclaredMethod(name,types);break;}catch(NoSuchMethodException ignored){}
 Callback cb=hooks.get(m);return cb==null?body.run(args):cb.run(new Chain(o,args,body));
 }catch(RuntimeException|Error e){throw e;}catch(Throwable e){throw new RuntimeException(e);}}
 }''',
    'ls/augment/com/hook/TestTakeover.java': '''package ls.augment.com.hook;
 import android.view.View;import java.util.*;import java.lang.reflect.*;
 public class TestTakeover {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static String current="";static boolean duo,master,child,shown=true;
 static final List<Runnable> queue=new ArrayList<>();static void drain(){int n=0;while(!queue.isEmpty()){if(++n>100)throw new AssertionError("callback loop");queue.remove(0).run();}}
 public static class Layout extends View {
  public int mCallingVisible=8,mRecordingVisible=8,mRecordPausedVisible=0,mMeetingVisible=8,mAiVisible=8,mCastVisible=8,mHotspotVisible=8,mAntiFraudVisible=8;
  public boolean mUnknownVisible;public int content=-1,launcherCalls;public boolean throwRender,throwTime;
  public android.widget.TextView mDisplayText=new android.widget.TextView();
  public final String[] time=new String[7];
  Object run(String n,AugmentModule.Original body){return AugmentModule.run(this,n,new Class<?>[]{},new Object[]{},body);}
  Object run(String n,int v,AugmentModule.Original body){return AugmentModule.run(this,n,new Class<?>[]{int.class},new Object[]{v},body);}
  int raw(int i){return switch(i){case 0->mCallingVisible;case 1->mRecordingVisible;case 2->mCastVisible;case 3->mMeetingVisible;case 4->mAntiFraudVisible;case 5->mAiVisible;case 6->mHotspotVisible;default->8;};}
  void set(int i,int v){switch(i){case 0:mCallingVisible=v;break;case 1:mRecordingVisible=v;break;case 3:mMeetingVisible=v;break;case 5:mAiVisible=v;break;}}
  public int getCurrentVisibility(int i){return (Integer)run("getCurrentVisibility",i,a->raw((Integer)a[0]));}
  public boolean isViewVisible(int i){return (Boolean)run("isViewVisible",i,a->raw((Integer)a[0])==0);}
  @Override public void setVisibility(int i){run("setVisibility",i,a->{super.setVisibility((Integer)a[0]);return null;});}
  public void showView(int i){run("showView",i,a->{content=(Integer)a[0];return null;});}
  public String getTimeCount(int i){return (String)run("getTimeCount",i,a->{if(throwTime)throw new IllegalStateException("time unavailable");return time[(Integer)a[0]];});}
  public boolean isAnyViewShouldVisible(){return (Boolean)run("isAnyViewShouldVisible",a->getTimeCount(0)!=null||getTimeCount(1)!=null||getTimeCount(3)!=null);}
  public boolean hasHigherPriorityViewVisible(int i){return (Boolean)run("hasHigherPriorityViewVisible",i,a->mCallingVisible==0);}
  public void updateVisibility(){run("updateVisibility",a->null);}
  public void handleVisibilityChanged(){run("handleVisibilityChanged",a->{queue.add(this::lambda$handleVisibilityChanged$0);return null;});}
  // Direct fields emulate an AOT-inlined renderer: its posted callback must be masked too.
  public void lambda$handleVisibilityChanged$0(){run("lambda$handleVisibilityChanged$0",a->{
   if(throwRender)throw new IllegalStateException("OEM render failed");
   int chosen=-1;for(int i:new int[]{4,0,6,3,5,1,2})if(raw(i)==0){chosen=i;break;}
   if(chosen>=0)showView(chosen);setVisibility(chosen>=0||mUnknownVisible?0:8);return null;});}
  public void updateViewVisibilityFromLauncher(int i){run("updateViewVisibilityFromLauncher",i,a->{launcherCalls++;set((Integer)a[0],0);showView((Integer)a[0]);setVisibility(0);return null;});}
  public void lambda$updateDisplayText$3(String stale){AugmentModule.run(this,"lambda$updateDisplayText$3",new Class<?>[]{String.class},new Object[]{stale},a->{mDisplayText.setText((String)a[0]);return null;});}
 }
 public static class Child extends Layout {}
 public static class Missing extends View {public int mRecordingVisible=8;}
 public static class Wrong extends Layout {public String mRecordingVisible="wrong type";}
 static void reset(){current="";duo=master=child=true;shown=true;queue.clear();AugmentModule.hooks.clear();}
 static NativeIslandCapsules install(Class<?> type)throws Exception{
  NativeIslandCapsules c=new NativeIslandCapsules(s->NativeIslandScenePolicy.takeover(duo,master,child,shown)&&current.equals(s));
  check(c.install(new AugmentModule(),type)>0&&c.ready(),"valid inherited capsule contracts installed");return c;}
 public static void main(String[] args)throws Exception{
  for(Class<?> type:new Class<?>[]{Layout.class,Child.class})for(int scene:new int[]{0,1,3,5}){
   reset();NativeIslandCapsules bridge=install(type);Layout l=(Layout)type.getConstructor().newInstance();String id=switch(scene){case 0->"call";case 1->"record";case 3->"meeting";default->"ai";};
   l.set(scene,0);l.time[scene]="00:32";l.mRecordPausedVisible=2;current=id;
   for(int mask=0;mask<16;mask++){
    duo=(mask&1)!=0;master=(mask&2)!=0;child=(mask&4)!=0;shown=(mask&8)!=0;
    l.handleVisibilityChanged();drain();check(l.visibility==(mask==15?8:0),"only active and visible selected scene is suppressed");
    check(l.raw(scene)==0&&l.getCurrentVisibility(scene)==0&&l.mRecordPausedVisible==2,"rendering preserves producer and paused state");
   }
   duo=master=child=shown=true;l.updateViewVisibilityFromLauncher(scene);drain();check(l.launcherCalls==0&&l.visibility==8,"launcher cannot force taken-over capsule back");
   for(int other:new int[]{2,4,6}){
    if(other==2)l.mCastVisible=0;if(other==4)l.mAntiFraudVisible=0;if(other==6)l.mHotspotVisible=0;
    l.handleVisibilityChanged();drain();check(l.visibility==0&&l.content==other,"unselected concurrent scene retains content/priority");
    l.mCastVisible=l.mAntiFraudVisible=l.mHotspotVisible=8;
   }
   l.mUnknownVisible=true;l.setVisibility(0);check(l.visibility==0,"unknown boolean scene not hidden");l.mUnknownVisible=false;
   if(scene!=5){check(!l.isAnyViewShouldVisible(),"time-based coexistence check excludes selected scene");check(l.getTimeCount(scene)!=null,"source time reads remain intact");}
   l.throwRender=true;boolean threw=false;try{l.lambda$handleVisibilityChanged$0();}catch(IllegalStateException e){threw=true;}
   check(threw&&l.raw(scene)==0&&l.mRecordPausedVisible==2,"exception restores temporary render mask");l.throwRender=false;
   l.handleVisibilityChanged();child=false;drain();check(l.visibility==0,"queued callback uses newest OFF state");
   child=true;l.handleVisibilityChanged();drain();current="another_scene";bridge.refresh(s->{throw new AssertionError(s);});drain();
   check(l.visibility==0&&l.content==scene,"priority switch/hidden island restores former capsule");
   current=id;child=false;bridge.refresh(s->{throw new AssertionError(s);});drain();
   l.updateViewVisibilityFromLauncher(scene);check(l.visibility==0&&l.launcherCalls==1,"OFF restores original launcher behavior");
   if(scene==1){l.mDisplayText.setText("00:00:01");l.time[1]="00:00:09";l.setVisibility(0);
    check(l.mDisplayText.text.equals("00:00:09"),"recording text refreshed synchronously before visible frame");
    l.lambda$updateDisplayText$3("00:00:01");check(l.mDisplayText.text.equals("00:00:09"),"old queued label cannot undo current time");
    l.throwTime=true;l.setVisibility(0);l.lambda$updateDisplayText$3("native fallback");
    check(l.visibility==0&&l.mDisplayText.text.equals("native fallback"),"unavailable optional time refresh preserves native renderer");l.throwTime=false;}
   // Stop while owned: producer mutation must survive and must not revive a completed scene.
   child=true;l.set(scene,8);l.time[scene]=null;current="";bridge.refresh(s->{throw new AssertionError(s);});drain();check(l.visibility==8,"ended scene not resurrected on release");
  }
  reset();NativeIslandCapsules missing=new NativeIslandCapsules(s->true);check(missing.install(new AugmentModule(),Missing.class)==0&&!missing.ready(),"missing OEM overrides retain native behavior");
  check(!missing.supportsScene("call")&&missing.supportsScene("torch"),"missing capsule contract refuses takeover only for capsule scenes");
  reset();NativeIslandCapsules wrong=install(Wrong.class);Wrong w=new Wrong();w.set(1,0);current="record";w.setVisibility(0);check(w.visibility==0,"wrong field type disables only affected scene");
  check(!wrong.supportsScene("record")&&wrong.supportsScene("call"),"field capability gates affected source transport only");
  System.out.println("PASS native scene takeover: "+checks+" checks; four scenes, toggles, inheritance, queued render, launcher, priority, exceptions and release");
 }
}''',
}
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/NativeIslandScenes.java').read_text('utf-8')
def member(marker, text=source):
    start = text.index(marker)
    end = text.index('{', start) + 1
    depth = 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end].replace('NativeIslandScenes owner', 'SceneOwner owner')

files.update({
 'ls/augment/com/SystemUiOptions.java': 'package ls.augment.com;public class SystemUiOptions{public static String ISLAND="duo",PREFIX="ls_augment_rm_";}',
 'ls/augment/com/EnhancementOption.java': 'package ls.augment.com;public class EnhancementOption{public static EnhancementOption toggle(String...args){return new EnhancementOption();}}',
 'ls/augment/com/NativeFeatureGroups.java': 'package ls.augment.com;public class NativeFeatureGroups{public static class Feature{public Feature(Object...args){}}}',
 'ls/augment/com/NativeIslandSceneOptions.java': (ROOT / 'android/app/src/main/java/ls/augment/com/NativeIslandSceneOptions.java').read_text('utf-8'),
 'ls/augment/com/hook/SceneOwner.java': '''package ls.augment.com.hook;
import android.view.View;import android.os.SystemClock;import java.util.*;import java.lang.reflect.*;import ls.augment.com.*;
class SceneOwner {
 static final String OEM="com.zte.feature.dynamicisland.";static SceneOwner selected;static boolean capsuleReady=true;
 boolean nativeBaseline,closed,originalFeature;static final String P=SystemUiOptions.PREFIX+"island_";View root=new View();Map<String,Boolean> context=new HashMap<>();
 Set<String> supportedScenes=new HashSet<>(),enhancedScenes=new HashSet<>();Method visibleState;
 Manager manager=new Manager();Permanent permanent=new Permanent();NativeIslandCards cardsBridge=new NativeIslandCards();
 Object record;boolean recorderRenderFailed;NativeIslandRecorderState recorderModel=new NativeIslandRecorderState();boolean recorderForeground(){return false;}
 Set<String> automaticCapsules=Collections.emptySet();static Set<String> fullscreenCapsules=Collections.emptySet();
 String visibleCapsule="";
 static boolean recorderTakeover(){return false;}void report(String s){}static String reason(Exception e){return e.getClass().getSimpleName();}
 static class NativeIslandCards {Map<Object,String> scenes=new IdentityHashMap<>();String scene(Object i){return scenes.get(i);}}
 static class Manager {public Disposable mDisposableIslandManager=new Disposable();}
 static class Disposable {public View mChargingIsland,mLowPowerIsland,mBluetoothIsland,mHeadsetIsland;}
 static class Permanent {public boolean mIsDynamicIslandEnable=true,mInteractive=true,mAODVisibility,mSuperPowerSave,mOnKeyguard,landscape;
 public boolean isOrientationLandscape(){return landscape;}
 public View mRecordIsland;public Object current,mTempIsland;public Object getPermanentIsland(){return current;}}
 static class FeatureSettings {static boolean enabled(Map<String,Boolean> c,String k){return c.getOrDefault(k,false);}static int integer(Map<String,Boolean> c,String k,int d,int min,int max){return c.getOrDefault(k,d!=0)?1:0;}}
 static Object call(Object o,String n,Object...args)throws Exception{return SystemUiAdapter.call(o,n,args);}
 static Object field(Object o,String n){if(o!=null)for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(Exception ignored){}return null;}
 public static boolean visible(int n){return n==1;}
 // METHODS
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 public static void main(String[] args)throws Exception{
  SceneOwner o=new SceneOwner();selected=o;o.visibleState=SceneOwner.class.getDeclaredMethod("visible",int.class);
  o.context.put(SystemUiOptions.PREFIX+"island_music",true);o.context.put(SystemUiOptions.PREFIX+"island_charging",true);
  for(int i=0;i<NativeIslandSceneOptions.TYPES.length;i++){
   String id=NativeIslandSceneOptions.IDS[i];View scene=(View)Class.forName(OEM+"islands."+NativeIslandSceneOptions.TYPES[i]).getConstructor().newInstance();
   o.supportedScenes.add(id);o.enhancedScenes.add(id);o.permanent.current=scene;
   for(int mask=0;mask<8;mask++){
    o.context.put(SystemUiOptions.ISLAND,(mask&1)!=0);o.context.put(NativeIslandSceneOptions.ENABLED,(mask&2)!=0);o.context.put(NativeIslandSceneOptions.key(id),(mask&4)!=0);
    o.nativeBaseline=false;check(blocked(scene)==((mask&1)==0),"existing OEM scene follows master independently of completion and child");
    if(id.equals("media")||id.equals("charging"))check(o.option(id.equals("media")?"music":"charging")== ((mask&1)!=0),"fallback activity follows master without completion gates");
    check(o.capsuleScene().equals((mask&1)!=0?id:""),"same native ownership gate used for duplicate suppression");
    o.nativeBaseline=true;check(!blocked(scene),"unselected pre-existing OEM scene must survive");
   }
   o.nativeBaseline=false;scene.shown=false;check(o.capsuleScene().isEmpty(),"hidden selected island is not a replacement");scene.shown=true;
   o.root.shown=false;check(o.capsuleScene().isEmpty(),"hidden root restores capsule");o.root.shown=true;
   o.permanent.current=null;o.permanent.mTempIsland=scene;check(o.capsuleScene().isEmpty(),"pending island alone cannot hide capsule");o.permanent.current=scene;
   o.supportedScenes.remove(id);check(blocked(scene)&&o.capsuleScene().isEmpty(),"missing completion capability keeps original capsule and cannot add a dormant island");
  }
  o.nativeBaseline=false;Disposable d=o.manager.mDisposableIslandManager;
  View[] views={new com.zte.feature.dynamicisland.DynamicDisposableIsland(),new com.zte.feature.dynamicisland.DynamicDisposableIsland(),new com.zte.feature.dynamicisland.DynamicDisposableIsland(),new com.zte.feature.dynamicisland.DynamicDisposableIsland()};
  d.mChargingIsland=views[0];d.mLowPowerIsland=views[1];d.mBluetoothIsland=views[2];d.mHeadsetIsland=views[3];
  String[] ids={"charging","low_power","bluetooth","headset"};for(int i=0;i<4;i++){
   o.supportedScenes.add(ids[i]);o.context.put(NativeIslandSceneOptions.key(ids[i]),false);check(ids[i].equals(o.sceneId(views[i]))&&!blocked(views[i]),"native shared disposable follows master with completion child OFF");
   o.context.put(NativeIslandSceneOptions.key(ids[i]),true);check(!blocked(views[i]),"selected generic disposable permitted");}
  check(!blocked(new com.zte.feature.dynamicisland.DynamicDisposableIsland()),"unknown generic instance remains native");
  check(!blocked(new View()),"unknown permanent type remains native");
  View card=new View();o.cardsBridge.scenes.put(card,"call");o.permanent.current=card;o.context.put(NativeIslandSceneOptions.key("call"),true);
  check(o.capsuleScene().equals("call"),"verified app card participates in same scene arbitration");
  o.context.put(NativeIslandSceneOptions.key("call"),false);check(o.capsuleScene().isEmpty(),"app card releases duplicate suppression immediately on OFF");
  o.context.put(NativeIslandSceneOptions.key("call"),true);o.closed=true;check(o.capsuleScene().isEmpty(),"closed owner cannot suppress");
  o.permanent.mRecordIsland=new com.zte.feature.dynamicisland.islands.RecorderIsland();
  check(o.dormantNativeScene(o.permanent,o.permanent.mRecordIsland,true),"fallback cannot wake second recorder renderer");
  check(!o.dormantNativeScene(o.permanent,new com.zte.feature.dynamicisland.islands.RecorderIsland(),true),"Duo separately inflated activity is retained");
  check(o.dormantNativeScene(d,views[0],false),"fallback cannot wake second disposable renderer");
  o.originalFeature=true;check(!o.dormantNativeScene(o.permanent,o.permanent.mRecordIsland,true),"fallback preserves OEM-enabled engine");
  o.closed=false;o.context.put(SystemUiOptions.ISLAND,true);o.context.put(NativeIslandSceneOptions.ENABLED,false);
  o.permanent.current=null;o.supportedScenes.addAll(Arrays.asList("call","meeting","ai"));o.enhancedScenes.addAll(o.supportedScenes);
  o.updateAutomaticCapsules();for(String id:new String[]{"call","meeting","ai"})check(capsuleOwned(id),"native capsule yields through first frame and transition with completion OFF");
  check(!capsuleOwned("cast"),"unmapped capsule remains native");
  o.context.put(SystemUiOptions.ISLAND,false);check(!capsuleOwned("call"),"master OFF immediately releases ownership before queued refresh");
  o.context.put(SystemUiOptions.ISLAND,true);o.permanent.landscape=true;o.updateAutomaticCapsules();check(!capsuleOwned("call"),"unavailable island orientation preserves native capsule");
  o.permanent.landscape=false;capsuleReady=false;o.updateAutomaticCapsules();check(!capsuleOwned("call"),"missing native capsule contract keeps original path");capsuleReady=true;
  System.out.println("PASS production scene owner: "+checks+" checks; all native scenes, original/dormant engines, shared classes, actual visibility and card ownership");
 }
}'''
})
owner_methods = [member(m) for m in (
    'static boolean blocked(', 'private String sceneId(', 'private boolean requested(', 'private boolean usable(',
    'private boolean enhancing(', 'private String capsuleScene(', 'private void updateAutomaticCapsules(', 'static boolean capsuleOwned(')]
owner_methods.append(member('private boolean dormantNativeScene(', (ROOT / 'android/app/src/main/java/ls/augment/com/hook/NativeIslandHost.java').read_text('utf-8')))
owner_methods.append(member('boolean option(', (ROOT / 'android/app/src/main/java/ls/augment/com/hook/DynamicIslandHook.java').read_text('utf-8')))
files['ls/augment/com/hook/SceneOwner.java'] = files['ls/augment/com/hook/SceneOwner.java'].replace('// METHODS', '\n'.join(owner_methods))
for name in ('RecorderIsland', 'FlashlightIsland', 'CallIsland', 'MediaIsland', 'CountDownIsland', 'FaceDetectIsland',
             'MeetingIsland', 'AIIsland', 'AIMemIsland', 'ChargingIsland', 'LowPowerIsland', 'BluetoothIsland', 'HeadsetIsland'):
    files[f'com/zte/feature/dynamicisland/islands/{name}.java'] = f'''package com.zte.feature.dynamicisland.islands;
public class {name} extends android.view.View {{public int mCurState=1;public boolean mKeyguardIsland;}}'''
files['com/zte/feature/dynamicisland/DynamicDisposableIsland.java'] = '''package com.zte.feature.dynamicisland;public class DynamicDisposableIsland extends android.view.View {}'''
with tempfile.TemporaryDirectory(prefix='duo-scene-takeover-') as directory:
    paths = []
    for name, source in files.items():
        path = Path(directory) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        paths.append(str(path))
    paths += [str(ROOT / f'android/app/src/main/java/ls/augment/com/hook/{name}.java')
              for name in ('NativeIslandCapsules', 'NativeIslandScenePolicy', 'NativeIslandSceneContract', 'NativeIslandRecorderState')]
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', directory, *paths], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', directory, 'ls.augment.com.hook.TestTakeover'], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', directory, 'ls.augment.com.hook.SceneOwner'], check=True)
