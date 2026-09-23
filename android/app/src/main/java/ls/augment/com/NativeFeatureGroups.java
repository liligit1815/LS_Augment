package ls.augment.com;

import java.util.*;

/** Reviewed native guards for all 200 application options. UI metadata only;
 * every stored value still uses EnhancementCatalog/ConfigSchema's existing key. */
final class NativeFeatureGroups {
    private NativeFeatureGroups() { }
    static final class Feature {
        final String id,title,toggleKey,comparison,noOpValue;
        final String[] parameterKeys;
        final Feature[] children;
        Feature(String id,String title,String toggle,String[] parameters,String comparison,String noOp,Feature[] children) {
            this.id=id;this.title=title;toggleKey=toggle;parameterKeys=parameters;
            this.comparison=comparison;noOpValue=noOp;this.children=children;
        }
        boolean hasConfiguration(){return parameterKeys.length>0||children.length>0;}
        List<String> allKeys(){List<String> keys=new ArrayList<>();if(toggleKey!=null)keys.add(toggleKey);keys.addAll(Arrays.asList(parameterKeys));for(Feature child:children)keys.addAll(child.allKeys());return keys;}
    }
    static final class Section {
        final String target,id,title;final List<Feature> features;
        Section(String target,String id,String title,Feature[] features){this.target=target;this.id=id;this.title=title;this.features=Collections.unmodifiableList(Arrays.asList(features));}
    }
    static List<Section> forTarget(String target){List<Section> result=new ArrayList<>();for(Section s:SECTIONS)if(s.target.equals(target))result.add(s);return result;}
    /** Related settings live in the corresponding status-bar editor tab. */
    static String statusBarDestination(Feature feature) {
        String key=feature.toggleKey==null?feature.parameterKeys[0]:feature.toggleKey;
        String suffix=key.substring(SystemUiOptions.PREFIX.length());
        if(suffix.startsWith("network_"))return "network";
        if(suffix.startsWith("metrics_"))return "metrics";
        if(suffix.startsWith("clock_"))return "clock";
        if(suffix.startsWith("battery_"))return "battery";
        if(suffix.startsWith("notification_"))return "notifications";
        if(suffix.startsWith("hide_")||suffix.startsWith("hidden_")||suffix.startsWith("signal_")
                ||suffix.equals("privacy_hide")||suffix.equals("ignore_system_icon_hide"))return "icons";
        return "layout";
    }
    static String objectGroup(Feature f){
        if(f.id.equals("systemui:qs_brightness_percent")||f.id.equals("systemui:qs_volume_percent"))return "亮度与音量";
        if(f.id.equals("systemui:qs_search")||f.id.equals("systemui:qs_browser"))return "搜索按钮";
        if(f.id.equals("systemui:notification_weather")||f.id.equals("systemui:qs_calendar")||f.id.startsWith("systemui:qs_clock_"))return "面板日期、天气与时钟";
        if(f.id.startsWith("systemui:lock_clock_"))return "锁屏时钟";
        if(f.id.startsWith("systemui:aod_"))return "息屏时钟";
        return "";
    }
    static List<Feature> forGroup(String group){
        Set<String> available=new HashSet<>();for(EnhancementOption o:EnhancementCatalog.group(group))available.add(o.key);
        List<Feature> result=new ArrayList<>();
        for(Section section:SECTIONS)for(Feature f:section.features)if(available.containsAll(f.allKeys())){result.add(f);available.removeAll(f.allKeys());}
        for(EnhancementOption o:EnhancementCatalog.group(group))if(available.contains(o.key))result.add(new Feature(o.key,o.title,o.kind==EnhancementOption.Kind.BOOLEAN?o.key:null,o.kind==EnhancementOption.Kind.BOOLEAN?new String[0]:new String[]{o.key},o.kind==EnhancementOption.Kind.INTEGER||o.kind==EnhancementOption.Kind.DECIMAL?"number":"trimmedString",o.defaultValue,new Feature[0]));
        return result;
    }
    static final Section[] SECTIONS={
        new Section("system","system","系统行为", new Feature[]{
            new Feature("ls_augment_rm_secure_capture","允许受限窗口截图和录屏","ls_augment_rm_secure_capture",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_strong_auth_timeout","取消每 72 小时强制验证密码","ls_augment_rm_strong_auth_timeout",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_lock_timeout_enabled","自定义锁屏息屏时间","ls_augment_rm_lock_timeout_enabled",new String[]{"ls_augment_rm_lock_timeout_seconds"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_notification_quiet_unlocked","亮屏解锁时通知静音","ls_augment_rm_notification_quiet_unlocked",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_overlay_notification_hide","隐藏悬浮窗常驻通知","ls_augment_rm_overlay_notification_hide",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_intent_hijack_disable","取消应用打开方式劫持","ls_augment_rm_intent_hijack_disable",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_untrusted_touch_allow","允许被悬浮窗遮挡的触摸","ls_augment_rm_untrusted_touch_allow",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_telemetry_disable","关闭原厂统计服务初始化","ls_augment_rm_telemetry_disable",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_power_default_assistant","长按电源打开默认助理","ls_augment_rm_power_default_assistant",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("system","audio","音量规则与档位", new Feature[]{
            new Feature("ls_augment_rm_audio_steps_alarm_enabled","自定义闹钟音量档数","ls_augment_rm_audio_steps_alarm_enabled",new String[]{"ls_augment_rm_audio_steps_alarm"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_audio_steps_media_enabled","自定义媒体音量档数","ls_augment_rm_audio_steps_media_enabled",new String[]{"ls_augment_rm_audio_steps_media"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_audio_steps_notification_enabled","自定义通知音量档数","ls_augment_rm_audio_steps_notification_enabled",new String[]{"ls_augment_rm_audio_steps_notification"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_audio_steps_ring_enabled","自定义铃声音量档数","ls_augment_rm_audio_steps_ring_enabled",new String[]{"ls_augment_rm_audio_steps_ring"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_audio_steps_call_enabled","自定义通话音量档数","ls_augment_rm_audio_steps_call_enabled",new String[]{"ls_augment_rm_audio_steps_call"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_audio_no_safe_warning","取消音量过高提示","ls_augment_rm_audio_no_safe_warning",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("system","connections","Wi-Fi、热点与飞行模式", new Feature[]{
            new Feature("ls_augment_rm_airplane_keep_bluetooth","飞行模式保留蓝牙","ls_augment_rm_airplane_keep_bluetooth",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_airplane_keep_wifi","飞行模式保留 Wi-Fi 和热点","ls_augment_rm_airplane_keep_wifi",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_wifi_country_enabled","自定义 Wi-Fi 国家码","ls_augment_rm_wifi_country_enabled",new String[]{"ls_augment_rm_wifi_country"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_wifi_mac_enabled","固定 Wi-Fi MAC 地址","ls_augment_rm_wifi_mac_enabled",new String[]{"ls_augment_rm_wifi_mac"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_hotspot_mac_enabled","固定热点 BSSID","ls_augment_rm_hotspot_mac_enabled",new String[]{"ls_augment_rm_hotspot_mac"},"boolean","0", new Feature[]{})
        }),
        new Section("system","installer","应用安装规则", new Feature[]{
            new Feature("ls_augment_rm_signature_min_v1","允许较旧的 APK 签名方案","ls_augment_rm_signature_min_v1",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("systemui","statusbar","状态栏细节", new Feature[]{
            new Feature("systemui:privacy_hide","隐藏隐私小绿点","ls_augment_rm_privacy_hide",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:signal_dual","双卡信号上下排列","ls_augment_rm_signal_dual",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:hide_wifi_activity","隐藏 Wi-Fi 收发箭头","ls_augment_rm_hide_wifi_activity",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:hide_wifi_standard","隐藏 Wi-Fi 标准数字","ls_augment_rm_hide_wifi_standard",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:hide_mobile_activity","隐藏移动网络收发箭头","ls_augment_rm_hide_mobile_activity",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:hide_mobile_type","隐藏移动网络类型","ls_augment_rm_hide_mobile_type",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:hide_hd_small","隐藏信号旁的 HD 小图标","ls_augment_rm_hide_hd_small",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:hide_hd_large","隐藏信号旁的 HD 大图标","ls_augment_rm_hide_hd_large",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:hide_sim1","隐藏卡 1 信号","ls_augment_rm_hide_sim1",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:hide_sim2","隐藏卡 2 信号","ls_augment_rm_hide_sim2",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:ignore_system_icon_hide","忽略系统图标隐藏限制","ls_augment_rm_ignore_system_icon_hide",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:hide_wifi_scope","隐藏 Wi-Fi 图标的位置",null,new String[]{"ls_augment_rm_hide_wifi_scope"},"number","0", new Feature[]{}),
            new Feature("systemui:hide_hotspot_scope","隐藏热点图标的位置",null,new String[]{"ls_augment_rm_hide_hotspot_scope"},"number","0", new Feature[]{}),
            new Feature("systemui:hide_mobile_scope","隐藏移动网络图标的位置",null,new String[]{"ls_augment_rm_hide_mobile_scope"},"number","0", new Feature[]{}),
            new Feature("systemui:hidden_icon_slots","其他隐藏图标",null,new String[]{"ls_augment_rm_hidden_icon_slots"},"nonEmptyCommaSeparatedTokens","", new Feature[]{}),
            new Feature("systemui:battery_style","电池样式",null,new String[]{"ls_augment_rm_battery_style"},"number","0", new Feature[]{}),
            new Feature("systemui:battery_hide_percent","隐藏电量百分号","ls_augment_rm_battery_hide_percent",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:battery_width_dp","电池固定宽度",null,new String[]{"ls_augment_rm_battery_width_dp"},"number","0", new Feature[]{}),
            new Feature("systemui:battery_alpha_percent","电池图标不透明度（%）",null,new String[]{"ls_augment_rm_battery_alpha_percent"},"number","100", new Feature[]{}),
            new Feature("systemui:battery_colors","按电量设置电池圆环颜色","ls_augment_rm_battery_colors",new String[]{"ls_augment_rm_battery_color_0","ls_augment_rm_battery_color_1","ls_augment_rm_battery_color_2","ls_augment_rm_battery_color_3","ls_augment_rm_battery_charging_color"},"boolean","0", new Feature[]{}),
            new Feature("systemui:battery_text_colors","按电量设置电量字体颜色","ls_augment_rm_battery_text_colors",new String[]{"ls_augment_rm_battery_text_color_0","ls_augment_rm_battery_text_color_1","ls_augment_rm_battery_text_color_2","ls_augment_rm_battery_text_color_3","ls_augment_rm_battery_text_charging_color"},"boolean","0", new Feature[]{}),
            new Feature("systemui:statusbar_double_tap_sleep","双击状态栏锁屏","ls_augment_rm_statusbar_double_tap_sleep",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:statusbar_hide","隐藏状态栏内容","ls_augment_rm_statusbar_hide",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:notification_native","恢复原生通知图标","ls_augment_rm_notification_native",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:statusbar_restore_font","恢复状态栏原生字体","ls_augment_rm_statusbar_restore_font",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:cutout_always","挖孔黑圈常显","ls_augment_rm_cutout_always",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:clock_milliseconds_refresh","启用时钟毫秒刷新","ls_augment_rm_clock_milliseconds_refresh",new String[]{"ls_augment_rm_clock_refresh_ms"},"boolean","0", new Feature[]{}),
            new Feature("systemui:network_custom","网速显示高级设置","ls_augment_rm_network_custom",new String[]{"ls_augment_rm_network_hide_below_kb","ls_augment_rm_network_digits","ls_augment_rm_network_unit","ls_augment_rm_network_width_dp"},"boolean","0", new Feature[]{
                new Feature("ls_augment_rm_network_per_second","网速显示 /s","ls_augment_rm_network_per_second",new String[]{},"boolean","0", new Feature[]{})
            }),
            new Feature("systemui:metrics_custom","温度与电量信息高级设置","ls_augment_rm_metrics_custom",new String[]{"ls_augment_rm_metric_prefix_cpu","ls_augment_rm_metric_width_cpu","ls_augment_rm_metric_prefix_gpu","ls_augment_rm_metric_width_gpu","ls_augment_rm_metric_prefix_battery_temp","ls_augment_rm_metric_width_battery_temp","ls_augment_rm_metric_prefix_current","ls_augment_rm_metric_width_current","ls_augment_rm_metric_prefix_power","ls_augment_rm_metric_width_power"},"boolean","0", new Feature[]{
                new Feature("ls_augment_rm_metrics_hide_units","温度与电量信息隐藏单位","ls_augment_rm_metrics_hide_units",new String[]{},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_metrics_charging_only","仅充电时显示电流和功率","ls_augment_rm_metrics_charging_only",new String[]{},"boolean","0", new Feature[]{})
            })
        }),
        new Section("systemui","quicksettings","控制中心", new Feature[]{
            new Feature("systemui:notification_weather","通知中心显示当日天气","ls_augment_rm_notification_weather",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:qs_brightness_percent","亮度显示百分比","ls_augment_rm_qs_brightness_percent",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:qs_volume_percent","音量显示百分比","ls_augment_rm_qs_volume_percent",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:qs_grid","自定义控制中心行列","ls_augment_rm_qs_grid",new String[]{"ls_augment_rm_qs_columns","ls_augment_rm_qs_rows","ls_augment_rm_qs_land_columns","ls_augment_rm_qs_land_rows","ls_augment_rm_qs_edit_columns","ls_augment_rm_qs_land_edit_columns"},"boolean","0", new Feature[]{}),
            new Feature("systemui:qs_carrier","运营商名称",null,new String[]{"ls_augment_rm_qs_carrier"},"number","0", new Feature[]{}),
            new Feature("systemui:qs_search","搜索按钮",null,new String[]{"ls_augment_rm_qs_search"},"number","0", new Feature[]{}),
            new Feature("systemui:qs_calendar","点击日期打开默认日历","ls_augment_rm_qs_calendar",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:qs_browser","搜索按钮打开指定应用",null,new String[]{"ls_augment_rm_qs_browser"},"trimmedString","", new Feature[]{}),
            new Feature("systemui:qs_clock_seconds","下拉面板时钟显示秒","ls_augment_rm_qs_clock_seconds",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:qs_clock_period","下拉面板时钟显示中文时段","ls_augment_rm_qs_clock_period",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("systemui","lockscreen","锁屏增强", new Feature[]{
            new Feature("systemui:keyguard_statusbar_hide","隐藏锁屏顶部状态栏","ls_augment_rm_keyguard_statusbar_hide",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:lock_clock_seconds","锁屏大时钟显示秒","ls_augment_rm_lock_clock_seconds",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:lock_clock_period","锁屏大时钟显示中文时段","ls_augment_rm_lock_clock_period",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:lock_clock_font","锁屏时钟字体文件",null,new String[]{"ls_augment_rm_lock_clock_font"},"trimmedString","", new Feature[]{}),
            new Feature("systemui:lock_clock_scale","锁屏时钟字体比例",null,new String[]{"ls_augment_rm_lock_clock_scale"},"number","1.0", new Feature[]{}),
            new Feature("systemui:charging_animation","自定义充电动画","ls_augment_rm_charging_animation",new String[]{"ls_augment_rm_charging_duration","ls_augment_rm_charging_delay"},"boolean","0", new Feature[]{
                new Feature("ls_augment_rm_charging_every_wake","每次亮屏显示充电动画","ls_augment_rm_charging_every_wake",new String[]{},"boolean","0", new Feature[]{})
            }),
            new Feature("systemui:lock_charge_details","锁屏显示充电详情","ls_augment_rm_lock_charge_details",new String[]{"ls_augment_rm_lock_charge_text_size","ls_augment_rm_lock_charge_line_gap","ls_augment_rm_lock_charge_interval"},"boolean","0", new Feature[]{
                new Feature("ls_augment_rm_lock_charge_hide_temperature","充电详情隐藏温度","ls_augment_rm_lock_charge_hide_temperature",new String[]{},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_lock_charge_hide_current","充电详情隐藏电流","ls_augment_rm_lock_charge_hide_current",new String[]{},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_lock_charge_hide_voltage","充电详情隐藏电压","ls_augment_rm_lock_charge_hide_voltage",new String[]{},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_lock_charge_hide_power","充电详情隐藏功率","ls_augment_rm_lock_charge_hide_power",new String[]{},"boolean","0", new Feature[]{})
            })
        }),
        new Section("systemui","aod","息屏显示", new Feature[]{
            new Feature("systemui:aod_seconds","息屏时钟显示秒","ls_augment_rm_aod_seconds",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:aod_period","息屏时钟显示中文时段","ls_augment_rm_aod_period",new String[]{"ls_augment_rm_aod_period_scale"},"boolean","0", new Feature[]{}),
            new Feature("systemui:aod_clock_font","息屏时钟字体",null,new String[]{"ls_augment_rm_aod_clock_font"},"trimmedString","", new Feature[]{}),
            new Feature("systemui:aod_clock_scale","息屏时钟字体比例",null,new String[]{"ls_augment_rm_aod_clock_scale"},"number","1.0", new Feature[]{})
        }),
        new Section("systemui","volume_panel","音量面板与按键", new Feature[]{
            new Feature("systemui:lock_volume","锁屏时允许调节音量","ls_augment_rm_lock_volume",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:audio_no_long_press_vibrate","取消长按音量键振动","ls_augment_rm_audio_no_long_press_vibrate",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("systemui","interaction","手势、单手模式与剪贴板", new Feature[]{
            new Feature("systemui:clipboard_overlay","恢复原生剪贴板浮窗","ls_augment_rm_clipboard_overlay",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("systemui:onehand_adjust","调整单手模式位置","ls_augment_rm_onehand_adjust",new String[]{"ls_augment_rm_onehand_offset"},"boolean","0", new Feature[]{}),
            new Feature("systemui:assist_gesture","手势使用默认数字助理","ls_augment_rm_assist_gesture",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("systemui","usb","USB 连接", new Feature[]{
            new Feature("systemui:usb_auto_authorize","自动允许 USB 调试授权","ls_augment_rm_usb_auto_authorize",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("settings","display_time","显示与时间", new Feature[]{
            new Feature("ls_augment_rm_settings_long_timeout","扩展自动息屏时间选项","ls_augment_rm_settings_long_timeout",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_settings_hide_battery_percent","隐藏系统电量百分比设置项","ls_augment_rm_settings_hide_battery_percent",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_settings_time_period","系统时间选择器显示中文时段","ls_augment_rm_settings_time_period",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("settings","usb","USB 连接", new Feature[]{
            new Feature("ls_augment_rm_usb_install_no_account","USB 安装免账号验证","ls_augment_rm_usb_install_no_account",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_usb_mode_enabled","指定 USB 默认用途","ls_augment_rm_usb_mode_enabled",new String[]{"ls_augment_rm_usb_mode"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_usb_hide_dialog","连接 USB 时不弹出用途选择","ls_augment_rm_usb_hide_dialog",new String[]{},"boolean","0", new Feature[]{
                new Feature("ls_augment_rm_usb_hide_notification_dialog","同时隐藏通知中的 USB 用途选择","ls_augment_rm_usb_hide_notification_dialog",new String[]{},"boolean","0", new Feature[]{})
            })
        }),
        new Section("launcher","launcher","桌面页面", new Feature[]{
            new Feature("ls_augment_rm_launcher_page_reorder","整页移动桌面","ls_augment_rm_launcher_page_reorder",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_launcher_keep_empty","允许空白桌面","ls_augment_rm_launcher_keep_empty",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("launcher","desktop_clock","桌面时钟", new Feature[]{
            new Feature("ls_augment_rm_desktop_clock_enabled","桌面时钟增强","ls_augment_rm_desktop_clock_enabled",new String[]{"ls_augment_rm_desktop_clock_pattern"},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_desktop_clock_period","桌面时钟显示中文时段","ls_augment_rm_desktop_clock_period",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("launcher","recents","最近任务内存信息", new Feature[]{
            new Feature("ls_augment_rm_recents_memory_custom","自定义最近任务内存显示","ls_augment_rm_recents_memory_custom",new String[]{"ls_augment_rm_recents_memory_style","ls_augment_rm_recents_memory_content","ls_augment_rm_recents_memory_color_mode","ls_augment_rm_recents_memory_light_color","ls_augment_rm_recents_memory_dark_color","ls_augment_rm_recents_memory_simple_size","ls_augment_rm_recents_memory_detailed_size","ls_augment_rm_recents_memory_portrait_left","ls_augment_rm_recents_memory_landscape_left","ls_augment_rm_recents_memory_portrait_top","ls_augment_rm_recents_memory_landscape_top","ls_augment_rm_recents_memory_portrait_height","ls_augment_rm_recents_memory_landscape_height"},"boolean","0", new Feature[]{})
        }),
        new Section("game","shoulder","肩键方案", new Feature[]{
            new Feature("ls_augment_tgk_quick_switch","肩键方案快捷切换","ls_augment_tgk_quick_switch",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("game","combo","连招录制与循环", new Feature[]{
            new Feature("ls_augment_combo_extended_limits","扩展连招循环设置","ls_augment_combo_extended_limits",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("game","performance","游戏面板与性能模式", new Feature[]{
            new Feature("ls_augment_game_hide_diablo_dialog","隐藏破坏神模式提示","ls_augment_game_hide_diablo_dialog",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_game_prevent_panel_collapse","切换模式时保持游戏面板","ls_augment_game_prevent_panel_collapse",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_game_remember_active","记住活跃模式","ls_augment_game_remember_active",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_game_all_ratios","开放全部游戏画面比例","ls_augment_game_all_ratios",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("game","plugins","游戏插件", new Feature[]{
            new Feature("ls_augment_game_plugins_unlocked","开放游戏插件资格","ls_augment_game_plugins_unlocked",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("game","game_capture","录制、高光与红魔时刻", new Feature[]{
            new Feature("ls_augment_game_free_record","随心录制模式解限","ls_augment_game_free_record",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_game_highlights_unlocked","开放游戏高光","ls_augment_game_highlights_unlocked",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_game_redmagic_time_unlocked","红魔时刻模式解限","ls_augment_game_redmagic_time_unlocked",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("theme","theme","主题下载", new Feature[]{
            new Feature("ls_augment_rm_theme_no_login","主题下载免登录","ls_augment_rm_theme_no_login",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("installer","installer","应用安装规则", new Feature[]{
            new Feature("ls_augment_rm_installer_skip_scan","跳过安装包扫描","ls_augment_rm_installer_skip_scan",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_installer_hide_purify","隐藏纯净模式选项","ls_augment_rm_installer_hide_purify",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_installer_hide_store","隐藏应用商店推荐","ls_augment_rm_installer_hide_store",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_installer_cts","使用简洁安装界面","ls_augment_rm_installer_cts",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("update","update","系统更新", new Feature[]{
            new Feature("ls_augment_rm_ota_block","阻止系统更新安装","ls_augment_rm_ota_block",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_ota_capture_url","提取系统更新链接","ls_augment_rm_ota_capture_url",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_ota_spoof_enabled","自定义更新应用读取的设备信息","ls_augment_rm_ota_spoof_enabled",new String[]{},"boolean","0", new Feature[]{
                new Feature("ls_augment_rm_ota_model_enabled","修改型号","ls_augment_rm_ota_model_enabled",new String[]{"ls_augment_rm_ota_model"},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_ota_imei_enabled","修改设备标识","ls_augment_rm_ota_imei_enabled",new String[]{"ls_augment_rm_ota_imei"},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_ota_locale_enabled","修改地区","ls_augment_rm_ota_locale_enabled",new String[]{"ls_augment_rm_ota_locale"},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_ota_signature_enabled","修改签名版本","ls_augment_rm_ota_signature_enabled",new String[]{"ls_augment_rm_ota_signature"},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_ota_fingerprint_enabled","修改系统指纹","ls_augment_rm_ota_fingerprint_enabled",new String[]{"ls_augment_rm_ota_fingerprint"},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_ota_display_enabled","修改显示版本","ls_augment_rm_ota_display_enabled",new String[]{"ls_augment_rm_ota_display"},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_ota_internal_enabled","修改内部版本","ls_augment_rm_ota_internal_enabled",new String[]{"ls_augment_rm_ota_internal"},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_ota_variant_enabled","修改版本变体","ls_augment_rm_ota_variant_enabled",new String[]{"ls_augment_rm_ota_variant"},"boolean","0", new Feature[]{}),
                new Feature("ls_augment_rm_ota_manufacturer_enabled","修改制造商","ls_augment_rm_ota_manufacturer_enabled",new String[]{"ls_augment_rm_ota_manufacturer"},"boolean","0", new Feature[]{})
            })
        }),
        new Section("weather","weather","天气时间", new Feature[]{
            new Feature("ls_augment_rm_weather_time_period","天气显示中文时段","ls_augment_rm_weather_time_period",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("nfc","nfc","NFC 识别", new Feature[]{
            new Feature("ls_augment_rm_nfc_mute","NFC 识别静音","ls_augment_rm_nfc_mute",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_nfc_screen_off","允许 NFC 息屏识别","ls_augment_rm_nfc_screen_off",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("files","mtp","电脑文件传输", new Feature[]{
            new Feature("ls_augment_rm_mtp_hide_category","隐藏 MTP 分类浏览","ls_augment_rm_mtp_hide_category",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_mtp_name_enabled","自定义 MTP 存储名称","ls_augment_rm_mtp_name_enabled",new String[]{"ls_augment_rm_mtp_name"},"boolean","0", new Feature[]{})
        }),
        new Section("permissions","default_apps","默认应用", new Feature[]{
            new Feature("ls_augment_rm_third_party_launcher","允许设置第三方默认桌面","ls_augment_rm_third_party_launcher",new String[]{},"boolean","0", new Feature[]{})
        }),
        new Section("screenshot","capture","截图与录屏画面", new Feature[]{
            new Feature("ls_augment_rm_screenshot_hide_status_bar","截图隐藏状态栏","ls_augment_rm_screenshot_hide_status_bar",new String[]{},"boolean","0", new Feature[]{}),
            new Feature("ls_augment_rm_record_hide_status_bar","录屏隐藏状态栏","ls_augment_rm_record_hide_status_bar",new String[]{},"boolean","0", new Feature[]{})
        })
    };
}
