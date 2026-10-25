package ls.augment.com;

/** One physical single-pointer gesture. Coordinates and velocities are in the same raw screen space. */
final class AtomicWorkbenchSideSwipePolicy {
    enum Action { NONE, UP, OUT }
    static final class Decision {
        final boolean consume, cancelNative, captured;
        final float x, y;
        final Action action;
        Decision(boolean consume, boolean cancelNative, boolean captured, float x, float y, Action action) {
            this.consume = consume; this.cancelNative = cancelNative; this.captured = captured; this.x = x; this.y = y; this.action = action;
        }
    }
    private final float slop, upDistance, outDistance, minimumVelocity;
    private final long longPressMillis;
    private final int outwardSign;
    private boolean tracking, blocked, captured, longPressed, nativeCancelled;
    private float startX, startY, dx, dy;
    private long downTime, lastTime;
    private Action direction = Action.NONE;

    AtomicWorkbenchSideSwipePolicy(float slop, float upDistance, float outDistance, float minimumVelocity, long longPressMillis, int outwardSign) {
        if (!finite(slop) || !finite(upDistance) || !finite(outDistance) || !finite(minimumVelocity)
                || slop <= 0 || upDistance <= slop || outDistance <= slop || minimumVelocity <= 0 || longPressMillis < 1
                || outwardSign != -1 && outwardSign != 1) throw new IllegalArgumentException("invalid_side_swipe_policy");
        this.slop = slop; this.upDistance = upDistance; this.outDistance = outDistance;
        this.minimumVelocity = minimumVelocity; this.longPressMillis = longPressMillis; this.outwardSign = outwardSign;
    }
    Decision down(float x, float y, long time) {
        clear(); if (!finite(x) || !finite(y) || time < 0) return decision(false, Action.NONE);
        tracking = true; startX = x; startY = y; downTime = lastTime = time; return decision(false, Action.NONE);
    }
    Decision move(float x, float y, long time, int pointers) {
        if (!tracking) return decision(false, Action.NONE);
        if (pointers != 1 || !finite(x) || !finite(y) || time < lastTime) return abort();
        lastTime = time; dx = x - startX; dy = y - startY;
        if (!finite(dx) || !finite(dy)) return abort();
        if (blocked || captured) return decision(false, Action.NONE);
        if (longPressed || time - downTime >= longPressMillis) { longPressed = true; return decision(false, Action.NONE); }
        if (Math.max(Math.abs(dx), Math.abs(dy)) <= slop) return decision(false, Action.NONE);
        // A diagonal tie belongs to the vertical gesture. Unsupported directions cannot become a click.
        if (Math.abs(dy) >= Math.abs(dx)) { if (dy < 0) direction = Action.UP; else return abort(); }
        else { if (dx * outwardSign > 0) direction = Action.OUT; else return abort(); }
        captured = true; return decision(true, Action.NONE);
    }
    Decision up(float x, float y, long time, int pointers, float velocityX, float velocityY) {
        Decision movement = move(x, y, time, pointers);
        Action action = Action.NONE;
        if (captured && !blocked) {
            float travel = direction == Action.UP ? -dy : dx * outwardSign;
            float velocity = direction == Action.UP ? -velocityY : velocityX * outwardSign;
            float distance = direction == Action.UP ? upDistance : outDistance;
            if (travel > slop && (travel >= distance || finite(velocity) && velocity >= minimumVelocity)) action = direction;
        }
        Decision result = decision(false, action);
        result = new Decision(result.consume, movement.cancelNative, result.captured, result.x, result.y, result.action);
        clear(); return result;
    }
    /** Pointer changes and explicit UI mutation abandon the gesture and drain to its final UP. */
    Decision abort() {
        if (!tracking) return decision(false, Action.NONE);
        blocked = true; captured = false; direction = Action.NONE; return decision(true, Action.NONE);
    }
    Decision cancel() { Decision result = decision(false, Action.NONE); clear(); return result; }
    void markLongPressed() { if (tracking && !captured && !blocked) longPressed = true; }
    private Decision decision(boolean cancelNative, Action action) {
        boolean firstCancel = cancelNative && !nativeCancelled;
        if (firstCancel) nativeCancelled = true;
        return new Decision(tracking && (captured || blocked), firstCancel, captured,
                captured && direction == Action.OUT ? outwardSign * Math.max(0, dx * outwardSign) : 0,
                captured && direction == Action.UP ? Math.min(0, dy) : 0, action);
    }
    private void clear() { tracking = blocked = captured = longPressed = nativeCancelled = false; direction = Action.NONE; dx = dy = 0; }
    private static boolean finite(float value) { return Float.isFinite(value); }
}
