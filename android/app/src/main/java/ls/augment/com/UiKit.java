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
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/** Ice Blue settings design system shared by every LS_Augment screen. */
final class UiKit {
    // docs/红魔Duo-UI规范.md: one 8–12dp gap below breadcrumbs, never Home alignment padding.
    static final int DETAIL_CONTENT_GAP_DP = 8;
    private static final int FEATURE_CONTENT_INSET_DP = 8;
    final Activity activity;
    final boolean dark;
    final boolean angularCards;
    final AppearanceController appearance;
    boolean flatCards;
    private Runnable backAction;
    private final AtomicWorkbenchHostDialogs hostDialogs = new AtomicWorkbenchHostDialogs();
    void setHostInputObserver(java.util.function.Consumer<Boolean> observer) { hostDialogs.setObserver(observer); }
    void closeHostDialogs() { hostDialogs.close(); }

    void setBackAction(Runnable action) { backAction = action; }

    // Sky blue + ice white roles. Cards remain translucent over the quiet gradient.
    final int background, backgroundEnd, rail, card, cardHigh, text, muted, accent,
            accentContainer, cyan, danger, dangerContainer, warning, divider, outline;

    UiKit(Activity activity) {
        this.activity = activity;
        angularCards = new AppConfig(activity).getBoolean(AppearanceOptions.ANGULAR_CARDS);
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
        window.setDecorFitsSystemWindows(false);
        boolean configurationAction=activity instanceof ConfigTransferActivity;
        window.setStatusBarColor(configurationAction?Color.TRANSPARENT:background);
        window.setNavigationBarColor(configurationAction?Color.TRANSPARENT:backgroundEnd);
        {
            window.getDecorView().setSystemUiVisibility(
                    dark ? 0 : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                            | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
            window.setNavigationBarDividerColor(configurationAction?Color.TRANSPARENT:backgroundEnd);
        }
        if (window.getInsetsController() != null) {
            int lightBars = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                    | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            window.getInsetsController().setSystemBarsAppearance(dark ? 0 : lightBars, lightBars);
        }
        {
            window.setStatusBarContrastEnforced(false);
            window.setNavigationBarContrastEnforced(false);
        }
    }

    /** Floating windows keep the host's icon colors when they take and return focus. */
    private void inheritSystemBarAppearance(Window window) {
        Window host = activity.getWindow();
        window.addFlags(android.view.WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.clearFlags(android.view.WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS
                | android.view.WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
        window.setStatusBarColor(host.getStatusBarColor());
        window.setNavigationBarColor(host.getNavigationBarColor());
        window.setNavigationBarDividerColor(host.getNavigationBarDividerColor());
        {
            window.setStatusBarContrastEnforced(host.isStatusBarContrastEnforced());
            window.setNavigationBarContrastEnforced(host.isNavigationBarContrastEnforced());
        }
        {
            int lightBars = View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                    | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            View decor = window.getDecorView();
            decor.setSystemUiVisibility((decor.getSystemUiVisibility() & ~lightBars)
                    | (host.getDecorView().getSystemUiVisibility() & lightBars));
        }
        if (window.getInsetsController() != null
                && host.getInsetsController() != null) {
            int lightBars = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                    | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            window.getInsetsController().setSystemBarsAppearance(
                    host.getInsetsController().getSystemBarsAppearance() & lightBars, lightBars);
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
        LinearLayout root=detailChrome(title,scope);
        ScrollView scroll=new ScrollView(activity);scroll.setFillViewport(true);
        scroll.setTag("detail-scroll");scroll.setVerticalScrollBarEnabled(false);
        LinearLayout body=new LinearLayout(activity);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(dp(16),0,dp(16),dp(32));
        scroll.addView(body,new ScrollView.LayoutParams(-1,-2));
        root.addView(adaptiveDetailBody(scroll,body),new LinearLayout.LayoutParams(-1,0,1));
        appearance.addStatus(this,body,title);
        setContentView(root);applyGestureInset(root,8);return body;
    }

    LinearLayout brandHeading(){
        LinearLayout heading=new LinearLayout(activity);heading.setGravity(Gravity.BOTTOM);heading.setBaselineAligned(true);
        heading.addView(text("红魔Duo",30,text,true),new LinearLayout.LayoutParams(-2,-2));
        LinearLayout.LayoutParams phrase=new LinearLayout.LayoutParams(-2,-2);phrase.leftMargin=dp(12);
        heading.addView(text("让红魔更顺手",14,muted,false),phrase);return heading;
    }
    LinearLayout detailChrome(String fallbackTitle,String scope){
        ModuleNavigation.register(activity);
        LinearLayout root=new LinearLayout(activity);root.setOrientation(LinearLayout.VERTICAL);root.setBackground(backgroundDrawable());
        LinearLayout head=header("",true);head.setTag("detail-header");head.setPadding(dp(16),dp(8),dp(16),dp(8));
        if(scope!=null)ScopeRestartDialog.addButton(activity,this,head,scope);
        root.addView(head,new LinearLayout.LayoutParams(-1,dp(60)));
        String route=ModuleNavigation.route(activity);if(route==null)route="home";
        android.widget.HorizontalScrollView path=new android.widget.HorizontalScrollView(activity);
        path.setTag("page-path");path.setContentDescription("页面路径");path.setHorizontalScrollBarEnabled(false);
        path.setPadding(dp(20),0,dp(20),0);path.setClipToPadding(false);
        LinearLayout crumbs=new LinearLayout(activity);crumbs.setGravity(Gravity.CENTER_VERTICAL);
        java.util.List<String> routes=ModuleHierarchy.path(route);
        for(int i=0;i<routes.size();i++){
            String destination=routes.get(i);boolean current=i==routes.size()-1;
            if(i>0){ImageView arrow=new ImageView(activity);arrow.setImageResource(R.drawable.ic_chevron_right);arrow.setColorFilter(muted);arrow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);LinearLayout.LayoutParams gap=new LinearLayout.LayoutParams(dp(12),dp(12));gap.setMargins(dp(7),0,dp(7),0);crumbs.addView(arrow,gap);}
            String title=ModuleHierarchy.title(destination);if(current&&title.isEmpty())title=fallbackTitle;
            TextView label=text(title,13.225f,current?text:accent,current);label.setTextSize(13.225f);label.setGravity(Gravity.CENTER_VERTICAL);label.setSingleLine(true);
            label.setTag("breadcrumb:"+destination);
            if(current){label.setAccessibilityHeading(true);label.setContentDescription(title+"，当前页面");}
            else{label.setFocusable(true);label.setBackground(pressable(round(Color.TRANSPARENT,8)));label.setOnClickListener(v->ModuleNavigation.ancestor(activity,destination));}
            crumbs.addView(label,new LinearLayout.LayoutParams(-2,dp(44)));
        }
        path.addView(crumbs);root.addView(path,new LinearLayout.LayoutParams(-1,dp(44)));
        // Keep the current title inside the trailing inset even when the path overflows.
        path.post(()->path.scrollTo(Math.max(0,crumbs.getWidth()+path.getPaddingLeft()
                +path.getPaddingRight()-path.getWidth()),0));
        View gap=new View(activity);gap.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        root.addView(gap,new LinearLayout.LayoutParams(1,dp(DETAIL_CONTENT_GAP_DP)));
        return root;
    }

    void addDetailSectionTitle(LinearLayout body,String title){
        TextView label=text(title,12,muted,true);label.setTag("section-title:"+title);label.setAccessibilityHeading(true);
        // detailChrome already owns the first section's top gap.
        body.addView(label,margins(3,body.getChildCount()==0?0:8,0,16));
    }

    LinearLayout preferenceCard(){LinearLayout value=card();value.setPadding(dp(14),0,dp(14),0);value.setTag("preference-card");return value;}
    LinearLayout parameterInputGroup(){
        return parameterInputGroup(false);
    }
    /** Labelled parameters share the text edge of sibling feature switches. */
    LinearLayout parameterInputGroup(boolean alignFeatureRow){
        LinearLayout group=new LinearLayout(activity);group.setOrientation(LinearLayout.VERTICAL);
        group.setTag(R.id.parameter_input_group,Boolean.TRUE);
        group.setPadding(alignFeatureRow?dp(FEATURE_CONTENT_INSET_DP):0,0,0,dp(8));return group;
    }
    LinearLayout preferenceRow(String id,String title,String summary,Runnable action){
        LinearLayout row=groupRow();row.setTag("navigation:"+id);row.setPadding(0,dp(4),0,dp(4));
        ImageView icon=new ImageView(activity);icon.setImageResource(navigationIcon(id));icon.setColorFilter(accent);icon.setPadding(dp(8),dp(8),dp(8),dp(8));icon.setBackground(round(dark?0x402b82c8:0x407dbcf2,12));icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams ip=new LinearLayout.LayoutParams(dp(36),dp(36));ip.rightMargin=dp(12);row.addView(icon,ip);
        LinearLayout copy=new LinearLayout(activity);copy.setOrientation(LinearLayout.VERTICAL);
        LinearLayout titleRow=new LinearLayout(activity);titleRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView name=text(title,15,text,true);name.setSingleLine(true);name.setEllipsize(android.text.TextUtils.TruncateAt.END);titleRow.addView(name,new LinearLayout.LayoutParams(0,-2,1));
        TextView state=text("",12,accent,false);state.setTag("setting-count:"+id);state.setVisibility(View.GONE);titleRow.addView(state);copy.addView(titleRow,wrap());
        if(summary!=null&&!summary.isEmpty()){TextView detail=text(summary,12,muted,false);detail.setSingleLine(true);detail.setEllipsize(android.text.TextUtils.TruncateAt.END);copy.addView(detail,margins(0,3,6,0));}
        row.addView(copy,new LinearLayout.LayoutParams(0,-2,1));
        ImageView arrow=new ImageView(activity);arrow.setImageResource(R.drawable.ic_chevron_right);arrow.setColorFilter(muted);arrow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);row.addView(arrow,new LinearLayout.LayoutParams(dp(18),dp(18)));
        row.setClickable(true);row.setFocusable(true);row.setForeground(pressable(round(Color.TRANSPARENT,12)));row.setOnClickListener(v->action.run());return row;
    }
    private int navigationIcon(String route){
        String id=route.substring(route.lastIndexOf('/')+1);
        if(route.startsWith("status_surface/")){
            switch(id){case "main":return R.drawable.ice_app_window;case "lock":return R.drawable.ice_moon;case "notification":return R.drawable.ice_bell;case "control":return R.drawable.ice_layout_grid;}
        }
        if(route.startsWith("asset/")){
            if(id.startsWith("wifi")||id.startsWith("secondary_wifi"))return R.drawable.ice_wifi;
            if(id.startsWith("mobile")||id.startsWith("dual_signal"))return R.drawable.ice_signal;
            if(id.startsWith("battery")||id.startsWith("connectivity"))return R.drawable.ice_battery_full;
            if(id.equals("clock"))return R.drawable.ice_clock;
            if(id.equals("notifications"))return R.drawable.ice_bell;
        }
        switch(id){
            case "status_layout":case "statusbar":return R.drawable.ice_smartphone;
            case "status_assets":case "status_resources":case "theme":case "collab_theme":return R.drawable.ice_palette;
            case "status_arrangement":case "status_surfaces":return R.drawable.ice_layout_grid;
            case "status_clock":return R.drawable.ice_clock;
            case "status_notifications":return R.drawable.ice_bell;
            case "status_metrics":return R.drawable.ice_heart_pulse;
            case "status_network":return R.drawable.ice_signal;
            case "competitive_key":return R.drawable.ice_gamepad2;
            case "status_battery":return R.drawable.ice_battery_full;
            case "status_icons":return R.drawable.ice_layers;
            case "primary_interaction":return R.drawable.ice_power;
            case "lockscreen":return R.drawable.ice_moon;
            case "aod":case "desktop_clock":return R.drawable.ice_clock;
            case "audio":case "audio_gain":case "volume_panel":return R.drawable.ice_volume2;
            case "connections":return R.drawable.ice_wifi;
            case "installer":case "download":case "update-link":case "update":return R.drawable.ice_download;
            case "system":case "default_apps":return R.drawable.ice_shield;
            case "freeform":case "launcher":case "launcher_custom":return R.drawable.ice_app_window;
            case "shoulder":case "combo":case "performance":return R.drawable.ice_gamepad2;
            case "ai":case "nfc":case "capture":return R.drawable.ice_smartphone;
            case "fan":return R.drawable.ice_fan;
            case "collab_fingerprint":return R.drawable.ice_fingerprint;
            case "collab_charging":return R.drawable.ice_battery_full;
            case "collab_audio":return R.drawable.ice_audio_lines;
            case "health":return R.drawable.ice_heart_pulse;
            case "display_time":return R.drawable.ice_clock;
            case "developer":case "usb":case "mtp":return R.drawable.ice_usb;
            case "weather":case "quicksettings_more":return R.drawable.ice_sun;
            case "quicksettings":case "launcher_grid":return R.drawable.ice_layout_grid;
            case "game_capture":return R.drawable.ice_bell;
            default:return R.drawable.ice_layers;
        }
    }

    private java.util.function.Consumer<View> contentReceiver;
    private final java.util.Map<String,java.util.function.Supplier<Boolean>> foldValues=new java.util.LinkedHashMap<>();
    private final java.util.Map<String,java.util.function.Consumer<Boolean>> foldSetters=new java.util.LinkedHashMap<>();
    void saveState(android.os.Bundle state){android.os.Bundle values=new android.os.Bundle();for(String key:foldValues.keySet())values.putBoolean(key,foldValues.get(key).get());state.putBundle("ui-folds",values);}
    void restoreState(android.os.Bundle state){android.os.Bundle values=state==null?null:state.getBundle("ui-folds");if(values==null)return;for(String key:values.keySet())if(foldSetters.containsKey(key))foldSetters.get(key).accept(values.getBoolean(key));}
    void setGroupExpanded(String title,boolean expanded){
        java.util.function.Consumer<Boolean> setter=foldSetters.get("group:"+title);
        if(setter!=null)setter.accept(expanded);
    }
    void setContentReceiver(java.util.function.Consumer<View> receiver){contentReceiver=receiver;}
    boolean embedded(){return contentReceiver!=null;}
    void setContentView(View content) {
        compactFeatureCards(content);
        if(contentReceiver!=null)contentReceiver.accept(content);
        else {appearance.setContentView(this, content);SearchResultHighlight.attach(this,content);}
    }
    private void compactFeatureCards(View view){
        if(!(view instanceof android.view.ViewGroup))return;
        android.view.ViewGroup group=(android.view.ViewGroup)view;
        for(int i=0;i<group.getChildCount();i++){
            View child=group.getChildAt(i);
            if(view instanceof LiquidGlassLayout&&"feature-row".equals(child.getTag()))view.setPadding(view.getPaddingLeft(),dp(2),view.getPaddingRight(),dp(2));
            compactFeatureCards(child);
        }
    }

    View adaptiveDetailBody(ScrollView scroll, LinearLayout body) {
        return appearance.detailBody(this, scroll, body);
    }

    void applyGestureInset(View view, int extraBottomDp) {
        applyGestureInset(view, extraBottomDp, true);
    }

    void applyGestureInset(View view, int extraBottomDp, boolean includeKeyboard) {
        if(embedded())return;
        installGestureInset(view,extraBottomDp,includeKeyboard);
    }

    private void installGestureInset(View view, int extraBottomDp, boolean includeKeyboard) {
        {}
        final int originalBottom = view.getPaddingBottom(), originalTop = view.getPaddingTop();
        final int originalLeft = view.getPaddingLeft(), originalRight = view.getPaddingRight();
        view.setOnApplyWindowInsetsListener((target, insets) -> {
            int bottom,top,left,right;
            {
                android.graphics.Insets bars=insets.getInsets(WindowInsets.Type.systemBars()|WindowInsets.Type.displayCutout());
                bottom=bars.bottom;top=bars.top;left=bars.left;right=bars.right;
                if(includeKeyboard)bottom=Math.max(bottom,insets.getInsets(WindowInsets.Type.ime()).bottom);
            }
            int nextBottom=originalBottom+bottom+dp(extraBottomDp);
            boolean changed=target.getPaddingBottom()!=nextBottom;
            target.setPadding(originalLeft+left, originalTop+top, originalRight+right, nextBottom);
            if(includeKeyboard&&changed&&insets.isVisible(WindowInsets.Type.ime()))
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
            button.setBackground(pressable(controlGlass(button,22,IceGlassControlDrawable.NEUTRAL)));
            button.setContentDescription("返回上一页");
            button.setOnClickListener(view -> {
                if (backAction != null) backAction.run();
                else activity.onBackPressed();
            });
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

    LinearLayout groupRow() {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(48));
        return row;
    }

    int surfaceRadiusDp(int roundedRadius) { return angularCards ? 4 : Math.max(26, roundedRadius); }

    LinearLayout card() {
        if(embedded()||flatCards){
            LinearLayout flat=new LinearLayout(activity);flat.setOrientation(LinearLayout.VERTICAL);
            flat.setPadding(0,dp(3),0,dp(3));return flat;
        }
        LinearLayout value = new LiquidGlassLayout(this, 4, true);
        value.setOrientation(LinearLayout.VERTICAL);
        value.setPadding(dp(16), dp(12), dp(16), dp(12));
        value.setElevation(dp(3));
        {
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
        return featureTitle(title, description, 14.5f);
    }

    LinearLayout featureTitle(String title, String description, float size) {
        TextView name = text(title, size, text, true);
        name.setMaxLines(3);
        name.setLineSpacing(dp(1), 1.04f);
        LinearLayout row = new LinearLayout(activity) {
            @Override protected void onMeasure(int widthSpec, int heightSpec) {
                if (View.MeasureSpec.getMode(widthSpec) != View.MeasureSpec.UNSPECIFIED)
                    name.setMaxWidth(Math.max(dp(20), View.MeasureSpec.getSize(widthSpec)
                            - (getChildCount()>0&&getChildAt(getChildCount()-1) instanceof ImageButton?dp(25):0)
                            - (iceIcon(title)!=0?dp(46):0)));
                super.onMeasure(widthSpec, heightSpec);
            }
        };
        row.setGravity(Gravity.CENTER_VERTICAL);
        int glyph=iceIcon(title);
        if(glyph!=0){ImageView icon=new ImageView(activity);icon.setImageResource(glyph);icon.setColorFilter(accent);
            icon.setPadding(dp(9),dp(9),dp(9),dp(9));icon.setBackground(round(dark?0x402b82c8:0x407dbcf2,12));
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(dp(36),dp(36));p.rightMargin=dp(10);row.addView(icon,p);}
        row.addView(name, new LinearLayout.LayoutParams(0, -2, 1));
        if (description != null && !description.trim().isEmpty())
            row.addView(helpButton(title, description), new LinearLayout.LayoutParams(dp(25), dp(44)));
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
        android.app.Dialog dialog = hostDialogs.create(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LiquidGlassLayout body = new LiquidGlassLayout(this, 4);
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
        LinearLayout.LayoutParams scrollParams=margins(0,16,0,22);
        scrollParams.weight=1;
        body.addView(scroll, scrollParams);
        LinearLayout actions = new LinearLayout(activity);
        actions.setGravity(Gravity.CENTER_VERTICAL);
        if (negative != null) {
            Button cancel = button(negative);
            cancel.setBackground(pressable(controlGlass(cancel,18,IceGlassControlDrawable.NEUTRAL)));
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
        confirm.setBackground(pressable(controlGlass(confirm,18,IceGlassControlDrawable.TONAL)));
        confirm.setOnClickListener(v -> { dialog.dismiss(); if (action != null) action.run(); });
        confirm.setMinimumHeight(dp(48));
        actions.addView(confirm, new LinearLayout.LayoutParams(0, -2, 1));
        }
        body.addView(actions, wrap());
        // The native dim policy forces white status icons outside a small dialog's frame.
        // Keep its visible panel compact, but let the transparent window include the bars.
        FrameLayout shell=new FrameLayout(activity){
            private boolean outsideGesture;
            @Override protected void onMeasure(int widthSpec,int heightSpec){
                FrameLayout.LayoutParams panel=(FrameLayout.LayoutParams)body.getLayoutParams();
                panel.width=Math.min(dp(420),Math.max(0,View.MeasureSpec.getSize(widthSpec)
                        -getPaddingLeft()-getPaddingRight()-dp(36)));
                super.onMeasure(widthSpec,heightSpec);
            }
            @Override public boolean dispatchTouchEvent(MotionEvent event){
                boolean outside=event.getX()<body.getLeft()||event.getX()>body.getRight()
                        ||event.getY()<body.getTop()||event.getY()>body.getBottom();
                if(event.getActionMasked()==MotionEvent.ACTION_DOWN)outsideGesture=outside;
                // Consume DOWN so the parent keeps routing this outside gesture to the shell.
                if(outsideGesture){
                    if(event.getActionMasked()==MotionEvent.ACTION_UP){
                        outsideGesture=false;
                        if(outside){
                            MotionEvent touch=MotionEvent.obtain(event);touch.setAction(MotionEvent.ACTION_OUTSIDE);
                            int edge=-android.view.ViewConfiguration.get(dialog.getContext()).getScaledWindowTouchSlop()-1;
                            touch.setLocation(edge,edge);
                            try{dialog.onTouchEvent(touch);}finally{touch.recycle();}
                        }
                    }else if(event.getActionMasked()==MotionEvent.ACTION_CANCEL)outsideGesture=false;
                    return true;
                }
                return super.dispatchTouchEvent(event);
            }
        };
        shell.setTag("glass-dialog-window");
        shell.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        shell.addView(body,new FrameLayout.LayoutParams(-2,-2,Gravity.CENTER));
        installGestureInset(shell,0,true);
        dialog.setContentView(shell);
        dialog.setCanceledOnTouchOutside(true);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(Color.TRANSPARENT));
            window.addFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(dark ? .28f : .12f);
            {
                window.setDecorFitsSystemWindows(false);
                android.view.WindowManager.LayoutParams attributes=window.getAttributes();
                attributes.setFitInsetsTypes(0);
                window.setAttributes(attributes);
            }
            window.setSoftInputMode((window.getAttributes().softInputMode
                    & ~android.view.WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST)
                    | android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
            window.setLayout(-1,-1);
            inheritSystemBarAppearance(window);
        }
        dialog.show();
        body.refreshBackdrop();
        return dialog;
    }

    android.app.Dialog choiceDialog(String title, String[] names, String[] descriptions,
            java.util.function.IntConsumer selected) {
        return choiceDialog(title,names,descriptions,null,selected);
    }
    android.app.Dialog choiceDialog(String title, String[] names, String[] descriptions,
            java.util.function.IntFunction<View> preview,java.util.function.IntConsumer selected) {
        LinearLayout choices = new LinearLayout(activity);
        choices.setOrientation(LinearLayout.VERTICAL);
        final android.app.Dialog[] current = new android.app.Dialog[1];
        for (int i = 0; i < names.length; i++) {
            final int index = i;
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setPadding(dp(14), dp(12), dp(14), dp(12));
            row.setMinimumHeight(dp(48));
            row.setTag("choice-option:"+index);
            row.setBackground(pressable(roundStroke(dark ? 0x544c7094 : 0x68ffffff, 12, outline, 1)));
            row.addView(text(names[i], 14, text, true));
            if (descriptions != null && i < descriptions.length) {
                TextView detail = text(descriptions[i], 12, muted, false);
                detail.setLineSpacing(dp(2), 1.05f);
                row.addView(detail, margins(0, 6, 0, 0));
            }
            if(preview!=null){
                View sample=preview.apply(index);
                if(sample!=null)row.addView(sample,margins(0,6,0,0));
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
        return choiceSpinner(title,description,null);
    }
    android.widget.Spinner choiceSpinner(String title,java.util.function.IntFunction<String> description,
            java.util.function.IntFunction<View> preview) {
        return choiceSpinner(title,description,preview,false);
    }
    /** A trailing preference value, using the same accessible selection dialog. */
    android.widget.Spinner inlineChoiceSpinner(String title) {
        return choiceSpinner(title,null,null,true);
    }
    /** Explicit actions only; choosing the already displayed item still invokes it. */
    android.widget.Spinner actionChoiceSpinner(String title,java.util.function.IntConsumer selected){
        return choiceSpinner(title,null,null,true,selected);
    }
    private android.widget.Spinner choiceSpinner(String title,java.util.function.IntFunction<String> description,
            java.util.function.IntFunction<View> preview,boolean inline) {
        return choiceSpinner(title,description,preview,inline,null);
    }
    private android.widget.Spinner choiceSpinner(String title,java.util.function.IntFunction<String> description,
            java.util.function.IntFunction<View> preview,boolean inline,java.util.function.IntConsumer action) {
        android.widget.Spinner spinner = new android.widget.Spinner(activity) {
            private android.app.Dialog selectionDialog;
            private final android.graphics.Paint paint=new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
            private final android.graphics.Path arrow=new android.graphics.Path();
            @Override protected void onLayout(boolean changed,int left,int top,int right,int bottom) {
                super.onLayout(changed,left,top,right,bottom);
                View selected=getSelectedView();
                if(selected instanceof TextView){
                    TextView label=(TextView)selected;label.setTextColor(inline?(isEnabled()?accent:muted):text);
                    label.setTextSize(compactTextSize(14));label.setPadding(0,0,inline?0:dp(24),0);
                    if(inline)label.setGravity(Gravity.END|Gravity.CENTER_VERTICAL);
                }
            }
            @Override protected void onDraw(android.graphics.Canvas canvas) {
                super.onDraw(canvas);
                paint.setColor(muted);paint.setStrokeWidth(dp(2));paint.setStyle(android.graphics.Paint.Style.STROKE);
                float x=getWidth()-dp(19),y=getHeight()/2f;
                arrow.reset();
                arrow.moveTo(x-dp(4),y-dp(2));arrow.lineTo(x,y+dp(2));arrow.lineTo(x+dp(4),y-dp(2));canvas.drawPath(arrow,paint);
            }

            // Custom Spinner sends the click accessibility event and sound itself; super.performClick would also open the unwanted native popup.
            //noinspection ClickableViewAccessibility
            @Override public boolean performClick() {
                if (!isEnabled() || getAdapter() == null || getAdapter().getCount() == 0) return true;
                sendAccessibilityEvent(android.view.accessibility.AccessibilityEvent.TYPE_VIEW_CLICKED);
                playSoundEffect(android.view.SoundEffectConstants.CLICK);
                String[] names = new String[getAdapter().getCount()];
                for (int i = 0; i < names.length; i++)
                    names[i] = String.valueOf(getAdapter().getItem(i)) + (action==null&&i == getSelectedItemPosition() ? " · 当前" : "");
                CharSequence label = getContentDescription();
                String[] descriptions=description==null?null:new String[names.length];
                if(descriptions!=null)for(int i=0;i<descriptions.length;i++)descriptions[i]=description.apply(i);
                selectionDialog=choiceDialog(label == null || label.length() == 0 ? title : label.toString(), names, descriptions, preview, index->{if(action==null)setSelection(index);else action.accept(index);});
                return true;
            }
        };
        spinner.setMinimumHeight(dp(48));
        spinner.setPadding(dp(inline?4:13),dp(inline?0:8),dp(inline?32:13),dp(inline?0:8));
        spinner.setBackground(inline?pressable(round(Color.TRANSPARENT,8)):controlGlass(spinner,16,IceGlassControlDrawable.NEUTRAL));
        return spinner;
    }

    TextView overline(String value) {
        TextView view = text(value, 13, muted, true);
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

    // Preserve Android sp accessibility scaling while reducing the base UI typography.
    static float compactTextSize(float size) { return Math.max(10f, size * .86f); }

    TextView text(String value, float size, int color, boolean bold) {
        return styleText(new TextView(activity), value, size, color, bold);
    }

    /** Keep framework context-menu, keyboard and accessibility actions in the same ownership fence. */
    TextView guardedText(String value, float size, int color, boolean bold, java.util.function.BooleanSupplier guard) {
        TextView view = new TextView(activity) {
            private boolean allowed() { try { return guard.getAsBoolean(); } catch (RuntimeException unavailable) { return false; } }
            @Override public boolean onTextContextMenuItem(int id) { return allowed() && super.onTextContextMenuItem(id); }
            @Override public boolean performAccessibilityAction(int action, android.os.Bundle arguments) {
                return allowed() && super.performAccessibilityAction(action, arguments);
            }
        };
        return styleText(view, value, size, color, bold);
    }

    private TextView styleText(TextView view, String value, float size, int color, boolean bold) {
        view.setText(value);
        view.setTextSize(compactTextSize(size));
        view.setTextColor(color);
        view.setIncludeFontPadding(false);
        view.setTypeface(Typeface.create("sans-serif", bold
                ? Typeface.BOLD : Typeface.NORMAL));
        return view;
    }

    Button button(String value) {
        Button button = new Button(activity);
        button.setText(value);
        button.setTextSize(compactTextSize(14f));
        button.setTextColor(text);
        button.setAllCaps(false);
        button.setMinHeight(dp(44));
        button.setMinimumHeight(dp(44));
        button.setPadding(dp(13), dp(7), dp(13), dp(7));
        button.setBackground(pressable(controlGlass(button,16,IceGlassControlDrawable.NEUTRAL)));
        button.setStateListAnimator(null);
        button.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        return button;
    }

    Button tonalButton(String value) {
        Button button = button(value);
        button.setTextColor(accent);
        button.setBackground(pressable(controlGlass(button,16,IceGlassControlDrawable.TONAL)));
        return button;
    }

    /** Quiet actions within an existing card: the card provides the visual surface. */
    Button textButton(String value) {
        Button button=button(value);
        button.setTextColor(new ColorStateList(new int[][]{new int[]{-android.R.attr.state_enabled},new int[]{}},new int[]{muted,accent}));
        button.setMinWidth(0);button.setMinimumWidth(0);
        button.setPadding(dp(8),dp(7),dp(8),dp(7));
        button.setBackground(pressable(round(Color.TRANSPARENT,8)));
        return button;
    }

    /** Compact secondary action on an existing card surface. */
    ImageButton iconAction(int icon,String description){
        ImageButton button=new ImageButton(activity);button.setImageResource(icon);
        button.setScaleType(ImageView.ScaleType.FIT_CENTER);button.setPadding(dp(11),dp(11),dp(11),dp(11));
        button.setColorFilter(accent);button.setBackground(pressable(round(Color.TRANSPARENT,8)));
        button.setMinimumWidth(dp(44));button.setMinimumHeight(dp(44));
        button.setContentDescription(description);button.setTooltipText(description);return button;
    }

    /** One-line section navigation; only the selected label receives an underline. */
    Button sectionTab(String value) {
        Button button=textButton(value);
        button.setTextColor(new ColorStateList(new int[][]{new int[]{-android.R.attr.state_enabled},new int[]{android.R.attr.state_selected},new int[]{}},new int[]{muted,accent,text}));
        android.graphics.drawable.LayerDrawable indicator=new android.graphics.drawable.LayerDrawable(new Drawable[]{round(accent,2)});
        indicator.setLayerWidth(0,dp(24));indicator.setLayerHeight(0,dp(2));
        indicator.setLayerGravity(0,Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);indicator.setLayerInsetBottom(0,dp(2));
        android.graphics.drawable.StateListDrawable states=new android.graphics.drawable.StateListDrawable();
        states.addState(new int[]{android.R.attr.state_selected},indicator);states.addState(new int[]{},round(Color.TRANSPARENT,0));
        button.setBackground(pressable(states));button.setSingleLine(true);
        return button;
    }

    Button accentButton(String value) {
        Button button = button(value);
        button.setTextColor(Color.WHITE);
        button.setBackground(pressable(controlGlass(button,16,IceGlassControlDrawable.ACCENT)));
        return button;
    }

    Button dangerButton(String value) {
        Button button = button(value);
        button.setTextColor(danger);
        button.setBackground(pressable(controlGlass(button,16,IceGlassControlDrawable.DANGER)));
        return button;
    }

    void setButtonEnabled(Button button, boolean enabled) {
        button.setEnabled(enabled);
        button.setAlpha(1f);
        button.setTextColor(enabled ? Color.WHITE : muted);
        button.setBackground(enabled
                ? pressable(controlGlass(button,16,IceGlassControlDrawable.ACCENT))
                : controlGlass(button,16,IceGlassControlDrawable.NEUTRAL));
    }

    void styleSwitch(Switch control) {
        int[][] states = new int[][]{
                new int[]{android.R.attr.state_checked},
                new int[]{-android.R.attr.state_checked}
        };
        control.setShowText(false);
        control.setMinWidth(dp(46));
        control.setMinimumWidth(dp(46));
        control.setMinHeight(dp(44));
        control.setThumbTintList(null);control.setTrackTintList(null);
        control.setSplitTrack(false);control.setSwitchMinWidth(dp(46));
        control.setTrackDrawable(controlGlass(control,20,IceGlassControlDrawable.TRACK));
        control.setThumbDrawable(controlGlass(control,20,IceGlassControlDrawable.THUMB));
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

    /** Inline feedback for a newly created field; the caller owns text and spacing. */
    TextView inlineInputError(EditText field, String key) {
        TextView error = text("", 12, danger, false);
        error.setTag("input-error:" + key);
        error.setVisibility(View.GONE);
        error.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        field.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host,
                    android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                boolean invalid = error.getVisibility() == View.VISIBLE && error.length() > 0;
                info.setContentInvalid(invalid);
                info.setError(invalid ? error.getText() : null);
            }
        });
        return error;
    }

    void styleInput(EditText input) {
        input.setTextColor(text);
        input.setHintTextColor(muted);
        input.setTextSize(compactTextSize(14f));
        input.setMinHeight(dp(48));
        // Numeric input types can replace TextView's pixel minimum with one line.
        // Keep the shared touch target at the View layer as well.
        input.setMinimumHeight(dp(48));
        input.setPadding(dp(13), dp(8), dp(13), dp(8));
        input.setBackground(controlGlass(input,16,IceGlassControlDrawable.NEUTRAL));
    }

    /** The download-count slider is the common slider for every parameter editor. */
    android.widget.SeekBar slider() {
        android.widget.SeekBar slider = new ParameterSeekBar(activity);
        // The native track does not need a 48dp visual row. ParameterSeekBar
        // extends touch handling into unused surrounding space instead.
        slider.setMinHeight(dp(20));
        slider.setMaxHeight(dp(20));
        slider.setMinimumHeight(dp(20));
        slider.setPadding(slider.getPaddingLeft(),0,slider.getPaddingRight(),0);
        slider.setKeyProgressIncrement(1);
        slider.setProgressTintList(ColorStateList.valueOf(accent));
        slider.setThumbTintList(ColorStateList.valueOf(accent));
        return slider;
    }

    /** Combine sibling labels without moving the slider or its save/validation callbacks. */
    void compactNumericHeader(View title, View value) {
        if(title==null||title==value||!(value instanceof TextView)
                ||!(title.getParent() instanceof LinearLayout)||title.getParent()!=value.getParent())return;
        LinearLayout parent=(LinearLayout)title.getParent();
        if(parent.getOrientation()!=LinearLayout.VERTICAL)return;
        int index=parent.indexOfChild(title);
        if(parent.indexOfChild(value)!=index+1)return;
        LinearLayout.LayoutParams params=(LinearLayout.LayoutParams)title.getLayoutParams();
        params.topMargin=Math.min(params.topMargin,dp(4));params.bottomMargin=0;
        parent.removeView(title);parent.removeView(value);
        parent.addView(new NumericParameterHeader(this,title,(TextView)value),index,params);
    }

    /** Keep exact HEX entry and the visual picker on the same editing surface. */
    View colorInput(EditText field, String title) {
        LinearLayout row = new LinearLayout(activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(field, new LinearLayout.LayoutParams(0, -2, 1));
        Button pick = tonalButton("选色");
        pick.setContentDescription(title + "，选择颜色");
        pick.setTag("color-picker:" + title);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(72), dp(48));
        params.setMarginStart(dp(8));
        row.addView(pick, params);
        Runnable preview = () -> {
            try {
                int color = Color.parseColor(field.getText().toString());
                GradientDrawable swatch = roundStroke(color, 6, outline, 1);
                swatch.setBounds(0, 0, dp(16), dp(16));
                pick.setCompoundDrawablesRelative(swatch, null, null, null);
                pick.setCompoundDrawablePadding(dp(4));
            } catch (IllegalArgumentException ignored) { }
        };
        field.addTextChangedListener(new android.text.TextWatcher() {
            public void beforeTextChanged(CharSequence s,int start,int count,int after) { }
            public void onTextChanged(CharSequence s,int start,int before,int count) { preview.run(); }
            public void afterTextChanged(android.text.Editable text) { }
        });
        pick.setOnClickListener(v -> ColorEditorDialog.show(activity, this, title,
                field.getText().toString(), field::setText));
        preview.run();
        return row;
    }

    /** Shared feature header. The arrow slot also aligns non-expandable switches. */
    LinearLayout featureRow(String title, String description, Switch control) {
        LinearLayout row = new LinearLayout(activity){
            @Override protected void onAttachedToWindow(){super.onAttachedToWindow();
                if(getParent() instanceof LiquidGlassLayout){View card=(View)getParent();card.setPadding(card.getPaddingLeft(),dp(2),card.getPaddingRight(),dp(2));}
            }
        };
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setTag("feature-row");row.setMinimumHeight(dp(44));
        row.setPadding(dp(FEATURE_CONTENT_INSET_DP),0,0,0);
        row.addView(section(title, description), new LinearLayout.LayoutParams(0, -2, 1));
        styleSwitch(control);
        control.setContentDescription(title);
        row.addView(control, new LinearLayout.LayoutParams(dp(46), dp(44)));
        row.addView(switchSlot(), new LinearLayout.LayoutParams(dp(25), dp(44)));
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
        final ExpandedConfiguration presentation;
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
            row.addView(arrow, new LinearLayout.LayoutParams(dp(25), dp(44)));
            presentation=new ExpandedConfiguration(UiKit.this,row,content);
            arrow.setOnClickListener(v -> {
                if (!accessibleWhileOff && !control.isChecked()) {
                    android.widget.Toast.makeText(activity, "请先开启功能", android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                show(content.getVisibility() != View.VISIBLE);
            });
            wasEnabled = control.isChecked(); show(false);
            String key="switch:"+(control.getTag()==null?control.getContentDescription():control.getTag());
            foldValues.put(key,()->content.getVisibility()==View.VISIBLE);foldSetters.put(key,this::show);
        }
        void sync() {
            sync(true);
        }
        void sync(boolean expandOnEnable) {
            boolean enabled = control.isChecked();
            if (enabled != wasEnabled) show(enabled && expandOnEnable);
            wasEnabled = enabled;
            arrow.setEnabled(control.isEnabled() && (accessibleWhileOff || enabled));
            arrow.setAlpha(arrow.isEnabled() ? 1f : .34f);
        }
        void show(boolean expanded) {
            expanded = expanded && (accessibleWhileOff || control.isChecked());
            content.setVisibility(expanded ? View.VISIBLE : View.GONE);
            presentation.update(expanded);
            arrow.setRotation(expanded ? 180 : 0);
            arrow.setContentDescription((expanded ? "收起" : "展开")+control.getContentDescription()+"配置");
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

    LinearLayout foldingSection(String title,View summary,View content,boolean initiallyExpanded){
        return foldingGroup(title,null,content,initiallyExpanded,false,summary);
    }

    /** Value settings share feature help/arrow columns without pretending to be a switch. */
    LinearLayout parameterSection(String title,String description,View summary,View content,
            boolean initiallyExpanded){
        LinearLayout outer=foldingGroup(title,description,content,initiallyExpanded,false,summary);
        LinearLayout head=(LinearLayout)outer.getChildAt(0);
        // Keep the help column aligned with neighboring Boolean feature rows.
        head.addView(switchSlot(),head.getChildCount()-1,new LinearLayout.LayoutParams(dp(46),dp(44)));
        return outer;
    }

    private LinearLayout foldingGroup(String title, View content, boolean initiallyExpanded,boolean ownCard) {
        return foldingGroup(title,null,content,initiallyExpanded,ownCard);
    }
    private LinearLayout foldingGroup(String title,String description,View content,boolean initiallyExpanded,boolean ownCard) {
        return foldingGroup(title,description,content,initiallyExpanded,ownCard,null);
    }
    private LinearLayout foldingGroup(String title,String description,View content,boolean initiallyExpanded,boolean ownCard,View summary) {
        LinearLayout outer=ownCard?card():new LinearLayout(activity),head=new LinearLayout(activity);
        outer.setOrientation(LinearLayout.VERTICAL);head.setGravity(Gravity.CENTER_VERTICAL);
        head.setPadding(dp(8),0,0,0);
        head.setMinimumHeight(dp(44));if(ownCard)outer.setPadding(dp(16),dp(2),dp(16),dp(2));
        head.addView(featureTitle(title,description,14.5f),new LinearLayout.LayoutParams(0,-2,1));
        ImageButton arrow=new ImageButton(activity);arrow.setImageResource(R.drawable.ic_expand_more);arrow.setColorFilter(muted);
        arrow.setBackground(pressable(round(Color.TRANSPARENT,12)));head.addView(arrow,new LinearLayout.LayoutParams(dp(25),dp(44)));
        outer.addView(head,wrap());
        if(summary!=null){summary.setPadding(dp(12),dp(3),dp(8),dp(8));outer.addView(summary,wrap());}
        outer.addView(content,wrap());content.setVisibility(View.GONE);
        ExpandedConfiguration presentation=new ExpandedConfiguration(this,head,content);
        if(summary!=null)presentation.summary(this,summary);
        Runnable update=()->{boolean open=content.getVisibility()==View.VISIBLE;presentation.update(open);arrow.setRotation(open?180:0);arrow.setContentDescription((open?"收起":"展开")+title);};
        View.OnClickListener toggle=v->{content.setVisibility(content.getVisibility()==View.VISIBLE?View.GONE:View.VISIBLE);update.run();};
        arrow.setOnClickListener(toggle);head.setOnClickListener(toggle);update.run();
        foldValues.put("group:"+title,()->content.getVisibility()==View.VISIBLE);
        foldSetters.put("group:"+title,open->{content.setVisibility(open?View.VISIBLE:View.GONE);update.run();});return outer;
    }

    LinearLayout collapsible(String title, String description, View content,
            boolean initiallyExpanded) {
        return foldingGroup(title,description,content,initiallyExpanded,true);
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

    private int iceIcon(String title){
        if("液态玻璃控制中心".equals(title))return R.drawable.ice_layout_grid;
        if("面板日期、天气与时钟".equals(title))return R.drawable.ice_clock;
        if("电源菜单高级重启".equals(title))return R.drawable.ice_power;
        if("自定义侧滑返回图标".equals(title))return R.drawable.ice_undo2;
        return 0;
    }

    Drawable controlGlass(View owner,int radiusDp,int role) {
        return new IceGlassControlDrawable(this,owner,radiusDp,role);
    }

    Drawable glass(int radiusDp) {
        // Quiet content surfaces; real optical controls use LiquidGlassLayout.
        return roundStroke(dark ? 0xe6253b54 : 0xcff7fcff, surfaceRadiusDp(radiusDp),
                dark ? 0x6653789c : 0xddffffff, 1);
    }

    Drawable pressable(Drawable content) {
        {}
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
