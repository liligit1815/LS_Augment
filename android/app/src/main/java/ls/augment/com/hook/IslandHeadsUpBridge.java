package ls.augment.com.hook;

import android.app.Notification;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.service.notification.NotificationListenerService.Ranking;
import android.service.notification.StatusBarNotification;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;

/** Per-notification handoff at the native asynchronous heads-up presentation boundary. */
final class IslandHeadsUpBridge {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final long DEADLINE_MS=100;
    private static final Map<String,Pending> pending=new LinkedHashMap<>();
    private static final Map<String,String> nativeAlerts=new LinkedHashMap<>();
    private static final ThreadLocal<Boolean> replay=ThreadLocal.withInitial(()->false);
    private static WeakReference<Object> provider=new WeakReference<>(null);
    private static WeakReference<Object> headsUpManager=new WeakReference<>(null);
    private static Method decision,shouldInterrupt,sbnMethod,rankingMethod,canceled,dismissed,interruption,isHeadsUpEntry;
    private static boolean installed;
    private static final class Pending {
        final Object manager,entry,decisionProvider;final Method show;final Object[] args;
        final StatusBarNotification source;final String revision;final long deadline;
        final Runnable timeout=()->finish(this,false,"deadline");
        final Runnable nextFrame=()->confirm(this);
        Pending(Object manager,Object entry,Object decisionProvider,Method show,Object[] args,StatusBarNotification source){
            this.manager=manager;this.entry=entry;this.decisionProvider=decisionProvider;this.show=show;this.args=args;this.source=source;
            revision=revision(source);deadline=SystemClock.uptimeMillis()+DEADLINE_MS;
        }
    }
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> entry=Class.forName("com.android.systemui.statusbar.notification.collection.NotificationEntry",false,loader);
            Class<?> manager=Class.forName("com.android.systemui.statusbar.notification.headsup.HeadsUpManagerImpl",false,loader);
            Class<?> decisions=Class.forName("com.android.systemui.statusbar.notification.interruption.VisualInterruptionDecisionProviderImpl",false,loader);
            Class<?> result=Class.forName("com.android.systemui.statusbar.notification.interruption.VisualInterruptionDecisionProvider$Decision",false,loader);
            Method show=MagicIslandScenes.exact(manager,"showNotification",void.class,entry,boolean.class);
            Method already=MagicIslandScenes.exact(manager,"isHeadsUpEntry",boolean.class,String.class);
            isHeadsUpEntry=already;
            decision=MagicIslandScenes.exact(decisions,"makeUnloggedHeadsUpDecision",result,entry);
            Method logged=MagicIslandScenes.exact(decisions,"makeAndLogHeadsUpDecision",result,entry);
            shouldInterrupt=result.getMethod("getShouldInterrupt");
            if(shouldInterrupt.getReturnType()!=boolean.class)throw new NoSuchMethodException("heads_up_decision_result");
            sbnMethod=MagicIslandScenes.exact(entry,"getSbn",StatusBarNotification.class);
            rankingMethod=MagicIslandScenes.exact(entry,"getRanking",Ranking.class);
            canceled=MagicIslandScenes.exact(entry,"isCanceled",boolean.class);
            dismissed=MagicIslandScenes.exact(entry,"isRowDismissed",boolean.class);
            interruption=MagicIslandScenes.exact(entry,"setInterruption",void.class);
            for(Method method:new Method[]{decision,logged})
                module.registerFeatureHook(module.prepareFeatureHook(method,"island.headsup.decision."+method.getName(),false).intercept(chain->{
                    Object value=chain.proceed();provider=new WeakReference<>(chain.getThisObject());return value;
                }));
            module.registerFeatureHook(module.prepareFeatureHook(show,"island.headsup.handoff",false).intercept(chain->{
                if(replay.get()||Looper.myLooper()!=Looper.getMainLooper())return chain.proceed();
                headsUpManager=new WeakReference<>(chain.getThisObject());
                Object value=chain.getArg(0);StatusBarNotification source=(StatusBarNotification)sbnMethod.invoke(value);
                if(source==null)return chain.proceed();
                Ranking ranking=(Ranking)rankingMethod.invoke(value);
                Object currentProvider=provider.get();
                if(Boolean.TRUE.equals(chain.getArg(1))||currentProvider==null||!completeActions(source.getNotification())
                        ||Boolean.TRUE.equals(already.invoke(chain.getThisObject(),source.getKey()))
                        ||!DynamicIslandHook.canPrepareHeadsUp(source,ranking)) {
                    markNative(source);return chain.proceed();
                }
                Pending old=pending.get(source.getKey());
                if(old!=null){
                    if(old.revision.equals(revision(source)))return null;
                    cancel(old);
                }
                Pending request=new Pending(chain.getThisObject(),value,currentProvider,show,chain.getArgs().toArray(),source);
                pending.put(source.getKey(),request);MAIN.postDelayed(request.timeout,DEADLINE_MS);
                // Do not retain a hook Chain or wait for drawing inside the hook.
                MAIN.post(()->{
                    if(pending.get(source.getKey())!=request)return;
                    try{
                        if(!valid(request)||!DynamicIslandHook.prepareHeadsUp(source,(Ranking)rankingMethod.invoke(value))) {
                            finish(request,false,"prepare_failed");return;
                        }
                        confirm(request);
                    }catch(Exception failure){finish(request,false,"prepare_exception");}
                });
                return null;
            }));
            installed=true;FeatureRuntimeLog.event("ISLAND_HEADSUP_CAPABILITY","ready:deferred_show_contract");return 3;
        }catch(Throwable missing){module.logFeatureError("ISLAND_HEADSUP_CONTRACT",missing);return 0;}
    }
    static String revision(StatusBarNotification source){
        Notification n=source.getNotification();
        int content=Objects.hash(n.when,n.flags,n.category,n.getChannelId(),
                n.extras==null?null:String.valueOf(n.extras.getCharSequence(Notification.EXTRA_TITLE)),
                n.extras==null?null:String.valueOf(n.extras.getCharSequence(Notification.EXTRA_TEXT)),n.contentIntent,
                n.extras==null?null:n.extras.get(Notification.EXTRA_PROGRESS),
                n.extras==null?null:n.extras.get(Notification.EXTRA_PROGRESS_MAX),
                n.extras==null?null:n.extras.get(Notification.EXTRA_PROGRESS_INDETERMINATE));
        if(n.actions!=null)for(Notification.Action action:n.actions)if(action!=null)content=31*content+Objects.hash(action.title,action.actionIntent);
        return source.getUserId()+":"+source.getUid()+":"+source.getKey()+":"+source.getPostTime()+":"+content;
    }
    static boolean same(StatusBarNotification a,StatusBarNotification b){return a!=null&&b!=null&&revision(a).equals(revision(b));}
    static boolean listenerMayShow(StatusBarNotification source,Ranking ranking){
        if(revision(source).equals(nativeAlerts.get(source.getKey())))return false;
        // High-importance messages await the original heads-up decision/binding. Lower importance
        // messages keep Duo's existing channel policy and never suppress an original banner.
        return ranking!=null&&ranking.getImportance()<android.app.NotificationManager.IMPORTANCE_HIGH;
    }
    static boolean downloadMayShow(StatusBarNotification source,Ranking ranking){
        if(ranking==null||ranking.getImportance()>=android.app.NotificationManager.IMPORTANCE_HIGH&&!installed)return false;
        // A failed handoff belongs to the original alert. Progress updates may resume
        // the island only after that banner ends; a new revision alone is insufficient.
        if(revision(source).equals(nativeAlerts.get(source.getKey())))return false;
        Object manager=headsUpManager.get();
        try{return manager==null||!Boolean.TRUE.equals(isHeadsUpEntry.invoke(manager,source.getKey()));}
        catch(ReflectiveOperationException|RuntimeException unknown){return false;}
    }
    private static boolean completeActions(Notification n){
        if(n.fullScreenIntent!=null||n.contentView!=null||n.bigContentView!=null||n.headsUpContentView!=null)return false;
        if(n.actions!=null)for(Notification.Action action:n.actions){
            if(action==null||action.actionIntent==null||action.isAuthenticationRequired())return false;
            if(action.getRemoteInputs()!=null&&action.getRemoteInputs().length>0)return false;
            if(action.getDataOnlyRemoteInputs()!=null&&action.getDataOnlyRemoteInputs().length>0)return false;
        }
        return n.actions==null||n.actions.length<=3;
    }
    private static boolean valid(Pending request)throws ReflectiveOperationException{
        return !Boolean.TRUE.equals(canceled.invoke(request.entry))&&!Boolean.TRUE.equals(dismissed.invoke(request.entry))
                &&request.revision.equals(revision(request.source))
                &&request.revision.equals(revision((StatusBarNotification)sbnMethod.invoke(request.entry)));
    }
    private static void confirm(Pending request){
        if(pending.get(request.source.getKey())!=request)return;
        if(SystemClock.uptimeMillis()>request.deadline){finish(request,false,"deadline");return;}
        try{
            if(!valid(request)){cancel(request);return;}
            if(!DynamicIslandHook.canPrepareHeadsUp(request.source,(Ranking)rankingMethod.invoke(request.entry))){
                finish(request,false,"environment_changed");return;
            }
            MAIN.removeCallbacks(request.nextFrame);
            if(DynamicIslandHook.confirmHeadsUp(request.source,request.nextFrame))finish(request,true,"drawn");
            else MAIN.postDelayed(request.nextFrame,16); // Only this bounded, active transaction.
        }catch(Exception missing){finish(request,false,"draw_failed");}
    }
    private static void finish(Pending request,boolean success,String reason){
        if(pending.get(request.source.getKey())!=request)return;
        pending.remove(request.source.getKey());MAIN.removeCallbacks(request.timeout);MAIN.removeCallbacks(request.nextFrame);
        boolean dispatched=false;
        try{
            if(!valid(request)){DynamicIslandHook.abortHeadsUp(request.source);return;}
            Object result=decision.invoke(request.decisionProvider,request.entry);
            if(!Boolean.TRUE.equals(shouldInterrupt.invoke(result))){
                DynamicIslandHook.abortHeadsUp(request.source);markNative(request.source);
                event("cancelled","native_policy_changed");return;
            }
            if(success){interruption.invoke(request.entry);event("island",reason);return;}
            DynamicIslandHook.abortHeadsUp(request.source);markNative(request.source);
            replay.set(true);
            try{dispatched=true;request.show.invoke(request.manager,request.args);event("native",reason);}
            finally{replay.remove();}
        }catch(ReflectiveOperationException|RuntimeException failure){
            DynamicIslandHook.abortHeadsUp(request.source);
            // The original show was already authorized. A failed optional recheck must not eat it.
            // Validation failure/withdrawal is different and never replays a stale source.
            try{if(!dispatched&&valid(request)){
                markNative(request.source);replay.set(true);
                try{request.show.invoke(request.manager,request.args);event("native","recheck_failed");}
                finally{replay.remove();}
            }}catch(ReflectiveOperationException|RuntimeException unavailable){event("restore_failed",unavailable.getClass().getSimpleName());}
        }
    }
    private static void markNative(StatusBarNotification source){
        Pending old=pending.get(source.getKey());if(old!=null)cancel(old);
        nativeAlerts.put(source.getKey(),revision(source));
        while(nativeAlerts.size()>128)nativeAlerts.remove(nativeAlerts.keySet().iterator().next());
        DynamicIslandHook.abortHeadsUp(source);
    }
    private static void cancel(Pending request){
        if(pending.get(request.source.getKey())==request)pending.remove(request.source.getKey());
        MAIN.removeCallbacks(request.timeout);MAIN.removeCallbacks(request.nextFrame);DynamicIslandHook.abortHeadsUp(request.source);
    }
    static void removed(StatusBarNotification source){
        Pending request=pending.get(source.getKey());if(request!=null&&source.getPostTime()>=request.source.getPostTime())cancel(request);
        if(revision(source).equals(nativeAlerts.get(source.getKey())))nativeAlerts.remove(source.getKey());
    }
    static void clear(){for(Pending request:pending.values().toArray(new Pending[0]))finish(request,false,"host_released");nativeAlerts.clear();}
    private static void event(String state,String reason){FeatureRuntimeLog.event("ISLAND_HEADSUP",state+":"+reason);}
    private IslandHeadsUpBridge(){ }
}
