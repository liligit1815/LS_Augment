package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Local system-server reflection only. No Binder calls while a subsystem lock is held. */
final class AtomicWorkbenchMediaEvidenceReflect {
    static Field member(Class<?> type, String name) throws ReflectiveOperationException {
        for (Class<?> at = type; at != null; at = at.getSuperclass()) try {
            Field field = at.getDeclaredField(name); field.setAccessible(true); return field;
        } catch (NoSuchFieldException missing) { }
        throw new NoSuchFieldException(name);
    }
    static Object field(Object owner, String name) throws ReflectiveOperationException {
        if (owner == null) throw new SecurityException(); return member(owner.getClass(), name).get(owner);
    }
    static Method method(Class<?> type, String name, Class<?>... args) throws ReflectiveOperationException {
        for (Class<?> at = type; at != null; at = at.getSuperclass()) try {
            Method method = at.getDeclaredMethod(name, args); method.setAccessible(true); return method;
        } catch (NoSuchMethodException missing) { }
        throw new NoSuchMethodException(name);
    }
    static boolean text(String text, int max) {
        if (text == null || text.isEmpty() || text.length() > max) return false;
        for (int i = 0; i < text.length(); i++) if (Character.isISOControl(text.charAt(i))) return false;
        return true;
    }
    private AtomicWorkbenchMediaEvidenceReflect() { }
}
