package ls.augment.com;

import android.os.SystemClock;
import android.view.DragEvent;
import android.view.View;
import android.widget.HorizontalScrollView;

/** Frame-driven phone drag scrolling. No timer survives drag end, exit, detach or host stop. */
final class AtomicWorkbenchDragScroller implements AutoCloseable {
    private final HorizontalScrollView viewport;
    private final float edge, maximum;
    private final Runnable frame = this::tick;
    private float speed, remainder;
    private long previous;
    private boolean posted, closed;

    AtomicWorkbenchDragScroller(HorizontalScrollView viewport, float density) {
        this.viewport = viewport; edge = 40f * density; maximum = 420f * density;
    }

    void event(View target, DragEvent event) {
        if (closed) return;
        switch (event.getAction()) {
            case DragEvent.ACTION_DRAG_LOCATION:
            case DragEvent.ACTION_DRAG_ENTERED:
                int[] source = new int[2], container = new int[2];
                target.getLocationInWindow(source); viewport.getLocationInWindow(container);
                float x = event.getX() + source[0] - container[0];
                float y = event.getY() + source[1] - container[1];
                speed = y >= 0 && y <= viewport.getHeight()
                        ? AtomicWorkbenchDragScrollPolicy.velocity(x, 0, viewport.getWidth(), edge, maximum) : 0;
                if (speed == 0) stop(); else if (!posted) { previous = SystemClock.uptimeMillis(); posted = true; viewport.postOnAnimation(frame); }
                break;
            case DragEvent.ACTION_DRAG_EXITED:
            case DragEvent.ACTION_DROP:
            case DragEvent.ACTION_DRAG_ENDED:
                stop(); break;
            default: break;
        }
    }

    private void tick() {
        posted = false;
        if (closed || speed == 0 || !viewport.isAttachedToWindow() || !viewport.isShown()
                || !viewport.canScrollHorizontally(speed < 0 ? -1 : 1)) { stop(); return; }
        long now = SystemClock.uptimeMillis();
        float distance = AtomicWorkbenchDragScrollPolicy.distance(speed, now - previous) + remainder; previous = now;
        int pixels = (int) distance; remainder = distance - pixels;
        viewport.scrollBy(pixels, 0);
        posted = true; viewport.postOnAnimation(frame);
    }

    void stop() { speed = remainder = 0; previous = 0; posted = false; viewport.removeCallbacks(frame); }
    @Override public void close() { closed = true; stop(); }
}
