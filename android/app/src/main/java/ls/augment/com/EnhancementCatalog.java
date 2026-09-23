package ls.augment.com;
import java.util.*;
/** One inventory drives settings, validation, backup and coverage. */
public final class EnhancementCatalog {
    private EnhancementCatalog() { }
    public static List<EnhancementOption> options() {
        ArrayList<EnhancementOption> all=new ArrayList<>();
        all.addAll(SystemOptions.options());all.addAll(SystemUiOptions.options());
        all.addAll(GameOptions.options());all.addAll(LauncherOptions.options());
        all.addAll(AppearanceOptions.options());
        return Collections.unmodifiableList(all);
    }
    public static String title(String group) {
        switch(group) {
            case "statusbar":return "状态栏细节";case "lockscreen":return "锁屏增强";
            case "aod":return "息屏显示";case "quicksettings":return "控制中心";
            case "audio":return "音量规则";case "system":return "系统行为";
            case "connections":return "连接与 USB";case "installer":return "安装器增强";
            case "update":return "系统更新";case "theme":return "主题下载";
            case "launcher":return "桌面增强";case "game":return "肩键方案与游戏补充";
            case "appearance":return "界面外观";default:return "增强设置";
        }
    }
    public static List<EnhancementOption> group(String group) {
        ArrayList<EnhancementOption> result=new ArrayList<>();
        for(EnhancementOption o:options())if(o.group.equals(group)&&o.kind!=EnhancementOption.Kind.INTERNAL)result.add(o);
        return result;
    }
}
