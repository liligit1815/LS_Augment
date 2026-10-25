package ls.augment.com;

import android.os.Bundle;
import static ls.augment.com.AtomicWorkbenchTaskIdentity.*;

/** Explicit final evidence. Dispatch or a Binder reply alone cannot report success. */
public final class AtomicWorkbenchTaskOperationResult {
    public enum Status { COMMITTED, REJECTED, CANCELLED, UNCONFIRMED, CLEANUP_PENDING, STALE }
    public final String operationId, shelfId, phase, disposition, reasonCode, leaseId;
    public final AtomicWorkbenchTaskOperationRequest.Action action;
    public final AtomicWorkbenchTaskIdentity identity;
    public final Status status;
    public final long revision;
    public final boolean mutationDispatched, positionVerified, visibilityVerified, storeCommitted;
    public final boolean focusUnchanged, cleanupPending, success;
    private static final String[] KEYS={"schema","operation_id","shelf_id","action","status","revision","identity",
            "phase","disposition","reason_code","lease_id","mutation_dispatched","position_verified",
            "visibility_verified","store_committed","focus_unchanged","cleanup_pending","success","operation_unconfirmed"};

    public AtomicWorkbenchTaskOperationResult(AtomicWorkbenchTaskOperationRequest request, Status status, long revision,
            AtomicWorkbenchTaskIdentity observedIdentity, String phase, String disposition, String reasonCode,
            boolean mutationDispatched, boolean positionVerified, boolean visibilityVerified, boolean storeCommitted,
            boolean focusUnchanged, boolean cleanupPending, String leaseId) {
        this(request.operationId,request.shelfId,request.action,status,revision,observedIdentity,phase,disposition,reasonCode,
                mutationDispatched,positionVerified,visibilityVerified,storeCommitted,focusUnchanged,cleanupPending,leaseId);
        if (observedIdentity != null && !request.identity.sameTask(observedIdentity)) throw invalid("result_task_identity");
        if (success && action!=AtomicWorkbenchTaskOperationRequest.Action.END_TASK
                && (observedIdentity.displayId!=request.targetDisplayId
                    || !observedIdentity.displayName.equals(request.targetDisplayName)
                    || !observedIdentity.displayUnique.equals(request.targetDisplayUnique))) throw invalid("result_task_location");
    }

    private AtomicWorkbenchTaskOperationResult(String op,String shelf,AtomicWorkbenchTaskOperationRequest.Action action,
            Status status,long revision,AtomicWorkbenchTaskIdentity identity,String phase,String disposition,String reason,
            boolean dispatched,boolean position,boolean visibility,boolean committed,boolean focus,boolean pending,String lease) {
        hex(op,false); hex(shelf,false); hex(lease,true);
        if (action==null || status==null || revision<0 || phase==null
                || !phase.matches("PREPARED|MUTATING|VERIFY_PENDING|COMMITTED|CLEANUP_PENDING|TERMINAL")
                || disposition==null || !disposition.matches("WORKSPACE_OWNED|SHELVED_REFERENCE|PASSIVE_BACKGROUND|EXTERNALLY_ACTIVE|RESTORED|RELEASED|ENDED|STALE")
                || reason==null || !reason.matches("[a-z][a-z0-9_]{0,63}")) throw invalid("task_result");
        boolean success=status==Status.COMMITTED && position && visibility && committed && focus && !pending;
        if (status==Status.COMMITTED && (!success || !dispatched || identity==null || !phase.equals("COMMITTED"))
                || status==Status.CLEANUP_PENDING && !pending || pending && status==Status.COMMITTED)
            throw invalid("task_result_proof");
        this.operationId=op; this.shelfId=shelf; this.action=action; this.status=status; this.revision=revision;
        this.identity=identity; this.phase=phase; this.disposition=disposition; this.reasonCode=reason; this.leaseId=lease;
        this.mutationDispatched=dispatched; this.positionVerified=position; this.visibilityVerified=visibility;
        this.storeCommitted=committed; this.focusUnchanged=focus; this.cleanupPending=pending; this.success=success;
    }

    public Bundle toBundle() {
        Bundle b=new Bundle(); b.putInt("schema",SCHEMA); b.putString("operation_id",operationId); b.putString("shelf_id",shelfId);
        b.putString("action",action.name()); b.putString("status",status.name()); b.putLong("revision",revision);
        // Empty is the only representation of unavailable observation; it is never parsed as an identity.
        b.putBundle("identity",identity==null?new Bundle():identity.toBundle()); b.putString("phase",phase);
        b.putString("disposition",disposition); b.putString("reason_code",reasonCode); b.putString("lease_id",leaseId);
        b.putBoolean("mutation_dispatched",mutationDispatched); b.putBoolean("position_verified",positionVerified);
        b.putBoolean("visibility_verified",visibilityVerified); b.putBoolean("store_committed",storeCommitted);
        b.putBoolean("focus_unchanged",focusUnchanged); b.putBoolean("cleanup_pending",cleanupPending);
        b.putBoolean("success",success); b.putBoolean("operation_unconfirmed",status==Status.UNCONFIRMED || status==Status.CLEANUP_PENDING); return b;
    }
    public static AtomicWorkbenchTaskOperationResult fromBundle(Bundle b) {
        keys(b,KEYS); schema(b); Bundle id=bundle(b,"identity");
        AtomicWorkbenchTaskOperationResult r=new AtomicWorkbenchTaskOperationResult(string(b,"operation_id"),string(b,"shelf_id"),
                AtomicWorkbenchTaskOperationRequest.Action.valueOf(string(b,"action")),Status.valueOf(string(b,"status")),number(b,"revision"),
                id.keySet().isEmpty()?null:AtomicWorkbenchTaskIdentity.fromBundle(id),string(b,"phase"),string(b,"disposition"),string(b,"reason_code"),
                bool(b,"mutation_dispatched"),bool(b,"position_verified"),bool(b,"visibility_verified"),bool(b,"store_committed"),
                bool(b,"focus_unchanged"),bool(b,"cleanup_pending"),string(b,"lease_id"));
        if (bool(b,"success")!=r.success || bool(b,"operation_unconfirmed")!=(r.status==Status.UNCONFIRMED || r.status==Status.CLEANUP_PENDING))
            throw invalid("task_result_flags");
        return r;
    }

    /** Bind an otherwise valid reply to the exact request that was actually sent. */
    public static AtomicWorkbenchTaskOperationResult fromBundle(Bundle b,AtomicWorkbenchTaskOperationRequest request) {
        AtomicWorkbenchTaskOperationResult r=fromBundle(b);
        if(request==null || !r.operationId.equals(request.operationId) || !r.shelfId.equals(request.shelfId) || r.action!=request.action
                || r.identity!=null && !request.identity.sameTask(r.identity)) throw invalid("task_reply_binding");
        if(r.success && r.action!=AtomicWorkbenchTaskOperationRequest.Action.END_TASK
                && (r.identity.displayId!=request.targetDisplayId || !r.identity.displayName.equals(request.targetDisplayName)
                    || !r.identity.displayUnique.equals(request.targetDisplayUnique))) throw invalid("task_reply_location");
        return r;
    }
}
