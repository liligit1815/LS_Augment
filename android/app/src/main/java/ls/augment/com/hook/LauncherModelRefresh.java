package ls.augment.com.hook;

import android.content.Context;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Inspected launcher state/model contracts, validated before calling native code. */
final class LauncherModelRefresh {
    private final Method state, model, reload;
    private final boolean reasonArgument;

    private LauncherModelRefresh(Class<?> owner) throws ReflectiveOperationException {
        boolean named = owner.getName().equals("com.android.launcher3.LauncherAppState");
        state = owner.getDeclaredMethod(named ? "getInstance" : "h", Context.class);
        model = owner.getDeclaredMethod(named ? "getModel" : "j");
        Method refresh;boolean withReason=false;
        try{refresh=model.getReturnType().getDeclaredMethod(named ? "forceReload" : "a0");}
        catch(NoSuchMethodException absent){
            if(!named)throw absent;
            refresh=model.getReturnType().getDeclaredMethod("forceReload",String.class);withReason=true;
        }
        reload=refresh;reasonArgument=withReason;
        if (!Modifier.isStatic(state.getModifiers()) || state.getReturnType() != owner
                || Modifier.isStatic(model.getModifiers()) || Modifier.isStatic(reload.getModifiers())
                || (!reasonArgument&&reload.getReturnType()!=void.class)
                || (reasonArgument&&reload.getReturnType()!=java.util.concurrent.CompletionStage.class)) {
            throw new NoSuchMethodException("Unsupported launcher model refresh contract");
        }
        state.setAccessible(true);
        model.setAccessible(true);
        reload.setAccessible(true);
    }

    static LauncherModelRefresh resolve(ClassLoader loader) throws ReflectiveOperationException {
        LauncherModelRefresh found = null;
        for (String name : new String[]{"com.android.launcher3.P2", "com.android.launcher3.V2",
                "com.android.launcher3.LauncherAppState"}) {
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
        Object target=model.invoke(state.invoke(null,context));
        if(reasonArgument)reload.invoke(target,"RedMagicDuo configuration changed");else reload.invoke(target);
    }
}
