package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import io.github.libxposed.service.XposedService;

/** App-private preferences are authoritative; the framework owns the boot-time copy. */
final class FrameworkConfigSync {
    private static final Object PUBLICATION = new Object();
    private static final AtomicBoolean QUEUED = new AtomicBoolean();
    private static final AtomicLong REQUESTS = new AtomicLong();
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread t = new Thread(r, "LSA-FrameworkConfig"); t.setDaemon(true); return t;
    });
    private static volatile Context application;
    private static boolean initialized;
    private static volatile Publication published;
    private FrameworkConfigSync() { }

    private static final class Publication {
        final XposedService service;
        final String snapshot;
        final Map<String, ?> runtime;
        Publication(XposedService service, String snapshot, Map<String, ?> runtime) {
            this.service = service; this.snapshot = snapshot; this.runtime = runtime;
        }
    }

    static boolean isPublished(ConfigSnapshot snapshot) {
        Publication current = published;
        return current != null && current.service == ModuleScopeService.service()
                && current.snapshot.equals(snapshot.serialize());
    }

    static synchronized void initialize(Context context) {
        application = context.getApplicationContext();
        if (initialized) return;
        initialized = true;
        ModuleScopeService.addListener(FrameworkConfigSync::request);
        WORKER.scheduleWithFixedDelay(FrameworkConfigSync::request, 0, 30, TimeUnit.SECONDS);
    }

    static void request() {
        if (application == null) return;
        REQUESTS.incrementAndGet();
        if (!QUEUED.compareAndSet(false, true)) return;
        WORKER.execute(() -> {
            long generation = REQUESTS.get();
            try {
                RootShell.Result result = publish(application);
                if (result.isSuccess()) LegacySettingsMigration.request(application);
            } finally {
                QUEUED.set(false);
                if (REQUESTS.get() != generation) request();
            }
        });
    }

    /** Worker-only. Reload under the publication lock so delayed saves cannot roll back state. */
    private static RootShell.Result publish(Context context) {
        synchronized (PUBLICATION) {
            XposedService service = ModuleScopeService.service();
            if (service == null) return new RootShell.Result(1, "等待 LSPosed 框架连接", false);
            try {
                if ((service.getFrameworkProperties() & XposedService.PROP_CAP_REMOTE) == 0)
                    return new RootShell.Result(1, "当前框架不支持启动配置同步", false);
                ConfigSnapshot snapshot = new AppConfig(context).configSnapshot();
                Map<String, ?> runtime = RuntimeStateStore.values(context);
                Publication previous = published;
                if (previous != null && service == previous.service && snapshot.serialize().equals(previous.snapshot)
                        && runtime.equals(previous.runtime))
                    return new RootShell.Result(0, "框架配置已同步", false);
                SharedPreferences remote = service.getRemotePreferences(RemoteConfig.GROUP);
                boolean saved = remote.edit().putString(RemoteConfig.SNAPSHOT, snapshot.serialize())
                        .putString(RemoteConfig.HIDDEN, (String) runtime.get(RemoteConfig.HIDDEN))
                        .putString(RemoteConfig.TILE, (String) runtime.get(RemoteConfig.TILE))
                        .putLong(RemoteConfig.RUNTIME_REVISION, (Long) runtime.get(RemoteConfig.RUNTIME_REVISION))
                        .commit();
                if (saved) {
                    published = new Publication(service, snapshot.serialize(), runtime);
                }
                return new RootShell.Result(saved ? 0 : 1, saved ? "框架配置已同步" : "框架配置同步失败", false);
            } catch (RuntimeException unavailable) {
                return new RootShell.Result(1, "框架暂不可用，已保留本地配置", false);
            }
        }
    }
}
