package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Resolve inspected API shapes once per process, never by ROM/version number. */
final class HookCompatibility {
    private HookCompatibility() { }

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
