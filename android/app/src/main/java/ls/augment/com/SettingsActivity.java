package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import android.window.OnBackInvokedDispatcher;

import java.util.LinkedHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Ice Blue settings flow: grouped overview -> category -> feature detail. */
public final class SettingsActivity extends Activity {
    private static final String OVERVIEW = "overview";
    private static final String HIDE = "hide";
    private static final String RECENTS = "recents";
    private static final String GAME = "game";
    private static final String SYSTEM = "system";
    private static final String APPS = "apps";
    private static final String TOOLS = "tools";

    private static final Category[] CATEGORIES = {
            new Category(OVERVIEW, "概览", android.R.drawable.ic_menu_view),
            new Category(HIDE, "消失吧APP", android.R.drawable.ic_menu_close_clear_cancel),
            new Category(RECENTS, "最近任务", android.R.drawable.ic_menu_recent_history),
            new Category(GAME, "游戏增强", android.R.drawable.ic_menu_manage),
            new Category(SYSTEM, "状态栏", android.R.drawable.ic_menu_info_details),
            new Category(APPS, "应用增强", android.R.drawable.ic_menu_agenda),
            new Category(TOOLS, "工具", android.R.drawable.ic_menu_preferences)
    };

    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private UiKit ui;
    private AppConfig config;
    private LinearLayout page;
    private ScrollView pageScroll;
    private LinearLayout appBar;
    private LinearLayout activePanel;
    private int activePanelItems;
    private TextView rootState;
    private TextView lsposedState;
    private TextView compatibilityState;
    private String selected = OVERVIEW;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        ui = new UiKit(this);
        config = new AppConfig(this);
        buildScaffold();
        selected = state == null ? OVERVIEW : state.getString("category", OVERVIEW);
        if (HIDE.equals(selected) && !HiddenEntrySession.isUnlocked()) selected = OVERVIEW;
        renderCategory();
        refreshEnvironment();
        registerSystemBackCallback();
    }

    @Override protected void onResume() {
        super.onResume();
        if (HIDE.equals(selected) && !HiddenEntrySession.isUnlocked()) selected = OVERVIEW;
        renderCategory();
        refreshEnvironment();
    }

    @Override protected void onSaveInstanceState(Bundle out) {
        out.putString("category", selected);
        super.onSaveInstanceState(out);
    }

    @Override public void onBackPressed() {
        navigateBack();
    }

    private void navigateBack() {
        if (!OVERVIEW.equals(selected)) {
            selected = OVERVIEW;
            renderCategory();
            return;
        }
        finish();
    }

    private void registerSystemBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return;
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                this::navigateBack);
    }

    @Override protected void onDestroy() {
        executor.shutdownNow();
        super.onDestroy();
    }

    private void buildScaffold() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(ui.backgroundDrawable());
        // RedMagic's optional dual-row status bar can be taller than the stock
        // content inset reported to normal app windows.
        root.setPadding(0, ui.topAppInset(), 0, 0);

        appBar = new LinearLayout(this);
        appBar.setGravity(Gravity.CENTER_VERTICAL);
        appBar.setPadding(ui.dp(12), ui.dp(4), ui.dp(12), ui.dp(3));
        appBar.setMinimumHeight(ui.dp(60));
        root.addView(appBar, new LinearLayout.LayoutParams(-1, -2));
        root.addView(ui.divider(), new LinearLayout.LayoutParams(-1, ui.dp(1)));

        pageScroll = new ScrollView(this);
        pageScroll.setFillViewport(true);
        pageScroll.setClipToPadding(false);
        pageScroll.setVerticalScrollBarEnabled(false);
        pageScroll.setFocusableInTouchMode(true);
        pageScroll.requestFocus();
        page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(ui.dp(14), ui.dp(12), ui.dp(14), ui.dp(36));
        pageScroll.addView(page, new ScrollView.LayoutParams(-1, -2));
        root.addView(pageScroll, new LinearLayout.LayoutParams(-1, 0, 1));

        setContentView(root);
        ui.applyGestureInset(root, 8);
    }

    private void renderAppBar() {
        appBar.removeAllViews();
        if (!OVERVIEW.equals(selected)) {
            ImageButton back = new ImageButton(this);
            back.setImageResource(R.drawable.ic_arrow_back);
            back.setScaleType(ImageView.ScaleType.CENTER);
            back.setColorFilter(ui.text);
            back.setPadding(ui.dp(11), ui.dp(11), ui.dp(11), ui.dp(11));
            back.setBackground(ui.pressable(ui.round(Color.TRANSPARENT, 50)));
            back.setContentDescription("返回概览");
            back.setOnClickListener(view -> selectCategory(OVERVIEW));
            appBar.addView(back, new LinearLayout.LayoutParams(ui.dp(44), ui.dp(44)));
            TextView title = ui.text(categoryCopy(selected)[0], 19, ui.text, true);
            LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(0, -2, 1);
            titleParams.setMargins(ui.dp(5), 0, ui.dp(7), 0);
            appBar.addView(title, titleParams);
        } else {
            ImageView logo = new ImageView(this);
            logo.setImageResource(R.drawable.ic_ls_augment_boat);
            logo.setScaleType(ImageView.ScaleType.FIT_CENTER);
            logo.setPadding(ui.dp(6), ui.dp(6), ui.dp(6), ui.dp(6));
            logo.setBackground(ui.round(ui.accentContainer, 11));
            logo.setContentDescription("LS_Augment 小舟标志");
            LinearLayout.LayoutParams logoParams = new LinearLayout.LayoutParams(
                    ui.dp(42), ui.dp(42));
            logoParams.setMargins(0, 0, ui.dp(10), 0);
            appBar.addView(logo, logoParams);
            LinearLayout brand = new LinearLayout(this);
            brand.setOrientation(LinearLayout.VERTICAL);
            brand.addView(ui.text("LS_Augment", 21, ui.text, true), ui.wrap());
            brand.addView(ui.text("LSPosed Module", 10.5f, ui.muted, false),
                    ui.margins(0, 3, 0, 0));
            appBar.addView(brand, new LinearLayout.LayoutParams(0, -2, 1));
        }
        ScopeRestartDialog.addButton(this, ui, appBar, scopeForSelected());
    }

    private void selectCategory(String category) {
        boolean known = false;
        for (Category item : CATEGORIES) if (item.id.equals(category)) known = true;
        selected = known && (!HIDE.equals(category) || HiddenEntrySession.isUnlocked())
                ? category : OVERVIEW;
        renderCategory();
    }

    private String scopeForSelected() {
        if (RECENTS.equals(selected)) return ScopeRestartDialog.LAUNCHER;
        if (SYSTEM.equals(selected)) return ScopeRestartDialog.SYSTEM_UI;
        if (GAME.equals(selected)) return ScopeRestartDialog.GAMES;
        if (APPS.equals(selected)) return ScopeRestartDialog.APPS;
        if (HIDE.equals(selected)) return ScopeRestartDialog.SETTINGS;
        return null;
    }

    private void renderCategory() {
        if (page == null) return;
        renderAppBar();
        page.removeAllViews();
        activePanel = null;
        activePanelItems = 0;
        rootState = null;
        lsposedState = null;
        compatibilityState = null;
        if (!OVERVIEW.equals(selected)) {
            TextView subtitle = ui.text(categoryCopy(selected)[1], 11.5f, ui.muted, false);
            subtitle.setLineSpacing(ui.dp(1), 1.06f);
            page.addView(subtitle, ui.margins(1, 1, 1, 13));
        }

        switch (selected) {
            case HIDE: renderHide(); break;
            case RECENTS: renderRecents(); break;
            case GAME: renderGame(); break;
            case SYSTEM: renderSystem(); break;
            case APPS: renderApps(); break;
            case TOOLS: renderTools(); break;
            default: renderOverview();
        }
        pageScroll.post(() -> pageScroll.scrollTo(0, 0));
    }

    private void renderOverview() {
        page.addView(ui.overline("模块状态"), ui.margins(3, 1, 3, 7));
        LinearLayout statusPanel = ui.card();
        statusPanel.setOrientation(LinearLayout.HORIZONTAL);
        statusPanel.setGravity(Gravity.CENTER_VERTICAL);
        ImageView icon = new ImageView(this);
        icon.setImageResource(R.drawable.ic_ls_augment_boat);
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        icon.setPadding(ui.dp(6), ui.dp(6), ui.dp(6), ui.dp(6));
        icon.setBackground(ui.round(ui.accentContainer, 11));
        icon.setClickable(true);
        icon.setFocusable(true);
        icon.setContentDescription("连续点击版本图标进入消失吧APP");
        icon.setOnClickListener(view -> onVersionTapped());
        statusPanel.addView(icon, new LinearLayout.LayoutParams(ui.dp(42), ui.dp(42)));

        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.addView(ui.text("LS_Augment", 14, ui.text, true), ui.wrap());
        lsposedState = ui.text("正在读取 LSPosed…", 10.5f, ui.cyan, true);
        rootState = ui.text("Root 正在读取…", 10.5f, ui.muted, false);
        compatibilityState = ui.text(BuildConfig.VERSION_NAME, 10.5f, ui.accent, false);
        copy.addView(lsposedState, ui.margins(0, 3, 0, 0));
        copy.addView(rootState, ui.margins(0, 2, 0, 0));
        copy.addView(compatibilityState, ui.margins(0, 2, 0, 0));
        LinearLayout.LayoutParams copyParams = new LinearLayout.LayoutParams(0, -2, 1);
        copyParams.setMargins(ui.dp(10), 0, 0, 0);
        statusPanel.addView(copy, copyParams);
        compatibilityState.setContentDescription("当前完整版本号 " + BuildConfig.VERSION_NAME);
        page.addView(statusPanel, ui.margins(0, 0, 0, 13));

        if (HiddenEntrySession.isUnlocked()) {
            addCategorySection("应用管理", category(HIDE), category(APPS));
        } else {
            addCategorySection("应用管理", category(APPS));
        }
        addCategorySection("系统界面", category(RECENTS), category(SYSTEM));
        addCategorySection("游戏与性能", category(GAME));
        addCategorySection("模块设置", category(TOOLS));
        refreshEnvironment();
    }

    private Category category(String id) {
        for (Category item : CATEGORIES) if (item.id.equals(id)) return item;
        return CATEGORIES[0];
    }

    private void addCategorySection(String title, Category... categories) {
        page.addView(ui.overline(title), ui.margins(3, 2, 3, 7));
        LinearLayout panel = ui.card();
        panel.setPadding(0, 0, 0, 0);
        for (int i = 0; i < categories.length; i++) {
            if (i > 0) addInsetDivider(panel);
            addCategoryRow(panel, categories[i]);
        }
        page.addView(panel, ui.margins(0, 0, 0, 13));
    }

    private void addCategoryRow(LinearLayout panel, Category category) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(ui.dp(12), ui.dp(10), ui.dp(10), ui.dp(10));
        ImageView icon = new ImageView(this);
        icon.setImageResource(category.icon);
        icon.setColorFilter(ui.accent);
        icon.setPadding(ui.dp(7), ui.dp(7), ui.dp(7), ui.dp(7));
        icon.setBackground(ui.round(ui.accentContainer, 10));
        row.addView(icon, new LinearLayout.LayoutParams(ui.dp(36), ui.dp(36)));

        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.addView(ui.text(category.label, 14, ui.text, true), ui.wrap());
        TextView detail = ui.text(categoryDescription(category.id), 10.5f, ui.muted, false);
        detail.setMaxLines(2);
        copy.addView(detail, ui.margins(0, 3, 0, 0));
        LinearLayout.LayoutParams copyParams = new LinearLayout.LayoutParams(0, -2, 1);
        copyParams.setMargins(ui.dp(10), 0, ui.dp(6), 0);
        row.addView(copy, copyParams);

        ImageView arrow = new ImageView(this);
        arrow.setImageResource(R.drawable.ic_chevron_right);
        arrow.setColorFilter(ui.muted);
        arrow.setPadding(ui.dp(4), ui.dp(10), ui.dp(4), ui.dp(10));
        row.addView(arrow, new LinearLayout.LayoutParams(ui.dp(24), ui.dp(44)));
        row.setClickable(true);
        row.setFocusable(true);
        row.setContentDescription("进入" + category.label);
        row.setBackground(ui.pressable(ui.round(Color.TRANSPARENT, 10)));
        row.setOnClickListener(view -> selectCategory(category.id));
        panel.addView(row, ui.wrap());
    }

    private String categoryDescription(String category) {
        switch (category) {
            case HIDE: return "应用隐藏、自动化与快捷恢复";
            case RECENTS: return "横向重叠与整机内存标签";
            case GAME: return "肩键、一键连招速度、超分辨率与破坏神策略";
            case SYSTEM: return "双排布局、时钟与实时数据";
            case APPS: return "红魔双开扩展与主题无限期试用";
            case TOOLS: return "桌面入口、诊断、日志与恢复";
            default: return "模块运行状态与版本";
        }
    }

    private void renderHide() {
        beginPanel("隐藏与自动化", "按空间配置目标，应用列表默认收起。", true);
        addModule("消失吧APP", "管理应用隐藏、显示与紧急恢复。",
                AppConfig.HIDE_MASTER, null, ScopeRestartDialog.SETTINGS,
                view -> startActivity(new Intent(this, HideAppsActivity.class)));
        addModule("锁屏自动隐藏", "熄屏时对已保存目标执行一次隐藏。",
                AppConfig.AUTOMATION_ENABLED, FeatureActivity.MODULE_AUTOMATION,
                ScopeRestartDialog.SETTINGS, null);
        addModule("快捷设置磁贴", "从控制中心快速切换全部显示或隐藏。",
                AppConfig.TILE_ENABLED, FeatureActivity.MODULE_TILE,
                ScopeRestartDialog.SETTINGS, null);
    }

    private void renderRecents() {
        beginPanel("视觉与信息", "只调整视觉层，不接管 Quickstep 分页。", true);
        addModule("iOS 横向重叠", "连续堆叠并保留滑动、吸附、点击和上滑关闭。",
                AppConfig.RECENTS_ENABLED, FeatureActivity.MODULE_RECENTS_STACK,
                ScopeRestartDialog.LAUNCHER, null);
        addModule("后台内存标签", "底部只显示一条“可用内存 / 总内存”数据。",
                AppConfig.RECENTS_MEMORY_ENABLED, FeatureActivity.MODULE_RECENTS_MEMORY,
                ScopeRestartDialog.LAUNCHER, null);
    }

    private void renderGame() {
        beginPanel("功能开关", "肩键、一键连招速度、超分辨率与破坏神共存策略。", true);
        addModule("肩键全应用", "自动放行已安装、已启用的第三方 App。",
                AppConfig.SHOULDER_ENABLED, FeatureActivity.MODULE_SHOULDER,
                ScopeRestartDialog.GAMES, null);
        addModule("一键连招速度", "调整游戏助手录制连招的播放倍率。",
                AppConfig.COMBO_SPEED_ENABLED, FeatureActivity.MODULE_COMBO_SPEED,
                ScopeRestartDialog.GAMES, null);
        addModule("性能模式超分", "允许其他性能模式使用红魔原生超分辨率。",
                AppConfig.SUPER_MIRROR_LOW_MODE, FeatureActivity.MODULE_SUPER_RESOLUTION,
                ScopeRestartDialog.GAMES, null);
        addModule("超分与破坏神共存", "阻止两项能力互相自动关闭。",
                AppConfig.SUPER_MIRROR_DIABLO_COEXIST, FeatureActivity.MODULE_DIABLO_COEXIST,
                ScopeRestartDialog.GAMES, null);
    }

    private void renderSystem() {
        beginPanel("状态栏功能", "Android 16 SystemUI 布局与实时信息。", true);
        addModule("状态栏布局", "左右双排、跨排时钟、高度与安全边距。",
                AppConfig.SYSTEMUI_MASTER, FeatureActivity.MODULE_STATUS_LAYOUT,
                ScopeRestartDialog.SYSTEM_UI, null);
        addModule("时钟格式", "12/24 小时、秒、时段、星期和自定义格式。",
                AppConfig.STATUSBAR_CLOCK_CUSTOM, FeatureActivity.MODULE_STATUS_CLOCK,
                ScopeRestartDialog.SYSTEM_UI, null);
        addModule("实时数据", "网速、温度、电流、功率和通知数量。",
                AppConfig.STATUSBAR_NET_SPEED, FeatureActivity.MODULE_STATUS_METRICS,
                ScopeRestartDialog.SYSTEM_UI, null);
    }

    private void renderApps() {
        beginPanel("扩展能力", "保留原厂管理流程，只扩展对应能力。", true);
        addModule("扩展应用双开", "保留红魔原生候选并补充第三方 App。",
                AppConfig.DOUBLE_ANY_APP, FeatureActivity.MODULE_DOUBLE_APP,
                ScopeRestartDialog.APPS, null);
        addModule("主题无限期试用", "仅处理已确认试用资源的本地到期复位。",
                AppConfig.BEAUTIFY_UNLIMITED_TRIAL, FeatureActivity.MODULE_BEAUTIFY,
                ScopeRestartDialog.APPS, null);
    }

    private void renderTools() {
        beginPanel("模块工具", "入口管理、运行诊断、恢复和日志。", true);
        addUtility("桌面图标", "隐藏或恢复 LS_Augment 自身桌面入口。",
                launcherIconStatus(), FeatureActivity.MODULE_LAUNCHER_ICON);
        addUtility("诊断与恢复", "查看 Hook 命中、导出日志、同步镜像与紧急恢复。",
                "只读诊断", FeatureActivity.MODULE_DIAGNOSTICS);
    }

    private LinearLayout beginPanel(String title, String description, boolean attach) {
        LinearLayout heading = ui.section(title, description);
        page.addView(heading, ui.margins(3, 0, 3, 7));
        LinearLayout panel = ui.card();
        panel.setPadding(0, 0, 0, 0);
        activePanel = panel;
        activePanelItems = 0;
        if (attach) page.addView(panel, ui.margins(0, 0, 0, 13));
        return panel;
    }

    private TextView addStatusRow(LinearLayout panel, int iconResource, String name,
            String value, int valueColor) {
        if (activePanelItems++ > 0) addInsetDivider(panel);
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(ui.dp(13), ui.dp(10), ui.dp(13), ui.dp(10));
        ImageView icon = new ImageView(this);
        icon.setImageResource(iconResource);
        icon.setColorFilter(valueColor);
        icon.setPadding(ui.dp(7), ui.dp(7), ui.dp(7), ui.dp(7));
        icon.setBackground(ui.round(ui.accentContainer, 10));
        row.addView(icon, new LinearLayout.LayoutParams(ui.dp(36), ui.dp(36)));
        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        TextView label = ui.text(name, 13.5f, ui.text, true);
        copy.addView(label, ui.wrap());
        TextView state = ui.text(value, 10.5f, valueColor, true);
        state.setMaxLines(2);
        copy.addView(state, ui.margins(0, 3, 0, 0));
        LinearLayout.LayoutParams copyParams = new LinearLayout.LayoutParams(0, -2, 1);
        copyParams.setMargins(ui.dp(10), 0, 0, 0);
        row.addView(copy, copyParams);
        panel.addView(row, ui.wrap());
        return state;
    }

    private void addModule(String name, String description, String key, String module,
            String scope, View.OnClickListener customOpen) {
        boolean enabled = config.getBoolean(key);
        if (activePanelItems++ > 0) addInsetDivider(activePanel);
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(ui.dp(12), ui.dp(9), ui.dp(9), ui.dp(9));

        ImageView icon = new ImageView(this);
        icon.setImageResource(moduleIcon(module, name));
        icon.setColorFilter(ui.accent);
        icon.setPadding(ui.dp(7), ui.dp(7), ui.dp(7), ui.dp(7));
        icon.setBackground(ui.round(ui.accentContainer, 10));
        row.addView(icon, new LinearLayout.LayoutParams(ui.dp(36), ui.dp(36)));

        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        TextView title = ui.text(name, 14, ui.text, true);
        title.setMaxLines(2);
        copy.addView(title, ui.wrap());
        TextView detail = ui.text(description, 10.5f, ui.muted, false);
        detail.setMaxLines(2);
        detail.setLineSpacing(ui.dp(1), 1.04f);
        copy.addView(detail, ui.margins(0, 3, 0, 0));
        LinearLayout.LayoutParams copyParams = new LinearLayout.LayoutParams(0, -2, 1);
        copyParams.setMargins(ui.dp(10), 0, ui.dp(4), 0);
        row.addView(copy, copyParams);

        Switch control = new Switch(this);
        ui.styleSwitch(control);
        control.setChecked(enabled);
        control.setContentDescription(name + (enabled ? "已开启" : "已关闭"));
        row.addView(control, new LinearLayout.LayoutParams(-2, ui.dp(44)));

        ImageView enter = new ImageView(this);
        enter.setImageResource(R.drawable.ic_chevron_right);
        enter.setColorFilter(ui.muted);
        enter.setPadding(ui.dp(4), ui.dp(11), ui.dp(4), ui.dp(11));
        enter.setContentDescription("打开" + name + "详情");
        row.addView(enter, new LinearLayout.LayoutParams(ui.dp(22), ui.dp(44)));

        View.OnClickListener open = customOpen != null ? customOpen : view -> openModule(module);
        row.setClickable(true);
        row.setFocusable(true);
        row.setBackground(ui.pressable(ui.round(Color.TRANSPARENT, 10)));
        row.setOnClickListener(open);
        enter.setOnClickListener(open);
        control.setOnCheckedChangeListener((button, checked) -> saveQuickSwitch(
                key, checked, control, name, scope));
        activePanel.addView(row, ui.wrap());
    }

    private void addUtility(String name, String description, String status, String module) {
        if (activePanelItems++ > 0) addInsetDivider(activePanel);
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(ui.dp(12), ui.dp(10), ui.dp(10), ui.dp(10));
        ImageView icon = new ImageView(this);
        icon.setImageResource(moduleIcon(module, name));
        icon.setColorFilter(ui.accent);
        icon.setPadding(ui.dp(7), ui.dp(7), ui.dp(7), ui.dp(7));
        icon.setBackground(ui.round(ui.accentContainer, 10));
        row.addView(icon, new LinearLayout.LayoutParams(ui.dp(36), ui.dp(36)));
        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.addView(ui.text(name, 14, ui.text, true), ui.wrap());
        TextView detail = ui.text(description, 10.5f, ui.muted, false);
        detail.setMaxLines(2);
        copy.addView(detail, ui.margins(0, 3, 0, 0));
        copy.addView(ui.statusChip(status, ui.accent), ui.margins(0, 5, 0, 0));
        LinearLayout.LayoutParams copyParams = new LinearLayout.LayoutParams(0, -2, 1);
        copyParams.setMargins(ui.dp(10), 0, ui.dp(5), 0);
        row.addView(copy, copyParams);
        ImageView enter = new ImageView(this);
        enter.setImageResource(R.drawable.ic_chevron_right);
        enter.setColorFilter(ui.muted);
        enter.setPadding(ui.dp(4), ui.dp(10), ui.dp(4), ui.dp(10));
        row.addView(enter, new LinearLayout.LayoutParams(ui.dp(24), ui.dp(44)));
        View.OnClickListener open = view -> openModule(module);
        row.setClickable(true);
        row.setFocusable(true);
        row.setBackground(ui.pressable(ui.round(Color.TRANSPARENT, 10)));
        row.setOnClickListener(open);
        enter.setOnClickListener(open);
        activePanel.addView(row, ui.wrap());
    }

    private void addInsetDivider(LinearLayout parent) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, ui.dp(1));
        params.setMargins(ui.dp(16), 0, ui.dp(16), 0);
        parent.addView(ui.divider(), params);
    }

    private int moduleIcon(String module, String name) {
        if (FeatureActivity.MODULE_RECENTS_STACK.equals(module)
                || FeatureActivity.MODULE_RECENTS_MEMORY.equals(module)) {
            return android.R.drawable.ic_menu_recent_history;
        }
        if (FeatureActivity.MODULE_SHOULDER.equals(module)
                || FeatureActivity.MODULE_COMBO_SPEED.equals(module)
                || FeatureActivity.MODULE_SUPER_RESOLUTION.equals(module)
                || FeatureActivity.MODULE_DIABLO_COEXIST.equals(module)) {
            return android.R.drawable.ic_menu_manage;
        }
        if (FeatureActivity.MODULE_STATUS_LAYOUT.equals(module)
                || FeatureActivity.MODULE_STATUS_CLOCK.equals(module)
                || FeatureActivity.MODULE_STATUS_METRICS.equals(module)) {
            return android.R.drawable.ic_menu_info_details;
        }
        if (FeatureActivity.MODULE_DOUBLE_APP.equals(module)) {
            return android.R.drawable.ic_menu_add;
        }
        if (FeatureActivity.MODULE_BEAUTIFY.equals(module)) {
            return android.R.drawable.ic_menu_gallery;
        }
        if (FeatureActivity.MODULE_AUTOMATION.equals(module)) {
            return android.R.drawable.ic_lock_idle_lock;
        }
        if (FeatureActivity.MODULE_TILE.equals(module)) {
            return android.R.drawable.ic_menu_share;
        }
        if (name.contains("消失吧")) return android.R.drawable.ic_menu_close_clear_cancel;
        return android.R.drawable.ic_menu_preferences;
    }

    private void saveQuickSwitch(String key, boolean checked, Switch control,
            String label, String scope) {
        control.setEnabled(false);
        LinkedHashMap<String, String> updates = new LinkedHashMap<>();
        updates.put(key, checked ? "1" : "0");
        String master = masterFor(key);
        if (checked && master != null) updates.put(master, "1");
        executor.execute(() -> {
            AppConfig.SaveResult result = config.save(updates);
            if (AppConfig.AUTOMATION_ENABLED.equals(key) && result.success) {
                ScreenAutomationService.sync(this);
            }
            main.post(() -> {
                control.setEnabled(true);
                if (!result.success) {
                    control.setOnCheckedChangeListener(null);
                    control.setChecked(!checked);
                    control.setOnCheckedChangeListener((button, value) -> saveQuickSwitch(
                            key, value, control, label, scope));
                }
                Toast.makeText(this, result.success
                        ? label + (checked ? "已开启；需要时使用右上角重启" : "已关闭")
                        : result.message, Toast.LENGTH_LONG).show();
                renderCategory();
            });
        });
    }

    private String masterFor(String key) {
        if (AppConfig.SHOULDER_ENABLED.equals(key)
                || AppConfig.COMBO_SPEED_ENABLED.equals(key)
                || AppConfig.SUPER_MIRROR_LOW_MODE.equals(key)
                || AppConfig.SUPER_MIRROR_DIABLO_COEXIST.equals(key)) return AppConfig.GAME_MASTER;
        if (key.startsWith("ls_augment_statusbar_")) return AppConfig.SYSTEMUI_MASTER;
        if (AppConfig.DOUBLE_ANY_APP.equals(key) || AppConfig.DOUBLE_LOW_MEMORY.equals(key)
                || AppConfig.BEAUTIFY_UNLIMITED_TRIAL.equals(key)) return AppConfig.APP_MASTER;
        return null;
    }

    private void openModule(String module) {
        Intent intent = new Intent(this, FeatureActivity.class);
        intent.putExtra(FeatureActivity.EXTRA_MODULE, module);
        startActivity(intent);
    }

    private String launcherIconStatus() {
        android.content.ComponentName alias = new android.content.ComponentName(
                this, getPackageName() + ".LauncherAlias");
        return getPackageManager().getComponentEnabledSetting(alias)
                == android.content.pm.PackageManager.COMPONENT_ENABLED_STATE_DISABLED
                ? "桌面隐藏" : "桌面显示";
    }

    private String[] categoryCopy(String category) {
        switch (category) {
            case HIDE: return new String[]{"消失吧APP", "隐藏、自动化与快捷入口。"};
            case RECENTS: return new String[]{"最近任务", "横向重叠视觉和整机内存数据。"};
            case GAME: return new String[]{"游戏增强", "肩键、一键连招速度、超分辨率与破坏神策略。"};
            case SYSTEM: return new String[]{"状态栏", "Android 16 布局、时钟与实时数据。"};
            case APPS: return new String[]{"应用增强", "红魔双开扩展与主题无限期试用。"};
            case TOOLS: return new String[]{"工具", "桌面入口、运行诊断与恢复。"};
            default: return new String[]{"概览", "先确认运行状态，再进入具体功能。"};
        }
    }

    private void onVersionTapped() {
        HiddenEntrySession.TapResult result = HiddenEntrySession.recordVersionTap(
                SystemClock.uptimeMillis());
        if (result == HiddenEntrySession.TapResult.NONE) return;
        if (result == HiddenEntrySession.TapResult.OPENED) {
            renderCategory();
            Toast.makeText(this, "完整功能开放", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(this, "完整功能已开放", Toast.LENGTH_SHORT).show();
        }
    }

    private void refreshEnvironment() {
        executor.execute(() -> {
            RootHideManager manager = new RootHideManager(this);
            RootHideManager.RootStatus root = manager.rootStatus();
            RootHideManager.ConflictState conflict = root.state == RootHideManager.RootState.GRANTED
                    ? manager.conflictState()
                    : new RootHideManager.ConflictState(false, false, "未执行冲突检测");
            RootShell.Result posed = root.state == RootHideManager.RootState.GRANTED
                    ? RootShell.run("printf '%s|%s' "
                    + "\"$(settings get global ls_augment_probe_api)\" "
                    + "\"$(settings get global ls_augment_probe_version)\"", null, 6, 4096)
                    : new RootShell.Result(126, "LSPosed 状态暂不可读", false);
            String rootText = root.state == RootHideManager.RootState.GRANTED
                    ? "Root · 已授权" : "Root · " + root.message;
            String posedText = posed.isSuccess() && !posed.output.startsWith("null|")
                    ? "LSPosed · 已激活 · API " + posed.output.split("\\|", -1)[0]
                    : "LSPosed · 未检测到当前探针";
            String versionText = BuildConfig.VERSION_NAME;
            main.post(() -> {
                if (rootState != null) {
                    rootState.setText(rootText);
                    rootState.setTextColor(root.state == RootHideManager.RootState.GRANTED
                            ? ui.cyan : ui.danger);
                }
                if (lsposedState != null) {
                    lsposedState.setText(posedText);
                    lsposedState.setTextColor(posed.isSuccess() ? ui.cyan : ui.danger);
                }
                if (compatibilityState != null) {
                    compatibilityState.setText(versionText);
                    compatibilityState.setTextColor(conflict.hasConflict() ? ui.warning : ui.accent);
                }
            });
        });
    }

    private static final class Category {
        final String id;
        final String label;
        final int icon;

        Category(String id, String label, int icon) {
            this.id = id;
            this.label = label;
            this.icon = icon;
        }
    }
}
