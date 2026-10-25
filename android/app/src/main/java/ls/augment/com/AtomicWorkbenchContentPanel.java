package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.view.View;
import android.view.ViewParent;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.IOException;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;

/** Phone content regions. Removing history never removes the original media or document. */
final class AtomicWorkbenchContentPanel implements AutoCloseable {
    interface Callback {
        void onUse(List<AtomicWorkbenchContentItem> items, boolean open);
        void onDrag(View source, AtomicWorkbenchContentItem item, DragSource state);
        void onCancelDrag();
        void onPermission(AtomicWorkbenchContentItem.Kind kind);
        void onPickFiles();
        void onPickDirectory();
    }
    interface DragSource {
        boolean held();
        boolean accessibility();
        void starting();
        void started();
        void ended();
    }
    private final Activity activity;
    private final AtomicWorkbenchContentCollector collector;
    private final AtomicWorkbenchContentRepository repository;
    private final Callback callback;
    private final AtomicWorkbenchThumbnailLoader thumbnails;
    private final LinkedHashSet<String> selected = new LinkedHashSet<>();
    private final EnumMap<AtomicWorkbenchContentItem.Kind, Integer> scrollPositions = new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
    private final HashMap<String, Integer> groupLimits = new HashMap<>();
    private UiKit ui;
    private Dialog dialog, confirmation;
    private LinearLayout content;
    private AtomicWorkbenchContentRepository.Subscription subscription;
    private AtomicWorkbenchContentItem.Kind kind;
    private AtomicWorkbenchContentSnapshot current;
    private AtomicWorkbenchContentPreview preview;
    private java.util.function.Consumer<String> textTool;
    private boolean closed;
    private View pressedSource;
    private long pressedDownTime;
    private boolean pressedHeld;
    private SourceDrag sourceDrag;
    private android.view.ViewTreeObserver scrollObserver;
    private final android.view.ViewTreeObserver.OnScrollChangedListener scrolled;

    AtomicWorkbenchContentPanel(Activity activity, UiKit ui, AtomicWorkbenchContentCollector collector, Callback callback) {
        this.activity = activity; this.ui = ui; this.collector = collector;
        repository = collector.repository; this.callback = callback;
        thumbnails = new AtomicWorkbenchThumbnailLoader(activity); scrolled = thumbnails::schedule;
    }

    void toggle(AtomicWorkbenchContentItem.Kind next) {
        if (closed || activity.isDestroyed()) return;
        if (dialog != null && dialog.isShowing() && kind == next) { dismiss(); return; }
        dismiss(); kind = next; selected.clear();
        content = new LinearLayout(activity); content.setOrientation(LinearLayout.VERTICAL);
        content.setTag("atomic-workbench-content:" + next.name());
        Dialog opening = ui.glassDialog(title(next), content, null, null, "关闭");
        dialog = opening;
        scrollObserver = content.getViewTreeObserver(); scrollObserver.addOnScrollChangedListener(scrolled);
        opening.setOnDismissListener(ignored -> {
            if (dialog != opening) return;
            cancelSourceDrag();
            rememberScroll();
            detachThumbnails();
            if (subscription != null) { subscription.close(); subscription = null; }
            repository.setVisible(false); dialog = null;
        });
        subscription = repository.observe(next, this::render);
        repository.setVisible(true);
        if (next == AtomicWorkbenchContentItem.Kind.CLIPBOARD) collector.readCurrentClipboard();
        else repository.refresh(next, true);
    }
    void setTextTool(java.util.function.Consumer<String> value) { textTool = value; }

    private void render(AtomicWorkbenchContentSnapshot snapshot) {
        if (closed || dialog == null || snapshot.kind != kind) return;
        if (sourceDrag != null) {
            current = snapshot;
            if (!sourceDrag.itemCurrent()) cancelSourceDrag();
            return; // Keep the source ViewRoot and original touch stream alive until the drag ends.
        }
        ScrollView scroll = scrollParent(); int scrollY = current == null || current.kind != kind
                ? scrollPositions.getOrDefault(kind, 0) : scroll == null ? 0 : scroll.getScrollY();
        current = snapshot;
        thumbnails.reset();
        selected.removeIf(key -> snapshot.items.stream().noneMatch(item -> item.key.equals(key)));
        content.removeAllViews();
        TextView state = ui.text(stateText(snapshot), 12, ui.muted, false);
        state.setTag("atomic-workbench-content-state"); content.addView(state, ui.wrap());
        LinearLayout actions = new LinearLayout(activity); actions.setOrientation(LinearLayout.HORIZONTAL);
        if (kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD) {
            action(actions, "读取当前文字", collector::readCurrentClipboard);
        } else {
            action(actions, "刷新", () -> repository.refresh(kind, true));
            action(actions, kind == AtomicWorkbenchContentItem.Kind.MEDIA ? "访问照片和视频" : "访问手机文件", () -> callback.onPermission(kind));
        }
        content.addView(actions, ui.margins(0, 8, 0, 0));
        if (kind == AtomicWorkbenchContentItem.Kind.MEDIA) {
            Button gallery = ui.button("打开手机图库"); gallery.setMinimumHeight(ui.dp(48));
            gallery.setOnClickListener(v -> {
                try { activity.startActivity(android.content.Intent.makeMainSelectorActivity(android.content.Intent.ACTION_MAIN, android.content.Intent.CATEGORY_APP_GALLERY)); }
                catch (RuntimeException unavailable) { notice("手机没有可打开的图库入口"); }
            }); content.addView(gallery, ui.margins(0, 8, 0, 0));
        }
        if (kind == AtomicWorkbenchContentItem.Kind.FILES) {
            LinearLayout pickers = new LinearLayout(activity);
            action(pickers, "选择文件", callback::onPickFiles); action(pickers, "授权文件夹", callback::onPickDirectory);
            content.addView(pickers, ui.margins(0, 8, 0, 0));
        }
        if (!snapshot.items.isEmpty()) {
            LinearLayout manage = new LinearLayout(activity);
            Button add = action(manage, selected.isEmpty() ? "选择后添加到流转" : "添加 " + selected.size() + " 项到流转", this::useSelection);
            add.setEnabled(!selected.isEmpty()); action(manage, "清空历史", this::confirmClear);
            action(manage, "回到顶部", () -> { ScrollView parent = scrollParent(); if (parent != null) parent.smoothScrollTo(0, 0); });
            content.addView(manage, ui.margins(0, 8, 0, 0));
        }
        for (AtomicWorkbenchContentPolicy.DateGroup group : AtomicWorkbenchContentPolicy.DateGroup.values()) {
            ArrayList<AtomicWorkbenchContentItem> grouped = new ArrayList<>();
            long now = System.currentTimeMillis(); ZoneId zone = ZoneId.systemDefault();
            for (AtomicWorkbenchContentItem item : snapshot.items)
                if (AtomicWorkbenchContentPolicy.dateGroup(item.modifiedMillis, now, zone) == group) grouped.add(item);
            if (!grouped.isEmpty()) {
                TextView heading = ui.text(groupTitle(group), 13, ui.text, true); heading.setAccessibilityHeading(true);
                content.addView(heading, ui.margins(0, 12, 0, 4));
            }
            String groupKey = kind.name() + ':' + group.name(); int count = Math.min(groupLimits.getOrDefault(groupKey, 12), grouped.size());
            for (int index = 0; index < count; index++) {
            AtomicWorkbenchContentItem item = grouped.get(index);
            LinearLayout row = new LinearLayout(activity); row.setMinimumHeight(ui.dp(48));
            row.setGravity(android.view.Gravity.CENTER_VERTICAL);
            CheckBox check = new CheckBox(activity); check.setButtonTintList(android.content.res.ColorStateList.valueOf(ui.accent));
            check.setChecked(selected.contains(item.key)); check.setContentDescription("选择此项");
            check.setOnCheckedChangeListener((button, checked) -> {
                if (checked && kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD) selected.clear();
                if (checked && selected.size() >= AtomicWorkbenchContentPolicy.MAX_SELECTION && !selected.contains(item.key)) {
                    notice("每次最多选择 16 项"); check.setChecked(false); return;
                }
                if (checked) selected.add(item.key); else selected.remove(item.key);
                render(current);
            });
            row.addView(check, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
            if (item.image() || item.video()) {
                LinearLayout media = new LinearLayout(activity); media.setOrientation(LinearLayout.VERTICAL);
                android.widget.ImageView thumbnail = new android.widget.ImageView(activity); thumbnail.setScaleType(android.widget.ImageView.ScaleType.CENTER_CROP);
                thumbnail.setImageDrawable(new GlassIcon(item.video() ? "play" : "card-corners", ui.muted));
                thumbnail.setContentDescription(item.video() ? "视频预览" : "图片预览"); thumbnail.setMinimumHeight(ui.dp(48));
                thumbnail.setOnClickListener(view -> showPreview(item)); bindDrag(thumbnail, item, null);
                media.addView(thumbnail, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48))); thumbnails.bind(thumbnail, item);
                if (item.video() || "image/gif".equals(item.mime)) {
                    TextView type = ui.text(item.video() ? "视频" : "动图", 10, ui.muted, false); type.setGravity(android.view.Gravity.CENTER);
                    media.addView(type, new LinearLayout.LayoutParams(ui.dp(48), -2));
                }
                LinearLayout.LayoutParams mediaParams = new LinearLayout.LayoutParams(ui.dp(48), -2);
                mediaParams.rightMargin = ui.dp(8);
                row.addView(media, mediaParams);
            }
            TextView label = ui.text(item.kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD ? item.text() : item.name, 13, ui.text, false);
            label.setMaxLines(3); label.setEllipsize(android.text.TextUtils.TruncateAt.END); label.setMinimumHeight(ui.dp(48));
            label.setGravity(android.view.Gravity.CENTER_VERTICAL); label.setTag("atomic-workbench-content-item:" + item.key);
            label.setOnClickListener(view -> { if (item.kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD) copy(item); else showPreview(item); });
            bindDrag(label, item, item.kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD ? row : null);
            row.addView(label, new LinearLayout.LayoutParams(0, -2, 1));
            Button moreItem = ui.button("⋯"); moreItem.setContentDescription("此项操作：添加到流转、查看完整内容或移除");
            moreItem.setMinimumWidth(0); moreItem.setMinWidth(0); moreItem.setPadding(0, 0, 0, 0); moreItem.setMinimumHeight(ui.dp(48));
            moreItem.setOnClickListener(v -> itemMenu(item)); row.addView(moreItem, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
            Button remove = ui.button("×"); remove.setContentDescription("从历史移除此项");
            remove.setMinimumWidth(0); remove.setMinWidth(0); remove.setPadding(0, 0, 0, 0); remove.setMinimumHeight(ui.dp(48));
            remove.setOnClickListener(v -> repository.removeHistory(item.kind, item.key)); row.addView(remove, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
            content.addView(row, ui.wrap());
            }
            if (count < grouped.size()) {
                Button more = ui.button(groupTitle(group) + " · 更多 " + (grouped.size() - count) + " 项");
                more.setMinimumHeight(ui.dp(48)); more.setOnClickListener(v -> { groupLimits.put(groupKey, count + 24); render(current); }); content.addView(more, ui.wrap());
            }
        }
        if (scroll != null) scroll.post(() -> { if (dialog != null && dialog.isShowing()) scroll.scrollTo(0, scrollY); });
    }

    private ScrollView scrollParent() {
        for (ViewParent parent = content == null ? null : content.getParent(); parent != null; parent = parent.getParent())
            if (parent instanceof ScrollView) return (ScrollView) parent;
        return null;
    }

    private Button action(LinearLayout parent, String title, Runnable runnable) {
        Button button = ui.button(title); button.setMinimumHeight(ui.dp(48));
        button.setOnClickListener(v -> runnable.run()); parent.addView(button, new LinearLayout.LayoutParams(0, -2, 1)); return button;
    }

    private void useSelection() {
        try { use(repository.selection(kind, new ArrayList<>(selected)), false); }
        catch (IOException changed) { notice(changed.getMessage()); }
    }

    private void use(List<AtomicWorkbenchContentItem> items, boolean open) {
        dismiss(); callback.onUse(items, open);
    }

    private void showPreview(AtomicWorkbenchContentItem item) {
        if (preview != null) preview.close();
        java.util.function.Consumer<String> segment = textTool;
        preview = new AtomicWorkbenchContentPreview(activity, ui, item,
                "添加到流转", () -> use(List.of(item), false), () -> use(List.of(item), true),
                segment == null || item.kind != AtomicWorkbenchContentItem.Kind.CLIPBOARD ? null : () -> segment.accept(item.text()));
        preview.show();
    }

    private void copy(AtomicWorkbenchContentItem item) {
        try { collector.copyHistory(item); notice("已复制文字"); }
        catch (IOException unavailable) { notice(unavailable.getMessage()); }
    }

    private void bindDrag(View touch, AtomicWorkbenchContentItem item, View row) {
        touch.setTooltipText("长按拖出此项");
        touch.setOnLongClickListener(view -> startSourceDrag(view, item, false));
        touch.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.addAction(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_DRAG_START);
            }
            @Override public boolean performAccessibilityAction(View host, int action, android.os.Bundle arguments) {
                if (action == android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_DRAG_START.getId())
                    return startSourceDrag(host, item, true);
                return super.performAccessibilityAction(host, action, arguments);
            }
        });
        touch.setOnTouchListener(new View.OnTouchListener() {
            float startX, startY; boolean swiping;

            // Gesture observer/forwarder retains native click handling or its separate accessible actions; do not synthesize a second click.
            //noinspection ClickableViewAccessibility
            @Override public boolean onTouch(View view, android.view.MotionEvent event) {
                int action = event.getActionMasked();
                if (action == android.view.MotionEvent.ACTION_DOWN) {
                    if (sourceDrag != null) cancelSourceDrag();
                    pressedSource = view; pressedDownTime = event.getDownTime(); pressedHeld = true;
                    startX = event.getRawX(); startY = event.getRawY(); swiping = false; return false;
                }
                if (action == android.view.MotionEvent.ACTION_UP || action == android.view.MotionEvent.ACTION_CANCEL
                        || event.getPointerCount() != 1 || event.getDownTime() != pressedDownTime) {
                    pressedHeld = false;
                    if (sourceDrag != null && !sourceDrag.started && !sourceDrag.dispatching) cancelSourceDrag();
                }
                if (sourceDrag != null) return true;
                if (row == null) return false;
                float x = event.getRawX() - startX, y = event.getRawY() - startY;
                if (action == android.view.MotionEvent.ACTION_MOVE) {
                    if (!swiping && Math.abs(x) > ui.dp(12) && Math.abs(x) > Math.abs(y) * 1.5f) {
                        swiping = true; view.cancelLongPress(); view.setPressed(false);
                        view.getParent().requestDisallowInterceptTouchEvent(true);
                    }
                    if (swiping) { row.setTranslationX(x); return true; }
                }
                if (action == android.view.MotionEvent.ACTION_UP || action == android.view.MotionEvent.ACTION_CANCEL) {
                    if (!swiping) return false;
                    swiping = false; view.getParent().requestDisallowInterceptTouchEvent(false); view.setPressed(false);
                    boolean remove = action == android.view.MotionEvent.ACTION_UP && Math.abs(x) >= Math.max(ui.dp(48), Math.min(ui.dp(96), row.getWidth() * .25f));
                    row.setTranslationX(0); if (remove) repository.removeHistory(item.kind, item.key); return true;
                }
                return swiping;
            }
        });
    }

    private boolean startSourceDrag(View source, AtomicWorkbenchContentItem item, boolean accessibility) {
        if (closed || sourceDrag != null || dialog == null || !dialog.isShowing() || !source.isAttachedToWindow()
                || !accessibility && (!pressedHeld || pressedSource != source)) return false;
        SourceDrag attempt = new SourceDrag(source, item, accessibility); sourceDrag = attempt;
        if (!attempt.held()) { attempt.ended(); return false; }
        try { callback.onDrag(source, item, attempt); }
        catch (RuntimeException unavailable) { attempt.ended(); notice("暂时无法拖出此项，请重试"); }
        return !attempt.ended;
    }

    private void cancelSourceDrag() {
        pressedHeld = false;
        if (sourceDrag == null) return;
        SourceDrag old = sourceDrag;
        callback.onCancelDrag(); old.ended();
    }

    private final class SourceDrag implements DragSource {
        final View source; final AtomicWorkbenchContentItem item; final Dialog owner;
        final long downTime, reset; final boolean accessible;
        boolean dispatching, started, ended;
        android.view.Window window; int addedFlags; float alpha;
        SourceDrag(View source, AtomicWorkbenchContentItem item, boolean accessible) {
            this.source = source; this.item = item; owner = dialog; this.accessible = accessible;
            downTime = pressedDownTime; reset = ResetWriteFence.generation();
        }
        boolean itemCurrent() {
            if (current == null || current.kind != item.kind) return false;
            for (AtomicWorkbenchContentItem value : current.items)
                if (value.key.equals(item.key) && value.revision.equals(item.revision)) return true;
            return false;
        }
        public boolean held() {
            return !ended && sourceDrag == this && !closed && !activity.isDestroyed() && !activity.isFinishing()
                    && !ResetWriteFence.stale(reset) && dialog == owner && owner.isShowing() && source.isAttachedToWindow()
                    && itemCurrent() && (accessible || pressedHeld && pressedSource == source && pressedDownTime == downTime);
        }
        public boolean accessibility() { return accessible; }
        public void starting() { dispatching = true; }
        public void started() {
            dispatching = false; started = true;
            if (ended) return;
            window = owner.getWindow();
            if (window == null) return;
            android.view.WindowManager.LayoutParams attrs = window.getAttributes();
            addedFlags = (android.view.WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
                    | android.view.WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE) & ~attrs.flags;
            alpha = attrs.alpha; attrs.flags |= addedFlags; attrs.alpha = 0f;
            try { window.setAttributes(attrs); }
            catch (RuntimeException unavailable) { cancelSourceDrag(); notice("拖动窗口未准备好，请重试"); }
        }
        public void ended() {
            if (ended) return; ended = true; dispatching = false;
            if (window != null) try {
                android.view.WindowManager.LayoutParams attrs = window.getAttributes(); attrs.flags &= ~addedFlags;
                if (attrs.alpha == 0f) attrs.alpha = alpha;
                window.setAttributes(attrs);
            } catch (RuntimeException ignored) { }
            if (sourceDrag == this) {
                sourceDrag = null; pressedHeld = false;
                if (!closed && dialog == owner && owner.isShowing() && current != null) render(current);
            }
        }
    }

    private void itemMenu(AtomicWorkbenchContentItem item) {
        LinearLayout body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        Button use = ui.button("添加到流转"); use.setMinimumHeight(ui.dp(48));
        use.setOnClickListener(v -> { if (confirmation != null) confirmation.dismiss(); use(List.of(item), false); }); body.addView(use, ui.wrap());
        Button previewItem = ui.button("查看完整内容"); previewItem.setMinimumHeight(ui.dp(48));
        previewItem.setOnClickListener(v -> { if (confirmation != null) confirmation.dismiss(); showPreview(item); }); body.addView(previewItem, ui.margins(0, 8, 0, 0));
        Button remove = ui.button("从历史移除"); remove.setMinimumHeight(ui.dp(48));
        remove.setOnClickListener(v -> { if (confirmation != null) confirmation.dismiss(); repository.removeHistory(item.kind, item.key); }); body.addView(remove, ui.margins(0, 8, 0, 0));
        confirmation = ui.glassDialog("内容操作", body, null, null, "取消");
    }

    private void confirmClear() {
        AtomicWorkbenchContentItem.Kind clearing = kind;
        confirmation = ui.glassDialog("清空" + title(kind) + "历史", kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD
                ? "清空工作台剪贴板历史，并清除手机当前剪贴板。新复制的文字仍会继续记录。"
                : "仅清空工作台记录，手机中的原文件保持。新内容仍会继续显示。",
                "清空历史", () -> { if (clearing == AtomicWorkbenchContentItem.Kind.CLIPBOARD) {
                        try { collector.clearSystemClipboard(); }
                        catch (IOException unavailable) { notice(unavailable.getMessage()); return; }
                    }
                    selected.clear(); groupLimits.keySet().removeIf(key -> key.startsWith(clearing.name() + ':')); repository.clearHistory(clearing);
                    ScrollView scroll = scrollParent(); if (scroll != null) scroll.scrollTo(0, 0); }, "取消");
    }

    private static String title(AtomicWorkbenchContentItem.Kind kind) {
        return kind == AtomicWorkbenchContentItem.Kind.MEDIA ? "媒体" : kind == AtomicWorkbenchContentItem.Kind.FILES ? "文件" : "剪贴板";
    }
    private static String groupTitle(AtomicWorkbenchContentPolicy.DateGroup group) {
        switch (group) { case TODAY: return "今天"; case YESTERDAY: return "昨天";
            case LAST_SEVEN_DAYS: return "最近七天"; case LAST_THIRTY_DAYS: return "最近三十天"; default: return "更早"; }
    }
    private static String stateText(AtomicWorkbenchContentSnapshot snapshot) {
        String text;
        if (snapshot.loading) text = "正在读取手机内容…";
        else if (snapshot.state == AtomicWorkbenchContentSource.State.LOCKED) text = "请先解锁手机后重试";
        else if (snapshot.state == AtomicWorkbenchContentSource.State.ERROR || snapshot.state == AtomicWorkbenchContentSource.State.UNAVAILABLE) text = "暂时无法读取手机内容，请刷新重试";
        else if (snapshot.kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD) text = snapshot.state == AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED
                ? "已有历史仍可使用；当前剪贴板暂时无法读取，请回到工作台重试"
                : "保留最近 50 条文字；工作台在前台时记录复制内容，敏感内容不记录";
        else if (snapshot.state == AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED) text = "请允许访问，或选择可读取的文件";
        else text = snapshot.items.size() + " 项" + (snapshot.permission.scope == AtomicWorkbenchContentPermissionState.Scope.FULL ? "" : " · 仅显示已允许访问的内容");
        if (!snapshot.storageAvailable) text += " · 历史保存失败，请检查手机存储空间";
        if (snapshot.cached) text += " · 正在重新核对访问权限";
        if (!snapshot.loading && snapshot.items.isEmpty() && snapshot.state == AtomicWorkbenchContentSource.State.READY) text += " · 暂无内容";
        return text;
    }
    private void notice(String message) { if (!closed) android.widget.Toast.makeText(activity, message, android.widget.Toast.LENGTH_LONG).show(); }
    void refreshAppearance(UiKit next) { ui = next; dismiss(); }
    private void rememberScroll() { ScrollView scroll = scrollParent(); if (kind != null && scroll != null) scrollPositions.put(kind, scroll.getScrollY()); }
    private void detachThumbnails() {
        if (scrollObserver != null && scrollObserver.isAlive()) scrollObserver.removeOnScrollChangedListener(scrolled);
        scrollObserver = null; thumbnails.reset();
    }
    void dismiss() {
        cancelSourceDrag();
        rememberScroll(); current = null;
        detachThumbnails();
        if (preview != null) { preview.close(); preview = null; }
        if (confirmation != null) { confirmation.dismiss(); confirmation = null; }
        if (subscription != null) { subscription.close(); subscription = null; }
        repository.setVisible(false);
        Dialog previous = dialog; dialog = null;
        if (previous != null) previous.dismiss();
    }
    @Override public void close() { closed = true; dismiss(); thumbnails.close(); }
}
