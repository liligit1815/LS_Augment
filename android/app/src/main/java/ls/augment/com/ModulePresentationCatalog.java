package ls.augment.com;

import java.util.*;

/** Approved V2.0 task-oriented categories. Runtime packages stay in HookAppCatalog. */
public final class ModulePresentationCatalog {
    private ModulePresentationCatalog() { }
    public static final class Category {
        public final String id,title,summary,icon,restartScope;
        /** V2 workbook baseline plus implemented additions; parameters are not separate capabilities. */
        public final int featureCount;
        private Category(String id,String title,String summary,String icon,String scope,int count){this.id=id;this.title=title;this.summary=summary;this.icon=icon;restartScope=scope;featureCount=count;}
        public String route(){return "target-"+id;}
    }
    public static final class Related {
        public final String title,summary,route;
        private Related(String title,String summary,String route){this.title=title;this.summary=summary;this.route=route;}
    }
    private static final List<Category> CATEGORIES=Collections.unmodifiableList(Arrays.asList(
        new Category("notifications","通知与控制中心","状态栏、灵动岛、通知提醒与控制中心布局","systemui","systemui",84),
        new Category("desktop","桌面与最近任务","默认桌面、布局、图标、组件与最近任务","launcher",null,18),
        new Category("lockscreen","主题与锁屏","主题下载、联名主题、锁屏上滑与息屏显示","theme","device",24),
        new Category("audio","声音与音量","铃声素材、音量面板、增益与档数","system",null,11),
        new Category("interaction","操作与手势","返回、电源、助理、单手模式与剪贴板","systemui",null,8),
        new Category("multitasking","小窗与多任务","跨应用跳转、小窗数量、应用范围与触摸","system","device",5),
        new Category("atomic_workbench","红魔Step","全局手势、嵌入桌面、主侧窗口与任务恢复","system","device",1),
        new Category("capture","相册与编辑","相册水印、图片编辑、截图与录屏","screenshot",null,6),
        new Category("gaming","游戏空间","AI 触发器、肩键、连招、性能与游戏录制","game","games",18),
        new Category("cooling","散热风扇","转速测量、固定档位、磁贴与息屏运行","fan","games",4),
        new Category("connectivity","网络与连接","USB 文件传输、调试、NFC、Wi-Fi 与飞行模式","files",null,16),
        new Category("apps","应用管理","安装、下载、双开、默认打开与应用隐藏","installer",null,15),
        new Category("system_settings","系统设置","系统更新、竞技键、电池与显示休眠","settings",null,14),
        new Category("health","小米运动健康","账号绑定、步数倍率、随机计划与每日上限","health","apps",4)
    ));
    public static List<Category> categories(){return CATEGORIES;}
    public static Category find(String id){for(Category category:CATEGORIES)if(category.id.equals(id))return category;return null;}
    /** Related links explain other homes; they never duplicate a control in this category. */
    public static List<Related> related(String requested){
        String route=ModuleHierarchy.resolve(requested);
        if(Arrays.asList("status_layout","status_arrangement","status_icons").contains(route))return Arrays.asList(
            new Related("截图与录屏中的状态栏","只影响捕获结果，请到相册与编辑设置","group/capture/capture"),
            new Related("锁屏顶部状态栏","只影响锁屏画面，请到锁屏显示设置","group/lockscreen/lock_display"),
            new Related("双击状态栏锁屏","手势操作归入操作与手势","group/interaction/status_gestures"));
        if("target-connectivity".equals(route)||"group/connectivity/usb".equals(route)||"group/connectivity/usb_debug".equals(route))return Collections.singletonList(
            new Related("开发者选项总开关","开发者选项的整体开关位于系统设置","group/system_settings/developer"));
        if("target-gaming".equals(route))return Arrays.asList(
            new Related("登录跳转小窗","跨应用窗口行为归入小窗与多任务","freeform_rules"),
            new Related("散热风扇","转速和息屏运行在独立风扇分组设置","fan_control"));
        if("target-lockscreen".equals(route)||"group/lockscreen/collab_theme".equals(route))return Collections.singletonList(
            new Related("联名铃声素材","铃声、通知音和闹钟归入声音与音量","group/audio/collab_audio"));
        if("target-system_settings".equals(route)||"group/system_settings/developer".equals(route))return Collections.singletonList(
            new Related("USB 连接与调试","USB 用途、文件传输和调试归入网络与连接","group/connectivity/usb"));
        if("target-audio".equals(route))return Collections.singletonList(
            new Related("亮屏解锁时通知静音","通知何时提醒归入通知与控制中心","group/notifications/notification_alerts"));
        if("target-notifications".equals(route))return Arrays.asList(
            new Related("完整亮度","显示亮度范围归入系统设置","group/system_settings/display"),
            new Related("面板音量百分比","音量相关显示归入声音与音量","group/audio/volume_panel"));
        return Collections.emptyList();
    }
}
