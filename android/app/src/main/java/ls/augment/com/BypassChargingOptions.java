package ls.augment.com;

import java.util.Arrays;
import java.util.List;

/** Shared range for Duo, the OEM policy and its settings page. */
public final class BypassChargingOptions {
    public static final String HIDE_PROMPTS="ls_augment_bypass_hide_prompts";
    public static final String AUTO="ls_augment_bypass_auto";
    public static final String LEVEL="ls_augment_bypass_level";
    public static final int MIN=20,MAX=100,DEFAULT=80;
    public static final String SERVICE_PACKAGE="cn.zte.chargeseparation";
    private BypassChargingOptions(){}
    public static List<EnhancementOption> options(){return Arrays.asList(
        EnhancementOption.toggle(HIDE_PROMPTS,"system","拦截旁路充电提示","跳过原厂开启确认，隐藏开启与关闭的短提示及普通旁路充电通知。开启后移除已有的普通通知，关闭后在旁路充电仍开启时恢复。温控异常、未连接电源、电量过低等保护与失败提醒保留。需在模块作用域中启用旁路充电、电量管理、系统界面及游戏助手，首次更新后重启手机。"),
        EnhancementOption.toggle(AUTO,"system","按电量自动进入旁路充电","连接电源时电量已达到或超过设定值，原厂服务会在收到电池状态通知后自动进入旁路充电，无需先降到设定值；低于设定值则先充电，达到后进入。手动关闭后的本次连接行为、拔线、温控与充电保护沿用原厂规则。开启期间由红魔Duo统一管理自动进入与电量设置，关闭后恢复接管前设置。需启用旁路充电、电量管理作用域，首次更新后重启手机。"),
        EnhancementOption.integer(LEVEL,"system","自动进入电量（%）","可设为20%～100%。达到该值后自动进入，低于该值恢复充电；100%表示充满后进入。仍受原厂温控、充电保护与手动关闭规则约束。",DEFAULT,MIN,MAX)
    );}
}
