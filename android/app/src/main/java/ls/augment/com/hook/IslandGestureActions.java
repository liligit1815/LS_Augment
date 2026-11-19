package ls.augment.com.hook;

import android.app.Notification;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import android.view.View;
import android.view.ViewGroup;
import android.view.MotionEvent;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.function.BooleanSupplier;
import ls.augment.com.IslandGestureConfig;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** User gestures only. Completion is observed; a timeout abandons the action. */
final class IslandGestureActions {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<Object,Pending> pending=new IdentityHashMap<>();
    private static final Map<Object,Capture> compactStarts=new IdentityHashMap<>();
    private static final Set<Object> touchDispatch=Collections.newSetFromMap(new IdentityHashMap<>());
    private static final LinkedHashMap<String,Object> hidden=new LinkedHashMap<>();
    private static String config="";
    static final class Target {
        final Object owner,revision;
        final Context context;
        final StatusBarNotification source;
        final String scene;
        final BooleanSupplier current;
        final Runnable changed;
        Target(Object owner,Context context,StatusBarNotification source,String scene,BooleanSupplier current,Runnable changed){
            this.owner=owner;this.context=context;this.source=source;this.scene=scene;this.current=current;this.changed=changed;
            revision=stamp(source);
        }
        boolean persistent(){return "ongoing".equals(scene)||"downloads".equals(scene)
                ||(source.getNotification().flags&Notification.FLAG_ONGOING_EVENT)!=0
                ||IslandNotificationText.progress(source.getNotification()).present;}
        boolean valid(){
            try{
                if(!current.getAsBoolean()||!FeatureSettings.enabled(context,SystemUiOptions.ISLAND)
                        ||!IslandSceneSelection.enabled(context,scene))return false;
                int user=(Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
                if(user<0||source.getUserId()!=user||source.getUid()/100000!=user)return false;
                NotificationListenerService listener=DynamicIslandHook.notificationSource();if(listener==null)return false;
                StatusBarNotification[] active=listener.getActiveNotifications(new String[]{source.getKey()});
                if(active==null)return false;
                for(StatusBarNotification value:active)if(Objects.equals(revision,stamp(value))){
                    NotificationListenerService.Ranking rank=new NotificationListenerService.Ranking();
                    NotificationListenerService.RankingMap ranks=listener.getCurrentRanking();
                    return ranks!=null&&ranks.getRanking(value.getKey(),rank)&&!rank.isSuspended()
                            &&rank.getImportance()>0&&rank.matchesInterruptionFilter();
                }
            }catch(Exception unavailable){report("source_unavailable:"+unavailable.getClass().getSimpleName());}
            return false;
        }
    }
    static Object stamp(StatusBarNotification source){
        if(source==null||source.getNotification()==null)return null;
        return IslandNotificationActivities.revision(source,IslandNotificationText.read(source.getPackageName(),source.getNotification()));
    }
    private static String key(StatusBarNotification source){return source.getUid()+"|"+source.getKey();}
    static void configure(Context context){
        String next=FeatureSettings.enabled(context,SystemUiOptions.ISLAND)+"|"+settings(context);
        if(config.equals(next))return;config=next;hidden.clear();
        compactStarts.clear();
        for(Object owner:new ArrayList<>(pending.keySet()))release(owner);
    }
    private static String settings(Context context){return FeatureSettings.integer(context,IslandGestureConfig.EXPANDED,0,0,2)+"|"
            +FeatureSettings.integer(context,IslandGestureConfig.COMPACT,0,0,1)+"|"+FeatureSettings.enabled(context,IslandGestureConfig.PROTECT);}
    static boolean hidden(Context context,StatusBarNotification source){
        configure(context);if(source==null)return false;
        String key=key(source);Object value=hidden.get(key);
        if(value==null)return false;if(Objects.equals(value,stamp(source)))return true;
        hidden.remove(key);return false;
    }
    static void removed(StatusBarNotification source){
        if(source!=null&&Objects.equals(hidden.get(key(source)),stamp(source)))hidden.remove(key(source));
    }
    static Capture capture(Target target,boolean expanded){
        if(target==null)return null;configure(target.context);
        int action=expanded?FeatureSettings.integer(target.context,IslandGestureConfig.EXPANDED,0,0,2)
                :FeatureSettings.integer(target.context,IslandGestureConfig.COMPACT,0,0,1)==1?IslandGestureConfig.CANCEL:0;
        if(action!=IslandGestureConfig.HIDE&&action!=IslandGestureConfig.CANCEL)return null;
        Notification n=target.source.getNotification();
        if(n==null||n.visibility==Notification.VISIBILITY_SECRET||(n.flags&Notification.FLAG_GROUP_SUMMARY)!=0
                ||IslandNotificationText.media(n)||Notification.CATEGORY_CALL.equals(n.category)
                ||Notification.CATEGORY_NAVIGATION.equals(n.category)||Notification.CATEGORY_ALARM.equals(n.category)
                ||FeatureSettings.enabled(target.context,IslandGestureConfig.PROTECT)&&target.persistent()
                ||action==IslandGestureConfig.CANCEL&&(n.flags&Notification.FLAG_NO_CLEAR)!=0||!target.valid())return null;
        return new Capture(target,action,settings(target.context));
    }
    static final class Capture {
        final Target target;final int action;final String settings;final Object snapshot;
        Capture(Target t,int a,String s){target=t;action=a;settings=s;snapshot=FeatureSettings.snapshot(t.context);}
        boolean retained(){return snapshot==FeatureSettings.snapshot(target.context)&&settings.equals(settings(target.context))&&target.current.getAsBoolean()
                &&FeatureSettings.enabled(target.context,SystemUiOptions.ISLAND)&&IslandSceneSelection.enabled(target.context,target.scene);}
        boolean valid(){return retained()&&target.valid();}
    }
    static void completeWhen(Capture capture,BooleanSupplier completed,BooleanSupplier retained){
        if(capture==null)return;
        release(capture.target.owner);
        Pending request=new Pending(capture,completed,retained);pending.put(capture.target.owner,request);MAIN.post(request);
    }
    private static final class Pending implements Runnable {
        final Capture capture;final BooleanSupplier completed,retained;final long until=SystemClock.elapsedRealtime()+1500;
        Pending(Capture c,BooleanSupplier done,BooleanSupplier retained){capture=c;completed=done;this.retained=retained;}
        @Override public void run(){
            Object owner=capture.target.owner;if(pending.get(owner)!=this)return;
            try{
                if(!capture.retained()||!retained.getAsBoolean()){release(owner);report("discarded_changed_state");return;}
                if(SystemClock.elapsedRealtime()>until){release(owner);report("discarded_completion_timeout");return;}
                if(!completed.getAsBoolean()){MAIN.postDelayed(this,32);return;}
                release(owner);if(!capture.valid())return;Target target=capture.target;
                if(capture.action==IslandGestureConfig.HIDE){
                    hidden.put(key(target.source),target.revision);
                    while(hidden.size()>128)hidden.remove(hidden.keySet().iterator().next());
                    target.changed.run();report("hide_completed");
                }else{
                    NotificationListenerService listener=DynamicIslandHook.notificationSource();
                    if(listener!=null){listener.cancelNotification(target.source.getKey());report("cancel_requested");}
                }
            }catch(RuntimeException failure){release(owner);report("action_failed:"+failure.getClass().getSimpleName());}
        }
    }
    static boolean holds(Object owner){
        Pending request=pending.get(owner);
        try{return request!=null&&SystemClock.elapsedRealtime()<=request.until&&request.capture.retained()&&request.retained.getAsBoolean();}
        catch(RuntimeException unavailable){return false;}
    }
    static void release(Object owner){Pending old=pending.remove(owner);if(old!=null){MAIN.removeCallbacks(old);
        MAIN.post(()->IslandPanelInteraction.actionFinished(owner));}
        compactStarts.values().removeIf(value->value.target.owner==owner);}
    private static Target selectedTarget(Object manager){
        Target target=DuoNotificationCards.gestureTarget(manager);
        return target!=null?target:NativeIslandHost.gestureTarget(manager);
    }
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> type=Class.forName("com.zte.feature.dynamicisland.PermanentIslandManager",false,loader);
            Method swipe=NativeIslandSceneContract.method(type,"onSwipe",void.class,boolean.class);
            if(swipe==null||Modifier.isStatic(swipe.getModifiers()))throw new NoSuchMethodException("onSwipe_boolean");
            for(String name:new String[]{"mSwipeHide","mAnimProcessing"}){
                java.lang.reflect.Field state=NativeIslandSceneContract.field(type,name,boolean.class);
                if(state==null||Modifier.isStatic(state.getModifiers()))throw new NoSuchFieldException(name);
            }
            java.lang.reflect.Field rootField=NativeIslandSceneContract.field(type,"mDynamicIslandRoot",View.class);
            if(rootField==null||Modifier.isStatic(rootField.getModifiers()))throw new NoSuchFieldException("island_root");
            int inputs=installInput(module,loader,type,"DynamicPermanentContainer",false)
                    +installInput(module,loader,type,"DynamicDisposableContainer",true);
            if(inputs==0)return 0;
            module.registerFeatureHook(module.prepareFeatureHook(swipe,"island.gesture.compact",false).intercept(chain->{
                Object manager=chain.getThisObject();boolean wasHidden=Boolean.TRUE.equals(field(manager,"mSwipeHide"));
                Capture capture=compactStarts.remove(manager);
                Target selected=selectedTarget(manager);
                if(wasHidden||capture!=null&&(selected==null||selected.owner!=capture.target.owner
                        ||!Objects.equals(selected.revision,capture.target.revision)||!capture.valid()))capture=null;
                Capture accepted=capture;
                Object result=chain.proceed();
                if(accepted!=null&&Boolean.TRUE.equals(field(manager,"mSwipeHide"))){
                    report("compact_hidden_wait");
                    Object root=field(manager,"mDynamicIslandRoot");
                    if(root instanceof View)completeWhen(accepted,()->((View)root).getVisibility()==View.GONE
                            &&Boolean.FALSE.equals(field(manager,"mAnimProcessing")),
                            ()->field(manager,"mDynamicIslandRoot")==root&&Boolean.TRUE.equals(field(manager,"mSwipeHide")));
                }
                return result;
            }));return inputs+1+installEmptyQueue(module,loader,type);
        }catch(Exception missing){report("compact_unavailable:"+missing.getClass().getSimpleName()+":"+missing.getMessage());return 0;}
    }
    private static int installEmptyQueue(AugmentModule module,ClassLoader loader,Class<?> type){
        try{
            Class<?> island=Class.forName("com.zte.feature.dynamicisland.DynamicPermanentIsland",false,loader);
            Method adding=NativeIslandSceneContract.method(type,"updateAddingIslandVisibility",void.class,island,int.class,boolean.class);
            java.lang.reflect.Field queue=NativeIslandSceneContract.field(type,"mDynamicPermanentContainer",ViewGroup.class);
            java.lang.reflect.Field helper=NativeIslandSceneContract.field(type,"mDynamicIslandTouchHelper",View.class);
            java.lang.reflect.Field handler=NativeIslandSceneContract.field(type,"mHandler",Handler.class);
            java.lang.reflect.Field delayed=NativeIslandSceneContract.field(type,"mIslandHideRunnable",Runnable.class);
            java.lang.reflect.Field hidden=NativeIslandSceneContract.field(type,"mSwipeHide",boolean.class);
            if(adding==null||Modifier.isStatic(adding.getModifiers()))throw new NoSuchMethodException("empty_queue_transition");
            for(java.lang.reflect.Field value:new java.lang.reflect.Field[]{queue,helper,handler,delayed,hidden})
                if(value==null||Modifier.isStatic(value.getModifiers()))throw new NoSuchFieldException("empty_queue_state");
            module.registerFeatureHook(module.prepareFeatureHook(adding,"island.gesture.empty_queue",false).intercept(chain->{
                Object manager=chain.getThisObject();Object next=chain.getArgs().get(0);
                if(Integer.valueOf(0).equals(chain.getArgs().get(1))
                        &&(DuoNotificationCards.ownsSurface(manager,next)||NativeIslandHost.ownsGestureSurface(manager,next))
                        &&Boolean.TRUE.equals(hidden.get(manager))){
                    Object current=queue.get(manager),touch=helper.get(manager),timer=handler.get(manager),task=delayed.get(manager);
                    if(current instanceof ViewGroup&&((ViewGroup)current).getChildCount()==0&&touch instanceof View&&timer instanceof Handler&&task instanceof Runnable){
                        // OEM 1->2 resets this state; its 0->1 path leaves the old click blocker.
                        // Only an empty queue acquiring a new Duo card may clear it.
                        ((Handler)timer).removeCallbacks((Runnable)task);((View)touch).setVisibility(View.GONE);
                        hidden.setBoolean(manager,false);report("empty_queue_reopened");
                    }
                }
                return chain.proceed();
            }));return 1;
        }catch(Exception missing){report("empty_queue_unavailable:"+missing.getClass().getSimpleName());return 0;}
    }
    private static int installInput(AugmentModule module,ClassLoader loader,Class<?> type,String name,boolean disposable){
        try{
            Class<?> container=Class.forName("com.zte.feature.dynamicisland."+name,false,loader);
            if(!View.class.isAssignableFrom(container))throw new NoSuchFieldException("container_view");
            Class<?> callback=Class.forName(container.getName()+"$ManagerCallback",false,loader);
            java.lang.reflect.Field callbackField=NativeIslandSceneContract.field(container,"mCallback",callback);
            Method touch=NativeIslandSceneContract.method(container,"dispatchTouchEvent",boolean.class,MotionEvent.class);
            Method directTouch=NativeIslandSceneContract.method(container,"onTouchEvent",boolean.class,MotionEvent.class);
            Method opening=disposable?NativeIslandSceneContract.method(type,"isDisposableOpening",boolean.class):null;
            if(callbackField==null||Modifier.isStatic(callbackField.getModifiers())||!callback.isAssignableFrom(type)
                    ||touch==null||Modifier.isStatic(touch.getModifiers())||directTouch==null||Modifier.isStatic(directTouch.getModifiers())
                    ||disposable&&(opening==null||Modifier.isStatic(opening.getModifiers())))throw new NoSuchMethodException("native_container_touch_callback");
            Set<Method> inputs=new LinkedHashSet<>(Arrays.asList(touch,directTouch));
            for(Method input:inputs)module.registerFeatureHook(module.prepareFeatureHook(input,"island.gesture."+name+"."+input.getName(),false).intercept(chain->{
                // A child may own DOWN before the native container intercepts MOVE.
                // OEM forwarding can also enter onTouchEvent directly. Nested dispatch is one input.
                if(!container.isInstance(chain.getThisObject())||!touchDispatch.add(chain.getThisObject()))return chain.proceed();
                try{
                Object manager=callbackField.get(chain.getThisObject());MotionEvent event=(MotionEvent)chain.getArgs().get(0);
                int action=event.getActionMasked();
                if(action==MotionEvent.ACTION_DOWN){
                    compactStarts.remove(manager);
                    Target target=disposable&&!Boolean.FALSE.equals(opening.invoke(manager))?null:selectedTarget(manager);
                    Capture start=capture(target,false);
                    if(start!=null&&event.getPointerCount()==1){compactStarts.put(manager,start);report("compact_captured:"+name);}
                }else if(action==MotionEvent.ACTION_CANCEL||event.getPointerCount()!=1)compactStarts.remove(manager);
                try{return chain.proceed();}
                finally{if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL)compactStarts.remove(manager);}
                }finally{touchDispatch.remove(chain.getThisObject());}
            }));
            report("compact_input_ready:"+name);return inputs.size();
        }catch(Exception missing){report("compact_input_unavailable:"+name+":"+missing.getClass().getSimpleName()+":"+missing.getMessage());return 0;}
    }
    private static void report(String value){FeatureRuntimeLog.event("ISLAND_GESTURE",value);}
    private IslandGestureActions(){}
}
