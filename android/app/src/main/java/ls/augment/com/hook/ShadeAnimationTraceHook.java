package ls.augment.com.hook;

import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicLong;
import io.github.libxposed.api.XposedInterface.HookHandle;

/** Samples audited OEM diagnostic calls without replacing touch, blur or animation work. */
final class ShadeAnimationTraceHook {
    private static final String WINDOW="com.zte.controlcenter.ControlPanelWindowView";
    private static final String SWITCH="com.zte.controlcenter.policy.NCSwitchController";
    private static final String PANEL="com.zte.controlcenter.policy.MfvNotificationPanelViewController";
    private static volatile long lastMotionAt;
    private final ThreadLocal<Scope> current=new ThreadLocal<>();
    private static final class Budget {
        final String name,omitted;final int depth;
        final AtomicLong last=new AtomicLong(-1000),sampled=new AtomicLong(),suppressed=new AtomicLong(),reported=new AtomicLong(-5000);
        Budget(String name,int depth){this.name=name;this.depth=depth;this.omitted="[Duo: "+name+" diagnostic stack omitted; sampled once per second]";}
    }
    private static final class Scope {final Budget budget;boolean consumed;Scope(Budget budget){this.budget=budget;}}
    static boolean motionRecent(long now){long last=lastMotionAt;return last>0&&now>=last&&now-last<250;}
    static int install(AugmentModule module,ClassLoader loader){return new ShadeAnimationTraceHook().attach(module,loader);}
    private int attach(AugmentModule module,ClassLoader loader){
        HookHandle callersHook=null;ArrayList<HookHandle> targets=new ArrayList<>();
        try{
            Method callers=Class.forName("android.os.Debug",false,loader).getDeclaredMethod("getCallers",int.class);
            if(callers.getReturnType()!=String.class||!Modifier.isStatic(callers.getModifiers()))throw new NoSuchMethodException("Debug.getCallers contract");
            callersHook=module.prepareFeatureHook(callers,"shade.trace_budget.callers",true).intercept(chain->{
                Scope scope=current.get();
                if(scope==null||scope.consumed||!Integer.valueOf(scope.budget.depth).equals(chain.getArg(0)))return chain.proceed();
                // Only the first matching diagnostic in this native invocation belongs to the audited call site.
                scope.consumed=true;Budget budget=scope.budget;long now=SystemClock.uptimeMillis(),last=budget.last.get();
                if(now-last>=1000&&budget.last.compareAndSet(last,now)){
                    budget.sampled.incrementAndGet();Object result=chain.proceed();
                    try{report(budget,now);}catch(RuntimeException unavailable){/* keep the original result */}
                    return result;
                }
                budget.suppressed.incrementAndGet();return budget.omitted;
            });
            target(module,loader,targets,SWITCH,"handleCNSwitchTouch",boolean.class,new Class<?>[]{MotionEvent.class,boolean.class},
                    new String[]{"mIsCNHandleTouch","mInitialTouchX","mInitialTouchY","mTouchSlop"},new Class<?>[]{boolean.class,float.class,float.class,int.class},2,true,null);
            target(module,loader,targets,WINDOW,"updateExpandHeight",void.class,new Class<?>[]{float.class},
                    new String[]{"mExpandHeight","mAttached","mContentShowing"},new Class<?>[]{float.class,boolean.class,boolean.class},4,false,View.class.getName());
            target(module,loader,targets,WINDOW,"updateBlur",void.class,new Class<?>[]{float.class,boolean.class,boolean.class},
                    new String[]{"mExpandHeight","mBlurRatio"},new Class<?>[]{float.class,float.class},4,false,View.class.getName());
            target(module,loader,targets,PANEL,"setExpandedHeightInternal",void.class,new Class<?>[]{float.class},
                    new String[]{"mNCSwitching","mPanelOpening","mPanelCollapsing"},new Class<?>[]{boolean.class,boolean.class,boolean.class},7,false,
                    "com.android.systemui.shade.NotificationPanelViewController");
            if(targets.isEmpty()){callersHook.unhook();return 0;}
            module.registerFeatureHook(callersHook);
            module.logFeatureInfo("SHADE_TRACE_BUDGET_READY targets="+targets.size()+";native_touch_blur_animation=preserved");
            return targets.size()+1;
        }catch(Throwable missing){
            for(HookHandle target:targets)try{target.unhook();}catch(Throwable cleanup){module.logFeatureError("SHADE_TRACE_CLEANUP",cleanup);}
            if(callersHook!=null)try{callersHook.unhook();}catch(Throwable cleanup){module.logFeatureError("SHADE_TRACE_CLEANUP",cleanup);}
            module.logFeatureInfo("SHADE_TRACE_BUDGET_NATIVE "+missing.getClass().getSimpleName()+":"+missing.getMessage());return 0;
        }
    }
    private void target(AugmentModule module,ClassLoader loader,ArrayList<HookHandle> targets,String typeName,String name,
            Class<?> result,Class<?>[] parameters,String[] fields,Class<?>[] types,int depth,boolean touch,String baseClass){
        HookHandle handle=null;
        try{
            Class<?> type=Class.forName(typeName,false,loader);
            if(baseClass!=null&&!Class.forName(baseClass,false,loader).isAssignableFrom(type))throw new NoSuchMethodException("unexpected base class: "+baseClass);
            Method method=type.getDeclaredMethod(name,parameters);
            if(method.getReturnType()!=result||Modifier.isStatic(method.getModifiers()))throw new NoSuchMethodException(name+" signature");
            for(int i=0;i<fields.length;i++){
                java.lang.reflect.Field field=type.getDeclaredField(fields[i]);
                if(field.getType()!=types[i]||Modifier.isStatic(field.getModifiers()))throw new NoSuchFieldException(fields[i]+" type/static");
            }
            Budget budget=new Budget(name,depth);
            handle=module.prepareFeatureHook(method,"shade.trace_budget."+name,false).intercept(chain->{
                Object argument=chain.getArg(0);
                // Keep DOWN/UP/CANCEL and invalid-value diagnostics at their original detail.
                if(touch?!(argument instanceof MotionEvent)||((MotionEvent)argument).getActionMasked()!=MotionEvent.ACTION_MOVE
                        :!(argument instanceof Number)||!Float.isFinite(((Number)argument).floatValue()))return chain.proceed();
                lastMotionAt=SystemClock.uptimeMillis();Scope previous=current.get();current.set(new Scope(budget));
                try{return chain.proceed();}finally{if(previous==null)current.remove();else current.set(previous);}
            });
            module.deoptimize(method);module.registerFeatureHook(handle);targets.add(handle);
        }catch(Throwable missing){
            if(handle!=null)try{handle.unhook();}catch(Throwable cleanup){module.logFeatureError("SHADE_TRACE_CLEANUP",cleanup);}
            module.logFeatureInfo("SHADE_TRACE_TARGET_NATIVE target="+typeName+"."+name+";reason="+missing.getClass().getSimpleName()+":"+missing.getMessage());
        }
    }
    private static void report(Budget budget,long now){
        long last=budget.reported.get();if(now-last<5000||!budget.reported.compareAndSet(last,now))return;
        FeatureSettings.diagnostic(FeatureSettings.from(null),"ls_augment_shade_trace_"+budget.name,
                "sampled="+budget.sampled.get()+";suppressed="+budget.suppressed.get()+";period_ms=1000;observed_uptime="+now+";native_work=preserved");
    }
    private ShadeAnimationTraceHook(){}
}
