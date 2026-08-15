package ls.augment.com.hook;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import io.github.libxposed.api.XposedInterface.HookHandle;

/** Unlocks eligibility only; ZTE's own clone-user framework remains authoritative. */
final class DoubleAppHook {
    private static final String UTILS_CLASS = "com.zte.cn.doubleapp.common.Utils";
    private static final String UPDATE_UTILS_CLASS = "com.zte.cn.doubleapp.common.UpdateUtils";
    private static final String RESOLVER_CLASS =
            "com.zte.cn.doubleapp.activity.DoubleAppResolverActivity";
    private static final Set<String> BLOCKED_PACKAGES = new LinkedHashSet<>(Arrays.asList(
            "ls.augment.com", "org.lsposed.manager", "com.topjohnwu.magisk",
            "me.weishu.kernelsu", "me.weishu.kernelsu.debug", "com.rifsxd.ksunext",
            "me.bmax.apatch"));

    private DoubleAppHook() { }

    static int install(AugmentModule module, ClassLoader classLoader) {
        int installed = 0;
        installed += installLowMemoryGate(module, classLoader);
        installed += installSupportList(module, classLoader);
        installed += installResolverGuard(module, classLoader);
        Context context = FeatureSettings.from(null);
        FeatureSettings.diagnostic(context, FeatureSettings.DOUBLE_INSTALLED,
                "hooks=" + installed + ";utils=" + present(UTILS_CLASS, classLoader)
                        + ";update=" + present(UPDATE_UTILS_CLASS, classLoader));
        if (installed > 0) {
            FeatureSettings.diagnostic(context, FeatureSettings.DOUBLE_LAST_ERROR, "");
        }
        return installed;
    }

    /**
     * GameAssist always opens the OEM resolver for packages admitted by the
     * expanded third-party candidate list. The resolver assumes a real user-999 install
     * and can display two choices even when no clone exists. Bypass it only
     * for the exact GameAssist call and only after PackageManager confirms the
     * target is not installed in user 999.
     */
    private static int installResolverGuard(AugmentModule module, ClassLoader classLoader) {
        try {
            Class<?> type = Class.forName(RESOLVER_CLASS, false, classLoader);
            Method onCreate = type.getDeclaredMethod("onCreate", Bundle.class);
            onCreate.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                            onCreate, "doubleapp.resolver.real_clone_guard", true)
                    .intercept(chain -> {
                        Object owner = chain.getThisObject();
                        Context context = FeatureSettings.from(owner);
                        if (!(owner instanceof Activity)
                                || !FeatureSettings.enabled(context, FeatureSettings.APP_MASTER)
                                || !FeatureSettings.enabled(context,
                                FeatureSettings.DOUBLE_ANY_APP)) {
                            return chain.proceed();
                        }
                        Activity activity = (Activity) owner;
                        Intent wrapper = activity.getIntent();
                        if (wrapper == null || !"cn.nubia.gameassist".equals(
                                wrapper.getStringExtra("doubleapp_calling_package"))) {
                            return chain.proceed();
                        }
                        Intent real = wrapper.getParcelableExtra("doubleLay_intent", Intent.class);
                        if (real == null) return chain.proceed();
                        String packageName = real.getPackage();
                        if (real.getComponent() != null) {
                            packageName = real.getComponent().getPackageName();
                        }
                        if (packageName == null || packageName.isEmpty()
                                || !isEligibleThirdParty(context, packageName)
                                || installedForUser(activity.getPackageManager(), packageName, 999)) {
                            return chain.proceed();
                        }
                        try {
                            activity.startActivity(real);
                            activity.finish();
                            FeatureSettings.diagnostic(context, FeatureSettings.DOUBLE_ACTIVE, "1");
                            FeatureSettings.diagnostic(context, FeatureSettings.DOUBLE_LAST_HIT,
                                    "resolver_bypassed_no_clone=" + packageName
                                            + ";ts=" + System.currentTimeMillis());
                            return null;
                        } catch (Throwable ignored) {
                            return chain.proceed();
                        }
                    });
            module.registerFeatureHook(handle);
            module.logFeatureInfo("DOUBLEAPP_RESOLVER_GUARD_INSTALLED");
            return 1;
        } catch (Throwable error) {
            report(module, "RESOLVER_GUARD_HOOK_FAILED", error);
            return 0;
        }
    }

    private static boolean installedForUser(PackageManager manager, String packageName, int userId) {
        try {
            Method method = manager.getClass().getMethod(
                    "getPackageInfoAsUser", String.class, int.class, int.class);
            Object value = method.invoke(manager, packageName,
                    PackageManager.MATCH_UNINSTALLED_PACKAGES, userId);
            if (!(value instanceof PackageInfo)) return true;
            ApplicationInfo info = ((PackageInfo) value).applicationInfo;
            return info != null && (info.flags & ApplicationInfo.FLAG_INSTALLED) != 0;
        } catch (Throwable ignored) {
            // Fail closed: never suppress an OEM resolver when clone truth
            // cannot be established on a future ROM.
            return true;
        }
    }

    private static int installLowMemoryGate(AugmentModule module, ClassLoader classLoader) {
        Class<?> type;
        try {
            type = Class.forName(UTILS_CLASS, false, classLoader);
        } catch (Throwable error) {
            report(module, "LOW_MEMORY_CLASS_MISSING", error);
            return 0;
        }

        int installed = 0;
        for (Method method : allMethods(type)) {
            if (!"showLimitedApps".equals(method.getName())) continue;
            Class<?> returnType = method.getReturnType();
            if (returnType != boolean.class && returnType != Boolean.class) continue;
            try {
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "doubleapp.low_memory." + installed, true)
                        .intercept(chain -> {
                            Context context = contextFromCall(chain.getThisObject(), method.getParameterCount(),
                                    index -> chain.getArg(index));
                            if (!FeatureSettings.enabled(context, FeatureSettings.APP_MASTER)
                                    || !FeatureSettings.enabled(
                                    context, FeatureSettings.DOUBLE_LOW_MEMORY)) {
                                return chain.proceed();
                            }
                            FeatureSettings.diagnostic(
                                    context, FeatureSettings.DOUBLE_ACTIVE, "1");
                            FeatureSettings.diagnostic(
                                    context, FeatureSettings.DOUBLE_LAST_HIT,
                                    "showLimitedApps=false;ts=" + System.currentTimeMillis());
                            return false;
                        });
                module.registerFeatureHook(handle);
                module.logFeatureInfo("DOUBLEAPP_LOW_MEMORY_INSTALLED "
                        + method.toGenericString());
                installed++;
            } catch (Throwable error) {
                report(module, "LOW_MEMORY_HOOK_FAILED", error);
            }
        }
        return installed;
    }

    private static int installSupportList(AugmentModule module, ClassLoader classLoader) {
        Class<?> type;
        try {
            type = Class.forName(UPDATE_UTILS_CLASS, false, classLoader);
        } catch (Throwable error) {
            report(module, "SUPPORT_LIST_CLASS_MISSING", error);
            return 0;
        }

        int installed = 0;
        for (Method method : allMethods(type)) {
            if (!"getSupportApps".equals(method.getName())) continue;
            if (!Collection.class.isAssignableFrom(method.getReturnType())) continue;
            try {
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "doubleapp.support_apps." + installed, false)
                        .intercept(chain -> {
                            Object original = chain.proceed();
                            Context context = contextFromCall(chain.getThisObject(), method.getParameterCount(),
                                    index -> chain.getArg(index));
                            if (!FeatureSettings.enabled(context, FeatureSettings.APP_MASTER)
                                    || !FeatureSettings.enabled(
                                    context, FeatureSettings.DOUBLE_ANY_APP)) {
                                return original;
                            }
                            int oemCount = uniquePackageCount(original);
                            Collection<String> packages = packageNames(context, original);
                            if (packages == null) return original;
                            FeatureSettings.diagnostic(
                                    context, FeatureSettings.DOUBLE_ACTIVE, "1");
                            FeatureSettings.diagnostic(
                                    context, FeatureSettings.DOUBLE_LAST_HIT,
                                    "getSupportApps=" + packages.size()
                                            + ";oem=" + oemCount
                                            + ";third_party_added="
                                            + Math.max(0, packages.size() - oemCount)
                                            + ";ts=" + System.currentTimeMillis());
                            return packages.isEmpty() ? original : packages;
                        });
                module.registerFeatureHook(handle);
                module.logFeatureInfo("DOUBLEAPP_SUPPORT_LIST_INSTALLED "
                        + method.toGenericString());
                installed++;
            } catch (Throwable error) {
                report(module, "SUPPORT_LIST_HOOK_FAILED", error);
            }
        }
        return installed;
    }

    private static Collection<String> packageNames(Context context, Object original) {
        if (context == null) return null;
        try {
            PackageManager packageManager = context.getPackageManager();
            LinkedHashSet<String> merged = new LinkedHashSet<>();
            if (original instanceof Collection) {
                for (Object value : (Collection<?>) original) {
                    if (value instanceof String && !((String) value).isEmpty()) {
                        merged.add((String) value);
                    }
                }
            }
            for (ApplicationInfo info : packageManager.getInstalledApplications(0)) {
                if (isEligibleThirdParty(info)) merged.add(info.packageName);
            }
            return original instanceof Set ? merged : new ArrayList<>(merged);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static int uniquePackageCount(Object original) {
        if (!(original instanceof Collection)) return 0;
        LinkedHashSet<String> packages = new LinkedHashSet<>();
        for (Object value : (Collection<?>) original) {
            if (value instanceof String && !((String) value).isEmpty()) {
                packages.add((String) value);
            }
        }
        return packages.size();
    }

    private static boolean isEligibleThirdParty(Context context, String packageName) {
        if (context == null || packageName == null || packageName.isEmpty()) return false;
        try {
            return isEligibleThirdParty(
                    context.getPackageManager().getApplicationInfo(packageName, 0));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isEligibleThirdParty(ApplicationInfo info) {
        return info != null
                && info.packageName != null
                && !info.packageName.isEmpty()
                && info.enabled
                && (info.flags & ApplicationInfo.FLAG_INSTALLED) != 0
                && (info.flags & ApplicationInfo.FLAG_SYSTEM) == 0
                && !BLOCKED_PACKAGES.contains(info.packageName);
    }

    private static Context contextFromCall(
            Object owner, int argCount, ArgumentReader arguments) {
        for (int index = 0; index < argCount; index++) {
            Object value;
            try {
                value = arguments.get(index);
            } catch (Throwable ignored) {
                continue;
            }
            if (value instanceof Context) return (Context) value;
        }
        return FeatureSettings.from(owner);
    }

    private static List<Method> allMethods(Class<?> type) {
        List<Method> methods = new ArrayList<>();
        for (Class<?> cursor = type; cursor != null; cursor = cursor.getSuperclass()) {
            for (Method method : cursor.getDeclaredMethods()) {
                if (!Modifier.isAbstract(method.getModifiers())) methods.add(method);
            }
        }
        return methods;
    }

    private static int present(String name, ClassLoader classLoader) {
        try {
            Class.forName(name, false, classLoader);
            return 1;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static void report(AugmentModule module, String stage, Throwable error) {
        Context context = FeatureSettings.from(null);
        String detail = stage + ":" + error.getClass().getSimpleName()
                + ":" + safeMessage(error);
        FeatureSettings.diagnostic(context, FeatureSettings.DOUBLE_LAST_ERROR, detail);
        module.logFeatureError("DOUBLEAPP_" + stage, error);
    }

    private static String safeMessage(Throwable error) {
        String value = error == null ? "" : error.getMessage();
        return value == null ? "" : value.replace('\n', ' ').replace('\r', ' ');
    }

    private interface ArgumentReader {
        Object get(int index);
    }
}
