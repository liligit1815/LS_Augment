package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Settings backed by the actual accessibility/system registration, with bounded enable checks. */

// Code-only view requires UiKit/state/callbacks; it is never inflated from XML. A partial XML constructor is invalid.
//noinspection ViewConstructor
final class AtomicWorkbenchExtractionControls extends LinearLayout implements AutoCloseable {
    private static final ThreadPoolExecutor CHECK = new ThreadPoolExecutor(1, 1, 0, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(1), action -> { Thread t = new Thread(action, "Duo-ExtractionReady"); t.setDaemon(true); return t; });
    private final Activity activity;
    private final UiKit ui;
    private final Executor worker;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Switch enabled, landscape;
    private final TextView status;
    private final Button blacklist, access;
    private final UiKit.Fold fold;
    private AppConfig config;
    private long reset;
    private volatile long sequence;
    private volatile boolean closed;
    private boolean rendering, busy, hostAvailable;
    private String message = "";

    AtomicWorkbenchExtractionControls(Activity activity, UiKit ui, AppConfig config, long reset, Executor worker) {
        super(activity); this.activity = activity; this.ui = ui; this.config = config; this.reset = reset; this.worker = worker;
        setOrientation(VERTICAL); setTag("atomic-workbench-extraction-controls");
        enabled = new Switch(activity); enabled.setTag("config:" + AtomicWorkbenchExtractionPolicy.ENABLED);
        addView(ui.featureRow("长按提取文字", "长按应用中的文字，打开复制、分词和分享菜单。需要无障碍服务及手机系统接入；密码、受保护内容、桌面和输入法不提取。", enabled), ui.wrap());
        status = ui.text("", 12, ui.muted, false); status.setAccessibilityLiveRegion(ACCESSIBILITY_LIVE_REGION_POLITE);
        addView(status, ui.margins(0, 4, 0, 8));
        access = ui.tonalButton("管理无障碍服务"); access.setMinimumHeight(ui.dp(48));
        access.setOnClickListener(view -> {
            try { activity.startActivity(new Intent(android.provider.Settings.ACTION_ACCESSIBILITY_SETTINGS)); }
            catch (RuntimeException unavailable) { notice("请从手机设置打开无障碍服务。"); }
        }); addView(access, ui.margins(0, 0, 0, 8));
        LinearLayout parameters = new LinearLayout(activity); parameters.setOrientation(VERTICAL);
        addView(parameters, ui.wrap());
        landscape = new Switch(activity); landscape.setTag("config:" + AtomicWorkbenchExtractionPolicy.LANDSCAPE);
        parameters.addView(ui.featureRow("横屏时可用", "在横屏应用中也响应长按提取。", landscape), ui.wrap());
        blacklist = ui.button("排除应用"); blacklist.setMinimumHeight(ui.dp(48));
        blacklist.setOnClickListener(view -> {
            if (busy || closed || !hostAvailable || ResetWriteFence.stale(this.reset)) return;
            long generation = this.reset;
            AppSelectionDialog.show(activity, ui, "不提取这些应用", this.config.get(AtomicWorkbenchExtractionPolicy.BLACKLIST), value -> {
                if (!closed && generation == this.reset) save(Collections.singletonMap(AtomicWorkbenchExtractionPolicy.BLACKLIST, value), false);
            });
        }); parameters.addView(blacklist, ui.margins(0, 8, 0, 0));
        fold = ui.fold(enabled, parameters);
        enabled.setOnCheckedChangeListener((button, checked) -> {
            if (rendering) return;
            refresh(hostAvailable);
            save(checked ? Map.of(AtomicWorkbenchExtractionPolicy.ENABLED, "1", AtomicWorkbenchExtractionPolicy.TEXT_ENABLED, "1")
                    : Map.of(AtomicWorkbenchExtractionPolicy.ENABLED, "0"), checked);
        });
        landscape.setOnCheckedChangeListener((button, checked) -> {
            if (!rendering) { refresh(hostAvailable); save(Map.of(AtomicWorkbenchExtractionPolicy.LANDSCAPE, checked ? "1" : "0"), false); }
        });
        refresh(false);
    }

    void rebind(AppConfig next, long generation) { sequence++; busy = false; config = next; reset = generation; message = ""; refresh(hostAvailable); }
    void refresh(boolean available) {
        hostAvailable = available;
        if (closed) return;
        rendering = true;
        boolean on = config.getBoolean(AtomicWorkbenchExtractionPolicy.ENABLED);
        enabled.setChecked(on); landscape.setChecked(config.getBoolean(AtomicWorkbenchExtractionPolicy.LANDSCAPE));
        boolean editable = available && !busy && !ResetWriteFence.stale(reset);
        enabled.setEnabled(editable); landscape.setEnabled(editable && on); blacklist.setEnabled(editable && on);
        access.setEnabled(!busy);
        blacklist.setText(blacklist.getContext().getString(R.string.status_atomicworkbenchextractioncontrols_3 ,String.valueOf(AppPackageSet.parse(config.get(AtomicWorkbenchExtractionPolicy.BLACKLIST)).size())));
        status.setText(!message.isEmpty() ? message : !on ? "已关闭；已选参数和排除应用会保留。"
                : AtomicWorkbenchExtractionSystemBridge.isRegistered() ? "已开启；执行时会再次核对来源与保护状态。" : "已保存开启；提取接入尚未确认，请检查无障碍服务和系统框架作用域。");
        rendering = false; fold.sync();
    }
    private void save(Map<String, String> updates, boolean enabling) {
        if (closed || busy || !hostAvailable || ResetWriteFence.stale(reset)) { refresh(hostAvailable); return; }
        busy = true; long ticket = ++sequence, generation = reset;
        AppConfig target = config; long issued = SystemClock.elapsedRealtime();
        message = enabling ? "正在核对手机提取接入…" : "正在保存…"; refresh(hostAvailable);
        worker.execute(() -> {
            String outcome;
            try {
                if (closed || ticket != sequence || ResetWriteFence.stale(generation)) throw new IllegalStateException("配置已变化，请重新打开本页。");
                if (enabling) {
                    if (!target.getBoolean(AtomicWorkbenchConfig.ENABLED)) throw new IllegalStateException("请先启用红魔Step。");
                    if (!AtomicWorkbenchPasteService.available()) throw new IllegalStateException("请先在手机无障碍设置启用红魔Duo的文字服务。");
                    FutureTask<Boolean> query = new FutureTask<>(AtomicWorkbenchExtractionSystemBridge::checkReady);
                    try { CHECK.execute(query); if (!query.get(4, TimeUnit.SECONDS)) throw new IllegalStateException("手机提取接入尚未就绪，请核对无障碍服务及LSPosed系统框架作用域，重启手机后重试。"); }
                    finally { query.cancel(false); }
                    if (!target.getBoolean(AtomicWorkbenchConfig.ENABLED) || SystemClock.elapsedRealtime() - issued > 5000)
                        throw new IllegalStateException("检查已过期，请重新操作。");
                }
                if (closed || ticket != sequence || ResetWriteFence.stale(generation)) throw new IllegalStateException("配置已变化，本次未保存。");
                AppConfig.SaveResult result = target.save(updates);
                outcome = result.success ? enabling ? result.runtimeSynced ? "已开启长按提取文字。" : "已保存开启，正在同步手机系统接入。" : "已保存。" : result.message;
            } catch (java.util.concurrent.TimeoutException timeout) { outcome = "提取接入检查超时，请稍后重试。"; }
            catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); outcome = "检查已中断，本次未开启。"; }
            catch (Exception unavailable) {
                outcome = unavailable instanceof IllegalStateException ? unavailable.getMessage() : "手机提取接入尚未确认，请检查无障碍服务并重启手机后重试。";
            }
            String result = outcome;
            main.post(() -> {
                if (closed || ticket != sequence || activity.isDestroyed()) return;
                busy = false; message = result; refresh(hostAvailable); notice(result);
            });
        });
    }
    private void notice(String message) { if (!closed && message != null) Toast.makeText(activity, message, Toast.LENGTH_LONG).show(); }
    @Override public void close() { closed = true; ++sequence; }
}
