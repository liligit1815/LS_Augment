package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.os.Process;
import android.provider.Settings;
import java.util.Collections;

/** Only the OEM SystemUI settings process may publish a native switch selection. */
final class NativeIslandControl {
    static final String METHOD = "native_island_selection";
    static final String SETTING = "dynamic_island_switch_state";
    private NativeIslandControl() { }

    static Bundle call(Context context, String arg, Bundle extras, int uid, String caller, String[] packages) {
        Bundle result = new Bundle();
        if (arg != null || extras == null || extras.size() != 1 || !(extras.get("enabled") instanceof Boolean)
                || uid / 100000 != Process.myUid() / 100000 || !"com.android.systemui".equals(caller)
                || packages == null || !java.util.Arrays.asList(packages).contains(caller)) return result;
        try {
            if (context.getPackageManager().getApplicationInfo(caller, 0).uid != uid) return result;
            boolean enabled = extras.getBoolean("enabled");
            if (Settings.System.getInt(context.getContentResolver(), SETTING, -1) != (enabled ? 1 : 0)) return result;
            AppConfig.SaveResult saved = new AppConfig(context).save(Collections.singletonMap(
                    ConfigSchema.NATIVE_ISLAND_SELECTED, enabled ? "1" : "0"));
            result.putBoolean("ok", saved.success);
            result.putString("message", saved.message);
        } catch (Exception unavailable) { result.putString("message", "星云岛联动保存失败"); }
        return result;
    }
}
