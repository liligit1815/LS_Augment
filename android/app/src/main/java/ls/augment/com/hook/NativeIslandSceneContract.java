package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Runtime contracts, including inherited OEM implementations; no model/version assumptions. */
final class NativeIslandSceneContract {
    private NativeIslandSceneContract() { }

    static Field field(Class<?> type, String name, Class<?> valueType) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                Field value = current.getDeclaredField(name);
                if (!valueType.isAssignableFrom(value.getType())) return null;
                value.setAccessible(true);
                return value;
            } catch (NoSuchFieldException absent) {
                // Older implementations can declare the same contract in a parent.
            } catch (RuntimeException inaccessible) { return null; }
        }
        return null;
    }

    static Method method(Class<?> type, String name, Class<?> result, Class<?>... parameters) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            Method[] methods;
            try { methods = current.getDeclaredMethods(); }
            catch (LinkageError missingSignatureType) { return null; }
            for (Method method : methods) {
                if (!method.getName().equals(name) || method.isBridge() || method.isSynthetic()
                        || !result.isAssignableFrom(method.getReturnType())) continue;
                Class<?>[] actual = method.getParameterTypes();
                if (actual.length != parameters.length) continue;
                boolean matches = true;
                for (int i = 0; i < actual.length; i++) {
                    if (!actual[i].isAssignableFrom(parameters[i])) { matches = false; break; }
                }
                if (matches) {
                    try { method.setAccessible(true); return method; }
                    catch (RuntimeException inaccessible) { return null; }
                }
            }
        }
        return null;
    }
}
