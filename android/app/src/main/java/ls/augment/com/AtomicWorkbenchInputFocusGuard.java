package ls.augment.com;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.graphics.Color;
import android.graphics.PixelFormat;
import android.hardware.display.DisplayManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Process;
import android.os.UserManager;
import android.view.Display;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.view.inspector.WindowInspector;
import android.widget.FrameLayout;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.UUID;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Root-owned focus window on one authenticated workbench VD. Demotion persists until resume;
 * it never changes display flags, IME policy, app tasks, editor text, or a physical-phone window.
 */
final class AtomicWorkbenchInputFocusGuard implements AutoCloseable {
    private static final String PACKAGE = "ls.augment.com";
    private static final Pattern DISPLAY_NAME = Pattern.compile("DuoAtomic-([0-9]{5,10})-w([0-7])-([0-9a-f-]{36})");
    private static final long FOCUS_TIMEOUT_MS = 2500L, REMOVE_TIMEOUT_MS = 1500L;
    private final Object lock = new Object();
    private final long focusTimeout, removeTimeout;
    private final ManagedOwner managedOwner;
    private long generation;
    private boolean closed;
    private Lease lease;

    AtomicWorkbenchInputFocusGuard() { this(FOCUS_TIMEOUT_MS, REMOVE_TIMEOUT_MS, null); }

    /** Package-private deterministic deadline boundary for offline tests; not a user configuration. */
    AtomicWorkbenchInputFocusGuard(long focusTimeout, long removeTimeout) {
        this(focusTimeout, removeTimeout, null);
    }

    private AtomicWorkbenchInputFocusGuard(long focusTimeout, long removeTimeout, ManagedOwner managedOwner) {
        if (focusTimeout < 1 || focusTimeout > FOCUS_TIMEOUT_MS || removeTimeout < 1 || removeTimeout > REMOVE_TIMEOUT_MS)
            throw new IllegalArgumentException("Invalid focus guard deadline");
        this.focusTimeout = focusTimeout; this.removeTimeout = removeTimeout;
        this.managedOwner = managedOwner;
    }

    /** Only the authenticated app bridge creates this capability; no window-type override. */
    static AtomicWorkbenchInputFocusGuard managed(int uid, int user, IBinder endpoint, int rootPid,
            long session, int window, int display, String name, String unique) {
        return new AtomicWorkbenchInputFocusGuard(FOCUS_TIMEOUT_MS, REMOVE_TIMEOUT_MS,
                new ManagedOwner(uid, user, endpoint, rootPid, session, window, display, name, unique));
    }

    /** Normal return certifies a real attached-window focus callback, not merely addView/requestFocus. */
    void suspend(Context rootUserContext, Display ownedDisplay) throws Exception {
        requireProcess();
        if (managedOwner != null && !managedOwner.endpoint.isBinderAlive())
            throw new SecurityException("工作台Root会话已结束");
        if (rootUserContext == null) throw problem("工作区上下文不可用", null);
        // Descriptor reads are local. PackageManager/WMS binder work belongs to the private
        // looper so an uncooperative system service cannot block the Root engine's caller.
        Identity identity = managedOwner == null ? Identity.readLocal(ownedDisplay)
                : ownedDisplay == null ? managedOwner.expectedIdentity() : managedOwner.readLocal(ownedDisplay);
        final Lease requested;
        synchronized (lock) {
            if (closed) throw problem("输入焦点守护已关闭", null);
            if (lease != null) {
                if (!lease.identity.same(identity) || lease.removalRequested || lease.removed || lease.failure != null)
                    throw problem("旧窗口焦点守护尚未清理，请先恢复窗口", null);
                requested = lease;
            } else {
                requested = new Lease(++generation, identity, rootUserContext, ownedDisplay);
                lease = requested;
                requested.thread = new HandlerThread("DuoInputFocus-" + identity.displayId) {
                    @Override protected void onLooperPrepared() { prepare(requested); }
                };
                requested.thread.setDaemon(true);
                try { requested.thread.start(); }
                catch (Throwable failure) {
                    lease = null; generation++;
                    throw problem("焦点守护线程未能启动", failure);
                }
            }
            rejectOwnThread(requested);
        }
        boolean signalled;
        try { signalled = requested.focusReady.await(focusTimeout, TimeUnit.MILLISECONDS); }
        catch (InterruptedException interrupted) {
            requestRemoval(requested);
            Thread.currentThread().interrupt();
            throw problem("等待窗口焦点已中断，清理责任已保留", interrupted);
        }
        synchronized (lock) {
            if (signalled && lease == requested && requested.generation == generation && !closed
                    && !requested.removalRequested && requested.failure == null && requested.attached
                    && requested.focused && requested.focusCallbackSeen) return;
            if (requested.failure == null) requested.failure = problem(signalled
                    ? "窗口焦点守护未获有效确认" : "等待窗口焦点超时", null);
        }
        Removal attempt = requestRemoval(requested);
        try { awaitRemoval(requested, attempt); }
        catch (Exception cleanupFailure) {
            throw problem("窗口焦点守护未确认，且清理尚未完成，请重试恢复窗口", cleanupFailure);
        }
        throw problem("窗口焦点守护未确认，已撤除临时窗口", requested.failure);
    }

    /** Fetches the live display only on the guard looper; never blocks a Provider/Root caller on DMS. */
    void suspendManaged(Context application) throws Exception {
        if (managedOwner == null) throw new SecurityException("焦点桥能力未建立");
        suspend(application, null);
    }

    /** Remove the focus window, await detachment and release its private looper. Safe to retry after failure. */
    void resume() throws Exception {
        requireProcess();
        Lease current;
        synchronized (lock) { current = lease; if (current == null) return; rejectOwnThread(current); }
        awaitRemoval(current, requestRemoval(current));
    }

    /** Permanent close. Failed cleanup retains its exact lease and can be retried with resume/close. */
    @Override public void close() throws Exception {
        requireProcess();
        synchronized (lock) { closed = true; }
        resume();
    }

    boolean hasCleanupResponsibility() { synchronized (lock) { return lease != null; } }
    boolean hasFocusedWindow() {
        synchronized (lock) {
            return lease != null && !lease.removalRequested && !lease.removed && lease.failure == null
                    && lease.attached && lease.focused && lease.focusCallbackSeen;
        }
    }

    private void prepare(Lease requested) {
        Removal pending = null;
        synchronized (lock) {
            requested.handler = new Handler(Looper.myLooper());
            if (lease != requested || requested.removalRequested || closed) {
                pending = ensureRemovalLocked(requested);
            } else requested.creationStarted = true;
        }
        // No WindowManager call or thread join may hold lock: a stuck binder must not defeat
        // the caller's timeout or prevent the owner from retaining/retrying cleanup.
        if (pending != null) { removeOnUi(requested, pending); return; }
        try {
            Identity actual = readIdentity(requested.context, requested.display);
            if (!requested.identity.same(actual)) throw problem("工作区显示身份已经变化", null);
            Display targetDisplay = managedOwner == null ? requested.display : managedOwner.currentDisplay(requested.context);
            Context windowContext = requested.context.createWindowContext(targetDisplay,
                    WindowManager.LayoutParams.TYPE_SYSTEM_DIALOG, null);
            WindowManager manager = windowContext.getSystemService(WindowManager.class);
            if (manager == null) throw problem("系统窗口服务不可用", null);
            GuardView view = new GuardView(windowContext, requested);
            view.setBackgroundColor(Color.TRANSPARENT);
            view.setFocusable(true); view.setFocusableInTouchMode(true);
            view.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            WindowManager.LayoutParams params = new WindowManager.LayoutParams(1, 1,
                    WindowManager.LayoutParams.TYPE_SYSTEM_DIALOG,
                    WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL,
                    PixelFormat.TRANSLUCENT);
            params.flags &= ~(WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                    | WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM | WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            params.gravity = Gravity.TOP | Gravity.START; params.x = params.y = 0;
            params.dimAmount = 0f; params.windowAnimations = 0;
            params.softInputMode = WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN
                    | WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING;
            // This 1px focus-only window needs no fitted insets; keep ROM compatibility
            // from adding an IME parent-frame flag outside its exact permission contract.
            params.setFitInsetsTypes(0);
            params.setTitle(windowTitle(requested.identity));
            synchronized (lock) {
                requested.manager = manager; requested.view = view;
                if (lease != requested || requested.removalRequested || closed) {
                    pending = ensureRemovalLocked(requested);
                } else requested.addAttempted = true;
            }
            if (pending != null) { removeOnUi(requested, pending); return; }
            manager.addView(view, params);
            synchronized (lock) { requested.addReturned = true; }
            confirmFocus(requested, view);
            // This only selects the transparent root within its own window. It is never an ack.
            view.requestFocus();
            synchronized (lock) {
                if (requested.removalRequested || closed || lease != requested)
                    pending = ensureRemovalLocked(requested);
            }
            if (pending != null) removeOnUi(requested, pending);
        } catch (Throwable failure) {
            synchronized (lock) {
                // These WMS rejections mean no window was registered. Unknown failures remain
                // uncertain until removeViewImmediate succeeds; do not silently drop ownership.
                if ((failure instanceof WindowManager.BadTokenException
                        || failure instanceof WindowManager.InvalidDisplayException)
                        && requested.view != null && !requested.view.isAttachedToWindow()) requested.addRejected = true;
                requested.addFailed = requested.addAttempted && !requested.addReturned;
                requested.failure = problem("系统未建立焦点守护窗口", failure);
                requested.focusReady.countDown();
            }
            requestRemoval(requested);
        }
    }

    private Removal requestRemoval(Lease requested) {
        synchronized (lock) {
            requested.removalRequested = true; requested.focusReady.countDown();
            Removal attempt = ensureRemovalLocked(requested);
            if (attempt.done.getCount() == 0 || attempt.queued) return attempt;
            if (requested.removed) { attempt.done.countDown(); return attempt; }
            // A looper that failed before any add cannot own a system window. Release this
            // empty lease rather than strand it forever waiting for a handler that will not exist.
            if (!requested.thread.isAlive() && !requested.addAttempted) {
                requested.removed = true; attempt.done.countDown(); return attempt;
            }
            if (requested.handler != null) {
                attempt.queued = true;
                if (!requested.handler.post(() -> removeOnUi(requested, attempt))) {
                    attempt.failure = problem("焦点守护线程未接受清理，责任已保留", null); attempt.done.countDown();
                }
            }
            // If the looper has not started, prepare() observes removalRequested and cleans up.
            return attempt;
        }
    }

    private Removal ensureRemovalLocked(Lease requested) {
        if (requested.removal == null || requested.removal.done.getCount() == 0 && requested.removal.failure != null)
            requested.removal = new Removal();
        return requested.removal;
    }

    private void removeOnUi(Lease requested, Removal attempt) {
        synchronized (lock) {
            if (attempt.done.getCount() == 0) return;
            attempt.queued = true;
        }
        try {
            if (!requested.removed && requested.addAttempted && !requested.addRejected) {
                if (requested.manager == null || requested.view == null) throw problem("焦点守护窗口清理状态不完整", null);
                // openSession/ViewRoot construction can fail before WindowManagerGlobal ever
                // registers this view (e.g. an app_process PID absent from ATMS). Attachment
                // alone is insufficient evidence: inspect the exact global registration, and
                // only release a failed, never-attached add when that view is provably absent.
                boolean failedBeforeRegistration = requested.addFailed && !requested.addReturned
                        && !requested.everAttached && !requested.view.isAttachedToWindow()
                        && !registeredWithWindowManager(requested.view);
                // A previous remove can detach and then throw. Its detach callback remains
                // authoritative on retry; calling remove again would only report "not attached".
                if (!failedBeforeRegistration && (!requested.detachCallbackSeen || requested.view.isAttachedToWindow()))
                    requested.manager.removeViewImmediate(requested.view);
                if (requested.view.isAttachedToWindow()) throw problem("焦点守护窗口仍附着，清理责任已保留", null);
                if (requested.everAttached && !requested.detachCallbackSeen)
                    throw problem("尚未收到焦点守护窗口移除确认", null);
            }
            synchronized (lock) {
                requested.removed = true; requested.focused = false; requested.attached = false;
                requested.thread.quitSafely();
                attempt.done.countDown();
            }
        } catch (Throwable failure) {
            synchronized (lock) {
                attempt.failure = problem("焦点守护窗口未移除，清理责任已保留", failure);
                attempt.done.countDown();
            }
        }
    }

    private void awaitRemoval(Lease requested, Removal attempt) throws Exception {
        final long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(removeTimeout);
        try {
            if (!attempt.done.await(removeTimeout, TimeUnit.MILLISECONDS))
                throw problem("等待焦点守护清理超时，责任已保留", null);
            if (attempt.failure != null) throw problem("焦点守护清理失败，请重试恢复窗口", attempt.failure);
            long remaining = deadline - System.nanoTime();
            if (remaining > 0 && requested.thread.isAlive())
                requested.thread.join(Math.max(1L, TimeUnit.NANOSECONDS.toMillis(remaining)));
            if (requested.thread.isAlive()) throw problem("焦点守护窗口已撤除，线程退出尚未确认", null);
            synchronized (lock) {
                if (lease == requested && requested.removed) {
                    lease = null; generation++;
                    requested.view = null; requested.manager = null; requested.handler = null;
                }
            }
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt(); throw problem("等待焦点守护清理已中断，责任已保留", interrupted);
        }
    }

    private void confirmFocus(Lease requested, GuardView view) {
        synchronized (lock) {
            if (lease != requested || requested.generation != generation || closed
                    || requested.removalRequested || requested.failure != null || !requested.focusCallbackSeen
                    || !requested.addReturned || !requested.attached || !view.isAttachedToWindow() || !view.hasWindowFocus()) return;
        }
        try {
            Display currentDisplay = view.getDisplay();
            if (currentDisplay == null || currentDisplay.getDisplayId() != requested.identity.displayId
                    || !requested.identity.same(readIdentity(requested.context, requested.display)))
                throw problem("焦点守护回调显示身份不符", null);
            synchronized (lock) {
                if (lease != requested || requested.generation != generation || closed || requested.removalRequested) return;
                requested.focused = true; requested.focusReady.countDown();
            }
        } catch (Throwable failure) {
            synchronized (lock) { requested.failure = problem("焦点守护身份核验失败", failure); requested.focusReady.countDown(); }
            requestRemoval(requested);
        }
    }

    private final class GuardView extends FrameLayout {
        final Lease owner;
        GuardView(Context context, Lease owner) { super(context); this.owner = owner; }
        @Override protected void onAttachedToWindow() {
            super.onAttachedToWindow(); synchronized (lock) { owner.attached = true; owner.everAttached = true; }
            confirmFocus(owner, this);
        }
        @Override public void onWindowFocusChanged(boolean hasFocus) {
            super.onWindowFocusChanged(hasFocus);
            synchronized (lock) { owner.focused = false; if (hasFocus) owner.focusCallbackSeen = true; }
            if (hasFocus) confirmFocus(owner, this);
        }
        @Override protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            synchronized (lock) { owner.attached = false; owner.focused = false; owner.detachCallbackSeen = true; }
        }
    }

    private static final class Lease {
        final long generation; final Identity identity; final Context context; final Display display;
        final CountDownLatch focusReady = new CountDownLatch(1);
        HandlerThread thread; Handler handler; WindowManager manager; GuardView view;
        boolean creationStarted, addAttempted, addReturned, addRejected, addFailed, attached, everAttached, focused;
        boolean focusCallbackSeen, detachCallbackSeen, removalRequested, removed;
        Exception failure; Removal removal;
        Lease(long generation, Identity identity, Context context, Display display) {
            this.generation = generation; this.identity = identity; this.context = context; this.display = display;
        }
    }
    private static final class Removal {
        final CountDownLatch done = new CountDownLatch(1); boolean queued; Exception failure;
    }
    private static final class Identity {
        final int displayId, appUid; final String name, unique;
        Identity(int displayId, int appUid, String name, String unique) { this.displayId = displayId; this.appUid = appUid; this.name = name; this.unique = unique; }
        boolean same(Identity other) { return displayId == other.displayId && appUid == other.appUid && name.equals(other.name) && unique.equals(other.unique); }
        static Identity read(Context context, Display display) throws Exception {
            Identity identity = readLocal(display);
            ApplicationInfo app = context.getPackageManager().getApplicationInfo(PACKAGE, 0);
            if (app.uid != identity.appUid) throw problem("工作区应用身份不符", null);
            return identity;
        }
        static Identity readLocal(Display display) throws Exception {
            if (display == null || display.getDisplayId() <= 0 || !display.isValid())
                throw problem("工作区显示无效", null);
            Matcher name = DISPLAY_NAME.matcher(display.getName());
            if (!name.matches() || !UUID.fromString(name.group(3)).toString().equals(name.group(3)))
                throw problem("只能守护红魔Duo工作区显示", null);
            int uid = Integer.parseInt(name.group(1));
            int flags = display.getFlags(), required = displayFlag("FLAG_TRUSTED") | displayFlag("FLAG_OWN_FOCUS");
            if (uid < 10000 || integer(display, "getOwnerUid") != 0
                    || integer(display, "getType") != displayFlag("TYPE_VIRTUAL")
                    || (flags & required) != required || (flags & (Display.FLAG_PRIVATE | Display.FLAG_PRESENTATION)) != 0)
                throw problem("工作区显示所有权或策略不符", null);
            String unique = (String) invoke(display, "getUniqueId");
            if (unique == null || unique.isEmpty()) throw problem("工作区显示身份不可确认", null);
            return new Identity(display.getDisplayId(), uid, display.getName(), unique);
        }
        private static int displayFlag(String name) throws Exception { Field field = Display.class.getDeclaredField(name); field.setAccessible(true); return field.getInt(null); }
        private static int integer(Display display, String name) throws Exception { return (Integer) invoke(display, name); }
        private static Object invoke(Display display, String name) throws Exception { Method method = Display.class.getDeclaredMethod(name); method.setAccessible(true); return method.invoke(display); }
    }
    private static final class ManagedOwner {
        final int uid, user, rootPid, window, display;
        final IBinder endpoint;
        final long session;
        final String name, unique;
        ManagedOwner(int uid, int user, IBinder endpoint, int rootPid, long session,
                int window, int display, String name, String unique) {
            if (uid < 10000 || uid / 100000 != user || rootPid <= 1 || endpoint == null || session < 0
                    || window < 0 || window >= 8 || display <= 0 || name == null || unique == null || unique.isEmpty())
                throw new IllegalArgumentException("工作台焦点桥身份无效");
            this.uid = uid; this.user = user; this.endpoint = endpoint; this.rootPid = rootPid;
            this.session = session; this.window = window; this.display = display; this.name = name; this.unique = unique;
        }
        Identity readLocal(Display current) throws Exception {
            if (current == null || !current.isValid() || current.getDisplayId() != display
                    || !name.equals(current.getName()) || (current.getFlags() & (Display.FLAG_PRIVATE | Display.FLAG_PRESENTATION)) != 0)
                throw problem("工作区显示身份已经变化", null);
            Matcher parsed = DISPLAY_NAME.matcher(name);
            if (!parsed.matches() || Integer.parseInt(parsed.group(1)) != uid
                    || Integer.parseInt(parsed.group(2)) != window
                    || !UUID.fromString(parsed.group(3)).toString().equals(parsed.group(3)))
                throw problem("工作区应用或窗口身份不符", null);
            // Owner UID, unique ID, TRUSTED/OWN_FOCUS and current-user authorization are
            // independently checked by the strict system hook when this WindowContext adds.
            // Hidden Display APIs are deliberately not reflected from the normal app process.
            return expectedIdentity();
        }
        Identity expectedIdentity() { return new Identity(display, uid, name, unique); }
        Display currentDisplay(Context context) throws Exception {
            DisplayManager displays = context.getSystemService(DisplayManager.class);
            if (displays == null) throw problem("工作区显示服务不可用", null);
            Display current = displays.getDisplay(display);
            readLocal(current); return current;
        }
        Identity read(Context context) throws Exception {
            if (!endpoint.isBinderAlive() || Process.myUid() != uid || !PACKAGE.equals(context.getPackageName())
                    || context.getPackageManager().getApplicationInfo(PACKAGE, 0).uid != uid)
                throw problem("工作台焦点桥应用或会话已失效", null);
            UserManager users = context.getSystemService(UserManager.class);
            if (users == null || !users.isUserUnlocked() || !users.isUserForeground())
                throw problem("工作台用户未解锁或已不在前台", null);
            return readLocal(currentDisplay(context));
        }
    }
    private Identity readIdentity(Context context, Display display) throws Exception {
        return managedOwner == null ? Identity.read(context, display) : managedOwner.read(context);
    }
    private void requireProcess() {
        if (managedOwner == null) requireRoot();
        else if (Process.myUid() != managedOwner.uid || Process.myUid() / 100000 != managedOwner.user)
            throw new SecurityException("焦点桥只能在本机所属应用进程使用");
    }
    private static void requireRoot() { if (Process.myUid() != 0) throw new SecurityException("输入焦点守护只能在手机Root进程使用"); }
    private static void rejectOwnThread(Lease current) {
        if (Thread.currentThread() == current.thread) throw new IllegalStateException("焦点守护不能等待自身界面线程");
    }
    private static boolean registeredWithWindowManager(View view) throws Exception {
        List<View> snapshot = WindowInspector.getGlobalWindowViews();
        if (snapshot == null) throw problem("系统窗口注册状态不可核验", null);
        for (View candidate : snapshot) if (candidate == view) return true;
        return false;
    }
    private static String windowTitle(Identity identity) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(identity.unique.getBytes(StandardCharsets.UTF_8));
        StringBuilder hash = new StringBuilder(64);
        for (byte value : digest) {
            hash.append(Character.forDigit((value >>> 4) & 15, 16)); hash.append(Character.forDigit(value & 15, 16));
        }
        return "DuoAtomicInputFocus-" + identity.displayId + "-" + hash;
    }
    private static Exception problem(String message, Throwable cause) {
        // Preserve causal types/frames for Root diagnostics, while replacing every external
        // exception message so a UI/log stack cannot expose app or system window contents.
        return new GuardFailure(message + (cause == null ? "" : "（" + cause.getClass().getSimpleName() + "）"), safeCause(cause, 0));
    }
    private static final class GuardFailure extends Exception {
        GuardFailure(String message, Throwable cause) { super(message, cause); }
    }
    private static final class RedactedSystemFailure extends Exception {
        RedactedSystemFailure(String originalType) { super(originalType); }
    }
    private static Throwable safeCause(Throwable cause, int depth) {
        if (cause == null || depth >= 4) return null;
        if (cause instanceof GuardFailure) return cause;
        Throwable result;
        if (cause instanceof InvocationTargetException)
            result = new InvocationTargetException(safeCause(((InvocationTargetException) cause).getTargetException(), depth + 1));
        else {
            if (cause instanceof WindowManager.BadTokenException) result = new WindowManager.BadTokenException();
            else if (cause instanceof WindowManager.InvalidDisplayException) result = new WindowManager.InvalidDisplayException();
            else if (cause instanceof SecurityException) result = new SecurityException();
            else if (cause instanceof IllegalArgumentException) result = new IllegalArgumentException();
            else if (cause instanceof IllegalStateException) result = new IllegalStateException();
            else if (cause instanceof NullPointerException) result = new NullPointerException();
            else if (cause instanceof UnsupportedOperationException) result = new UnsupportedOperationException();
            else result = new RedactedSystemFailure(cause.getClass().getName());
            Throwable next = cause.getCause();
            if (next != cause) result.initCause(safeCause(next, depth + 1));
        }
        result.setStackTrace(cause.getStackTrace());
        return result;
    }
}
