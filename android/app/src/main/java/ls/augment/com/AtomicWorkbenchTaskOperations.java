package ls.augment.com;

import android.os.Bundle;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import ls.augment.com.AtomicWorkbenchTaskShelfStore.Record;
import static ls.augment.com.AtomicWorkbenchTaskOperationRequest.Action;
import static ls.augment.com.AtomicWorkbenchTaskShelfStore.*;

/** Serial phone-side transaction owner. A query never replays a mutation. */
final class AtomicWorkbenchTaskOperations implements AtomicWorkbenchEngine.TaskController {
    interface ReferenceAuthorization { void requireCurrent() throws Exception; }
    private final AtomicWorkbenchEngine engine;
    private final AtomicWorkbenchTaskAuthority authority;
    private final AtomicWorkbenchTaskShelfStore store;
    private final AtomicWorkbenchRecoveryOwners recoveryOwners;
    private final AtomicWorkbenchRecoveryScope.ReaderProfile reader;
    private final ReferenceAuthorization referenceAuthorization;
    private Snapshot snapshot;
    private final Map<String, Bundle> replies = new LinkedHashMap<>();
    // Receipts are bounded observations only. Eviction never changes a durable reference.
    private final Map<String, AtomicWorkbenchTaskReferenceResult> referenceReplies = new LinkedHashMap<>();
    private boolean closing, storageUncertain;
    private boolean brokerCleanupRequired;
    private volatile boolean storageScopeUnverified;
    private volatile String storageScopeReason="";
    private volatile boolean cleanupUnconfirmed;
    private int maintenanceCursor;
    private final long[] shelfDiagnosticLast = new long[14], shelfDiagnosticSuppressed = new long[14];
    private long shelfDiagnosticCount;

    private void shelfDiagnostic(String stage, boolean success, Throwable error) {
        try {
            int index = switch (stage) {
                case "STORE" -> 0; case "PRIMARY" -> 1; case "INSPECT" -> 2;
                case "REFERENCE_DTO" -> 3; case "DESCRIBE" -> 4; case "TASK_DTO" -> 5; default -> 6;
            };
            int bucket = index * 2 + (success ? 1 : 0);
            long count = ++shelfDiagnosticCount, now = System.nanoTime();
            if (shelfDiagnosticLast[bucket] != 0 && now - shelfDiagnosticLast[bucket] < 3_000_000_000L) { shelfDiagnosticSuppressed[bucket]++; return; }
            shelfDiagnosticLast[bucket] = now;
            long suppressed = shelfDiagnosticSuppressed[bucket]; shelfDiagnosticSuppressed[bucket] = 0;
            AtomicWorkbenchDiagnostics.emit("ATOMIC_TASK_SHELF", -1, -1, "", -1,
                    "owner_id=TASK_C13_ROOT_01;diag_abi=1;stage=" + stage + ";action=STATE;success=" + success
                    + ";count=" + count + ";suppressed=" + suppressed, error);
        } catch (Throwable ignored) { }
    }

    AtomicWorkbenchTaskOperations(AtomicWorkbenchEngine engine, AtomicWorkbenchTaskAuthority authority,
                                 AtomicWorkbenchTaskShelfStore store) throws Exception {
        this(engine,authority,store,null);
    }
    AtomicWorkbenchTaskOperations(AtomicWorkbenchEngine engine, AtomicWorkbenchTaskAuthority authority,
                                 AtomicWorkbenchTaskShelfStore store,ReferenceAuthorization referenceAuthorization) throws Exception {
        this(engine,authority,store,referenceAuthorization,engine == null ? null : engine.recoveryOwners());
    }
    AtomicWorkbenchTaskOperations(AtomicWorkbenchEngine engine,AtomicWorkbenchTaskAuthority authority,
            AtomicWorkbenchTaskShelfStore store,ReferenceAuthorization referenceAuthorization,
            AtomicWorkbenchRecoveryOwners owners) throws Exception {
        if (engine == null || authority == null || store == null) throw new IllegalArgumentException("task_backend_missing");
        if(owners==null) throw new IllegalArgumentException("task_recovery_reader_mismatch");
        AtomicWorkbenchRecoveryScope.ReaderProfile profile=owners.readerProfile();
        if(profile==null || profile!=store.readerProfile())
            throw new IllegalArgumentException("task_recovery_reader_mismatch");
        reader=profile;
        recoveryOwners=owners;
        this.engine = engine; this.authority = authority; this.store = store; this.referenceAuthorization=referenceAuthorization;
        currentOwners(); // Validate the actual mapping before the first read, never freeze replaceable owners.
        snapshot = readStore();
    }

    /** Same-lane local object validation; Engine may replace an empty failed owner. */
    private AtomicWorkbenchPlatform[] currentOwners() {
        if(recoveryOwners.readerProfile()!=reader) throw new IllegalStateException("task_recovery_reader_mismatch");
        java.util.IdentityHashMap<AtomicWorkbenchPlatform,Boolean> unique=new java.util.IdentityHashMap<>();
        if(reader==AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8) {
            AtomicWorkbenchPlatform legacy=recoveryOwners.legacy();
            if(legacy==null || legacy.recoveryWindowId()!=-1 || legacy.recoveryReaderProfile()!=reader)
                throw new IllegalStateException("task_recovery_owners_incomplete");
            unique.put(legacy,Boolean.TRUE);
        }
        AtomicWorkbenchPlatform[] current=new AtomicWorkbenchPlatform[reader.poolCount];
        for(int slot=0;slot<current.length;slot++) {
            AtomicWorkbenchPlatform owner=recoveryOwners.platform(slot);
            if(owner==null || owner.recoveryWindowId()!=slot || owner.recoveryReaderProfile()!=reader
                    || unique.put(owner,Boolean.TRUE)!=null) throw new IllegalStateException("task_recovery_owners_incomplete");
            current[slot]=owner;
        }
        return current;
    }
    private AtomicWorkbenchPlatform currentPlatform(int slot) {
        AtomicWorkbenchPlatform[] current=currentOwners();
        return reader.contains(slot)?current[slot]:null;
    }

    /** A complete read verifies the required scope, not any Task's cleanup or a prior write. */
    private Snapshot readStore() throws Exception {
        try {
            Snapshot read=store.read();
            storageScopeUnverified=!read.scopeConsistent;
            storageScopeReason=read.scopeConsistent?"":"task_scope_marker_missing"; return read;
        } catch(Exception unreadable) {
            storageScopeReason="shelf_scope_unsupported_full_scope".equals(unreadable.getMessage())
                    ? "task_scope_unsupported_full_scope" : "task_storage_unavailable";
            storageScopeUnverified=true; throw unreadable;
        }
    }
    @Override public void requireAllocationScope(int target, int source) throws Exception {
        // readStore retains the previous exact snapshot on failure and marks scope unknown.
        // Store.read validates the full envelope/outbox and its durable marker under its own lock.
        Snapshot current = readStore();
        current.recoveryScope.requireReader(reader);
        snapshot = current;
        if (!reader.contains(target) || source < -1 || source >= reader.poolCount || closing || storageUncertain || storageScopeUnverified
                || current.recoveryScope.phase==AtomicWorkbenchRecoveryScope.Phase.DRAINING
                || blocksWindow(target) || source >= 0 && blocksWindow(source))
            throw new IllegalStateException("task_allocation_responsibility_unconfirmed");
        currentOwners();
        if(AtomicWorkbenchSlotDomain.high(target) || AtomicWorkbenchSlotDomain.high(source)) requireHighAllocation(null);
        // cleanupUnconfirmed is set only by cleanup(), which permanently sets closing.
        // An unrelated located pending Record does not become a global input/allocation freeze.
    }
    private void requireHighAllocation(String taskGeneration) throws Exception {
        if(reader!=AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8) throw new SecurityException("task_high_reader_required");
        currentOwners();
        Bundle capacity=authority.capacity(store.userId());
        if(taskGeneration!=null && !taskGeneration.equals(capacity.get("server_generation")))
            throw new SecurityException("task_capacity_generation_changed");
        Snapshot current=readStore();
        if(snapshot!=null && current.revision!=snapshot.revision || !current.scopeConsistent || closing || storageUncertain)
            throw new IllegalStateException("task_high_scope_unconfirmed");
        try { snapshot=store.requireHighScope(current.revision); }
        catch(AtomicWorkbenchTaskShelfStore.SaveException ambiguous) { storageUncertain=true; throw ambiguous; }
    }
    private static boolean addsHighResponsibility(AtomicWorkbenchTaskOperationRequest request) {
        return request.action==Action.RESTORE && AtomicWorkbenchSlotDomain.high(request.targetSlot)
                || request.action==Action.SHELVE && AtomicWorkbenchSlotDomain.high(request.sourceSlot);
    }
    private void requireHighTask(AtomicWorkbenchTaskOperationRequest request) throws Exception {
        if(!AtomicWorkbenchSlotDomain.high(request.sourceSlot) && !AtomicWorkbenchSlotDomain.high(request.targetSlot)) return;
        if(reader!=AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8) throw new SecurityException("task_high_reader_required");
        currentOwners();
        if(addsHighResponsibility(request)) requireHighAllocation(request.identity.serverBootGeneration);
        else if(!snapshot.scopeConsistent || !snapshot.recoveryScope.requiresHighScopeReader())
            throw new SecurityException("task_high_scope_unconfirmed");
    }

    @Override public void refreshStorageScope() {
        try { snapshot=readStore(); } catch(Exception unreadable) { /* Keep the exact cached records and unknown scope. */ }
    }
    @Override public AtomicWorkbenchRecoveryScope.ReaderProfile recoveryDomain() { return reader; }
    @Override public boolean storageScopeUnverified() { return storageScopeUnverified; }
    @Override public String storageScopeReason() { return storageScopeReason; }

    @Override public Bundle change(Bundle input) {
        AtomicWorkbenchTaskOperationRequest request;
        try { request = AtomicWorkbenchTaskOperationRequest.fromBundle(input); }
        catch (RuntimeException invalid) { return failure("task_request_invalid"); }
        boolean preparationStarted=false;
        try {
            snapshot = readStore();
            Record old = findOperation(request.operationId);
            if (old != null) {
                if (!old.metadata.sameOperation(DurableMetadata.fromRequest(request))) return rejectedRequest(request,"task_operation_rebound");
                return query(request.operationId); // Never apply an operation ID twice.
            }
            if (closing || engine.uiParked() || storageUncertain || storageScopeUnverified || request.expectedRevision != snapshot.revision
                    || request.inputRevision != engine.taskInputRevision()) return rejectedRequest(request,"task_request_stale");
            request.requireFresh(SystemClock.elapsedRealtime());
            Record prior = snapshot.find(request.shelfId);
            boolean existingShelf = request.action == Action.RESTORE || request.action == Action.END_TASK && request.identity.displayId == 0;
            if (existingShelf) {
                if (prior == null || prior.pending() || !prior.metadata.identity.sameTask(request.identity)
                        || prior.metadata.sourceSlot != request.sourceSlot
                        || !prior.metadata.sourceWindowSession.equals(request.sourceWindowSession)
                        || !(prior.disposition == Disposition.SHELVED_REFERENCE || prior.disposition == Disposition.PASSIVE_BACKGROUND))
                    return rejectedRequest(request,"task_shelf_stale");
                if (request.action == Action.RESTORE) requireWindow(request.targetSlot, request.targetWindowSession, request.targetDisplayId,
                        request.targetDisplayName, request.targetDisplayUnique);
            } else {
                if (prior != null && (prior.hasResponsibility() || !prior.metadata.identity.sameTask(request.identity)))
                    return rejectedRequest(request,"task_shelf_id_reused");
                requireWindow(request.sourceSlot, request.sourceWindowSession, request.identity.displayId,
                        request.identity.displayName, request.identity.displayUnique);
            }
            if (blocksWindow(request.sourceSlot) || request.targetSlot >= 0 && blocksWindow(request.targetSlot))
                return rejectedRequest(request,"task_operation_in_flight");
            if(snapshot.recoveryScope.phase==AtomicWorkbenchRecoveryScope.Phase.DRAINING
                    && (request.action==Action.SHELVE || request.action==Action.RESTORE))
                return rejectedRequest(request,"task_scope_draining");
            requireHighTask(request); // Before the original input cancellation or any prepare/WAL.
            if (request.identity.displayId > 0) {
                Bundle cancel = engine.cancelTaskWindowInput(request.sourceSlot, request.inputRevision);
                if (!cancel.getBoolean("success")) return rejectedRequest(request,"task_input_cancel_pending");
            }
            // The system prepare only binds a ticket; it does not touch visibility or position.
            requireHighTask(request); // Fresh final pre-prepare fence; input cancellation, if any, is not rewound.
            preparationStarted=true;
            brokerCleanupRequired = true; // Preserve the current shipping lost/rejected-prepare responsibility.
            Bundle prepared = authority.prepare(request);
            String ticket = prepared.getString("ticket");
            if (!request.operationId.equals(prepared.getString("operation_id")) || ticket == null || !ticket.matches("[0-9a-f]{32}"))
                return rejectedRequest(request,"task_prepare_rejected");
            LeaseState leaseState = prior == null ? LeaseState.NONE : prior.leaseState;
            String lease = prior == null ? "" : prior.leaseId;
            Record pending = new Record(DurableMetadata.fromRequest(request), Phase.PREPARED,
                    prior == null ? Disposition.WORKSPACE_OWNED : prior.disposition, leaseState, lease, false,
                    request.identity.displayId, request.identity.displayName, request.identity.displayUnique, request.identity, existingShelf ? prior : null);
            snapshot = store.update(snapshot.revision, pending);
            prepareJournals(request, "PREPARED", lease);
            snapshot = store.update(snapshot.revision, copy(pending, Phase.MUTATING, pending.disposition, leaseState,
                    lease, false, request.identity));
            prepareJournals(request, "MUTATING", lease);
            request.requireFresh(SystemClock.elapsedRealtime()); // After every fsync and other blocking preparation.
            if(addsHighResponsibility(request)) requireHighAllocation(request.identity.serverBootGeneration);
            Bundle proof;
            try { proof = authority.apply(request.operationId, ticket); }
            catch (Exception uncertain) {
                return persistUnknown(findOperation(request.operationId), "task_dispatch_unconfirmed", false);
            }
            return reconcile(findOperation(request.operationId), proof);
        } catch (Exception failure) {
            Record record = findOperation(request.operationId);
            if (record != null) {
                // Initial read/validation failure did not start this transaction. Preserve
                // the cached durable owner without blindly writing a new pending phase.
                if(!preparationStarted) return unknown(record,"task_read_or_validation_unconfirmed");
                // No automatic apply/rollback. The same operation is queried or cancelled later.
                return persistUnknown(record, "task_transaction_unconfirmed", record.dispatched);
            }
            storageUncertain |= failure instanceof AtomicWorkbenchTaskShelfStore.SaveException;
            return storageUncertain ? pendingRequest(request,"task_storage_unconfirmed") : rejectedRequest(request,"task_prepare_failed");
        }
    }

    @Override public Bundle query(String operationId) {
        if (operationId == null || !operationId.matches("[0-9a-f]{32}")) return failure("task_operation_id_invalid");
        try {
            snapshot = readStore(); Record record = findOperation(operationId);
            if (record == null) return replies.containsKey(operationId) ? new Bundle(replies.get(operationId)) : failure("task_operation_missing");
            if (referenceReleasePending(record)) {
                // Maintenance may finish an already durable cleanup, but never dispatch a new release or forget.
                try { finishReferenceRelease(record, closing ? authority.release(operationId) : authority.query(operationId)); }
                catch (Exception pending) { return unknown(record,"task_reference_cleanup_pending"); }
                return publicRecord(findOperation(operationId),"task_reference_released");
            }
            if (record.phase == Phase.COMMITTED || record.phase == Phase.TERMINAL) {
                // A live hidden shelf must still observe external activation and task death.
                if (record.leaseState != LeaseState.HELD) {
                    if (replies.containsKey(operationId)) return new Bundle(replies.get(operationId));
                    if (record.phase == Phase.COMMITTED && record.observedIdentity != null)
                        return result(record, "COMMITTED", "task_operation_committed", true, true, true, true, false, record.observedIdentity);
                    return publicRecord(record, "task_stored_state");
                }
            }
            return reconcile(record, closing ? authority.release(operationId) : authority.query(operationId));
        } catch (Exception unavailable) {
            if (unavailable instanceof AtomicWorkbenchTaskShelfStore.SaveException) storageUncertain = true;
            Record record = findOperation(operationId);
            return record == null ? failure("task_query_unavailable") : unknown(record, "task_query_unconfirmed");
        }
    }

    @Override public Bundle cancel(String operationId) {
        try {
            snapshot = readStore(); Record record = findOperation(operationId);
            if (record == null) return failure("task_operation_missing");
            if (referenceReleasePending(record)) return query(operationId);
            Bundle proof = authority.cancel(operationId);
            if (Boolean.TRUE.equals(proof.get("cancelled")) && Boolean.FALSE.equals(proof.get("mutation_dispatched"))) {
                if (!Boolean.FALSE.equals(proof.get("hidden_lease")) || !Boolean.FALSE.equals(proof.get("external"))
                        || !Boolean.FALSE.equals(proof.get("cleanup_pending"))) return unknown(record, "task_cancel_proof_incomplete");
                if (record.previous != null) {
                    if (record.metadata.action == Action.RESTORE) finishTarget(record, "RELEASED");
                    AtomicWorkbenchPlatform source = matching(record.metadata.sourceSlot, record.metadata.sourceWindowSession);
                    if (source != null) source.cancelPreparedTaskOperation(operationId, record.metadata.identity.serverBootGeneration,
                            record.metadata.identity.taskGeneration, "SHELVED_REFERENCE", "");
                    snapshot = store.rollbackPreparedShelfOperation(snapshot.revision, operationId, proof);
                    return remember(result(record, "CANCELLED", "task_operation_cancelled", false, false, true, false, false, null));
                }
                Record terminal = copy(record, Phase.TERMINAL, record.disposition, LeaseState.RELEASED,
                        record.leaseId, false, null);
                // RESTORE preparation may still carry a previously committed shelf's lease.
                finishCancelledJournals(record, "WORKSPACE_OWNED");
                snapshot = store.update(snapshot.revision, terminal);
                return remember(result(terminal, "CANCELLED", "task_operation_cancelled", false, false, true, false, false, null));
            }
            return reconcile(record, proof);
        } catch (Exception unavailable) {
            if (unavailable instanceof AtomicWorkbenchTaskShelfStore.SaveException) storageUncertain = true;
            Record record = findOperation(operationId);
            return record == null ? failure("task_cancel_unavailable") : unknown(record, "task_cancel_unconfirmed");
        }
    }

    @Override public Bundle shelf() {
        String stage = "STORE";
        Throwable diagnosticFailure = null;
        boolean observedSuccess = false;
        try {
            snapshot = readStore();
            ArrayList<Bundle> entries = new ArrayList<>(), windows = new ArrayList<>();
            stage = "PRIMARY";
            Bundle primaryReply = authority.primaryDisplay();
            if (!Boolean.TRUE.equals(primaryReply.get("success"))) throw new SecurityException("task_primary_unavailable");
            Bundle primary = checkedPrimary(primaryReply.getBundle("primary_display"));
            ArrayList<String> ids = new ArrayList<>(); for (Record record : snapshot.records) ids.add(record.operationId);
            stage = "INSPECT";
            Bundle inspection = authority.inspect(ids);
            ArrayList<Bundle> proofs = inspection.getParcelableArrayList("operations");
            if (!Boolean.TRUE.equals(inspection.get("success")) || proofs == null || proofs.size() != ids.size())
                throw new SecurityException("task_shelf_inspection_unavailable");
            stage = "REFERENCE_DTO";
            for (int index = 0; index < snapshot.records.size(); index++) {
                Record record = snapshot.records.get(index); Bundle entry = shelfEntry(record), proof = proofs.get(index);
                boolean same = record.operationId.equals(proof.get("operation_id"));
                AtomicWorkbenchTaskIdentity live = same ? observed(record, proof) : null;
                boolean restorable = entry.getBoolean("can_restore") && live != null && live.displayId == 0
                        && Boolean.TRUE.equals(proof.get("scope_current"))
                        && live.displayName.equals(primary.getString("display_name")) && live.displayUnique.equals(primary.getString("display_unique"))
                        && Boolean.FALSE.equals(proof.get("external")) && Boolean.FALSE.equals(proof.get("cleanup_pending"))
                        && Boolean.FALSE.equals(proof.get("operation_unconfirmed"))
                        && (record.leaseState == LeaseState.HELD ? Boolean.TRUE.equals(proof.get("hidden_lease"))
                                && record.leaseId.equals(proof.get("lease_id")) && Boolean.TRUE.equals(proof.get("success"))
                            : Boolean.TRUE.equals(proof.get("cleanup_complete")) && Boolean.FALSE.equals(proof.get("hidden_lease")));
                entry.putBoolean("can_restore", restorable);
                if (live != null) { entry.putBundle("identity", live.toBundle()); entry.putInt("actual_display_id", live.displayId);
                    entry.putString("actual_display_name", live.displayName); entry.putString("actual_display_unique", live.displayUnique); }
                entries.add(entry);
            }
            for (int slot = 0; slot < reader.poolCount; slot++) {
                AtomicWorkbenchPlatform platform = currentPlatform(slot);
                if (platform == null || !platform.hasLiveDisplay() || recoveryOwners.recovering(slot)) continue;
                stage = "DESCRIBE";
                Bundle window = platform.taskWindowIdentity(); Bundle observed = authority.describe(window);
                if (!Boolean.TRUE.equals(observed.get("success"))) throw new IllegalStateException("task_describe_unavailable");
                if (!samePrimary(primary, checkedPrimary(observed.getBundle("primary_display"))))
                    throw new SecurityException("task_primary_changed");
                stage = "TASK_DTO";
                ArrayList<Bundle> tasks = observed.getParcelableArrayList("tasks");
                if (tasks == null || tasks.size() > 64) throw new SecurityException("task_describe_invalid");
                for (Bundle identity : tasks) AtomicWorkbenchTaskIdentity.fromBundle(identity);
                window.putParcelableArrayList("tasks", tasks); windows.add(window);
            }
            stage = "SNAPSHOT_DTO";
            Bundle b = failure("task_shelf_snapshot"); b.putBoolean("success", !storageUncertain&&!storageScopeUnverified);
            b.putLong("shelf_revision", snapshot.revision); b.putLong("input_revision", engine.taskInputRevision());
            b.putParcelableArrayList("entries", entries); b.putParcelableArrayList("windows", windows);
            b.putBundle("primary_display", primary);
            b.putBoolean("cleanup_pending", hasPending()); b.putBoolean("operation_unconfirmed", hasPending());
            observedSuccess = !storageUncertain&&!storageScopeUnverified; return b;
        } catch (Exception unavailable) { diagnosticFailure = unavailable; return failure("task_shelf_unavailable"); }
        finally { shelfDiagnostic(stage, observedSuccess, diagnosticFailure); }
    }

    @Override public Bundle manageReferences(Bundle input) {
        AtomicWorkbenchTaskReferenceRequest r=AtomicWorkbenchTaskReferenceRequest.fromBundle(input);
        AtomicWorkbenchTaskReferenceResult old=referenceReplies.get(r.requestId);
        boolean released=false,wrote=false;
        try {
            snapshot=readStore(); r.requireFresh(SystemClock.elapsedRealtime());
            if(old!=null) {
                if(!old.request.sameRequest(r)) return referenceResponse(r,AtomicWorkbenchTaskReferenceResult.Status.REJECTED,
                        "task_reference_request_rebound",false,false,false,false,false,null);
                return AtomicWorkbenchTaskReferenceResult.response(old,referenceSnapshot(),null);
            }
            if(r.action==AtomicWorkbenchTaskReferenceRequest.Action.STATE) {
                AtomicWorkbenchTaskReferenceResult queried=referenceReplies.get(r.queryRequestId);
                return referenceResponse(r,AtomicWorkbenchTaskReferenceResult.Status.SNAPSHOT,"task_reference_snapshot",
                        false,false,false,false,false,queried);
            }
            if(closing||storageUncertain||storageScopeUnverified||r.expectedRevision!=snapshot.revision)
                return referenceResponse(r,AtomicWorkbenchTaskReferenceResult.Status.REJECTED,"task_reference_stale",false,false,false,false,false,null);
            Record record=selectedReference(r);
            if(record==null) return referenceResponse(r,AtomicWorkbenchTaskReferenceResult.Status.REJECTED,"task_reference_target_changed",false,false,false,false,false,null);
            if(r.action==AtomicWorkbenchTaskReferenceRequest.Action.FORGET) {
                if(record.hasResponsibility()||record.previous!=null)
                    return referenceResponse(r,AtomicWorkbenchTaskReferenceResult.Status.REJECTED,"task_reference_responsibility",false,false,false,false,false,null);
            } else {
                if(!(record.phase==Phase.COMMITTED&&record.leaseState==LeaseState.HELD&&!record.pending()&&record.previous==null)
                        && !referenceReleasePending(record))
                    return referenceResponse(r,AtomicWorkbenchTaskReferenceResult.Status.REJECTED,"task_reference_release_ineligible",false,false,false,false,false,null);
                Bundle proof=authority.query(record.operationId);
                if(!completeReferenceRelease(record,proof)) {
                    requireHeldReference(record,proof);
                    requireReferenceCurrent(r);
                    if(!referenceReleasePending(record)) {
                        wrote=true;
                        snapshot=store.update(snapshot.revision,copy(record,Phase.CLEANUP_PENDING,record.disposition,
                                LeaseState.RELEASE_PENDING,record.leaseId,record.dispatched,null));
                        record=findOperation(record.operationId);
                    }
                    // This explicit action cleans only the original operation. No apply or global cleanup.
                    requireReferenceCurrent(r); released=true; proof=authority.release(record.operationId);
                }
                wrote=true; finishReferenceRelease(record,proof); record=findOperation(r.operationId);
                if(record==null||record.hasResponsibility()) throw new IllegalStateException("task_reference_cleanup_pending");
            }
            // Both Binder and directory fsync may consume the request's entire lifetime.
            requireReferenceCurrent(r); wrote=true;
            snapshot=store.remove(snapshot.revision,r.shelfId);
            return referenceResponse(r,AtomicWorkbenchTaskReferenceResult.Status.REMOVED,"task_reference_removed",released,true,true,true,false,null);
        } catch(Exception unavailable) {
            if(unavailable instanceof AtomicWorkbenchTaskShelfStore.SaveException) storageUncertain=true;
            try { snapshot=readStore(); } catch(Exception unreadable) {
                // A failed read alone does not imply a dispatched resource or write.
                // Preserve real mutation/write uncertainty independently of scope truth.
                if(released||wrote) storageUncertain=true;
            }
            return referenceResponse(r,released||wrote?AtomicWorkbenchTaskReferenceResult.Status.UNCONFIRMED:
                    AtomicWorkbenchTaskReferenceResult.Status.REJECTED,released||wrote?"task_reference_unconfirmed":"task_reference_not_dispatched",
                    released,wrote,false,false,released||wrote,null);
        }
    }

    private Record selectedReference(AtomicWorkbenchTaskReferenceRequest r) {
        Record record=snapshot.find(r.shelfId);
        AtomicWorkbenchTaskIdentity selected=record==null?null:record.observedIdentity==null?record.metadata.identity:record.observedIdentity;
        return record!=null&&record.operationId.equals(r.operationId)&&selected.equals(r.identity)
                &&record.metadata.identity.sameTask(r.identity)&&record.metadata.sourceSlot==r.sourceSlot
                &&record.metadata.sourceWindowSession.equals(r.sourceSession)?record:null;
    }
    private void requireReferenceCurrent(AtomicWorkbenchTaskReferenceRequest r) throws Exception {
        if(referenceAuthorization==null) throw new SecurityException("task_reference_authorization_missing");
        referenceAuthorization.requireCurrent();
        r.requireFresh(SystemClock.elapsedRealtime()); // Recheck after the blocking Provider proof.
    }
    private static boolean referenceReleasePending(Record r) {
        return r!=null&&r.phase==Phase.CLEANUP_PENDING&&r.previous==null
                &&(r.leaseState==LeaseState.RELEASE_PENDING||r.leaseState==LeaseState.RELEASED);
    }
    private void requireHeldReference(Record record,Bundle proof) throws Exception {
        AtomicWorkbenchTaskIdentity live=observed(record,proof);
        Bundle primary=authority.primaryDisplay();
        Bundle display=checkedPrimary(primary.getBundle("primary_display"));
        if(!record.operationId.equals(proof.get("operation_id"))||!Boolean.TRUE.equals(proof.get("success"))
                ||!Boolean.TRUE.equals(proof.get("hidden_lease"))||!record.leaseId.equals(proof.get("lease_id"))
                ||!Boolean.FALSE.equals(proof.get("inherited_hidden_lease"))||!Boolean.FALSE.equals(proof.get("cleanup_pending"))
                ||!Boolean.FALSE.equals(proof.get("operation_unconfirmed"))||!Boolean.FALSE.equals(proof.get("external"))
                ||!Boolean.FALSE.equals(proof.get("ended"))||!Boolean.TRUE.equals(primary.get("success"))||live==null||!live.leaf
                ||live.displayId!=0||!live.displayName.equals(display.getString("display_name"))||!live.displayUnique.equals(display.getString("display_unique")))
            throw new SecurityException("task_reference_lease_changed");
    }
    private boolean completeReferenceRelease(Record record,Bundle proof) throws Exception {
        if(proof==null||!record.operationId.equals(proof.get("operation_id"))||!Integer.valueOf(1).equals(proof.get("schema"))
                ||!Boolean.TRUE.equals(proof.get("cleanup_complete"))||!Boolean.FALSE.equals(proof.get("hidden_lease"))
                ||!Boolean.FALSE.equals(proof.get("inherited_hidden_lease"))||!"".equals(proof.get("lease_id"))
                ||!"".equals(proof.get("inherited_lease_id"))||!Boolean.FALSE.equals(proof.get("cleanup_pending"))
                ||!Boolean.FALSE.equals(proof.get("operation_unconfirmed"))) return false;
        for(String key:java.util.Set.of("mutation_dispatched","external","ended","cancelled"))
            if(!(proof.get(key) instanceof Boolean)) return false;
        AtomicWorkbenchTaskIdentity live=observed(record,proof);
        if(!Boolean.TRUE.equals(proof.get("ended"))&&(live==null||!live.leaf)) return false;
        if(live!=null&&!Boolean.TRUE.equals(proof.get("external"))) {
            if(live.displayId!=0)return false;
            // Closing only retires an already owned exact cleanup. Normal Provider
            // authorization is intentionally unavailable after Root enters closing.
            // The authenticated cleanup broker's real display-0 identity is sufficient
            // here; a new user action still needs a fresh primary-display proof below.
            if(!closing) {
                Bundle primary=authority.primaryDisplay();
                Bundle display=checkedPrimary(primary.getBundle("primary_display"));
                if(!Boolean.TRUE.equals(primary.get("success"))
                        ||!live.displayName.equals(display.getString("display_name"))||!live.displayUnique.equals(display.getString("display_unique"))) return false;
            }
        }
        return true;
    }
    private void finishReferenceRelease(Record record,Bundle proof) throws Exception {
        if(!completeReferenceRelease(record,proof)) throw new SecurityException("task_reference_release_unconfirmed");
        AtomicWorkbenchTaskIdentity live=observed(record,proof);
        Disposition disposition=Boolean.TRUE.equals(proof.get("ended"))?Disposition.ENDED:
                Boolean.TRUE.equals(proof.get("external"))?Disposition.EXTERNALLY_ACTIVE:Disposition.PASSIVE_BACKGROUND;
        Record pending=copy(record,Phase.CLEANUP_PENDING,disposition,LeaseState.RELEASED,record.leaseId,
                record.dispatched||proof.getBoolean("mutation_dispatched"),live);
        snapshot=store.update(snapshot.revision,pending);
        // Keep durable responsibility until every matching origin journal is safely retired.
        finishJournals(pending,disposition==Disposition.ENDED?"ENDED":"SHELVED_REFERENCE","");
        if(record.metadata.action==Action.RESTORE) finishTarget(pending,"RELEASED");
        snapshot=store.update(snapshot.revision,copy(pending,Phase.TERMINAL,disposition,LeaseState.RELEASED,
                record.leaseId,pending.dispatched,live));
    }
    private AtomicWorkbenchTaskReferenceSnapshot referenceSnapshot() {
        Bundle b=new Bundle(); b.putInt("schema",1); b.putBoolean("success",!storageUncertain&&!storageScopeUnverified); b.putString("reason_code",
                storageScopeUnverified?"task_reference_scope_unverified":storageUncertain?"task_reference_storage_unconfirmed":"task_reference_snapshot"); b.putLong("revision",snapshot.revision);
        b.putInt("max_references",MAX_SHELVES); b.putInt("max_pending",MAX_PENDING); b.putInt("total_count",snapshot.records.size());
        int pending=0,held=0,forgettable=0; ArrayList<Bundle> entries=new ArrayList<>();
        for(Record r:snapshot.records) {
            boolean forget=referenceAuthorization!=null&&!closing&&!storageUncertain&&!storageScopeUnverified&&!r.hasResponsibility()&&r.previous==null;
            boolean release=referenceAuthorization!=null&&!closing&&!storageUncertain&&(r.phase==Phase.COMMITTED&&r.leaseState==LeaseState.HELD&&!r.pending()&&r.previous==null
                    ||referenceReleasePending(r))&&!storageScopeUnverified;
            Bundle row=new Bundle(); row.putString("shelf_id",r.shelfId); row.putString("operation_id",r.operationId);
            row.putBundle("identity",(r.observedIdentity==null?r.metadata.identity:r.observedIdentity).toBundle());
            row.putInt("source_slot",r.metadata.sourceSlot); row.putString("source_session",r.metadata.sourceWindowSession);
            row.putString("phase",r.phase.name()); row.putString("disposition",r.disposition.name()); row.putString("lease_state",r.leaseState.name());
            row.putString("lease_id",r.leaseId); row.putBoolean("has_responsibility",r.hasResponsibility()); row.putBoolean("pending",r.pending());
            row.putBoolean("forgettable",forget); row.putBoolean("can_release_and_forget",release); entries.add(row);
            if(r.pending())pending++; if(r.leaseState==LeaseState.HELD)held++; if(forget)forgettable++;
        }
        b.putInt("pending_count",pending); b.putInt("held_count",held); b.putInt("forgettable_count",forgettable); b.putParcelableArrayList("entries",entries);
        return AtomicWorkbenchTaskReferenceSnapshot.fromBundle(b,reader);
    }
    private Bundle referenceResponse(AtomicWorkbenchTaskReferenceRequest r,AtomicWorkbenchTaskReferenceResult.Status status,String reason,
            boolean release,boolean write,boolean removed,boolean committed,boolean pending,AtomicWorkbenchTaskReferenceResult queried) {
        AtomicWorkbenchTaskReferenceResult receipt=new AtomicWorkbenchTaskReferenceResult(r,status,snapshot.revision,reason,release,write,removed,committed,pending);
        if(r.action!=AtomicWorkbenchTaskReferenceRequest.Action.STATE&&!referenceReplies.containsKey(r.requestId)) {
            referenceReplies.put(r.requestId,receipt);
            while(referenceReplies.size()>64)referenceReplies.remove(referenceReplies.keySet().iterator().next());
        }
        return AtomicWorkbenchTaskReferenceResult.response(receipt,referenceSnapshot(),queried);
    }

    @Override public void maintain() {
        if (snapshot.records.isEmpty()) return;
        // One bounded unit per existing engine tick, never an unbounded retry thread.
        int count = snapshot.records.size();
        for (int offset = 0; offset < count; offset++) {
            Record record = snapshot.records.get((maintenanceCursor + offset) % count);
            if (record.pending() || record.leaseState == LeaseState.HELD) {
                maintenanceCursor = (maintenanceCursor + offset + 1) % count;
                query(record.operationId); return;
            }
        }
    }

    @Override public Bundle cleanup() {
        closing = true; boolean pending = false, hadResponsibility = false;
        try {
            snapshot = readStore();
            for (Record record : snapshot.records) hadResponsibility |= record.hasResponsibility();
            if (brokerCleanupRequired || !snapshot.records.isEmpty() || storageUncertain) {
                brokerCleanupRequired = true;
                Bundle complete = authority.cleanup();
                pending |= !Boolean.TRUE.equals(complete.get("success")) || !Boolean.FALSE.equals(complete.get("cleanup_pending"));
            }
            for (Record record : new ArrayList<>(snapshot.records)) if (record.hasResponsibility()) {
                if(referenceReleasePending(record)) {
                    try { finishReferenceRelease(record,authority.release(record.operationId)); }
                    catch(Exception incomplete) { pending=true; }
                    continue;
                }
                Bundle released = authority.release(record.operationId);
                if (!Boolean.TRUE.equals(released.get("cleanup_complete")) || !Boolean.FALSE.equals(released.get("hidden_lease"))
                        || !Boolean.FALSE.equals(released.get("cleanup_pending"))) { pending = true; continue; }
                AtomicWorkbenchTaskIdentity identity = observed(record, released);
                Disposition disposition = Boolean.TRUE.equals(released.get("ended")) ? Disposition.ENDED
                        : Boolean.TRUE.equals(released.get("external")) ? Disposition.EXTERNALLY_ACTIVE
                        : !released.getBoolean("mutation_dispatched") && record.metadata.identity.displayId > 0
                            ? Disposition.WORKSPACE_OWNED : Disposition.PASSIVE_BACKGROUND;
                Record clean = copy(record, Phase.TERMINAL, disposition, LeaseState.RELEASED, record.leaseId,
                        record.dispatched || released.getBoolean("mutation_dispatched"), identity);
                String durableDisposition = disposition == Disposition.ENDED ? "ENDED"
                        : disposition == Disposition.WORKSPACE_OWNED ? "WORKSPACE_OWNED" : "SHELVED_REFERENCE";
                if (!clean.dispatched) finishCancelledJournals(clean, durableDisposition);
                else finishJournals(clean, durableDisposition, "");
                if (record.metadata.action == Action.RESTORE) finishTarget(clean, "RELEASED");
                // Keep the original pending/HELD ownership until every Journal fsync acknowledges cleanup.
                snapshot = store.update(snapshot.revision, clean);
            }
            if (!pending && storageUncertain) {
                // A failed rename/fsync may have no in-memory operation. Preserve uncertainty
                // until broker cleanup and an authoritative complete-store fsync both succeed.
                snapshot = store.save(snapshot.revision, snapshot.records); storageUncertain = false;
            }
        } catch (Exception unavailable) {
            if (unavailable instanceof AtomicWorkbenchTaskShelfStore.SaveException) storageUncertain = true;
            pending = true;
        }
        pending |= pendingRecordsOrStorage();
        cleanupUnconfirmed=pending;
        if (!pending) brokerCleanupRequired = false;
        Bundle b = failure(pending ? "task_cleanup_pending" : "task_cleanup_complete"); b.putBoolean("success", !pending);
        b.putBoolean("had_responsibility", hadResponsibility);
        b.putBoolean("cleanup_pending", pending); b.putBoolean("operation_unconfirmed", pending);
        if(!pending) {
            // Current actual Store facts, not a reset permission or an empty-store shortcut.
            b.putString("store_epoch", snapshot.storeEpoch); b.putLong("store_revision", snapshot.revision);
            b.putString("scope_epoch", snapshot.recoveryScope.epoch); b.putString("scope_phase", snapshot.recoveryScope.phase.name());
        }
        return b;
    }

    @Override public boolean hasPending() {
        return cleanupUnconfirmed || pendingRecordsOrStorage();
    }
    private boolean pendingRecordsOrStorage() {
        if (storageUncertain || storageScopeUnverified) return true;
        for (Record r : snapshot.records) if (r.pending() || closing && r.leaseState == LeaseState.HELD) return true;
        return false;
    }
    @Override public boolean blocksWindow(int id) {
        if (!reader.contains(id)) return false;
        for (Record r : snapshot.records) if (r.pending() && (r.metadata.sourceSlot == id || r.metadata.targetSlot == id)) {
            try {
                Bundle current = currentPlatform(id).taskWindowIdentity();
                String session = current.getString("window_session");
                if (id == r.metadata.sourceSlot && r.metadata.sourceWindowSession.equals(session)
                        || id == r.metadata.targetSlot && r.metadata.targetWindowSession.equals(session)) return true;
            } catch (Exception unavailable) { return true; }
        }
        return storageUncertain;
    }

    private Bundle reconcile(Record record, Bundle proof) throws Exception {
        if (record == null || proof == null || !record.operationId.equals(proof.get("operation_id")))
            return record == null ? failure("task_operation_missing") : unknown(record, "task_proof_missing");
        if (Boolean.TRUE.equals(proof.get("external")) || Boolean.TRUE.equals(proof.get("cleanup_complete"))) {
            AtomicWorkbenchTaskIdentity identity = observed(record, proof);
            Disposition disposition = Boolean.TRUE.equals(proof.get("ended")) ? Disposition.ENDED
                    : Boolean.TRUE.equals(proof.get("external")) ? Disposition.EXTERNALLY_ACTIVE : Disposition.PASSIVE_BACKGROUND;
            Record clean = copy(record, Phase.TERMINAL, disposition, LeaseState.RELEASED, record.leaseId,
                    record.dispatched || proof.getBoolean("mutation_dispatched"), identity);
            finishJournals(clean, disposition == Disposition.ENDED ? "ENDED" : "SHELVED_REFERENCE", "");
            if (record.metadata.action == Action.RESTORE) finishTarget(clean, "RELEASED");
            snapshot = store.update(snapshot.revision, clean);
            return remember(publicRecord(clean, "task_external_or_released"));
        }
        if (!Boolean.TRUE.equals(proof.get("success")) || !Boolean.TRUE.equals(proof.get("mutation_dispatched"))
                || !Boolean.TRUE.equals(proof.get("position_verified")) || !Boolean.TRUE.equals(proof.get("visibility_verified"))
                || !Boolean.TRUE.equals(proof.get("focus_unchanged")) || !Boolean.FALSE.equals(proof.get("cleanup_pending"))
                || !Boolean.FALSE.equals(proof.get("operation_unconfirmed")))
            return persistUnknown(record, "task_postcondition_unconfirmed", record.dispatched || proof.getBoolean("mutation_dispatched"));
        AtomicWorkbenchTaskIdentity identity = record.metadata.action == Action.END_TASK ? record.metadata.identity : observed(record, proof);
        if (record.metadata.action == Action.END_TASK && !Boolean.TRUE.equals(proof.get("ended"))) return persistUnknown(record, "task_end_unconfirmed", true);
        boolean shelf = record.metadata.action == Action.SHELVE;
        String lease = proof.getString("lease_id");
        if (shelf ? !Boolean.TRUE.equals(proof.get("hidden_lease")) || lease == null || !lease.matches("[0-9a-f]{32}")
                : !Boolean.FALSE.equals(proof.get("hidden_lease"))) return persistUnknown(record, "task_visibility_unconfirmed", true);
        if (record.metadata.action != Action.END_TASK && (identity == null || identity.displayId != record.metadata.targetDisplayId
                || !identity.displayName.equals(record.metadata.targetDisplayName) || !identity.displayUnique.equals(record.metadata.targetDisplayUnique)))
            return persistUnknown(record, "task_location_unconfirmed", true);
        Disposition disposition = shelf ? Disposition.SHELVED_REFERENCE : record.metadata.action == Action.RESTORE ? Disposition.RESTORED
                : record.metadata.action == Action.END_TASK ? Disposition.ENDED : Disposition.RELEASED;
        Record committed = copy(record, Phase.COMMITTED, disposition, shelf ? LeaseState.HELD : LeaseState.RELEASED,
                shelf ? lease : record.leaseId, true, identity);
        boolean alreadyCommitted = record.phase == Phase.COMMITTED && record.disposition == committed.disposition
                && record.leaseState == committed.leaseState && record.leaseId.equals(committed.leaseId)
                && record.observedIdentity != null && record.observedIdentity.equals(committed.observedIdentity);
        // Durable handoff metadata must exist before a Journal retires its origin, but
        // it remains pending until all Journal/binding writes finish. A crash or query
        // failure must never expose a forgettable COMMITTED record with old responsibility.
        if (!alreadyCommitted) snapshot = store.update(snapshot.revision, copy(record, Phase.VERIFY_PENDING,
                committed.disposition, committed.leaseState, committed.leaseId, true, identity));
        if (!alreadyCommitted || storageUncertain) {
            finishJournals(committed, disposition == Disposition.RESTORED ? "TRANSFERRED" : disposition.name(),
                    disposition == Disposition.RESTORED ? record.metadata.targetWindowSession : "");
            if (disposition == Disposition.RESTORED) finishTarget(committed);
            AtomicWorkbenchPlatform source = matching(record.metadata.sourceSlot, record.metadata.sourceWindowSession);
            if (source != null && record.metadata.identity.displayId > 0) source.synchronizeTaskOperationBinding(null);
            if (storageUncertain) snapshot = store.save(snapshot.revision, snapshot.records);
            storageUncertain = false;
            if (!alreadyCommitted) snapshot = store.update(snapshot.revision, committed);
        }
        return remember(result(committed, "COMMITTED", "task_operation_committed", true, true, true, true, false, identity));
    }

    private void requireWindow(int slot, String session, int display, String name, String unique) throws Exception {
        AtomicWorkbenchPlatform platform = currentPlatform(slot);
        if (platform == null || recoveryOwners.recovering(slot)) throw new SecurityException("task_window_unavailable");
        Bundle current = platform.taskWindowIdentity();
        if (!session.equals(current.getString("window_session")) || display != current.getInt("display_id")
                || !name.equals(current.getString("display_name")) || !unique.equals(current.getString("display_unique")))
            throw new SecurityException("task_window_changed");
    }
    private void prepareJournals(AtomicWorkbenchTaskOperationRequest request, String phase, String lease) throws Exception {
        AtomicWorkbenchPlatform source = matching(request.sourceSlot, request.sourceWindowSession);
        if (source != null) source.prepareTaskOperation(request, false, phase, lease);
        else if (request.action != Action.RESTORE && !(request.action == Action.END_TASK && request.identity.displayId == 0))
            throw new SecurityException("task_source_journal_missing");
        if (request.action == Action.RESTORE) currentPlatform(request.targetSlot).prepareTaskOperation(request, true, phase, lease);
    }
    private void finishJournals(Record record, String disposition, String successor) throws Exception {
        DurableMetadata m = record.metadata;
        AtomicWorkbenchPlatform source = matching(m.sourceSlot, m.sourceWindowSession);
        if (source != null && !(m.action == Action.RESTORE && m.sourceSlot == m.targetSlot && m.sourceWindowSession.equals(m.targetWindowSession)))
            source.finishTaskOperation(m.operationId, m.identity.serverBootGeneration, m.identity.taskGeneration, disposition, successor);
    }
    private void finishCancelledJournals(Record record, String disposition) throws Exception {
        DurableMetadata m = record.metadata; AtomicWorkbenchPlatform source = matching(m.sourceSlot, m.sourceWindowSession);
        if (source != null && !(m.action == Action.RESTORE && m.sourceSlot == m.targetSlot && m.sourceWindowSession.equals(m.targetWindowSession)))
            source.cancelPreparedTaskOperation(m.operationId, m.identity.serverBootGeneration, m.identity.taskGeneration, disposition, "");
    }
    private void finishTarget(Record record) throws Exception {
        finishTarget(record, "WORKSPACE_OWNED");
    }
    private void finishTarget(Record record, String disposition) throws Exception {
        DurableMetadata m = record.metadata; AtomicWorkbenchPlatform target = matching(m.targetSlot, m.targetWindowSession);
        if (target == null && "RELEASED".equals(disposition)) return;
        if (target == null) throw new SecurityException("task_receiver_journal_missing");
        if ("WORKSPACE_OWNED".equals(disposition)) target.synchronizeTaskOperationBinding(record.observedIdentity);
        if (!record.dispatched && "RELEASED".equals(disposition))
            target.cancelPreparedTaskOperation(m.operationId, m.identity.serverBootGeneration, m.identity.taskGeneration, disposition, "");
        else target.finishTaskOperation(m.operationId, m.identity.serverBootGeneration, m.identity.taskGeneration, disposition, "");
    }
    private AtomicWorkbenchPlatform matching(int slot, String session) {
        AtomicWorkbenchPlatform platform = currentPlatform(slot);
        return platform != null && platform.hasTaskJournalSession(session) ? platform : null;
    }
    private AtomicWorkbenchTaskIdentity observed(Record record, Bundle proof) {
        Bundle value = proof.getBundle("identity");
        if (value == null) return null;
        AtomicWorkbenchTaskIdentity identity = AtomicWorkbenchTaskIdentity.fromBundle(value);
        if (!record.metadata.identity.sameTask(identity)) throw new SecurityException("task_observed_generation_changed");
        return identity;
    }
    private Record findOperation(String id) { for (Record r : snapshot.records) if (r.operationId.equals(id)) return r; return null; }
    private Record copy(Record r, Phase phase, Disposition disposition, LeaseState leaseState, String lease, boolean dispatched,
                        AtomicWorkbenchTaskIdentity observed) {
        return new Record(r.metadata, phase, disposition, leaseState, lease, dispatched,
                observed == null ? r.actualDisplayId : observed.displayId, observed == null ? r.actualDisplayName : observed.displayName,
                observed == null ? r.actualDisplayUnique : observed.displayUnique, observed == null ? r.observedIdentity : observed,
                phase == Phase.COMMITTED || phase == Phase.TERMINAL ? null : r.previous);
    }
    private Bundle persistUnknown(Record record, String reason, boolean dispatched) {
        if (record == null) return failure(reason);
        try {
            LeaseState lease = record.leaseState == LeaseState.HELD ? LeaseState.HELD : LeaseState.UNKNOWN;
            snapshot = store.update(snapshot.revision, copy(record, Phase.VERIFY_PENDING, record.disposition, lease,
                    record.leaseId, dispatched, null));
        } catch (Exception failure) { storageUncertain = true; }
        return unknown(findOperation(record.operationId) == null ? record : findOperation(record.operationId), reason);
    }
    private Bundle unknown(Record record, String reason) {
        return result(record, "UNCONFIRMED", reason, record.dispatched, false, false, false, true, null);
    }
    private Bundle publicRecord(Record record, String reason) {
        return result(record, record.pending() ? "UNCONFIRMED" : "STALE", reason,
                record.dispatched, false, record.phase == Phase.TERMINAL, false, record.pending(), record.observedIdentity);
    }
    private Bundle shelfEntry(Record r) {
        DurableMetadata m = r.metadata; Bundle b = new Bundle(); b.putInt("schema", 1);
        b.putString("shelf_id", r.shelfId); b.putString("operation_id", r.operationId); b.putString("action", m.action.name());
        b.putString("phase", r.phase.name()); b.putString("disposition", r.disposition.name()); b.putString("lease_state", r.leaseState.name());
        b.putString("lease_id", r.leaseId); b.putBundle("identity", r.observedIdentity == null ? m.identity.toBundle() : r.observedIdentity.toBundle());
        b.putInt("source_slot", m.sourceSlot); b.putString("source_window_session", m.sourceWindowSession);
        b.putString("source_session", m.sourceWindowSession); b.putLong("revision", snapshot.revision);
        b.putInt("actual_display_id", r.actualDisplayId); b.putString("actual_display_name", r.actualDisplayName); b.putString("actual_display_unique", r.actualDisplayUnique);
        b.putBoolean("pending", r.pending());
        b.putBoolean("can_restore", !closing && !storageUncertain && !storageScopeUnverified
                && snapshot.recoveryScope.phase!=AtomicWorkbenchRecoveryScope.Phase.DRAINING
                && reader.contains(m.sourceSlot) && !r.pending() && r.observedIdentity != null
                && r.observedIdentity.displayId == 0 && r.observedIdentity.userId == m.identity.userId
                && (r.disposition == Disposition.SHELVED_REFERENCE && r.leaseState == LeaseState.HELD
                    || r.disposition == Disposition.PASSIVE_BACKGROUND && r.leaseState == LeaseState.RELEASED));
        return b;
    }
    private static Bundle checkedPrimary(Bundle b) {
        if (b == null || !b.keySet().equals(java.util.Set.of("display_id", "display_name", "display_unique"))
                || !(b.get("display_id") instanceof Integer) || b.getInt("display_id") != 0
                || !(b.get("display_name") instanceof String) || b.getString("display_name").isEmpty()
                || !(b.get("display_unique") instanceof String) || b.getString("display_unique").isEmpty())
            throw new SecurityException("task_primary_invalid");
        return new Bundle(b);
    }
    private static boolean samePrimary(Bundle a, Bundle b) {
        return a.getInt("display_id") == b.getInt("display_id") && a.getString("display_name").equals(b.getString("display_name"))
                && a.getString("display_unique").equals(b.getString("display_unique"));
    }
    private Bundle result(Record record, String status, String reason, boolean dispatched, boolean position, boolean committed,
                          boolean focus, boolean pending, AtomicWorkbenchTaskIdentity identity) {
        Bundle b = new Bundle(); b.putInt("schema", 1); b.putString("operation_id", record.operationId); b.putString("shelf_id", record.shelfId);
        b.putString("action", record.metadata.action.name()); b.putString("status", status); b.putLong("revision", snapshot.revision);
        b.putBundle("identity", identity == null ? new Bundle() : identity.toBundle()); b.putString("phase", record.phase.name());
        b.putString("disposition", record.disposition.name()); b.putString("reason_code", reason); b.putString("lease_id", record.leaseId);
        b.putBoolean("mutation_dispatched", dispatched); b.putBoolean("position_verified", position); b.putBoolean("visibility_verified", position);
        b.putBoolean("store_committed", committed); b.putBoolean("focus_unchanged", focus); b.putBoolean("cleanup_pending", pending);
        b.putBoolean("success", "COMMITTED".equals(status) && position && committed && focus && !pending);
        b.putBoolean("operation_unconfirmed", "UNCONFIRMED".equals(status) || "CLEANUP_PENDING".equals(status));
        return AtomicWorkbenchTaskOperationResult.fromBundle(b).toBundle();
    }
    private Bundle rejectedRequest(AtomicWorkbenchTaskOperationRequest request, String reason) {
        return remember(new AtomicWorkbenchTaskOperationResult(request, AtomicWorkbenchTaskOperationResult.Status.REJECTED,
                snapshot.revision, null, "TERMINAL", "WORKSPACE_OWNED", reason,
                false, false, false, false, false, false, "").toBundle());
    }
    private Bundle pendingRequest(AtomicWorkbenchTaskOperationRequest request, String reason) {
        return remember(new AtomicWorkbenchTaskOperationResult(request, AtomicWorkbenchTaskOperationResult.Status.CLEANUP_PENDING,
                snapshot.revision, null, "CLEANUP_PENDING", "WORKSPACE_OWNED", reason,
                false, false, false, false, false, true, "").toBundle());
    }
    private Bundle remember(Bundle b) {
        replies.put(b.getString("operation_id"), new Bundle(b));
        while (replies.size() > 64) replies.remove(replies.keySet().iterator().next()); return b;
    }
    private static Bundle failure(String reason) {
        Bundle b = new Bundle(); b.putInt("schema", 1); b.putBoolean("success", false); b.putString("reason", reason); return b;
    }
}
