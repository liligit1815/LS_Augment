package ls.augment.com.hook;

import android.animation.Animator;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.SystemUiOptions;

/** Controls only the OEM island's reservation. Ordinary icon filtering and overflow remain native. */
final class IslandStatusBarAvoidanceHook {
    private static final String PM="com.zte.feature.dynamicisland.PermanentIslandManager";
    private static final String DISPLAY="com.zte.feature.notification.module.NotificationIconDisplay";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<Object,State> STATES=new WeakHashMap<>();
    private static final ThreadLocal<Boolean> REPLAY=ThreadLocal.withInitial(()->false);
    private static final Runnable CHANGED=IslandStatusBarAvoidanceHook::refresh;
    private static Access access;
    private static String capability="unavailable:not_installed";
    private static Context context;
    private static boolean lastEnabled=true;

    static int install(AugmentModule module,ClassLoader loader){
        try{
            Access found=new Access(Class.forName(PM,false,loader),Class.forName(DISPLAY,false,loader));
            // Validate the entire reservation contract before installing any override.
            access=found;int count=0;
            for(Method method:found.requests){
                module.deoptimize(method);
                module.registerFeatureHook(module.prepareFeatureHook(method,"island.avoidance."+method.getName(),false).intercept(chain->{
                    if(access!=found)return chain.proceed();
                    Object owner=chain.getThisObject();Object[] args=chain.getArgs().toArray();
                    State state=state(owner);
                    if(!REPLAY.get())state.remember(method,args);
                    if(disabled()){
                        if(method.equals(found.notificationBounds)){
                            if(found.resetNotificationBounds!=null){
                                boolean previous=REPLAY.get();REPLAY.set(true);
                                try{found.resetNotificationBounds.invoke(owner);}finally{REPLAY.set(previous);}return null;
                            }
                            args[0]=1; // Fixed-width fullscreen contract: mode 1 restores the native boundary.
                        }else args[0]=false;
                    }
                    // OEM's second=true branch shows the summary regardless of the first flag.
                    // Replays also need the complete native transition from the previous policy.
                    if(method.equals(found.notification)&&(disabled()||REPLAY.get()))args[1]=false;
                    return chain.proceed(args);
                }));count++;
            }
            module.deoptimize(found.setWidth);
            module.registerFeatureHook(module.prepareFeatureHook(found.setWidth,"island.avoidance.width",false).intercept(chain->{
                if(access!=found)return chain.proceed();
                Object[] args=chain.getArgs().toArray();
                if(disabled()){
                    int width=found.unreservedWidth(chain.getThisObject(),args[0]);
                    if(width>0)args[1]=width;
                }
                return chain.proceed(args);
            }));count++;
            if(found.rightBound!=null){
                module.deoptimize(found.rightBound);
                module.registerFeatureHook(module.prepareFeatureHook(found.rightBound,"island.avoidance.bound",false)
                        .intercept(chain->disabled()?(found.rightBound.getParameterCount()==0?0:chain.getArg(0)):chain.proceed()));count++;
            }
            if(found.resetWidth!=null){
                module.deoptimize(found.resetWidth);
                module.registerFeatureHook(module.prepareFeatureHook(found.resetWidth,"island.avoidance.reset",false).intercept(chain->{
                    if(access!=found)return chain.proceed();
                    if(!REPLAY.get())state(chain.getThisObject()).resetWidth();
                    return chain.proceed();
                }));count++;
            }
            if(found.resetNotificationBounds!=null){
                module.deoptimize(found.resetNotificationBounds);
                module.registerFeatureHook(module.prepareFeatureHook(found.resetNotificationBounds,"island.avoidance.resetBounds",false).intercept(chain->{
                    if(access==found&&!REPLAY.get())state(chain.getThisObject()).requested.remove(found.notificationBounds);
                    return chain.proceed();
                }));count++;
            }
            module.deoptimize(found.animation);
            module.registerFeatureHook(module.prepareFeatureHook(found.animation,"island.avoidance.animation",false).intercept(chain->{
                Object value=chain.proceed();
                if(access==found&&value instanceof Animator){State state=state(chain.getThisObject());state.pruneAnimations();state.animations.add(new WeakReference<>((Animator)value));}
                return value;
            }));count++;
            capability="ready:"+ls.augment.com.BuildConfig.VERSION_CODE+";"+found.route;
            module.logFeatureInfo("ISLAND_AVOIDANCE "+capability);return count;
        }catch(ReflectiveOperationException|RuntimeException unavailable){
            access=null;capability="unavailable:"+unavailable.getClass().getSimpleName()+":"+unavailable.getMessage();
            module.logFeatureError("ISLAND_AVOIDANCE",unavailable);return 0;
        }
    }
    static void attach(Context value){
        if(value==null)return;
        if(context==null){context=value.getApplicationContext();lastEnabled=!disabled();FeatureSettings.addSnapshotListener(context,CHANGED);}
        FeatureSettings.diagnostic(context,"ls_augment_island_avoidance_capability",capability);
    }
    private static boolean disabled(){
        return access!=null&&context!=null&&"0".equals(FeatureSettings.snapshot(context).get(SystemUiOptions.ISLAND_STATUS_AVOIDANCE));
    }
    private static State state(Object owner){
        attach(SystemUiAdapter.context(owner));
        State found=STATES.get(owner);if(found==null){found=new State(owner);STATES.put(owner,found);}return found;
    }
    private static void refresh(){
        if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(CHANGED);return;}
        boolean enabled=!disabled();if(enabled==lastEnabled||access==null)return;lastEnabled=enabled;
        boolean restored=true;for(State state:new ArrayList<>(STATES.values()))restored&=state.reapply();
        if(restored)FeatureSettings.diagnostic(context,"ls_augment_island_avoidance_runtime",(enabled?"native":"no_reservation")+";build="+ls.augment.com.BuildConfig.VERSION_CODE);
    }
    private static final class State {
        final WeakReference<Object> owner;
        final Map<Method,Object[]> requested=new LinkedHashMap<>();
        final List<WeakReference<Animator>> animations=new ArrayList<>();
        State(Object value){owner=new WeakReference<>(value);}
        void remember(Method method,Object[] args){requested.put(method,args.clone());pruneAnimations();}
        void resetWidth(){Object[] args=requested.get(access.width);if(args!=null)args[0]=false;}
        void pruneAnimations(){animations.removeIf(ref->ref.get()==null||!ref.get().isStarted());}
        void finishAnimations(){
            // The OEM switches containers in onAnimationEnd and starts a second animator there.
            // Finish both phases before applying the new policy, so stale callbacks cannot hide icons again.
            for(int pass=0;pass<4;pass++){
                List<WeakReference<Animator>> pending=new ArrayList<>(animations);animations.clear();
                boolean running=false;
                for(WeakReference<Animator> ref:pending){Animator animation=ref.get();if(animation!=null&&animation.isStarted()){running=true;animation.end();}}
                if(!running)break;
            }
        }
        boolean reapply(){
            Object target=owner.get();if(target==null)return true;
            boolean previous=REPLAY.get();REPLAY.set(true);
            try{
                finishAnimations();
                for(Map.Entry<Method,Object[]> entry:new ArrayList<>(requested.entrySet()))entry.getKey().invoke(target,entry.getValue().clone());
                return true;
            }catch(ReflectiveOperationException|RuntimeException failure){
                FeatureSettings.diagnostic(context,"ls_augment_island_avoidance_runtime","restore_failed:"+failure.getClass().getSimpleName());
                return false;
            }finally{REPLAY.set(previous);}
        }
    }
    /** Full signatures, field types and inherited declarations select old/new OEM paths. */
    static final class Access {
        final Method width,setWidth,notification,animation,notificationBounds,rightBound,resetNotificationBounds,resetWidth;
        final List<Method> requests=new ArrayList<>();
        final List<Field[]> containers=new ArrayList<>();
        final String route;
        Access(Class<?> manager,Class<?> display)throws ReflectiveOperationException{
            notification=method(display,"setDynamicIslandShowing",void.class,boolean.class,boolean.class);
            animation=method(display,"createNotificationIconAnimation",Animator.class,boolean.class,boolean.class);
            field(display,"mDynamicIslandShowing",boolean.class);
            setWidth=method(manager,"setViewWidth",void.class,View.class,int.class);
            Class<?> island=Class.forName("com.zte.feature.dynamicisland.DynamicPermanentIsland",false,manager.getClassLoader());
            Method legacy=optional(manager,"updateSystemContainerWidth",void.class,boolean.class);
            Method fixed=optional(manager,"updateSystemContainerWidth",void.class,boolean.class,boolean.class);
            if(fixed!=null){
                route="fixed_geometry";width=fixed;
                containers.add(new Field[]{field(manager,"mSystemIconContainer",View.class),field(manager,"mSystemParent",ViewGroup.class)});
                containers.add(new Field[]{field(manager,"mKeyguardSystemContainer",View.class),field(manager,"mKeyguardSystemParent",ViewGroup.class)});
                notificationBounds=method(manager,"updateNotificationContainerWidthFullScreen",void.class,int.class);
                rightBound=method(manager,"getRightBound",int.class);
                field(manager,"mRightBound",int.class);
                resetNotificationBounds=resetWidth=null;
            }else if(legacy!=null){
                route="legacy";width=legacy;
                containers.add(new Field[]{field(manager,"mStatusIconContainer",View.class),field(manager,"mSystemParent",ViewGroup.class)});
                notificationBounds=rightBound=resetNotificationBounds=resetWidth=null;
            }else{
                route="geometry";width=method(manager,"updateSystemContainerWidth",void.class,boolean.class,boolean.class,island,int.class);
                containers.add(new Field[]{field(manager,"mSystemIconContainer",View.class),field(manager,"mSystemParent",ViewGroup.class)});
                containers.add(new Field[]{field(manager,"mKeyguardSystemContainer",View.class),field(manager,"mKeyguardSystemParent",ViewGroup.class)});
                notificationBounds=method(manager,"updateNotificationContainerWidthFullScreen",void.class,island,int.class);
                rightBound=method(manager,"getRightBound",float.class,float.class);
                resetNotificationBounds=method(manager,"resetNotificationContainerWidth",void.class);
                resetWidth=method(manager,"resetSystemContainerWidth",void.class);
                field(manager,"mRightBound",int.class);
            }
            requests.add(notification);requests.add(width);
            requests.add(method(manager,"updateKeyguardBarWidth",void.class,boolean.class));
            Method carrier=optional(manager,"updateCarrierTextWidth",void.class,boolean.class,island);
            if(carrier!=null)requests.add(carrier);
            if(notificationBounds!=null)requests.add(notificationBounds);
        }
        int unreservedWidth(Object owner,Object view)throws IllegalAccessException{
            for(Field[] pair:containers)if(pair[0].get(owner)==view){
                Object parent=pair[1].get(owner);if(parent instanceof ViewGroup)return ((ViewGroup)parent).getWidth();
            }
            return -1;
        }
        static Method optional(Class<?> type,String name,Class<?> result,Class<?>...args)throws ReflectiveOperationException{
            for(Class<?> cursor=type;cursor!=null;cursor=cursor.getSuperclass()){
                Method method;try{method=cursor.getDeclaredMethod(name,args);}catch(NoSuchMethodException absent){continue;}
                if(method.getReturnType()!=result||Modifier.isStatic(method.getModifiers()))throw new NoSuchMethodException(name+": signature");
                method.setAccessible(true);return method;
            }return null;
        }
        static Method method(Class<?> type,String name,Class<?> result,Class<?>...args)throws ReflectiveOperationException{
            Method method=optional(type,name,result,args);if(method==null)throw new NoSuchMethodException(type.getName()+"."+name);return method;
        }
        static Field field(Class<?> type,String name,Class<?> expected)throws ReflectiveOperationException{
            for(Class<?> cursor=type;cursor!=null;cursor=cursor.getSuperclass()){
                Field field;try{field=cursor.getDeclaredField(name);}catch(NoSuchFieldException absent){continue;}
                if(!expected.isAssignableFrom(field.getType())||Modifier.isStatic(field.getModifiers()))throw new NoSuchFieldException(name+": type");
                field.setAccessible(true);return field;
            }throw new NoSuchFieldException(type.getName()+"."+name);
        }
    }
}
