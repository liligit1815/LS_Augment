package ls.augment.com;

import android.os.Bundle;
import static ls.augment.com.AtomicWorkbenchTaskIdentity.*;

/** Exact metadata for managing a stored reference; it never names a new task mutation. */
public final class AtomicWorkbenchTaskReferenceRequest {
    public enum Action { STATE, FORGET, RELEASE_AND_FORGET }
    public static final long MAX_LIFETIME_MS = 5000;
    public final String requestId, queryRequestId, shelfId, operationId, sourceSession;
    public final Action action;
    public final AtomicWorkbenchTaskIdentity identity;
    public final long expectedRevision, issuedElapsed, deadlineElapsed;
    public final int sourceSlot;
    private static final String[] KEYS = {"schema", "request_id", "query_request_id", "action", "shelf_id",
            "operation_id", "identity", "expected_revision", "source_slot", "source_session", "issued_elapsed", "deadline_elapsed"};

    public AtomicWorkbenchTaskReferenceRequest(String requestId, Action action, String queryRequestId,
            String shelfId, String operationId, AtomicWorkbenchTaskIdentity identity, long expectedRevision,
            int sourceSlot, String sourceSession, long issuedElapsed, long deadlineElapsed) {
        hex(requestId, false); hex(queryRequestId, true);
        if (action == null || issuedElapsed < 0 || deadlineElapsed < issuedElapsed
                || deadlineElapsed - issuedElapsed > MAX_LIFETIME_MS) throw invalid("task_reference_request");
        if (action == Action.STATE) {
            if (!"".equals(shelfId) || !"".equals(operationId) || identity != null || expectedRevision != -1
                    || sourceSlot != -1 || !"".equals(sourceSession)) throw invalid("task_reference_state");
        } else {
            hex(shelfId, false); hex(operationId, false); session(sourceSession, false);
            if (!queryRequestId.isEmpty() || identity == null || !identity.leaf || expectedRevision < 0
                    || !AtomicWorkbenchSlotDomain.contains(sourceSlot))
                throw invalid("task_reference_target");
        }
        this.requestId=requestId; this.action=action; this.queryRequestId=queryRequestId;
        this.shelfId=shelfId; this.operationId=operationId; this.identity=identity; this.expectedRevision=expectedRevision;
        this.sourceSlot=sourceSlot; this.sourceSession=sourceSession; this.issuedElapsed=issuedElapsed; this.deadlineElapsed=deadlineElapsed;
    }
    public static AtomicWorkbenchTaskReferenceRequest state(String requestId, String queryId, long now) {
        if (now < 0 || now > Long.MAX_VALUE-MAX_LIFETIME_MS) throw invalid("task_reference_clock");
        return new AtomicWorkbenchTaskReferenceRequest(requestId,Action.STATE,queryId,"","",null,-1,-1,"",now,now+MAX_LIFETIME_MS);
    }
    public void requireFresh(long now) {
        if (now < issuedElapsed || now > deadlineElapsed) throw invalid("task_reference_expired");
    }
    public Bundle toBundle() {
        Bundle b=new Bundle(); b.putInt("schema",1); b.putString("request_id",requestId); b.putString("query_request_id",queryRequestId);
        b.putString("action",action.name()); b.putString("shelf_id",shelfId); b.putString("operation_id",operationId);
        b.putBundle("identity",identity==null?new Bundle():identity.toBundle()); b.putLong("expected_revision",expectedRevision);
        b.putInt("source_slot",sourceSlot); b.putString("source_session",sourceSession);
        b.putLong("issued_elapsed",issuedElapsed); b.putLong("deadline_elapsed",deadlineElapsed); return b;
    }
    public static AtomicWorkbenchTaskReferenceRequest fromBundle(Bundle b) {
        keys(b,KEYS); schema(b); Bundle id=bundle(b,"identity");
        return new AtomicWorkbenchTaskReferenceRequest(string(b,"request_id"),Action.valueOf(string(b,"action")),
                string(b,"query_request_id"),string(b,"shelf_id"),string(b,"operation_id"),id.isEmpty()?null:AtomicWorkbenchTaskIdentity.fromBundle(id),
                number(b,"expected_revision"),integer(b,"source_slot"),string(b,"source_session"),number(b,"issued_elapsed"),number(b,"deadline_elapsed"));
    }
    public boolean sameRequest(AtomicWorkbenchTaskReferenceRequest r) {
        return r!=null && requestId.equals(r.requestId) && action==r.action && queryRequestId.equals(r.queryRequestId)
                && shelfId.equals(r.shelfId) && operationId.equals(r.operationId) && java.util.Objects.equals(identity,r.identity)
                && expectedRevision==r.expectedRevision && sourceSlot==r.sourceSlot && sourceSession.equals(r.sourceSession)
                && issuedElapsed==r.issuedElapsed && deadlineElapsed==r.deadlineElapsed;
    }
}
