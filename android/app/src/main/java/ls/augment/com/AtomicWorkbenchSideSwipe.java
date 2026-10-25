package ls.augment.com;

import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;

/** Side shield adapter only. Task/model mutation belongs to the owner's one-shot UP/OUT callback. */
final class AtomicWorkbenchSideSwipe implements View.OnTouchListener, AutoCloseable {
    interface Callback {
        /** Snapshot UI target/epoch only; no Binder calls or View mutation from this hook. */
        default void onDown() { }
        void onAction(AtomicWorkbenchSideSwipePolicy.Action action);
        default void onFinished() { }
    }
    private final View shield, frame;
    private final Callback callback;
    private final float slop, minimumVelocity, restX, restY;
    private int outwardSign;
    private AtomicWorkbenchSideSwipePolicy policy;
    private VelocityTracker velocity;
    private MotionEvent last;
    private boolean closed;
    private boolean enabled = true;
    private boolean callbackActive;

    static AtomicWorkbenchSideSwipe install(View shield, View frame, int outwardSign, Callback callback) {
        AtomicWorkbenchSideSwipe listener = new AtomicWorkbenchSideSwipe(shield, frame, outwardSign, callback);
        shield.setOnTouchListener(listener); return listener;
    }
    private AtomicWorkbenchSideSwipe(View shield, View frame, int outwardSign, Callback callback) {
        if (shield == null || frame == null || callback == null || outwardSign != -1 && outwardSign != 1) throw new IllegalArgumentException("invalid_side_swipe");
        this.shield = shield; this.frame = frame; this.outwardSign = outwardSign; this.callback = callback;
        ViewConfiguration configuration = ViewConfiguration.get(shield.getContext());
        slop = configuration.getScaledTouchSlop(); minimumVelocity = configuration.getScaledMinimumFlingVelocity();
        restX = frame.getTranslationX(); restY = frame.getTranslationY();
        if (!Float.isFinite(restX) || !Float.isFinite(restY)) throw new IllegalArgumentException("invalid_side_swipe_origin");
    }

    // Gesture observer/forwarder retains native click handling or its separate accessible actions; do not synthesize a second click.
    //noinspection ClickableViewAccessibility
    @Override public boolean onTouch(View view, MotionEvent event) {
        if (closed || view != shield || event == null) return false;
        int action = event.getActionMasked();
        if (!enabled && action == MotionEvent.ACTION_DOWN) {
            // A new disabled stream belongs entirely to the native View. An older
            // cancelled stream has already received CANCEL and cannot be revived.
            policy = null; releaseVelocity(); forget(); parent(false); finishCallback();
            return false;
        }
        if (!enabled && policy == null) return false;
        remember(event);
        if (action == MotionEvent.ACTION_DOWN) {
            finishCallback();
            releaseVelocity(); frame.animate().cancel(); restore(false);
            policy = new AtomicWorkbenchSideSwipePolicy(slop, threshold(frame.getHeight()), threshold(frame.getWidth()),
                    minimumVelocity, ViewConfiguration.getLongPressTimeout(), outwardSign);
            velocity = VelocityTracker.obtain(); addRawMovement(event);
            boolean consume = policy.down(event.getRawX(), event.getRawY(), event.getEventTime()).consume;
            callbackActive = true; callback.onDown(); return consume;
        }
        if (policy == null) return false;
        AtomicWorkbenchSideSwipePolicy.Decision decision;
        if (action == MotionEvent.ACTION_MOVE) {
            addRawMovement(event); decision = policy.move(event.getRawX(), event.getRawY(), event.getEventTime(), event.getPointerCount());
        } else if (action == MotionEvent.ACTION_POINTER_DOWN || action == MotionEvent.ACTION_POINTER_UP) {
            decision = policy.abort();
        } else if (action == MotionEvent.ACTION_UP) {
            addRawMovement(event); float vx = 0, vy = 0;
            if (velocity != null) { velocity.computeCurrentVelocity(1000); vx = velocity.getXVelocity(); vy = velocity.getYVelocity(); }
            decision = policy.up(event.getRawX(), event.getRawY(), event.getEventTime(), event.getPointerCount(), vx, vy);
        } else if (action == MotionEvent.ACTION_CANCEL) decision = policy.cancel();
        else return false;
        if (decision.cancelNative) cancelNative(event);
        if (decision.captured && action != MotionEvent.ACTION_UP && action != MotionEvent.ACTION_CANCEL) {
            frame.animate().cancel(); frame.setTranslationX(restX + decision.x); frame.setTranslationY(restY + decision.y);
        } else if (decision.cancelNative || action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) restore(true);
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            releaseVelocity(); forget(); policy = null; parent(false);
            // State is retired before callback: a reentrant render/close cannot replay it.
            try { if (decision.action != AtomicWorkbenchSideSwipePolicy.Action.NONE) callback.onAction(decision.action); }
            finally { finishCallback(); }
        }
        return decision.consume;
    }
    /** Call from the existing long-click handler; this does not replace or invoke that handler. */
    void markLongPressed() { if (policy != null) policy.markLongPressed(); }
    /** Disable main/empty shields; a cancelled old stream remains consumed through its UP. */
    void setEnabled(boolean value) {
        if (closed || enabled == value) return;
        enabled = value;
        if (!value) cancel();
    }
    void setOutwardSign(int sign) {
        if (sign != -1 && sign != 1) throw new IllegalArgumentException("invalid_side_swipe_direction");
        if (sign != outwardSign) { cancel(); outwardSign = sign; }
    }
    /** Abandon an in-flight gesture on a slot/epoch mutation; remaining events cannot click or commit. */
    void cancel() {
        if (policy != null) { AtomicWorkbenchSideSwipePolicy.Decision decision = policy.abort(); if (decision.cancelNative && last != null) cancelNative(last); }
        restore(true); releaseVelocity(); parent(false);
        finishCallback();
    }
    @Override public void close() { if (closed) return; cancel(); closed = true; forget(); policy = null; }
    private float threshold(int length) { return Math.max(slop * 2, Math.min(length * .28f, 96 * shield.getResources().getDisplayMetrics().density)); }
    private void addRawMovement(MotionEvent event) {
        if (velocity == null) return;
        MotionEvent raw = MotionEvent.obtain(event);
        try { raw.offsetLocation(event.getRawX() - event.getX(), event.getRawY() - event.getY()); velocity.addMovement(raw); }
        finally { raw.recycle(); }
    }
    private void cancelNative(MotionEvent event) {
        shield.cancelLongPress(); shield.setPressed(false);
        MotionEvent cancelled = MotionEvent.obtain(event);
        try { cancelled.setAction(MotionEvent.ACTION_CANCEL); shield.onTouchEvent(cancelled); }
        finally { cancelled.recycle(); }
        parent(true);
    }
    private void restore(boolean animate) {
        frame.animate().cancel();
        if (animate) frame.animate().translationX(restX).translationY(restY)
                .setInterpolator(new android.view.animation.OvershootInterpolator(.7f)).setDuration(260).start();
        else { frame.setTranslationX(restX); frame.setTranslationY(restY); }
    }
    private void parent(boolean disallow) { ViewParent parent = shield.getParent(); if (parent != null) parent.requestDisallowInterceptTouchEvent(disallow); }
    private void remember(MotionEvent event) { forget(); last = MotionEvent.obtain(event); }
    private void forget() { if (last != null) { last.recycle(); last = null; } }
    private void releaseVelocity() { if (velocity != null) { velocity.recycle(); velocity = null; } }
    private void finishCallback() { if (callbackActive) { callbackActive = false; callback.onFinished(); } }
}
