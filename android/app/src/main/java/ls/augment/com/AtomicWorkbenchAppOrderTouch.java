package ls.augment.com;

import android.graphics.Rect;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ScrollView;

/** Page-local reordering of existing UiKit rows. No Android/global drag, clipboard or payload. */
final class AtomicWorkbenchAppOrderTouch implements AutoCloseable {
    interface Host {
        boolean current(String key, View row, int ticket);
        String target(String source, float rawX, float rawY);
        void move(String source, String before);
    }
    private final ScrollView viewport;
    private final Host host;
    private final float edge, maximum, lift;
    private final Runnable frame = this::tick;
    private Touch pressed, active;
    private boolean closed, posted;
    private long previous;
    private float remainder;

    AtomicWorkbenchAppOrderTouch(ScrollView viewport, float density, Host host) {
        this.viewport = viewport; this.host = host;
        edge = 48f * density; maximum = 420f * density; lift = 8f * density;
    }


    // Gesture observer/forwarder retains native click handling or its separate accessible actions; do not synthesize a second click.
    //noinspection ClickableViewAccessibility
    void bind(View handle, View row, String key, int ticket) {
        Touch touch = new Touch(handle, row, key, ticket);
        handle.setOnTouchListener((view, event) -> touch.event(event));
        handle.setOnLongClickListener(view -> touch.begin());
    }
    boolean active() { return active != null; }
    float pointerY() {
        if (active == null) return 0;
        int[] origin = new int[2]; viewport.getLocationOnScreen(origin); return active.y - origin[1];
    }

    private final class Touch {
        final View handle, row;
        final String key;
        final int ticket;
        int pointer = -1, scrollAtStart;
        long down;
        float x, y, yAtStart, priorTranslation, priorElevation, appliedTranslation, appliedElevation;
        boolean held, consumed;
        Touch(View handle, View row, String key, int ticket) {
            this.handle = handle; this.row = row; this.key = key; this.ticket = ticket;
        }
        boolean current() { return !closed && held && host.current(key, row, ticket); }
        boolean event(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                cancel(); consumed = false;
                if (closed || event.getPointerCount() != 1 || !host.current(key, row, ticket)) return false;
                pressed = this; held = true; down = event.getDownTime(); pointer = event.getPointerId(0);
                x = event.getRawX(); y = event.getRawY(); return false; // Preserve Button click/long-press handling.
            }
            if (event.getDownTime() != down) return true; // A late old sequence cannot cancel a new gesture or click its Button.
            boolean owned = active == this || consumed;
            if (action == MotionEvent.ACTION_CANCEL || event.getPointerCount() != 1
                    || event.getPointerId(0) != pointer || !current()) {
                if (pressed == this || active == this) cancel(); return owned;
            }
            x = event.getRawX(); y = event.getRawY();
            if (action == MotionEvent.ACTION_MOVE && active == this) {
                translate(); schedule(); return true;
            }
            if (action == MotionEvent.ACTION_UP) {
                String target = null;
                try { if (active == this && current()) target = host.target(key, x, y); }
                finally { if (pressed == this || active == this) cancel(!owned); }
                if (target != null && !key.equals(target)) host.move(key, target);
                return owned;
            }
            return owned;
        }
        boolean begin() {
            if (pressed != this || !current() || active != null) return false;
            active = this; consumed = true; scrollAtStart = viewport.getScrollY(); yAtStart = y;
            handle.setPressed(false);
            priorTranslation = row.getTranslationY(); priorElevation = row.getElevation();
            appliedTranslation = priorTranslation; appliedElevation = Math.max(priorElevation, lift);
            row.setElevation(appliedElevation);
            if (handle.getParent() != null) handle.getParent().requestDisallowInterceptTouchEvent(true);
            schedule(); return true;
        }
        void translate() {
            appliedTranslation = priorTranslation + y - yAtStart + viewport.getScrollY() - scrollAtStart;
            row.setTranslationY(appliedTranslation);
        }
        void restore() {
            if (Float.compare(row.getTranslationY(), appliedTranslation) == 0) row.setTranslationY(priorTranslation);
            if (Float.compare(row.getElevation(), appliedElevation) == 0) row.setElevation(priorElevation);
            if (handle.getParent() != null) handle.getParent().requestDisallowInterceptTouchEvent(false);
        }
    }

    private float speed() {
        if (active == null || !active.current() || !viewport.isAttachedToWindow() || !viewport.isShown()) return 0;
        Rect bounds = new Rect();
        if (!viewport.getGlobalVisibleRect(bounds) || active.x < bounds.left || active.x > bounds.right) return 0;
        return AtomicWorkbenchDragScrollPolicy.velocity(active.y, bounds.top, bounds.bottom, edge, maximum);
    }
    private void schedule() {
        if (speed() == 0) { stopTimer(); return; }
        if (!posted) { posted = true; previous = SystemClock.uptimeMillis(); viewport.postOnAnimation(frame); }
    }
    private void tick() {
        posted = false;
        if (active == null) return;
        if (!active.current()) { cancel(); return; }
        float speed = speed();
        if (speed == 0 || !viewport.canScrollVertically(speed < 0 ? -1 : 1)) { stopTimer(); return; }
        long now = SystemClock.uptimeMillis();
        float distance = AtomicWorkbenchDragScrollPolicy.distance(speed, now - previous) + remainder;
        previous = now; int pixels = (int) distance; remainder = distance - pixels;
        viewport.scrollBy(0, pixels); active.translate();
        posted = true; viewport.postOnAnimation(frame);
    }
    private void stopTimer() { viewport.removeCallbacks(frame); posted = false; previous = 0; remainder = 0; }
    void cancel() { cancel(false); }
    private void cancel(boolean preserveButtonUp) {
        stopTimer(); Touch old = active; active = null;
        if (old != null) old.restore();
        if (pressed != null) {
            pressed.held = false; pressed.handle.cancelLongPress();
            if (!preserveButtonUp) pressed.handle.setPressed(false);
            pressed = null;
        }
    }
    @Override public void close() { closed = true; cancel(); }
}
