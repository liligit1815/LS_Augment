package ls.augment.com;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicReference;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import io.github.libxposed.service.XposedService;
import io.github.libxposed.service.XposedServiceHelper;

/** Uses only the framework's public service; never edits framework databases. */
public final class ModuleScopeService {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final CopyOnWriteArrayList<Runnable> LISTENERS = new CopyOnWriteArrayList<>();
    private static final CopyOnWriteArrayList<XposedService> SERVICES = new CopyOnWriteArrayList<>();
    private static final AtomicReference<PendingRequest> PENDING = new AtomicReference<>();
    private static boolean initialized;

    private ModuleScopeService() { }

    public static synchronized void initialize() {
        if (initialized) return;
        initialized = true;
        XposedServiceHelper.registerListener(new XposedServiceHelper.OnServiceListener() {
            @Override public void onServiceBind(XposedService service) {
                SERVICES.addIfAbsent(service);
                notifyChanged();
            }
            @Override public void onServiceDied(XposedService service) {
                SERVICES.remove(service);
                PendingRequest request = PENDING.get();
                if (request != null && request.service == service) {
                    finish(request, false, "框架连接已断开，尚未确认同步结果。重新连接后请刷新状态。");
                }
                notifyChanged();
            }
        });
    }

    static void addListener(Runnable listener) { LISTENERS.addIfAbsent(listener); }
    static void removeListener(Runnable listener) { LISTENERS.remove(listener); }

    private static void notifyChanged() {
        MAIN.post(() -> {
            for (Runnable listener : LISTENERS) listener.run();
        });
    }

    static XposedService service() {
        XposedService[] available = SERVICES.toArray(new XposedService[0]);
        return available.length == 0 ? null : available[0];
    }

    static final class Descriptor {
        final List<String> recommended;
        final boolean fixed;
        Descriptor(List<String> recommended, boolean fixed) {
            this.recommended = Collections.unmodifiableList(new ArrayList<>(recommended));
            this.fixed = fixed;
        }
    }

    static final class Snapshot {
        final Descriptor descriptor;
        final Set<String> actual;
        final String framework;
        final String error;
        final boolean connected;

        Snapshot(Descriptor descriptor, Set<String> actual, String framework,
                String error, boolean connected) {
            this.descriptor = descriptor;
            this.actual = Collections.unmodifiableSet(new LinkedHashSet<>(actual));
            this.framework = framework;
            this.error = error;
            this.connected = connected;
        }
    }

    /** Read the declarations actually shipped in this installed APK. */
    static Descriptor descriptor(Context context) throws IOException {
        try (ZipFile apk = new ZipFile(context.getApplicationInfo().sourceDir)) {
            ZipEntry scope = apk.getEntry("META-INF/xposed/scope.list");
            ZipEntry module = apk.getEntry("META-INF/xposed/module.prop");
            if (scope == null || module == null) throw new IOException("安装包缺少作用域声明");
            Set<String> recommended = new LinkedHashSet<>();
            try (BufferedReader input = new BufferedReader(new InputStreamReader(
                    apk.getInputStream(scope), StandardCharsets.UTF_8))) {
                String line;
                while ((line = input.readLine()) != null) {
                    line = line.trim();
                    if (!line.isEmpty() && !line.startsWith("#")) recommended.add(canonical(line));
                }
            }
            Properties properties = new Properties();
            try (java.io.InputStream input = apk.getInputStream(module)) { properties.load(input); }
            if (recommended.isEmpty()) throw new IOException("安装包未声明推荐作用域");
            return new Descriptor(new ArrayList<>(recommended),
                    Boolean.parseBoolean(properties.getProperty("staticScope", "false")));
        }
    }

    /** Binder and package reads should be invoked from a worker thread. */
    static Snapshot read(Context context) {
        Descriptor descriptor;
        try { descriptor = descriptor(context); }
        catch (Exception error) {
            return new Snapshot(null, Collections.emptySet(), "", errorMessage(error), false);
        }
        XposedService current = service();
        if (current == null) return new Snapshot(descriptor, Collections.emptySet(), "",
                "未连接框架服务。请在 LSPosed 中启用 LS_Augment，然后重新打开模块。", false);
        try {
            Set<String> actual = new LinkedHashSet<>();
            for (String scope : current.getScope()) if (scope != null) actual.add(canonical(scope));
            String framework = current.getFrameworkName() + " " + current.getFrameworkVersion();
            return new Snapshot(descriptor, actual, framework, "", true);
        } catch (RuntimeException error) {
            return new Snapshot(descriptor, Collections.emptySet(), "",
                    "框架服务读取失败：" + errorMessage(error), false);
        }
    }

    static boolean installed(Context context, String packageName) {
        if ("system".equals(packageName)) return true;
        try {
            context.getPackageManager().getApplicationInfo(packageName, 0);
            return true;
        } catch (PackageManager.NameNotFoundException ignored) { return false; }
    }

    interface RequestResult { void complete(boolean approved, String message); }

    private static final class PendingRequest {
        final XposedService service;
        final RequestResult callback;
        PendingRequest(XposedService service, RequestResult callback) {
            this.service = service;
            this.callback = callback;
        }
    }

    static boolean isSynchronizing() { return PENDING.get() != null; }

    /** Only missing, installed, already declared packages can ever be requested here. */
    static void synchronizeRecommended(Context context, RequestResult callback) {
        XposedService current = service();
        if (current == null) {
            MAIN.post(() -> callback.complete(false, "未连接框架服务，无法同步。请先在 LSPosed 中启用模块。"));
            return;
        }
        PendingRequest request = new PendingRequest(current, callback);
        if (!PENDING.compareAndSet(null, request)) {
            MAIN.post(() -> callback.complete(false, "上一项同步请求仍在等待框架处理，请先完成框架中的确认。"));
            return;
        }
        notifyChanged();
        try {
            Descriptor descriptor = descriptor(context);
            Set<String> actual = new LinkedHashSet<>();
            for (String scope : current.getScope()) if (scope != null) actual.add(canonical(scope));
            List<String> missing = new ArrayList<>();
            for (String scope : descriptor.recommended) {
                if (installed(context, scope) && !actual.contains(scope)) missing.add(scope);
            }
            if (missing.isEmpty()) {
                finish(request, true, "本机已安装应用的推荐作用域均已勾选。");
                return;
            }
            current.requestScope(missing, new XposedService.OnScopeEventListener() {
                @Override public void onScopeRequestApproved(List<String> approved) {
                    // Re-read after the callback; approval alone does not prove every target was added.
                    Set<String> active = new LinkedHashSet<>();
                    try {
                        for (String scope : current.getScope()) if (scope != null) active.add(canonical(scope));
                        int remaining = 0;
                        for (String scope : descriptor.recommended) {
                            if (installed(context, scope) && !active.contains(scope)) remaining++;
                        }
                        finish(request, remaining == 0, remaining == 0
                                ? "推荐作用域已同步。重启对应应用后生效。"
                                : "框架已处理请求，仍有 " + remaining + " 项未勾选，请在 LSPosed 中检查。");
                    } catch (RuntimeException error) {
                        finish(request, false, "框架已处理请求，但暂时无法验证结果：" + errorMessage(error));
                    }
                }
                @Override public void onScopeRequestFailed(String message) {
                    finish(request, false, "框架未完成同步：" + message
                            + "\n可在 LSPosed 中检查模块状态与推荐作用域。");
                }
            });
        } catch (Exception error) {
            finish(request, false, "同步未完成：" + errorMessage(error)
                    + "\n请在 LSPosed 中检查模块的推荐作用域。");
        }
    }

    private static void finish(PendingRequest request, boolean approved, String message) {
        if (PENDING.compareAndSet(request, null)) {
            MAIN.post(() -> request.callback.complete(approved, message));
        }
        notifyChanged();
    }

    private static String canonical(String scope) {
        return "android".equals(scope) ? "system" : scope;
    }

    private static String errorMessage(Exception error) {
        String message = error.getMessage();
        return message == null || message.isEmpty() ? error.getClass().getSimpleName() : message;
    }
}
