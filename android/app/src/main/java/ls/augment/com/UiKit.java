package ls.augment.com;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/** Ice Blue settings design system shared by every LS_Augment screen. */
final class UiKit {
    final Activity activity;
    final boolean dark = false;

    // Sky blue + ice white roles. Cards remain translucent over the quiet gradient.
    final int background = Color.rgb(232, 244, 255);
    final int backgroundEnd = Color.rgb(248, 252, 255);
    final int rail = Color.rgb(242, 249, 255);
    final int card = Color.rgb(251, 253, 255);
    final int cardHigh = Color.rgb(231, 243, 255);
    final int text = Color.rgb(20, 35, 58);
    final int muted = Color.rgb(100, 116, 139);
    final int accent = Color.rgb(55, 145, 244);
    final int accentContainer = Color.rgb(220, 239, 255);
    final int cyan = Color.rgb(13, 151, 119);
    final int danger = Color.rgb(190, 52, 64);
    final int dangerContainer = Color.rgb(255, 233, 236);
    final int warning = Color.rgb(157, 99, 0);
    final int divider = Color.rgb(218, 230, 242);
    final int outline = Color.rgb(199, 217, 234);

    UiKit(Activity activity) {
        this.activity = activity;
        applyWindow();
    }

    private void applyWindow() {
        Window window = activity.getWindow();
        if (Build.VERSION.SDK_INT >= 30) window.setDecorFitsSystemWindows(false);
        window.setStatusBarColor(background);
        window.setNavigationBarColor(backgroundEnd);
        if (Build.VERSION.SDK_INT >= 26) {
            window.getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                            | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
            window.setNavigationBarDividerColor(backgroundEnd);
        }
        if (Build.VERSION.SDK_INT >= 30 && window.getInsetsController() != null) {
            int lightBars = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                    | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            window.getInsetsController().setSystemBarsAppearance(lightBars, lightBars);
        }
        if (Build.VERSION.SDK_INT >= 29) {
            window.setStatusBarContrastEnforced(false);
            window.setNavigationBarContrastEnforced(false);
        }
    }

    Drawable backgroundDrawable() {
        GradientDrawable drawable = new GradientDrawable(
                GradientDrawable.Orientation.TL_BR,
                new int[]{Color.rgb(225, 241, 255), Color.rgb(245, 250, 255), backgroundEnd});
        drawable.setGradientType(GradientDrawable.LINEAR_GRADIENT);
        return drawable;
    }

    LinearLayout scrollPage() {
        ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(true);
        scroll.setClipToPadding(false);
        scroll.setBackground(backgroundDrawable());
        LinearLayout page = new LinearLayout(activity);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(dp(14), dp(14), dp(14), dp(36));
        scroll.addView(page, new ScrollView.LayoutParams(-1, -2));
        activity.setContentView(scroll);
        applyGestureInset(scroll, 0);
        return page;
    }

    LinearLayout detailPage(String title, String scope) {
        LinearLayout root=new LinearLayout(activity);root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(backgroundDrawable());
        LinearLayout head=header(title,true);head.setPadding(dp(10),dp(4),dp(12),dp(2));
        if(scope!=null)ScopeRestartDialog.addButton(activity,this,head,scope);
        root.addView(head,new LinearLayout.LayoutParams(-1,-2));root.addView(divider(),new LinearLayout.LayoutParams(-1,dp(1)));
        ScrollView scroll=new ScrollView(activity);scroll.setFillViewport(true);
        LinearLayout body=new LinearLayout(activity);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(dp(14),dp(10),dp(14),dp(26));
        scroll.addView(body,new ScrollView.LayoutParams(-1,-2));root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
        activity.setContentView(root);applyGestureInset(root,8);return body;
    }

    void applyGestureInset(View view, int extraBottomDp) {
        if (Build.VERSION.SDK_INT < 20) return;
        final int originalBottom = view.getPaddingBottom(), originalTop = view.getPaddingTop();
        final int originalLeft = view.getPaddingLeft(), originalRight = view.getPaddingRight();
        view.setOnApplyWindowInsetsListener((target, insets) -> {
            int bottom,top,left,right;
            if(Build.VERSION.SDK_INT>=30){
                android.graphics.Insets bars=insets.getInsets(WindowInsets.Type.systemBars()|WindowInsets.Type.displayCutout());
                bottom=bars.bottom;top=bars.top;left=bars.left;right=bars.right;
            }else{bottom=insets.getSystemWindowInsetBottom();top=insets.getSystemWindowInsetTop();left=insets.getSystemWindowInsetLeft();right=insets.getSystemWindowInsetRight();}
            target.setPadding(originalLeft+left, originalTop+top,
                    originalRight+right, originalBottom+bottom+dp(extraBottomDp));
            return insets;
        });
        view.requestApplyInsets();
    }

    LinearLayout header(String title, boolean back) {
        LinearLayout row = new LinearLayout(activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(56));
        if (back) {
            ImageButton button = new ImageButton(activity);
            button.setImageResource(R.drawable.ic_arrow_back);
            button.setScaleType(ImageView.ScaleType.CENTER);
            button.setColorFilter(text);
            button.setPadding(dp(11), dp(11), dp(11), dp(11));
            button.setBackground(pressable(round(Color.TRANSPARENT, 50)));
            button.setContentDescription("返回上一页");
            button.setOnClickListener(view -> activity.finish());
            row.addView(button, new LinearLayout.LayoutParams(dp(44), dp(44)));
            LinearLayout.LayoutParams spacer = new LinearLayout.LayoutParams(dp(6), 1);
            row.addView(new View(activity), spacer);
        }
        float fontScale = activity.getResources().getConfiguration().fontScale;
        TextView value = text(title, fontScale > 1.25f ? 18 : 20, text, true);
        value.setGravity(Gravity.CENTER_VERTICAL);
        value.setMaxLines(2);
        row.addView(value, new LinearLayout.LayoutParams(0, -2, 1));
        return row;
    }

    LinearLayout categoryCard(String ignoredIcon, String title, String description,
            String status, View.OnClickListener click) {
        LinearLayout outer = card();
        outer.setPadding(dp(14), dp(12), dp(14), dp(12));
        outer.setClickable(true);
        outer.setFocusable(true);
        outer.setBackground(pressable(glass(18)));
        outer.setOnClickListener(click);

        TextView name = text(title, 15, text, true);
        outer.addView(name, wrap());
        outer.addView(text(description, 11.5f, muted, false), margins(0, 4, 0, 0));
        if (status != null && !status.isEmpty()) {
            outer.addView(statusChip(status, accent), margins(0, 10, 0, 0));
        }
        return outer;
    }

    LinearLayout card() {
        LinearLayout value = new LinearLayout(activity);
        value.setOrientation(LinearLayout.VERTICAL);
        value.setPadding(dp(14), dp(12), dp(14), dp(12));
        value.setBackground(glass(16));
        if (Build.VERSION.SDK_INT >= 21) value.setElevation(dp(1));
        return value;
    }

    LinearLayout section(String title, String description) {
        LinearLayout group = new LinearLayout(activity);
        group.setOrientation(LinearLayout.VERTICAL);
        TextView name = text(title, 14, text, true);
        name.setLineSpacing(0, 1.08f);
        group.addView(name, wrap());
        if (description != null && !description.isEmpty()) {
            TextView detail = text(description, 11.5f, muted, false);
            detail.setLineSpacing(dp(1), 1.06f);
            group.addView(detail, margins(0, 4, 0, 0));
        }
        return group;
    }

    TextView overline(String value) {
        TextView view = text(value, 11, accent, true);
        view.setLetterSpacing(0.04f);
        view.setAllCaps(false);
        return view;
    }

    TextView statusChip(String value, int color) {
        TextView view = text(value, 11, color, true);
        view.setGravity(Gravity.CENTER);
        view.setPadding(dp(9), dp(4), dp(9), dp(4));
        view.setBackground(roundStroke(Color.argb(24, Color.red(color),
                Color.green(color), Color.blue(color)), 50,
                Color.argb(72, Color.red(color), Color.green(color), Color.blue(color)), 1));
        return view;
    }

    TextView text(String value, float size, int color, boolean bold) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        view.setIncludeFontPadding(false);
        view.setTypeface(Typeface.create("sans-serif", bold
                ? Typeface.BOLD : Typeface.NORMAL));
        return view;
    }

    Button button(String value) {
        Button button = new Button(activity);
        button.setText(value);
        button.setTextSize(13);
        button.setTextColor(text);
        button.setAllCaps(false);
        button.setMinHeight(dp(44));
        button.setMinimumHeight(dp(44));
        button.setPadding(dp(13), dp(7), dp(13), dp(7));
        button.setBackground(pressable(roundStroke(Color.argb(226, 255, 255, 255),
                12, outline, 1)));
        button.setStateListAnimator(null);
        button.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        return button;
    }

    Button tonalButton(String value) {
        Button button = button(value);
        button.setTextColor(accent);
        button.setBackground(pressable(roundStroke(accentContainer, 12, outline, 1)));
        return button;
    }

    Button accentButton(String value) {
        Button button = button(value);
        button.setTextColor(Color.WHITE);
        button.setBackground(pressable(round(accent, 12)));
        return button;
    }

    Button dangerButton(String value) {
        Button button = button(value);
        button.setTextColor(danger);
        button.setBackground(pressable(roundStroke(dangerContainer, 12, danger, 1)));
        return button;
    }

    void setButtonEnabled(Button button, boolean enabled) {
        button.setEnabled(enabled);
        button.setAlpha(1f);
        button.setTextColor(enabled ? Color.WHITE : muted);
        button.setBackground(enabled
                ? pressable(round(accent, 12))
                : roundStroke(accentContainer, 12, outline, 1));
    }

    void styleSwitch(Switch control) {
        int[][] states = new int[][]{
                new int[]{android.R.attr.state_checked},
                new int[]{-android.R.attr.state_checked}
        };
        control.setShowText(false);
        control.setMinWidth(dp(50));
        control.setMinimumWidth(dp(50));
        control.setMinHeight(dp(44));
        control.setThumbTintList(new ColorStateList(states,
                new int[]{Color.WHITE, Color.WHITE}));
        control.setTrackTintList(new ColorStateList(states,
                new int[]{accent, Color.rgb(183, 199, 215)}));
    }

    void styleCheckBox(CheckBox control) {
        int[][] states = new int[][]{
                new int[]{android.R.attr.state_checked},
                new int[]{-android.R.attr.state_checked}
        };
        control.setButtonTintList(new ColorStateList(states,
                new int[]{accent, Color.rgb(150, 169, 188)}));
        control.setTextColor(text);
        control.setMinHeight(dp(48));
    }

    void styleInput(EditText input) {
        input.setTextColor(text);
        input.setHintTextColor(muted);
        input.setTextSize(14);
        input.setMinHeight(dp(48));
        input.setPadding(dp(13), dp(8), dp(13), dp(8));
        input.setBackground(roundStroke(Color.argb(236, 255, 255, 255), 12, outline, 1));
    }

    /** Shared feature header. The arrow slot also aligns non-expandable switches. */
    LinearLayout featureRow(String title, String description, Switch control) {
        LinearLayout row = new LinearLayout(activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(section(title, description), new LinearLayout.LayoutParams(0, -2, 1));
        styleSwitch(control);
        control.setContentDescription(title);
        row.addView(control, new LinearLayout.LayoutParams(-2, dp(44)));
        row.addView(new View(activity), new LinearLayout.LayoutParams(dp(28), dp(44)));
        return row;
    }

    Fold fold(Switch control, View content) { return new Fold(control, content); }

    final class Fold {
        final Switch control;
        final View content;
        final ImageButton arrow;
        boolean wasEnabled;
        Fold(Switch control, View content) {
            this.control = control; this.content = content;
            LinearLayout row = (LinearLayout) control.getParent();
            row.removeViewAt(row.getChildCount() - 1);
            arrow = new ImageButton(activity);
            arrow.setImageResource(R.drawable.ic_expand_more);
            arrow.setColorFilter(muted);
            arrow.setBackground(pressable(round(Color.TRANSPARENT, 12)));
            row.addView(arrow, new LinearLayout.LayoutParams(dp(28), dp(44)));
            arrow.setOnClickListener(v -> {
                if (!control.isChecked()) {
                    android.widget.Toast.makeText(activity, "请先开启功能", android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                show(content.getVisibility() != View.VISIBLE);
            });
            wasEnabled = control.isChecked(); show(wasEnabled);
        }
        void sync() {
            boolean enabled = control.isChecked();
            if (enabled != wasEnabled) show(enabled);
            wasEnabled = enabled;
        }
        void show(boolean expanded) {
            content.setVisibility(expanded ? View.VISIBLE : View.GONE);
            arrow.setRotation(expanded ? 180 : 0);
            arrow.setContentDescription(expanded ? "收起配置" : "展开配置");
        }
    }

    View divider() {
        View line = new View(activity);
        line.setBackgroundColor(divider);
        return line;
    }

    LinearLayout collapsible(String title, String description, View content,
            boolean initiallyExpanded) {
        LinearLayout outer = card();
        LinearLayout head = new LinearLayout(activity);
        head.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout copy = section(title, description);
        Button action = tonalButton(initiallyExpanded ? "收起" : "展开");
        action.setMinWidth(dp(60));
        head.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        head.addView(action, new LinearLayout.LayoutParams(-2, dp(48)));
        outer.addView(head, wrap());
        LinearLayout body = new LinearLayout(activity);
        body.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(-1, dp(1));
        dividerParams.setMargins(0, dp(10), 0, dp(10));
        body.addView(divider(), dividerParams);
        body.addView(content, wrap());
        body.setVisibility(initiallyExpanded ? View.VISIBLE : View.GONE);
        View.OnClickListener toggle = view -> {
            boolean expand = body.getVisibility() != View.VISIBLE;
            body.setVisibility(expand ? View.VISIBLE : View.GONE);
            action.setText(expand ? "收起" : "展开");
        };
        action.setOnClickListener(toggle);
        head.setClickable(true);
        head.setFocusable(true);
        head.setOnClickListener(toggle);
        outer.addView(body, wrap());
        return outer;
    }

    GradientDrawable round(int color, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radiusDp));
        return drawable;
    }

    GradientDrawable roundStroke(int color, int radiusDp, int strokeColor, int strokeDp) {
        GradientDrawable drawable = round(color, radiusDp);
        drawable.setStroke(dp(strokeDp), strokeColor);
        return drawable;
    }

    GradientDrawable glass(int radiusDp) {
        return roundStroke(Color.argb(230, 255, 255, 255), radiusDp, outline, 1);
    }

    Drawable pressable(Drawable content) {
        if (Build.VERSION.SDK_INT < 21) return content;
        return new RippleDrawable(ColorStateList.valueOf(Color.argb(38,
                Color.red(accent), Color.green(accent), Color.blue(accent))), content, null);
    }

    int dp(int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    int topAppInset() {
        // Actual window insets are applied to every page and change with bar height.
        return 0;
    }

    LinearLayout.LayoutParams wrap() { return new LinearLayout.LayoutParams(-1, -2); }

    LinearLayout.LayoutParams margins(int left, int top, int right, int bottom) {
        LinearLayout.LayoutParams params = wrap();
        params.setMargins(dp(left), dp(top), dp(right), dp(bottom));
        return params;
    }
}
