package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
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
    private static final String GAME = "game";
    private static final String SYSTEM = "system";
    private static final String APPS = "apps";
    private static final String TOOLS = "tools";

    private static final Category[] CATEGORIES = {
            new Category(OVERVIEW, "概览", android.R.drawable.ic_menu_view),
            new Category(HIDE, "消失吧APP", android.R.drawable.ic_menu_close_clear_cancel),
            new Category(GAME, "游戏增强", android.R.drawable.ic_menu_manage),
            new Category(SYSTEM, "系统增强", android.R.drawable.ic_menu_info_details),
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
    private boolean rootGatePassed;
    private boolean rootCheckRunning;
    private AlertDialog rootRequiredDialog;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        ui = new UiKit(this);
        config = new AppConfig(this);
        buildScaffold();
        selected = state == null ? OVERVIEW : state.getString("category", OVERVIEW);
        // Older saved state used a redundant category between home and the manager.
        if (HIDE.equals(selected)) selected = OVERVIEW;
        renderRootGateLoading();
        registerSystemBackCallback();
        checkRootAccess();
    }

    @Override protected void onResume() {
        super.onResume();
        if (!rootGatePassed) return;
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
        if (!rootGatePassed) {
            exitApplication();
            return;
        }
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
        if (rootRequiredDialog != null) {
            rootRequiredDialog.setOnCancelListener(null);
            rootRequiredDialog.dismiss();
            rootRequiredDialog = null;
        }
        executor.shutdownNow();
        super.onDestroy();
    }

    private void renderRootGateLoading() {
        renderAppBar();
        page.removeAllViews();
        TextView loading = ui.text("正在申请 Root 权限…", 13, ui.muted, false);
        loading.setGravity(Gravity.CENTER);
        loading.setPadding(ui.dp(12), ui.dp(36), ui.dp(12), ui.dp(36));
        page.addView(loading, new LinearLayout.LayoutParams(-1, -2));
    }

    private void checkRootAccess() {
        if (rootCheckRunning || rootGatePassed || isFinishing()) return;
        rootCheckRunning = true;
        executor.execute(() -> {
            RootHideManager.RootStatus root = new RootHideManager(this).requestRootStatus();
            main.post(() -> {
                rootCheckRunning = false;
                if (isFinishing() || isDestroyed()) return;
                if (root.state == RootHideManager.RootState.GRANTED) {
                    rootGatePassed = true;
                    if (rootRequiredDialog != null) {
                        rootRequiredDialog.setOnCancelListener(null);
                        rootRequiredDialog.dismiss();
                        rootRequiredDialog = null;
                    }
                    renderCategory();
                    refreshEnvironment();
                    return;
                }
                showRootRequiredDialog(root);
            });
        });
    }

    private void showRootRequiredDialog(RootHideManager.RootStatus root) {
        if (rootRequiredDialog != null && rootRequiredDialog.isShowing()) return;
        String detail = root == null || root.message == null || root.message.trim().isEmpty()
                ? "Root 权限不可用" : root.message.trim();
        rootRequiredDialog = new AlertDialog.Builder(this)
                .setTitle("需要 Root 权限")
                .setMessage("LS_Augment 的当前功能需要 Root 权限。请先在 KernelSU、Magisk "
                        + "或 APatch 中为 LS_Augment 授予 Root 权限，然后点击“重新检测”。\n\n"
                        + "检测结果：" + detail + "\n\n关闭此提示将退出应用。")
                .setNegativeButton("退出应用", (dialog, which) -> exitApplication())
                .setPositiveButton("重新检测", (dialog, which) -> checkRootAccess())
                .create();
        rootRequiredDialog.setCanceledOnTouchOutside(true);
        rootRequiredDialog.setOnCancelListener(dialog -> exitApplication());
        rootRequiredDialog.setOnDismissListener(dialog -> {
            if (rootRequiredDialog == dialog) rootRequiredDialog = null;
        });
        rootRequiredDialog.show();
    }

    private void exitApplication() {
        finishAndRemoveTask();
    }

    private void buildScaffold() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(ui.backgroundDrawable());
        // UiKit applies the current system-bar and cutout insets after attachment.
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
            brand.addView(ui.text("红魔11Pro增强", 10.5f, ui.muted, false),
                    ui.margins(0, 3, 0, 0));
            appBar.addView(brand, new LinearLayout.LayoutParams(0, -2, 1));
        }
        ScopeRestartDialog.addButton(this, ui, appBar, scopeForSelected());
    }

    private void selectCategory(String category) {
        if (HIDE.equals(category)) {
            selected = OVERVIEW;
            renderCategory();
            if (HiddenEntrySession.isUnlocked()) {
                startActivity(new Intent(this, HideAppsActivity.class));
            }
            return;
        }
        boolean known = false;
        for (Category item : CATEGORIES) if (item.id.equals(category)) known = true;
        selected = known && (!HIDE.equals(category) || HiddenEntrySession.isUnlocked())
                ? category : OVERVIEW;
        renderCategory();
    }

    private String scopeForSelected() {
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

        switch (selected) {
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
        lsposedState = ui.text("正在读取 LSPosed…", 10.5f, ui.cyan, true);
        rootState = ui.text("Root 正在读取…", 10.5f, ui.muted, false);
        rootState.setVisibility(View.GONE);
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
        addCategorySection("系统界面", category(SYSTEM));
        addCategorySection("游戏与性能", category(GAME));
        renderTools();
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
            case GAME: return "肩键、AI 触发器、风扇、一键连招速度、超分辨率与破坏神策略";
            case SYSTEM: return "小窗增强、双排布局、时钟与实时数据";
            case APPS: return "应用双开、主题试用与安装兼容能力";
            case TOOLS: return "桌面入口、诊断、日志与恢复";
            default: return "模块运行状态与版本";
        }
    }

    private void renderGame() {
        beginPanel("", "肩键、AI 触发器、风扇、一键连招速度、超分辨率与破坏神共存策略。", true);
        addModule("肩键全应用", "对加入游戏空间的所有应用开放肩键使用。",
                AppConfig.SHOULDER_ENABLED, FeatureActivity.MODULE_SHOULDER,
                ScopeRestartDialog.GAMES, null);
        addModule("AI 触发器极速", "降低模板、点击队列和 YOLO 的等待间隔。",
                AppConfig.AI_TRIGGER_ENABLED, FeatureActivity.MODULE_AI_TRIGGER,
                ScopeRestartDialog.GAMES, null);
        addModule("风扇固定转速", "匹配最接近的硬件档位，并可解禁驱动 5 档满速。",
                AppConfig.FAN_FIXED_ENABLED, FeatureActivity.MODULE_FAN_CONTROL,
                ScopeRestartDialog.GAMES, null);
        addModule("一键连招速度", "调整游戏助手录制连招的播放倍率。",
                AppConfig.COMBO_SPEED_ENABLED, FeatureActivity.MODULE_COMBO_SPEED,
                ScopeRestartDialog.GAMES, null);
        addModule("超分破坏神", "性能模式超分与破坏神共存策略。",
                AppConfig.SUPER_MIRROR_LOW_MODE, FeatureActivity.MODULE_SUPER_RESOLUTION,
                ScopeRestartDialog.GAMES, null);
    }

    private void renderSystem() {
        beginPanel("", "Android 16 小窗策略、SystemUI 布局与实时信息。", true);
        addModule("小窗增强", "解除窗口数量上限，并强制普通应用进入小窗。",
                AppConfig.FREEFORM_ENABLED, FeatureActivity.MODULE_FREEFORM,
                ScopeRestartDialog.DEVICE, null);
        addModule("音量增强", "支持超过原厂 100%，按输出设备与声音类型设置。",
                ConfigSchema.AUDIO_GAIN_ENABLED, FeatureActivity.MODULE_AUDIO_GAIN,
                ScopeRestartDialog.DEVICE, null);
        addUtility("电池与循环次数", "实际循环记录、容量及原厂循环降压策略。",
                "读取硬件数据", FeatureActivity.MODULE_BATTERY);
        addModule("状态栏", "统一设置双排布局、时钟、硬件网速和图标大小。",
                AppConfig.SYSTEMUI_MASTER, FeatureActivity.MODULE_STATUS_LAYOUT,
                ScopeRestartDialog.SYSTEM_UI, null);
    }

    private void renderApps() {
        beginPanel("", "保留原厂管理流程，只扩展对应能力。", true);
        addUtility("步数修改", "真实记录倍速、随机时间增步、每日重复与账户绑定。",
                config.getBoolean(ConfigSchema.HEALTH_ENABLED)?"已启用":"配置步数计划", "mi_health");
        addUtility("APP图标名称编辑", "按空间选择应用，自定义图标、裁剪图片、修改名称。", "打开编辑器", "launcher_custom");
        addModule("允许安装签名不一致的应用",
                "用不同签名的 APK 覆盖同包名应用；默认关闭。",
                AppConfig.ALLOW_SIGNATURE_MISMATCH,
                FeatureActivity.MODULE_SIGNATURE_INSTALL,
                ScopeRestartDialog.DEVICE, null);
        addModule("扩展应用双开", "保留红魔原生候选并补充第三方 App。",
                AppConfig.DOUBLE_ANY_APP, FeatureActivity.MODULE_DOUBLE_APP,
                ScopeRestartDialog.APPS, null);
        addModule("应用商店同时下载限制解除", "设置允许同时下载的应用数量。", ConfigSchema.STORE_DOWNLOAD_ENABLED, "store_download", ScopeRestartDialog.APPS, null);
        addModule("主题无限期试用", "仅处理已确认试用资源的本地到期复位。",
                AppConfig.BEAUTIFY_UNLIMITED_TRIAL, FeatureActivity.MODULE_BEAUTIFY,
                ScopeRestartDialog.APPS, null);
    }

    private void renderTools() {
        beginPanel("模块设置", "", true);
        addUtility("桌面图标", "隐藏或恢复 LS_Augment 自身桌面入口。", "", FeatureActivity.MODULE_LAUNCHER_ICON);
        addUtility("运行诊断", "详细诊断与日志导出。", "", FeatureActivity.MODULE_DIAGNOSTICS);
        addUtility("配置导入导出", "备份设置或导入已有配置。", "", "config_transfer");
    }

    private LinearLayout beginPanel(String title, String description, boolean attach) {
        LinearLayout heading = ui.section(title, description);
        if (!title.isEmpty()) page.addView(OVERVIEW.equals(selected)?ui.overline(title):heading, ui.margins(3, 0, 3, 7));
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
        if (FeatureActivity.MODULE_SIGNATURE_INSTALL.equals(module)) {
            return android.R.drawable.ic_lock_lock;
        }
        if (FeatureActivity.MODULE_SHOULDER.equals(module)
                || FeatureActivity.MODULE_COMBO_SPEED.equals(module)
                || FeatureActivity.MODULE_AI_TRIGGER.equals(module)
                || FeatureActivity.MODULE_FAN_CONTROL.equals(module)
                || FeatureActivity.MODULE_SUPER_RESOLUTION.equals(module)
                || FeatureActivity.MODULE_DIABLO_COEXIST.equals(module)) {
            return android.R.drawable.ic_menu_manage;
        }
        if (FeatureActivity.MODULE_FREEFORM.equals(module)) {
            return android.R.drawable.ic_menu_view;
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
                ScreenAutomation.sync(this);
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
                || AppConfig.AI_TRIGGER_ENABLED.equals(key)
                || AppConfig.TGK_RAPID_FIRE_ENABLED.equals(key)
                || AppConfig.COMBO_SPEED_ENABLED.equals(key)
                || AppConfig.FAN_FIXED_ENABLED.equals(key)
                || AppConfig.SUPER_MIRROR_LOW_MODE.equals(key)
                || AppConfig.SUPER_MIRROR_DIABLO_COEXIST.equals(key)) return AppConfig.GAME_MASTER;
        if (key.startsWith("ls_augment_statusbar_")) return AppConfig.SYSTEMUI_MASTER;
        if (AppConfig.DOUBLE_ANY_APP.equals(key) || AppConfig.DOUBLE_LOW_MEMORY.equals(key)
                || AppConfig.BEAUTIFY_UNLIMITED_TRIAL.equals(key)) return AppConfig.APP_MASTER;
        return null;
    }

    private void openModule(String module) {
        if ("config_transfer".equals(module)) { startActivity(new Intent(this, ConfigTransferActivity.class)); return; }
        if ("launcher_custom".equals(module)) {
            startActivity(new Intent(this, LauncherCustomizationActivity.class));
            return;
        }
        if ("mi_health".equals(module)) {
            startActivity(new Intent(this, HealthSettingsActivity.class));
            return;
        }
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
            case GAME: return new String[]{"游戏增强", "肩键、AI 触发器、风扇、一键连招速度、超分辨率与破坏神策略。"};
            case SYSTEM: return new String[]{"系统增强", "小窗增强、Android 16 布局、时钟与实时数据。"};
            case APPS: return new String[]{"应用增强", "安装兼容、红魔双开扩展与主题无限期试用。"};
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
            config.cleanupRetiredRuntimeSettings();
            RootHideManager manager = new RootHideManager(this);
            RootHideManager.RootStatus root = manager.rootStatus();
            RootHideManager.ConflictState conflict = root.state == RootHideManager.RootState.GRANTED
                    ? manager.conflictState()
                    : new RootHideManager.ConflictState(false, false, "未执行冲突检测");
            RootShell.Result posed = root.state == RootHideManager.RootState.GRANTED
                    ? RootShell.run("pidof system_server; cat /proc/sys/kernel/random/boot_id; "
                    + "settings get global ls_augment_system_server_lifecycle", null, 6, 4096)
                    : new RootShell.Result(126, "LSPosed 状态暂不可读", false);
            String rootText = root.state == RootHideManager.RootState.GRANTED
                    ? "Root · 已授权" : "Root · " + root.message;
            String[] runtime = posed.output.split("\\r?\\n", 3);
            String currentPid = runtime.length > 0 ? runtime[0].trim() : "";
            String bootId = runtime.length > 1 ? runtime[1].trim() : "";
            String earlyWitness = runtime.length > 2 ? runtime[2].trim() : "";
            String providerWitness = getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .getString("ls_augment_system_server_lifecycle", "");
            boolean moduleCurrent = posed.isSuccess()
                    && (ModuleRuntimeStatus.matches(providerWitness, BuildConfig.VERSION_NAME, currentPid, bootId)
                    || ModuleRuntimeStatus.matches(earlyWitness, BuildConfig.VERSION_NAME, currentPid, bootId));
            String currentWitness=ModuleRuntimeStatus.matches(providerWitness, BuildConfig.VERSION_NAME, currentPid, bootId)?providerWitness:earlyWitness;
            String apiVersion=moduleCurrent?ModuleRuntimeStatus.apiVersion(currentWitness):"";
            String posedText = moduleCurrent ? "LSPosed"+(apiVersion.isEmpty()?"":" "+apiVersion)+" 已加载"
                    : "LSPosed · 当前版本尚未在系统生效";
            String versionText = BuildConfig.VERSION_NAME;
            main.post(() -> {
                if (rootState != null) {
                    rootState.setVisibility(root.state == RootHideManager.RootState.GRANTED?View.GONE:View.VISIBLE);
                    rootState.setText(rootText);
                    rootState.setTextColor(root.state == RootHideManager.RootState.GRANTED
                            ? ui.cyan : ui.danger);
                }
                if (lsposedState != null) {
                    lsposedState.setText(posedText);
                    lsposedState.setTextColor(moduleCurrent ? ui.cyan : ui.warning);
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
