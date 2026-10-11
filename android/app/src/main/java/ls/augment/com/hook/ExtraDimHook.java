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
            Field user=service.getDeclaredField("mCurrentUser");
            Field controller=service.getDeclaredField("mReduceBrightColorsTintController");
            for(Method method:new Method[]{apply,activated,matrix,available,state,strength,expected,level,actual,local,dump})method.setAccessible(true);
            user.setAccessible(true);controller.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(apply,"extra_dim.transform",false).intercept(chain -> {
                Object target=chain.getArg(0);
                if(reduction.isInstance(target))try {
                    Object instance=chain.getThisObject();int current=user.getInt(instance);
                    Context ctx=(Context)context.invoke(instance);
                    if(current>=0 && "1".equals(read(ctx,"ls_augment_extra_dim_owned",current))) {
                        String on=read(ctx,"reduce_bright_colors_activated",current);
                        String amount=read(ctx,"reduce_bright_colors_level",current);
                        if(Boolean.TRUE.equals(available.invoke(target,ctx)) && ("0".equals(on)||"1".equals(on))
                                && amount!=null && amount.matches("[0-9]{1,3}")) {
                            int value=Integer.parseInt(amount);
                            if(value<=100){matrix.invoke(target,value);activated.invoke(target,Boolean.valueOf("1".equals(on)));}
                        }
                        FeatureSettings.diagnostic(ctx,"ls_augment_extra_dim_runtime","user="+current+";owned=1;requested="+on+";strength="+amount+";model="+Build.MODEL);
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
                    boolean verified=false;
                    if(supported) {
                        Object transforms=local.invoke(instance,manager);
                        float[] wanted=(float[])expected.invoke(target);
                        float[] applied=transforms==null?null:(float[])actual.invoke(transforms,(Integer)level.invoke(target));
                        verified=transforms!=null && ExtraDimRuntime.sameTransform(on,amount,wanted,applied);
                    }
                    writer.println(ExtraDimRuntime.PREFIX+"user="+current+";available="+(supported?1:0)+";active="+(on?1:0)+";strength="+amount+";transform="+(verified?1:0));
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
                        if(current>=0 && target!=null && "1".equals(read(ctx,"ls_augment_extra_dim_owned",current))
                                && Boolean.TRUE.equals(available.invoke(target,ctx)))apply.invoke(instance,target,true);
                    }catch(ReflectiveOperationException | RuntimeException error){module.logFeatureError("EXTRA_DIM_SETUP",error);}
                    return result;
                }));
            }catch(ReflectiveOperationException absent){module.logFeatureInfo("EXTRA_DIM_SETUP_UNAVAILABLE "+absent.getClass().getSimpleName());}
            installed=true;
        }catch(Throwable error){module.logFeatureError("EXTRA_DIM_INSTALL",error);}
    }
    private static String read(Context context,String key,int user) {
        // The system-server Secure cache can lag a root update. Read the exact
        // native user's provider value instead of the module app's user.
        android.os.Bundle args=new android.os.Bundle();args.putInt("_user",user);
        android.os.Bundle result=context.getContentResolver().call(android.net.Uri.parse("content://settings"),"GET_secure",key,args);
        return result==null?null:result.getString("value");
    }
}
