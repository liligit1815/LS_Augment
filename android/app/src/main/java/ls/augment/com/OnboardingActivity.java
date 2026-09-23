package ls.augment.com;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/** First-use disclosure. Agreement is never inferred from opening or dismissing this UI. */
public final class OnboardingActivity extends Activity {
    private static final String CONSENT_PREFS = "ls_augment_consent";
    private static final String ACCEPTED_VERSION = "accepted_version";
    private static final String STATE_READING = "reading";
    private static final String STATE_CHECKED = "checked";
    private static final String STATE_SCROLL = "agreement_scroll";
    private static final String STATE_INTRO_FINISHED = "intro_finished";
    private static final String STATE_INTRO_POSITION = "intro_position";

    private UiKit ui;
    private boolean reading, checked;
    private int agreementScroll;
    private ScrollView documentScroll;
    private View animatedHero;
    private FirstStartAnimationView intro;
    private boolean introFinished;
    private int introPosition;
    private android.window.OnBackInvokedCallback backCallback;

    public static boolean needsConsent(Context context) {
        return context.getSharedPreferences(CONSENT_PREFS, Context.MODE_PRIVATE)
                .getInt(ACCEPTED_VERSION, 0) < ModuleLegal.VERSION;
    }

    public static void open(Activity activity) {
        activity.startActivity(new Intent(activity, OnboardingActivity.class));
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (!needsConsent(this)) { finish(); return; }
        if (Build.VERSION.SDK_INT >= 33) {
            backCallback = this::leave;
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT, backCallback);
        }
        if (state != null) {
            reading = state.getBoolean(STATE_READING, false);
            checked = state.getBoolean(STATE_CHECKED, false);
            agreementScroll = state.getInt(STATE_SCROLL, 0);
            introFinished = state.getBoolean(STATE_INTRO_FINISHED, false);
            introPosition = state.getInt(STATE_INTRO_POSITION, 0);
        }
        ui = new UiKit(this);
        if (reading) showAgreement();
        else if (!introFinished && ValueAnimator.areAnimatorsEnabled()) showIntro();
        else { introFinished = true; showWelcome(state == null); }
    }

    /** Package-visible read-only state for instrumentation; never changes consent. */
    boolean animationVisible() { return intro != null && !introFinished; }
    int animationPositionMs() { return intro == null ? introPosition : intro.positionMs(); }
    int positionMs() { return animationPositionMs(); }

    private void showIntro() {
        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(Color.BLACK);
        intro = new FirstStartAnimationView(this, introPosition, this::finishIntro);
        root.addView(intro, new FrameLayout.LayoutParams(-1, -1));
        FrameLayout controls = new FrameLayout(this);
        controls.setPadding(ui.dp(18), ui.dp(12), ui.dp(18), ui.dp(12));
        Button skip = ui.button("跳过");
        skip.setTextColor(Color.WHITE);
        skip.setBackground(ui.pressable(ui.round(Color.argb(70, 255, 255, 255), 22)));
        skip.setContentDescription("跳过开场动画");
        skip.setOnClickListener(view -> finishIntro());
        controls.addView(skip, new FrameLayout.LayoutParams(ui.dp(80), ui.dp(44), Gravity.TOP | Gravity.END));
        root.addView(controls, new FrameLayout.LayoutParams(-1, -1));
        setContentView(root);
        getWindow().setStatusBarColor(Color.BLACK);
        getWindow().setNavigationBarColor(Color.BLACK);
        if (Build.VERSION.SDK_INT >= 30 && getWindow().getInsetsController() != null) {
            getWindow().getInsetsController().setSystemBarsAppearance(0,
                    android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                            | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
            getWindow().getInsetsController().setSystemBarsBehavior(
                    android.view.WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
            getWindow().getInsetsController().hide(android.view.WindowInsets.Type.systemBars());
        } else {
            getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                    | View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION);
        }
        ui.applyGestureInset(controls, 0);
    }

    private void finishIntro() {
        if (introFinished || isFinishing() || isDestroyed()) return;
        introFinished = true;
        if (intro != null) { introPosition = intro.positionMs(); intro.release(); intro = null; }
        // Reapply the module window palette after the black, immersive video surface.
        ui = new UiKit(this);
        if (Build.VERSION.SDK_INT >= 30 && getWindow().getInsetsController() != null)
            getWindow().getInsetsController().show(android.view.WindowInsets.Type.systemBars());
        showWelcome(true);
    }

    @Override protected void onResume() {
        super.onResume();
        if (intro != null) {
            if (!ValueAnimator.areAnimatorsEnabled()) finishIntro();
            else intro.resumePlayback();
        }
    }

    @Override protected void onPause() {
        if (intro != null) { intro.pausePlayback(); introPosition = intro.positionMs(); }
        super.onPause();
    }

    private LinearLayout root() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(ui.dp(22), ui.dp(14), ui.dp(22), ui.dp(10));
        ui.setContentView(root);
        ui.applyGestureInset(root, 6);
        return root;
    }

    private void showWelcome(boolean animate) {
        LinearLayout root = root();
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        LinearLayout hero = new LinearLayout(this);
        hero.setOrientation(LinearLayout.VERTICAL);
        hero.setGravity(Gravity.CENTER);
        hero.setPadding(0, ui.dp(28), 0, ui.dp(28));
        animatedHero = hero;

        FrameLayout mark = new FrameLayout(this);
        View halo = new View(this);
        GradientDrawable glow = new GradientDrawable();
        glow.setGradientType(GradientDrawable.RADIAL_GRADIENT);
        glow.setGradientRadius(ui.dp(104));
        glow.setColors(new int[]{ui.dark ? Color.argb(128, 58, 156, 238)
                : Color.argb(190, 159, 218, 255), Color.TRANSPARENT});
        halo.setBackground(glow);
        mark.addView(halo, new FrameLayout.LayoutParams(-1, -1));
        ImageView boat = new ImageView(this);
        boat.setImageResource(R.drawable.ic_ls_augment_boat);
        boat.setScaleType(ImageView.ScaleType.FIT_CENTER);
        boat.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        FrameLayout.LayoutParams boatParams = new FrameLayout.LayoutParams(ui.dp(142), ui.dp(142), Gravity.CENTER);
        mark.addView(boat, boatParams);
        hero.addView(mark, new LinearLayout.LayoutParams(ui.dp(204), ui.dp(204)));

        TextView name = ui.text("欢迎使用\nLS_Augment", 22, ui.text, true);
        name.setGravity(Gravity.CENTER);
        name.setLineSpacing(ui.dp(6), 1f);
        hero.addView(name, ui.margins(0, 5, 0, 14));
        TextView tagline = ui.text("让每一处增强，都井然有序。", 15, ui.muted, false);
        tagline.setGravity(Gravity.CENTER);
        hero.addView(tagline, ui.margins(0, 0, 0, 27));

        LinearLayout welcome = ui.card();
        welcome.addView(ui.text("按应用配置，随心调整",13,ui.text,true));
        welcome.addView(ui.text("从主页选择目标应用，在同一页面找到相关功能。",12,ui.muted,false),ui.margins(0,5,0,0));
        welcome.addView(ui.text("设置与关于，清晰分开",13,ui.text,true),ui.margins(0,17,0,0));
        welcome.addView(ui.text("模块管理集中在设置，版本和设备信息收在关于。",12,ui.muted,false),ui.margins(0,5,0,0));
        hero.addView(welcome, ui.wrap());
        scroll.addView(hero, new ScrollView.LayoutParams(-1, -2));
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));

        Button begin = ui.accentButton("阅读并开始");
        begin.setOnClickListener(view -> {
            hero.animate().cancel();
            reading = true;
            showAgreement();
        });
        root.addView(begin, ui.margins(0, 10, 0, 0));
        Button exit = ui.button("暂不使用");
        exit.setOnClickListener(view -> leave());
        root.addView(exit, ui.margins(0, 8, 0, 0));

        if (animate && ValueAnimator.areAnimatorsEnabled()) {
            hero.setAlpha(0f);
            hero.setScaleX(.94f);
            hero.setScaleY(.94f);
            hero.animate().alpha(1f).scaleX(1f).scaleY(1f).setDuration(700)
                    .setUpdateListener(animation -> ((LiquidGlassLayout) welcome).refreshBackdrop())
                    .withEndAction(() -> ((LiquidGlassLayout) welcome).refreshBackdrop())
                    .setInterpolator(new DecelerateInterpolator()).start();
        }
    }

    private void showAgreement() {
        LinearLayout root = root();
        root.addView(ui.text("开始之前", 20, ui.text, true), ui.margins(0, 10, 0, 10));
        TextView subtitle = ui.text("请了解模块的使用方式和本地信息处理。", 14, ui.muted, false);
        subtitle.setLineSpacing(ui.dp(2), 1f);
        root.addView(subtitle, ui.margins(0, 0, 0, 18));

        documentScroll = new ScrollView(this);
        documentScroll.setFillViewport(true);
        documentScroll.setBackground(ui.glass(22));
        LinearLayout document = new LinearLayout(this);
        document.setOrientation(LinearLayout.VERTICAL);
        document.setPadding(ui.dp(18), ui.dp(19), ui.dp(18), ui.dp(4));
        ModuleLegal.append(ui, document);
        documentScroll.addView(document, new ScrollView.LayoutParams(-1, -2));
        root.addView(documentScroll, new LinearLayout.LayoutParams(-1, 0, 1));
        documentScroll.post(() -> documentScroll.scrollTo(0, agreementScroll));

        CheckBox consent = new CheckBox(this);
        ui.styleCheckBox(consent);
        consent.setText("我已阅读并同意用户协议与隐私说明");
        consent.setTextSize(13);
        consent.setPadding(0, ui.dp(8), 0, ui.dp(5));
        consent.setChecked(checked);
        root.addView(consent, ui.margins(0, 10, 0, 0));
        Button accept = ui.accentButton("同意并继续");
        ui.setButtonEnabled(accept, checked);
        consent.setOnCheckedChangeListener((button, value) -> {
            checked = value;
            ui.setButtonEnabled(accept, value);
        });
        accept.setOnClickListener(view -> {
            if (!checked) return;
            boolean saved = getSharedPreferences(CONSENT_PREFS, MODE_PRIVATE).edit()
                    .putInt(ACCEPTED_VERSION, ModuleLegal.VERSION)
                    .putLong("accepted_at", System.currentTimeMillis()).commit();
            if (!saved) {
                Toast.makeText(this, "同意状态未能保存，请重试", Toast.LENGTH_LONG).show();
                return;
            }
            setResult(RESULT_OK);
            finish();
        });
        root.addView(accept, ui.margins(0, 3, 0, 0));
        Button decline = ui.button("不同意，退出");
        decline.setOnClickListener(view -> leave());
        root.addView(decline, ui.margins(0, 8, 0, 0));
    }

    private void leave() { setResult(RESULT_CANCELED); finishAffinity(); }

    // Gesture navigation is registered separately with the platform dispatcher.
    @android.annotation.SuppressLint("GestureBackNavigation")
    @Override public void onBackPressed() { leave(); }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean(STATE_READING, reading);
        state.putBoolean(STATE_CHECKED, checked);
        state.putInt(STATE_SCROLL, documentScroll == null ? agreementScroll : documentScroll.getScrollY());
        state.putBoolean(STATE_INTRO_FINISHED, introFinished);
        state.putInt(STATE_INTRO_POSITION, animationPositionMs());
        super.onSaveInstanceState(state);
    }

    @Override protected void onStop() {
        if (intro != null) { intro.pausePlayback(); introPosition = intro.positionMs(); }
        if (animatedHero != null) {
            animatedHero.animate().cancel();
            animatedHero.setAlpha(1f);
            animatedHero.setScaleX(1f);
            animatedHero.setScaleY(1f);
        }
        super.onStop();
    }

    @Override protected void onDestroy() {
        if (intro != null) { intro.release(); intro = null; }
        if (Build.VERSION.SDK_INT >= 33 && backCallback != null) {
            getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(backCallback);
        }
        super.onDestroy();
    }
}
