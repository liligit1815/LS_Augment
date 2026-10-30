package ls.augment.com;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/** UiKit menu for a system-verified capture, independent of the workspace Activity or a Root VD. */
public final class AtomicWorkbenchExtractionActivity extends Activity {
    private static final String PROCESS = java.util.UUID.randomUUID().toString();
    private UiKit ui;
    private AtomicWorkbenchTextTool textTool;
    private AtomicWorkbenchTransfer transfer;
    private AtomicWorkbenchExtractionHandoff.Value value;
    private boolean started;
    private boolean textDragWindowHidden;
    private int textDragAddedFlags;
    private float textDragWindowAlpha;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        Object retained = getLastNonConfigurationInstance();
        if (retained instanceof AtomicWorkbenchExtractionHandoff.Value)
            value = (AtomicWorkbenchExtractionHandoff.Value) retained;
        else if (state != null) value = restoreOwned(state);
        else value = AtomicWorkbenchExtractionPresentation.consume(this,
                getIntent().getStringExtra(AtomicWorkbenchExtractionPresentation.EXTRA_NONCE));
        getIntent().removeExtra(AtomicWorkbenchExtractionPresentation.EXTRA_NONCE);
        if (value == null || ResetWriteFence.stale(value.reset)
                || !AtomicWorkbenchExtractionPresentation.available(this)) { finish(); return; }
        ui = new UiKit(this);
        ui.setBackAction(this::finish);
        LiquidGlassLayout panel = new LiquidGlassLayout(ui, 4);
        panel.setTag("atomic-workbench-extracted-text"); panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(ui.dp(20), ui.dp(16), ui.dp(20), ui.dp(16));
        TextView title = ui.text("提取文字", 16, ui.text, true);
        panel.addView(title, ui.wrap());
        ScrollView scroll = new ScrollView(this);
        TextView text = ui.guardedText(value.text, 14, ui.text, false, this::acceptedValueCurrent);
        text.setTag("atomic-workbench-extracted-preview"); text.setTextIsSelectable(true);
        text.setCustomSelectionActionModeCallback(selectionGuard());
        text.setPadding(0, ui.dp(8), 0, ui.dp(8)); scroll.addView(text);
        int max = Math.min(ui.dp(240), getResources().getDisplayMetrics().heightPixels / 3);
        panel.addView(scroll, new LinearLayout.LayoutParams(-1, max));
        LinearLayout buttons = new LinearLayout(this);
        buttons.setOrientation(LinearLayout.VERTICAL);
        Button copy = ui.tonalButton("复制全文"); copy.setMinimumHeight(ui.dp(48));
        copy.setTag("atomic-workbench-extracted-copy"); copy.setOnClickListener(v -> copy()); buttons.addView(copy, ui.wrap());
        Button words = ui.button("分词与更多操作"); words.setMinimumHeight(ui.dp(48));
        words.setTag("atomic-workbench-extracted-words"); words.setOnClickListener(v -> { if (acceptedValueCurrent()) textTool.show(value.text); });
        buttons.addView(words, ui.margins(0, 8, 0, 0));
        Button close = ui.button("关闭"); close.setMinimumHeight(ui.dp(48)); close.setOnClickListener(v -> finish());
        buttons.addView(close, ui.margins(0, 8, 0, 0)); panel.addView(buttons, ui.wrap());
        transfer = new AtomicWorkbenchTransfer(this, ui, new AtomicWorkbenchTransfer.Callback() {
            @Override public void onChanged() { }
            @Override public void onSend(Intent share, String packageName) {
                if (!acceptedValueCurrent()) return;
                try { startActivity(share); }
                catch (RuntimeException unavailable) { notice("目标应用无法打开，请重新选择。"); }
            }
        });
        transfer.setForeground(false);
        textTool = new AtomicWorkbenchTextTool(ui, new AtomicWorkbenchTextTool.Actions() {
            @Override public void shareText(String text) { if (acceptedValueCurrent()) transfer.shareText(text); }
            @Override public boolean startTextDrag(View source, String text, Runnable ended) { return acceptedValueCurrent() && transfer.startTextDrag(source, text, ended); }
        });
        textTool.setActionGuard(this::acceptedValueCurrent);
        textTool.setDragObserver(this::setTextDragWindowHidden);
        transfer.setTextTool(textTool::show);
        setContentView(panel);
        getWindow().setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(android.graphics.Color.TRANSPARENT));
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        getWindow().setDimAmount(ui.dark ? .28f : .12f);
        getWindow().setLayout(Math.min(ui.dp(420), getResources().getDisplayMetrics().widthPixels - ui.dp(36)), -2);
        panel.refreshBackdrop();
        if (state != null) textTool.restoreState(state.getBundle("text_tool"));
    }

    private void copy() {
        if (!acceptedValueCurrent()) return;
        try {
            ClipboardManager clipboard = getSystemService(ClipboardManager.class);
            if (clipboard == null) throw new IllegalStateException();
            clipboard.setPrimaryClip(ClipData.newPlainText("提取文字", value.text)); notice("已复制全文");
        } catch (RuntimeException unavailable) { notice("复制未完成，文字仍已保留。"); }
    }
    private boolean acceptedValueCurrent() {
        try {
            ConfigSnapshot current = new AppConfig(this).configSnapshot();
            if (value != null && !ResetWriteFence.stale(value.reset)
                    && AtomicWorkbenchExtractionPresentation.available(this)
                    && AtomicWorkbenchExtractionPresentation.enabled(current) && value.checksum.equals(current.checksum)
                    && !ResetWriteFence.stale(value.reset)) return true;
        } catch (RuntimeException unavailable) { /* A failed check cannot release an old capture. */ }
        if (textTool != null) textTool.close();
        finish(); return false;
    }
    private android.view.ActionMode.Callback selectionGuard() {
        return new android.view.ActionMode.Callback() {
            public boolean onCreateActionMode(android.view.ActionMode mode, android.view.Menu menu) { return acceptedValueCurrent(); }
            public boolean onPrepareActionMode(android.view.ActionMode mode, android.view.Menu menu) { return acceptedValueCurrent(); }
            public boolean onActionItemClicked(android.view.ActionMode mode, android.view.MenuItem item) { return !acceptedValueCurrent(); }
            public void onDestroyActionMode(android.view.ActionMode mode) { }
        };
    }
    private void notice(String text) { Toast.makeText(this, text, Toast.LENGTH_LONG).show(); }

    /** Keep both source ViewRoots alive, while allowing a real drop on the underlying workspace. */
    private void setTextDragWindowHidden(boolean hidden) {
        if (hidden == textDragWindowHidden) return;
        try {
            WindowManager.LayoutParams attributes = getWindow().getAttributes();
            if (hidden) {
                int mask = WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE | WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE;
                textDragAddedFlags = mask & ~attributes.flags;
                textDragWindowAlpha = attributes.alpha;
                textDragWindowHidden = true;
                attributes.flags |= textDragAddedFlags; attributes.alpha = 0f;
                getWindow().setAttributes(attributes);
            } else {
                textDragWindowHidden = false;
                attributes.flags &= ~textDragAddedFlags;
                if (attributes.alpha == 0f) attributes.alpha = textDragWindowAlpha;
                getWindow().setAttributes(attributes);
            }
        } catch (RuntimeException unavailable) {
            if (hidden) {
                setTextDragWindowHidden(false);
                notice("拖动已开始，提取窗口暂时无法隐藏，请取消后重试。");
            }
        }
    }

    private AtomicWorkbenchExtractionHandoff.Value restoreOwned(Bundle state) {
        try {
            ConfigSnapshot current = new AppConfig(this).configSnapshot();
            if (current == null || !current.checksum.equals(state.getString("accepted_checksum"))
                    || PROCESS.equals(state.getString("accepted_process"))
                        && ResetWriteFence.stale(state.getLong("accepted_reset", -1L))) return null;
            return new AtomicWorkbenchExtractionHandoff.Value(state.getString("accepted_id"), state.getString("accepted_text"),
                    state.getString("accepted_source"), current.checksum, ResetWriteFence.generation());
        } catch (RuntimeException invalid) { return null; }
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        if (value != null && !ResetWriteFence.stale(value.reset)) {
            state.putString("accepted_id", value.requestId); state.putString("accepted_text", value.text);
            state.putString("accepted_source", value.sourcePackage); state.putString("accepted_checksum", value.checksum);
            state.putLong("accepted_reset", value.reset); state.putString("accepted_process", PROCESS);
            if (textTool != null) state.putBundle("text_tool", textTool.saveState());
        }
        super.onSaveInstanceState(state);
    }
    @Override public Object onRetainNonConfigurationInstance() { return value; }
    @Override protected void onStart() { super.onStart(); started = true; }
    /** Only this still-visible private capture may lend its live text drag to the workbench. */
    boolean currentTextDragSource() {
        return started && !isFinishing() && !isDestroyed() && acceptedValueCurrent();
    }
    boolean currentTextDeliverySource() {
        return !textDragWindowHidden && currentTextDragSource();
    }
    void showTextPasteSetup() {
        if (currentTextDragSource() && !AtomicWorkbenchPasteService.available())
            AtomicWorkbenchActivity.showPasteSetup(ui, this::notice);
    }
    @Override protected void onResume() {
        super.onResume();
        if (value != null) acceptedValueCurrent();
    }
    @Override protected void onStop() {
        started = false; setTextDragWindowHidden(false);
        if (transfer != null) transfer.setForeground(false); super.onStop();
    }
    @Override protected void onActivityResult(int code, int result, Intent data) {
        if (transfer == null || !transfer.onActivityResult(code, result, data)) super.onActivityResult(code, result, data);
    }
    @Override public void onRequestPermissionsResult(int code, String[] permissions, int[] grants) {
        if (transfer == null || !transfer.onRequestPermissionsResult(code)) super.onRequestPermissionsResult(code, permissions, grants);
    }
    @Override protected void onDestroy() {
        setTextDragWindowHidden(false);
        if (textTool != null) textTool.close();
        if (transfer != null) transfer.close();
        if (ui != null) ui.closeHostDialogs();
        super.onDestroy();
    }
}
