package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;

/** Exact contracts verified in the readable Android 15 and obfuscated Android 16 OEM APKs. */
final class ShoulderHookTargets {
    private ShoulderHookTargets() { }

    static Method quickSwitchClick(Class<?> service) {
        Method method = named(service, false, void.class, "onTgkCaseViewBottonClick", int.class);
        return method != null ? method
                : named(service, false, void.class, "onTgkCaseViewBottonClick");
    }

    static Method pluginBlacklist(Class<?> owner, Class<?> context) {
        return aliases(owner, true, String[].class, new String[]{"d", "getBlackList"},
                context, String.class);
    }

    static Method pluginEnabled(Class<?> owner, Class<?> context) {
        return aliases(owner, true, boolean.class, new String[]{"k", "isPluginEnable"},
                context, String.class);
    }

    static Method pluginEligibility(Class<?> owner, Class<?> context) {
        Method method = aliases(owner, true, boolean.class, new String[]{"l", "isPluginEnable"},
                context, String.class, String.class);
        // The final boolean in Android 15 is the local/international region flag.
        // The plugin and package remain parameters 1 and 2 in both contracts.
        return method != null ? method : named(owner, true, boolean.class, "isPluginEnable",
                context, String.class, String.class, boolean.class);
    }

    static Method pluginList(Class<?> owner, Class<?> context) {
        Method method = aliases(owner, true, List.class, new String[]{"g", "getPluginList"}, context);
        return method != null ? method
                : named(owner, true, List.class, "getPluginList", context, String.class);
    }

    static Method toolbarBind(Class<?> owner, Class<?> viewGroup) {
        return aliases(owner, false, void.class, new String[]{"V", "initView"}, viewGroup);
    }

    static Field toolbarButton(Class<?> owner, Method binding, Class<?> view) {
        if (binding == null) return null;
        String name = "V".equals(binding.getName()) ? "t" : "mKeys";
        for (Class<?> type = owner; type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                if (Modifier.isStatic(field.getModifiers()) || !view.isAssignableFrom(field.getType())) return null;
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) { }
        }
        return null;
    }

    static Method aliases(Class<?> owner, boolean isStatic, Class<?> result,
            String[] names, Class<?>... parameters) {
        for (String name : names) {
            Method method = named(owner, isStatic, result, name, parameters);
            if (method != null) return method;
        }
        return null;
    }

    static Method named(Class<?> owner, boolean isStatic, Class<?> result,
            String name, Class<?>... parameters) {
        for (Class<?> type = owner; type != null; type = type.getSuperclass()) {
            try {
                Method method = type.getDeclaredMethod(name, parameters);
                if (Modifier.isStatic(method.getModifiers()) != isStatic
                        || (result != null && method.getReturnType() != result)) return null;
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) { }
        }
        return null;
    }
}
