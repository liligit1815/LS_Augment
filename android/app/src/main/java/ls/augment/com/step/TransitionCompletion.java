package ls.augment.com.step;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Resolve only the two inspected native transition completion contracts. */
public final class TransitionCompletion {
    public static Method transactionReplay(Class<?> display,Class<?> transaction) throws NoSuchMethodException {
        Method method;
        try{method=OwnershipBridge.method(display,"reapplyMagnificationSpec",transaction);}
        catch(NoSuchMethodException absent){return null;}
        if(method.getReturnType()!=void.class||Modifier.isStatic(method.getModifiers()))
            throw new NoSuchMethodException("Unknown transaction magnification contract");
        return method;
    }
    public static Method resolve(Class<?> transition, Class<?> actionChain) throws NoSuchMethodException {
        Method method;
        try { method = OwnershipBridge.method(transition, "finishTransition"); }
        catch (NoSuchMethodException legacyAbsent) {
            if (actionChain == null) throw legacyAbsent;
            method = OwnershipBridge.method(transition, "finishTransition", actionChain);
        }
        if (method.getReturnType() != void.class || Modifier.isStatic(method.getModifiers()))
            throw new NoSuchMethodException("Unknown native transition completion contract");
        return method;
    }
}
