package ls.augment.com;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

/** Frozen phone-local destination capability. Its metadata contains no delivered text. */
final class AtomicWorkbenchDeliveryTarget {
    final String id, displayName, displayUniqueId, packageName, sourcePayloadId;
    final long session, resetGeneration, uiEpoch, sourceRevision, createdAt, deadlineAt;
    final int windowId, displayId, userId, moduleUid, targetUid, taskId;
    private final Bundle frozenMetadata;

    AtomicWorkbenchDeliveryTarget(long session, long resetGeneration, long uiEpoch,
            int windowId, int displayId, String displayName, String displayUniqueId,
            int userId, int moduleUid, int targetUid, int taskId, String packageName,
            String sourcePayloadId, long sourceRevision, long now) {
        long deadline;
        try { deadline = Math.addExact(now, AtomicWorkbenchPastePolicy.MAX_DURATION); }
        catch (ArithmeticException invalid) { throw new IllegalArgumentException("deadline"); }
        String generated = UUID.randomUUID().toString().replace("-", "");
        // The private nonempty placeholder exercises the shared identity policy only.
        // It is discarded here; no placeholder PasteRequest is retained or submitted.
        AtomicWorkbenchPasteRequest identity = new AtomicWorkbenchPasteRequest(generated, session, resetGeneration, uiEpoch,
                windowId, displayId, displayName, displayUniqueId, userId, moduleUid, targetUid, taskId,
                packageName, sourcePayloadId, sourceRevision, "x", now, deadline);
        frozenMetadata = identity.metadata();
        id = generated; this.session = session; this.resetGeneration = resetGeneration; this.uiEpoch = uiEpoch;
        this.windowId = windowId; this.displayId = displayId; this.displayName = displayName; this.displayUniqueId = displayUniqueId;
        this.userId = userId; this.moduleUid = moduleUid; this.targetUid = targetUid; this.taskId = taskId;
        this.packageName = packageName; this.sourcePayloadId = sourcePayloadId; this.sourceRevision = sourceRevision;
        createdAt = now; deadlineAt = deadline;
    }
    Bundle metadata() { return new Bundle(frozenMetadata); }
    AtomicWorkbenchPasteRequest paste(String actualText) {
        return new AtomicWorkbenchPasteRequest(id, session, resetGeneration, uiEpoch, windowId, displayId,
                displayName, displayUniqueId, userId, moduleUid, targetUid, taskId, packageName,
                sourcePayloadId, sourceRevision, actualText, createdAt, deadlineAt);
    }
    boolean liveAt(long now) { return now >= createdAt && now < deadlineAt; }
    boolean currentMatches(Bundle status, long now) { return liveAt(now) && currentMatches(status); }

    /** Accepts a fresh full workspace reply or one complete windowState reply, fail closed. */
    boolean currentMatches(Bundle status) {
        if (!fresh(status)) return false;
        if (!status.containsKey("windows")) return matchesWindow(status);
        Object entries = status.get("windows");
        if (status.containsKey("pool_windows")) {
            try { entries = AtomicWorkbenchProtocol.recoveryPoolWindows(status); }
            catch (RuntimeException unknown) { return false; }
        }
        if (!(entries instanceof ArrayList<?>)) return false;
        Bundle found = null; Set<Integer> seen = new HashSet<>();
        for (Object entry : (ArrayList<?>) entries) {
            if (!(entry instanceof Bundle)) return false;
            Bundle window = (Bundle) entry; Object index = window.get("window_id");
            if (!(index instanceof Integer) || (Integer) index < 0 || (Integer) index > 7 || !seen.add((Integer) index)) return false;
            if ((Integer) index == windowId) found = window;
        }
        return found != null && matchesWindow(found);
    }
    private boolean matchesWindow(Bundle window) {
        if (!fresh(window) || !Boolean.FALSE.equals(window.get("native_home")) || !Boolean.FALSE.equals(window.get("home_only"))
                || !integer(window, "window_id", windowId) || !integer(window, "display_id", displayId)
                || !integer(window, "task_id", taskId) || !integer(window, "target_uid", targetUid)
                || !integer(window, "user_id", userId) || !displayName.equals(window.get("display_name"))
                || !displayUniqueId.equals(window.get("display_unique_id")) || !packageName.equals(window.get("package"))) return false;
        Object count = window.get("task_count"), component = window.get("top_component"), packages = window.get("running_packages");
        if (!(count instanceof Integer) || (Integer) count <= 0 || !(component instanceof String)
                || !((String) component).startsWith(packageName + "/") || ((String) component).length() <= packageName.length() + 1
                || !(packages instanceof ArrayList<?>)) return false;
        boolean running = false;
        for (Object name : (ArrayList<?>) packages) {
            if (!(name instanceof String)) return false;
            running |= packageName.equals(name);
        }
        return running;
    }
    private static boolean fresh(Bundle value) {
        return value != null && Boolean.TRUE.equals(value.get("success")) && "active".equals(value.get("state"))
                && Boolean.FALSE.equals(value.get("recovery_pending"))
                && (!value.containsKey("cleanup_pending") || Boolean.FALSE.equals(value.get("cleanup_pending")))
                && (!value.containsKey("input_focus_cleanup_pending") || Boolean.FALSE.equals(value.get("input_focus_cleanup_pending")));
    }
    private static boolean integer(Bundle value, String key, int expected) {
        Object actual = value.get(key); return actual instanceof Integer && (Integer) actual == expected;
    }
}
