package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import ls.augment.com.SystemUiCrashJournal;

/** Observe the existing fatal dispatch; never replace a handler or consume its exception. */
final class SystemUiCrashCapture {
    private static boolean installed;
    // LSPosed observes this exact host dispatch rather than replacing its fatal
    // handler. Return/static checks and the RuntimeInit fallback are mandatory;
    // an unavailable hidden endpoint must never change exception propagation.

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    @android.annotation.SuppressLint({"SoonBlockedPrivateApi", "PrivateApi"})
    static synchronized void install(AugmentModule module) {
        if(installed)return;
        String route="unavailable";
        for(String name:new String[]{"thread_dispatch","runtime_logging"})try {
            Method method=name.equals("thread_dispatch")?Thread.class.getDeclaredMethod("dispatchUncaughtException",Throwable.class)
                :Class.forName("com.android.internal.os.RuntimeInit$LoggingHandler").getDeclaredMethod("uncaughtException",Thread.class,Throwable.class);
            if(method.getReturnType()!=void.class||Modifier.isStatic(method.getModifiers()))continue;
            method.setAccessible(true);final int errorIndex=name.equals("thread_dispatch")?0:1;
            module.registerFeatureHook(module.prepareFeatureHook(method,"systemui.fatal."+name,true).intercept(chain->{
                try{Object error=chain.getArg(errorIndex);if(error instanceof Throwable)SystemUiCrashJournal.capture((Throwable)error);}catch(Throwable ignored){}
                return chain.proceed();
            }));
            route=name;installed=true;break;
        }catch(Throwable ignored){/* Probe the next exact fatal entry, preserving native dispatch. */}
        SystemUiCrashJournal.hook(route);
        module.logFeatureInfo("SYSTEMUI_CRASH_CAPTURE route="+route+";native_abort_and_sigkill=NOT_CAPTURED");
    }
}
