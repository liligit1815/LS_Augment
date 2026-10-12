"""Native list facade for offline grouped hook tests; renderer deliberately substituted."""

FILES = {
'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
 import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.HookHandle;
 public class AugmentModule{public static AugmentModule active;final Map<Method,Interceptor> hooks=new HashMap<>();int failAt=-1,built,removed,errors,deoptimized;
 interface Interceptor{Object run(Chain c)throws Throwable;}static class Chain{final Object target;final Method method;final Object[] args;Chain(Object t,Method m,Object[] a){target=t;method=m;args=a;}
 Object getThisObject(){return target;}Object getArg(int index){return args[index];}List<Object> getArgs(){return Arrays.asList(args);}Object proceed()throws Throwable{return proceed(args);}
 Object proceed(Object[] a)throws Throwable{try{return target.getClass().getMethod("native_"+method.getName(),method.getParameterTypes()).invoke(target,a);}catch(InvocationTargetException e){throw e.getCause();}}}
 class Builder{final Method method;Builder(Method m){method=m;}HookHandle intercept(Interceptor i){if(++built==failAt)throw new IllegalStateException("partial install");hooks.put(method,i);return ()->{hooks.remove(method);removed++;};}}
 Builder prepareFeatureHook(Method m,String id,boolean before){return new Builder(m);}void registerFeatureHook(HookHandle h){}void logFeatureInfo(String s){}
 void logFeatureError(String s,Throwable e){errors++;}void deoptimize(Method m){deoptimized++;}
 public static Object invoke(Object target,String name,Class<?>[] types,Object...args){try{Method m=target.getClass().getDeclaredMethod(name,types);Chain c=new Chain(target,m,args);Interceptor hook=active.hooks.get(m);return hook==null?c.proceed():hook.run(c);}catch(RuntimeException e){throw e;}catch(Throwable e){throw new RuntimeException(e);}}}
''',
'android/content/Context.java': 'package android.content;public class Context{public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}}',
'android/content/pm/PackageManager.java': 'package android.content.pm;public class PackageManager{public static class NameNotFoundException extends Exception{}public String getApplicationInfo(String pkg,int flags)throws NameNotFoundException{return pkg;}public CharSequence getApplicationLabel(String pkg){return pkg;}}',
'android/util/Log.java': 'package android.util;public class Log{public static String getStackTraceString(Throwable e){return e.toString();}}',
'ls/augment/com/hook/LiftArcLog.java': 'package ls.augment.com.hook;final class LiftArcLog{static boolean e(String message,Throwable error){return true;}static void w(String message,Throwable error){}}',
'android/util/DisplayMetrics.java': 'package android.util;public class DisplayMetrics{public float density=1;}',
'android/content/res/Configuration.java': 'package android.content.res;public class Configuration{public static final int ORIENTATION_LANDSCAPE=2;public int orientation=1;}',
'android/content/res/Resources.java': '''package android.content.res;public class Resources{
 public final Configuration configuration=new Configuration();public Configuration getConfiguration(){return configuration;}
 public final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}}
''',
'android/graphics/drawable/Drawable.java': 'package android.graphics.drawable;public class Drawable{}',
'android/os/Bundle.java': 'package android.os;public class Bundle{}',
'android/view/ViewParent.java': 'package android.view;public interface ViewParent{}',
'android/view/ViewConfiguration.java': '''package android.view;public class ViewConfiguration{
 public static ViewConfiguration get(android.content.Context context){return new ViewConfiguration();}public int getScaledTouchSlop(){return 8;}public static int getLongPressTimeout(){return 500;}}
''',
'android/view/MotionEvent.java': '''package android.view;public final class MotionEvent{
 public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5,ACTION_POINTER_UP=6;
 public int action,pointers=1,pointerId;public long downTime,eventTime;public float x,y;public boolean recycled;
 public final java.util.List<float[]> history=new java.util.ArrayList<>();public static int recycledCopies;
 public MotionEvent(long down,long when,int action,float x,float y){downTime=down;eventTime=when;this.action=action;this.x=x;this.y=y;}
 public static MotionEvent obtain(MotionEvent other){MotionEvent copy=new MotionEvent(other.downTime,other.eventTime,other.action,other.x,other.y);copy.pointers=other.pointers;copy.pointerId=other.pointerId;copy.history.addAll(other.history);return copy;}
 public static MotionEvent obtain(long down,long when,int action,float x,float y,int meta){return new MotionEvent(down,when,action,x,y);}
 public int getActionMasked(){return action&255;}public int getAction(){return action;}public void setAction(int value){action=value;}
 public int getPointerCount(){return pointers;}public int getPointerId(int index){return pointerId+index;}public int findPointerIndex(int id){return id==pointerId?0:-1;}public int getActionIndex(){return action>>8;}
 public long getDownTime(){return downTime;}public long getEventTime(){return eventTime;}public float getX(){return x;}public float getY(){return y;}public float getX(int index){return x;}public float getY(int index){return y;}
 public int getHistorySize(){return history.size();}public float getHistoricalX(int pos){return history.get(pos)[0];}public float getHistoricalY(int pos){return history.get(pos)[1];}
 public float getHistoricalX(int index,int pos){return history.get(pos)[0];}public float getHistoricalY(int index,int pos){return history.get(pos)[1];}
 public MotionEvent sample(float x,float y){history.add(new float[]{x,y});return this;}public void recycle(){recycled=true;recycledCopies++;}}
''',
'android/view/KeyEvent.java': '''package android.view;public final class KeyEvent{
 public static final int ACTION_DOWN=0,ACTION_UP=1,KEYCODE_DPAD_CENTER=23,KEYCODE_ENTER=66,KEYCODE_NUMPAD_ENTER=160;
 public boolean canceled;public int action,keyCode,repeat;public KeyEvent(int action,int keyCode){this.action=action;this.keyCode=keyCode;}
 public static boolean isConfirmKey(int key){return key==KEYCODE_DPAD_CENTER||key==KEYCODE_ENTER||key==KEYCODE_NUMPAD_ENTER;}
 public boolean isCanceled(){return canceled;}public int getAction(){return action;}public int getRepeatCount(){return repeat;}public int getKeyCode(){return keyCode;}}
''',
'android/view/accessibility/AccessibilityNodeInfo.java': '''package android.view.accessibility;public class AccessibilityNodeInfo{
 public static final int ACTION_CLICK=16,ACTION_LONG_CLICK=32,ACTION_EXPAND=262144;public boolean clickable;public CharSequence stateDescription,contentDescription;
 public final java.util.List<AccessibilityAction> actions=new java.util.ArrayList<>();public static final class AccessibilityAction{public final int id;public final CharSequence label;
 public static final AccessibilityAction ACTION_CLICK=new AccessibilityAction(16,null),ACTION_EXPAND=new AccessibilityAction(262144,null);public AccessibilityAction(int id,CharSequence label){this.id=id;this.label=label;}public int getId(){return id;}public CharSequence getLabel(){return label;}}
 public void addAction(AccessibilityAction action){actions.add(action);}public void addAction(int action){actions.add(new AccessibilityAction(action,null));}
 public boolean removeAction(AccessibilityAction action){return actions.removeIf(a->a.id==action.id);}public void setClickable(boolean value){clickable=value;}public void setStateDescription(CharSequence value){stateDescription=value;}
 public void setContentDescription(CharSequence value){contentDescription=value;}public CharSequence getStateDescription(){return stateDescription;}}
''',
'android/view/View.java': '''package android.view;public class View{
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public int visibility=VISIBLE,width=400,height=100,left,top;public float scaleX=1,x,y,z,alpha=1;
 public boolean attached=true,enabled=true;public ViewGroup parent;public Object tag;public ViewGroup.LayoutParams lp;
 final android.content.Context context=new android.content.Context();final android.content.res.Resources resources=new android.content.res.Resources();
 final java.util.List<OnAttachStateChangeListener> listeners=new java.util.ArrayList<>();
 public android.content.Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}
 public int getVisibility(){return visibility;}public void setVisibility(int v){visibility=v;}public int getWidth(){return width;}public int getHeight(){return height;}
 public int getLeft(){return left;}public int getTop(){return top;}public int getRight(){return left+width;}public int getBottom(){return top+height;}
 public void setScaleX(float s){scaleX=s;}public float getScaleX(){return scaleX;}public float getTranslationX(){return x;}
 public float getTranslationY(){return y;}public void setTranslationY(float v){y=v;}public float getTranslationZ(){return z;}public void setTranslationZ(float v){z=v;}
 public float getAlpha(){return alpha;}public void setAlpha(float v){alpha=v;}public ViewGroup getParent(){return parent;}
 public boolean isShown(){return attached&&visibility==VISIBLE&&alpha>0;}public boolean isEnabled(){return enabled;}public void setEnabled(boolean value){enabled=value;}
 public void setTag(Object v){tag=v;}public Object getTag(){return tag;}public void setLayoutParams(ViewGroup.LayoutParams v){lp=v;}public ViewGroup.LayoutParams getLayoutParams(){return lp;}
 public boolean isAttachedToWindow(){return attached;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener listener){listeners.add(listener);}
 public void detach(){attached=false;for(OnAttachStateChangeListener l:new java.util.ArrayList<>(listeners))l.onViewDetachedFromWindow(this);}
}
''',
'android/view/ViewGroup.java': '''package android.view;public class ViewGroup extends View implements ViewParent{
 public static class LayoutParams{public static final int MATCH_PARENT=-1,WRAP_CONTENT=-2;public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
 public final java.util.List<View> children=new java.util.ArrayList<>();public final Overlay overlay=new Overlay();
 public static class Overlay{public final java.util.List<android.graphics.drawable.Drawable> shapes=new java.util.ArrayList<>();public void add(android.graphics.drawable.Drawable d){shapes.add(d);}public void remove(android.graphics.drawable.Drawable d){shapes.remove(d);}}
 public int getPaddingBottom(){return 0;}public Overlay getOverlay(){return overlay;}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}
 public void addView(View v){children.add(v);v.parent=this;}public void addView(View v,int i){children.add(Math.max(0,Math.min(i,children.size())),v);v.parent=this;}
 public void addView(View v,LayoutParams p){v.lp=p;addView(v);}public void removeView(View v){children.remove(v);v.parent=null;}
}
''',
'android/service/notification/StatusBarNotification.java': '''package android.service.notification;public class StatusBarNotification{
 public final String key,pkg;public final int user;public long time;public StatusBarNotification(String k,String p,int u,long t){key=k;pkg=p;user=u;time=t;}
 public String getKey(){return key;}public String getPackageName(){return pkg;}public int getUserId(){return user;}public long getPostTime(){return time;}}
''',
'ls/augment/com/SystemUiOptions.java': 'package ls.augment.com;public class SystemUiOptions{public static final String NOTIFICATION_STACK="stack";}',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;public class FeatureSettings{
 public static final java.util.Map<String,String> values=new java.util.HashMap<>(),diagnostics=new java.util.HashMap<>();public static final java.util.List<Runnable> listeners=new java.util.ArrayList<>();
 public static boolean enabled(android.content.Context c,String key){return "1".equals(values.get(key));}
 public static int integer(android.content.Context c,String key,int fallback,int min,int max){return values.containsKey(key)?Integer.parseInt(values.get(key)):fallback;}
 public static android.content.Context from(Object value){return new android.content.Context();}
 public static boolean addSnapshotListener(android.content.Context c,Runnable r){listeners.add(r);return true;}
 public static void removeSnapshotListener(Runnable r){listeners.remove(r);}public static void diagnostic(android.content.Context c,String k,String v){diagnostics.put(k,v);}
 public static void change(String key,String value){values.put(key,value);for(Runnable r:new java.util.ArrayList<>(listeners))r.run();android.os.Handler.drain();}}
''',
'com/android/systemui/statusbar/notification/stack/AmbientState.java': '''package com.android.systemui.statusbar.notification.stack;public class AmbientState{
 public int mStatusBarState,mScrollY;public float mStackY=100,mExpansionFraction=1,stackEndHeight=1000,fractionToShade=1;public boolean mDozing,mShowingStackOnLockscreen,mClearAllInProgress,mExpansionChanging,mShadeExpanded=true;
 public SectionHeaderView shelf;public SectionProvider sectionProvider;public SectionHeaderView getShelf(){return shelf;}public float getStackEndHeight(){return stackEndHeight;}
 public float getFractionToShade(){return fractionToShade;}public boolean isOnKeyguard(){return mStatusBarState==1;}public SectionProvider getSectionProvider(){return sectionProvider;}}
''',
'com/android/systemui/statusbar/notification/stack/SectionProvider.java': 'package com.android.systemui.statusbar.notification.stack;public interface SectionProvider{boolean beginsSection(android.view.View first,android.view.View previous);}',
'com/zte/utils/SystemuiUtils.java': 'package com.zte.utils;public class SystemuiUtils{public static boolean sectionSupport=true;public static int sectionSupportQueries;public static boolean supportNotificationSection(){sectionSupportQueries++;return sectionSupport;}}',
'com/android/systemui/statusbar/notification/collection/PipelineEntry.java': '''package com.android.systemui.statusbar.notification.collection;public abstract class PipelineEntry{
 public PipelineEntry parent;public PipelineEntry getParent(){return parent;}public abstract NotificationEntry getRepresentativeEntry();}
''',
'com/android/systemui/statusbar/notification/collection/NotifPipeline.java': 'package com.android.systemui.statusbar.notification.collection;public class NotifPipeline{}',
'com/android/systemui/statusbar/notification/collection/listbuilder/pluggable/NotifSectioner.java': '''package com.android.systemui.statusbar.notification.collection.listbuilder.pluggable;
 public abstract class NotifSectioner{public abstract boolean isInSection(com.android.systemui.statusbar.notification.collection.PipelineEntry entry);}
''',
'com/android/systemui/statusbar/notification/collection/coordinator/RankingCoordinator.java': '''package com.android.systemui.statusbar.notification.collection.coordinator;
 import com.android.systemui.statusbar.notification.collection.*;import com.android.systemui.statusbar.notification.collection.listbuilder.pluggable.NotifSectioner;
 public class RankingCoordinator{
 public int attached,silentQueries,minimizedQueries;public boolean silentMissing,minimizedMissing;public RuntimeException attachFailure;
 public final NotifSectioner silent=new NotifSectioner(){public boolean isInSection(PipelineEntry raw){silentQueries++;NotificationEntry entry=raw.getRepresentativeEntry();return entry!=null&&entry.importance<3&&!entry.specialHighPriority&&!entry.highPriorityChild&&!entry.ambient;}};
 public final NotifSectioner minimized=new NotifSectioner(){public boolean isInSection(PipelineEntry raw){minimizedQueries++;NotificationEntry entry=raw.getRepresentativeEntry();return entry!=null&&entry.importance<3&&!entry.specialHighPriority&&!entry.highPriorityChild&&entry.ambient;}};
 public NotifSectioner getSilentSectioner(){return silentMissing?null:silent;}public NotifSectioner getMinimizedSectioner(){return minimizedMissing?null:minimized;}
 public void attach(NotifPipeline pipeline){ls.augment.com.hook.AugmentModule.invoke(this,"attach",new Class<?>[]{NotifPipeline.class},pipeline);}
 public void native_attach(NotifPipeline pipeline){attached++;if(attachFailure!=null)throw attachFailure;}}
''',
'com/android/systemui/scene/shared/flag/SceneContainerFlag.java': 'package com.android.systemui.scene.shared.flag;public class SceneContainerFlag{public static boolean enabled;public static boolean isEnabled(){return enabled;}}',
'com/android/systemui/statusbar/notification/stack/ExpandableViewState.java': '''package com.android.systemui.statusbar.notification.stack;public class ExpandableViewState{
 public int height=100,clipTopAmount,clipBottomAmount,notGoneIndex;public boolean hidden;public float mScaleX=1,mZTranslation,y,alpha=1;
 public float getYTranslation(){return y;}public float getAlpha(){return alpha;}public void setYTranslation(float v){y=v;}public void setAlpha(float v){alpha=v;}
 public void setScaleX(float v){mScaleX=v;}public void setZTranslation(float v){mZTranslation=v;}}
''',
'com/android/systemui/statusbar/notification/collection/NotificationEntry.java': '''package com.android.systemui.statusbar.notification.collection;public class NotificationEntry extends PipelineEntry{
 public final android.service.notification.StatusBarNotification sbn;public int bucket,importance;public boolean ambient,specialHighPriority,highPriorityChild;
 public NotificationEntry(String key,String app,int user,long time,boolean silent){sbn=new android.service.notification.StatusBarNotification(key,app,user,time);bucket=silent?6:5;importance=silent?2:3;}
 public android.service.notification.StatusBarNotification getSbn(){return sbn;}public int getBucket(){return bucket;}public NotificationEntry getRepresentativeEntry(){return this;}}
''',
'com/android/systemui/plugins/statusbar/NotificationMenuRowPlugin.java': 'package com.android.systemui.plugins.statusbar;public interface NotificationMenuRowPlugin{boolean isMenuVisible();}',
'com/android/systemui/statusbar/notification/row/ExpandableNotificationRow.java': '''package com.android.systemui.statusbar.notification.row;
 public class ExpandableNotificationRow extends android.view.ViewGroup{
 public final com.android.systemui.statusbar.notification.stack.ExpandableViewState state=new com.android.systemui.statusbar.notification.stack.ExpandableViewState();
 public final com.android.systemui.statusbar.notification.collection.NotificationEntry entry;
 public final java.util.List<ExpandableNotificationRow> children=new java.util.ArrayList<>();public final String identity;
 public FalsingManager mFalsingManager=new FalsingManager();public static class FalsingManager{public boolean falseTap;public int queries;public boolean isFalseTap(int type){queries++;return falseTap;}}
 public Menu menu;public int nativeMenuDismisses;public static class Menu implements com.android.systemui.plugins.statusbar.NotificationMenuRowPlugin{public boolean visible=true;public boolean isMenuVisible(){return visible;}}
 public com.android.systemui.plugins.statusbar.NotificationMenuRowPlugin getProvider(){return menu;}
 public int nativeClicks,expandedChildren,nativeSwipes,nativeLongPresses,nativeKeyCalls,nativeAccessibilityCalls,appliedClipTop,appliedClipBottom,mMinimumHeightForClipping,nativeBottomBeforeReset;public Integer nextNativeBottom=0;
 public float nativeAlpha=1,nativeZ=2,nativeScale=1;public boolean mClipToActualHeight=true,clipAllowed=true;
 public boolean userLocked,userExpanded,groupExpanded,groupRoot,summary,systemExpanded,nativeHidden,guts,animating,groupChanging,pinned,away,removed,mRemoved,nativeNodeClickable=true;
 public ExpandableNotificationRow(String id,String app,int user,boolean silent,long time){identity=id;entry=new com.android.systemui.statusbar.notification.collection.NotificationEntry(id,app,user,time,silent);}
 public int entryQueries;public com.android.systemui.statusbar.notification.collection.NotificationEntry getEntry(){entryQueries++;return entry;}public java.util.List<ExpandableNotificationRow> getAttachedChildren(){return children;}
 public com.android.systemui.statusbar.notification.stack.ExpandableViewState getViewState(){return state;}public int getIntrinsicHeight(){return height;}public int getActualHeight(){return height;}
 public boolean shouldClipToActualHeight(){return clipAllowed&&!animating;}public int getClipTopAmount(){return appliedClipTop;}public int getClipBottomAmount(){return appliedClipBottom;}
 public void setClipTopAmount(int value){appliedClipTop=value;}public void setClipBottomAmount(int value){appliedClipBottom=value;}
 public boolean isUserExpanded(){return userExpanded;}public boolean isUserLocked(){return userLocked;}public boolean areGutsExposed(){return guts;}
 public boolean isGroupExpanded(){return groupExpanded;}public boolean isGroupRoot(){return groupRoot;}public boolean isSummaryWithChildren(){return summary;}
 public boolean isSystemExpanded(){return systemExpanded;}public boolean isExpandAnimationRunning(){return animating;}public boolean isGroupExpansionChanging(){return groupChanging;}
 public boolean isPinned(){return pinned;}public boolean isHeadsUpAnimatingAway(){return away;}public boolean isRemoved(){return removed;}
 public void nativeClick(){nativeClicks++;}public void nativeGroupExpand(){expandedChildren++;}public void nativeSwipe(){nativeSwipes++;}
 public boolean onKeyUp(int keyCode,android.view.KeyEvent event){return Boolean.TRUE.equals(ls.augment.com.hook.AugmentModule.invoke(this,"onKeyUp",new Class<?>[]{int.class,android.view.KeyEvent.class},keyCode,event));}
 public boolean native_onKeyUp(int keyCode,android.view.KeyEvent event){nativeKeyCalls++;if(android.view.KeyEvent.isConfirmKey(keyCode)&&!event.isCanceled()){nativeClick();return true;}return false;}
 public boolean performAccessibilityActionInternal(int action,android.os.Bundle args){return Boolean.TRUE.equals(ls.augment.com.hook.AugmentModule.invoke(this,"performAccessibilityActionInternal",new Class<?>[]{int.class,android.os.Bundle.class},action,args));}
 public boolean native_performAccessibilityActionInternal(int action,android.os.Bundle args){nativeAccessibilityCalls++;if(action==16){nativeClick();return true;}if(action==262144){nativeGroupExpand();return true;}if(action==32){nativeLongPresses++;return true;}return false;}
 public void onInitializeAccessibilityNodeInfoInternal(android.view.accessibility.AccessibilityNodeInfo info){ls.augment.com.hook.AugmentModule.invoke(this,"onInitializeAccessibilityNodeInfoInternal",new Class<?>[]{android.view.accessibility.AccessibilityNodeInfo.class},info);}
 public void native_onInitializeAccessibilityNodeInfoInternal(android.view.accessibility.AccessibilityNodeInfo info){info.setClickable(nativeNodeClickable);info.addAction(16);info.setContentDescription(identity);}
 public boolean nativeHit(float touchY){return visibility==VISIBLE&&alpha>0&&touchY>=top+y+appliedClipTop&&touchY<=top+y+height-appliedClipBottom;}}
''',
'com/android/systemui/statusbar/notification/stack/SectionHeaderView.java': '''package com.android.systemui.statusbar.notification.stack;public class SectionHeaderView extends android.view.ViewGroup{
 public final ExpandableViewState state=new ExpandableViewState();public String title="";public boolean expanded,duo;public int count;
 public SectionHeaderView(){height=48;}public ExpandableViewState getViewState(){return state;}public int getIntrinsicHeight(){return height;}
 }
''',
'com/android/systemui/statusbar/notification/stack/NotificationSectionsManager.java': '''package com.android.systemui.statusbar.notification.stack;import android.view.View;import com.android.systemui.statusbar.notification.row.ExpandableNotificationRow;import ls.augment.com.hook.AugmentModule;
 public class NotificationSectionsManager implements SectionProvider{public int getBucket(View view){return ((Number)AugmentModule.invoke(this,"getBucket",new Class<?>[]{View.class},view)).intValue();}
 public int native_getBucket(View view){return view instanceof ExpandableNotificationRow?((ExpandableNotificationRow)view).entry.bucket:-1;}public boolean beginsSection(View first,View previous){return previous==null||getBucket(first)!=getBucket(previous);}}
''',
'ls/augment/com/hook/NotificationStackDecor.java': '''package ls.augment.com.hook;import android.view.*;import android.graphics.drawable.Drawable;import com.android.systemui.statusbar.notification.stack.SectionHeaderView;
 final class NotificationStackDecor{
 static ViewGroup create(ViewGroup host,String label){SectionHeaderView header=new SectionHeaderView();header.duo=true;header.title=label;return header;}
 static void bind(ViewGroup raw,String label){SectionHeaderView header=(SectionHeaderView)raw;header.title=label;}
 static Drawable backplate(View row){return new Drawable();}static void position(Drawable d,View row,int height){}}
''',
'com/android/systemui/statusbar/notification/stack/StackScrollAlgorithm.java': '''package com.android.systemui.statusbar.notification.stack;
 import java.util.*;import android.view.*;import com.android.systemui.statusbar.notification.row.ExpandableNotificationRow;import ls.augment.com.hook.AugmentModule;
 public class StackScrollAlgorithm{
 public final ViewGroup mHostView;public final StackScrollAlgorithmState mTempAlgorithmState=new StackScrollAlgorithmState();public float mPaddingBetweenElements=8,scrimPadding,sectionGap;
 public static class Adapt{public boolean shelfDisabled=true;public int queries;public boolean forceNotShowShelf(){queries++;return shelfDisabled;}}public final Adapt adapt=new Adapt();public Adapt getAdapt(){return adapt;}
 public static class StackScrollAlgorithmState{public final ArrayList<View> visibleChildren=new ArrayList<>();public View firstViewInShelf,nativeFirstViewInShelf;public float mCurrentYPosition,mCurrentExpandedYPosition;}
 public float getScrimTopPaddingOrZero(AmbientState ambient){return scrimPadding;}public float getGapForLocation(float fraction,boolean keyguard){return sectionGap;}
 public boolean childNeedsGapHeight(SectionProvider provider,int index,View child,View previous){return index>0&&provider!=null&&provider.beginsSection(child,previous);}
 public int getMaxAllowedChildHeight(View view){return view.height;}
 public StackScrollAlgorithm(ViewGroup host){mHostView=host;}
 public void initAlgorithmState(StackScrollAlgorithmState algorithmState,AmbientState ambient){AugmentModule.invoke(this,"initAlgorithmState",new Class<?>[]{StackScrollAlgorithmState.class,AmbientState.class},algorithmState,ambient);}
 public void native_initAlgorithmState(StackScrollAlgorithmState algorithmState,AmbientState ambient){algorithmState.visibleChildren.clear();for(View child:mHostView.children)if(child.getVisibility()!=View.GONE)algorithmState.visibleChildren.add(child);algorithmState.mCurrentYPosition=ambient.mStackY-ambient.mScrollY;algorithmState.mCurrentExpandedYPosition=-ambient.mScrollY;
  algorithmState.firstViewInShelf=null;float y=-ambient.mScrollY+scrimPadding;float threshold=ambient.shelf==null?Float.POSITIVE_INFINITY:ambient.stackEndHeight-ambient.shelf.getIntrinsicHeight()-mPaddingBetweenElements;View previous=null;
  for(int i=0;i<algorithmState.visibleChildren.size();i++){View child=algorithmState.visibleChildren.get(i);if(childNeedsGapHeight(ambient.sectionProvider,i,child,previous))y+=sectionGap;if(algorithmState.firstViewInShelf==null&&ambient.shelf!=null&&y>=threshold)algorithmState.firstViewInShelf=child;y+=getMaxAllowedChildHeight(child)+mPaddingBetweenElements;previous=child;}
  algorithmState.nativeFirstViewInShelf=algorithmState.firstViewInShelf;}
 public void updateChild(int index,StackScrollAlgorithmState algorithmState,AmbientState ambient){AugmentModule.invoke(this,"updateChild",new Class<?>[]{int.class,StackScrollAlgorithmState.class,AmbientState.class},index,algorithmState,ambient);}
 public void native_updateChild(int index,StackScrollAlgorithmState algorithmState,AmbientState ambient){View view=algorithmState.visibleChildren.get(index);ExpandableViewState state=state(view);state.y=algorithmState.mCurrentYPosition;
  mTempAlgorithmState.mCurrentYPosition+=state.height+mPaddingBetweenElements;mTempAlgorithmState.mCurrentExpandedYPosition+=state.height+mPaddingBetweenElements;}
 static ExpandableViewState state(View view){return view instanceof ExpandableNotificationRow?((ExpandableNotificationRow)view).state:((SectionHeaderView)view).state;}
 public void resetViewStates(AmbientState ambient,int speed){AugmentModule.invoke(this,"resetViewStates",new Class<?>[]{AmbientState.class,int.class},ambient,speed);}
 public void native_resetViewStates(AmbientState ambient,int speed){for(View view:mHostView.children){if(view.visibility==View.GONE)continue;ExpandableViewState state=state(view);state.height=view.height;state.hidden=false;state.alpha=1;state.mScaleX=1;state.mZTranslation=0;
  if(view instanceof ExpandableNotificationRow){ExpandableNotificationRow row=(ExpandableNotificationRow)view;row.nativeBottomBeforeReset=state.clipBottomAmount;if(row.nextNativeBottom!=null)state.clipBottomAmount=row.nextNativeBottom;state.hidden=row.nativeHidden;state.alpha=row.nativeAlpha;state.mScaleX=row.nativeScale;state.mZTranslation=row.nativeZ;}}
  initAlgorithmState(mTempAlgorithmState,ambient);for(int i=0;i<mTempAlgorithmState.visibleChildren.size();i++)updateChild(i,mTempAlgorithmState,ambient);mTempAlgorithmState.mCurrentExpandedYPosition+=((NotificationStackScrollLayout)mHostView).footerHeight;}
 }
''',
'com/android/systemui/statusbar/notification/stack/NotificationStackScrollLayout.java': '''package com.android.systemui.statusbar.notification.stack;
 import java.util.*;import android.view.*;import com.android.systemui.statusbar.notification.row.ExpandableNotificationRow;import ls.augment.com.hook.AugmentModule;
 public class NotificationStackScrollLayout extends ViewGroup{
 public final AmbientState ambient=new AmbientState(),mAmbientState=ambient;public final StackScrollAlgorithm algorithm=new StackScrollAlgorithm(this);public final NotificationSectionsManager mSectionsManager=new NotificationSectionsManager();
 public int nativePasses,footerHeight,nativeMinimumRange,scrollabilityUpdates,clamps,backendCalls,mContentHeight,mIntrinsicPadding,mBottomPadding;public boolean mScrollable,mIsBeingDragged,mOnlyScrollingInThisMotion,mExpandingNotification,mExpandedInThisMotion,takeDragOnDown;public RuntimeException backendFailure,dispatchFailure;
 public final FalsingManager mFalsingManager=new FalsingManager();public static class FalsingManager{public boolean falseTap;public int queries;public boolean isFalseTap(int type){queries++;return falseTap;}}
 public final java.util.List<Integer> nativeActions=new ArrayList<>();public android.view.MotionEvent lastNativeEvent;public View hitOverride;public ExpandableNotificationRow target;public long nativeDownTime;public float nativeDownX,nativeDownY;public boolean moved,multi;
 public View getChildAtPosition(float x,float y,boolean requireMinHeight,boolean ignoreDecor,boolean ignoreWidth){if(hitOverride!=null)return hitOverride;for(View v:algorithm.mTempAlgorithmState.visibleChildren)if(v instanceof ExpandableNotificationRow&&v.visibility==VISIBLE&&v.alpha>0&&(!ignoreWidth&&(x<v.left+v.x||x>v.left+v.x+v.width)?false:((ExpandableNotificationRow)v).nativeHit(y)))return v;return null;}
 public boolean dispatchTouchEvent(android.view.MotionEvent event){return Boolean.TRUE.equals(AugmentModule.invoke(this,"dispatchTouchEvent",new Class<?>[]{android.view.MotionEvent.class},event));}
 public boolean native_dispatchTouchEvent(android.view.MotionEvent event){nativeActions.add(event.getActionMasked());lastNativeEvent=event;if(dispatchFailure!=null)throw dispatchFailure;
  int action=event.getActionMasked();if(action==0){mIsBeingDragged=takeDragOnDown;mOnlyScrollingInThisMotion=false;mExpandingNotification=false;mExpandedInThisMotion=false;View v=getChildAtPosition(event.getX(),event.getY(),true,true,false);target=v instanceof ExpandableNotificationRow?(ExpandableNotificationRow)v:null;nativeDownTime=event.getDownTime();nativeDownX=event.getX();nativeDownY=event.getY();moved=false;multi=false;return true;}
  if(action==5||event.getPointerCount()>1)multi=true;if(action==2&&((event.getX()-nativeDownX)*(event.getX()-nativeDownX)+(event.getY()-nativeDownY)*(event.getY()-nativeDownY)>64))moved=true;
  if(action==3){target=null;return true;}if(action==1&&target!=null){if(target.menu!=null&&target.menu.visible){target.menu.visible=false;target.nativeMenuDismisses++;}else if(moved){if(Math.abs(event.getX()-nativeDownX)>Math.abs(event.getY()-nativeDownY))target.nativeSwipe();}else if(!multi&&!mIsBeingDragged&&!mOnlyScrollingInThisMotion&&!mExpandingNotification&&!mExpandedInThisMotion){if(event.getEventTime()-nativeDownTime>=500)target.nativeLongPresses++;else if(target.mFalsingManager==null||!target.mFalsingManager.falseTap)target.nativeClick();}target=null;}return true;}
 public NotificationStackScrollLayout(){height=1000;ambient.sectionProvider=mSectionsManager;}public static boolean matchesSelection(ExpandableNotificationRow row,int selection){return selection!=2||row.entry.bucket==6;}
 public void onLayout(boolean changed,int l,int t,int r,int b){AugmentModule.invoke(this,"onLayout",new Class<?>[]{boolean.class,int.class,int.class,int.class,int.class},changed,l,t,r,b);}public void native_onLayout(boolean changed,int l,int t,int r,int b){}
 public int getContentHeight(){return ((Number)AugmentModule.invoke(this,"getContentHeight",new Class<?>[]{})).intValue();}public int native_getContentHeight(){return (int)native_getIntrinsicContentHeight();}
 public float getIntrinsicContentHeight(){return ((Number)AugmentModule.invoke(this,"getIntrinsicContentHeight",new Class<?>[]{})).floatValue();}public float native_getIntrinsicContentHeight(){float h=footerHeight;for(View child:children)if(child.visibility!=View.GONE)h+=child.height+8;return h;}
 public void updateContentHeight(){mContentHeight=getContentHeight();}public int getScrollRange(){return Math.max(nativeMinimumRange,Math.max(0,mContentHeight-height));}
 public void updateScrollability(){scrollabilityUpdates++;mScrollable=getScrollRange()>0;}
 public void clampScrollPosition(){clamps++;if(!ambient.mClearAllInProgress&&ambient.mScrollY>getScrollRange())ambient.mScrollY=getScrollRange();}
 public void requestChildrenUpdate(){updateChildren();}public void updateChildren(){AugmentModule.invoke(this,"updateChildren",new Class<?>[]{});}
 public void native_updateChildren(){nativePasses++;algorithm.resetViewStates(ambient,0);for(View view:children){if(view.visibility==View.GONE)continue;ExpandableViewState state=StackScrollAlgorithm.state(view);view.y=state.y;view.z=state.mZTranslation;view.alpha=state.alpha;view.scaleX=state.mScaleX;view.visibility=state.hidden?INVISIBLE:VISIBLE;
  if(view instanceof ExpandableNotificationRow){ExpandableNotificationRow row=(ExpandableNotificationRow)view;row.appliedClipTop=state.clipTopAmount;row.appliedClipBottom=state.clipBottomAmount;}}}
 public List<ExpandableNotificationRow> getRowsToDismissInBackend(int selection){return (List<ExpandableNotificationRow>)AugmentModule.invoke(this,"getRowsToDismissInBackend",new Class<?>[]{int.class},selection);}
 public List<ExpandableNotificationRow> native_getRowsToDismissInBackend(int selection){backendCalls++;if(backendFailure!=null)throw backendFailure;List<ExpandableNotificationRow> targets=new ArrayList<>();for(View v:children)if(v instanceof ExpandableNotificationRow){ExpandableNotificationRow row=(ExpandableNotificationRow)v;if(!matchesSelection(row,selection))continue;targets.add(row);if(row.visibility==VISIBLE)targets.addAll(row.children);}return targets;}
 public void setIsExpanded(boolean value){AugmentModule.invoke(this,"setIsExpanded",new Class<?>[]{boolean.class},value);}public void native_setIsExpanded(boolean value){ambient.mShadeExpanded=value;}
 }
''',
}
