package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.net.Uri;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Read the OEM phase policy and launcher capability without creating travel data or launching apps. */
final class NativeIslandPersonalFlight {
    private final NativeIslandPersonalFlightState state;
    final NativeIslandPersonalFlightModern modern;

    NativeIslandPersonalFlight(ClassLoader loader, Class<?> adapterClass, Class<?> entity) throws Exception {
        state = new NativeIslandPersonalFlightState(loader, adapterClass, entity);
        modern = state.modern ? new NativeIslandPersonalFlightModern(loader, adapterClass, entity, state) : null;
        if (modern != null) return;
        Method launcher = NativeIslandPersonalScene.exact(Class.forName("com.zte.briefagent.util.FlightAppLauncher", false, loader),
                "launchFlightApp", boolean.class, Context.class);
        if (!Modifier.isStatic(launcher.getModifiers())) throw new NoSuchMethodException("flight_launcher static");
    }

    boolean displayable(Context context, Object entity) throws Exception {
        return state.displayable(context, entity) && (modern == null || modern.valid(context, entity));
    }

    boolean actionAllowed(Context context, Object entity, int viewId) throws Exception {
        if (modern != null) {
            NativeIslandPersonalFlightModern.Action action = modern.action(context, entity, viewId);
            return action != null && modern.available(context, action);
        }
        int detail = context.getResources().getIdentifier("btn_flight_detail", "id", "com.zte.personalagent");
        return detail != 0 && (viewId != detail || "AFTER_BOOKING".equals(state.phase(entity)));
    }

    String unavailable(Context context) {
        if (modern != null) return modern.unavailable(context);
        try {
            Intent flight = context.getPackageManager().getLaunchIntentForPackage("vz.com");
            if (launchable(context, flight)) return "";
            // Mirror the original no-action store-search fallback; do not substitute a guessed deep link.
            Intent store = new Intent().setPackage("zte.com.market")
                    .setData(Uri.parse("http://market.android.com/search?q=name:飞常准"));
            return launchable(context, store) ? "" : "missing_flight_launch_target";
        } catch (Exception unavailable) { return "flight_launch_target_unavailable:" + unavailable; }
    }

    private static boolean launchable(Context context, Intent intent) {
        if (intent == null) return false;
        try {
            ComponentName target = intent.resolveActivity(context.getPackageManager());
            if (target == null) return false;
            ActivityInfo info = context.getPackageManager().getActivityInfo(target, 0);
            return info.enabled && info.exported && info.applicationInfo != null && info.applicationInfo.enabled
                    && (info.permission == null || info.permission.isEmpty() || context.checkSelfPermission(info.permission) == 0);
        } catch (Exception missing) { return false; }
    }
}
