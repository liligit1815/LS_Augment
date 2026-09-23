package ls.augment.com;

import java.util.*;

/** System and OEM application additions; existing LS policies retain their keys. */
public final class SystemOptions {
    public static final String PREFIX="ls_augment_rm_";
    public static String key(String suffix){return PREFIX+suffix;}
    public static final String NO_SAFE_WARNING=key("audio_no_safe_warning");
    private SystemOptions() { }
    public static List<EnhancementOption> options() {
        List<EnhancementOption> o=new ArrayList<>();
        String[][] switches={
            {"secure_capture","system","允许受限窗口截图和录屏","允许捕获设置了禁止截图标记的窗口。"},
            {"screenshot_hide_status_bar","system","截图隐藏状态栏","仅从原厂截图结果中排除状态栏，手机上的显示保持正常。"},
            {"record_hide_status_bar","system","录屏隐藏状态栏","原厂录屏期间隐藏画面中的状态栏。截图和录屏同时进行时，任一隐藏选项生效都会同时影响两者。"},
            {"strong_auth_timeout","system","取消每 72 小时强制验证密码","取消周期性强认证超时，开机首次解锁仍按原厂规则。"},
            {"lock_timeout_enabled","system","自定义锁屏息屏时间","仅在锁屏时使用下面的等待时间。"},
            {"notification_quiet_unlocked","system","亮屏解锁时通知静音","屏幕亮起且已解锁时，通知不播放声音和振动。"},
            {"overlay_notification_hide","system","隐藏悬浮窗常驻通知","隐藏应用正在其他应用上层显示的常驻提示。"},
            {"intent_hijack_disable","system","取消应用打开方式劫持","使用正常的应用选择与默认打开流程。"},
            {"untrusted_touch_allow","system","允许被悬浮窗遮挡的触摸","允许触摸穿过原厂判定为遮挡的窗口。"},
            {"telemetry_disable","system","关闭原厂统计服务初始化","针对已识别的两类红魔统计服务。"},
            {"power_default_assistant","system","长按电源打开默认助理","保留原厂关机菜单选择，助理动作使用系统默认助理。"},
            {"airplane_keep_bluetooth","connections","飞行模式保留蓝牙","进入飞行模式时保留蓝牙状态。"},
            {"airplane_keep_wifi","connections","飞行模式保留 Wi-Fi 和热点","保持现有无线局域网连接状态。"},
            {"wifi_country_enabled","connections","自定义 Wi-Fi 国家码","启用下面填写的两位国家码。"},
            {"wifi_mac_enabled","connections","固定 Wi-Fi MAC 地址","在无线接口设置地址时使用指定地址。"},
            {"hotspot_mac_enabled","connections","固定热点 BSSID","在热点接口设置地址时使用指定地址。"},
            {"usb_install_no_account","connections","USB 安装免账号验证","取消原厂 USB 安装的账号验证步骤。"},
            {"usb_auto_authorize","connections","自动允许 USB 调试授权","收到 USB 调试授权请求时允许连接。"},
            {"usb_mode_enabled","connections","指定 USB 默认用途","插入 USB 时使用指定用途。"},
            {"usb_hide_dialog","connections","连接 USB 时不弹出用途选择","仍可从通知进入 USB 设置。"},
            {"usb_hide_notification_dialog","connections","同时隐藏通知中的 USB 用途选择","需同时开启连接 USB 时不弹出用途选择；关闭此项保留通知中的手动入口。"},
            {"nfc_mute","connections","NFC 识别静音","不播放 NFC 识别提示音。"},
            {"nfc_screen_off","connections","允许 NFC 息屏识别","保持息屏时的 NFC 标签识别能力。"},
            {"mtp_hide_category","connections","隐藏 MTP 分类浏览","电脑连接时仅显示常规存储浏览入口。"},
            {"mtp_name_enabled","connections","自定义 MTP 存储名称","电脑连接时显示下面的存储名称。"},
            {"installer_skip_scan","installer","跳过安装包扫描","安装器直接进入安装确认流程。"},
            {"installer_hide_purify","installer","隐藏纯净模式选项","隐藏安装界面的纯净模式入口。"},
            {"installer_hide_store","installer","隐藏应用商店推荐","隐藏安装界面的应用商店引导。"},
            {"installer_cts","installer","使用简洁安装界面","使用原厂提供的 CTS 安装界面。"},
            {"signature_min_v1","installer","允许较旧的 APK 签名方案","放宽最低签名方案要求，与 LS 的不同签名覆盖安装分别控制。"},
            {"ota_block","update","阻止系统更新安装","阻止系统更新应用发起安装。"},
            {"ota_capture_url","update","提取系统更新链接","更新应用准备安装时提取它实际使用的更新链接。"},
            {"ota_spoof_enabled","update","自定义更新应用读取的设备信息","仅对系统更新应用生效；空白字段保持原值。"},
            {"theme_no_login","theme","主题下载免登录","取消原厂主题、壁纸与息屏资源下载入口的登录要求。"},
            {"third_party_launcher","launcher","允许设置第三方默认桌面","放宽原厂默认桌面的选择限制。"},
            {"settings_long_timeout","system","扩展自动息屏时间选项","恢复原厂较长等待时间与从不选项。"},
            {"settings_hide_battery_percent","system","隐藏系统电量百分比设置项","仅隐藏系统设置中的入口，电池显示继续由 LS 配置。"},
            {"settings_time_period","system","系统时间选择器显示中文时段","在时间选择与摘要中显示凌晨、清晨等时段。"},
            {"desktop_clock_enabled","launcher","桌面时钟增强","为原厂桌面时钟使用下面的时间格式。"},
            {"weather_time_period","launcher","天气显示中文时段","仅旧版桌面天气时钟组件：把上午／下午细分为凌晨、早上、上午、中午、下午、傍晚、晚上。当前红魔新版组件由“桌面时钟显示中文时段”控制；此项不会向通知中心添加天气。"}
        };
        for(String[] s:switches)o.add(EnhancementOption.toggle(key(s[0]),s[1],s[2],s[3]));
        o.add(EnhancementOption.integer(key("lock_timeout_seconds"),"system","锁屏息屏时间（秒）","修改后在下一次锁屏等待中使用。",15,1,86400));
        String[] streams={"alarm","media","notification","ring","call"};
        String[] labels={"闹钟","媒体","通知","铃声","通话"};
        for(int i=0;i<streams.length;i++) {
            String gainNote=streams[i].equals("notification")||streams[i].equals("call")
                    ?"音量增强不为此类型追加档位。":"音量增强超过 100% 时会追加档位，面板总数会大于基础档数。";
            o.add(EnhancementOption.toggle(key("audio_steps_"+streams[i]+"_enabled"),"audio","自定义"+labels[i]+"音量档数","调整基础音量档数，修改后需重启手机。"+gainNote));
            o.add(EnhancementOption.integer(key("audio_steps_"+streams[i]),"audio",labels[i]+"音量档数","设置达到原厂音量上限前的基础档数，需开启对应开关并重启手机。"+gainNote,15,1,200));
        }
        o.add(EnhancementOption.custom(key("wifi_country"),"connections","Wi-Fi 国家码","填写两个英文字母。","CN",v->v.matches("[A-Za-z]{2}")?v.toUpperCase(Locale.ROOT):null));
        for(String suffix:new String[]{"wifi_mac","hotspot_mac"})o.add(EnhancementOption.custom(key(suffix),"connections",suffix.equals("wifi_mac")?"Wi-Fi MAC 地址":"热点 BSSID","格式：02:12:34:56:78:9A；空白不修改。","",SystemOptions::normalizeMac));
        o.add(EnhancementOption.choice(key("usb_mode"),"connections","USB 默认用途","插入 USB 时使用；从通知打开仍可手动选择。",0,"仅充电","文件传输","照片传输","多屏投屏"));
        o.add(EnhancementOption.text(key("mtp_name"),"connections","MTP 存储名称","应用于手机主存储。","内部存储",80));
        String[] fields={"model","imei","locale","signature","fingerprint","display","internal","variant","manufacturer"};
        String[] names={"型号","设备标识","地区","签名版本","系统指纹","显示版本","内部版本","版本变体","制造商"};
        for(int i=0;i<fields.length;i++) {
            o.add(EnhancementOption.toggle(key("ota_"+fields[i]+"_enabled"),"update","修改"+names[i],"仅在设备信息总开关启用时生效。"));
            o.add(EnhancementOption.text(key("ota_"+fields[i]),"update",names[i],"留空保持更新应用读取的原值。","",512));
        }
        o.add(EnhancementOption.custom(key("desktop_clock_pattern"),"launcher","桌面时钟格式","HH:mm:ss 显示秒，HH:mm 隐藏秒，hh 使用十二小时制。","HH:mm:ss",ConnectionExtrasPolicy::normalizeClockPattern));
        o.add(EnhancementOption.toggle(key("desktop_clock_period"),"launcher","桌面时钟显示中文时段","为原厂时段控件显示凌晨、早上、上午等时段。"));
        return Collections.unmodifiableList(o);
    }
    public static String normalizeMac(String value) {
        if(value.isEmpty())return value;
        if(!value.matches("[0-9A-Fa-f]{2}(:[0-9A-Fa-f]{2}){5}"))return null;
        if((Integer.parseInt(value.substring(0,2),16)&1)!=0||value.equalsIgnoreCase("00:00:00:00:00:00"))return null;
        return value.toUpperCase(Locale.ROOT);
    }
}
