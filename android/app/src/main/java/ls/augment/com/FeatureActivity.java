package ls.augment.com;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import android.window.OnBackInvokedDispatcher;

import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Secondary configuration pages. */
public final class FeatureActivity extends Activity {
    static final String EXTRA_MODULE = "module";
    static final String MODULE_RECENTS_STACK = "recents_stack";
    static final String MODULE_RECENTS_MEMORY = "recents_memory";
    static final String MODULE_SHOULDER = "shoulder";
    static final String MODULE_COMBO_SPEED = "combo_speed";
    static final String MODULE_SUPER_RESOLUTION = "super_resolution";
    static final String MODULE_DIABLO_COEXIST = "diablo_coexist";
    static final String MODULE_STATUS_LAYOUT = "status_layout";
    static final String MODULE_STATUS_CLOCK = "status_clock";
    static final String MODULE_STATUS_METRICS = "status_metrics";
    static final String MODULE_DOUBLE_APP = "double_app";
    static final String MODULE_BEAUTIFY = "beautify";
    static final String MODULE_AUTOMATION = "automation";
    static final String MODULE_TILE = "tile";
    static final String MODULE_LAUNCHER_ICON = "launcher_icon";
    static final String MODULE_DIAGNOSTICS = "diagnostics";
    private static final int EXPORT_REQUEST = 2042;

    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Map<String, Switch> switches = new LinkedHashMap<>();
    private final Map<String, EditText> inputs = new LinkedHashMap<>();
    private final Map<String, Slider> sliders = new LinkedHashMap<>();
    private final Map<String, Choice> choices = new LinkedHashMap<>();
    private final Map<String, PositionControl> positionControls = new LinkedHashMap<>();
    private final LinkedHashMap<String, StatusBarLayoutSpec.Position> positionValues =
            new LinkedHashMap<>();
    private AppConfig config;
    private UiKit ui;
    private LinearLayout page;
    private Button save;
    private TextView status;
    private LinearLayout statusIconControls;
    private final LinkedHashMap<String, Boolean> renderedStatusIconSlots =
            new LinkedHashMap<>();
    private String section;
    private boolean loading = true;
    private boolean dirty;
    private boolean saveInFlight;
    private long changeGeneration;
    private String pendingExport = "";
    private final Runnable statusAutoSave = () -> save(true);
    private final Runnable statusPoll = new Runnable() {
        @Override public void run() {
            if (!isStatusModule() || isFinishing()) return;
            refreshStatusIconControls();
            renderRuntimeStatus();
            main.postDelayed(this, 800L);
        }
    };

    private static final String[] DEVICE_STATUS_ICON_BASELINE = {
            "vpn", "ethernet", "rotate", "screen_record", "sensors_off", "camera",
            "microphone", "data_saver", "connected_display", "cast", "tty", "satellite",
            "hotspot", "nfc", "location", "bluetooth", "alarm_clock", "zen", "mute",
            "volume", "airplane", "NET_SPEED", "secondary_wifi", "wifi", "ims_icon", "mobile"
    };

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        section = getIntent().getStringExtra(EXTRA_MODULE);
        if (section == null) section = MODULE_DIAGNOSTICS;
        config = new AppConfig(this);
        ui = new UiKit(this);
        build();
        loadValues();
        registerSystemBackCallback();
    }

    @Override protected void onDestroy() {
        main.removeCallbacks(statusAutoSave);
        main.removeCallbacks(statusPoll);
        executor.shutdownNow();
        super.onDestroy();
    }

    @Override public void onBackPressed() { finish(); }

    private void registerSystemBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return;
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                this::finish);
    }

    private void build() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(ui.backgroundDrawable());
        root.setPadding(0, ui.topAppInset(), 0, 0);
        LinearLayout header = ui.header(title(), true);
        header.setPadding(ui.dp(10), ui.dp(4), ui.dp(12), ui.dp(2));
        if (!isStatusModule()) ScopeRestartDialog.addButton(this, ui, header, restartScope());
        root.addView(header, new LinearLayout.LayoutParams(-1, -2));
        root.addView(ui.divider(), new LinearLayout.LayoutParams(-1, ui.dp(1)));

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setClipToPadding(false);
        page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(ui.dp(14), ui.dp(10), ui.dp(14), ui.dp(26));
        scroll.addView(page, new ScrollView.LayoutParams(-1, -2));
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));

        TextView description = ui.text(subtitle(), 11.5f, ui.muted, false);
        description.setLineSpacing(ui.dp(1), 1.06f);
        page.addView(description, ui.margins(1, 2, 1, 12));
        status = ui.text("配置尚未读取", 11, ui.muted, false);
        status.setPadding(ui.dp(12), ui.dp(9), ui.dp(12), ui.dp(9));
        status.setBackground(ui.roundStroke(ui.accentContainer, 12, ui.outline, 1));
        page.addView(status, ui.margins(0, 0, 0, 12));

        switch (section) {
            case MODULE_RECENTS_STACK: buildRecentsStack(); break;
            case MODULE_RECENTS_MEMORY: buildRecentsMemory(); break;
            case MODULE_SHOULDER: buildShoulder(); break;
            case MODULE_COMBO_SPEED: buildComboSpeed(); break;
            case MODULE_SUPER_RESOLUTION: buildSuperResolution(); break;
            case MODULE_DIABLO_COEXIST: buildDiabloCoexist(); break;
            case MODULE_STATUS_LAYOUT: buildStatusLayout(); break;
            case MODULE_STATUS_CLOCK: buildStatusClock(); break;
            case MODULE_STATUS_METRICS: buildStatusMetrics(); break;
            case MODULE_DOUBLE_APP: buildDoubleApp(); break;
            case MODULE_BEAUTIFY: buildBeautify(); break;
            case MODULE_AUTOMATION: buildAutomation(); break;
            case MODULE_TILE: buildTile(); break;
            case MODULE_LAUNCHER_ICON: buildLauncherIcon(); setContentView(root); ui.applyGestureInset(root, 8); return;
            default: buildDiagnostics(); setContentView(root); ui.applyGestureInset(root, 8); return;
        }
        save = ui.accentButton(isStatusModule() ? "立即应用（修改会自动应用）" : "保存修改");
        ui.setButtonEnabled(save, false);
        save.setOnClickListener(view -> save());
        LinearLayout saveBar = new LinearLayout(this);
        saveBar.setPadding(ui.dp(14), ui.dp(8), ui.dp(14), ui.dp(9));
        saveBar.setBackgroundColor(ui.rail);
        saveBar.addView(save, new LinearLayout.LayoutParams(-1, ui.dp(48)));
        root.addView(saveBar, new LinearLayout.LayoutParams(-1, -2));
        setContentView(root);
        ui.applyGestureInset(root, 8);
    }

    private LinearLayout detailCard(String title, String description) {
        LinearLayout card = ui.card();
        card.addView(ui.section(title, description), ui.wrap());
        return card;
    }

    private void buildRecentsStack() {
        LinearLayout master = detailCard("横向重叠任务",
                "视觉变换不接管 Quickstep 的分页与手势。关闭后恢复红魔原生样式。");
        addSwitch(master, AppConfig.RECENTS_ENABLED, "启用横向堆叠",
                "只改变 TaskView 视觉位置，不修改 Quickstep 分页、fling 或 snap。", true);
        page.addView(master, ui.margins(0, 0, 0, 12));

        LinearLayout advanced = new LinearLayout(this);
        advanced.setOrientation(LinearLayout.VERTICAL);
        addSlider(advanced, AppConfig.RECENTS_COMPRESSION,
                "后层展开比例（推荐 0.32）", 12, 90, true);
        addSlider(advanced, AppConfig.RECENTS_FRONT_OVERLAP,
                "前两张重叠比例（推荐 0.30）", 20, 60, true);
        addRecentsRecommendedReset(advanced, true);
        page.addView(ui.collapsible("视觉参数",
                "滑动时连续改变卡片露出；参数修改后重启系统桌面。", advanced, false),
                ui.margins(0, 0, 0, 12));
    }

    private void buildRecentsMemory() {
        LinearLayout memory = detailCard("后台内存标签",
                "最近任务底部只保留一条整机数据，不显示汉字和重复标签。");
        addSwitch(memory, AppConfig.RECENTS_MEMORY_ENABLED, "显示整机内存", "例如 6.3 GB / 14.9 GB。", false);
        page.addView(memory, ui.margins(0, 0, 0, 12));
        LinearLayout advanced = new LinearLayout(this);
        advanced.setOrientation(LinearLayout.VERTICAL);
        addSlider(advanced, AppConfig.RECENTS_MEMORY_TEXT_SP,
                "字号 sp（推荐 13）", 10, 20, false);
        addSlider(advanced, AppConfig.RECENTS_MEMORY_GAP_DP,
                "与卡片间距 dp（推荐 8）", 0, 32, false);
        addRecentsRecommendedReset(advanced, false);
        page.addView(ui.collapsible("显示参数", "调整字号与卡片间距。", advanced, false),
                ui.margins(0, 0, 0, 12));
    }

    private void buildShoulder() {
        LinearLayout shoulder = detailCard("全应用肩键",
                "自动适配主空间中已安装、已启用的第三方 App；实体 L/R 动作仍由红魔 TGK 负责。");
        addSwitch(shoulder, AppConfig.SHOULDER_ENABLED, "启用全应用肩键",
                "无需再选择应用；系统组件、LS_Augment 与 Root/LSPosed 管理器不会被放行。", false);
        addSwitch(shoulder, AppConfig.SHOULDER_DIAGNOSTICS, "详细诊断", "仅排查时开启；默认使用低频诊断。", false);
        page.addView(shoulder, ui.margins(0, 0, 0, 12));
    }

    private void buildComboSpeed() {
        LinearLayout combo = detailCard("一键连招速度",
                "保留原始录制，首次使用某个倍率时生成加速缓存，后续调用直接复用。修改后下一次播放立即使用新倍率。");
        addSwitch(combo, AppConfig.COMBO_SPEED_ENABLED, "启用自定义连招速度",
                "关闭时完全保持红魔原生速度；首次安装或更新后请重启游戏作用域。", false);
        page.addView(combo, ui.margins(0, 0, 0, 12));

        LinearLayout speed = new LinearLayout(this);
        speed.setOrientation(LinearLayout.VERTICAL);
        addSlider(speed, AppConfig.COMBO_SPEED_RATE, "播放倍率（×）", 1, 10, false);
        page.addView(ui.collapsible("速度参数",
                "仅可选择整数倍率；1× 为原速，范围为 1× 至 10×。", speed, false),
                ui.margins(0, 0, 0, 12));
    }

    private void buildSuperResolution() {
        LinearLayout mirror = detailCard("性能模式超分",
                "仅放行红魔原生超分 Tile 的性能模式资格，不修改温控、GPU 服务或厂商数据库。");
        addSwitch(mirror, AppConfig.SUPER_MIRROR_LOW_MODE, "允许其他性能模式开启超分辨率",
                "只放行超分 Tile 点击资格；用户主动关闭仍有效。", false);
        page.addView(mirror, ui.margins(0, 0, 0, 12));
    }

    private void buildDiabloCoexist() {
        LinearLayout mirror = detailCard("超分与破坏神共存",
                "保留用户主动关闭能力，只阻止红魔在二者之间自动互斥。");
        addSwitch(mirror, AppConfig.SUPER_MIRROR_DIABLO_COEXIST, "允许超分与破坏神共存",
                "只阻止二者互相自动关闭。", false);
        page.addView(mirror, ui.margins(0, 0, 0, 12));
    }

    private void buildStatusLayout() {
        LinearLayout master = detailCard("状态栏布局",
                "直接调整当前手机的真实状态栏；找不到 OEM 结构时保持原生布局。");
        addSwitch(master, AppConfig.SYSTEMUI_MASTER, "启用状态栏增强",
                "总开关关闭时保持红魔 SystemUI 原生布局。", true);
        addSwitch(master, AppConfig.STATUSBAR_DUAL_LEFT, "左侧双排", "左侧增加第二排实时信息。", false);
        addSwitch(master, AppConfig.STATUSBAR_DUAL_RIGHT, "右侧双排", "右侧增加第二排实时信息。", false);
        addSwitch(master, AppConfig.STATUSBAR_CLOCK_ACROSS, "时钟跨双排", "将系统时钟在双排高度内纵向居中。", false);
        addSwitch(master, AppConfig.STATUSBAR_FREE_POSITION, "自由定位",
                "允许组件和单个系统图标进入包括中间区域在内的任意位置；风险只提示，不限制。", false);
        page.addView(master, ui.margins(0, 0, 0, 12));
        LinearLayout spacing = new LinearLayout(this);
        spacing.setOrientation(LinearLayout.VERTICAL);
        addNumber(spacing, AppConfig.STATUSBAR_HEIGHT_DP, "状态栏高度 dp（0 跟随系统）", false);
        addNumber(spacing, AppConfig.STATUSBAR_LEFT_MARGIN_DP, "左边距 dp", false);
        addNumber(spacing, AppConfig.STATUSBAR_RIGHT_MARGIN_DP, "右边距 dp", false);
        addNumber(spacing, AppConfig.STATUSBAR_TOP_MARGIN_DP, "上边距 dp", false);
        addNumber(spacing, AppConfig.STATUSBAR_BOTTOM_MARGIN_DP, "下边距 dp", false);
        page.addView(ui.collapsible("尺寸与边距", "默认均为 0，跟随系统原值；修改后按真实状态栏重新测量。", spacing, false),
                ui.margins(0, 0, 0, 12));

        LinearLayout components = new LinearLayout(this);
        components.setOrientation(LinearLayout.VERTICAL);
        addPosition(components, "clock", "时钟", 120, 500);
        addPosition(components, "notifications", "通知图标组", 300, 500);
        addPosition(components, "system_icons", "系统图标组", 760, 500);
        addPosition(components, "battery", "电池", 930, 500);
        addPosition(components, "fan", "散热风扇", 600, 500);
        addPosition(components, "metric.net", "网速", 180, 760);
        addPosition(components, "metric.thermal", "温度", 420, 760);
        addPosition(components, "metric.power", "电流与功率", 820, 760);
        page.addView(ui.collapsible("组件位置",
                "开启某项自定义位置后拖动横向/纵向滑杆；手机状态栏就是实时预览。", components, false),
                ui.margins(0, 0, 0, 12));

        LinearLayout icons = new LinearLayout(this);
        icons.setOrientation(LinearLayout.VERTICAL);
        statusIconControls = icons;
        for (String slot : DEVICE_STATUS_ICON_BASELINE) addStatusIconSlot(slot);
        addDiscoveredStatusIconSlots();
        page.addView(ui.collapsible("单个系统图标（本机动态清单）",
                "这里不是固定的 26 项：以本机注册基线起步，运行时发现的新图标会继续加入。未激活图标的位置会在它出现时使用。",
                icons, false), ui.margins(0, 0, 0, 12));
    }

    private void refreshStatusIconControls() {
        if (!MODULE_STATUS_LAYOUT.equals(section) || statusIconControls == null) return;
        addDiscoveredStatusIconSlots();
    }

    private void addDiscoveredStatusIconSlots() {
        String discovered = diagnostic("ls_augment_statusbar_discovered_icons");
        for (String slot : discovered.split(",")) addStatusIconSlot(slot.trim());
    }

    private void addStatusIconSlot(String slot) {
        if (statusIconControls == null || !slot.matches("[A-Za-z0-9_.:-]{1,80}")
                || renderedStatusIconSlots.containsKey(slot)) return;
        renderedStatusIconSlots.put(slot, Boolean.TRUE);
        boolean wasLoading = loading;
        loading = true;
        String id = "slot." + slot;
        addPosition(statusIconControls, id, iconLabel(slot), 760, 500);
        PositionControl control = positionControls.get(id);
        if (control != null && !positionValues.isEmpty()) {
            control.load(positionValues.get(id));
        }
        loading = wasLoading;
    }

    private void buildStatusClock() {
        LinearLayout clock = detailCard("双行自定义时钟",
                "两行分别使用标准日期格式；第二行留空就是单行。格式错误会保留上一次有效结果并明确提示。");
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_CUSTOM, "自定义时钟", "替换 SystemUI 时钟文本。", false);
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_24H, "24 小时制", "第一行留空时使用；关闭为 12 小时制。", false);
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_SECONDS, "显示秒", "第一行留空时使用；自定义格式含 s/S 时会自动按秒刷新。", false);
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_PERIOD, "显示时段", "显示上午、下午等本地时段。", false);
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_WEEK, "显示星期", "使用当前语言的星期格式。", false);
        addNumber(clock, AppConfig.STATUSBAR_CLOCK_PATTERN, "第一行格式（如 yy:MM-HH:mm）", true);
        addNumber(clock, AppConfig.STATUSBAR_CLOCK_PATTERN_SECOND,
                "第二行格式（如 E；固定文字 II 请写 'II'）", true);
        page.addView(clock, ui.margins(0, 0, 0, 12));

        LinearLayout font = new LinearLayout(this);
        font.setOrientation(LinearLayout.VERTICAL);
        addNumber(font, AppConfig.STATUSBAR_CLOCK_FONT_FAMILY,
                "字体（sans-serif / serif / monospace 等）", true);
        addDecimal(font, AppConfig.STATUSBAR_CLOCK_SIZE_SP, "字号 sp（0 跟随系统）");
        addNumber(font, AppConfig.STATUSBAR_CLOCK_WEIGHT, "字重（100–900）", false);
        addDecimal(font, AppConfig.STATUSBAR_CLOCK_LETTER_SPACING,
                "字间距（-0.20 至 1.00）");
        addDecimal(font, AppConfig.STATUSBAR_CLOCK_LINE_SPACING_DP,
                "两行额外间距 dp（0–32）");
        addNumber(font, AppConfig.STATUSBAR_CLOCK_WIDTH_DP, "固定宽度 dp（0 自动）", false);
        addChoice(font, AppConfig.STATUSBAR_CLOCK_TEXT_ALIGN, "文字对齐",
                new String[][]{{"left", "靠左"}, {"center", "居中"}, {"right", "靠右"}});
        page.addView(ui.collapsible("字体与排版",
                "Y 是周年份，y 是日历年份，E 是星期；不支持的格式字母不会被静默替换。",
                font, false), ui.margins(0, 0, 0, 12));
    }

    private void buildStatusMetrics() {
        LinearLayout metrics = detailCard("实时数据",
                "每一类数据都是可单独定位的真实状态栏组件；读取失败不会破坏原生状态栏。");
        addSwitch(metrics, AppConfig.STATUSBAR_NET_SPEED, "实时网速", "显示设备总实时速率。", false);
        addSwitch(metrics, AppConfig.STATUSBAR_THERMAL, "温度", "显示可读取的 CPU/GPU/电池温度。", false);
        addSwitch(metrics, AppConfig.STATUSBAR_BATTERY_POWER, "电流与功率", "根据电池电流和电压计算。", false);
        addNumber(metrics, AppConfig.STATUSBAR_NOTIFICATION_MAX, "通知图标最大数量（0 原生）", false);
        page.addView(metrics, ui.margins(0, 0, 0, 12));
    }

    private void buildDoubleApp() {
        LinearLayout doubleApp = detailCard("扩展应用双开",
                "保留红魔原生候选，并自动加入主空间中已安装、已启用的第三方 App。");
        addSwitch(doubleApp, AppConfig.DOUBLE_ANY_APP, "扩展第三方 App 双开候选",
                "只扩展红魔官方列表；双开的创建、删除和数据仍由红魔官方管理。", false);
        addSwitch(doubleApp, AppConfig.DOUBLE_LOW_MEMORY, "移除低内存限制", "关闭红魔双开页面的低内存受限分支。", false);
        page.addView(doubleApp, ui.margins(0, 0, 0, 12));
    }

    private void buildBeautify() {
        LinearLayout beautify = detailCard("主题无限期试用",
                "仅保留无限期试用；登录、账号与付费资源继续走原厂流程。");
        addSwitch(beautify, AppConfig.BEAUTIFY_UNLIMITED_TRIAL, "无限期试用",
                "只阻止原厂 TryUse 到期复位任务；不改价格、购买结果或服务器权益。", false);
        page.addView(beautify, ui.margins(0, 0, 0, 12));
    }

    private void buildAutomation() {
        LinearLayout automation = detailCard("锁屏自动隐藏",
                "使用按需前台服务监听屏幕关闭，不轮询；关闭后不驻留。");
        addSwitch(automation, AppConfig.AUTOMATION_ENABLED, "启用锁屏自动隐藏", "屏幕由亮转灭时执行一次，解锁不自动显示。", true);
        addSwitch(automation, "__scope_all", "处理所有配置用户", "关闭时只处理当前 Android 用户。", false);
        page.addView(automation, ui.margins(0, 0, 0, 12));
    }

    private void buildTile() {
        LinearLayout tile = detailCard("快捷设置磁贴",
                "混合或异常状态点击时优先恢复全部显示。");
        addSwitch(tile, AppConfig.TILE_ENABLED, "启用磁贴动作",
                "关闭后磁贴保留在控制中心，但不可执行隐藏或显示。", true);
        addNumber(tile, AppConfig.TILE_LABEL, "磁贴名称", true);
        addNumber(tile, AppConfig.TILE_DESCRIPTION, "磁贴说明", true);
        Button add = ui.button("请求添加快捷设置磁贴");
        add.setOnClickListener(view -> startActivity(new Intent(this, TileSetupActivity.class)));
        tile.addView(add, ui.margins(0, 8, 0, 0));
        page.addView(tile, ui.margins(0, 0, 0, 12));
    }

    private void buildLauncherIcon() {
        status.setText("桌面图标设置会立即生效，不需要重启作用域。");
        LinearLayout launcher = detailCard("桌面图标",
                "隐藏后仍可从 LSPosed 管理器的模块设置重新进入。");
        TextView launcherState = ui.statusChip("正在读取…", ui.accent);
        Button launcherAction = ui.tonalButton("");
        launcher.addView(launcherState, ui.margins(0, 12, 0, 0));
        launcher.addView(launcherAction, ui.margins(0, 8, 0, 0));
        page.addView(launcher, ui.margins(0, 0, 0, 12));
        Runnable render = () -> {
            boolean visible = launcherIconVisible();
            launcherState.setText(visible ? "当前：桌面显示" : "当前：桌面隐藏");
            launcherAction.setText(visible ? "隐藏桌面图标" : "恢复桌面图标");
        };
        launcherAction.setOnClickListener(view -> {
            if (!launcherIconVisible()) {
                setLauncherIconVisible(true); render.run(); toast("桌面图标已恢复"); return;
            }
            new AlertDialog.Builder(this).setTitle("隐藏桌面图标")
                    .setMessage("隐藏后请从 LSPosed 管理器的模块设置进入。")
                    .setNegativeButton("取消", null)
                    .setPositiveButton("隐藏", (dialog, which) -> {
                        setLauncherIconVisible(false); render.run(); toast("桌面图标已隐藏");
                    }).show();
        });
        render.run();
    }

    private void buildDiagnostics() {
        status.setText("诊断摘要只读取状态，不修改功能配置。");

        LinearLayout actions = ui.card();
        actions.addView(ui.section("诊断中心", "Root、LSPosed、设备、目标组件和最近错误。"), ui.wrap());
        Button refresh = ui.button("刷新诊断摘要");
        Button copy = ui.button("复制诊断摘要");
        Button export = ui.button("导出诊断与有限日志");
        actions.addView(refresh, ui.margins(0, 8, 0, 0));
        actions.addView(copy, ui.margins(0, 4, 0, 0));
        actions.addView(export, ui.margins(0, 4, 0, 0));
        page.addView(actions, ui.margins(0, 0, 0, 12));

        TextView output = ui.text("正在生成…", 12, ui.muted, false);
        output.setTextIsSelectable(true);
        output.setPadding(ui.dp(14), ui.dp(12), ui.dp(14), ui.dp(12));
        output.setBackground(ui.round(ui.card, 14));
        page.addView(output, ui.margins(0, 0, 0, 12));

        LinearLayout recovery = ui.card();
        recovery.addView(ui.section("恢复与同步", "恢复动作不会卸载应用、清除数据或修改 APK。"), ui.wrap());
        Button rootAccess = ui.button("重新申请 Root 授权");
        Button mirror = ui.button("重新同步配置运行镜像");
        Button restore = ui.button("紧急恢复全部已配置应用");
        recovery.addView(rootAccess, ui.margins(0, 8, 0, 0));
        recovery.addView(mirror, ui.margins(0, 4, 0, 0));
        recovery.addView(restore, ui.margins(0, 4, 0, 0));
        page.addView(recovery, ui.margins(0, 0, 0, 12));

        final String[] latest = {""};
        Runnable load = () -> executor.execute(() -> {
            String value = diagnosticSummary();
            latest[0] = value;
            main.post(() -> output.setText(value));
        });
        refresh.setOnClickListener(view -> load.run());
        rootAccess.setOnClickListener(view -> executor.execute(() -> {
            RootHideManager.RootStatus result = new RootHideManager(this).requestRootStatus();
            main.post(() -> {
                toast("Root：" + result.message + "（" + result.provider + "）");
                load.run();
            });
        }));
        copy.setOnClickListener(view -> {
            ClipboardManager clipboard = getSystemService(ClipboardManager.class);
            if (clipboard != null) clipboard.setPrimaryClip(ClipData.newPlainText("LS_Augment 诊断", latest[0]));
            toast("诊断摘要已复制");
        });
        export.setOnClickListener(view -> {
            pendingExport = latest[0] + "\n\n===== APP LOG =====\n" + AuditLog.read(this);
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                    .setType("text/plain")
                    .putExtra(Intent.EXTRA_TITLE, "LS_Augment-diagnostics-" + System.currentTimeMillis() + ".txt");
            startActivityForResult(intent, EXPORT_REQUEST);
        });
        mirror.setOnClickListener(view -> executor.execute(() -> {
            RootShell.Result configResult = config.mirrorAll();
            RootHideManager.OperationResult hidden = new RootHideManager(this).syncMirrors();
            main.post(() -> toast(configResult.isSuccess() && hidden.success
                    ? "运行镜像已同步" : "同步未完成：" + configResult.publicError() + "；" + hidden.message));
        }));
        restore.setOnClickListener(view -> new AlertDialog.Builder(this)
                .setTitle("紧急恢复")
                .setMessage("将显示新版本当前配置的全部隐藏目标，应用数据不会被删除。")
                .setNegativeButton("取消", null)
                .setPositiveButton("恢复全部", (dialog, which) -> executor.execute(() -> {
                    RootHideManager.OperationResult result = new RootHideManager(this).emergencyRestore();
                    main.post(() -> toast(result.message));
                })).show());
        load.run();
    }

    private void addSwitch(LinearLayout card, String key, String label, String description, boolean master) {
        if (card.getChildCount() > 0) {
            LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(-1, ui.dp(1));
            dividerParams.setMargins(0, ui.dp(7), 0, ui.dp(7));
            card.addView(ui.divider(), dividerParams);
        }
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.addView(ui.text(label, master ? 14.5f : 14, ui.text, master), ui.wrap());
        TextView detail = ui.text(description, 11, ui.muted, false);
        detail.setLineSpacing(ui.dp(1), 1.04f);
        copy.addView(detail, ui.margins(0, 3, 8, 0));
        Switch control = new Switch(this);
        ui.styleSwitch(control);
        control.setOnCheckedChangeListener((button, checked) -> markDirty());
        row.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        row.addView(control, new LinearLayout.LayoutParams(-2, -2));
        card.addView(row, ui.margins(0, 2, 0, 2));
        switches.put(key, control);
    }

    private void addNumber(LinearLayout card, String key, String label, boolean text) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.addView(ui.text(label, 12.5f, ui.text, true), ui.wrap());
        EditText input = new EditText(this);
        ui.styleInput(input);
        input.setSingleLine(true);
        input.setInputType(text ? InputType.TYPE_CLASS_TEXT : InputType.TYPE_CLASS_NUMBER);
        input.addTextChangedListener(new SimpleWatcher());
        row.addView(input, ui.margins(0, 7, 0, 0));
        card.addView(row, ui.margins(0, 7, 0, 5));
        inputs.put(key, input);
    }

    private void addDecimal(LinearLayout card, String key, String label) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.addView(ui.text(label, 12.5f, ui.text, true), ui.wrap());
        EditText input = new EditText(this);
        ui.styleInput(input);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL
                | InputType.TYPE_NUMBER_FLAG_SIGNED);
        input.addTextChangedListener(new SimpleWatcher());
        row.addView(input, ui.margins(0, 7, 0, 0));
        card.addView(row, ui.margins(0, 7, 0, 5));
        inputs.put(key, input);
    }

    private void addChoice(LinearLayout card, String key, String label, String[][] options) {
        TextView title = ui.text(label, 12.5f, ui.text, true);
        card.addView(title, ui.margins(0, 9, 0, 5));
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        Choice choice = new Choice(key);
        for (String[] option : options) {
            Button button = ui.tonalButton(option[1]);
            choice.values.put(option[0], button);
            button.setOnClickListener(view -> {
                choice.select(option[0]);
                markDirty();
            });
            row.addView(button, new LinearLayout.LayoutParams(0, ui.dp(42), 1.0f));
        }
        choice.select("center");
        choices.put(key, choice);
        card.addView(row, ui.margins(0, 0, 0, 5));
    }

    private void addPosition(LinearLayout card, String id, String label, int defaultX, int defaultY) {
        LinearLayout block = new LinearLayout(this);
        block.setOrientation(LinearLayout.VERTICAL);
        LinearLayout heading = new LinearLayout(this);
        heading.setOrientation(LinearLayout.HORIZONTAL);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        heading.addView(ui.text(label, 13, ui.text, true),
                new LinearLayout.LayoutParams(0, -2, 1.0f));
        Switch enabled = new Switch(this);
        ui.styleSwitch(enabled);
        heading.addView(enabled, new LinearLayout.LayoutParams(-2, -2));
        block.addView(heading, ui.wrap());

        TextView xValue = ui.text("", 11.5f, ui.muted, false);
        SeekBar x = positionBar();
        TextView yValue = ui.text("", 11.5f, ui.muted, false);
        SeekBar y = positionBar();
        block.addView(xValue, ui.margins(0, 3, 0, 0));
        block.addView(x, ui.wrap());
        block.addView(yValue, ui.wrap());
        block.addView(y, ui.wrap());

        PositionControl control = new PositionControl(
                id, label, defaultX, defaultY, enabled, x, y, xValue, yValue);
        enabled.setOnCheckedChangeListener((button, checked) -> {
            control.render();
            markDirty();
        });
        SeekBar.OnSeekBarChangeListener listener = new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                control.render();
                if (fromUser) markDirty();
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) { }
            @Override public void onStopTrackingTouch(SeekBar seekBar) { }
        };
        x.setOnSeekBarChangeListener(listener);
        y.setOnSeekBarChangeListener(listener);
        x.setProgress(defaultX);
        y.setProgress(defaultY);
        control.render();
        positionControls.put(id, control);
        card.addView(block, ui.margins(0, 8, 0, 8));
        card.addView(ui.divider(), new LinearLayout.LayoutParams(-1, ui.dp(1)));
    }

    private SeekBar positionBar() {
        SeekBar bar = new SeekBar(this);
        bar.setMax(1000);
        bar.setProgressTintList(ColorStateList.valueOf(ui.accent));
        bar.setThumbTintList(ColorStateList.valueOf(ui.accent));
        return bar;
    }

    private static String iconLabel(String slot) {
        switch (slot) {
            case "vpn": return "VPN（vpn）";
            case "ethernet": return "有线网络（ethernet）";
            case "screen_record": return "录屏（screen_record）";
            case "camera": return "摄像头使用提示（camera）";
            case "microphone": return "麦克风使用提示（microphone）";
            case "hotspot": return "热点（hotspot）";
            case "nfc": return "NFC（nfc）";
            case "location": return "定位（location）";
            case "bluetooth": return "蓝牙（bluetooth）";
            case "alarm_clock": return "闹钟（alarm_clock）";
            case "airplane": return "飞行模式（airplane）";
            case "wifi": return "Wi‑Fi（wifi）";
            case "mobile": return "移动网络（mobile）";
            case "ims_icon": return "IMS / HD（ims_icon）";
            case "NET_SPEED": return "系统网速（NET_SPEED）";
            default: return slot;
        }
    }

    private void addSlider(LinearLayout card, String key, String label, int min, int max, boolean percent) {
        TextView value = ui.text("", 12, ui.muted, false);
        card.addView(value, ui.margins(0, 10, 0, 0));
        SeekBar bar = new SeekBar(this);
        bar.setMax(max - min);
        bar.setProgressTintList(ColorStateList.valueOf(ui.accent));
        bar.setThumbTintList(ColorStateList.valueOf(ui.accent));
        Slider slider = new Slider(key, label, min, max, percent, bar, value);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                slider.render(); if (fromUser) markDirty();
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) { }
            @Override public void onStopTrackingTouch(SeekBar seekBar) { }
        });
        card.addView(bar, ui.wrap());
        sliders.put(key, slider);
    }

    private void addRecentsRecommendedReset(LinearLayout card, boolean stackParameters) {
        String summary = stackParameters
                ? "演示推荐：后层展开 0.32，前两张重叠 0.30。"
                : "演示推荐：字号 13 sp，与卡片间距 8 dp。";
        card.addView(ui.text(summary, 11, ui.muted, false),
                ui.margins(0, 7, 0, 0));
        Button reset = ui.tonalButton("恢复演示推荐值");
        reset.setOnClickListener(view -> restoreRecentsRecommendedValues(stackParameters));
        card.addView(reset, ui.margins(0, 9, 0, 4));
    }

    private void restoreRecentsRecommendedValues(boolean stackParameters) {
        boolean changed;
        if (stackParameters) {
            changed = setSliderValue(
                    AppConfig.RECENTS_COMPRESSION,
                    RecentsRecommendedConfig.COMPRESSION_PERCENT);
            changed |= setSliderValue(
                    AppConfig.RECENTS_FRONT_OVERLAP,
                    RecentsRecommendedConfig.FRONT_OVERLAP_PERCENT);
        } else {
            changed = setSliderValue(
                    AppConfig.RECENTS_MEMORY_TEXT_SP,
                    RecentsRecommendedConfig.MEMORY_TEXT_SP);
            changed |= setSliderValue(
                    AppConfig.RECENTS_MEMORY_GAP_DP,
                    RecentsRecommendedConfig.MEMORY_GAP_DP);
        }
        if (changed) {
            markDirty();
            toast("已恢复演示推荐值，点击保存后生效");
        } else {
            toast("当前已是演示推荐值");
        }
    }

    private boolean setSliderValue(String key, int value) {
        Slider slider = sliders.get(key);
        return slider != null && slider.setValue(value);
    }

    private void loadValues() {
        loading = true;
        for (Map.Entry<String, Switch> entry : switches.entrySet()) {
            if ("__scope_all".equals(entry.getKey())) {
                entry.getValue().setChecked("all".equals(config.get(AppConfig.AUTOMATION_SCOPE)));
            } else entry.getValue().setChecked(config.getBoolean(entry.getKey()));
        }
        for (Map.Entry<String, EditText> entry : inputs.entrySet()) entry.getValue().setText(config.get(entry.getKey()));
        for (Slider slider : sliders.values()) {
            float raw = config.getFloat(slider.key, slider.percent ? slider.min / 100f : slider.min);
            int value = slider.percent ? Math.round(raw * 100f) : Math.round(raw);
            slider.bar.setProgress(Math.max(0, Math.min(slider.max - slider.min, value - slider.min)));
            slider.render();
        }
        for (Choice choice : choices.values()) choice.select(config.get(choice.key));
        positionValues.clear();
        StatusBarLayoutSpec.ParseResult positions =
                StatusBarLayoutSpec.parse(config.get(AppConfig.STATUSBAR_LAYOUT_SPEC));
        if (positions.valid) positionValues.putAll(positions.spec.positions());
        for (PositionControl control : positionControls.values()) {
            StatusBarLayoutSpec.Position position = positionValues.get(control.id);
            control.load(position);
        }
        loading = false;
        dirty = false;
        changeGeneration = 0L;
        if (save != null) ui.setButtonEnabled(save, false);
        renderRuntimeStatus();
        if (isStatusModule()) {
            main.removeCallbacks(statusPoll);
            main.post(statusPoll);
        }
    }

    private void save() { save(false); }

    private void save(boolean automatic) {
        if (!dirty || saveInFlight) return;
        main.removeCallbacks(statusAutoSave);
        LinkedHashMap<String, String> updates = new LinkedHashMap<>();
        for (Map.Entry<String, Switch> entry : switches.entrySet()) {
            if ("__scope_all".equals(entry.getKey())) {
                updates.put(AppConfig.AUTOMATION_SCOPE, entry.getValue().isChecked() ? "all" : "current");
            } else updates.put(entry.getKey(), entry.getValue().isChecked() ? "1" : "0");
        }
        for (Map.Entry<String, EditText> entry : inputs.entrySet()) updates.put(entry.getKey(), entry.getValue().getText().toString());
        for (Slider slider : sliders.values()) updates.put(slider.key, slider.serialized());
        for (Choice choice : choices.values()) updates.put(choice.key, choice.selected);
        if (!positionControls.isEmpty()) {
            for (PositionControl control : positionControls.values()) {
                if (control.enabled.isChecked()) {
                    positionValues.put(control.id, new StatusBarLayoutSpec.Position(
                            control.x.getProgress(), control.y.getProgress()));
                } else {
                    positionValues.remove(control.id);
                }
            }
            updates.put(AppConfig.STATUSBAR_LAYOUT_SPEC,
                    StatusBarLayoutSpec.serialize(positionValues));
        }
        if (enabledIn(updates, AppConfig.SHOULDER_ENABLED, AppConfig.COMBO_SPEED_ENABLED,
                AppConfig.SUPER_MIRROR_LOW_MODE, AppConfig.SUPER_MIRROR_DIABLO_COEXIST)) {
            updates.put(AppConfig.GAME_MASTER, "1");
        }
        if (enabledIn(updates, AppConfig.STATUSBAR_DUAL_LEFT, AppConfig.STATUSBAR_DUAL_RIGHT,
                AppConfig.STATUSBAR_FREE_POSITION, AppConfig.STATUSBAR_CLOCK_CUSTOM,
                AppConfig.STATUSBAR_NET_SPEED,
                AppConfig.STATUSBAR_THERMAL, AppConfig.STATUSBAR_BATTERY_POWER)) {
            updates.put(AppConfig.SYSTEMUI_MASTER, "1");
        }
        if (enabledIn(updates, AppConfig.DOUBLE_ANY_APP, AppConfig.DOUBLE_LOW_MEMORY,
                AppConfig.BEAUTIFY_UNLIMITED_TRIAL)) {
            updates.put(AppConfig.APP_MASTER, "1");
        }
        long savingGeneration = changeGeneration;
        saveInFlight = true;
        ui.setButtonEnabled(save, false);
        executor.execute(() -> {
            AppConfig.SaveResult result = config.save(updates);
            if (MODULE_AUTOMATION.equals(section) && result.success) {
                ScreenAutomationService.sync(this);
            }
            main.post(() -> {
                saveInFlight = false;
                if (!automatic || !result.success) {
                    toast(result.message + "；" + restartHint());
                }
                if (result.success) {
                    dirty = savingGeneration != changeGeneration;
                    requestNotificationIfNeeded();
                    renderRuntimeStatus();
                } else {
                    dirty = true;
                }
                ui.setButtonEnabled(save, dirty);
                if (dirty && isStatusModule() && result.success) {
                    main.removeCallbacks(statusAutoSave);
                    main.postDelayed(statusAutoSave, 280L);
                }
            });
        });
    }

    private void renderRuntimeStatus() {
        String prefix;
        if (isRecentsModule()) {
            prefix = statusLine("Hook 安装", diagnostic("ls_augment_recents_installed"))
                    + statusLine("最近命中", diagnostic("ls_augment_recents_last_layout"))
                    + statusLine("最近错误", diagnostic("ls_augment_recents_last_error"));
        } else if (isGameModule()) {
            if (MODULE_SHOULDER.equals(section)) {
                prefix = statusLine("肩键安装", diagnostic("ls_augment_shoulder_installed"))
                        + statusLine("最近命中", diagnostic("ls_augment_shoulder_last_hit"))
                        + statusLine("最近错误", diagnostic("ls_augment_shoulder_last_error"));
            } else if (MODULE_COMBO_SPEED.equals(section)) {
                prefix = statusLine("速度 Hook", diagnostic("ls_augment_combo_speed_installed"))
                        + statusLine("文件缓存", diagnostic("ls_augment_combo_speed_cache_last_hit"))
                        + statusLine("最近调整", diagnostic("ls_augment_combo_speed_last_hit"))
                        + statusLine("最近错误", diagnostic("ls_augment_combo_speed_last_error"));
            } else {
                prefix = statusLine("超镜安装", diagnostic("ls_augment_super_mirror_installed"))
                        + statusLine("最近命中", diagnostic("ls_augment_super_mirror_last_hit"))
                        + statusLine("最近错误", diagnostic("ls_augment_super_mirror_last_error"));
            }
        } else if (isStatusModule()) {
            prefix = statusLine("实时链路", statusBarRealtimeState(
                    diagnostic("ls_augment_systemui_last_hit")))
                    + statusBarLayoutSummary(
                    diagnostic("ls_augment_statusbar_layout_state"))
                    + statusLine("本机当前发现图标",
                    iconCount(diagnostic("ls_augment_statusbar_discovered_icons")) + " 个（动态变化）")
                    + statusLine("时钟格式错误",
                    emptyAs(diagnostic("ls_augment_statusbar_clock_error"), "无"))
                    + statusLine("运行错误",
                    emptyAs(diagnostic("ls_augment_systemui_last_error"), "无"));
        } else if (MODULE_DOUBLE_APP.equals(section)) {
            prefix = statusLine("Hook 安装", diagnostic("ls_augment_doubleapp_installed"))
                    + statusLine("最近命中", diagnostic("ls_augment_doubleapp_last_hit"))
                    + statusLine("最近错误", diagnostic("ls_augment_doubleapp_last_error"));
        } else if (MODULE_BEAUTIFY.equals(section)) {
            prefix = statusLine("兼容", diagnostic("ls_augment_beautify_compat"))
                    + statusLine("最近命中", diagnostic("ls_augment_beautify_last_hit"))
                    + statusLine("最近错误", diagnostic("ls_augment_beautify_last_error"));
        } else if (MODULE_AUTOMATION.equals(section)) {
            prefix = getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .getString(AppConfig.AUTOMATION_LAST_EVENT, "尚未触发")
                    + errorLine(getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .getString(AppConfig.AUTOMATION_LAST_ERROR, ""));
        } else if (MODULE_TILE.equals(section)) {
            prefix = "磁贴状态：" + config.get(AppConfig.TILE_STATE);
        } else if (MODULE_LAUNCHER_ICON.equals(section)) {
            prefix = launcherIconVisible() ? "当前桌面图标可见" : "当前桌面图标已隐藏";
        } else {
            prefix = "诊断与恢复工具已就绪";
        }
        status.setText((prefix == null || prefix.trim().isEmpty() ? "尚无 Hook 命中记录" : prefix.trim())
                + "\n生效提示：" + restartHint());
    }

    private static String statusLine(String label, String value) {
        String clean = value == null || value.trim().isEmpty() ? "尚无记录" : value.trim();
        return label + "：" + clean + "\n";
    }

    private static String statusBarLayoutSummary(String raw) {
        if (raw == null || raw.trim().isEmpty()) return "实测范围：等待状态栏反馈\n";
        LinkedHashMap<String, String> values = new LinkedHashMap<>();
        for (String part : raw.split(";")) {
            int split = part.indexOf('=');
            if (split > 0) values.put(part.substring(0, split), part.substring(split + 1));
        }
        if (raw.startsWith("inactive")) {
            return "实时状态：增强已关闭，原生布局已恢复\n";
        }
        String size = values.getOrDefault("size", "等待测量");
        String overflow = humanIssue(values.get("overflow"));
        String collision = humanIssue(values.get("collision"));
        String risk = humanIssue(values.get("risk"));
        String error = values.get("config_error");
        return "实测可用范围：" + size + " px\n"
                + "越界：" + overflow + "\n"
                + "相互遮挡：" + collision + "\n"
                + "动态区域风险：" + risk + "\n"
                + (error == null || error.isEmpty() ? "" : "配置错误：" + error + "\n");
    }

    private static String humanIssue(String value) {
        if (value == null || value.isEmpty() || "none".equals(value)) return "无";
        String localized = value
                .replace("metric.net", "网速")
                .replace("metric.thermal", "温度")
                .replace("metric.power", "电流与功率")
                .replace("system_icons", "系统图标组")
                .replace("notifications", "通知图标组")
                .replace("clock", "时钟")
                .replace("battery", "电池")
                .replace("fan", "散热风扇")
                .replace("@cutout_space_view", "进入中间动态占位区")
                .replace("+", " 与 ")
                .replace(",", "、");
        return localized.replace("slot.", "图标 ");
    }

    private static String statusBarRealtimeState(String value) {
        if (value == null || value.trim().isEmpty()) return "等待 SystemUI 首次反馈";
        return value.startsWith("realtime_apply")
                ? "已连接，修改会直接反馈到当前状态栏" : value.trim();
    }

    private static String emptyAs(String value, String fallback) {
        return value == null || value.trim().isEmpty() ? fallback : value.trim();
    }

    private static int iconCount(String value) {
        if (value == null || value.trim().isEmpty()) return 0;
        int count = 0;
        for (String slot : value.split(",")) if (!slot.trim().isEmpty()) count++;
        return count;
    }

    private String diagnostic(String key) {
        return getSharedPreferences(AppConfig.DIAGNOSTICS, 0).getString(key, "");
    }

    private static String errorLine(String value) {
        return value == null || value.trim().isEmpty() ? "" : "\n错误：" + value.trim();
    }

    private static boolean enabledIn(Map<String, String> updates, String... keys) {
        for (String key : keys) if ("1".equals(updates.get(key))) return true;
        return false;
    }

    private String diagnosticSummary() {
        RootHideManager manager = new RootHideManager(this);
        RootHideManager.RootStatus root = manager.rootStatus();
        RootHideManager.ConflictState conflict = root.state == RootHideManager.RootState.GRANTED
                ? manager.conflictState() : new RootHideManager.ConflictState(false, false, "未检测");
        StringBuilder out = new StringBuilder();
        out.append("LS_Augment ").append(BuildConfig.VERSION_NAME).append('\n')
                .append("package=ls.augment.com\n")
                .append("time=").append(DateFormat.getDateTimeInstance().format(new Date())).append('\n')
                .append("device=").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n')
                .append("android=").append(Build.VERSION.RELEASE).append(" sdk=").append(Build.VERSION.SDK_INT).append('\n')
                .append("display=").append(Build.DISPLAY).append('\n')
                .append("root=").append(root.state).append(' ').append(root.provider).append(' ').append(root.message).append('\n')
                .append("legacy_conflict=").append(conflict.hasConflict()).append(' ').append(conflict.message).append('\n')
                .append("targets=").append(manager.targets().size()).append('\n');
        for (String packageName : new String[]{"com.android.settings", "com.android.systemui",
                "com.zte.mifavor.launcher", "com.zte.beautify", "com.zte.beautifyadapter",
                "com.zte.cn.doubleapp",
                "cn.nubia.gameassist"}) {
            out.append(packageName).append('=').append(packageVersion(packageName)).append('\n');
        }
        RootShell.Result globals = RootShell.run(
                "settings list global 2>/dev/null | grep '^ls_augment_' | head -n 160",
                null, 8, 128 * 1024);
        out.append("\nGLOBAL RUNTIME MIRRORS\n")
                .append(globals.isSuccess() ? globals.output : "unavailable:" + globals.publicError())
                .append('\n');
        out.append("\nHOOK DIAGNOSTICS\n");
        Map<String, ?> diagnostics = getSharedPreferences(AppConfig.DIAGNOSTICS, 0).getAll();
        ArrayList<String> keys = new ArrayList<>(diagnostics.keySet());
        Collections.sort(keys);
        for (String key : keys) out.append(key).append('=').append(diagnostics.get(key)).append('\n');
        return out.toString();
    }

    private String packageVersion(String packageName) {
        try {
            PackageInfo info = getPackageManager().getPackageInfo(packageName, 0);
            return info.versionName + " (" + info.getLongVersionCode() + ")";
        } catch (Throwable ignored) { return "not_installed_or_hidden"; }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != EXPORT_REQUEST || resultCode != RESULT_OK || data == null) return;
        Uri uri = data.getData();
        if (uri == null) return;
        try (OutputStream output = getContentResolver().openOutputStream(uri, "wt")) {
            if (output == null) throw new IllegalStateException("no_output");
            output.write(pendingExport.getBytes(StandardCharsets.UTF_8));
            toast("诊断文件已导出");
        } catch (Throwable error) { toast("导出失败：" + error.getClass().getSimpleName()); }
    }

    private void requestNotificationIfNeeded() {
        if (!MODULE_AUTOMATION.equals(section) || Build.VERSION.SDK_INT < 33
                || !config.getBoolean(AppConfig.AUTOMATION_ENABLED)) return;
        if (checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{Manifest.permission.POST_NOTIFICATIONS}, 2043);
        }
    }

    private void markDirty() {
        if (loading) return;
        dirty = true;
        changeGeneration++;
        if (save != null) ui.setButtonEnabled(save, true);
        if (isStatusModule()) {
            main.removeCallbacks(statusAutoSave);
            main.postDelayed(statusAutoSave, 320L);
        }
    }

    private String title() {
        switch (section) {
            case MODULE_RECENTS_STACK: return "横向重叠任务";
            case MODULE_RECENTS_MEMORY: return "后台内存标签";
            case MODULE_SHOULDER: return "全应用肩键";
            case MODULE_COMBO_SPEED: return "一键连招速度";
            case MODULE_SUPER_RESOLUTION: return "性能模式超分";
            case MODULE_DIABLO_COEXIST: return "超分与破坏神";
            case MODULE_STATUS_LAYOUT: return "状态栏布局";
            case MODULE_STATUS_CLOCK: return "时钟格式";
            case MODULE_STATUS_METRICS: return "实时数据";
            case MODULE_DOUBLE_APP: return "扩展应用双开";
            case MODULE_BEAUTIFY: return "主题无限期试用";
            case MODULE_AUTOMATION: return "锁屏自动隐藏";
            case MODULE_TILE: return "快捷设置磁贴";
            case MODULE_LAUNCHER_ICON: return "桌面图标";
            default: return "诊断与恢复";
        }
    }

    private String subtitle() {
        switch (section) {
            case MODULE_RECENTS_STACK: return "连续视觉堆叠；保留原生分页、手势与任务动作。";
            case MODULE_RECENTS_MEMORY: return "控制最近任务底部的唯一整机内存数据。";
            case MODULE_SHOULDER: return "第三方 App 自动适配，红魔 TGK 继续负责实体按键。";
            case MODULE_COMBO_SPEED: return "为游戏助手的一键连招设置播放倍率，不改原始录制。";
            case MODULE_SUPER_RESOLUTION: return "扩展红魔原生超分辨率的性能模式资格。";
            case MODULE_DIABLO_COEXIST: return "控制超分辨率与破坏神模式的互斥行为。";
            case MODULE_STATUS_LAYOUT: return "在真实状态栏中实时调整双排、尺寸、组件和单个图标位置。";
            case MODULE_STATUS_CLOCK: return "双行格式、字体与排版会直接反馈到当前状态栏。";
            case MODULE_STATUS_METRICS: return "控制状态栏中的可独立定位实时数据。";
            case MODULE_DOUBLE_APP: return "只扩展候选列表，分身仍由红魔官方框架管理。";
            case MODULE_BEAUTIFY: return "仅处理原厂明确试用资源的本地到期流程。";
            case MODULE_AUTOMATION: return "按需运行，无 KSU 模块依赖。";
            case MODULE_TILE: return "设置磁贴动作、名称和说明。";
            case MODULE_LAUNCHER_ICON: return "控制 LS_Augment 自身桌面入口。";
            default: return "查看兼容状态、最近命中、错误与恢复入口。";
        }
    }

    private String restartHint() {
        switch (section) {
            case MODULE_RECENTS_STACK:
            case MODULE_RECENTS_MEMORY: return "重启系统桌面后生效";
            case MODULE_SHOULDER:
            case MODULE_COMBO_SPEED:
            case MODULE_SUPER_RESOLUTION:
            case MODULE_DIABLO_COEXIST: return MODULE_COMBO_SPEED.equals(section)
                    ? "倍率保存后下一次连招生效；首次安装或更新需重启游戏作用域"
                    : "重启游戏作用域后生效";
            case MODULE_STATUS_LAYOUT:
            case MODULE_STATUS_CLOCK:
            case MODULE_STATUS_METRICS:
                return "修改会自动保存并直接反馈；仅首次安装或更新模块代码后需重启一次 SystemUI";
            case MODULE_DOUBLE_APP:
            case MODULE_BEAUTIFY: return "重启应用增强作用域后生效";
            default: return "立即生效";
        }
    }

    private String restartScope() {
        switch (section) {
            case MODULE_RECENTS_STACK:
            case MODULE_RECENTS_MEMORY: return ScopeRestartDialog.LAUNCHER;
            case MODULE_SHOULDER:
            case MODULE_COMBO_SPEED:
            case MODULE_SUPER_RESOLUTION:
            case MODULE_DIABLO_COEXIST: return ScopeRestartDialog.GAMES;
            case MODULE_STATUS_LAYOUT:
            case MODULE_STATUS_CLOCK:
            case MODULE_STATUS_METRICS: return ScopeRestartDialog.SYSTEM_UI;
            case MODULE_DOUBLE_APP:
            case MODULE_BEAUTIFY: return ScopeRestartDialog.APPS;
            default: return ScopeRestartDialog.SETTINGS;
        }
    }

    private boolean isRecentsModule() {
        return MODULE_RECENTS_STACK.equals(section) || MODULE_RECENTS_MEMORY.equals(section);
    }

    private boolean isGameModule() {
        return MODULE_SHOULDER.equals(section) || MODULE_COMBO_SPEED.equals(section)
                || MODULE_SUPER_RESOLUTION.equals(section)
                || MODULE_DIABLO_COEXIST.equals(section);
    }

    private boolean isStatusModule() {
        return MODULE_STATUS_LAYOUT.equals(section) || MODULE_STATUS_CLOCK.equals(section)
                || MODULE_STATUS_METRICS.equals(section);
    }

    private void toast(String message) { Toast.makeText(this, message, Toast.LENGTH_LONG).show(); }

    private boolean launcherIconVisible() {
        ComponentName alias = new ComponentName(this, getPackageName() + ".LauncherAlias");
        return getPackageManager().getComponentEnabledSetting(alias)
                != PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
    }

    private void setLauncherIconVisible(boolean visible) {
        ComponentName alias = new ComponentName(this, getPackageName() + ".LauncherAlias");
        getPackageManager().setComponentEnabledSetting(alias,
                visible ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                        : PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);
    }

    private final class SimpleWatcher implements TextWatcher {
        @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
        @Override public void onTextChanged(CharSequence s, int start, int before, int count) { markDirty(); }
        @Override public void afterTextChanged(Editable s) { }
    }

    private static final class Choice {
        final String key;
        final LinkedHashMap<String, Button> values = new LinkedHashMap<>();
        String selected = "";

        Choice(String key) { this.key = key; }

        void select(String value) {
            String target = values.containsKey(value) ? value
                    : values.containsKey("center") ? "center"
                    : values.isEmpty() ? "" : values.keySet().iterator().next();
            selected = target;
            for (Map.Entry<String, Button> entry : values.entrySet()) {
                entry.getValue().setAlpha(entry.getKey().equals(target) ? 1.0f : 0.48f);
            }
        }
    }

    private static final class PositionControl {
        final String id;
        final String label;
        final int defaultX;
        final int defaultY;
        final Switch enabled;
        final SeekBar x;
        final SeekBar y;
        final TextView xValue;
        final TextView yValue;

        PositionControl(String id, String label, int defaultX, int defaultY,
                Switch enabled, SeekBar x, SeekBar y, TextView xValue, TextView yValue) {
            this.id = id;
            this.label = label;
            this.defaultX = defaultX;
            this.defaultY = defaultY;
            this.enabled = enabled;
            this.x = x;
            this.y = y;
            this.xValue = xValue;
            this.yValue = yValue;
        }

        void load(StatusBarLayoutSpec.Position position) {
            x.setProgress(position == null ? defaultX : position.x);
            y.setProgress(position == null ? defaultY : position.y);
            enabled.setChecked(position != null);
            render();
        }

        void render() {
            boolean active = enabled.isChecked();
            x.setEnabled(active);
            y.setEnabled(active);
            x.setAlpha(active ? 1.0f : 0.35f);
            y.setAlpha(active ? 1.0f : 0.35f);
            xValue.setText(String.format(Locale.CHINA, "横向位置：%.1f%%",
                    x.getProgress() / 10.0f));
            yValue.setText(String.format(Locale.CHINA, "纵向位置：%.1f%%",
                    y.getProgress() / 10.0f));
        }
    }

    private static final class Slider {
        final String key, label;
        final int min, max;
        final boolean percent;
        final SeekBar bar;
        final TextView text;
        Slider(String key, String label, int min, int max, boolean percent, SeekBar bar, TextView text) {
            this.key = key; this.label = label; this.min = min; this.max = max;
            this.percent = percent; this.bar = bar; this.text = text;
        }
        int value() { return min + bar.getProgress(); }
        boolean setValue(int value) {
            int progress = Math.max(0, Math.min(max - min, value - min));
            if (bar.getProgress() == progress) return false;
            bar.setProgress(progress);
            render();
            return true;
        }
        void render() { text.setText(label + "：" + (percent
                ? String.format(Locale.US, "%.2f", value() / 100f) : String.valueOf(value()))); }
        String serialized() { return percent
                ? String.format(Locale.US, "%.2f", value() / 100f) : String.valueOf(value()); }
    }
}
