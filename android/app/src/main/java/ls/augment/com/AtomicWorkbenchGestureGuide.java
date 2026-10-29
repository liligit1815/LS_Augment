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
        ValueAnimator animator; float phase; int candidate; final int[] origin = new int[2];
        Practice(UiKit ui, AtomicWorkbenchGesturePolicy.Geometry geometry) {
            super(ui.activity); this.ui = ui; this.geometry = geometry;
            setTag("step-gesture-guide"); setWillNotDraw(false); setClickable(true); setFocusableInTouchMode(true);
            setBackgroundColor(0x66000000);
            LinearLayout instructions = ui.preferenceCard();
            caption = ui.text("从右侧高亮区域向左滑动", 18, ui.text, true);
            caption.setTag("step-gesture-guide-caption"); instructions.addView(caption, ui.wrap());
            instructions.addView(ui.text("请在屏幕上实际操作：单指向中间滑动，松手进入红魔Step。左侧向右滑也可以。", 14, ui.text, false), ui.margins(0, 8, 0, 8));
            skip = ui.tonalButton("稍后练习"); skip.setTag("step-gesture-guide-skip"); instructions.addView(skip, ui.wrap());
            LayoutParams box = new LayoutParams(-1, -2, Gravity.TOP);
            box.leftMargin = box.rightMargin = ui.dp(24); box.topMargin = Math.round(geometry.maxY) + ui.dp(48);
            addView(instructions, box);
        }
        @android.annotation.SuppressLint("ClickableViewAccessibility") // This layer practices a directional gesture; its skip button remains accessible.
        @Override public boolean onTouchEvent(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) candidate = geometry.side(event.getRawX(), event.getRawY());
            int side = detector.event(action, 0, event.getPointerCount(), event.isFromSource(android.view.InputDevice.SOURCE_TOUCHSCREEN),
                    true, event.getRawX(), event.getRawY(), event.getEventTime(), geometry);
            if (action == MotionEvent.ACTION_DOWN) caption.setText(candidate == 0 ? "请从屏幕两侧的高亮区域开始" : "向屏幕中间滑动，然后松手");
            if (action == MotionEvent.ACTION_UP) caption.setText(side == 0 ? "再试一次：沿箭头向中间滑动" : "正在进入红魔Step…");
            return true;
        }
        @Override protected void onAttachedToWindow() { super.onAttachedToWindow();
            if (!ValueAnimator.areAnimatorsEnabled()) return;
            animator = ValueAnimator.ofFloat(0f, 1f); animator.setDuration(1800); animator.setRepeatCount(-1);
            animator.setInterpolator(new LinearInterpolator());
            animator.addUpdateListener(a -> { phase = (float)a.getAnimatedValue(); invalidate(); }); animator.start();
        }
        @Override protected void onDetachedFromWindow() {
            if (animator != null) { animator.cancel(); animator.removeAllUpdateListeners(); animator = null; }
            super.onDetachedFromWindow();
        }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas); getLocationOnScreen(origin);
            float top = geometry.minY - origin[1], bottom = geometry.maxY - origin[1];
            paint.setColor(ui.accent); paint.setAlpha(100);
            canvas.drawRect(0, top, geometry.edge, bottom, paint); canvas.drawRect(getWidth() - geometry.edge, top, getWidth(), bottom, paint);
            for (int side = 0; side < 2; side++) {
                boolean left = side == 1;
                float from = left ? geometry.edge / 2 : getWidth() - geometry.edge / 2;
                float to = from + (left ? 1 : -1) * (geometry.minInward + 16) * geometry.density;
                float y = (top + bottom) / 2, arrow = ui.dp(7), back = to + (left ? -arrow : arrow);
                paint.setColor(ui.accent); paint.setAlpha(255); paint.setStrokeWidth(ui.dp(3)); paint.setStrokeCap(Paint.Cap.ROUND);
                canvas.drawLine(from, y, to, y, paint); canvas.drawLine(back, y - arrow, to, y, paint); canvas.drawLine(back, y + arrow, to, y, paint);
                paint.setColor(0xffffffff); paint.setAlpha(phase > .85f ? 0 : 240);
                canvas.drawCircle(from + (to - from) * Math.min(1, phase / .7f), y, ui.dp(8), paint);
            }
        }
    }
}
