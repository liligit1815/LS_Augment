package ls.augment.com;

import java.util.Arrays;
import java.util.List;

/** Module settings shared by the original and modified REDMAGIC launcher. */
public final class LauncherOptions {
    public static final String CLEANUP_STYLE = "ls_augment_rm_launcher_cleanup_style";
    public static final String CLEANUP_BOMB = "ls_augment_rm_launcher_cleanup_bomb";
    public static final String PAGE_REORDER = "ls_augment_rm_launcher_page_reorder";
    public static final String KEEP_EMPTY = "ls_augment_rm_launcher_keep_empty";
    public static final String WIDGET_RESIZE = "ls_augment_rm_launcher_widget_resize";
    public static final String DOCK_UNLIMITED = "ls_augment_rm_launcher_dock_unlimited";
    public static final String NEW_APPS_LAST_PAGE = "ls_augment_rm_launcher_new_apps_last_page";
    public static final int RECENTS_MEMORY_MAX_TOP_DP = 2000;
    private LauncherOptions() {}
    public static List<EnhancementOption> options() {
        return Arrays.asList(
            EnhancementOption.toggle(LauncherGridSpec.ENABLED,"launcher","自定义桌面布局","选择桌面页面的行数与列数，支持常用预设和 n×n 方形布局。列数决定每排图标个数，行数决定每页排数；小组件会占用多格，密集布局会缩小图标与文字。若现有小组件或文件夹超出新格数，桌面会保留原布局，请先调整占用后再试。配置自动保存，预览仅为布局示意。默认关闭；开启、关闭或修改后，重启系统桌面生效。"),
            EnhancementOption.integer(LauncherGridSpec.COLUMNS,"launcher","桌面列数","每排可放置的图标格数；与行数独立设置。修改会自动保存，重启系统桌面后生效。",LauncherGridSpec.DEFAULT_COLUMNS,LauncherGridSpec.MIN,LauncherGridSpec.MAX),
            EnhancementOption.integer(LauncherGridSpec.ROWS,"launcher","桌面行数","每页从上到下的图标排数；小组件可能占用多格。修改会自动保存，重启系统桌面后生效。",LauncherGridSpec.DEFAULT_ROWS,LauncherGridSpec.MIN,LauncherGridSpec.MAX),
            EnhancementOption.toggle(CLEANUP_BOMB,"launcher","自定义清理图标与动画","最近任务清理按钮改为爆破核心，可选择影视爆炸或数字晶片解构；清理对象和锁定规则沿用原厂逻辑。"),
            EnhancementOption.choice(CLEANUP_STYLE,"launcher","清理动画","炸弹爆炸：闪光、火球、烟尘、火星与爆破音效，声音遵循系统音量及静音设置。粒子破碎：青紫解构光束、发光晶片与高速光轨。退出最近任务后结束。",0,"炸弹爆炸","粒子破碎"),
            EnhancementOption.toggle(PAGE_REORDER, "launcher", "整页移动桌面",
                "在桌面编辑模式点击“页面”，选中页面后前移、后移，或长按卡片拖动排序；图标、文件夹和组件一起移动。适配 10 系列与 11 系列桌面，修改开关后重启系统桌面生效。"),
            EnhancementOption.toggle(KEEP_EMPTY, "launcher", "允许空白桌面",
                "在桌面编辑模式的“页面”中新增或删除空白页；空白页及页面顺序在重启后保留。适配 10 系列与 11 系列桌面，修改开关后重启系统桌面生效。"),
            EnhancementOption.toggle(NEW_APPS_LAST_PAGE, "launcher", "强制新装APP图标显示在桌面末页",
                "新安装应用的图标加入桌面末页；末页已满时新增一页，不移动已有图标，不改变更新应用的位置。适配 10 系列与 11 系列桌面，修改开关后重启系统桌面生效。"),
            EnhancementOption.toggle(WIDGET_RESIZE, "launcher", "允许修改小组件大小",
                "长按桌面小组件后拖动缩放边框，允许原本禁止缩放的标准小组件调整宽高。适配 10 系列与 11 系列桌面；占用范围仍限于当前桌面网格，组件内容的适配由提供组件的应用决定。修改开关后重启系统桌面生效。"),
            EnhancementOption.toggle(DOCK_UNLIMITED, "launcher", "解除Dock栏应用数量限制",
                "允许继续将应用拖入底部 Dock 栏，突破原厂固定数量限制。图标按实际格子的可用宽高等比例缩小，避免数量较多时重叠；数量减少或移回桌面后恢复原尺寸，点击与拖拽区域沿用原厂格子。适配 10 系列与 11 系列桌面；修改开关后重启系统桌面生效。关闭后保留已有应用及必要的尺寸适配，超出原厂数量的应用可自行移回桌面。"),
            EnhancementOption.toggle("ls_augment_rm_recents_memory_custom", "launcher", "自定义最近任务内存显示", "统一控制原厂桌面和 260005 版桌面的内存显示及文字样式。开启显示、关闭隐藏，无需开启桌面自身的内存显示开关；不改变任务卡片布局。"),
            EnhancementOption.choice("ls_augment_rm_recents_memory_style", "launcher", "内存文字样式", "", 0, "简洁单行", "详细多行"),
            EnhancementOption.choice("ls_augment_rm_recents_memory_content", "launcher", "内存显示内容", "每个选项附显示示例；可用|总共采用紧凑单行格式。", 5, "可用、已用和总量", "可用和已用", "仅可用", "仅已用", "仅总量", "可用|总共"),
            EnhancementOption.choice("ls_augment_rm_recents_memory_color_mode", "launcher", "内存文字颜色", "", 1, "保持现有桌面颜色", "跟随系统深浅色", "自定义深浅色"),
            EnhancementOption.color("ls_augment_rm_recents_memory_light_color", "launcher", "浅色模式内存颜色", "", "#FF000000"),
            EnhancementOption.color("ls_augment_rm_recents_memory_dark_color", "launcher", "深色模式内存颜色", "", "#FFFFFFFF"),
            EnhancementOption.decimal("ls_augment_rm_recents_memory_simple_size", "launcher", "简洁样式字号", "单位 sp；横竖屏共用。", 12, 6, 40),
            EnhancementOption.decimal("ls_augment_rm_recents_memory_detailed_size", "launcher", "详细样式字号", "单位 sp；横竖屏共用。", 12, 6, 40),
            legacySize("portrait_size",12), legacySize("landscape_size",10),
            legacySize("detailed_portrait_size",12), legacySize("detailed_landscape_size",10),
            EnhancementOption.integer("ls_augment_rm_recents_memory_portrait_left", "launcher", "竖屏内存距左侧", "单位 dp；数值越小越靠左，超出范围时停在可见边缘。", 220, 0, 2000),
            EnhancementOption.integer("ls_augment_rm_recents_memory_landscape_left", "launcher", "横屏内存距左侧", "单位 dp；数值越小越靠左，超出范围时停在可见边缘。", 660, 0, 2000),
            EnhancementOption.integer("ls_augment_rm_recents_memory_portrait_top", "launcher", "竖屏内存距顶部", "单位 dp；数值越大越靠下，超过可显示范围时停在底部。切换样式保留位置。", 50, 0, RECENTS_MEMORY_MAX_TOP_DP),
            EnhancementOption.integer("ls_augment_rm_recents_memory_landscape_top", "launcher", "横屏内存距顶部", "单位 dp；数值越大越靠下，超过可显示范围时停在底部。切换样式保留位置。", 28, 0, RECENTS_MEMORY_MAX_TOP_DP),
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
