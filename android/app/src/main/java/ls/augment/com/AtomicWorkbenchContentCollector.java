package ls.augment.com;

import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.PersistableBundle;
import android.os.UserManager;
import java.io.File;
import java.io.IOException;

/** Phone lifecycle adapter. Ordinary clipboard observation is deliberately limited to a foreground host. */
final class AtomicWorkbenchContentCollector implements AutoCloseable {
    final AtomicWorkbenchContentRepository repository;
    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ClipboardManager clipboard;
    private final ClipboardManager.OnPrimaryClipChangedListener changed = () -> readClipboard(false);
    private boolean foreground, registered, closed;

    AtomicWorkbenchContentCollector(Context supplied) {
        Context application = supplied.getApplicationContext();
        Context base = application == null ? supplied : application;
        if (base.isDeviceProtectedStorage()) {
            try { context = base.createPackageContext(base.getPackageName(), 0); }
            catch (android.content.pm.PackageManager.NameNotFoundException impossible) {
                throw new IllegalStateException("Application storage unavailable");
            }
            if (context.isDeviceProtectedStorage()) throw new IllegalStateException("Credential protected storage required");
        } else context = base;
        clipboard = context.getSystemService(ClipboardManager.class);
        repository = new AtomicWorkbenchContentRepository(new AtomicWorkbenchPhoneContentSource(context),
                new AtomicWorkbenchContentStore(new File(context.getFilesDir(), "workbench-content")), command -> main.post(command));
    }

    /** Call from the host's start/stop; setVisible separately tracks whether the region is displayed. */
    void setForeground(boolean value) {
        main.post(() -> {
            if (closed || foreground == value && (!value || registered)) return;
            foreground = value;
            if (!value) { unregister(); return; }
            if (!unlocked()) { access(AtomicWorkbenchContentPermissionState.Scope.LOCKED, AtomicWorkbenchContentSource.State.LOCKED); return; }
            if (clipboard == null) { access(AtomicWorkbenchContentPermissionState.Scope.UNAVAILABLE, AtomicWorkbenchContentSource.State.UNAVAILABLE); return; }
            try {
                clipboard.addPrimaryClipChangedListener(changed); registered = true;
                access(AtomicWorkbenchContentPermissionState.Scope.FOREGROUND_ONLY, AtomicWorkbenchContentSource.State.READY);
                readClipboard(false);
            } catch (RuntimeException unavailable) {
                access(AtomicWorkbenchContentPermissionState.Scope.UNAVAILABLE, AtomicWorkbenchContentSource.State.ERROR);
            }
        });
    }

    /** User action; no URI coercion, network lookup, or background claim is made. */
    void readCurrentClipboard() { main.post(() -> readClipboard(true)); }

    /** Explicit phone action. A service rejection is returned to the host instead of reported as a copy. */
    boolean copyHistory(AtomicWorkbenchContentItem item) throws IOException {
        requireClipboardAction();
        if (item == null || item.kind != AtomicWorkbenchContentItem.Kind.CLIPBOARD)
            throw new IOException("请选择剪贴板文字");
        final String text;
        try { text = AtomicWorkbenchContentPolicy.clipboardText(item.text()); }
        catch (IllegalArgumentException invalid) { throw new IOException("文字过长，最多支持 32768 个字符"); }
        if (text.isEmpty()) throw new IOException("没有可复制的文字");
        try { clipboard.setPrimaryClip(ClipData.newPlainText("工作台文字", text)); return true; }
        catch (RuntimeException unavailable) { throw new IOException("手机剪贴板未接受复制，请稍后重试"); }
    }

    /** Call only after the host confirms an action explicitly including the current system clip. */
    boolean clearSystemClipboard() throws IOException {
        requireClipboardAction();
        try { clipboard.clearPrimaryClip(); return true; }
        catch (RuntimeException unavailable) { throw new IOException("手机当前剪贴板未清空，请稍后重试"); }
    }

    private void requireClipboardAction() throws IOException {
        if (closed || !foreground) throw new IOException("请返回工作台后操作剪贴板");
        if (!unlocked()) throw new IOException("请先解锁手机后操作剪贴板");
        if (clipboard == null) throw new IOException("手机剪贴板暂不可用");
    }

    private void readClipboard(boolean explicit) {
        if (closed || !foreground) return;
        if (!unlocked()) { access(AtomicWorkbenchContentPermissionState.Scope.LOCKED, AtomicWorkbenchContentSource.State.LOCKED); return; }
        if (clipboard == null) return;
        try {
            if (!registered) { clipboard.addPrimaryClipChangedListener(changed); registered = true; }
            ClipData clip = clipboard.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) return;
            ClipDescription description = clip.getDescription();
            PersistableBundle extras = description == null ? null : description.getExtras();
            if (extras != null && extras.getBoolean(ClipDescription.EXTRA_IS_SENSITIVE, false)) return;
            CharSequence text = clip.getItemAt(0).getText();
            if (text == null) return;
            long copiedAt = AtomicWorkbenchContentPolicy.copiedAt(description == null ? 0 : description.getTimestamp(),
                    System.currentTimeMillis());
            repository.recordClipboard(text, copiedAt, false,
                    explicit ? AtomicWorkbenchContentRepository.ClipboardOrigin.USER_READ
                            : AtomicWorkbenchContentRepository.ClipboardOrigin.FOREGROUND_LISTENER);
        } catch (SecurityException denied) {
            access(AtomicWorkbenchContentPermissionState.Scope.DENIED, AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED);
        } catch (RuntimeException unavailable) {
            access(AtomicWorkbenchContentPermissionState.Scope.UNAVAILABLE, AtomicWorkbenchContentSource.State.ERROR);
        }
    }

    private boolean unlocked() {
        UserManager users = context.getSystemService(UserManager.class);
        try { return users != null && users.isUserUnlocked(); }
        catch (RuntimeException unavailable) { return false; }
    }
    private void access(AtomicWorkbenchContentPermissionState.Scope scope, AtomicWorkbenchContentSource.State state) {
        repository.clipboardAccess(scope, state);
    }
    private void unregister() {
        if (!registered || clipboard == null) return;
        try { clipboard.removePrimaryClipChangedListener(changed); }
        catch (RuntimeException ignored) { }
        registered = false;
    }
    @Override public void close() {
        main.post(() -> { if (closed) return; closed = true; foreground = false; unregister(); repository.close(); });
    }
}
