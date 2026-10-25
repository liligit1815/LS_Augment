package ls.augment.com;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.Set;
import java.util.UUID;

/** Single-attempt 0A exchange; the old 04 evidence client remains independent. */
final class AtomicWorkbenchNotificationActionClient {
    private static final Set<String> KEYS = Set.of("schema", "success", "nonce", "request_id", "status", "consumed",
            "send_attempted", "sent", "sample_elapsed", "valid_until_elapsed", "limited", "actions");
    private final AtomicWorkbenchMediaSessionEvidenceClient.Principal principal;
    AtomicWorkbenchNotificationActionClient(AtomicWorkbenchMediaSessionEvidenceClient.Principal principal) { this.principal = principal; }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    Bundle exchange(String operation, AtomicWorkbenchNotificationRecord record, int index, String actionId, String requestId) {
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            if (Process.myUid() != 0 || principal == null) return unknown(operation);
            Bundle auth = principal.current(); if (auth == null) return unknown(operation);
            String nonce = UUID.randomUUID().toString().replace("-", ""); long start = SystemClock.elapsedRealtime(), deadline = start + 2000;
            Bundle request = new Bundle(); request.putString("operation", operation); request.putString("key", record == null ? "" : record.key);
            request.putString("generation", record == null ? "" : record.generation); request.putLong("revision", record == null ? 0 : record.revision);
            request.putInt("index", index); request.putString("request_id", requestId); request.putString("action_id", actionId);
            Object service = Class.forName("android.os.ServiceManager").getMethod("getService", String.class).invoke(null, "notification");
            if (!(service instanceof IBinder) || !((IBinder) service).isBinderAlive()) return unknown(operation);
            data.writeInterfaceToken("ls.augment.com.atomic_notification_actions.v1"); data.writeInt(1); data.writeBundle(auth);
            data.writeString(nonce); data.writeLong(deadline); data.writeBundle(request);
            // No reconnect, alternate transport or retry after any ambiguous outcome.
            if (!((IBinder) service).transact(0x00D04E0A, data, reply, 0) || reply.dataSize() > 16 * 1024) return unknown(operation);
            reply.readException(); Bundle result = reply.readBundle(getClass().getClassLoader()); long now = SystemClock.elapsedRealtime();
            if (result == null || reply.dataAvail() != 0 || !result.keySet().equals(KEYS)
                    || !integer(result, "schema", 1) || !nonce.equals(result.get("nonce")) || !requestId.equals(result.get("request_id"))
                    || !(result.get("success") instanceof Boolean) || !(result.get("consumed") instanceof Boolean)
                    || !(result.get("send_attempted") instanceof Boolean) || !(result.get("sent") instanceof Boolean)
                    || !(result.get("limited") instanceof Boolean) || !(result.get("status") instanceof String)
                    || !(result.get("sample_elapsed") instanceof Long) || !(result.get("valid_until_elapsed") instanceof Long)
                    || result.getLong("sample_elapsed") < start || result.getLong("sample_elapsed") > now
                    || now < start || now >= deadline || !Set.of("ready", "sent", "confirmed", "rejected", "canceled", "outcome_unknown", "unavailable").contains(result.getString("status"))) return unknown(operation);
            Object rows = result.get("actions"); if (!(rows instanceof java.util.List<?>) || ((java.util.List<?>) rows).size() > 8) return unknown(operation);
            if (result.getBoolean("sent") && (!result.getBoolean("success") || !result.getBoolean("consumed") || !result.getBoolean("send_attempted") || !"sent".equals(result.getString("status")))) return unknown(operation);
            if ("describe".equals(operation) && result.getBoolean("success")) {
                if (!"ready".equals(result.getString("status")) || result.getLong("valid_until_elapsed") <= now
                        || result.getLong("valid_until_elapsed") - result.getLong("sample_elapsed") > 5000) return unknown(operation);
                int expected = 0;
                for (Object raw : (java.util.List<?>) rows) {
                    if (!(raw instanceof Bundle)) return unknown(operation); Bundle row = (Bundle) raw;
                    if (!row.keySet().equals(Set.of("index", "label", "action_id", "authentication_required", "remote_input", "enabled", "status"))
                            || !integer(row, "index", expected++) || !(row.get("label") instanceof String) || row.getString("label").length() > 80
                            || !(row.get("action_id") instanceof String) || !(row.get("authentication_required") instanceof Boolean)
                            || !(row.get("remote_input") instanceof Boolean) || !(row.get("enabled") instanceof Boolean) || !(row.get("status") instanceof String)) return unknown(operation);
                    if (row.getBoolean("enabled") ? !row.getString("action_id").matches("[0-9a-f]{32}") || !"ready".equals(row.getString("status")) || row.getBoolean("remote_input")
                            : !row.getString("action_id").isEmpty()) return unknown(operation);
                    for (int at = 0; at < row.getString("label").length(); at++) if (Character.isISOControl(row.getString("label").charAt(at))) return unknown(operation);
                }
            }
                if (operation.equals("send") && result.getBoolean("success") != result.getBoolean("sent")) return unknown(operation);
            if (!"describe".equals(operation) && (!((java.util.List<?>) rows).isEmpty() || result.getLong("valid_until_elapsed") != 0)) return unknown(operation);
            if ("confirm_sent".equals(operation) && (result.getBoolean("sent") || result.getBoolean("send_attempted") || result.getBoolean("consumed")
                    || result.getBoolean("success") != "confirmed".equals(result.getString("status")))) return unknown(operation);
            return new Bundle(result);
        } catch (Exception | LinkageError unavailable) { return unknown(operation); }
        finally { data.recycle(); reply.recycle(); }
    }
    private static boolean integer(Bundle b, String key, int expected) { return b.get(key) instanceof Integer && b.getInt(key) == expected; }
    static Bundle unknown(String operation) {
        Bundle b = new Bundle(); b.putBoolean("success", false); b.putString("status", "send".equals(operation) ? "outcome_unknown" : "unavailable");
        b.putBoolean("sent", false); b.putBoolean("consumed", false); b.putBoolean("send_attempted", false); return b;
    }
}
