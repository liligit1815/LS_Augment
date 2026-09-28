package ls.augment.com;

import java.util.Arrays;
import java.util.List;

/** Independent opt-in controls; all resources continue to come from the installed ROM. */
public final class CollabOptions {
    public static final String THEME = "ls_augment_rm_theme_collab_enabled";
    public static final String THEME_VARIANT = "ls_augment_rm_theme_collab_variant";
    public static final String FP_CHISA = "ls_augment_rm_fp_style_chisa";
    public static final String FP_CHUN = "ls_augment_rm_fp_style_chun";
    public static final String FP_FIGHTING = "ls_augment_rm_fp_style_fighting";
    public static final String FP_GOLD = "ls_augment_rm_fp_style_goldensaga";
    public static final String FP_LTY = "ls_augment_rm_fp_style_lty";
    public static final String CHARGING = "ls_augment_rm_charging_collab_enabled";
    public static final String CHARGING_STYLE = "ls_augment_rm_charging_collab_style";
    private CollabOptions() { }

    public static List<EnhancementOption> options() {
        String fp = "调用本机原厂指纹样式。已核对所提供 Android 16 指纹设置与 SensorService 的五种联名资源，其他系统版本仍取决于内置素材。开启后重启设备，再到系统指纹样式中选择并测试。";
        return Arrays.asList(
                EnhancementOption.toggle(THEME,"theme","解锁联名预置主题","选择联名变体，由原厂主题功能加载对应资源；不下载、打包或修改素材。资源可用性尚未确认；缺少素材或显示异常时请切回原厂主题并关闭此项。修改后重启主题与个性化。"),
                EnhancementOption.choice(THEME_VARIANT,"theme","联名主题变体","由原厂主题功能加载所选变体，是否可用取决于系统资源。此选择不影响指纹和充电动画的独立设置。",0,
                        "千咲 · 鸣潮（NX809J）","臻金 GOLDEN SAGA（NX809J）","椿 · 鸣潮（NX789S/J）","斗战胜佛 · 悟空（NX789S）",
                        "臻金 GOLDEN SAGA（NX789S/J）","幻域 · 魔姬粉（NX789J）","大黄蜂（NX769J）","大黄蜂（NX729J）"),
                EnhancementOption.toggle(FP_CHISA,"fingerprint","指纹样式：千咲",fp),
                EnhancementOption.toggle(FP_CHUN,"fingerprint","指纹样式：椿",fp+"显示为“椿 · 鸣潮”，可与独立的臻金样式同时开启。"),
                EnhancementOption.toggle(FP_FIGHTING,"fingerprint","指纹样式：念箍",fp+"与千咲同时开启时保留两项候选。"),
                EnhancementOption.toggle(FP_GOLD,"fingerprint","指纹样式：臻金 · GOLDEN SAGA",fp+"新版系统新增独立的“臻金 · GOLDEN SAGA”金色火焰圈，保留原厂“焰旋流光”。开启后进入主题和个性化的指纹动画页面，选择臻金并应用；可与椿同时开启。旧版系统仍取决于原厂资源。"),
                EnhancementOption.toggle(FP_LTY,"fingerprint","指纹样式：洛天依",fp),
                EnhancementOption.toggle(CHARGING,"lockscreen","联名充电帧动画","使用本机系统目录中的联名帧图。缺失或无法解码的帧回退原厂，原厂充电动画时长与延迟设置继续适用。修改后重启系统界面。"),
                EnhancementOption.choice(CHARGING_STYLE,"lockscreen","联名充电动画样式","独立于主题选择；只有本机已包含的帧可用。",0,"鸣潮","臻金传说"));
    }
}
