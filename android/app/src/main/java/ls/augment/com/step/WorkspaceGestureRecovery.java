package ls.augment.com.step;

import android.app.Activity;
import android.os.SystemClock;
import java.lang.reflect.*;
import java.util.List;
import ls.augment.com.hook.AugmentModule;

/** Retire a settled, background RECENTS session before native consumer construction. */
final class WorkspaceGestureRecovery {
    static boolean stale(boolean lease,int display,boolean running,boolean settled,String target,boolean foreground){
        return lease && display==0 && running && settled && "RECENTS".equals(target) && !foreground;
    }
    static Method created(Class<?> type)throws NoSuchMethodException{
        for(String name:new String[]{"getCreatedContainer","getCreatedActivity"})
            try{return OwnershipBridge.method(type,name);}catch(NoSuchMethodException absent){}
        throw new NoSuchMethodException("native overview container");
    }
    static void install(AugmentModule module,Class<?> consumer,Class<?> manager,Class<?> gesture,ClassLoader loader){
        try{
            Field last=StepMembers.findField(manager,"mLastGestureState");
            Method running=OwnershipBridge.method(manager,"isRecentsAnimationRunning");
            Method display=OwnershipBridge.method(gesture,"getDisplayId"),target=OwnershipBridge.method(gesture,"getEndTarget");
            Method state=OwnershipBridge.method(gesture,"hasState",int.class);
            Field ended=StepMembers.findField(gesture,"STATE_END_TARGET_ANIMATION_FINISHED");
            Method container;
            try{container=OwnershipBridge.method(gesture,"getContainerInterface");}
            catch(NoSuchMethodException older){container=OwnershipBridge.method(gesture,"getActivityInterface");}
            final Method interfaceMethod=container;
            Method finish;Object reason=null;
            try{finish=OwnershipBridge.method(manager,"finishRunningRecentsAnimation",boolean.class,boolean.class);}
            catch(NoSuchMethodException newer){
                Class<?> text=Class.forName("com.android.quickstep.util.ActiveGestureLog$CompoundString",false,loader);
                finish=OwnershipBridge.method(manager,"finishRunningRecentsAnimation",boolean.class,boolean.class,Runnable.class,text);
                reason=text.getConstructor(String.class,Object[].class).newInstance("Step: settled background recents before a new gesture",new Object[0]);
            }
            if(running.getReturnType()!=boolean.class || state.getReturnType()!=boolean.class || finish.getReturnType()!=void.class
                    || display.getReturnType()!=int.class || ended.getType()!=int.class || !Modifier.isStatic(ended.getModifiers()))
                throw new NoSuchMethodException("native recents lifecycle contract");
            final Method end=finish;final Object why=reason;int hooks=0;
            for(Constructor<?> constructor:consumer.getDeclaredConstructors()){
                Class<?>[] parameters=constructor.getParameterTypes();int at=-1,gs=-1;
                for(int n=0;n<parameters.length;n++){if(parameters[n]==manager)at=n;if(parameters[n]==gesture)gs=n;}
                if(at<0 || gs<0)continue;
                final int index=at,gestureIndex=gs;
                module.hook(constructor).intercept(chain->{
                    List<Object> args=chain.getArgs();Object animation=args.get(index),incoming=args.get(gestureIndex);
                    try{
                        if(WorkspaceGestureGate.leased(SystemClock.uptimeMillis()) && (Integer)display.invoke(incoming)==0 && (Boolean)running.invoke(animation)){
                            Object old=last.get(animation);
                            if(old!=null){
                                Object ui=interfaceMethod.invoke(old);
                                Object activity=ui==null?null:created(ui.getClass()).invoke(ui);
                                if(activity instanceof Activity && stale(true,0,true,(Boolean)state.invoke(old,ended.getInt(null)),
                                        String.valueOf(target.invoke(old)),((Activity)activity).hasWindowFocus())){
                                    if(end.getParameterCount()==2)end.invoke(animation,false,true);else end.invoke(animation,false,true,null,why);
                                    StepRuntime.diagnostic("GESTURE_RECOVERY","native_finish_background_recents;running="+running.invoke(animation));
                                }
                            }
                        }
                    }catch(ReflectiveOperationException|RuntimeException|LinkageError missing){StepRuntime.diagnostic("GESTURE_RECOVERY","native_fallback;reason="+missing);}
                    return chain.proceed();
                });hooks++;
            }
            if(hooks==0)throw new NoSuchMethodException("native consumer constructor");
            StepRuntime.diagnostic("GESTURE_RECOVERY_CAPABILITY",end.toGenericString()+";constructors="+hooks);
        }catch(ReflectiveOperationException|RuntimeException|LinkageError missing){StepRuntime.diagnostic("GESTURE_RECOVERY_UNAVAILABLE",missing.toString());}
    }
}
