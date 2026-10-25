package ls.augment.com;

import android.media.session.MediaSession;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import java.util.Set;
import java.util.UUID;

/** Root-only private read protocol. Neither a public token nor constructing a controller proves a source. */
final class AtomicWorkbenchMediaSessionEvidenceClient {
    interface Principal { Bundle current() throws Exception; }
    private static final int TX = 0x00D04E03;
    private static final String DESCRIPTOR = "ls.augment.com.atomic_media_session_evidence.v1";
    private static final Set<String> KEYS = Set.of("schema", "success", "nonce", "uid", "user", "package",
            "notification_generation", "notification_revision", "media_generation", "sample_elapsed");
    private final Principal principal;
    AtomicWorkbenchMediaSessionEvidenceClient(Principal principal) { this.principal = principal; }
    static final class Evidence {
        final String key, pkg, notificationGeneration, mediaGeneration;
        final int uid, user;
        final long notificationRevision;
        final MediaSession.Token token;
        Evidence(StatusBarNotification n, MediaSession.Token token, Bundle response) {
            key = n.getKey(); pkg = n.getPackageName(); uid = n.getUid(); user = n.getUserId(); this.token = token;
            notificationGeneration = response.getString("notification_generation"); mediaGeneration = response.getString("media_generation");
            notificationRevision = response.getLong("notification_revision");
        }
        boolean same(Evidence other) { return other != null && uid == other.uid && user == other.user && key.equals(other.key)
                && pkg.equals(other.pkg) && token.equals(other.token) && notificationGeneration.equals(other.notificationGeneration)
                && notificationRevision == other.notificationRevision && mediaGeneration.equals(other.mediaGeneration); }
        boolean sameLifetime(Evidence other) { return other != null && uid == other.uid && user == other.user && key.equals(other.key)
                && pkg.equals(other.pkg) && token.equals(other.token) && notificationGeneration.equals(other.notificationGeneration)
                && mediaGeneration.equals(other.mediaGeneration); }
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    Evidence query(StatusBarNotification notification, MediaSession.Token token) {
        Parcel request = Parcel.obtain(), response = Parcel.obtain();
        try {
            if (Process.myUid() != 0 || principal == null || notification == null || token == null) return null;
            Bundle auth = principal.current(); if (auth == null) return null;
            String nonce = UUID.randomUUID().toString().replace("-", ""); long start = SystemClock.elapsedRealtime(), deadline = start + 2000;
            Object service = Class.forName("android.os.ServiceManager").getMethod("getService", String.class).invoke(null, "media_session");
            if (!(service instanceof IBinder) || !((IBinder) service).isBinderAlive()) return null;
            request.writeInterfaceToken(DESCRIPTOR); request.writeInt(1); request.writeBundle(auth); request.writeString(nonce); request.writeLong(deadline);
            request.writeString(notification.getKey()); request.writeInt(notification.getUid()); request.writeInt(notification.getUserId());
            request.writeString(notification.getPackageName()); request.writeTypedObject(token, 0);
            if (!((IBinder) service).transact(TX, request, response, 0)) return null;
            response.readException(); Bundle result = response.readBundle(getClass().getClassLoader());
            long now = SystemClock.elapsedRealtime();
            if (response.dataAvail() != 0 || result == null || !result.keySet().equals(KEYS) || !(result.get("schema") instanceof Integer)
                    || result.getInt("schema") != 1 || !(result.get("success") instanceof Boolean) || !result.getBoolean("success")
                    || !nonce.equals(result.get("nonce")) || !(result.get("uid") instanceof Integer) || result.getInt("uid") != notification.getUid()
                    || !(result.get("user") instanceof Integer) || result.getInt("user") != notification.getUserId()
                    || !notification.getPackageName().equals(result.get("package")) || !(result.get("notification_revision") instanceof Long)
                    || result.getLong("notification_revision") < 1 || !(result.get("notification_generation") instanceof String)
                    || !result.getString("notification_generation").matches("[0-9a-f]{33,48}") || !(result.get("media_generation") instanceof String)
                    || !result.getString("media_generation").matches("[0-9a-f]{32}") || !(result.get("sample_elapsed") instanceof Long)
                    || result.getLong("sample_elapsed") < start || result.getLong("sample_elapsed") > now || now < start || now >= deadline)
                return null;
            return new Evidence(notification, token, result);
        } catch (Exception | LinkageError unavailable) { return null; }
        finally { request.recycle(); response.recycle(); }
    }
}
