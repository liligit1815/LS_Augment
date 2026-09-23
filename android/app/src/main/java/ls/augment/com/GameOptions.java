package ls.augment.com;

import java.util.Arrays;
import java.util.List;

/** Game additions; existing LS shoulder execution, super-resolution and combo speed stay authoritative. */
public final class GameOptions {
    public static final String QUICK_SWITCH = "ls_augment_tgk_quick_switch";
    public static final String PLUGINS = "ls_augment_game_plugins_unlocked";
    public static final String COMBO_LIMITS = "ls_augment_combo_extended_limits";
    public static final String HIDE_DIABLO_DIALOG = "ls_augment_game_hide_diablo_dialog";
    public static final String COLLAPSE_PANEL = "ls_augment_game_prevent_panel_collapse";
    public static final String REMEMBER_ACTIVE = "ls_augment_game_remember_active";
    public static final String FREE_RECORD = "ls_augment_game_free_record";
    public static final String GAME_RATIO = "ls_augment_game_all_ratios";
    public static final String HIGHLIGHTS = "ls_augment_game_highlights_unlocked";
    public static final String REDMAGIC_TIME = "ls_augment_game_redmagic_time_unlocked";
    public static List<EnhancementOption> options() {
        return Arrays.asList(
            EnhancementOption.toggle(QUICK_SWITCH,"game","肩键方案快捷切换","在原厂肩键方案页勾选参与方案：一个直接应用，两个点击互切，更多以下拉选择。"),
            EnhancementOption.internal(ShoulderQuickSwitchPolicy.KEY,ShoulderQuickSwitchPolicy.EMPTY,ShoulderQuickSwitchPolicy::normalize),
            EnhancementOption.toggle(PLUGINS,"game","开放游戏插件资格","开放原厂提供的插件入口，原厂继续负责功能运行。"),
            EnhancementOption.toggle(COMBO_LIMITS,"game","扩展连招循环设置","循环次数允许输入六位数字，循环间隔最长可设为一小时。"),
            EnhancementOption.toggle(HIDE_DIABLO_DIALOG,"game","隐藏破坏神模式提示","隐藏原厂破坏神模式提示与退出悬浮提示。"),
            EnhancementOption.toggle(COLLAPSE_PANEL,"game","切换模式时保持游戏面板","切换破坏神模式或超境画质时，阻止随后的自动收起。"),
            EnhancementOption.toggle(REMEMBER_ACTIVE,"game","记住活跃模式","按游戏保留手动选择，退出游戏后不再清除。"),
            EnhancementOption.toggle(FREE_RECORD,"game","随心录制模式解限","在节能、破坏神模式下保留原厂随心录制入口。"),
            EnhancementOption.toggle(GAME_RATIO,"game","开放全部游戏画面比例","在原厂比例面板提供原始、4:3、16:9、21:9、32:9。"),
            EnhancementOption.toggle(HIGHLIGHTS,"game","开放游戏高光","解除原厂高光录制的性能模式限制。"),
            EnhancementOption.toggle(REDMAGIC_TIME,"game","红魔时刻模式解限","允许在节能和破坏神模式下手动使用，并保留原厂开关选择。")
        );
    }
    private GameOptions() { }
}
