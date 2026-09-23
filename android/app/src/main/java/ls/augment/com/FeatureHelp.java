package ls.augment.com;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/** Plain-language help for existing controls; this class never changes their configuration. */
public final class FeatureHelp {
    private static final String GENERIC_SUMMARY = "关闭后恢复原厂行为；个别组件需重启系统界面。";
    private static final Map<String,String> DETAILS = details();

    private FeatureHelp() { }

    static String audioGainStages() {
        return "以基础 50 档、增强上限 200% 为例："
                + "\n\n第一段：正常音量\n从最低调到原厂最高，共 50 档。到这里，增益是 100%。"
                + "\n\n第二段：额外增强\n从 100% 增加到 200%，还差 100 个百分点："
                + "\n\n• 每次增加 5 个百分点：100 ÷ 5＝20 档。加上前面的 50 档，总共 70 档。"
                + "\n\n• 每次增加 1 个百分点：100 ÷ 1＝100 档。加上前面的 50 档，总共 150 档。"
                + "\n\n两种设置的最高增益都是 200%。区别只是调节粗细：每次增加得越少，到达上限需要的档位就越多。";
    }

    public static String forOption(EnhancementOption option) {
        if (option == null || option.kind == EnhancementOption.Kind.INTERNAL) return "";
        String description = description(option);
        if (description.isEmpty() || GENERIC_SUMMARY.equals(description))
            throw new IllegalArgumentException("Missing feature help: " + option.key);
        switch (option.kind) {
            case INTEGER:
            case DECIMAL:
                return description + "\n\n可设置范围：" + number(option.minimum) + "～"
                        + number(option.maximum) + "。默认值：" + option.defaultValue + "。";
            case CHOICE:
                return description + "\n\n可选：" + String.join("、",option.choices)
                        + "。默认：" + option.choices[Integer.parseInt(option.defaultValue)] + "。";
            case COLOR:
                return description + "\n\n输入 #RRGGBB 或 #AARRGGBB；AA 表示不透明度，FF 为完全不透明，00 为透明。默认："
                        + option.defaultValue + "。";
            default:
                return description;
        }
    }

    private static String description(EnhancementOption option) {
        String suffix = option.key.startsWith(SystemOptions.PREFIX)
                ? option.key.substring(SystemOptions.PREFIX.length()) : option.key;
        String exact = DETAILS.get(suffix);
        if (exact != null) return exact;
        if (suffix.startsWith("audio_steps_")) {
            String stream = suffix.substring("audio_steps_".length()).replace("_enabled", "");
            String label = stream.equals("alarm")?"闹钟":stream.equals("media")?"媒体":stream.equals("notification")?"通知":stream.equals("ring")?"铃声":"通话";
            boolean supportsGain = stream.equals("alarm") || stream.equals("media") || stream.equals("ring");
            return (suffix.endsWith("_enabled") ? "开启后，" + label + "使用本页填写的基础音量档数；关闭时恢复原厂基础档数。"
                    : "设置" + label + "达到原厂音量上限前的基础档数。档数越多，调节越细；需先开启对应的自定义档数开关。")
                    + "修改后需重启手机，重启前仍使用原已生效的基础档数。"
                    + (supportsGain ? "\n\n开启“音量增强”且当前输出设备的对应上限超过 100% 时，会在基础档数后追加增强档位，面板总档数随之增加。"
                            + "\n\n" + audioGainStages()
                            + "\n\n面板总数可能延后刷新，请在下次调节音量时核对。"
                            : "当前“音量增强”不为" + label + "追加档位。");
        }
        if (suffix.matches("ota_(model|imei|locale|signature|fingerprint|display|internal|variant|manufacturer)(_enabled)?")) {
            boolean enabled = suffix.endsWith("_enabled");
            String label = enabled ? option.title.substring(2) : option.title;
            return enabled ? "开启后，系统更新应用读取“" + label + "”时使用本页填写的替代值。"
                    + "需要同时开启设备信息总开关；替代值留空时保持原值。只影响更新应用读取，不改手机的实际硬件信息。"
                    : "填写系统更新应用读取的“" + label + "”替代值。需要同时开启设备信息总开关和“修改" + label
                    + "”；留空保留原值。此值不会写入手机实际硬件标识。";
        }
        if (suffix.startsWith("battery_color_")) {
            return "开启“按电量设置电池颜色”后，电量处于 " + option.title.replace(" 电池颜色", "")
                    + " 时使用此颜色。充电中的颜色由“充电时电池颜色”单独控制。";
        }
        if (suffix.startsWith("metric_prefix_")) {
            return "设置状态栏“" + option.title.replace("前缀", "") + "”数值前面的文字。"
                    + "需开启“温度与电量信息高级设置”及对应信息显示；留空只去掉前缀，不停止采集数值。";
        }
        if (suffix.startsWith("metric_width_")) {
            return "设置状态栏“" + option.title.replace("固定宽度", "") + "”文字区域的固定宽度，单位 dp。"
                    + "需开启“温度与电量信息高级设置”；0 表示宽度随文字内容变化。";
        }
        if (suffix.startsWith("recents_memory_")) {
            if (suffix.endsWith("_size")) return "调整最近任务中“" + option.title + "”，单位 sp，会跟随系统字体缩放。"
                    + "需要开启“自定义最近任务内存显示”。简洁和详细样式分别设置字号，同一样式在横竖屏使用同一个字号。";
            if (suffix.endsWith("_top")) return "设置最近任务中“" + option.title + "”的距离，单位 dp。"
                    + "简洁和详细样式共用此位置，切换样式会继承原位置；只移动内存文字，不移动任务卡片。需要开启自定义内存显示。";
            if (suffix.endsWith("_height")) return "设置最近任务中“" + option.title + "”的预留高度，单位 dp。"
                    + "需要开启自定义内存显示；横竖屏分别保存，简洁和详细样式共用。文字较多时会缩小字号，切换样式不改变位置。";
        }
        if (option.key.endsWith("_clock_font")) return "选择 TTF、OTF 或 TTC 字体文件，导入后用于对应时钟；文件会随模块配置备份。"
                + option.summary;
        return option.summary;
    }

    public static String forEntry(HookAppCatalog.Entry entry) {
        if (entry == null) return "";
        switch (entry.route) {
            case "freeform": return "设置小窗数量限制、允许进入小窗的应用，以及继续遵循原厂规则的例外名单。小窗的打开、最小化和关闭仍使用系统原有操作。";
            case "audio_gain": return "按输出设备分别设置媒体、铃声和闹钟的软件增益上限。超过 100% 时会在基础档数后追加增强档位，因此会改变音量总档数；通知和通话不追加。"
                    + "\n\n" + audioGainStages()
                    + "\n\n关闭增强或将对应上限设为 100% 时，不追加档位。"
                    + "\n\n百分比表示软件增益，不代表实测响度同比增加。修改基础档数需重启手机；修改增强参数后，面板总数可能要到下次调节音量时才刷新。";
            case "battery": return "读取循环次数、当前满充容量、设计容量和数据来源，并控制已识别的按循环降压策略。不会重置循环记录，也不会恢复电芯已经损失的容量。";
            case "signature_install": return "控制是否允许不同签名的 APK 覆盖同包名应用并保留数据。只放宽对应签名冲突，应用安装的其他检查保持原有规则。";
            case "status_layout": return "进入状态栏编辑器，统一调整双排布局、时钟格式、实时硬件信息、网速、图标大小和位置，并查看当前布局的实时预览。";
            case "launcher_custom": return "按用户空间选择应用，修改其桌面显示名称与图标。图标支持选图和裁剪，名称留空可恢复原名；修改只影响所选空间的对应应用。";
            case "launcher_compatibility": return "只读检查机型、系统与桌面底包是否匹配配套修改版桌面的已知基准。检测不会安装或替换桌面，匹配结果也不等于全部桌面功能已经验收。";
            case "shoulder": return "为加入游戏空间的普通应用开放肩键，并设置极速连点频率。极速连点需先完成本机及左右实体肩键兼容性检查；通过检查只解锁开关，不自动启用。";
            case "combo_speed": return "调整游戏助手录制连招的播放倍率与预览速度，不改录制事件内容。循环次数和循环间隔在本页“连招录制与循环”中分别控制。";
            case "super_resolution": return "调整原厂超分辨率的性能模式资格，以及超分与破坏神模式之间的互斥策略。手机和游戏仍需具备对应的原厂能力。";
            case "ai_trigger": return "调整 AI 触发器的模板扫描、点击队列、策略冷却与 YOLO 扫描间隔，缩短等待时间；识别规则和阈值继续由原厂流程处理。";
            case "fan_control": return "测量本机风扇各档转速，设置固定目标转速及最高档解限。目标转速匹配最接近的实测硬件档位；跟随原厂风扇开关，不主动启动已关闭的风扇。";
            case "beautify": return "处理已确认试用资源的本地到期恢复流程，让原厂主题试用继续保留。不会修改支付结果、账号权益或服务器资源资格。";
            case "double_app": return "扩展红魔原厂双开候选应用，并按需放宽已适配的低内存资格限制。双开空间的创建、数据和管理仍由原厂系统负责。";
            case "store_download": return "设置原厂应用中心允许同时下载的应用数量，范围 1～50。保存后重启应用中心，再使用新的下载队列限制。";
            case "mi_health": return "绑定当前小米运动健康账户，分别设置真实步数倍速、随机增步计划和当日上限。真实步数和计划分开处理；关闭功能只停止后续额外增步，不回退已保存记录。";
            case "launcher_icon": return "隐藏或恢复 LS_Augment 自身的桌面入口。隐藏后仍可从 LSPosed 的模块页面打开设置，不会隐藏其他应用。";
            case "config_transfer": return "导出、导入模块配置、应用选择、图片和字体，或恢复默认设置。账户绑定、运行日志、本机兼容性凭据及桌面页序不包含在备份中；重置前会恢复模块隐藏的应用。";
            case "diagnostics": return "查看当前环境与模块加载状态，控制详细诊断，并重新采集、导出运行记录。详细诊断不会自动启用对应增强，开启前的调用无法补录。";
            default: return entry.summary;
        }
    }

    public static String forDeviceSetting(String key) {
        switch (key) {
            case "development_settings_enabled": return "直接读取和修改手机的开发者选项总开关。开启后可在手机系统设置中使用开发者功能。";
            case "adb_enabled": return "直接读取和修改系统 USB 调试开关，决定是否允许电脑通过 ADB 调试手机。电脑授权仍由系统管理；关闭后当前 USB 调试连接会断开。";
            case "adb_install_enabled": return "直接读取和修改原厂 USB 安装开关，控制电脑通过 USB 安装应用的资格。原厂账号验证是否跳过由“USB 安装免账号验证”另行控制。";
            case "lock_refresh_rate": return "直接读取和修改原厂“锁定刷新率”开关，不在此指定具体的 Hz 数值。实际刷新率继续由当前系统、屏幕和应用支持情况决定。";
            default: throw new IllegalArgumentException("Unknown device setting: " + key);
        }
    }

    private static Map<String,String> details() {
        Map<String,String> values = new LinkedHashMap<>();
        values.put("hide_wifi_activity", "隐藏 Wi-Fi 图标旁表示上传、下载活动的箭头，保留 Wi-Fi 信号图标；不会停止联网或数据传输。");
        values.put("hide_wifi_standard", "隐藏 Wi-Fi 图标上表示 Wi-Fi 标准的数字，例如 6 或 7，保留信号强度显示。");
        values.put("hide_mobile_activity", "隐藏移动信号旁表示上传、下载活动的箭头，保留移动信号图标；不会关闭移动数据。");
        values.put("hide_mobile_type", "隐藏移动信号旁的网络制式文字，例如 4G、5G，保留信号强度和实际网络连接。");
        values.put("hide_hd_small", "隐藏移动信号旁的 HD 小图标。仅改变图标显示，不关闭高清语音通话能力。");
        values.put("hide_hd_large", "隐藏状态栏信号旁独立显示的大号 HD 图标，包含双卡 HD1/HD2 标记。与 HD 小图标独立控制；关闭后恢复系统显示，不关闭高清语音通话能力。");
        values.put("hide_sim1", "隐藏卡 1 的信号图标，不停用 SIM 卡，也不改变通话或移动数据设置。");
        values.put("hide_sim2", "隐藏卡 2 的信号图标，不停用 SIM 卡。没有第二张卡时不会产生新的信号图标。");
        values.put("ignore_system_icon_hide", "忽略原厂系统图标隐藏名单和已适配容器的屏蔽规则，重新显示被这些规则隐藏的系统图标。原厂名单不被删除，关闭后重新按原名单处理。");
        values.put("hide_wifi_scope", "选择需要隐藏 Wi-Fi 图标的界面位置，可单独指定主屏、锁屏、下拉通知区域或控制中心。“遵循原厂”不额外隐藏，“全部位置”应用到已适配的所有位置。");
        values.put("hide_hotspot_scope", "选择需要隐藏热点图标的界面位置。只隐藏所选位置的图标，不关闭热点，也不改变已连接设备。");
        values.put("hide_mobile_scope", "选择需要隐藏移动信号图标的界面位置。只影响所选位置的显示，SIM 卡、移动数据和通话继续正常工作。");
        values.put("hidden_icon_slots", "在弹出的图标清单中勾选需要隐藏的系统图标，例如闹钟、蓝牙、定位或 NFC。只隐藏图标，不关闭相应服务；取消勾选后恢复原有显示规则。");
        values.put("battery_hide_percent", "去掉电量数字后面的 % 符号，保留电量数字。电池图形和数字的位置由“电池样式”控制。");
        values.put("battery_width_dp", "设置状态栏电池图形与外置电量数字合计使用的固定宽度，单位 dp。0 使用原厂宽度；其他电池样式和显示位置保持当前选择。");
        values.put("battery_alpha_percent", "设置状态栏电池图标的不透明度，100 表示使用原厂不透明度，0 为透明。此值与自定义电池颜色本身的透明度共同生效。");
        values.put("battery_colors", "根据当前电量分别使用本页设置的四档电池颜色；充电时优先使用“充电时电池颜色”。关闭后按原厂配色显示。");
        values.put("battery_text_colors", "根据剩余电量，分别设置三合一图标中电量数字的四档颜色；充电时使用“充电时电量字体颜色”。此开关只控制电量数字，插头颜色在三合一高级设置中独立配置，圆环颜色由“按电量设置电池圆环颜色”独立控制。关闭后电量文字跟随状态栏文字颜色。");
        values.put("statusbar_double_tap_sleep", "在状态栏区域连续轻点两次可熄屏锁定手机。普通单击、拖动与下拉手势仍由系统处理；关闭后恢复原厂触摸行为。");
        values.put("statusbar_hide", "隐藏已适配的主屏状态栏内容，减少顶部显示的信息；锁屏顶部状态栏可通过“隐藏锁屏顶部状态栏”单独控制。");
        values.put("keyguard_statusbar_hide", "隐藏锁屏顶部的状态栏区域，不隐藏锁屏中央的大时钟、解锁控件和通知内容。");
        values.put("lock_volume", "锁屏时允许音量键调用原厂音量面板并调节音量。实际调节的声音类型继续由系统当前状态决定。");
        values.put("audio_no_long_press_vibrate", "取消原厂长按音量键时的振动反馈，不影响音量调节，也不修改来电或通知振动设置。");
        values.put("charging_animation", "启用本页设置的充电动画持续时间与延迟，调整原厂充电动画的播放时机；不会更换动画资源或改变实际充电速度。");
        values.put("charging_every_wake", "在充电过程中每次亮屏时尝试再次显示原厂充电动画。需要同时开启“自定义充电动画”；关闭后使用原厂触发时机。");
        values.put("charging_duration", "设置原厂充电动画每次持续播放的秒数。需要先开启“自定义充电动画”；此值不改变充电电流或电压。");
        values.put("charging_delay", "设置满足充电动画触发条件后等待多少秒再播放。需要先开启“自定义充电动画”；0 表示不增加等待时间。");
        values.put("qs_grid", "使用本页设置的行数、列数和编辑页列数重新排列控制中心普通磁贴。横竖屏分别设置；不改变每个磁贴本身的开关功能。");
        values.put("qs_columns", "设置竖屏控制中心普通磁贴每行排列的数量。需先开启“自定义控制中心行列”，列数越多，每列可用空间越少。");
        values.put("qs_rows", "设置竖屏控制中心普通磁贴初始可见的行数。需先开启“自定义控制中心行列”；超出初始行数的磁贴仍可滚动查看。");
        values.put("qs_land_columns", "设置横屏控制中心普通磁贴每行排列的数量。需先开启“自定义控制中心行列”，此值与竖屏列数独立保存。");
        values.put("qs_land_rows", "设置横屏控制中心普通磁贴初始可见的行数。需先开启“自定义控制中心行列”；更多磁贴仍可滚动查看。");
        values.put("qs_edit_columns", "设置竖屏控制中心磁贴编辑页面的列数。需先开启“自定义控制中心行列”；只改变编辑界面的排列，不更改已选磁贴。");
        values.put("qs_land_edit_columns", "设置横屏控制中心磁贴编辑页面的列数。需先开启“自定义控制中心行列”，与竖屏编辑列数分别保存。");
        values.put("qs_carrier", "决定是否在控制中心头部显示运营商名称。选择“遵循原厂”交由原厂规则决定；不改变 SIM 卡或运营商设置。");
        values.put("qs_search", "决定是否显示控制中心头部的搜索按钮。“搜索按钮打开指定应用”可另行设置点击后的目标；隐藏按钮不会卸载搜索应用。");
        values.put("qs_calendar", "点击控制中心头部的日期时打开系统默认日历应用。未安装或无法打开日历时保留原厂可用行为。");
        values.put("notification_native", "让已适配的状态栏和通知模板使用通知提供的小图标，减少原厂用完整应用图标替换的行为，并保留适合当前背景的着色。");
        values.put("statusbar_restore_font", "让已适配的状态栏时钟、电池和网速文字使用系统默认字体。启用模块自定义时钟字体时，自定义时钟设置仍优先。");
        values.put("cutout_always", "在原厂挖孔黑色遮罩组件中保持黑圈显示。只调整已适配的挖孔显示层，不改变摄像头硬件、可用屏幕尺寸或截图分辨率。");
        values.put("clock_milliseconds_refresh", "按本页的毫秒间隔刷新状态栏自定义时钟，配合时钟格式中的 S 显示毫秒。没有加入毫秒格式时不会自动添加毫秒；熄屏时暂停高频刷新。");
        values.put("qs_clock_seconds", "在已适配的下拉面板时钟中显示秒数，主屏状态栏大部分时钟格式仍由状态栏编辑器单独控制。");
        values.put("qs_clock_period", "在已适配的下拉面板时钟旁显示凌晨、上午、下午等中文时段，不修改手机的实际时间。");
        values.put("lock_charge_details", "在充电中的锁屏提示区域显示电池温度、电流、电压和功率。本页可分别隐藏其中的数值，并设置字号、间距与刷新间隔。");
        for (String[] metric : new String[][]{{"temperature","温度"},{"current","电流"},{"voltage","电压"},{"power","功率"}})
            values.put("lock_charge_hide_"+metric[0], "从锁屏充电详情中隐藏"+metric[1]+"这一项。需要先开启“锁屏显示充电详情”；其他未隐藏数据继续显示，不影响实际充电。");
        values.put("lock_charge_interval", "设置锁屏充电详情重新读取温度、电流、电压和功率的间隔，单位秒。仅在充电详情显示时使用；间隔越短，刷新越频繁。");
        values.put("lock_charge_text_size", "设置锁屏充电详情的字号，单位 sp，会跟随系统字体缩放。需要开启“锁屏显示充电详情”；只调整详情文字，不改变原厂解锁提示字号。");
        values.put("aod_period_scale", "调整息屏时钟旁中文时段的文字大小，数值相对于时钟字号：例如 0.6 表示时钟字号的 60%。需要开启“息屏时钟显示中文时段”。");
        values.put("clipboard_overlay", "恢复 Android 原生剪贴板浮窗，让复制内容后出现系统提供的预览与操作入口。敏感内容和可用操作仍由系统剪贴板规则决定。");
        values.put("onehand_adjust", "启用本页设置的单手模式上移距离，同时调整对应提示区域。只改变原厂单手模式中的内容位置，不自动进入单手模式。");
        values.put("onehand_offset", "设置单手模式相对原厂位置上移的像素数，正数向上、负数向下、0 保留原位置。需要先开启“调整单手模式位置”。");
        values.put("assist_gesture", "使用系统助理手势时调用你在默认应用中选择的数字助理，减少原厂对助理目标的替换。需要先安装并选择可用的默认助理。");
        values.put("network_custom", "为已有状态栏网速显示启用本页的低速隐藏阈值、精度、单位、/s 后缀与固定宽度。需先在状态栏编辑器中启用网速显示。");
        values.put("network_digits", "设置状态栏网速数值保留的有效位数，用于在精度与显示长度之间取舍。需开启“网速显示高级设置”；不会改变网速统计的真实数据。");
        values.put("network_unit", "设置状态栏网速使用自动 K/M、固定 KB 或固定 MB，统计口径保持每秒传输的字节数。需开启“网速显示高级设置”。");
        values.put("network_per_second", "在状态栏网速单位后增加 /s，例如 KB/s。需开启“网速显示高级设置”；只改变后缀，不改变速度统计口径。");
        values.put("network_width_dp", "为状态栏网速文字保留固定宽度，单位 dp，减少数值变化时的横向跳动。需开启“网速显示高级设置”；0 表示宽度随内容变化。");
        values.put("metrics_custom", "为状态栏已有的 CPU、GPU、电池温度、电流和功率启用本页的前缀、单位、固定宽度及充电条件。需先在状态栏编辑器中打开对应信息显示。");
        values.put("metrics_hide_units", "隐藏状态栏温度、电流和功率文字中的单位符号，保留数字与自定义前缀。需开启“温度与电量信息高级设置”。");
        values.put("metrics_charging_only", "让状态栏电流和功率仅在手机充电时显示，拔下充电器后隐藏这两项。需开启“温度与电量信息高级设置”；温度项目不受此项影响。");
        values.put("recents_memory_style", "选择最近任务内存信息使用简洁单行还是详细多行布局。需要开启自定义内存显示，由模块统一控制原厂桌面和 260005 版桌面的显示。不会改变任务卡片排列。");
        values.put("recents_memory_content", "选择要显示的内存内容，支持“可用|总共”。选项示例使用总共 8 GB、可用 3 GB 演示，并随简洁或详细样式变化；实际显示使用手机内存数据。");
        values.put("recents_memory_color_mode", "选择最近任务内存文字沿用桌面颜色、跟随系统明暗，或使用下面分别设置的浅色和深色颜色。需开启自定义内存显示。");
        values.put("recents_memory_light_color", "系统处于浅色模式时，最近任务内存文字使用此颜色。需要将“内存文字颜色”设为“自定义深浅色”，并开启自定义内存显示。");
        values.put("recents_memory_dark_color", "系统处于深色模式时，最近任务内存文字使用此颜色。需要将“内存文字颜色”设为“自定义深浅色”，并开启自定义内存显示。");
        values.put("lock_timeout_seconds", "设置手机停留在锁屏界面时自动熄屏的等待秒数。需要先开启“自定义锁屏息屏时间”，修改后用于下一次锁屏等待，不影响已解锁时的息屏设置。");
        values.put("wifi_country", "填写两位英文 Wi-Fi 国家码，例如 CN。需开启“自定义 Wi-Fi 国家码”，供已适配的无线接口设置流程读取；实际可用频段仍受驱动和硬件支持限制。");
        values.put("wifi_mac", "填写无线接口使用的固定 Wi-Fi MAC 地址，例如 02:12:34:56:78:9A。需开启“固定 Wi-Fi MAC 地址”；留空不修改，不接受组播或全零地址。");
        values.put("hotspot_mac", "填写热点接口使用的固定 BSSID，例如 02:12:34:56:78:9A。需开启“固定热点 BSSID”；留空不修改，不替换热点名称或密码。");
        values.put("mtp_name", "设置电脑通过 USB 文件传输访问手机主存储时显示的名称。需要开启“自定义 MTP 存储名称”；不会重命名手机内部文件或目录。");
        values.put("ota_block", "阻止原厂系统更新应用发起系统更新安装，需要在安装开始前启用。此开关不会回退已经安装的系统版本。");
        values.put("ota_capture_url", "在原厂系统更新应用准备安装时，提取它实际使用的更新地址。随后可在“查看已提取的更新链接”中查看和复制；打开此开关不会自动开始更新。");
        values.put("ota_spoof_enabled", "允许为原厂系统更新应用读取的设备字段提供替代值。需要再单独开启要修改的字段并填写内容；未开启或留空的字段保持原值，不改变手机实际硬件信息。");
        values.put("telemetry_disable", "阻止已识别的两类红魔系统统计服务执行初始化。仅作用于已适配的系统服务，不代表关闭所有应用的统计或网络通信。");
        values.put("theme_no_login", "放宽原厂主题、壁纸和息屏资源下载入口的本地登录要求，继续使用原厂免费、已拥有或明确试用的资源下载流程。不会修改账号权益或付费资格。");
        values.put(GameOptions.REMEMBER_ACTIVE, "按游戏保留你手动选择的原厂活跃模式，包括纯常亮。退出游戏时释放常亮锁，重新进入可恢复选择；手动关闭会清除选择。此项不记忆性能档位。");
        values.put(GameOptions.COLLAPSE_PANEL, "切换破坏神模式或超境画质后保持游戏面板。遇到确认窗口时临时收起，确认或取消后，仅在同一游戏仍位于前台且手机亮屏未锁定时恢复。");
        return Collections.unmodifiableMap(values);
    }

    private static String number(double value) {
        return BigDecimal.valueOf(value).stripTrailingZeros().toPlainString();
    }
}
