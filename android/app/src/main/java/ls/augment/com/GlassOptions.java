package ls.augment.com;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** Opt-in native surfaces; unsupported capture is explicitly a non-refractive translucent fallback. */
public final class GlassOptions {
    public static final String CONTROL_CENTER = "ls_augment_rm_glass_control_center";
    public static final String DOCK = "ls_augment_rm_glass_dock";
    public static final String CC_REDUCE_TRANSPARENCY = "ls_augment_rm_glass_cc_reduce_transparency";
    public static final String CC_REDUCE_MOTION = "ls_augment_rm_glass_cc_reduce_motion";
    public static final String DOCK_REDUCE_TRANSPARENCY = "ls_augment_rm_glass_dock_reduce_transparency";
    public static final String DOCK_REDUCE_MOTION = "ls_augment_rm_glass_dock_reduce_motion";
    private GlassOptions() { }
    public static List<EnhancementOption> options() {
        return Collections.unmodifiableList(Arrays.asList(
                EnhancementOption.toggle(CONTROL_CENTER,"quicksettings","控制中心 Liquid Glass",
                        "为控制项添加透色玻璃与薄边高光；系统支持时呈现真实背景折射，否则使用半透明材质。首次开启需重启系统界面。"),
                EnhancementOption.toggle(DOCK,"launcher","桌面 Dock Liquid Glass",
                        "在 Dock 图标下显示独立圆角玻璃托盘；系统支持时呈现真实背景折射，否则使用半透明托盘。首次开启需重启桌面。"),
                EnhancementOption.toggle(CC_REDUCE_TRANSPARENCY,"quicksettings","控制中心玻璃减少透明度",
                        "控制中心玻璃表面使用清楚的实色，保留文字和图标。"),
                EnhancementOption.toggle(CC_REDUCE_MOTION,"quicksettings","控制中心玻璃减少动态",
                        "停用交互光线与折射变化，同时遵循系统关闭动画的设置。"),
                EnhancementOption.toggle(DOCK_REDUCE_TRANSPARENCY,"launcher","Dock 玻璃减少透明度",
                        "Dock 玻璃表面使用清楚的实色，保留文字和图标。"),
                EnhancementOption.toggle(DOCK_REDUCE_MOTION,"launcher","Dock 玻璃减少动态",
                        "停用交互光线与折射变化，同时遵循系统关闭动画的设置。")));
    }
}
