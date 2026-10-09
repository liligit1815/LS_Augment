package ls.augment.com;

import java.util.*;

/** Canonical definitions shared by config import, editor and SystemUI snapshots. */
public final class StatusBarIconLayoutOptions {
    private StatusBarIconLayoutOptions(){}
    public static boolean ownsKey(String key){return StatusBarIconSpacingSpec.KEY.equals(key)||StatusBarIconOrderPolicy.ENABLED.equals(key)||StatusBarIconOrderPolicy.LIMIT.equals(key)||StatusBarIconOrderPolicy.ORDER.equals(key);}
    public static List<EnhancementOption> options(){
        List<EnhancementOption> out=new ArrayList<>();
        out.add(EnhancementOption.custom(StatusBarIconSpacingSpec.KEY,"statusbar","每个图标边界间距","各图标的四边额外留白参与真实排列；按位置保存，动态状态共用，0 保留原厂间距。","",raw->{StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(raw);return spec==null?null:spec.serialize();}));
        out.add(EnhancementOption.toggle(StatusBarIconOrderPolicy.ENABLED,"statusbar","系统提示图标优先级","空间不足时优先保留所选系统提示，并使用独立数量上限；仍遵守原厂显示条件与隐藏规则。"));
        out.add(EnhancementOption.integer(StatusBarIconOrderPolicy.LIMIT,"statusbar","系统提示图标上限","0 跟随原厂；不计入通知图标、Wi-Fi、移动信号和电池。",0,0,20));
        out.add(EnhancementOption.custom(StatusBarIconOrderPolicy.ORDER,"statusbar","系统提示保留顺序","只改变拥挤时的保留优先级，正常显示位置沿用系统顺序。","",StatusBarIconOrderPolicy::normalize));
        return Collections.unmodifiableList(out);
    }
}
