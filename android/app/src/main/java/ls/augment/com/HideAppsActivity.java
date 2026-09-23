package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.PopupWindow;
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

    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final ExecutorService actionExecutor = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Set<RootHideManager.Target> selected = new LinkedHashSet<>();
    private final Set<RootHideManager.Target> savedTargets = new LinkedHashSet<>();
    private final List<AppItem> loaded = new ArrayList<>();
    private UiKit ui;
    private AppConfig config;
    private RootHideManager manager;
    private TextView environment;
    private TextView summary;
    private TextView userStatus;
    private Button spaceSelector, refreshAppsButton;
    private PopupWindow spacePopup;
    private LinearLayout appConfigBody;
    private ImageButton appsExpand;
    private TextView saveStatus;
    private boolean allSpaces = true;
    private LinearLayout appBrowser;
    private LinearLayout appList;
    private LinearLayout retainedList;
    private LinearLayout appsPanel;
    private LinearLayout automationPanel;
    private LinearLayout tilePanel;
    private EditText search;
    private EditText tileLabel;
    private EditText tileDescription;
    private Switch master;
    private Switch automationEnabled;
    private Switch tileEnabled;
    private Switch automationAllUsers;
    private Button hideAllButton, showAllButton;
    private Button sort;
    private List<RootHideManager.UserRecord> userRecords = new ArrayList<>();
    private UserResolution currentUser = UserResolution.failure("尚未检测当前用户");
    private int activeUserId = -1;
    private long activeUserSerial = -1;
    private long appLoadGeneration;
    private String selectionProblem = "正在读取应用名单…";
    private boolean selectionReady, selectionLoading;
    private long selectionRevision = -1;
    private boolean loading = true;
    private boolean dirty;
    private long editGeneration;
    private boolean saving, saveFailed;
    private UiKit.Fold hideFold, automationFold, tileFold;
    private TileImageEditor tileImage;
    private final Runnable autoSave = () -> { if (dirty) saveSettings(); };
    private boolean sortByInstall;
    private boolean operating, resultDialogVisible;
    private TextView operationStatus;
    private Dialog actionDialog;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (!HiddenEntrySession.isUnlocked()) { finish(); return; }
        ui = new UiKit(this);
        config = new AppConfig(this);
        manager = new RootHideManager(this);
        build();
        inspectEnvironment();
        loadSelection();
        loadUsers();
        registerSystemBackCallback();
    }

    @Override protected void onPause() { if(spacePopup!=null){spacePopup.dismiss();spacePopup=null;} if(actionDialog!=null){actionDialog.dismiss();actionDialog=null;} if (dirty && !saving) saveSettings(); main.removeCallbacks(autoSave); super.onPause(); }
    @Override protected void onDestroy() { executor.shutdown(); actionExecutor.shutdown(); super.onDestroy(); }

    // Gesture navigation is registered separately with the platform dispatcher.
    @android.annotation.SuppressLint("GestureBackNavigation")
    @Override public void onBackPressed() { finish(); }

    private void registerSystemBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return;
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                this::finish);
    }

    @Override protected void onResume() {
        super.onResume();
        if (!HiddenEntrySession.isUnlocked()) { finish(); return; }
        if (manager != null && appList != null && !loading) {
            if (!dirty && !saving) loadSelection();
            refreshAppStates();
        }
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


        environment = ui.text("正在检测 Root 与运行环境…", 11, ui.muted, false);
        environment.setPadding(ui.dp(12), ui.dp(9), ui.dp(12), ui.dp(9));
        environment.setBackground(ui.roundStroke(ui.accentContainer, 12, ui.outline, 1));


        appsPanel = new LinearLayout(this);
        appsPanel.setOrientation(LinearLayout.VERTICAL);
        automationPanel = new LinearLayout(this);
        automationPanel.setOrientation(LinearLayout.VERTICAL);
        tilePanel = new LinearLayout(this);
        tilePanel.setOrientation(LinearLayout.VERTICAL);
        LinearLayout masterCard = ui.card();
        masterCard.addView(switchRow("应用隐藏",
                "按空间选择应用，手动隐藏或显示。关闭不会自动恢复现有隐藏状态，仍可展开配置手动显示应用。",
                master = new Switch(this), config.getBoolean(AppConfig.HIDE_MASTER)), ui.wrap());
        operationStatus = ui.text("", 12, ui.accent, false);
        operationStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        operationStatus.setVisibility(View.GONE);
        masterCard.addView(operationStatus, ui.margins(0, 6, 0, 0));
        masterCard.addView(appsPanel, ui.margins(0, 10, 0, 0));
        page.addView(masterCard, ui.margins(0, 0, 0, 10));

        LinearLayout automationCard = ui.card();
        automationCard.addView(switchRow("锁屏自动隐藏", "由 LSPosed 监听锁屏，自动隐藏“应用隐藏”中已保存的应用；需同时开启应用隐藏。",
                automationEnabled = new Switch(this), config.getBoolean(AppConfig.AUTOMATION_ENABLED)), ui.wrap());
        automationCard.addView(automationPanel, ui.margins(0, 10, 0, 0));
        page.addView(automationCard, ui.margins(0, 0, 0, 10));

        LinearLayout tileCard = ui.card();
        tileCard.addView(switchRow("快捷磁贴", "在快捷设置中隐藏或显示应用，可自定义磁贴图片、名称和说明。关闭后磁贴停止操作应用。",
                tileEnabled = new Switch(this), config.getBoolean(AppConfig.TILE_ENABLED)), ui.wrap());
        tileCard.addView(tilePanel, ui.margins(0, 10, 0, 0));
        page.addView(tileCard, ui.margins(0, 0, 0, 10));

        hideAllButton = ui.accentButton("全部隐藏");
        showAllButton = ui.button("全部显示");
        hideAllButton.setOnClickListener(view -> confirmAction("全部隐藏",
                "将停止并隐藏所有空间中已配置的应用。", true));
        showAllButton.setOnClickListener(view -> confirmAction("全部显示",
                "将显示所有空间中已配置的应用。", false));
        LinearLayout actionRow = new LinearLayout(this);
        actionRow.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams firstAction = new LinearLayout.LayoutParams(0, ui.dp(46), 1);
        LinearLayout.LayoutParams nextAction = new LinearLayout.LayoutParams(0, ui.dp(46), 1);
        nextAction.setMargins(ui.dp(6), 0, 0, 0);
        actionRow.addView(hideAllButton, firstAction);
        actionRow.addView(showAllButton, nextAction);
        appsPanel.addView(actionRow, ui.margins(0, 0, 0, 10));

        LinearLayout apps = ui.card();
        LinearLayout appsHeading = new LinearLayout(this);
        appsHeading.setGravity(Gravity.CENTER_VERTICAL);
        appsHeading.addView(ui.section("配置应用", "勾选自动保存；取消勾选不改变应用的显示状态。"),
                new LinearLayout.LayoutParams(0, -2, 1));
        appsExpand = new ImageButton(this);
        appsExpand.setImageResource(R.drawable.ic_expand_more);
        appsExpand.setColorFilter(ui.accent);
        appsExpand.setBackground(ui.pressable(ui.round(Color.TRANSPARENT, 12)));
        appsHeading.addView(appsExpand, new LinearLayout.LayoutParams(ui.dp(44), ui.dp(44)));
        apps.addView(appsHeading, ui.wrap());
        appConfigBody = new LinearLayout(this);
        appConfigBody.setOrientation(LinearLayout.VERTICAL);
        apps.addView(appConfigBody, ui.wrap());
        appsExpand.setOnClickListener(v -> showAppList(appConfigBody.getVisibility() != View.VISIBLE));
        appsHeading.setOnClickListener(v -> appsExpand.performClick());
        showAppList(false);
        LinearLayout spaceRow = new LinearLayout(this);
        spaceRow.setGravity(Gravity.CENTER_VERTICAL);
        spaceSelector = ui.button("全部空间 ▾");
        spaceSelector.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        spaceSelector.setContentDescription("选择应用空间：全部空间");
        spaceSelector.setOnClickListener(v -> showSpaceChoices());
        spaceRow.addView(spaceSelector, new LinearLayout.LayoutParams(0, ui.dp(46), 1));
        refreshAppsButton = ui.tonalButton("刷新");
        refreshAppsButton.setContentDescription("刷新所选空间的应用列表");
        refreshAppsButton.setOnClickListener(v -> {
            if (loading || operating) return;
            if (!selectionReady && !dirty && !saving) loadSelection();
            loadUsers();
        });
        LinearLayout.LayoutParams refreshParams = new LinearLayout.LayoutParams(ui.dp(120), ui.dp(46));
        refreshParams.setMargins(ui.dp(8), 0, 0, 0);
        spaceRow.addView(refreshAppsButton, refreshParams);
        appConfigBody.addView(spaceRow, ui.margins(0, 9, 0, 0));
        LinearLayout filters = new LinearLayout(this);
        filters.setGravity(Gravity.TOP);
        LinearLayout listInfo = new LinearLayout(this);
        listInfo.setOrientation(LinearLayout.VERTICAL);
        userStatus = ui.text("正在核验当前用户空间…", 11, ui.muted, false);
        listInfo.addView(userStatus, ui.wrap());
        summary = ui.text("正在读取应用…", 12, ui.muted, false);
        listInfo.addView(summary, ui.margins(0, 4, 0, 0));
        filters.addView(listInfo, new LinearLayout.LayoutParams(0, -2, 1));
        sort = ui.tonalButton("按名称排序");
        sort.setOnClickListener(view -> {
            sortByInstall = !sortByInstall;
            sort.setText(sortByInstall ? "按安装时间排序" : "按名称排序");
            renderApps();
        });
        LinearLayout.LayoutParams sortParams = new LinearLayout.LayoutParams(ui.dp(120), ui.dp(46));
        sortParams.setMargins(ui.dp(8), 0, 0, 0);
        filters.addView(sort, sortParams);
        appConfigBody.addView(filters, ui.margins(0, 4, 0, 0));
        retainedList = new LinearLayout(this);
        retainedList.setOrientation(LinearLayout.VERTICAL);
        appConfigBody.addView(retainedList, ui.wrap());
        appBrowser = new LinearLayout(this);
        appBrowser.setOrientation(LinearLayout.VERTICAL);
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
        appList = new LinearLayout(this);
        appList.setOrientation(LinearLayout.VERTICAL);
        appBrowser.addView(appList, ui.margins(0, 4, 0, 0));
        appConfigBody.addView(appBrowser, ui.wrap());
        saveStatus = ui.text("选择自动保存", 11, ui.muted, false);
        saveStatus.setOnClickListener(v -> { if (dirty && !saving) saveSettings(); });
        appConfigBody.addView(saveStatus, ui.margins(2, 5, 0, 0));
        appsPanel.addView(apps, ui.margins(0, 0, 0, 12));

        LinearLayout automation = ui.card();
        automation.addView(switchRow("处理所有已配置空间", "关闭时只处理当前正在使用的空间。",
                automationAllUsers = new Switch(this),
                "all".equals(config.get(AppConfig.AUTOMATION_SCOPE))), ui.margins(0, 5, 0, 0));
        automationAllUsers.setOnClickListener(view -> {
            if (!automationAllUsers.isChecked() && !currentUser.resolved) {
                Toast.makeText(this, "已保留“仅当前用户”范围；无法识别当前用户时，自动隐藏暂停执行",
                        Toast.LENGTH_LONG).show();
            }
        });
        automationPanel.addView(automation, ui.margins(0, 0, 0, 12));

        LinearLayout tile = ui.card();
        tile.addView(ui.section("快捷设置磁贴",
                "点击切换所有空间中已配置应用的隐藏或显示状态；混合状态时全部显示。"), ui.wrap());
        tileLabel = textInput("磁贴名称", config.get(AppConfig.TILE_LABEL), 30);
        tileDescription = textInput("磁贴说明", config.get(AppConfig.TILE_DESCRIPTION), 60);
        tileImage = new TileImageEditor(this,ui,config,executor); tile.addView(tileImage.view(),ui.margins(0,10,0,10));
        tile.addView(ui.section("磁贴名称", "最多 30 个字符；留空使用 LS_Augment。"));
        tile.addView(tileLabel, ui.margins(0, 8, 0, 0));
        tile.addView(ui.section("磁贴说明", "最多 60 个字符；留空使用“应用隐藏”。"),ui.margins(0,10,0,0));
        tile.addView(tileDescription, ui.margins(0, 5, 0, 0));
        Button addTile = ui.button("添加到快捷设置");
        styleActionButton(addTile, true);
        addTile.setOnClickListener(view -> startActivity(new Intent(this, TileSetupActivity.class)));
        tile.addView(addTile, ui.margins(0, 7, 0, 0));
        tilePanel.addView(tile, ui.margins(0, 0, 0, 12));

        ui.setContentView(root);
        ui.applyGestureInset(root, 0);
        // Showing configured apps remains available even when hiding is disabled.
        hideFold = ui.fold(master, appsPanel, true);
        automationFold = ui.fold(automationEnabled, automationPanel);
        tileFold = ui.fold(tileEnabled, tilePanel);
        hideFold.show(false);
        automationFold.show(false);
        tileFold.show(false);

    }

    private View switchRow(String title, String description, Switch control, boolean checked) {
        control.setChecked(checked);
        LinearLayout row=ui.featureRow(title,description,control);
        control.setOnCheckedChangeListener((button,value)->markDirty());return row;
    }

    private EditText textInput(String hint, String value, int maximum) {
        EditText input = new EditText(this);
        input.setHint(hint);
        input.setFilters(new InputFilter[]{(source, start, end, dest, dstart, dend) -> {
            int remaining = maximum - Character.codePointCount(dest, 0, dstart)
                    - Character.codePointCount(dest, dend, dest.length());
            if (remaining <= 0) return "";
            if (Character.codePointCount(source, start, end) <= remaining) return null;
            return source.subSequence(start, Character.offsetByCodePoints(source, start, remaining));
        }});
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
            String version = config.diagnostic("ls_augment_probe_version");
            String hookStatus = BuildConfig.VERSION_NAME.equals(version)
                    ? "loadedVersion=" + version
                    + "|installed=" + config.diagnostic("ls_augment_probe_hook_installed")
                    + "|lastFilterVersion=" + config.diagnostic("ls_augment_hook_version")
                    + "|last=" + config.diagnostic("ls_augment_hook_last_filter")
                    + "|error=" + config.diagnostic("ls_augment_hook_last_error")
                    : "当前 APK 的 Settings Hook 尚未加载";
            String text = "Root：" + root.state + " · " + root.provider + " · " + root.message
                    + "\nSettings Hook：" + hookStatus + "\n旧架构：" + conflict.message;
            main.post(() -> {
                environment.setText(text);
                environment.setTextColor(conflict.hasConflict() || root.state != RootHideManager.RootState.GRANTED
                        ? ui.danger : ui.muted);
            });
        });
    }

    private void loadSelection() {
        if (operating || selectionLoading || saving || isFinishing() || isDestroyed()) return;
        selectionLoading = true;
        selectionReady = false;
        selectionProblem = "正在读取应用名单…";
        renderApps();
        executor.execute(() -> {
            RootHideManager.OperationResult result;
            HideTargetCodec.Selection loadedSelection;
            long revision;
            RootHideManager.ACTION_LOCK.lock();
            try {
                RootHideManager.RootStatus root = manager.rootStatus();
                result = root.state == RootHideManager.RootState.GRANTED ? manager.refreshTargets()
                        : RootHideManager.OperationResult.failure(root.message);
                loadedSelection = manager.selectionStatus();
                revision = manager.targetRevision();
            } catch (RuntimeException failure) {
                result = RootHideManager.OperationResult.failure("应用名单读取未完成，请重新读取");
                loadedSelection = HideTargetCodec.parse("!unavailable");
                revision = -1;
            } finally { RootHideManager.ACTION_LOCK.unlock(); }
            RootHideManager.OperationResult outcome = result;
            HideTargetCodec.Selection snapshot = loadedSelection;
            long publishedRevision = revision;
            main.post(() -> {
                if (isFinishing() || isDestroyed()) return;
                selectionLoading = false;
                if (outcome.success && snapshot.valid && publishedRevision >= 0) {
                    savedTargets.clear(); selected.clear();
                    for (HideTargetCodec.Entry entry : snapshot.entries)
                        savedTargets.add(new RootHideManager.Target(entry));
                    selected.addAll(savedTargets);
                    selectionRevision = publishedRevision;
                    selectionProblem = "";
                    selectionReady = true;
                    if (dirty) main.post(autoSave);
                } else {
                    selectionProblem = outcome.message;
                    // Keep any displayed selection; failed reads never become an empty save.
                    Toast.makeText(this, outcome.message, Toast.LENGTH_LONG).show();
                }
                renderApps();
            });
        });
    }

    private boolean currentBinding(RootHideManager.Target target) {
        if (!target.isBound()) return false;
        for (RootHideManager.UserRecord user : userRecords)
            if (user.userId == target.userId && user.serial >= 0 && user.serial == target.userSerial) return true;
        return false;
    }

    private List<RootHideManager.Target> retainedTargets() {
        List<RootHideManager.Target> retained = new ArrayList<>();
        for (RootHideManager.Target target : selected) if (!currentBinding(target)) retained.add(target);
        return retained;
    }

    private void renderRetainedTargets() {
        if (retainedList == null) return;
        retainedList.removeAllViews();
        if (!selectionProblem.isEmpty()) {
            retainedList.addView(ui.text("原应用清单无法解析，已完整保留：" + selectionProblem
                    + "。仍可修改其他设置；请先导出备份，当前不能编辑名单。", 12, ui.danger, false), ui.wrap());
            return;
        }
        List<RootHideManager.Target> retained = retainedTargets();
        if (retained.isEmpty()) return;
        retainedList.addView(ui.text("待确认或空间已变化的选择：" + retained.size()
                + " 个。记录继续保留，不会用于隐藏；请在当前空间重新勾选需要的应用。移除只改变名单，历史仍会归档。",
                12, ui.danger, false), ui.wrap());
        for (RootHideManager.Target target : retained) {
            LinearLayout row = new LinearLayout(this);
            row.setGravity(Gravity.CENTER_VERTICAL);
            String identity = target.userSerial < 0 ? "身份未确认" : "原空间序列号 " + target.userSerial;
            row.addView(ui.text(target.packageName + "\n空间 " + target.userId + " · " + identity,
                    11, ui.muted, false), new LinearLayout.LayoutParams(0, -2, 1));
            Button remove = ui.button("移除选择");
            styleActionButton(remove, !loading);
            remove.setOnClickListener(view -> removeRetainedTarget(target));
            row.addView(remove, new LinearLayout.LayoutParams(-2, -2));
            retainedList.addView(row, ui.wrap());
        }
    }

    private void removeRetainedTarget(RootHideManager.Target target) {
        if (loading || operating || !selectionProblem.isEmpty() || currentBinding(target)) return;
        if (selected.remove(target)) { markDirty(); renderApps(); }
    }

    private void selectTarget(AppItem item, boolean checked) {
        RootHideManager.Target target = item.record.target;
        if (loading || operating || !selectionProblem.isEmpty() || !loaded.contains(item) || item.record.protectedApp
                || !target.isBound() || !inSelectedSpace(target) || !currentBinding(target)) return;
        if (checked) {
            // Only an explicit selection of this displayed app can replace an old binding.
            selected.removeIf(old -> old.userId == target.userId && old.packageName.equals(target.packageName));
            selected.add(target);
        } else selected.remove(target);
        markDirty();
        renderApps();
    }

    private void loadUsers() {
        loading = true;
        renderApps();
        final int previousUser = activeUserId;
        final long previousSerial = activeUserSerial;
        final long generation = ++appLoadGeneration;
        executor.execute(() -> {
            RootHideManager.UserDirectory directory = manager.userDirectory();
            UserResolution resolved = manager.currentUser(directory);
            main.post(() -> {
                if (isFinishing() || isDestroyed() || generation != appLoadGeneration) return;
                userRecords = new ArrayList<>(directory.users);
                currentUser = resolved;
                activeUserId = -1;
                activeUserSerial = -1;
                for (RootHideManager.UserRecord user : userRecords) {
                    if (directory.success && user.serial >= 0 && (activeUserId < 0
                            || resolved.resolved && user.userId == resolved.userId)) {
                        activeUserId = user.userId;
                        activeUserSerial = user.serial;
                    }
                }
                if (!allSpaces) {
                    boolean retained = false;
                    for (RootHideManager.UserRecord user : userRecords)
                        if (user.userId == previousUser && user.serial == previousSerial && user.serial >= 0) {
                            activeUserId = user.userId; activeUserSerial = user.serial; retained = true; break;
                        }
                    if (!retained) allSpaces = true;
                }
                loading = false;
                updateUserAvailability(directory);
                renderSpaceSelector();
                if (activeUserId >= 0) {
                    loadApps(activeUserId);
                    if (dirty) main.post(autoSave);
                } else {
                    loaded.clear();
                    summary.setText("无法读取已验证的用户空间，未执行任何应用操作。");
                    renderApps();
                }
            });
        });
    }

    private void updateUserAvailability(RootHideManager.UserDirectory directory) {
        if (userStatus == null) return;
        if (!directory.success) {
            userStatus.setText("用户空间不可用：" + directory.message);
            userStatus.setTextColor(ui.danger);
        } else if (!currentUser.resolved) {
            userStatus.setText("无法可靠识别当前用户：" + currentUser.message
                    + "。仍可手动选择已验证空间；已保留自动隐藏范围，“仅当前用户”模式暂停执行。");
            userStatus.setTextColor(ui.danger);
        } else {
            userStatus.setText("当前用户已核验：空间 " + currentUser.userId);
            userStatus.setTextColor(ui.muted);
        }
    }

    private void showAppList(boolean expanded) {
        appConfigBody.setVisibility(expanded ? View.VISIBLE : View.GONE);
        appsExpand.setRotation(expanded ? 180 : 0);
        appsExpand.setContentDescription(expanded ? "收起应用列表" : "展开应用列表");
        if (expanded) renderApps();
    }

    private String spaceLabel() {
        if (allSpaces) return "全部空间";
        for (RootHideManager.UserRecord user : userRecords)
            if (user.userId == activeUserId && user.serial == activeUserSerial)
                return user.name + " · 空间 " + user.userId;
        return "空间 " + activeUserId;
    }

    private boolean inSelectedSpace(RootHideManager.Target target) {
        return allSpaces || target.userId == activeUserId && target.userSerial == activeUserSerial;
    }

    private void renderSpaceSelector() {
        if (spaceSelector == null) return;
        spaceSelector.setText(spaceLabel() + " ▾");
        spaceSelector.setContentDescription("选择应用空间：" + spaceLabel());
        styleActionButton(spaceSelector, !loading && !operating && !userRecords.isEmpty());
        styleActionButton(refreshAppsButton, !loading && !operating);
        if (sort != null) styleActionButton(sort, !loading && !operating);
    }

    private void showSpaceChoices() {
        if (loading || operating || userRecords.isEmpty()) return;
        if (spacePopup != null) spacePopup.dismiss();
        LiquidGlassLayout choices = new LiquidGlassLayout(ui, 18);
        choices.setOrientation(LinearLayout.VERTICAL);
        choices.setPadding(ui.dp(8), ui.dp(8), ui.dp(8), ui.dp(8));
        Button all = ui.button("全部空间");
        all.setTag("space-all"); styleSpaceOption(all, allSpaces, true);
        all.setOnClickListener(v -> { spacePopup.dismiss(); selectSpace(-1, -1); });
        choices.addView(all, new LinearLayout.LayoutParams(-1, ui.dp(48)));
        for (RootHideManager.UserRecord user : userRecords) {
            Button option = ui.button(user.name + " · 空间 " + user.userId);
            option.setTag("space-" + user.userId);
            styleSpaceOption(option, !allSpaces && user.userId == activeUserId
                    && user.serial == activeUserSerial, user.serial >= 0);
            option.setOnClickListener(v -> { spacePopup.dismiss(); selectSpace(user.userId, user.serial); });
            LinearLayout.LayoutParams optionParams = new LinearLayout.LayoutParams(-1, ui.dp(48));
            optionParams.topMargin = ui.dp(8);
            choices.addView(option, optionParams);
        }
        ScrollView scroll = new ScrollView(this);
        scroll.addView(choices);
        int height = Math.min(ui.dp(16 + 48 * (userRecords.size() + 1) + 8 * userRecords.size()),
                getResources().getDisplayMetrics().heightPixels / 2);
        spacePopup = new PopupWindow(scroll, spaceSelector.getWidth(), height, true);
        spacePopup.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(Color.TRANSPARENT));
        spacePopup.setOutsideTouchable(true);
        spaceSelector.setSelected(true);
        spacePopup.setOnDismissListener(() -> spaceSelector.setSelected(false));
        spacePopup.setElevation(ui.dp(10));
        spacePopup.showAsDropDown(spaceSelector, 0, ui.dp(5));
        choices.refreshBackdrop();
    }

    private void styleSpaceOption(Button option, boolean selected, boolean enabled) {
        option.setSelected(selected);
        styleActionButton(option, enabled);
    }

    private void styleActionButton(Button button, boolean enabled) {
        button.setEnabled(enabled);
        button.setAlpha(1f);
        int deep = Color.rgb(31, 116, 197);
        int light = Color.argb(235, 230, 244, 255);
        int[][] states = new int[][] {
                new int[]{android.R.attr.state_activated},
                new int[]{-android.R.attr.state_enabled},
                new int[]{android.R.attr.state_selected},
                new int[]{android.R.attr.state_pressed},
                new int[]{}
        };
        button.setTextColor(new android.content.res.ColorStateList(states, new int[]{
                Color.WHITE, Color.rgb(126, 147, 168), Color.WHITE, Color.WHITE, Color.rgb(30, 68, 105)}));
        android.graphics.drawable.StateListDrawable background = new android.graphics.drawable.StateListDrawable();
        for (int i = 0; i < states.length; i++) {
            boolean active = i == 0 || i == 2 || i == 3;
            background.addState(states[i], ui.roundStroke(active ? deep : light, 12,
                    active ? deep : Color.rgb(191, 218, 241), 1));
        }
        button.setBackground(background);
    }

    private void selectSpace(int userId, long serial) {
        boolean requestedAll = userId == -1;
        if (loading || operating || !requestedAll && serial < 0
                || requestedAll == allSpaces && (requestedAll || userId == activeUserId && serial == activeUserSerial)) return;
        allSpaces = requestedAll;
        if (!allSpaces) { activeUserId = userId; activeUserSerial = serial; }
        loaded.clear();
        if (search != null) search.setText("");
        renderSpaceSelector();
        loadApps(activeUserId);
    }

    private void loadApps(int userId) {
        final long serial = activeUserSerial;
        final boolean includeAll = allSpaces;
        final List<RootHideManager.UserRecord> spaces = new ArrayList<>();
        for (RootHideManager.UserRecord user : userRecords)
            if (user.serial >= 0 && (includeAll || user.userId == userId && user.serial == serial)) spaces.add(user);
        final long generation = ++appLoadGeneration;
        if (spaces.isEmpty()) {
            loading = false;
            loaded.clear();
            summary.setText("没有可安全操作的用户空间。");
            renderApps();
            return;
        }
        loading = true;
        loaded.clear();
        summary.setText("正在读取" + spaceLabel() + "的应用与隐藏状态…");
        renderApps();
        Set<RootHideManager.Target> checked = stateTargets(userId, serial);
        executor.execute(() -> {
            List<RootHideManager.AppRecord> records = new ArrayList<>();
            for (RootHideManager.UserRecord user : spaces) records.addAll(manager.listApps(user.userId, user.serial));
            Map<RootHideManager.Target, RootHideManager.State> states = manager.queryStates(checked);
            ArrayList<AppItem> items = new ArrayList<>();
            for (RootHideManager.AppRecord record : records) {
                if (record.target.isBound() && (includeAll || record.target.userId == userId
                        && record.target.userSerial == serial))
                    items.add(new AppItem(record, states.get(record.target)));
            }
            main.post(() -> {
                if (isFinishing() || isDestroyed() || generation != appLoadGeneration
                        || activeUserId != userId || activeUserSerial != serial || allSpaces != includeAll) return;
                loaded.clear();
                loaded.addAll(items);
                loading = false;
                renderApps();
            });
        });
    }

    private Set<RootHideManager.Target> stateTargets(int userId, long serial) {
        Set<RootHideManager.Target> checked = new LinkedHashSet<>();
        for (RootHideManager.Target target : selected)
            if (target.isBound() && (allSpaces || target.userId == userId && target.userSerial == serial)) checked.add(target);
        for (RootHideManager.Target target : savedTargets)
            if (target.isBound() && (allSpaces || target.userId == userId && target.userSerial == serial)) checked.add(target);
        return checked;
    }

    /** Visibility actions do not invalidate labels, icons or installation dates. */
    private void refreshAppStates() {
        if (operating || activeUserId < 0 || activeUserSerial < 0 || loading) return;
        final int userId = activeUserId;
        final long serial = activeUserSerial;
        final long generation = appLoadGeneration;
        Set<RootHideManager.Target> checked = stateTargets(userId, serial);
        executor.execute(() -> {
            Map<RootHideManager.Target, RootHideManager.State> states = manager.queryStates(checked);
            main.post(() -> {
                if (isFinishing() || isDestroyed() || activeUserId != userId || activeUserSerial != serial
                        || generation != appLoadGeneration || loading) return;
                for (int i = 0; i < loaded.size(); i++) {
                    AppItem item = loaded.get(i);
                    loaded.set(i, new AppItem(item.record, states.get(item.record.target)));
                }
                renderApps();
            });
        });
    }

    private void renderApps() {
        if (appList == null) return;
        updateActionButtons();
        renderSpaceSelector();
        updateSaveStatus();
        if (operating || resultDialogVisible || appConfigBody.getVisibility() != View.VISIBLE) return;
        appList.removeAllViews();
        renderRetainedTargets();
        if (loading) {
            summary.setText(activeUserId < 0 ? "正在读取用户空间…" : "正在读取" + spaceLabel() + "的应用…");
            return;
        }
        String query = search == null ? "" : search.getText().toString().trim().toLowerCase(Locale.ROOT);
        ArrayList<AppItem> visible = new ArrayList<>();
        int selectedInSpace = 0;
        for (AppItem item : loaded) {
            if (item.record.system) continue;
            if (selected.contains(item.record.target)) selectedInSpace++;
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
        visible.sort(order.thenComparing(item -> item.record.target.packageName).thenComparingInt(item -> item.record.target.userId));
        summary.setText(spaceLabel() + " · 可选 " + visible.size() + " 个 · 已勾选 "
                + selectedInSpace + " 个");
        for (AppItem item : visible) appList.addView(appRow(item), ui.margins(0, 0, 0, 8));
        if (visible.isEmpty()) appList.addView(ui.text(query.isEmpty()
                ? "当前空间没有可配置的普通应用" : "没有找到匹配的应用", 12, ui.muted, false), ui.wrap());
    }

    private View appRow(AppItem item) {
        LinearLayout card = ui.card();
        card.setTag("app-" + item.record.target.userId + "-" + item.record.target.packageName);
        LinearLayout top = new LinearLayout(this);
        top.setGravity(Gravity.CENTER_VERTICAL);
        ImageView icon = new ImageView(this);
        Drawable drawable;
        try {
            PackageManager packages = getPackageManager();
            drawable = packages.getApplicationIcon(packages.getApplicationInfo(
                    item.record.target.packageName, RootHideManager.APP_METADATA_FLAGS));
        }
        catch (PackageManager.NameNotFoundException error) { drawable = getDrawable(R.drawable.ic_tile); }
        icon.setImageDrawable(drawable);
        top.addView(icon, new LinearLayout.LayoutParams(ui.dp(42), ui.dp(42)));
        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.setPadding(ui.dp(10), 0, ui.dp(4), 0);
        copy.addView(ui.text(item.record.label, 15, ui.text, true), ui.wrap());
        boolean selectedNow = selected.contains(item.record.target);
        card.setSelected(selectedNow);
        top.setPadding(ui.dp(10), ui.dp(8), ui.dp(6), ui.dp(8));
        top.setBackground(ui.roundStroke(Color.argb(235, 230, 244, 255), 12, Color.rgb(191, 218, 241), 1));
        ((TextView) copy.getChildAt(0)).setTextColor(Color.rgb(20, 35, 58));
        boolean saved = savedTargets.contains(item.record.target);
        String targetStatus = selectedNow && !saved ? " · 待保存"
                : !selectedNow && saved ? " · 待移除"
                : item.state == null ? "" : " · " + localizedState(item.state);
        String detail = item.record.target.packageName + " · 空间 " + item.record.target.userId + (item.record.system ? " · 系统" : " · 第三方")
                + (item.record.installedAt > 0 ? " · "
                + DateFormat.getDateInstance().format(new Date(item.record.installedAt)) : "")
                + targetStatus;
        copy.addView(ui.text(detail, 11, Color.rgb(67, 94, 121), false), ui.margins(0, 2, 0, 0));
        top.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        CheckBox selectedBox = new CheckBox(this);
        ui.styleCheckBox(selectedBox);
        selectedBox.setButtonTintList(android.content.res.ColorStateList.valueOf(
                Color.rgb(31, 116, 197)));
        selectedBox.setChecked(selectedNow);
        selectedBox.setContentDescription("选择" + item.record.label + "，空间 " + item.record.target.userId);
        selectedBox.setEnabled(!operating && !item.record.protectedApp && selectionProblem.isEmpty());
        selectedBox.setOnCheckedChangeListener((button, checked) -> {
            if (operating) {
                button.setChecked(selected.contains(item.record.target));
                return;
            }
            selectTarget(item, checked);
        });
        top.addView(selectedBox, new LinearLayout.LayoutParams(-2, -2));
        card.addView(top, ui.wrap());
        top.setOnClickListener(view -> { if (!operating) selectedBox.performClick(); });
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
        if (saving || !dirty || !selectionReady || selectionLoading || selectionRevision < 0) return;
        // Persist the chosen scope; RootHideManager resolves the current user again before execution.
        LinkedHashMap<String, String> update = new LinkedHashMap<>();
        update.put(AppConfig.HIDE_MASTER, master.isChecked() ? "1" : "0");
        update.put(AppConfig.AUTOMATION_ENABLED, automationEnabled.isChecked() ? "1" : "0");
        update.put(AppConfig.AUTOMATION_SCOPE, automationAllUsers.isChecked() ? "all" : "current");
        update.put(AppConfig.TILE_ENABLED, tileEnabled.isChecked() ? "1" : "0");
        update.put(AppConfig.TILE_LABEL, tileLabel.getText().toString());
        update.put(AppConfig.TILE_DESCRIPTION, tileDescription.getText().toString());
        final long generation=editGeneration;
        final long expectedRevision = selectionRevision;
        final Set<RootHideManager.Target> targets=new LinkedHashSet<>(selected);
        final boolean targetsChanged = !targets.equals(savedTargets);
        saving=true;
        saveFailed=false;
        updateSaveStatus();
        updateActionButtons();
        executor.execute(() -> {
            RootHideManager.OperationResult targetsResult;
            long committedRevision = expectedRevision;
            RootHideManager.ACTION_LOCK.lock();
            try {
                if (!targetsChanged) {
                    AppConfig.SaveResult saved = config.save(update);
                    targetsResult = saved.success ? RootHideManager.OperationResult.success(saved.message)
                            : RootHideManager.OperationResult.failure(saved.message);
                } else targetsResult = manager.saveTargets(targets, update, expectedRevision);
                if (targetsChanged && targetsResult.success) committedRevision = manager.targetRevision();
                if (targetsResult.success) ScreenAutomation.sync(this);
            } catch (RuntimeException error) {
                targetsResult = RootHideManager.OperationResult.failure("保存未完成："
                        + error.getClass().getSimpleName() + "。修改仍保留在当前页面。");
            } finally { RootHideManager.ACTION_LOCK.unlock(); }
            final long savedRevision = committedRevision;
            RootHideManager.OperationResult result = targetsResult;
            main.post(() -> {
                if (isFinishing() || isDestroyed()) return;
                saving=false;
                if (!result.success) {
                    saveFailed=true;
                    updateSaveStatus();
                    Toast.makeText(this, result.message, Toast.LENGTH_LONG).show();
                }
                if (result.success) {
                    if (targetsChanged) {
                        savedTargets.clear();
                        savedTargets.addAll(targets);
                        selectionRevision = savedRevision;
                    }
                    dirty = editGeneration != generation;
                    renderApps();
                    if (dirty) main.post(autoSave);
                }
                updateActionButtons();
            });
        });
    }

    private void confirmAction(String title, String message, boolean hide) {
        if (operating || dirty || saving || !selectionReady || selectionLoading) return;
        final Set<RootHideManager.Target> confirmed = new LinkedHashSet<>(savedTargets);
        actionDialog = ui.glassDialog(title, message, "确认", () -> runOperation(hide, confirmed), "取消");
        styleDialogActions(actionDialog);
    }

    private void styleDialogActions(Dialog dialog) {
        Button confirm = dialog.getWindow().getDecorView().findViewWithTag("glass-dialog-confirm");
        if (confirm == null) return;
        android.view.ViewGroup actions = (android.view.ViewGroup) confirm.getParent();
        for (int i = 0; i < actions.getChildCount(); i++) {
            View action = actions.getChildAt(i);
            if (action instanceof Button) styleActionButton((Button) action, action.isEnabled());
        }
    }

    private void runOperation(boolean hide, Set<RootHideManager.Target> confirmed) {
        if (operating || dirty || saving || !selectionReady || selectionLoading) return;
        operating = true;
        hideAllButton.setActivated(hide);
        showAllButton.setActivated(!hide);
        operationStatus.setText(hide ? "正在准备隐藏…" : "正在准备显示…");
        operationStatus.setVisibility(View.VISIBLE);
        setOperationControls(false);
        // UI feedback is constant-cost. The action has its own worker and manager,
        // so a pending app-list query cannot hold it behind the page's executor.
        actionExecutor.execute(() -> {
            RootHideManager.OperationResult completed;
            try {
                RootHideManager actionManager = new RootHideManager(getApplicationContext());
                completed = actionManager.changeConfirmed(hide, confirmed, message -> main.post(() -> {
                    if (operating && !isFinishing() && !isDestroyed()) operationStatus.setText(message);
                }));
            } catch (RuntimeException error) { completed = RootHideManager.OperationResult.failure(
                    "操作未完成：" + error.getClass().getSimpleName()); }
            RootHideManager.OperationResult result = completed;
            main.post(() -> {
                if (isFinishing() || isDestroyed()) return;
                operating = false;
                hideAllButton.setActivated(false);
                showAllButton.setActivated(false);
                operationStatus.setVisibility(View.GONE);
                setOperationControls(true);
                resultDialogVisible = true;
                actionDialog = ui.glassDialog(result.success ? "操作完成" : "操作未完成",
                        result.message, "知道了", null, null);
                styleDialogActions(actionDialog);
                // Let the completion dialog draw immediately. Lists are refreshed
                // after acknowledgement, rather than rebuilding beneath its first frame.
                actionDialog.setOnDismissListener(dialog -> {
                    resultDialogVisible = false;
                    if (isFinishing() || isDestroyed()) return;
                    if (!dirty && !saving) loadSelection();
                    refreshAppStates();
                });
            });
        });
    }

    private void setOperationControls(boolean enabled) {
        master.setEnabled(enabled); automationEnabled.setEnabled(enabled); tileEnabled.setEnabled(enabled);
        automationAllUsers.setEnabled(enabled); tileLabel.setEnabled(enabled); tileDescription.setEnabled(enabled);
        search.setEnabled(enabled);
        updateActionButtons(); renderSpaceSelector();
        // Existing selection listeners also reject changes while operating.
        for (int i=0;i<appList.getChildCount();i++) appList.getChildAt(i).setAlpha(enabled ? 1f : .55f);
    }

    private void updateActionButtons() {
        boolean ready = selectionReady && !selectionLoading && !saving && !dirty && !operating && !savedTargets.isEmpty();
        if (hideAllButton != null) styleActionButton(hideAllButton, ready && master.isChecked());
        if (showAllButton != null) styleActionButton(showAllButton, ready);
    }

    private void updateSaveStatus() {
        if (saveStatus == null) return;
        saveStatus.setText(saving ? "正在自动保存…" : saveFailed ? "自动保存未完成，点击重试" : dirty ? "修改待自动保存" : "选择自动保存");
        saveStatus.setTextColor(saveFailed ? ui.danger : ui.muted);
    }

    private void markDirty() {
        if (hideFold!=null) hideFold.sync();
        if (automationFold!=null) automationFold.sync();
        if (tileFold!=null) tileFold.sync();
        editGeneration++;
        saveFailed = false;
        dirty = true;
        updateActionButtons();
        main.removeCallbacks(autoSave);main.postDelayed(autoSave,450);
        updateSaveStatus();
    }

    @Override protected void onActivityResult(int request,int result,Intent data) { super.onActivityResult(request,result,data); if(tileImage!=null)tileImage.onResult(request,result,data); }


    private static final class AppItem {
        final RootHideManager.AppRecord record;
        final RootHideManager.State state;
        AppItem(RootHideManager.AppRecord record, RootHideManager.State state) {
            this.record = record;
            this.state = state;
        }
    }
}
