package ls.augment.com;

import java.util.*;

/** User-facing navigation. HookAppCatalog remains the separate runtime/scope inventory. */
public final class ModuleHierarchy {
    private ModuleHierarchy() { }
    public static final class Section {
        /** target is a presentation category, never a hook process id. */
        public final String target,id,title,parentId;
        public final boolean restricted;
        public final List<NativeFeatureGroups.Feature> features=new ArrayList<>();
        public final List<String> entries=new ArrayList<>(),deviceSettings=new ArrayList<>();
        Section(String target,String id,String title,String parentId,boolean restricted){this.target=target;this.id=id;this.title=title;this.parentId=parentId;this.restricted=restricted;}
        public String route(){return "group/"+target+"/"+id;}
    }
    private static final Map<String,Section> GROUPS=new LinkedHashMap<>();
    private static final Map<String,NativeFeatureGroups.Feature> FEATURES=new LinkedHashMap<>();
    private static final Map<String,String> KEY_ROUTES=new LinkedHashMap<>(),ENTRY_PARENTS=new LinkedHashMap<>(),ALIASES=new LinkedHashMap<>();
    private static final List<NativeFeatureGroups.Feature> STATUS_FEATURES=new ArrayList<>();
    private static final Set<String> INLINE=new HashSet<>(Arrays.asList("launcher_custom","audio_gain","signature_install","shoulder","combo_speed","super_resolution","extra_dim"));
    static {
        for(NativeFeatureGroups.Section s:NativeFeatureGroups.SECTIONS)for(NativeFeatureGroups.Feature f:s.features)FEATURES.put(f.id,f);
        entry(section("notifications","statusbar","状态栏自定义"),"status_layout");
        for(NativeFeatureGroups.Feature f:NativeFeatureGroups.forGroup("statusbar")){
            if("systemui:statusbar_double_tap_sleep".equals(f.id))continue;
            STATUS_FEATURES.add(f);for(String key:f.allKeys())KEY_ROUTES.put(key,statusRoute(f));
        }
        add(section("notifications","island","灵动岛"),"systemui:island_enabled");
        add(section("notifications","notification_display","通知展示"),"systemui:notification_media_hide","systemui:notification_stack","systemui:notification_clear","ls_augment_rm_overlay_notification_hide");
        add(section("notifications","center_layout","控制中心外观与布局"),"systemui:liquid_glass","systemui:qs_grid","systemui:cc_corners","systemui:cc_tiles","systemui:cc_media");
        source(section("notifications","notification_clock","通知页大时钟与布局"),"systemui","notification_clock");
        add(section("notifications","panel_clock","面板日期、天气与时钟"),"systemui:notification_weather","systemui:qs_calendar","systemui:qs_clock_seconds","systemui:qs_clock_period");
        Section tiles=section("notifications","brightness_tiles","亮度条与通用磁贴");add(tiles,"systemui:qs_brightness_percent");entry(tiles,"extra_dim");
        add(section("notifications","panel_carrier_search","面板运营商与搜索"),"systemui:qs_carrier","systemui:carrier_notification","systemui:carrier_control","systemui:qs_search","systemui:qs_browser");
        add(section("notifications","notification_alerts","通知提醒"),"ls_augment_rm_notification_quiet_unlocked");
        add(section("desktop","default_launcher","默认桌面"),"ls_augment_rm_third_party_launcher","ls_augment_rm_third_party_recents_no_scrim");
        add(section("desktop","desktop_clock","桌面组件"),"ls_augment_rm_desktop_clock_enabled","ls_augment_rm_desktop_clock_period","ls_augment_rm_weather_time_period",LauncherOptions.WIDGET_RESIZE);
        add(section("desktop","launcher_grid","桌面布局与页面"),"launcher:launcher_grid","ls_augment_rm_launcher_page_reorder","ls_augment_rm_launcher_keep_empty",LauncherOptions.NEW_APPS_LAST_PAGE);
        Section icons=section("desktop","launcher","图标与名称");add(icons,"launcher:hide_minors");entry(icons,"launcher_custom");
        add(section("desktop","dock_glass","Dock"),"launcher:liquid_glass",LauncherOptions.DOCK_UNLIMITED);
        add(section("desktop","recents","最近任务与清理"),"launcher:cleanup_bomb",RecentsCardRadiusOptions.ENABLED,"ls_augment_rm_recents_memory_custom");
        add(section("lockscreen","theme_download","主题下载与使用"),"beautify:unlimited_trial","ls_augment_rm_theme_no_login");
        add(section("lockscreen","collab_theme","联名主题"),"collab:theme");
        source(section("lockscreen","fingerprint","指纹样式"),"theme","collab_fingerprint");
        add(section("lockscreen","charging","充电动画与详情"),"collab:charging","systemui:charging_animation","systemui:lock_charge_details");
        add(section("lockscreen","lock_display","锁屏显示"),"systemui:keyguard_statusbar_hide","systemui:carrier_lock");
        add(section("lockscreen","liftarc","锁屏上滑效果"),"liftarc:enabled");
        add(section("lockscreen","lock_clock","锁屏时钟"),"systemui:lock_clock_seconds","systemui:lock_clock_period","systemui:lock_clock_font","systemui:lock_clock_scale");
        source(section("lockscreen","aod","息屏时钟"),"systemui","aod");
        add(section("lockscreen","lock_timeout","锁屏超时与解锁验证"),"ls_augment_rm_strong_auth_timeout","ls_augment_rm_lock_timeout_enabled");
        section("audio","collab_audio","铃声素材");
        add(section("audio","volume_panel","音量面板与按键"),"systemui:lock_volume","systemui:audio_no_long_press_vibrate","systemui:qs_volume_percent");
        Section gain=section("audio","audio_gain","音量增强");add(gain,"ls_augment_rm_audio_no_safe_warning");entry(gain,"audio_gain");
        add(section("audio","audio_steps","各类音量档数"),"ls_augment_rm_audio_steps_alarm_enabled","ls_augment_rm_audio_steps_media_enabled","ls_augment_rm_audio_steps_notification_enabled","ls_augment_rm_audio_steps_ring_enabled","ls_augment_rm_audio_steps_call_enabled");
        add(section("interaction","status_gestures","状态栏手势"),"systemui:statusbar_double_tap_sleep");
        source(section("interaction","power","电源菜单"),"systemui","power");source(section("interaction","gestures","返回手势"),"systemui","gestures");
        add(section("interaction","clipboard","剪贴板"),"systemui:clipboard_overlay","ls_augment_rm_sms_code_clipboard");
        add(section("interaction","onehand","单手模式"),"systemui:onehand_adjust");
        add(section("interaction","assistant","数字助理唤起"),"systemui:assist_gesture","ls_augment_rm_power_default_assistant");
        entry(section("multitasking","freeform_rules","跨应用跳转规则"),"freeform_rules");
        entry(section("multitasking","freeform_limits","小窗数量与应用范围"),"freeform_limits");
        add(section("multitasking","overlay_touch","悬浮窗触摸"),"ls_augment_rm_untrusted_touch_allow");
        entry(section("atomic_workbench","workspace","红魔Step"),"atomic_workbench");
        source(section("capture","capture","捕获画面"),"screenshot","capture");
        source(section("capture","image_edit","图片编辑"),"gallery","image_edit");
        add(section("capture","secure_capture","窗口捕获限制"),"ls_augment_rm_secure_capture");
        entry(section("gaming","ai","AI 触发器"),"ai_trigger");
        Section shoulder=section("gaming","shoulder","肩键与极速连点");source(shoulder,"game","shoulder");entry(shoulder,"shoulder");
        Section combo=section("gaming","combo","一键连招");source(combo,"game","combo");entry(combo,"combo_speed");
        Section performance=section("gaming","performance","性能与画质");source(performance,"game","performance");entry(performance,"super_resolution");
        source(section("gaming","plugins","游戏插件"),"game","plugins");
        source(section("gaming","game_capture","游戏录制、高光与红魔时刻"),"game","game_capture");
        entry(section("cooling","fan","散热风扇"),"fan_control");
        Section usb=section("connectivity","usb","USB 连接");
        source(child(usb,"usb_mtp","文件传输（MTP）"),"files","mtp");
        Section debugging=child(usb,"usb_debug","调试与安装");add(debugging,"systemui:usb_auto_authorize","ls_augment_rm_usb_install_no_account");settings(debugging,"adb_enabled","adb_install_enabled");
        add(child(usb,"usb_connection","连接用途与提示"),"ls_augment_rm_usb_mode_enabled","ls_augment_rm_usb_hide_dialog");
        source(section("connectivity","nfc","NFC"),"nfc","nfc");
        add(section("connectivity","airplane","飞行模式"),"ls_augment_rm_airplane_keep_bluetooth","ls_augment_rm_airplane_keep_wifi");
        add(section("connectivity","wifi","Wi-Fi 与热点"),"ls_augment_rm_wifi_country_enabled","ls_augment_rm_wifi_mac_enabled","ls_augment_rm_hotspot_mac_enabled");
        source(section("apps","installer_ui","安装界面与扫描"),"installer","installer");
        entry(section("apps","download","应用下载"),"store_download");entry(section("apps","double","应用双开"),"double_app");
        add(section("apps","default_apps","默认打开方式"),"ls_augment_rm_intent_hijack_disable");
        Section install=section("apps","installer","APK 安装规则");source(install,"system","installer");entry(install,"signature_install");
        entry(section("apps","hidden","四大皆空",null,true),"hide");
        source(section("system_settings","update","系统更新"),"update","update");
        entry(section("system_settings","competitive_key","自定义竞技键"),"competitive_key");
        add(section("system_settings","settings_entries","设置入口与时间格式"),"settings:hide_healthy_use","ls_augment_rm_settings_hide_battery_percent","ls_augment_rm_settings_time_period");
        Section display=section("system_settings","display","显示与休眠");add(display,"ls_augment_rm_settings_long_timeout","systemui:full_brightness");settings(display,"lock_refresh_rate");
        settings(section("system_settings","developer","开发者选项"),"development_settings_enabled");
        add(section("system_settings","telemetry","统计服务"),"ls_augment_rm_telemetry_disable");
        entry(section("health","health","小米运动健康"),"mi_health");
        for(Map.Entry<String,String> e:ENTRY_PARENTS.entrySet())if(INLINE.contains(e.getKey()))ALIASES.put(e.getKey(),e.getValue());
        alias("status_canvas","status_arrangement");alias("freeform","target-multitasking");alias("diablo_coexist","group/gaming/performance");alias("rm:game","target-gaming");alias("launcher_compatibility","group/desktop/launcher");
        legacyTargets();legacySections();
    }
    private static Section section(String target,String id,String title){return section(target,id,title,null,false);}
    private static Section section(String target,String id,String title,String parentId,boolean restricted){Section s=new Section(target,id,title,parentId,restricted);if(GROUPS.put(s.route(),s)!=null)throw new IllegalStateException("Duplicate route "+s.route());return s;}
    private static Section child(Section parent,String id,String title){Section s=section(parent.target,id,title,parent.id,parent.restricted);parent.entries.add(s.route());return s;}
    private static void source(Section destination,String target,String id){for(NativeFeatureGroups.Section s:NativeFeatureGroups.forTarget(target))if(s.id.equals(id))for(NativeFeatureGroups.Feature f:s.features)add(destination,f.id);}
    private static void add(Section section,String... ids){for(String id:ids){NativeFeatureGroups.Feature f=FEATURES.get(id);if(f==null)throw new IllegalStateException("Unknown feature "+id);section.features.add(f);for(String key:f.allKeys())if(KEY_ROUTES.put(key,section.route())!=null)throw new IllegalStateException("Duplicate setting home "+key);}}
    private static void settings(Section section,String... keys){section.deviceSettings.addAll(Arrays.asList(keys));}
    private static void entry(Section section,String route){section.entries.add(route);if(ENTRY_PARENTS.put(route,section.route())!=null)throw new IllegalStateException("Duplicate editor "+route);}
    private static void alias(String oldRoute,String destination){if(!oldRoute.equals(destination))ALIASES.put(oldRoute,destination);}
    private static String statusRoute(NativeFeatureGroups.Feature f){String destination=StatusBarPages.destination(f);return "status_"+("layout".equals(destination)?"arrangement":destination);}
    private static void legacyTargets(){
        String[][] values={{"system","system_settings"},{"systemui","notifications"},{"statusbar","notifications"},{"settings","system_settings"},{"launcher","desktop"},{"game","gaming"},{"ai_trigger","gaming"},{"fan","cooling"},{"theme","lockscreen"},{"themes","lockscreen"},{"collab","lockscreen"},{"doubleapp","apps"},{"store","apps"},{"installer","apps"},{"update","system_settings"},{"weather","desktop"},{"nfc","connectivity"},{"files","connectivity"},{"permissions","desktop"},{"screenshot","capture"}};
        for(String[] pair:values)alias("target-"+pair[0],"target-"+pair[1]);
        alias("target-ai_trigger","ai_trigger");alias("target-files","group/connectivity/usb_mtp");alias("target-nfc","group/connectivity/nfc");alias("target-weather","group/desktop/desktop_clock");alias("target-permissions","group/desktop/default_launcher");alias("target-update","group/system_settings/update");alias("target-installer","group/apps/installer_ui");alias("target-store","store_download");alias("target-doubleapp","double_app");
        alias("target-gallery","group/capture/image_edit");
        alias("target-amap","atomic_workbench");
    }
    private static void legacySections(){
        String[][] values={
            {"statusbar/statusbar","group/notifications/statusbar"},{"statusbar/island","group/notifications/island"},{"themes/theme_download","group/lockscreen/theme_download"},{"themes/collab_theme","group/lockscreen/collab_theme"},
            {"system/freeform","target-multitasking"},{"system/system","target-system_settings"},{"system/audio","target-audio"},{"system/connections","target-connectivity"},{"system/installer","group/apps/installer"},
            {"systemui/statusbar","status_layout"},{"systemui/status_resources","status_assets"},{"systemui/island","group/notifications/island"},{"systemui/notification_center","group/notifications/notification_display"},{"systemui/quicksettings","target-notifications"},{"systemui/glass","group/notifications/center_layout"},{"systemui/quicksettings_more","target-notifications"},{"systemui/primary_interaction","target-interaction"},
            {"systemui/power","group/interaction/power"},{"systemui/gestures","group/interaction/gestures"},{"systemui/lockscreen","target-lockscreen"},{"systemui/aod","group/lockscreen/aod"},{"systemui/volume_panel","group/audio/volume_panel"},{"systemui/interaction","target-interaction"},{"systemui/usb","group/connectivity/usb_debug"},
            {"launcher/launcher_grid","group/desktop/launcher_grid"},{"launcher/launcher","group/desktop/launcher"},{"launcher/dock_glass","group/desktop/dock_glass"},{"launcher/cleanup","group/desktop/recents"},{"launcher/desktop_clock","group/desktop/desktop_clock"},{"launcher/recents","group/desktop/recents"},
            {"theme/theme","group/lockscreen/theme_download"},{"theme/collab_theme","group/lockscreen/collab_theme"},{"collab/collab_theme","group/lockscreen/collab_theme"},{"theme/collab_fingerprint","group/lockscreen/fingerprint"},{"theme/collab_charging","group/lockscreen/charging"},{"theme/collab_audio","group/audio/collab_audio"},
            {"settings/display_time","group/system_settings/settings_entries"},{"settings/developer","group/system_settings/developer"},{"settings/usb","group/connectivity/usb"},{"update/update","group/system_settings/update"},{"update/update-link","group/system_settings/update"},
            {"files/mtp","group/connectivity/usb_mtp"},{"nfc/nfc","group/connectivity/nfc"},{"weather/weather","group/desktop/desktop_clock"},{"permissions/default_apps","group/desktop/default_launcher"},{"screenshot/capture","group/capture/capture"},{"installer/installer","group/apps/installer_ui"},{"doubleapp/double","double_app"},{"store/download","store_download"},{"fan/fan","fan_control"},{"ai_trigger/ai","ai_trigger"}};
        for(String[] pair:values)alias("group/"+pair[0],pair[1]);for(String id:Arrays.asList("shoulder","combo","performance","plugins","game_capture"))alias("group/game/"+id,"group/gaming/"+id);alias("beautify","group/lockscreen/theme_download");
        for(NativeFeatureGroups.Section s:NativeFeatureGroups.SECTIONS){
            String first=s.features.isEmpty()?null:featureRoute(s.features.get(0).allKeys().get(0));
            if(first==null)continue;
            String groupRoute="group/"+s.target+"/"+s.id;
            if(!GROUPS.containsKey(groupRoute)&&!ALIASES.containsKey(groupRoute))alias(groupRoute,first);
            String old="rm:"+s.id;if(!ALIASES.containsKey(old))alias(old,first);
        }
        alias("rm:system","target-system_settings");alias("rm:statusbar","status_layout");alias("rm:quicksettings","target-notifications");
        alias("rm:lockscreen","target-lockscreen");alias("rm:audio","target-audio");alias("rm:connections","target-connectivity");
        alias("rm:interaction","target-interaction");alias("rm:usb","group/connectivity/usb");alias("rm:theme","target-lockscreen");
        alias("rm:freeform","target-multitasking");alias("rm:installer","group/apps/installer");
    }
    /** Only direct children; USB subpages stay under the single USB entry. */
    public static List<Section> sections(String category){List<Section> result=new ArrayList<>();for(Section s:GROUPS.values())if(s.target.equals(category)&&s.parentId==null)result.add(s);return result;}
    public static List<Section> allSections(){return Collections.unmodifiableList(new ArrayList<>(GROUPS.values()));}
    public static Section group(String route){return GROUPS.get(route);}
    public static List<NativeFeatureGroups.Feature> statusBarFeatures(){return Collections.unmodifiableList(STATUS_FEATURES);}
    public static String featureRoute(String key){
        if(key!=null&&key.startsWith("ls_augment_competitive_key_"))return "competitive_key";
        String route=KEY_ROUTES.get(key);if(route!=null)return route;
        for(Section section:GROUPS.values())if(section.deviceSettings.contains(key))return section.route();
        if(key==null||!ConfigSchema.keys().contains(key))return null;
        if(key.startsWith("ls_augment_health_"))return "mi_health";
        if(key.startsWith("ls_augment_ai_"))return "ai_trigger";
        if(key.startsWith("ls_augment_shoulder_")||key.startsWith("ls_augment_tgk_"))return "group/gaming/shoulder";
        if(key.startsWith("ls_augment_combo_"))return "group/gaming/combo";
        if(key.startsWith("ls_augment_super_mirror_"))return "group/gaming/performance";
        if(key.startsWith("ls_augment_fan_")&&!key.equals(ConfigSchema.FAN_UNLOCK_MAX)&&!key.equals(ConfigSchema.FAN_TARGET_RPM))return "fan_control";
        if(key.startsWith("ls_augment_audio_gain_"))return "group/audio/audio_gain";
        if(key.equals(ConfigSchema.ALLOW_SIGNATURE_MISMATCH))return "group/apps/installer";
        if(key.equals(ConfigSchema.LAUNCHER_OVERRIDES))return "group/desktop/launcher";
        if(key.startsWith("ls_augment_store_download_"))return "store_download";
        if(key.startsWith("ls_augment_doubleapp_"))return "double_app";
        if(Arrays.asList(ConfigSchema.FREEFORM_GAME_LOGIN,ConfigSchema.FREEFORM_EXTERNAL_APPS,ConfigSchema.FREEFORM_GAME_APPS).contains(key))return "freeform_rules";
        if(Arrays.asList(ConfigSchema.FREEFORM_UNLIMITED,ConfigSchema.FREEFORM_ALL_APPS,ConfigSchema.FREEFORM_EXCLUDED_APPS).contains(key))return "freeform_limits";
        if(key.equals(ConfigSchema.FREEFORM_ENABLED))return "target-multitasking";
        if(key.startsWith("ls_augment_hide_"))return "hide_apps";
        if(key.startsWith("ls_augment_automation_"))return "automation";
        if(key.startsWith("ls_augment_tile_"))return "tile";
        if(key.equals(ConfigSchema.SYSTEMUI_MASTER))return "status_arrangement";
        if(key.equals(ConfigSchema.STATUSBAR_ARTWORK)||key.equals(ConfigSchema.STATUSBAR_FONTS)||key.equals(StatusBarVisibilitySpec.KEY))return "status_assets";
        if(key.startsWith("ls_augment_statusbar_")){
            if(key.equals(ConfigSchema.STATUSBAR_SHEET)||key.equals(ConfigSchema.STATUSBAR_LAYOUT_MODE))return null;
            if(key.contains("clock_")&&!key.equals(ConfigSchema.STATUSBAR_CLOCK_ACROSS))return "status_clock";
            if(key.contains("notification_"))return "status_notifications";
            if(key.contains("network_"))return "status_network";
            if(key.contains("connectivity_")||key.equals(ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED))return "status_battery";
            if(key.endsWith("_decimals")||key.equals(ConfigSchema.STATUSBAR_THERMAL)||key.equals(ConfigSchema.STATUSBAR_BATTERY_POWER))return "status_metrics";
            if(key.equals(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE)||key.equals(ConfigSchema.STATUSBAR_VPN_STYLE)||key.equals(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS))return "status_icons";
            return "status_arrangement";
        }
        return null;
    }
    public static boolean hasInlineEditors(Section section){for(String route:section.entries)if(INLINE.contains(route))return true;return false;}
    public static boolean requiresHiddenAccess(String requested){String route=resolve(requested);if(Arrays.asList("hide","hide_apps","automation","tile","tile_icon_crop").contains(route))return true;Section s=group(route);return s!=null&&s.restricted;}
    public static boolean isRestricted(String route){return requiresHiddenAccess(route);}
    public static String singleChild(String route){String alias=ALIASES.get(route);if(alias!=null)return alias;if(route.startsWith("target-")){List<Section> list=sections(route.substring(7));if(list.size()==1)return list.get(0).route();}Section s=group(route);return s!=null&&!hasInlineEditors(s)&&s.features.isEmpty()&&s.deviceSettings.isEmpty()&&s.entries.size()==1?s.entries.get(0):null;}
    public static String resolve(String route){if(route==null)return "home";Set<String> visited=new HashSet<>();String next=route;while(visited.add(next)){String child=singleChild(next);if(child==null)return next;next=child;}return route;}
    private static String immediateParent(String route){
        if("atomic_workbench_session".equals(route)||"atomic_workbench_apps".equals(route)
                ||"atomic_workbench_app_sort".equals(route))return "atomic_workbench";
        if("icon_crop".equals(route))return "group/desktop/launcher";if("gesture_icon_crop".equals(route))return "group/interaction/gestures";if("tile_icon_crop".equals(route))return "hide_apps";if("rapid_compatibility".equals(route))return "group/gaming/shoulder";
        if(StatusBarPages.surface(route)!=null)return "status_surfaces";if("status_surfaces".equals(route)||Arrays.asList(StatusBarPages.ROUTES).contains(route))return "status_layout";if(route.startsWith("asset/"))return "status_assets";if(Arrays.asList("hide_apps","automation","tile").contains(route))return "hide";
        Section s=group(route);if(s!=null)return s.parentId==null?"target-"+s.target:"group/"+s.target+"/"+s.parentId;if(route.startsWith("target-"))return "home";String owner=ENTRY_PARENTS.get(route);if(owner!=null)return owner;
        if("license_document".equals(route))return "licenses";
        if(Arrays.asList("support","contributors","licenses").contains(route))return "about";if(Arrays.asList("scope","log_export","config_transfer").contains(route))return "settings";return "home";
    }
    public static String parent(String route){String parent=immediateParent(resolve(route));Set<String> visited=new HashSet<>();visited.add(resolve(route));while(visited.add(parent)&&singleChild(parent)!=null)parent=immediateParent(parent);return parent;}
    public static List<String> path(String route){LinkedList<String> path=new LinkedList<>();Set<String> visited=new HashSet<>();String next=resolve(route);while(visited.add(next)){path.addFirst(next);if(Arrays.asList("home","settings","about").contains(next))break;next=parent(next);}return path;}
    public static String categoryForRoute(String route){for(String item:path(route)){if(item.startsWith("target-"))return item.substring(7);Section s=group(item);if(s!=null)return s.target;Section owner=group(ENTRY_PARENTS.get(item));if(owner!=null)return owner.target;}Section s=group(ENTRY_PARENTS.get(resolve(route)));return s==null?null:s.target;}
    public static String title(String route){
        if("atomic_workbench".equals(route))return "红魔Step";
        if("atomic_workbench_session".equals(route))return "运行工作台";
        if("atomic_workbench_apps".equals(route))return "应用列表显示";
        if("atomic_workbench_app_sort".equals(route))return "应用列表排序";
        if("competitive_key".equals(route))return "自定义竞技键";
        String statusTitle=StatusBarPages.title(route);if(!statusTitle.isEmpty())return statusTitle;if(route.startsWith("asset/")){StatusBarIconCatalog.Icon icon=StatusBarIconCatalog.find(route.substring(6));if(icon!=null)return icon.title;}
        switch(route){case "icon_crop":case "gesture_icon_crop":case "tile_icon_crop":return "裁剪图片";case "home":return "主页";case "settings":return "模块";case "about":return "关于";case "rapid_compatibility":return "兼容性测试";case "extra_dim":return "极暗磁贴";case "hide":return "四大皆空";case "hide_apps":return "应用选择与显隐";case "automation":return "自动隐藏";case "tile":return "快捷磁贴";case "freeform_rules":return "跨应用跳转规则";case "freeform_limits":return "小窗数量与应用范围";case "scope":return "模块作用域";case "log_export":return "导出日志";case "support":return "支持作者";case "contributors":return "贡献名单";case "licenses":return "许可和第三方声明";case "license_document":return "许可正文";}
        if(route.startsWith("target-")){ModulePresentationCatalog.Category category=ModulePresentationCatalog.find(route.substring(7));if(category!=null)return category.title;}Section s=group(route);if(s!=null)return s.title;
        for(HookAppCatalog.Target target:HookAppCatalog.targets())for(HookAppCatalog.Entry entry:HookAppCatalog.entries(target.id))if(entry.route.equals(route))return entry.title;String resolved=resolve(route);return resolved.equals(route)?"":title(resolved);
    }
    public static String summary(Section s){if("liftarc".equals(s.id))return "指示条、上滑解锁、弧形效果、玻璃与提示文字";if("statusbar".equals(s.id))return "布局、时钟、图标、实时指标与素材字体";if("usb".equals(s.id))return "文件传输、调试安装、默认用途与提示";if("collab_audio".equals(s.id))return "导入本机联名铃声、通知音与闹钟素材";Set<String> titles=new LinkedHashSet<>();for(NativeFeatureGroups.Feature f:s.features){titles.add(f.title);if(titles.size()==3)break;}if(titles.isEmpty())for(String entry:s.entries){titles.add(title(entry));if(titles.size()==3)break;}return String.join("、",titles);}
    /** Actual scopes of the page, preserving multiple cooperating process groups. */
    public static List<String> restartScopes(Section s){Set<String> scopes=new LinkedHashSet<>();for(NativeFeatureGroups.Feature f:s.features)for(String key:f.allKeys()){HookAppCatalog.Target t=HookAppCatalog.find(HookAppCatalog.targetForKey(key));if(t!=null&&t.restartScope!=null)scopes.add(t.restartScope);}for(String entry:s.entries){Section child=group(entry);if(child!=null){scopes.addAll(restartScopes(child));continue;}HookAppCatalog.Target t=HookAppCatalog.find(HookAppCatalog.targetForRoute(entry));if(t!=null&&t.restartScope!=null)scopes.add(t.restartScope);else if(entry.startsWith("freeform_"))scopes.add("device");}if("collab_audio".equals(s.id))return Collections.emptyList();return new ArrayList<>(scopes);}
    public static String restartScope(Section s){List<String> scopes=restartScopes(s);return scopes.size()==1?scopes.get(0):scopes.isEmpty()?null:"device";}
    public static int activeCount(Section s,java.util.function.Function<String,String> value){int count=0;for(NativeFeatureGroups.Feature f:s.features)count+=activeCount(f,value);for(String route:s.entries){Section child=group(route);if(child!=null){count+=activeCount(child,value);continue;}List<String> keys;switch(route){case "competitive_key":keys=Collections.singletonList(CompetitiveKeyOptions.ENABLED);break;case "shoulder":keys=Arrays.asList(ConfigSchema.SHOULDER_ENABLED,ConfigSchema.TGK_RAPID_FIRE_ENABLED);break;case "combo_speed":keys=Collections.singletonList(ConfigSchema.COMBO_SPEED_ENABLED);break;case "super_resolution":keys=Arrays.asList(ConfigSchema.SUPER_MIRROR_LOW_MODE,ConfigSchema.SUPER_MIRROR_DIABLO_COEXIST);break;case "audio_gain":keys=Collections.singletonList(ConfigSchema.AUDIO_GAIN_ENABLED);break;case "signature_install":keys=Collections.singletonList(ConfigSchema.ALLOW_SIGNATURE_MISMATCH);break;case "ai_trigger":keys=Collections.singletonList(ConfigSchema.AI_TRIGGER_ENABLED);break;case "freeform_rules":keys=Arrays.asList(ConfigSchema.FREEFORM_GAME_LOGIN,ConfigSchema.FREEFORM_EXTERNAL_APPS);break;case "freeform_limits":keys=Arrays.asList(ConfigSchema.FREEFORM_UNLIMITED,ConfigSchema.FREEFORM_ALL_APPS);break;case "fan_control":keys=Arrays.asList(ConfigSchema.FAN_FIXED_ENABLED,ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED,ConfigSchema.FAN_SCREEN_OFF_ENABLED);break;default:keys=Collections.emptyList();}for(String key:keys)if("1".equals(value.apply(key)))count++;if("launcher_custom".equals(route)){LauncherOverrides overrides=LauncherOverrides.parse(value.apply(ConfigSchema.LAUNCHER_OVERRIDES));if(overrides!=null&&!overrides.entries().isEmpty())count++;}}return count;}
    private static int activeCount(NativeFeatureGroups.Feature f,java.util.function.Function<String,String> value){String key=f.toggleKey==null?f.parameterKeys[0]:f.toggleKey;boolean active=f.toggleKey!=null?"1".equals(value.apply(key)):ValueOverrideState.active(f.comparison,value.apply(key),f.noOpValue);if(!active)return 0;int count=1;for(NativeFeatureGroups.Feature child:f.children)count+=activeCount(child,value);return count;}
}
