package ls.augment.com.hook;

import android.os.SystemClock;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.concurrent.atomic.AtomicLong;
import io.github.libxposed.api.XposedInterface.HookHandle;

/** Bounds the OEM's per-frame diagnostic stack, never its native position setter. */
final class NotificationTraceBudgetHook {
    private static final String TYPE="com.android.systemui.statusbar.notification.stack.ViewState";
    private static final String OMITTED="[Duo: per-frame position stack omitted; sampled at most once per second]";
    private final ThreadLocal<Boolean> positionTrace=new ThreadLocal<>();
    private final AtomicLong lastSample=new AtomicLong(-1000),lastReport=new AtomicLong(-5000);
    private final AtomicLong sampled=new AtomicLong(),suppressed=new AtomicLong();

    static int install(AugmentModule module,ClassLoader loader){
        return new NotificationTraceBudgetHook().attach(module,loader);
    }
    private int attach(AugmentModule module,ClassLoader loader){
        HookHandle debugHook=null,positionHook=null;
        try{
            Class<?> type=Class.forName(TYPE,false,loader);
            Method setter=type.getDeclaredMethod("setYTranslation",float.class,String.class);
            if(setter.getReturnType()!=void.class||Modifier.isStatic(setter.getModifiers()))throw new NoSuchMethodException("position setter contract");
            // The old single-argument setter and ROMs without these diagnostic fields stay native.
            field(type,"mYTranslation",float.class);field(type,"mYTranslationSource",String.class);
            field(type,"currTranslationYStack",String.class);field(type,"lastTranslationYStack",String.class);
            Method valid=type.getDeclaredMethod("isValidFloat",float.class,String.class);
            if(valid.getReturnType()!=boolean.class||Modifier.isStatic(valid.getModifiers()))throw new NoSuchMethodException("position validation contract");
            Method callers=Class.forName("android.os.Debug",false,loader).getDeclaredMethod("getCallers",int.class);
            if(callers.getReturnType()!=String.class||!Modifier.isStatic(callers.getModifiers()))throw new NoSuchMethodException("diagnostic stack contract");
            debugHook=module.prepareFeatureHook(callers,"notification.trace_budget.callers",true).intercept(chain->{
                // Unrelated callers, other depths and invalid-coordinate diagnostics are untouched.
                if(!Boolean.TRUE.equals(positionTrace.get())||!Integer.valueOf(8).equals(chain.getArg(0)))return chain.proceed();
                long now=SystemClock.elapsedRealtime(),previous=lastSample.get();
                if(now-previous>=1000&&lastSample.compareAndSet(previous,now)){
                    sampled.incrementAndGet();Object result=chain.proceed();
                    try{report(now);}catch(RuntimeException unavailable){/* diagnostics cannot change the native result */}
                    return result;
                }
                suppressed.incrementAndGet();return OMITTED;
            });
            positionHook=module.prepareFeatureHook(setter,"notification.trace_budget.position",false).intercept(chain->{
                if(!Float.isFinite(((Number)chain.getArg(0)).floatValue()))return chain.proceed();
                Boolean previous=positionTrace.get();positionTrace.set(Boolean.TRUE);
                try{return chain.proceed();}finally{if(previous==null)positionTrace.remove();else positionTrace.set(previous);}
            });
            module.registerFeatureHook(debugHook);module.registerFeatureHook(positionHook);
            // The framework helper can be inlined into the native setter.
            module.deoptimize(setter);
            module.logFeatureInfo("NOTIFICATION_TRACE_BUDGET_READY period_ms=1000;native_setter_preserved=true");
            return 2;
        }catch(Throwable missing){
            if(positionHook!=null)try{positionHook.unhook();}catch(Throwable cleanup){module.logFeatureError("NOTIFICATION_TRACE_BUDGET_CLEANUP",cleanup);}
            if(debugHook!=null)try{debugHook.unhook();}catch(Throwable cleanup){module.logFeatureError("NOTIFICATION_TRACE_BUDGET_CLEANUP",cleanup);}
            module.logFeatureInfo("NOTIFICATION_TRACE_BUDGET_NATIVE reason="+missing.getClass().getSimpleName()+":"+missing.getMessage());
            return 0;
        }
    }
    private static void field(Class<?> type,String name,Class<?> expected)throws ReflectiveOperationException{
        Field f=type.getDeclaredField(name);
        if(f.getType()!=expected||Modifier.isStatic(f.getModifiers()))throw new NoSuchFieldException(name+" type/static mismatch");
    }
    private void report(long now){
        long before=lastReport.get();if(now-before<5000||!lastReport.compareAndSet(before,now))return;
        FeatureSettings.diagnostic(FeatureSettings.from(null),"ls_augment_notification_trace_budget",
                "sampled="+sampled.get()+";suppressed="+suppressed.get()+";period_ms=1000;observed_elapsed="+now
                        +";native_setter=preserved;scope=finite_position_debug_callers_8");
    }
    private NotificationTraceBudgetHook(){}
}
