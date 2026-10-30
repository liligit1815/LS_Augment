"""Execute the production hook against old/new OEM contracts, including live restoration."""
from pathlib import Path
import argparse, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'android/app/src/main/java/ls/augment/com/hook/IslandStatusBarAvoidanceHook.java'
FILES={
'android/content/Context.java':'''package android.content;public class Context {public Context getApplicationContext(){return this;}}''',
'android/os/Looper.java':'''package android.os;public class Looper {static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return MAIN;}}''',
'android/os/Handler.java':'''package android.os;public class Handler {public Handler(Looper l){}public void post(Runnable r){r.run();}}''',
'android/view/View.java':'''package android.view;public class View {public int width=400;public int getWidth(){return width;}}''',
'android/view/ViewGroup.java':'''package android.view;public class ViewGroup extends View {}''',
'android/animation/Animator.java':'''package android.animation;public class Animator {public static final java.util.List<Animator> all=new java.util.ArrayList<>();public Runnable after;boolean started;public Animator(){all.add(this);}public void start(){started=true;}public boolean isStarted(){return started;}public void end(){if(!started)return;started=false;if(after!=null)after.run();}public static void finish(){for(int i=0;i<all.size();i++)all.get(i).end();}}''',
'ls/augment/com/SystemUiOptions.java':'''package ls.augment.com;public class SystemUiOptions {public static final String ISLAND_STATUS_AVOIDANCE="ls_augment_rm_island_status_avoidance";}''',
'ls/augment/com/BuildConfig.java':'''package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20691;}''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import android.content.Context;import java.util.*;public class FeatureSettings {
 public static String value="1";public static Map<String,String> diagnostics=new HashMap<>();static List<Runnable> listeners=new ArrayList<>();
 public String get(String key){return value;}static FeatureSettings snapshot(Context c){return new FeatureSettings();}static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}
 static void addSnapshotListener(Context c,Runnable r){listeners.add(r);}static void set(String v){value=v;for(Runnable r:new ArrayList<>(listeners))r.run();}}''',
'ls/augment/com/hook/SystemUiAdapter.java':'''package ls.augment.com.hook;public class SystemUiAdapter {static final android.content.Context CONTEXT=new android.content.Context();static android.content.Context context(Object o){return CONTEXT;}}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;public class AugmentModule {
 public interface Body {Object run()throws Throwable;}public interface Hook {Object run(Chain c)throws Throwable;}
 static final Map<Method,Hook> hooks=new HashMap<>();static final ThreadLocal<Boolean> original=ThreadLocal.withInitial(()->false);
 public static class Chain {final Object owner;final Method method;final Object[] args;Chain(Object o,Method m,Object[] a){owner=o;method=m;args=a;}public Object getThisObject(){return owner;}public List<Object> getArgs(){return Arrays.asList(args);}public Object getArg(int i){return args[i];}public Object proceed()throws Throwable{return proceed(args);}public Object proceed(Object[] a)throws Throwable {boolean p=original.get();original.set(true);try{return method.invoke(owner,a);}catch(InvocationTargetException e){throw e.getCause();}finally{original.set(p);}}}
 public static Object dispatch(Object o,String n,Class<?>[] types,Object[] args,Body body){try{if(original.get())return body.run();Method m=o.getClass().getMethod(n,types);Hook h=hooks.get(m);return h==null?body.run():h.run(new Chain(o,m,args));}catch(Throwable e){throw new RuntimeException(e);}}
 public static class Builder {final Method method;Hook hook;Builder(Method m){method=m;}public Builder intercept(Hook h){hook=h;return this;}}
 Builder prepareFeatureHook(Method m,String label,boolean b){return new Builder(m);}void registerFeatureHook(Builder b){hooks.put(b.method,b.hook);}void deoptimize(Method m){}void logFeatureInfo(String s){}void logFeatureError(String s,Throwable t){System.out.println(s+": "+t.getMessage());}}''',
'com/zte/feature/dynamicisland/DynamicPermanentIsland.java':'''package com.zte.feature.dynamicisland;public class DynamicPermanentIsland {}''',
'com/zte/feature/notification/module/NotificationIconDisplay.java':'''package com.zte.feature.notification.module;import android.animation.Animator;import ls.augment.com.hook.AugmentModule;
 public class NotificationIconDisplay {public boolean mDynamicIslandShowing;public int mode=1;public boolean icons=true,join=false;public int requests;
 public Animator createNotificationIconAnimation(boolean show,boolean out){return (Animator)AugmentModule.dispatch(this,"createNotificationIconAnimation",new Class[]{boolean.class,boolean.class},new Object[]{show,out},()->new Animator());}
 public void setDynamicIslandShowing(boolean show,boolean immediate){AugmentModule.dispatch(this,"setDynamicIslandShowing",new Class[]{boolean.class,boolean.class},new Object[]{show,immediate},()->{requests++;mDynamicIslandShowing=show;if(mode!=1)return null;if(immediate){join=true;return null;}Animator a=createNotificationIconAnimation(show,true);a.after=()->{icons=!show;join=show;createNotificationIconAnimation(show,false).start();};a.start();return null;});}}
''',
}
COMMON='''
 public void setViewWidth(android.view.View v,int w){AugmentModule.dispatch(this,"setViewWidth",new Class[]{android.view.View.class,int.class},new Object[]{v,w},()->{v.width=w;return null;});}
 public boolean keyguard;public void updateKeyguardBarWidth(boolean show){AugmentModule.dispatch(this,"updateKeyguardBarWidth",new Class[]{boolean.class},new Object[]{show},()->{keyguard=show;return null;});}
'''
LEGACY='''package com.zte.feature.dynamicisland;import android.view.*;import ls.augment.com.hook.AugmentModule;public class PermanentIslandManager {
 public View mStatusIconContainer=new View();public ViewGroup mSystemParent=new ViewGroup();
 public View icon(){return mStatusIconContainer;}
 public void reserve(boolean show){updateSystemContainerWidth(show);}
 public void updateSystemContainerWidth(boolean show){AugmentModule.dispatch(this,"updateSystemContainerWidth",new Class[]{boolean.class},new Object[]{show},()->{setViewWidth(mStatusIconContainer,show?80:mSystemParent.getWidth());return null;});}
 // COMMON
}'''
MODERN='''package com.zte.feature.dynamicisland;import android.view.*;import ls.augment.com.hook.AugmentModule;public class PermanentIslandManager {
 public View mSystemIconContainer=new View(),mKeyguardSystemContainer=new View();public ViewGroup mSystemParent=new ViewGroup(),mKeyguardSystemParent=new ViewGroup();public int mRightBound;public boolean functionHidden,carrier;
 public View icon(){return mSystemIconContainer;}
 public void reserve(boolean show){updateSystemContainerWidth(show,true,new DynamicPermanentIsland(),0);}
 public void updateSystemContainerWidth(boolean show,boolean anim,DynamicPermanentIsland island,int mode){AugmentModule.dispatch(this,"updateSystemContainerWidth",new Class[]{boolean.class,boolean.class,DynamicPermanentIsland.class,int.class},new Object[]{show,anim,island,mode},()->{setViewWidth(mSystemIconContainer,show?100:mSystemParent.getWidth());return null;});}
 public void updateNotificationContainerWidthFullScreen(DynamicPermanentIsland island,int mode){AugmentModule.dispatch(this,"updateNotificationContainerWidthFullScreen",new Class[]{DynamicPermanentIsland.class,int.class},new Object[]{island,mode},()->{mRightBound=180;functionHidden=true;return null;});}
 public float getRightBound(float width){return (Float)AugmentModule.dispatch(this,"getRightBound",new Class[]{float.class},new Object[]{width},()->mRightBound==0?width:Math.min(width,mRightBound));}
 public void resetNotificationContainerWidth(){AugmentModule.dispatch(this,"resetNotificationContainerWidth",new Class[]{},new Object[]{},()->{mRightBound=0;functionHidden=false;return null;});}
 public void resetSystemContainerWidth(){AugmentModule.dispatch(this,"resetSystemContainerWidth",new Class[]{},new Object[]{},()->{icon().width=mSystemParent.getWidth();return null;});}
 public void updateCarrierTextWidth(boolean show,DynamicPermanentIsland island){AugmentModule.dispatch(this,"updateCarrierTextWidth",new Class[]{boolean.class,DynamicPermanentIsland.class},new Object[]{show,island},()->{carrier=show;return null;});}
 // COMMON
}'''
HARNESS='''package ls.augment.com.hook;import android.animation.Animator;import android.view.*;import com.zte.feature.dynamicisland.*;import com.zte.feature.notification.module.NotificationIconDisplay;
public class TestAvoidance {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 public static class Child extends PermanentIslandManager{}public static class ChildDisplay extends NotificationIconDisplay{}
 public static class WrongField extends PermanentIslandManager {public String mSystemParent="invalid";}
 public static class WrongDisplay {public boolean mDynamicIslandShowing;public boolean setDynamicIslandShowing(boolean a,boolean b){return false;}public Animator createNotificationIconAnimation(boolean a,boolean b){return null;}}
 static void rejected(Class<?> pm,Class<?> n){try{new IslandStatusBarAvoidanceHook.Access(pm,n);throw new AssertionError("missing capability accepted");}catch(ReflectiveOperationException expected){checks++;}}
 public static void main(String[] args)throws Exception{
  check(IslandStatusBarAvoidanceHook.install(new AugmentModule(),TestAvoidance.class.getClassLoader())>=5,"hooks installed");
  new IslandStatusBarAvoidanceHook.Access(Child.class,ChildDisplay.class);checks++;
  rejected(WrongField.class,NotificationIconDisplay.class);rejected(PermanentIslandManager.class,WrongDisplay.class);rejected(Object.class,NotificationIconDisplay.class);
  PermanentIslandManager pm=new Child();NotificationIconDisplay n=new ChildDisplay();
  pm.reserve(true);n.setDynamicIslandShowing(true,false);Animator.finish();
  check(pm.icon().width<400&&n.join&&!n.icons,"default preserves native reservation");
  pm.updateKeyguardBarWidth(true);
  FeatureSettings.set("0");Animator.finish();check(pm.icon().width==400&&n.icons&&!n.join&&!pm.keyguard,"disable while island visible restores both sides and keyguard");
  pm.setViewWidth(pm.icon(),66);check(pm.icon().width==400,"old width animation cannot reclaim reserved width");
  View unrelated=new View();pm.setViewWidth(unrelated,66);check(unrelated.width==66,"unrelated view width remains native");
  pm.reserve(true);n.setDynamicIslandShowing(true,false);Animator.finish();check(n.icons&&pm.icon().width==400,"future islands also do not reserve");
  FeatureSettings.set("1");Animator.finish();check(n.join&&pm.icon().width<400&&pm.keyguard,"reenable while active restores native reservation");
  n.setDynamicIslandShowing(false,false);pm.reserve(false);pm.updateKeyguardBarWidth(false);Animator.finish();
  FeatureSettings.set("0");FeatureSettings.set("1");Animator.finish();check(n.icons&&pm.icon().width==400&&!pm.keyguard,"inactive island is not resurrected");
  n.setDynamicIslandShowing(true,false);FeatureSettings.set("0");FeatureSettings.set("1");FeatureSettings.set("0");Animator.finish();check(n.icons&&!n.join,"rapid toggles finish stale native callbacks");
  n.setDynamicIslandShowing(true,true);Animator.finish();check(n.icons&&!n.join,"native forced summary branch suppressed while disabled");
  FeatureSettings.set("1");Animator.finish();check(!n.icons&&n.join,"forced-summary replay restores full native transition");FeatureSettings.set("0");Animator.finish();
  n.mode=0;n.icons=false;n.join=false;n.setDynamicIslandShowing(true,false);Animator.finish();check(!n.icons&&!n.join,"native hidden preference respected");
  n.mode=2;n.join=true;n.setDynamicIslandShowing(true,false);Animator.finish();check(n.join,"native permanent summary preference respected");n.mode=1;
  // MODERN_CHECKS
  System.out.println("PASS "+checks+" avoidance checks: "+new IslandStatusBarAvoidanceHook.Access(PermanentIslandManager.class,NotificationIconDisplay.class).route);
 }
}'''
MODERN_CHECKS='''
 pm.updateNotificationContainerWidthFullScreen(new DynamicPermanentIsland(),2);check(pm.getRightBound(350)==350&&!pm.functionHidden,"new geometry boundary and function icons restored");
 pm.updateCarrierTextWidth(true,new DynamicPermanentIsland());check(!pm.carrier,"carrier reservation disabled");
 FeatureSettings.set("1");Animator.finish();check(pm.getRightBound(350)==180&&pm.functionHidden&&pm.carrier,"geometry reenabled with original scene and mode");
 FeatureSettings.set("0");Animator.finish();check(pm.getRightBound(350)==350&&!pm.functionHidden,"geometry removed live");
 pm.setViewWidth(pm.mKeyguardSystemContainer,90);check(pm.mKeyguardSystemContainer.width==400,"keyguard system icons unreserved");
 pm.reserve(true);pm.resetSystemContainerWidth();FeatureSettings.set("1");Animator.finish();check(pm.icon().width==400,"native reset retires old width request");
 pm.resetNotificationContainerWidth();FeatureSettings.set("0");FeatureSettings.set("1");Animator.finish();check(pm.getRightBound(350)==350&&!pm.functionHidden,"native close retires stale fullscreen bounds");
'''
FIXED='''package com.zte.feature.dynamicisland;import android.view.*;import ls.augment.com.hook.AugmentModule;public class PermanentIslandManager {
 public View mSystemIconContainer=new View(),mKeyguardSystemContainer=new View();public ViewGroup mSystemParent=new ViewGroup(),mKeyguardSystemParent=new ViewGroup();public int mRightBound;
 public View icon(){return mSystemIconContainer;}
 public void reserve(boolean show){updateSystemContainerWidth(show);}
 public void updateSystemContainerWidth(boolean show){updateSystemContainerWidth(show,true);}
 public void updateSystemContainerWidth(boolean show,boolean anim){AugmentModule.dispatch(this,"updateSystemContainerWidth",new Class[]{boolean.class,boolean.class},new Object[]{show,anim},()->{setViewWidth(mSystemIconContainer,show?100:mSystemParent.getWidth());return null;});}
 public void updateNotificationContainerWidthFullScreen(int mode){AugmentModule.dispatch(this,"updateNotificationContainerWidthFullScreen",new Class[]{int.class},new Object[]{mode},()->{mRightBound=mode==1?0:180;return null;});}
 public int getRightBound(){return (Integer)AugmentModule.dispatch(this,"getRightBound",new Class[]{},new Object[]{},()->mRightBound);}
 // COMMON
}'''
FIXED_CHECKS='''
 pm.updateNotificationContainerWidthFullScreen(2);check(pm.getRightBound()==0,"fixed geometry disabled");
 FeatureSettings.set("1");Animator.finish();check(pm.getRightBound()==180,"fixed geometry restores original mode");
 pm.updateNotificationContainerWidthFullScreen(1);pm.reserve(false);FeatureSettings.set("0");FeatureSettings.set("1");Animator.finish();check(pm.getRightBound()==0&&pm.icon().width==400,"fixed geometry close does not resurrect reservation");
'''

def main():
 p=argparse.ArgumentParser();p.add_argument('--java-home',type=Path,required=True);a=p.parse_args()
 import os
 suffix='.exe' if os.name=='nt' else ''
 for route,manager in [('legacy',LEGACY),('fixed_geometry',FIXED),('geometry',MODERN)]:
  with tempfile.TemporaryDirectory(prefix='duo-avoidance-') as directory:
   out=Path(directory);files=dict(FILES)
   files['ls/augment/com/hook/IslandStatusBarAvoidanceHook.java']=SOURCE.read_text('utf-8')
   files['com/zte/feature/dynamicisland/PermanentIslandManager.java']=manager.replace('// COMMON',COMMON)
   files['ls/augment/com/hook/TestAvoidance.java']=HARNESS.replace('// MODERN_CHECKS',{'geometry':MODERN_CHECKS,'fixed_geometry':FIXED_CHECKS}.get(route,''))
   paths=[]
   for name,text in files.items():
    target=out/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(text,'utf-8');paths.append(str(target))
   subprocess.run([str(a.java_home/'bin'/('javac'+suffix)),'-encoding','UTF-8','-d',str(out),*paths],check=True)
   subprocess.run([str(a.java_home/'bin'/('java'+suffix)),'-cp',str(out),'ls.augment.com.hook.TestAvoidance'],check=True)

if __name__=='__main__':main()
