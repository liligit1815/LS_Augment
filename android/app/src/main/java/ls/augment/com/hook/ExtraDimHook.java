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
            Method activated=tint.getDeclaredMethod("setActivated",Boolean.class);
            Method matrix=reduction.getDeclaredMethod("setMatrix",int.class);
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
            for(Method method:new Method[]{apply,activated,matrix,available,state,strength,expected,level,actual,local,dump,nativeActivation,nativeStrength})method.setAccessible(true);
            user.setAccessible(true);controller.setAccessible(true);nativeHandler.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(apply,"extra_dim.transform",false).intercept(chain -> {
                Object target=chain.getArg(0);
                if(reduction.isInstance(target))try {
                    Object instance=chain.getThisObject();int current=user.getInt(instance);
                    Context ctx=(Context)context.invoke(instance);
                    ExtraDimOwnershipClient.State request = request(module, instance, ctx, current, nativeHandler, user, controller, apply, nativeActivation, nativeStrength);
                    if(request.owned && Boolean.TRUE.equals(available.invoke(target,ctx))) {
                        int nativeAmount=nativeStrength(ctx,request.strength);
                        matrix.invoke(target,nativeAmount);activated.invoke(target,Boolean.valueOf(request.active));
                        FeatureSettings.diagnostic(ctx,"ls_augment_extra_dim_runtime","user="+current+";owned=1;requested="+(request.active?1:0)+";strength="+request.strength+";nativeStrength="+nativeAmount+";model="+Build.MODEL);
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
                    boolean verified=false;
                    if(supported) {
                        Object transforms=local.invoke(instance,manager);
                        float[] wanted=(float[])expected.invoke(target);
                        float[] applied=transforms==null?null:(float[])actual.invoke(transforms,(Integer)level.invoke(target));
                        verified=mapped && transforms!=null && ExtraDimRuntime.sameTransform(on,nativeAmount,wanted,applied);
                    }
                    writer.println(ExtraDimRuntime.PREFIX+"user="+current+";available="+(supported?1:0)+";active="+(on?1:0)+";strength="+amount+";transform="+(verified?1:0));
                    writer.println("LSA_EXTRA_DIM_NATIVE_V1 user="+current+";owned="+(request.owned?1:0)+";nativeStrength="+nativeAmount+";mapping="+(mapped?1:0));
                }catch(ReflectiveOperationException | RuntimeException error){module.logFeatureError("EXTRA_DIM_READBACK",error);}
                return result;
            }));
            // Firmware synthetic bridges/handler callers can be precompiled.
            for(Method method:service.getDeclaredMethods())if(method.getName().contains("applyTint")||method.getName().contains("dumpInternal")||method.getName().contains("setUp"))module.deoptimize(method);
            try {
                Class<?> binder=Class.forName("com.android.server.display.color.ColorDisplayService$BinderService",false,loader);
                module.deoptimize(binder.getDeclaredMethod("dump",java.io.FileDescriptor.class,PrintWriter.class,String[].class));
            }catch(ReflectiveOperationException absent){module.logFeatureInfo("EXTRA_DIM_DUMP_CALLER_UNAVAILABLE "+absent.getClass().getSimpleName());}
            try {
                Class<?> handler=Class.forName("com.android.server.display.color.ColorDisplayService$TintHandler",false,loader);
                module.deoptimize(handler.getDeclaredMethod("handleMessage",android.os.Message.class));
            }catch(ReflectiveOperationException absent){module.logFeatureInfo("EXTRA_DIM_HANDLER_UNAVAILABLE "+absent.getClass().getSimpleName());}
            // Reapply an owned request after native user/resources setup. The
            // platform's matrix coefficients and foreground user remain authoritative.
            try {
                Method setup=service.getDeclaredMethod("setUp");setup.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(setup,"extra_dim.native_setup",false).intercept(chain -> {
                    Object result=chain.proceed();
                    try {
                        Object instance=chain.getThisObject();Context ctx=(Context)context.invoke(instance);int current=user.getInt(instance);
                        Object target=controller.get(instance);
                        ExtraDimOwnershipClient.State request = request(module, instance, ctx, current, nativeHandler, user, controller, apply, nativeActivation, nativeStrength);
                        if(request.owned && target!=null && Boolean.TRUE.equals(available.invoke(target,ctx)))apply.invoke(instance,target,true);
                    }catch(ReflectiveOperationException | RuntimeException error){module.logFeatureError("EXTRA_DIM_SETUP",error);}
                    return result;
                }));
            }catch(ReflectiveOperationException absent){module.logFeatureInfo("EXTRA_DIM_SETUP_UNAVAILABLE "+absent.getClass().getSimpleName());}
            installed=true;
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
                if (!owned) {
                    // Reset may restore Settings while an older cached request is still in
                    // the controller. Reload only this native feature through its own
                    // callbacks so ROM defaults/range mapping remain authoritative.
                    nativeStrength.invoke(instance);
                    nativeActivation.invoke(instance, false);
                }
                apply.invoke(instance, target, true);
            } catch (ReflectiveOperationException | RuntimeException error) { module.logFeatureError("EXTRA_DIM_REFRESH", error); }
        });
    }
}
