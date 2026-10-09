package ls.augment.com.hook;

import android.content.Context;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Inspected launcher state/model contracts, validated before calling native code. */
final class LauncherModelRefresh {
    private final Method state, model, reload;

    private LauncherModelRefresh(Class<?> owner) throws ReflectiveOperationException {
        state = owner.getDeclaredMethod("h", Context.class);
        model = owner.getDeclaredMethod("j");
        reload = model.getReturnType().getDeclaredMethod("a0");
        if (!Modifier.isStatic(state.getModifiers()) || state.getReturnType() != owner
                || Modifier.isStatic(model.getModifiers()) || Modifier.isStatic(reload.getModifiers())
                || reload.getReturnType() != void.class) {
            throw new NoSuchMethodException("Unsupported launcher model refresh contract");
        }
        state.setAccessible(true);
        model.setAccessible(true);
        reload.setAccessible(true);
    }

    static LauncherModelRefresh resolve(ClassLoader loader) throws ReflectiveOperationException {
        LauncherModelRefresh found = null;
        for (String name : new String[]{"com.android.launcher3.P2", "com.android.launcher3.V2"}) {
            LauncherModelRefresh candidate;
            try { candidate = new LauncherModelRefresh(Class.forName(name, false, loader)); }
            catch (ReflectiveOperationException unsupported) { continue; }
            if (found != null) throw new NoSuchMethodException("Ambiguous launcher model refresh");
            found = candidate;
        }
        if (found == null) throw new NoSuchMethodException("Launcher model refresh unavailable");
        return found;
    }

    void refresh(Context context) throws ReflectiveOperationException {
        reload.invoke(model.invoke(state.invoke(null, context)));
    }
}
