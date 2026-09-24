package ls.augment.com;

/** Shared explanations for fields reused by the dedicated configuration editors. */
final class FeatureDescriptions {
    private FeatureDescriptions() { }

    static String forKey(String key, String label) {
        switch (key) {
            case ConfigSchema.SYSTEMUI_MASTER: return "启用本模块的状态栏布局与组件设置。关闭后恢复系统布局，各组件配置仍会保留。";
            case ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY: return "仅调整原生时钟和图标组的位置、大小与顺序，保留原生行数、字体及图标样式。暂停自定义时钟、双排图标、硬件信息和自定义网速；原有设置保留，关闭此模式后恢复。";
            case ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP: return "开启时自动关闭原生电池图标功能；关闭时不会开启另一项。两项可以同时关闭，恢复默认电池外观与布局，并跟随状态栏整体布局；两边配置都会保留。外圈显示电量。高级设置中，三个内部区域可分别选择内容、移动和缩放，闪电与旁路充电插头也可分别调整。仅调整位置和大小模式下暂停。";
            case ConfigSchema.STATUSBAR_CONNECTIVITY_PLUG_COLOR: return "设置闪电和插头共用的颜色。普通充电显示闪电，旁路充电显示插头；拔掉电源后隐藏。默认位于电量数字右侧，位置和大小可在各自的高级设置中调整。支持 #RRGGBB 或含透明度的 #AARRGGBB。";
            case ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS: return "充电时电量弧显示绿色，低电量时显示红色；关闭后随状态栏使用黑白色。";
            case ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP: return "单独调整系统原生网速的字号，单位 sp；0 跟随系统图标大小。需要先在系统设置中开启原生网速显示。";
            case ConfigSchema.STATUSBAR_NETWORK_UPLOAD_MARK: return "显示在上传速度前的标志，默认 ↑。可输入文字或符号，最多 16 个字符；留空只显示速度数值与单位。";
            case ConfigSchema.STATUSBAR_NETWORK_DOWNLOAD_MARK: return "显示在下载速度前的标志，默认 ↓。可输入文字或符号，最多 16 个字符；留空只显示速度数值与单位。";
            case ConfigSchema.STATUSBAR_CPU_DECIMALS:
            case ConfigSchema.STATUSBAR_GPU_DECIMALS:
            case ConfigSchema.STATUSBAR_BATTERY_TEMP_DECIMALS:
            case ConfigSchema.STATUSBAR_CURRENT_DECIMALS:
            case ConfigSchema.STATUSBAR_POWER_DECIMALS: return "设置小数点后显示的位数，0 为整数，可选 0–3 位。仅调整显示精度，不提高传感器测量精度。";
            case ConfigSchema.STATUSBAR_HEIGHT_DP: return "范围 -32～96 dp；0 跟随原厂，负数从当前方向的原厂高度扣减，正数指定高度且不低于原厂。实际高度最低 1 dp；过小会压缩双排内容。";
            case ConfigSchema.STATUSBAR_LEFT_MARGIN_DP: return "设置状态栏内容与左侧边缘之间的留白，单位 dp；不会取消屏幕开孔避让。";
            case ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP: return "设置状态栏内容与右侧边缘之间的留白，单位 dp；不会取消屏幕开孔避让。";
            case ConfigSchema.STATUSBAR_TOP_MARGIN_DP: return "设置状态栏内容上方的额外留白，单位 dp。";
            case ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP: return "设置状态栏内容下方的额外留白，单位 dp。";
            case ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP: return "调整状态栏上下两排之间的间距，单位 dp。负数仅在内容不碰撞时生效；检测到交叠时自动使用安全间距，原设置保留。正数增大间距。";
            case ConfigSchema.STATUSBAR_CLOCK_CUSTOM: return "启用自定义时钟文字和排版；关闭后恢复原厂时钟显示。";
            case ConfigSchema.STATUSBAR_CLOCK_PATTERN: return "设置第一行时间格式。HH:mm 为 24 小时时间，hh:mm 为 12 小时时间，ss 为秒；固定文字使用单引号。留空时使用下方默认时间选项。";
            case ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND: return "设置第二行时间格式，例如 MM/dd E。仅在时钟选择双排时显示此输入项；切回单排保留格式，再次选择双排可继续使用。留空不绘制第二行文字。";
            case ConfigSchema.STATUSBAR_CLOCK_24H: return "第一行格式留空时，默认时钟使用 24 小时制；关闭后使用 12 小时制。";
            case ConfigSchema.STATUSBAR_CLOCK_SECONDS: return "默认时钟显示秒数。自定义格式需要包含秒数格式符才会显示相应内容。";
            case ConfigSchema.STATUSBAR_CLOCK_PERIOD: return "在默认时钟中显示上午、下午等时段文字。";
            case ConfigSchema.STATUSBAR_CLOCK_WEEK: return "在默认时钟中显示当前星期，文字随系统语言变化。";
            case ConfigSchema.STATUSBAR_CLOCK_FONT_FAMILY: return "使用系统已提供的字体名称，例如 sans-serif、serif 或 monospace；这里填写字体名称，不是字体文件路径。";
            case ConfigSchema.STATUSBAR_CLOCK_SIZE_SP: return "单独指定时钟字号，单位 sp；0 跟随布局或系统大小。修改组件大小后会重新跟随布局，空间不足时仍可能自动缩小。";
            case ConfigSchema.STATUSBAR_CLOCK_WEIGHT: return "设置时钟文字粗细，100 最细、900 最粗；实际效果取决于所选字体支持的字重。";
            case ConfigSchema.STATUSBAR_CLOCK_LETTER_SPACING: return "调整相邻字符之间的距离；负值更紧凑，正值更宽松。";
            case ConfigSchema.STATUSBAR_CLOCK_LINE_SPACING_DP: return "为双行时钟增加两行之间的额外间距，单位 dp。";
            case ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP: return "限制时钟使用的布局宽度，单位 dp；0 自动计算。宽度不足时文字可能缩小或截断。";
            case ConfigSchema.STATUSBAR_CLOCK_TEXT_ALIGN: return "设置时钟文字在自身布局区域内靠左、居中或靠右，不改变整个时钟所在的显示区域。";
            case ConfigSchema.STATUSBAR_NOTIFICATION_MAX: return "限制状态栏显示的通知图标数量；0 跟随系统限制。此设置不会删除通知。";
            case ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS: return "将通知图标按状态栏上下两排排列，并共用所在区域的布局空间。";
            case ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS: return "将系统图标按状态栏上下两排排列，并共用所在区域的布局空间。";
            case ConfigSchema.TGK_RAPID_FIRE_COUNT: return "设置按住实体肩键时的连续点击频率，单位次/秒。需要先通过本机兼容性测试；较高频率可能被个别游戏丢弃。";
            case ConfigSchema.AI_TRIGGER_TEMPLATE_SCAN_MS: return "设置模板识别两次扫描之间的等待时间，单位毫秒；实际频率还受图像处理耗时影响。";
            case ConfigSchema.AI_TRIGGER_CLICK_MS: return "设置 AI 触发器点击队列的等待间隔，单位毫秒；仍会等待本次点击结束后再触发。";
            case ConfigSchema.AI_TRIGGER_COOLDOWN_MS: return "设置 AI 识别策略再次触发前的冷却时间，单位毫秒，避免同一结果过于频繁地触发。";
            case ConfigSchema.AI_TRIGGER_YOLO_SCAN_MS: return "设置 YOLO 识别扫描的等待间隔，单位毫秒；实际触发速度取决于模型识别和点击耗时。";
            case ConfigSchema.COMBO_SPEED_RATE: return "调整已录制连招的播放速度，1 倍为原速度；此设置调整播放间隔，不会重新录制动作。";
            case ConfigSchema.FAN_TARGET_RPM: return "选择期望的风扇转速，单位 RPM。先测量本机各档转速，模块会匹配最接近的硬件档位，并非连续无级调速。";
            case ConfigSchema.AUDIO_GAIN_STEP: return "这里只控制第二段“额外增强”：达到原厂最高音量后，每按一次音量加键增加多少个百分点，不改变第一段的基础档数。最后一档不超过设定上限。"
                    + "\n\n" + FeatureHelp.audioGainStages()
                    + "\n\n这里的百分比表示软件增益，不代表实测响度同比增加。";
            case ConfigSchema.STORE_DOWNLOAD_COUNT: return "设置应用中心可同时下载的应用数量。保存后按需重启应用中心，使新下载队列配置生效。";
            case ConfigSchema.TILE_LABEL: return "设置快捷设置磁贴的名称，最多 30 个字符；留空使用 LS_Augment。";
            case ConfigSchema.TILE_DESCRIPTION: return "设置快捷设置磁贴的说明文字，最多 60 个字符；留空使用“应用隐藏”。";
            default:
                if (key.startsWith("ls_augment_audio_limit_")) return "设置此输出设备和声音类型的软件增益上限。音量增强开启时，100% 不追加增强档位，超过 100% 会增加总档数。"
                        + "\n\n" + FeatureHelp.audioGainStages()
                        + "\n\n修改后面板总数可能延后到下次调节音量时刷新。软件比例不等于实测响度，过高音量可能产生失真。";
                for (EnhancementOption option : EnhancementCatalog.options())
                    if (option.key.equals(key) && !option.summary.isEmpty()) return option.summary;
                return "调整“" + label + "”的设置。请按字段标注的单位和范围填写。";
        }
    }

    static String statusComponent(String id, String title) {
        if ("clock".equals(id)) return "控制状态栏时钟的显示，并设置显示区域、大小、排数和区域内顺序。";
        if ("notifications".equals(id)) return "控制状态栏通知图标组的显示和布局；关闭显示不会删除通知。";
        if ("system_icons".equals(id)) return "控制状态栏系统图标组的显示和布局，例如网络、蓝牙与闹钟图标。";
        if ("network".equals(id)) return "开关控制自定义实时网速。展开后可集中设置原生网速字号、自定义网速的显示方式、上下行标志、位置和大小；关闭开关仍可配置原生网速字号。";
        return "控制状态栏中的“" + title + "”组件是否显示，并设置它的显示区域、大小和区域内顺序。传感器数据以设备能够读取的结果为准。";
    }

    static String layoutValue(String label) {
        if(label.endsWith("左右移动（直径 %）"))return "相对默认位置左右移动：负数向左，正数向右。10 表示移动整个三合一图标直径的 10%，0 表示不偏移。";
        if(label.endsWith("上下移动（直径 %）"))return "相对默认位置上下移动：负数向上，正数向下。10 表示移动整个三合一图标直径的 10%，0 表示不偏移。";
        if(label.endsWith("大小（%）"))return "100% 为原有大小，数值越大显示越大。调整只影响当前内容，不改变其他区域的大小。";
        if(label.equals("电量弧粗细（占组件直径 %）"))return "设置电量圆环的线条粗细，以三合一图标直径的百分比计算。";
        if(label.equals("未点亮部分不透明度（%）"))return "设置未点亮圆环、Wi-Fi 和信号的可见程度；越大越明显。";
        if ("大小".equals(label)) return "设置当前组件的显示大小；空间不足时布局仍会自动缩小，避免重叠。调整时钟大小会取消单独字号设置。";
        if ("区内顺序".equals(label)) return "调整当前组件在同一显示区域内的排列先后，数值越小越靠前。";
        if (label.startsWith("原生网速字号")) return forKey(ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP,label);
        if (label.startsWith("状态栏高度")) return forKey(ConfigSchema.STATUSBAR_HEIGHT_DP, label);
        if (label.startsWith("通知数量")) return forKey(ConfigSchema.STATUSBAR_NOTIFICATION_MAX, label);
        if ("两排间距".equals(label)) return forKey(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP, label);
        return "调整" + label + "，单位 dp。留白增大后，可供状态栏组件使用的空间会相应减少。";
    }
}
