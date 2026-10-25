package ls.augment.com;

import android.os.Bundle;
import java.util.Objects;
import java.util.Set;

/** Immutable metadata for the Root's lock-free system callback. No WM/Provider calls are permitted. */
final class AtomicWorkbenchExtractionGeometryFence {
    static final int TRANSACTION = 0x00D04E08;
    static final String DESCRIPTOR = "ls.augment.com.atomic_extraction_geometry_current.v1";
    private static final Set<String> KEYS = Set.of("window_id", "display_id", "display_name", "unique_id",
            "input_revision", "ui_epoch", "revision", "deadline", "provider_session", "reset_generation");
    final int windowId;
    final long inputRevision, revision, deadline;
    private final Bundle metadata;

    AtomicWorkbenchExtractionGeometryFence(Bundle geometry, long session, long reset, long now) {
        metadata = new Bundle();
        for (String key : Set.of("window_id", "display_id")) {
            if (!(geometry.get(key) instanceof Integer)) throw new IllegalArgumentException("invalid_geometry_fence");
            metadata.putInt(key, geometry.getInt(key));
        }
        for (String key : Set.of("display_name", "unique_id")) {
            if (!(geometry.get(key) instanceof String)) throw new IllegalArgumentException("invalid_geometry_fence");
            metadata.putString(key, geometry.getString(key));
        }
        for (String key : Set.of("input_revision", "ui_epoch", "revision", "deadline")) {
            if (!(geometry.get(key) instanceof Long)) throw new IllegalArgumentException("invalid_geometry_fence");
            metadata.putLong(key, geometry.getLong(key));
        }
        metadata.putLong("provider_session", session); metadata.putLong("reset_generation", reset);
        windowId = metadata.getInt("window_id"); inputRevision = metadata.getLong("input_revision");
        revision = metadata.getLong("revision"); deadline = metadata.getLong("deadline");
        if (windowId < 0 || windowId > 7 || metadata.getInt("display_id") <= 0 || inputRevision < 1
                || metadata.getLong("ui_epoch") < 1 || revision < 1 || session < 0 || reset < 0
                || now < 0 || deadline <= now || deadline - now > 2500
                || metadata.getString("display_name").isEmpty() || metadata.getString("unique_id").isEmpty())
            throw new IllegalArgumentException("invalid_geometry_fence");
    }

    boolean matches(Bundle query, long now, long minimumRevision, long currentInputRevision, int activeWindow, boolean parked) {
        if (query == null || !query.keySet().equals(KEYS) || now < 0 || now >= deadline
                || revision <= minimumRevision || inputRevision != currentInputRevision || windowId != activeWindow || parked) return false;
        for (String key : KEYS) {
            Object value = query.get(key), expected = metadata.get(key);
            if (value == null || value.getClass() != expected.getClass() || !Objects.equals(value, expected)) return false;
        }
        return true;
    }
}
