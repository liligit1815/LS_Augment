package ls.augment.com;

import java.util.Arrays;
import java.util.function.Function;

/** Exact identities, with a bounded Settings-home fallback evidenced by the device screenshot. */
public final class EntryVisibilityPolicy {
    public static final String SETTINGS_HOST = "com.android.settings";
    public static final String LAUNCHER_HOST = "com.zte.mifavor.launcher";
    public static final String TARGET_PACKAGE = "com.zte.usebalance";
    public static final String HEALTHY_USE_ACTIVITY =
            "com.zte.usebalance.activity.home.HealthyUsePhoneActivity";
    public static final String MINORS_ACTIVITY =
            "com.zte.usebalance.activity.home.MinorsModeActivity";
    public static final String HEALTHY_USE_TITLE = "健康使用手机";

    private EntryVisibilityPolicy() { }

    public static final class Component {
        public final String packageName, className;
        public Component(String packageName, String className) {
            this.packageName = packageName;
            this.className = className;
        }
    }

    public static boolean hideHealthyUse(boolean enabled, String host, Component target) {
        return enabled && SETTINGS_HOST.equals(host) && matches(target, HEALTHY_USE_ACTIVITY);
    }

    /**
     * Some OEM homepage rows launch through a click listener/fragment and have no Intent.
     * The screenshot confirms this complete title and its surrounding homepage group.
     * Require two distinct adjacent settings so a same-title subpage does not qualify.
     * Explicit/resolved components must be checked by the caller before this fallback.
     */
    public static boolean hideHealthyUseHomeTitle(boolean enabled, String host,
            CharSequence title, CharSequence[] siblings) {
        if (!enabled || !SETTINGS_HOST.equals(host) || title == null
                || !HEALTHY_USE_TITLE.contentEquals(title) || siblings == null) return false;
        int anchors = 0;
        for (CharSequence sibling : siblings) {
            if (sibling == null) continue;
            if ("散热风扇".contentEquals(sibling)) anchors |= 1;
            else if ("炫彩灯效".contentEquals(sibling)) anchors |= 2;
            else if ("实用辅助".contentEquals(sibling)) anchors |= 4;
        }
        return Integer.bitCount(anchors) >= 2;
    }

    public static boolean hideMinors(boolean enabled, String host, Component target) {
        return enabled && LAUNCHER_HOST.equals(host) && matches(target, MINORS_ACTIVITY);
    }

    private static boolean matches(Component target, String activity) {
        if (target == null || !TARGET_PACKAGE.equals(target.packageName) || target.className == null)
            return false;
        String name = target.className.startsWith(".")
                ? target.packageName + target.className : target.className;
        return activity.equals(name);
    }

    /** Returns a presentation copy only when needed. The OEM model array is never edited. */
    public static <T> T[] filterMinors(T[] source, boolean enabled, String host,
            Function<T, Component> identity) {
        if (source == null || !enabled || !LAUNCHER_HOST.equals(host)) return source;
        T[] visible = null;
        int retained = 0;
        for (int i = 0; i < source.length; i++) {
            Component component;
            try { component = identity.apply(source[i]); }
            catch (RuntimeException unreadable) { component = null; }
            if (hideMinors(true, host, component)) {
                if (visible == null) visible = Arrays.copyOf(source, source.length);
            } else {
                if (visible != null) visible[retained] = source[i];
                retained++;
            }
        }
        return visible == null ? source : Arrays.copyOf(visible, retained);
    }
}
