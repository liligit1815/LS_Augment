package ls.augment.com;

import android.os.Bundle;
import static ls.augment.com.AtomicWorkbenchTaskIdentity.*;

/** Bounded receipt: a missing/uncertain reply never proves that an earlier reference was removed. */
public final class AtomicWorkbenchTaskReferenceResult {
    public enum Status { SNAPSHOT, REMOVED, REJECTED, UNCONFIRMED }
    public final AtomicWorkbenchTaskReferenceRequest request;
    public final Status status;
    public final long revision;
    public final String reasonCode;
    public final boolean releaseAttempted, writeAttempted, referenceRemoved, storeCommitted;
    public final boolean cleanupPending, operationUnconfirmed, success;
    private static final String[] KEYS={"schema","request","status","revision","reason_code","release_attempted","write_attempted",
            "reference_removed","store_committed","cleanup_pending","operation_unconfirmed","success"};

    public AtomicWorkbenchTaskReferenceResult(AtomicWorkbenchTaskReferenceRequest request, Status status, long revision,
            String reason, boolean releaseAttempted, boolean writeAttempted, boolean removed, boolean committed, boolean pending) {
        if (request==null || status==null || revision<0 || reason==null || !reason.matches("task_reference_[a-z_]{1,80}"))
            throw invalid("task_reference_result");
        boolean state=request.action==AtomicWorkbenchTaskReferenceRequest.Action.STATE;
        if (status==Status.SNAPSHOT && (!state || releaseAttempted || writeAttempted || removed || committed || pending)
                || status==Status.REMOVED && (state || !writeAttempted || !removed || !committed || pending)
                || status!=Status.REMOVED && (removed || committed)
                || status==Status.REJECTED && (releaseAttempted || writeAttempted || pending)
                || status==Status.UNCONFIRMED && !pending
                || releaseAttempted && request.action!=AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET)
            throw invalid("task_reference_result_state");
        this.request=request; this.status=status; this.revision=revision; reasonCode=reason;
        this.releaseAttempted=releaseAttempted; this.writeAttempted=writeAttempted; referenceRemoved=removed; storeCommitted=committed;
        cleanupPending=pending; operationUnconfirmed=status==Status.UNCONFIRMED; success=status==Status.SNAPSHOT || status==Status.REMOVED;
    }
    public Bundle toBundle() {
        Bundle b=new Bundle(); b.putInt("schema",1); b.putBundle("request",request.toBundle()); b.putString("status",status.name());
        b.putLong("revision",revision); b.putString("reason_code",reasonCode); b.putBoolean("release_attempted",releaseAttempted);
        b.putBoolean("write_attempted",writeAttempted); b.putBoolean("reference_removed",referenceRemoved); b.putBoolean("store_committed",storeCommitted);
        b.putBoolean("cleanup_pending",cleanupPending); b.putBoolean("operation_unconfirmed",operationUnconfirmed); b.putBoolean("success",success); return b;
    }
    public static AtomicWorkbenchTaskReferenceResult fromBundle(Bundle b) {
        keys(b,KEYS); schema(b);
        AtomicWorkbenchTaskReferenceResult r=new AtomicWorkbenchTaskReferenceResult(AtomicWorkbenchTaskReferenceRequest.fromBundle(bundle(b,"request")),
                Status.valueOf(string(b,"status")),number(b,"revision"),string(b,"reason_code"),bool(b,"release_attempted"),bool(b,"write_attempted"),
                bool(b,"reference_removed"),bool(b,"store_committed"),bool(b,"cleanup_pending"));
        if (r.operationUnconfirmed!=bool(b,"operation_unconfirmed") || r.success!=bool(b,"success")) throw invalid("task_reference_result_flags"); return r;
    }
    public static AtomicWorkbenchTaskReferenceResult fromBundle(Bundle b, AtomicWorkbenchTaskReferenceRequest request) {
        AtomicWorkbenchTaskReferenceResult r=fromBundle(b);
        if (!r.request.sameRequest(request)) throw invalid("task_reference_result_binding"); return r;
    }
    public static Bundle response(AtomicWorkbenchTaskReferenceResult result, AtomicWorkbenchTaskReferenceSnapshot snapshot,
            AtomicWorkbenchTaskReferenceResult queried) {
        if(result==null||snapshot==null||queried!=null&&result.request.action!=AtomicWorkbenchTaskReferenceRequest.Action.STATE)
            throw invalid("task_reference_response");
        Bundle b=new Bundle(); b.putInt("schema",1); b.putBundle("result",result.toBundle()); b.putBundle("snapshot",snapshot.toBundle());
        b.putBundle("queried_result",queried==null?new Bundle():queried.toBundle()); return b;
    }
}
