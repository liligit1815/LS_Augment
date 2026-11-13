"""Native transaction/lifecycle contract, distinct from on-device compositing proof."""
from pathlib import Path
import runpy, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
JAVA=ROOT/'android/app/src/main/java/ls/augment/com'
base=runpy.run_path(str(ROOT/'tools/test-launcher-widget-dock-runtime.py'))['COMMON']
sources={
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
'android/graphics/Canvas.java':'package android.graphics;public class Canvas {public boolean opaque,icon;}',
'android/graphics/Rect.java':'package android.graphics;public class Rect {public int width(){return 1080;}public int height(){return 2400;}}',
'android/view/View.java':'package android.view;public class View {public View(android.content.Context c){}}',
'ls/augment/com/hook/RecentsPrivacyBackdrop.java':'package ls.augment.com.hook;class RecentsPrivacyBackdrop {RecentsPrivacyBackdrop(AugmentModule m){}void draw(android.view.View v,Object task,Object b,Object mat,android.graphics.Canvas c,float l,float t,float r,float bottom,float radius){c.opaque=true;}}',
'android/view/Surface.java':'''package android.view;import android.graphics.*;public class Surface {public static boolean fail;SurfaceControl c;public Surface(SurfaceControl v){c=v;}public Canvas lockCanvas(Rect r){if(fail)throw new IllegalStateException("canvas");return new Canvas();}public void unlockCanvasAndPost(Canvas canvas){c.painted=canvas.opaque&&canvas.icon;}public void release(){}}''',
'android/view/SurfaceControl.java':'''package android.view;import java.util.*;public class SurfaceControl {public boolean valid=true,painted,shown,removed,released;public SurfaceControl parent;public static SurfaceControl last;public boolean isValid(){return valid;}public void release(){released=true;}
 public static class Builder {SurfaceControl c=new SurfaceControl();public Builder setName(String s){return this;}public Builder setParent(SurfaceControl p){c.parent=p;return this;}public Builder setBufferSize(int x,int y){return this;}public Builder setHidden(boolean b){if(!b)throw new AssertionError("must be hidden before painted");return this;}public SurfaceControl build(){last=c;return c;}}
 public static class Transaction {public final List<SurfaceControl> pending=new ArrayList<>();public int mutations;public Transaction setLayer(SurfaceControl s,int i){mutations++;return this;}public Transaction setMatrix(SurfaceControl s,float a,float b,float c,float d){mutations++;return this;}public Transaction setPosition(SurfaceControl s,float x,float y){mutations++;return this;}public Transaction show(SurfaceControl s){if(!s.painted)throw new AssertionError("unpainted cover");pending.add(s);return this;}public Transaction remove(SurfaceControl s){s.removed=true;return this;}public void apply(){for(SurfaceControl s:pending)s.shown=true;}public void close(){}}
}''',
'android/view/RemoteAnimationTarget.java':'''package android.view;public class RemoteAnimationTarget {public SurfaceControl leash=new SurfaceControl();public int mode=1,activityType=1,taskId=7;public android.graphics.Rect screenSpaceBounds=new android.graphics.Rect();public android.app.ActivityManager.RunningTaskInfo taskInfo=new android.app.ActivityManager.RunningTaskInfo();public RemoteAnimationTarget(String pkg){taskInfo.taskId=taskId;taskInfo.baseActivity=new android.content.ComponentName(pkg);}}''',
'com/android/quickstep/RemoteAnimationTargets.java':'''package com.android.quickstep;public class RemoteAnimationTargets {public android.view.RemoteAnimationTarget[] unfilteredApps;public boolean mReleased,canRelease=true;public RemoteAnimationTargets(android.view.RemoteAnimationTarget... x){unfilteredApps=x;}public void release(){if(canRelease)mReleased=true;}}''',
'com/android/quickstep/util/SurfaceTransaction.java':'''package com.android.quickstep.util;public class SurfaceTransaction {final android.view.SurfaceControl.Transaction tx=new android.view.SurfaceControl.Transaction();public android.view.SurfaceControl.Transaction getTransaction(){return tx;}}''',
'com/android/quickstep/util/TransformParams.java':'''package com.android.quickstep.util;public class TransformParams {public interface BuilderProxy {}public com.android.quickstep.RemoteAnimationTargets targets;public com.android.quickstep.RemoteAnimationTargets getTargetSet(){return targets;}public SurfaceTransaction createSurfaceParams(BuilderProxy b){return new SurfaceTransaction();}}''',
'ls/augment/com/hook/TestTransition.java':'''package ls.augment.com.hook;import android.view.*;import com.android.quickstep.*;import com.android.quickstep.util.*;import java.lang.reflect.*;
 public class TestTransition {static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}public static void main(String[] args)throws Throwable {
 AugmentModule m=new AugmentModule();RecentsPrivacyTransition.install(m,TestTransition.class.getClassLoader());check(m.errors.isEmpty()&&m.hooks.size()==2,"complete capability installs");
 Method create=TransformParams.class.getDeclaredMethod("createSurfaceParams",TransformParams.BuilderProxy.class),release=RemoteAnimationTargets.class.getDeclaredMethod("release");
 TransformParams p=new TransformParams();RemoteAnimationTarget app=new RemoteAnimationTarget("selected"),other=new RemoteAnimationTarget("other");p.targets=new RemoteAnimationTargets(app,other);
 SurfaceTransaction tx=(SurfaceTransaction)m.call(p,create,(Object)null);SurfaceControl cover=SurfaceControl.last;
 check(cover.parent==app.leash&&cover.painted&&!cover.shown,"painted private child before transaction commit");check(tx.getTransaction().pending.size()==1,"only selected task covered in split set");
 tx.getTransaction().apply();check(cover.shown&&!app.leash.removed&&!app.leash.released,"same native transaction reveals cover; real app unmodified");
 m.call(p,create,(Object)null);check(SurfaceControl.last==cover,"reuse per leash across frames");
 p.targets.canRelease=false;m.call(p.targets,release);check(!cover.removed,"deferred native release retains mask");p.targets.canRelease=true;m.call(p.targets,release);check(cover.removed&&cover.released,"finish/cancel releases owned layer");
 p.targets=new RemoteAnimationTargets(app);m.call(p,create,(Object)null);cover=SurfaceControl.last;FeatureSettings.current.enabled="0";FeatureSettings.listener.run();check(cover.removed,"disable removes existing protection without waiting for frame");
 tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"disabled native path");
 FeatureSettings.current.enabled="1";app.mode=0;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"opening ordinary app unaffected");
 app.mode=1;app.activityType=2;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"home surface excluded");
 app.activityType=1;app.taskInfo.taskId=99;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"task identity mismatch native preserved");
 app.taskInfo.taskId=7;app.leash.valid=false;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty(),"invalid leash ignored");
 app.leash.valid=true;Surface.fail=true;tx=(SurfaceTransaction)m.call(p,create,(Object)null);check(tx.getTransaction().pending.isEmpty()&&SurfaceControl.last.removed,"failed preparation cleans its hidden child");
 Surface.fail=false;m.call(p,create,(Object)null);cover=SurfaceControl.last;FeatureSettings.current.apps="other";FeatureSettings.listener.run();check(cover.removed,"selection changes restore actual app");
 check(m.errors.size()==1,"single diagnosed canvas failure only");System.out.println("Privacy transition checks="+checks);}}
'''
}
for family in ['target_field','inherited_task_method','missing_type']:
 current=sources.copy()
 if family!='target_field':
  current['android/view/RemoteAnimationTarget.java']=current['android/view/RemoteAnimationTarget.java'].replace('mode=1,activityType=1,taskId=7','mode=1,taskId=7')
  current['android/app/ActivityManager.java']=current['android/app/ActivityManager.java'].replace('public static class RunningTaskInfo {','public static class Parent {public int activityType=1;public int getActivityType(){return activityType;}}public static class RunningTaskInfo extends Parent {')
  current['ls/augment/com/hook/TestTransition.java']=current['ls/augment/com/hook/TestTransition.java'].replace('app.activityType','app.taskInfo.activityType')
 if family=='missing_type':
  current['android/app/ActivityManager.java']=current['android/app/ActivityManager.java'].replace('getActivityType','unknownActivityType')
  current['ls/augment/com/hook/TestTransition.java']='''package ls.augment.com.hook;public class TestTransition {public static void main(String[] args){AugmentModule m=new AugmentModule();RecentsPrivacyTransition.install(m,TestTransition.class.getClassLoader());if(!m.hooks.isEmpty()||m.errors.size()!=1)throw new AssertionError("unknown contract must preserve native path and report missing interface");System.out.println("Unknown transition contract: native preserved");}}'''
 with tempfile.TemporaryDirectory(prefix='privacy-transition-') as temp:
  out=Path(temp)
  for name,source in current.items():p=out/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf8')
  subprocess.run(['javac','-encoding','UTF-8','-d',str(out),*map(str,out.rglob('*.java')),str(JAVA/'hook/RecentsPrivacyTransition.java'),str(JAVA/'hook/HookCompatibility.java')],check=True)
  subprocess.run(['java','-cp',str(out),'ls.augment.com.hook.TestTransition'],check=True)
