package ls.augment.com.step;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Process;
import java.util.ArrayList;
import java.util.LinkedHashSet;

/** Only the module's ordinary app process writes these Android user-local preferences. */
final class QuickPreferences {
    static SharedPreferences prefs(Context c) { return c.getSharedPreferences("workspace_ui", Context.MODE_PRIVATE); }
    static LinkedHashSet<String> pins(Context c) {
        LinkedHashSet<String> result = new LinkedHashSet<>();
        for (String key : prefs(c).getString("pins", "").split("\n"))
            if (ComponentName.unflattenFromString(key) != null) result.add(key);
        return result;
    }
    static int count(Context c){
        return ls.augment.com.StepConfig.sideCount(c);
    }
    static boolean upper(Context c){return ls.augment.com.StepConfig.upper(c);}
    static boolean saveLayout(Context c,int count,boolean upper){
        return ls.augment.com.StepConfig.saveLayout(c,count,upper);
    }
    static Intent snapshot(Context c, Intent i) {
        return i.putExtra("enabled",ls.augment.com.StepConfig.enabled(c)).putExtra("quickUser", Process.myUserHandle())
                .putStringArrayListExtra("quickPins", new ArrayList<>(pins(c)))
                .putExtra("quickRevision", prefs(c).getLong("revision", 0))
                .putExtra("sideCount",count(c)).putExtra("upperEnabled",upper(c))
                .putExtra("pageIndicator",ls.augment.com.StepConfig.pageIndicator(c))
                .putExtra("toolbarAutoCollapse",ls.augment.com.StepConfig.toolbarAutoCollapse(c))
                .putExtra("leftSide", prefs(c).getBoolean("leftSide", false));
    }
    static boolean save(Context c, LinkedHashSet<String> keys, long revision) {
        SharedPreferences p = prefs(c);
        if (p.getLong("revision", 0) != revision) return false;
        if (!p.edit().putString("pins", android.text.TextUtils.join("\n", keys))
                .putLong("revision", revision + 1).commit()) return false;
        c.sendBroadcast(snapshot(c, new Intent(StepRuntime.ACTION).setPackage("com.android.systemui")
                .putExtra("operation", "quickPins")));
        return true;
    }
}
