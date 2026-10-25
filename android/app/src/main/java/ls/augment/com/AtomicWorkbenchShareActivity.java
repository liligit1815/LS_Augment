package ls.augment.com;

import android.app.Activity;
import android.app.ActivityOptions;
import android.content.Intent;
import android.os.Bundle;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;

/** Receives actual phone grants; replacing existing content requires an explicit decision. */
public final class AtomicWorkbenchShareActivity extends Activity {
    private UiKit ui;
    private LinearLayout page;
    private TextView status;
    private Session session;
    private AtomicWorkbenchPendingImport prompt;
    private final android.window.OnBackInvokedCallback backCallback = this::handleBack;
    private boolean backCallbackRegistered;
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (!backCallbackRegistered) {
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT, backCallback);
            backCallbackRegistered = true;
        }
        if (getIntent() != null) getIntent().putExtra(ModuleNavigation.EXTRA_ROUTE, "atomic_workbench_session");
        ui = new UiKit(this);
        ui.setBackAction(this::handleBack);
        page = ui.detailPage("流转素材", null);
        status = ui.text("正在接收流转素材…", 15, ui.text, true);
        page.addView(status, ui.wrap());
        Object retained = getLastNonConfigurationInstance();
        if (retained instanceof Session) session = (Session) retained;
        else { session = new Session(getApplicationContext(), getIntent() == null ? null : new Intent(getIntent())); session.start(); }
        session.owner = new WeakReference<>(this); render();
    }
    private void render() {
        if (isDestroyed() || isFinishing() || session == null) return;
        if (session.result != null) { if (session.result.success) launch(); else failed(session.result.message); return; }
        if (session.failure != null) { failed(session.failure); return; }
        if (session.staged == null) { status.setText("正在接收流转素材…"); return; }
        if (prompt != null || session.committing) return;
        status.setText("请选择追加或替换现有素材；返回会取消本次添加。");
        Session selected = session;
        prompt = new AtomicWorkbenchPendingImport(this, ui, selected.repository, selected.before, selected.staged, (result, failure) -> {
            prompt = null; selected.result = result;
            selected.failure = failure == null && result == null ? "已取消添加，原流转素材保持原样" : failure;
            selected.staged = null; selected.update();
        });
        prompt.setCommitObserver(value -> selected.committing = value); prompt.show();
    }
    private void failed(String message) {
        status.setText(message); if (page.findViewWithTag("share-return") != null) return;
        android.widget.Button back = ui.button("返回"); back.setTag("share-return"); back.setOnClickListener(v -> finish());
        page.addView(back, ui.margins(0, 12, 0, 0));
    }
    private void launch() {
        Intent workbench = new Intent(this, AtomicWorkbenchActivity.class)
                .putExtra(AtomicWorkbenchTransfer.EXTRA_DELIVERY, true).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        ActivityOptions options = ActivityOptions.makeBasic(); options.setLaunchDisplayId(0);
        try { startActivity(workbench, options.toBundle()); finish(); }
        catch (RuntimeException unavailable) { failed("素材已保存，请重新进入原子工作台继续流转"); }
    }
    @Override public Object onRetainNonConfigurationInstance() { return session; }
    private void handleBack() {
        if (isFinishing() || isDestroyed()) return;
        if (session != null && session.committing) { status.setText("正在确认保存结果，请稍候"); return; }
        if (prompt != null) { prompt.close(); prompt = null; }
        if (session != null) session.cancel(); super.onBackPressed();
    }
    @Override protected void onDestroy() {
        if (backCallbackRegistered) {
            getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(backCallback);
            backCallbackRegistered = false;
        }
        if (prompt != null) { if (isChangingConfigurations()) prompt.detachForRecreation(); else prompt.close(); prompt = null; }
        if (session != null) {
            if (session.owner.get() == this) session.owner.clear();
            if (!isChangingConfigurations() && isFinishing()) session.cancel();
        }
        super.onDestroy();
    }
    private static final class Session {
        final android.content.Context application;
        final AtomicWorkbenchPendingRepository repository;
        final Intent source;
        volatile WeakReference<AtomicWorkbenchShareActivity> owner = new WeakReference<>(null);
        volatile AtomicWorkbenchPendingPayload before;
        volatile AtomicWorkbenchTransferStore.Payload staged;
        volatile AtomicWorkbenchPendingRepository.Result result;
        volatile String failure;
        volatile AtomicWorkbenchTransferStage.Job job;
        volatile boolean cancelled, committing;
        Session(android.content.Context application, Intent source) { this.application = application; this.source = source; repository = AtomicWorkbenchPendingStorage.repository(application); }
        void start() {
            AtomicWorkbenchTransfer.IO.execute(() -> {
                before = repository.load(); if (cancelled) return;
                if (source == null) { failure = "没有收到可流转的素材"; update(); return; }
                job = AtomicWorkbenchTransferStage.start(application, source, false, (payload, error) -> {
                    if (cancelled) { AtomicWorkbenchTransfer.IO.execute(() -> AtomicWorkbenchTransferStore.discardUnpublished(application, payload)); return; }
                    staged = payload; failure = error; update();
                });
            });
        }
        void update() { new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> { AtomicWorkbenchShareActivity host = owner.get(); if (host != null) host.render(); }); }
        void cancel() {
            if (committing) return;
            cancelled = true; if (job != null) job.cancel(); AtomicWorkbenchTransferStore.Payload old = staged; staged = null;
            AtomicWorkbenchTransfer.IO.execute(() -> AtomicWorkbenchTransferStore.discardUnpublished(application, old));
        }
    }
}
