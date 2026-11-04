package ls.augment.com.step;

/** A late frame cannot release another operation; a held gesture finishes on its original window. */
public final class InputLease {
    private long generation;
    private boolean held, gesture, finalFrame;
    public long acquire() { held = true; finalFrame = false; return ++generation; }
    public boolean current(long token) { return held && token == generation; }
    public void touch(int action) {
        if (action == 0) gesture = true;
        if (action == 1 || action == 3) gesture = false;
    }
    public void frame(long token) { if (current(token)) finalFrame = true; }
    public boolean releasable(long token) { return current(token) && finalFrame && !gesture; }
    public void close() { held = gesture = finalFrame = false; generation++; }
}
