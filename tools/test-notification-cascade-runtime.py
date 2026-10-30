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
    'android/os/Handler.java','android/os/Looper.java','android/content/pm/PackageManager.java','android/content/res/Configuration.java',
    'android/content/res/Resources.java','android/util/DisplayMetrics.java','ls/augment/com/SystemUiOptions.java']}
files['ls/augment/com/hook/AugmentModule.java']=files['ls/augment/com/hook/AugmentModule.java'].replace('target.getClass().getDeclaredMethod(name,types)','lookup(target.getClass(),name,types)').replace('public static Object invoke(','''static Method lookup(Class<?> c,String n,Class<?>[] p)throws Exception{for(;c!=null;c=c.getSuperclass())try{return c.getDeclaredMethod(n,p);}catch(NoSuchMethodException missing){}throw new NoSuchMethodException(n);}public static Object invoke(''')
files['android/content/ContentResolver.java']='package android.content;public class ContentResolver{}'
files['android/provider/Settings.java']='package android.provider;public class Settings{public static class Secure{public static int getInt(android.content.ContentResolver r,String k,int d){return d;}}public static class Global extends Secure{}}'
files.update({
'android/content/Context.java':'''package android.content;public class Context{
 public android.content.ContentResolver getContentResolver(){return new android.content.ContentResolver();}public final android.content.res.Resources resources=new android.content.res.Resources();public android.content.res.Resources getResources(){return resources;}}
''',
'android/view/MotionEvent.java':'''package android.view;public class MotionEvent {
 public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3;public int action;public float x,y;
 public MotionEvent(int a,float x,float y){action=a;this.x=x;this.y=y;}public int getActionMasked(){return action;}public float getX(){return x;}public float getY(){return y;}}
''',
'io/github/libxposed/api/XposedInterface.java': 'package io.github.libxposed.api;public interface XposedInterface{interface HookHandle{void unhook();}}',
'android/graphics/Shader.java':'package android.graphics;public class Shader{public enum TileMode{CLAMP}}',
'android/graphics/RenderEffect.java':'package android.graphics;public class RenderEffect{public static RenderEffect createBlurEffect(float x,float y,Shader.TileMode m){return new RenderEffect();}}',
'android/view/View.java':'''package android.view;public class View{
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}private final java.util.List<OnAttachStateChangeListener> listeners=new java.util.ArrayList<>();public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}public void detach(){attached=false;for(var l:new java.util.ArrayList<>(listeners))l.onViewDetachedFromWindow(this);}public static final int VISIBLE=0,GONE=8;public ViewGroup parent;public int visibility,width=400,height=100;public boolean attached=true,hardware=true;
 public float sx=1,sy=1,px=200,py=50;public android.graphics.RenderEffect effect;
 public final android.content.Context context=new android.content.Context();public android.content.ContentResolver getContentResolver(){return new android.content.ContentResolver();}public final android.content.res.Resources resources=context.getResources();
 public android.content.Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}
 public int getVisibility(){return visibility;}public int getWidth(){return width;}public int getHeight(){return height;}
 public boolean isAttachedToWindow(){return attached;}public boolean isHardwareAccelerated(){return hardware;}public ViewGroup getParent(){return parent;}
 public float getPivotX(){return px;}public float getPivotY(){return py;}public void setPivotX(float p){px=p;}public void setPivotY(float p){py=p;}
 public void setScaleX(float v){sx=v;}public void setScaleY(float v){sy=v;}
 public void setRenderEffect(android.graphics.RenderEffect e){effect=e;}}
''',
'android/view/ViewGroup.java':'''package android.view;public class ViewGroup extends View{
 public boolean disallow;public void requestDisallowInterceptTouchEvent(boolean v){disallow=v;}
 public java.util.List<View> children=new java.util.ArrayList<>();public void addView(View v){children.add(v);v.parent=this;}
 public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}
''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;public class FeatureSettings{
 public static final java.util.Map<String,String> values=new java.util.HashMap<>();
 public static boolean enabled(android.content.Context c,String k){return enabled(c,k,false);}
 public static boolean enabled(android.content.Context c,String k,boolean d){return values.containsKey(k)?"1".equals(values.get(k)):d;}
 public static int integer(android.content.Context c,String k,int d,int a,int b){return values.containsKey(k)?Integer.parseInt(values.get(k)):d;}
 public static final java.util.Map<String,String> reports=new java.util.HashMap<>();
 public static boolean addSnapshotListener(android.content.Context c,Runnable r){return true;}public static void diagnostic(android.content.Context c,String k,String v){reports.put(k,v);}}
''',
BASE+'stack/ExpandableViewState.java':'''package com.android.systemui.statusbar.notification.stack;public class ExpandableViewState{
 public float mYTranslation,mZTranslation,mScaleX=1,mScaleY=1,alpha=1;public int height=100,clipTopAmount,clipBottomAmount;public boolean gone,hidden;
 public float getAlpha(){return alpha;}public void setAlpha(float a){alpha=a;}}
''',
BASE+'row/ExpandableView.java':'''package com.android.systemui.statusbar.notification.row;
import com.android.systemui.statusbar.notification.stack.ExpandableViewState;import ls.augment.com.hook.AugmentModule;
public class ExpandableView extends android.view.View{public final ExpandableViewState state=new ExpandableViewState();public float nativeY;public boolean privateHidden,resetTopClip=true;public int renderedTopClip;
 public int getClipTopAmount(){return renderedTopClip;}public void setClipTopAmount(int n){renderedTopClip=n;}
 public ExpandableViewState getViewState(){return state;}
 public ExpandableViewState resetViewState(){return (ExpandableViewState)AugmentModule.invoke(this,"resetViewState",new Class<?>[]{});}
 public ExpandableViewState native_resetViewState(){state.mYTranslation=nativeY;state.mScaleX=sx;state.mScaleY=sy;state.mZTranslation=0;state.alpha=1;if(resetTopClip)state.clipTopAmount=0;state.hidden=privateHidden;state.gone=visibility==GONE;return state;}}
''',
BASE+'row/ExpandableNotificationRow.java':'''package com.android.systemui.statusbar.notification.row;public class ExpandableNotificationRow extends ExpandableView{
 public boolean busy,pinned,away,guts,expanding,groupChanging;
 public boolean isUserLocked(){return busy;}public boolean isPinned(){return pinned;}public boolean isHeadsUpAnimatingAway(){return away;}
 public boolean isExpandAnimationRunning(){return expanding;}public boolean areGutsExposed(){return guts;}public boolean isGroupExpansionChanging(){return groupChanging;}}
''',
BASE+'stack/AmbientState.java':'''package com.android.systemui.statusbar.notification.stack;public class AmbientState{
 public boolean keyguard,doze;public float hide,expansion=1;
 public float stackY;public boolean isOnKeyguard(){return keyguard;}public boolean isDozing(){return doze;}public float getHideAmount(){return hide;}public float getExpansionFraction(){return expansion;}
 public float getStackY(){return stackY;}public float getInterpolatedStackHeight(){return 600;}}
''',
BASE+'stack/NotificationStackScrollLayout.java':'''package com.android.systemui.statusbar.notification.stack;public class NotificationStackScrollLayout extends android.view.ViewGroup{
 public boolean upEnabled;public int moves;
 public boolean dispatchTouchEvent(android.view.MotionEvent e){return (Boolean)ls.augment.com.hook.AugmentModule.invoke(this,"dispatchTouchEvent",new Class<?>[]{android.view.MotionEvent.class},e);}
 public boolean native_dispatchTouchEvent(android.view.MotionEvent e){onInterceptTouchEventScroll(e);boolean result=onScrollTouch(e);if(e.action==1)upEnabled=isScrollingEnabled();if(e.action==2&&result)moves++;return result;}
 public boolean fromParent(android.view.MotionEvent e){if(e.action==2&&parent!=null&&!parent.disallow)return false;return dispatchTouchEvent(e);}
 public int mMaxLayoutHeight=1000,scrollRange=2000,mOwnScrollY,scrollabilityCalls;public boolean nativeScrolling=true;public NotificationStackScrollLayout(){height=1000;}
 public int getScrollRange(){return (Integer)ls.augment.com.hook.AugmentModule.invoke(this,"getScrollRange",new Class<?>[]{});}public int native_getScrollRange(){return scrollRange;}
 public void requestChildrenUpdate(){}public void updateScrollability(){scrollabilityCalls++;}public void clampScrollPosition(){mOwnScrollY=Math.min(mOwnScrollY,getScrollRange());}
 public boolean isScrollingEnabled(){return (Boolean)ls.augment.com.hook.AugmentModule.invoke(this,"isScrollingEnabled",new Class<?>[]{});}public boolean native_isScrollingEnabled(){return nativeScrolling;}
 public android.view.View getChildAtPosition(float x,float y){for(android.view.View v:children){var r=(com.android.systemui.statusbar.notification.row.ExpandableView)v;if(!r.state.hidden&&y>=r.state.mYTranslation&&y<r.state.mYTranslation+r.state.height)return r;}return null;}
 public boolean onScrollTouch(android.view.MotionEvent e){return (Boolean)ls.augment.com.hook.AugmentModule.invoke(this,"onScrollTouch",new Class<?>[]{android.view.MotionEvent.class},e);}
 public boolean native_onScrollTouch(android.view.MotionEvent e){return isScrollingEnabled();}
 public boolean onInterceptTouchEventScroll(android.view.MotionEvent e){return (Boolean)ls.augment.com.hook.AugmentModule.invoke(this,"onInterceptTouchEventScroll",new Class<?>[]{android.view.MotionEvent.class},e);}
 public boolean native_onInterceptTouchEventScroll(android.view.MotionEvent e){return isScrollingEnabled();}}
''',
BASE+'stack/StackScrollAlgorithm.java':'''package com.android.systemui.statusbar.notification.stack;
import com.android.systemui.statusbar.notification.row.*;import android.view.*;import ls.augment.com.hook.AugmentModule;
public class StackScrollAlgorithm{
 public final ViewGroup mHostView;public int clamps;public float mKeyguardNotificationSpace=600;public boolean vendor=false,failChild;public static class StackScrollAlgorithmState{public java.util.ArrayList<ExpandableView> visibleChildren=new java.util.ArrayList<>();}
 public StackScrollAlgorithm(ViewGroup h){mHostView=h;}public void resetViewStates(AmbientState a,int speed){AugmentModule.invoke(this,"resetViewStates",new Class<?>[]{AmbientState.class,int.class},a,speed);}
 public void native_resetViewStates(AmbientState a,int speed){StackScrollAlgorithmState s=new StackScrollAlgorithmState();for(View v:mHostView.children){ExpandableView row=(ExpandableView)v;row.resetViewState();row.state.mYTranslation-=((NotificationStackScrollLayout)mHostView).mOwnScrollY;s.visibleChildren.add(row);}for(int i=0;i<s.visibleChildren.size();i++)updateChild(i,s,a);}
 public void updateViewWithShelf(ExpandableView v,ExpandableViewState s,float end){AugmentModule.invoke(this,"updateViewWithShelf",new Class<?>[]{ExpandableView.class,ExpandableViewState.class,float.class},v,s,end);}
 public void native_updateViewWithShelf(ExpandableView v,ExpandableViewState s,float end){clamps++;s.mYTranslation=Math.min(s.mYTranslation,end);}
 public void updateChild(int i,StackScrollAlgorithmState s,AmbientState a){AugmentModule.invoke(this,"updateChild",new Class<?>[]{int.class,StackScrollAlgorithmState.class,AmbientState.class},i,s,a);}
 public void native_updateChild(int i,StackScrollAlgorithmState s,AmbientState a){if(failChild)throw new IllegalStateException("native child failure");ExpandableView row=s.visibleChildren.get(i);if(vendor){if(a.keyguard&&row.state.mYTranslation+row.state.height>mKeyguardNotificationSpace)row.state.hidden=true;}else updateViewWithShelf(row,row.state,700);row.state.mYTranslation+=a.stackY;}
 public void updatePositionsForState(StackScrollAlgorithmState s,AmbientState a){}public void resetChildViewStates(){}}
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
  check(hooks==9,"installed");NotificationStackScrollLayout h=new NotificationStackScrollLayout();AmbientState a=new AmbientState();StackScrollAlgorithm alg=new SubAlgorithm(h);
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
  String lastLayout=FeatureSettings.reports.get("ls_augment_notification_cascade_last_layout_shade");
  check(lastLayout!=null&&lastLayout.contains("layout_state_only;surface=shade;observed_at=")&&lastLayout.contains(";row0={native_y=600.0")&&lastLayout.contains("clip_top=")&&lastLayout.contains("clip_bottom=")&&lastLayout.contains("view_height=")&&!lastLayout.contains(";row2="),"bounded privacy-filtered front layout evidence");
  a.expansion=.5f;alg.resetViewStates(a,0);near(tail.state.mYTranslation,700,"partial expansion native");
  check(lastLayout.equals(FeatureSettings.reports.get("ls_augment_notification_cascade_last_layout_shade")),"collapsed shade erased last expanded geometry");a.expansion=1;
  h.resources.configuration.orientation=2;alg.resetViewStates(a,0);near(tail.state.mYTranslation,700,"landscape default native");flag(NotificationAppearanceOptions.STACK_LANDSCAPE,true);alg.resetViewStates(a,0);check(tail.state.mScaleX<1,"landscape opt in");
  flag(SystemUiOptions.NOTIFICATION_STACK,false);tail.sx=tail.sy=.8f;alg.resetViewStates(a,0);near(tail.state.mScaleX,1,"disable restores native scale");check(tail.effect==null&&tail.py==50,"disable releases effects");near(tail.sx,1,"recycled view scale restored");near(tail.sy,1,"recycled view height scale restored");
  float lastScale=1,lastAlpha=1;for(int i=0;i<1000;i++){float y=600+i;NotificationCascadePolicy.Card c=NotificationCascadePolicy.project(y,100,700,600,1000,2,true);check(Float.isFinite(c.y)&&c.scale>0&&c.alpha>=0&&c.alpha<=1,"finite geometry");check(c.scale<=lastScale&&c.alpha<=lastAlpha,"monotonic depth");lastScale=c.scale;lastAlpha=c.alpha;}
  flag(SystemUiOptions.NOTIFICATION_STACK,true);flag(NotificationAppearanceOptions.STACK_GRADIENT,true);h.resources.configuration.orientation=1;alg.vendor=true;
  h.scrollRange=0;
  for(int percent:new int[]{40,52,61,70,90}){FeatureSettings.values.put(NotificationAppearanceOptions.STACK_START,""+percent);h.mOwnScrollY=0;alg.resetViewStates(a,0);int range=h.getScrollRange();check(range>=0,"nonnegative range");h.mOwnScrollY=range;alg.resetViewStates(a,0);near(tail.state.mScaleX,1,"tail reachable at "+percent);near(tail.state.alpha,1,"tail opaque at "+percent);check(!tail.state.hidden,"tail not lost at end");}
  tail.state.height=400;h.mOwnScrollY=0;alg.resetViewStates(a,0);h.mOwnScrollY=h.getScrollRange();alg.resetViewStates(a,0);near(tail.state.mScaleX,1,"tall tail full size");check(tail.state.mYTranslation+400<=952,"tall tail bottom reachable at high threshold");tail.state.height=100;
  flag(NotificationAppearanceOptions.STACK_LOCK,true);h.mOwnScrollY=0;a.keyguard=true;a.stackY=150;h.nativeScrolling=false;alg.resetViewStates(a,0);
  check(h.getScrollRange()>0&&secret.state.hidden,"geometrically clipped tail retained in scroll extent; privacy kept");near(alg.mKeyguardNotificationSpace,600,"lock capacity restored");
  check(h.getScrollRange()>0,"lock tail reachable");check(!h.isScrollingEnabled(),"no global lock scroll bypass");
  check(!h.onInterceptTouchEventScroll(new android.view.MotionEvent(0,10,10)),"blank lock gesture stays native");
  check(h.onInterceptTouchEventScroll(new android.view.MotionEvent(0,10,front.state.mYTranslation+5)),"row gesture uses native scroller");
  check(h.onScrollTouch(new android.view.MotionEvent(2,10,400)),"captured row drag scrolls");h.onScrollTouch(new android.view.MotionEvent(3,10,400));check(!h.isScrollingEnabled(),"cancel releases scroll override");
  android.view.ViewGroup parent=new android.view.ViewGroup();parent.addView(h);
  h.fromParent(new android.view.MotionEvent(0,10,front.state.mYTranslation+5));check(parent.disallow,"row DOWN retains gesture before keyguard parent intercepts MOVE");
  check(h.fromParent(new android.view.MotionEvent(2,10,400))&&h.moves==1,"native scroller receives MOVE instead of unlock parent");
  h.fromParent(new android.view.MotionEvent(1,10,400));check(h.upEnabled&&!parent.disallow&&!h.isScrollingEnabled(),"nested UP keeps native fling enabled until dispatch completes and releases parent");
  h.fromParent(new android.view.MotionEvent(0,10,10));check(!parent.disallow&&!h.fromParent(new android.view.MotionEvent(2,10,40)),"blank lock screen keeps native unlock gesture");
  h.fromParent(new android.view.MotionEvent(0,10,front.state.mYTranslation+5));h.fromParent(new android.view.MotionEvent(3,10,400));check(!parent.disallow&&!h.isScrollingEnabled(),"CANCEL releases dispatch ownership");
  h.mOwnScrollY=h.getScrollRange();alg.resetViewStates(a,0);near(tail.state.mScaleX,1,"lock tail full at end");
  h.mOwnScrollY=680;alg.resetViewStates(a,0);check(front.state.clipTopAmount==80,"scrolled lock row is clipped below clock");
  h.mOwnScrollY=0;alg.resetViewStates(a,0);check(front.state.clipTopAmount==0,"scroll back restores native clipping");
  // First (unscaled) rows need their own clip ownership; they never enter the
  // projection/blur map. The real OEM may retain a nonzero native baseline too.
  front.resetTopClip=false;front.state.clipTopAmount=7;h.mOwnScrollY=680;alg.resetViewStates(a,0);check(front.state.clipTopAmount==80,"lock adds clipping above existing native seven pixels");
  h.mOwnScrollY=640;alg.resetViewStates(a,0);check(front.state.clipTopAmount==40,"scrolling down decreases owned clipping instead of accumulating maximum");
  a.keyguard=false;a.stackY=0;h.mOwnScrollY=0;alg.resetViewStates(a,0);check(front.state.clipTopAmount==7,"lock-to-shade restores only owned clipping");
  a.keyguard=true;a.stackY=150;h.mOwnScrollY=680;alg.resetViewStates(a,0);flag(SystemUiOptions.NOTIFICATION_STACK,false);alg.resetViewStates(a,0);check(front.state.clipTopAmount==7,"master off restores first unscaled row");flag(SystemUiOptions.NOTIFICATION_STACK,true);
  h.mOwnScrollY=680;alg.resetViewStates(a,0);flag(NotificationAppearanceOptions.STACK_LOCK,false);alg.resetViewStates(a,0);check(front.state.clipTopAmount==7,"lock surface off restores first row");flag(NotificationAppearanceOptions.STACK_LOCK,true);
  h.mOwnScrollY=680;alg.resetViewStates(a,0);front.state.clipTopAmount=23;h.mOwnScrollY=0;alg.resetViewStates(a,0);check(front.state.clipTopAmount==23,"new OEM clip takes ownership");
  front.state.clipTopAmount=7;h.mOwnScrollY=680;alg.resetViewStates(a,0);front.setClipTopAmount(front.state.clipTopAmount);h.detach();check(front.state.clipTopAmount==7&&front.getClipTopAmount()==7,"detach restores owned state and matching rendered clip");
  h.attached=true;h.mOwnScrollY=680;alg.resetViewStates(a,0);front.setClipTopAmount(31);h.detach();check(front.state.clipTopAmount==7&&front.getClipTopAmount()==31,"detach preserves externally changed rendered clip");
  h.attached=true;front.state.clipTopAmount=0;h.mOwnScrollY=0;alg.resetViewStates(a,0);
  check(FeatureSettings.reports.containsKey("ls_augment_notification_cascade_runtime_shade")&&FeatureSettings.reports.containsKey("ls_augment_notification_cascade_runtime_lock"),"independent evidence");
  alg.failChild=true;try{alg.resetViewStates(a,0);throw new AssertionError("native failure propagated");}catch(RuntimeException expected){}near(alg.mKeyguardNotificationSpace,600,"capacity restored on throw");alg.failChild=false;
  flag(SystemUiOptions.NOTIFICATION_STACK,false);alg.resetViewStates(a,0);check(h.getScrollRange()==0&&h.mOwnScrollY==0,"disable restores native range and position");alg.resetViewStates(a,0);check(tail.state.hidden,"native lock capacity restored");
  check(m.errors==0,"no runtime errors");System.out.println("cascade checks="+n);}}
''',
'ls/augment/com/hook/TestWake.java':'''package ls.augment.com.hook;
public class TestWake{
 static class Legacy{int calls;private void onStartedWakingUp(){calls++;}}static class Child extends Legacy{}
 static class Wrong{public boolean onStartedWakingUp(){throw new AssertionError();}}static class Broken{public void onStartedWakingUp(){throw new IllegalStateException("native failure");}}
 static void check(boolean x){if(!x)throw new AssertionError();}
 static class Visibility {boolean mAODVisibility,mIsDynamicIslandEnable,mPayJoyControlled;int mCurRotation,calls;void setAODVisibility(boolean x){throw new AssertionError("must not fabricate AOD state");}private void updateRooterVisibility(){calls++;}}
 static class OldChild extends Visibility{}
 static class Interactive extends Visibility {boolean mInteractive;}
 static class WrongInteractive extends Visibility {String mInteractive;}
 static class BadFields extends Visibility {String mAODVisibility;}
 static class MissingFields {void updateRooterVisibility(){throw new AssertionError();}}
 static class ThrowingVisibility extends Visibility {private void updateRooterVisibility(){throw new IllegalStateException();}}
 public static void main(String[] args)throws Exception{Child manager=new Child();Legacy permanent=new Legacy();check("manager".equals(NativeIslandWake.synchronize(manager,permanent)));check(manager.calls==1&&permanent.calls==0);
 check("permanent".equals(NativeIslandWake.synchronize(new Object(),permanent)));check(permanent.calls==1);NativeIslandWake.synchronize(new Wrong(),permanent);check(permanent.calls==2);
 try{NativeIslandWake.synchronize(new Object(),new Object());throw new AssertionError();}catch(NoSuchMethodException expected){}
 try{NativeIslandWake.synchronize(new Broken(),permanent);throw new AssertionError();}catch(java.lang.reflect.InvocationTargetException expected){}check(permanent.calls==2);
 OldChild old=new OldChild();old.mAODVisibility=true;old.mPayJoyControlled=true;old.mCurRotation=3;check("permanent_visibility".equals(NativeIslandWake.synchronize(new Object(),old)));check(old.calls==1&&old.mAODVisibility&&old.mPayJoyControlled&&old.mCurRotation==3);
 check("manager".equals(NativeIslandWake.synchronize(manager,old))&&old.calls==1);
 try{NativeIslandWake.synchronize(new Wrong(),old);throw new AssertionError();}catch(NoSuchMethodException expected){}check(old.calls==1);
 for(Object unsupported:new Object[]{new Interactive(),new WrongInteractive(),new BadFields(),new MissingFields()})try{NativeIslandWake.synchronize(new Object(),unsupported);throw new AssertionError();}catch(NoSuchMethodException expected){}
 try{NativeIslandWake.synchronize(new Broken(),old);throw new AssertionError();}catch(java.lang.reflect.InvocationTargetException expected){}check(old.calls==1);
 try{NativeIslandWake.synchronize(new Object(),new ThrowingVisibility());throw new AssertionError();}catch(java.lang.reflect.InvocationTargetException expected){}
 System.out.println("native wake manager/permanent/legacy AOD/inherited/type mismatch/missing/error checks passed");}}
'''
})

for variant in ['legacy','modern','missing','missing_clip','wrong_clip_type']:
    current=dict(files)
    if variant=='modern':
        k=BASE+'stack/ExpandableViewState.java';current[k]=current[k].replace('setAlpha(float a)','setAlpha(float a,String why)')
        # NX819J's native resetViewState and algorithm.updateClipping leave
        # clipTopAmount untouched. The old double hid ownership leaks by zeroing it.
        k=BASE+'row/ExpandableView.java';current[k]=current[k].replace('resetTopClip=true','resetTopClip=false')
        k=BASE+'row/ExpandableNotificationRow.java';current[k]=current[k].replace('isUserLocked','isUserSwipingToExpandRow')
        k=BASE+'stack/NotificationStackScrollLayout.java';current[k]=current[k].replace('public boolean native_onScrollTouch', '''public boolean offerScrollTouchToScroller(android.view.MotionEvent e){return (Boolean)ls.augment.com.hook.AugmentModule.invoke(this,"offerScrollTouchToScroller",new Class<?>[]{android.view.MotionEvent.class},e);}public boolean native_offerScrollTouchToScroller(android.view.MotionEvent e){return isScrollingEnabled();}public boolean native_onScrollTouch''')
        k='ls/augment/com/hook/TestCascade.java';current[k]=current[k].replace('hooks==9','hooks==10').replace('h.onScrollTouch(', 'h.offerScrollTouchToScroller(')
    if variant=='missing':
        k=BASE+'stack/ExpandableViewState.java';current[k]=current[k].replace('setAlpha','unrelatedAlpha')
    if variant=='missing_clip':
        k=BASE+'row/ExpandableView.java';current[k]=current[k].replace('setClipTopAmount','unrelatedTopClip')
        k='ls/augment/com/hook/TestCascade.java';current[k]=current[k].replace('setClipTopAmount','unrelatedTopClip')
    if variant=='wrong_clip_type':
        k=BASE+'row/ExpandableView.java';current[k]=current[k].replace('int getClipTopAmount()','float getClipTopAmount()')
    with tempfile.TemporaryDirectory(prefix='duo-cascade-') as folder:
        work=Path(folder);paths=[]
        for name,source in current.items():
            p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf-8');paths.append(p)
        paths += [SRC/name for name in ['EnhancementOption.java','NotificationAppearanceOptions.java','NotificationCascadePolicy.java','hook/NotificationCascadeHook.java','hook/NotificationStackGate.java','hook/NativeIslandWake.java']]
        subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*map(str,paths)],check=True)
        subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestCascade',*(['missing'] if variant in ['missing','missing_clip','wrong_clip_type'] else [])],check=True)
        if variant=='legacy':subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestWake'],check=True)
