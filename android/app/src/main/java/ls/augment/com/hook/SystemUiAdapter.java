package ls.augment.com.hook;

import android.content.Context;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Reflection is isolated so an absent vendor method cannot abort another feature. */
final class SystemUiAdapter {
    static final Object PASS = new Object();
    interface Patch { Object apply(Object target, Object[] arguments, Object result) throws Throwable; }
    private SystemUiAdapter() { }
    static int hook(AugmentModule module, ClassLoader loader, String className, String methodName,
                    int argumentCount, Patch before, Patch after) {
        return hookNamed(module,loader,"",className,methodName,argumentCount,before,after);
    }
    /** API 102 identifies interceptors by ID; independent features must not replace one another. */
    static int hookNamed(AugmentModule module, ClassLoader loader, String namespace, String className, String methodName,
                    int argumentCount, Patch before, Patch after) {
        int count = 0;
        try {
            Class<?> type = Class.forName(className, false, loader);
            for (Method method : type.getDeclaredMethods()) {
                if (!method.getName().equals(methodName) || method.isSynthetic()
                        || (argumentCount >= 0 && method.getParameterCount() != argumentCount)) continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,
                        "rm.ui." + (namespace.isEmpty()?"":namespace+".") + className + "." + methodName + "." + method.getParameterCount(), false)
                        .intercept(chain -> {
                            Object[] args = chain.getArgs().toArray();
                            if (before != null) try {
                                Object replacement = before.apply(chain.getThisObject(), args, null);
                                if (replacement != PASS) return replacement;
                            } catch (Throwable error) {
                                module.logFeatureError("RM_UI_BEFORE_" + methodName, error);
                                args = chain.getArgs().toArray();
                            }
                            Object result = chain.proceed(args);
                            if (after != null) try {
                                Object replacement = after.apply(chain.getThisObject(), args, result);
                                if (replacement != PASS) return replacement;
                            } catch (Throwable error) {
                                module.logFeatureError("RM_UI_AFTER_" + methodName, error);
                                FeatureSettings.diagnostic(context(chain.getThisObject()),"ls_augment_rm_ui_callback_error",
                                        className+"."+methodName+": "+android.util.Log.getStackTraceString(error));
                            }
                            return result;
                        }));
                count++;
            }
            if (count == 0) module.logFeatureInfo("RM_UI_UNAVAILABLE " + className + "." + methodName);
        } catch (ClassNotFoundException absent) { module.logFeatureInfo("RM_UI_UNAVAILABLE " + className); }
        catch (Throwable error) { module.logFeatureError("RM_UI_INSTALL_" + className + "." + methodName, error); }
        return count;
    }
    static Object field(Object owner, String... names) {
        if (owner == null) return null;
        for (String name : names) for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) try {
            Field field = type.getDeclaredField(name); field.setAccessible(true); return field.get(owner);
        } catch (ReflectiveOperationException ignored) { }
        return null;
    }
    static boolean set(Object owner, String name, Object value) {
        if (owner == null) return false;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) try {
            Field field = type.getDeclaredField(name); field.setAccessible(true); field.set(owner, value); return true;
        } catch (ReflectiveOperationException ignored) { }
        return false;
    }
    static Object call(Object owner, String name, Object... args) throws ReflectiveOperationException {
        if (owner == null) return null;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            for (Method method : type.getDeclaredMethods()) {
                if (!method.getName().equals(name) || method.getParameterCount() != args.length) continue;
                boolean matches = true;
                for (int i = 0; i < args.length; i++) if (args[i] != null) {
                    Class<?> expected = method.getParameterTypes()[i];
                    if (expected.isPrimitive()) expected = box(expected);
                    if (!expected.isInstance(args[i])) matches = false;
                }
                if (!matches) continue;
                method.setAccessible(true); return method.invoke(owner, args);
            }
        }
        throw new NoSuchMethodException(owner.getClass().getName() + "." + name);
    }
    private static Class<?> box(Class<?> type) {
        if (type == int.class) return Integer.class;
        if (type == boolean.class) return Boolean.class;
        if (type == long.class) return Long.class;
        if (type == float.class) return Float.class;
        if (type == double.class) return Double.class;
        return type;
    }
    static Context context(Object owner) { return owner instanceof View ? ((View) owner).getContext() : FeatureSettings.from(owner); }
}
