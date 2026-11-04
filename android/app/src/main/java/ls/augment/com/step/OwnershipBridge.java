package ls.augment.com.step;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Exact task-ID ownership, including the older Shell without addListenerForTaskId. */
public final class OwnershipBridge {
    private final Object organizer, table, lock;
    private final Method get, put, remove, owner, change, add, release;
    public OwnershipBridge(Object organizer, Class<?> info, Class<?> surface, Class<?> listener) throws Exception {
        this.organizer = organizer;
        lock = field(organizer, "mLock");
        table = field(organizer, "mTaskListeners");
        if (lock == null || table == null) throw new IllegalStateException("missing organizer state");
        get = method(table.getClass(), "get", int.class);
        put = method(table.getClass(), "put", int.class, Object.class);
        remove = method(table.getClass(), "remove", int.class);
        owner = method(organizer.getClass(), "getTaskListener", info, boolean.class);
        change = method(organizer.getClass(), "updateTaskListenerIfNeeded", info, surface, listener, listener);
        if (change.getReturnType() != boolean.class || !listener.isAssignableFrom(owner.getReturnType()))
            throw new IllegalStateException("unknown organizer method result");
        release = method(organizer.getClass(), "removeListener", listener);
        Method modern;
        try { modern = method(organizer.getClass(), "addListenerForTaskId", listener, int.class); }
        catch (NoSuchMethodException absent) { modern = null; }
        if (modern != null && modern.getReturnType() != void.class) throw new IllegalStateException("unknown exact-listener API");
        add = modern;
    }
    public String path() { return add == null ? "legacy_exact_id" : "native_exact_id"; }
    public Object owner(Object info) throws Exception { return owner.invoke(organizer, info, false); }
    public Object exact(int id) throws Exception { return get.invoke(table, id); }
    public Object fallback() throws Exception { return exact(-2); }
    public void acquire(int id, Object info, Object leash, Object listener) throws Exception {
        synchronized (lock) {
            if (id <= 0 || exact(id) != null) throw new IllegalStateException("task already has an exact owner");
            Object previous = fallback();
            if (previous == null || owner(info) != previous) throw new IllegalStateException("not the default fullscreen owner");
            boolean mayHaveNotified = false;
            try {
                if (add != null) { mayHaveNotified = true; add.invoke(organizer, listener, id); }
                else {
                    put.invoke(table, id, listener);
                    mayHaveNotified = true;
                    if (!Boolean.TRUE.equals(change.invoke(organizer, info, leash, previous, listener))) {
                        mayHaveNotified = false;
                        throw new IllegalStateException("legacy owner transfer rejected");
                    }
                }
                if (exact(id) != listener || owner(info) != listener) throw new IllegalStateException("owner transfer not confirmed");
            } catch (Exception failure) {
                if (exact(id) == listener) {
                    remove.invoke(table, id);
                    // Native callbacks can fail part way through; report failure if the inverse fails too.
                    try { if (mayHaveNotified) change.invoke(organizer, info, leash, listener, previous); }
                    catch (Exception inverse) { failure.addSuppressed(inverse); }
                }
                throw failure;
            }
        }
    }
    public void release(int id, Object listener) throws Exception {
        synchronized (lock) {
            Object current = exact(id);
            if (current == null) return;
            if (current != listener) throw new IllegalStateException("refusing to release a different owner");
            // A unique listener is allocated per task. It never owns another task or a type-wide key.
            release.invoke(organizer, listener);
            if (exact(id) == listener) throw new IllegalStateException("task owner was not released");
        }
    }
    /** During terminal cleanup a vanished task may already belong to a different owner. */
    public void releaseIfOwned(int id, Object listener) throws Exception {
        synchronized (lock) {
            if (exact(id) == listener) release(id, listener);
        }
    }
    /** Android 17 Shell may inherit this public callback from a parent interface. */
    public static Method taskVanished(Class<?> listener, Class<?> info) throws NoSuchMethodException {
        Method callback = listener.getMethod("onTaskVanished", info);
        if (callback.getReturnType() != void.class || java.lang.reflect.Modifier.isStatic(callback.getModifiers()))
            throw new NoSuchMethodException("Unknown task disappearance callback: " + callback);
        return callback;
    }
    public static Method method(Class<?> type, String name, Class<?>... args) throws NoSuchMethodException {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try { Method m = c.getDeclaredMethod(name, args); m.setAccessible(true); return m; }
            catch (NoSuchMethodException absent) { }
        }
        throw new NoSuchMethodException(type.getName() + "#" + name);
    }
    public static Object field(Object value, String name) throws Exception {
        for (Class<?> c = value.getClass(); c != null; c = c.getSuperclass()) {
            try { Field f = c.getDeclaredField(name); f.setAccessible(true); return f.get(value); }
            catch (NoSuchFieldException absent) { }
        }
        throw new NoSuchFieldException(name);
    }
}
