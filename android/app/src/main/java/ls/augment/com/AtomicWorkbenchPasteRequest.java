package ls.augment.com;

import android.os.Bundle;

/** One immutable, phone-local drop. No intent, clipboard or send action is implied. */
final class AtomicWorkbenchPasteRequest {
    final String id, displayName, displayUniqueId, packageName, sourcePayloadId, text;
    final long session, resetGeneration, uiEpoch, sourceRevision, createdAt, deadlineAt;
    final int windowId, displayId, userId, moduleUid, targetUid, taskId;

    AtomicWorkbenchPasteRequest(String id, long session, long resetGeneration, long uiEpoch,
            int windowId, int displayId, String displayName, String displayUniqueId,
            int userId, int moduleUid, int targetUid, int taskId, String packageName,
            String sourcePayloadId, long sourceRevision, String text, long createdAt, long deadlineAt) {
        this.id = id; this.session = session; this.resetGeneration = resetGeneration; this.uiEpoch = uiEpoch;
        this.windowId = windowId; this.displayId = displayId; this.displayName = displayName;
        this.displayUniqueId = displayUniqueId; this.userId = userId; this.moduleUid = moduleUid;
        this.targetUid = targetUid; this.taskId = taskId; this.packageName = packageName;
        this.sourcePayloadId = sourcePayloadId; this.sourceRevision = sourceRevision; this.text = text;
        this.createdAt = createdAt; this.deadlineAt = deadlineAt;
        String reason = AtomicWorkbenchPastePolicy.invalid(this, createdAt);
        if (reason != null) throw new IllegalArgumentException(reason);
    }

    // Deliberately no toString: request text and long-lived authentication never enter diagnostics.
    Bundle metadata() {
        Bundle b = new Bundle(); b.putInt("schema", 1); b.putString("id", id);
        b.putLong("session", session); b.putLong("reset", resetGeneration); b.putLong("epoch", uiEpoch);
        b.putInt("window", windowId); b.putInt("display", displayId); b.putString("name", displayName);
        b.putString("unique", displayUniqueId); b.putInt("user", userId); b.putInt("module_uid", moduleUid);
        b.putInt("target_uid", targetUid); b.putInt("task", taskId); b.putString("package", packageName);
        b.putString("source_id", sourcePayloadId); b.putLong("source_revision", sourceRevision);
        b.putLong("created", createdAt); b.putLong("deadline", deadlineAt); return b;
    }
}
