package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.DragEvent;
import android.view.Gravity;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.List;
import java.util.function.Supplier;

/** UiKit management for the actual pending list. Internal order drags never carry content. */
final class AtomicWorkbenchPendingControls implements AutoCloseable {
    static final String SORT_MIME = "application/vnd.lsaugment.pending-order";
    interface Callback {
        void add(); void share();
        void open(AtomicWorkbenchPendingPayload snapshot, String itemId);
        boolean drag(View source, AtomicWorkbenchPendingPayload snapshot, String itemId, boolean textOnly, Runnable onEnded);
    }
    private final Activity activity;
    private final UiKit ui;
    private final AtomicWorkbenchPendingRepository repository;
    private final Callback callback;
    private java.util.function.Consumer<String> textTool;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final AtomicWorkbenchThumbnailLoader thumbnails;
    private final Runnable frame = this::scrollFrame;
    private final Runnable loadThumbnails;
    private Dialog dialog, confirmation;
    private LinearLayout body;
    private AtomicWorkbenchPendingPayload current;
    private AtomicWorkbenchPendingRepository.Undo undo;
    private AtomicWorkbenchContentPreview preview;
    private AutoCloseable subscription;
    private View highlighted;
    private ScrollView scrolling;
    private float speed, remainder;
    private long previous, generation;
    private boolean posted, closed;
    private Runnable restoreDragWindow;
    private android.view.ViewTreeObserver observer;
    private android.view.ViewTreeObserver.OnScrollChangedListener scrolled;

    AtomicWorkbenchPendingControls(Activity activity, UiKit ui, AtomicWorkbenchPendingRepository repository, Callback callback) {
        this.activity = activity; this.ui = ui; this.repository = repository; this.callback = callback;
        thumbnails = new AtomicWorkbenchThumbnailLoader(activity); loadThumbnails = thumbnails::schedule;
    }
    void setTextTool(java.util.function.Consumer<String> value) { textTool = value; }
    void show(AtomicWorkbenchPendingPayload initial) {
        if (closed) return;
        current = initial; body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        Dialog opening = ui.glassDialog("流转素材", body, "选择分享入口", callback::share, "关闭"); dialog = opening;
        opening.setOnDismissListener(ignored -> { if (dialog == opening) close(); });
        subscription = repository.subscribe(snapshot -> main.post(() -> {
            if (closed || dialog != opening || !opening.isShowing()) return;
            if (!snapshot.signature().equals(current.signature())) stopDrag();
            if (current.id.equals(snapshot.id) && snapshot.revision < current.revision) return;
            if (!snapshot.signature().equals(current.signature())) { ++generation; if (preview != null) { preview.close(); preview = null; } }
            current = snapshot; if (undo != null && undo.after != snapshot.revision) undo = null; render();
        }));
        render();
    }
    private void render() {
        if (body == null || current == null) return;
        int scrollY = scrollParent() == null ? 0 : scrollParent().getScrollY();
        thumbnails.reset(); body.removeAllViews();
        TextView state = ui.text(current.empty() ? "尚未添加流转素材" : current.summary() + " · 文件 " + current.files.size() + "/16", 13, ui.text, true);
        state.setTag("pending-summary"); body.addView(state, ui.wrap());
        if (current.state != AtomicWorkbenchPendingPayload.State.READY && current.state != AtomicWorkbenchPendingPayload.State.EMPTY) {
            TextView status = ui.text(current.state == AtomicWorkbenchPendingPayload.State.PARTIAL
                    ? "有内容已失效，请移除失效项，或明确选择一个有效文件打开、拖出。"
                    : "素材记录尚未确认，请重新打开后重试；原内容未被清空。", 12, ui.muted, false);
            body.addView(status, ui.margins(0, 8, 0, 0));
        }
        Button add = action("添加素材", callback::add); body.addView(add, ui.margins(0, 8, 0, 0));
        if (!current.text.isEmpty() || current.textExpired) addText();
        for (int index = 0; index < current.files.size(); index++) addFile(current.files.get(index), index);
        if (!current.empty()) {
            Button clear = action("清空流转素材", this::confirmClear); clear.setTag("pending-clear");
            body.addView(clear, ui.margins(0, 8, 0, 0));
        }
        if (undo != null && System.currentTimeMillis() <= undo.until && current.revision == undo.after) {
            AtomicWorkbenchPendingRepository.Undo token = undo;
            Button restore = action("撤销移除", () -> mutate(() -> repository.undo(token)));
            body.addView(restore, ui.margins(0, 8, 0, 0));
        }
        ScrollView scroll = scrollParent();
        if (scroll != null) {
            if (observer == null) {
                observer = scroll.getViewTreeObserver(); scrolled = thumbnails::schedule; observer.addOnScrollChangedListener(scrolled);
            }
            scroll.post(() -> { if (!closed && dialog != null) { scroll.scrollTo(0, scrollY); thumbnails.schedule(); } });
        }
        main.removeCallbacks(loadThumbnails); main.post(loadThumbnails);
    }
    private void addText() {
        AtomicWorkbenchPendingPayload captured = current;
        LinearLayout card = ui.card(); card.setOrientation(LinearLayout.VERTICAL);
        TextView text = ui.text(captured.textExpired ? "文字已过期，请重新添加" : captured.text, 13, ui.text, false);
        text.setMaxLines(5); text.setEllipsize(android.text.TextUtils.TruncateAt.END); text.setTextIsSelectable(true); card.addView(text, ui.wrap());
        if (!captured.textExpired) {
            Button full = action("查看完整文字", () -> previewText(captured)); card.addView(full, ui.wrap());
            full.setOnLongClickListener(view -> startGlobalDrag(view, captured, null, true));
        }
        Button remove = action("移除文字", () -> mutate(() -> repository.removeText(captured.id, captured.revision)));
        remove.setTag("pending-remove-text"); card.addView(remove, ui.wrap()); body.addView(card, ui.margins(0, 8, 0, 0));
    }
    private void previewText(AtomicWorkbenchPendingPayload captured) {
        if (preview != null) preview.close();
        AtomicWorkbenchContentItem item = AtomicWorkbenchContentItem.clipboard(captured.text, captured.textCreated);
        java.util.function.Consumer<String> segment = textTool;
        preview = new AtomicWorkbenchContentPreview(activity, ui, item, "复制文字", () -> {
            try {
                ClipboardManager clipboard = activity.getSystemService(ClipboardManager.class);
                if (clipboard == null) throw new IllegalStateException();
                clipboard.setPrimaryClip(ClipData.newPlainText("流转文字", captured.text)); feedback("已复制文字");
            } catch (RuntimeException failed) { feedback("文字暂时无法复制，请回到工作台重试"); }
        }, null, segment == null ? null : () -> segment.accept(captured.text)); preview.show();
    }
    private void addFile(AtomicWorkbenchPendingPayload.FileItem item, int position) {
        AtomicWorkbenchPendingPayload captured = current;
        LinearLayout card = ui.card(); card.setOrientation(LinearLayout.VERTICAL); card.setTag("pending-file:" + item.id);
        LinearLayout row = ui.groupRow(); row.setGravity(Gravity.CENTER_VERTICAL);
        if (item.image() || item.video()) {
            ImageView image = new ImageView(activity); image.setScaleType(ImageView.ScaleType.CENTER_CROP);
            image.setImageDrawable(new GlassIcon(item.video() ? "play" : "card-corners", ui.muted));
            image.setContentDescription(item.video() ? "视频预览" : "图片预览");
            row.addView(image, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
            if (item.availability == AtomicWorkbenchPendingPayload.Availability.READY) thumbnails.bind(image, content(item));
        }
        TextView label = ui.text((position + 1) + ". " + item.name + "\n" + item.mime + " · " + item.bytes + " 字节"
                + (item.video() ? " · 视频" : "image/gif".equals(item.mime) ? " · 动图" : "")
                + (item.availability == AtomicWorkbenchPendingPayload.Availability.READY ? "" : "\n" + unavailable(item.availability)), 12, ui.text, false);
        label.setMaxLines(4); label.setMinimumHeight(ui.dp(48)); row.addView(label, new LinearLayout.LayoutParams(0, -2, 1));
        row.setOnClickListener(view -> preview(captured, item));
        row.setOnLongClickListener(view -> item.availability == AtomicWorkbenchPendingPayload.Availability.READY && startGlobalDrag(view, captured, item.id, false));
        card.addView(row, ui.wrap());
        LinearLayout commands = ui.groupRow();
        Button open = action("打开", () -> callback.open(captured, item.id)); open.setEnabled(item.availability == AtomicWorkbenchPendingPayload.Availability.READY);
        commands.addView(open, new LinearLayout.LayoutParams(0, -2, 1));
        Button remove = action("移除", () -> mutate(() -> repository.remove(captured.id, captured.revision, item.id)));
        remove.setContentDescription("从流转素材移除此项"); remove.setTag("pending-remove:" + item.id); commands.addView(remove, new LinearLayout.LayoutParams(0, -2, 1));
        Button sort = action("排序", () -> nudgeChoice(captured, item.id)); sort.setContentDescription("长按拖动排序，或点按前后移动");
        sort.setTag("pending-sort:" + item.id);
        sort.setOnLongClickListener(view -> {
            stopDrag();
            ClipData clip = new ClipData(new ClipDescription("流转素材排序", new String[]{SORT_MIME}), new ClipData.Item(""));
            return view.startDragAndDrop(clip, new View.DragShadowBuilder(view), new SortDrag(this, captured.id, captured.revision, item.id), 0);
        });
        sort.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.addAction(new AccessibilityNodeInfo.AccessibilityAction(0x010200a1, "前移一位"));
                info.addAction(new AccessibilityNodeInfo.AccessibilityAction(0x010200a2, "后移一位"));
            }
            @Override public boolean performAccessibilityAction(View host, int action, android.os.Bundle args) {
                if (action == 0x010200a1 || action == 0x010200a2) { nudge(captured, item.id, action == 0x010200a1 ? -1 : 1); return true; }
                return super.performAccessibilityAction(host, action, args);
            }
        });
        commands.addView(sort, new LinearLayout.LayoutParams(0, -2, 1)); card.addView(commands, ui.wrap());
        card.setOnDragListener((view, event) -> orderDrag(view, event, captured, item.id));
        body.addView(card, ui.margins(0, 8, 0, 0));
    }
    private void preview(AtomicWorkbenchPendingPayload captured, AtomicWorkbenchPendingPayload.FileItem item) {
        if (item.availability != AtomicWorkbenchPendingPayload.Availability.READY) { feedback(unavailable(item.availability)); return; }
        long request = ++generation;
        AtomicWorkbenchTransfer.IO.execute(() -> {
            String failure = null;
            try { repository.delivery(captured.id, captured.revision, item.id, false); }
            catch (java.io.IOException changed) { failure = changed.getMessage(); }
            String message = failure;
            main.post(() -> {
                if (closed || dialog == null || request != generation || !captured.signature().equals(current.signature())) return;
                if (message != null) { feedback(message); return; }
                if (preview != null) preview.close();
                preview = new AtomicWorkbenchContentPreview(activity, ui, content(item), "移除此项",
                        () -> mutate(() -> repository.remove(captured.id, captured.revision, item.id)), () -> callback.open(captured, item.id)); preview.show();
            });
        });
    }
    static AtomicWorkbenchContentItem content(AtomicWorkbenchPendingPayload.FileItem item) {
        return AtomicWorkbenchContentItem.file(item.image() || item.video() ? AtomicWorkbenchContentItem.Kind.MEDIA : AtomicWorkbenchContentItem.Kind.FILES,
                AtomicWorkbenchContentItem.Source.IMPORTED, item.uri, item.mime, item.name, item.created, item.bytes, 0);
    }
    private boolean startGlobalDrag(View source, AtomicWorkbenchPendingPayload snapshot, String item, boolean textOnly) {
        if (dialog == null || dialog.getWindow() == null) return false;
        if (restoreDragWindow != null) restoreDragWindow.run();
        android.view.Window window = dialog.getWindow();
        int flags = window.getAttributes().flags; float alpha = window.getAttributes().alpha;
        boolean[] ended = {false};
        Runnable restore = () -> {
            if (ended[0]) return; ended[0] = true;
            android.view.WindowManager.LayoutParams attrs = window.getAttributes(); attrs.flags = flags; attrs.alpha = alpha;
            try { window.setAttributes(attrs); } catch (RuntimeException ignored) { }
            restoreDragWindow = null;
        };
        restoreDragWindow = restore;
        boolean started = callback.drag(source, snapshot, item, textOnly, restore);
        if (!started) restore.run();
        else if (!ended[0]) {
            android.view.WindowManager.LayoutParams attrs = window.getAttributes(); attrs.alpha = 0f;
            attrs.flags |= android.view.WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE | android.view.WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE;
            try { window.setAttributes(attrs); } catch (RuntimeException failure) { restore.run(); }
        }
        return started;
    }
    private void nudgeChoice(AtomicWorkbenchPendingPayload captured, String id) {
        ui.choiceDialog("调整顺序", new String[]{"前移一位", "后移一位"}, new String[]{"移到前一个文件之前", "移到后一个文件之后"},
                choice -> nudge(captured, id, choice == 0 ? -1 : 1));
    }
    private void nudge(AtomicWorkbenchPendingPayload captured, String id, int direction) {
        int index = index(captured.files, id), destination = index + direction;
        if (index < 0 || destination < 0 || destination >= captured.files.size()) { feedback("已到达素材边界"); return; }
        String before = direction < 0 ? captured.files.get(destination).id : destination + 1 < captured.files.size() ? captured.files.get(destination + 1).id : null;
        mutate(() -> repository.moveBefore(captured.id, captured.revision, id, before));
    }
    private boolean orderDrag(View row, DragEvent event, AtomicWorkbenchPendingPayload captured, String targetId) {
        if (!(event.getLocalState() instanceof SortDrag)) return false;
        SortDrag drag = (SortDrag) event.getLocalState(); if (drag.owner != this || closed) return false;
        switch (event.getAction()) {
            case DragEvent.ACTION_DRAG_STARTED: return true;
            case DragEvent.ACTION_DRAG_ENTERED:
            case DragEvent.ACTION_DRAG_LOCATION:
                if (highlighted != row) { clearHighlight(); highlighted = row; row.setForeground(ui.roundStroke(android.graphics.Color.TRANSPARENT, ui.surfaceRadiusDp(14), ui.accent, 2)); }
                updateScroll(row, event); return true;
            case DragEvent.ACTION_DRAG_EXITED: stopScroll(); clearHighlight(); return true;
            case DragEvent.ACTION_DROP:
                stopDrag();
                if (!drag.payload.equals(current.id) || drag.revision != current.revision) { feedback("素材已变化，请重新排序"); return true; }
                int at = index(captured.files, targetId);
                String before = event.getY() < row.getHeight() / 2f ? targetId : at + 1 < captured.files.size() ? captured.files.get(at + 1).id : null;
                mutate(() -> repository.moveBefore(drag.payload, drag.revision, drag.item, before)); return true;
            case DragEvent.ACTION_DRAG_ENDED: stopDrag(); return true;
            default: return true;
        }
    }
    private void updateScroll(View row, DragEvent event) {
        scrolling = scrollParent(); if (scrolling == null) return;
        int[] rowAt = new int[2], scrollAt = new int[2]; row.getLocationInWindow(rowAt); scrolling.getLocationInWindow(scrollAt);
        float y = rowAt[1] + event.getY() - scrollAt[1];
        speed = AtomicWorkbenchDragScrollPolicy.velocity(y, 0, scrolling.getHeight(), ui.dp(40), ui.dp(420));
        if (speed == 0) stopScroll(); else if (!posted) { posted = true; previous = SystemClock.uptimeMillis(); scrolling.postOnAnimation(frame); }
    }
    private void scrollFrame() {
        posted = false;
        if (closed || scrolling == null || speed == 0 || !scrolling.isAttachedToWindow() || !scrolling.isShown()
                || !scrolling.canScrollVertically(speed < 0 ? -1 : 1)) { stopScroll(); return; }
        long now = SystemClock.uptimeMillis(); float distance = AtomicWorkbenchDragScrollPolicy.distance(speed, now - previous) + remainder; previous = now;
        int pixels = (int) distance; remainder = distance - pixels; scrolling.scrollBy(0, pixels);
        posted = true; scrolling.postOnAnimation(frame);
    }
    private void stopScroll() { speed = remainder = 0; posted = false; if (scrolling != null) scrolling.removeCallbacks(frame); scrolling = null; }
    private void clearHighlight() { if (highlighted != null) { highlighted.setForeground(null); highlighted = null; } }
    private void stopDrag() { stopScroll(); clearHighlight(); }
    private void confirmClear() {
        AtomicWorkbenchPendingPayload captured = current;
        confirmation = ui.glassDialog("清空流转素材", "仅移出流转素材，不删除手机原文件。已分享的缓存按原有效期保留。", "清空素材",
                () -> mutate(() -> repository.clear(captured.id, captured.revision)), "取消");
    }
    private void mutate(Supplier<AtomicWorkbenchPendingRepository.Result> action) {
        AtomicWorkbenchTransfer.IO.execute(() -> {
            AtomicWorkbenchPendingRepository.Result result = action.get();
            main.post(() -> {
                if (closed || dialog == null) return;
                current = result.snapshot; undo = result.undo; render(); if (!result.success) feedback(result.message);
                if (undo != null) { AtomicWorkbenchPendingRepository.Undo token = undo; main.postDelayed(() -> { if (!closed && undo == token) { undo = null; render(); } }, 10_100L); }
            });
        });
    }
    private Button action(String text, Runnable action) { Button button = ui.button(text); button.setMinimumHeight(ui.dp(48)); button.setOnClickListener(ignored -> action.run()); return button; }
    private ScrollView scrollParent() { if (body == null) return null; ViewParent parent = body.getParent(); while (parent != null) { if (parent instanceof ScrollView) return (ScrollView) parent; parent = parent.getParent(); } return null; }
    private static int index(List<AtomicWorkbenchPendingPayload.FileItem> items, String id) { for (int i = 0; i < items.size(); i++) if (items.get(i).id.equals(id)) return i; return -1; }
    private static String unavailable(AtomicWorkbenchPendingPayload.Availability value) { return value == AtomicWorkbenchPendingPayload.Availability.EXPIRED ? "缓存已过期，请重新添加"
            : value == AtomicWorkbenchPendingPayload.Availability.MISSING ? "缓存已被清理，请重新添加" : "此素材暂时无法读取"; }
    private void feedback(String text) { if (!closed) android.widget.Toast.makeText(activity, text, android.widget.Toast.LENGTH_LONG).show(); }
    private void detach() {
        if (restoreDragWindow != null) restoreDragWindow.run();
        dialog = null; ++generation; stopDrag(); main.removeCallbacks(loadThumbnails); thumbnails.reset();
        if (observer != null && observer.isAlive() && scrolled != null) observer.removeOnScrollChangedListener(scrolled); observer = null;
        if (subscription != null) try { subscription.close(); } catch (Exception ignored) { } subscription = null;
        if (preview != null) { preview.close(); preview = null; }
        if (confirmation != null) { confirmation.dismiss(); confirmation = null; }
    }
    @Override public void close() { if (closed) return; closed = true; Dialog old = dialog; detach(); if (old != null) old.dismiss(); thumbnails.close(); }
    private static final class SortDrag {
        final AtomicWorkbenchPendingControls owner; final String payload, item; final long revision;
        SortDrag(AtomicWorkbenchPendingControls owner, String payload, long revision, String item) { this.owner = owner; this.payload = payload; this.revision = revision; this.item = item; }
    }
}
