package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;

/** Read-only history and a separate, explicit current-target display confirmation. */
public final class HideRecoveryActivity extends Activity {
    private static final String CONFIGURED = "configured_only";
    private static final String FOCUS_PACKAGE = "focus_package";
    private static final String FOCUS_USER = "focus_user";
    private static final String FOCUS_SERIAL = "focus_serial";
    private static final int ROWS_PER_BATCH = 60;
    private static final int VIEWS_PER_FRAME = 8;
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final List<Button> actions = new ArrayList<>();
    private HideRecoveryController controller;
    private HideTargetController targetController;
    private HideTargetController.Preview activeTargetPreview;
    private Button focusedShow;
    private UiKit ui;
    private TextView status, feedback, count, focusStatus;
    private LinearLayout list;
    private Button configuredButton, historyButton, refreshButton, moreRows, nextPage, allRecordsButton;
    private List<HideRecoveryController.Row> rows = new ArrayList<>();
    private String cursor = "", nextCursor = "", focusPackage = "";
    private int focusUser = -1, visibleLimit = ROWS_PER_BATCH, renderGeneration, reviewGeneration;
    private long focusSerial = -1;
    private boolean configuredOnly, busy, foreground;
    private volatile boolean destroyed;
    private AlertDialog dialog;
    private HideRecoveryController.Preview activePreview;

    static Intent intent(Context context, boolean configuredOnly) {
        return new Intent(context, HideRecoveryActivity.class).putExtra(CONFIGURED, configuredOnly);
    }

    static Intent intent(Context context, RootHideManager.Target focus) {
        return intent(context, false).putExtra(FOCUS_PACKAGE, focus.packageName)
                .putExtra(FOCUS_USER, focus.userId).putExtra(FOCUS_SERIAL, focus.userSerial);
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        // This activity is unexported. Existing hide-management session checks
        // stay at their entry points; a user-clicked system tile may open recovery.
        configuredOnly = getIntent().getBooleanExtra(CONFIGURED, false);
        String requested = getIntent().getStringExtra(FOCUS_PACKAGE);
        focusPackage = requested == null ? "" : requested;
        focusUser = getIntent().getIntExtra(FOCUS_USER, -1);
        focusSerial = getIntent().getLongExtra(FOCUS_SERIAL, -1);
        controller = new HideRecoveryController(getApplicationContext());
        targetController = new HideTargetController(getApplicationContext(), new RootHideManager(getApplicationContext()));
        ui = new UiKit(this);
        build();
        loadPage("");
    }

    @Override protected void onResume() {
        super.onResume();
        foreground = true;
    }

    @Override protected void onPause() {
        foreground = false;
        reviewGeneration++;
        // A confirmation is never carried across leaving/locking this screen.
        dismissDialog();
        super.onPause();
    }

    @Override protected void onDestroy() {
        destroyed = true;
        renderGeneration++;
        main.removeCallbacksAndMessages(null);
        dismissDialog();
        // Already confirmed work can finish; it cannot start another action.
        worker.shutdown();
        super.onDestroy();
    }

    private void build() {
        LinearLayout page = ui.detailPage("应用显示与历史", null);
        LinearLayout explanation = ui.card();
        explanation.addView(ui.section("手动显示应用",
                "选择当前应用与空间，再确认显示。重启、取消勾选、关闭总开关或重置设置都不会自动显示应用。"), ui.wrap());
        explanation.addView(ui.text("清除应用数据或重装后，可重新读取已保存名单。历史记录只供查看和查询上次结果，不会再次执行。",
                12, ui.muted, false), ui.margins(0, 9, 0, 0));
        page.addView(explanation, ui.margins(0, 8, 0, 10));

        LinearLayout options = ui.card();
        configuredButton = ui.button("已保存应用");
        historyButton = ui.button("历史记录");
        configuredButton.setOnClickListener(view -> chooseSource(true));
        historyButton.setOnClickListener(view -> chooseSource(false));
        LinearLayout tabs = new LinearLayout(this);
        tabs.addView(configuredButton, new LinearLayout.LayoutParams(0, -2, 1));
        tabs.addView(historyButton, new LinearLayout.LayoutParams(0, -2, 1));
        options.addView(tabs, ui.wrap());
        focusStatus = ui.text("", 12, ui.muted, false);
        options.addView(focusStatus, ui.margins(0, 8, 0, 0));
        focusedShow = ui.accentButton("显示这个应用");
        focusedShow.setOnClickListener(view -> beginCurrentPreview(focusedTarget()));
        options.addView(focusedShow, ui.margins(0, 8, 0, 0));
        allRecordsButton = ui.tonalButton("查看全部记录");
        allRecordsButton.setOnClickListener(view -> {
            if (busy) return;
            focusPackage = "";
            focusUser = -1;
            focusSerial = -1;
            configuredOnly = false;
            loadPage("");
        });
        options.addView(allRecordsButton, ui.margins(0, 8, 0, 0));
        refreshButton = ui.tonalButton("重新读取");
        refreshButton.setOnClickListener(view -> loadPage(!configuredOnly && !focusPackage.isEmpty() ? "" : cursor));
        options.addView(refreshButton, ui.margins(0, 8, 0, 0));
        status = ui.text("", 12, ui.muted, false);
        options.addView(status, ui.margins(0, 9, 0, 0));
        feedback = ui.text("", 13, ui.text, true);
        feedback.setTextIsSelectable(true);
        options.addView(feedback, ui.margins(0, 9, 0, 0));
        page.addView(options, ui.margins(0, 0, 0, 10));

        count = ui.text("", 12, ui.muted, false);
        page.addView(count, ui.margins(2, 0, 0, 8));
        list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        page.addView(list, ui.wrap());
        moreRows = ui.tonalButton("显示更多本页记录");
        moreRows.setOnClickListener(view -> {
            if (busy) return;
            visibleLimit = Math.min(rows.size(), visibleLimit + ROWS_PER_BATCH);
            renderRows();
        });
        page.addView(moreRows, ui.margins(0, 4, 0, 8));
        nextPage = ui.tonalButton("读取下一页历史");
        nextPage.setOnClickListener(view -> {
            if (!nextCursor.isEmpty()) loadPage(nextCursor);
        });
        page.addView(nextPage, ui.margins(0, 0, 0, 14));
        updateControls();
    }

    private void chooseSource(boolean configured) {
        if (busy) return;
        configuredOnly = configured;
        // Changing category never changes the selected user instance.
        loadPage("");
    }

    private void loadPage(String requestedCursor) {
        if (busy || !open()) return;
        reviewGeneration++;
        dismissDialog();
        cursor = requestedCursor;
        rows = new ArrayList<>();
        nextCursor = "";
        renderRows();
        final boolean configured = configuredOnly;
        final String pkg = focusPackage;
        final int user = focusUser;
        final long serial = focusSerial;
        runTask("正在读取应用名单与历史…", () -> {
            HideRecoveryController.Page page = !configured && !pkg.isEmpty()
                    ? controller.loadCandidates(requestedCursor, new RootHideManager.Target(user, serial, pkg))
                    : controller.load(requestedCursor, configured);
            List<HideRecoveryController.Row> selected = new ArrayList<>();
            if (page.success) for (HideRecoveryController.Row row : page.rows) {
                if (pkg.isEmpty() || (pkg.equals(row.packageName) && user == row.originalUserId
                        && serial >= 0 && serial == row.userSerial))
                    selected.add(row);
            }
            return new Loaded(page, selected);
        }, loaded -> {
            cursor = requestedCursor;
            if (!loaded.page.success) {
                rows = new ArrayList<>();
                nextCursor = "";
                status.setText(loaded.page.message);
                status.setTextColor(ui.danger);
            } else {
                rows = loaded.rows;
                nextCursor = loaded.page.nextCursor == null ? "" : loaded.page.nextCursor;
                status.setText(loaded.page.message);
                status.setTextColor(ui.muted);
            }
            visibleLimit = ROWS_PER_BATCH;
            renderRows();
        });
    }

    private void renderRows() {
        int generation = ++renderGeneration;
        list.removeAllViews();
        actions.clear();
        int end = Math.min(rows.size(), visibleLimit);
        count.setText(rows.isEmpty() ? (!nextCursor.isEmpty() && !focusPackage.isEmpty() && !configuredOnly
                ? "本页尚未找到匹配记录，可继续查找。" : "本页没有可展示的匹配记录。")
                : "本页共 " + rows.size() + " 条，展示 " + end + " 条。每条都需单独核对。");
        updateControls();
        appendRows(generation, 0, end);
    }

    private void appendRows(int generation, int start, int end) {
        if (!open() || generation != renderGeneration) return;
        int until = Math.min(end, start + VIEWS_PER_FRAME);
        for (int index = start; index < until; index++) {
            HideRecoveryController.Row row = rows.get(index);
            LinearLayout card = ui.card();
            card.addView(ui.text(row.packageName.isEmpty() ? "无法识别的记录" : row.packageName,
                    14, ui.text, true), ui.wrap());
            TextView detail = ui.text(row.details, 12, ui.muted, false);
            detail.setTextIsSelectable(true);
            card.addView(detail, ui.margins(0, 8, 0, 0));
            card.addView(ui.text(row.chooseUser
                    ? "可选择一个当前空间查询状态；这不代表记录属于该空间。"
                    : "将重新核对原空间及其用户身份。", 11, ui.muted, false),
                    ui.margins(0, 8, 0, 0));
            Button review = ui.accentButton(row.currentTarget ? "显示" : row.searchable() ? "查找历史记录"
                    : row.restoreStatus() ? "核对上次恢复结果" : "核对当前状态");
            review.setEnabled(row.actionable && !busy);
            review.setAlpha(review.isEnabled() ? 1f : .5f);
            review.setOnClickListener(view -> beginReview(row));
            actions.add(review);
            card.addView(review, ui.margins(0, 9, 0, 0));
            list.addView(card, ui.margins(0, 0, 0, 10));
        }
        if (until < end) main.post(() -> appendRows(generation, until, end));
    }

    private void beginReview(HideRecoveryController.Row row) {
        if (busy || !row.actionable || !foreground) return;
        if (row.currentTarget) {
            beginCurrentPreview(new RootHideManager.Target(row.originalUserId, row.userSerial, row.packageName));
            return;
        }
        if (row.searchable()) {
            focusPackage = row.packageName;
            focusUser = row.originalUserId;
            focusSerial = row.userSerial;
            configuredOnly = false;
            feedback.setText("");
            loadPage("");
            return;
        }
        int generation = ++reviewGeneration;
        feedback.setText("");
        if (!row.chooseUser) {
            preview(row, row.originalUserId, generation);
            return;
        }
        runTask("正在读取当前可用空间…", controller::users, directory -> {
            if (!directory.success || directory.users.isEmpty()) {
                feedback.setText(directory.message.isEmpty() ? "没有可核对的当前空间。" : directory.message);
                return;
            }
            if (!foreground || generation != reviewGeneration) {
                feedback.setText("已离开核对界面；请重新点击“核对当前状态”。");
                return;
            }
            status.setText("请明确选择这次要核对的一个当前空间。");
            List<RootHideManager.UserRecord> users = new ArrayList<>(directory.users);
            String[] labels = new String[users.size()];
            for (int index = 0; index < users.size(); index++) {
                RootHideManager.UserRecord user = users.get(index);
                labels[index] = user.name + "（当前空间 " + user.userId + "）";
            }
            final int[] chosen = {-1};
            AlertDialog picker = AppDialogs.builder(this).setTitle("选择这次要查询的当前空间")
                    .setSingleChoiceItems(labels, -1, (selection, index) -> {
                        chosen[0] = index;
                        ((AlertDialog) selection).getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true);
                    })
                    .setNegativeButton("取消", null)
                    .setPositiveButton("核对这个空间", (selection, which) -> {
                        if (chosen[0] >= 0 && chosen[0] < users.size() && foreground
                                && generation == reviewGeneration)
                            preview(row, users.get(chosen[0]).userId, generation);
                    }).create();
            showDialog(picker);
            if (picker.getButton(AlertDialog.BUTTON_POSITIVE) != null)
                picker.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
        });
    }

    private void preview(HideRecoveryController.Row row, int chosenUserId, int generation) {
        if (!foreground || generation != reviewGeneration) return;
        runTask("正在核对这个应用的当前状态与身份…",
                () -> controller.preview(row, chosenUserId), preview -> {
            if (!preview.success) {
                feedback.setText(preview.message);
                return;
            }
            if (!foreground || generation != reviewGeneration) {
                cancelLater(preview);
                feedback.setText("核对已取消；返回后请重新核对当前状态。");
                return;
            }
            feedback.setText(preview.message);
            feedback.setTextColor(ui.text);

        });
    }

    private RootHideManager.Target focusedTarget() {
        RootHideManager.Target target = new RootHideManager.Target(focusUser, focusSerial, focusPackage);
        return target.isValid() && target.isBound() && !RootHideManager.isProtected(target.packageName) ? target : null;
    }

    private void beginCurrentPreview(RootHideManager.Target target) {
        if (busy || !foreground || !open() || target == null) return;
        final int generation = ++reviewGeneration;
        dismissDialog();
        runTask("正在核对这个应用与空间…", () -> targetController.preview(target), preview -> {
            if (!foreground || generation != reviewGeneration) { targetController.cancel(preview); return; }
            if (!preview.success) { feedback.setText(preview.message); return; }
            AlertDialog confirmation = AppDialogs.builder(this).setTitle("显示这个应用")
                    .setMessage(preview.message + "\n若仍开启自动隐藏，后续熄屏会按所选范围再次隐藏。")
                    .setNegativeButton("取消", (ignored, which) -> targetController.cancel(preview))
                    .setPositiveButton("确认显示", (ignored, which) -> {
                        if (!foreground || generation != reviewGeneration || !open()) {
                            targetController.cancel(preview); return;
                        }
                        activeTargetPreview = null; // This explicit click owns one queued execution.
                        if (!runTask("正在显示这个应用…", () -> targetController.show(preview), result -> {
                            feedback.setText(result.message);
                            feedback.setTextColor(result.success ? ui.text : ui.danger);
                        })) targetController.cancel(preview);
                    }).create();
            showDialog(confirmation);
            if (dialog == confirmation) activeTargetPreview = preview; else targetController.cancel(preview);
        });
    }

    private void showDialog(AlertDialog next) {
        if (!open() || !foreground) return;
        dismissDialog();
        dialog = next;
        next.setOnDismissListener(ignored -> {if(dialog==next){dialog=null;cancelPreview();}});
        try { next.show(); }
        catch (RuntimeException error) {
            dialog = null;
            feedback.setText("核对窗口未能打开，请返回此页后重新核对。");
        }
    }

    private void dismissDialog() {
        AlertDialog old = dialog;
        dialog = null;
        cancelPreview();
        if (old != null) old.dismiss();
    }
    private void cancelPreview() {
        HideRecoveryController.Preview previous = activePreview; activePreview = null;
        if (previous != null) cancelLater(previous);
        HideTargetController.Preview current = activeTargetPreview; activeTargetPreview = null;
        if (current != null) targetController.cancel(current);
    }

    private void cancelResult(Object result) {
        if (result instanceof HideTargetController.Preview) targetController.cancel((HideTargetController.Preview) result);
        else if (result instanceof HideRecoveryController.Preview) cancelLater((HideRecoveryController.Preview) result);
    }

    /** Never perform pending-store cleanup on the UI thread. An unconfirmed abandoned preview cannot send. */
    private void cancelLater(HideRecoveryController.Preview preview) {
        try { worker.execute(()->controller.cancel(preview)); }
        catch(java.util.concurrent.RejectedExecutionException closed) {
            // Shutdown accepts no new action; this unconfirmed preview has no durable sending claim.
        }
    }

    private <T> boolean runTask(String message, Work<T> work, Consumer<T> completed) {
        if (busy || !open()) return false;
        setBusy(true);
        status.setText(message);
        status.setTextColor(ui.muted);
        try {
            worker.execute(() -> {
                T value = null;
                String failure = null;
                try { value = work.run(); }
                catch (Exception error) { failure = "操作未完成：" + error.getClass().getSimpleName()
                        + "。历史资料保留，请重新读取后核对。"; }
                T result = value;
                String error = failure;
                if (destroyed) {cancelResult(result);return;}
                if (!main.post(() -> {
                    if (!open()) {cancelResult(result);return;}
                    setBusy(false);
                    if (error != null) {
                        status.setText(error);
                        status.setTextColor(ui.danger);
                    } else {
                        status.setText("处理已完成，请查看结果。");
                        try { completed.accept(result); }
                        catch (RuntimeException invalid) {
                            cancelResult(result);
                            dismissDialog();
                            rows = new ArrayList<>();
                            nextCursor = "";
                            renderRows();
                            status.setText("页面未能展示完整结果，请重新读取后核对。历史资料保留。");
                            status.setTextColor(ui.danger);
                        }
                    }
                })) cancelResult(result);
            });
            return true;
        } catch (RuntimeException rejected) {
            setBusy(false);
            status.setText("页面已关闭或任务无法启动，未发出新的操作。");
            return false;
        }
    }

    private boolean open() { return !destroyed && !isFinishing() && !isDestroyed(); }

    private void setBusy(boolean value) {
        busy = value;
        updateControls();
    }

    private void updateControls() {
        if (configuredButton == null) return;
        configuredButton.setEnabled(!busy);
        historyButton.setEnabled(!busy);
        configuredButton.setTextColor(configuredOnly ? ui.accent : ui.muted);
        historyButton.setTextColor(configuredOnly ? ui.muted : ui.accent);
        if (focusStatus != null) {
            focusStatus.setVisibility(focusPackage.isEmpty() ? Button.GONE : Button.VISIBLE);
            focusStatus.setText("当前定位：" + focusPackage + " · 空间 " + focusUser + " · 序列号 " + focusSerial
                    + "\n切换分类仍保留这个应用和空间；历史仅供查询；显示需要单独确认。");
        }
        if (focusedShow != null) {
            boolean current = focusedTarget() != null;
            focusedShow.setVisibility(current ? Button.VISIBLE : Button.GONE);
            focusedShow.setEnabled(current && !busy);
        }
        allRecordsButton.setVisibility(focusPackage.isEmpty() ? Button.GONE : Button.VISIBLE);
        allRecordsButton.setEnabled(!busy);
        refreshButton.setEnabled(!busy);
        moreRows.setEnabled(!busy && visibleLimit < rows.size());
        moreRows.setVisibility(visibleLimit < rows.size() ? Button.VISIBLE : Button.GONE);
        nextPage.setEnabled(!busy && !nextCursor.isEmpty());
        nextPage.setText(!configuredOnly && !focusPackage.isEmpty() ? "继续查找这个应用的记录" : "读取下一页历史");
        nextPage.setVisibility(nextCursor.isEmpty() ? Button.GONE : Button.VISIBLE);
        for (int index = 0; index < actions.size(); index++) {
            Button button = actions.get(index);
            boolean enabled = !busy && index < rows.size() && rows.get(index).actionable;
            button.setEnabled(enabled);
            button.setAlpha(enabled ? 1f : .5f);
        }
    }



    private interface Work<T> { T run() throws Exception; }

    private static final class Loaded {
        final HideRecoveryController.Page page;
        final List<HideRecoveryController.Row> rows;
        Loaded(HideRecoveryController.Page page, List<HideRecoveryController.Row> rows) {
            this.page = page;
            this.rows = rows;
        }
    }
}
