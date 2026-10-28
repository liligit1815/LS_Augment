package ls.augment.com.hook;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Disables only the OEM fallback overview scrim under its independent switch. */
final class ThirdPartyRecentsBackgroundHook {
    private static final String KEY = "ls_augment_rm_third_party_recents_no_scrim";
    private static boolean installed;

    private ThirdPartyRecentsBackgroundHook() { }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Class<?> activity = Class.forName("com.android.quickstep.RecentsActivity", false, loader);
            if (!Activity.class.isAssignableFrom(activity))
                throw new ClassNotFoundException("Fallback overview is not an Activity");
            Class<?> state = Class.forName("com.android.quickstep.fallback.RecentsState", false, loader);
            Method color = state.getDeclaredMethod("getScrimColor", Context.class);
            if(java.lang.reflect.Modifier.isStatic(color.getModifiers())||java.lang.reflect.Modifier.isAbstract(color.getModifiers()))
                throw new NoSuchMethodException("getScrimColor must be a concrete instance method");
            color.setAccessible(true);
            final java.lang.reflect.Constructor<?> colors;
            if (color.getReturnType() == int.class) colors = null;
            else {
                Class<?> value = Class.forName("com.android.launcher3.views.ScrimColors", false, loader);
                if (color.getReturnType() != value) throw new NoSuchMethodException("getScrimColor result");
                HookCompatibility.method(value, int.class, false, new String[]{"getBackgroundColor"});
                HookCompatibility.method(value, int.class, false, new String[]{"getForegroundColor"});
                colors = value.getDeclaredConstructor(int.class, int.class);
                colors.setAccessible(true);
            }
            Method hasFlag = HookCompatibility.method(state, boolean.class, false,
                    new String[]{"hasFlag"}, int.class);
            Field scrimFlag = HookCompatibility.field(state, int.class, true, "FLAG_SCRIM");
            module.registerFeatureHook(module.prepareFeatureHook(color,
                    "launcher.recents.third_party_background", false).intercept(chain -> {
                Object original = chain.proceed();
                Object supplied = chain.getArg(0);
                if (original == null || !activity.isInstance(supplied)) return original;
                Context context = (Context) supplied;
                if (!FeatureSettings.enabled(context, KEY)) return original;
                try {
                    // HOME/background states must keep their native transparent target.
                    if (!Boolean.TRUE.equals(hasFlag.invoke(chain.getThisObject(), scrimFlag.getInt(null))))
                        return original;
                    FeatureSettings.diagnostic(context, "ls_augment_rm_third_party_recents_background",
                            "route=" + color.getReturnType().getSimpleName() + "|scrim=0|disabled");
                    return colors == null ? Color.TRANSPARENT : colors.newInstance(Color.TRANSPARENT, Color.TRANSPARENT);
                } catch (ReflectiveOperationException | RuntimeException unavailable) {
                    module.logFeatureError("THIRD_PARTY_RECENTS_BACKGROUND_APPLY", unavailable);
                    return original;
                }
            }));
            installed = true;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
            module.logFeatureError("THIRD_PARTY_RECENTS_BACKGROUND_INSTALL", unavailable);
        }
    }
}
