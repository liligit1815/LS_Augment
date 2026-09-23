package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Navigation inventory organized by the application that owns the hook.
 * Configuration keys and validators remain owned by EnhancementCatalog.
 * A setting has one home even when several cooperating processes implement it.
 * This class deliberately has no Android dependencies so coverage can be checked on a JVM.
 */
public final class HookAppCatalog {
    public static final String SYSTEM = "system";
    public static final String SYSTEM_UI = "systemui";
    public static final String SETTINGS = "settings";
    public static final String LAUNCHER = "launcher";
    public static final String GAME = "game";
    public static final String AI_TRIGGER = "ai_trigger";
    public static final String FAN = "fan";
    public static final String THEME = "theme";
    public static final String DOUBLE_APP = "doubleapp";
    public static final String STORE = "store";
    public static final String INSTALLER = "installer";
    public static final String UPDATE = "update";
    public static final String HEALTH = "health";
    public static final String WEATHER = "weather";
    public static final String NFC = "nfc";
    public static final String FILES = "files";
    public static final String PERMISSIONS = "permissions";
    public static final String SCREENSHOT = "screenshot";
    public static final String MODULE = "module";

    public static final class Target {
        public final String id, title, summary, packageName, restartScope;
        public final List<String> packages;

        private Target(String id, String title, String summary, String restartScope,
                String... packages) {
            this.id = id;
            this.title = title;
            this.summary = summary;
            this.restartScope = restartScope;
            this.packages = immutable(Arrays.asList(packages));
            this.packageName = packages.length == 0 ? "" : packages[0];
        }
    }

    public static final class Section {
        public final String id, title;
        public final List<EnhancementOption> options;

        private Section(String id, String title, List<EnhancementOption> options) {
            this.id = id;
            this.title = title;
            this.options = immutable(options);
        }
    }

    /** Existing editors are reused for app pickers, live previews and hardware workflows. */
    public static final class Entry {
        public final String route, title, summary;

        private Entry(String route, String title, String summary) {
            this.route = route;
            this.title = title;
            this.summary = summary;
        }
    }

    private static final List<Target> TARGETS = immutable(Arrays.asList(
            target(SYSTEM, "系统框架", "小窗、音量、安装规则与无线连接", "device",
                    "system", "com.zte.recommend"),
            target(SYSTEM_UI, "系统界面", "状态栏、控制中心、锁屏与息屏显示", "systemui",
                    "com.android.systemui"),
            target(SETTINGS, "系统设置", "显示与时间、USB 连接及开发者选项", "settings",
                    "com.android.settings"),
            target(LAUNCHER, "系统桌面", "图标名称、桌面页面、时钟与最近任务", "apps",
                    "com.zte.mifavor.launcher"),
            target(GAME, "游戏空间与游戏助手", "肩键、连招、游戏面板、超分与破坏神模式", "games",
                    "cn.nubia.gamelauncher", "cn.nubia.gameassist", "cn.nubia.gamehelpmodule",
                    "cn.nubia.gamehelperline", "cn.zte.gamefloat", "cn.nubia.gamehighlights"),
            target(AI_TRIGGER, "AI 触发器", "识别速度、点击队列与 YOLO 参数", "games",
                    "com.zte.game.plugintrigger", "cn.nubia.gamelab", "cn.nubia.gameassist"),
            target(FAN, "散热风扇", "目标转速、硬件档位与满速控制", "games",
                    "cn.nubia.fan"),
            target(THEME, "主题与个性化", "主题试用、壁纸及息屏资源下载", "apps",
                    "com.zte.beautify", "com.zte.beautifyadapter"),
            target(DOUBLE_APP, "应用双开", "扩展双开候选与低内存限制", "apps",
                    "com.zte.cn.doubleapp"),
            target(STORE, "应用中心", "同时下载数量与下载队列", "apps", "cn.nubia.neostore"),
            target(INSTALLER, "应用安装器", "扫描流程、纯净模式、推荐与简洁界面", "apps",
                    "com.android.packageinstaller"),
            target(UPDATE, "系统更新", "更新安装、更新链接与设备信息", "apps", "com.zte.zdm"),
            target(HEALTH, "小米运动健康", "步数倍速、增步计划与每日上限", "apps", "com.mi.health"),
            target(WEATHER, "天气", "天气时间中的中文时段", "apps", "com.zte.mifavor.weather"),
            target(NFC, "NFC 服务", "识别提示音与息屏识别", "device", "com.android.nfc"),
            target(FILES, "文件管理", "电脑端存储名称与 MTP 浏览", "apps", "cn.nubia.filebrowser"),
            target(PERMISSIONS, "权限管理", "第三方默认桌面选择", "apps", "com.android.permissioncontroller"),
            target(SCREENSHOT, "截图与录屏", "截图、录屏中的状态栏显示", "apps", "com.android.ztescreenshot")
    ));
    private static final Target MODULE_TARGET = target(MODULE, "模块设置",
            "模块外观、桌面入口、配置备份与运行诊断", null, "ls.augment.com");
    private static final List<EnhancementOption> OPTIONS = EnhancementCatalog.options();
    private static final Map<String, Target> INDEX = new LinkedHashMap<>();
    private static final Map<String, String> KEY_TARGETS = new LinkedHashMap<>();
    private static final Map<String, List<Entry>> ENTRIES = new LinkedHashMap<>();
    private static final Map<String, String> ROUTES = new LinkedHashMap<>();

    static {
        for (Target target : TARGETS) INDEX.put(target.id, target);
        INDEX.put(MODULE, MODULE_TARGET);
        for (EnhancementOption option : OPTIONS) {
            if (option.kind != EnhancementOption.Kind.INTERNAL) {
                KEY_TARGETS.put(option.key, owner(option));
            }
        }
        add(SYSTEM, "freeform", "小窗增强", "窗口数量、支持应用与例外名单");
        add(SYSTEM, "audio_gain", "音量增强", "设置增益上限；超过 100% 会增加音量总档数");
        add(SYSTEM, "signature_install", "签名不一致安装", "同包名、不同签名 APK 的覆盖安装规则");
        add(SYSTEM_UI, "status_layout", "状态栏布局与实时预览", "双排布局、时钟格式、实时数据与图标位置");
        add(LAUNCHER, "launcher_custom", "应用图标与名称", "按空间选择应用，自定义图标和桌面名称");
        add(LAUNCHER, "launcher_compatibility", "桌面兼容性检测", "检查配套修改版桌面的机型、系统与底包");
        add(GAME, "shoulder", "全应用肩键与极速连点", "肩键使用范围、兼容性测试与连点频率");
        add(GAME, "combo_speed", "一键连招速度", "录制连招的播放倍率与预览");
        add(GAME, "super_resolution", "超分与破坏神模式", "性能模式超分、破坏神模式与共存策略");
        add(AI_TRIGGER, "ai_trigger", "AI 触发器参数", "识别间隔、模板、点击队列与 YOLO 设置");
        add(FAN, "fan_control", "风扇控制", "固定转速、转速检测与满速控制");
        add(THEME, "beautify", "主题无限期试用", "主题试用资源的本地到期恢复策略");
        add(DOUBLE_APP, "double_app", "扩展应用双开", "双开候选应用与低内存限制");
        add(STORE, "store_download", "同时下载数量", "设置应用中心允许同时下载的数量");
        add(HEALTH, "mi_health", "步数与每日计划", "步数倍速、账户绑定、计划与每日上限");
        add(MODULE, "launcher_icon", "模块桌面图标", "隐藏或恢复 LS_Augment 的桌面入口");
        add(MODULE, "config_transfer", "备份、还原与重置", "导出配置、导入备份或恢复默认设置");
        add(MODULE, "diagnostics", "运行诊断", "适配状态、详细诊断与日志导出");
        // Existing deep links retain an owner without creating duplicate editor rows.
        ROUTES.put("status_clock", SYSTEM_UI);
        ROUTES.put("status_metrics", SYSTEM_UI);
        ROUTES.put("diablo_coexist", GAME);
        ROUTES.put("detailed_diagnostics", MODULE);
        // These routes stay behind the existing HiddenEntrySession gate in the host UI.
        ROUTES.put("hide", MODULE);
        ROUTES.put("hide_apps", MODULE);
        ROUTES.put("automation", MODULE);
        ROUTES.put("tile", MODULE);
        ROUTES.put("tile_setup", MODULE);
        ROUTES.put("device_settings", SETTINGS);
    }

    private HookAppCatalog() { }

    /** Home only: module preferences are intentionally absent. */
    public static List<Target> targets() { return TARGETS; }

    public static Target find(String id) { return INDEX.get(id); }

    /** Returns the unique target id, or null for unknown/internal settings. */
    public static String targetForKey(String key) { return KEY_TARGETS.get(key); }

    /** Existing editor route ownership. A mixed old rm: group has no unique owner. */
    public static String targetForRoute(String route) {
        if (route == null) return null;
        if (!route.startsWith("rm:")) return ROUTES.get(route);
        String found = null;
        for (EnhancementOption option : EnhancementCatalog.group(route.substring(3))) {
            String next = targetForKey(option.key);
            if (found != null && !found.equals(next)) return null;
            found = next;
        }
        return found;
    }

    public static List<Entry> entries(String targetId) {
        List<Entry> entries = ENTRIES.get(targetId);
        return entries == null ? Collections.emptyList() : immutable(entries);
    }

    /** All generic controls for an application, grouped without another navigation level. */
    public static List<Section> sections(String targetId) {
        if (!INDEX.containsKey(targetId)) return Collections.emptyList();
        LinkedHashMap<String, List<EnhancementOption>> groups = new LinkedHashMap<>();
        for (String id : sectionOrder(targetId)) groups.put(id, new ArrayList<>());
        for (EnhancementOption option : OPTIONS) {
            if (!targetId.equals(targetForKey(option.key))) continue;
            String section = sectionFor(option, targetId);
            groups.computeIfAbsent(section, ignored -> new ArrayList<>()).add(option);
        }
        List<Section> result = new ArrayList<>();
        for (Map.Entry<String, List<EnhancementOption>> group : groups.entrySet()) {
            if (!group.getValue().isEmpty()) result.add(new Section(group.getKey(),
                    sectionTitle(group.getKey()), group.getValue()));
        }
        return immutable(result);
    }

    /** Counts controls, not user-facing capabilities (one capability can have many controls). */
    public static int optionCount(String targetId) {
        int count = 0;
        for (Section section : sections(targetId)) count += section.options.size();
        return count;
    }

    /** Cooperating hook packages for the option, useful for scope diagnostics. */
    public static List<String> affectedPackages(String key) {
        Target target = find(targetForKey(key));
        if (target == null || MODULE.equals(target.id)) return Collections.emptyList();
        String suffix = suffix(key);
        if ("secure_capture".equals(suffix)) return immutable(Arrays.asList(
                "system", "com.android.systemui", "com.android.ztescreenshot"));
        if ("audio_no_safe_warning".equals(suffix)) return immutable(Arrays.asList(
                "system", "com.android.systemui"));
        if ("screenshot_hide_status_bar".equals(suffix) || "record_hide_status_bar".equals(suffix))
            return immutable(Arrays.asList("com.android.ztescreenshot", "com.android.systemui"));
        if (GAME.equals(target.id)) {
            if (GameOptions.QUICK_SWITCH.equals(key) || GameOptions.REDMAGIC_TIME.equals(key))
                return Collections.singletonList("cn.nubia.gamelauncher");
            if (GameOptions.COMBO_LIMITS.equals(key)) return Collections.singletonList("cn.nubia.gamehelpmodule");
            if (GameOptions.HIGHLIGHTS.equals(key)) return Collections.singletonList("cn.nubia.gamehighlights");
            if (GameOptions.PLUGINS.equals(key)) return immutable(Arrays.asList("cn.nubia.gamelauncher", "cn.nubia.gameassist"));
            if (GameOptions.HIDE_DIABLO_DIALOG.equals(key)) return immutable(Arrays.asList("cn.nubia.gameassist", "cn.zte.gamefloat"));
            if (GameOptions.FREE_RECORD.equals(key)) return immutable(Arrays.asList("cn.nubia.gameassist", "cn.nubia.gamehighlights"));
            return Collections.singletonList("cn.nubia.gameassist");
        }
        return Collections.singletonList(target.packageName);
    }

    private static String owner(EnhancementOption option) {
        String suffix = suffix(option.key);
        if ("appearance".equals(option.group)) return MODULE;
        if ("game".equals(option.group)) return GAME;
        if (suffix.startsWith("settings_") || suffix.equals("usb_install_no_account")
                || suffix.startsWith("usb_mode") || suffix.startsWith("usb_hide_")) return SETTINGS;
        if (suffix.equals("usb_auto_authorize")) return SYSTEM_UI;
        if (suffix.startsWith("nfc_")) return NFC;
        if (suffix.startsWith("mtp_")) return FILES;
        if (suffix.equals("third_party_launcher")) return PERMISSIONS;
        if (suffix.equals("weather_time_period")) return WEATHER;
        if (suffix.equals("screenshot_hide_status_bar") || suffix.equals("record_hide_status_bar"))
            return SCREENSHOT;
        if (suffix.equals("signature_min_v1")) return SYSTEM;
        if (suffix.equals("audio_no_safe_warning")) return SYSTEM;
        if (suffix.equals("lock_volume") || suffix.equals("audio_no_long_press_vibrate")
                || suffix.equals("clipboard_overlay") || suffix.startsWith("onehand_")
                || suffix.equals("assist_gesture")) return SYSTEM_UI;
        switch (option.group) {
            case "statusbar": case "lockscreen": case "aod": case "quicksettings": return SYSTEM_UI;
            case "launcher": return LAUNCHER;
            case "installer": return INSTALLER;
            case "theme": return THEME;
            case "update": return UPDATE;
            case "system": case "audio": case "connections": return SYSTEM;
            default: throw new IllegalArgumentException("Unmapped hook setting: " + option.key);
        }
    }

    private static String sectionFor(EnhancementOption option, String targetId) {
        String suffix = suffix(option.key);
        if (SETTINGS.equals(targetId)) return suffix.startsWith("usb_") ? "usb" : "display_time";
        if (SCREENSHOT.equals(targetId)) return "capture";
        if (NFC.equals(targetId)) return "nfc";
        if (FILES.equals(targetId)) return "mtp";
        if (PERMISSIONS.equals(targetId)) return "default_apps";
        if (WEATHER.equals(targetId)) return "weather";
        if (SYSTEM_UI.equals(targetId)) {
            if (suffix.equals("usb_auto_authorize")) return "usb";
            if ("audio".equals(option.group)) return "volume_panel";
            if ("system".equals(option.group)) return "interaction";
        }
        if (LAUNCHER.equals(targetId)) {
            if (suffix.startsWith("desktop_clock_")) return "desktop_clock";
            if (suffix.startsWith("recents_")) return "recents";
        }
        if (GAME.equals(targetId)) {
            if (GameOptions.QUICK_SWITCH.equals(option.key)) return "shoulder";
            if (GameOptions.COMBO_LIMITS.equals(option.key)) return "combo";
            if (GameOptions.PLUGINS.equals(option.key)) return "plugins";
            if (GameOptions.FREE_RECORD.equals(option.key) || GameOptions.HIGHLIGHTS.equals(option.key)
                    || GameOptions.REDMAGIC_TIME.equals(option.key)) return "game_capture";
            return "performance";
        }
        if (SYSTEM.equals(targetId) && "signature_min_v1".equals(suffix)) return "installer";
        return option.group;
    }

    private static String[] sectionOrder(String targetId) {
        switch (targetId) {
            case SYSTEM: return new String[]{"system", "audio", "connections", "installer"};
            case SYSTEM_UI: return new String[]{"statusbar", "quicksettings", "lockscreen", "aod", "volume_panel", "interaction", "usb"};
            case SETTINGS: return new String[]{"display_time", "usb"};
            case LAUNCHER: return new String[]{"launcher", "desktop_clock", "recents"};
            case GAME: return new String[]{"shoulder", "combo", "performance", "plugins", "game_capture"};
            default: return new String[0];
        }
    }

    private static String sectionTitle(String id) {
        switch (id) {
            case "system": return "系统行为";
            case "audio": return "音量规则与档位";
            case "connections": return "Wi-Fi、热点与飞行模式";
            case "installer": return "应用安装规则";
            case "display_time": return "显示与时间";
            case "usb": return "USB 连接";
            case "volume_panel": return "音量面板与按键";
            case "interaction": return "手势、单手模式与剪贴板";
            case "launcher": return "桌面页面";
            case "desktop_clock": return "桌面时钟";
            case "recents": return "最近任务内存信息";
            case "shoulder": return "肩键方案";
            case "combo": return "连招录制与循环";
            case "performance": return "游戏面板与性能模式";
            case "plugins": return "游戏插件";
            case "game_capture": return "录制、高光与红魔时刻";
            case "capture": return "截图与录屏画面";
            case "nfc": return "NFC 识别";
            case "mtp": return "电脑文件传输";
            case "default_apps": return "默认应用";
            case "weather": return "天气时间";
            default: return EnhancementCatalog.title(id);
        }
    }

    private static String suffix(String key) {
        return key.startsWith(SystemOptions.PREFIX) ? key.substring(SystemOptions.PREFIX.length()) : key;
    }

    private static Target target(String id, String title, String summary, String scope, String... packages) {
        return new Target(id, title, summary, scope, packages);
    }

    private static void add(String targetId, String route, String title, String summary) {
        ENTRIES.computeIfAbsent(targetId, ignored -> new ArrayList<>()).add(new Entry(route, title, summary));
        if (ROUTES.put(route, targetId) != null) throw new IllegalStateException("Duplicate route: " + route);
    }

    private static <T> List<T> immutable(List<T> list) {
        return Collections.unmodifiableList(new ArrayList<>(list));
    }
}
