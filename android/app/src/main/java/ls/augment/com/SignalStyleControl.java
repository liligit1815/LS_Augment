package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.os.Process;

/** Narrow Settings commands; no arbitrary feature keys can be written by another app. */
final class SignalStyleControl {
    private SignalStyleControl() { }

    static Bundle call(Context context, String method, String arg, Bundle extras,
            int uid, String caller, String[] packages) {
        Bundle result = new Bundle();
        result.putBoolean("ok", false);
        if (context == null || arg != null
                || !SignalStylePolicy.allowedCaller(uid, Process.myUid(), caller, packages)) {
            result.putString("message", "无权修改信号栏样式");
            return result;
        }
        if (uid != Process.myUid()) {
            try {
                if (context.getPackageManager().getApplicationInfo("com.android.settings", 0).uid != uid)
                    return result;
            } catch (android.content.pm.PackageManager.NameNotFoundException unavailable) {
                return result;
            }
        }
        AppConfig config = new AppConfig(context);
        if (SignalStylePolicy.SELECT.equals(method)) {
            if (extras == null || extras.size() != 1
                    || !(extras.get("dual") instanceof Boolean || extras.get("choice") instanceof Integer)) {
                result.putString("message", "信号栏样式参数无效");
                return result;
            }
            // AppConfig merges and checks the latest three-in-one state under its write lock.
            java.util.Map<String,String> updates;
            if(extras.get("choice") instanceof Integer){
                int choice=extras.getInt("choice",-1);
                if(choice<SignalStylePolicy.FLAT||choice>SignalStylePolicy.IOS_DUAL){
                    result.putString("message", "信号栏样式参数无效");return result;
                }
                updates=SignalStylePolicy.selection(choice);
            }else updates=SignalStylePolicy.selection(extras.getBoolean("dual"));
            AppConfig.SaveResult saved = config.save(updates);
            result.putBoolean("ok", saved.success);
            result.putString("message", saved.message);
        } else if (SignalStylePolicy.READ.equals(method) && extras == null) {
            result.putBoolean("ok", true);
        } else {
            result.putString("message", "信号栏样式参数无效");
            return result;
        }
        ConfigSnapshot snapshot = config.configSnapshot();
        result.putBoolean("dual", ConfigSchema.truthy(snapshot.get(SystemUiOptions.SIGNAL_DUAL)));
        result.putString("style", String.valueOf(SignalStylePolicy.style(snapshot.get(SystemUiOptions.SIGNAL_DUAL_STYLE))));
        result.putInt("choice", SignalStylePolicy.choice(ConfigSchema.truthy(snapshot.get(SystemUiOptions.SIGNAL_DUAL)),
                SignalStylePolicy.style(snapshot.get(SystemUiOptions.SIGNAL_DUAL_STYLE))));
        result.putBoolean("threeInOne", ConfigSchema.truthy(snapshot.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)));
        result.putBoolean("master", ConfigSchema.truthy(snapshot.get(ConfigSchema.SYSTEMUI_MASTER)));
        result.putLong("revision", snapshot.revision);
        return result;
    }
}
