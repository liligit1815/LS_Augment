package ls.augment.com;

import android.os.Bundle;
import static ls.augment.com.AtomicWorkbenchTaskIdentity.*;

/** Immutable action-bound request. A system-side fresh identity check is still mandatory. */
public final class AtomicWorkbenchTaskOperationRequest {
    public enum Action { SHELVE, RESTORE, MOVE_OUT, END_TASK }
    public static final long MAX_LIFETIME_MS = 5000;
    public final String operationId, sourceWindowSession, targetDisplayName, targetDisplayUnique;
    public final String targetWindowSession, shelfId, confirmationNonce;
    public final Action action;
    public final AtomicWorkbenchTaskIdentity identity;
    public final int sourceSlot, targetDisplayId, targetSlot;
    public final long expectedRevision, inputRevision, issuedElapsed, deadlineElapsed;
    private static final String[] KEYS = {"schema","operation_id","action","identity","source_slot",
            "source_window_session","target_display_id","target_display_name","target_display_unique",
            "target_slot","target_window_session","shelf_id","expected_revision","input_revision",
            "issued_elapsed","deadline_elapsed","confirmation_nonce"};

    public AtomicWorkbenchTaskOperationRequest(String operationId, Action action, AtomicWorkbenchTaskIdentity identity,
            int sourceSlot, String sourceWindowSession, int targetDisplayId, String targetDisplayName,
            String targetDisplayUnique, int targetSlot, String targetWindowSession, String shelfId,
            long expectedRevision, long inputRevision, long issuedElapsed, long deadlineElapsed,
            String confirmationNonce) {
        hex(operationId,false); hex(shelfId,false); session(sourceWindowSession,false);
        display(targetDisplayId,targetDisplayName,targetDisplayUnique);
        if (action == null || identity == null || !identity.leaf || !AtomicWorkbenchSlotDomain.contains(sourceSlot)
                || expectedRevision < 0 || inputRevision < 0 || issuedElapsed < 0
                || deadlineElapsed <= issuedElapsed || deadlineElapsed-issuedElapsed > MAX_LIFETIME_MS)
            throw invalid("task_request");
        if (action == Action.RESTORE) {
            if (identity.displayId != 0 || targetDisplayId <= 0 || !AtomicWorkbenchSlotDomain.contains(targetSlot))
                throw invalid("restore_target");
            session(targetWindowSession,false);
        } else {
            if (targetSlot != -1 || targetWindowSession == null || !targetWindowSession.isEmpty()) throw invalid("target_slot");
            if (action != Action.END_TASK && targetDisplayId != 0) throw invalid("primary_target");
            if (action == Action.END_TASK && (targetDisplayId != identity.displayId
                    || !targetDisplayName.equals(identity.displayName) || !targetDisplayUnique.equals(identity.displayUnique)))
                throw invalid("end_location");
        }
        hex(confirmationNonce,action != Action.END_TASK);
        if (action != Action.END_TASK && !confirmationNonce.isEmpty()) throw invalid("unexpected_confirmation");
        this.operationId=operationId; this.action=action; this.identity=identity; this.sourceSlot=sourceSlot;
        this.sourceWindowSession=sourceWindowSession; this.targetDisplayId=targetDisplayId;
        this.targetDisplayName=targetDisplayName; this.targetDisplayUnique=targetDisplayUnique;
        this.targetSlot=targetSlot; this.targetWindowSession=targetWindowSession; this.shelfId=shelfId;
        this.expectedRevision=expectedRevision; this.inputRevision=inputRevision;
        this.issuedElapsed=issuedElapsed; this.deadlineElapsed=deadlineElapsed; this.confirmationNonce=confirmationNonce;
    }

    public boolean fresh(long nowElapsed) { return nowElapsed >= issuedElapsed && nowElapsed <= deadlineElapsed; }
    public void requireFresh(long nowElapsed) { if (!fresh(nowElapsed)) throw invalid("expired_task_request"); }
    public Bundle toBundle() {
        Bundle b=new Bundle(); b.putInt("schema",SCHEMA); b.putString("operation_id",operationId);
        b.putString("action",action.name()); b.putBundle("identity",identity.toBundle()); b.putInt("source_slot",sourceSlot);
        b.putString("source_window_session",sourceWindowSession); b.putInt("target_display_id",targetDisplayId);
        b.putString("target_display_name",targetDisplayName); b.putString("target_display_unique",targetDisplayUnique);
        b.putInt("target_slot",targetSlot); b.putString("target_window_session",targetWindowSession); b.putString("shelf_id",shelfId);
        b.putLong("expected_revision",expectedRevision); b.putLong("input_revision",inputRevision);
        b.putLong("issued_elapsed",issuedElapsed); b.putLong("deadline_elapsed",deadlineElapsed);
        b.putString("confirmation_nonce",confirmationNonce); return b;
    }
    public static AtomicWorkbenchTaskOperationRequest fromBundle(Bundle b) {
        keys(b,KEYS); schema(b);
        return new AtomicWorkbenchTaskOperationRequest(string(b,"operation_id"),Action.valueOf(string(b,"action")),
                AtomicWorkbenchTaskIdentity.fromBundle(bundle(b,"identity")),integer(b,"source_slot"),string(b,"source_window_session"),
                integer(b,"target_display_id"),string(b,"target_display_name"),string(b,"target_display_unique"),
                integer(b,"target_slot"),string(b,"target_window_session"),string(b,"shelf_id"),number(b,"expected_revision"),
                number(b,"input_revision"),number(b,"issued_elapsed"),number(b,"deadline_elapsed"),string(b,"confirmation_nonce"));
    }
}
