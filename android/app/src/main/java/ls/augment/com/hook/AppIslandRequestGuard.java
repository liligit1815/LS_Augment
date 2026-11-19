package ls.augment.com.hook;

import android.os.Bundle;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Older SystemUI can accept a show request before its optional app island exists. */
final class AppIslandRequestGuard {
    private static final String OEM = "com.zte.feature.dynamicisland.";

    static int install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> manager = Class.forName(OEM + "PermanentIslandManager", false, loader);
            Class<?> island = Class.forName(OEM + "DynamicPermanentIsland", false, loader);
            Field slot = NativeIslandSceneContract.field(manager, "mAppIsland", island);
            if (slot == null || Modifier.isStatic(slot.getModifiers())) {
                module.logFeatureInfo("APP_ISLAND_GUARD missing legacy mAppIsland");
                return 0;
            }
            int installed = 0;
            for (Method worker : manager.getDeclaredMethods()) {
                if (!worker.getName().startsWith("lambda$handleAppIslandMethod$")
                        || Modifier.isStatic(worker.getModifiers()) || worker.getReturnType() != void.class
                        || !java.util.Arrays.equals(worker.getParameterTypes(), new Class<?>[]{String.class, Bundle.class})) continue;
                module.registerFeatureHook(module.prepareFeatureHook(worker, "island.app_request_guard." + worker.getName(), false)
                        .intercept(chain -> {
                            try {
                                return chain.proceed();
                            } catch (NullPointerException failure) {
                                Bundle args = (Bundle) chain.getArg(1);
                                if (!"showIsland".equals(chain.getArg(0)) || args == null
                                        || !"1".equals(args.getString("island_type"))
                                        || slot.get(chain.getThisObject()) != null || !missingReceiver(failure, worker))
                                    throw failure;
                                FeatureRuntimeLog.event("APP_ISLAND_GUARD", "show_skipped;reason=missing_app_island");
                                return null;
                            }
                        }));
                installed++;
            }
            if (installed == 0) module.logFeatureInfo("APP_ISLAND_GUARD missing show worker(String,Bundle)");
            return installed;
        } catch (ClassNotFoundException | RuntimeException | LinkageError missing) {
            module.logFeatureInfo("APP_ISLAND_GUARD unavailable=" + missing);
        }
        return 0;
    }

    private static boolean missingReceiver(NullPointerException failure, Method worker) {
        StackTraceElement[] stack = failure.getStackTrace();
        String message = failure.getMessage();
        return stack.length > 0 && stack[0].getClassName().equals(worker.getDeclaringClass().getName())
                && stack[0].getMethodName().equals(worker.getName()) && message != null
                && message.contains(OEM + "DynamicPermanentIsland.initAppIsland(")
                && message.contains("on a null object reference");
    }
    private AppIslandRequestGuard() {}
}
