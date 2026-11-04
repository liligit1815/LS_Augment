package ls.augment.com.step;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/** Resolve the framework or OEM member on its actual host class loader. */
final class StepMembers {
    private record Signature(String name, List<Class<?>> args, boolean staticCall) { }
    private static final class Members {
        final ConcurrentHashMap<String, Field> fields = new ConcurrentHashMap<>();
        final ConcurrentHashMap<Signature, Method> methods = new ConcurrentHashMap<>();
    }
    private static final ClassValue<Members> cache = new ClassValue<>() {
        @Override protected Members computeValue(Class<?> type) { return new Members(); }
    };

    static Class<?> findClassIfExists(String name, ClassLoader loader) {
        try { return Class.forName(name, false, loader); }
        catch (ClassNotFoundException | LinkageError missing) { return null; }
    }
    static Class<?> findClass(String name, ClassLoader loader) {
        Class<?> type = findClassIfExists(name, loader);
        if (type == null) throw new IllegalStateException(name);
        return type;
    }

    static Field findField(Class<?> owner, String name) {
        return cache.get(owner).fields.computeIfAbsent(name, key -> {
            for (Class<?> type = owner; type != null; type = type.getSuperclass()) {
                try { Field f = type.getDeclaredField(key); f.setAccessible(true); return f; }
                catch (NoSuchFieldException missing) { }
            }
            throw new NoSuchFieldError(owner.getName() + "." + key);
        });
    }
    static Object getObjectField(Object owner, String name) {
        try { return findField(owner.getClass(), name).get(owner); }
        catch (IllegalAccessException error) { throw new IllegalStateException(error); }
    }
    static int getIntField(Object owner, String name) { return (Integer)getObjectField(owner, name); }
    static boolean getBooleanField(Object owner, String name) { return (Boolean)getObjectField(owner, name); }
    static float getFloatField(Object owner, String name) { return (Float)getObjectField(owner, name); }
    static void setFloatField(Object owner, String name, float value) {
        try { findField(owner.getClass(), name).setFloat(owner, value); }
        catch (IllegalAccessException error) { throw new IllegalStateException(error); }
    }

    static Method findMethodExact(Class<?> owner, String name, Class<?>... types) {
        for (Class<?> type = owner; type != null; type = type.getSuperclass()) {
            try { Method m = type.getDeclaredMethod(name, types); m.setAccessible(true); return m; }
            catch (NoSuchMethodException missing) { }
        }
        throw new IllegalStateException(owner.getName() + "." + name + Arrays.toString(types));
    }
    static void findAndHookMethod(Class<?> owner, String name, Object... signature) {
        Class<?>[] types = Arrays.copyOf(signature, signature.length - 1, Class[].class);
        StepHooks.hookMethod(findMethodExact(owner, name, types), (StepHook)signature[types.length]);
    }

    static Object callMethod(Object receiver, String name, Object... args) {
        return invoke(receiver.getClass(), receiver, name, args);
    }
    static Object callStaticMethod(Class<?> owner, String name, Object... args) {
        return invoke(owner, null, name, args);
    }
    private static Object invoke(Class<?> owner, Object receiver, String name, Object[] args) {
        Class<?>[] types = new Class<?>[args.length];
        for (int i = 0; i < args.length; i++) types[i] = args[i] == null ? Void.class : args[i].getClass();
        Signature key = new Signature(name, Arrays.asList(types), receiver == null);
        Method target = cache.get(owner).methods.computeIfAbsent(key, k -> resolve(owner, k));
        try { return target.invoke(receiver, args); }
        catch (InvocationTargetException wrapper) {
            Throwable cause = wrapper.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException)cause;
            if (cause instanceof Error) throw (Error)cause;
            throw new IllegalStateException(cause);
        } catch (IllegalAccessException failure) { throw new IllegalStateException(failure); }
    }
    private static Method resolve(Class<?> owner, Signature key) {
        java.util.ArrayList<Method> matches = new java.util.ArrayList<>();
        for (Class<?> type = owner; type != null; type = type.getSuperclass())
            for (Method m : type.getDeclaredMethods()) collect(matches, m, key);
        if (matches.isEmpty()) for (Method m : owner.getMethods()) collect(matches, m, key);
        for (Method best : matches) {
            boolean specific = true;
            for (Method other : matches) {
                Class<?>[] a = best.getParameterTypes(), b = other.getParameterTypes();
                for (int i = 0; i < a.length; i++) if (!boxed(b[i]).isAssignableFrom(boxed(a[i]))) specific = false;
            }
            if (specific) { best.setAccessible(true); return best; }
        }
        throw new IllegalStateException("Missing or ambiguous " + owner.getName() + "." + key);
    }
    private static void collect(List<Method> matches, Method m, Signature k) {
        if (!m.getName().equals(k.name) || m.isBridge() || m.getParameterCount() != k.args.size()
                || Modifier.isStatic(m.getModifiers()) != k.staticCall) return;
        Class<?>[] params = m.getParameterTypes();
        for (int i = 0; i < params.length; i++) {
            Class<?> arg = k.args.get(i);
            if (arg == Void.class ? params[i].isPrimitive() : !boxed(params[i]).isAssignableFrom(arg)) return;
        }
        matches.add(m);
    }
    private static Class<?> boxed(Class<?> c) {
        if (!c.isPrimitive()) return c;
        if (c == int.class) return Integer.class;
        if (c == boolean.class) return Boolean.class;
        if (c == long.class) return Long.class;
        if (c == float.class) return Float.class;
        if (c == double.class) return Double.class;
        if (c == byte.class) return Byte.class;
        if (c == char.class) return Character.class;
        if (c == short.class) return Short.class;
        return Void.class;
    }
}
