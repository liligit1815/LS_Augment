package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import java.lang.reflect.Method;
import java.util.List;

/** Shared checks for the OEM's existing direct-map fallback; checking never starts an action. */
final class NativeIslandPersonalNavigation {
    private final Method navigate, installed, amapValid;
    NativeIslandPersonalNavigation(ClassLoader loader) throws Exception {
        Class<?> type = Class.forName("com.zte.widget.util.NavigateUtil", false, loader);
        navigate = NativeIslandPersonalCards.requireStatic(type, "startNavigation", void.class, Context.class, String.class, String.class);
        installed = NativeIslandPersonalCards.requireStatic(type, "isAppInstalled", boolean.class, Context.class, String.class);
        amapValid = NativeIslandPersonalCards.requireStatic(type, "isAmapVersionValid", boolean.class, Context.class);
    }
    void start(Context context, String command, String destination) throws Exception { navigate.invoke(null, context, command, destination); }
    boolean available(Context context) throws Exception {
        boolean baidu = Boolean.TRUE.equals(installed.invoke(null, context, "com.baidu.BaiduMap"));
        boolean amap = Boolean.TRUE.equals(installed.invoke(null, context, "com.autonavi.minimap"));
        if (baidu) {
            for (String mode : new String[]{"driving", "taxing"}) if (!launchable(context, new Intent().setData(Uri.parse(
                    "baidumap://map/direction?destination=&coord_type=bd09ll&mode=" + mode + "&src=andr.baidu.openAPIdemo")), "com.baidu.BaiduMap")) return false;
            if (!amap) return true;
        }
        if (amap && (baidu || Boolean.TRUE.equals(amapValid.invoke(null, context)))) {
            for (String mode : new String[]{"0", "6"}) if (!launchable(context, new Intent("android.intent.action.VIEW").addCategory("android.intent.category.DEFAULT")
                    .setData(Uri.parse("amapuri://route/plan/?sid=&slat=&slon=&sname=&did=&dlat=&dlon=&dname=&dev=0&t=" + mode)), "com.autonavi.minimap")) return false;
            return true;
        }
        return launchable(context, new Intent().setPackage("zte.com.market").setData(Uri.parse("http://market.android.com/search?q=name:高德地图")), "zte.com.market");
    }
    static boolean voiceAvailable(Context context) {
        List<ResolveInfo> receivers = context.getPackageManager().queryBroadcastReceivers(
                new Intent("com.zte.aiassistant.action.EXTERNAL_REQUEST").setPackage("com.zte.aiassistant"), 0);
        if (receivers != null) for (ResolveInfo receiver : receivers)
            if (receiver.activityInfo != null && "com.zte.aiassistant".equals(receiver.activityInfo.packageName)
                    && accessible(context, receiver.activityInfo, false)) return true;
        return false;
    }
    static boolean launchable(Context context, Intent intent, String expectedPackage) {
        if (intent == null) return false;
        try {
            ComponentName target = intent.resolveActivity(context.getPackageManager());
            if (target == null || !expectedPackage.equals(target.getPackageName())) return false;
            return accessible(context, context.getPackageManager().getActivityInfo(target, 0), false);
        } catch (Exception missing) { return false; }
    }
    static boolean accessible(Context context, ActivityInfo info, boolean sameApplication) {
        return info.enabled && (sameApplication || info.exported) && info.applicationInfo != null && info.applicationInfo.enabled
                && (info.permission == null || info.permission.isEmpty() || context.checkSelfPermission(info.permission) == android.content.pm.PackageManager.PERMISSION_GRANTED);
    }
}
