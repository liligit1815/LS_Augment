package ls.augment.com.step;

import io.github.libxposed.api.XposedInterface;
import java.lang.reflect.Executable;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;
import ls.augment.com.hook.AugmentModule;

final class StepHooks {
    static AugmentModule module;

    static void hookMethod(Executable target, StepHook callback) {
        module.hook(target).setId("ls.augment.step." + callback.getClass().getName())
                .setExceptionMode(XposedInterface.ExceptionMode.PASSTHROUGH)
                .intercept(chain -> {
                    if (!(callback instanceof StepHook.Discovery) && !StepRuntime.enabled && !StepRuntime.Wm.active)
                        return chain.proceed();
                    StepHook.MethodHookParam call = new StepHook.MethodHookParam(
                            chain.getThisObject(), chain.getArgs().toArray());
                    try {
                        callback.beforeHookedMethod(call);
                    } catch (Throwable failure) {
                        android.util.Log.w("RedMagicDuoStep", "before " + target, failure);
                        return chain.proceed();
                    }
                    if (!call.handled) {
                        try { call.result = chain.proceed(call.args); }
                        catch (Throwable original) { call.error = original; }
                    }
                    Throwable originalError = call.error;
                    Object originalResult = call.result;
                    try { callback.afterHookedMethod(call); }
                    catch (Throwable failure) {
                        android.util.Log.w("RedMagicDuoStep", "after " + target, failure);
                        if (originalError != null) throw originalError;
                        return originalResult;
                    }
                    if (call.error != null) throw call.error;
                    return call.result;
                });
    }

    static void hookAllMethods(Class<?> owner, String name, StepHook callback) {
        boolean found = false;
        for (Method method : owner.getDeclaredMethods()) {
            if (name.equals(method.getName())) { hookMethod(method, callback); found = true; }
        }
        if (!found) throw new IllegalStateException(owner.getName() + "." + name);
    }

    static void hookAllConstructors(Class<?> owner, StepHook callback) {
        for (Executable ctor : owner.getDeclaredConstructors()) hookMethod(ctor, callback);
    }

    static Object invokeOriginalMethod(Method method, Object receiver, Object[] args) throws Throwable {
        try { return module.getInvoker(method).setType(XposedInterface.Invoker.Type.ORIGIN).invokeSpecial(receiver, args); }
        catch (InvocationTargetException wrapper) { throw wrapper.getCause(); }
    }
}
