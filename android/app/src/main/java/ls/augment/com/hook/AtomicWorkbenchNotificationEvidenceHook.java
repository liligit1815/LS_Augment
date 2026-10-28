package ls.augment.com.hook;

import android.app.Notification;
import android.content.Context;
import android.media.session.MediaSession;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface.ExceptionMode;
import static ls.augment.com.hook.AtomicWorkbenchMediaEvidenceReflect.*;

/** Actual published NMS records. No notification text, Intent, PendingIntent or arbitrary actions leave this broker. */
final class AtomicWorkbenchNotificationEvidenceHook {
    // Only verified Java AppOps metadata and native TF_ACCEPT_FDS; neither permits one-way requests.
    private static final int BINDER_SYNC_METADATA_FLAGS = 0x12;

    private static boolean acceptsSynchronousBinderFlags(Object flags) {
        return flags instanceof Integer && (((Integer) flags) & ~BINDER_SYNC_METADATA_FLAGS) == 0;
    }

    private static final int TX = 0x00D04E04, SCHEMA = 1, MAX = 256;
    private static final String DESCRIPTOR = "ls.augment.com.atomic_notification_evidence.v1";
    private static final Map<Object, AtomicWorkbenchNotificationRecords> STORES = new WeakHashMap<>();
    private static volatile boolean installed;
    private static Class<?> binderClass, serviceClass;
    private static Method getService, getSbn, getContext;

    static boolean isInstalled() { return installed; }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    static synchronized int install(AugmentModule module, ClassLoader loader) {
        if (installed) return 1;
        try {
            AtomicWorkbenchNotificationRecords.prepare();
            serviceClass = Class.forName("com.android.server.notification.NotificationManagerService", false, loader);
            binderClass = HookCompatibility.type(loader,
                    "com.android.server.notification.NotificationManagerService$Stub",
                    "com.android.server.notification.NotificationManagerService$13");
            Class<?> nativeStub = Class.forName("android.app.INotificationManager$Stub", false, loader);
            if (!nativeStub.isAssignableFrom(binderClass)
                    || member(binderClass, "this$0").getType() != serviceClass)
                throw new NoSuchFieldException("notification_service_binder_shape");
            Class<?> record = Class.forName("com.android.server.notification.NotificationRecord", false, loader);
            Class<?> listeners = Class.forName("com.android.server.notification.NotificationManagerService$NotificationListeners", false, loader);
            member(serviceClass, "mNotificationLock"); member(serviceClass, "mNotificationsByKey"); member(serviceClass, "mService");
            member(binderClass, "this$0"); member(listeners, "this$0");
            getContext = method(serviceClass, "getContext"); getSbn = method(record, "getSbn");
            getService = Class.forName("android.os.ServiceManager", false, loader).getDeclaredMethod("getService", String.class); getService.setAccessible(true);
            Method post = method(listeners, "notifyPostedLocked", record, record, boolean.class);
            Method remove = method(serviceClass, "removeFromNotificationListsLocked", record);
            Method transact = method(binderClass, "onTransact", int.class, Parcel.class, Parcel.class, int.class);
            module.deoptimize(post); module.deoptimize(remove); module.deoptimize(transact);
            module.registerFeatureHook(module.prepareFeatureHook(post, "atomic_workbench.notification_generation.post", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                try { committed(field(chain.getThisObject(), "this$0"), chain.getArg(0), chain.getArg(1)); }
                catch (Throwable ignored) { /* A tracking failure cannot change notification delivery. */ }
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(remove, "atomic_workbench.notification_generation.remove", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                Object result = chain.proceed();
                try { removed(chain.getThisObject(), chain.getArg(0)); } catch (Throwable ignored) { }
                return result;
            }));
            // The new optional route cannot disable the original 04 reader.
            try { AtomicWorkbenchNotificationActionsBroker.prepare(loader); } catch (Throwable ignored) { }
            module.registerFeatureHook(module.prepareFeatureHook(transact, "atomic_workbench.notification_evidence.read", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                if (!binderClass.isInstance(chain.getThisObject()) || !(Integer.valueOf(TX).equals(chain.getArg(0))
                        || Integer.valueOf(AtomicWorkbenchNotificationActionsBroker.TX).equals(chain.getArg(0)))) return chain.proceed();
                Object owner = field(chain.getThisObject(), "this$0");
                if (!serviceClass.isInstance(owner) || field(owner, "mService") != chain.getThisObject()) return chain.proceed();
                Parcel reply = (Parcel) chain.getArg(2);
                if (reply != null && acceptsSynchronousBinderFlags(chain.getArg(3))) {
                    if (Integer.valueOf(TX).equals(chain.getArg(0))) read(chain.getThisObject(), (Parcel) chain.getArg(1), reply);
                    else AtomicWorkbenchNotificationActionsBroker.handle(field(chain.getThisObject(), "this$0"), (Parcel) chain.getArg(1), reply);
                }
                return true;
            }));
            installed = true; module.logFeatureInfo("ATOMIC_WORKBENCH_NOTIFICATION_EVIDENCE_INSTALLED schema=1;content=none"); return 1;
        } catch (Throwable unavailable) {
            installed = false; module.logFeatureError("ATOMIC_WORKBENCH_NOTIFICATION_EVIDENCE_UNAVAILABLE", unavailable); return 0;
        }
    }

    private static AtomicWorkbenchNotificationRecords store(Object service) {
        synchronized (STORES) { return STORES.computeIfAbsent(service, ignored -> new AtomicWorkbenchNotificationRecords()); }
    }
    static AtomicWorkbenchNotificationRecords.Lease actionLease(Object service, Object record, StatusBarNotification n) {
        return store(service).current(record,n.getKey(),n.getPackageName(),n.getUid(),n.getUserId());
    }
    private static Map<?, ?> records(Object service) throws ReflectiveOperationException {
        Object map = field(service, "mNotificationsByKey");
        if (!(map instanceof Map<?, ?>)) throw new SecurityException(); return (Map<?, ?>) map;
    }
    private static StatusBarNotification sbn(Object record) throws ReflectiveOperationException {
        Object value = getSbn.invoke(record); if (!(value instanceof StatusBarNotification)) throw new SecurityException(); return (StatusBarNotification) value;
    }
    private static void committed(Object service, Object record, Object old) throws ReflectiveOperationException {
        AtomicWorkbenchNotificationRecords registry = store(service);
        synchronized (field(service, "mNotificationLock")) {
            StatusBarNotification n = sbn(record);
            if (records(service).get(n.getKey()) != record) return;
            registry.published(record, old, n.getKey(), n.getPackageName(), n.getUid(), n.getUserId(), System.currentTimeMillis(), SystemClock.elapsedRealtime());
        }
    }
    private static void removed(Object service, Object record) throws ReflectiveOperationException {
        AtomicWorkbenchNotificationRecords registry = store(service);
        synchronized (field(service, "mNotificationLock")) {
            String key = sbn(record).getKey();
            // Removing an enqueued copy must not retire a still-published replacement.
            if (!records(service).containsKey(key)) registry.removed(key);
        }
    }

    static final class Snapshot {
        final AtomicWorkbenchNotificationRecords.Lease lease;
        final MediaSession.Token token;
        Snapshot(AtomicWorkbenchNotificationRecords.Lease lease, MediaSession.Token token) { this.lease = lease; this.token = token; }
        boolean same(Snapshot other) { return other != null && lease.same(other.lease) && token.equals(other.token); }
    }
    static Object localService() throws ReflectiveOperationException {
        if (!installed) throw new IllegalStateException("notification evidence unavailable");
        Object binder = getService.invoke(null, "notification");
        if (!binderClass.isInstance(binder)) throw new SecurityException();
        Object service = field(binder, "this$0");
        if (!serviceClass.isInstance(service) || !binder.equals(field(service, "mService"))) throw new SecurityException();
        return service;
    }
    /** Takes only NMS's lock; callers must not hold the media lock. */
    static Snapshot media(Object service, String key, String pkg, int uid, int user, MediaSession.Token token) throws ReflectiveOperationException {
        AtomicWorkbenchNotificationRecords registry = store(service);
        synchronized (field(service, "mNotificationLock")) {
            Map<?, ?> all = records(service); if (all.size() > MAX) throw new IllegalStateException("notification evidence limited");
            Object record = all.get(key); if (record == null) throw new SecurityException();
            StatusBarNotification n = sbn(record); Notification notification = n.getNotification();
            if (!key.equals(n.getKey()) || uid != n.getUid() || user != n.getUserId() || uid / 100000 != user
                    || !pkg.equals(n.getPackageName()) || notification == null || notification.visibility == Notification.VISIBILITY_SECRET
                    || (notification.flags & Notification.FLAG_GROUP_SUMMARY) != 0 || notification.extras == null)
                throw new SecurityException();
            MediaSession.Token actual = notification.extras.getParcelable(Notification.EXTRA_MEDIA_SESSION, MediaSession.Token.class);
            if (actual == null || !actual.equals(token)) throw new SecurityException();
            return new Snapshot(registry.current(record, key, pkg, uid, user), actual);
        }
    }

    private static void read(Object binder, Parcel data, Parcel reply) {
        Bundle result = new Bundle(); result.putInt("schema", SCHEMA); result.putBoolean("success", false);
        try {
            if (!installed || data == null || data.dataSize() > 8192) throw new SecurityException();
            int uid = Binder.getCallingUid(), pid = Binder.getCallingPid(); data.enforceInterface(DESCRIPTOR);
            if (data.readInt() != SCHEMA) throw new SecurityException();
            Bundle auth = data.readBundle(AtomicWorkbenchNotificationEvidenceHook.class.getClassLoader());
            String nonce = data.readString(); long deadline = data.readLong();
            if (data.dataAvail() != 0 || nonce == null || !nonce.matches("[0-9a-f]{32}")) throw new SecurityException();
            fresh(deadline);
            Object service = field(binder, "this$0");
            if (service != localService()) throw new SecurityException();
            Context context = (Context) getContext.invoke(service);
            AtomicWorkbenchSystemRootAuthority.Session principal = AtomicWorkbenchSystemRootAuthority.authenticate(context, auth, uid, pid);
            ArrayList<Bundle> list = list(service, principal.userId);
            if (!principal.isCurrent(context) || !same(list, list(service, principal.userId)) || !principal.isAlive()) throw new SecurityException(); fresh(deadline);
            result.putBoolean("success", true); result.putString("nonce", nonce); result.putLong("sample_elapsed", SystemClock.elapsedRealtime());
            result.putLong("sample_wall", System.currentTimeMillis());
            result.putParcelableArrayList("records", list);
        } catch (Throwable denied) { result.putString("status", "unavailable"); }
        Parcel budget = Parcel.obtain();
        try { budget.writeBundle(result); if (budget.dataSize() > 96 * 1024) {
            result = new Bundle(); result.putInt("schema", SCHEMA); result.putBoolean("success", false); result.putString("status", "scan_limited");
        } } finally { budget.recycle(); }
        reply.writeNoException(); reply.writeBundle(result);
    }
    private static boolean same(ArrayList<Bundle> first, ArrayList<Bundle> second) {
        if (first.size() != second.size()) return false;
        Map<String, Bundle> byKey = new java.util.HashMap<>(); for (Bundle row : second) byKey.put(row.getString("key"), row);
        for (Bundle row : first) {
            Bundle other = byKey.get(row.getString("key")); if (other == null || !row.keySet().equals(other.keySet())) return false;
            for (String key : row.keySet()) if (!java.util.Objects.equals(row.get(key), other.get(key))) return false;
        }
        return true;
    }
    private static ArrayList<Bundle> list(Object service, int user) throws ReflectiveOperationException {
        AtomicWorkbenchNotificationRecords registry = store(service); ArrayList<Bundle> result = new ArrayList<>();
        synchronized (field(service, "mNotificationLock")) {
            Map<?, ?> all = records(service); if (all.size() > MAX) throw new IllegalStateException("notification evidence limited");
            for (Object record : all.values()) {
                StatusBarNotification n = sbn(record); Notification notification = n.getNotification();
                if (n.getUid() < 0 || n.getUid() / 100000 != user || n.getUserId() != user || notification == null
                        || notification.visibility == Notification.VISIBILITY_SECRET || (notification.flags & Notification.FLAG_GROUP_SUMMARY) != 0) continue;
                AtomicWorkbenchNotificationRecords.Lease lease = registry.current(record, n.getKey(), n.getPackageName(), n.getUid(), user);
                Bundle row = new Bundle(); row.putString("key", lease.key); row.putString("package", lease.pkg); row.putInt("uid", lease.uid);
                row.putInt("user", lease.user); row.putString("generation", lease.generation); row.putLong("revision", lease.revision);
                // Category is a publisher hint, never semantic timer/recorder/action authorization.
                row.putString("category", text(notification.category, 64) ? notification.category : "");
                row.putLong("post_time", n.getPostTime());
                row.putBoolean("published_clock_known", lease.publishedClockKnown); row.putLong("published_wall", lease.publishedWall); row.putLong("published_elapsed", lease.publishedElapsed);
                boolean show = false, countDown = false;
                if (notification.extras != null) {
                    Object a = notification.extras.get(Notification.EXTRA_SHOW_CHRONOMETER), b = notification.extras.get(Notification.EXTRA_CHRONOMETER_COUNT_DOWN);
                    // Wrong types are unknown, never truthy strings or title-derived values.
                    show = a instanceof Boolean && (Boolean) a && (b == null || b instanceof Boolean);
                    countDown = b instanceof Boolean && (Boolean) b;
                }
                row.putBoolean("show_chronometer", show); row.putBoolean("count_down", countDown); row.putLong("when_wall", notification.when);
                result.add(row);
            }
        }
        return result;
    }
    static void fresh(long deadline) { long now = SystemClock.elapsedRealtime(); if (deadline <= now || deadline - now > 2000) throw new SecurityException(); }
}
