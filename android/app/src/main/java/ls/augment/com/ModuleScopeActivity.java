package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.lang.ref.WeakReference;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Framework-backed module scope page. Merely opening the page never changes scope. */
public final class ModuleScopeActivity extends Activity {
    public static final String EXTRA_MODE = "scope_mode";
    public static final String MODE_EXTRA = "extra";
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable serviceChanged = this::refresh;
    private UiKit ui;
    private LinearLayout page;
    private LinearLayout results;
    private Button refreshButton;
    private Button syncButton;
    private boolean loading;
    private boolean requesting;
    private boolean refreshAgain;
    private boolean extraFirst;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        extraFirst = MODE_EXTRA.equals(getIntent().getStringExtra(EXTRA_MODE));
        ui = new UiKit(this);
        page = ui.detailPage(extraFirst ? "额外作用域" : "作用域同步", null);
        LinearLayout intro = ui.card();
        intro.addView(ui.section("模块在哪些应用中运行", "读取框架实际勾选的应用，并与当前版本的推荐清单核对。勾选状态不代表 Hook 已加载。"));
        page.addView(intro, ui.wrap());
        LinearLayout actions = new LinearLayout(this);
        refreshButton = ui.tonalButton("刷新状态");
        Button manager = ui.button("打开 LSPosed");
        actions.addView(refreshButton, new LinearLayout.LayoutParams(0, -2, 1));
        LinearLayout.LayoutParams managerLayout = new LinearLayout.LayoutParams(0, -2, 1);
        managerLayout.leftMargin = ui.dp(8);
        actions.addView(manager, managerLayout);
        page.addView(actions, ui.margins(0, 14, 0, 0));
        refreshButton.setOnClickListener(v -> refresh());
        manager.setOnClickListener(v -> openManager());
        results = new LinearLayout(this);
        results.setOrientation(LinearLayout.VERTICAL);
        page.addView(results, ui.margins(0, 14, 0, 0));
        ModuleScopeService.addListener(serviceChanged);
    }

    @Override protected void onResume() { super.onResume(); refresh(); }

    @Override protected void onDestroy() {
        ModuleScopeService.removeListener(serviceChanged);
        main.removeCallbacksAndMessages(null);
        worker.shutdownNow();
        super.onDestroy();
    }

    private void refresh() {
        if (isFinishing() || isDestroyed()) return;
        if (loading) { refreshAgain = true; return; }
        loading = true;
        refreshButton.setEnabled(false);
        refreshButton.setText("正在读取…");
        if (results.getChildCount() == 0) {
            results.addView(ui.text("正在读取当前安装包与框架状态…", 13, ui.muted, false));
        }
        worker.execute(() -> {
            ModuleScopeService.Snapshot snapshot = ModuleScopeService.read(this);
            Map<String, String> labels = new LinkedHashMap<>();
            Map<String, Boolean> installed = new LinkedHashMap<>();
            if (snapshot.descriptor != null) for (String scope : snapshot.descriptor.recommended) {
                labels.put(scope, label(scope));
                installed.put(scope, ModuleScopeService.installed(this, scope));
            }
            for (String scope : snapshot.actual) if (!labels.containsKey(scope)) {
                labels.put(scope, label(scope));
                installed.put(scope, ModuleScopeService.installed(this, scope));
            }
            main.post(() -> {
                if (isFinishing() || isDestroyed()) return;
                loading = false;
                refreshButton.setEnabled(true);
                refreshButton.setText("刷新状态");
                render(snapshot, labels, installed);
                if (refreshAgain) { refreshAgain = false; refresh(); }
            });
        });
    }

    private void render(ModuleScopeService.Snapshot snapshot, Map<String, String> labels,
            Map<String, Boolean> installed) {
        results.removeAllViews();
        requesting = ModuleScopeService.isSynchronizing();
        syncButton = null;
        LinearLayout status = ui.card();
        status.addView(ui.text(snapshot.connected ? "已连接 · " + snapshot.framework : "框架状态暂不可读", 12.5f, ui.text, true));
        status.addView(ui.text(snapshot.connected ? "当前框架返回 " + snapshot.actual.size() + " 个作用域。" : snapshot.error,
                12, ui.muted, false), ui.margins(0,6,0,0));
        results.addView(status, ui.wrap());
        if (snapshot.descriptor == null) return;
        if (extraFirst) renderExtra(snapshot, labels);
        renderRecommended(snapshot, labels, installed);
        if (!extraFirst) renderExtra(snapshot, labels);
    }

    private void renderRecommended(ModuleScopeService.Snapshot snapshot, Map<String, String> labels,
            Map<String, Boolean> installed) {
        List<String> present = new ArrayList<>();
        List<String> absent = new ArrayList<>();
        int missing = 0;
        for (String scope : snapshot.descriptor.recommended) {
            if (Boolean.TRUE.equals(installed.get(scope))) {
                present.add(scope);
                if (!snapshot.actual.contains(scope)) missing++;
            } else absent.add(scope);
        }
        LinearLayout card = ui.card();
        card.addView(ui.featureTitle("推荐作用域", "推荐作用域是当前模块已经适配的系统和应用清单。同步时只请求补齐本机已安装、但框架尚未勾选的推荐应用；不会新增清单以外的应用，也不会取消其他勾选。\n\n如果框架弹出确认，请在框架中处理。只有重新读取并确认全部推荐项已勾选，才会显示同步成功。重启相关应用后，框架才能加载对应功能。"));
        card.addView(ui.text("本机已安装 " + present.size() + " 个 · 未安装 " + absent.size() + " 个",
                11.5f, ui.muted, false), ui.margins(0, 5, 0, 0));
        if (snapshot.connected && missing > 0) {
            card.addView(ui.text("还有 " + missing + " 个已安装应用未勾选。", 12, ui.warning, false), ui.margins(0, 8, 0, 0));
        }
        syncButton = ui.accentButton(requesting ? "等待框架处理…" : "同步推荐作用域");
        syncButton.setEnabled(snapshot.connected && !requesting);
        card.addView(syncButton, ui.margins(0, 12, 0, 0));
        card.addView(ui.text("同步只补齐本机已安装的推荐应用；如框架要求授权，请在框架提示中确认。", 11.5f, ui.muted, false), ui.margins(0, 8, 0, 0));
        syncButton.setOnClickListener(v -> synchronize());
        for (String scope : present) scopeRow(card, labels.get(scope), scope,
                !snapshot.connected ? "状态未知" : snapshot.actual.contains(scope) ? "已勾选" : "待同步",
                snapshot.connected && snapshot.actual.contains(scope) ? ui.cyan : ui.muted);
        results.addView(card, ui.margins(0, 14, 0, 0));
        if (!absent.isEmpty()) {
            LinearLayout absentList = new LinearLayout(this);
            absentList.setOrientation(LinearLayout.VERTICAL);
            for (String scope : absent) scopeRow(absentList, labels.get(scope), scope,
                    snapshot.connected && snapshot.actual.contains(scope) ? "未安装 · 已声明" : "未安装", ui.muted);
            results.addView(ui.collapsible("本机未安装的应用 · " + absent.size(),
                    "其他机型的应用也会保留在推荐清单中，无需为此安装它们。", absentList, false), ui.margins(0, 14, 0, 0));
        }
    }

    private void renderExtra(ModuleScopeService.Snapshot snapshot, Map<String, String> labels) {
        LinearLayout card = ui.card();
        String explanation = snapshot.descriptor.fixed
                ? "当前版本使用固定作用域，只支持已适配的推荐应用，暂不支持新增额外应用。"
                : "当前版本未提供任意应用的适配；此处仅核对框架中已有的额外作用域。";
        card.addView(ui.featureTitle("额外作用域", explanation
                + "\n\n下方列表来自框架的实际勾选状态，用于查看不在推荐清单内的应用。打开本页或查看说明不会修改作用域。需要检查已有勾选时，可使用上方“打开 LSPosed”入口。"));
        card.addView(ui.text(explanation, 11.5f, ui.muted, false), ui.margins(0, 5, 0, 0));
        if (!snapshot.connected) {
            card.addView(ui.text("连接框架后可查看实际列表。", 12, ui.muted, false), ui.margins(0, 10, 0, 0));
        } else {
            int count = 0;
            for (String scope : snapshot.actual) if (!snapshot.descriptor.recommended.contains(scope)) {
                scopeRow(card, labels.get(scope), scope, "非推荐", ui.warning);
                count++;
            }
            card.addView(ui.text(count == 0 ? "当前没有额外作用域。"
                    : "框架中有 " + count + " 个非推荐作用域。需要调整时，请在 LSPosed 中检查。",
                    12, ui.muted, false), ui.margins(0, 10, 0, 0));
        }
        results.addView(card, ui.margins(0, 14, 0, 0));
    }

    private void scopeRow(LinearLayout parent, String label, String scope, String state, int stateColor) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(0, ui.dp(13), 0, ui.dp(10));
        LinearLayout head = new LinearLayout(this);
        head.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = ui.text(label == null ? scope : label, 12.5f, ui.text, true);
        head.addView(title, new LinearLayout.LayoutParams(0, -2, 1));
        TextView status = ui.text(state, 11, stateColor, false);
        status.setPadding(ui.dp(8), 0, 0, 0);
        head.addView(status, new LinearLayout.LayoutParams(-2, -2));
        row.addView(head);
        TextView packageName = ui.text(scope, 11, ui.muted, false);
        packageName.setTextIsSelectable(true);
        row.addView(packageName, ui.margins(0, 5, 0, 0));
        parent.addView(row, ui.wrap());
    }

    private String label(String scope) {
        if ("system".equals(scope)) return "系统框架";
        try {
            ApplicationInfo info = getPackageManager().getApplicationInfo(scope, 0);
            return getPackageManager().getApplicationLabel(info).toString();
        } catch (Exception ignored) { return scope; }
    }

    private void synchronize() {
        if (requesting) return;
        requesting = true;
        if (syncButton != null) {
            syncButton.setEnabled(false);
            syncButton.setText("等待框架处理…");
        }
        // A framework confirmation can outlive this Activity, including across rotation.
        WeakReference<ModuleScopeActivity> owner = new WeakReference<>(this);
        android.content.Context application = getApplicationContext();
        worker.execute(() -> ModuleScopeService.synchronizeRecommended(application, (success, message) -> {
            ModuleScopeActivity activity = owner.get();
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            activity.requesting = ModuleScopeService.isSynchronizing();
            AppDialogs.builder(activity).setTitle(success ? "同步结果" : "同步未完成")
                    .setMessage(message).setPositiveButton("知道了", null).show();
            activity.refresh();
        }));
    }

    private void openManager() {
        try {
            Intent launch = getPackageManager().getLaunchIntentForPackage("org.lsposed.manager");
            if (launch != null) { startActivity(launch); return; }
        } catch (RuntimeException ignored) { }
        AppDialogs.builder(this).setTitle("打开 LSPosed")
                .setMessage("未找到可直接打开的管理器入口。请通过桌面上的 LSPosed 快捷方式或框架通知打开管理器，进入「模块 → LS_Augment」查看作用域。")
                .setPositiveButton("知道了", null).show();
    }
}
