package ls.augment.com.hook;

import android.graphics.Bitmap;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/** Resolve BitmapInfo through the model, since its obfuscated package changes between ROMs. */
final class LauncherIconBinding {
    final Field icon, bitmap;
    private final Field flags, badge;
    private final Constructor<?> constructor;
    private final LauncherImmutableIcon immutable;

    private LauncherIconBinding(Field icon) throws ReflectiveOperationException {
        this.icon = icon;
        Class<?> type = icon.getType();
        boolean named = type.getName().equals("com.android.launcher3.icons.BitmapInfo");
        Constructor<?> legacy;LauncherImmutableIcon modern=null;
        try{legacy=type.getConstructor(Bitmap.class,int.class);}
        catch(NoSuchMethodException absent){legacy=null;modern=new LauncherImmutableIcon(type);}
        constructor=legacy;immutable=modern;
        bitmap = field(type, named ? "icon" : "a", Bitmap.class);
        flags = field(type, named ? "flags" : "d", int.class);
        badge = field(type, named ? "badgeInfo" : "f", type);
        if (Modifier.isStatic(icon.getModifiers()) || Modifier.isFinal(icon.getModifiers())
                || immutable==null&&(Modifier.isFinal(flags.getModifiers()) || Modifier.isFinal(badge.getModifiers()))) {
            throw new NoSuchFieldException("Launcher icon fields are not writable");
        }
        icon.setAccessible(true);
    }

    static LauncherIconBinding resolve(Class<?> model) throws ReflectiveOperationException {
        // Accept exactly one complete contract; never choose a field by reflection order.
        LauncherIconBinding found = null;
        for (Class<?> owner = model; owner != null && owner != Object.class; owner = owner.getSuperclass()) {
            for (Field candidate : owner.getDeclaredFields()) {
                if (Modifier.isStatic(candidate.getModifiers()) || candidate.getType().isPrimitive()) continue;
                LauncherIconBinding binding;
                try { binding = new LauncherIconBinding(candidate); }
                catch (ReflectiveOperationException incompatible) { continue; }
                if (found != null) throw new NoSuchFieldException("Ambiguous launcher icon fields");
                found = binding;
            }
        }
        if (found == null) throw new NoSuchFieldException("Unsupported launcher BitmapInfo structure");
        return found;
    }

    private static Field field(Class<?> type, String name, Class<?> expected) throws NoSuchFieldException {
        for (Class<?> owner = type; owner != null; owner = owner.getSuperclass()) {
            Field result;
            try { result = owner.getDeclaredField(name); }
            catch (NoSuchFieldException absent) { continue; }
            if (result.getType() != expected || Modifier.isStatic(result.getModifiers())) {
                throw new NoSuchFieldException(type.getName() + "." + name + " has an unsupported type");
            }
            result.setAccessible(true);
            return result;
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }

    Object create(Bitmap image, Object original) throws ReflectiveOperationException {
        if(immutable!=null)return immutable.create(image,original);
        Object copy = constructor.newInstance(image, 0);
        if (original != null) {
            flags.set(copy, flags.get(original));
            badge.set(copy, badge.get(original));
        }
        return copy;
    }
}
