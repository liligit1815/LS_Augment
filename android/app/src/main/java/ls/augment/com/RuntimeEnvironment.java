package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.provider.Settings;

/** An authenticated system-server receipt, bound to this Android boot and module version. */
final class RuntimeEnvironment {
    static final String LIFECYCLE="ls_augment_system_server_lifecycle";
    private static final String STORE="module-injection-receipt";
    private RuntimeEnvironment() { }
    static void record(Context context, int callerUid, String witness) {
        if(callerUid!=1000)return;
        int boot=bootCount(context);
        context.getSharedPreferences(STORE,0).edit().putInt("boot",boot)
                .putString("witness",witness).putLong("receivedAt",System.currentTimeMillis()).apply();
    }
    static boolean injected(Context context) {
        SharedPreferences receipt=context.getSharedPreferences(STORE,0);
        return ModuleRuntimeStatus.matchesReceipt(receipt.getString("witness",""),
                BuildConfig.VERSION_NAME,receipt.getInt("boot",-1),bootCount(context));
    }
    /** Periodic, Binder-authenticated telemetry survives a missed one-shot boot witness. */
    static String telemetryVersion(Context context,String liveSystemPid) {
        if(liveSystemPid==null||!liveSystemPid.matches("[1-9][0-9]*"))return "";
        String raw=context.getSharedPreferences("hook-processes",0).getString("pid_"+liveSystemPid,"");
        try {
            org.json.JSONObject snapshot=new org.json.JSONObject(raw);
            String process=snapshot.optString("process"),pkg=snapshot.optString("package");
            if(!("system".equals(process)||"system_server".equals(process))||!("system".equals(pkg)||"android".equals(pkg)))return "";
            String version=snapshot.optString("moduleVersion");
            boolean authenticated=ModuleRuntimeStatus.matchesTelemetry(version,version,snapshot.optInt("pid",-1),liveSystemPid,
                    snapshot.optInt("sourceUid",-1),snapshot.optBoolean("moduleLoaded"),
                    snapshot.optInt("receivedBoot",-1),bootCount(context));
            boolean fresh=DiagnosticEvidencePolicy.currentProcessSnapshot(version,version,snapshot.optInt("pid",-1),
                    true,snapshot.optBoolean("moduleLoaded"),snapshot.optLong("moduleLoadedElapsed"),
                    android.os.SystemClock.elapsedRealtime(),snapshot.optLong("receivedAt"),System.currentTimeMillis(),
                    snapshot.optInt("receivedBoot",-1),bootCount(context));
            return authenticated&&fresh?version:"";
        } catch(org.json.JSONException invalid) { return ""; }
    }
    static int bootCount(Context context) {
        try{return Settings.Global.getInt(context.getContentResolver(),Settings.Global.BOOT_COUNT,-1);}
        catch(RuntimeException unavailable){return -1;}
    }
}
