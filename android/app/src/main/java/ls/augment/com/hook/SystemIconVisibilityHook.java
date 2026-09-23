package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.ArraySet;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Rebuild native icons from the unchanged OEM hide list when its override changes. */
final class SystemIconVisibilityHook {
    private static final String KEY = SystemUiOptions.PREFIX + "ignore_system_icon_hide";
    private static final String NATIVE_KEY = "status_bar_keys_close";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, State> CONTROLLERS = new WeakHashMap<>();
    private static boolean observing;
    private static AugmentModule module;
    private SystemIconVisibilityHook() { }

    static int install(AugmentModule owner, ClassLoader loader) {
        module = owner;
        int count = hook(owner, loader, "com.android.systemui.statusbar.phone.ui.StatusBarIconControllerImpl",
                "onTuningChanged", 2, (o,a,r) -> {
                    if (NATIVE_KEY.equals(a[0])) remember(o, (String)a[1]);
                    return PASS;
                }, null);
        count += hook(owner, loader, "com.android.systemui.statusbar.phone.ui.StatusBarIconController",
                "getIconHideList", 2, (o,a,r) -> a[0] instanceof Context
                        && enabled((Context)a[0]) ? new ArraySet<String>() : PASS, null);
        // The OEM also blocks some classic icons per container, outside its
        // user hide list. Set the actual constructor input, not only the query.
        count += hook(owner, loader, "com.android.systemui.statusbar.phone.ui.IconManager", "addIcon", 4,
                (o,a,r) -> {
                    if (a[2] instanceof Boolean && enabled(context(o))) a[2] = false;
                    return PASS;
                }, null);
        return count;
    }

    private static void remember(Object owner, String nativeValue) {
        Context context = context(owner);
        CONTROLLERS.put(owner, new State(nativeValue, enabled(context)));
        if (!observing && context != null) {
            observing = FeatureSettings.addSnapshotListener(context, () -> MAIN.post(SystemIconVisibilityHook::refresh));
        }
    }

    private static void refresh() {
        // Replaying the original native callback also repairs an early boot
        // callback that ran before the module's asynchronous snapshot arrived.
        for (Object owner : new ArrayList<>(CONTROLLERS.keySet())) {
            State state = CONTROLLERS.get(owner);
            if (state == null || state.enabled == enabled(context(owner))) continue;
            try { call(owner, "onTuningChanged", NATIVE_KEY, state.nativeValue); }
            catch (ReflectiveOperationException error) { module.logFeatureError("RM_ICON_VISIBILITY_REFRESH", error); }
        }
    }

    private static boolean enabled(Context context) {
        return !RedMagicLegacyUiHook.positionSizeOnly(context) && FeatureSettings.enabled(context, KEY);
    }

    private static final class State {
        final String nativeValue;
        final boolean enabled;
        State(String value, boolean enabled) { nativeValue = value; this.enabled = enabled; }
    }
}
