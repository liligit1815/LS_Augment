package ls.augment.com;

import android.content.ComponentName;
import android.os.Bundle;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/** Private, session-scoped transport. No arbitrary shell, task or display commands. */
final class AtomicWorkbenchProtocol {
    static final String PACKAGE = "ls.augment.com";
    static final String AUTHORITY = PACKAGE + ".workbench";
    static final String DESCRIPTOR = PACKAGE + ".atomic_workbench";
    static final String REGISTER = "register_root";
    static final int VERSION = 1;
    static final int TX_OPEN = 1, TX_TOUCH = 2, TX_KEY = 3, TX_CLOSE = 4, TX_STATUS = 5;
    static final int TX_OPEN_WINDOW = 6, TX_TOUCH_WINDOW = 7, TX_KEY_WINDOW = 8,
            TX_FOCUS_WINDOW = 9, TX_CLOSE_WINDOW = 10, TX_OPEN_TASK_WINDOW = 11;
    static final int TX_MEDIA_STATE = 12, TX_MEDIA_COMMAND = 13;
    static final int TX_NATIVE_HOME = 14;
    static final int TX_FOCUS_APP = 15;
    static final int TX_NAVIGATION_STATE = 16;
    static final int TX_SHARE_WINDOW = 17;
    static final int TX_HOST_INPUT = 18;
    static final int TX_PASTE_PREPARE = 19, TX_PASTE_VALIDATE = 20, TX_PASTE_RELEASE = 21;
    static final int TX_SHARE_EXACT = 22;
    static final int TX_MEDIA_ACTION = 23;
    static final int TX_OUTPUT = 24, TX_PARK_UI = 25, TX_RESUME_UI = 26;
    static final int TX_OPEN_MEDIA = 27, TX_FOCUS_MEDIA = 28;
    static final int TX_CHANGE_TASK = 29, TX_TASK_OPERATION_STATE = 30, TX_TASK_SHELF_STATE = 31,
            TX_CANCEL_TASK_OPERATION = 32;
    static final int TX_NOTIFICATION_STATE = 33, TX_RECORD_TIMER = 34, TX_NOTIFICATION_ACTION = 35;
    static final int TX_EXTRACTION_GEOMETRY = 36;
    static final int TX_INVALIDATE_EXTRACTION_GEOMETRY = 37;
    static final int TX_ALLOCATE_TASK_DISPLAY = 38;
    static final int TX_TASK_REFERENCES = 39;
    static final int TX_OPEN_NOTIFICATION = 40, TX_FOCUS_NOTIFICATION = 41;
    static final String EXTRA_EXACT_TARGET = PACKAGE + ".atomic_workbench.exact_target";
    static final int WINDOW_COUNT = 4;
    // Stable identity pool; this does not authorize any new resource.
    static final int WINDOW_POOL_COUNT = AtomicWorkbenchSlotDomain.POOL_SIZE;
    // WindowManager.DISPLAY_IME_POLICY_FALLBACK_DISPLAY (hidden framework constant).
    // Keep the IME on the physical phone display while its editor remains in a VD.
    static final int IME_POLICY_PHONE_DISPLAY = 1;
    private AtomicWorkbenchProtocol() { }

    // Coverage of durable recovery owners is separate from the four eligible UI/input slots.
    private static final java.util.Set<String> RECOVERY_DOMAIN_KEYS = java.util.Set.of(
            "schema", "reader_profile", "pool_complete", "eligible_count", "windows", "legacy");
    private static final java.util.Set<String> RECOVERY_OWNER_STRINGS = java.util.Set.of(
            "window_session", "display_name", "display_unique_id", "state");
    private static final java.util.Set<String> RECOVERY_OWNER_BOOLEANS = java.util.Set.of(
            "success", "recovery_pending", "operation_unconfirmed", "task_recovery_pending",
            "input_focus_cleanup_pending", "guard_cleanup_pending", "input_cancel_pending",
            "input_rebind_pending", "output_transition_pending", "output_attached_known");

    /** Uses already observed owner results only; performs no IO, Binder call or owner lookup. */
    static Bundle recoveryState(Bundle actual, AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
        if (actual == null || reader == null) throw new IllegalArgumentException("recovery_domain_missing");
        Bundle result = new Bundle(actual);
        if (reader == AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4) return result;
        Object raw = actual.get("windows"), old = actual.get("legacy_recovery");
        if (!(raw instanceof java.util.ArrayList<?>) || ((java.util.ArrayList<?>) raw).size() != 8
                || !(old instanceof Bundle)) throw new IllegalArgumentException("recovery_owners_incomplete");
        java.util.ArrayList<Bundle> owners = new java.util.ArrayList<>(), visible = new java.util.ArrayList<>(), pool = new java.util.ArrayList<>();
        boolean[] seen = new boolean[8];
        for (Object item : (java.util.ArrayList<?>) raw) {
            if (!(item instanceof Bundle)) throw new IllegalArgumentException("recovery_owner_missing");
            Bundle owner = (Bundle) item; Object id = owner.get("window_id");
            if (!(id instanceof Integer) || (Integer) id < 0 || (Integer) id >= 8 || seen[(Integer) id])
                throw new IllegalArgumentException("recovery_owner_identity");
            seen[(Integer) id] = true; owners.add(recoveryOwner(owner));
            // Never share nested lists/Bundles with a later owner update.
            pool.add(owner.deepCopy());
            if ((Integer) id < WINDOW_COUNT) visible.add(owner.deepCopy());
        }
        Bundle domain = new Bundle(); domain.putInt("schema", 1); domain.putString("reader_profile", "FULL8");
        // Complete is a mapping receipt, never a statement that any owner is clean.
        domain.putBoolean("pool_complete", true); domain.putInt("eligible_count", WINDOW_COUNT);
        domain.putParcelableArrayList("windows", owners); domain.putBundle("legacy", recoveryOwner((Bundle) old));
        result.putParcelableArrayList("windows", visible); result.putParcelableArrayList("pool_windows", pool);
        result.putBundle("recovery_domain", domain);
        if (!completeRecoveryDomain(result)) throw new IllegalArgumentException("recovery_domain_inconsistent");
        return result;
    }

    private static Bundle recoveryOwner(Bundle actual) {
        Bundle owner = new Bundle();
        for (String key : RECOVERY_OWNER_STRINGS) {
            Object value = actual.get(key);
            if (!(value instanceof String)) throw new IllegalArgumentException("recovery_owner_type");
            owner.putString(key, (String) value);
        }
        for (String key : RECOVERY_OWNER_BOOLEANS) {
            Object value = actual.get(key);
            if (!(value instanceof Boolean)) throw new IllegalArgumentException("recovery_owner_type");
            owner.putBoolean(key, (Boolean) value);
        }
        for (String key : java.util.Set.of("window_id", "display_id")) {
            Object value = actual.get(key);
            if (!(value instanceof Integer)) throw new IllegalArgumentException("recovery_owner_type");
            owner.putInt(key, (Integer) value);
        }
        return owner;
    }

    /** Fixed typed FULL8 domain, with the original exact four-window presentation retained. */
    static boolean completeRecoveryDomain(Bundle response) {
        try {
            Object raw = response.get("recovery_domain");
            if (!(raw instanceof Bundle)) return false;
            Bundle domain = (Bundle) raw;
            if (!domain.keySet().equals(RECOVERY_DOMAIN_KEYS) || !(domain.get("schema") instanceof Integer)
                    || domain.getInt("schema") != 1 || !"FULL8".equals(domain.get("reader_profile"))
                    || !Boolean.TRUE.equals(domain.get("pool_complete"))
                    || !(domain.get("eligible_count") instanceof Integer) || domain.getInt("eligible_count") != WINDOW_COUNT
                    || !(domain.get("windows") instanceof java.util.ArrayList<?>)
                    || !(response.get("windows") instanceof java.util.ArrayList<?>)) return false;
            java.util.ArrayList<?> owners = (java.util.ArrayList<?>) domain.get("windows");
            java.util.ArrayList<?> visible = (java.util.ArrayList<?>) response.get("windows");
            if (owners.size() != 8 || visible.size() != WINDOW_COUNT) return false;
            Bundle[] bySlot = new Bundle[8];
            for (Object value : owners) {
                if (!(value instanceof Bundle)) return false;
                Bundle owner = (Bundle) value; Object id = owner.get("window_id");
                if (!(id instanceof Integer) || (Integer) id < 0 || (Integer) id >= 8 || bySlot[(Integer) id] != null
                        || !validRecoveryOwner(owner, (Integer) id, response)) return false;
                bySlot[(Integer) id] = owner;
            }
            Object old = domain.get("legacy");
            if (!(old instanceof Bundle) || !validRecoveryOwner((Bundle) old, -1, response)) return false;
            boolean[] seen = new boolean[WINDOW_COUNT];
            for (Object value : visible) {
                if (!(value instanceof Bundle)) return false;
                Bundle entry = (Bundle) value; Object id = entry.get("window_id");
                if (!(id instanceof Integer) || (Integer) id < 0 || (Integer) id >= WINDOW_COUNT || seen[(Integer) id]) return false;
                seen[(Integer) id] = true;
                Bundle projected = recoveryOwner(entry), owner = bySlot[(Integer) id];
                for (String key : owner.keySet()) if (!java.util.Objects.equals(owner.get(key), projected.get(key))) return false;
            }
            return true;
        } catch (RuntimeException malformed) { return false; }
    }

    /** Complete current state, not a resource permit. Missing data never falls back to windows4. */
    static java.util.ArrayList<Bundle> recoveryPoolWindows(Bundle response) {
        if (!completeRecoveryDomain(response)) throw new IllegalArgumentException("recovery_pool_domain_unknown");
        Object raw = response.get("pool_windows");
        if (!(raw instanceof java.util.ArrayList<?>) || ((java.util.ArrayList<?>) raw).size() != WINDOW_POOL_COUNT)
            throw new IllegalArgumentException("recovery_pool_incomplete");
        Bundle[] bySlot = new Bundle[WINDOW_POOL_COUNT], expected = new Bundle[WINDOW_POOL_COUNT];
        Bundle domain = response.getBundle("recovery_domain");
        for (Bundle owner : domain.<Bundle>getParcelableArrayList("windows")) expected[owner.getInt("window_id")] = owner;
        for (Object value : (java.util.ArrayList<?>) raw) {
            if (!(value instanceof Bundle)) throw new IllegalArgumentException("recovery_pool_type");
            Bundle state = (Bundle) value; Object id = state.get("window_id");
            if (!(id instanceof Integer) || !AtomicWorkbenchSlotDomain.contains((Integer) id) || bySlot[(Integer) id] != null)
                throw new IllegalArgumentException("recovery_pool_identity");
            Bundle projected = recoveryOwner(state), owner = expected[(Integer) id];
            for (String key : owner.keySet())
                if (!java.util.Objects.equals(owner.get(key), projected.get(key))) throw new IllegalArgumentException("recovery_pool_mismatch");
            bySlot[(Integer) id] = state.deepCopy();
        }
        java.util.ArrayList<Bundle> result = new java.util.ArrayList<>();
        for (Bundle state : bySlot) {
            if (state == null) throw new IllegalArgumentException("recovery_pool_incomplete");
            result.add(state);
        }
        return result;
    }

    private static boolean validRecoveryOwner(Bundle owner, int id, Bundle aggregate) {
        Bundle typed = recoveryOwner(owner);
        if (!typed.keySet().equals(owner.keySet()) || owner.getInt("window_id") != id
                || owner.getInt("display_id") < -1 || owner.getInt("display_id") == 0) return false;
        for (String key : RECOVERY_OWNER_STRINGS) {
            String value = owner.getString(key);
            if (value.length() > 512) return false;
            for (int i = 0; i < value.length(); i++) if (Character.isISOControl(value.charAt(i))) return false;
        }
        String session = owner.getString("window_session");
        if (!session.isEmpty() && !session.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")) return false;
        if (owner.getInt("display_id") > 0 && (session.isEmpty() || owner.getString("display_name").isEmpty()
                || owner.getString("display_unique_id").isEmpty())) return false;
        if (owner.getString("state").isEmpty() || !owner.getBoolean("success") && !Boolean.FALSE.equals(aggregate.get("success"))) return false;
        if (owner.getBoolean("recovery_pending") && !Boolean.TRUE.equals(aggregate.get("recovery_pending"))) return false;
        return !owner.getBoolean("operation_unconfirmed") || Boolean.TRUE.equals(aggregate.get("operation_unconfirmed"));
    }


    static boolean sameToken(String expected, String supplied) {
        return expected != null && supplied != null && expected.length() == 64
                && supplied.length() == 64 && MessageDigest.isEqual(
                expected.getBytes(StandardCharsets.US_ASCII), supplied.getBytes(StandardCharsets.US_ASCII));
    }

    static void requireMediaCommand(String command, String sessionId) {
        if (!("previous".equals(command) || "play".equals(command)
                || "pause".equals(command) || "next".equals(command)))
            throw new IllegalArgumentException("invalid media command");
        if (sessionId == null || sessionId.length() != 32 || !sessionId.matches("[0-9a-f]{32}"))
            throw new IllegalArgumentException("invalid media session");
    }

    static ComponentName requireFocusComponent(String component) {
        if (component == null || component.length() > 512)
            throw new IllegalArgumentException("invalid focus component");
        for (int index = 0; index < component.length(); index++)
            if (Character.isISOControl(component.charAt(index)) || Character.isWhitespace(component.charAt(index)))
                throw new IllegalArgumentException("invalid focus component");
        ComponentName parsed = ComponentName.unflattenFromString(component);
        if (parsed == null) throw new IllegalArgumentException("invalid focus component");
        return parsed;
    }

    static Bundle failure(String message) {
        Bundle state = new Bundle();
        state.putBoolean("success", false);
        state.putString("message", message == null ? "工作台操作失败" : message);
        return state;
    }
}
