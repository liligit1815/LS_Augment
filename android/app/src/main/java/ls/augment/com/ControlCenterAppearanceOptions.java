package ls.augment.com;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** Phone-side appearance settings for verified RedMagic Control Center surfaces. */
public final class ControlCenterAppearanceOptions {
    public static final String PREFIX="ls_augment_rm_cc_";
    public static final String CORNERS=PREFIX+"corners_enabled", RADIUS=PREFIX+"corner_radius_dp";
    public static final String TILES=PREFIX+"tile_fill_enabled", TILE_LIGHT=PREFIX+"tile_color_light", TILE_DARK=PREFIX+"tile_color_dark";
    public static final String TILE_END_LIGHT=PREFIX+"tile_end_light", TILE_END_DARK=PREFIX+"tile_end_dark";
    public static final String TILE_OPACITY=PREFIX+"tile_opacity", TILE_GRADIENT=PREFIX+"tile_gradient", TILE_DIRECTION=PREFIX+"tile_direction";
    public static final String MEDIA=PREFIX+"media_cover_enabled", MEDIA_OPACITY=PREFIX+"media_opacity", MEDIA_BLUR=PREFIX+"media_blur";
    public static final String MEDIA_GLOW=PREFIX+"media_glow", GLOW_OPACITY=PREFIX+"media_glow_opacity", GLOW_WIDTH=PREFIX+"media_glow_width_dp";
    private ControlCenterAppearanceOptions() { }
    public static List<EnhancementOption> options() {
        String group="quicksettings";
        return Collections.unmodifiableList(Arrays.asList(
            EnhancementOption.toggle(CORNERS,group,"控制中心统一圆角","统一已适配的磁贴、音乐卡片及亮度和音量滑条外观，保持原厂点击与滑动范围。与控制中心玻璃材质同时开启时，这些控件优先使用本功能；关闭后恢复原厂圆角，已开启的玻璃材质重新生效。"),
            EnhancementOption.integer(RADIUS,group,"圆角半径（dp）","不超过控件短边的一半；0 为直角。",24,0,48),
            EnhancementOption.toggle(TILES,group,"活动磁贴配色","只改变处于开启状态的磁贴背景，未开启和不可用状态保留原厂。叠色过亮或过暗时自动保护前景对比度。开启时磁贴优先使用此配色，暂停磁贴玻璃材质；关闭后恢复已开启的玻璃材质。"),
            EnhancementOption.color(TILE_LIGHT,group,"浅色主题填色","颜色叠加在原厂背景上。", "#1677D2"),
            EnhancementOption.color(TILE_DARK,group,"深色主题填色","跟随系统浅色与深色主题切换。", "#397CB8"),
            EnhancementOption.integer(TILE_OPACITY,group,"填色不透明度（%）","0 保留原厂填色；100 完全使用自定义填色。过低对比度会自动修正。",85,0,100),
            EnhancementOption.choice(TILE_GRADIENT,group,"填色方式","渐变只作用于背景，不改变图标、文字和点击区域。",0,"纯色","渐变"),
            EnhancementOption.color(TILE_END_LIGHT,group,"浅色主题渐变结束色","纯色模式保留此值，启用渐变时使用。", "#725BC9"),
            EnhancementOption.color(TILE_END_DARK,group,"深色主题渐变结束色","纯色模式保留此值，启用渐变时使用。", "#7964BC"),
            EnhancementOption.choice(TILE_DIRECTION,group,"渐变方向","起始色到结束色的排列方向。",0,"从左到右","从上到下","左上到右下"),
            EnhancementOption.toggle(MEDIA,group,"控制中心音乐封面背景","使用原厂当前媒体会话的封面；无封面或会话结束时恢复原厂。保留音乐控制和原封面，背景自动保护文字对比度。开启时音乐卡片优先使用本功能；关闭后恢复原厂或已开启的玻璃材质。"),
            EnhancementOption.integer(MEDIA_OPACITY,group,"封面不透明度（%）","只影响音乐卡片背景，0 保留原厂背景。",70,0,100),
            EnhancementOption.integer(MEDIA_BLUR,group,"封面模糊强度","0 显示清晰封面；仅在封面或强度变化时处理，最大缓存边长 256 像素。",12,0,24),
            EnhancementOption.choice(MEDIA_GLOW,group,"封面内缘发光","从封面取色，在音乐卡片内部边缘显示柔光，不扩大卡片或点击范围。",0,"关闭","开启"),
            EnhancementOption.integer(GLOW_OPACITY,group,"内缘发光不透明度（%）","仅在内缘发光开启时使用。",40,0,80),
            EnhancementOption.integer(GLOW_WIDTH,group,"内缘发光宽度（dp）","实际宽度不超过卡片短边的一半。",12,1,32)
        ));
    }
}
