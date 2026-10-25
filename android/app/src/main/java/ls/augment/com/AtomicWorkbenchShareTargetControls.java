package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.view.DragEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/** Actual saved receiver management; the catalog is the current payload's public receivers. */
final class AtomicWorkbenchShareTargetControls {
    static Dialog show(Activity activity, UiKit ui, List<AtomicWorkbenchShareTargetRepository.Target> targets,
            AtomicWorkbenchSharePreferences preferences, Runnable onChanged) {
        Controller controller = new Controller(activity, ui, targets, preferences, onChanged);
        controller.render();
        Dialog dialog = ui.glassDialog("分享入口管理", controller.body, "完成", null, null);
        controller.dialog = dialog;
        dialog.setOnDismissListener(ignored -> controller.close());
        return dialog;
    }

    private static final class SortDrag {
        final Controller owner;
        final boolean app;
        final String key, parent;
        SortDrag(Controller owner, boolean app, String key, String parent) {
            this.owner = owner; this.app = app; this.key = key; this.parent = parent;
        }
    }

    private static final class Controller {
        private static final int ACTION_EARLIER = 0x01020001, ACTION_LATER = 0x01020002;
        final Activity activity;
        final UiKit ui;
        final List<AtomicWorkbenchShareTargetRepository.Target> catalog;
        final AtomicWorkbenchSharePreferences preferences;
        final Runnable onChanged;
        final LinearLayout body;
        final LinkedHashMap<String, List<AtomicWorkbenchShareTargetRepository.Target>> groups = new LinkedHashMap<>();
        final LinkedHashMap<String, AtomicWorkbenchSharePreferences.Setting> settings = new LinkedHashMap<>();
        TextView status;
        Dialog dialog;
        View highlighted;
        ScrollView scroll;
        float scrollVelocity;
        long previousFrame;
        boolean closed;

        Controller(Activity activity, UiKit ui, List<AtomicWorkbenchShareTargetRepository.Target> targets,
                AtomicWorkbenchSharePreferences preferences, Runnable onChanged) {
            this.activity = activity; this.ui = ui; this.preferences = preferences; this.onChanged = onChanged;
            catalog = new ArrayList<>();
            if (targets != null) for (AtomicWorkbenchShareTargetRepository.Target target : targets)
                if (target != null && target.userId == preferences.userId()) catalog.add(target);
            body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
            body.setTag("workbench-share-management");
            body.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override public void onViewAttachedToWindow(View view) { }
                @Override public void onViewDetachedFromWindow(View view) { close(); }
            });
            body.setOnDragListener((view, event) -> {
                if (!ourDrag(event)) return false;
                if (event.getAction() == DragEvent.ACTION_DRAG_LOCATION) updateScroll(view, event.getY());
                if (event.getAction() == DragEvent.ACTION_DRAG_ENDED || event.getAction() == DragEvent.ACTION_DRAG_EXITED) resetDrag();
                return true;
            });
        }

        void render() {
            int oldScroll = parentScroll() == null ? 0 : parentScroll().getScrollY();
            resetDrag(); body.removeAllViews(); groups.clear(); settings.clear();
            for (AtomicWorkbenchSharePreferences.Setting setting : preferences.settings(catalog)) {
                AtomicWorkbenchShareTargetRepository.Target target = setting.target;
                settings.put(target.key(), setting);
                groups.computeIfAbsent(preferences.appKey(target), ignored -> new ArrayList<>()).add(target);
            }
            TextView note = ui.text("仅管理当前内容支持的公开入口。长按排序按钮拖动；置顶项与普通项分别排序。", 12, ui.muted, false);
            body.addView(note, ui.margins(0, 0, 0, 8));
            addActions("全选", () -> apply(preferences.setAllVisible(catalog, true)),
                    "全不选", () -> apply(preferences.setAllVisible(catalog, false)));
            addActions("全部展开", () -> apply(preferences.setAllExpanded(catalog, true)),
                    "全部折叠", () -> apply(preferences.setAllExpanded(catalog, false)));
            status = ui.text(preferences.status(), 12, ui.danger, false);
            status.setTag("workbench-share-management-status");
            status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            status.setVisibility(status.length() == 0 ? View.GONE : View.VISIBLE);
            body.addView(status, ui.margins(0, 4, 0, 8));
            if (groups.isEmpty()) body.addView(ui.text("当前内容没有可管理的分享入口", 13, ui.muted, false));
            for (String key : groups.keySet()) addGroup(key, groups.get(key));
            body.post(() -> { ScrollView parent = parentScroll(); if (parent != null && !closed) parent.scrollTo(0, oldScroll); });
        }

        void addActions(String first, Runnable action, String second, Runnable other) {
            LinearLayout row = ui.groupRow();
            Button left = ui.tonalButton(first), right = ui.tonalButton(second);
            left.setOnClickListener(ignored -> action.run()); right.setOnClickListener(ignored -> other.run());
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -2, 1); lp.rightMargin = ui.dp(8);
            row.addView(left, lp); row.addView(right, new LinearLayout.LayoutParams(0, -2, 1));
            body.addView(row, ui.margins(0, 0, 0, 4));
        }

        void addGroup(String key, List<AtomicWorkbenchShareTargetRepository.Target> targets) {
            AtomicWorkbenchShareTargetRepository.Target representative = targets.get(0);
            AtomicWorkbenchSharePreferences.Setting setting = settings.get(representative.key());
            LinearLayout card = ui.preferenceCard();
            card.setTag("share-app:" + key);
            LinearLayout header = ui.groupRow();
            CheckBox visible = checkbox(representative.appLabel, setting.appVisible);
            visible.setContentDescription("显示应用：" + representative.appLabel);
            visible.setOnCheckedChangeListener((button, checked) -> apply(preferences.setAppVisible(representative, checked)));
            header.addView(visible, new LinearLayout.LayoutParams(0, -2, 1));
            Button expand = ui.button(setting.expanded ? "收起" : "展开");
            expand.setContentDescription((setting.expanded ? "收起" : "展开") + representative.appLabel + "的分享入口");
            expand.setOnClickListener(ignored -> apply(preferences.setExpanded(representative, !setting.expanded)));
            header.addView(expand); card.addView(header);
            TextView packageLabel = ui.text(representative.component.getPackageName(), 11, ui.muted, false);
            packageLabel.setTextIsSelectable(true); card.addView(packageLabel, ui.margins(4, 0, 0, 4));
            LinearLayout commands = ui.groupRow();
            Button pin = ui.tonalButton(setting.appPinned ? "取消应用置顶" : "置顶应用");
            pin.setOnClickListener(ignored -> apply(preferences.setAppPinned(representative, !setting.appPinned)));
            commands.addView(pin, new LinearLayout.LayoutParams(0, -2, 1));
            Button move = dragHandle("排序应用", true, key, "", representative.appLabel);
            commands.addView(move); card.addView(commands);
            attachDrop(card, true, key, "");
            if (setting.expanded) for (AtomicWorkbenchShareTargetRepository.Target target : targets)
                addTarget(card, key, target);
            body.addView(card, ui.margins(0, 4, 0, 8));
        }

        void addTarget(LinearLayout card, String parent, AtomicWorkbenchShareTargetRepository.Target target) {
            AtomicWorkbenchSharePreferences.Setting setting = settings.get(target.key());
            LinearLayout section = new LinearLayout(activity); section.setOrientation(LinearLayout.VERTICAL);
            section.setTag("share-activity:" + target.key());
            LinearLayout row = ui.groupRow();
            CheckBox visible = checkbox(target.label, setting.targetVisible);
            visible.setContentDescription("显示分享入口：" + target.appLabel + "，" + target.label);
            visible.setOnCheckedChangeListener((button, checked) -> apply(preferences.setTargetVisible(target, checked)));
            row.addView(visible, new LinearLayout.LayoutParams(0, -2, 1));
            if (target.icon != null) {
                ImageView icon = new ImageView(activity); icon.setImageDrawable(target.icon);
                icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                row.addView(icon, new LinearLayout.LayoutParams(ui.dp(24), ui.dp(24)));
            }
            section.addView(row);
            TextView component = ui.text(target.component.getClassName(), 11, ui.muted, false);
            component.setTextIsSelectable(true); section.addView(component, ui.margins(4, 0, 0, 4));
            LinearLayout commands = ui.groupRow();
            Button pin = ui.button(setting.targetPinned ? "取消入口置顶" : "置顶入口");
            pin.setOnClickListener(ignored -> apply(preferences.setTargetPinned(target, !setting.targetPinned)));
            commands.addView(pin, new LinearLayout.LayoutParams(0, -2, 1));
            commands.addView(dragHandle("排序入口", false, target.key(), parent, target.label));
            section.addView(commands); attachDrop(section, false, target.key(), parent);
            card.addView(section, ui.margins(0, 0, 0, 4));
        }

        CheckBox checkbox(String label, boolean checked) {
            CheckBox control = new CheckBox(activity); ui.styleCheckBox(control);
            control.setText(label); control.setChecked(checked);
            control.setPadding(0, ui.dp(3), ui.dp(4), ui.dp(3));
            return control;
        }

        Button dragHandle(String text, boolean app, String key, String parent, String label) {
            Button handle = ui.button(text);
            handle.setContentDescription("长按拖动排序：" + label);
            handle.setOnLongClickListener(view -> {
                if (closed) return false;
                resetDrag();
                boolean started = view.startDragAndDrop(ClipData.newPlainText("分享入口排序", ""),
                        new View.DragShadowBuilder(view), new SortDrag(this, app, key, parent), 0);
                if (!started) feedback("暂时无法开始排序，请重试");
                return started;
            });
            handle.setOnClickListener(ignored -> ui.choiceDialog("调整顺序", new String[]{"前移一位", "后移一位"},
                    new String[]{"在当前置顶分组内移动", "在当前置顶分组内移动"}, choice -> nudge(app, key, parent, choice == 0 ? -1 : 1)));
            handle.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    info.addAction(new AccessibilityNodeInfo.AccessibilityAction(ACTION_EARLIER, "前移一位"));
                    info.addAction(new AccessibilityNodeInfo.AccessibilityAction(ACTION_LATER, "后移一位"));
                }
                @Override public boolean performAccessibilityAction(View host, int action, android.os.Bundle args) {
                    if (action == ACTION_EARLIER || action == ACTION_LATER) {
                        nudge(app, key, parent, action == ACTION_EARLIER ? -1 : 1); return true;
                    }
                    return super.performAccessibilityAction(host, action, args);
                }
            });
            return handle;
        }

        void attachDrop(View row, boolean app, String key, String parent) {
            row.setOnDragListener((view, event) -> {
                if (!ourDrag(event)) return false;
                SortDrag drag = (SortDrag) event.getLocalState();
                if (drag.app != app || !drag.parent.equals(parent)) return false;
                switch (event.getAction()) {
                    case DragEvent.ACTION_DRAG_STARTED: return true;
                    case DragEvent.ACTION_DRAG_ENTERED:
                    case DragEvent.ACTION_DRAG_LOCATION:
                        if (highlighted != view) { clearHighlight(); highlighted = view; view.setBackground(ui.round(ui.accentContainer, 12)); }
                        updateScroll(view, event.getY()); return true;
                    case DragEvent.ACTION_DRAG_EXITED: clearHighlight(); stopScroll(); return true;
                    case DragEvent.ACTION_DROP:
                        stopScroll(); clearHighlight();
                        if (!sameSection(app, drag.key, parent).contains(key)) {
                            feedback(app ? "置顶应用与普通应用分别排序" : "请在同一应用和置顶分组内排序");
                            return true;
                        }
                        String before = event.getY() < view.getHeight() / 2f ? key : nextKey(app, key, parent);
                        apply(app ? preferences.moveApp(catalog, drag.key, before) : preferences.moveTarget(catalog, drag.key, before));
                        return true;
                    case DragEvent.ACTION_DRAG_ENDED: resetDrag(); return true;
                    default: return true;
                }
            });
        }

        boolean ourDrag(DragEvent event) {
            return !closed && event.getLocalState() instanceof SortDrag && ((SortDrag) event.getLocalState()).owner == this;
        }

        List<String> sameSection(boolean app, String key, String parent) {
            ArrayList<String> sequence = new ArrayList<>();
            AtomicWorkbenchShareTargetRepository.Target source = representative(app, key);
            if (source == null) return sequence;
            boolean pinned = app ? preferences.appPinned(source) : preferences.targetPinned(source);
            for (AtomicWorkbenchShareTargetRepository.Target target : preferences.managedOrdered(catalog)) {
                String candidate = app ? preferences.appKey(target) : target.key();
                boolean candidatePin = app ? preferences.appPinned(target) : preferences.targetPinned(target);
                if (candidatePin == pinned && (app || parent.equals(preferences.appKey(target))) && !sequence.contains(candidate)) sequence.add(candidate);
            }
            return sequence;
        }

        AtomicWorkbenchShareTargetRepository.Target representative(boolean app, String key) {
            for (AtomicWorkbenchShareTargetRepository.Target target : catalog)
                if (key.equals(app ? preferences.appKey(target) : target.key())) return target;
            return null;
        }

        String nextKey(boolean app, String key, String parent) {
            List<String> sequence = sameSection(app, key, parent);
            int index = sequence.indexOf(key);
            return index >= 0 && index + 1 < sequence.size() ? sequence.get(index + 1) : null;
        }

        void nudge(boolean app, String key, String parent, int direction) {
            List<String> sequence = sameSection(app, key, parent);
            int index = sequence.indexOf(key), destination = index + direction;
            if (index < 0 || destination < 0 || destination >= sequence.size()) { feedback("已到达当前分组边界"); return; }
            String before = direction < 0 ? sequence.get(destination) : destination + 1 < sequence.size() ? sequence.get(destination + 1) : null;
            apply(app ? preferences.moveApp(catalog, key, before) : preferences.moveTarget(catalog, key, before));
        }

        void apply(AtomicWorkbenchSharePreferences.Result result) {
            if (closed) return;
            render();
            if (!result.success) { feedback(result.message); return; }
            if (onChanged != null) onChanged.run();
        }

        void feedback(String message) {
            if (status == null) return;
            status.setText(message); status.setVisibility(View.VISIBLE);
            status.announceForAccessibility(message);
        }

        ScrollView parentScroll() {
            ViewParent parent = body.getParent();
            while (parent != null) {
                if (parent instanceof ScrollView) return (ScrollView) parent;
                parent = parent.getParent();
            }
            return null;
        }

        void updateScroll(View view, float y) {
            ScrollView parent = parentScroll();
            if (parent == null) return;
            int[] rowPosition = new int[2], scrollPosition = new int[2];
            view.getLocationOnScreen(rowPosition); parent.getLocationOnScreen(scrollPosition);
            float local = rowPosition[1] + y - scrollPosition[1];
            int edge = Math.min(ui.dp(48), parent.getHeight() / 3);
            if (edge <= 0) { stopScroll(); return; }
            float velocity = local < edge ? -Math.min(1f, (edge - local) / edge)
                    : local > parent.getHeight() - edge ? Math.min(1f, (local - parent.getHeight() + edge) / edge) : 0;
            if (velocity == 0 || !parent.canScrollVertically(velocity < 0 ? -1 : 1)) { stopScroll(); return; }
            scrollVelocity = velocity * ui.dp(420); scroll = parent;
            if (previousFrame == 0) { previousFrame = android.os.SystemClock.uptimeMillis(); body.postOnAnimation(scrollFrame); }
        }

        final Runnable scrollFrame = new Runnable() {
            @Override public void run() {
                if (closed || scroll == null || scrollVelocity == 0 || !scroll.canScrollVertically(scrollVelocity < 0 ? -1 : 1)) { stopScroll(); return; }
                long now = android.os.SystemClock.uptimeMillis();
                float elapsed = Math.max(1, Math.min(50, now - previousFrame)) / 1000f; previousFrame = now;
                int delta = Math.round(scrollVelocity * elapsed);
                scroll.scrollBy(0, delta == 0 ? scrollVelocity < 0 ? -1 : 1 : delta);
                body.postOnAnimation(this);
            }
        };

        void clearHighlight() { if (highlighted != null) { highlighted.setBackground(null); highlighted = null; } }
        void stopScroll() { body.removeCallbacks(scrollFrame); scrollVelocity = 0; previousFrame = 0; scroll = null; }
        void resetDrag() { stopScroll(); clearHighlight(); }
        void close() { closed = true; resetDrag(); }
    }

    private AtomicWorkbenchShareTargetControls() { }
}
