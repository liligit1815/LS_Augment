package ls.augment.com;

import java.util.Arrays;

/** One navigation model for the status bar; every page edits existing runtime settings. */
final class StatusBarPages {
    static final String[] ROUTES={"status_arrangement","status_clock","status_notifications","status_metrics","status_network","status_battery","status_icons","status_assets"};
    static final String[] TITLES={"排列与间距","时钟","通知图标","实时指标","网络与信号","电池与三合一","系统图标与隐私","图标素材与字体"};
    static final String[] SUMMARIES={"预设、组件位置与顺序、高度和留白","日期、秒与毫秒、单双排和文字样式","显示数量、单双排和原生样式","CPU / GPU 温度、电池温度、电流与功率","Wi-Fi、双卡信号、收发箭头和网速","原生电池、三合一和电量样式","蓝牙样式、图标隐藏和隐私提示","按显示位置设置素材、字体与额外隐藏"};
    static final String[] GROUP_TITLES={"布局","状态栏内容","系统图标","外观资源"};
    static final String[][] GROUP_ROUTES={{"status_arrangement"},{"status_clock","status_notifications","status_metrics"},{"status_network","status_battery","status_icons"},{"status_assets"}};
    private StatusBarPages(){}
    static boolean editor(String route){return "status_layout".equals(route)||"status_surfaces".equals(route)||surface(route)!=null||Arrays.asList(ROUTES).contains(route)&&!"status_assets".equals(route);}
    static String title(String route){
        if("status_layout".equals(route))return "状态栏自定义";
        if("status_surfaces".equals(route))return "按显示位置配置";
        String surface=surface(route);if(surface!=null)return StatusBarSurfaceSpec.label(surface);
        for(int i=0;i<ROUTES.length;i++)if(ROUTES[i].equals(route))return TITLES[i];return "";
    }
    static String surface(String route){if(route==null||!route.startsWith("status_surface/"))return null;String value=route.substring(15);return StatusBarSurfaceSpec.valid(value)?value:null;}
    static int tab(String route){switch(route){case "status_clock":return 1;case "status_notifications":return 2;case "status_metrics":return 3;case "status_icons":return 4;case "status_battery":return 5;case "status_network":return 6;default:return 0;}}
    static String componentRoute(String id){if("clock".equals(id))return "status_clock";if("notifications".equals(id))return "status_notifications";if("battery".equals(id)||"connectivity".equals(id))return "status_battery";if("network".equals(id)||networkIcon(id)||"mobile".equals(id))return "status_network";if("system_icons".equals(id))return "status_icons";return "status_metrics";}
    static boolean networkIcon(String id){return id!=null&&(id.startsWith("wifi")||id.startsWith("secondary_wifi")||id.startsWith("mobile")||"dual_signal".equals(id)||"hotspot".equals(id));}
    static String destination(NativeFeatureGroups.Feature feature){
        if("systemui:statusbar_double_tap_sleep".equals(feature.id))return "gesture";
        String existing=NativeFeatureGroups.statusBarDestination(feature);
        String key=feature.toggleKey==null?feature.parameterKeys[0]:feature.toggleKey;
        if("icons".equals(existing)&&(key.contains("signal_")||key.contains("hide_wifi")||key.contains("hide_mobile")||key.contains("hide_hd")||key.contains("hide_sim")||key.contains("hide_hotspot")))return "network";
        if(key.endsWith("statusbar_restore_font"))return "clock";
        return existing;
    }
}
