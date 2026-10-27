"""Run production cascade hooks against legacy/new native-layout doubles.

The doubles model native shelf clipping and scale feedback, not Android drawing.
Real APK contracts and device rendering are checked separately.
"""
from pathlib import Path
import subprocess, tempfile
from notification_view_runtime_facade import FILES

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
BASE='com/android/systemui/statusbar/notification/'
files={k:FILES[k] for k in ['ls/augment/com/hook/AugmentModule.java','android/content/Context.java',
    'android/content/pm/PackageManager.java','android/content/res/Configuration.java',
    'android/content/res/Resources.java','android/util/DisplayMetrics.java','ls/augment/com/SystemUiOptions.java']}
files['ls/augment/com/hook/AugmentModule.java']=files['ls/augment/com/hook/AugmentModule.java'].replace('target.getClass().getDeclaredMethod(name,types)','lookup(target.getClass(),name,types)').replace('public static Object invoke(','''static Method lookup(Class<?> c,String n,Class<?>[] p)throws Exception{for(;c!=null;c=c.getSuperclass())try{return c.getDeclaredMethod(n,p);}catch(NoSuchMethodException missing){}throw new NoSuchMethodException(n);}public static Object invoke(''')
files.update({
'io/github/libxposed/api/XposedInterface.java': 'package io.github.libxposed.api;public interface XposedInterface{interface HookHandle{void unhook();}}',
'android/graphics/Shader.java':'package android.graphics;public class Shader{public enum TileMode{CLAMP}}',
'android/graphics/RenderEffect.java':'package android.graphics;public class RenderEffect{public static RenderEffect createBlurEffect(float x,float y,Shader.TileMode m){return new RenderEffect();}}',
'android/view/View.java':'''package android.view;public class View{
 public static final int GONE=8;public ViewGroup parent;public int visibility,width=400,height=100;public boolean attached=true,hardware=true;
 public float sx=1,sy=1,px=200,py=50;public android.graphics.RenderEffect effect;
 public final android.content.Context context=new android.content.Context();public final android.content.res.Resources resources=new android.content.res.Resources();
 public android.content.Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}
 public int getVisibility(){return visibility;}public int getWidth(){return width;}public int getHeight(){return height;}
 public boolean isAttachedToWindow(){return attached;}public boolean isHardwareAccelerated(){return hardware;}public ViewGroup getParent(){return parent;}
 public float getPivotX(){return px;}public float getPivotY(){return py;}public void setPivotX(float p){px=p;}public void setPivotY(float p){py=p;}
 public void setScaleX(float v){sx=v;}public void setScaleY(float v){sy=v;}
 public void setRenderEffect(android.graphics.RenderEffect e){effect=e;}}
''',
'android/view/ViewGroup.java':'''package android.view;public class ViewGroup extends View{
 public java.util.List<View> children=new java.util.ArrayList<>();public void addView(View v){children.add(v);v.parent=this;}
 public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}
''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;public class FeatureSettings{
 public static final java.util.Map<String,String> values=new java.util.HashMap<>();
 public static boolean enabled(android.content.Context c,String k){return enabled(c,k,false);}
 public static boolean enabled(android.content.Context c,String k,boolean d){return values.containsKey(k)?"1".equals(values.get(k)):d;}
 public static int integer(android.content.Context c,String k,int d,int a,int b){return values.containsKey(k)?Integer.parseInt(values.get(k)):d;}
 public static void diagnostic(android.content.Context c,String k,String v){}}
''',
BASE+'stack/ExpandableViewState.java':'''package com.android.systemui.statusbar.notification.stack;public class ExpandableViewState{
 public float mYTranslation,mZTranslation,mScaleX=1,mScaleY=1,alpha=1;public int height=100,clipBottomAmount;public boolean gone,hidden;
 public float getAlpha(){return alpha;}public void setAlpha(float a){alpha=a;}}
''',
BASE+'row/ExpandableView.java':'''package com.android.systemui.statusbar.notification.row;
import com.android.systemui.statusbar.notification.stack.ExpandableViewState;import ls.augment.com.hook.AugmentModule;
public class ExpandableView extends android.view.View{public final ExpandableViewState state=new ExpandableViewState();public float nativeY;public boolean privateHidden;
 public ExpandableViewState getViewState(){return state;}
 public ExpandableViewState resetViewState(){return (ExpandableViewState)AugmentModule.invoke(this,"resetViewState",new Class<?>[]{});}
 public ExpandableViewState native_resetViewState(){state.mYTranslation=nativeY;state.mScaleX=sx;state.mScaleY=sy;state.mZTranslation=0;state.alpha=1;state.hidden=privateHidden;state.gone=visibility==GONE;return state;}}
''',
BASE+'row/ExpandableNotificationRow.java':'''package com.android.systemui.statusbar.notification.row;public class ExpandableNotificationRow extends ExpandableView{
 public boolean busy,pinned,away,guts,expanding,groupChanging;
 public boolean isUserLocked(){return busy;}public boolean isPinned(){return pinned;}public boolean isHeadsUpAnimatingAway(){return away;}
 public boolean isExpandAnimationRunning(){return expanding;}public boolean areGutsExposed(){return guts;}public boolean isGroupExpansionChanging(){return groupChanging;}}
''',
BASE+'stack/AmbientState.java':'''package com.android.systemui.statusbar.notification.stack;public class AmbientState{
 public boolean keyguard,doze;public float hide,expansion=1;
 public boolean isOnKeyguard(){return keyguard;}public boolean isDozing(){return doze;}public float getHideAmount(){return hide;}public float getExpansionFraction(){return expansion;}}
''',
BASE+'stack/NotificationStackScrollLayout.java':'''package com.android.systemui.statusbar.notification.stack;public class NotificationStackScrollLayout extends android.view.ViewGroup{
 public int mMaxLayoutHeight=1000,scrollRange=2000;public NotificationStackScrollLayout(){height=1000;}}
''',
BASE+'stack/StackScrollAlgorithm.java':'''package com.android.systemui.statusbar.notification.stack;
import com.android.systemui.statusbar.notification.row.*;import android.view.*;import ls.augment.com.hook.AugmentModule;
public class StackScrollAlgorithm{
 public final ViewGroup mHostView;public int clamps;public static class StackScrollAlgorithmState{}
 public StackScrollAlgorithm(ViewGroup h){mHostView=h;}public void resetViewStates(AmbientState a,int speed){AugmentModule.invoke(this,"resetViewStates",new Class<?>[]{AmbientState.class,int.class},a,speed);}
 public void native_resetViewStates(AmbientState a,int speed){for(View v:mHostView.children){ExpandableView row=(ExpandableView)v;row.resetViewState();updateViewWithShelf(row,row.state,700);}}
 public void updateViewWithShelf(ExpandableView v,ExpandableViewState s,float end){AugmentModule.invoke(this,"updateViewWithShelf",new Class<?>[]{ExpandableView.class,ExpandableViewState.class,float.class},v,s,end);}
 public void native_updateViewWithShelf(ExpandableView v,ExpandableViewState s,float end){clamps++;s.mYTranslation=Math.min(s.mYTranslation,end);}
 public void updateChild(int i,StackScrollAlgorithmState s,AmbientState a){}public void updatePositionsForState(StackScrollAlgorithmState s,AmbientState a){}public void resetChildViewStates(){}}
''',
'ls/augment/com/hook/TestCascade.java':'''package ls.augment.com.hook;
import ls.augment.com.*;import com.android.systemui.statusbar.notification.row.*;import com.android.systemui.statusbar.notification.stack.*;
public class TestCascade{
 static int n;static void check(boolean b,String m){n++;if(!b)throw new AssertionError(m);}static void near(float a,float b,String m){check(Math.abs(a-b)<.001,m+" "+a+" != "+b);}
 static class SubRow extends ExpandableNotificationRow{}public static class SubAlgorithm extends StackScrollAlgorithm{public SubAlgorithm(NotificationStackScrollLayout h){super(h);}}
 static void flag(String k,boolean v){FeatureSettings.values.put(k,v?"1":"0");}
 public static void main(String[] args){AugmentModule m=new AugmentModule();AugmentModule.active=m;
  int hooks=NotificationCascadeHook.install(m,TestCascade.class.getClassLoader());
  if(args.length>0){check(hooks==0&&m.hooks.isEmpty(),"missing contract cannot partially hook");System.out.println("cascade missing contract rejected");return;}
  check(hooks==3,"installed");NotificationStackScrollLayout h=new NotificationStackScrollLayout();AmbientState a=new AmbientState();StackScrollAlgorithm alg=new SubAlgorithm(h);
  SubRow front=new SubRow(),tail=new SubRow(),secret=new SubRow();front.nativeY=600;tail.nativeY=800;secret.nativeY=850;secret.privateHidden=true;h.addView(front);h.addView(tail);h.addView(secret);
  alg.resetViewStates(a,0);near(tail.state.mYTranslation,700,"disabled native shelf");
  flag(SystemUiOptions.NOTIFICATION_STACK,true);alg.clamps=0;alg.resetViewStates(a,0);check(alg.clamps==0&&tail.state.mYTranslation>600&&tail.state.mYTranslation<800,"tail preserves natural position before projecting");
  check(tail.state.mScaleX<1&&tail.state.alpha<1&&tail.effect!=null,"shrink/fade/blur");check(front.state.mZTranslation>tail.state.mZTranslation,"front occludes tail");check(secret.state.hidden&&secret.effect==null,"privacy preserved");check(h.scrollRange==2000,"native scroll range untouched");
  float scale=tail.state.mScaleX;tail.sx=scale;tail.sy=scale;alg.resetViewStates(a,0);near(tail.state.mScaleX,scale,"no cumulative scale");
  flag(NotificationAppearanceOptions.STACK_GRADIENT,false);alg.resetViewStates(a,0);check(tail.effect==null&&tail.state.alpha==1,"gradient disabled");
  tail.busy=true;alg.resetViewStates(a,0);near(tail.state.mYTranslation,700,"swiping uses native");near(tail.py,50,"pivot restored");tail.busy=false;tail.sx=tail.sy=1;
  flag(NotificationAppearanceOptions.STACK_LOCK,false);a.keyguard=true;alg.resetViewStates(a,0);near(tail.state.mYTranslation,700,"lock gate independent");a.keyguard=false;
  a.doze=true;alg.resetViewStates(a,0);near(tail.state.mYTranslation,700,"doze native");a.doze=false;
  a.hide=1;alg.resetViewStates(a,0);near(tail.state.mYTranslation,700,"hidden shade native");a.hide=0;
  a.expansion=.5f;alg.resetViewStates(a,0);near(tail.state.mYTranslation,700,"partial expansion native");a.expansion=1;
  h.resources.configuration.orientation=2;alg.resetViewStates(a,0);near(tail.state.mYTranslation,700,"landscape default native");flag(NotificationAppearanceOptions.STACK_LANDSCAPE,true);alg.resetViewStates(a,0);check(tail.state.mScaleX<1,"landscape opt in");
  flag(SystemUiOptions.NOTIFICATION_STACK,false);tail.sx=tail.sy=.8f;alg.resetViewStates(a,0);near(tail.state.mScaleX,1,"disable restores native scale");check(tail.effect==null&&tail.py==50,"disable releases effects");near(tail.sx,1,"recycled view scale restored");near(tail.sy,1,"recycled view height scale restored");
  float lastScale=1,lastAlpha=1;for(int i=0;i<1000;i++){float y=600+i;NotificationCascadePolicy.Card c=NotificationCascadePolicy.project(y,100,700,600,1000,2,true);check(Float.isFinite(c.y)&&c.scale>0&&c.alpha>=0&&c.alpha<=1,"finite geometry");check(c.scale<=lastScale&&c.alpha<=lastAlpha,"monotonic depth");lastScale=c.scale;lastAlpha=c.alpha;}
  check(m.errors==0,"no runtime errors");System.out.println("cascade checks="+n);}}
''',
'ls/augment/com/hook/TestWake.java':'''package ls.augment.com.hook;
public class TestWake{
 static class Legacy{int calls;private void onStartedWakingUp(){calls++;}}static class Child extends Legacy{}
 static class Wrong{public boolean onStartedWakingUp(){throw new AssertionError();}}static class Broken{public void onStartedWakingUp(){throw new IllegalStateException("native failure");}}
 static void check(boolean x){if(!x)throw new AssertionError();}
 public static void main(String[] args)throws Exception{Child manager=new Child();Legacy permanent=new Legacy();check("manager".equals(NativeIslandWake.synchronize(manager,permanent)));check(manager.calls==1&&permanent.calls==0);
 check("permanent".equals(NativeIslandWake.synchronize(new Object(),permanent)));check(permanent.calls==1);NativeIslandWake.synchronize(new Wrong(),permanent);check(permanent.calls==2);
 try{NativeIslandWake.synchronize(new Object(),new Object());throw new AssertionError();}catch(NoSuchMethodException expected){}
 try{NativeIslandWake.synchronize(new Broken(),permanent);throw new AssertionError();}catch(java.lang.reflect.InvocationTargetException expected){}check(permanent.calls==2);System.out.println("native wake legacy/inherited/permanent/missing/error checks passed");}}
'''
})

for variant in ['legacy','modern','missing']:
    current=dict(files)
    if variant=='modern':
        k=BASE+'stack/ExpandableViewState.java';current[k]=current[k].replace('setAlpha(float a)','setAlpha(float a,String why)')
        k=BASE+'row/ExpandableNotificationRow.java';current[k]=current[k].replace('isUserLocked','isUserSwipingToExpandRow')
    if variant=='missing':
        k=BASE+'stack/ExpandableViewState.java';current[k]=current[k].replace('setAlpha','unrelatedAlpha')
    with tempfile.TemporaryDirectory(prefix='duo-cascade-') as folder:
        work=Path(folder);paths=[]
        for name,source in current.items():
            p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf-8');paths.append(p)
        paths += [SRC/name for name in ['EnhancementOption.java','NotificationAppearanceOptions.java','NotificationCascadePolicy.java','hook/NotificationCascadeHook.java','hook/NativeIslandWake.java']]
        subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*map(str,paths)],check=True)
        subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestCascade',*(['missing'] if variant=='missing' else [])],check=True)
        if variant=='legacy':subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestWake'],check=True)
