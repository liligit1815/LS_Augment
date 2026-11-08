package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import ls.augment.com.SystemOptions;

/** Keep the selected assistant through the OEM SystemUI handoff for power presses. */
final class DefaultAssistantUiHook {
    private static final ThreadLocal<Boolean> POWER = ThreadLocal.withInitial(() -> false);

    static void install(AugmentModule module, ClassLoader loader) {
        String key = SystemOptions.key("power_default_assistant");
        int startHooks=OemHooks.observedMethods(module, loader, "com.android.systemui.assist.AssistManager",
                "startAssist", void.class, 1, key, chain -> {
                    Bundle args = (Bundle) chain.getArg(0);
                    int invocation = args == null ? 0 : args.getInt("invocation_type", 0);
                    Context context = OemHooks.context(chain.getThisObject(), chain.getArgs());
                    boolean enabled = FeatureSettings.enabled(context, key);
                    boolean gesture = FeatureSettings.enabled(context, SystemOptions.key("assist_gesture"));
                    FeatureRuntimeLog.event("ASSIST_UI_START", "invocation="+invocation+";powerEnabled="+enabled+";gestureEnabled="+gesture);
                    boolean previous = POWER.get();
                    if (enabled && invocation == 6) POWER.set(true);
                    try {
                        Object result=chain.proceed();
                        FeatureRuntimeLog.event("ASSIST_UI_RETURN", "invocation="+invocation+";result=chain_returned;business=unconfirmed");
                        return result;
                    } catch(Throwable failure) {
                        FeatureRuntimeLog.event("ASSIST_UI_RETURN", "invocation="+invocation+";result=chain_threw;error="+FeatureRuntimeLog.failure(failure));
                        throw failure;
                    } finally { POWER.set(previous); }
                }, new Class<?>[]{Bundle.class});
        String adapter = "com.zte.adapt.mifavor.navbar.AssistManagerAdapt";
        int dispatchHooks=OemHooks.observedMethods(module, loader, adapter, "handleStartAssist", boolean.class, 2,
                key, chain -> {
                    boolean preserve=POWER.get()&&FeatureSettings.enabled(OemHooks.context(chain.getThisObject(),chain.getArgs()),key);
                    FeatureRuntimeLog.event("ASSIST_UI_ADAPTER", "powerSession="+POWER.get()+";action="+(preserve?"preserve_default":"native_chain"));
                    return preserve ? false : chain.proceed();
                }, new Class<?>[]{Bundle.class,Context.class});
        int componentHooks=OemHooks.observedMethods(module, loader, adapter, "getAssistInfoForUser", ComponentName.class, 1,
                key, chain -> {
                    boolean preserve=POWER.get()&&FeatureSettings.enabled(OemHooks.context(chain.getThisObject(),chain.getArgs()),key);
                    Object result=preserve ? chain.getArg(0) : chain.proceed();
                    String detail="powerSession="+POWER.get()+";requested="+component(chain.getArg(0))+";resolved="+component(result);
                    FeatureRuntimeLog.state("ASSIST_UI_COMPONENT", detail, detail);
                    return result;
                }, new Class<?>[]{ComponentName.class});
        FeatureRuntimeLog.event("ASSIST_UI_CAPABILITY", "startAssist="+startHooks+";handleStartAssist="+dispatchHooks
                +";getAssistInfoForUser="+componentHooks+";missingInterfaceAction=native");
    }

    private static String component(Object value) {
        return value instanceof ComponentName ? ((ComponentName)value).flattenToShortString().replaceAll("[^A-Za-z0-9_.$/]","_") : "none";
    }

    private DefaultAssistantUiHook() { }
}
