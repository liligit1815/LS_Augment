package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** The installation probe and native bouncer request use the same exact contract. */
final class LiftArcUnlockEntry {
    private static final ClassValue<Entry> ENTRIES = new ClassValue<>() {
        @Override protected Entry computeValue(Class<?> type) {
            return new Entry(find(type,boolean.class,String.class),find(type,boolean.class));
        }
    };
    private static final class Entry {
        final Method reasoned,legacy;
        Entry(Method reasoned,Method legacy) { this.reasoned=reasoned;this.legacy=legacy; }
    }
    static boolean supported(Class<?> type) {
        if(type==null)return false;
        Entry entry=ENTRIES.get(type);return entry.reasoned!=null||entry.legacy!=null;
    }
    static void require(Class<?> type) throws NoSuchMethodException {
        if(!supported(type))throw new NoSuchMethodException((type==null?"null":type.getName())+".showPrimaryBouncer(boolean[,String])");
    }
    static void show(Object owner) throws ReflectiveOperationException {
        if(owner==null)throw new NoSuchMethodException("No captured keyguard manager");
        Entry entry=ENTRIES.get(owner.getClass());
        if(entry.reasoned!=null)try {
            entry.reasoned.invoke(owner,true,"redmagic_duo_liftarc");return;
        } catch(ReflectiveOperationException error) {
            // Preserve the existing native single-argument fallback when both exist.
            if(entry.legacy==null)throw error;
        }
        if(entry.legacy!=null) { entry.legacy.invoke(owner,true);return; }
        require(owner.getClass());
    }
    private static Method find(Class<?> type,Class<?>... parameters) {
        for(Class<?> current=type;current!=null;current=current.getSuperclass())try {
            Method method=current.getDeclaredMethod("showPrimaryBouncer",parameters);
            int modifiers=method.getModifiers();
            if(method.getReturnType()!=void.class||Modifier.isStatic(modifiers)
                    ||Modifier.isAbstract(modifiers)||method.isSynthetic())return null;
            method.setAccessible(true);return method;
        } catch(NoSuchMethodException absent) { }
        return null;
    }
    private LiftArcUnlockEntry() { }
}
