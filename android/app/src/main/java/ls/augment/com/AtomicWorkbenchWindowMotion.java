package ls.augment.com;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import java.util.LinkedHashMap;
import java.util.Map;

/** Visual position changes only. It cannot launch, focus, close or release a native owner. */
final class AtomicWorkbenchWindowMotion implements AutoCloseable {
    private final View root;
    private final Map<View, RectF> before = new LinkedHashMap<>();
    private ValueAnimator animator;
    private ViewTreeObserver.OnPreDrawListener layout;
    private Runnable settled;
    private boolean running;
    private final Runnable watchdog = this::finish;

    AtomicWorkbenchWindowMotion(View root) { this.root = root; }
    boolean running() { return running; }
    void begin(View[] frames, Runnable settled) {
        close();
        if (!ValueAnimator.areAnimatorsEnabled() || !root.isAttachedToWindow()) {
            if (settled != null) root.post(settled); return;
        }
        for (View frame : frames) {
            frame.animate().cancel();
            if (frame.isShown() && frame.getWidth() > 1 && frame.getHeight() > 1) {
                before.put(frame, new RectF(frame.getX(), frame.getY(),
                        frame.getX() + frame.getWidth() * frame.getScaleX(), frame.getY() + frame.getHeight() * frame.getScaleY()));
            }
        }
        this.settled = settled; running = true;
        layout = () -> {
            removeLayoutListener();
            Map<View, RectF> changes = new LinkedHashMap<>();
            for (Map.Entry<View, RectF> entry : before.entrySet()) {
                View frame = entry.getKey(); RectF old = entry.getValue();
                if (!frame.isShown() || frame.getWidth() <= 1 || frame.getHeight() <= 1) continue;
                if (old.left == frame.getLeft() && old.top == frame.getTop()
                        && old.width() == frame.getWidth() && old.height() == frame.getHeight()) continue;
                changes.put(frame, old); frame.setPivotX(0); frame.setPivotY(0);
                apply(frame, old, 0);
            }
            if (changes.isEmpty()) { finish(); return true; }
            animator = ValueAnimator.ofFloat(0, 1); animator.setDuration(280);
            animator.setInterpolator(new android.view.animation.PathInterpolator(.2f, .8f, .2f, 1f));
            animator.addUpdateListener(value -> {
                float progress = (float) value.getAnimatedValue();
                for (Map.Entry<View, RectF> entry : changes.entrySet()) apply(entry.getKey(), entry.getValue(), progress);
            });
            animator.addListener(new AnimatorListenerAdapter() { @Override public void onAnimationEnd(Animator value) { finish(); } });
            animator.start(); return true;
        };
        root.getViewTreeObserver().addOnPreDrawListener(layout);
        root.postDelayed(watchdog, 700); root.invalidate();
    }
    private static void apply(View frame, RectF old, float progress) {
        float remaining = 1 - progress;
        frame.setTranslationX((old.left - frame.getLeft()) * remaining);
        frame.setTranslationY((old.top - frame.getTop()) * remaining);
        frame.setScaleX(1 + (old.width() / frame.getWidth() - 1) * remaining);
        frame.setScaleY(1 + (old.height() / frame.getHeight() - 1) * remaining);
    }
    private void removeLayoutListener() {
        if (layout != null && root.getViewTreeObserver().isAlive()) root.getViewTreeObserver().removeOnPreDrawListener(layout);
        layout = null;
    }
    private void finish() {
        removeLayoutListener(); root.removeCallbacks(watchdog);
        ValueAnimator previous = animator; animator = null;
        if (previous != null) { previous.removeAllListeners(); previous.cancel(); }
        for (View frame : before.keySet()) {
            frame.setTranslationX(0); frame.setTranslationY(0); frame.setScaleX(1); frame.setScaleY(1);
        }
        before.clear(); boolean notify = running; running = false;
        Runnable callback = settled; settled = null;
        if (notify && callback != null) callback.run();
    }
    @Override public void close() { settled = null; finish(); }
}
