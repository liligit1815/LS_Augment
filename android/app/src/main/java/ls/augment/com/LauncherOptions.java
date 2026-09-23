package ls.augment.com;

import java.util.Arrays;
import java.util.List;

/** Module settings shared by the original and modified REDMAGIC launcher. */
public final class LauncherOptions {
    public static final String PAGE_REORDER = "ls_augment_rm_launcher_page_reorder";
    public static final String KEEP_EMPTY = "ls_augment_rm_launcher_keep_empty";
    public static final int RECENTS_MEMORY_MAX_TOP_DP = 2000;
    private LauncherOptions() {}
    public static List<EnhancementOption> options() {
        return Arrays.asList(
            EnhancementOption.toggle(PAGE_REORDER, "launcher", "整页移动桌面",
                "在桌面编辑预览中长按页面拖动排序；页面中的图标、文件夹和组件一起移动。支持原厂桌面和 260005 版桌面。"),
            EnhancementOption.toggle(KEEP_EMPTY, "launcher", "允许空白桌面",
                "在桌面编辑模式的“页面”中新增或删除空白页；空白页及页面顺序在重启后保留。支持原厂桌面和 260005 版桌面。"),
            EnhancementOption.toggle("ls_augment_rm_recents_memory_custom", "launcher", "自定义最近任务内存显示", "统一控制原厂桌面和 260005 版桌面的内存显示及文字样式。开启显示、关闭隐藏，无需开启桌面自身的内存显示开关；不改变任务卡片布局。"),
            EnhancementOption.choice("ls_augment_rm_recents_memory_style", "launcher", "内存文字样式", "", 0, "简洁单行", "详细多行"),
            EnhancementOption.choice("ls_augment_rm_recents_memory_content", "launcher", "内存显示内容", "每个选项附显示示例；可用|总共采用紧凑单行格式。", 0, "可用、已用和总量", "可用和已用", "仅可用", "仅已用", "仅总量", "可用|总共"),
            EnhancementOption.choice("ls_augment_rm_recents_memory_color_mode", "launcher", "内存文字颜色", "", 0, "保持现有桌面颜色", "跟随系统深浅色", "自定义深浅色"),
            EnhancementOption.color("ls_augment_rm_recents_memory_light_color", "launcher", "浅色模式内存颜色", "", "#FF000000"),
            EnhancementOption.color("ls_augment_rm_recents_memory_dark_color", "launcher", "深色模式内存颜色", "", "#FFFFFFFF"),
            EnhancementOption.decimal("ls_augment_rm_recents_memory_simple_size", "launcher", "简洁样式字号", "单位 sp；横竖屏共用。", 12, 6, 40),
            EnhancementOption.decimal("ls_augment_rm_recents_memory_detailed_size", "launcher", "详细样式字号", "单位 sp；横竖屏共用。", 12, 6, 40),
            legacySize("portrait_size",12), legacySize("landscape_size",10),
            legacySize("detailed_portrait_size",12), legacySize("detailed_landscape_size",10),
            EnhancementOption.integer("ls_augment_rm_recents_memory_portrait_left", "launcher", "竖屏内存距左侧", "单位 dp；数值越小越靠左，超出范围时停在可见边缘。", 16, 0, 2000),
            EnhancementOption.integer("ls_augment_rm_recents_memory_landscape_left", "launcher", "横屏内存距左侧", "单位 dp；数值越小越靠左，超出范围时停在可见边缘。", 16, 0, 2000),
            EnhancementOption.integer("ls_augment_rm_recents_memory_portrait_top", "launcher", "竖屏内存距顶部", "单位 dp；数值越大越靠下，超过可显示范围时停在底部。切换样式保留位置。", 5, 0, RECENTS_MEMORY_MAX_TOP_DP),
            EnhancementOption.integer("ls_augment_rm_recents_memory_landscape_top", "launcher", "横屏内存距顶部", "单位 dp；数值越大越靠下，超过可显示范围时停在底部。切换样式保留位置。", 5, 0, RECENTS_MEMORY_MAX_TOP_DP),
            EnhancementOption.integer("ls_augment_rm_recents_memory_portrait_height", "launcher", "竖屏内存区域高度", "单位 dp；按所选高度显示，内容较多时会缩小字号。", 65, 24, 240),
            EnhancementOption.integer("ls_augment_rm_recents_memory_landscape_height", "launcher", "横屏内存区域高度", "单位 dp；按所选高度显示，内容较多时会缩小字号。", 60, 24, 200),
            legacyHeight("portrait",85,240),
            legacyHeight("landscape",80,200)
        );
    }
    private static EnhancementOption legacySize(String suffix,double fallback) {
        return EnhancementOption.internal("ls_augment_rm_recents_memory_"+suffix,String.valueOf(fallback),
                value->{double size=Double.parseDouble(value);return Double.isFinite(size)&&size>=6&&size<=40?String.valueOf(size):null;});
    }
    private static EnhancementOption legacyHeight(String orientation,int fallback,int maximum) {
        // Retain old backups and the one-time migration without separate UI controls.
        return EnhancementOption.internal("ls_augment_rm_recents_memory_detailed_"+orientation+"_height",
                String.valueOf(fallback),value->{int height=Integer.parseInt(value);return height>=24&&height<=maximum?String.valueOf(height):null;});
    }
}
