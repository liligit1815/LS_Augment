package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Exact OEM contracts, including members moved to a controller/state superclass. */
final class FanMembers {
    static Method method(Class<?> type, String name, Class<?> result, boolean isStatic,
                         Class<?>... arguments) throws NoSuchMethodException {
        for (Class<?> owner=type; owner!=null && owner!=Object.class; owner=owner.getSuperclass()) {
            Method found;
            try { found=owner.getDeclaredMethod(name,arguments); }
            catch (NoSuchMethodException inherited) { continue; }
            if (found.getReturnType()!=result || Modifier.isStatic(found.getModifiers())!=isStatic
                    || Modifier.isAbstract(found.getModifiers())) throw new NoSuchMethodException(type.getName()+"."+name+":signature");
            found.setAccessible(true);
            return found;
        }
        throw new NoSuchMethodException(type.getName()+"."+name);
    }

    static Field field(Class<?> type, String name, Class<?> valueType) throws NoSuchFieldException {
        for (Class<?> owner=type; owner!=null && owner!=Object.class; owner=owner.getSuperclass()) {
            Field found;
            try { found=owner.getDeclaredField(name); }
            catch (NoSuchFieldException inherited) { continue; }
            // A shadowing field with a different type must not fall through to a parent.
            if (found.getType()!=valueType || Modifier.isStatic(found.getModifiers()))
                throw new NoSuchFieldException(type.getName()+"."+name+":signature");
            found.setAccessible(true);
            return found;
        }
        throw new NoSuchFieldException(type.getName()+"."+name);
    }
    private FanMembers() { }
}
