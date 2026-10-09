package ls.augment.com.hook;

import android.content.Context;
import android.os.Build;
import java.lang.reflect.Method;

/** Keep the NX809J native color transform consistent with our explicitly owned toggle. */
final class ExtraDimHook {
    private static boolean installed;
    static void install(AugmentModule module, ClassLoader loader) {
        if (installed || (!"NX809J".equalsIgnoreCase(Build.MODEL) && !"NX809J".equalsIgnoreCase(Build.DEVICE))) return;
        try {
            Class<?> service = Class.forName("com.android.server.display.color.ColorDisplayService",false,loader);
            Class<?> tint = Class.forName("com.android.server.display.color.TintController",false,loader);
            Method apply = service.getDeclaredMethod("applyTint",tint,boolean.class);
            Method activated = tint.getDeclaredMethod("setActivated",Boolean.class);
            Method context = Class.forName("com.android.server.SystemService",false,loader).getMethod("getContext");
            java.lang.reflect.Field user = service.getDeclaredField("mCurrentUser");user.setAccessible(true);
            apply.setAccessible(true);activated.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(apply,"extra_dim.transform",false).intercept(chain -> {
                Object controller=chain.getArg(0);
                if(controller!=null && controller.getClass().getName().equals("com.android.server.display.color.ReduceBrightColorsTintController")) {
                    try {
                        Object instance=chain.getThisObject();int current=user.getInt(instance);
                        Context ctx=(Context)context.invoke(instance);
                        int owned=current>=0?read(ctx,"ls_augment_extra_dim_owned",current):0;
                        int active=current>=0?read(ctx,"reduce_bright_colors_activated",current):0;
                        FeatureSettings.diagnostic(ctx,"ls_augment_extra_dim_runtime","user="+current+";owned="+owned+";active="+active+";model="+Build.MODEL);
                        if(owned==1) {
                            boolean on=active==1;
                            activated.invoke(controller,Boolean.valueOf(on));
                        }
                    }catch(ReflectiveOperationException | RuntimeException error){module.logFeatureError("EXTRA_DIM_STATE",error);}
                }
                return chain.proceed();
            }));
            // The firmware precompiles the synthetic bridge into TintHandler.
            // Deoptimize those callers so every native transform reaches the hook.
            for(Method method:service.getDeclaredMethods())
                if(method.getName().contains("applyTint"))module.deoptimize(method);
            Class<?> handler=Class.forName("com.android.server.display.color.ColorDisplayService$TintHandler",false,loader);
            module.deoptimize(handler.getDeclaredMethod("handleMessage",android.os.Message.class));
            installed=true;
        }catch(Throwable error){module.logFeatureError("EXTRA_DIM_INSTALL",error);}
    }
    private static int read(Context context,String key,int user) {
        // NX809J's system-server Secure cache can retain activated=0 after a
        // successful root update. Read the provider's value for this user.
        android.os.Bundle args=new android.os.Bundle();args.putInt("_user",user);
        android.os.Bundle result=context.getContentResolver().call(android.net.Uri.parse("content://settings"),"GET_secure",key,args);
        return result!=null && "1".equals(result.getString("value"))?1:0;
    }
}
