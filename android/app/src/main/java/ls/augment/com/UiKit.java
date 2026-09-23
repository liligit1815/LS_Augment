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
    final boolean dark;
    final AppearanceController appearance;

    // Sky blue + ice white roles. Cards remain translucent over the quiet gradient.
    final int background, backgroundEnd, rail, card, cardHigh, text, muted, accent,
            accentContainer, cyan, danger, dangerContainer, warning, divider, outline;

    UiKit(Activity activity) {
        this.activity = activity;
        appearance = new AppearanceController(activity);
        dark = appearance.dark;
        background = dark ? Color.rgb(12,24,41) : Color.rgb(232,244,255);
        backgroundEnd = dark ? Color.rgb(20,35,54) : Color.rgb(248,252,255);
        rail = dark ? Color.rgb(18,34,52) : Color.rgb(242,249,255);
        card = dark ? Color.rgb(27,45,65) : Color.rgb(251,253,255);
        cardHigh = dark ? Color.rgb(36,57,80) : Color.rgb(231,243,255);
        text = dark ? Color.rgb(232,242,255) : Color.rgb(20,35,58);
        muted = dark ? Color.rgb(163,182,205) : Color.rgb(100,116,139);
        accent = dark ? Color.rgb(114,187,255) : Color.rgb(31,116,197);
        accentContainer = dark ? Color.rgb(30,64,96) : Color.rgb(220,239,255);
        cyan = dark ? Color.rgb(99,219,186) : Color.rgb(13,151,119);
        danger = dark ? Color.rgb(255,153,165) : Color.rgb(190,52,64);
        dangerContainer = dark ? Color.rgb(82,39,52) : Color.rgb(255,233,236);
        warning = dark ? Color.rgb(239,193,109) : Color.rgb(157,99,0);
        divider = dark ? Color.rgb(50,72,95) : Color.rgb(218,230,242);
        outline = dark ? Color.rgb(66,89,115) : Color.rgb(199,217,234);
        applyWindow();
    }

    private void applyWindow() {
        Window window = activity.getWindow();
        window.setSoftInputMode((window.getAttributes().softInputMode
                & ~android.view.WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST)
                | android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        if (Build.VERSION.SDK_INT >= 30) window.setDecorFitsSystemWindows(false);
        window.setStatusBarColor(background);
        window.setNavigationBarColor(backgroundEnd);
        if (Build.VERSION.SDK_INT >= 26) {
            window.getDecorView().setSystemUiVisibility(
                    dark ? 0 : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                            | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
            window.setNavigationBarDividerColor(backgroundEnd);
        }
        if (Build.VERSION.SDK_INT >= 30 && window.getInsetsController() != null) {
            int lightBars = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                    | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            window.getInsetsController().setSystemBarsAppearance(dark ? 0 : lightBars, lightBars);
        }
        if (Build.VERSION.SDK_INT >= 29) {
            window.setStatusBarContrastEnforced(false);
            window.setNavigationBarContrastEnforced(false);
        }
    }

    Drawable backgroundDrawable() {
        GradientDrawable drawable = new GradientDrawable(
                GradientDrawable.Orientation.TL_BR,
                dark ? new int[]{Color.rgb(11,25,44), Color.rgb(17,32,51), backgroundEnd}
                        : new int[]{Color.rgb(225, 241, 255), Color.rgb(245, 250, 255), backgroundEnd});
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
        setContentView(scroll);
        applyGestureInset(scroll, 0);
        return page;
    }

    LinearLayout detailPage(String title, String scope) {
        if(embedded()){
            LinearLayout body=new LinearLayout(activity);body.setOrientation(LinearLayout.VERTICAL);
            setContentView(body);return body;
        }
        LinearLayout root=new LinearLayout(activity);root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(backgroundDrawable());
        LinearLayout head=header(title,true);head.setPadding(dp(10),dp(4),dp(12),dp(2));
        if(scope!=null)ScopeRestartDialog.addButton(activity,this,head,scope);
        root.addView(head,new LinearLayout.LayoutParams(-1,-2));root.addView(divider(),new LinearLayout.LayoutParams(-1,dp(1)));
        ScrollView scroll=new ScrollView(activity);scroll.setFillViewport(true);
        LinearLayout body=new LinearLayout(activity);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(dp(14),dp(10),dp(14),dp(26));
        scroll.addView(body,new ScrollView.LayoutParams(-1,-2));
        root.addView(adaptiveDetailBody(scroll,body),new LinearLayout.LayoutParams(-1,0,1));
        appearance.addStatus(this,body,title);
        setContentView(root);applyGestureInset(root,8);return body;
    }

    private java.util.function.Consumer<View> contentReceiver;
    void setContentReceiver(java.util.function.Consumer<View> receiver){contentReceiver=receiver;}
    boolean embedded(){return contentReceiver!=null;}
    void setContentView(View content) {
        if(contentReceiver!=null)contentReceiver.accept(content);
        else appearance.setContentView(this, content);
    }

    View adaptiveDetailBody(ScrollView scroll, LinearLayout body) {
        return appearance.detailBody(this, scroll, body);
    }

    void applyGestureInset(View view, int extraBottomDp) {
        applyGestureInset(view, extraBottomDp, true);
    }

    void applyGestureInset(View view, int extraBottomDp, boolean includeKeyboard) {
        if(embedded())return;
        if (Build.VERSION.SDK_INT < 20) return;
        final int originalBottom = view.getPaddingBottom(), originalTop = view.getPaddingTop();
        final int originalLeft = view.getPaddingLeft(), originalRight = view.getPaddingRight();
        view.setOnApplyWindowInsetsListener((target, insets) -> {
            int bottom,top,left,right;
            if(Build.VERSION.SDK_INT>=30){
                android.graphics.Insets bars=insets.getInsets(WindowInsets.Type.systemBars()|WindowInsets.Type.displayCutout());
                bottom=bars.bottom;top=bars.top;left=bars.left;right=bars.right;
                if(includeKeyboard)bottom=Math.max(bottom,insets.getInsets(WindowInsets.Type.ime()).bottom);
            }else{bottom=insets.getSystemWindowInsetBottom();top=insets.getSystemWindowInsetTop();left=insets.getSystemWindowInsetLeft();right=insets.getSystemWindowInsetRight();}
            int nextBottom=originalBottom+bottom+dp(extraBottomDp);
            boolean changed=target.getPaddingBottom()!=nextBottom;
            target.setPadding(originalLeft+left, originalTop+top, originalRight+right, nextBottom);
            if(includeKeyboard&&changed&&Build.VERSION.SDK_INT>=30&&insets.isVisible(WindowInsets.Type.ime()))
                target.post(()->{
                    View focused=target.findFocus();
                    if(focused instanceof EditText){
                        android.graphics.Rect rect=new android.graphics.Rect();focused.getDrawingRect(rect);
                        rect.top-=dp(32);rect.bottom+=dp(16);
                        focused.requestRectangleOnScreen(rect,false);
                    }
                });
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
        outer.setForeground(pressable(round(Color.TRANSPARENT, 22)));
        outer.setOnClickListener(click);
        AppearanceController.section(outer, title);

        outer.addView(featureTitle(title, description), wrap());
        if (status != null && !status.isEmpty()) {
            outer.addView(statusChip(status, accent), margins(0, 10, 0, 0));
        }
        return outer;
    }

    LinearLayout card() {
        if(embedded()){
            LinearLayout flat=new LinearLayout(activity);flat.setOrientation(LinearLayout.VERTICAL);
            flat.setPadding(0,dp(3),0,dp(3));return flat;
        }
        LinearLayout value = new LiquidGlassLayout(this, 22, true);
        value.setOrientation(LinearLayout.VERTICAL);
        value.setPadding(dp(12), dp(10), dp(12), dp(10));
        if (Build.VERSION.SDK_INT >= 21) value.setElevation(dp(3));
        if (Build.VERSION.SDK_INT >= 28) {
            value.setOutlineSpotShadowColor(0x203c86b8);
            value.setOutlineAmbientShadowColor(0x203c86b8);
        }
        return value;
    }

    LinearLayout section(String title, String description) {
        LinearLayout group = new LinearLayout(activity);
        group.setOrientation(LinearLayout.VERTICAL);
        AppearanceController.section(group, title);
        group.addView(featureTitle(title, description), wrap());
        return group;
    }

    /** A separate 44 dp target keeps help taps independent of the value or switch. */
    LinearLayout featureTitle(String title, String description) {
        return featureTitle(title, description, 12.5f);
    }

    LinearLayout featureTitle(String title, String description, float size) {
        TextView name = text(title, size, text, true);
        name.setMaxLines(3);
        name.setLineSpacing(dp(1), 1.04f);
        LinearLayout row = new LinearLayout(activity) {
            @Override protected void onMeasure(int widthSpec, int heightSpec) {
                if (View.MeasureSpec.getMode(widthSpec) != View.MeasureSpec.UNSPECIFIED)
                    name.setMaxWidth(Math.max(dp(20), View.MeasureSpec.getSize(widthSpec) - dp(38)));
                super.onMeasure(widthSpec, heightSpec);
            }
        };
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(name, new LinearLayout.LayoutParams(-2, -2));
        if (description != null && !description.trim().isEmpty())
            row.addView(helpButton(title, description), new LinearLayout.LayoutParams(dp(36), dp(44)));
        return row;
    }

    ImageButton helpButton(String title, String description) {
        ImageButton button = new ImageButton(activity);
        button.setImageDrawable(new FeatureHelpIcon(accent, dp(14)));
        button.setScaleType(ImageView.ScaleType.CENTER);
        button.setBackground(pressable(round(Color.TRANSPARENT, 20)));
        button.setContentDescription("查看" + title + "说明");
        button.setTooltipText("功能说明");
        button.setFocusable(true);
        button.setOnClickListener(v -> showFeatureHelp(title, description));
        return button;
    }

    void showFeatureHelp(String title, String description) {
        glassDialog(title, description, "知道了", null, null);
    }

    android.app.Dialog glassDialog(String title, String message, String positive,
            Runnable action, String negative) {
        TextView detail = text(message, 13, text, false);
        detail.setLineSpacing(dp(4), 1.1f);
        detail.setTextIsSelectable(true);
        return glassDialog(title, detail, positive, action, negative);
    }

    /** Dialog content samples the real page beneath it; native opaque panels are omitted. */
    android.app.Dialog glassDialog(String title, View content, String positive,
            Runnable action, String negative) {
        android.app.Dialog dialog = new android.app.Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LiquidGlassLayout body = new LiquidGlassLayout(this, 28);
        body.setTag("liquid-glass-dialog");
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(dp(22), dp(24), dp(22), dp(20));
        TextView heading = text(title, 18, text, true);
        heading.setAccessibilityHeading(true);
        body.addView(heading, wrap());
        ScrollView scroll = new ScrollView(activity) {
            @Override protected void onMeasure(int widthSpec, int heightSpec) {
                int max = Math.round(getResources().getDisplayMetrics().heightPixels * .48f);
                if (View.MeasureSpec.getMode(heightSpec) != View.MeasureSpec.UNSPECIFIED)
                    max = Math.min(max, View.MeasureSpec.getSize(heightSpec));
                super.onMeasure(widthSpec, View.MeasureSpec.makeMeasureSpec(max, View.MeasureSpec.AT_MOST));
            }
        };
        scroll.setVerticalScrollBarEnabled(false);
        scroll.addView(content);
        body.addView(scroll, margins(0, 16, 0, 22));
        LinearLayout actions = new LinearLayout(activity);
        actions.setGravity(Gravity.CENTER_VERTICAL);
        if (negative != null) {
            Button cancel = button(negative);
            cancel.setBackground(pressable(roundStroke(dark ? 0x544c7094 : 0x68ffffff, 18, outline, 1)));
            cancel.setOnClickListener(v -> dialog.cancel());
            LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(0, -2, 1);
            cancel.setMinimumHeight(dp(48));
            p.setMargins(0, 0, positive == null ? 0 : dp(8), 0);
            actions.addView(cancel, p);
        }
        if (positive != null) {
        Button confirm = button(positive);
        confirm.setTag("glass-dialog-confirm");
        confirm.setTextColor(accent);
        confirm.setBackground(pressable(roundStroke(dark ? 0xa535638c : 0xb0b9e1ff, 18, accent, 1)));
        confirm.setOnClickListener(v -> { dialog.dismiss(); if (action != null) action.run(); });
        confirm.setMinimumHeight(dp(48));
        actions.addView(confirm, new LinearLayout.LayoutParams(0, -2, 1));
        }
        body.addView(actions, wrap());
        dialog.setContentView(body);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(Color.TRANSPARENT));
            window.addFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(dark ? .28f : .12f);
        }
        dialog.show();
        if (window != null) window.setLayout(Math.min(dp(420),
                activity.getResources().getDisplayMetrics().widthPixels - dp(36)), -2);
        body.refreshBackdrop();
        return dialog;
    }

    android.app.Dialog choiceDialog(String title, String[] names, String[] descriptions,
            java.util.function.IntConsumer selected) {
        LinearLayout choices = new LinearLayout(activity);
        choices.setOrientation(LinearLayout.VERTICAL);
        final android.app.Dialog[] current = new android.app.Dialog[1];
        for (int i = 0; i < names.length; i++) {
            final int index = i;
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setPadding(dp(14), dp(12), dp(14), dp(12));
            row.setMinimumHeight(dp(48));
            row.setBackground(pressable(roundStroke(dark ? 0x544c7094 : 0x68ffffff, 12, outline, 1)));
            row.addView(text(names[i], 14, text, true));
            if (descriptions != null && i < descriptions.length) {
                TextView detail = text(descriptions[i], 12, muted, false);
                detail.setLineSpacing(dp(2), 1.05f);
                row.addView(detail, margins(0, 6, 0, 0));
            }
            row.setFocusable(true);
            row.setOnClickListener(v -> { current[0].dismiss(); selected.accept(index); });
            choices.addView(row, margins(0, i == 0 ? 0 : 8, 0, 0));
        }
        current[0] = glassDialog(title, choices, null, null, "取消");
        return current[0];
    }

    /** Keep selection callbacks and the compact inline value, sharing the dialog surface on tap. */
    android.widget.Spinner choiceSpinner(String title) {
        return choiceSpinner(title,null);
    }
    android.widget.Spinner choiceSpinner(String title,java.util.function.IntFunction<String> description) {
        android.widget.Spinner spinner = new android.widget.Spinner(activity) {
            @Override public boolean performClick() {
                if (!isEnabled() || getAdapter() == null || getAdapter().getCount() == 0) return true;
                String[] names = new String[getAdapter().getCount()];
                for (int i = 0; i < names.length; i++)
                    names[i] = String.valueOf(getAdapter().getItem(i)) + (i == getSelectedItemPosition() ? " · 当前" : "");
                CharSequence label = getContentDescription();
                String[] descriptions=description==null?null:new String[names.length];
                if(descriptions!=null)for(int i=0;i<descriptions.length;i++)descriptions[i]=description.apply(i);
                choiceDialog(label == null || label.length() == 0 ? title : label.toString(), names, descriptions, this::setSelection);
                return true;
            }
        };
        spinner.setBackgroundTintList(ColorStateList.valueOf(accent));
        return spinner;
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
        view.setTextSize(size >= 18 && size < 24 ? size - 2 : size >= 14 && size < 18 ? size - 1.5f : size);
        view.setTextColor(color);
        view.setIncludeFontPadding(false);
        view.setTypeface(Typeface.create("sans-serif", bold
                ? Typeface.BOLD : Typeface.NORMAL));
        return view;
    }

    Button button(String value) {
        Button button = new Button(activity);
        button.setText(value);
        button.setTextSize(12.5f);
        button.setTextColor(text);
        button.setAllCaps(false);
        button.setMinHeight(dp(44));
        button.setMinimumHeight(dp(44));
        button.setPadding(dp(13), dp(7), dp(13), dp(7));
        button.setBackground(pressable(roundStroke(dark ? Color.argb(226,27,45,65) : Color.argb(226, 255, 255, 255),
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
                new int[]{accent, dark ? Color.rgb(77,100,127) : Color.rgb(183, 199, 215)}));
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
        input.setTextSize(12.5f);
        input.setMinHeight(dp(48));
        input.setPadding(dp(13), dp(8), dp(13), dp(8));
        input.setBackground(roundStroke(dark ? Color.argb(236,27,45,65) : Color.argb(236, 255, 255, 255), 12, outline, 1));
    }

    /** Shared feature header. The arrow slot also aligns non-expandable switches. */
    LinearLayout featureRow(String title, String description, Switch control) {
        LinearLayout row = new LinearLayout(activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(section(title, description), new LinearLayout.LayoutParams(0, -2, 1));
        styleSwitch(control);
        control.setContentDescription(title);
        row.addView(control, new LinearLayout.LayoutParams(-2, dp(44)));
        row.addView(switchSlot(), new LinearLayout.LayoutParams(dp(28), dp(44)));
        return row;
    }

    View switchSlot() {
        View slot = new View(activity);
        slot.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        slot.setClickable(false); slot.setFocusable(false);
        return slot;
    }

    Fold fold(Switch control, View content) { return new Fold(control, content); }
    Fold fold(Switch control, View content, boolean accessibleWhileOff) {
        return new Fold(control, content, accessibleWhileOff);
    }

    final class Fold {
        final Switch control;
        final View content;
        final ImageButton arrow;
        boolean wasEnabled;
        final boolean accessibleWhileOff;
        Fold(Switch control, View content) {
            this(control, content, false);
        }
        Fold(Switch control, View content, boolean accessibleWhileOff) {
            this.accessibleWhileOff = accessibleWhileOff;
            this.control = control; this.content = content;
            LinearLayout row = (LinearLayout) control.getParent();
            row.removeViewAt(row.getChildCount() - 1);
            arrow = new ImageButton(activity);
            arrow.setImageResource(R.drawable.ic_expand_more);
            arrow.setColorFilter(muted);
            arrow.setBackground(pressable(round(Color.TRANSPARENT, 12)));
            row.addView(arrow, new LinearLayout.LayoutParams(dp(28), dp(44)));
            arrow.setOnClickListener(v -> {
                if (!accessibleWhileOff && !control.isChecked()) {
                    android.widget.Toast.makeText(activity, "请先开启功能", android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                show(content.getVisibility() != View.VISIBLE);
            });
            wasEnabled = control.isChecked() && control.isEnabled(); show(false);
        }
        void sync() {
            boolean enabled = control.isChecked() && control.isEnabled();
            if (enabled != wasEnabled) show(enabled);
            wasEnabled = enabled;
            arrow.setEnabled(control.isEnabled() && (accessibleWhileOff || enabled));
            arrow.setAlpha(arrow.isEnabled() ? 1f : .34f);
        }
        void show(boolean expanded) {
            expanded = expanded && (accessibleWhileOff || control.isChecked()) && control.isEnabled();
            content.setVisibility(expanded ? View.VISIBLE : View.GONE);
            arrow.setRotation(expanded ? 180 : 0);
            arrow.setContentDescription(expanded ? "收起配置" : "展开配置");
            arrow.setEnabled((accessibleWhileOff || control.isChecked()) && control.isEnabled());
            arrow.setAlpha(arrow.isEnabled() ? 1f : .34f);
        }
    }

    View divider() {
        View line = new View(activity);
        line.setBackgroundColor(divider);
        return line;
    }

    LinearLayout foldingCard(String title, View content, boolean initiallyExpanded) {
        return foldingGroup(title,content,initiallyExpanded,true);
    }

    LinearLayout foldingSection(String title, View content, boolean initiallyExpanded) {
        return foldingGroup(title,content,initiallyExpanded,false);
    }

    private LinearLayout foldingGroup(String title, View content, boolean initiallyExpanded,boolean ownCard) {
        LinearLayout outer=ownCard?card():new LinearLayout(activity),head=new LinearLayout(activity);
        outer.setOrientation(LinearLayout.VERTICAL);head.setGravity(Gravity.CENTER_VERTICAL);
        head.addView(text(title,13,text,true),new LinearLayout.LayoutParams(0,-2,1));
        ImageButton arrow=new ImageButton(activity);arrow.setImageResource(R.drawable.ic_expand_more);arrow.setColorFilter(muted);
        arrow.setBackground(pressable(round(Color.TRANSPARENT,12)));head.addView(arrow,new LinearLayout.LayoutParams(dp(44),dp(44)));
        outer.addView(head,wrap());outer.addView(content,wrap());content.setVisibility(initiallyExpanded?View.VISIBLE:View.GONE);
        Runnable update=()->{boolean open=content.getVisibility()==View.VISIBLE;arrow.setRotation(open?180:0);arrow.setContentDescription((open?"收起":"展开")+title);};
        View.OnClickListener toggle=v->{content.setVisibility(content.getVisibility()==View.VISIBLE?View.GONE:View.VISIBLE);update.run();};
        arrow.setOnClickListener(toggle);head.setOnClickListener(toggle);update.run();return outer;
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

    Drawable glass(int radiusDp) {
        // Quiet content surfaces; real optical controls use LiquidGlassLayout.
        return roundStroke(dark ? 0xe6253b54 : 0xcff7fcff, radiusDp,
                dark ? 0x6653789c : 0xddffffff, 1);
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
