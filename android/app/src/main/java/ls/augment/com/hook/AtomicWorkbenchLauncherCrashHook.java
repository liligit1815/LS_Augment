package ls.augment.com.hook;

import android.content.Context;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import io.github.libxposed.api.XposedInterface.ExceptionMode;

/** Protects launcher data only from this ROM's automatic, in-handler wipe.
 * The original exception, preferences, error UI, termination and explicit user
 * reset are still executed by the ROM. No process-wide clear-data interception. */
final class AtomicWorkbenchLauncherCrashHook {
    private static final ThreadLocal<CrashScope> UNCAUGHT = new ThreadLocal<>();
    private static final class CrashScope {
        final Object handler;
        boolean active = true;
        CrashScope(Object handler) { this.handler = handler; }
    }
    private static boolean installed;
    private AtomicWorkbenchLauncherCrashHook() { }

    private record Contract(Field instance,Method uncaught,Method clear) { }
    private static Contract contract(ClassLoader loader)throws ReflectiveOperationException {
        for(String[] names:new String[][]{{"x1.w","x1.w$a","b","i"},
                {"com.android.launcher3.mfvUtil.CrashHandler","com.android.launcher3.mfvUtil.CrashHandler$1","this$0","cleaner"}}){
            try{
                Class<?> handler=Class.forName(names[0],false,loader),callback=Class.forName(names[1],false,loader);
                if(!Thread.UncaughtExceptionHandler.class.isAssignableFrom(callback))continue;
                Field instance=callback.getDeclaredField(names[2]);
                Method uncaught=callback.getDeclaredMethod("uncaughtException",Thread.class,Throwable.class);
                Method clear=handler.getDeclaredMethod(names[3],Context.class);
                if(instance.getType()!=handler||clear.getReturnType()!=void.class
                        ||java.lang.reflect.Modifier.isStatic(clear.getModifiers()))continue;
                instance.setAccessible(true);return new Contract(instance,uncaught,clear);
            }catch(ClassNotFoundException|NoSuchMethodException|NoSuchFieldException absent){}
        }
        throw new NoSuchMethodException("scoped_uncaught_handler_and_cleaner");
    }

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Contract contract=contract(loader);
            Field instance=contract.instance();Method uncaught=contract.uncaught(),clear=contract.clear();
            module.deoptimize(uncaught);
            module.deoptimize(clear);
            module.registerFeatureHook(module.prepareFeatureHook(uncaught, "atomic_workbench.launcher_crash.scope", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                CrashScope previous = null, current = null;
                try {
                    previous = UNCAUGHT.get();
                    current = new CrashScope(instance.get(chain.getThisObject()));
                    UNCAUGHT.set(current);
                } catch (Throwable unavailable) {
                    if (current != null) current.active = false;
                    restore(previous);
                    return chain.proceed();
                }
                try {
                    // The normal logger also writes Logcat, so never hand it the
                    // original message/cause, even though persisted telemetry is safe.
                    try {
                        Throwable original = (Throwable) chain.getArg(1);
                        String type = original == null ? "unknown" : original.getClass().getName();
                        if (!type.matches("[A-Za-z0-9_.$]{1,160}")) type = "unknown";
                        Throwable safe = new Throwable((String) null);
                        java.util.ArrayList<StackTraceElement> frames = new java.util.ArrayList<>();
                        if (original != null) for (StackTraceElement frame : original.getStackTrace()) {
                            if (frames.size() >= 12) break;
                            String file = frame.getFileName();
                            if (frame.getClassName().matches("[A-Za-z0-9_.$]{1,160}")
                                    && frame.getMethodName().matches("[A-Za-z0-9_.$<>-]{1,160}")
                                    && (file == null || file.matches("[A-Za-z0-9_.$-]{1,160}"))) frames.add(frame);
                        }
                        safe.setStackTrace(frames.toArray(new StackTraceElement[0]));
                        module.logFeatureError("ATOMIC_LAUNCHER_CRASH phase=uncaught;reason=original_handler;errorClass=" + type, safe);
                    }
                    catch (Throwable ignored) { }
                    return chain.proceed();
                } finally {
                    // Invalidate before touching ThreadLocal: even a failed remove
                    // must never authorize a later manual clear on this thread.
                    current.active = false;
                    restore(previous);
                }
            }));
            module.registerFeatureHook(module.prepareFeatureHook(clear, "atomic_workbench.launcher_crash.automatic_clear", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                // The explicit reset buttons call the same method outside this scope.
                CrashScope scope;
                try { scope = UNCAUGHT.get(); }
                catch (Throwable unavailable) { return chain.proceed(); }
                if (scope == null || !scope.active || scope.handler != chain.getThisObject()) return chain.proceed();
                String reason;
                try { reason = AtomicWorkbenchQuickstepInputHook.crashProtectionReason((Context) chain.getArg(0)); }
                catch (Throwable failure) { reason = "authentication_unavailable"; }
                boolean protect = reason.isEmpty();
                try { module.logFeatureInfo("ATOMIC_LAUNCHER_CRASH phase=" + (protect ? "protected" : "original_clear")
                        + ";reason=" + (protect ? "authenticated_workbench_automatic_clear" : reason)); }
                catch (Throwable ignored) { }
                return protect ? null : chain.proceed();
            }));
            installed = true;
        } catch (Throwable unavailable) {
            try { module.logFeatureInfo("ATOMIC_LAUNCHER_CRASH phase=unavailable;reason=rom_contract_unmatched"); }
            catch (Throwable ignored) { }
        }
    }

    private static void restore(CrashScope previous) {
        try { if (previous == null) UNCAUGHT.remove(); else UNCAUGHT.set(previous); }
        catch (Throwable unavailable) {
            try { UNCAUGHT.set(previous); } catch (Throwable ignored) { }
        }
    }
}
