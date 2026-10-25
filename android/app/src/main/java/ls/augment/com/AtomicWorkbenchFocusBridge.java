package ls.augment.com;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Process;
import android.view.Display;
import java.util.UUID;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/** Managed-app window owner for one authenticated Provider Pending/Root session. */
final class AtomicWorkbenchFocusBridge implements AutoCloseable {
    private static final String PACKAGE = "ls.augment.com";
    private final Object lock = new Object();
    private final Context application;
    private final int uid, user, rootPid;
    private final long session;
    private final IBinder endpoint;
    private final DisplayManager displays;
    private final Entry[] entries = new Entry[AtomicWorkbenchSlotDomain.POOL_SIZE];
    private final ScheduledExecutorService cleanup;
    private boolean closed, retryQueued, listenerRegistered, unlinked, lifecycleCleanupBusy, terminal;
    private final IBinder.DeathRecipient death = this::requestClose;
    private final DisplayManager.DisplayListener displayListener = new DisplayManager.DisplayListener() {
        @Override public void onDisplayAdded(int id) { }
        @Override public void onDisplayRemoved(int id) { retireDisplay(id); }
        @Override public void onDisplayChanged(int id) {
            Display current = displays.getDisplay(id);
            synchronized (lock) {
                for (Entry entry : entries) if (entry != null && entry.identity.display == id
                        && (current == null || !current.isValid() || !entry.identity.name.equals(current.getName()))) {
                    retireDisplay(id); return;
                }
            }
        }
    };

    AtomicWorkbenchFocusBridge(Context context, int uid, int user, IBinder endpoint, int rootPid, long session) {
        Context app = context == null ? null : context.getApplicationContext();
        if (app == null) app = context;
        if (app == null || uid < 10000 || uid / 100000 != user || Process.myUid() != uid
                || !PACKAGE.equals(app.getPackageName()) || app.getApplicationInfo().uid != uid
                || endpoint == null || !endpoint.isBinderAlive() || rootPid <= 1 || session < 0)
            throw new SecurityException("工作台焦点桥所属应用或会话无效");
        application = app; this.uid = uid; this.user = user; this.endpoint = endpoint;
        this.rootPid = rootPid; this.session = session;
        displays = app.getSystemService(DisplayManager.class);
        if (displays == null) throw new IllegalStateException("工作区显示服务不可用");
        cleanup = Executors.newSingleThreadScheduledExecutor(task -> {
            Thread thread = new Thread(task, "DuoFocusBridgeCleanup"); thread.setDaemon(true); return thread;
        });
        try {
            displays.registerDisplayListener(displayListener, new Handler(Looper.getMainLooper()));
            listenerRegistered = true;
            endpoint.linkToDeath(death, 0);
            if (!endpoint.isBinderAlive()) throw new IllegalStateException("工作台Root会话已结束");
        } catch (Exception failure) {
            if (listenerRegistered) displays.unregisterDisplayListener(displayListener);
            cleanup.shutdown(); throw new IllegalStateException("焦点桥生命周期登记失败");
        }
    }

    /** Provider validates token/endpoint/session/reset first, without retaining its class lock here. */
    Bundle control(String action, Bundle identity) {
        requireOwnProcess();
        if (Binder.getCallingUid() != 0 || Binder.getCallingPid() != rootPid)
            throw new SecurityException("焦点桥仅接受已登记Root进程");
        if (!("suspend".equals(action) || "resume".equals(action) || "close".equals(action)))
            return rejectUnknownIdentity("invalid_action");
        final Identity requested;
        try { requested = Identity.read(identity, uid); }
        catch (RuntimeException invalid) { return rejectUnknownIdentity("invalid_identity"); }
        Entry entry;
        synchronized (lock) {
            entry = entries[requested.window];
            if (entry != null && !entry.identity.same(requested))
                return result(false, "identity_mismatch", entry.guard.hasFocusedWindow(), entry.guard.hasCleanupResponsibility(), null);
            if (entry != null && entry.busy)
                return result(false, "operation_busy", entry.guard.hasFocusedWindow(), true, null);
            if ("suspend".equals(action)) {
                if (closed || !endpoint.isBinderAlive())
                    return result(false, "session_ended", false, entry != null && entry.guard.hasCleanupResponsibility(), null);
                if (entry == null) {
                    entry = new Entry(requested, AtomicWorkbenchInputFocusGuard.managed(uid, user, endpoint,
                            rootPid, session, requested.window, requested.display, requested.name, requested.unique));
                    entries[requested.window] = entry;
                }
            } else if (entry == null) {
                // No stored capability means there is no view to remove. Never resolve a new
                // display by the recycled numeric ID on a cleanup request.
                return result(true, "already_restored", false, false, null);
            }
            entry.busy = true;
        }
        boolean success = false;
        Throwable failure = null;
        try {
            if ("suspend".equals(action)) {
                entry.guard.suspendManaged(application);
                success = entry.guard.hasFocusedWindow();
            } else {
                if ("close".equals(action)) entry.guard.close(); else entry.guard.resume();
                success = !entry.guard.hasCleanupResponsibility();
            }
        } catch (Exception rejected) { failure = rejected; }
        boolean suspended, pending;
        synchronized (lock) {
            entry.busy = false;
            suspended = entry.guard.hasFocusedWindow();
            if ("suspend".equals(action)) success &= suspended && !closed && !entry.retiring
                    && endpoint.isBinderAlive() && entries[requested.window] == entry;
            pending = !success && entry.guard.hasCleanupResponsibility();
            // A successful resume owns no window or UI thread. Drop its empty capability now,
            // so a promptly recreated VD in this slot cannot collide with an inert old cache.
            if (!entry.guard.hasCleanupResponsibility() && entries[requested.window] == entry)
                entries[requested.window] = null;
            if (closed) { success = !"suspend".equals(action) && !entry.guard.hasCleanupResponsibility(); scheduleRetryLocked(); }
        }
        return result(success, success ? (suspended ? "suspended" : "restored") : action + "_failed", suspended, pending, failure);
    }

    /** Nonblocking for Pending.remove/prepare and Binder death; retains failed guards until removed. */
    void requestClose() {
        requireOwnProcess();
        synchronized (lock) { closed = true; scheduleRetryLocked(); }
    }

    /** Synchronous bounded pass for explicit local shutdown; may be retried after a failure. */
    @Override public void close() throws Exception {
        requireOwnProcess();
        synchronized (lock) { closed = true; }
        Exception failure = cleanupPass();
        synchronized (lock) { if (failure != null) scheduleRetryLocked(); }
        if (failure != null) throw failure;
    }

    private void retireDisplay(int displayId) {
        synchronized (lock) {
            for (Entry entry : entries) if (entry != null && entry.identity.display == displayId) entry.retiring = true;
            scheduleRetryLocked();
        }
    }

    private void scheduleRetryLocked() {
        if (retryQueued || terminal || cleanup.isShutdown()) return;
        boolean needed = closed;
        if (!needed) for (Entry entry : entries) if (entry != null && entry.retiring) { needed = true; break; }
        if (!needed) return;
        retryQueued = true;
        try {
            cleanup.schedule(() -> {
                try { cleanupPass(); }
                catch (RuntimeException ignored) { /* Retain entries/flags and retry without external exception text. */ }
                finally {
                    synchronized (lock) {
                        retryQueued = false;
                        boolean remaining = closed && !terminal;
                        if (!remaining) for (Entry entry : entries)
                            if (entry != null && entry.retiring) { remaining = true; break; }
                        if (remaining) scheduleRetryLocked();
                    }
                }
            }, 200L, TimeUnit.MILLISECONDS);
        } catch (java.util.concurrent.RejectedExecutionException rejected) { retryQueued = false; }
    }

    private Exception cleanupPass() {
        Entry[] snapshot;
        synchronized (lock) { snapshot = entries.clone(); }
        Exception first = null;
        for (Entry entry : snapshot) {
            if (entry == null) continue;
            synchronized (lock) { if (!closed && !entry.retiring) continue; }
            try {
                entry.guard.close();
                synchronized (lock) { if (entries[entry.identity.window] == entry) entries[entry.identity.window] = null; }
            } catch (Exception failure) {
                if (first == null) first = new Exception("焦点桥窗口清理待重试");
            }
        }
        Exception lifecycleFailure = finishLifecycle();
        return first == null ? lifecycleFailure : first;
    }

    private Exception finishLifecycle() {
        boolean unregister, unlink;
        synchronized (lock) {
            boolean empty = true;
            for (Entry entry : entries) if (entry != null) { empty = false; break; }
            if (!closed || !empty || terminal) return null;
            if (lifecycleCleanupBusy) return new Exception("焦点桥生命周期仍在清理");
            lifecycleCleanupBusy = true; unregister = listenerRegistered; unlink = !unlinked;
        }
        Exception first = null;
        try {
            if (unregister) {
                try {
                    displays.unregisterDisplayListener(displayListener);
                    synchronized (lock) { listenerRegistered = false; }
                } catch (RuntimeException failed) { first = new Exception("焦点桥显示监听注销待重试"); }
            }
            if (unlink) {
                try {
                    endpoint.unlinkToDeath(death, 0);
                    synchronized (lock) { unlinked = true; }
                } catch (java.util.NoSuchElementException absent) {
                    synchronized (lock) { unlinked = true; }
                } catch (RuntimeException failed) {
                    if (first == null) first = new Exception("焦点桥死亡监听注销待重试");
                }
            }
            boolean shutdown;
            synchronized (lock) { shutdown = !listenerRegistered && unlinked; if (shutdown) terminal = true; }
            if (shutdown) try { cleanup.shutdown(); }
            catch (RuntimeException failed) {
                synchronized (lock) { terminal = cleanup.isShutdown(); }
                if (!cleanup.isShutdown() && first == null) first = new Exception("焦点桥清理线程退出待重试");
            }
        } finally { synchronized (lock) { lifecycleCleanupBusy = false; } }
        return first;
    }

    private void requireOwnProcess() {
        if (Process.myUid() != uid || Process.myUid() / 100000 != user)
            throw new SecurityException("焦点桥只能在所属应用进程运行");
    }

    private Bundle rejectUnknownIdentity(String reason) {
        synchronized (lock) {
            boolean suspended = false, pending = false;
            for (Entry entry : entries) if (entry != null) {
                suspended |= entry.guard.hasFocusedWindow();
                pending |= entry.busy || entry.guard.hasCleanupResponsibility();
            }
            return result(false, reason, suspended, pending, null);
        }
    }

    private static Bundle result(boolean success, String reason, boolean suspended, boolean pending, Throwable failure) {
        Bundle result = new Bundle(); result.putBoolean("success", success);
        result.putBoolean("focus_suspended", suspended); result.putBoolean("cleanup_pending", pending);
        result.putString("focus_reason", reason);
        result.putString("message", success ? (suspended ? "焦点守护窗口已获得真实焦点" : "已撤除焦点守护窗口")
                : pending ? "焦点窗口操作未完成，清理责任已保留" : "焦点窗口操作未完成");
        if (failure != null) {
            Throwable last = failure;
            for (int count = 0; count < 8 && last.getCause() != null && last.getCause() != last; count++) last = last.getCause();
            result.putString("focus_error_type", last.getClass().getName());
        }
        return result;
    }

    private static final class Entry {
        final Identity identity; final AtomicWorkbenchInputFocusGuard guard;
        boolean busy, retiring;
        Entry(Identity identity, AtomicWorkbenchInputFocusGuard guard) { this.identity = identity; this.guard = guard; }
    }
    private static final class Identity {
        final int window, display; final String name, unique;
        Identity(int window, int display, String name, String unique) { this.window = window; this.display = display; this.name = name; this.unique = unique; }
        boolean same(Identity other) { return window == other.window && display == other.display && name.equals(other.name) && unique.equals(other.unique); }
        static Identity read(Bundle value, int uid) {
            if (value == null) throw new IllegalArgumentException();
            int window = value.getInt("window_id", -1), display = value.getInt("display_id", -1);
            String name = value.getString("display_name", ""), unique = value.getString("unique_id", "");
            String prefix = "DuoAtomic-" + uid + "-w" + window + "-";
            if (window < 0 || window >= 8 || display <= 0 || !name.startsWith(prefix)
                    || unique.isEmpty() || unique.length() > 512) throw new IllegalArgumentException();
            String suffix = name.substring(prefix.length());
            if (!UUID.fromString(suffix).toString().equals(suffix)) throw new IllegalArgumentException();
            for (int index = 0; index < unique.length(); index++) if (Character.isISOControl(unique.charAt(index))) throw new IllegalArgumentException();
            return new Identity(window, display, name, unique);
        }
    }
}
