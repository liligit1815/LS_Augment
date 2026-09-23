package ls.augment.com;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PermissionInfo;
import android.content.pm.ResolveInfo;
import android.os.Process;
import android.os.SystemClock;
import org.json.JSONArray;
import org.json.JSONObject;

/** Read-only public API comparison under the target application's ordinary UID. */
final class PackageEnumerationDiagnostics {
    private PackageEnumerationDiagnostics() { }

    static JSONObject capture(Context context) throws Exception {
        PackageManager pm = context.getPackageManager();
        JSONObject result = new JSONObject()
                .put("uid", Process.myUid()).put("pid", Process.myPid())
                .put("contextPackage", context.getPackageName())
                .put("contextApplicationUid", context.getApplicationInfo().uid)
                .put("shellIdentityAdopted", false).put("rootUsed", false)
                .put("configurationInitialized", false)
                .put("queryAllPackagesPermission", context.checkSelfPermission(
                        "android.permission.QUERY_ALL_PACKAGES"));

        JSONObject installed = new JSONObject().put("flags", 0);
        long started = SystemClock.elapsedRealtime();
        try {
            JSONArray applications = new JSONArray();
            for (ApplicationInfo info : pm.getInstalledApplications(0)) {
                applications.put(application(info));
            }
            installed.put("count", applications.length()).put("applications", applications);
        } catch (Exception failure) {
            installed.put("error", failure.toString());
        }
        installed.put("elapsedMs", SystemClock.elapsedRealtime() - started);
        result.put("installedApplications", installed);
        result.put("mainLauncher", query(pm, Intent.CATEGORY_LAUNCHER));
        // getLaunchIntentForPackage also accepts CATEGORY_INFO before LAUNCHER.
        result.put("mainInfo", query(pm, Intent.CATEGORY_INFO));

        JSONArray probes = new JSONArray();
        for (String packageName : new String[]{"ls.augment.com",
                "ls.augment.regression.window1", "ls.augment.regression.game",
                "ls.augment.regression.nongame", "com.android.settings",
                "com.tencent.tmgp.sgame"}) {
            JSONObject probe = new JSONObject().put("package", packageName);
            try {
                ApplicationInfo info = pm.getApplicationInfo(packageName, 0);
                probe.put("application", application(info));
                probe.put("label", String.valueOf(info.loadLabel(pm)));
            } catch (Exception failure) {
                probe.put("applicationError", failure.toString());
            }
            try {
                Intent launch = pm.getLaunchIntentForPackage(packageName);
                probe.put("launchIntent", launch == null ? JSONObject.NULL : launch.toUri(0));
                probe.put("launchComponent", launch == null || launch.getComponent() == null
                        ? JSONObject.NULL : launch.getComponent().flattenToString());
            } catch (Exception failure) {
                probe.put("launchError", failure.toString());
            }
            probes.put(probe);
        }
        result.put("knownPackages", probes);

        String permissionName = "ZTE.permission.ZTE_GET_ALL_PACKAGES_PERM";
        JSONObject permission = new JSONObject().put("name", permissionName)
                .put("selfPermission", context.checkSelfPermission(permissionName));
        try {
            PermissionInfo info = pm.getPermissionInfo(permissionName, 0);
            permission.put("packageName", info.packageName)
                    .put("group", info.group == null ? JSONObject.NULL : info.group)
                    .put("protectionLevel", info.protectionLevel);
        } catch (Exception failure) {
            permission.put("definitionError", failure.toString());
        }
        return result.put("oemPermission", permission)
                .put("interpretation", "Capture completed; API visibility and picker behavior require separate assessment.");
    }

    private static JSONObject application(ApplicationInfo info) throws Exception {
        return new JSONObject().put("package", info.packageName).put("uid", info.uid)
                .put("enabled", info.enabled).put("flags", info.flags)
                .put("installed", (info.flags & ApplicationInfo.FLAG_INSTALLED) != 0)
                .put("system", (info.flags & ApplicationInfo.FLAG_SYSTEM) != 0);
    }

    private static JSONObject query(PackageManager pm, String category) throws Exception {
        JSONObject result = new JSONObject().put("action", Intent.ACTION_MAIN)
                .put("category", category).put("flags", 0);
        long started = SystemClock.elapsedRealtime();
        try {
            JSONArray activities = new JSONArray();
            java.util.LinkedHashSet<String> packages = new java.util.LinkedHashSet<>();
            Intent intent = new Intent(Intent.ACTION_MAIN).addCategory(category);
            for (ResolveInfo resolve : pm.queryIntentActivities(intent, 0)) {
                if (resolve.activityInfo == null) {
                    activities.put(new JSONObject().put("activityInfoMissing", true));
                    continue;
                }
                android.content.pm.ActivityInfo info = resolve.activityInfo;
                JSONObject activity = new JSONObject().put("package", info.packageName)
                        .put("name", info.name).put("enabled", info.enabled)
                        .put("exported", info.exported);
                if (info.applicationInfo != null) {
                    activity.put("application", application(info.applicationInfo));
                }
                activities.put(activity);
                packages.add(info.packageName);
            }
            result.put("count", activities.length()).put("activities", activities)
                    .put("uniquePackageCount", packages.size())
                    .put("uniquePackages", new JSONArray(packages));
        } catch (Exception failure) {
            result.put("error", failure.toString());
        }
        return result.put("elapsedMs", SystemClock.elapsedRealtime() - started);
    }
}
