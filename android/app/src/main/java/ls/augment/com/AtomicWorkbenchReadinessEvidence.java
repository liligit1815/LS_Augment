package ls.augment.com;

import android.content.Context;
import org.json.JSONObject;

/** Verifies a Binder-attributed WM receipt without privileged task or PID enumeration. */
final class AtomicWorkbenchReadinessEvidence {
    private AtomicWorkbenchReadinessEvidence() { }

    static boolean matches(Context context, String key, String value) {
        try {
            JSONObject source = new JSONObject(context.getSharedPreferences(DiagnosticEvidenceStore.STORE, 0).getString(key, "{}"));
            int pid = source.optInt("pid", -1);
            String process = source.optString("process", "");
            if (!("system_server".equals(process) || "system".equals(process))) return false;
            return DiagnosticEvidenceStore.matchesRecentSource(context, key, value, process, 1000, pid, 15000L);
        } catch (Exception unavailable) { return false; }
    }
}
