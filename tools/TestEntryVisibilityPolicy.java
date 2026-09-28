import java.util.Arrays;
import ls.augment.com.EntryVisibilityOptions;
import ls.augment.com.EntryVisibilityPolicy;
import ls.augment.com.EntryVisibilityPolicy.Component;

public class TestEntryVisibilityPolicy {
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        Component minors = new Component("com.zte.usebalance", EntryVisibilityPolicy.MINORS_ACTIVITY);
        Component shortMinors = new Component("com.zte.usebalance", ".activity.home.MinorsModeActivity");
        Component health = new Component("com.zte.usebalance", EntryVisibilityPolicy.HEALTHY_USE_ACTIVITY);
        Component sibling = new Component("com.zte.usebalance", "com.zte.usebalance.OtherActivity");
        Component impostor = new Component("example.app", EntryVisibilityPolicy.MINORS_ACTIVITY);
        String launcher = EntryVisibilityPolicy.LAUNCHER_HOST;
        String settings = EntryVisibilityPolicy.SETTINGS_HOST;
        check(EntryVisibilityOptions.options().size() == 2, "two independent switches");
        EntryVisibilityOptions.options().forEach(option -> check("0".equals(option.defaultValue), "default off"));
        check(EntryVisibilityPolicy.hideMinors(true, launcher, minors), "exact minors target");
        check(EntryVisibilityPolicy.hideMinors(true, launcher, shortMinors), "normalized relative component");
        check(!EntryVisibilityPolicy.hideMinors(true, launcher, health), "health activity remains in launcher");
        check(!EntryVisibilityPolicy.hideMinors(true, launcher, sibling), "same package sibling remains");
        check(!EntryVisibilityPolicy.hideMinors(true, launcher, impostor), "same class in wrong package remains");
        check(!EntryVisibilityPolicy.hideMinors(true, settings, minors), "wrong host remains");
        check(!EntryVisibilityPolicy.hideMinors(false, launcher, minors), "off restores minors");
        check(!EntryVisibilityPolicy.hideMinors(true, launcher, null), "unknown stays visible");
        check(EntryVisibilityPolicy.hideHealthyUse(true, settings, health), "exact settings target");
        check(!EntryVisibilityPolicy.hideHealthyUse(true, settings, minors), "settings switch does not affect minors");
        check(!EntryVisibilityPolicy.hideHealthyUse(false, settings, health), "settings off restores");
        check(!EntryVisibilityPolicy.hideHealthyUse(true, launcher, health), "settings does not affect other hosts");
        CharSequence[] home = {"魔方AI+", "散热风扇", "炫彩灯效", "健康使用手机", "实用辅助"};
        check(EntryVisibilityPolicy.hideHealthyUseHomeTitle(true, settings, "健康使用手机", home),
                "verified homepage group supports listener or fragment row");
        check(EntryVisibilityPolicy.hideHealthyUseHomeTitle(true, settings, new StringBuilder("健康使用手机"),
                new CharSequence[]{"散热风扇", "实用辅助"}), "CharSequence and two distinct anchors qualify");
        check(!EntryVisibilityPolicy.hideHealthyUseHomeTitle(true, settings, "健康使用手机", null), "unscoped title retained");
        check(!EntryVisibilityPolicy.hideHealthyUseHomeTitle(true, settings, "健康使用手机",
                new CharSequence[]{"散热风扇", "散热风扇"}), "duplicate anchor is not independent evidence");
        check(!EntryVisibilityPolicy.hideHealthyUseHomeTitle(true, settings, "健康使用手机设置", home), "substring titles retained");
        check(!EntryVisibilityPolicy.hideHealthyUseHomeTitle(true, launcher, "健康使用手机", home), "title fallback restricted to Settings");
        check(!EntryVisibilityPolicy.hideHealthyUseHomeTitle(false, settings, "健康使用手机", home), "title fallback restores when off");
        Component[] original = {health, minors, sibling, null, shortMinors, impostor};
        Component[] snapshot = original.clone();
        Component[] visible = EntryVisibilityPolicy.filterMinors(original, true, launcher, c -> c);
        check(visible != original && visible.getClass() == original.getClass(), "typed presentation copy");
        check(Arrays.equals(visible, new Component[]{health, sibling, null, impostor}), "order and unrelated rows preserved");
        check(Arrays.equals(original, snapshot), "model untouched, including duplicate target instances");
        check(EntryVisibilityPolicy.filterMinors(original, false, launcher, c -> c) == original, "disable restores original array");
        check(EntryVisibilityPolicy.filterMinors(original, true, settings, c -> c) == original, "other host is transparent");
        check(EntryVisibilityPolicy.filterMinors(original, true, launcher, c -> { throw new IllegalStateException(); }) == original,
                "unreadable identity fails open");
        check(EntryVisibilityPolicy.filterMinors(null, true, launcher, c -> null) == null, "null remains null");
        System.out.println("Entry visibility identity, independent switches, copy/filter/restore checks passed");
    }
}
