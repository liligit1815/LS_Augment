package ls.augment.com.hook;

import android.content.Context;
import android.content.ContentProviderClient;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.SystemClock;
import ls.augment.com.NativeIslandCardProtocol;

/** Reads a live SystemUI capability, never a version number or a stale diagnostic string. */
final class NativeIslandCardClient {
    private static IBinder cached;
    private static long retryAt;
    static synchronized boolean available(Context context, String scene) {
        if (context == null) return false;
        try {
            if (cached == null || !cached.isBinderAlive()) {
                if (SystemClock.elapsedRealtime() < retryAt) return false;
                retryAt = SystemClock.elapsedRealtime() + 1000;
                Bundle request = new Bundle(); request.putString("op", "get");
                Bundle result = call(context, request);
                cached = result == null ? null : result.getBinder("host");
            }
            if (cached == null) return false;
            Parcel data = Parcel.obtain(), reply = Parcel.obtain();
            try {
                data.writeInterfaceToken(NativeIslandCardProtocol.DESCRIPTOR); data.writeString(scene);
                if (cached.transact(NativeIslandCardProtocol.QUERY, data, reply, 0)) {
                    reply.readException();
                    if (reply.readInt() == 1) return true;
                }
            } finally { data.recycle(); reply.recycle(); }
        } catch (Exception unavailable) { }
        cached = null;
        return false;
    }
    static synchronized void invalidate() { cached = null; retryAt = 0; }
    static Bundle call(Context context, Bundle request) {
        try (ContentProviderClient provider = context.getContentResolver().acquireUnstableContentProviderClient(
                Uri.parse("content://ls.augment.com.config"))) {
            return provider == null ? null : provider.call(NativeIslandCardProtocol.METHOD, null, request);
        } catch (android.os.RemoteException unavailable) { return null; }
    }
    private NativeIslandCardClient() { }
}
