package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

/** Keeps native dialog behavior (including caller-owned listeners) in the app's glass surface. */
final class AppDialogs {
    private AppDialogs() { }

    static AlertDialog.Builder builder(Context context) {
        Context base = context;
        while (!(base instanceof Activity) && base instanceof ContextWrapper) {
            Context next = ((ContextWrapper) base).getBaseContext();
            if (next == base) break;
            base = next;
        }
        if (!(base instanceof Activity)) throw new IllegalArgumentException("Dialog needs an Activity");
        UiKit ui = new UiKit((Activity) base);
        return new AlertDialog.Builder(context) {
            @Override public AlertDialog create() {
                AlertDialog dialog = super.create();
                // Do not replace OnShow/OnCancel/OnDismiss: callers use these for transactions
                // and for buttons such as 'clear selection' which must keep the dialog open.
                dialog.getWindow().getDecorView().addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View view) {
                        view.removeOnAttachStateChangeListener(this);
                        decorate(dialog, ui);
                    }
                    @Override public void onViewDetachedFromWindow(View view) { }
                });
                return dialog;
            }
        };
    }

    private static void decorate(AlertDialog dialog, UiKit ui) {
        Window window = dialog.getWindow();
        window.setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        ViewGroup content = window.findViewById(android.R.id.content);
        if (content == null || content.getChildCount() != 1) return;
        View panel = content.getChildAt(0);
        content.removeView(panel);
        LiquidGlassLayout surface = new LiquidGlassLayout(ui, 28);
        surface.setTag("liquid-glass-dialog");
        surface.setOrientation(LinearLayout.VERTICAL);
        surface.addView(panel, new LinearLayout.LayoutParams(-1, -2, 1));
        android.widget.FrameLayout bounded = new android.widget.FrameLayout(ui.activity) {
            @Override protected void onMeasure(int widthSpec, int heightSpec) {
                int max = Math.round(getResources().getDisplayMetrics().heightPixels * .78f);
                android.graphics.Rect available = new android.graphics.Rect();
                window.getDecorView().getWindowVisibleDisplayFrame(available);
                if (available.height() > 0) max = Math.min(max, available.height() - ui.dp(24));
                if (MeasureSpec.getMode(heightSpec) != MeasureSpec.UNSPECIFIED)
                    max = Math.min(max, MeasureSpec.getSize(heightSpec));
                super.onMeasure(widthSpec, MeasureSpec.makeMeasureSpec(max, MeasureSpec.AT_MOST));
            }
        };
        bounded.addView(surface, new android.widget.FrameLayout.LayoutParams(-1, -2));
        content.addView(bounded, new ViewGroup.LayoutParams(-1, -2));
        final int[] availableHeight = {-1};
        bounded.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
            android.graphics.Rect frame = new android.graphics.Rect();
            window.getDecorView().getWindowVisibleDisplayFrame(frame);
            if (frame.height() != availableHeight[0]) {
                availableHeight[0] = frame.height();
                bounded.requestLayout();
            }
        });
        styleTree(panel, ui);
        Button positive = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
        Button negative = dialog.getButton(AlertDialog.BUTTON_NEGATIVE);
        Button neutral = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
        Button sample = positive != null ? positive : negative != null ? negative : neutral;
        if (sample != null && sample.getParent() instanceof ViewGroup) {
            ViewGroup oldRow = (ViewGroup) sample.getParent();
            oldRow.removeAllViews();
            oldRow.setVisibility(View.GONE);
            LinearLayout actions = new LinearLayout(ui.activity);
            actions.setGravity(Gravity.CENTER_VERTICAL);
            actions.setPadding(ui.dp(20), ui.dp(12), ui.dp(20), ui.dp(20));
            for (Button button : new Button[]{negative, neutral, positive}) {
                if (button == null || button.getVisibility() != View.VISIBLE) continue;
                if (button.getParent() instanceof ViewGroup) ((ViewGroup) button.getParent()).removeView(button);
                boolean primary = button == positive;
                button.setAllCaps(false);
                button.setTextSize(12.5f);
                button.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
                button.setMinWidth(0); button.setMinimumWidth(0);
                button.setMinHeight(ui.dp(48)); button.setMinimumHeight(ui.dp(48));
                button.setPadding(ui.dp(8), ui.dp(8), ui.dp(8), ui.dp(8));
                button.setTextColor(new ColorStateList(new int[][]{new int[]{-android.R.attr.state_enabled}, new int[]{}},
                        new int[]{ui.muted, primary ? ui.accent : ui.text}));
                button.setBackgroundTintList(null);
                button.setBackground(ui.pressable(ui.roundStroke(primary ? (ui.dark ? 0xa535638c : 0xb0b9e1ff)
                        : (ui.dark ? 0x544c7094 : 0x68ffffff), 18, primary ? ui.accent : ui.outline, 1)));
                button.setStateListAnimator(null);
                LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(0, -2, 1);
                if (actions.getChildCount() > 0) p.leftMargin = ui.dp(8);
                actions.addView(button, p);
            }
            if (actions.getChildCount() > 0) surface.addView(actions);
        }
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        window.setDimAmount(ui.dark ? .28f : .12f);
        window.setLayout(Math.min(ui.dp(420), ui.activity.getResources().getDisplayMetrics().widthPixels - ui.dp(36)), -2);
        surface.refreshBackdrop();
    }

    private static void styleTree(View view, UiKit ui) {
        // Only clear framework containers, preserving backgrounds supplied by custom content.
        boolean frameworkId = (view.getId() >>> 24) == 1;
        if (frameworkId && view instanceof ViewGroup) view.setBackgroundColor(Color.TRANSPARENT);
        if (frameworkId && "customPanel".equals(view.getResources().getResourceEntryName(view.getId())))
            view.setPadding(view.getPaddingLeft(), ui.dp(16), view.getPaddingRight(), view.getPaddingBottom());
        if (view instanceof EditText) ui.styleInput((EditText) view);
        else if (view instanceof TextView && !(view instanceof Button)) {
            TextView text = (TextView) view;
            text.setTextColor(ui.text);
            if (view.getId() == android.R.id.message) {
                text.setTextSize(13); text.setLineSpacing(ui.dp(4), 1.1f);
                text.setPadding(text.getPaddingLeft(), ui.dp(16), text.getPaddingRight(), text.getPaddingBottom());
            }
            if (frameworkId && "alertTitle".equals(view.getResources().getResourceEntryName(view.getId()))) {
                text.setTextSize(16); text.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
                text.setAccessibilityHeading(true);
            }
        }
        if (view instanceof ListView) {
            ListView list = (ListView) view;
            list.setDivider(new ColorDrawable(Color.TRANSPARENT));
            list.setDividerHeight(ui.dp(8));
            list.setPadding(ui.dp(20), ui.dp(16), ui.dp(20), ui.dp(8));
            list.setClipToPadding(false);
            list.setSelector(ui.pressable(ui.round(Color.TRANSPARENT, 12)));
            list.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
                @Override public void onChildViewAdded(View parent, View child) { styleChoice(child, ui); }
                @Override public void onChildViewRemoved(View parent, View child) { }
            });
            for (int i = 0; i < list.getChildCount(); i++) styleChoice(list.getChildAt(i), ui);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) styleTree(group.getChildAt(i), ui);
        }
    }

    private static void styleChoice(View view, UiKit ui) {
        styleTree(view, ui);
        view.setMinimumHeight(ui.dp(48));
        view.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
        view.setBackground(ui.roundStroke(ui.dark ? 0x544c7094 : 0x68ffffff, 12, ui.outline, 1));
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            text.setTextSize(13); text.setSingleLine(false);
            text.setEllipsize(null); text.setGravity(Gravity.CENTER_VERTICAL);
        }
        if (view instanceof CheckedTextView)
            ((CheckedTextView) view).setCheckMarkTintList(ColorStateList.valueOf(ui.accent));
    }
}
