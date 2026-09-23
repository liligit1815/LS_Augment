package ls.augment.com.hook;

import android.content.ComponentName;
import android.os.Bundle;
import ls.augment.com.SystemOptions;

/** Keep the selected assistant through the OEM SystemUI handoff for power presses. */
final class DefaultAssistantUiHook {
    private static final ThreadLocal<Boolean> POWER = ThreadLocal.withInitial(() -> false);

    static void install(AugmentModule module, ClassLoader loader) {
        String key = SystemOptions.key("power_default_assistant");
        OemHooks.methods(module, loader, "com.android.systemui.assist.AssistManager",
                "startAssist", void.class, 1, key, chain -> {
                    Bundle args = (Bundle) chain.getArg(0);
                    if (args == null || args.getInt("invocation_type", 0) != 6) return chain.proceed();
                    boolean previous = POWER.get();
                    POWER.set(true);
                    try { return chain.proceed(); } finally { POWER.set(previous); }
                });
        String adapter = "com.zte.adapt.mifavor.navbar.AssistManagerAdapt";
        OemHooks.methods(module, loader, adapter, "handleStartAssist", boolean.class, 2,
                key, chain -> POWER.get() ? false : chain.proceed());
        OemHooks.methods(module, loader, adapter, "getAssistInfoForUser", ComponentName.class, 1,
                key, chain -> POWER.get() ? chain.getArg(0) : chain.proceed());
    }

    private DefaultAssistantUiHook() { }
}
