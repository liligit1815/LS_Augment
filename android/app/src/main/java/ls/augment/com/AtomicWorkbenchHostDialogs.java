package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.function.Consumer;

/** Tracks actual UiKit Dialog ownership without replacing any business dismiss listener. */
final class AtomicWorkbenchHostDialogs implements AutoCloseable {
    private final Set<Dialog> visible = Collections.newSetFromMap(new IdentityHashMap<>());
    private final ArrayDeque<Runnable> notifications = new ArrayDeque<>();
    private Consumer<Boolean> observer;
    private boolean dispatching;
    Dialog create(Activity activity) {
        return new Dialog(activity) {
            @Override public void show() {
                if (isShowing()) { super.show(); return; }
                opened(this);
                try { super.show(); }
                catch (RuntimeException | Error failure) { ended(this); throw failure; }
            }
            @Override public void dismiss() {
                try { super.dismiss(); } finally { if (!isShowing()) ended(this); }
            }
            @Override public void cancel() {
                try { super.cancel(); } finally { if (!isShowing()) ended(this); }
            }
        };
    }
    synchronized int depth() { return visible.size(); }
    void setObserver(Consumer<Boolean> value) {
        synchronized (this) {
            if (observer == value) return;
            Consumer<Boolean> old = observer; observer = value;
            if (!visible.isEmpty()) { queue(old, false); queue(value, true); }
        }
        dispatch();
    }
    private void opened(Dialog dialog) {
        synchronized (this) { if (visible.add(dialog) && visible.size() == 1) queue(observer, true); }
        dispatch();
    }
    private void ended(Dialog dialog) {
        synchronized (this) { if (visible.remove(dialog) && visible.isEmpty()) queue(observer, false); }
        dispatch();
    }
    private void queue(Consumer<Boolean> target, boolean value) { if (target != null) notifications.add(() -> target.accept(value)); }
    private void dispatch() {
        synchronized (this) { if (dispatching) return; dispatching = true; }
        for (;;) {
            Runnable next;
            synchronized (this) { next = notifications.poll(); if (next == null) { dispatching = false; return; } }
            try { next.run(); }
            catch (RuntimeException ignored) { /* Observer failure cannot leak Dialog ownership. */ }
            catch (Error fatal) { synchronized (this) { dispatching = false; } throw fatal; }
        }
    }
    @Override public void close() {
        ArrayList<Dialog> owned; synchronized (this) { owned = new ArrayList<>(visible); }
        for (Dialog dialog : owned) try { dialog.dismiss(); } catch (RuntimeException ignored) { }
        // Retain any actually showing Dialog responsibility until a later close/dismiss retry.
        synchronized (this) { if (!visible.isEmpty()) return; }
        setObserver(null);
    }
}
