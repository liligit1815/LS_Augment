package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Resolve inspected API shapes once per process, never by ROM/version number. */
final class HookCompatibility {
    private HookCompatibility() { }

    static Class<?> type(ClassLoader loader, String... names) throws ClassNotFoundException {
        for (String name : names) try { return Class.forName(name, false, loader); }
        catch (ClassNotFoundException ignored) { }
        throw new ClassNotFoundException(String.join("/", names));
    }

    /** Covariant returns and inherited implementations are valid only when explicitly requested. */
    static Method inheritedMethod(Class<?> owner, Class<?> result, boolean covariant,
            String[] names, Class<?>... parameters) throws NoSuchMethodException {
        for (String name : names) for (Class<?> at = owner; at != null; at = at.getSuperclass()) {
            try {
                Method method = at.getDeclaredMethod(name, parameters);
                Class<?> actual = method.getReturnType();
                if ((actual != result && !(covariant && !result.isPrimitive() && result.isAssignableFrom(actual)))
                        || Modifier.isStatic(method.getModifiers()) || Modifier.isAbstract(method.getModifiers())) continue;
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) { }
        }
        throw new NoSuchMethodException(owner.getName() + ":" + String.join("/", names));
    }

    static Method method(Class<?> owner, Class<?> result, boolean isStatic,
            String[] names, Class<?>... parameters) throws NoSuchMethodException {
        for (String name : names) {
            try {
                Method method = owner.getDeclaredMethod(name, parameters);
                if (method.getReturnType() != result
                        || Modifier.isStatic(method.getModifiers()) != isStatic
                        || Modifier.isAbstract(method.getModifiers())) continue;
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) { }
        }
        throw new NoSuchMethodException(owner.getName() + ":" + String.join("/", names));
    }

    static Field field(Class<?> owner, Class<?> type, boolean isStatic, String... names)
            throws NoSuchFieldException {
        for (String name : names) {
            try {
                Field field = owner.getDeclaredField(name);
                if (field.getType() != type || Modifier.isStatic(field.getModifiers()) != isStatic) continue;
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(owner.getName() + ":" + String.join("/", names));
    }

    static boolean calledFrom(StackTraceElement[] stack, Method method) {
        if (method == null || stack == null) return false;
        for (StackTraceElement frame : stack)
            if (method.getDeclaringClass().getName().equals(frame.getClassName())
                    && method.getName().equals(frame.getMethodName())) return true;
        return false;
    }
}
