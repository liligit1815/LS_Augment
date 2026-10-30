package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;

/** Application-owned, foreground-only update flow. APK checks do not depend on Root or installation Hooks. */
final class AppUpdater {
    private enum State { IDLE, CHECKING, AVAILABLE, DOWNLOADING, READY, PERMISSION, INSTALLING, MESSAGE }
    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final AtomicInteger generation = new AtomicInteger();
    private volatile HttpURLConnection connection;
    private Future<?> task;
    private Activity activity;
    private AlertDialog dialog;
    private State state = State.IDLE;
    private AppUpdateManifest release;
    private File verifiedApk;
    private String message = "";
    private boolean foreground, manual, automaticPending;
    private long received;

    AppUpdater(Context context) { this.context = context.getApplicationContext(); }

    void beginForegroundSession() { automaticPending = true; }

    void attach(Activity screen) { if (activity != screen) dismiss(); activity = screen; }

    void resume() {
        foreground = true;
        boolean checkOnOpen = automaticPending;
        automaticPending = false;
        if (state == State.PERMISSION) {
            if (context.getPackageManager().canRequestPackageInstalls()) install();
            else { state = State.READY; message = "尚未允许安装此来源的应用。点击“安装”可再次授权。"; render(); }
            return;
        }
        if (state == State.INSTALLING) { state = State.IDLE; release = null; }
        if ((state == State.AVAILABLE || state == State.MESSAGE) && checkOnOpen) { check(false); return; }
        if (state != State.IDLE) { render(); return; }
        if (checkOnOpen) check(false);
    }

    void pause(Activity screen) {
        if (activity != screen) return;
        dismiss(); activity = null; foreground = false;
    }

    void checkManually() {
        if (state == State.CHECKING) { manual = true; render(); return; }
        if (state == State.AVAILABLE || state == State.DOWNLOADING || state == State.READY) { render(); return; }
        if (state == State.PERMISSION || state == State.INSTALLING) return;
        check(true);
    }

    private void check(boolean requested) {
        manual = requested; message = ""; state = State.CHECKING;
        final int request = generation.incrementAndGet();
        render();
        task = worker.submit(() -> {
            try {
                String document = readManifest(request);
                AppUpdateManifest found;
                try { found = AppUpdateManifest.parse(document); }
                catch (IOException invalid) { throw new UpdateError("更新信息无效，请稍后重试。"); }
                main.post(() -> {
                    if (!current(request)) return;
                    if (found == null) finishCheck("暂未发布可下载的版本。");
                    else if (found.versionCode <= BuildConfig.VERSION_CODE) finishCheck("已是最新版本。\n当前版本：" + BuildConfig.VERSION_NAME);
                    else if (found.minSdk > Build.VERSION.SDK_INT) finishCheck("新版需要更高的 Android 版本，当前系统暂时无法安装。");
                    else if (shouldPrompt(found)) { release = found; state = State.AVAILABLE; render(); }
                    else { state = State.IDLE; release = null; }
                });
            } catch (Exception error) {
                if(!current(request))return;
                AppUpdateFailure failure=AppUpdateFailure.classify(error,"manifest");
                logFailure("manifest",foundVersion(),null,error,failure);
                main.post(() -> {
                    if (!current(request)) return;
                    finishCheck(error instanceof UpdateError ? error.getMessage()
                            : failure.userMessage());
                });
            }
        });
    }

    private void finishCheck(String result) {
        state = manual ? State.MESSAGE : State.IDLE;
        message = result; render();
    }

    private SharedPreferences preferences() { return context.getSharedPreferences("app-updates", Context.MODE_PRIVATE); }

    private boolean shouldPrompt(AppUpdateManifest found) {
        SharedPreferences saved = preferences();
        return AppUpdatePolicy.shouldPrompt(found.versionCode, manual, saved.getInt("skipped-version", 0),
                saved.getInt("deferred-version", 0), saved.getLong("deferred-at", 0), System.currentTimeMillis());
    }

    private void defer(boolean skip) {
        if (release == null) { cancel(); return; }
        SharedPreferences.Editor edit = preferences().edit();
        if (skip) edit.putInt("skipped-version", release.versionCode).remove("deferred-version").remove("deferred-at");
        else edit.putInt("deferred-version", release.versionCode).putLong("deferred-at", System.currentTimeMillis());
        if (!edit.commit()) {
            android.widget.Toast.makeText(context, "未能保存提醒设置，请重试。", android.widget.Toast.LENGTH_LONG).show();
            render(); return;
        }
        cancel();
    }

    private String readManifest(int request) throws Exception {
        HttpURLConnection opened = open(AppUpdatePolicy.MANIFEST_URL, false);
        try {
            requireCurrent(request);
            int status=opened.getResponseCode();
            if (status != 200) throw new AppUpdateFailure("network","http_"+status,null);
            if (opened.getContentLengthLong() > 64 * 1024) throw new UpdateError("更新信息无效，请稍后重试。");
            ByteArrayOutputStream result = new ByteArrayOutputStream();
            long deadline = SystemClock.elapsedRealtime() + 30000;
            try (InputStream input = opened.getInputStream()) {
                byte[] buffer = new byte[4096]; int count;
                while ((count = input.read(buffer)) != -1) {
                    requireCurrent(request);
                    if (SystemClock.elapsedRealtime() > deadline) throw new java.net.SocketTimeoutException();
                    if (result.size() + count > 64 * 1024) throw new UpdateError("更新信息无效，请稍后重试。");
                    result.write(buffer, 0, count);
                }
            }
            try { return result.toString(StandardCharsets.UTF_8.name()); }
            catch (Exception invalid) { throw new UpdateError("更新信息无效，请稍后重试。"); }
        } finally { opened.disconnect(); if (connection == opened) connection = null; }
    }

    private HttpURLConnection open(String address, boolean download) throws IOException {
        HttpURLConnection opened = (HttpURLConnection) URI.create(address).toURL().openConnection();
        connection = opened;
        opened.setConnectTimeout(10000); opened.setReadTimeout(download ? 30000 : 10000);
        opened.setInstanceFollowRedirects(false);
        opened.setRequestProperty("Accept", download ? "application/octet-stream" : "application/json");
        opened.setRequestProperty("Accept-Encoding", "identity");
        opened.setRequestProperty("Cache-Control", "no-cache");
        return opened;
    }

    private void download() {
        if (state != State.AVAILABLE || release == null) return;
        state = State.DOWNLOADING; received = 0; message = "";
        final AppUpdateManifest selected = release;
        final int request = generation.incrementAndGet();
        render();
        task = worker.submit(() -> {
            File temporary = null;
            DownloadTrace trace=new DownloadTrace();trace.expected=selected.size;
            try (UpdateApkProvider.DownloadLease lease=UpdateApkProvider.beginDownload(context,selected.sha256,selected.size)) {
                File directory = UpdateApkProvider.directory(context);
                if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException();
                temporary = lease.temporary;
                File cached = lease.cached;
                boolean reusable = false;
                if (cached.isFile()) {
                    trace.stage="verify_cache";
                    try { verifyFile(cached, selected, request); reusable = true; }
                    catch (Exception invalid) {
                        requireCurrent(request);
                        if (!cached.delete()) throw new UpdateError("旧更新包无法清理，请稍后重试。");
                    }
                }
                if (!reusable) {
                    trace.stage="space_check";
                    trace.available=directory.getUsableSpace();
                    AppUpdateFailure.requireSpace(trace.available,selected.size);
                    transfer(selected, temporary, request,trace);
                    trace.stage="verify";
                    verifyFile(temporary, selected, request);
                    requireCurrent(request);
                    trace.stage="rename";
                    if (!temporary.renameTo(cached)) throw new IOException();
                }
                final File ready = cached;
                main.post(() -> {
                    if (!current(request)) return;
                    verifiedApk = ready; state = State.READY;
                    message = "下载完成，已校验安装包。点击“安装”继续。";
                    if (activity != null && foreground) install(); else render();
                });
            } catch (Exception error) {
                if(!current(request))return;
                AppUpdateFailure failure=AppUpdateFailure.classify(error,trace.stage);
                logFailure(trace.stage,selected.versionCode,trace,error,failure);
                main.post(() -> {
                    if (!current(request)) return;
                    state = State.MESSAGE;
                    message = error instanceof UpdateError ? error.getMessage() : failure.userMessage();
                    render();
                });
            } finally { if (temporary != null && temporary.exists()) temporary.delete(); }
        });
    }

    private void transfer(AppUpdateManifest selected, File destination, int request,DownloadTrace trace) throws Exception {
        String address = selected.url;
        HttpURLConnection opened = null;
        try {
            for (int redirect = 0; redirect <= 5; redirect++) {
                requireCurrent(request);
                trace.stage="connect";trace.host=URI.create(address).getHost();
                opened = open(address, true);
                int code = opened.getResponseCode();
                trace.http=code;
                if (code == 200) break;
                if (code != 301 && code != 302 && code != 303 && code != 307 && code != 308)
                    throw new AppUpdateFailure("network","http_"+code,null);
                String location = opened.getHeaderField("Location");
                if (location == null || redirect == 5) throw new AppUpdateFailure("network",location==null?"redirect_missing":"redirect_limit",null);
                String next = URI.create(address).resolve(location).toString();
                if (!AppUpdatePolicy.redirectUrl(next)) throw new UpdateError("下载地址不符合发布规则，已停止下载。");
                opened.disconnect(); address = next;
            }
            requireCurrent(request);
            long length = opened.getContentLengthLong();
            if (length >= 0 && length != selected.size) throw new UpdateError("安装包大小与发布信息不一致，已停止下载。");
            long total = 0, lastProgress = 0;
            long deadline = SystemClock.elapsedRealtime() + 15L * 60 * 1000;
            trace.stage="read";
            try (InputStream input = opened.getInputStream()) {
              trace.stage="write";
              try (FileOutputStream output = new FileOutputStream(destination)) {
                byte[] buffer = new byte[64 * 1024]; int count;
                while (true) {
                    trace.stage="read";count=input.read(buffer);if(count==-1)break;
                    requireCurrent(request);
                    long now = SystemClock.elapsedRealtime();
                    if (now > deadline) throw new java.net.SocketTimeoutException();
                    total += count;
                    if (total > selected.size) throw new UpdateError("安装包大小与发布信息不一致，已停止下载。");
                    trace.stage="write";output.write(buffer, 0, count);trace.bytes=total;
                    if (now - lastProgress >= 250) {
                        lastProgress = now; final long progress = total;
                        main.post(() -> { if (current(request)) { received = progress; updateProgress(); } });
                    }
                }
                trace.stage="sync";output.getFD().sync();
              }
              trace.stage="read";
            }
            if (total != selected.size) throw new AppUpdateFailure("network","response_truncated",null);
        } finally {
            if (opened != null) { opened.disconnect(); if (connection == opened) connection = null; }
        }
    }

    private static final class DownloadTrace {
        String stage="cache",host="";long bytes,expected,available=-1;int http=-1;
    }
    private int foundVersion(){return release==null?-1:release.versionCode;}
    private void logFailure(String stage,int target,DownloadTrace trace,Throwable error,AppUpdateFailure failure){
        AuditLog.write(context,"UPDATE_FAILED","build="+BuildConfig.VERSION_NAME+";target="+target
                +";stage="+stage+";category="+(error instanceof UpdateError?"validation":failure.category)
                +";reason="+(error instanceof UpdateError?error.getMessage():failure.reason)
                +(trace==null?"":";host="+trace.host+";http="+trace.http+";received="+trace.bytes+";expected="+trace.expected+";available="+trace.available)
                +";exception="+AppUpdateFailure.trace(error));
    }

    private void verifyFile(File file, AppUpdateManifest selected, int request) throws Exception {
        if (file.length() != selected.size) throw new UpdateError("安装包大小校验失败，未启动安装。");
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (FileInputStream input = new FileInputStream(file)) {
            byte[] buffer = new byte[64 * 1024]; int count;
            while ((count = input.read(buffer)) != -1) { requireCurrent(request); digest.update(buffer, 0, count); }
        }
        if (!selected.sha256.equals(AppUpdatePolicy.hex(digest.digest()))) throw new UpdateError("安装包完整性校验失败，未启动安装。");
        PackageManager packages = context.getPackageManager();
        PackageInfo incoming = packages.getPackageArchiveInfo(file.getAbsolutePath(), PackageManager.GET_SIGNING_CERTIFICATES);
        PackageInfo installed = packages.getPackageInfo(context.getPackageName(), PackageManager.GET_SIGNING_CERTIFICATES);
        if (incoming == null || !context.getPackageName().equals(incoming.packageName)
                || incoming.getLongVersionCode() != selected.versionCode || !selected.versionName.equals(incoming.versionName)
                || incoming.getLongVersionCode() <= installed.getLongVersionCode()
                || incoming.applicationInfo == null || incoming.applicationInfo.minSdkVersion != selected.minSdk
                || selected.minSdk > Build.VERSION.SDK_INT) throw new UpdateError("安装包的应用或版本信息不匹配，未启动安装。");
        SigningInfo next = incoming.signingInfo, old = installed.signingInfo;
        if (next == null || old == null || next.hasMultipleSigners() || old.hasMultipleSigners())
            throw new UpdateError("安装包签名无法验证，未启动安装。");
        Signature[] signers = next.getApkContentsSigners(), current = old.getApkContentsSigners();
        if (signers == null || signers.length != 1 || current == null || current.length != 1
                || !selected.certificateSha256.equals(AppUpdatePolicy.sha256(signers[0].toByteArray())))
            throw new UpdateError("安装包签名与发布信息不一致，未启动安装。");
        Signature[] history = next.getSigningCertificateHistory();
        if (history == null) history = signers;
        String[] fingerprints = new String[history.length];
        for (int i = 0; i < history.length; i++) fingerprints[i] = AppUpdatePolicy.sha256(history[i].toByteArray());
        if (!AppUpdatePolicy.compatibleSigner(AppUpdatePolicy.sha256(current[0].toByteArray()), fingerprints))
            throw new UpdateError("安装包与当前应用的签名不兼容，未启动安装。");
    }

    private void install() {
        if ((state != State.READY && state != State.PERMISSION)
                || activity == null || !foreground || activity.isFinishing() || activity.isDestroyed()
                || verifiedApk == null || release == null) return;
        if (!context.getPackageManager().canRequestPackageInstalls()) {
            state = State.PERMISSION; dismiss();
            try { activity.startActivity(new Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,
                    Uri.parse("package:" + context.getPackageName()))); }
            catch (Exception unavailable) { state = State.READY; message = "无法打开安装来源设置，请在系统设置中允许此应用安装更新。"; render(); }
            return;
        }
        // The archive was verified before READY. Re-read its digest and signatures after returning from settings.
        state = State.DOWNLOADING; received = release.size; message = "正在复核安装包…"; render();
        final int request = generation.incrementAndGet();
        final AppUpdateManifest selected = release;
        final File file = verifiedApk;
        task = worker.submit(() -> {
            try {
                verifyFile(file, selected, request);
                Uri uri = UpdateApkProvider.grant(context, file);
                main.post(() -> {
                    if (!current(request)) return;
                    if (activity == null || !foreground) { state = State.READY; message = "安装包已校验，点击“安装”继续。"; return; }
                    dismiss();
                    try {
                        Intent intent = new Intent(Intent.ACTION_VIEW).setDataAndType(uri, "application/vnd.android.package-archive")
                                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                        android.content.pm.ResolveInfo installer = null;
                        for (android.content.pm.ResolveInfo handler : context.getPackageManager().queryIntentActivities(intent,
                                PackageManager.MATCH_DEFAULT_ONLY | PackageManager.MATCH_SYSTEM_ONLY)) {
                            if (handler.activityInfo == null || !handler.activityInfo.enabled || !handler.activityInfo.exported
                                    || "android".equals(handler.activityInfo.packageName)
                                    || "com.android.intentresolver".equals(handler.activityInfo.packageName)) continue;
                            if (installer == null) installer = handler;
                            if (handler.activityInfo.packageName.contains("packageinstaller")) { installer = handler; break; }
                        }
                        if (installer == null) throw new android.content.ActivityNotFoundException();
                        intent.setClassName(installer.activityInfo.packageName, installer.activityInfo.name);
                        state = State.INSTALLING; activity.startActivity(intent);
                    } catch (Exception unavailable) { state = State.READY; message = "无法打开系统安装界面，请稍后重试。"; render(); }
                });
            } catch (Exception error) {
                if(!current(request))return;
                AppUpdateFailure failure=AppUpdateFailure.classify(error,"verify");
                logFailure("install_verify",selected.versionCode,null,error,failure);
                main.post(() -> {
                    if (!current(request)) return;
                    state = State.MESSAGE; message = error instanceof UpdateError ? error.getMessage() : failure.userMessage(); render();
                });
            }
        });
    }

    private void render() {
        dismiss();
        if (activity == null || !foreground || activity.isFinishing() || activity.isDestroyed()) return;
        AlertDialog.Builder builder;
        switch (state) {
            case CHECKING:
                if (!manual) return;
                builder = AppDialogs.builder(activity).setTitle("检查更新").setMessage("正在检查新版本…")
                        .setNegativeButton("取消", (d, w) -> cancel()); break;
            case AVAILABLE:
                builder = AppDialogs.builder(activity).setTitle("发现新版本")
                        .setMessage("当前版本：" + BuildConfig.VERSION_NAME + "\n新版：" + release.versionName
                                + "\n安装包：" + android.text.format.Formatter.formatFileSize(context, release.size)
                                + "\n\n更新内容\n" + (release.notes.isBlank() ? "暂无更新说明。" : release.notes))
                        .setNegativeButton("跳过此版本", (d, w) -> defer(true))
                        .setNeutralButton("稍后提醒", (d, w) -> defer(false))
                        .setPositiveButton("立即更新", (d, w) -> download()); break;
            case DOWNLOADING:
                builder = AppDialogs.builder(activity).setTitle(message.isEmpty() ? "下载更新" : "校验更新")
                        .setMessage(progressText()).setNegativeButton("取消", (d, w) -> cancel()); break;
            case READY:
                builder = AppDialogs.builder(activity).setTitle("安装更新").setMessage(message)
                        .setNegativeButton("稍后", (d, w) -> cancel()).setPositiveButton("安装", (d, w) -> install()); break;
            case MESSAGE:
                builder = AppDialogs.builder(activity).setTitle("检查更新").setMessage(message)
                        .setPositiveButton("知道了", (d, w) -> cancel()); break;
            default: return;
        }
        dialog = builder.create();
        dialog.setCanceledOnTouchOutside(false);
        dialog.setOnCancelListener(d -> { if (state == State.AVAILABLE) defer(false); else cancel(); });
        dialog.show();
    }

    private String progressText() {
        if (!message.isEmpty()) return message;
        if (release == null) return "正在下载…";
        return "已下载 " + Math.min(100, received * 100 / release.size) + "%\n"
                + android.text.format.Formatter.formatFileSize(context, received) + " / "
                + android.text.format.Formatter.formatFileSize(context, release.size);
    }

    private void updateProgress() { if (dialog != null && state == State.DOWNLOADING) dialog.setMessage(progressText()); }
    private void dismiss() { if (dialog != null) { dialog.dismiss(); dialog = null; } }
    private void cancel() { cancelTask(); state = State.IDLE; release = null; verifiedApk = null; message = ""; dismiss(); }
    private void cancelTask() {
        generation.incrementAndGet();
        HttpURLConnection opened = connection; if (opened != null) opened.disconnect();
        if (task != null) task.cancel(true);
    }
    private boolean current(int request) { return generation.get() == request; }
    private void requireCurrent(int request) throws IOException {
        if (!current(request) || Thread.currentThread().isInterrupted()) throw new IOException("Cancelled");
    }
    private static final class UpdateError extends IOException {
        UpdateError(String message) { super(message); }
    }
}
