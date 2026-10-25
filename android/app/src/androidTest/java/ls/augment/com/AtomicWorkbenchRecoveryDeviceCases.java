package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/** No window/task creation: asks a fresh phone Root to read and reconcile its existing journal. */
final class AtomicWorkbenchRecoveryDeviceCases {
    static JSONObject run(Context context) throws Exception {
        JSONObject out = new JSONObject().put("scope", "FRESH_ROOT_EXISTING_JOURNAL_STATUS_AND_CLOSE_NO_INPUT_NO_WINDOW_CREATION");
        AtomicWorkbenchClient client = AtomicWorkbenchClient.connect(context);
        Bundle closed = null;
        try {
            out.put("statusBeforeClose", snapshot(client.status()));
        } finally {
            closed = client.close("recovery_retry");
            out.put("close", snapshot(closed));
        }
        boolean success = closed != null && closed.getBoolean("success") && !closed.getBoolean("recovery_pending");
        return out.put("success", success);
    }

    private static JSONObject snapshot(Bundle value) throws Exception {
        JSONObject out = new JSONObject();
        if (value == null) return out.put("missing", true);
        for (String key : new String[]{"success","recovery_pending","input_focus_restore_pending","focus_restore_pending"})
            if (value.containsKey(key)) out.put(key, value.getBoolean(key));
        for (String key : new String[]{"message","state"}) if (value.containsKey(key)) out.put(key, value.getString(key));
        JSONArray list = new JSONArray();
        ArrayList<Bundle> windows = value.getParcelableArrayList("windows", Bundle.class);
        if (windows != null) for (Bundle window : windows) {
            JSONObject row = new JSONObject();
            for (String key : new String[]{"window_id","display_id","task_id","task_count","home_task_id"})
                row.put(key, window.getInt(key,-1));
            row.put("state", window.getString("state", "")).put("recovery_pending",window.getBoolean("recovery_pending"));
            list.put(row);
        }
        return out.put("windows",list);
    }
}
