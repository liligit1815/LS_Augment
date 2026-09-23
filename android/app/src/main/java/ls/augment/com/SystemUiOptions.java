package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Options shared by the UI, validated configuration and SystemUI hooks. */
public final class SystemUiOptions {
    public static final String PREFIX = "ls_augment_rm_";
    public static final String PRIVACY_HIDE = PREFIX + "privacy_hide";
    public static final String SIGNAL_DUAL = PREFIX + "signal_dual";
    public static final String AUDIO_NO_SAFE_WARNING = PREFIX + "audio_no_safe_warning";
    public static final String QS_BRIGHTNESS_PERCENT = PREFIX + "qs_brightness_percent";
    public static final String QS_VOLUME_PERCENT = PREFIX + "qs_volume_percent";
    private SystemUiOptions() { }
    public static List<EnhancementOption> options() {
        ArrayList<EnhancementOption> out = new ArrayList<>();
        out.add(EnhancementOption.toggle(PRIVACY_HIDE, "statusbar", "隐藏隐私小绿点", "隐藏状态栏隐私绿点和使用提醒胶囊，权限设置和访问记录保持原样。"));
        out.add(EnhancementOption.toggle(SIGNAL_DUAL, "statusbar", "双卡信号上下排列", "用两排紧凑短柱显示真实信号，流量卡在上、另一张卡在下；单卡恢复原厂显示。"));
        out.add(EnhancementOption.toggle(AUDIO_NO_SAFE_WARNING, "audio", "取消音量过高提示", "取消安全音量和累计声音剂量提示；与现有音量增益、档数设置共同生效。"));
        bool(out, "hide_wifi_activity", "statusbar", "隐藏 Wi-Fi 收发箭头");
        bool(out, "hide_wifi_standard", "statusbar", "隐藏 Wi-Fi 标准数字");
        bool(out, "hide_mobile_activity", "statusbar", "隐藏移动网络收发箭头");
        bool(out, "hide_mobile_type", "statusbar", "隐藏移动网络类型");
        bool(out, "hide_hd_small", "statusbar", "隐藏信号旁的 HD 小图标");
        bool(out, "hide_hd_large", "statusbar", "隐藏信号旁的 HD 大图标");
        bool(out, "hide_sim1", "statusbar", "隐藏卡 1 信号");
        bool(out, "hide_sim2", "statusbar", "隐藏卡 2 信号");
        bool(out, "ignore_system_icon_hide", "statusbar", "忽略系统图标隐藏限制");
        String[] visibilityContexts={"遵循原厂","主屏状态栏","锁屏状态栏","通知栏头部","通知栏内控制中心","独立控制中心","全部位置"};
        out.add(EnhancementOption.choice(PREFIX+"hide_wifi_scope","statusbar","隐藏 Wi-Fi 图标的位置","按位置独立处理原厂图标。",0,visibilityContexts));
        out.add(EnhancementOption.choice(PREFIX+"hide_hotspot_scope","statusbar","隐藏热点图标的位置","按位置独立处理原厂图标。",0,visibilityContexts));
        out.add(EnhancementOption.choice(PREFIX+"hide_mobile_scope","statusbar","隐藏移动网络图标的位置","按位置独立处理原厂图标。",0,visibilityContexts));
        out.add(EnhancementOption.text(PREFIX + "hidden_icon_slots", "statusbar", "其他隐藏图标", "填写图标槽位，以英文逗号分隔，例如 alarm_clock,bluetooth。", "", 1024));
        out.add(EnhancementOption.choice(PREFIX + "battery_style", "statusbar", "电池样式", "继续使用原厂电池图形及当前布局位置。", 0, "遵循原厂", "电池内显示数字", "电池后显示数字", "数字后显示电池", "仅电池图标", "仅电量数字", "隐藏电池"));
        bool(out, "battery_hide_percent", "statusbar", "隐藏电量百分号");
        out.add(EnhancementOption.integer(PREFIX+"battery_width_dp","statusbar","电池固定宽度","0 为原厂宽度，包含电池图标和外置数字。",0,0,120));
        out.add(EnhancementOption.integer(PREFIX+"battery_alpha_percent","statusbar","电池图标不透明度（%）","100 为原厂透明度；与电量颜色的透明度叠加。",100,0,100));
        bool(out, "battery_colors", "statusbar", "按电量设置电池圆环颜色");
        String[] bands = {"0–19%", "20–50%", "51–79%", "80–100%"};
        String[] colors = {"#FFFF5252", "#FFFFB74D", "#FF81C784", "#FF4CAF50"};
        for (int i = 0; i < bands.length; i++) out.add(EnhancementOption.color(PREFIX + "battery_color_" + i, "statusbar", bands[i] + " 电池圆环颜色", "支持透明度，格式 #AARRGGBB。", colors[i]));
        out.add(EnhancementOption.color(PREFIX+"battery_charging_color","statusbar","充电时电池圆环颜色","三合一圆环和原厂电池图标使用此配色。","#FF34C759"));
        bool(out,"battery_text_colors","statusbar","按电量设置电量字体颜色");
        for(int i=0;i<bands.length;i++)out.add(EnhancementOption.color(PREFIX+"battery_text_color_"+i,"statusbar",bands[i]+" 电量字体颜色","只修改三合一图标内的电量数字；格式 #AARRGGBB。",colors[i]));
        out.add(EnhancementOption.color(PREFIX+"battery_text_charging_color","statusbar","充电时电量字体颜色","只修改三合一图标内的电量数字；插头颜色在三合一高级设置中独立配置。","#FF34C759"));
        bool(out, "statusbar_double_tap_sleep", "statusbar", "双击状态栏锁屏");
        bool(out, "statusbar_hide", "statusbar", "隐藏状态栏内容");
        bool(out, "keyguard_statusbar_hide", "lockscreen", "隐藏锁屏顶部状态栏");
        out.add(EnhancementOption.toggle(PREFIX + "lock_clock_seconds", "lockscreen", "锁屏大时钟显示秒", "适用于文字时钟；斜切样式的秒数显示在日期旁。图片数字和表盘样式不显示数字秒数。"));
        out.add(EnhancementOption.toggle(PREFIX + "lock_clock_period", "lockscreen", "锁屏大时钟显示中文时段", "适用于带时段文字位置的原厂时钟样式。"));
        out.add(EnhancementOption.text(PREFIX + "lock_clock_font", "lockscreen", "锁屏时钟字体文件", "适用于文字时钟，图片数字和表盘保持原样；选择“恢复原厂字体”可撤销。", "", 512));
        out.add(EnhancementOption.decimal(PREFIX + "lock_clock_scale", "lockscreen", "锁屏时钟字体比例", "适用于文字时钟，1 为原厂大小；文字过大时自动适配可用空间，避免裁切。", 1, 0.5, 2));
        bool(out, "lock_volume", "audio", "锁屏时允许调节音量");
        bool(out, "audio_no_long_press_vibrate", "audio", "取消长按音量键振动");
        bool(out, "charging_animation", "lockscreen", "自定义充电动画");
        bool(out, "charging_every_wake", "lockscreen", "每次亮屏显示充电动画");
        out.add(EnhancementOption.integer(PREFIX + "charging_duration", "lockscreen", "充电动画持续秒数", "启用自定义充电动画后生效。", 6, 1, 120));
        out.add(EnhancementOption.integer(PREFIX + "charging_delay", "lockscreen", "充电动画延迟秒数", "启用自定义充电动画后生效。", 0, 0, 60));
        out.add(EnhancementOption.toggle(QS_BRIGHTNESS_PERCENT, "quicksettings", "亮度显示百分比", "控制中心亮度条显示整数百分比，随调节实时更新；关闭后恢复原厂显示。"));
        out.add(EnhancementOption.toggle(QS_VOLUME_PERCENT, "quicksettings", "音量显示百分比", "控制中心音量条显示整数百分比，随调节实时更新；关闭后恢复原厂显示。"));
        bool(out, "qs_grid", "quicksettings", "自定义控制中心行列");
        out.add(EnhancementOption.integer(PREFIX + "qs_columns", "quicksettings", "竖屏列数", "控制中心普通磁贴列数。", 4, 2, 8));
        out.add(EnhancementOption.integer(PREFIX + "qs_rows", "quicksettings", "竖屏行数", "普通磁贴的初始可见行数；更多磁贴可滚动查看。", 3, 1, 8));
        out.add(EnhancementOption.integer(PREFIX + "qs_land_columns", "quicksettings", "横屏列数", "控制中心普通磁贴列数。", 4, 2, 10));
        out.add(EnhancementOption.integer(PREFIX + "qs_land_rows", "quicksettings", "横屏行数", "普通磁贴的初始可见行数；更多磁贴可滚动查看。", 2, 1, 6));
        out.add(EnhancementOption.integer(PREFIX + "qs_edit_columns", "quicksettings", "磁贴编辑列数", "控制中心编辑页面列数。", 4, 2, 8));
        out.add(EnhancementOption.integer(PREFIX + "qs_land_edit_columns", "quicksettings", "横屏磁贴编辑列数", "横屏控制中心编辑页面列数。", 6, 2, 10));
        out.add(EnhancementOption.choice(PREFIX + "qs_carrier", "quicksettings", "运营商名称", "控制中心头部。", 0, "遵循原厂", "显示", "隐藏"));
        out.add(EnhancementOption.choice(PREFIX + "qs_search", "quicksettings", "搜索按钮", "控制中心头部。", 0, "遵循原厂", "显示", "隐藏"));
        bool(out, "qs_calendar", "quicksettings", "点击日期打开默认日历");
        out.add(EnhancementOption.text(PREFIX + "qs_browser", "quicksettings", "搜索按钮打开指定应用", "填写浏览器包名；留空遵循原厂，未安装时继续原厂行为。", "", 255));
        bool(out, "notification_native", "statusbar", "恢复原生通知图标");
        bool(out, "statusbar_restore_font", "statusbar", "恢复状态栏原生字体");
        bool(out, "cutout_always", "statusbar", "挖孔黑圈常显");
        bool(out, "clock_milliseconds_refresh", "statusbar", "启用时钟毫秒刷新");
        out.add(EnhancementOption.integer(PREFIX + "clock_refresh_ms", "statusbar", "时钟刷新间隔（毫秒）", "配合现有时钟自定义格式中的 S 使用；屏幕关闭时暂停高频刷新。", 100, 16, 1000));
        bool(out, "qs_clock_seconds", "quicksettings", "下拉面板时钟显示秒");
        bool(out, "qs_clock_period", "quicksettings", "下拉面板时钟显示中文时段");
        out.add(EnhancementOption.toggle(PREFIX + "notification_weather", "quicksettings", "通知中心显示当日天气", "在通知中心日期右侧显示地区、天气和当前温度（°C）；点击打开原厂天气查看详情及更新时间。需先在原厂天气中设置城市并更新。"));
        bool(out, "lock_charge_details", "lockscreen", "锁屏显示充电详情");
        for(String metric:new String[]{"temperature","current","voltage","power"}) {
            String title=metric.equals("temperature")?"温度":metric.equals("current")?"电流":metric.equals("voltage")?"电压":"功率";
            bool(out,"lock_charge_hide_"+metric,"lockscreen","充电详情隐藏"+title);
        }
        out.add(EnhancementOption.integer(PREFIX+"lock_charge_text_size","lockscreen","充电详情字号","独立调整详情文字，不改变原厂锁屏提示字号。",14,8,32));
        out.add(EnhancementOption.integer(PREFIX+"lock_charge_line_gap","lockscreen","充电详情行间距","详情与原厂提示之间的间距，以 dp 为单位。",2,0,40));
        out.add(EnhancementOption.integer(PREFIX + "lock_charge_interval", "lockscreen", "充电详情刷新间隔（秒）", "显示电池温度、电流、电压和功率。", 1, 1, 30));
        out.add(EnhancementOption.toggle(PREFIX+"aod_seconds","aod","息屏时钟显示秒","对普通文字时钟生效，斜切和翻转分层数字显示在日期旁；艺术数字、日历翻页和表盘保持原厂。"));
        out.add(EnhancementOption.toggle(PREFIX+"aod_period","aod","息屏时钟显示中文时段","显示在普通文字时钟旁，斜切和翻转分层数字显示在日期旁；艺术数字、日历翻页及原厂日期保持原样。"));
        out.add(EnhancementOption.decimal(PREFIX + "aod_period_scale", "aod", "息屏时段字号比例", "相对于时钟文字大小。", 0.6, 0.3, 1.5));
        out.add(EnhancementOption.text(PREFIX + "aod_clock_font", "aod", "息屏时钟字体", "对普通文字、斜切和翻转分层数字生效，艺术数字、日历翻页和表盘保持原厂；选择“恢复原厂字体”可撤销。", "", 512));
        out.add(EnhancementOption.decimal(PREFIX+"aod_clock_scale","aod","息屏时钟字体比例","1 为原厂大小，过大时按可用空间适配；艺术数字、日历翻页和表盘保持原厂。",1,0.5,2));
        bool(out, "clipboard_overlay", "system", "恢复原生剪贴板浮窗");
        bool(out, "onehand_adjust", "system", "调整单手模式位置");
        out.add(EnhancementOption.integer(PREFIX + "onehand_offset", "system", "单手模式上移距离", "以像素为单位，负数向下移动。", 0, -1000, 1000));
        bool(out, "assist_gesture", "system", "手势使用默认数字助理");
        bool(out, "network_custom", "statusbar", "网速显示高级设置");
        out.add(EnhancementOption.integer(PREFIX + "network_hide_below_kb", "statusbar", "低速隐藏阈值（KB/s）", "上下行都低于阈值时隐藏；0 不隐藏。", 0, 0, 10240));
        out.add(EnhancementOption.integer(PREFIX + "network_digits", "statusbar", "网速有效位数", "在现有上下行布局中调整精度。", 3, 1, 5));
        out.add(EnhancementOption.choice(PREFIX + "network_unit", "statusbar", "网速单位", "保持字节每秒的统计口径。", 0, "自动 K/M", "固定 KB", "固定 MB"));
        bool(out, "network_per_second", "statusbar", "网速显示 /s");
        out.add(EnhancementOption.integer(PREFIX + "network_width_dp", "statusbar", "网速固定宽度", "0 为随内容变化。", 0, 0, 180));
        bool(out, "metrics_custom", "statusbar", "温度与电量信息高级设置");
        bool(out, "metrics_hide_units", "statusbar", "温度与电量信息隐藏单位");
        bool(out, "metrics_charging_only", "statusbar", "仅充电时显示电流和功率");
        String[] metricIds={"cpu","gpu","battery_temp","current","power"};
        String[] metricTitles={"CPU 温度","GPU 温度","电池温度","电流","功率"};
        String[] metricPrefixes={"C:","G:","B:","I:","P:"};
        for(int i=0;i<metricIds.length;i++){
            out.add(EnhancementOption.text(PREFIX + "metric_prefix_"+metricIds[i],"statusbar",metricTitles[i]+"前缀","可留空。",metricPrefixes[i],16));
            out.add(EnhancementOption.integer(PREFIX + "metric_width_"+metricIds[i],"statusbar",metricTitles[i]+"固定宽度","0 为随内容变化。",0,0,180));
        }
        return Collections.unmodifiableList(out);
    }
    private static void bool(List<EnhancementOption> out, String key, String group, String title) {
        out.add(EnhancementOption.toggle(PREFIX + key, group, title, "关闭后恢复原厂行为；个别组件需重启系统界面。"));
    }
}
