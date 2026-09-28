package ls.augment.com.hook;

import android.app.Dialog;
import android.content.ClipData;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.DragEvent;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

import ls.augment.com.LauncherOptions;

/** A window-local editor: the launcher continues to own every page and icon. */
final class LauncherPagesEditor {
    private final LauncherPagesHook.Controller c;
    private final Context context;
    private final Dialog dialog;
    private final LinearLayout sheet;
    private final PageGrid grid;
    private final ScrollView scroll;
    private final TextView count, hint, selection;
    private final ActionButton add, previous, next, delete;
    private final ArrayList<Page> pages = new ArrayList<>();
    private final ArrayList<PageCard> cards = new ArrayList<>();
    private final boolean dark;
    private final int surface, text, muted, accent, soft, outline;
    private int selectedId = -1, currentId = -1, fallbackSelectionId = -1, edgeScroll;
    private boolean busy, dragging;
    private String feedback;
    private final Runnable scrollWhileDragging = new Runnable() {
        @Override public void run() {
            if (!dragging || edgeScroll == 0 || !isShowing()) return;
            scroll.scrollBy(0, edgeScroll * dp(11));
            c.main.postDelayed(this, 24);
        }
    };

    LauncherPagesEditor(LauncherPagesHook.Controller controller, Context context) {
        this.c = controller;
        this.context = context;
        dark = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        surface = dark ? 0xff1a202a : 0xfff8faff;
        text = dark ? 0xfff2f5fc : 0xff202b40;
        muted = dark ? 0xffa5b3ca : 0xff69768c;
        accent = dark ? 0xffabc5ff : 0xff3569c9;
        soft = dark ? 0xff293449 : 0xffeaf0fb;
        outline = dark ? 0xff3b475c : 0xffdee5f0;

        dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        sheet = new LinearLayout(context) {
            @Override protected void onConfigurationChanged(Configuration configuration) {
                super.onConfigurationChanged(configuration);
                // The launcher may consume rotation/theme changes without recreating its
                // Activity. Reopen with the new window, typography and colors in that case.
                if (isShowing()) dismiss();
            }
        };
        sheet.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable sheetBackground = rounded(surface, 28);
        sheetBackground.setCornerRadii(new float[]{dp(28), dp(28), dp(28), dp(28), 0, 0, 0, 0});
        sheet.setBackground(sheetBackground);
        sheet.setClipToOutline(true);

        View handle = new View(context);
        handle.setBackground(rounded(outline, 3));
        LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(dp(32), dp(4));
        handleParams.gravity = Gravity.CENTER_HORIZONTAL;
        handleParams.topMargin = dp(10);
        sheet.addView(handle, handleParams);

        LinearLayout heading = new LinearLayout(context);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        heading.setPadding(dp(20), dp(5), dp(12), 0);
        LinearLayout titles = new LinearLayout(context);
        titles.setOrientation(LinearLayout.VERTICAL);
        TextView title = label("桌面页面", 21, text);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setAccessibilityHeading(true);
        titles.addView(title);
        count = label("", 12, muted);
        count.setPadding(0, dp(3), 0, 0);
        titles.addView(count);
        heading.addView(titles, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView done = label("完成", 15, accent);
        done.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        done.setGravity(Gravity.CENTER);
        done.setMinHeight(dp(48));
        done.setMinWidth(dp(64));
        done.setPadding(dp(12), 0, dp(12), 0);
        done.setBackground(ripple(Color.TRANSPARENT, 16, 0));
        done.setOnClickListener(view -> dismiss());
        done.setContentDescription("完成页面管理");
        heading.addView(done);
        sheet.addView(heading);

        hint = label("轻点选页，长按拖动排序", 12, muted);
        hint.setPadding(dp(20), dp(10), dp(20), dp(10));
        sheet.addView(hint);

        grid = new PageGrid(context);
        grid.setPadding(dp(16), dp(2), dp(16), dp(16));
        scroll = new ScrollView(context);
        scroll.setFillViewport(false);
        scroll.setClipToPadding(false);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.addView(grid, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        sheet.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        scroll.setOnDragListener((view, event) -> {
            if (!isOurDrag(event)) return false;
            if (event.getAction() == DragEvent.ACTION_DRAG_LOCATION) updateScroll(event.getY());
            if (event.getAction() == DragEvent.ACTION_DRAG_ENDED) endDrag();
            if (event.getAction() == DragEvent.ACTION_DROP) {
                stopScroll();
                return false; // Only an eligible page card accepts a drop.
            }
            return true;
        });

        LinearLayout footer = new LinearLayout(context);
        footer.setOrientation(LinearLayout.VERTICAL);
        footer.setPadding(dp(16), dp(10), dp(16), dp(12));
        footer.setBackgroundColor(surface);
        View divider = new View(context);
        divider.setBackgroundColor(outline);
        sheet.addView(divider, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(1)));
        selection = label("", 12, muted);
        selection.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        selection.setPadding(dp(4), 0, dp(4), dp(8));
        footer.addView(selection);
        LinearLayout actions = new LinearLayout(context);
        add = new ActionButton("新增", Glyph.PLUS, true);
        previous = new ActionButton("前移", Glyph.LEFT, false);
        next = new ActionButton("后移", Glyph.RIGHT, false);
        delete = new ActionButton("删除", Glyph.DELETE, false);
        add.setContentDescription("新增空白页");
        previous.setContentDescription("将选中页面向前移动一页");
        next.setContentDescription("将选中页面向后移动一页");
        delete.setContentDescription("删除选中的空白页；含图标或组件的页面不能删除");
        ActionButton[] buttons = {add, previous, next, delete};
        for (int i = 0; i < buttons.length; i++) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0,
                    ViewGroup.LayoutParams.WRAP_CONTENT, 1);
            if (i > 0) params.leftMargin = dp(8);
            actions.addView(buttons[i], params);
        }
        footer.addView(actions);
        sheet.addView(footer);
        add.setOnClickListener(view -> addPage());
        previous.setOnClickListener(view -> moveSelected(-1));
        next.setOnClickListener(view -> moveSelected(1));
        delete.setOnClickListener(view -> deleteSelected());

        dialog.setContentView(sheet);
        dialog.setCanceledOnTouchOutside(true);
        dialog.setOnDismissListener(ignored -> {
            endDrag();
            // OnDismiss is queued by Dialog; an older window must never cancel a
            // newly opened editor's pending operation or retain its Activity.
            if (c.editor == this) {
                c.cancelPending();
                c.editor = null;
            }
        });
    }

    void show() {
        try {
            render(false);
            dialog.show();
            Window window = dialog.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                window.setDimAmount(0.32f);
                window.setGravity(Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
                window.setDecorFitsSystemWindows(true);
                window.clearFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);
                // An inset dialog window keeps both gesture navigation and display cutouts clear.
                WindowManager manager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
                android.view.WindowMetrics metrics = manager.getCurrentWindowMetrics();
                android.graphics.Insets insets = metrics.getWindowInsets().getInsetsIgnoringVisibility(
                        android.view.WindowInsets.Type.systemBars() | android.view.WindowInsets.Type.displayCutout());
                int availableWidth = metrics.getBounds().width() - insets.left - insets.right;
                int availableHeight = metrics.getBounds().height() - insets.top - insets.bottom;
                window.setLayout(Math.min(availableWidth, dp(720)), Math.round(availableHeight * 0.91f));
                window.setNavigationBarColor(surface);
                android.view.WindowInsetsController insetsController = window.getInsetsController();
                if (insetsController != null) insetsController.setSystemBarsAppearance(dark ? 0
                                : android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS,
                        android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
            }
            revealSelected();
        } catch (Throwable error) {
            c.failed(error);
            dismiss();
            c.notifyUser("页面暂未就绪，请重新打开页面管理");
        }
    }

    boolean isShowing() { return dialog.isShowing(); }

    void dismiss() {
        endDrag();
        if (c.editor == this) {
            c.cancelPending();
            c.editor = null;
        }
        dialog.dismiss();
    }

    private void render(boolean selectLast) throws Exception {
        List<Integer> order = c.order();
        int refreshedCurrent = c.currentPageId();
        ArrayList<Page> refreshedPages = new ArrayList<>();
        for (int id : order) {
            if (id >= 0) refreshedPages.add(new Page(id, c.fixed(id), c.empty(id), c.pageView(id)));
        }
        // Keep the previous complete snapshot if native page inspection fails.
        currentId = refreshedCurrent;
        pages.clear();
        pages.addAll(refreshedPages);
        if (selectLast && !pages.isEmpty()) selectedId = pages.get(pages.size() - 1).id;
        if (indexOf(selectedId) < 0) selectedId = indexOf(fallbackSelectionId) >= 0 ? fallbackSelectionId
                : indexOf(currentId) >= 0 ? currentId
                : pages.isEmpty() ? -1 : pages.get(0).id;
        fallbackSelectionId = -1;
        count.setText("共 " + pages.size() + " 页");
        hint.setText(c.enabled(LauncherOptions.PAGE_REORDER) ? "轻点选页，长按拖动排序" : "轻点选页，可新增或删除空白页");
        cards.clear();
        grid.removeAllViews();
        for (int i = 0; i < pages.size(); i++) {
            PageCard card = new PageCard(pages.get(i), i + 1);
            cards.add(card);
            grid.addView(card);
        }
        updateControls();
    }

    private void updateControls() {
        int index = indexOf(selectedId);
        Page page = index < 0 ? null : pages.get(index);
        boolean reorder = c.enabled(LauncherOptions.PAGE_REORDER);
        boolean keep = c.enabled(LauncherOptions.KEEP_EMPTY);
        add.setVisibility(keep ? View.VISIBLE : View.GONE);
        previous.setVisibility(reorder ? View.VISIBLE : View.GONE);
        next.setVisibility(reorder ? View.VISIBLE : View.GONE);
        delete.setVisibility(keep ? View.VISIBLE : View.GONE);
        add.setEnabled(!busy && !dragging && pages.size() < LauncherPageOrder.MAX_PAGES);
        previous.setEnabled(!busy && !dragging && canMove(index, index - 1));
        next.setEnabled(!busy && !dragging && canMove(index, index + 1));
        delete.setEnabled(!busy && !dragging && page != null && !page.fixed && page.empty && pages.size() > 1);
        if (busy) {
            selection.setText("正在更新页面…");
        } else if (feedback != null) {
            selection.setText(feedback);
        } else if (page == null) {
            selection.setText("点击新增，创建一个空白页");
        } else {
            selection.setText("已选第 " + (index + 1) + " 页" + (page.fixed ? " · 系统固定页" : page.empty
                    ? " · 空白页" : " · 含图标或组件") + (page.id == currentId ? " · 当前页" : ""));
        }
        for (PageCard card : cards) card.updateSelection(false);
    }

    private boolean canMove(int from, int to) {
        if (from < 0 || to < 0 || from >= pages.size() || to >= pages.size()) return false;
        return canDrop(pages.get(from).id, pages.get(to).id);
    }

    private int indexOf(int id) {
        for (int i = 0; i < pages.size(); i++) if (pages.get(i).id == id) return i;
        return -1;
    }

    private void select(int id) {
        if (busy || selectedId == id) return;
        selectedId = id;
        feedback = null;
        updateControls();
    }

    private void moveSelected(int offset) {
        int from = indexOf(selectedId), to = from + offset;
        if (!canMove(from, to)) return;
        int id = selectedId, targetId = pages.get(to).id;
        perform(() -> c.move(id, targetId));
    }

    private void deleteSelected() {
        int index = indexOf(selectedId);
        if (index < 0 || !delete.isEnabled()) return;
        int id = selectedId;
        fallbackSelectionId = pages.get(index + 1 < pages.size() ? index + 1 : index - 1).id;
        perform(() -> c.delete(id));
    }

    private void perform(LauncherPagesHook.Action action) {
        if (busy || !isShowing()) return;
        busy = true;
        feedback = null;
        updateControls();
        c.perform(action, () -> completed(false), this::failed);
    }

    private void addPage() {
        if (busy || !add.isEnabled() || !isShowing()) return;
        busy = true;
        feedback = null;
        updateControls();
        c.addPage(() -> completed(true), this::failed);
    }

    private void completed(boolean selectLast) {
        busy = false;
        if (!isShowing()) return;
        try {
            render(selectLast);
            revealSelected();
            selection.announceForAccessibility(selectLast ? "已新增空白页" : "页面已更新");
        } catch (Throwable error) {
            c.failed(error);
            failed("页面已更新，请重新打开查看");
        }
    }

    private void failed(String message) {
        busy = false;
        if (!isShowing()) return;
        feedback = message;
        try { render(false); }
        catch (Throwable error) { c.failed(error); updateControls(); }
        c.notifyUser(message);
    }

    private void revealSelected() {
        grid.afterLayout = () -> {
            if (!isShowing()) return;
            if (grid.isLayoutRequested()) { revealSelected(); return; }
            for (PageCard card : cards) if (card.page.id == selectedId) {
                int top = card.getTop() - dp(8), bottom = card.getBottom() + dp(8);
                if (card.getHeight() > scroll.getHeight() || top < scroll.getScrollY()) {
                    scroll.smoothScrollTo(0, Math.max(0, top));
                }
                else if (bottom > scroll.getScrollY() + scroll.getHeight()) {
                    scroll.smoothScrollTo(0, Math.max(0, bottom - scroll.getHeight()));
                }
                return;
            }
        };
        grid.requestLayout();
    }

    private boolean isOurDrag(DragEvent event) {
        return event.getLocalState() instanceof DraggedPage
                && ((DraggedPage) event.getLocalState()).owner == this;
    }

    private void updateScroll(float y) {
        int direction = y < dp(56) ? -1 : y > scroll.getHeight() - dp(56) ? 1 : 0;
        if (direction == edgeScroll) return;
        stopScroll();
        edgeScroll = direction;
        if (direction != 0) c.main.post(scrollWhileDragging);
    }

    private void stopScroll() {
        edgeScroll = 0;
        c.main.removeCallbacks(scrollWhileDragging);
    }

    private void endDrag() {
        boolean wasDragging = dragging;
        dragging = false;
        stopScroll();
        if (wasDragging) updateControls();
    }

    private int dp(int value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }

    private TextView label(String value, int size, int color) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        view.setIncludeFontPadding(false);
        return view;
    }

    private GradientDrawable rounded(int color, int radius) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radius));
        return drawable;
    }

    private RippleDrawable ripple(int fill, int radius, int stroke) {
        GradientDrawable background = rounded(fill, radius);
        if (stroke != 0) background.setStroke(dp(2), stroke);
        return new RippleDrawable(ColorStateList.valueOf(dark ? 0x22ffffff : 0x173569c9),
                background, rounded(Color.WHITE, radius));
    }

    private final class ActionButton extends LinearLayout {
        ActionButton(String title, int glyph, boolean primary) {
            super(context);
            setOrientation(VERTICAL);
            setGravity(Gravity.CENTER);
            setPadding(dp(4), dp(9), dp(4), dp(9));
            setMinimumHeight(dp(64));
            setFocusable(true);
            setBackground(ripple(primary ? accent : soft, 16, 0));
            int color = primary ? (dark ? 0xff182b50 : Color.WHITE) : accent;
            addView(new Glyph(context, glyph, color), new LinearLayout.LayoutParams(dp(22), dp(22)));
            TextView label = label(title, 12, color);
            label.setGravity(Gravity.CENTER);
            label.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = dp(5);
            addView(label, params);
            setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
            for (int i = 0; i < getChildCount(); i++) getChildAt(i).setImportantForAccessibility(
                    View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        }
        @Override public void setEnabled(boolean enabled) {
            super.setEnabled(enabled);
            setAlpha(enabled ? 1f : 0.36f);
        }
        @Override public CharSequence getAccessibilityClassName() { return android.widget.Button.class.getName(); }
    }

    private final class PageCard extends LinearLayout {
        final Page page;
        final FrameLayout previewFrame;
        final Glyph check;
        PageCard(Page page, int number) {
            super(context);
            this.page = page;
            setOrientation(VERTICAL);
            setPadding(dp(7), dp(7), dp(7), dp(10));
            setFocusable(true);
            setClickable(true);
            previewFrame = new FrameLayout(context);
            previewFrame.setBackground(rounded(dark ? 0xff354d69 : 0xffa7bdd7, 12));
            previewFrame.setClipToOutline(true);
            previewFrame.addView(new Preview(context, page.source, page.empty),
                    new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            if (page.id == currentId) {
                TextView current = label("当前页", 10, Color.WHITE);
                current.setPadding(dp(7), dp(4), dp(7), dp(4));
                current.setBackground(rounded(0xc9334e73, 8));
                FrameLayout.LayoutParams badge = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START);
                badge.setMargins(dp(6), dp(6), dp(6), 0);
                previewFrame.addView(current, badge);
            }
            addView(previewFrame, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(160)));
            LinearLayout caption = new LinearLayout(context);
            caption.setGravity(Gravity.CENTER_VERTICAL);
            caption.setPadding(dp(3), dp(9), dp(3), 0);
            TextView title = label("第 " + number + " 页", 14, text);
            title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            caption.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            check = new Glyph(context, Glyph.CHECK, 0xff3569c9);
            caption.addView(check, new LinearLayout.LayoutParams(dp(20), dp(20)));
            addView(caption);
            TextView status = label(page.fixed ? "系统固定" : page.empty ? "空白页"
                    : c.enabled(LauncherOptions.PAGE_REORDER) ? "可整页移动" : "含图标或组件", 11, muted);
            status.setPadding(dp(3), dp(4), dp(3), 0);
            addView(status);
            String description = "第 " + number + " 页" + (page.id == currentId ? "，当前桌面" : "")
                    + (page.fixed ? "，系统固定页" : page.empty ? "，空白页" : "，含图标或组件");
            setContentDescription(description);
            setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
            previewFrame.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            caption.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            status.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            setOnClickListener(view -> select(page.id));
            setOnLongClickListener(view -> {
                if (busy || !c.enabled(LauncherOptions.PAGE_REORDER) || page.fixed) return false;
                select(page.id);
                dragging = view.startDragAndDrop(ClipData.newPlainText("桌面页面", ""),
                        new View.DragShadowBuilder(view), new DraggedPage(LauncherPagesEditor.this, page.id), 0);
                if (dragging) {
                    updateControls();
                    view.performHapticFeedback(android.view.HapticFeedbackConstants.LONG_PRESS);
                }
                return dragging;
            });
            setOnDragListener((view, event) -> {
                if (!isOurDrag(event) || !c.enabled(LauncherOptions.PAGE_REORDER)) return false;
                int from = ((DraggedPage) event.getLocalState()).id;
                int action = event.getAction();
                boolean target = (action == DragEvent.ACTION_DRAG_ENTERED || action == DragEvent.ACTION_DROP)
                        && !page.fixed && from != page.id && canDrop(from, page.id);
                switch (event.getAction()) {
                    case DragEvent.ACTION_DRAG_LOCATION:
                        updateScroll(getTop() + event.getY() - scroll.getScrollY());
                        break;
                    case DragEvent.ACTION_DRAG_ENTERED:
                        updateSelection(target);
                        break;
                    case DragEvent.ACTION_DRAG_EXITED:
                        updateSelection(false);
                        break;
                    case DragEvent.ACTION_DROP:
                        stopScroll();
                        updateSelection(false);
                        if (!target) return false;
                        selectedId = from;
                        perform(() -> c.move(from, page.id));
                        return true;
                    case DragEvent.ACTION_DRAG_ENDED:
                        endDrag();
                        break;
                    default:
                        break;
                }
                return true;
            });
            updateSelection(false);
        }
        void updateSelection(boolean dropTarget) {
            boolean selected = page.id == selectedId;
            setSelected(selected);
            setStateDescription(selected ? "已选中" : "未选中");
            check.setVisibility(selected ? View.VISIBLE : View.INVISIBLE);
            setBackground(ripple(selected || dropTarget ? soft : dark ? 0xff242c39 : Color.WHITE,
                    19, selected || dropTarget ? accent : 0));
            setAlpha(busy ? 0.7f : 1f);
        }
    }

    private boolean canDrop(int fromId, int toId) {
        if (fromId == toId || indexOf(fromId) < 0 || indexOf(toId) < 0) return false;
        try { return c.canMovePage(fromId, toId); }
        catch (Exception ignored) { return false; }
    }

    /** Measure each row independently so large text never overlaps the following row. */
    private final class PageGrid extends ViewGroup {
        int columns = 2, cellWidth;
        final ArrayList<Integer> rowHeights = new ArrayList<>();
        Runnable afterLayout;
        PageGrid(Context context) { super(context); }
        @Override protected void onMeasure(int widthSpec, int heightSpec) {
            int width = MeasureSpec.getSize(widthSpec);
            int available = Math.max(1, width - getPaddingLeft() - getPaddingRight());
            float fontScale = getResources().getConfiguration().fontScale;
            int minimum = dp(Math.round(128 * Math.max(1f, Math.min(fontScale, 1.6f))));
            int gap = dp(12);
            columns = Math.max(1, Math.min(4, (available + gap) / (minimum + gap)));
            cellWidth = Math.max(1, (available - gap * (columns - 1)) / columns);
            rowHeights.clear();
            int height = getPaddingTop() + getPaddingBottom();
            for (int start = 0; start < getChildCount(); start += columns) {
                int rowHeight = 0;
                for (int j = start; j < Math.min(start + columns, getChildCount()); j++) {
                    PageCard child = (PageCard) getChildAt(j);
                    child.previewFrame.getLayoutParams().height = Math.max(dp(108),
                            Math.min(dp(210), Math.round((cellWidth - dp(14)) * 1.28f)));
                    child.measure(MeasureSpec.makeMeasureSpec(cellWidth, MeasureSpec.EXACTLY),
                            MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED));
                    rowHeight = Math.max(rowHeight, child.getMeasuredHeight());
                }
                rowHeights.add(rowHeight);
                height += rowHeight + (start > 0 ? gap : 0);
            }
            setMeasuredDimension(width, resolveSize(height, heightSpec));
        }
        @Override protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            int y = getPaddingTop(), gap = dp(12);
            for (int row = 0; row < rowHeights.size(); row++) {
                for (int column = 0; column < columns; column++) {
                    int index = row * columns + column;
                    if (index >= getChildCount()) break;
                    View child = getChildAt(index);
                    int x = getPaddingLeft() + column * (cellWidth + gap);
                    child.layout(x, y, x + cellWidth, y + child.getMeasuredHeight());
                }
                y += rowHeights.get(row) + gap;
            }
            if (afterLayout != null) {
                Runnable reveal = afterLayout;
                afterLayout = null;
                post(reveal);
            }
        }
    }

    /** Render native pages without moving their child views or allocating page-sized bitmaps. */
    private final class Preview extends View {
        final WeakReference<View> source;
        final boolean empty;
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        Preview(Context context, View source, boolean empty) {
            super(context);
            this.source = new WeakReference<>(source);
            this.empty = empty;
        }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            paint.setShader(new LinearGradient(0, 0, getWidth(), getHeight(),
                    dark ? 0xff435d7c : 0xffbfd0e6, dark ? 0xff293e5a : 0xff8ca8cd, Shader.TileMode.CLAMP));
            canvas.drawRect(0, 0, getWidth(), getHeight(), paint);
            paint.setShader(null);
            if (empty) {
                paint.setColor(dark ? 0xff8ba5c8 : 0xffeaf2ff);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(dp(2));
                float x = getWidth() / 2f, y = getHeight() / 2f;
                canvas.drawRoundRect(new RectF(x - dp(15), y - dp(22), x + dp(15), y + dp(22)), dp(5), dp(5), paint);
                paint.setStyle(Paint.Style.FILL);
                canvas.drawCircle(x, y + dp(14), dp(1), paint);
                return;
            }
            View page = source.get();
            if (page == null || page.getWidth() <= 0 || page.getHeight() <= 0) return;
            int save = canvas.save();
            try {
                float inset = dp(5);
                float scale = Math.min((getWidth() - inset * 2) / page.getWidth(),
                        (getHeight() - inset * 2) / page.getHeight());
                canvas.translate((getWidth() - page.getWidth() * scale) / 2,
                        (getHeight() - page.getHeight() * scale) / 2);
                canvas.scale(scale, scale);
                page.draw(canvas);
            } catch (RuntimeException ignored) {
                // A remote widget may refuse to render outside its own window.
            } finally { canvas.restoreToCount(save); }
        }
    }

    /** Small scalable icons keep this injected UI independent of the launcher's resources. */
    private static final class Glyph extends View {
        static final int PLUS = 0, LEFT = 1, RIGHT = 2, DELETE = 3, CHECK = 4;
        final int kind;
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        Glyph(Context context, int kind, int color) {
            super(context);
            this.kind = kind;
            paint.setColor(color);
            paint.setStrokeWidth(1.9f);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStyle(Paint.Style.STROKE);
        }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            int save = canvas.save();
            canvas.scale(getWidth() / 24f, getHeight() / 24f);
            Path path = new Path();
            if (kind == PLUS) {
                canvas.drawRoundRect(new RectF(4, 3, 20, 21), 3, 3, paint);
                canvas.drawLine(8, 12, 16, 12, paint);
                canvas.drawLine(12, 8, 12, 16, paint);
            } else if (kind == LEFT || kind == RIGHT) {
                if (kind == RIGHT) { canvas.translate(24, 0); canvas.scale(-1, 1); }
                path.moveTo(10, 6); path.lineTo(4, 12); path.lineTo(10, 18);
                canvas.drawPath(path, paint);
                canvas.drawLine(4, 12, 20, 12, paint);
            } else if (kind == DELETE) {
                canvas.drawLine(4, 6, 20, 6, paint);
                path.moveTo(6, 6); path.lineTo(7, 21); path.lineTo(17, 21); path.lineTo(18, 6);
                canvas.drawPath(path, paint);
                path.reset(); path.moveTo(9, 6); path.lineTo(9, 3); path.lineTo(15, 3); path.lineTo(15, 6);
                canvas.drawPath(path, paint);
                canvas.drawLine(10, 10, 10, 17, paint);
                canvas.drawLine(14, 10, 14, 17, paint);
            } else {
                paint.setStyle(Paint.Style.FILL);
                canvas.drawCircle(12, 12, 10, paint);
                paint.setStyle(Paint.Style.STROKE);
                int color = paint.getColor();
                paint.setColor(Color.WHITE);
                path.moveTo(7, 12); path.lineTo(10.5f, 15.5f); path.lineTo(17, 9);
                canvas.drawPath(path, paint);
                paint.setColor(color);
            }
            canvas.restoreToCount(save);
        }
    }

    private static final class Page {
        final int id;
        final boolean fixed, empty;
        final View source;
        Page(int id, boolean fixed, boolean empty, View source) {
            this.id = id; this.fixed = fixed; this.empty = empty; this.source = source;
        }
    }

    private static final class DraggedPage {
        final LauncherPagesEditor owner;
        final int id;
        DraggedPage(LauncherPagesEditor owner, int id) { this.owner = owner; this.id = id; }
    }
}
