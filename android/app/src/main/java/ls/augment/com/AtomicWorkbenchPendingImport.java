package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.os.Handler;
import android.os.Looper;
import android.widget.Button;
import android.widget.LinearLayout;
import java.io.IOException;

/** An explicit import decision, bound to the revision seen before the source read began. */
final class AtomicWorkbenchPendingImport implements AutoCloseable {
    interface Callback { void complete(AtomicWorkbenchPendingRepository.Result result, String failure); }
    private final Activity activity;
    private final UiKit ui;
    private final AtomicWorkbenchPendingRepository repository;
    private final AtomicWorkbenchPendingPayload before;
    private final AtomicWorkbenchTransferStore.Payload staged;
    private final Callback callback;
    private final Handler main = new Handler(Looper.getMainLooper());
    private AtomicWorkbenchPendingPayload batch;
    private Dialog dialog;
    private volatile boolean closed;
    private boolean completed;
    private boolean detached;
    private java.util.function.Consumer<Boolean> commitObserver;

    AtomicWorkbenchPendingImport(Activity activity, UiKit ui, AtomicWorkbenchPendingRepository repository,
            AtomicWorkbenchPendingPayload before, AtomicWorkbenchTransferStore.Payload staged, Callback callback) {
        this.activity = activity; this.ui = ui; this.repository = repository; this.before = before;
        this.staged = staged; this.callback = callback;
    }
    void show() {
        AtomicWorkbenchTransfer.IO.execute(() -> {
            AtomicWorkbenchPendingPayload next = null; String failure = null;
            try { next = AtomicWorkbenchTransferStore.batch(activity.getApplicationContext(), staged); }
            catch (IOException | RuntimeException invalid) { failure = "素材缓存无法读取，请重新添加"; }
            AtomicWorkbenchPendingPayload value = next; String message = failure;
            main.post(() -> {
                if (closed || activity.isDestroyed() || activity.isFinishing()) { close(); return; }
                if (message != null) { finish(null, message); return; }
                batch = value;
                if (before.empty()) commit(AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.REQUIRE_CHOICE);
                else chooseMode();
            });
        });
    }
    void setCommitObserver(java.util.function.Consumer<Boolean> observer) { commitObserver = observer; }
    void detachForRecreation() {
        detached = true;
        Dialog old = dialog; dialog = null; if (old != null) old.dismiss();
        // The session owns uncommitted bytes across a configuration change. A queued commit
        // still reports its durable result to that session rather than starting a second import.
        closed = true;
    }
    private void chooseMode() {
        choices("添加到流转素材", new String[]{"追加素材", "替换全部素材"}, new String[]{
                "保留现有文件与顺序，新文件加在末尾；文字冲突时继续选择", "仅替换待流转队列，已分享的缓存按原有效期保留"}, index -> {
            if (index == 1) commit(AtomicWorkbenchPendingRepository.Mode.REPLACE, AtomicWorkbenchPendingRepository.TextChoice.REPLACE);
            else if ((!before.text.isEmpty() || before.textExpired) && !batch.text.isEmpty()) chooseText();
            else commit(AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.REQUIRE_CHOICE);
        });
    }
    private void chooseText() {
        choices("已有流转文字", new String[]{"保留原文字", "使用新文字", "换行合并文字"}, new String[]{
                "只追加新文件，文字有效期保持原样", "文件继续追加，文字使用本次内容", "原文字在前、新文字在后；保留较早的有效期，最多 32768 字"}, index ->
                commit(AtomicWorkbenchPendingRepository.Mode.APPEND, index == 0 ? AtomicWorkbenchPendingRepository.TextChoice.KEEP
                        : index == 1 ? AtomicWorkbenchPendingRepository.TextChoice.REPLACE : AtomicWorkbenchPendingRepository.TextChoice.MERGE));
    }
    private void choices(String title, String[] names, String[] details, java.util.function.IntConsumer selected) {
        LinearLayout body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        for (int index = 0; index < names.length; index++) {
            final int choice = index;
            Button button = ui.button(names[index]); button.setMinimumHeight(ui.dp(48));
            button.setOnClickListener(view -> {
                if (closed || dialog == null) return;
                Dialog old = dialog; dialog = null; old.dismiss(); selected.accept(choice);
            });
            body.addView(button, ui.margins(0, index == 0 ? 0 : 8, 0, 0));
            body.addView(ui.text(details[index], 12, ui.muted, false), ui.wrap());
        }
        Dialog opening = ui.glassDialog(title, body, null, null, "取消"); dialog = opening;
        opening.setOnDismissListener(ignored -> { if (dialog == opening) { dialog = null; finish(null, null); } });
    }
    private void commit(AtomicWorkbenchPendingRepository.Mode mode, AtomicWorkbenchPendingRepository.TextChoice text) {
        if (commitObserver != null) commitObserver.accept(true);
        AtomicWorkbenchTransfer.IO.execute(() -> {
            if (closed && !detached) return;
            AtomicWorkbenchPendingRepository.Result result;
            if (ResetWriteFence.stale(staged.generation)) result = new AtomicWorkbenchPendingRepository.Result(false, "reset_stale",
                    "模块已重置，请重新添加素材", repository.load(), null);
            else result = AtomicWorkbenchPendingStorage.withWriteGeneration(staged.generation,
                    () -> repository.put(before.id, before.revision, batch, mode, text));
            // Ownership is released before an Activity/dialog callback can cancel this controller.
            // A failed/unknown save must retain bytes: the manifest may have reached durable storage.
            if (result.success || "save_unknown".equals(result.reason)) AtomicWorkbenchTransferStore.published(staged);
            if (detached) AtomicWorkbenchTransferStore.discardUnpublished(activity.getApplicationContext(), staged);
            main.post(() -> {
                if (commitObserver != null) commitObserver.accept(false);
                if (!closed) finish(result, null);
                else if (detached) callback.complete(result, null);
            });
        });
    }
    private void finish(AtomicWorkbenchPendingRepository.Result result, String failure) {
        if (completed) return; completed = true;
        close(); callback.complete(result, failure);
    }
    @Override public void close() {
        if (closed) return; closed = true;
        Dialog old = dialog; dialog = null; if (old != null) old.dismiss();
        AtomicWorkbenchTransfer.IO.execute(() -> AtomicWorkbenchTransferStore.discardUnpublished(activity.getApplicationContext(), staged));
    }
}
