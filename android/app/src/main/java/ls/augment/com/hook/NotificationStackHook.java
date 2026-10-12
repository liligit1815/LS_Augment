package ls.augment.com.hook;

import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.service.notification.StatusBarNotification;
import android.view.View;
import android.view.ViewGroup;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityNodeInfo;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import ls.augment.com.NotificationAppearanceOptions;
import ls.augment.com.NotificationLayoutPolicy;
import ls.augment.com.NotificationStackPolicy;
import ls.augment.com.NotificationStackPolicy.Item;
import ls.augment.com.NotificationStackPolicy.Node;
import ls.augment.com.NotificationStackPolicy.Plan;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Chooses logical section/app stacks before the native algorithm owns geometry and touch. */
final class NotificationStackHook {
    private static final String ALGORITHM="com.android.systemui.statusbar.notification.stack.StackScrollAlgorithm";
    private static final String HOST="com.android.systemui.statusbar.notification.stack.NotificationStackScrollLayout";
    private static final String ROW="com.android.systemui.statusbar.notification.row.ExpandableNotificationRow";
    private static final String SECTION="com.android.systemui.statusbar.notification.stack.SectionHeaderView";
    private static final String SECTIONS="com.android.systemui.statusbar.notification.stack.NotificationSectionsManager";
    private static final String RANKING="com.android.systemui.statusbar.notification.collection.coordinator.RankingCoordinator";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<ViewGroup,State> STATES=new WeakHashMap<>();
    private static final Map<View,Integer> CONTROL_BUCKETS=new WeakHashMap<>();
    private static WeakReference<Object> rankingCoordinator=new WeakReference<>(null);
    private static Access access;
    private static final class Access {
        final Class<?> row,section,ranking,sectioner,pipelineEntry;
        final Method state,alpha,setAlpha,entry,children,intrinsic,silent,sceneEnabled,backend;
        final Method shelf,stackEnd,fraction,keyguard,provider,scrim,sectionGap,childGap,maxHeight;
        final Method dispatch,hit,actualHeight,clipTop,clipBottom,falseTap,confirmKey,menuProvider,menuVisible;
        final Method sectionSupport,rankingAttach,silentSectioner,minimizedSectioner,inSection;
        final Method[] changing;
        final Field host,algorithmState,visible,hidden,currentY,expandedEnd,ambient,sections,firstShelf,falsing;
        Access(ClassLoader loader)throws ReflectiveOperationException {
            Class<?> algorithm=Class.forName(ALGORITHM,false,loader),layout=Class.forName(HOST,false,loader);
            row=Class.forName(ROW,false,loader);section=Class.forName(SECTION,false,loader);
            state=method(row,"getViewState");Class<?> viewState=state.getReturnType();
            alpha=method(viewState,"getAlpha");setAlpha=method(viewState,"setAlpha",float.class);
            hidden=member(viewState,"hidden");entry=method(row,"getEntry");children=method(row,"getAttachedChildren");
            intrinsic=method(row,"getIntrinsicHeight");silent=method(layout,"matchesSelection",row,int.class);
            ranking=Class.forName(RANKING,false,loader);
            sectioner=Class.forName("com.android.systemui.statusbar.notification.collection.listbuilder.pluggable.NotifSectioner",false,loader);
            pipelineEntry=Class.forName("com.android.systemui.statusbar.notification.collection.PipelineEntry",false,loader);
            sectionSupport=method(Class.forName("com.zte.utils.SystemuiUtils",false,loader),"supportNotificationSection");
            rankingAttach=method(ranking,"attach",Class.forName("com.android.systemui.statusbar.notification.collection.NotifPipeline",false,loader));
            silentSectioner=method(ranking,"getSilentSectioner");minimizedSectioner=method(ranking,"getMinimizedSectioner");
            inSection=method(sectioner,"isInSection",pipelineEntry);
            if(!Modifier.isStatic(sectionSupport.getModifiers())||sectionSupport.getReturnType()!=boolean.class
                    ||rankingAttach.getReturnType()!=void.class||silentSectioner.getReturnType()!=sectioner
                    ||minimizedSectioner.getReturnType()!=sectioner||inSection.getReturnType()!=boolean.class
                    ||!pipelineEntry.isAssignableFrom(entry.getReturnType()))
                throw new NoSuchMethodException("Native notification ranking-section contract");
            host=member(algorithm,"mHostView");algorithmState=member(algorithm,"mTempAlgorithmState");
            visible=member(algorithmState.getType(),"visibleChildren");currentY=member(algorithmState.getType(),"mCurrentYPosition");
            expandedEnd=member(algorithmState.getType(),"mCurrentExpandedYPosition");ambient=member(layout,"mAmbientState");
            firstShelf=member(algorithmState.getType(),"firstViewInShelf");
            sections=member(layout,"mSectionsManager");method(sections.getType(),"getBucket",View.class);
            method(method(algorithm,"getAdapt").getReturnType(),"forceNotShowShelf");
            method(algorithm,"initAlgorithmState",algorithmState.getType(),ambient.getType());
            method(algorithm,"updateChild",int.class,algorithmState.getType(),ambient.getType());
            method(algorithm,"resetViewStates",ambient.getType(),int.class);
            backend=method(layout,"getRowsToDismissInBackend",int.class);
            if(method(layout,"getContentHeight").getReturnType()!=int.class||method(layout,"getIntrinsicContentHeight").getReturnType()!=float.class)
                throw new NoSuchMethodException("Native notification content-height contract");
            method(layout,"updateChildren");method(layout,"updateContentHeight");method(layout,"updateScrollability");method(layout,"clampScrollPosition");method(layout,"setIsExpanded",boolean.class);
            dispatch=method(layout,"dispatchTouchEvent",MotionEvent.class);
            if(dispatch.getReturnType()!=boolean.class)throw new NoSuchMethodException("Native notification touch contract");
            hit=method(layout,"getChildAtPosition",float.class,float.class,boolean.class,boolean.class,boolean.class);
            actualHeight=method(row,"getActualHeight");clipTop=method(row,"getClipTopAmount");clipBottom=method(row,"getClipBottomAmount");
            falsing=member(row,"mFalsingManager");falseTap=method(falsing.getType(),"isFalseTap",int.class);
            confirmKey=method(KeyEvent.class,"isConfirmKey",int.class);
            menuProvider=method(row,"getProvider");menuVisible=method(menuProvider.getReturnType(),"isMenuVisible");
            method(row,"onKeyUp",int.class,KeyEvent.class);
            method(row,"performAccessibilityActionInternal",int.class,Bundle.class);
            method(row,"onInitializeAccessibilityNodeInfoInternal",AccessibilityNodeInfo.class);
            shelf=method(ambient.getType(),"getShelf");stackEnd=method(ambient.getType(),"getStackEndHeight");
            fraction=method(ambient.getType(),"getFractionToShade");keyguard=method(ambient.getType(),"isOnKeyguard");
            provider=method(ambient.getType(),"getSectionProvider");scrim=method(algorithm,"getScrimTopPaddingOrZero",ambient.getType());
            sectionGap=method(algorithm,"getGapForLocation",float.class,boolean.class);
            childGap=method(algorithm,"childNeedsGapHeight",provider.getReturnType(),int.class,View.class,View.class);
            maxHeight=method(algorithm,"getMaxAllowedChildHeight",View.class);
            sceneEnabled=method(Class.forName("com.android.systemui.scene.shared.flag.SceneContainerFlag",false,loader),"isEnabled");
            changing=new Method[]{method(row,"isUserLocked"),method(row,"areGutsExposed"),
                method(row,"isExpandAnimationRunning"),method(row,"isGroupExpansionChanging"),method(row,"isPinned"),method(row,"isHeadsUpAnimatingAway")};
        }
    }
    private static final class Ranking {
        final Object silent,minimized;
        Ranking(Object coordinator)throws ReflectiveOperationException {
            if(!access.ranking.isInstance(coordinator))throw new IllegalStateException("Native ranking coordinator unavailable");
            silent=access.silentSectioner.invoke(coordinator);minimized=access.minimizedSectioner.invoke(coordinator);
            if(!access.sectioner.isInstance(silent)||!access.sectioner.isInstance(minimized))
                throw new IllegalStateException("Native ranking sectioners unavailable");
        }
        boolean isSilent(Object entry)throws ReflectiveOperationException {
            if(!access.pipelineEntry.isInstance(entry))throw new IllegalStateException("Native ranking entry unavailable");
            return Boolean.TRUE.equals(access.inSection.invoke(silent,entry))||Boolean.TRUE.equals(access.inSection.invoke(minimized,entry));
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
    static int install(AugmentModule module,ClassLoader loader) {
        try{access=new Access(loader);}catch(ReflectiveOperationException|LinkageError error){module.logFeatureError("NOTIFICATION_LIST_STACK_UNAVAILABLE",error);return 0;}
        int count=hookNamed(module,loader,"notification.group_stack",ALGORITHM,"resetViewStates",2,
            (owner,args,result)->{ViewGroup host=(ViewGroup)access.host.get(owner);remember(host).prepare(host,args[0],owner);return PASS;},
            (owner,args,result)->{ViewGroup host=(ViewGroup)access.host.get(owner);remember(host).finish(owner,host,args[0]);return PASS;});
        count+=hookNamed(module,loader,"notification.group_stack",ALGORITHM,"initAlgorithmState",2,null,(owner,args,result)->{
            ViewGroup host=(ViewGroup)access.host.get(owner);remember(host).filter(owner,args[0],args[1]);return PASS;
        });
        count+=hookNamed(module,loader,"notification.group_stack",ALGORITHM,"updateChild",3,null,(owner,args,result)->{
            State state=STATES.get((ViewGroup)access.host.get(owner));if(state!=null)state.tailGap(((Number)args[0]).intValue(),args[1],args[2]);return PASS;
        });
        count+=hookNamed(module,loader,"notification.group_stack",HOST,"updateChildren",0,null,(owner,args,result)->{
            State state=STATES.get(owner);if(state!=null)state.commitHidden();return PASS;
        });
        count+=hookNamed(module,loader,"notification.group_stack",HOST,"getContentHeight",0,null,(owner,args,result)->{
            State state=STATES.get(owner);return state!=null&&state.active&&state.contentHeight>=0?state.contentHeight:PASS;
        });
        count+=hookNamed(module,loader,"notification.group_stack",HOST,"getIntrinsicContentHeight",0,null,(owner,args,result)->{
            State state=STATES.get(owner);return state!=null&&state.active&&state.flowHeight>=0?state.flowHeight:PASS;
        });
        // Category-clear collects summary children only while isVisible(summary) is true. Restore
        // owned visibility for that synchronous backend read, then put it back before any draw.
        module.registerFeatureHook(module.prepareFeatureHook(access.backend,"notification.group_stack.backend_collection",false).intercept(chain->{
            State state=STATES.get(chain.getThisObject());
            try{if(state!=null)state.beginBackend();return chain.proceed();}
            finally{if(state!=null)state.endBackend();}
        }));count++;
        count+=hookNamed(module,loader,"notification.group_stack",HOST,"setIsExpanded",1,null,(owner,args,result)->{
            State state=STATES.get(owner);if(state!=null&&!Boolean.TRUE.equals(args[0])){state.expanded.clear();state.clearTap();}return PASS;
        });
        count+=hookNamed(module,loader,"notification.group_stack",SECTIONS,"getBucket",1,null,(owner,args,result)->{
            Integer bucket=CONTROL_BUCKETS.get(args[0]);return bucket==null?PASS:bucket;
        });
        module.registerFeatureHook(module.prepareFeatureHook(access.rankingAttach,"notification.group_stack.ranking_attach",false).intercept(chain->{
            Object owner=chain.getThisObject(),previous=rankingCoordinator.get();boolean captured=false;
            // The constructor has already initialized both sectioners. Capture before attach so
            // synchronous pipeline callbacks can classify rows; discard a failed native attach.
            try{new Ranking(owner);rankingCoordinator=new WeakReference<>(owner);captured=true;}
            catch(ReflectiveOperationException|RuntimeException error){rankingCoordinator=new WeakReference<>(null);module.logFeatureError("NOTIFICATION_STACK_RANKING_UNAVAILABLE",error);}
            Object result;
            try{result=chain.proceed();}
            catch(Throwable error){if(rankingCoordinator.get()==owner||!captured)rankingCoordinator=new WeakReference<>(previous);throw error;}
            if(captured)MAIN.post(()->{for(State state:new ArrayList<>(STATES.values()))state.request();});
            return result;
        }));count++;
        module.registerFeatureHook(module.prepareFeatureHook(access.dispatch,"notification.group_stack.card_tap",true).intercept(chain->{
            State state=STATES.get(chain.getThisObject());Tap action=null;
            try{if(state!=null)action=state.touch((MotionEvent)chain.getArg(0));}
            catch(ReflectiveOperationException|RuntimeException error){if(state!=null)state.clearTap();module.logFeatureError("NOTIFICATION_STACK_TAP",error);}
            if(action==null)return chain.proceed();
            // Native DOWN/MOVE keep scroll, swipe and long-press ownership. Cancel that same
            // gesture before expanding, so the original UP cannot launch a notification/button.
            MotionEvent cancel=MotionEvent.obtain((MotionEvent)chain.getArg(0));cancel.setAction(MotionEvent.ACTION_CANCEL);
            try{chain.proceed(new Object[]{cancel});}finally{cancel.recycle();}
            if(action.open)state.open(action.row,action.key);
            return Boolean.TRUE;
        }));count++;
        count+=hookNamed(module,loader,"notification.group_stack",ROW,"onKeyUp",2,(owner,args,result)->{
            KeyEvent event=(KeyEvent)args[1];State state=stateFor((View)owner);
            return state!=null&&Boolean.TRUE.equals(access.confirmKey.invoke(null,((Number)args[0]).intValue()))&&!event.isCanceled()&&state.open((View)owner,null)?Boolean.TRUE:PASS;
        },null);
        count+=hookNamed(module,loader,"notification.group_stack",ROW,"performAccessibilityActionInternal",2,(owner,args,result)->{
            int action=((Number)args[0]).intValue();State state=stateFor((View)owner);
            return state!=null&&(action==AccessibilityNodeInfo.ACTION_CLICK||action==AccessibilityNodeInfo.ACTION_EXPAND)&&state.open((View)owner,null)?Boolean.TRUE:PASS;
        },null);
        count+=hookNamed(module,loader,"notification.group_stack",ROW,"onInitializeAccessibilityNodeInfoInternal",1,null,(owner,args,result)->{
            State state=stateFor((View)owner);if(state!=null)state.describe((View)owner,(AccessibilityNodeInfo)args[0]);return PASS;
        });
        try {
            module.deoptimize(method(Class.forName(ALGORITHM,false,loader),"resetViewStates",access.ambient.getType(),int.class));
            module.deoptimize(method(Class.forName(SECTIONS,false,loader),"beginsSection",View.class,View.class));
            module.deoptimize(access.rankingAttach);
            // Both small inlined helpers and native clear-category callers must see our hooks.
            for(Method caller:Class.forName(HOST,false,loader).getDeclaredMethods())switch(caller.getName()) {
                case "getScrollRange":case "updateContentHeight":case "updateChildren":case "clearNotifications":case "getRowsToDismissInBackend":
                case "updateStackPosition":case "updateStackEndHeightAndStackHeight":case "-$$Nest$mgetScrollRange":
                case "springBack":case "animateScroll":case "clampScrollPosition":case "fling":case "onGenericMotionEvent":
                case "onInitializeAccessibilityEventInternal":case "onInterceptTouchEventScroll":case "onScrollTouch":
                case "performAccessibilityActionInternal":case "updateForcedScroll":case "updateImeInset":case "updateScrollability":
                    module.deoptimize(caller);break;
                default:break;
            }
        }catch(ReflectiveOperationException|RuntimeException error){module.logFeatureError("NOTIFICATION_LIST_STACK_CALLER",error);}
        module.logFeatureInfo("NOTIFICATION_LIST_STACK_READY native=ZTE-native-sections expansion=card-tap hooks="+count);return count;
    }
    private static State stateFor(View row) {
        for(View view=row;view.getParent() instanceof View;view=(View)view.getParent()) {
            State state=STATES.get(view.getParent());if(state!=null)return state;
        }
        return null;
    }
    private static final class Tap {
        final View row;final String key;final boolean open;
        Tap(View row,String key,boolean open){this.row=row;this.key=key;this.open=open;}
    }
    private static State remember(ViewGroup host) {
        State state=STATES.get(host);if(state==null){state=new State(host);STATES.put(host,state);}return state;
    }
    private static boolean allowed(ViewGroup host,Object ambient)throws ReflectiveOperationException {
        if(!FeatureSettings.enabled(host.getContext(),SystemUiOptions.NOTIFICATION_STACK))return false;
        // The master only enables the selected modes. With neither mode selected,
        // leave the native list, section headers, shelf and click path untouched.
        if(!FeatureSettings.enabled(host.getContext(),NotificationAppearanceOptions.STACK_BIG)
                &&!FeatureSettings.enabled(host.getContext(),NotificationAppearanceOptions.STACK_SMALL))return false;
        boolean landscape=host.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;
        return NotificationLayoutPolicy.shadeAllowed(number(ambient,"mStatusBarState",-1),yes(ambient,"mDozing"),yes(ambient,"mShowingStackOnLockscreen"),yes(ambient,"mShadeExpanded"))
            &&(!landscape||FeatureSettings.enabled(host.getContext(),NotificationAppearanceOptions.STACK_LANDSCAPE))&&!Boolean.TRUE.equals(access.sceneEnabled.invoke(null));
    }
    private static boolean yes(Object owner,String key){return Boolean.TRUE.equals(field(owner,key));}
    private static int number(Object owner,String key,int fallback){Object v=field(owner,key);return v instanceof Number?((Number)v).intValue():fallback;}
    private static float decimal(Object value,float fallback){return value instanceof Number?((Number)value).floatValue():fallback;}
    private static final class Owned {
        final Object target;final int visibility;final float alpha,targetAlpha;final boolean hidden;
        Owned(View view,Object target)throws ReflectiveOperationException {
            this.target=target;visibility=view.getVisibility();alpha=view.getAlpha();targetAlpha=((Number)access.alpha.invoke(target)).floatValue();hidden=access.hidden.getBoolean(target);
        }
        void restore(View view)throws ReflectiveOperationException {
            if(access.hidden.getBoolean(target))access.hidden.setBoolean(target,hidden);
            if(((Number)access.alpha.invoke(target)).floatValue()==0f)access.setAlpha.invoke(target,targetAlpha);
            if(view.getVisibility()==View.INVISIBLE)view.setVisibility(visibility);
            if(view.getAlpha()==0f)view.setAlpha(alpha);
        }
    }
    private static final class State implements View.OnAttachStateChangeListener {
        final WeakReference<ViewGroup> host;
        final Set<String> expanded=new HashSet<>();
        final Map<String,ViewGroup> controls=new LinkedHashMap<>();
        final Map<View,Owned> owned=new LinkedHashMap<>();
        final Map<View,Drawable> backplates=new LinkedHashMap<>();
        final Map<View,Integer> backendVisibility=new LinkedHashMap<>();
        final Set<View> hidden=new HashSet<>(),tails=new HashSet<>();
        final Map<View,String> collapsed=new LinkedHashMap<>();
        View tapRow;String tapKey;int tapPointer;long tapDownTime;float tapX,tapY,tapSlop;
        final Runnable changed=()->MAIN.post(this::request);
        Plan<View> plan;boolean active,filtered,observing,queued,failed,nativeGroups,bigEnabled,smallEnabled;int contentHeight=-1;float flowHeight=-1;String lastReport="",classification="native-bucket";
        State(ViewGroup view){host=new WeakReference<>(view);view.addOnAttachStateChangeListener(this);if(view.isAttachedToWindow())onViewAttachedToWindow(view);}
        void prepare(ViewGroup view,Object ambient,Object algorithm)throws ReflectiveOperationException {
            restoreOwned();hidden.clear();tails.clear();collapsed.clear();active=false;filtered=false;plan=null;nativeGroups=false;
            boolean nextBig=FeatureSettings.enabled(view.getContext(),NotificationAppearanceOptions.STACK_BIG),nextSmall=FeatureSettings.enabled(view.getContext(),NotificationAppearanceOptions.STACK_SMALL);
            if(bigEnabled!=nextBig||smallEnabled!=nextSmall){expanded.clear();clearTap();}bigEnabled=nextBig;smallEnabled=nextSmall;
            if(!allowed(view,ambient)){clearTap();if(!FeatureSettings.enabled(view.getContext(),SystemUiOptions.NOTIFICATION_STACK)||!bigEnabled&&!smallEnabled)expanded.clear();clearControls(view);clearBackplates(view);releaseExtent();report(view,"native");return;}
            try {
                // initAlgorithmState's shelf candidate belongs to the old full flow. The audited
                // ZTE shade explicitly disables that shelf. Other firmware keeps its full list.
                if(!Boolean.TRUE.equals(call(call(algorithm,"getAdapt"),"forceNotShowShelf")))
                    throw new IllegalStateException("Native notification shelf requires a separate adapter");
                boolean nativeSections=Boolean.TRUE.equals(access.sectionSupport.invoke(null));
                classification=nativeSections?"native-bucket":"native-ranking";
                // Domestic ZTE forcibly assigns bucket 5 to every row. Read the ROM's original
                // ranking sectioners instead, without changing its pipeline or clear selections.
                Ranking ranking=nativeSections?null:new Ranking(rankingCoordinator.get());
                List<Item<View>> items=new ArrayList<>();nativeGroups=false;
                for(int i=0;i<view.getChildCount();i++) {
                    View row=view.getChildAt(i);if(!access.row.isInstance(row)||row.getVisibility()==View.GONE||yes(row,"mRemoved"))continue;
                    Object e=access.entry.invoke(row);Object notification=call(e,"getSbn");
                    if(!(notification instanceof StatusBarNotification))throw new IllegalStateException("Native notification metadata unavailable");
                    StatusBarNotification sbn=(StatusBarNotification)notification;long latest=sbn.getPostTime();
                    Object children=access.children.invoke(row);
                    if(children instanceof List&&!((List<?>)children).isEmpty()) {
                        nativeGroups=true;
                        // Order an existing summary by its latest child without reparenting children or
                        // replacing the native summary's click, privacy or group-expansion behavior.
                        for(Object child:(List<?>)children) {
                            Object ce=access.entry.invoke(child),cs=call(ce,"getSbn");
                            if(cs instanceof StatusBarNotification)latest=Math.max(latest,((StatusBarNotification)cs).getPostTime());
                        }
                    }
                    boolean silent=ranking==null?Boolean.TRUE.equals(access.silent.invoke(null,row,2)):ranking.isSilent(e);
                    String app=sbn.getPackageName()+"/"+sbn.getUserId();
                    items.add(new Item<>(row,sbn.getKey(),app,silent,latest));
                }
                boolean big=bigEnabled,small=smallEnabled;
                // Only the group involved in a native expand/heads-up interaction opens. A shade
                // expansion frame never switches every group between folded and unfolded lists.
                for(Item<View> item:items)for(Method changing:access.changing)if(Boolean.TRUE.equals(changing.invoke(item.value))) {
                    String section=item.silent?NotificationStackPolicy.SILENT:NotificationStackPolicy.ALERTING;
                    if(big)expanded.add(NotificationStackPolicy.MERGED);
                    if(small)expanded.add(section+":app:"+item.appUserKey);break;
                }
                plan=NotificationStackPolicy.plan(items,big,small,expanded);
                Set<String> used=new HashSet<>();
                for(int n=0;n<plan.nodes.size();n++) {Node<View> node=plan.nodes.get(n);if(showLabel(node)) {
                    String label=node.label;ViewGroup header=controls.get(node.groupKey);
                    if(header==null) {
                        header=NotificationStackDecor.create(view,label);
                        controls.put(node.groupKey,header);
                    }
                    if(header.getParent()==null)view.addView(header);
                    else if(header.getParent()!=view)throw new IllegalStateException("Native notification header changed parent");
                    header.setVisibility(View.VISIBLE);NotificationStackDecor.bind(header,label);used.add(node.groupKey);
                    for(int j=n+1;j<plan.nodes.size();j++)if(plan.nodes.get(j).item!=null) {
                        Object bucket=call(access.sections.get(view),"getBucket",plan.nodes.get(j).item.value);
                        if(!(bucket instanceof Number))throw new IllegalStateException("Native notification section bucket unavailable");
                        CONTROL_BUCKETS.put(header,((Number)bucket).intValue());break;
                    }
                }}
                for(Map.Entry<String,ViewGroup> control:controls.entrySet())if(!used.contains(control.getKey()))control.getValue().setVisibility(View.GONE);
                for(Item<View> item:items)if(plan.hiddenKeys.contains(item.key))hidden.add(item.value);
                for(Node<View> node:plan.nodes)if(node.item!=null&&!node.expanded&&node.count>1){tails.add(node.item.value);collapsed.put(node.item.value,node.groupKey);}
                active=!items.isEmpty();failed=false;
                if(!active){clearBackplates(view);releaseExtent();}
            }catch(ReflectiveOperationException|RuntimeException error) {
                if("native-ranking".equals(classification))classification="native-ranking-unavailable";
                plan=null;active=false;hidden.clear();tails.clear();collapsed.clear();clearTap();hideControls();clearBackplates(view);releaseExtent();
                String detail="native-stack-unavailable:"+classification+":"+error.getClass().getSimpleName()+":"+error.getMessage();
                if(!failed){failed=true;FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_stack_runtime_error",detail);}
                report(view,"native-unavailable");
            }
        }
        boolean showLabel(Node<View> node){return node.item==null&&NotificationStackPolicy.SILENT.equals(node.groupKey);}
        @SuppressWarnings("unchecked") void filter(Object algorithm,Object algorithmState,Object ambient)throws ReflectiveOperationException {
            if(!active||plan==null)return;
            Object raw=access.visible.get(algorithmState);if(!(raw instanceof List))return;
            List<View> visible=(List<View>)raw,prefix=new ArrayList<>(),suffix=new ArrayList<>();boolean seenRow=false;
            for(View child:new ArrayList<>(visible)) {
                if(access.row.isInstance(child)){seenRow=true;continue;}
                if(access.section.isInstance(child)) {if(!controls.containsValue(child))hidden.add(child);continue;}
                (seenRow?suffix:prefix).add(child);
            }
            List<View> selected=new ArrayList<>(prefix);
            for(Node<View> node:plan.nodes)if(node.item!=null)selected.add(node.item.value);else if(showLabel(node))selected.add(controls.get(node.groupKey));
            selected.addAll(suffix);
            // Recompute the native shelf candidate from the chosen flow. Even ZTE's hidden
            // shelf affects the expansion fraction during a shade drag.
            View shelf=(View)access.shelf.invoke(ambient),candidate=null;Object provider=access.provider.invoke(ambient);
            float padding=decimal(field(algorithm,"mPaddingBetweenElements"),0);
            float y=-Math.max(0,number(ambient,"mScrollY",0))+((Number)access.scrim.invoke(algorithm,ambient)).floatValue();
            float threshold=shelf==null?Float.POSITIVE_INFINITY:((Number)access.stackEnd.invoke(ambient)).floatValue()-((Number)call(shelf,"getIntrinsicHeight")).floatValue()-padding;
            float gap=((Number)access.sectionGap.invoke(algorithm,((Number)access.fraction.invoke(ambient)).floatValue(),Boolean.TRUE.equals(access.keyguard.invoke(ambient)))).floatValue();
            View previous=null;ViewGroup view=host.get();float tail=view==null?0:16*view.getResources().getDisplayMetrics().density;
            for(int i=0;i<selected.size();i++) {
                View child=selected.get(i);if(Boolean.TRUE.equals(access.childGap.invoke(algorithm,provider,i,child,previous)))y+=gap;
                if(candidate==null&&shelf!=null&&y>=threshold&&!child.getClass().getName().endsWith(".footer.ui.view.FooterView"))candidate=child;
                y+=((Number)access.maxHeight.invoke(algorithm,child)).floatValue()+padding+(tails.contains(child)?tail:0);previous=child;
            }
            visible.clear();visible.addAll(selected);access.firstShelf.set(algorithmState,candidate);
            int index=0;for(View row:selected) {
                Object target=call(row,"getViewState");set(target,"notGoneIndex",index++);
                if(access.row.isInstance(row)) {Object children=access.children.invoke(row);if(children instanceof List)for(Object child:(List<?>)children)
                    if(child instanceof View&&((View)child).getVisibility()!=View.GONE)set(access.state.invoke(child),"notGoneIndex",index++);}
            }
            filtered=true;
        }
        void tailGap(int index,Object algorithmState,Object ambient)throws ReflectiveOperationException {
            if(!active||plan==null)return;Object raw=access.visible.get(algorithmState);if(!(raw instanceof List))return;
            List<?> list=(List<?>)raw;if(index<0||index>=list.size()||!tails.contains(list.get(index)))return;
            ViewGroup view=host.get();if(view==null)return;float gap=16*view.getResources().getDisplayMetrics().density;
            float fraction=NotificationLayoutPolicy.unit(decimal(field(ambient,"mExpansionFraction"),1));
            access.currentY.setFloat(algorithmState,access.currentY.getFloat(algorithmState)+gap*fraction);
            access.expandedEnd.setFloat(algorithmState,access.expandedEnd.getFloat(algorithmState)+gap);
        }
        void finish(Object algorithm,ViewGroup view,Object ambient)throws ReflectiveOperationException {
            if(!active||plan==null)return;
            if(!filtered){active=false;plan=null;hidden.clear();tails.clear();collapsed.clear();clearTap();hideControls();clearBackplates(view);releaseExtent();report(view,"native-filter-unavailable");MAIN.post(this::request);return;}
            for(View row:hidden) {
                Object target=call(row,"getViewState");owned.put(row,new Owned(row,target));
                access.hidden.setBoolean(target,true);access.setAlpha.invoke(target,0f);
            }
            Object algorithmState=access.algorithmState.get(algorithm);
            float end=access.expandedEnd.getFloat(algorithmState)+Math.max(0,number(ambient,"mScrollY",0));
            float padding=Math.max(number(ambient,"mTopPadding",0),number(view,"mIntrinsicPadding",0));
            int wanted=Math.max(0,(int)Math.ceil(end+padding+number(view,"mBottomPadding",0)));
            boolean extentChanged=contentHeight!=wanted;contentHeight=wanted;flowHeight=Math.max(0,end);
            for(View row:new ArrayList<>(backplates.keySet()))if(!tails.contains(row)){view.getOverlay().remove(backplates.remove(row));}
            for(View row:tails) {
                Drawable plates=backplates.get(row);if(plates==null){plates=NotificationStackDecor.backplate(row);if(plates!=null){backplates.put(row,plates);view.getOverlay().add(plates);}}
                if(plates!=null)NotificationStackDecor.position(plates,row,((Number)access.intrinsic.invoke(row)).intValue());
            }
            if(extentChanged)refreshExtent();report(view,"logical-stacks");
        }
        void commitHidden() {
            if(!active)return;
            // A native animateTo can keep hidden targets VISIBLE for a frame. Invisible rows must
            // never retain touch/a11y targets while their group is collapsed.
            for(View row:hidden)if(row.getVisibility()!=View.GONE){row.setVisibility(View.INVISIBLE);row.setAlpha(0f);}
            ViewGroup view=host.get();if(view!=null)for(Map.Entry<View,Drawable> plate:backplates.entrySet())try {
                NotificationStackDecor.position(plate.getValue(),plate.getKey(),((Number)access.intrinsic.invoke(plate.getKey())).intValue());
            }catch(ReflectiveOperationException ignored) { }
        }
        void restoreOwned() {
            for(Map.Entry<View,Owned> entry:owned.entrySet())try{entry.getValue().restore(entry.getKey());}
            catch(ReflectiveOperationException error){ViewGroup view=host.get();if(view!=null)FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_stack_runtime_error",error.toString());}
            owned.clear();
        }
        void beginBackend(){backendVisibility.clear();for(View row:hidden)if(row.getVisibility()==View.INVISIBLE){backendVisibility.put(row,row.getVisibility());row.setVisibility(View.VISIBLE);}}
        void endBackend(){for(Map.Entry<View,Integer> entry:backendVisibility.entrySet())if(entry.getKey().getVisibility()==View.VISIBLE)entry.getKey().setVisibility(entry.getValue());backendVisibility.clear();}
        View directRow(View raw) {
            ViewGroup view=host.get();if(view==null)return null;
            for(View row=raw;row!=null&&row.getParent() instanceof View;row=(View)row.getParent())
                if(row.getParent()==view)return access.row.isInstance(row)?row:null;
            return null;
        }
        String currentKey(View raw)throws ReflectiveOperationException {
            ViewGroup view=host.get();View row=directRow(raw);
            if(view==null||row==null||!active||plan==null||row.getVisibility()!=View.VISIBLE||row.getAlpha()<=0f||!row.isEnabled()||yes(row,"mRemoved"))return null;
            if(!allowed(view,access.ambient.get(view))||bigEnabled!=FeatureSettings.enabled(view.getContext(),NotificationAppearanceOptions.STACK_BIG)
                ||smallEnabled!=FeatureSettings.enabled(view.getContext(),NotificationAppearanceOptions.STACK_SMALL))return null;
            for(Method changing:access.changing)if(Boolean.TRUE.equals(changing.invoke(row)))return null;
            Object menu=access.menuProvider.invoke(row);if(menu!=null&&Boolean.TRUE.equals(access.menuVisible.invoke(menu)))return null;
            String key=collapsed.get(row);return key!=null&&!expanded.contains(key)?key:null;
        }
        View hit(float x,float y)throws ReflectiveOperationException {
            ViewGroup view=host.get();if(view==null||!Float.isFinite(x)||!Float.isFinite(y))return null;
            Object child=access.hit.invoke(view,x,y,true,true,false);View row=child instanceof View?directRow((View)child):null;
            if(row==null||currentKey(row)==null)return null;
            float left=row.getLeft()+row.getTranslationX(),top=row.getTop()+row.getTranslationY();
            int height=((Number)access.actualHeight.invoke(row)).intValue();
            int start=((Number)access.clipTop.invoke(row)).intValue(),end=((Number)access.clipBottom.invoke(row)).intValue();
            return x>=left&&x<=left+row.getWidth()&&y>=top+start&&y<=top+height-end?row:null;
        }
        void clearTap(){tapRow=null;tapKey=null;}
        boolean nativeGesture(){ViewGroup view=host.get();return view==null||yes(view,"mIsBeingDragged")||yes(view,"mOnlyScrollingInThisMotion")||yes(view,"mExpandingNotification")||yes(view,"mExpandedInThisMotion");}
        boolean moved(float x,float y){float dx=x-tapX,dy=y-tapY;return !Float.isFinite(x)||!Float.isFinite(y)||dx*dx+dy*dy>tapSlop*tapSlop;}
        Tap touch(MotionEvent event)throws ReflectiveOperationException {
            int action=event.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN) {
                clearTap();if(event.getPointerCount()!=1)return null;
                View row=hit(event.getX(),event.getY());if(row==null)return null;
                String key=currentKey(row);if(key==null)return null;
                tapRow=row;tapKey=key;tapPointer=event.getPointerId(0);tapDownTime=event.getDownTime();
                tapX=event.getX();tapY=event.getY();ViewGroup view=host.get();
                tapSlop=ViewConfiguration.get(view.getContext()).getScaledTouchSlop();return null;
            }
            if(tapRow==null)return null;
            int pointer=event.findPointerIndex(tapPointer);long age=event.getEventTime()-tapDownTime;
            if(nativeGesture()||event.getPointerCount()!=1||pointer<0||event.getDownTime()!=tapDownTime||age<0||age>=ViewConfiguration.getLongPressTimeout()
                ||action==MotionEvent.ACTION_CANCEL||action==MotionEvent.ACTION_POINTER_DOWN||action==MotionEvent.ACTION_POINTER_UP
                ||!tapKey.equals(currentKey(tapRow))){clearTap();return null;}
            for(int i=0;i<event.getHistorySize();i++)if(moved(event.getHistoricalX(pointer,i),event.getHistoricalY(pointer,i))){clearTap();return null;}
            if(moved(event.getX(pointer),event.getY(pointer))){clearTap();return null;}
            if(action!=MotionEvent.ACTION_UP)return null;
            View row=tapRow;String key=tapKey;clearTap();if(hit(event.getX(pointer),event.getY(pointer))!=row)return null;
            Object manager=access.falsing.get(row);if(manager==null)return null;
            return new Tap(row,key,!Boolean.TRUE.equals(access.falseTap.invoke(manager,1)));
        }
        boolean open(View raw,String expected)throws ReflectiveOperationException {
            String key=currentKey(raw);if(key==null||expected!=null&&!expected.equals(key))return false;
            clearTap();expanded.add(key);request();return true;
        }
        void describe(View raw,AccessibilityNodeInfo info)throws ReflectiveOperationException {
            String key=currentKey(raw);if(key==null)return;
            info.setClickable(true);
            info.addAction(new AccessibilityNodeInfo.AccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK,"展开通知堆叠"));
            info.addAction(new AccessibilityNodeInfo.AccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND,"展开通知堆叠"));
            info.setStateDescription(plan.groups.get(key).size()+" 条通知，已收起");
        }
        void hideControls(){for(ViewGroup control:controls.values())control.setVisibility(View.GONE);}
        void clearControls(ViewGroup view){
            for(ViewGroup control:controls.values()){if(control.getParent()==view)view.removeView(control);CONTROL_BUCKETS.remove(control);}
            controls.clear();
        }
        void clearBackplates(ViewGroup view){for(Drawable plate:backplates.values())view.getOverlay().remove(plate);backplates.clear();}
        void releaseExtent(){boolean owned=contentHeight>=0;contentHeight=-1;flowHeight=-1;if(owned)refreshExtent();}
        void request(){ViewGroup view=host.get();if(view==null||!view.isAttachedToWindow())return;try{call(view,"requestChildrenUpdate");}catch(ReflectiveOperationException ignored) { }}
        void refreshExtent() {
            if(queued)return;queued=true;MAIN.post(()->{queued=false;ViewGroup view=host.get();if(view==null||!view.isAttachedToWindow())return;
                try{call(view,"updateContentHeight");call(view,"updateScrollability");call(view,"clampScrollPosition");}
                catch(ReflectiveOperationException error){FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_stack_runtime_error",error.toString());}
            });
        }
        void report(ViewGroup view,String stage) {
            int shown=0,open=0;if(plan!=null)for(Node<View> node:plan.nodes){if(node.item!=null)shown++;else if(node.expanded&&plan.groups.containsKey(node.groupKey))open++;}
            String value="adapter=ZTE-native-sections;stage="+stage+";classification="+classification+";expansion=card-tap;big="+bigEnabled+";small="+smallEnabled+";groups="+(plan==null?0:plan.groups.size())+";expandedGroups="+open+";visibleRows="+shown+";hidden="+hidden.size()+";backplates="+backplates.size()+";nativeGroupsPreserved="+nativeGroups+";contentHeight="+contentHeight;
            if(!value.equals(lastReport)){lastReport=value;FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_stack_runtime",value);}
        }
        @Override public void onViewAttachedToWindow(View view){if(!observing)observing=FeatureSettings.addSnapshotListener(view.getContext(),changed);}
        @Override public void onViewDetachedFromWindow(View view) {
            restoreOwned();ViewGroup parent=host.get();if(parent!=null){clearBackplates(parent);for(ViewGroup control:controls.values())if(control.getParent()==parent)parent.removeView(control);}
            for(ViewGroup control:controls.values())CONTROL_BUCKETS.remove(control);
            controls.clear();hidden.clear();tails.clear();collapsed.clear();clearTap();expanded.clear();active=false;plan=null;contentHeight=-1;flowHeight=-1;
            if(observing)FeatureSettings.removeSnapshotListener(changed);observing=false;
        }
    }
}
