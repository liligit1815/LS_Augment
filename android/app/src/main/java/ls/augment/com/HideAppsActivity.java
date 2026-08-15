package ls.augment.com;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import android.window.OnBackInvokedDispatcher;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Multi-space hide, recovery and automation manager. */
public final class HideAppsActivity extends Activity {
    private static final int NOTIFICATION_REQUEST = 2043;

    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Set<RootHideManager.Target> selected = new LinkedHashSet<>();
    private final Set<RootHideManager.Target> savedTargets = new LinkedHashSet<>();
    private final List<AppItem> loaded = new ArrayList<>();
    private UiKit ui;
    private AppConfig config;
    private RootHideManager manager;
    private TextView environment;
    private TextView summary;
    private LinearLayout spaceTabs;
    private LinearLayout appBrowser;
    private LinearLayout appList;
    private LinearLayout appsPanel;
    private LinearLayout automationPanel;
    private LinearLayout tilePanel;
    private EditText search;
    private EditText tileLabel;
    private EditText tileDescription;
    private CheckBox systemApps;
    private Switch master;
    private Switch hideEntry;
    private Switch automationEnabled;
    private Switch automationAllUsers;
    private Button toggleApps;
    private Button save;
    private Button sort;
    private Button appsTab;
    private Button automationTab;
    private Button tileTab;
    private List<RootHideManager.UserRecord> userRecords = new ArrayList<>();
    private int activeUserId = -1;
    private boolean loading = true;
    private boolean dirty;
    private boolean sortByInstall;
    private boolean appListExpanded;
    private boolean syncingHideEntry;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        ui = new UiKit(this);
        config = new AppConfig(this);
        manager = new RootHideManager(this);
        savedTargets.addAll(manager.targets());
        selected.addAll(savedTargets);
        build();
        inspectEnvironment();
        loadUsers();
        registerSystemBackCallback();
    }

    @Override protected void onDestroy() { executor.shutdownNow(); super.onDestroy(); }

    @Override public void onBackPressed() { finish(); }

    private void registerSystemBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return;
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                this::finish);
    }

    @Override protected void onResume() {
        super.onResume();
        if (hideEntry == null) return;
        syncingHideEntry = true;
        hideEntry.setChecked(!HiddenEntrySession.isUnlocked());
        syncingHideEntry = false;
    }

    private void build() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(ui.backgroundDrawable());
        root.setPadding(0, ui.topAppInset(), 0, 0);

        LinearLayout header = ui.header("消失吧APP", true);
        header.setPadding(ui.dp(10), ui.dp(4), ui.dp(12), ui.dp(2));
        ScopeRestartDialog.addButton(this, ui, header, ScopeRestartDialog.SETTINGS);
        root.addView(header, new LinearLayout.LayoutParams(-1, -2));

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(ui.dp(14), ui.dp(8), ui.dp(14), ui.dp(20));
        scroll.addView(page, new ScrollView.LayoutParams(-1, -2));
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));

        page.addView(ui.text("按空间选择应用，需要恢复时无需展开应用列表。", 11.5f,
                ui.muted, false), ui.margins(1, 2, 1, 11));

        environment = ui.text("正在检测 Root 与运行环境…", 11, ui.muted, false);
        environment.setPadding(ui.dp(12), ui.dp(9), ui.dp(12), ui.dp(9));
        environment.setBackground(ui.roundStroke(ui.accentContainer, 12, ui.outline, 1));
        page.addView(environment, ui.margins(0, 0, 0, 10));

        LinearLayout navigation = new LinearLayout(this);
        navigation.setGravity(Gravity.CENTER);
        navigation.setPadding(ui.dp(4), ui.dp(4), ui.dp(4), ui.dp(4));
        navigation.setBackground(ui.roundStroke(Color.argb(220, 255, 255, 255), 14,
                ui.outline, 1));
        appsTab = ui.button("应用管理");
        automationTab = ui.button("自动隐藏");
        tileTab = ui.button("快捷磁贴");
        appsTab.setOnClickListener(view -> selectSection(0));
        automationTab.setOnClickListener(view -> selectSection(1));
        tileTab.setOnClickListener(view -> selectSection(2));
        navigation.addView(appsTab, new LinearLayout.LayoutParams(0, ui.dp(44), 1));
        navigation.addView(automationTab, tabParams());
        navigation.addView(tileTab, new LinearLayout.LayoutParams(0, ui.dp(44), 1));
        page.addView(navigation, ui.margins(0, 0, 0, 12));

        LinearLayout entryCard = ui.card();
        hideEntry = new Switch(this);
        entryCard.addView(switchRow("消失吧图标",
                "开启后返回概览时隐藏入口，不影响任何功能或现有配置。",
                hideEntry, !HiddenEntrySession.isUnlocked()), ui.wrap());
        hideEntry.setOnCheckedChangeListener((button, checked) -> {
            if (syncingHideEntry) return;
            if (checked) {
                HiddenEntrySession.lock();
                Toast.makeText(this, "返回概览后入口将隐藏", Toast.LENGTH_SHORT).show();
            } else {
                HiddenEntrySession.unlock();
                Toast.makeText(this, "消失吧APP入口将在概览显示", Toast.LENGTH_SHORT).show();
            }
        });
        page.addView(entryCard, ui.margins(0, 0, 0, 12));

        appsPanel = new LinearLayout(this);
        appsPanel.setOrientation(LinearLayout.VERTICAL);
        automationPanel = new LinearLayout(this);
        automationPanel.setOrientation(LinearLayout.VERTICAL);
        tilePanel = new LinearLayout(this);
        tilePanel.setOrientation(LinearLayout.VERTICAL);
        page.addView(appsPanel, ui.wrap());
        page.addView(automationPanel, ui.wrap());
        page.addView(tilePanel, ui.wrap());

        LinearLayout masterCard = ui.card();
        masterCard.addView(switchRow("启用隐藏管理",
                "关闭不会自动恢复现有隐藏状态。",
                master = new Switch(this), config.getBoolean(AppConfig.HIDE_MASTER)), ui.wrap());
        appsPanel.addView(masterCard, ui.margins(0, 0, 0, 10));

        LinearLayout spaces = ui.card();
        spaces.addView(ui.section("选择空间", "每个空间独立保存应用清单。"), ui.wrap());
        HorizontalScrollView scroller = new HorizontalScrollView(this);
        scroller.setHorizontalScrollBarEnabled(false);
        spaceTabs = new LinearLayout(this);
        spaceTabs.setOrientation(LinearLayout.HORIZONTAL);
        scroller.addView(spaceTabs, new HorizontalScrollView.LayoutParams(-2, -2));
        spaces.addView(scroller, ui.margins(0, 9, 0, 0));
        appsPanel.addView(spaces, ui.margins(0, 0, 0, 10));

        LinearLayout actions = ui.card();
        actions.addView(ui.section("立即操作", "使用已经保存的目标；操作后核对真实状态。"), ui.wrap());
        Button hideAll = ui.accentButton("全部隐藏");
        Button showAll = ui.button("全部显示");
        Button emergency = ui.dangerButton("紧急恢复");
        hideAll.setOnClickListener(view -> confirmAction("隐藏全部",
                "将停止并隐藏所有空间中的已保存目标。", () -> manager.hideAll(false)));
        showAll.setOnClickListener(view -> runOperation(() -> manager.showAll()));
        emergency.setOnClickListener(view -> confirmAction("紧急恢复",
                "将显示全部已配置目标，不会删除应用数据。", () -> manager.emergencyRestore()));
        LinearLayout actionRow = new LinearLayout(this);
        actionRow.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams firstAction = new LinearLayout.LayoutParams(0, ui.dp(46), 1);
        LinearLayout.LayoutParams nextAction = new LinearLayout.LayoutParams(0, ui.dp(46), 1);
        nextAction.setMargins(ui.dp(6), 0, 0, 0);
        actionRow.addView(hideAll, firstAction);
        actionRow.addView(showAll, nextAction);
        actions.addView(actionRow, ui.margins(0, 9, 0, 0));
        actions.addView(emergency, ui.margins(0, 7, 0, 0));
        appsPanel.addView(actions, ui.margins(0, 0, 0, 10));

        LinearLayout apps = ui.card();
        apps.addView(ui.section("选择应用", "列表默认收起，已勾选项展开后排在最前。"), ui.wrap());
        summary = ui.text("正在读取应用…", 12, ui.muted, false);
        apps.addView(summary, ui.margins(2, 8, 0, 4));
        toggleApps = ui.accentButton("管理应用");
        toggleApps.setOnClickListener(view -> {
            appListExpanded = !appListExpanded;
            renderApps();
        });
        apps.addView(toggleApps, ui.margins(0, 4, 0, 0));

        appBrowser = new LinearLayout(this);
        appBrowser.setOrientation(LinearLayout.VERTICAL);
        appBrowser.setVisibility(View.GONE);
        search = new EditText(this);
        search.setHint("搜索应用名称或包名");
        search.setSingleLine(true);
        ui.styleInput(search);
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { renderApps(); }
            @Override public void afterTextChanged(Editable s) { }
        });
        appBrowser.addView(search, ui.margins(0, 7, 0, 4));

        LinearLayout filters = new LinearLayout(this);
        filters.setGravity(Gravity.CENTER_VERTICAL);
        systemApps = new CheckBox(this);
        systemApps.setText("显示系统应用");
        ui.styleCheckBox(systemApps);
        systemApps.setOnCheckedChangeListener((button, checked) -> {
            if (checked) {
                new AlertDialog.Builder(this).setTitle("显示系统应用")
                        .setMessage("隐藏系统组件可能导致无法启动或无法恢复。受保护核心包仍不可选择。")
                        .setNegativeButton("取消", (dialog, which) -> systemApps.setChecked(false))
                        .setPositiveButton("我已了解", (dialog, which) -> renderApps()).show();
            } else renderApps();
        });
        sort = ui.button("按名称排序");
        sort.setOnClickListener(view -> {
            sortByInstall = !sortByInstall;
            sort.setText(sortByInstall ? "按安装时间排序" : "按名称排序");
            renderApps();
        });
        filters.addView(systemApps, new LinearLayout.LayoutParams(0, -2, 1));
        filters.addView(sort, new LinearLayout.LayoutParams(-2, -2));
        appBrowser.addView(filters, ui.wrap());
        appList = new LinearLayout(this);
        appList.setOrientation(LinearLayout.VERTICAL);
        appBrowser.addView(appList, ui.margins(0, 4, 0, 0));
        apps.addView(appBrowser, ui.wrap());
        appsPanel.addView(apps, ui.margins(0, 0, 0, 12));

        LinearLayout automation = ui.card();
        automation.addView(ui.section("锁屏自动隐藏",
                "开启后仅在屏幕由亮转灭时执行一次，不轮询；解锁不会自动显示。"), ui.wrap());
        automation.addView(switchRow("启用锁屏自动隐藏", "关闭后服务不驻留。",
                automationEnabled = new Switch(this),
                config.getBoolean(AppConfig.AUTOMATION_ENABLED)), ui.margins(0, 8, 0, 0));
        automation.addView(switchRow("处理所有已配置空间", "关闭时只处理当前正在使用的空间。",
                automationAllUsers = new Switch(this),
                "all".equals(config.get(AppConfig.AUTOMATION_SCOPE))), ui.margins(0, 5, 0, 0));
        automationPanel.addView(automation, ui.margins(0, 0, 0, 12));

        LinearLayout tile = ui.card();
        tile.addView(ui.section("快捷设置磁贴",
                "点击磁贴切换隐藏状态；混合或异常状态会优先恢复全部显示。"), ui.wrap());
        tileLabel = textInput("磁贴名称", config.get(AppConfig.TILE_LABEL));
        tileDescription = textInput("磁贴说明", config.get(AppConfig.TILE_DESCRIPTION));
        tile.addView(tileLabel, ui.margins(0, 8, 0, 0));
        tile.addView(tileDescription, ui.margins(0, 5, 0, 0));
        Button addTile = ui.accentButton("添加到快捷设置");
        addTile.setOnClickListener(view -> startActivity(new Intent(this, TileSetupActivity.class)));
        tile.addView(addTile, ui.margins(0, 7, 0, 0));
        tilePanel.addView(tile, ui.margins(0, 0, 0, 12));

        LinearLayout saveBar = new LinearLayout(this);
        saveBar.setPadding(ui.dp(14), ui.dp(8), ui.dp(14), ui.dp(10));
        saveBar.setBackgroundColor(ui.card);
        save = ui.accentButton("保存修改");
        ui.setButtonEnabled(save, false);
        save.setOnClickListener(view -> saveSettings());
        saveBar.addView(save, new LinearLayout.LayoutParams(-1, ui.dp(46)));
        root.addView(saveBar, new LinearLayout.LayoutParams(-1, -2));
        setContentView(root);
        selectSection(0);
    }

    private LinearLayout.LayoutParams tabParams() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, ui.dp(44), 1);
        params.setMargins(ui.dp(4), 0, ui.dp(4), 0);
        return params;
    }

    private void selectSection(int section) {
        appsPanel.setVisibility(section == 0 ? View.VISIBLE : View.GONE);
        automationPanel.setVisibility(section == 1 ? View.VISIBLE : View.GONE);
        tilePanel.setVisibility(section == 2 ? View.VISIBLE : View.GONE);
        styleSectionTab(appsTab, section == 0);
        styleSectionTab(automationTab, section == 1);
        styleSectionTab(tileTab, section == 2);
    }

    private void styleSectionTab(Button button, boolean active) {
        button.setTextColor(active ? ui.accent : ui.muted);
        button.setBackground(ui.pressable(active
                ? ui.roundStroke(ui.accentContainer, 11, ui.accent, 1)
                : ui.round(Color.TRANSPARENT, 11)));
    }

    private View switchRow(String title, String description, Switch control, boolean checked) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.addView(ui.text(title, 14, ui.text, true), ui.wrap());
        TextView detail = ui.text(description, 11, ui.muted, false);
        detail.setLineSpacing(ui.dp(1), 1.04f);
        copy.addView(detail, ui.margins(0, 2, 0, 0));
        control.setChecked(checked);
        ui.styleSwitch(control);
        control.setContentDescription(title + (checked ? "已开启" : "已关闭"));
        control.setOnCheckedChangeListener((button, value) -> {
            control.setContentDescription(title + (value ? "已开启" : "已关闭"));
            markDirty();
        });
        row.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        row.addView(control, new LinearLayout.LayoutParams(-2, -2));
        return row;
    }

    private EditText textInput(String hint, String value) {
        EditText input = new EditText(this);
        input.setHint(hint);
        input.setText(value);
        input.setSingleLine(true);
        ui.styleInput(input);
        input.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { markDirty(); }
            @Override public void afterTextChanged(Editable s) { }
        });
        return input;
    }

    private void inspectEnvironment() {
        executor.execute(() -> {
            RootHideManager.RootStatus root = manager.rootStatus();
            RootHideManager.ConflictState conflict = root.state == RootHideManager.RootState.GRANTED
                    ? manager.conflictState() : new RootHideManager.ConflictState(false, false, "未执行冲突检测");
            RootShell.Result hook = root.state == RootHideManager.RootState.GRANTED
                    ? RootShell.run("printf 'loadedVersion=%s|installed=%s|lastFilterVersion=%s|last=%s|error=%s' "
                    + "\"$(settings get global ls_augment_probe_version)\" "
                    + "\"$(settings get global ls_augment_probe_hook_installed)\" "
                    + "\"$(settings get global ls_augment_hook_version)\" "
                    + "\"$(settings get global ls_augment_hook_last_filter)\" "
                    + "\"$(settings get global ls_augment_hook_last_error)\"",
                    null, 6, 8192)
                    : new RootShell.Result(126, "unavailable", false);
            String hookStatus = hook.isSuccess()
                    && hook.output.contains("loadedVersion=" + BuildConfig.VERSION_NAME + "|")
                    ? hook.output : "当前 APK 的 Settings Hook 尚未加载";
            String text = "Root：" + root.state + " · " + root.provider + " · " + root.message
                    + "\nSettings Hook：" + hookStatus + "\n旧架构：" + conflict.message;
            main.post(() -> {
                environment.setText(text);
                environment.setTextColor(conflict.hasConflict() || root.state != RootHideManager.RootState.GRANTED
                        ? ui.danger : ui.muted);
            });
        });
    }

    private void loadUsers() {
        loading = true;
        executor.execute(() -> {
            List<RootHideManager.UserRecord> result = manager.listUsers();
            int current = manager.currentUserId();
            main.post(() -> {
                userRecords = result;
                activeUserId = result.isEmpty() ? 0 : result.get(0).userId;
                for (RootHideManager.UserRecord user : result) {
                    if (user.userId == current) activeUserId = current;
                }
                loading = false;
                renderSpaceTabs();
                loadApps(activeUserId);
            });
        });
    }

    private void renderSpaceTabs() {
        if (spaceTabs == null) return;
        spaceTabs.removeAllViews();
        for (RootHideManager.UserRecord user : userRecords) {
            boolean active = user.userId == activeUserId;
            Button tab = ui.button(user.name + "\n空间 " + user.userId);
            tab.setTextColor(active ? ui.accent : ui.text);
            tab.setTextSize(12);
            tab.setGravity(Gravity.CENTER);
            tab.setMinWidth(ui.dp(112));
            tab.setBackground(ui.pressable(active
                    ? ui.roundStroke(ui.accentContainer, 11, ui.accent, 1)
                    : ui.roundStroke(Color.argb(220, 255, 255, 255), 11, ui.outline, 1)));
            tab.setOnClickListener(view -> selectSpace(user.userId));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, ui.dp(62));
            params.setMargins(0, 0, ui.dp(7), 0);
            spaceTabs.addView(tab, params);
        }
    }

    private void selectSpace(int userId) {
        if (userId == activeUserId || loading) return;
        activeUserId = userId;
        appListExpanded = false;
        if (search != null) search.setText("");
        renderSpaceTabs();
        loadApps(userId);
    }

    private void loadApps(int userId) {
        loading = true;
        summary.setText("正在读取空间 " + userId + " 的应用与隐藏状态…");
        executor.execute(() -> {
            List<RootHideManager.AppRecord> records = manager.listApps(userId);
            ArrayList<AppItem> items = new ArrayList<>();
            for (RootHideManager.AppRecord record : records) {
                RootHideManager.State state = (selected.contains(record.target)
                        || savedTargets.contains(record.target)) ? manager.queryState(record.target) : null;
                items.add(new AppItem(record, state));
            }
            main.post(() -> {
                loaded.clear();
                loaded.addAll(items);
                loading = false;
                renderApps();
            });
        });
    }

    private void renderApps() {
        if (appList == null) return;
        appList.removeAllViews();
        String query = search == null ? "" : search.getText().toString().trim().toLowerCase(Locale.ROOT);
        boolean showSystem = systemApps != null && systemApps.isChecked();
        ArrayList<AppItem> visible = new ArrayList<>();
        int selectedInSpace = 0;
        for (RootHideManager.Target target : selected) if (target.userId == activeUserId) selectedInSpace++;
        for (AppItem item : loaded) {
            if (item.record.system && !showSystem && !selected.contains(item.record.target)
                    && !savedTargets.contains(item.record.target)) continue;
            if (!query.isEmpty() && !item.record.label.toLowerCase(Locale.ROOT).contains(query)
                    && !item.record.target.packageName.toLowerCase(Locale.ROOT).contains(query)) continue;
            visible.add(item);
        }
        Comparator<AppItem> order = Comparator
                .comparing((AppItem item) -> !selected.contains(item.record.target));
        if (sortByInstall) {
            order = order.thenComparing((AppItem item) -> item.record.installedAt, Comparator.reverseOrder());
        } else {
            order = order.thenComparing(item -> item.record.label, String.CASE_INSENSITIVE_ORDER);
        }
        visible.sort(order.thenComparing(item -> item.record.target.packageName));
        summary.setText("空间 " + activeUserId + " · 可选 " + visible.size() + " 个 · 已勾选 "
                + selectedInSpace + " 个");
        toggleApps.setText(appListExpanded ? "收起应用列表" : "管理应用（" + visible.size() + "）");
        appBrowser.setVisibility(appListExpanded ? View.VISIBLE : View.GONE);
        if (!appListExpanded) return;
        for (AppItem item : visible) appList.addView(appRow(item), ui.margins(0, 0, 0, 8));
    }

    private View appRow(AppItem item) {
        LinearLayout card = ui.card();
        LinearLayout top = new LinearLayout(this);
        top.setGravity(Gravity.CENTER_VERTICAL);
        ImageView icon = new ImageView(this);
        Drawable drawable;
        try { drawable = getPackageManager().getApplicationIcon(item.record.target.packageName); }
        catch (PackageManager.NameNotFoundException error) { drawable = getDrawable(R.drawable.ic_tile); }
        icon.setImageDrawable(drawable);
        top.addView(icon, new LinearLayout.LayoutParams(ui.dp(42), ui.dp(42)));
        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.setPadding(ui.dp(10), 0, ui.dp(4), 0);
        copy.addView(ui.text(item.record.label, 15, ui.text, true), ui.wrap());
        boolean selectedNow = selected.contains(item.record.target);
        boolean saved = savedTargets.contains(item.record.target);
        String targetStatus = selectedNow && !saved ? " · 待保存"
                : !selectedNow && saved ? " · 待移除"
                : item.state == null ? "" : " · " + localizedState(item.state);
        String detail = item.record.target.packageName + (item.record.system ? " · 系统" : " · 第三方")
                + (item.record.installedAt > 0 ? " · "
                + DateFormat.getDateInstance().format(new Date(item.record.installedAt)) : "")
                + targetStatus;
        copy.addView(ui.text(detail, 11, ui.muted, false), ui.margins(0, 2, 0, 0));
        top.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        CheckBox selectedBox = new CheckBox(this);
        ui.styleCheckBox(selectedBox);
        selectedBox.setChecked(selectedNow);
        selectedBox.setEnabled(!item.record.protectedApp);
        selectedBox.setOnCheckedChangeListener((button, checked) -> {
            if (checked) selected.add(item.record.target); else selected.remove(item.record.target);
            markDirty();
            renderApps();
        });
        top.addView(selectedBox, new LinearLayout.LayoutParams(-2, -2));
        card.addView(top, ui.wrap());

        if (saved) {
            LinearLayout actions = new LinearLayout(this);
            Button hide = ui.button("隐藏");
            Button show = ui.button("显示");
            hide.setOnClickListener(view -> runOperation(() -> manager.hide(item.record.target)));
            show.setOnClickListener(view -> runOperation(() -> manager.show(item.record.target)));
            actions.addView(hide, new LinearLayout.LayoutParams(0, -2, 1));
            actions.addView(show, new LinearLayout.LayoutParams(0, -2, 1));
            card.addView(actions, ui.margins(0, 5, 0, 0));
        }
        return card;
    }

    private static String localizedState(RootHideManager.State state) {
        switch (state) {
            case VISIBLE: return "已显示";
            case HIDDEN: return "已隐藏";
            case MISSING: return "未安装";
            default: return "状态未知";
        }
    }

    private void saveSettings() {
        ui.setButtonEnabled(save, false);
        LinkedHashMap<String, String> update = new LinkedHashMap<>();
        update.put(AppConfig.HIDE_MASTER, master.isChecked() ? "1" : "0");
        update.put(AppConfig.AUTOMATION_ENABLED, automationEnabled.isChecked() ? "1" : "0");
        update.put(AppConfig.AUTOMATION_SCOPE, automationAllUsers.isChecked() ? "all" : "current");
        update.put(AppConfig.TILE_LABEL, tileLabel.getText().toString());
        update.put(AppConfig.TILE_DESCRIPTION, tileDescription.getText().toString());
        executor.execute(() -> {
            RootHideManager.OperationResult targetsResult = manager.saveTargets(new LinkedHashSet<>(selected));
            AppConfig.SaveResult configResult = targetsResult.success
                    ? config.save(update) : new AppConfig.SaveResult(false, "页面设置未保存");
            if (targetsResult.success && configResult.success) ScreenAutomationService.sync(this);
            main.post(() -> {
                Toast.makeText(this, targetsResult.message + (targetsResult.success
                        ? "；" + configResult.message : ""), Toast.LENGTH_LONG).show();
                if (targetsResult.success && configResult.success) {
                    savedTargets.clear();
                    savedTargets.addAll(manager.targets());
                    dirty = false;
                    ui.setButtonEnabled(save, false);
                    requestNotificationIfNeeded();
                    loadApps(activeUserId);
                } else ui.setButtonEnabled(save, true);
            });
        });
    }

    private void requestNotificationIfNeeded() {
        if (Build.VERSION.SDK_INT >= 33 && automationEnabled.isChecked()
                && checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS)
                != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{Manifest.permission.POST_NOTIFICATIONS}, NOTIFICATION_REQUEST);
        }
    }

    private void confirmAction(String title, String message, Operation operation) {
        new AlertDialog.Builder(this).setTitle(title).setMessage(message)
                .setNegativeButton("取消", null)
                .setPositiveButton("继续", (dialog, which) -> runOperation(operation)).show();
    }

    private void runOperation(Operation operation) {
        executor.execute(() -> {
            RootHideManager.OperationResult result = operation.run();
            main.post(() -> {
                Toast.makeText(this, result.message, Toast.LENGTH_LONG).show();
                loadApps(activeUserId);
            });
        });
    }

    private void markDirty() {
        if (loading) return;
        dirty = true;
        if (save != null) ui.setButtonEnabled(save, true);
    }

    private interface Operation { RootHideManager.OperationResult run(); }

    private static final class AppItem {
        final RootHideManager.AppRecord record;
        final RootHideManager.State state;
        AppItem(RootHideManager.AppRecord record, RootHideManager.State state) {
            this.record = record;
            this.state = state;
        }
    }
}
