package ls.augment.com;

import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import org.json.JSONObject;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;

/** Append only after caller authorization; accepts no configuration changes or shell commands. */
final class StartupDiagnosticStore {
    private static final LinkedHashMap<String, Boolean> ACCEPTED = new LinkedHashMap<>();
    static synchronized Bundle record(Context context, Bundle extras) {
        Bundle reply = new Bundle();
        if (ResetWriteFence.blocked()) return rejected(reply, "RESET_WRITE_FENCE");
        try {
            String raw = extras == null ? null : extras.getString("event");
            if (raw == null || raw.length() > 192 * 1024 || raw.getBytes(StandardCharsets.UTF_8).length > 512 * 1024)
                return rejected(reply, "EVENT_SIZE_OR_MISSING");
            JSONObject event = new JSONObject(raw);
            int pid = Binder.getCallingPid(), uid = Binder.getCallingUid();
            if (event.optInt("pid", -1) != pid || event.optInt("uid", -1) != uid)
                return rejected(reply, "CALLER_IDENTITY_MISMATCH");
            String session = event.optString("session"), stage = event.optString("stage");
            long sequence = event.optLong("sequence", -1);
            if (event.optInt("protocol", -1) != 1 || !session.matches("[A-Za-z0-9-]{1,64}")
                    || !stage.matches("[A-Z0-9_.:-]{1,96}") || sequence < 1)
                return rejected(reply, "EVENT_INVALID");
            String identity = uid + ":" + pid + ":" + session + ":" + sequence;
            if (!ACCEPTED.containsKey(identity)) {
                event.put("receivedAt", System.currentTimeMillis()).put("receivedBoot", RuntimeEnvironment.bootCount(context));
                boolean rotated = BoundedLog.append(new File(context.getFilesDir(), StartupDiagnostics.FILE), event.toString(), 2 * 1024 * 1024, 1024 * 1024);
                if (rotated) {
                    android.content.SharedPreferences stats=context.getSharedPreferences("diagnostic-retention",0);
                    stats.edit().putLong("startup_rotations",stats.getLong("startup_rotations",0)+1).apply();
                }
                if (ACCEPTED.size() >= 512) ACCEPTED.remove(ACCEPTED.keySet().iterator().next());
                ACCEPTED.put(identity, true);
            }
            reply.putBoolean("ok", true);
            reply.putString("meaning", "append returned; bounded process-local duplicate suppression; not fsync durability");
        } catch (Exception error) {
            reply.putString("reason", "STORE_EXCEPTION");
            reply.putString("exception", DiagnosticException.render(error));
        }
        return reply;
    }
    private static Bundle rejected(Bundle reply, String reason) { reply.putString("reason", reason); return reply; }
}
