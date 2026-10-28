package ls.augment.com;

import java.util.Arrays;
import java.util.List;

/** Shared phone-side selection, validation and backup semantics. */
public final class RecentsPrivacyOptions {
    public static final String ENABLED = "ls_augment_rm_recents_privacy_enabled";
    public static final String APPS = "ls_augment_rm_recents_privacy_apps";
    private RecentsPrivacyOptions() { }

    public static List<EnhancementOption> options() {
        return Arrays.asList(
            EnhancementOption.toggle(ENABLED, "launcher", "启用隐私屏",
                "在最近任务中模糊所选应用的画面，并居中显示清晰的红魔 Duo 图标，保留应用名称、打开和清理操作。关闭后保留应用选择。不影响应用内的正常显示，也不禁止系统截图。首次安装此功能后需重启系统桌面；之后修改即时生效。"),
            EnhancementOption.custom(APPS, "launcher", "隐私屏应用",
                "选择需要遮住最近任务画面的应用。同一包名的应用分身也会生效；未选择的应用保持原样。",
                "", AppPackageSet::normalize));
    }

    public static String selectionLabel(String value) {
        return "选择应用（已选 " + AppPackageSet.parse(value).size() + " 个）";
    }
}
