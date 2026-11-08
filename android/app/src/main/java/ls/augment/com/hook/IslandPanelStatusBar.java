package ls.augment.com.hook;

import android.os.SystemClock;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.WeakHashMap;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Completes only an owned ordinary panel's missing OEM status-bar fade. */
final class IslandPanelStatusBar {
    private static final WeakHashMap<View, Long> SHOWS = new WeakHashMap<>();
    private static final WeakHashMap<View, Lease> LEASES = new WeakHashMap<>();
    private static boolean observedCalls;
    private static Class<?> observedStart;
    static final class Lease {
        final WeakReference<Object> manager;
        final WeakReference<View> bar;
        final long shows;
        boolean restored, ended;
        long fadingUntil;
        Lease(Object owner, View view) {
            manager = new WeakReference<>(owner); bar = new WeakReference<>(view);
            shows = SHOWS.getOrDefault(view, 0L);
        }
    }

    static void observeCalls(Class<?> declaringClass) { observedStart = declaringClass; observedCalls = true; }

    private static boolean observes(Object owner) {
        if (!observedCalls) return false;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) try {
            type.getDeclaredMethod("onPermanentIslandPanelCloseAnimationStart");
            return type == observedStart;
        } catch (NoSuchMethodException absent) { /* inherited native callback */ }
        return false;
    }

    static void shown(View bar) { SHOWS.put(bar, SHOWS.getOrDefault(bar, 0L) + 1); }

    static Lease prepare(Object owner) {
        Object value = field(owner, "mPhoneStatusBarView");
        if (!(value instanceof View)) {
            FeatureRuntimeLog.event("ISLAND_PANEL_PRESENTATION", "status_bar_unavailable:phone_view");
            return null;
        }
        Lease lease = new Lease(owner, (View) value);
        LEASES.put((View) value, lease);
        return lease;
    }

    static void restore(Object owner, Lease lease, boolean ending) {
        if (lease == null || lease.manager.get() != owner || lease.restored) return;
        View bar = lease.bar.get();
        if (bar == null || field(owner, "mPhoneStatusBarView") != bar || LEASES.get(bar) != lease) return;
        // If native code already started the fade, do not restart its duration/interpolator.
        if (SHOWS.getOrDefault(bar, 0L) > lease.shows) {
            lease.restored = true;
            lease.fadingUntil = SystemClock.uptimeMillis() + 600;
            report("status_bar_native", bar);
            return;
        }
        // Without reliable call observation, supplement only a still-hidden bar at close end.
        if (!observes(owner) && (!ending || bar.getAlpha() > .01f)) return;
        try {
            if (bar.getAlpha() < 1f) fade(owner.getClass().getClassLoader()).invoke(null, bar, true);
            lease.restored = true;
            lease.fadingUntil = SystemClock.uptimeMillis() + 600;
            report("status_bar_restored:oem_animation", bar);
        } catch (ReflectiveOperationException | RuntimeException missing) {
            FeatureRuntimeLog.event("ISLAND_PANEL_PRESENTATION", "status_bar_unavailable:" + FeatureRuntimeLog.failure(missing));
        }
    }

    static boolean ownsFade(View bar) {
        Lease lease = LEASES.get(bar);
        if (lease == null) return false;
        Object owner = lease.manager.get();
        if (owner == null || field(owner, "mPhoneStatusBarView") != bar) return false;
        return (!lease.ended && (Boolean.TRUE.equals(field(owner, "mDynamicPanelShowing"))
                || Boolean.TRUE.equals(field(owner, "mDynamicPanelClosing"))))
                || SystemClock.uptimeMillis() < lease.fadingUntil;
    }

    static Method fade(ClassLoader loader) throws ReflectiveOperationException {
        Class<?> type = Class.forName("com.zte.feature.dynamicisland.DynamicIslandAnimation", false, loader);
        Method method = type.getDeclaredMethod("startStatusBarAnimation", View.class, boolean.class);
        if (method.getReturnType() != void.class || !Modifier.isStatic(method.getModifiers()))
            throw new NoSuchMethodException("status_bar_animation_signature");
        method.setAccessible(true);
        return method;
    }
    private static void report(String reason, View bar) {
        FeatureRuntimeLog.event("ISLAND_PANEL_PRESENTATION", reason + ";alpha=" + bar.getAlpha());
    }
    private IslandPanelStatusBar() { }
}
