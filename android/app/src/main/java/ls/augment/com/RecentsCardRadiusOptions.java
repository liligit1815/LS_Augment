package ls.augment.com;

import java.util.Arrays;
import java.util.List;

/** Signed dp adjustment relative to each recent-task card's original radius. */
public final class RecentsCardRadiusOptions {
    public static final String ENABLED = "ls_augment_rm_recents_card_radius_enabled";
    public static final String OFFSET = "ls_augment_rm_recents_card_radius_offset";
    // Storage/transport safety bounds only. The slider uses measured card geometry.
    public static final int MIN = -2000;
    public static final int MAX = 2000;

    private RecentsCardRadiusOptions() { }

    public static List<EnhancementOption> options() {
        return Arrays.asList(
                EnhancementOption.toggle(ENABLED, "launcher", "最近任务卡片圆角调节",
                        "调整最近任务中应用卡片的圆角。0 保持原厂，负数使边角更尖锐，正数使边角更圆滑。关闭后恢复原厂圆角并保留参数；修改后再次进入最近任务生效。"),
                EnhancementOption.integer(OFFSET, "launcher", "圆角偏移",
                        "相对原厂圆角增加或减少的半径，单位 dp。0 为原厂，负数减小圆角，正数增大圆角。滑条以最近一次显示的最大可见卡片测量范围：下限为直角，上限为短边允许的最大圆角；更换卡片样式或大小后，进入最近任务可重新测量。", 0, MIN, MAX)
        );
    }
}
