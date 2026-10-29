package ls.augment.com;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Actual screen-size practice. The framework gesture alone launches Step. */
final class AtomicWorkbenchGestureGuide {
    static final String PREFS = "atomic-workbench-guide", SEEN = "corner-practice-v2";
    private static final String START = "practice-start";
    private final Activity activity;
    private final Practice layer;
    private Runnable cancelled = () -> {}, dismissed = () -> {};
    private boolean showing;

    static boolean seen(Activity activity) {
        return activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(SEEN, false);
    }
    static void entered(Activity activity, long triggered) {
        android.content.SharedPreferences prefs = activity.getSharedPreferences(PREFS, 0);
        long start = prefs.getLong(START, -1), now = SystemClock.elapsedRealtime();
        if (start >= 0 && triggered >= start && now >= triggered && now - start < 120000L)
            prefs.edit().putBoolean(SEEN, true).remove(START).apply();
    }
    static AtomicWorkbenchGestureGuide create(Activity activity, UiKit ui, AppConfig config) {
        return new AtomicWorkbenchGestureGuide(activity, ui, config);
    }
    private AtomicWorkbenchGestureGuide(Activity activity, UiKit ui, AppConfig config) {
        this.activity = activity; layer = new Practice(ui, geometry(activity, config));
        layer.skip.setOnClickListener(v -> cancel());
    }
    void setOnCancelListener(Runnable listener) { cancelled = listener; }
    void setOnDismissListener(Runnable listener) { dismissed = listener; }
    boolean isShowing() { return showing; }
    View view() { return layer; }
    void show() {
        if (showing) return; showing = true;
        activity.getSharedPreferences(PREFS, 0).edit().putLong(START, SystemClock.elapsedRealtime()).apply();
        ((ViewGroup)activity.getWindow().getDecorView()).addView(layer, new ViewGroup.LayoutParams(-1, -1));
        layer.requestFocus();
    }
    void cancel() {
        activity.getSharedPreferences(PREFS, 0).edit().remove(START).apply(); cancelled.run(); dismiss();
    }
    void dismiss() {
        if (!showing) return; showing = false;
        if (layer.getParent() instanceof ViewGroup) ((ViewGroup)layer.getParent()).removeView(layer);
        dismissed.run();
    }
    @android.annotation.SuppressLint({"DiscouragedApi", "InternalInsetResource"})
    private static AtomicWorkbenchGesturePolicy.Geometry geometry(Activity activity, AppConfig config) {
        Rect screen = activity.getWindowManager().getMaximumWindowMetrics().getBounds();
        float density = activity.getResources().getDisplayMetrics().density;
        int resource = activity.getResources().getIdentifier("status_bar_height", "dimen", "android");
        float bar = resource == 0 ? 24f * density : activity.getResources().getDimensionPixelSize(resource);
        return AtomicWorkbenchGesturePolicy.Geometry.create(screen.width(), screen.height(), density, bar,
                config.getInt(AtomicWorkbenchConfig.TRIGGER_AREA_SCALE, 100), config.getInt(AtomicWorkbenchConfig.CORNER_SENSITIVITY, 100));
    }
    @android.annotation.SuppressLint("ViewConstructor")
    static final class Practice extends FrameLayout {
        final UiKit ui; final AtomicWorkbenchGesturePolicy.Geometry geometry;
        final AtomicWorkbenchGesturePolicy.Detector detector = new AtomicWorkbenchGesturePolicy.Detector();
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final TextView caption; final android.widget.Button skip;
        ValueAnimator animator; float phase; int candidate, activeSide = AtomicWorkbenchGesturePolicy.RIGHT;
        final int[] origin = new int[2];
        Practice(UiKit ui, AtomicWorkbenchGesturePolicy.Geometry geometry) {
            super(ui.activity); this.ui = ui; this.geometry = geometry;
            setTag("step-gesture-guide"); setWillNotDraw(false); setClickable(true); setFocusableInTouchMode(true);
            // The shared page surface removes competing settings controls, with no modal card.
            setBackground(ui.backgroundDrawable());
            android.widget.ScrollView scroll = new android.widget.ScrollView(ui.activity);
            scroll.setFillViewport(true); scroll.setVerticalScrollBarEnabled(false);
            LinearLayout instructions = new LinearLayout(ui.activity);
            instructions.setOrientation(LinearLayout.VERTICAL); instructions.setGravity(Gravity.CENTER_HORIZONTAL);
            instructions.setPadding(ui.dp(28), ui.dp(16), ui.dp(28), ui.dp(24));
            scroll.addView(instructions, new android.widget.ScrollView.LayoutParams(-1, -2));
            TextView label = ui.text("红魔Step · 手势练习", 13, ui.muted, false);
            label.setGravity(Gravity.CENTER); instructions.addView(label, ui.wrap());
            TextView title = ui.text("从右上方向内滑动", 20, ui.text, true);
            title.setGravity(Gravity.CENTER); instructions.addView(title, ui.margins(0, 10, 0, 10));
            TextView description = ui.text("从状态栏下方的屏幕边缘向左滑，\n松手即可进入红魔Step。", 14, ui.muted, false);
            description.setGravity(Gravity.CENTER); instructions.addView(description, ui.wrap());
            caption = ui.text("现在试一试", 15, ui.accent, true);
            caption.setGravity(Gravity.CENTER); caption.setTag("step-gesture-guide-caption");
            instructions.addView(caption, ui.margins(0, 28, 0, 12));
            TextView alternate = ui.text("左上角向右滑动，也可以进入", 12, ui.muted, false);
            alternate.setGravity(Gravity.CENTER); instructions.addView(alternate, ui.wrap());
            skip = ui.textButton("稍后练习"); skip.setTag("step-gesture-guide-skip");
            instructions.addView(skip, ui.margins(0, 24, 0, 0));
            LayoutParams box = new LayoutParams(-1, -1, Gravity.TOP);
            box.topMargin = Math.round(geometry.maxY) + ui.dp(40); box.bottomMargin = ui.dp(24);
            addView(scroll, box);
        }
        @android.annotation.SuppressLint("ClickableViewAccessibility") // Directional practice; the skip action is a native accessible button.
        @Override public boolean onTouchEvent(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                candidate = geometry.side(event.getRawX(), event.getRawY());
                if (candidate != 0) activeSide = candidate;
            }
            int side = detector.event(action, 0, event.getPointerCount(), event.isFromSource(android.view.InputDevice.SOURCE_TOUCHSCREEN),
                    true, event.getRawX(), event.getRawY(), event.getEventTime(), geometry);
            if (action == MotionEvent.ACTION_DOWN) caption.setText(candidate == 0 ? "请从上方的屏幕边缘开始" : "向中间滑动，然后松手");
            if (action == MotionEvent.ACTION_UP) caption.setText(side == 0 ? "再试一次，向中间多滑一点" : "正在进入红魔Step…");
            invalidate(); return true;
        }
        @Override protected void onAttachedToWindow() { super.onAttachedToWindow();
            if (!ValueAnimator.areAnimatorsEnabled()) return;
            animator = ValueAnimator.ofFloat(0f, 1f); animator.setDuration(1900); animator.setRepeatCount(-1);
            animator.setInterpolator(new LinearInterpolator());
            animator.addUpdateListener(a -> { phase = (float)a.getAnimatedValue(); invalidate(); }); animator.start();
        }
        @Override protected void onDetachedFromWindow() {
            if (animator != null) { animator.cancel(); animator.removeAllUpdateListeners(); animator = null; }
            super.onDetachedFromWindow();
        }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas); getLocationOnScreen(origin);
            boolean left = activeSide == AtomicWorkbenchGesturePolicy.LEFT;
            float y = (geometry.minY + geometry.maxY) / 2 - origin[1];
            float edge = left ? ui.dp(4) : getWidth() - ui.dp(4);
            float from = left ? ui.dp(22) : getWidth() - ui.dp(22);
            float to = from + (left ? 1 : -1) * (geometry.minInward + 16) * geometry.density;
            paint.setStyle(Paint.Style.FILL); paint.setColor(ui.accent); paint.setAlpha(180);
            canvas.drawRoundRect(edge - ui.dp(2), y - ui.dp(18), edge + ui.dp(2), y + ui.dp(18), ui.dp(2), ui.dp(2), paint);
            paint.setAlpha(38); paint.setStrokeWidth(ui.dp(2)); paint.setStrokeCap(Paint.Cap.ROUND);
            canvas.drawLine(from, y, to, y, paint);
            float arrow = ui.dp(5), back = to + (left ? -arrow : arrow);
            paint.setAlpha(150); canvas.drawLine(back, y - arrow, to, y, paint); canvas.drawLine(back, y + arrow, to, y, paint);
            float progress = Math.min(1f, phase / .7f); progress = progress * progress * (3 - 2 * progress);
            float x = from + (to - from) * progress;
            float fade = phase > .8f ? Math.max(0f, (1f - phase) / .2f) : 1f;
            paint.setAlpha(Math.round(22 * fade)); canvas.drawCircle(x, y, ui.dp(18), paint);
            paint.setAlpha(Math.round(225 * fade)); canvas.drawCircle(x, y, ui.dp(7), paint);
        }
    }
}
