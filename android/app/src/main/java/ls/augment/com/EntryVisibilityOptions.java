package ls.augment.com;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** Presentation-only entry switches. Neither switch changes the target application's state. */
public final class EntryVisibilityOptions {
    public static final String HIDE_HEALTHY_USE_ENTRY =
            "ls_augment_rm_settings_hide_healthy_use_entry";
    public static final String HIDE_MINORS_ICON =
            "ls_augment_rm_launcher_hide_minors_icon";

    private EntryVisibilityOptions() { }

    public static List<EnhancementOption> options() {
        return Collections.unmodifiableList(Arrays.asList(
                EnhancementOption.toggle(HIDE_HEALTHY_USE_ENTRY, "system", "隐藏健康使用手机入口",
                        "隐藏系统设置中的健康使用手机入口，兼容已识别的首页入口与直接组件入口，关闭后恢复；不修改健康管理或使用限制。"),
                EnhancementOption.toggle(HIDE_MINORS_ICON, "launcher", "隐藏未成年模式图标",
                        "仅隐藏原厂桌面的未成年模式图标和应用列表项，关闭后恢复原位置；不关闭未成年模式或修改使用限制。")));
    }
}
