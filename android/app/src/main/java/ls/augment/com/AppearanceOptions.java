package ls.augment.com;

import java.util.Arrays;
import java.util.List;

/** Optional presentation settings; the existing light Ice Blue appearance stays the default. */
public final class AppearanceOptions {
    public static final String THEME = "ls_augment_appearance_theme";
    public static final String BLUR = "ls_augment_appearance_blur";
    public static final String LIGHT_MASK = "ls_augment_appearance_light_mask";
    public static final String DARK_MASK = "ls_augment_appearance_dark_mask";
    public static final String TWO_PANE = "ls_augment_appearance_two_pane";
    private AppearanceOptions() {}
    public static List<EnhancementOption> options() {
        return Arrays.asList(
            EnhancementOption.choice(THEME, "appearance", "界面明暗模式", "默认保持 LS_Augment 冰蓝浅色外观。", 0, "冰蓝浅色", "冰蓝深色", "跟随系统"),
            EnhancementOption.toggle(BLUR, "appearance", "背景模糊效果", "只模糊背景，文字和按钮保持清晰。需要 Android 12 及硬件加速；不支持时显示普通背景与遮罩。"),
            EnhancementOption.integer(LIGHT_MASK, "appearance", "浅色背景遮罩强度", "0～100%；开启背景模糊后生效。数值越大，背景越淡。", 75, 0, 100),
            EnhancementOption.integer(DARK_MASK, "appearance", "深色背景遮罩强度", "0～100%；开启背景模糊后生效。数值越大，背景越暗。", 65, 0, 100),
            EnhancementOption.toggle(TWO_PANE, "appearance", "自适应双栏", "宽屏或横屏空间足够时，功能页左侧显示分类，右侧显示原有设置；窄屏保持单栏。")
        );
    }
    public static boolean dark(int theme, boolean systemDark) { return theme == 1 || theme == 2 && systemDark; }
    public static boolean twoPane(boolean requested, int usableWidthDp, float fontScale) {
        return requested && usableWidthDp >= (fontScale > 1.3f ? 840 : 720);
    }
    public static int maskAlpha(int percent) { return Math.round(Math.max(0, Math.min(100, percent)) * 255f / 100); }
    public static boolean blurAvailable(int sdk, boolean hardwareAccelerated) { return sdk >= 31 && hardwareAccelerated; }
}
