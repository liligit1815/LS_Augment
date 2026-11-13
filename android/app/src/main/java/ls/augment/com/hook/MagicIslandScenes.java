package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import static ls.augment.com.hook.SystemUiAdapter.field;
import static ls.augment.com.hook.SystemUiAdapter.call;
import java.lang.reflect.*;
import java.util.*;
import ls.augment.com.*;

/** Controls the OEM receiver, preserving RemoteViews, actions, removal, expiry and native user gates. */
final class MagicIslandScenes {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static MagicIslandScenes active;
    private static boolean installed;
    private final Context context;
    private final Object host;
    private final Field cards;
    private final View root;
    private final IslandOwnershipRegistry ownership=new IslandOwnershipRegistry();
    private final IslandFrameProof frames=new IslandFrameProof();
    private final Runnable ownershipExpiry=this::refreshOwnership;
    private final android.view.ViewTreeObserver.OnPreDrawListener layout=()->{refreshOwnership();return true;};
    private boolean closed;
    private IslandNativeUpdateQueue updates;
    private Object replayingAdd;
    private static final ThreadLocal<Boolean> replayingUpdate=ThreadLocal.withInitial(()->false);
    private final Runnable changed=()->MAIN.post(this::refresh);
    static Method exact(Class<?> type,String name,Class<?> result,Class<?>...args)throws Exception{
        for(Class<?> c=type;c!=null;c=c.getSuperclass()){
            Method m;try{m=c.getDeclaredMethod(name,args);}catch(NoSuchMethodException missing){continue;}
            if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers())||Modifier.isAbstract(m.getModifiers()))throw new NoSuchMethodException(name+":signature");
            m.setAccessible(true);return m;
        }
        throw new NoSuchMethodException(name);
    }
    static Field typed(Class<?> type,String name,Class<?> value)throws Exception{
        for(Class<?> c=type;c!=null;c=c.getSuperclass()){
            Field f;try{f=c.getDeclaredField(name);}catch(NoSuchFieldException missing){continue;}
            if(!value.isAssignableFrom(f.getType())||Modifier.isStatic(f.getModifiers()))throw new NoSuchFieldException(name+":type");
            f.setAccessible(true);return f;
        }
        throw new NoSuchFieldException(name);
    }
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> app=Class.forName("com.zte.tools.AppTools",false,loader);
            Field flag=app.getField("ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN");
            if(flag.getType()!=boolean.class||!Modifier.isStatic(flag.getModifiers())||!flag.getBoolean(null))return 0;
            Class<?> type=Class.forName("com.zte.feature.dynamicisland.PermanentIslandManager",false,loader);
            Method disabled=exact(type,"isDynamicIslandDisabled",boolean.class,String.class);
            Method remove=exact(type,"handleRemoveIsland",void.class,String.class);typed(type,"mAppIslandList",Map.class);
            Class<?> message=Class.forName("com.zte.toolsdk.common.CardMessage",false,loader);
            Method receive=exact(type,"handleCardMessage",void.class,message,boolean.class);
            Method id=exact(message,"getCardId",String.class);
            module.registerFeatureHook(module.prepareFeatureHook(disabled,"native_island.magic_scene_gate",false).intercept(chain->{
                String key=(String)chain.getArg(0);Object result=chain.proceed();MagicIslandScenes current=active;
                // MultiScreen's SDK prefixes its already package-qualified raw ID. The native settings
                // gate recognizes the raw alias; preserve the wire ID for views, actions and removal.
                if(Boolean.FALSE.equals(result)&&current!=null&&current.host==chain.getThisObject()
                        &&current.completing(key)
                        &&"com.zte.multscr_com.zte.multscr.share_transfer".equals(key))
                    result=chain.proceed(new Object[]{"com.zte.multscr.share_transfer"});
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(receive,"native_island.magic_live_update",false).intercept(chain->{
                MagicIslandScenes current=active;Object messageValue=chain.getArg(0);
                if(current==null||current.host!=chain.getThisObject()||messageValue==null)return chain.proceed();
                boolean recreate=false;
                try{
                    String key=(String)id.invoke(messageValue);
                    // A fresh UPDATE after withdrawal may recreate the card; never replay saved messages.
                    recreate=current.completing(key)&&!((Map<?,?>)current.cards.get(current.host)).containsKey(key);
                }catch(Exception failure){current.unavailable(failure);}
                Object result=recreate?chain.proceed(new Object[]{messageValue,true}):chain.proceed();
                MAIN.post(current::refresh);
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(remove,"native_island.magic_capsule_remove",false).intercept(chain->{
                Object result=chain.proceed();MagicIslandScenes current=active;
                if(current!=null&&current.host==chain.getThisObject())MAIN.post(current::refresh);
                return result;
            }));
            int ordered=installUpdateQueue(module,type,loader);
            installed=true;return 3+ordered;
        }catch(Throwable missing){module.logFeatureError("MAGIC_ISLAND_SCENE_CONTRACT",missing);return 0;}
    }
    private static int installUpdateQueue(AugmentModule module,Class<?> manager,ClassLoader loader){
        try{
            Class<?> island=Class.forName("com.zte.feature.dynamicisland.DynamicPermanentIsland",false,loader);
            Method polling=exact(manager,"updateIslandVisibilityFullScreenPolling",void.class,island,boolean.class,boolean.class);
            Method add=exact(manager,"addPermanentIslandFullScreen",void.class,island,boolean.class);
            Method key=exact(island,"getPackageName",String.class);
            Field animation=typed(manager,"mAnimProcessing",boolean.class),updating=typed(manager,"mUpdateProcessing",boolean.class);
            Field nativePending=typed(manager,"mPendingUpdateTask",Runnable.class);
            module.registerFeatureHook(module.prepareFeatureHook(polling,"native_island.ordered_updates",false).intercept(chain->{
                MagicIslandScenes owner=active;Object card=chain.getArg(0);
                if(owner!=null&&owner.host==chain.getThisObject()&&owner.replayingAdd==card&&Boolean.TRUE.equals(chain.getArg(1))){
                    owner.replayingAdd=null;return chain.proceed();
                }
                if(replayingUpdate.get()||owner==null||owner.host!=chain.getThisObject()||card==null
                        ||!owner.completing((String)key.invoke(card)))return chain.proceed();
                boolean busy=owner.replayingAdd!=null||animation.getBoolean(owner.host)||updating.getBoolean(owner.host)||nativePending.get(owner.host)!=null;
                if(!busy&&(owner.updates==null||owner.updates.idle()))return chain.proceed();
                if(owner.updates==null)owner.updates=new IslandNativeUpdateQueue(()->{
                    try{return owner.replayingAdd!=null||animation.getBoolean(owner.host)||updating.getBoolean(owner.host)||nativePending.get(owner.host)!=null;}
                    catch(IllegalAccessException missing){return true;}
                },SystemClock::elapsedRealtime,new IslandNativeUpdateQueue.Scheduler(){
                    public void post(Runnable task,long delay){MAIN.postDelayed(task,delay);}
                    public void cancel(Runnable task){MAIN.removeCallbacks(task);}
                },()->FeatureRuntimeLog.state("ISLAND_NATIVE_UPDATE_QUEUE","fallback","native_animation_stalled_or_queue_full"));
                // Capture values, never a hook Chain: delivery may occur after this callback returns.
                Object[] args={card,chain.getArg(1),chain.getArg(2)};
                FeatureRuntimeLog.state("ISLAND_NATIVE_UPDATE_QUEUE","waiting","scene="+MagicIslandPolicy.scene((String)key.invoke(card))+";add="+args[1]);
                owner.updates.offer(()->{
                    if(Boolean.TRUE.equals(args[1])){
                        // The preceding removal can hide the window. Re-enter the OEM add entry
                        // to re-evaluate privacy/layout gates and restore its window before polling.
                        owner.replayingAdd=card;
                        try{add.invoke(owner.host,card,args[2]);}
                        catch(ReflectiveOperationException failure){owner.replayingAdd=null;FeatureRuntimeLog.state("ISLAND_NATIVE_UPDATE_QUEUE","failed",failure.getClass().getSimpleName());}
                        MAIN.post(()->{if(owner.replayingAdd==card)owner.replayingAdd=null;});
                        return;
                    }
                    replayingUpdate.set(true);
                    try{polling.invoke(owner.host,args);FeatureRuntimeLog.state("ISLAND_NATIVE_UPDATE_QUEUE","delivered","ordered_source_update");}
                    catch(ReflectiveOperationException failure){FeatureRuntimeLog.state("ISLAND_NATIVE_UPDATE_QUEUE","failed",failure.getClass().getSimpleName());}
                    finally{replayingUpdate.remove();}
                });
                return null;
            }));
            return 1;
        }catch(Exception missing){module.logFeatureInfo("ISLAND_NATIVE_UPDATE_QUEUE unavailable:"+missing.getMessage());return 0;}
    }
    MagicIslandScenes(Context context,Object host)throws Exception{
        if(!installed)throw new IllegalStateException("magic_scene_hooks_missing");
        this.context=context;this.host=host;
        exact(host.getClass(),"handleRemoveIsland",void.class,String.class);
        cards=typed(host.getClass(),"mAppIslandList",Map.class);
        Object view=typed(host.getClass(),"mDynamicIslandRoot",View.class).get(host);
        if(!(view instanceof View))throw new IllegalStateException("magic_root_missing");root=(View)view;
    }
    void start(){active=this;root.getViewTreeObserver().addOnPreDrawListener(layout);FeatureSettings.addSnapshotListener(context,changed);refresh();}
    private boolean selected(){return !closed&&FeatureSettings.enabled(context,SystemUiOptions.ISLAND);}
    private boolean completing(String key) {
        String scene=MagicIslandPolicy.scene(key);
        // Known native card routes belong to the master. Completion only owns missing producers.
        return selected() && scene!=null && IslandSceneSelection.enabled(context,scene);
    }
    void refresh(){
        if(closed)return;
        try{
            // This is an already-native fullscreen receiver. Unselected scenes stay OEM-owned.
            FeatureSettings.diagnostic(context,MagicIslandPolicy.CAPABILITY,"ready:"+BuildConfig.VERSION_CODE);
            refreshOwnership();
        }catch(Exception failure){unavailable(failure);}
    }
    static boolean owns(String scene){
        MagicIslandScenes owner=active;
        return owner!=null&&!owner.closed&&IslandSceneSelection.enabled(owner.context,scene)
                &&owner.ownership.owns(scene,SystemClock.elapsedRealtime());
    }
    private void refreshOwnership(){
        if(closed)return;
        Map<String,Object> visible=new HashMap<>(),transitioning=new HashMap<>();
        Set<View> live=Collections.newSetFromMap(new IdentityHashMap<>());
        try{
            if(selected()&&root.isAttachedToWindow()&&root.isShown()&&Boolean.TRUE.equals(field(host,"mInteractive"))
                    &&!Boolean.TRUE.equals(field(host,"mAODVisibility"))
                    &&!Boolean.TRUE.equals(field(host,"mQsPanelExpanded"))&&!Boolean.TRUE.equals(field(host,"mControlPanelExpanded"))) {
                Object current=call(host,"getPermanentIsland");
                for(Map.Entry<?,?> entry:((Map<?,?>)cards.get(host)).entrySet()) {
                    if(!(entry.getKey() instanceof String)||!(entry.getValue() instanceof View))continue;
                    String scene=MagicIslandPolicy.scene((String)entry.getKey());Object card=entry.getValue();
                    if(scene==null||!IslandSceneSelection.enabled(context,scene)||!NativeIslandScenes.capsuleSupported(scene))continue;
                    if(Boolean.TRUE.equals(field(host,"mOnKeyguard"))&&!Boolean.TRUE.equals(field(card,"mKeyguardIsland")))continue;
                    live.add((View)card);
                    boolean drawn=frames.confirm((View)card,card,this::refreshOwnership);
                    Object small=call(card,"getSmallIsland"),panel=call(card,"getPanelIsland");
                    if(small instanceof View){live.add((View)small);drawn|=frames.confirm((View)small,card,this::refreshOwnership);}
                    if(panel instanceof View){live.add((View)panel);drawn|=frames.confirm((View)panel,card,this::refreshOwnership);}
                    if(drawn)visible.put(scene,card);
                    else if(card==current&&(Boolean.TRUE.equals(field(host,"mAnimProcessing"))
                            ||Boolean.TRUE.equals(field(host,"mDynamicPanelClosing"))))transitioning.put(scene,card);
                }
            }
        }catch(Exception missing){FeatureRuntimeLog.state("ISLAND_CAPSULE_OWNER","unavailable",missing.getClass().getSimpleName());}
        frames.retain(live);
        ownership.reconcile(visible,transitioning,SystemClock.elapsedRealtime());
        NativeIslandScenes.fullscreenCapsules(ownership.scenes(SystemClock.elapsedRealtime()));
        MAIN.removeCallbacks(ownershipExpiry);long expiry=ownership.nextExpiry();
        if(expiry>0)MAIN.postDelayed(ownershipExpiry,Math.max(1,expiry-SystemClock.elapsedRealtime()));
    }
    private void unavailable(Exception failure){FeatureSettings.diagnostic(context,MagicIslandPolicy.CAPABILITY,"unavailable:"+failure.getClass().getSimpleName());close();}
    void close(){closed=true;FeatureSettings.removeSnapshotListener(changed);MAIN.removeCallbacks(ownershipExpiry);
        if(updates!=null){updates.close();updates=null;}
        if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnPreDrawListener(layout);
        frames.clear();ownership.clear();if(active==this){active=null;NativeIslandScenes.fullscreenCapsules(Collections.emptySet());}}
}
