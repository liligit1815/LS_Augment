package ls.augment.com;

import android.graphics.Color;
import android.os.SystemClock;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Recycled word rows; long texts do not create a View for every word at once. */

// Code-only view requires UiKit/state/callbacks; it is never inflated from XML. A partial XML constructor is invalid.
//noinspection ViewConstructor
final class AtomicWorkbenchWordList extends ListView implements AutoCloseable {
    interface Listener {
        void selectionChanged();
        boolean dragSelected(View source);
        void layoutState(boolean busy, String failure);
    }
    private static final ThreadPoolExecutor LAYOUT = new ThreadPoolExecutor(1, 1, 20, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(2), task -> {
                Thread thread = new Thread(task, "DuoWordRows"); thread.setDaemon(true); return thread;
            }, new ThreadPoolExecutor.AbortPolicy());
    private static final class Cell {
        final int token, width;
        Cell(int token, int width) { this.token = token; this.width = width; }
    }
    private final UiKit ui;
    private final Listener listener;
    private final TextPaint paint;
    private final int minimum, padding, gap;
    private AtomicWorkbenchTextSelection model;
    private List<AtomicWorkbenchTextSelection.Token> renderedTokens = Collections.emptyList();
    private List<List<Cell>> rows = Collections.emptyList();
    private final Rows adapter = new Rows();
    private final int[] location = new int[2];
    private Future<?> planning;
    private long generation, lastFrame;
    private boolean closed, rangeMode, layoutBusy;
    private AtomicWorkbenchTextSelection.RangeGesture gesture;
    private float rawX, rawY, remainder;
    private final Runnable frame = this::rangeFrame;

    AtomicWorkbenchWordList(UiKit ui, Listener listener) {
        super(ui.activity);
        this.ui = ui; this.listener = listener;
        Button measure = ui.button(""); paint = new TextPaint(measure.getPaint());
        padding = measure.getPaddingLeft() + measure.getPaddingRight(); minimum = ui.dp(48); gap = ui.dp(6);
        setDivider(null); setDividerHeight(0); setCacheColorHint(Color.TRANSPARENT);
        setVerticalScrollBarEnabled(true); setClipToPadding(false); setPadding(0, 0, 0, ui.dp(4));
        setAdapter(adapter);
    }
    void setModel(AtomicWorkbenchTextSelection next) {
        endRange(true); model = next;
        if (next == null) {
            generation++;
            if (planning != null) planning.cancel(true);
            LAYOUT.purge(); layoutBusy = false;
            rows = Collections.emptyList(); renderedTokens = Collections.emptyList(); adapter.notifyDataSetChanged();
            listener.layoutState(false, "");
        } else planRows();
    }
    void setRangeMode(boolean enabled) { endRange(true); rangeMode = enabled; }
    boolean rangeMode() { return rangeMode; }
    void refreshSelection() {
        if (model != null && renderedTokens != model.tokens()) { if (!layoutBusy) planRows(); return; }
        for (int index = 0; index < getChildCount(); index++) refreshRow((LinearLayout) getChildAt(index));
    }
    int firstVisibleToken() {
        int row = getFirstVisiblePosition();
        if (row < 0 || row >= rows.size() || rows.get(row).isEmpty()) return -1;
        return rows.get(row).get(0).token;
    }
    int scrollAnchorStart() {
        int token = firstVisibleToken();
        return token >= 0 && token < renderedTokens.size() ? renderedTokens.get(token).start : 0;
    }
    int scrollAnchorTop() { View first = getChildAt(0); return first == null ? 0 : first.getTop(); }
    boolean restoreScroll(int startUtf16, int top) {
        if (closed || layoutBusy || model == null || renderedTokens != model.tokens()) return false;
        for (int index = 0; index < rows.size(); index++) {
            List<Cell> cells = rows.get(index);
            if (!cells.isEmpty() && renderedTokens.get(cells.get(cells.size() - 1).token).end > startUtf16) {
                setSelectionFromTop(index, top); return true;
            }
        }
        if (rows.isEmpty()) return true;
        return false;
    }
    void revealToken(int token) {
        for (int row = 0; row < rows.size(); row++) {
            List<Cell> cells = rows.get(row);
            if (!cells.isEmpty() && cells.get(cells.size() - 1).token >= token) { setSelection(row); return; }
        }
    }
    @Override protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
        super.onSizeChanged(width, height, oldWidth, oldHeight);
        if (width != oldWidth) planRows();
    }
    private void planRows() {
        if (closed || model == null || getWidth() <= getPaddingLeft() + getPaddingRight()) return;
        endRange(true);
        if (planning != null) planning.cancel(true);
        LAYOUT.purge();
        long request = ++generation;
        int width = getWidth() - getPaddingLeft() - getPaddingRight();
        AtomicWorkbenchTextSelection owner = model;
        List<AtomicWorkbenchTextSelection.Token> tokens = owner.tokens();
        int first = firstVisibleToken(), anchor = first >= 0 && first < renderedTokens.size() ? renderedTokens.get(first).start : 0;
        View firstView = getChildAt(0); int top = firstView == null ? 0 : firstView.getTop();
        TextPaint metrics = new TextPaint(paint);
        layoutBusy = true; listener.layoutState(true, "");
        try {
            planning = LAYOUT.submit(() -> {
                ArrayList<List<Cell>> planned = new ArrayList<>(); ArrayList<Cell> row = new ArrayList<>();
                int used = 0;
                for (int index = 0; index < tokens.size() && !Thread.currentThread().isInterrupted(); index++) {
                    AtomicWorkbenchTextSelection.Token token = tokens.get(index);
                    if (!token.selectable()) {
                        if ((token.text.indexOf('\n') >= 0 || token.text.indexOf('\r') >= 0) && !row.isEmpty()) {
                            planned.add(Collections.unmodifiableList(row)); row = new ArrayList<>(); used = 0;
                        }
                        continue;
                    }
                    int desired = Math.min(width, Math.max(minimum, (int) Math.ceil(metrics.measureText(token.text)) + padding));
                    if (!row.isEmpty() && used + gap + desired > width) {
                        planned.add(Collections.unmodifiableList(row)); row = new ArrayList<>(); used = 0;
                    }
                    if (!row.isEmpty()) used += gap;
                    row.add(new Cell(index, desired)); used += desired;
                }
                if (Thread.currentThread().isInterrupted()) return;
                if (!row.isEmpty()) planned.add(Collections.unmodifiableList(row));
                post(() -> {
                    if (closed || request != generation || model != owner || tokens != owner.tokens()) return;
                    rows = Collections.unmodifiableList(planned); renderedTokens = tokens; layoutBusy = false;
                    adapter.notifyDataSetChanged();
                    for (int rowIndex = 0; rowIndex < rows.size(); rowIndex++) {
                        Cell last = rows.get(rowIndex).get(rows.get(rowIndex).size() - 1);
                        if (tokens.get(last.token).end > anchor) { setSelectionFromTop(rowIndex, top); break; }
                    }
                    listener.layoutState(false, "");
                });
            });
        } catch (java.util.concurrent.RejectedExecutionException busy) {
            layoutBusy = false; listener.layoutState(false, "文字布局正在处理中，请稍后重试");
        }
    }
    private final class Rows extends BaseAdapter {
        @Override public int getCount() { return rows.size(); }
        @Override public Object getItem(int position) { return rows.get(position); }
        @Override public long getItemId(int position) { return rows.get(position).get(0).token; }
        @Override public View getView(int position, View recycled, ViewGroup parent) {
            LinearLayout row = recycled instanceof LinearLayout ? (LinearLayout) recycled : new LinearLayout(getContext());
            row.setOrientation(LinearLayout.HORIZONTAL); row.setPadding(0, ui.dp(3), 0, ui.dp(3));
            List<Cell> cells = rows.get(position);
            while (row.getChildCount() > cells.size()) row.removeViewAt(row.getChildCount() - 1);
            for (int index = 0; index < cells.size(); index++) {
                Cell cell = cells.get(index); Button chip;
                if (index < row.getChildCount()) chip = (Button) row.getChildAt(index);
                else {
                    chip = ui.button(""); chip.setMinWidth(0); chip.setMinimumWidth(0);
                    chip.setMinHeight(minimum); chip.setMinimumHeight(minimum);
                    chip.setMaxLines(1); chip.setEllipsize(TextUtils.TruncateAt.END);
                    chip.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                        @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                            super.onInitializeAccessibilityNodeInfo(host, info);
                            info.setCheckable(true); info.setChecked(host.isSelected());
                        }
                    });
                    chip.setOnClickListener(view -> {
                        if (!currentCell(view)) return;
                        model.toggle((Integer) view.getTag()); refreshSelection(); listener.selectionChanged();
                    });
                    chip.setOnLongClickListener(AtomicWorkbenchWordList.this::longPress);
                    row.addView(chip);
                }
                chip.setTag(cell.token); chip.setText(renderedTokens.get(cell.token).text);
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(cell.width, -2);
                params.leftMargin = index == 0 ? 0 : gap; chip.setLayoutParams(params);
            }
            refreshRow(row); return row;
        }
    }
    private boolean currentCell(View view) {
        return !closed && !layoutBusy && model != null && renderedTokens == model.tokens()
                && view.getTag() instanceof Integer && (Integer) view.getTag() >= 0 && (Integer) view.getTag() < renderedTokens.size();
    }
    private boolean longPress(View view) {
        if (!currentCell(view) || rangeMode) return false;
        int token = (Integer) view.getTag();
        if (!model.selected(token)) { model.clear(); model.toggle(token); refreshSelection(); listener.selectionChanged(); }
        // The long press was handled even when the system rejects starting a drag.
        // Returning false would let UP click again and undo the selected word.
        listener.dragSelected(view);
        return true;
    }
    private void refreshRow(LinearLayout row) {
        if (model == null || renderedTokens != model.tokens()) return;
        for (int index = 0; index < row.getChildCount(); index++) {
            Button chip = (Button) row.getChildAt(index);
            if (!currentCell(chip)) continue;
            boolean selected = model.selected((Integer) chip.getTag());
            if (chip.isSelected() != selected || chip.getBackground() == null) {
                chip.setSelected(selected);
                chip.setBackground(ui.pressable(ui.controlGlass(chip, 16,
                        selected ? IceGlassControlDrawable.TONAL : IceGlassControlDrawable.NEUTRAL)));
            }
            chip.setTextColor(selected ? ui.accent : ui.text);
            chip.setStateDescription(selected ? "已选" : "未选");
        }
    }
    @Override public boolean dispatchTouchEvent(MotionEvent event) {
        int action = event.getActionMasked(); rawX = event.getRawX(); rawY = event.getRawY();
        if (rangeMode && !layoutBusy && model != null && action == MotionEvent.ACTION_DOWN) {
            int token = tokenAt(rawX, rawY, false);
            if (token >= 0) {
                gesture = model.beginRange(token); gesture.moveTo(token);
                if (getParent() != null) getParent().requestDisallowInterceptTouchEvent(true);
                selectionMoved();
                lastFrame = 0; postOnAnimation(frame); return true;
            }
        }
        if (gesture != null) {
            if (event.getPointerCount() != 1 || action == MotionEvent.ACTION_CANCEL) { endRange(true); return true; }
            if (action == MotionEvent.ACTION_MOVE) updateRange();
            if (action == MotionEvent.ACTION_UP) { updateRange(); endRange(false); }
            return true;
        }
        boolean handled = super.dispatchTouchEvent(event);
        if (getParent() != null) {
            if (action == MotionEvent.ACTION_DOWN && handled) getParent().requestDisallowInterceptTouchEvent(true);
            else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL)
                getParent().requestDisallowInterceptTouchEvent(false);
        }
        return handled;
    }
    private void updateRange() {
        if (gesture == null) return;
        int token = tokenAt(rawX, rawY, true);
        if (token >= 0 && gesture.moveTo(token)) selectionMoved();
        else if (token >= 0) endRange(false);
    }
    private void selectionMoved() {
        if (model != null && renderedTokens == model.tokens()) refreshSelection();
        listener.selectionChanged();
    }
    private int tokenAt(float x, float y, boolean nearest) {
        int closest = -1; float distance = Float.MAX_VALUE;
        for (int rowIndex = 0; rowIndex < getChildCount(); rowIndex++) {
            LinearLayout row = (LinearLayout) getChildAt(rowIndex);
            for (int index = 0; index < row.getChildCount(); index++) {
                View chip = row.getChildAt(index); if (!currentCell(chip)) continue;
                chip.getLocationOnScreen(location);
                float dx = Math.max(location[0] - x, Math.max(0f, x - location[0] - chip.getWidth()));
                float dy = Math.max(location[1] - y, Math.max(0f, y - location[1] - chip.getHeight()));
                if (dx == 0 && dy == 0) return (Integer) chip.getTag();
                float next = dx * dx + dy * dy;
                if (nearest && next < distance) { distance = next; closest = (Integer) chip.getTag(); }
            }
        }
        return closest;
    }
    private void rangeFrame() {
        if (gesture == null || closed || !isShown()) { endRange(true); return; }
        long now = SystemClock.uptimeMillis(); getLocationOnScreen(location);
        float speed = AtomicWorkbenchDragScrollPolicy.velocity(rawY, location[1], location[1] + getHeight(), ui.dp(40), ui.dp(420));
        float distance = AtomicWorkbenchDragScrollPolicy.distance(speed, lastFrame == 0 ? 16L : now - lastFrame) + remainder;
        int pixels = (int) distance; remainder = distance - pixels; lastFrame = now;
        if (pixels != 0) scrollListBy(pixels);
        updateRange();
        if (gesture != null) postOnAnimation(frame);
    }
    private void endRange(boolean cancel) {
        removeCallbacks(frame); lastFrame = 0; remainder = 0;
        if (gesture != null) {
            if (cancel) gesture.cancel(); else gesture.finish(); gesture = null; selectionMoved();
        }
        if (getParent() != null) getParent().requestDisallowInterceptTouchEvent(false);
    }
    @Override protected void onDetachedFromWindow() { endRange(true); super.onDetachedFromWindow(); }
    @Override public void close() {
        closed = true; generation++; endRange(true);
        if (planning != null) planning.cancel(true);
        LAYOUT.purge(); rows = Collections.emptyList(); renderedTokens = Collections.emptyList(); adapter.notifyDataSetChanged();
    }
}
