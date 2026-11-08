package ls.augment.com.hook;

import android.content.Context;
import android.os.Build;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import ls.augment.com.ExtraDimRuntime;

/** Adapt the platform color pipeline by its interfaces, independently of device model. */
final class ExtraDimHook {
    private static boolean installed;
    private static final java.util.Set<Class<?>> observedNativeTypes=new java.util.HashSet<>();

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Class<?> service=Class.forName("com.android.server.display.color.ColorDisplayService",false,loader);
            Class<?> tint=Class.forName("com.android.server.display.color.TintController",false,loader);
            Class<?> reduction=Class.forName("com.android.server.display.color.ReduceBrightColorsTintController",false,loader);
            Class<?> base=Class.forName("com.android.server.SystemService",false,loader);
            Class<?> manager=Class.forName("com.android.server.display.color.DisplayTransformManager",false,loader);
            Method apply=service.getDeclaredMethod("applyTint",tint,boolean.class);
            Method available=reduction.getDeclaredMethod("isAvailable",Context.class);
            Method state=tint.getDeclaredMethod("isActivated");
            Method strength=reduction.getDeclaredMethod("getStrength");
            Method expected=reduction.getDeclaredMethod("getMatrix");
            Method level=reduction.getDeclaredMethod("getLevel");
            Method actual=manager.getDeclaredMethod("getColorMatrix",int.class);
            Method local=base.getDeclaredMethod("getLocalService",Class.class);
            Method context=base.getMethod("getContext");
            Method dump=service.getDeclaredMethod("dumpInternal",PrintWriter.class);
            Method nativeActivation=service.getDeclaredMethod("onReduceBrightColorsActivationChanged",boolean.class);
            Method nativeStrength=service.getDeclaredMethod("onReduceBrightColorsStrengthLevelChanged");
            Field user=service.getDeclaredField("mCurrentUser");
            Field nativeHandler=service.getDeclaredField("mHandler");
            Field controller=service.getDeclaredField("mReduceBrightColorsTintController");
            for(Method method:new Method[]{apply,available,state,strength,expected,level,actual,local,dump,nativeActivation,nativeStrength})method.setAccessible(true);
            user.setAccessible(true);controller.setAccessible(true);nativeHandler.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(apply,"extra_dim.transform",false).intercept(chain -> {
                Object target=chain.getArg(0);
                if(reduction.isInstance(target))try {
                    Object instance=chain.getThisObject();int current=user.getInt(instance);
                    Context ctx=(Context)context.invoke(instance);
                    ExtraDimOwnershipClient.State request = request(module, instance, ctx, current, nativeHandler, user, controller, apply, nativeActivation, nativeStrength);
                    if(request.owned && Boolean.TRUE.equals(available.invoke(target,ctx))) {
                        // applyTint can follow a newer native Settings callback while
                        // our asynchronous ownership snapshot still contains the old
                        // request. Never overwrite the live controller here: doing so
                        // bypasses the listener that rebuilds automatic-brightness curves.
                        int nativeAmount=(Integer)strength.invoke(target);
                        FeatureSettings.diagnostic(ctx,"ls_augment_extra_dim_runtime","user="+current+";owned=1;requested="+(request.active?1:0)+";strength="+request.strength+";nativeStrength="+nativeAmount+";active="+(Boolean.TRUE.equals(state.invoke(target))?1:0)+";sync=native_callbacks;model="+Build.MODEL);
                        String detail="user="+current+";requested="+request.active+";strength="+request.strength
                                +";"+describe(target,state,strength);
                        FeatureRuntimeLog.state("EXTRA_DIM_APPLY",detail,detail+";"+ExtraDimOwnershipClient.evidence());
                        if(request.active!=Boolean.TRUE.equals(state.invoke(target))||nativeAmount!=nativeStrength(ctx,request.strength))
                            ExtraDimOwnershipClient.reconcile(current,(android.os.Handler)nativeHandler.get(instance));
                    }
                }catch(ReflectiveOperationException | RuntimeException error){module.logFeatureError("EXTRA_DIM_STATE",error);}
                return chain.proceed();
            }));
            // Read the live controller AND the transform slot, never saved requests.
            module.registerFeatureHook(module.prepareFeatureHook(dump,"extra_dim.execution_readback",false).intercept(chain -> {
                Object result=chain.proceed();PrintWriter writer=(PrintWriter)chain.getArg(0);
                try {
                    Object instance=chain.getThisObject(),target=controller.get(instance);
                    Context ctx=(Context)context.invoke(instance);int current=user.getInt(instance);
                    boolean supported=target!=null && Boolean.TRUE.equals(available.invoke(target,ctx));
                    boolean on=target!=null && Boolean.TRUE.equals(state.invoke(target));
                    int amount=target==null?50:(Integer)strength.invoke(target);
                    int nativeAmount=amount;
                    ExtraDimOwnershipClient.State request=request(module,instance,ctx,current,nativeHandler,user,controller,apply,nativeActivation,nativeStrength);
                    boolean mapped=!request.owned||nativeAmount==nativeStrength(ctx,request.strength);
                    if(request.owned)amount=request.strength;
                    boolean verified=false,managerPresent=false,matrixMatches=false;
                    boolean activationMatches=!request.owned||request.active==on;
                    if(supported) {
                        Object transforms=local.invoke(instance,manager);
                        float[] wanted=(float[])expected.invoke(target);
                        float[] applied=transforms==null?null:(float[])actual.invoke(transforms,(Integer)level.invoke(target));
                        managerPresent=transforms!=null;
                        matrixMatches=managerPresent&&ExtraDimRuntime.sameTransform(on,nativeAmount,wanted,applied);
                        verified=mapped && activationMatches && matrixMatches;
                    }
                    writer.println(ExtraDimRuntime.PREFIX+"user="+current+";available="+(supported?1:0)+";active="+(on?1:0)+";strength="+amount+";transform="+(verified?1:0));
                    writer.println("LSA_EXTRA_DIM_NATIVE_V1 user="+current+";owned="+(request.owned?1:0)+";nativeStrength="+nativeAmount+";mapping="+(mapped?1:0));
                    String reason=!supported?"unavailable":!activationMatches?"activation_mismatch":!mapped?"strength_mismatch"
                            :!managerPresent?"manager_missing":!matrixMatches?"matrix_mismatch":"verified";
                    String detail="user="+current+";owned="+request.owned+";requested="+request.active+";active="+on
                            +";strength="+amount+";nativeStrength="+nativeAmount+";mapping="+mapped
                            +";activationMatch="+activationMatches+";manager="+managerPresent+";matrix="+matrixMatches+";reason="+reason;
                    writer.println("LSA_EXTRA_DIM_DIAGNOSTIC_V1 "+detail+";"+ExtraDimOwnershipClient.evidence());
                    FeatureRuntimeLog.state("EXTRA_DIM_READBACK",detail,detail+";"+ExtraDimOwnershipClient.evidence());
                    if(supported&&request.owned&&(!activationMatches||!mapped))
                        ExtraDimOwnershipClient.reconcile(current,(android.os.Handler)nativeHandler.get(instance));
                }catch(ReflectiveOperationException | RuntimeException error){module.logFeatureError("EXTRA_DIM_READBACK",error);}
                return result;
            }));
            // Observe native notifications, including calls unrelated to Duo.
            // The original return/exception and the boolean's native meaning remain unchanged.
            for(Method callback:new Method[]{nativeActivation,nativeStrength}) {
                module.registerFeatureHook(module.prepareFeatureHook(callback,"extra_dim.native_callback."+callback.getName(),false).intercept(chain->{
                    Object instance=chain.getThisObject();
                    Object target;
                    try{target=controller.get(instance);}catch(ReflectiveOperationException|RuntimeException unavailable){return chain.proceed();}
                    String before=describe(target,state,strength);
                    try {
                        Object result=chain.proceed();
                        try{FeatureRuntimeLog.event("EXTRA_DIM_NATIVE_CALLBACK","method="+callback.getName()+";user="+user.getInt(instance)
                                +";argument="+(callback.getParameterCount()==0?"none":chain.getArg(0))
                                +";before="+before+";after="+describe(target,state,strength)+";"+ExtraDimOwnershipClient.evidence());
                        }catch(ReflectiveOperationException|RuntimeException ignored){ }
                        return result;
                    }catch(Throwable error){
                        FeatureRuntimeLog.event("EXTRA_DIM_NATIVE_ERROR","method="+callback.getName()+";exception="+FeatureRuntimeLog.failure(error));
                        throw error;
                    }
                }));
            }
            try {
                Method setter=reduction.getMethod("setActivated",Boolean.class);setter.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(setter,"extra_dim.activation_write",false).intercept(chain->{
                    if(!reduction.isInstance(chain.getThisObject()))return chain.proceed();
                    String before=describe(chain.getThisObject(),state,strength);
                    Object result=chain.proceed();
                    FeatureRuntimeLog.event("EXTRA_DIM_ACTIVATION_WRITE","argument="+chain.getArg(0)+";before="+before
                            +";after="+describe(chain.getThisObject(),state,strength)+";caller="+caller());
                    return result;
                }));
            }catch(ReflectiveOperationException absent){module.logFeatureInfo("EXTRA_DIM_ACTIVATION_OBSERVER_UNAVAILABLE "+absent.getClass().getSimpleName());}
            try {
                Method reset=service.getDeclaredMethod("resetReduceBrightColors");reset.setAccessible(true);
                if(reset.getReturnType()==boolean.class)module.registerFeatureHook(module.prepareFeatureHook(reset,"extra_dim.native_reset",false).intercept(chain->{
                    Object result=chain.proceed();
                    FeatureRuntimeLog.event("EXTRA_DIM_NATIVE_RESET","reset="+result+";"+ExtraDimOwnershipClient.evidence());
                    return result;
                }));
            }catch(ReflectiveOperationException absent){module.logFeatureInfo("EXTRA_DIM_RESET_OBSERVER_UNAVAILABLE "+absent.getClass().getSimpleName());}
            // Firmware synthetic bridges/handler callers can be precompiled.
            for(Method method:service.getDeclaredMethods())if(method.getName().contains("applyTint")||method.getName().contains("dumpInternal")||method.getName().contains("setUp")
                    ||method.getName().contains("ReduceBrightColors"))module.deoptimize(method);
            try {
                Class<?> binder=Class.forName("com.android.server.display.color.ColorDisplayService$BinderService",false,loader);
                module.deoptimize(binder.getDeclaredMethod("dump",java.io.FileDescriptor.class,PrintWriter.class,String[].class));
            }catch(ReflectiveOperationException absent){module.logFeatureInfo("EXTRA_DIM_DUMP_CALLER_UNAVAILABLE "+absent.getClass().getSimpleName());}
            try {
                Class<?> handler=Class.forName("com.android.server.display.color.ColorDisplayService$TintHandler",false,loader);
                module.deoptimize(handler.getDeclaredMethod("handleMessage",android.os.Message.class));
            }catch(ReflectiveOperationException absent){module.logFeatureInfo("EXTRA_DIM_HANDLER_UNAVAILABLE "+absent.getClass().getSimpleName());}
            // OEM Settings observers may inline the activation callback.
            for(Class<?> nested:service.getDeclaredClasses())for(Method method:nested.getDeclaredMethods())
                if(method.getName().equals("onChange"))module.deoptimize(method);
            // Reapply an owned request after native user/resources setup. The
            // platform's matrix coefficients and foreground user remain authoritative.
            try {
                Method setup=service.getDeclaredMethod("setUp");setup.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(setup,"extra_dim.native_setup",false).intercept(chain -> {
                    Object result=chain.proceed();
                    observeNativeSettings(module,chain.getThisObject());
                    try {
                        Object instance=chain.getThisObject();Context ctx=(Context)context.invoke(instance);int current=user.getInt(instance);
                        Object target=controller.get(instance);
                        ExtraDimOwnershipClient.State request = request(module, instance, ctx, current, nativeHandler, user, controller, apply, nativeActivation, nativeStrength);
                        if(request.owned && target!=null && Boolean.TRUE.equals(available.invoke(target,ctx)))
                            syncNative(instance, target, nativeStrength, nativeActivation, apply);
                    }catch(ReflectiveOperationException | RuntimeException error){module.logFeatureError("EXTRA_DIM_SETUP",error);}
                    return result;
                }));
            }catch(ReflectiveOperationException absent){module.logFeatureInfo("EXTRA_DIM_SETUP_UNAVAILABLE "+absent.getClass().getSimpleName());}
            installed=true;
            FeatureRuntimeLog.event("EXTRA_DIM_CAPABILITY","native_callbacks=true;matrix_readback=true;reconciliation=fresh_request");
        }catch(Throwable error){module.logFeatureError("EXTRA_DIM_INSTALL",error);}
    }

    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private static int nativeStrength(Context context,int requested){
        android.content.res.Resources resources=context.getResources();
        int min=resources.getIdentifier("config_reduceBrightColorsStrengthMin","integer","android");
        int max=resources.getIdentifier("config_reduceBrightColorsStrengthMax","integer","android");
        if(min==0||max==0)throw new IllegalStateException("Native dim calibration unavailable");
        return ExtraDimRuntime.nativeStrength(requested,resources.getInteger(min),resources.getInteger(max));
    }
    private static ExtraDimOwnershipClient.State request(AugmentModule module, Object instance, Context context, int current,
            Field nativeHandler, Field user, Field controller, Method apply, Method nativeActivation, Method nativeStrength) throws ReflectiveOperationException {
        android.os.Handler handler = (android.os.Handler) nativeHandler.get(instance);
        return ExtraDimOwnershipClient.peek(context, current, handler, owned -> {
            try {
                if (user.getInt(instance) != current || nativeHandler.get(instance) != handler) return;
                Object target = controller.get(instance);
                if (target == null) return;
                // Both acquisition/refresh and release use the same native path.
                // These callbacks reread current-user Settings, use ROM calibration
                // and notify the display power listener before applying the matrix.
                // The boolean is the native user-initiated flag, NOT the desired state.
                FeatureRuntimeLog.event("EXTRA_DIM_SYNC_BEGIN","user="+current+";owned="+owned+";"+ExtraDimOwnershipClient.evidence());
                syncNative(instance, target, nativeStrength, nativeActivation, apply);
                FeatureRuntimeLog.event("EXTRA_DIM_SYNC_RETURNED","user="+current+";owned="+owned+";business=requires_readback");
            } catch (ReflectiveOperationException | RuntimeException error) { module.logFeatureError("EXTRA_DIM_REFRESH", error); }
        });
    }
    private static void syncNative(Object instance, Object target, Method strength, Method activation, Method apply) throws ReflectiveOperationException {
        strength.invoke(instance);
        activation.invoke(instance, false);
        apply.invoke(instance, target, true);
    }

    private static String describe(Object target,Method state,Method strength) {
        try{return "active="+state.invoke(target)+",nativeStrength="+strength.invoke(target);}
        catch(ReflectiveOperationException|RuntimeException error){return "state_unavailable="+FeatureRuntimeLog.failure(error);}
    }
    private static void observeNativeSettings(AugmentModule module,Object instance) {
        // Anonymous ContentObserver classes are absent from getDeclaredClasses().
        // Resolve the actual OEM observer, without depending on its numeric class name.
        try {
            Field field=null;
            for(Class<?> type=instance.getClass();type!=null&&field==null;type=type.getSuperclass())
                try{field=type.getDeclaredField("mContentObserver");}catch(NoSuchFieldException absent){ }
            if(field==null||!android.database.ContentObserver.class.isAssignableFrom(field.getType()))return;
            field.setAccessible(true);Object observer=field.get(instance);if(observer==null)return;
            synchronized(observedNativeTypes){
                if(observedNativeTypes.contains(observer.getClass())||observedNativeTypes.size()>=16)return;
                observedNativeTypes.add(observer.getClass());
            }
            int count=0;
            for(Class<?> type=observer.getClass();type!=null&&type!=android.database.ContentObserver.class;type=type.getSuperclass())
                for(Method method:type.getDeclaredMethods())if(method.getName().equals("onChange")&&method.getReturnType()==void.class
                        &&method.getParameterCount()>0&&method.getParameterTypes()[0]==boolean.class
                        &&!java.lang.reflect.Modifier.isStatic(method.getModifiers())){
                    module.deoptimize(method);count++;
                }
            FeatureRuntimeLog.event("EXTRA_DIM_NATIVE_OBSERVER","type="+observer.getClass().getName()+";callers="+count);
        }catch(ReflectiveOperationException|RuntimeException|LinkageError error){
            FeatureRuntimeLog.event("EXTRA_DIM_NATIVE_OBSERVER","state=unavailable;exception="+FeatureRuntimeLog.failure(error));
        }
    }
    private static String caller() {
        // Fixed framework frames only: no arguments, user data or arbitrary stack dump.
        StringBuilder result=new StringBuilder();
        try{for(StackTraceElement frame:Thread.currentThread().getStackTrace()) {
            if(!frame.getClassName().startsWith("com.android.server.display."))continue;
            if(result.length()>0)result.append(',');
            result.append(frame.getClassName()).append('.').append(frame.getMethodName());
            if(result.length()>500)break;
        }}catch(RuntimeException unavailable){return "unavailable";}
        return result.length()==0?"unavailable":result.toString();
    }
}
