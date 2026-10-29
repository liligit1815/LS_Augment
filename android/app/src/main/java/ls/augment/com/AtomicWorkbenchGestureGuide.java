package ls.augment.com;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/** Phone-side demonstration. Uses the detector's actual region and distance, without injecting input. */
final class AtomicWorkbenchGestureGuide {
    static final String PREFS = "atomic-workbench-guide";
    static final String SEEN = "corner-gesture-v1";

    static boolean seen(Activity activity) {
        return activity.getSharedPreferences(PREFS, Activity.MODE_PRIVATE).getBoolean(SEEN, false);
    }

    static AlertDialog create(Activity activity, UiKit ui, AppConfig config, Runnable acknowledge) {
        LinearLayout body = new LinearLayout(activity);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(ui.dp(20), 0, ui.dp(20), 0);
        body.addView(ui.text("从状态栏下方的右上角起滑，单指向左水平滑动，松手进入红魔Step。左上角向右滑也可以。",
                14, ui.text, false), ui.margins(0, 0, 0, 12));
        TextView caption = ui.text("右上角向左滑 → 松手进入", 14, ui.accent, true);
        caption.setTag("step-gesture-guide-caption");
        AtomicWorkbenchGesturePolicy.Geometry geometry = geometry(activity, config);
        if (geometry != null) {
            Demonstration demonstration = new Demonstration(ui, geometry, caption);
            demonstration.setTag("step-gesture-guide-animation");
            int illustrationHeight = geometry.height / geometry.density < 480f ? 100 : 170;
            body.addView(demonstration, new LinearLayout.LayoutParams(-1, ui.dp(illustrationHeight)));
        }
        body.addView(caption, ui.margins(0, 8, 0, 12));
        body.addView(ui.text("从高亮区域开始，保持水平。屏幕中下部侧滑、下拉和多指手势不会进入。可在本页调整触发区域和灵敏度。",
                13, ui.muted, false), ui.margins(0, 0, 0, 8));
        ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(false);
        scroll.addView(body);
        scroll.setTag("step-gesture-guide");
        return AppDialogs.builder(activity).setTitle("进入红魔Step的手势")
                .setView(scroll).setPositiveButton("我知道了", (dialog, which) -> acknowledge.run()).create();
    }

    // Same display, inset and policy as the global detector and the existing region preview.
    @android.annotation.SuppressLint({"DiscouragedApi", "InternalInsetResource"})
    private static AtomicWorkbenchGesturePolicy.Geometry geometry(Activity activity, AppConfig config) {
        Rect screen = activity.getWindowManager().getMaximumWindowMetrics().getBounds();
        float density = activity.getResources().getDisplayMetrics().density;
        int resource = activity.getResources().getIdentifier("status_bar_height", "dimen", "android");
        float bar = resource == 0 ? 24f * density : activity.getResources().getDimensionPixelSize(resource);
        try {
            return AtomicWorkbenchGesturePolicy.Geometry.create(screen.width(), screen.height(), density, bar,
                    config.getInt(AtomicWorkbenchConfig.TRIGGER_AREA_SCALE, 100),
                    config.getInt(AtomicWorkbenchConfig.CORNER_SENSITIVITY, 100));
        } catch (IllegalArgumentException unavailable) { return null; }
    }

    @android.annotation.SuppressLint("ViewConstructor") // Created only here with an explicit policy and shared theme; never inflated.
    static final class Demonstration extends View {
        private final UiKit ui;
        private final AtomicWorkbenchGesturePolicy.Geometry geometry;
        private final TextView caption;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private ValueAnimator animator;
        private float phase;
        private boolean left;

        Demonstration(UiKit ui, AtomicWorkbenchGesturePolicy.Geometry geometry, TextView caption) {
            super(ui.activity);
            this.ui = ui; this.geometry = geometry; this.caption = caption;
            // Instructions remain ordinary scalable TextViews; the drawing is only a visual aid.
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        }

        private void start() {
            if (animator != null || !isAttachedToWindow() || !isShown() || !hasWindowFocus()
                    || !ValueAnimator.areAnimatorsEnabled()) return;
            animator = ValueAnimator.ofFloat(0f, 2f);
            animator.setDuration(5200);
            animator.setRepeatCount(ValueAnimator.INFINITE);
            animator.setInterpolator(new LinearInterpolator());
            animator.addUpdateListener(value -> {
                float progress = (Float) value.getAnimatedValue();
                boolean nextLeft = progress >= 1f;
                phase = progress % 1f;
                if (nextLeft != left) {
                    left = nextLeft;
                    caption.setText(left ? "左上角向右滑 → 松手进入" : "右上角向左滑 → 松手进入");
                }
                invalidate();
            });
            animator.start();
        }

        private void stop() {
            if (animator != null) { animator.cancel(); animator.removeAllUpdateListeners(); animator = null; }
        }

        @Override protected void onAttachedToWindow() { super.onAttachedToWindow(); start(); }
        @Override protected void onDetachedFromWindow() { stop(); super.onDetachedFromWindow(); }
        @Override protected void onWindowVisibilityChanged(int visibility) {
            super.onWindowVisibilityChanged(visibility);
            if (visibility == VISIBLE) start(); else stop();
        }
        @Override public void onWindowFocusChanged(boolean focused) {
            super.onWindowFocusChanged(focused);
            if (focused) start(); else stop();
        }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float inset = ui.dp(12), top = ui.dp(8), bottom = getHeight() - ui.dp(8);
            float scale = (getWidth() - inset * 2) / geometry.width;
            if (scale <= 0) return;
            float right = getWidth() - inset;
            paint.setColor(ui.muted); paint.setAlpha(150); paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(ui.dp(1));
            canvas.drawRoundRect(inset, top, right, bottom, ui.dp(18), ui.dp(18), paint);
            float bar = top + (geometry.minY - 8f * geometry.density) * scale;
            canvas.drawLine(inset, bar, right, bar, paint);
            paint.setStyle(Paint.Style.FILL); paint.setColor(ui.accent); paint.setAlpha(48);
            float y1 = top + geometry.minY * scale, y2 = top + geometry.maxY * scale;
            float edge = geometry.edge * scale;
            canvas.drawRect(inset, y1, inset + edge, y2, paint);
            canvas.drawRect(right - edge, y1, right, y2, paint);
            float start = left ? inset + edge / 2 : right - edge / 2;
            float distance = (geometry.minInward + 16f) * geometry.density * scale;
            float end = start + (left ? distance : -distance), y = (y1 + y2) / 2;
            paint.setColor(ui.accent); paint.setAlpha(190); paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(ui.dp(2)); paint.setStrokeCap(Paint.Cap.ROUND);
            canvas.drawLine(start, y, end, y, paint);
            float arrow = ui.dp(6), back = end + (left ? -arrow : arrow);
            canvas.drawLine(back, y - arrow, end, y, paint);
            canvas.drawLine(back, y + arrow, end, y, paint);
            float travel = Math.max(0, Math.min(1, (phase - .15f) / .5f));
            // Hold, slide, then lift. A static arrow remains when system animations are disabled.
            float finger = start + (end - start) * travel;
            paint.setStyle(Paint.Style.FILL); paint.setAlpha(phase > .78f ? 0 : 220);
            canvas.drawCircle(finger, y, ui.dp(8), paint);
            paint.setStyle(Paint.Style.STROKE); paint.setAlpha(phase > .78f ? 0 : 80);
            canvas.drawCircle(finger, y, ui.dp(13), paint);
            paint.setColor(ui.muted); paint.setAlpha(55); paint.setStrokeWidth(ui.dp(1));
            float contentTop = Math.max(y2 + ui.dp(20), bottom - ui.dp(58));
            float center = (inset + right) / 2;
            canvas.drawRoundRect(inset + ui.dp(14), contentTop, center - ui.dp(5), bottom - ui.dp(14), ui.dp(6), ui.dp(6), paint);
            canvas.drawRoundRect(center + ui.dp(5), contentTop, right - ui.dp(14), bottom - ui.dp(14), ui.dp(6), ui.dp(6), paint);
            paint.setAlpha(255);
        }
    }

    private AtomicWorkbenchGestureGuide() { }
}
