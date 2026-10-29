package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.SharedPreferences;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Configuration only. The workspace is entered through the phone's global gesture. */
public final class AtomicWorkbenchSettingsActivity extends Activity {
    static final String EXTRA_COMPONENT = AtomicWorkbenchConfig.EXTRA_COMPONENT;
    static final String EXTRA_GENERATION = "atomic_workbench_generation";
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "Duo-WorkbenchSettings");
        thread.setDaemon(true);
        return thread;
    });
    private static final class Session {
        boolean busy;
        Boolean expanded;
        boolean guideOffered, guidePending;
        String message = "";
        long messageUntil;
        WeakReference<AtomicWorkbenchSettingsActivity> owner;
    }
    private final Handler main = new Handler(Looper.getMainLooper());
    private final SharedPreferences.OnSharedPreferenceChangeListener diagnosticListener = (prefs, key) -> {
        if (AtomicWorkbenchConfig.READY.equals(key) || AtomicWorkbenchConfig.RUNTIME.equals(key))
            main.post(() -> { refreshStatus(); maybeShowGestureGuide(); });
    };
    private Session session;
    private AppConfig config;
    private UiKit ui;
    private Switch enabled;
    private Button check;
    private TextView status;
    private TextView pasteStatus;
    private Button pasteSettings;
    private LinearLayout parameters;
    private UiKit.Fold fold;
    private AtomicWorkbenchAppearanceControls appearance;
    private AtomicWorkbenchExtractionControls extraction;
    private SharedPreferences diagnostics;
    private boolean rendering;
    private boolean resumed;
    private AtomicWorkbenchGestureGuide gestureGuide;
    private Toast statusToast;
    private long editorGeneration;
    private final Runnable statusTick = new Runnable() {
        @Override public void run() { refreshStatus(); maybeShowGestureGuide(); main.postDelayed(this, 5000L); }
    };

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        editorGeneration = ResetWriteFence.generation();
        config = new AppConfig(this);
        ui = new UiKit(this);
        Object retained = getLastNonConfigurationInstance();
        session = retained instanceof Session ? (Session) retained : new Session();
        if (!(retained instanceof Session) && state != null) {
            session.guideOffered = state.getBoolean("step_guide_offered");
            session.guidePending = state.getBoolean("step_guide_pending");
        }
        session.owner = new WeakReference<>(this);
        LinearLayout body = ui.detailPage("红魔Step", "device");
        ui.addDetailSectionTitle(body, "全局手势");
        LinearLayout card = ui.preferenceCard();
        body.addView(card, ui.wrap());
        enabled = new Switch(this);
        enabled.setTag("config:" + AtomicWorkbenchConfig.ENABLED);
        enabled.setChecked(on());
        card.addView(ui.featureRow("启用红魔Step",
                "开启后，在桌面或应用中从顶部左侧或右侧、状态栏下方向屏幕中间水平滑动，进入工作台。需要手机 Root 授权，并在 LSPosed 为红魔Duo勾选系统框架和系统桌面；首次安装或更新后需重启手机。", enabled), ui.wrap());
        status = ui.text("", 12, ui.muted, false);
        status.setTag("atomic-workbench-settings-status");
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        card.addView(status, ui.margins(0, 4, 0, 8));
        check = ui.tonalButton("检查授权与接入");
        check.setTag("atomic-workbench-check");
        check.setOnClickListener(view -> request(null));
        card.addView(check, ui.margins(0, 0, 0, 8));
        parameters = new LinearLayout(this);
        parameters.setOrientation(LinearLayout.VERTICAL);
        parameters.setTag("atomic-workbench-parameters");
        body.addView(parameters, ui.margins(0, 8, 0, 0));
        LinearLayout appearanceCard = ui.preferenceCard();
        appearance = new AtomicWorkbenchAppearanceControls(this, ui, config, editorGeneration, WORKER, null);
        appearanceCard.addView(appearance, ui.wrap());
        parameters.addView(appearanceCard, ui.margins(0, 0, 0, 8));
        LinearLayout pasteCard = ui.preferenceCard();
        pasteCard.addView(ui.featureTitle("文字填入", "将流转文字拖到工作台窗口，可填入该应用当前选中的输入框，并核对光标、选区和前后正文。需要手机的无障碍输入连接；密码框不支持。"), ui.wrap());
        pasteStatus = ui.text("", 12, ui.muted, false);
        pasteStatus.setTag("atomic-workbench-paste-status");
        pasteCard.addView(pasteStatus, ui.margins(0, 0, 0, 8));
        pasteSettings = ui.tonalButton("启用文字填入服务");
        pasteSettings.setMinimumHeight(ui.dp(48));
        pasteSettings.setOnClickListener(view -> {
            try { startActivity(new Intent(android.provider.Settings.ACTION_ACCESSIBILITY_SETTINGS)); }
            catch (RuntimeException unavailable) { Toast.makeText(this, "请从手机设置打开无障碍服务", Toast.LENGTH_LONG).show(); }
        });
        pasteCard.addView(pasteSettings, ui.margins(0, 0, 0, 8));
        parameters.addView(pasteCard, ui.margins(0, 0, 0, 8));
        LinearLayout extractionCard = ui.preferenceCard();
        extraction = new AtomicWorkbenchExtractionControls(this, ui, config, editorGeneration, WORKER);
        extractionCard.addView(extraction, ui.wrap());
        parameters.addView(extractionCard, ui.margins(0, 0, 0, 8));
        LinearLayout instructions = ui.preferenceCard();
        parameters.addView(instructions, ui.wrap());
        instructions.addView(ui.featureTitle("打开方式", "从顶部左侧或右侧的触发区域起滑，单指向屏幕中间水平滑动后松手。区域位于状态栏下方；向下拉动、斜下滑动、屏幕中下部侧滑和多指操作不会打开工作台。可在下方调整并查看实际触发区域。"), ui.wrap());
        Button demonstrate = ui.tonalButton("练习进入手势");
        demonstrate.setTag("step-gesture-guide-replay");
        demonstrate.setOnClickListener(view -> showGestureGuide());
        instructions.addView(demonstrate, ui.margins(0, 0, 0, 8));
        instructions.addView(ui.text("首次进入开始新的工作区。同一个工作台页面临时切到其他应用后，可返回原工作区；主动退出或页面真正销毁后，手机在后台将应用任务移回原屏幕。在应用中触发时仅尝试接入本次当前应用，从桌面触发时显示手机原生桌面。空白工作区的“＋”始终打开原生桌面。开启“快捷打开 App”后，顶部横向图标可打开或切换应用。锁屏时不触发。", 13, ui.muted, false), ui.margins(0, 0, 0, 8));
        instructions.addView(ui.text("开启“显示顶栏状态卡”后，可横向滑动切换音乐、导航及可读取的计时通知。高德地图的实际转向、道路和剩余行程需要在 LSPosed 为红魔Duo勾选“高德地图”，随后完全退出并重新打开高德。导航信息由手机实时读取；未收到实际指引时会说明原因。", 13, ui.muted, false), ui.margins(0, 0, 0, 8));
        Button mapScope = ui.tonalButton("检查高德地图作用域");
        mapScope.setOnClickListener(view -> startActivity(new Intent(this, ModuleScopeActivity.class)));
        instructions.addView(mapScope, ui.margins(0, 0, 0, 8));
        // Data-management exception: reachable and writable while master/quick-open are off.
        LinearLayout appManagement=ui.preferenceCard();
        appManagement.addView(ui.preferenceRow("atomic_workbench_apps", "应用列表显示",
                "只调整入口显示，不启用工作台；隐藏不结束任务。",
                () -> ModuleNavigation.open(this,AtomicWorkbenchAppsActivity.DISPLAY_ROUTE)),ui.wrap());
        appManagement.addView(ui.preferenceRow("atomic_workbench_app_sort", "应用列表排序",
                "保存手动、使用频率或首字母偏好；不启用快捷栏。",
                () -> ModuleNavigation.open(this,AtomicWorkbenchAppsActivity.SORT_ROUTE)),ui.wrap());
        body.addView(appManagement,ui.margins(0,8,0,0));
        fold = ui.fold(enabled, parameters);
        fold.show(session.expanded != null && session.expanded);
        enabled.setOnCheckedChangeListener((control, checked) -> {
            if (!rendering) request(checked);
        });
        refreshControls();
        refreshStatus();
    }

    private boolean on() { return config.getBoolean(AtomicWorkbenchConfig.ENABLED); }

    private void request(Boolean desired) {
        if (session.busy) { refreshControls(); return; }
        if (ResetWriteFence.stale(editorGeneration)) {
            session.message = ResetWriteFence.blocked() ? "正在重置配置，请稍后重试。" : "配置已重置，请返回后重新打开此页。";
            session.messageUntil = SystemClock.elapsedRealtime() + 8000L;
            refreshControls(); refreshStatus(); return;
        }
        // Display the committed value until authorization, readiness and persistence all succeed.
        refreshControls();
        session.busy = true;
        session.message = desired == null ? "正在检查手机授权与系统手势接入…"
                : desired ? "正在核验手机授权并开启全局手势…" : "正在关闭全局手势…";
        refreshControls(); refreshStatus();
        Session requestSession = session;
        AppConfig requestConfig = config;
        long generation = editorGeneration;
        int boot = RuntimeEnvironment.bootCount(this);
        WORKER.execute(() -> {
            String result;
            if (ResetWriteFence.stale(generation)) result = "配置已重置，本次操作未应用。";
            else {
                result = desired != null && !desired ? "" : prerequisites(requestConfig, boot);
                if (ResetWriteFence.stale(generation)) result = "配置已重置，本次操作未应用。";
                if (result.isEmpty() && desired != null) {
                    AppConfig.SaveResult saved = requestConfig.save(Collections.singletonMap(
                            AtomicWorkbenchConfig.ENABLED, desired ? "1" : "0"));
                    result = saved.success ? desired ? "已开启，可在桌面或应用中使用全局手势。" : "已关闭全局手势。" : saved.message;
                } else if (result.isEmpty()) result = "手机 Root 授权与当前版本的系统手势接入均已确认。";
            }
            final String message = result;
            main.post(() -> {
                requestSession.busy = false;
                requestSession.message = ResetWriteFence.stale(generation) ? "配置已重置，本次操作未重新应用。" : message;
                requestSession.messageUntil = SystemClock.elapsedRealtime() + 8000L;
                AtomicWorkbenchSettingsActivity page = requestSession.owner == null ? null : requestSession.owner.get();
                if (page == null || page.isDestroyed()) return;
                page.refreshControls(); page.refreshStatus();
                page.maybeShowGestureGuide();
                if (page.gestureGuide == null) {
                    page.cancelStatusToast();
                    page.statusToast = Toast.makeText(page, requestSession.message, Toast.LENGTH_LONG);
                    page.statusToast.show();
                }
            });
        });
    }

    private static String prerequisites(AppConfig config, int boot) {
        RootShell.Result root = RootShell.run("id -u", null, 10, 1024);
        if (!root.isSuccess() || !"0".equals(root.output.trim()))
            return root.timedOut ? "手机 Root 授权检查超时，请在授权管理器中允许红魔Duo后重试。"
                    : "尚未获得手机 Root 授权，请在授权管理器中允许红魔Duo后重试。";
        RootShell.Result process = RootShell.run("pidof system_server", null, 4, 1024);
        String pid = process.output.trim();
        if (!process.isSuccess() || !pid.matches("[1-9][0-9]{0,9}")) return "无法确认当前系统框架进程，请重启手机后重试。";
        final int value;
        try { value = Integer.parseInt(pid); }
        catch (NumberFormatException invalid) { return "系统框架进程状态无效，请重新检查。"; }
        String issue = AtomicWorkbenchConfig.readinessProblem(config.diagnostic(AtomicWorkbenchConfig.READY),
                BuildConfig.VERSION_CODE, boot, value, SystemClock.elapsedRealtime());
        return issue.isEmpty() ? "" : issue + "。请在 LSPosed 勾选系统框架，并重启手机后重试。";
    }

    private void refreshControls() {
        if (enabled == null) return;
        rendering = true;
        enabled.setChecked(on());
        boolean available = !session.busy && !ResetWriteFence.stale(editorGeneration);
        enabled.setEnabled(available);
        check.setEnabled(available);
        if (appearance != null) appearance.refresh(available && on());
        if (extraction != null) extraction.refresh(available && on());
        rendering = false;
        fold.sync();
        if (!on() || ResetWriteFence.stale(editorGeneration)) {
            session.guidePending = false;
            dismissGestureGuide();
        }
    }

    private void maybeShowGestureGuide() {
        if (!resumed || session.busy || gestureGuide != null || !on() || ResetWriteFence.stale(editorGeneration)
                || isFinishing() || isDestroyed()) return;
        if (!session.guidePending && (session.guideOffered || AtomicWorkbenchGestureGuide.seen(this))) return;
        if (!AtomicWorkbenchConfig.readinessProblem(config.diagnostic(AtomicWorkbenchConfig.READY),
                BuildConfig.VERSION_CODE, RuntimeEnvironment.bootCount(this), 0, SystemClock.elapsedRealtime()).isEmpty()) return;
        showGestureGuide();
    }

    private void showGestureGuide() {
        if (!resumed || gestureGuide != null || !on() || ResetWriteFence.stale(editorGeneration)
                || isFinishing() || isDestroyed()) return;
        session.guideOffered = true;
        session.guidePending = true;
        cancelStatusToast();
        AtomicWorkbenchGestureGuide dialog = AtomicWorkbenchGestureGuide.create(this, ui, config);
        gestureGuide = dialog;
        dialog.setOnCancelListener(() -> session.guidePending = false);
        dialog.setOnDismissListener(() -> { if (gestureGuide == dialog) gestureGuide = null; });
        dialog.show();
    }

    private void dismissGestureGuide() {
        if (gestureGuide != null) { gestureGuide.dismiss(); gestureGuide = null; }
    }

    private void cancelStatusToast() {
        if (statusToast != null) { statusToast.cancel(); statusToast = null; }
    }

    private void refreshStatus() {
        if (status == null || isDestroyed()) return;
        boolean pasteConnected = AtomicWorkbenchPasteService.available();
        if (pasteStatus != null) pasteStatus.setText(pasteConnected ? "文字填入服务已连接；执行时仍会核对目标输入框。" : "文字填入服务未连接；启用后可重新拖入文字。素材会保留。");
        if (pasteSettings != null) pasteSettings.setText(pasteConnected ? "管理文字填入服务" : "启用文字填入服务");
        if (session.busy || !session.message.isEmpty() && SystemClock.elapsedRealtime() < session.messageUntil) {
            status.setText(session.message); return;
        }
        String issue = AtomicWorkbenchConfig.readinessProblem(config.diagnostic(AtomicWorkbenchConfig.READY),
                BuildConfig.VERSION_CODE, RuntimeEnvironment.bootCount(this), 0, SystemClock.elapsedRealtime());
        if (!issue.isEmpty()) status.setText(getString(on() ? R.string.workbench_status_enabled : R.string.workbench_status_disabled, issue));
        else {
            String runtime = config.diagnostic(AtomicWorkbenchConfig.RUNTIME);
            status.setText(!on() ? "已关闭；当前版本的系统手势接入已就绪。"
                    : runtime.isEmpty() ? "全局手势接入已就绪，可从桌面或应用中触发。" : runtime);
        }
    }

    @Override protected void onResume() {
        super.onResume();
        resumed = true;
        if (!ResetWriteFence.blocked() && editorGeneration != ResetWriteFence.generation()) {
            editorGeneration = ResetWriteFence.generation();
            config = new AppConfig(this);
            if (appearance != null) appearance.rebind(config, editorGeneration);
            if (extraction != null) extraction.rebind(config, editorGeneration);
            session.message = "配置已重置，请重新检查授权与接入。";
            session.messageUntil = SystemClock.elapsedRealtime() + 8000L;
        }
        diagnostics = getSharedPreferences(AppConfig.DIAGNOSTICS, MODE_PRIVATE);
        diagnostics.registerOnSharedPreferenceChangeListener(diagnosticListener);
        main.removeCallbacks(statusTick);
        main.postDelayed(statusTick, 5000L);
        refreshControls(); refreshStatus();
        if (AtomicWorkbenchGestureGuide.seen(this)) session.guidePending = false;
        maybeShowGestureGuide();
    }

    @Override protected void onPause() {
        resumed = false;
        dismissGestureGuide();
        cancelStatusToast();
        if (diagnostics != null) diagnostics.unregisterOnSharedPreferenceChangeListener(diagnosticListener);
        main.removeCallbacks(statusTick);
        super.onPause();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("step_guide_offered", session.guideOffered);
        state.putBoolean("step_guide_pending", session.guidePending);
        super.onSaveInstanceState(state);
    }

    @Override public Object onRetainNonConfigurationInstance() {
        session.expanded = parameters.getVisibility() == View.VISIBLE;
        return session;
    }

    @Override protected void onDestroy() {
        dismissGestureGuide();
        if (extraction != null) extraction.close();
        if (session.owner != null && session.owner.get() == this) session.owner.clear();
        super.onDestroy();
    }

    /** Kept for reset callers; this page now uses the shared fenced configuration store. */
    static void onStorageReset() { }

    static boolean allowed(ActivityInfo activity) {
        if (activity == null || activity.packageName == null || !activity.enabled || !activity.exported
                || activity.applicationInfo == null || !activity.applicationInfo.enabled
                || activity.applicationInfo.uid / 100000 != android.os.Process.myUid() / 100000
                || (activity.permission != null && !activity.permission.isEmpty())) return false;
        String pkg = activity.packageName;
        return !"ls.augment.com".equals(pkg) && !"android".equals(pkg)
                && !"com.android.systemui".equals(pkg) && !pkg.endsWith("permissioncontroller");
    }
}
