"""Native transaction/lifecycle contract, distinct from on-device compositing proof."""
from pathlib import Path
import runpy, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
JAVA=ROOT/'android/app/src/main/java/ls/augment/com'
base=runpy.run_path(str(ROOT/'tools/test-launcher-widget-dock-runtime.py'))['COMMON']
sources={
'android/window/TransitionInfo.java':'package android.window;public class TransitionInfo {}',
'android/util/ArrayMap.java':'package android.util;public class ArrayMap<K,V> extends java.util.HashMap<K,V> {}',
'com/android/launcher3/util/RunnableList.java':'''package com.android.launcher3.util;public class RunnableList {java.util.List<Runnable> callbacks=new java.util.ArrayList<>();public void add(Runnable r){callbacks.add(r);}public void finish(){for(Runnable r:callbacks)r.run();}}''',
'com/android/quickstep/views/TaskView.java':'''package com.android.quickstep.views;public class TaskView extends android.view.View {public boolean fail;public int[] ids={7};public TaskView(){super(null);}public int[] getTaskIds(){return ids;}public com.android.launcher3.util.RunnableList launchWithAnimation(){if(fail)throw new IllegalStateException("native launch failed");return new com.android.launcher3.util.RunnableList();}}''',
'com/android/systemui/animation/RemoteAnimationTargetCompat.java':'''package com.android.systemui.animation;public class RemoteAnimationTargetCompat {public static android.view.RemoteAnimationTarget[] apps;public static android.view.RemoteAnimationTarget[] wrapApps(android.window.TransitionInfo info,android.view.SurfaceControl.Transaction tx,android.util.ArrayMap map){return apps;}}''',
'android/animation/Animator.java':'''package android.animation;public class Animator {public java.util.List<AnimatorListenerAdapter> listeners=new java.util.ArrayList<>();public void addListener(AnimatorListenerAdapter a){listeners.add(a);}public void removeListener(AnimatorListenerAdapter a){listeners.remove(a);}public void end(){for(var l:new java.util.ArrayList<>(listeners))l.onAnimationEnd(this);}}''',
'android/animation/AnimatorSet.java':'package android.animation;public class AnimatorSet extends Animator {}',
'android/animation/AnimatorListenerAdapter.java':'package android.animation;public class AnimatorListenerAdapter {public void onAnimationEnd(Animator a){}}',
'com/android/quickstep/views/RecentsView.java':'package com.android.quickstep.views;public class RecentsView extends android.view.View {public RecentsView(){super(null);}}',
'com/android/quickstep/TaskViewUtils.java':'''package com.android.quickstep;public class TaskViewUtils {public static boolean fail;public static void composeRecentsLaunchAnimator(android.animation.AnimatorSet animator,android.view.View view,android.view.RemoteAnimationTarget[] apps,android.view.RemoteAnimationTarget[] wallpapers,android.view.RemoteAnimationTarget[] others,boolean opening,Object state,com.android.quickstep.views.RecentsView recents,Object depth){if(!android.view.SurfaceControl.last.shown||!android.view.SurfaceControl.last.painted)throw new AssertionError("initial native show preceded opaque protection");if(fail)throw new IllegalStateException("native composer failed");}}''',
'ls/augment/com/RecentsPrivacyOptions.java':'package ls.augment.com;public class RecentsPrivacyOptions {public static final String ENABLED="enabled",APPS="apps";}',
'ls/augment/com/hook/AugmentModule.java':base['ls/augment/com/hook/AugmentModule.java'].replace('public static AugmentModule active;','void deoptimize(Method m){} public static AugmentModule active;'),
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import ls.augment.com.*;import android.content.Context;class FeatureSettings {static ConfigSnapshot current=new ConfigSnapshot();static Runnable listener;static ConfigSnapshot snapshot(Context c){return current;}static boolean addSnapshotListener(Context c,Runnable r){listener=r;return true;}static void diagnostic(Context c,String k,String v){}}''',
'ls/augment/com/ConfigSnapshot.java':'''package ls.augment.com;public class ConfigSnapshot {public String enabled="1",apps="selected";public String get(String k){return k.equals(RecentsPrivacyOptions.ENABLED)?enabled:apps;}}''',
'ls/augment/com/AppPackageSet.java':'''package ls.augment.com;public class AppPackageSet {public static java.util.Set<String> parse(String x){return new java.util.HashSet<>(java.util.Arrays.asList(x.split(",")));}}''',
'android/content/Context.java':'package android.content;public class Context {public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}}',
'android/app/Application.java':'package android.app;public class Application extends android.content.Context {}',
'android/app/ActivityThread.java':'package android.app;public class ActivityThread {public static Application currentApplication(){return new Application();}}',
'android/app/ActivityManager.java':'package android.app;public class ActivityManager {public static class RunningTaskInfo {public int taskId;public android.content.ComponentName baseActivity,topActivity;}}',
'android/content/ComponentName.java':'package android.content;public class ComponentName {String pkg;public ComponentName(String p){pkg=p;}public String getPackageName(){return pkg;}}',
'android/content/pm/PackageManager.java':'package android.content.pm;public class PackageManager {public static class NameNotFoundException extends Exception {}public android.graphics.drawable.Drawable getApplicationIcon(String p)throws NameNotFoundException{return new android.graphics.drawable.Drawable();}}',
'android/graphics/drawable/Drawable.java':'package android.graphics.drawable;public class Drawable {public Drawable mutate(){return this;}public void setBounds(int x,int y,int r,int b){}public void draw(android.graphics.Canvas c){c.icon=true;}}',
'android/graphics/Canvas.java':'package android.graphics;public class Canvas {public boolean opaque,icon;public Canvas(){}public Canvas(Bitmap b){b.canvas=this;}}',
'android/graphics/Bitmap.java':'''package android.graphics;public class Bitmap {public static boolean fail;Canvas canvas;public enum Config {ARGB_8888,HARDWARE}public static Bitmap createBitmap(int w,int h,Config c){if(fail)throw new IllegalStateException("buffer allocation");return new Bitmap();}public Bitmap copy(Config c,boolean mutable){Bitmap b=new Bitmap();b.canvas=canvas;return b;}public android.hardware.HardwareBuffer getHardwareBuffer(){return new android.hardware.HardwareBuffer(canvas.opaque&&canvas.icon);}public void recycle(){}}''',
'android/hardware/HardwareBuffer.java':'''package android.hardware;public class HardwareBuffer implements AutoCloseable {public final boolean painted;public HardwareBuffer(boolean b){painted=b;}public void close(){}}''',
'android/graphics/Rect.java':'package android.graphics;public class Rect {public int width(){return 1080;}public int height(){return 2400;}}',
'android/view/View.java':'package android.view;public class View {public View(android.content.Context c){}}',
'ls/augment/com/hook/RecentsPrivacyBackdrop.java':'package ls.augment.com.hook;class RecentsPrivacyBackdrop {RecentsPrivacyBackdrop(AugmentModule m){}void draw(android.view.View v,Object task,Object b,Object mat,android.graphics.Canvas c,float l,float t,float r,float bottom,float radius){c.opaque=true;}}',
'android/view/Surface.java':'''package android.view;import android.graphics.*;public class Surface {SurfaceControl c;public Surface(SurfaceControl v){c=v;}public Canvas lockCanvas(Rect r){return new Canvas();}public void unlockCanvasAndPost(Canvas canvas){/* BufferQueue contents deliberately latch later than native transform */}public void release(){}}''',
'android/view/SurfaceControl.java':'''package android.view;import java.util.*;public class SurfaceControl {public boolean valid=true,painted,shown,removed,released;public float alpha=1;public SurfaceControl parent;public static SurfaceControl last;public boolean isValid(){return valid;}public void release(){released=true;}
 public static class Builder {SurfaceControl c=new SurfaceControl();public Builder setName(String s){return this;}public Builder setParent(SurfaceControl p){c.parent=p;return this;}public Builder setBufferSize(int x,int y){return this;}public Builder setHidden(boolean b){if(!b)throw new AssertionError("must be hidden before painted");return this;}public SurfaceControl build(){last=c;return c;}}
 public static class Transaction {public final List<SurfaceControl> pending=new ArrayList<>();public Map<SurfaceControl,Boolean> buffers=new IdentityHashMap<>();public int mutations;public Map<SurfaceControl,Float> alphas=new IdentityHashMap<>();public Transaction setAlpha(SurfaceControl s,float a){alphas.put(s,a);return this;}public Transaction setBuffer(SurfaceControl s,android.hardware.HardwareBuffer b){buffers.put(s,b.painted);return this;}public Transaction setLayer(SurfaceControl s,int i){mutations++;return this;}public Transaction setMatrix(SurfaceControl s,float a,float b,float c,float d){mutations++;return this;}public Transaction setPosition(SurfaceControl s,float x,float y){mutations++;return this;}public Transaction show(SurfaceControl s){pending.add(s);return this;}public Transaction remove(SurfaceControl s){s.removed=true;return this;}public void apply(){for(var e:alphas.entrySet())e.getKey().alpha=e.getValue();for(var e:buffers.entrySet())e.getKey().painted=e.getValue();for(SurfaceControl s:pending){if(!s.painted)throw new AssertionError("native transform exposed an unbuffered cover");s.shown=true;}}public void close(){}}
}''',
'android/view/RemoteAnimationTarget.java':'''package android.view;public class RemoteAnimationTarget {public SurfaceControl leash=new SurfaceControl();public int mode=1,activityType=1,taskId=7;public android.graphics.Rect screenSpaceBounds=new android.graphics.Rect();public android.app.ActivityManager.RunningTaskInfo taskInfo=new android.app.ActivityManager.RunningTaskInfo();public RemoteAnimationTarget(String pkg){taskInfo.taskId=taskId;taskInfo.baseActivity=new android.content.ComponentName(pkg);}}''',
'com/android/quickstep/RemoteAnimationTargets.java':'''package com.android.quickstep;public class RemoteAnimationTargets {public android.view.RemoteAnimationTarget[] unfilteredApps;public boolean mReleased,canRelease=true;public RemoteAnimationTargets(android.view.RemoteAnimationTarget... x){unfilteredApps=x;}public void release(){if(canRelease)mReleased=true;}}''',
'com/android/quickstep/util/SurfaceTransaction.java':'''package com.android.quickstep.util;public class SurfaceTransaction {final android.view.SurfaceControl.Transaction tx=new android.view.SurfaceControl.Transaction();public android.view.SurfaceControl.Transaction getTransaction(){return tx;}}''',
'com/android/quickstep/util/TransformParams.java':'''package com.android.quickstep.util;public class TransformParams {public interface BuilderProxy {}public com.android.quickstep.RemoteAnimationTargets targets;public TransformParams setTargetSet(com.android.quickstep.RemoteAnimationTargets t){targets=t;return this;}public com.android.quickstep.RemoteAnimationTargets getTargetSet(){return targets;}public SurfaceTransaction createSurfaceParams(BuilderProxy b){return new SurfaceTransaction();}}''',
'ls/augment/com/hook/TestTransition.java':'''package ls.augment.com.hook;import android.view.*;import com.android.quickstep.*;import com.android.quickstep.util.*;import java.lang.reflect.*;
 public class TestTransition {static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}public static void main(String[] args)throws Throwable {
 AugmentModule m=new AugmentModule();RecentsPrivacyTransition.install(m,TestTransition.class.getClassLoader());check(m.errors.isEmpty()&&m.hooks.size()==7,"complete binding, entry and first display capabilities install");
 Method create=TransformParams.class.getDeclaredMethod("createSurfaceParams",TransformParams.BuilderProxy.class),release=RemoteAnimationTargets.class.getDeclaredMethod("release");
 TransformParams p=new TransformParams();RemoteAnimationTarget app=new RemoteAnimationTarget("selected"),other=new RemoteAnimationTarget("other");p.targets=new RemoteAnimationTargets(app,other);
 SurfaceTransaction tx=(SurfaceTransaction)m.call(p,create,(Object)null);SurfaceControl cover=SurfaceControl.last;
 check(cover.parent==app.leash&&!cover.painted&&!cover.shown&&Boolean.TRUE.equals(tx.getTransaction().buffers.get(cover)),"opaque pixels staged in actual transform transaction, no independent queue latch");check(tx.getTransaction().pending.size()==1,"only selected task covered in split set");
 tx.getTransaction().apply();check(cover.shown&&!app.leash.removed&&!app.leash.released,"same native transaction reveals cover; real app unmodified");
 m.call(p,create,(Object)null);check(SurfaceControl.last==cover,"reuse per leash across frames");
 p.targets.canRelease=false;m.call(p.targets,release);check(!cover.removed,"deferred native release retains mask");p.targets.canRelease=true;m.call(p.targets,release);check(cover.removed&&cover.released,"finish/cancel releases owned layer");
 p.targets=new RemoteAnimationTargets(app);m.call(p,create,(Object)null);cover=SurfaceControl.last;FeatureSettings.current.enabled="0";FeatureSettings.listener.run();check(cover.removed,"disable removes existing protection without waiting for frame");
 tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"disabled native path");
 FeatureSettings.current.enabled="1";app.mode=0;tx=(SurfaceTransaction)m.call(p,create,(Object)null);cover=SurfaceControl.last;
 check(tx.getTransaction().pending.size()==1,"selected card opening is protected while Quickstep transforms the live app");tx.getTransaction().apply();
 p.targets.canRelease=false;m.call(p.targets,release);check(!cover.removed,"opening cover survives native deferred release");p.targets.canRelease=true;m.call(p.targets,release);check(cover.removed,"fully opened app restored after native release");
 p.targets=new RemoteAnimationTargets(app);app.mode=2;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"unknown animation mode preserves native behavior");
 app.mode=1;app.activityType=2;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"home surface excluded");
 app.activityType=1;app.taskInfo.taskId=99;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"task identity mismatch native preserved");
 app.taskInfo.taskId=7;app.leash.valid=false;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"invalid leash ignored");
 app.leash.valid=true;android.graphics.Bitmap.fail=true;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty()&&SurfaceControl.last.removed,"failed preparation cleans its hidden child");
 android.graphics.Bitmap.fail=false;m.call(p,create,(Object)null);cover=SurfaceControl.last;FeatureSettings.current.apps="other";FeatureSettings.listener.run();check(cover.removed,"selection changes restore actual app");
 FeatureSettings.current.apps="selected";app.mode=0;
 Method launch=java.util.Arrays.stream(TaskViewUtils.class.getDeclaredMethods()).filter(v->v.getName().equals("composeRecentsLaunchAnimator")).findFirst().orElseThrow();
 Object[] launchArgs=new Object[launch.getParameterCount()];android.animation.AnimatorSet animator=new android.animation.AnimatorSet();
 launchArgs[0]=animator;launchArgs[1]=new android.view.View(null);launchArgs[2]=new RemoteAnimationTarget[]{app};launchArgs[3]=new RemoteAnimationTarget[0];launchArgs[4]=new RemoteAnimationTarget[0];launchArgs[5]=false;if(launchArgs.length==11)launchArgs[10]=0;
 m.call(null,launch,launchArgs);cover=SurfaceControl.last;check(cover.shown&&cover.painted,"card is protected before native launch composition can show its live layer");
 animator.end();check(cover.removed,"unused preparation removed when no transformed frame follows");
 animator=new android.animation.AnimatorSet();launchArgs[0]=animator;m.call(null,launch,launchArgs);cover=SurfaceControl.last;
 p.targets=new RemoteAnimationTargets(app);m.call(p,create,(Object)null);animator.end();check(!cover.removed,"animator end cannot bypass pending native release checks");
 p.targets.canRelease=false;m.call(p.targets,release);check(!cover.removed,"prewarmed transformed cover survives a deferred native release");p.targets.canRelease=true;m.call(p.targets,release);check(cover.removed,"prewarmed cover released at actual native completion");
 TaskViewUtils.fail=true;launchArgs[0]=new android.animation.AnimatorSet();try{m.call(null,launch,launchArgs);throw new AssertionError("native failure swallowed");}catch(java.lang.reflect.InvocationTargetException|IllegalStateException expected){}
 check(SurfaceControl.last.removed,"composer failure removes unused preparation");
 app.mode=1;p.targets=new RemoteAnimationTargets(app);
 m.call(p,TransformParams.class.getDeclaredMethod("setTargetSet",RemoteAnimationTargets.class),p.targets);cover=SurfaceControl.last;
 check(cover.painted&&cover.shown,"closing target is already opaque before any simulator or OEM corner frame");
 p.targets.canRelease=false;m.call(p.targets,release);check(!cover.removed,"binding preparation also follows native deferred release");p.targets.canRelease=true;m.call(p.targets,release);check(cover.removed,"unused bound target cleaned at native release");
 com.android.quickstep.views.TaskView tile=new com.android.quickstep.views.TaskView();
 Method click=java.util.Arrays.stream(tile.getClass().getMethods()).filter(v->v.getName().equals("launchWithAnimation")||v.getName().equals("launchTaskAnimated")).findFirst().orElseThrow();
 Method wrap=com.android.systemui.animation.RemoteAnimationTargetCompat.class.getDeclaredMethod("wrapApps",android.window.TransitionInfo.class,SurfaceControl.Transaction.class,android.util.ArrayMap.class);
 app.mode=0;com.android.systemui.animation.RemoteAnimationTargetCompat.apps=new RemoteAnimationTarget[]{app,other};
 SurfaceControl.Transaction first=new SurfaceControl.Transaction();m.call(null,wrap,null,first,new android.util.ArrayMap());check(first.pending.isEmpty(),"ordinary app launch without a Recents click stays native");
 var done=(com.android.launcher3.util.RunnableList)m.call(tile,click);first=new SurfaceControl.Transaction();
 Object result=m.call(null,wrap,null,first,new android.util.ArrayMap());cover=SurfaceControl.last;
 check(result==com.android.systemui.animation.RemoteAnimationTargetCompat.apps&&first.pending.size()==1&&!cover.shown,"only clicked selected task staged in initial Shell transaction; native return unchanged");
 first.apply();check(cover.painted&&cover.shown,"first native visibility commit already contains opaque pixels before UI composer exists");
 done.finish();check(cover.removed,"canceled request with no UI animator cleans its early layer");
 first=new SurfaceControl.Transaction();m.call(null,wrap,null,first,new android.util.ArrayMap());check(first.pending.isEmpty(),"finished request cannot mask a later home launch");
 done=(com.android.launcher3.util.RunnableList)m.call(tile,click);first=new SurfaceControl.Transaction();m.call(null,wrap,null,first,new android.util.ArrayMap());first.apply();cover=SurfaceControl.last;
 p.targets=new RemoteAnimationTargets(app);m.call(p,create,(Object)null);done.finish();check(!cover.removed,"request completion cannot remove a transformed cover before native release");m.call(p.targets,release);check(cover.removed,"first-display cover follows native release");
 tile.ids=new int[]{88};done=(com.android.launcher3.util.RunnableList)m.call(tile,click);first=new SurfaceControl.Transaction();m.call(null,wrap,null,first,new android.util.ArrayMap());check(first.pending.isEmpty(),"different pending task cannot capture unrelated target");done.finish();
 tile.ids=new int[]{7};tile.fail=true;try{m.call(tile,click);throw new AssertionError("native click failure swallowed");}catch(java.lang.reflect.InvocationTargetException|IllegalStateException expected){}first=new SurfaceControl.Transaction();m.call(null,wrap,null,first,new android.util.ArrayMap());check(first.pending.isEmpty(),"failed native click clears pending intent");

 Method alpha=SurfaceControl.Transaction.class.getDeclaredMethod("setAlpha",SurfaceControl.class,float.class);
 first=new SurfaceControl.Transaction();m.call(first,alpha,app.leash,.12f);first.apply();check(app.leash.alpha==.12f,"unprotected task keeps native fade");
 p.targets=new RemoteAnimationTargets(app);tx=(SurfaceTransaction)m.call(p,create,(Object)null);tx.getTransaction().apply();cover=SurfaceControl.last;
 check(app.leash.alpha==1f&&cover.painted,"opaque pixels and opaque container land atomically; inherited alpha cannot reveal source");
 first=new SurfaceControl.Transaction();m.call(first,alpha,app.leash,.35f);m.call(first,alpha,other.leash,.21f);first.apply();
 check(app.leash.alpha==1f&&other.leash.alpha==.21f,"only protected animation container overrides subsequent native fade");
 first=new SurfaceControl.Transaction();m.call(first,alpha,app.leash,0f);first.apply();check(app.leash.alpha==0f,"native hidden phase remains hidden before its initial matrix is ready");
 tx=(SurfaceTransaction)m.call(p,create,(Object)null);tx.getTransaction().apply();check(app.leash.alpha==0f,"cover preparation must not reveal an unpositioned full-screen leash");
 first=new SurfaceControl.Transaction();m.call(first,alpha,app.leash,.35f);first.apply();check(app.leash.alpha==1f,"first visible native frame is opaque after the hidden phase");
 FeatureSettings.current.enabled="0";FeatureSettings.listener.run();check(cover.removed&&app.leash.alpha==.35f,"unselect restores LATEST native alpha with cover removal");
 first=new SurfaceControl.Transaction();m.call(first,alpha,app.leash,.6f);first.apply();check(app.leash.alpha==.6f,"no lingering opacity override after cleanup");
 check(m.errors.size()==1,"single diagnosed allocation failure only");System.out.println("Privacy transition checks="+checks);}}
'''
}
for family in ['target_field','inherited_task_method','launch_10','launch_11','legacy_click','missing_type','missing_buffer','missing_alpha','missing_launch','missing_binding','missing_first_display']:
 current=sources.copy()
 if family!='target_field':
  current['android/view/RemoteAnimationTarget.java']=current['android/view/RemoteAnimationTarget.java'].replace('mode=1,activityType=1,taskId=7','mode=1,taskId=7')
  current['android/app/ActivityManager.java']=current['android/app/ActivityManager.java'].replace('public static class RunningTaskInfo {','public static class Parent {public int activityType=1;public int getActivityType(){return activityType;}}public static class RunningTaskInfo extends Parent {')
  current['ls/augment/com/hook/TestTransition.java']=current['ls/augment/com/hook/TestTransition.java'].replace('app.activityType','app.taskInfo.activityType')
 if family in ('missing_type','missing_buffer','missing_alpha'):
  if family=='missing_type':current['android/app/ActivityManager.java']=current['android/app/ActivityManager.java'].replace('getActivityType','unknownActivityType')
  elif family=='missing_buffer':current['android/view/SurfaceControl.java']=current['android/view/SurfaceControl.java'].replace('setBuffer(','unknownBuffer(')
  else:current['android/view/SurfaceControl.java']=current['android/view/SurfaceControl.java'].replace('setAlpha(','unknownAlpha(')
  current['ls/augment/com/hook/TestTransition.java']='''package ls.augment.com.hook;public class TestTransition {public static void main(String[] args){AugmentModule m=new AugmentModule();RecentsPrivacyTransition.install(m,TestTransition.class.getClassLoader());if(!m.hooks.isEmpty()||m.errors.size()!=1)throw new AssertionError("unknown contract must preserve native path and report missing interface");System.out.println("Unknown transition contract: native preserved");}}'''
 if family in ('launch_10','launch_11'):
  current['android/window/TransitionInfo.java']='package android.window;public class TransitionInfo {}'
  extra=',android.window.TransitionInfo info'+(',int duration' if family=='launch_11' else '')
  current['com/android/quickstep/TaskViewUtils.java']=current['com/android/quickstep/TaskViewUtils.java'].replace('Object depth)', 'Object depth'+extra+')')
 if family=='legacy_click':
  current['com/android/quickstep/views/TaskView.java']=current['com/android/quickstep/views/TaskView.java'].replace('launchWithAnimation','launchTaskAnimated')
 if family in ('missing_launch','missing_binding','missing_first_display'):
  if family=='missing_launch':current['com/android/quickstep/TaskViewUtils.java']=current['com/android/quickstep/TaskViewUtils.java'].replace('composeRecentsLaunchAnimator','unknownComposer')
  elif family=='missing_binding':current['com/android/quickstep/util/TransformParams.java']=current['com/android/quickstep/util/TransformParams.java'].replace('setTargetSet','unknownBinding')
  else:current['com/android/systemui/animation/RemoteAnimationTargetCompat.java']=current['com/android/systemui/animation/RemoteAnimationTargetCompat.java'].replace('wrapApps','unknownWrap')
  current['ls/augment/com/hook/TestTransition.java']='''package ls.augment.com.hook;public class TestTransition {public static void main(String[] args)throws Throwable {AugmentModule m=new AugmentModule();RecentsPrivacyTransition.install(m,TestTransition.class.getClassLoader());if(m.hooks.size()!=3||m.errors.size()!=1)throw new AssertionError("missing early preparation capability must retain existing gesture protection");com.android.quickstep.util.TransformParams p=new com.android.quickstep.util.TransformParams();p.targets=new com.android.quickstep.RemoteAnimationTargets(new android.view.RemoteAnimationTarget("selected"));Object w=m.call(p,com.android.quickstep.util.TransformParams.class.getDeclaredMethod("createSurfaceParams",com.android.quickstep.util.TransformParams.BuilderProxy.class),(Object)null);((com.android.quickstep.util.SurfaceTransaction)w).getTransaction().apply();if(!android.view.SurfaceControl.last.shown)throw new AssertionError("existing closing path lost");System.out.println("Missing early preparation capability: existing transition protection retained");}}'''
  current['ls/augment/com/hook/TestTransition.java']=current['ls/augment/com/hook/TestTransition.java'].replace('m.hooks.size()!=3','m.hooks.size()!='+('5' if family=='missing_first_display' else '6'))
 with tempfile.TemporaryDirectory(prefix='privacy-transition-') as temp:
  out=Path(temp)
  for name,source in current.items():p=out/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf8')
  subprocess.run(['javac','-encoding','UTF-8','-d',str(out),*map(str,out.rglob('*.java')),str(JAVA/'hook/RecentsPrivacyTransition.java'),str(JAVA/'hook/HookCompatibility.java')],check=True)
  subprocess.run(['java','-cp',str(out),'ls.augment.com.hook.TestTransition'],check=True)
