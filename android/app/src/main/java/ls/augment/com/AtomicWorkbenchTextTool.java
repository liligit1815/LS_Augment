package ls.augment.com;

import android.app.Dialog;
import android.app.SearchManager;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.text.Editable;
import android.text.InputFilter;
import android.text.InputType;
import android.text.Selection;
import android.text.Spannable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.Consumer;

/** UiKit dialog over the live workbench; never creates an Activity for the tool itself. */
final class AtomicWorkbenchTextTool implements AutoCloseable {
    interface Actions {
        void shareText(String text);
        boolean startTextDrag(View source, String text, Runnable onEnded);
    }
    private static final int MAX_SAVED_BYTES = 600 * 1024;
    private final UiKit ui;
    private final Actions actions;
    private final LinkedHashMap<String, Saved> remembered = new LinkedHashMap<>(4, .75f, true);
    private final ArrayList<Dialog> nested = new ArrayList<>();
    private Dialog dialog, previewDialog;
    private EditText input;
    private TextView status, previewText;
    private AtomicWorkbenchWordList words;
    private AtomicWorkbenchTextSelection model;
    private AtomicWorkbenchTextSegmenter.Request request;
    private Button segment, all, none, range, split, more;
    private Saved last, pendingScroll;
    private DragVeil drag;
    private Consumer<Boolean> dragObserver;
    private boolean closed, busy, layoutBusy, dirty, restoring;
    private String layoutFailure = "";
    private long generation;
    private java.util.function.BooleanSupplier actionGuard = () -> true;

    AtomicWorkbenchTextTool(UiKit ui, Actions actions) { this.ui = ui; this.actions = actions; }
    void setActionGuard(java.util.function.BooleanSupplier guard) { actionGuard = guard == null ? () -> true : guard; }
    private boolean actionAllowed() { try { return !closed && actionGuard.getAsBoolean(); } catch (RuntimeException stale) { return false; } }
    void setDragObserver(Consumer<Boolean> observer) {
        if (dragObserver == observer) return;
        if (drag != null) notifyDrag(dragObserver, false);
        dragObserver = observer;
        if (drag != null) notifyDrag(dragObserver, true);
    }
    void show(String text) {
        if (!actionAllowed()) return;
        if (text == null || text.length() > AtomicWorkbenchTextSegmenter.MAX_UTF16_LENGTH
                || !AtomicWorkbenchTextSegmenter.validUtf16(text)) { notice("文字过长或包含无法处理的字符"); return; }
        Saved saved = dialog != null && input != null && text.contentEquals(input.getText()) ? capture(true) : remembered.get(text);
        open(saved == null ? Saved.fresh(text) : saved.withOpen(true));
    }
    Bundle saveState() {
        Saved saved = dialog != null ? capture(true) : last;
        return saved == null ? new Bundle() : saved.bundle();
    }
    void restoreState(Bundle state) {
        if (closed || state == null || !state.containsKey("text")) return;
        try {
            Saved saved = Saved.from(state); remember(saved);
            if (saved.open) open(saved); else last = saved;
        } catch (RuntimeException invalid) { notice("文字选择状态无法恢复，请重新打开"); }
    }
    private void open(Saved saved) {
        if (dialog != null) dialog.dismiss();
        ++generation;
        LinearLayout content = column(); content.setTag("atomic-workbench-text-tool");
        input = new EditText(ui.activity) {
            @Override public boolean onTextContextMenuItem(int id) { return actionAllowed() && super.onTextContextMenuItem(id); }
            @Override public boolean performAccessibilityAction(int action, Bundle arguments) {
                return actionAllowed() && super.performAccessibilityAction(action, arguments);
            }
        }; ui.styleInput(input);
        android.view.ActionMode.Callback guard = new android.view.ActionMode.Callback() {
            public boolean onCreateActionMode(android.view.ActionMode mode, android.view.Menu menu) { return actionAllowed(); }
            public boolean onPrepareActionMode(android.view.ActionMode mode, android.view.Menu menu) { return actionAllowed(); }
            public boolean onActionItemClicked(android.view.ActionMode mode, android.view.MenuItem item) { return !actionAllowed(); }
            public void onDestroyActionMode(android.view.ActionMode mode) { }
        };
        input.setCustomSelectionActionModeCallback(guard); input.setCustomInsertionActionModeCallback(guard);
        input.setTag("atomic-workbench-text-input"); input.setMinLines(2); input.setMaxLines(4);
        input.setGravity(Gravity.TOP | Gravity.START);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        input.setHint("输入或粘贴文字"); input.setText(saved.text);
        input.setFilters(new InputFilter[]{(source, start, end, destination, replaceStart, replaceEnd) -> {
            if ((long) destination.length() - (replaceEnd - replaceStart) + end - start <= AtomicWorkbenchTextSegmenter.MAX_UTF16_LENGTH) {
                String combined = destination.subSequence(0, replaceStart).toString() + source.subSequence(start, end)
                        + destination.subSequence(replaceEnd, destination.length());
                if (AtomicWorkbenchTextSegmenter.validUtf16(combined)) return null;
                notice("文字包含无法处理的字符");
            } else notice("最多支持 32768 个文字单元");
            return destination.subSequence(replaceStart, replaceEnd);
        }});
        input.setSelection(Math.min(saved.cursorStart, saved.text.length()), Math.min(saved.cursorEnd, saved.text.length()));
        content.addView(input, ui.wrap());
        LinearLayout first = row();
        segment = add(first, "分词", "segment", this::segmentOrRetry);
        add(first, "全文", "preview", this::showPreview);
        more = add(first, "更多", "more", this::showMore);
        content.addView(first, ui.margins(0, 8, 0, 0));
        status = ui.text("", 12, ui.muted, false); status.setTag("atomic-workbench-text-status");
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        content.addView(status, ui.margins(0, 8, 0, 4));
        words = new AtomicWorkbenchWordList(ui, new AtomicWorkbenchWordList.Listener() {
            @Override public void selectionChanged() { refresh(); }
            @Override public boolean dragSelected(View source) { return dragSelectedText(source, model == null ? "" : model.selectedText()); }
            @Override public void layoutState(boolean planning, String failure) {
                layoutBusy = planning; layoutFailure = failure;
                if (!planning && failure.isEmpty() && pendingScroll != null && words != null) {
                    Saved anchor = pendingScroll;
                    if (words.restoreScroll(anchor.anchor, anchor.top)) pendingScroll = null;
                }
                refresh();
            }
        });
        words.setTag("atomic-workbench-text-words");
        int height = Math.max(ui.dp(144), Math.min(ui.dp(240), ui.activity.getResources().getDisplayMetrics().heightPixels / 4));
        content.addView(words, new LinearLayout.LayoutParams(-1, height));
        LinearLayout controls = row();
        all = add(controls, "全选", "all", () -> { if (model != null) { model.selectAll(); selected(); } });
        none = add(controls, "取消", "none", () -> { if (model != null) { model.clear(); selected(); } });
        range = add(controls, "划选", "range", () -> { if (words != null) { words.setRangeMode(!words.rangeMode()); refresh(); } });
        split = add(controls, "拆词", "split", () -> {
            if (model == null) return;
            int anchor = words.scrollAnchorStart(), top = words.scrollAnchorTop();
            if (!model.splitSelectedWords()) { notice("请先选择可以拆开的词语"); return; }
            pendingScroll = capture(true).withScroll(anchor, top); words.setModel(model); selected();
        });
        content.addView(controls, ui.margins(0, 6, 0, 0));
        dirty = saved.dirty; busy = false; layoutBusy = false; layoutFailure = "";
        model = saved.model(); pendingScroll = saved;
        words.setRangeMode(saved.range); words.setModel(model);
        input.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                if (restoring || dialog == null) return;
                generation++; if (request != null) request.cancel(); request = null;
                busy = false; dirty = true; model = null; pendingScroll = null; words.setModel(null); refresh();
            }
            @Override public void afterTextChanged(Editable text) { }
        });
        Dialog opened = ui.glassDialog("文字分词", content, null, null, "关闭"); dialog = opened;
        opened.setOnDismissListener(ignored -> finishDialog(opened));
        input.clearFocus();
        refresh();
        content.post(() -> {
            if (dialog != opened || closed) return;
            ScrollView outer = outerScroll(content); if (outer != null) outer.scrollTo(0, saved.outerY);
            if (saved.preview) {
                showPreview();
                if (previewText != null) previewText.post(() -> {
                    if (previewText == null) return;
                    ScrollView previewScroll = outerScroll(previewText);
                    if (previewScroll != null) previewScroll.scrollTo(0, saved.previewY);
                    if (saved.previewStart >= 0 && saved.previewEnd >= 0 && previewText.getText() instanceof Spannable)
                        Selection.setSelection((Spannable) previewText.getText(), saved.previewStart, saved.previewEnd);
                });
            }
            if (model == null && !dirty) startSegment(false);
        });
    }
    private void segmentOrRetry() {
        if (busy || input == null) return;
        if (!layoutFailure.isEmpty() && model != null) { layoutFailure = ""; words.setModel(model); return; }
        startSegment(AtomicWorkbenchTextSegmenter.state() == AtomicWorkbenchTextSegmenter.State.FAILED);
    }
    private void startSegment(boolean retry) {
        if (dialog == null || input == null) return;
        hideKeyboard();
        String source = input.getText().toString(); final long operation = ++generation;
        if (request != null) request.cancel();
        busy = true; dirty = false; layoutFailure = ""; model = null; words.setModel(null); refresh();
        if (retry) {
            request = AtomicWorkbenchTextSegmenter.retryPreload(ui.activity, result -> {
                if (!current(operation, source)) return;
                if (!result.success) { busy = false; failure(result.failureCode); return; }
                request = AtomicWorkbenchTextSegmenter.segment(ui.activity, source, result2 -> segmented(operation, source, result2));
            });
        } else request = AtomicWorkbenchTextSegmenter.segment(ui.activity, source, result -> segmented(operation, source, result));
    }
    private boolean current(long operation, String source) {
        return !closed && dialog != null && operation == generation && input != null && source.contentEquals(input.getText());
    }
    private void segmented(long operation, String source, AtomicWorkbenchTextSegmenter.Result result) {
        if (!current(operation, source) || !source.equals(result.text)) return;
        busy = false; request = null;
        if (!result.success) { failure(result.failureCode); return; }
        try { model = new AtomicWorkbenchTextSelection(source, result.utf16Spans()); }
        catch (RuntimeException invalid) { failure(AtomicWorkbenchTextSegmenter.Failure.OFFSET_ERROR); return; }
        words.setModel(model); refresh();
    }
    private void failure(AtomicWorkbenchTextSegmenter.Failure reason) {
        dirty = true; refresh();
        switch (reason) {
            case INPUT_TOO_LONG: status.setText(status.getContext().getString(R.string.status_atomicworkbenchtexttool_5)); break;
            case INVALID_UTF16: status.setText("文字包含无法处理的字符，请检查后重试"); break;
            case BUSY: status.setText("正在处理其他文字，请稍后重试"); break;
            case ASSET_ERROR: status.setText("词库准备失败，检查存储空间后点击重试"); break;
            case NATIVE_UNAVAILABLE: status.setText("当前设备无法加载分词功能，可点击重试"); break;
            default: status.setText("分词未完成，请点击重试"); break;
        }
        segment.setText("重试");
    }
    private void selected() { if (words != null) words.refreshSelection(); refresh(); }
    private void refresh() {
        if (status == null || segment == null || words == null) return;
        boolean ready = model != null && !busy && !layoutBusy && layoutFailure.isEmpty();
        segment.setEnabled(!busy); segment.setText(busy ? "处理中" : !layoutFailure.isEmpty()
                || AtomicWorkbenchTextSegmenter.state() == AtomicWorkbenchTextSegmenter.State.FAILED ? "重试" : "分词");
        set(all, ready); set(none, ready && model.hasSelection()); set(range, ready); set(split, ready && model.hasSelection());
        set(more, !busy);
        range.setSelected(words.rangeMode()); range.setText(words.rangeMode() ? "划选中" : "划选");
        range.setStateDescription(words.rangeMode() ? "已开启" : "已关闭");
        if (busy) status.setText("正在加载词库并分词…");
        else if (layoutBusy) status.setText("正在排列词语…");
        else if (!layoutFailure.isEmpty()) status.setText(layoutFailure);
        else if (model == null) status.setText(dirty ? "文字已修改，点击分词" : "输入文字后点击分词");
        else status.setText(status.getContext().getString(R.string.status_atomicworkbenchtexttool_6 ,String.valueOf(model.selectedCount()), String.valueOf((words.rangeMode() ? "滑动选择，靠近边缘自动滚动" : "点击选择，长按拖动所选文字"))));
    }
    private static void set(Button button, boolean enabled) { if (button != null) button.setEnabled(enabled); }
    private void showMore() {
        if (dialog == null) return;
        LinearLayout content = column();
        addMenu(content, "反选", "invert", () -> { if (model != null) { model.invert(); selected(); } }, model != null);
        addMenu(content, "复制所选", "copy", () -> copy(selection()), hasSelection());
        addMenu(content, "搜索所选", "search", () -> lookup(false), hasSelection());
        addMenu(content, "词典查询", "dictionary", () -> lookup(true), hasSelection());
        addMenu(content, "分享所选", "share", this::shareSelection, hasSelection());
        own(ui.glassDialog("文字操作", content, null, null, "返回"));
    }
    private void addMenu(LinearLayout parent, String label, String tag, Runnable action, boolean enabled) {
        Button button = ui.button(label); button.setTag("atomic-workbench-text-" + tag); button.setMinHeight(ui.dp(48));
        button.setEnabled(enabled); button.setOnClickListener(view -> { closeTopMenu(); action.run(); });
        parent.addView(button, parent.getChildCount() == 0 ? ui.wrap() : ui.margins(0, 6, 0, 0));
    }
    private void showPreview() {
        if (!actionAllowed() || dialog == null || previewDialog != null) return;
        LinearLayout content = column();
        previewText = ui.guardedText(input.getText().toString(), 14, ui.text, false, this::actionAllowed);
        previewText.setTag("atomic-workbench-text-full-preview"); previewText.setTextIsSelectable(true);
        content.addView(previewText, ui.wrap());
        Button copy = ui.button("复制全文"); copy.setTag("atomic-workbench-text-copy-full");
        copy.setMinHeight(ui.dp(48)); copy.setOnClickListener(view -> copy(input.getText().toString()));
        content.addView(copy, ui.margins(0, 8, 0, 0));
        Dialog preview = ui.glassDialog("全文选择", content, null, null, "返回"); previewDialog = preview; own(preview);
        preview.setOnDismissListener(ignored -> { nested.remove(preview); if (previewDialog == preview) { previewDialog = null; previewText = null; } });
    }
    private boolean hasSelection() { return model != null && model.hasSelection() && !busy && !layoutBusy; }
    private String selection() { return hasSelection() ? model.selectedText() : ""; }
    private void shareSelection() {
        if (!actionAllowed()) return;
        String text = selection(); if (text.isEmpty()) { notice("请先选择文字"); return; }
        remember(capture(true));
        actions.shareText(text);
    }
    private void copy(String text) {
        if (!actionAllowed()) return;
        if (text.isEmpty()) { notice("没有可复制的文字"); return; }
        try {
            ClipboardManager clipboard = ui.activity.getSystemService(ClipboardManager.class);
            if (clipboard == null) throw new IllegalStateException();
            clipboard.setPrimaryClip(ClipData.newPlainText("所选文字", text)); notice("已复制");
        } catch (RuntimeException unavailable) { notice("暂时无法复制，请重试"); }
    }
    private void lookup(boolean dictionary) {
        if (!actionAllowed()) return;
        String text = selection(); if (text.isEmpty()) { notice("请先选择文字"); return; }
        remember(capture(true));
        Intent intent = dictionary ? new Intent(Intent.ACTION_VIEW, new Uri.Builder().scheme("https")
                .authority("dict.youdao.com").appendPath("m").appendPath(text).build()).addCategory(Intent.CATEGORY_BROWSABLE)
                : new Intent(Intent.ACTION_WEB_SEARCH).putExtra(SearchManager.QUERY, text);
        try { ui.activity.startActivity(intent); }
        catch (ActivityNotFoundException unavailable) { notice(dictionary ? "没有可打开词典的应用" : "没有可处理搜索的应用"); }
        catch (RuntimeException unavailable) { notice("暂时无法打开，请重试"); }
    }
    private boolean dragSelectedText(View source, String text) {
        if (!actionAllowed()) return false;
        if (dialog == null || source == null || text.isEmpty() || !source.isAttachedToWindow() || drag != null) return false;
        remember(capture(true));
        DragVeil lease = new DragVeil();
        boolean started;
        try { started = actions.startTextDrag(source, text, () -> ui.activity.runOnUiThread(() -> endDrag(lease))); }
        catch (RuntimeException unavailable) { started = false; }
        if (started && !lease.ended) {
            drag = lease; notifyDrag(dragObserver, true);
            try { lease.hide(); }
            catch (RuntimeException unavailable) { lease.restore(); if (status != null) status.setText("拖动已开始，窗口暂时无法隐藏"); }
        }
        if (!started) { endDrag(lease); if (status != null) status.setText("暂时无法拖动，请重试"); }
        return started;
    }
    private void endDrag(DragVeil lease) {
        if (lease.ended) return; lease.ended = true; lease.restore();
        if (drag == lease) { drag = null; notifyDrag(dragObserver, false); }
    }
    private static void notifyDrag(Consumer<Boolean> observer, boolean active) {
        if (observer != null) try { observer.accept(active); } catch (RuntimeException ignored) { }
    }
    private final class DragVeil {
        final ArrayList<WindowLease> leases = new ArrayList<>(); boolean ended;
        void hide() {
            if (dialog != null) veil(dialog);
            for (Dialog item : new ArrayList<>(nested)) veil(item);
        }
        private void veil(Dialog owner) {
            Window window = owner.getWindow(); if (!owner.isShowing() || window == null) return;
            WindowLease lease = new WindowLease(window); leases.add(lease); lease.hide();
        }
        void restore() { for (WindowLease lease : leases) lease.restore(); leases.clear(); }
    }
    private static final class WindowLease {
        private static final int MASK = WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE | WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE;
        final Window window; final int added; final float alpha;
        WindowLease(Window window) { this.window = window; added = MASK & ~window.getAttributes().flags; alpha = window.getAttributes().alpha; }
        void hide() { WindowManager.LayoutParams value = window.getAttributes(); value.flags |= added; value.alpha = 0f; window.setAttributes(value); }
        void restore() {
            try {
                WindowManager.LayoutParams value = window.getAttributes(); value.flags &= ~added;
                if (value.alpha == 0f) value.alpha = alpha;
                window.setAttributes(value);
            } catch (RuntimeException ignored) { }
        }
    }
    private Dialog own(Dialog nestedDialog) {
        nested.add(nestedDialog); nestedDialog.setOnDismissListener(ignored -> nested.remove(nestedDialog)); return nestedDialog;
    }
    private void closeTopMenu() { if (!nested.isEmpty()) nested.get(nested.size() - 1).dismiss(); }
    private void finishDialog(Dialog owner) {
        if (dialog != owner) return;
        remember(capture(false));
        dialog = null; generation++; if (request != null) request.cancel(); request = null;
        if (drag != null) endDrag(drag);
        for (Dialog item : new ArrayList<>(nested)) item.dismiss(); nested.clear(); previewDialog = null; previewText = null;
        if (words != null) words.close(); words = null; input = null; model = null;
    }
    private Saved capture(boolean open) {
        if (input == null) return last == null ? Saved.fresh("") : last.withOpen(open);
        String text = input.getText().toString();
        AtomicWorkbenchTextSelection.Snapshot snapshot = model != null && model.originalText().equals(text) ? model.snapshot() : null;
        ScrollView outer = outerScroll(input);
        return new Saved(text, snapshot == null ? null : snapshot.spans(), snapshot == null ? null : snapshot.selectedRanges(),
                snapshot == null ? 0 : snapshot.revision, words != null && words.rangeMode(), dirty, open,
                words == null ? 0 : words.scrollAnchorStart(), words == null ? 0 : words.scrollAnchorTop(),
                outer == null ? 0 : outer.getScrollY(), Math.max(0, input.getSelectionStart()), Math.max(0, input.getSelectionEnd()), previewDialog != null,
                previewText == null || outerScroll(previewText) == null ? 0 : outerScroll(previewText).getScrollY(),
                previewText == null ? -1 : Selection.getSelectionStart(previewText.getText()),
                previewText == null ? -1 : Selection.getSelectionEnd(previewText.getText()));
    }
    private void remember(Saved saved) {
        last = saved; remembered.put(saved.text, saved);
        while (remembered.size() > 4) remembered.remove(remembered.entrySet().iterator().next().getKey());
    }
    private void hideKeyboard() {
        if (input == null) return;
        InputMethodManager manager = ui.activity.getSystemService(InputMethodManager.class);
        if (manager != null) manager.hideSoftInputFromWindow(input.getWindowToken(), 0);
        input.clearFocus();
    }
    private LinearLayout column() { LinearLayout result = new LinearLayout(ui.activity); result.setOrientation(LinearLayout.VERTICAL); return result; }
    private LinearLayout row() { LinearLayout result = new LinearLayout(ui.activity); result.setOrientation(LinearLayout.HORIZONTAL); result.setGravity(Gravity.CENTER_VERTICAL); return result; }
    private Button add(LinearLayout row, String label, String tag, Runnable action) {
        Button button = ui.button(label); button.setMinHeight(ui.dp(48)); button.setMinimumHeight(ui.dp(48));
        button.setTag("atomic-workbench-text-" + tag); button.setOnClickListener(ignored -> action.run());
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, -2, 1); params.leftMargin = row.getChildCount() == 0 ? 0 : ui.dp(4);
        row.addView(button, params); return button;
    }
    private static ScrollView outerScroll(View view) {
        for (android.view.ViewParent parent = view.getParent(); parent != null; parent = parent.getParent())
            if (parent instanceof ScrollView) return (ScrollView) parent;
        return null;
    }
    private void notice(String message) { Toast.makeText(ui.activity, message, Toast.LENGTH_SHORT).show(); }
    @Override public void close() {
        if (closed) return;
        if (dialog != null) dialog.dismiss();
        if (drag != null) endDrag(drag);
        closed = true; generation++; if (request != null) request.cancel(); request = null;
        dragObserver = null;
    }

    static final class Saved {
        final String text;
        private final int[] spans, chosen;
        final long revision;
        final boolean range, dirty, open, preview;
        final int anchor, top, outerY, cursorStart, cursorEnd, previewY, previewStart, previewEnd;
        Saved(String text, int[] spans, int[] chosen, long revision, boolean range, boolean dirty, boolean open,
                int anchor, int top, int outerY, int cursorStart, int cursorEnd, boolean preview,
                int previewY, int previewStart, int previewEnd) {
            if (text == null || text.length() > AtomicWorkbenchTextSelection.MAX_TEXT || !AtomicWorkbenchTextSegmenter.validUtf16(text))
                throw new IllegalArgumentException("Invalid text state");
            if ((spans == null) != (chosen == null) || revision < 0 || anchor < 0 || anchor > text.length()
                    || Math.abs((long) top) > 1000000L || outerY < 0 || outerY > 1000000
                    || cursorStart < 0 || cursorEnd < 0 || cursorStart > text.length() || cursorEnd > text.length()
                    || previewY < 0 || previewY > 1000000 || previewStart < -1 || previewEnd < -1
                    || previewStart > text.length() || previewEnd > text.length()
                    || (previewStart == -1) != (previewEnd == -1)
                    || !boundary(text, anchor) || !boundary(text, cursorStart) || !boundary(text, cursorEnd)
                    || previewStart >= 0 && (!boundary(text, previewStart) || !boundary(text, previewEnd)))
                throw new IllegalArgumentException("Invalid text position");
            if (spans != null) AtomicWorkbenchTextSelection.restore(text, spans, chosen, revision);
            this.text = text; this.spans = spans == null ? null : spans.clone(); this.chosen = chosen == null ? null : chosen.clone();
            this.revision = revision; this.range = range; this.dirty = dirty; this.open = open; this.preview = preview;
            this.anchor = anchor; this.top = top; this.outerY = outerY; this.cursorStart = cursorStart; this.cursorEnd = cursorEnd;
            this.previewY = previewY; this.previewStart = previewStart; this.previewEnd = previewEnd;
        }
        static Saved fresh(String text) { return new Saved(text, null, null, 0, false, false, true, 0, 0, 0, text.length(), text.length(), false, 0, -1, -1); }
        Saved withOpen(boolean value) { return new Saved(text, spans, chosen, revision, range, dirty, value, anchor, top, outerY, cursorStart, cursorEnd, preview, previewY, previewStart, previewEnd); }
        Saved withScroll(int start, int offset) { return new Saved(text, spans, chosen, revision, range, dirty, open, start, offset, outerY, cursorStart, cursorEnd, preview, previewY, previewStart, previewEnd); }
        AtomicWorkbenchTextSelection model() { return spans == null ? null : AtomicWorkbenchTextSelection.restore(text, spans, chosen, revision); }
        private static boolean boundary(String text, int offset) {
            return offset >= 0 && offset <= text.length() && (offset == text.length() || !Character.isLowSurrogate(text.charAt(offset)));
        }
        Bundle bundle() {
            Bundle out = new Bundle(); out.putString("text", text);
            out.putIntArray("spans", spans == null ? null : spans.clone()); out.putIntArray("selected", chosen == null ? null : chosen.clone());
            out.putLong("revision", revision); out.putBoolean("range", range); out.putBoolean("dirty", dirty); out.putBoolean("open", open);
            out.putInt("anchor", anchor); out.putInt("top", top); out.putInt("outerY", outerY); out.putInt("cursorStart", cursorStart);
            out.putInt("cursorEnd", cursorEnd); out.putBoolean("preview", preview);
            out.putInt("previewY", previewY); out.putInt("previewStart", previewStart); out.putInt("previewEnd", previewEnd);
            Parcel parcel = Parcel.obtain();
            try { parcel.writeBundle(out); if (parcel.dataSize() > MAX_SAVED_BYTES) throw new IllegalStateException("Text state exceeds safe size"); }
            finally { parcel.recycle(); }
            return out;
        }
        static Saved from(Bundle value) {
            return new Saved(value.getString("text"), value.getIntArray("spans"), value.getIntArray("selected"), value.getLong("revision", 0),
                    value.getBoolean("range"), value.getBoolean("dirty"), value.getBoolean("open"), value.getInt("anchor", 0), value.getInt("top", 0),
                    value.getInt("outerY", 0), value.getInt("cursorStart", 0), value.getInt("cursorEnd", 0), value.getBoolean("preview"),
                    value.getInt("previewY", 0), value.getInt("previewStart", -1), value.getInt("previewEnd", -1));
        }
    }
}
