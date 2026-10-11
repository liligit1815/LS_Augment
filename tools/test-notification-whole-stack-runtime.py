"""Execute the actual whole-notification-list hook against the verified ROM method contract.

The fixture owns native list order/scroll/row state, rather than copying the new
stack projection. Physical dispatch, animations and ROM layout still need device QA.
"""
from pathlib import Path
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
tree = ast.parse((ROOT / 'tools/test-notification-media-card-runtime.py').read_text(encoding='utf-8'))
base = next(ast.literal_eval(node.value) for node in tree.body if isinstance(node, ast.Assign)
            and any(isinstance(name, ast.Name) and name.id == 'FILES' for name in node.targets))
files = {name: base[name] for name in ['android/content/Context.java', 'android/os/Looper.java', 'android/os/Handler.java',
    'io/github/libxposed/api/XposedInterface.java', 'ls/augment/com/hook/AugmentModule.java']}
files.update({
'android/util/Log.java': 'package android.util;public class Log{public static String getStackTraceString(Throwable e){return e.toString();}}',
'ls/augment/com/hook/LiftArcLog.java': 'package ls.augment.com.hook;final class LiftArcLog{static boolean e(String message,Throwable error){return true;}static void w(String message,Throwable error){}}',
'android/util/DisplayMetrics.java': 'package android.util;public class DisplayMetrics{public float density=1;}',
'android/content/res/Configuration.java': 'package android.content.res;public class Configuration{public static final int ORIENTATION_LANDSCAPE=2;public int orientation=1;}',
'android/content/res/Resources.java': '''package android.content.res;public class Resources{
 public final Configuration configuration=new Configuration();public Configuration getConfiguration(){return configuration;}
 public final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}}''',
'android/view/View.java': '''package android.view;public class View{
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public int visibility=VISIBLE,width=400,height=100;public float scaleX=1,x;
 public boolean attached=true;final android.content.Context context=new android.content.Context();final android.content.res.Resources resources=new android.content.res.Resources();
 final java.util.List<OnAttachStateChangeListener> listeners=new java.util.ArrayList<>();
 public android.content.Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}
 public int getVisibility(){return visibility;}public void setVisibility(int v){visibility=v;}public int getWidth(){return width;}public int getHeight(){return height;}
 public void setScaleX(float s){scaleX=s;}public float getScaleX(){return scaleX;}public float getTranslationX(){return x;}
 public boolean isAttachedToWindow(){return attached;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener listener){listeners.add(listener);}
 public void detach(){attached=false;for(OnAttachStateChangeListener l:listeners)l.onViewDetachedFromWindow(this);}}
''',
'android/view/ViewGroup.java': 'package android.view;public class ViewGroup extends View{public int getPaddingBottom(){return 0;}}',
'ls/augment/com/SystemUiOptions.java': 'package ls.augment.com;public class SystemUiOptions{public static final String NOTIFICATION_STACK="stack";}',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;public class FeatureSettings{
 public static final java.util.Map<String,String> values=new java.util.HashMap<>();public static final java.util.List<Runnable> listeners=new java.util.ArrayList<>();
 public static boolean enabled(android.content.Context c,String key){return "1".equals(values.get(key));}
 public static int integer(android.content.Context c,String key,int fallback,int min,int max){return values.containsKey(key)?Integer.parseInt(values.get(key)):fallback;}
 public static android.content.Context from(Object value){return new android.content.Context();}
 public static boolean addSnapshotListener(android.content.Context c,Runnable r){listeners.add(r);return true;}
 public static void removeSnapshotListener(Runnable r){listeners.remove(r);}public static void diagnostic(android.content.Context c,String k,String v){}
 public static void change(String key,String value){values.put(key,value);for(Runnable r:new java.util.ArrayList<>(listeners))r.run();android.os.Handler.drain();}}
''',
'com/android/systemui/statusbar/notification/stack/AmbientState.java': '''package com.android.systemui.statusbar.notification.stack;public class AmbientState{
 public int mStatusBarState,mScrollY;public float mStackY=100;public boolean mDozing,mShowingStackOnLockscreen,mClearAllInProgress,mExpansionChanging,mShadeExpanded=true;}
''',
'com/android/systemui/scene/shared/flag/SceneContainerFlag.java': 'package com.android.systemui.scene.shared.flag;public class SceneContainerFlag{public static boolean enabled;public static boolean isEnabled(){return enabled;}}',
'com/android/systemui/statusbar/notification/stack/ExpandableViewState.java': '''package com.android.systemui.statusbar.notification.stack;public class ExpandableViewState{
 public int height=100,clipTopAmount,clipBottomAmount;public boolean hidden;public float mScaleX=1,mZTranslation,y,alpha=1;
 public float getYTranslation(){return y;}public float getAlpha(){return alpha;}public void setYTranslation(float v){y=v;}public void setAlpha(float v){alpha=v;}
 public void setScaleX(float v){mScaleX=v;}public void setZTranslation(float v){mZTranslation=v;}}
''',
'com/android/systemui/statusbar/notification/row/ExpandableNotificationRow.java': '''package com.android.systemui.statusbar.notification.row;
 public class ExpandableNotificationRow extends android.view.View{
 public final com.android.systemui.statusbar.notification.stack.ExpandableViewState state=new com.android.systemui.statusbar.notification.stack.ExpandableViewState();
 public final String identity;public int nativeClicks,expandedChildren,nativeSwipes,appliedClipTop,appliedClipBottom,mMinimumHeightForClipping,nativeBottomBeforeReset;public Integer nextNativeBottom=0;public boolean mClipToActualHeight=true,clipAllowed=true;public boolean userLocked,userExpanded,groupExpanded,groupRoot,summary,systemExpanded,nativeHidden,guts,animating,groupChanging,pinned,away,removed;
 public ExpandableNotificationRow(String id){identity=id;}public com.android.systemui.statusbar.notification.stack.ExpandableViewState getViewState(){return state;}
 public int getIntrinsicHeight(){return height;}public boolean shouldClipToActualHeight(){return clipAllowed&&!animating;}
 public int getClipTopAmount(){return appliedClipTop;}public int getClipBottomAmount(){return appliedClipBottom;}
 public void setClipTopAmount(int value){appliedClipTop=value;}public void setClipBottomAmount(int value){appliedClipBottom=value;}
 public float drawnTop(){return state.y+appliedClipTop;}public float drawnBottom(){return state.y+Math.max(mMinimumHeightForClipping,Math.max(appliedClipTop,height-appliedClipBottom));}
 public boolean nativeHit(float y,boolean requireMinimum){float top=state.y+Math.max(0,appliedClipTop),bottom=state.y+height-appliedClipBottom;return getVisibility()==VISIBLE&&(!requireMinimum||bottom-top>=40*getResources().getDisplayMetrics().density)&&y>=top&&y<=bottom;}public boolean isUserExpanded(){return userExpanded;}public boolean isUserLocked(){return userLocked;}public boolean areGutsExposed(){return guts;}
 public boolean isGroupExpanded(){return groupExpanded;}public boolean isGroupRoot(){return groupRoot;}public boolean isSummaryWithChildren(){return summary;}public boolean isSystemExpanded(){return systemExpanded;}
 public boolean isExpandAnimationRunning(){return animating;}public boolean isGroupExpansionChanging(){return groupChanging;}
 public boolean isPinned(){return pinned;}public boolean isHeadsUpAnimatingAway(){return away;}public boolean isRemoved(){return removed;}
 public void nativeClick(){nativeClicks++;}public void nativeGroupExpand(){expandedChildren++;}public void nativeSwipe(){nativeSwipes++;}}
''',
'com/android/systemui/statusbar/notification/stack/StackScrollAlgorithm.java': '''package com.android.systemui.statusbar.notification.stack;
 import java.util.*;import com.android.systemui.statusbar.notification.row.ExpandableNotificationRow;import ls.augment.com.hook.AugmentModule;
 public class StackScrollAlgorithm{
 public final android.view.ViewGroup mHostView;public final StackScrollAlgorithmState mTempAlgorithmState=new StackScrollAlgorithmState();public float mPaddingBetweenElements=8;
 public static class StackScrollAlgorithmState{public final ArrayList<ExpandableNotificationRow> visibleChildren=new ArrayList<>();public float mCurrentExpandedYPosition;}
 public StackScrollAlgorithm(android.view.ViewGroup host){mHostView=host;}
 public void resetViewStates(AmbientState ambient,int speed){AugmentModule.invoke(this,"resetViewStates",new Class<?>[]{AmbientState.class,int.class},ambient,speed);}
 public void native_resetViewStates(AmbientState ambient,int speed){float y=ambient.mStackY-ambient.mScrollY;
  for(ExpandableNotificationRow row:mTempAlgorithmState.visibleChildren){ExpandableViewState state=row.state;
   // Actual RedMagic resetViewState does not clear clipTopAmount; updateClipping only resets bottom.
   row.nativeBottomBeforeReset=state.clipBottomAmount;if(row.nextNativeBottom!=null)state.clipBottomAmount=row.nextNativeBottom;
   state.y=y;state.height=row.getIntrinsicHeight();state.hidden=row.nativeHidden||y+state.height<ambient.mStackY;state.alpha=1;state.mScaleX=row.getScaleX();state.mZTranslation=0;y+=state.height+mPaddingBetweenElements;}
  mTempAlgorithmState.mCurrentExpandedYPosition=y-ambient.mStackY+((NotificationStackScrollLayout)mHostView).footerHeight;}
 }
''',
'com/android/systemui/statusbar/notification/stack/NotificationStackScrollLayout.java': '''package com.android.systemui.statusbar.notification.stack;
 import com.android.systemui.statusbar.notification.row.ExpandableNotificationRow;import ls.augment.com.hook.AugmentModule;
 public class NotificationStackScrollLayout extends android.view.ViewGroup{
 public final AmbientState ambient=new AmbientState(),mAmbientState=ambient;public final StackScrollAlgorithm algorithm=new StackScrollAlgorithm(this);
 public int nativePasses,footerHeight,nativeMinimumRange,scrollabilityUpdates,clamps;public boolean mScrollable,mExpandingNotification;
 public NotificationStackScrollLayout(){height=1000;}
 public void onLayout(boolean changed,int l,int t,int r,int b){AugmentModule.invoke(this,"onLayout",new Class<?>[]{boolean.class,int.class,int.class,int.class,int.class},changed,l,t,r,b);}
 public void native_onLayout(boolean changed,int l,int t,int r,int b){}
 public int getScrollRange(){return ((Number)AugmentModule.invoke(this,"getScrollRange",new Class<?>[]{})).intValue();}
 public int native_getScrollRange(){if(com.android.systemui.scene.shared.flag.SceneContainerFlag.enabled)return 0;
  int content=100+footerHeight;for(ExpandableNotificationRow row:algorithm.mTempAlgorithmState.visibleChildren)content+=row.getIntrinsicHeight()+8;
  return Math.max(nativeMinimumRange,Math.max(0,content-height));}
 public void updateScrollability(){scrollabilityUpdates++;mScrollable=getScrollRange()>0;}
 public void clampScrollPosition(){clamps++;if(!ambient.mClearAllInProgress&&ambient.mScrollY>getScrollRange()){ambient.mScrollY=getScrollRange();requestChildrenUpdate();}}
 public void nativeScrollTo(int y){ambient.mScrollY=Math.max(0,Math.min(y,getScrollRange()));requestChildrenUpdate();android.os.Handler.drain();}
 public void updateChildren(){requestChildrenUpdate();}
 public void requestChildrenUpdate(){nativePasses++;algorithm.resetViewStates(ambient,0);for(ExpandableNotificationRow row:algorithm.mTempAlgorithmState.visibleChildren){row.setScaleX(row.state.mScaleX);row.appliedClipTop=row.state.clipTopAmount;row.appliedClipBottom=row.state.clipBottomAmount;row.setVisibility(row.state.hidden?INVISIBLE:VISIBLE);}}
 }
''',
'ls/augment/com/hook/TestNotificationWholeStack.java': '''package ls.augment.com.hook;
 import ls.augment.com.*;import com.android.systemui.statusbar.notification.stack.*;import com.android.systemui.statusbar.notification.row.*;
 public class TestNotificationWholeStack{
 static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static NotificationStackScrollLayout fresh(int count){NotificationStackScrollLayout host=new NotificationStackScrollLayout();for(int i=0;i<count;i++)host.algorithm.mTempAlgorithmState.visibleChildren.add(new ExpandableNotificationRow("review"+i));host.requestChildrenUpdate();android.os.Handler.drain();return host;}
 static void nativeRows(NotificationStackScrollLayout host,String message){float y=host.ambient.mStackY-host.ambient.mScrollY;for(ExpandableNotificationRow row:host.algorithm.mTempAlgorithmState.visibleChildren){check(Math.abs(row.state.y-y)<.01f&&Math.abs(row.getScaleX()-1)<.01f&&row.state.hidden==(row.nativeHidden||y+row.height<host.ambient.mStackY),message);check(row.appliedClipBottom==row.state.clipBottomAmount&&(row.nextNativeBottom==null||row.appliedClipBottom==row.nextNativeBottom),message+" restores native bottom in actual view");y+=row.height+8;}}
 public static void main(String[] args)throws Exception{AugmentModule module=new AugmentModule();AugmentModule.active=module;
 check(NotificationStackHook.install(module,TestNotificationWholeStack.class.getClassLoader())==3,"real signatures resolve and install");
 NotificationStackScrollLayout host=new NotificationStackScrollLayout();for(int i=0;i<8;i++)host.algorithm.mTempAlgorithmState.visibleChildren.add(new ExpandableNotificationRow("id"+i));
 host.requestChildrenUpdate();nativeRows(host,"disabled keeps native state");int passes=host.nativePasses;
 FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");check(host.nativePasses==passes+1,"snapshot change asks native list to recompute without gesture");
 check(host.native_getScrollRange()==0&&host.getScrollRange()>0&&host.mScrollable,"short native list acquires a real scroll range and cached scrollability");
 check(host.algorithm.mTempAlgorithmState.visibleChildren.get(2).state.clipBottomAmount>0,"third native notification forms a tail");
 check(host.algorithm.mTempAlgorithmState.visibleChildren.get(7).state.hidden,"deep row has no interactive hidden body");
 for(int i=0;i<8;i++){ExpandableNotificationRow row=host.algorithm.mTempAlgorithmState.visibleChildren.get(i);check(row.identity.equals("id"+i),"notification order remains native");}
 ExpandableNotificationRow first=host.algorithm.mTempAlgorithmState.visibleChildren.get(0);first.nativeClick();first.nativeGroupExpand();first.nativeSwipe();
 check(first.nativeClicks==1&&first.expandedChildren==1&&first.nativeSwipes==1,"native callbacks are untouched");
 int stableRange=host.getScrollRange();host.nativeScrollTo(216);ExpandableNotificationRow third=host.algorithm.mTempAlgorithmState.visibleChildren.get(2);
 check(third.state.clipTopAmount==0&&!third.state.hidden&&third.getScaleX()==1,"scroll releases the next original row as a full notification");
 check(third.appliedClipTop==0&&third.appliedClipBottom==0,"native applyToView receives restored clip; unfolded notification text is not a blank tail");
 check(host.getScrollRange()==stableRange,"native-hidden first rows do not shift the stack boundary or shorten the range");
 int readingScroll=host.ambient.mScrollY;third.userExpanded=true;third.height=380;host.requestChildrenUpdate();android.os.Handler.drain();
 check(third.state.clipTopAmount==0&&third.appliedClipTop==0&&third.appliedClipBottom==0&&third.state.y==100,"finished explicit expansion preserves full title and body, instead of turning into a tail");
 check(host.ambient.mScrollY==readingScroll,"expanded reading area does not clamp scroll backwards");
 ExpandableNotificationRow following=host.algorithm.mTempAlgorithmState.visibleChildren.get(3);
 check(following.state.y+following.appliedClipTop>=third.state.y+third.height,"following folded card cannot cover expanded content");
 third.height=1100;host.requestChildrenUpdate();android.os.Handler.drain();nativeRows(host,"oversize expanded notification uses native reading flow");
 check(third.appliedClipTop==0,"oversize expanded notification retains native clipping");
 third.userExpanded=false;third.height=100;host.requestChildrenUpdate();android.os.Handler.drain();
 check(following.appliedClipTop==0&&host.algorithm.mTempAlgorithmState.visibleChildren.get(4).appliedClipBottom>0,"collapse returns to configured complete row count");
 FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");nativeRows(host,"hot disable restores scale and native geometry");
 for(ExpandableNotificationRow row:host.algorithm.mTempAlgorithmState.visibleChildren)check(row.appliedClipTop==0&&row.appliedClipBottom==0,"disable clears every owned tail clip including deeper offscreen rows");
 check(host.getScrollRange()==0&&!host.mScrollable&&host.ambient.mScrollY==0,"disable restores native range, cached scrollability and clamps old stack-only scroll");
 FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");host.ambient.mStatusBarState=1;host.requestChildrenUpdate();nativeRows(host,"keyguard native");
 host.ambient.mStatusBarState=0;host.ambient.mDozing=true;host.requestChildrenUpdate();nativeRows(host,"dozing native");host.ambient.mDozing=false;
 host.ambient.mClearAllInProgress=true;host.requestChildrenUpdate();nativeRows(host,"clear-all native animation targets");host.ambient.mClearAllInProgress=false;
 host.ambient.mExpansionChanging=true;host.requestChildrenUpdate();check(host.algorithm.mTempAlgorithmState.visibleChildren.get(2).appliedClipBottom>0,"panel expansion keeps tail stacked");host.ambient.mExpansionChanging=false;
 host.mExpandingNotification=true;host.requestChildrenUpdate();nativeRows(host,"individual notification expansion native");host.mExpandingNotification=false;
 first.userLocked=true;host.requestChildrenUpdate();nativeRows(host,"row expand gesture native");first.userLocked=false;
 first.x=30;host.requestChildrenUpdate();nativeRows(host,"side-swipe native");first.x=0;
 host.getResources().configuration.orientation=2;host.requestChildrenUpdate();nativeRows(host,"landscape default retains native");
 FeatureSettings.change(NotificationAppearanceOptions.STACK_LANDSCAPE,"1");check(host.algorithm.mTempAlgorithmState.visibleChildren.get(5).state.clipBottomAmount>0,"independent landscape stack opt-in works");
 int listeners=FeatureSettings.listeners.size();host.detach();check(FeatureSettings.listeners.size()==listeners-1,"detached list drops config observer");
 for(ExpandableNotificationRow row:host.algorithm.mTempAlgorithmState.visibleChildren)check(row.getScaleX()==1,"detach restores owned scale");
 NotificationStackScrollLayout mixed=new NotificationStackScrollLayout();
 for(int h:new int[]{240,84,172,112}){ExpandableNotificationRow row=new ExpandableNotificationRow("mixed"+h);row.height=h;mixed.algorithm.mTempAlgorithmState.visibleChildren.add(row);}
 FeatureSettings.values.put(NotificationAppearanceOptions.STACK_COUNT,"1");mixed.requestChildrenUpdate();android.os.Handler.drain();
 check(mixed.native_getScrollRange()==0&&mixed.getScrollRange()==400,"mixed-height four-row short list gets exact native-flow extent including gaps");
 int end=mixed.getScrollRange();mixed.nativeScrollTo(end);ExpandableNotificationRow last=mixed.algorithm.mTempAlgorithmState.visibleChildren.get(3);
 check(last.state.y>=100&&last.state.y+last.height<=340&&!last.state.hidden&&last.state.clipTopAmount==0&&last.getScaleX()==1,"last mixed-height row reaches full native content area through the native scroll method");
 check(last.appliedClipTop==0&&last.appliedClipBottom==0,"last mixed-height row really receives an unclipped body");
 mixed.nativeScrollTo(0);check(last.appliedClipBottom>0,"scroll back produces a tail again");mixed.nativeScrollTo(end);check(last.appliedClipTop==0&&last.appliedClipBottom==0,"repeated fold and unfold does not accumulate clipTop");
 check(mixed.getScrollRange()==end,"range remains stable at its last row");
 mixed.nativeScrollTo(100000);check(mixed.ambient.mScrollY==end,"native clamp cannot overscroll the compact extent");
 last.userLocked=true;mixed.requestChildrenUpdate();android.os.Handler.drain();nativeRows(mixed,"expanding a tail uses untouched native layout");
 check(mixed.getScrollRange()==end&&mixed.ambient.mScrollY==end,"temporary native expand does not jump the scroll position");last.userLocked=false;
 mixed.footerHeight=56;mixed.requestChildrenUpdate();android.os.Handler.drain();
 check(mixed.getScrollRange()==end+56,"native footer extent remains reachable");mixed.nativeScrollTo(mixed.getScrollRange());
 check(mixed.algorithm.mTempAlgorithmState.mCurrentExpandedYPosition+mixed.ambient.mStackY<=340,"full flow footer reaches the compact boundary");
 mixed.nativeMinimumRange=900;check(mixed.getScrollRange()==900,"existing larger OEM or IME range is never reduced");mixed.nativeMinimumRange=0;
 mixed.ambient.mStatusBarState=1;check(mixed.getScrollRange()==0,"lockscreen does not expose a stale compact range before layout");mixed.requestChildrenUpdate();android.os.Handler.drain();
 check(mixed.ambient.mScrollY==0&&!mixed.mScrollable,"lockscreen clears stack-only position through native clamp");mixed.ambient.mStatusBarState=0;
 mixed.requestChildrenUpdate();android.os.Handler.drain();mixed.nativeScrollTo(100);
 FeatureSettings.change(NotificationAppearanceOptions.STACK_COUNT,"6");
 check(mixed.getScrollRange()==0&&mixed.ambient.mScrollY==0,"count covering all rows restores original non-scrollable list");
 FeatureSettings.change(NotificationAppearanceOptions.STACK_COUNT,"1");
 com.android.systemui.scene.shared.flag.SceneContainerFlag.enabled=true;check(mixed.getScrollRange()==0,"new scene-container path stays native");mixed.requestChildrenUpdate();android.os.Handler.drain();nativeRows(mixed,"new scene path has no projection");
 com.android.systemui.scene.shared.flag.SceneContainerFlag.enabled=false;mixed.requestChildrenUpdate();android.os.Handler.drain();
 mixed.nativeScrollTo(0);last.state.clipTopAmount=17;
 FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");check(last.appliedClipTop==17,"a newer externally-owned clip is not overwritten during restore");
 FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");mixed.nativeScrollTo(end);
 check(last.appliedClipTop==17,"native nonzero top clip survives fold/unfold, not assumed zero");
 mixed.getResources().configuration.orientation=2;FeatureSettings.change(NotificationAppearanceOptions.STACK_LANDSCAPE,"0");check(mixed.getScrollRange()==0,"orientation opt-out removes compact range");
 mixed.detach();
 FeatureSettings.values.put(SystemUiOptions.NOTIFICATION_STACK,"1");FeatureSettings.values.put(NotificationAppearanceOptions.STACK_COUNT,"1");
 NotificationStackScrollLayout grouped=fresh(8);grouped.nativeScrollTo(216);
 ExpandableNotificationRow group=grouped.algorithm.mTempAlgorithmState.visibleChildren.get(2),afterGroup=grouped.algorithm.mTempAlgorithmState.visibleChildren.get(3);
 group.summary=true;group.groupExpanded=true;group.height=380;grouped.requestChildrenUpdate();android.os.Handler.drain();
 check(!group.userExpanded&&group.appliedClipTop==0&&group.state.y==100,"completed legacy group expansion stays readable without mUserExpanded");
 check(afterGroup.state.y+afterGroup.appliedClipTop>=group.state.y+group.height,"following tail cannot cover expanded group children");
 check(grouped.ambient.mScrollY==216,"group reading area does not clamp scroll backwards");
 int groupRange=grouped.getScrollRange();grouped.nativeScrollTo(224);
 check(grouped.getScrollRange()==groupRange&&group.appliedClipTop==0,"expanded reading border can move without changing the compact scroll range");grouped.nativeScrollTo(216);
 group.summary=false;group.groupRoot=true;grouped.requestChildrenUpdate();android.os.Handler.drain();
 check(group.appliedClipTop==0,"modern group root also uses its real group-expanded state");
 group.height=1100;grouped.requestChildrenUpdate();android.os.Handler.drain();nativeRows(grouped,"oversize expanded group uses native reading flow");
 check(group.appliedClipTop==0&&group.appliedClipBottom==0&&afterGroup.appliedClipTop==0&&afterGroup.appliedClipBottom==0&&grouped.ambient.mScrollY==216,"oversize group restores all clips without losing scroll position");
 group.groupExpanded=false;group.height=100;grouped.requestChildrenUpdate();android.os.Handler.drain();
 check(afterGroup.appliedClipBottom>0,"finished group collapse restores configured compact list");
 group.groupRoot=false;group.groupExpanded=true;group.height=380;grouped.requestChildrenUpdate();android.os.Handler.drain();
 check(group.appliedClipBottom>0,"a non-root child reporting its group's expansion cannot unlock the full reading area");
 // A newer native top clip is still respected when an expanded row leaves the projection.
 group.groupRoot=true;group.state.clipTopAmount=17;grouped.requestChildrenUpdate();android.os.Handler.drain();
 check(group.appliedClipTop==17,"expanded reading keeps a newer native nonzero clip instead of forcing zero");
 group.groupExpanded=false;group.height=100;grouped.requestChildrenUpdate();android.os.Handler.drain();
 group.groupExpanded=true;group.height=380;grouped.requestChildrenUpdate();android.os.Handler.drain();
 check(group.appliedClipTop==17,"native nonzero clip survives group collapse and re-expansion");grouped.detach();
 NotificationStackScrollLayout hidden=fresh(6);ExpandableNotificationRow protectedRow=hidden.algorithm.mTempAlgorithmState.visibleChildren.get(1);
 protectedRow.userExpanded=true;protectedRow.nativeHidden=true;hidden.requestChildrenUpdate();android.os.Handler.drain();
 check(protectedRow.state.hidden&&protectedRow.state.y==208&&protectedRow.appliedClipTop==0,"native-hidden expanded row is neither revealed nor projected");
 check(hidden.algorithm.mTempAlgorithmState.visibleChildren.get(2).state.clipBottomAmount>0,"native-hidden expansion cannot enlarge another row's reading boundary");hidden.detach();
 NotificationStackScrollLayout offscreen=fresh(12);ExpandableNotificationRow remote=offscreen.algorithm.mTempAlgorithmState.visibleChildren.get(10);
 remote.userExpanded=true;remote.height=380;offscreen.requestChildrenUpdate();android.os.Handler.drain();
 check(offscreen.algorithm.mTempAlgorithmState.visibleChildren.get(1).appliedClipBottom>0,"expanded row below physical reading viewport cannot disable visible stacking");offscreen.detach();
 NotificationStackScrollLayout automatic=new NotificationStackScrollLayout();automatic.height=360;automatic.getResources().configuration.orientation=2;
 FeatureSettings.values.put(NotificationAppearanceOptions.STACK_LANDSCAPE,"1");
 for(int i=0;i<6;i++)automatic.algorithm.mTempAlgorithmState.visibleChildren.add(new ExpandableNotificationRow("auto"+i));
 ExpandableNotificationRow autoFirst=automatic.algorithm.mTempAlgorithmState.visibleChildren.get(0),autoTail=automatic.algorithm.mTempAlgorithmState.visibleChildren.get(1);
 autoFirst.height=240;autoFirst.systemExpanded=true;automatic.requestChildrenUpdate();android.os.Handler.drain();
 check(!autoFirst.userExpanded&&autoFirst.state.y==100&&autoFirst.appliedClipTop==0,"automatic full card in a small viewport keeps its native title and body");
 nativeRows(automatic,"oversize automatic full card temporarily uses native reading geometry");
 int autoRange=automatic.getScrollRange();automatic.nativeScrollTo(8);
 check(autoFirst.appliedClipTop==0&&automatic.getScrollRange()==autoRange&&automatic.ambient.mScrollY==8,"automatic reading preserves stable compact range while scrolling");
 automatic.nativeScrollTo(0);autoFirst.height=100;automatic.requestChildrenUpdate();android.os.Handler.drain();
 check(autoTail.appliedClipBottom>0,"automatic expanded flag alone cannot permanently disable stacking after height shrinks");
 autoTail.height=240;autoTail.systemExpanded=true;automatic.requestChildrenUpdate();android.os.Handler.drain();
 check(autoTail.appliedClipBottom>0,"automatic tall tail outside configured full rows cannot unlock native reading");
 automatic.nativeScrollTo(16);check(autoTail.appliedClipBottom>0,"automatic tail crossing the compact border still does not claim a configured full-row slot");automatic.nativeScrollTo(0);
 autoFirst.height=240;autoFirst.nativeHidden=true;automatic.requestChildrenUpdate();android.os.Handler.drain();
 check(autoFirst.state.hidden&&automatic.algorithm.mTempAlgorithmState.visibleChildren.get(2).appliedClipBottom>0,"native-hidden automatic full card cannot unlock native reading");automatic.detach();
 // Stable measured B-stack crossing: 210px card, gap26, border1642, visible [1528,1654].
 NotificationStackScrollLayout measured=new NotificationStackScrollLayout();measured.height=2600;measured.getResources().getDisplayMetrics().density=3.25f;measured.ambient.mStackY=1043;measured.algorithm.mPaddingBetweenElements=26;
 ExpandableNotificationRow anchorRow=new ExpandableNotificationRow("anchor"),middle=new ExpandableNotificationRow("middle"),crossing=new ExpandableNotificationRow("crossing"),deep=new ExpandableNotificationRow("deep");
 anchorRow.height=599;middle.height=210;crossing.height=210;deep.height=210;for(ExpandableNotificationRow row:new ExpandableNotificationRow[]{anchorRow,middle,crossing,deep}){row.width=1092;row.getResources().getDisplayMetrics().density=3.25f;}
 measured.algorithm.mTempAlgorithmState.visibleChildren.add(anchorRow);measured.algorithm.mTempAlgorithmState.visibleChildren.add(middle);measured.algorithm.mTempAlgorithmState.visibleChildren.add(crossing);measured.algorithm.mTempAlgorithmState.visibleChildren.add(deep);
 FeatureSettings.values.put(NotificationAppearanceOptions.STACK_STEP,"8");FeatureSettings.values.put(NotificationAppearanceOptions.STACK_INSET,"6");
 measured.requestChildrenUpdate();android.os.Handler.drain();measured.nativeScrollTo(364);
 check(Math.abs(crossing.state.y-1527.8983f)<.02f&&crossing.appliedClipTop==0&&crossing.appliedClipBottom==84,"measured stable crossing reveals title prefix instead of bottom suffix");
 check(Math.abs(crossing.drawnBottom()-1653.8983f)<.02f,"measured bottom edge remains at the original visible border");
 check(crossing.nativeHit(1550,false)&&!crossing.nativeHit(1510,false)&&!crossing.nativeHit(1670,false),"native touch sees only the unchanged visible prefix rectangle");
 check(!crossing.nativeHit(1550,true),"126px partial card stays below original 40dp native interaction minimum; scrolling is distinct from clicking");
 check(crossing.state.y+35>=crossing.drawnTop()&&crossing.state.y+70<=crossing.drawnBottom(),"original-size title band remains wholly inside stable crossing");
 check(crossing.appliedClipBottom==crossing.nativeBottomBeforeReset+84,"first prefix captures fresh native bottom rather than accumulating old projection");
 int measuredRange=measured.getScrollRange();for(int repeat=0;repeat<8;repeat++)measured.requestChildrenUpdate();
 check(crossing.appliedClipBottom==84&&crossing.nativeBottomBeforeReset==0&&measured.getScrollRange()==measuredRange,"repeated stationary native passes restore before recomputing with stable range");
 // Preserve real bottom values; detached or configuration restore must never guess zero.
 crossing.nextNativeBottom=9;measured.requestChildrenUpdate();check(crossing.appliedClipBottom==93&&crossing.appliedClipTop==0,"nonzero native bottom is added to prefix reveal clipping");
 crossing.nextNativeBottom=null;FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");check(crossing.appliedClipBottom==9&&crossing.nativeBottomBeforeReset==9,"hot disable restores the actual captured native bottom");
 FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");measured.nativeScrollTo(364);crossing.state.clipBottomAmount=13;
 FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");check(crossing.appliedClipBottom==13&&crossing.nativeBottomBeforeReset==13,"newer external bottom state survives disable restoration");
 FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");measured.nativeScrollTo(364);crossing.state.clipTopAmount=17;crossing.nextNativeBottom=9;measured.requestChildrenUpdate();
 check(crossing.appliedClipTop==17&&crossing.appliedClipBottom==76,"both native clips preserve their origin while revealing the prefix");
 check(Math.abs(crossing.drawnTop()-1527.8983f)<.02f&&Math.abs(crossing.drawnBottom()-1644.8983f)<.02f,"nonzero native clips retain original visible edge coordinates");
 // An unsupported later row must not leave earlier rows partially projected.
 crossing.state.clipTopAmount=0;crossing.nextNativeBottom=0;deep.mMinimumHeightForClipping=200;measured.requestChildrenUpdate();
 check(crossing.state.y==1540&&crossing.appliedClipBottom==0&&crossing.getScaleX()==1&&deep.appliedClipBottom==0,"native minimum clip height refuses the whole pass before any partial writes");
 check(deep.mMinimumHeightForClipping==200&&measured.getScrollRange()==measuredRange,"native clip lower bound and compact range are not rewritten by fallback");
 deep.mMinimumHeightForClipping=0;crossing.mClipToActualHeight=false;measured.requestChildrenUpdate();
 check(crossing.state.y==1540&&crossing.appliedClipBottom==0,"native clip disabled cannot draw outside a synthetic hit rectangle");crossing.mClipToActualHeight=true;
 crossing.clipAllowed=false;measured.requestChildrenUpdate();check(crossing.appliedClipBottom==0&&crossing.state.y==1540,"row-specific native clip exemption also stays native");crossing.clipAllowed=true;
 crossing.nextNativeBottom=250;measured.requestChildrenUpdate();check(crossing.state.y==1540,"invalid native clipping cannot produce wrapped projection geometry");crossing.nextNativeBottom=Integer.MAX_VALUE;measured.requestChildrenUpdate();check(crossing.state.y==1540&&crossing.state.clipBottomAmount==Integer.MAX_VALUE,"out-of-range native clip refuses before signed overflow");crossing.nextNativeBottom=9;
 measured.requestChildrenUpdate();check(crossing.appliedClipBottom==93,"normal clipping resumes after native animation constraints end");
 measured.detach();check(crossing.state.clipBottomAmount==9&&crossing.appliedClipBottom==9,"detach restores owned state and live bottom clipping before reuse");
 NotificationStackScrollLayout changed=fresh(6);ExpandableNotificationRow changedRow=changed.algorithm.mTempAlgorithmState.visibleChildren.get(1);
 changedRow.state.clipBottomAmount=31;changedRow.appliedClipBottom=37;changed.detach();
 check(changedRow.state.clipBottomAmount==31&&changedRow.appliedClipBottom==37,"detach preserves newer external state and live bottom changes independently");
 NotificationStackScrollLayout liveChanged=fresh(6);ExpandableNotificationRow liveRow=liveChanged.algorithm.mTempAlgorithmState.visibleChildren.get(1);liveRow.appliedClipBottom=37;liveChanged.detach();
 check(liveRow.state.clipBottomAmount==0&&liveRow.appliedClipBottom==37,"detach restores owned target but does not overwrite a newer live bottom");
 NotificationStackScrollLayout pendingExternal=fresh(6);ExpandableNotificationRow pendingRow=pendingExternal.algorithm.mTempAlgorithmState.visibleChildren.get(1);
 int ownedLive=pendingRow.appliedClipBottom;check(ownedLive>0,"pending external target case begins with an actually owned live clip");pendingRow.state.clipBottomAmount=23;pendingExternal.detach();
 check(pendingRow.state.clipBottomAmount==23&&pendingRow.appliedClipBottom==23,"external target pending application receives still-owned live clip at detach, not stale native baseline");
 // Video 1111: three complete cards, no inset; a shade/QS drag must not unfold the entire tail.
 // Run the real registered hook on every native update, allowing the native anchor and scroll to move.
 FeatureSettings.values.put(NotificationAppearanceOptions.STACK_COUNT,"3");
 for(int orientation:new int[]{1,2})for(int step:new int[]{8,20})for(int inset:new int[]{0,6}){
  FeatureSettings.values.put(NotificationAppearanceOptions.STACK_STEP,String.valueOf(step));
  FeatureSettings.values.put(NotificationAppearanceOptions.STACK_INSET,String.valueOf(inset));
  NotificationStackScrollLayout drag=fresh(7);drag.getResources().configuration.orientation=orientation;drag.requestChildrenUpdate();android.os.Handler.drain();
  ExpandableNotificationRow tail=drag.algorithm.mTempAlgorithmState.visibleChildren.get(3);
  float tailOffset=tail.state.y-drag.ambient.mStackY,tailScale=tail.getScaleX();int tailClip=tail.appliedClipBottom,dragRange=drag.getScrollRange();
  check(tailClip==tail.height-step,"three full cards begin with only one tail step exposed");
  boolean[] phases={false,true,true,false,true,true,false,true,true,false};
  for(int frame=0;frame<phases.length;frame++){
   drag.ambient.mExpansionChanging=phases[frame];drag.ambient.mStackY=100+frame*3;drag.requestChildrenUpdate();android.os.Handler.drain();
   check(tail.appliedClipBottom==tailClip&&Math.abs(tail.getScaleX()-tailScale)<.01f&&!tail.state.hidden,"panel drag does not expose full tail or reset its scale");
   check(Math.abs(tail.state.y-drag.ambient.mStackY-tailOffset)<.01f&&drag.algorithm.mTempAlgorithmState.visibleChildren.get(0).state.y==drag.ambient.mStackY,"projection follows fresh native anchor instead of freezing row positions");
   check(drag.getScrollRange()==dragRange&&drag.mScrollable&&tail.nativeBottomBeforeReset==0&&drag.ambient.mExpansionChanging==phases[frame],"drag keeps scroll range, restores clips before recomputing and leaves OEM flags intact");
  }
  drag.ambient.mExpansionChanging=true;drag.nativeScrollTo(216);
  check(tail.appliedClipBottom==0&&!tail.state.hidden&&drag.ambient.mScrollY==216,"native scrolling during panel expansion still unfolds the next readable card");
  check(drag.algorithm.mTempAlgorithmState.visibleChildren.get(5).appliedClipBottom>0&&drag.getScrollRange()==dragRange,"scroll unfolds by position while deeper notifications stay stacked");
  drag.ambient.mClearAllInProgress=true;drag.requestChildrenUpdate();nativeRows(drag,"clear-all still owns geometry during a panel drag");
  check(drag.getScrollRange()==dragRange&&drag.ambient.mScrollY==216,"clear-all does not prematurely shrink compact scroll range");drag.ambient.mClearAllInProgress=false;
  drag.mExpandingNotification=true;drag.requestChildrenUpdate();nativeRows(drag,"single-card launch expansion still owns geometry during panel drag");drag.mExpandingNotification=false;
  ExpandableNotificationRow dragProtectedRow=drag.algorithm.mTempAlgorithmState.visibleChildren.get(2);
  for(String flag:new String[]{"userLocked","guts","animating","groupChanging","pinned","away","removed"}){
   java.lang.reflect.Field nativeFlag=ExpandableNotificationRow.class.getField(flag);nativeFlag.setBoolean(dragProtectedRow,true);drag.requestChildrenUpdate();
   nativeRows(drag,"native "+flag+" remains protected during panel drag");nativeFlag.setBoolean(dragProtectedRow,false);
  }
  dragProtectedRow.x=30;drag.requestChildrenUpdate();nativeRows(drag,"native side-swipe remains protected during panel drag");dragProtectedRow.x=0;
  drag.requestChildrenUpdate();check(drag.algorithm.mTempAlgorithmState.visibleChildren.get(5).appliedClipBottom>0,"stack resumes after individual native interactions, even while panel is moving");
  dragProtectedRow.userExpanded=true;dragProtectedRow.height=180;drag.requestChildrenUpdate();android.os.Handler.drain();
  check(dragProtectedRow.appliedClipTop==0&&dragProtectedRow.appliedClipBottom==0&&dragProtectedRow.state.y==drag.ambient.mStackY&&drag.ambient.mScrollY==216,"finished single-card expansion remains readable while the panel still moves");
  dragProtectedRow.userExpanded=false;dragProtectedRow.height=100;drag.requestChildrenUpdate();android.os.Handler.drain();
  check(drag.getScrollRange()==dragRange&&drag.algorithm.mTempAlgorithmState.visibleChildren.get(5).appliedClipBottom>0,"single-card collapse restores compact scrolling during panel drag");
  drag.ambient.mStatusBarState=1;drag.requestChildrenUpdate();nativeRows(drag,"panel flag cannot enable stacking on keyguard");
  drag.ambient.mStatusBarState=0;drag.ambient.mDozing=true;drag.requestChildrenUpdate();nativeRows(drag,"panel flag cannot enable stacking while dozing");drag.ambient.mDozing=false;
  drag.ambient.mShadeExpanded=false;drag.requestChildrenUpdate();nativeRows(drag,"collapsed shade remains native even with changing flag");drag.ambient.mShadeExpanded=true;
  com.android.systemui.scene.shared.flag.SceneContainerFlag.enabled=true;drag.requestChildrenUpdate();nativeRows(drag,"scene layout remains native even with changing flag");
  check(drag.getScrollRange()==0,"scene layout cannot expose compact range");com.android.systemui.scene.shared.flag.SceneContainerFlag.enabled=false;
  FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");nativeRows(drag,"hot disable during panel drag restores native clips and scale");
  check(drag.getScrollRange()==0&&!drag.mScrollable&&drag.ambient.mScrollY==0,"hot disable during drag restores native scrolling");
  drag.detach();FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");
 }
 check(module.errors==0,"no reflection or callback failures");System.out.println("Actual NotificationStackHook: "+checks+" checks passed; no device interaction");
 }}
'''
})
java = Path(r'C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
with tempfile.TemporaryDirectory(prefix='lsa-notification-stack-') as folder:
    work=Path(folder); paths=[]
    for name,code in files.items():
        path=work/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,encoding='utf-8');paths.append(path)
    paths += [SRC/name for name in ['EnhancementOption.java','NotificationAppearanceOptions.java','NotificationLayoutPolicy.java',
        'hook/SystemUiAdapter.java','hook/NotificationStackHook.java']]
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','--release','17','-d',folder,*map(str,paths)],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestNotificationWholeStack'],check=True,timeout=10)
