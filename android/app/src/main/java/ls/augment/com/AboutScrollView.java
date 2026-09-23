package ls.augment.com;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.animation.DecelerateInterpolator;
import android.widget.ScrollView;
import java.util.function.Predicate;

/** Optional top-edge rebound for the about list; its sibling brand overlay stays still. */
public final class AboutScrollView extends ScrollView {
    private final int touchSlop;
    private final float maximumOffset;
    private boolean aboutEnabled;
    private int savedOverScrollMode;
    private Runnable reboundListener;
    private Predicate<MotionEvent> headerHitTest;
    private ValueAnimator reboundAnimator;
    private View shiftedChild;
    private float offset;

    private boolean gestureActive, ownsGesture, blocked, atTop, startPull, headerGesture;
    private int pointerId = MotionEvent.INVALID_POINTER_ID;
    private float anchorX, anchorY, pullDistance;

    public AboutScrollView(Context context) {
        super(context);
        touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        maximumOffset = 96f * getResources().getDisplayMetrics().density;
        savedOverScrollMode = getOverScrollMode();
    }

    public void setAboutEnabled(boolean enabled) {
        if (aboutEnabled != enabled) {
            if (enabled) {
                savedOverScrollMode = getOverScrollMode();
                // Avoid a second platform edge stretch, including when motion is off.
                super.setOverScrollMode(OVER_SCROLL_NEVER);
            } else {
                super.setOverScrollMode(savedOverScrollMode);
            }
        }
        aboutEnabled = enabled;
        if (!enabled) cancelRebound();
    }

    public void setReboundListener(Runnable listener) {
        reboundListener = listener;
    }

    /** Reserves a visible header hit for this entire stream before children see DOWN. */
    public void setHeaderHitTest(Predicate<MotionEvent> hitTest) {
        headerHitTest = hitTest;
    }

    /** Current child translation in pixels; the real scroll position is untouched. */
    public float reboundOffset() {
        return offset;
    }

    public void cancelRebound() {
        stopAnimator();
        setOffset(0f);
        startPull = false;
        if (gestureActive) blocked = true;
        // Retain ownership through UP so a canceled pull cannot become a child click.
    }

    @Override public boolean dispatchTouchEvent(MotionEvent event) {
        final int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            stopAnimator();
            setOffset(0f);
            clearGesture();
            gestureActive = true;
            pointerId = event.getPointerId(0);
            anchorX = event.getX();
            anchorY = event.getY();
            atTop = getScrollY() == 0;
            blocked = !canRebound();
            headerGesture = aboutEnabled && headerHitTest != null && headerHitTest.test(event);
        } else if (gestureActive) {
            startPull = false;
            if (action == MotionEvent.ACTION_POINTER_DOWN
                    || action == MotionEvent.ACTION_POINTER_UP
                    || event.getPointerCount() != 1) {
                blocked = true;
                if (ownsGesture) cancelRebound();
            } else if (!canRebound() || event.findPointerIndex(pointerId) < 0) {
                blocked = true;
                if (ownsGesture) cancelRebound();
            } else if (action == MotionEvent.ACTION_MOVE && !blocked) {
                prepareMove(event);
            }
        }

        // A link/selection TextView may have disallowed interception after DOWN.
        // Only reclaim an established vertical pull at the top, never a normal tap.
        if (startPull) super.requestDisallowInterceptTouchEvent(false);
        try {
            return super.dispatchTouchEvent(event);
        } finally {
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                // Defensive cleanup even if a parent/child changed dispatch ownership.
                if (ownsGesture) {
                    if (action == MotionEvent.ACTION_UP && !blocked) releaseRebound();
                    else cancelRebound();
                }
                clearGesture();
            }
        }
    }

    private boolean canRebound() {
        return aboutEnabled && getChildCount() == 1 && ValueAnimator.areAnimatorsEnabled();
    }

    private void prepareMove(MotionEvent event) {
        float x = event.getX(), y = event.getY();
        if (getScrollY() != 0) {
            if (ownsGesture) cancelRebound();
            atTop = false;
            anchorX = x;
            anchorY = y;
            return;
        }
        if (!atTop) {
            // A native downward scroll reached the top during this same gesture.
            atTop = true;
            anchorX = x;
            anchorY = y;
            return;
        }
        float distanceY = y - anchorY;
        pullDistance = Math.max(0f, distanceY - touchSlop);
        if (ownsGesture) {
            if (pullDistance == 0f) {
                // Reversing beyond the start cancels the pull; do not create a fling.
                cancelRebound();
            }
        } else {
            startPull = distanceY > touchSlop && distanceY > Math.abs(x - anchorX);
        }
    }

    @Override public boolean onInterceptTouchEvent(MotionEvent event) {
        if (ownsGesture) return true;
        if (startPull) {
            beginPull(event);
            return true;
        }
        if (headerGesture) return true;
        return super.onInterceptTouchEvent(event);
    }

    @Override public boolean onTouchEvent(MotionEvent event) {
        if (!ownsGesture && startPull) beginPull(event);
        if (!ownsGesture) return super.onTouchEvent(event);

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_MOVE:
                if (!blocked) {
                    // Increasing resistance, approaching but never exceeding 96 dp.
                    setOffset(maximumOffset * pullDistance / (pullDistance + 2f * maximumOffset));
                }
                break;
            case MotionEvent.ACTION_UP:
                if (blocked) cancelRebound();
                else releaseRebound();
                ownsGesture = false;
                releaseParent();
                break;
            case MotionEvent.ACTION_CANCEL:
                cancelRebound();
                ownsGesture = false;
                releaseParent();
                break;
            default:
                break;
        }
        return true;
    }

    private void beginPull(MotionEvent event) {
        ownsGesture = true;
        startPull = false;
        stopAnimator();
        // Clear ScrollView's velocity/drag state if it previously owned this stream.
        MotionEvent cancel = MotionEvent.obtain(event);
        cancel.setAction(MotionEvent.ACTION_CANCEL);
        try {
            super.onTouchEvent(cancel);
        } finally {
            cancel.recycle();
        }
        ViewParent parent = getParent();
        if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
        // Intercepting a child's MOVE first delivers CANCEL to that child. Apply
        // the pull here too, without waiting for another MOVE to reach onTouchEvent.
        setOffset(maximumOffset * pullDistance / (pullDistance + 2f * maximumOffset));
    }

    private void releaseRebound() {
        stopAnimator();
        if (offset <= 0f || !canRebound()) {
            setOffset(0f);
            return;
        }
        final ValueAnimator animator = ValueAnimator.ofFloat(offset, 0f);
        reboundAnimator = animator;
        animator.setDuration(220L + Math.round(80f * offset / maximumOffset));
        animator.setInterpolator(new DecelerateInterpolator(2f));
        animator.addUpdateListener(value -> {
            if (reboundAnimator != animator) return;
            if (!canRebound()) cancelRebound();
            else setOffset((Float) value.getAnimatedValue());
        });
        animator.addListener(new AnimatorListenerAdapter() {
            @Override public void onAnimationEnd(Animator animation) {
                if (reboundAnimator == animator) {
                    reboundAnimator = null;
                    setOffset(0f);
                }
            }
        });
        animator.start();
    }

    private void stopAnimator() {
        ValueAnimator animator = reboundAnimator;
        reboundAnimator = null;
        if (animator != null) animator.cancel();
    }

    private void setOffset(float value) {
        View child = getChildCount() == 1 ? getChildAt(0) : null;
        float next = child == null ? 0f : Math.max(0f, Math.min(maximumOffset, value));
        boolean changed = offset != next || shiftedChild != child;
        if (shiftedChild != null && shiftedChild != child) shiftedChild.setTranslationY(0f);
        shiftedChild = child;
        offset = next;
        if (child != null && child.getTranslationY() != next) {
            child.setTranslationY(next);
            changed = true;
        }
        if (changed && reboundListener != null) reboundListener.run();
    }

    private void releaseParent() {
        ViewParent parent = getParent();
        if (parent != null) parent.requestDisallowInterceptTouchEvent(false);
    }

    private void clearGesture() {
        if (ownsGesture) releaseParent();
        gestureActive = false;
        ownsGesture = false;
        blocked = false;
        atTop = false;
        startPull = false;
        headerGesture = false;
        pointerId = MotionEvent.INVALID_POINTER_ID;
        pullDistance = 0f;
    }

    @Override protected void onScrollChanged(int left, int top, int oldLeft, int oldTop) {
        if (top != 0 && (offset != 0f || ownsGesture)) cancelRebound();
        super.onScrollChanged(left, top, oldLeft, oldTop);
    }

    @Override protected void onDetachedFromWindow() {
        cancelRebound();
        clearGesture();
        super.onDetachedFromWindow();
    }

    @Override public void onWindowFocusChanged(boolean hasWindowFocus) {
        super.onWindowFocusChanged(hasWindowFocus);
        if (!hasWindowFocus) cancelRebound();
    }
}
