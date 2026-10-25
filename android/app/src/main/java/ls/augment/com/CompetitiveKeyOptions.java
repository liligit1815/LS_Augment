package ls.augment.com;

import java.util.Arrays;
import java.util.List;

/** The physical competition slider, deliberately separate from capacitive shoulder keys. */
public final class CompetitiveKeyOptions {
    public static final String PREFIX="ls_augment_competitive_key_";
    public static final String ENABLED=PREFIX+"enabled", CATEGORY=PREFIX+"category";
    public static final String UP_ACTION=PREFIX+"up_action", DOWN_ACTION=PREFIX+"down_action";
    public static final String APP_PACKAGE=PREFIX+"app_package";
    public static final String UP_SHELL=PREFIX+"up_shell_b64", DOWN_SHELL=PREFIX+"down_shell_b64";
    public static final String NATIVE_SETTING="fourth_physical_key_function_value";
    public static final String RUNTIME=PREFIX+"runtime", READY=PREFIX+"ready";
    public static final String SHELL_CALL="competitive_key_shell";
    public static final String[] CATEGORIES={"打开关闭指定app","切换静音响铃模式","开关省电模式","执行自定义shell命令"};
    private CompetitiveKeyOptions(){}
    public static List<EnhancementOption> options(){
        return Arrays.asList(
            EnhancementOption.toggle(ENABLED,"system","自定义竞技键","接管手机侧面的竞技滑块键；启用时将原厂操作设为空，关闭后恢复启用前的设置。"),
            EnhancementOption.choice(CATEGORY,"system","类别","上推和下拉动作分别配置。",0,CATEGORIES),
            EnhancementOption.integer(UP_ACTION,"system","上推动作","可选择无动作。",1,0,7),
            EnhancementOption.integer(DOWN_ACTION,"system","下拉动作","可选择无动作。",2,0,7),
            EnhancementOption.custom(APP_PACKAGE,"system","指定应用","仅打开或关闭选定的应用。","",CompetitiveKeyPolicy::normalizePackage),
            EnhancementOption.custom(UP_SHELL,"system","上推命令","命令保留换行；在手机端使用已有 Root 授权执行。","",CompetitiveKeyPolicy::normalizeShell),
            EnhancementOption.custom(DOWN_SHELL,"system","下拉命令","命令保留换行；在手机端使用已有 Root 授权执行。","",CompetitiveKeyPolicy::normalizeShell));
    }
}
