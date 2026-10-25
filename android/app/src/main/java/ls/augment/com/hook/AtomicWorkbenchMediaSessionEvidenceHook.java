package ls.augment.com.hook;

import android.content.Context;
import android.media.session.MediaSession;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.SystemClock;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.UUID;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface.ExceptionMode;
import static ls.augment.com.hook.AtomicWorkbenchMediaEvidenceReflect.*;

/** Notification-only controllers require an actual, live MediaSessionService record and published NMS generation. */
final class AtomicWorkbenchMediaSessionEvidenceHook {
    // Only verified Java AppOps metadata and native TF_ACCEPT_FDS; neither permits one-way requests.
    private static final int BINDER_SYNC_METADATA_FLAGS = 0x12;

    private static boolean acceptsSynchronousBinderFlags(Object flags) {
        return flags instanceof Integer && (((Integer) flags) & ~BINDER_SYNC_METADATA_FLAGS) == 0;
    }

    private static final int TX = 0x00D04E03, SCHEMA = 1;
    private static final String DESCRIPTOR = "ls.augment.com.atomic_media_session_evidence.v1";
    private static final Map<Object, String> GENERATIONS = new WeakHashMap<>();
    private static final String BOOT = UUID.randomUUID().toString().replace("-", "").substring(0, 16);
    private static long nextGeneration;
    private static volatile boolean installed;
    private static Class<?> binderClass, serviceClass, recordClass;
    private static Method getService, findRecord, isClosed;
    static boolean isInstalled() { return installed && AtomicWorkbenchNotificationEvidenceHook.isInstalled(); }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    static synchronized int install(AugmentModule module, ClassLoader loader) {
        if (installed) return 1;
        try {
            serviceClass = Class.forName("com.android.server.media.MediaSessionService", false, loader);
            binderClass = Class.forName("com.android.server.media.MediaSessionService$SessionManagerImpl", false, loader);
            recordClass = Class.forName("com.android.server.media.MediaSessionRecord", false, loader);
            member(serviceClass, "mLock"); member(serviceClass, "mContext"); member(binderClass, "this$0");
            for (String name : new String[]{"mOwnerUid", "mUserId", "mPackageName", "mSessionToken", "mController", "mDestroyed", "mLock"}) member(recordClass, name);
            findRecord = method(serviceClass, "getMediaSessionRecordLocked", MediaSession.Token.class); isClosed = method(recordClass, "isClosed");
            getService = Class.forName("android.os.ServiceManager", false, loader).getDeclaredMethod("getService", String.class); getService.setAccessible(true);
            Method transact = method(binderClass, "onTransact", int.class, Parcel.class, Parcel.class, int.class);
            module.deoptimize(transact);
            module.registerFeatureHook(module.prepareFeatureHook(transact, "atomic_workbench.media_session_evidence.read", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                if (!binderClass.isInstance(chain.getThisObject()) || !Integer.valueOf(TX).equals(chain.getArg(0))) return chain.proceed();
                Parcel reply = (Parcel) chain.getArg(2);
                if (reply != null && acceptsSynchronousBinderFlags(chain.getArg(3))) read(chain.getThisObject(), (Parcel) chain.getArg(1), reply);
                return true;
            }));
            installed = true; module.logFeatureInfo("ATOMIC_WORKBENCH_MEDIA_SESSION_EVIDENCE_INSTALLED schema=1;content=none"); return 1;
        } catch (Throwable unavailable) {
            installed = false; module.logFeatureError("ATOMIC_WORKBENCH_MEDIA_SESSION_EVIDENCE_UNAVAILABLE", unavailable); return 0;
        }
    }

    private static final class Media {
        final Object record, controller;
        final String generation;
        Media(Object record, Object controller, String generation) { this.record = record; this.controller = controller; this.generation = generation; }
        boolean same(Media other) { return other != null && record == other.record && controller == other.controller && generation.equals(other.generation); }
    }
    /** Local record lookup; active=false is supported, destroyed or detached membership is never supported. */
    private static Media media(Object service, MediaSession.Token token, int uid, int user, String pkg) throws ReflectiveOperationException {
        synchronized (field(service, "mLock")) {
            Object record = findRecord.invoke(service, token);
            if (!recordClass.isInstance(record)) throw new SecurityException();
            synchronized (field(record, "mLock")) {
                if (!Integer.valueOf(uid).equals(field(record, "mOwnerUid")) || !Integer.valueOf(user).equals(field(record, "mUserId"))
                        || !pkg.equals(field(record, "mPackageName")) || !token.equals(field(record, "mSessionToken"))
                        || !Boolean.FALSE.equals(field(record, "mDestroyed")) || !Boolean.FALSE.equals(isClosed.invoke(record)))
                    throw new SecurityException();
                Object controller = field(record, "mController");
                if (!(controller instanceof IBinder) || !((IBinder) controller).isBinderAlive()) throw new SecurityException();
                String generation;
                synchronized (GENERATIONS) { generation = GENERATIONS.get(record); if (generation == null) {
                    String counter = "0000000000000000" + Long.toHexString(++nextGeneration);
                    generation = BOOT + counter.substring(counter.length() - 16); GENERATIONS.put(record, generation);
                } }
                return new Media(record, controller, generation);
            }
        }
    }

    private static void read(Object binder, Parcel data, Parcel reply) {
        Bundle result = new Bundle(); result.putInt("schema", SCHEMA); result.putBoolean("success", false);
        try {
            if (!isInstalled() || data == null || data.dataSize() > 16384) throw new SecurityException();
            int callerUid = Binder.getCallingUid(), callerPid = Binder.getCallingPid(); data.enforceInterface(DESCRIPTOR);
            if (data.readInt() != SCHEMA) throw new SecurityException();
            Bundle auth = data.readBundle(AtomicWorkbenchMediaSessionEvidenceHook.class.getClassLoader());
            String nonce = data.readString(); long deadline = data.readLong(); String key = data.readString();
            int uid = data.readInt(), user = data.readInt(); String pkg = data.readString();
            MediaSession.Token token = data.readTypedObject(MediaSession.Token.CREATOR);
            if (data.dataAvail() != 0 || nonce == null || !nonce.matches("[0-9a-f]{32}") || !text(key, 1024) || !text(pkg, 256)
                    || token == null || uid < 0 || user < 0 || uid / 100000 != user) throw new SecurityException();
            AtomicWorkbenchNotificationEvidenceHook.fresh(deadline);
            if (!binderClass.isInstance(binder) || !binder.equals(getService.invoke(null, "media_session"))) throw new SecurityException();
            Object service = field(binder, "this$0"); if (!serviceClass.isInstance(service)) throw new SecurityException();
            Context context = (Context) field(service, "mContext");
            AtomicWorkbenchSystemRootAuthority.Session principal = AtomicWorkbenchSystemRootAuthority.authenticate(context, auth, callerUid, callerPid);
            if (principal.userId != user || principal.cleanupOnly) throw new SecurityException();
            Object nms = AtomicWorkbenchNotificationEvidenceHook.localService();
            // Five independent snapshots, no media/NMS lock nesting and no Provider IPC under either lock.
            AtomicWorkbenchNotificationEvidenceHook.Snapshot first = AtomicWorkbenchNotificationEvidenceHook.media(nms, key, pkg, uid, user, token);
            Media record = media(service, token, uid, user, pkg);
            if (!first.same(AtomicWorkbenchNotificationEvidenceHook.media(nms, key, pkg, uid, user, token))
                    || !record.same(media(service, token, uid, user, pkg))) throw new SecurityException();
            if (!principal.isCurrent(context)) throw new SecurityException();
            // Provider IPC is lock-free and may itself take time. Recheck both live records afterwards.
            if (!first.same(AtomicWorkbenchNotificationEvidenceHook.media(nms, key, pkg, uid, user, token))
                    || !record.same(media(service, token, uid, user, pkg)) || !principal.isAlive()) throw new SecurityException();
            AtomicWorkbenchNotificationEvidenceHook.fresh(deadline);
            result.putBoolean("success", true); result.putString("nonce", nonce); result.putInt("uid", uid); result.putInt("user", user);
            result.putString("package", pkg); result.putString("notification_generation", first.lease.generation);
            result.putLong("notification_revision", first.lease.revision); result.putString("media_generation", record.generation);
            result.putLong("sample_elapsed", SystemClock.elapsedRealtime());
        } catch (Throwable denied) { result.putString("status", "unavailable"); }
        reply.writeNoException(); reply.writeBundle(result);
    }
}
