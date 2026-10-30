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
        if (arg != null || extras == null || (extras.size() != 1 && extras.size()!=2) || !(extras.get("enabled") instanceof Boolean)
                || uid / 100000 != Process.myUid() / 100000 || !"com.android.systemui".equals(caller)
                || packages == null || !java.util.Arrays.asList(packages).contains(caller)) return result;
        try {
            if (context.getPackageManager().getApplicationInfo(caller, 0).uid != uid) return result;
            String mode=extras.getString("mode",NativeIslandMode.LEGACY);
            if(!NativeIslandMode.known(mode)||extras.size()==2&&!extras.containsKey("mode"))return result;
            context.getPackageManager().getActivityInfo(new android.content.ComponentName(caller,NativeIslandMode.page(mode)),android.content.pm.PackageManager.MATCH_DISABLED_COMPONENTS);
            boolean enabled = extras.getBoolean("enabled");
            if (Settings.System.getInt(context.getContentResolver(), NativeIslandMode.key(mode), -1) != (enabled ? 1 : 0)) return result;
            if(!context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).edit()
                    .putString(NativeIslandMode.DIAGNOSTIC,NativeIslandMode.stamp(context,mode)).commit())return result;
            java.util.Map<String,String> selection=new java.util.LinkedHashMap<>();
            selection.put(ConfigSchema.NATIVE_ISLAND_SELECTED,enabled?"1":"0");
            if(NativeIslandMode.MODERN.equals(mode))selection.put(SystemUiOptions.ISLAND,"0");
            AppConfig.SaveResult saved = new AppConfig(context).save(selection);
            result.putBoolean("ok", saved.success);
            result.putString("message", saved.message);
        } catch (Exception unavailable) { result.putString("message", "星云岛联动保存失败"); }
        return result;
    }
}
