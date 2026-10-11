package ls.augment.com.hook;

import android.content.res.Configuration;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.NotificationAppearanceOptions;
import ls.augment.com.NotificationLayoutPolicy;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Projects the whole native list after the verified ZTE algorithm. Never replaces touch dispatch. */
final class NotificationStackHook {
    private static final String ALGORITHM="com.android.systemui.statusbar.notification.stack.StackScrollAlgorithm";
    private static final String HOST="com.android.systemui.statusbar.notification.stack.NotificationStackScrollLayout";
    private static final String ROW="com.android.systemui.statusbar.notification.row.ExpandableNotificationRow";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<ViewGroup,State> STATES=new WeakHashMap<>();
    private static Access access;
    private static final class Access {
        final Class<?> row;
        final Method state,y,alpha,sy,sa,sx,sz,intrinsic,sceneEnabled,userExpanded,systemExpanded,groupExpanded,groupRoot,summary,
                shouldClip,getClipTop,getClipBottom,setClipTop,setClipBottom;
        final Method[] changing;
        final Field host,algorithmState,visible,height,clip,clipBottom,minimumClipHeight,clipEnabled,hidden,scale,z,expandedEnd,ambient,stackY;
        Access(ClassLoader loader)throws ReflectiveOperationException {
            Class<?> algorithm=Class.forName(ALGORITHM,false,loader);
            row=Class.forName(ROW,false,loader);
            state=method(row,"getViewState");Class<?> viewState=state.getReturnType();
            y=method(viewState,"getYTranslation");alpha=method(viewState,"getAlpha");
            sy=method(viewState,"setYTranslation",float.class);sa=method(viewState,"setAlpha",float.class);
            sx=method(viewState,"setScaleX",float.class);sz=method(viewState,"setZTranslation",float.class);
            intrinsic=method(row,"getIntrinsicHeight");
            userExpanded=method(row,"isUserExpanded");
            systemExpanded=method(row,"isSystemExpanded");
            groupExpanded=method(row,"isGroupExpanded");groupRoot=method(row,"isGroupRoot");summary=method(row,"isSummaryWithChildren");
            height=member(viewState,"height");clip=member(viewState,"clipTopAmount");clipBottom=member(viewState,"clipBottomAmount");hidden=member(viewState,"hidden");
            minimumClipHeight=member(row,"mMinimumHeightForClipping");clipEnabled=member(row,"mClipToActualHeight");
            shouldClip=method(row,"shouldClipToActualHeight");
            getClipTop=method(row,"getClipTopAmount");getClipBottom=method(row,"getClipBottomAmount");
            setClipTop=method(row,"setClipTopAmount",int.class);setClipBottom=method(row,"setClipBottomAmount",int.class);
            scale=member(viewState,"mScaleX");z=member(viewState,"mZTranslation");
            host=member(algorithm,"mHostView");algorithmState=member(algorithm,"mTempAlgorithmState");
            visible=member(algorithmState.getType(),"visibleChildren");
            expandedEnd=member(algorithmState.getType(),"mCurrentExpandedYPosition");
            Class<?> layout=Class.forName(HOST,false,loader);
            ambient=member(layout,"mAmbientState");stackY=member(ambient.getType(),"mStackY");
            method(layout,"getScrollRange");method(layout,"updateScrollability");method(layout,"clampScrollPosition");
            sceneEnabled=method(Class.forName("com.android.systemui.scene.shared.flag.SceneContainerFlag",false,loader),"isEnabled");
            changing=new Method[]{method(row,"isUserLocked"),method(row,"areGutsExposed"),
                    method(row,"isExpandAnimationRunning"),method(row,"isGroupExpansionChanging"),
                    method(row,"isPinned"),method(row,"isHeadsUpAnimatingAway"),method(row,"isRemoved")};
            method(algorithm,"resetViewStates",Class.forName("com.android.systemui.statusbar.notification.stack.AmbientState",false,loader),int.class);
        }
    }
    private static Method method(Class<?> type,String name,Class<?>...params)throws ReflectiveOperationException {
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Method m=c.getDeclaredMethod(name,params);m.setAccessible(true);return m;}catch(NoSuchMethodException absent){}
        throw new NoSuchMethodException(type.getName()+"."+name);
    }
    private static Field member(Class<?> type,String name)throws ReflectiveOperationException {
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException absent){}
        throw new NoSuchFieldException(type.getName()+"."+name);
    }
    static int install(AugmentModule module,ClassLoader loader){
        try{access=new Access(loader);}catch(ReflectiveOperationException|LinkageError error){module.logFeatureError("NOTIFICATION_LIST_STACK_UNAVAILABLE",error);return 0;}
        int count=hookNamed(module,loader,"notification.whole_stack",ALGORITHM,"resetViewStates",2,
            (owner,args,result)->{State state=remember((ViewGroup)access.host.get(owner));state.restoreProjection();return PASS;},
            (owner,args,result)->{ViewGroup host=(ViewGroup)access.host.get(owner);apply(owner,args[0],host,remember(host));return PASS;});
        // A preference change schedules a native state pass even while the list is stationary.
        count+=hookNamed(module,loader,"notification.whole_stack",HOST,"onLayout",5,null,(owner,args,result)->{
            remember((ViewGroup)owner);return PASS;
        });
        count+=hookNamed(module,loader,"notification.whole_stack",HOST,"getScrollRange",0,null,(owner,args,result)->{
            ViewGroup host=(ViewGroup)owner;State state=STATES.get(host);
            return state==null?PASS:NotificationLayoutPolicy.scrollRange(((Number)result).intValue(),state.requiredScroll,
                    allowed(host,access.ambient.get(host)));
        });
        // This ROM uses private range calls in touch, fling, accessibility and cached scrollability.
        // Deoptimize the verified callers so an already-inlined original cannot still return zero.
        try{for(Method caller:Class.forName(HOST,false,loader).getDeclaredMethods()){
            switch(caller.getName()){
                case "updateChildren": case "-$$Nest$mgetScrollRange": case "springBack": case "animateScroll":
                case "clampScrollPosition": case "fling": case "onGenericMotionEvent":
                case "onInitializeAccessibilityEventInternal": case "onInterceptTouchEventScroll":
                case "onScrollTouch": case "performAccessibilityActionInternal": case "updateForcedScroll":
                case "updateImeInset": case "updateScrollability": module.deoptimize(caller);break;
                default: break;
            }
        }}
        catch(ReflectiveOperationException|RuntimeException error){module.logFeatureError("NOTIFICATION_LIST_STACK_CALLER",error);}
        module.logFeatureInfo("NOTIFICATION_LIST_STACK_READY native=ZTE.MfvStackScrollAlgorithm hooks="+count);
        return count;
    }
    private static State remember(ViewGroup host){
        State state=STATES.get(host);if(state==null){state=new State(host);STATES.put(host,state);}return state;
    }
    private static boolean allowed(ViewGroup host,Object ambient)throws ReflectiveOperationException {
        boolean enabled=FeatureSettings.enabled(host.getContext(),SystemUiOptions.NOTIFICATION_STACK);
        // Native scrolling asks for its range several times per gesture. A disabled
        // projection has no reason to inspect ambient state or the scene flag.
        if(!enabled)return false;
        boolean landscape=host.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;
        boolean shade=NotificationLayoutPolicy.shadeAllowed(number(ambient,"mStatusBarState",-1),yes(ambient,"mDozing"),
                yes(ambient,"mShowingStackOnLockscreen"),yes(ambient,"mShadeExpanded"));
        return enabled&&shade&&(!landscape||FeatureSettings.enabled(host.getContext(),NotificationAppearanceOptions.STACK_LANDSCAPE))
                &&!Boolean.TRUE.equals(access.sceneEnabled.invoke(null));
    }
    private static void apply(Object algorithm,Object ambient,ViewGroup host,State owner)throws ReflectiveOperationException {
        if(!allowed(host,ambient)){
            owner.range(0);owner.report(host,"native",0);return;
        }
        // mExpansionChanging belongs to the whole shade/QS transition, not a row gesture. Keep
        // projecting its fresh native geometry; yielding here unfolds every tail then refolds it.
        // Single-row expansion and dismissal still own geometry. Retain the last valid scroll
        // extent during those interactions so the list cannot jump under the finger.
        if(yes(ambient,"mClearAllInProgress")||yes(host,"mExpandingNotification")){
            owner.report(host,"native-interaction",0);return;
        }
        Object algorithmState=access.algorithmState.get(algorithm);
        Object list=access.visible.get(algorithmState);if(!(list instanceof List)){owner.range(0);return;}
        List<View> rows=new ArrayList<>();List<Object> states=new ArrayList<>();
        for(Object child:(List<?>)list){
            if(!access.row.isInstance(child))continue;
            View row=(View)child;Object state=access.state.invoke(row);
            // Native-hidden rows still occupy logical flow. Excluding them from the count/anchor
            // makes the boundary move as rows scroll offscreen and can strand the last notification.
            if(row.getVisibility()==View.GONE)continue;
            for(Method changing:access.changing)if(Boolean.TRUE.equals(changing.invoke(row))){owner.report(host,"native-interaction",0);return;}
            if(Math.abs(row.getTranslationX())>.5f){owner.report(host,"native-swipe",0);return;}
            rows.add(row);states.add(state);
        }
        int complete=FeatureSettings.integer(host.getContext(),NotificationAppearanceOptions.STACK_COUNT,2,1,6);
        if(rows.size()<=complete){owner.range(0);owner.report(host,"native-short-list",rows.size());return;}
        float density=host.getResources().getDisplayMetrics().density;
        float step=FeatureSettings.integer(host.getContext(),NotificationAppearanceOptions.STACK_STEP,8,4,20)*density;
        float inset=FeatureSettings.integer(host.getContext(),NotificationAppearanceOptions.STACK_INSET,6,0,16)*density;
        float gap=numeric(field(algorithm,"mPaddingBetweenElements"),8*density);
        float anchor=((Number)access.y.invoke(states.get(0))).floatValue()+Math.max(0,number(ambient,"mScrollY",0));
        float border=anchor;
        for(int i=0;i<Math.min(complete,rows.size());i++)border+=access.height.getInt(states.get(i))+(i==0?0:gap);
        border=Math.min(border,host.getHeight()-host.getPaddingBottom()-48*density-3*step);
        if(border<=anchor+48*density){owner.range(0);owner.report(host,"native-small-viewport",rows.size());return;}
        // Native content may fit the physical viewport yet exceed the compact full-row area. Give
        // the existing touch/fling/accessibility path enough range to unfold every native row.
        // The expanded-flow end includes section gaps and footer; shelf-clamped row Y does not.
        owner.range(NotificationLayoutPolicy.stackScrollRange(access.expandedEnd.getFloat(algorithmState),
                number(ambient,"mScrollY",0),access.stackY.getFloat(ambient),border));
        // A completed expansion must remain readable after the native animation
        // releases geometry ownership. Its extra height cannot turn the previously
        // complete notification into a clipped tail underneath its predecessor.
        // Keep the compact scroll range, so this temporary reading area does not
        // clamp the user's current scroll position backwards.
        float readingLimit=host.getHeight()-host.getPaddingBottom()-48*density-3*step;
        for(int i=0;i<rows.size();i++){
            Object state=states.get(i);
            if(access.hidden.getBoolean(state))continue;
            View row=rows.get(i);
            boolean reading=Boolean.TRUE.equals(access.userExpanded.invoke(row))
                    ||(Boolean.TRUE.equals(access.summary.invoke(row))||Boolean.TRUE.equals(access.groupRoot.invoke(row)))
                    &&Boolean.TRUE.equals(access.groupExpanded.invoke(row));
            float y=((Number)access.y.invoke(state)).floatValue();
            float bottom=y+access.height.getInt(state);
            if(bottom<=0||y>=readingLimit)continue;
            // A system-expanded card within the configured full rows can fit the native viewport
            // but exceed our reserved tail space (especially in landscape). Keep its title native.
            // An automatically expanded tail or offscreen card must not unlock the whole list.
            boolean automaticFull=i<complete&&y<border&&Boolean.TRUE.equals(access.systemExpanded.invoke(row));
            if(!reading&&!(automaticFull&&bottom>readingLimit))continue;
            if(bottom>readingLimit){owner.report(host,"native-expanded-reading",rows.size());return;}
            border=Math.max(border,bottom);
        }
        int crossing=-1;float firstDepth=0f;
        List<Projection> projections=new ArrayList<>();
        for(int i=0;i<rows.size();i++){
            View row=rows.get(i);Object state=states.get(i);int height=access.height.getInt(state);
            // Preserve native privacy, shelf and offscreen visibility decisions.
            if(access.hidden.getBoolean(state))continue;
            float y=((Number)access.y.invoke(state)).floatValue();
            if(y+height<=border)continue;
            if(crossing<0){crossing=i;firstDepth=NotificationLayoutPolicy.unit((y+height-border)/Math.max(1,height+gap));}
            float depth=firstDepth+i-crossing;
            int nativeClip=access.clip.getInt(state),nativeBottom=access.clipBottom.getInt(state);
            if(nativeClip<0||nativeBottom<0||(long)nativeClip+nativeBottom>height){
                owner.report(host,"native-clip-reading",rows.size());return;
            }
            NotificationLayoutPolicy.Row projected=NotificationLayoutPolicy.stacked(y,height,row.getWidth(),border,depth,step,inset,
                    nativeClip,nativeBottom,((Number)access.alpha.invoke(state)).floatValue());
            // Native updateClipping may deliberately enlarge its draw rectangle during an
            // expansion. Do not install a smaller hit rectangle while it draws outside it.
            // Check the complete pass before writing any row, preserving native animation flow.
            if(!projected.hidden&&(!access.clipEnabled.getBoolean(row)||!Boolean.TRUE.equals(access.shouldClip.invoke(row))
                    ||height-projected.clipBottom<Math.max(projected.clipTop,access.minimumClipHeight.getInt(row)))){
                owner.report(host,"native-clip-reading",rows.size());return;
            }
            projections.add(new Projection(row,state,projected,depth,nativeClip,nativeBottom,access.scale.getFloat(state)));
        }
        for(Projection projection:projections){
            View row=projection.row;Object state=projection.state;NotificationLayoutPolicy.Row projected=projection.value;
            owner.scales.put(row,projection.nativeScale);
            if(projected.clipTop!=projection.nativeTop||projected.clipBottom!=projection.nativeBottom)
                owner.clips.put(row,new Clip(state,projection.nativeTop,projected.clipTop,projection.nativeBottom,projected.clipBottom));
            access.sy.invoke(state,projected.y);access.sx.invoke(state,projection.nativeScale*projected.scaleX);
            access.sa.invoke(state,projected.alpha);access.clip.setInt(state,projected.clipTop);
            access.clipBottom.setInt(state,projected.clipBottom);
            access.hidden.setBoolean(state,projected.hidden);
            // Native hit testing uses both of these real clips and the original actual height.
            access.sz.invoke(state,access.z.getFloat(state)+(4f-Math.min(4f,projection.depth))*density);
        }
        owner.report(host,"whole-list",projections.size());
    }
    private static boolean yes(Object owner,String key){return Boolean.TRUE.equals(field(owner,key));}
    private static int number(Object owner,String key,int fallback){Object v=field(owner,key);return v instanceof Number?((Number)v).intValue():fallback;}
    private static float numeric(Object value,float fallback){return value instanceof Number?((Number)value).floatValue():fallback;}
    private static final class Clip {
        final Object state;final int nativeTop,appliedTop,nativeBottom,appliedBottom;
        Clip(Object state,int nativeTop,int appliedTop,int nativeBottom,int appliedBottom){
            this.state=state;this.nativeTop=nativeTop;this.appliedTop=appliedTop;this.nativeBottom=nativeBottom;this.appliedBottom=appliedBottom;
        }
    }
    private static final class Projection {
        final View row;final Object state;final NotificationLayoutPolicy.Row value;
        final float depth,nativeScale;final int nativeTop,nativeBottom;
        Projection(View row,Object state,NotificationLayoutPolicy.Row value,float depth,int nativeTop,int nativeBottom,float nativeScale){
            this.row=row;this.state=state;this.value=value;this.depth=depth;this.nativeTop=nativeTop;this.nativeBottom=nativeBottom;this.nativeScale=nativeScale;
        }
    }
    private static final class State implements View.OnAttachStateChangeListener {
        final WeakReference<ViewGroup> host;
        final Map<View,Float> scales=new WeakHashMap<>();
        final Map<View,Clip> clips=new WeakHashMap<>();
        final Runnable changed=()->MAIN.post(this::request);
        String lastReport="";boolean observing,rangeRefreshQueued;int requiredScroll;
        State(ViewGroup view){host=new WeakReference<>(view);view.addOnAttachStateChangeListener(this);if(view.isAttachedToWindow())onViewAttachedToWindow(view);}
        void restoreProjection(){restoreProjection(false);}
        void restoreProjection(boolean detached){
            for(Map.Entry<View,Float> entry:scales.entrySet())entry.getKey().setScaleX(entry.getValue());scales.clear();
            // This ROM's resetViewState leaves clip fields intact; its later updateClipping
            // normally recomputes the bottom. Return both owned targets before native code reads
            // them, so folding cannot become the next pass's native baseline or survive disable.
            // Restore only values we still own, before native algorithms run. Their applyToView
            // then updates the real clip normally; do not mutate live clipping during each reset.
            for(Map.Entry<View,Clip> entry:clips.entrySet())try{
                Clip clip=entry.getValue();View row=entry.getKey();
                if(clip.appliedTop!=clip.nativeTop){
                    int finalTop=access.clip.getInt(clip.state);
                    if(finalTop==clip.appliedTop){finalTop=clip.nativeTop;access.clip.setInt(clip.state,finalTop);}
                    if(detached&&((Number)access.getClipTop.invoke(row)).intValue()==clip.appliedTop)access.setClipTop.invoke(row,finalTop);
                }
                if(clip.appliedBottom!=clip.nativeBottom){
                    int finalBottom=access.clipBottom.getInt(clip.state);
                    if(finalBottom==clip.appliedBottom){finalBottom=clip.nativeBottom;access.clipBottom.setInt(clip.state,finalBottom);}
                    // A newer external target can be waiting for applyToView when detach occurs.
                    // Give an owned live clip to that target, not to the older captured baseline.
                    if(detached&&((Number)access.getClipBottom.invoke(row)).intValue()==clip.appliedBottom)access.setClipBottom.invoke(row,finalBottom);
                }
            }catch(ReflectiveOperationException error){ViewGroup view=host.get();if(view!=null)FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_stack_runtime_error",error.toString());}
            clips.clear();
        }
        void request(){ViewGroup view=host.get();if(view==null||!view.isAttachedToWindow())return;try{call(view,"requestChildrenUpdate");}catch(ReflectiveOperationException ignored){} }
        void range(int value){
            if(requiredScroll==value)return;requiredScroll=value;
            if(rangeRefreshQueued)return;rangeRefreshQueued=true;
            MAIN.post(()->{
                rangeRefreshQueued=false;ViewGroup view=host.get();if(view==null||!view.isAttachedToWindow())return;
                try{call(view,"updateScrollability");call(view,"clampScrollPosition");}
                catch(ReflectiveOperationException error){FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_stack_runtime_error",error.toString());}
            });
        }
        void report(View view,String stage,int count){String value="adapter=ZTE-native-list;stage="+stage+";rows="+count+";requiredScroll="+requiredScroll;
            if(!value.equals(lastReport)){lastReport=value;FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_stack_runtime",value);}}
        @Override public void onViewAttachedToWindow(View view){if(!observing){observing=FeatureSettings.addSnapshotListener(view.getContext(),changed);}}
        @Override public void onViewDetachedFromWindow(View view){restoreProjection(true);requiredScroll=0;if(observing)FeatureSettings.removeSnapshotListener(changed);observing=false;}
    }
}
