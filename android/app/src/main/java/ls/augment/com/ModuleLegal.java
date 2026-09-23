package ls.augment.com;

import android.app.Activity;
import android.widget.LinearLayout;
import android.widget.TextView;

/** The same versioned disclosure is shown at first use and from About. */
final class ModuleLegal {
    static final int VERSION = 1;
    static final String VERSION_LABEL = "2026 年 9 月 11 日 · 第 1 版";

    private static final String[][] SECTIONS = {
        {"一、关于本模块",
            "LS_Augment 是由 liligit1815 维护的红魔系统与应用增强项目。模块通过 Root 与支持 Modern libxposed API 102 的 LSPosed 实现，调整你选择的系统及应用行为。它是独立开发项目，与手机厂商、LSPosed 和被调整的应用不存在官方隶属关系。"},
        {"二、使用前请了解",
            "请在你拥有或获得授权的设备上使用，并自行决定开启哪些功能。不同机型、ROM、应用版本和其他模块可能影响运行结果；系统升级后也可能需要重新适配。当前测试版本不保证所有功能在所有环境下可用。\n\n"
            + "Root、作用域同步和系统修改可能导致应用异常、耗电变化、界面失效或启动问题。操作前请保留重要数据与可用备份，了解如何在 LSPosed 中停用模块及恢复设备。出现异常时先关闭对应功能或停用模块，再按需重启相关应用或设备。"},
        {"三、功能边界与备份",
            "功能按页面说明生效；部分更改需要重启对应作用域或设备。签名不一致覆盖仅用于可信 APK，替换后的应用可能访问原有数据。音量、风扇及性能设置需要结合实际设备谨慎调整；步数等已写入的记录不会因关闭功能而自动撤回。\n\n"
            + "配置导入会替换对应设置。请先备份，并核对来源、设备及版本。配置备份不等于系统或应用数据备份，也不包含健康账户绑定、执行日志或设备测试凭据。首次同意记录单独保存在本机，不随模块配置导入导出。"},
        {"四、本地信息与用途",
            "为提供应用选择、隐藏管理、双开及肩键候选等功能，模块会读取已安装应用的名称、包名及必要状态；为配置和兼容性判断，会读取设备型号、系统版本及相关硬件信息。模块保存你选择的功能设置、应用清单、自定义图片或字体。\n\n"
            + "启用健康相关功能时，会按该功能说明处理账户绑定标识、步数与计划状态。诊断记录可能含机型、系统与应用信息、配置、作用域和运行事件；开启详细诊断后会记录更多相关调用信息。配置及模块日志在设备本地保存，供功能执行、状态展示及故障排查使用。"},
        {"五、权限、联网与分享",
            "本安装包声明应用列表查询和接收系统启动广播权限，分别用于相关应用管理和开机后的功能恢复；系统修改依赖你授予的 Root 权限及 LSPosed 作用域。选择导入或导出文件时，由系统文件选择器提供你选定文件的访问权限。\n\n"
            + "本模块未申请网络权限，不通过自身联网上传配置或日志。被调整的应用仍可能按它们自己的设置与隐私规则联网，例如健康应用同步记录。打开源码或问题反馈链接会交给浏览器处理；主动导出或分享的文件可能包含设备和配置信息，请在发送给他人前自行检查。"},
        {"六、管理信息与停止使用",
            "你可以在设置中调整功能、备份配置、恢复默认设置，并在诊断页面管理相关诊断选项。恢复默认设置会清理模块设置及相关绑定，诊断日志保留；用户已导出的文件由用户自行管理。\n\n"
            + "拒绝本说明将退出配置界面，不会自动清除旧配置、已写入的数据或停用 LSPosed 中已启用的模块。若希望停止已有功能，请先关闭相关功能或在 LSPosed 中停用模块，并按需重启设备。卸载模块也不能替代对其他应用中已有记录和外部备份的处理。"},
        {"七、你的选择与反馈",
            "你可以先完整阅读本说明，再选择是否同意。勾选后点击“同意并继续”才会记录本版同意状态；重新查看说明不会改变它。后续说明发生版本更新时，会再次请求确认。\n\n"
            + "如需反馈兼容性或信息处理问题，可通过“关于”中的项目问题反馈入口联系维护者。本说明描述本模块的使用方式和数据处理情况，不排除法律规定的用户权利或开发者应承担的责任。"}
    };

    private ModuleLegal() { }

    static void append(UiKit ui, LinearLayout parent) {
        append(ui, parent, "用户协议与隐私说明", new int[]{0, 1, 2, 3, 4, 5, 6});
    }

    private static void append(UiKit ui, LinearLayout parent, String title, int[] sections) {
        TextView edition = ui.text(title + "\n" + VERSION_LABEL, 12, ui.muted, false);
        edition.setLineSpacing(ui.dp(3), 1f);
        parent.addView(edition, ui.margins(0, 0, 0, 18));
        for (int index : sections) {
            String[] section = SECTIONS[index];
            String heading = sections.length == SECTIONS.length ? section[0] : section[0].substring(section[0].indexOf('、') + 1);
            parent.addView(ui.text(heading, 13, ui.text, true), ui.margins(0, 0, 0, 8));
            TextView content = ui.text(section[1], 12.5f, ui.muted, false);
            content.setLineSpacing(ui.dp(4), 1.08f);
            content.setTextIsSelectable(true);
            parent.addView(content, ui.margins(0, 0, 0, 20));
        }
    }

    static void open(Activity activity) { show(activity, new UiKit(activity)); }

    static void show(Activity activity, UiKit ui) {
        show(activity, ui, "用户协议与隐私说明", new int[]{0, 1, 2, 3, 4, 5, 6});
    }

    static void showTerms(Activity activity, UiKit ui) {
        show(activity, ui, "用户协议", new int[]{0, 1, 2, 5, 6});
    }

    static void showPrivacy(Activity activity, UiKit ui) {
        show(activity, ui, "隐私政策", new int[]{0, 3, 4, 5, 6});
    }

    private static void show(Activity activity, UiKit ui, String documentTitle, int[] sections) {
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        append(ui, content, documentTitle, sections);
        ui.glassDialog(documentTitle, content, "关闭", null, null);
    }
}
