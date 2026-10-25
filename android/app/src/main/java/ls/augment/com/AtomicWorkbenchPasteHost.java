package ls.augment.com;

import android.os.Bundle;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/** Root-engine-thread-only metadata/focus lease. No original paste text enters this object. */
final class AtomicWorkbenchPasteHost implements AutoCloseable {
    interface Clock { long now(); }
    interface Workspace {
        Bundle windowState(int id) throws Exception;
        int activeInputWindow() throws Exception;
        long inputRevision() throws Exception;
        Bundle focusInputOnly(int id) throws Exception;
        AtomicWorkbenchEditorEvidence queryEvidence(AtomicWorkbenchPasteRequest request) throws Exception;
        default AtomicWorkbenchEditorEvidence.WindowEvidence queryWindowEvidence(AtomicWorkbenchPasteRequest request) throws Exception {
            throw new IllegalStateException("window_evidence_unavailable");
        }
        boolean sessionCurrent(long session, long resetGeneration) throws Exception;
    }
    private static final Set<String> KEYS = Set.of("schema", "id", "session", "reset", "epoch", "window", "display",
            "name", "unique", "user", "module_uid", "target_uid", "task", "package", "source_id", "source_revision", "created", "deadline");
    private static final Set<String> INTS = Set.of("schema", "window", "display", "user", "module_uid", "target_uid", "task");
    private static final Set<String> LONGS = Set.of("session", "reset", "epoch", "source_revision", "created", "deadline");
    private static final class Seen {
        final AtomicWorkbenchPasteRequest request;
        Seen(AtomicWorkbenchPasteRequest r) { request = r; }
    }
    private static final class Identity {
        int window, display, uid, user, task;
        String name, unique, pkg;
        boolean sameDisplay(Identity other) { return other != null && window == other.window && display == other.display
                && user == other.user && name.equals(other.name) && unique.equals(other.unique); }
        boolean sameTarget(Identity other) { return sameDisplay(other) && uid == other.uid && task == other.task && pkg.equals(other.pkg); }
        boolean matches(AtomicWorkbenchPasteRequest r) { return window == r.windowId && display == r.displayId && user == r.userId
                && uid == r.targetUid && task == r.taskId && r.displayName.equals(name) && r.displayUniqueId.equals(unique) && r.packageName.equals(pkg); }
    }
    private static final class Lease {
        final AtomicWorkbenchPasteRequest request;
        final Identity target, prior;
        final int priorWindow;
        final long beforeRevision;
        long ownedRevision;
        int ownedWindow;
        boolean attempted, prepared, cleanup, ending, editorWindowRefreshed, ownershipKnown = true;
        AtomicWorkbenchEditorEvidence evidence;
        AtomicWorkbenchEditorEvidence.WindowEvidence windowEvidence;
        Lease(AtomicWorkbenchPasteRequest r, Identity target, Identity prior, int priorWindow, long revision) {
            request = r; this.target = target; this.prior = prior; this.priorWindow = priorWindow;
            beforeRevision = revision; ownedRevision = revision; ownedWindow = priorWindow;
        }
    }
    private final int appUid, userId;
    private final long session, reset;
    private final Clock clock;
    private final Workspace workspace;
    private final Map<String, Seen> seen = new LinkedHashMap<>();
    private Lease active;
    private boolean closed;

    AtomicWorkbenchPasteHost(int appUid, int userId, long session, long resetGeneration, Clock clock, Workspace workspace) {
        if (appUid < 10000 || appUid / 100000 != userId || session < 0 || resetGeneration < 0 || clock == null || workspace == null)
            throw new IllegalArgumentException("invalid_paste_host");
        this.appUid = appUid; this.userId = userId; this.session = session; reset = resetGeneration;
        this.clock = clock; this.workspace = workspace;
    }

    synchronized Bundle prepare(Bundle metadata) {
        final AtomicWorkbenchPasteRequest r;
        try { r = parse(metadata); } catch (Exception invalid) { return result(false, "invalid_metadata", null, false); }
        prune();
        if (closed) return result(false, "session_ended", r, false);
        String invalid = AtomicWorkbenchPastePolicy.invalid(r, clock.now());
        if (invalid != null) return result(false, invalid, r, false);
        Seen previous = seen.get(r.id);
        if (previous != null && !same(previous.request, r)) return result(false, "request_identity_changed", r, false);
        if (active != null) {
            if (active.request.id.equals(r.id) && same(active.request, r) && active.prepared && !active.ending)
                return validate(metadata, active.evidence.toBundle());
            if (same(active.request,r)&&active.windowEvidence!=null&&!active.prepared&&!active.ending)
                return prepareEvidence(active);
            return result(false, active.cleanup ? "focus_restore_pending" : "operation_busy", r, false);
        }
        if (previous != null) return result(false, "request_consumed", r, false);
        if (seen.size() >= 128) return result(false, "operation_busy", r, false);
        seen.put(r.id, new Seen(r));
        try {
            if (!workspace.sessionCurrent(session, reset)) return result(false, "session_ended", r, false);
            Identity target = snapshot(r.windowId, true);
            if (!target.matches(r)) return result(false, "target_changed", r, false);
            int priorWindow = workspace.activeInputWindow();
            long revision = workspace.inputRevision();
            if (priorWindow < -1 || priorWindow > 7 || revision < 0) return result(false, "input_state_unknown", r, false);
            Identity prior = priorWindow < 0 ? null : snapshot(priorWindow, false);
            Lease lease = new Lease(r, target, prior, priorWindow, revision);
            active = lease; // Preserve responsibility before the fallible focus action.
            if (!target.sameTarget(snapshot(r.windowId, true)) || !freshSession(r)
                    || workspace.inputRevision() != revision || workspace.activeInputWindow() != priorWindow)
                return result(false, "target_changed", r, false);
            if (priorWindow != r.windowId) {
                lease.attempted = true; lease.cleanup = true;
                Bundle focus = null;
                try { focus = workspace.focusInputOnly(r.windowId); }
                finally { observeAfterAction(lease); }
                if (!success(focus) || !lease.ownershipKnown || lease.ownedWindow != r.windowId)
                    return result(false, "input_focus_unconfirmed", r, false);
            }
            if (!freshSession(r) || workspace.inputRevision() != lease.ownedRevision
                    || workspace.activeInputWindow() != r.windowId || !target.sameTarget(snapshot(r.windowId, true)))
                return result(false, "target_changed", r, false);
            return prepareEvidence(lease);
        } catch (Exception unavailable) { return result(false, evidenceFailure(unavailable, "prepare_unavailable"), r, false); }
    }

    /** Same request/owned revision may finish one explicit native-node focus step; it cannot edit. */
    synchronized boolean awaitingVisibleFocus(Bundle metadata) {
        try {
            AtomicWorkbenchPasteRequest r=parse(metadata);
            // This only suppresses another input cancellation. prepareEvidence still rechecks
            // deadline, session, target and owned revision before returning any editor authority.
            return active!=null&&!active.prepared&&!active.ending&&active.windowEvidence!=null&&same(active.request,r);
        }catch(Exception unavailable){return false;}
    }
    private boolean leaseCurrent(Lease lease)throws Exception {
        AtomicWorkbenchPasteRequest r=lease.request;
        return active==lease&&freshSession(r)&&workspace.inputRevision()==lease.ownedRevision
                &&workspace.activeInputWindow()==r.windowId&&lease.target.sameTarget(snapshot(r.windowId,true))&&freshSession(r);
    }
    private Bundle prepareEvidence(Lease lease) {
        AtomicWorkbenchPasteRequest r=lease.request;
        try {
            if(!leaseCurrent(lease))return result(false,"target_changed",r,false);
            AtomicWorkbenchEditorEvidence evidence;
            try{evidence=workspace.queryEvidence(r);}
            catch(Exception unavailable){
                if(lease.windowEvidence!=null&&!lease.editorWindowRefreshed){
                    if(!refreshEditorWindow(lease))return result(false,"input_focus_unconfirmed",r,false);
                    // An intra-window first focus may leave native window-gain EditorInfo
                    // behind the current editor. Retain both full native checks and re-query.
                    evidence=workspace.queryEvidence(r);
                }else{
                if(lease.windowEvidence==null)try{
                    AtomicWorkbenchEditorEvidence.WindowEvidence window=workspace.queryWindowEvidence(r);
                    if(window!=null&&window.matches(r,clock.now())&&leaseCurrent(lease)){
                        lease.windowEvidence=window;
                        Bundle out=result(false,"editable_focus_required",r,false);out.putBundle("window_evidence",window.toBundle());return out;
                    }
                }catch(Exception missingWindow){/* Older paths keep their original refusal. */}
                return result(false,evidenceFailure(unavailable,"prepare_unavailable"),r,false);
                }
            }
            if(evidence==null||!evidence.matches(r,clock.now())||!leaseCurrent(lease)
                    ||lease.windowEvidence!=null&&(!lease.windowEvidence.matches(r,clock.now())||!lease.windowEvidence.sameWindow(evidence)))
                return result(false,"editor_evidence_unavailable",r,false);
            lease.evidence=evidence;lease.prepared=true;
            Bundle out=result(true,"prepared",r,false);out.putBundle("evidence",evidence.toBundle());return out;
        }catch(Exception unavailable){return result(false,evidenceFailure(unavailable,"prepare_unavailable"),r,false);}
    }

    private boolean refreshEditorWindow(Lease lease)throws Exception {
        AtomicWorkbenchPasteRequest r=lease.request;
        lease.editorWindowRefreshed=true; // One bounded native focus cycle, never an edit retry.
        if(!leaseCurrent(lease)||!lease.windowEvidence.matches(r,clock.now()))return false;
        AtomicWorkbenchEditorEvidence.WindowEvidence fresh=workspace.queryWindowEvidence(r);
        if(fresh==null||!fresh.matches(r,clock.now())||!lease.windowEvidence.sameWindow(fresh)||!leaseCurrent(lease))return false;
        lease.attempted=true;lease.cleanup=true;
        Bundle host=null;
        try{host=workspace.focusInputOnly(-1);}finally{observeAfterAction(lease,true);}
        if(!success(host)||!lease.ownershipKnown||lease.ownedWindow!=-1||!freshSession(r)
                ||workspace.inputRevision()!=lease.ownedRevision||workspace.activeInputWindow()!=-1
                ||!lease.target.sameTarget(snapshot(r.windowId,true))||!freshSession(r))return false;
        Bundle target=null;
        try{target=workspace.focusInputOnly(r.windowId);}finally{observeAfterAction(lease,true);}
        return success(target)&&lease.ownershipKnown&&lease.ownedWindow==r.windowId&&leaseCurrent(lease);
    }

    synchronized Bundle validate(Bundle metadata, Bundle suppliedEvidence) {
        final AtomicWorkbenchPasteRequest r;
        try { r = parse(metadata); } catch (Exception invalid) { return result(false, "invalid_metadata", null, false); }
        Lease lease = active;
        if (lease == null || !lease.prepared || lease.ending || !same(lease.request, r)) return result(false, "lease_missing", r, false);
        try {
            AtomicWorkbenchEditorEvidence supplied = AtomicWorkbenchEditorEvidence.fromBundle(suppliedEvidence);
            if (!freshSession(r) || !supplied.matches(r, clock.now()) || !lease.evidence.sameEditor(supplied)
                    || workspace.inputRevision() != lease.ownedRevision || workspace.activeInputWindow() != r.windowId
                    || !lease.target.sameTarget(snapshot(r.windowId, true))) return result(false, "lease_changed", r, false);
            AtomicWorkbenchEditorEvidence fresh = workspace.queryEvidence(r);
            if (fresh == null || !fresh.matches(r, clock.now()) || !lease.evidence.sameEditor(fresh) || !freshSession(r)
                    || workspace.inputRevision() != lease.ownedRevision || workspace.activeInputWindow() != r.windowId
                    || !lease.target.sameTarget(snapshot(r.windowId, true)) || !freshSession(r)) return result(false, "editor_changed", r, false);
            Bundle result = result(true, "validated", r, false); result.putBundle("evidence", fresh.toBundle()); return result;
        } catch (Exception unavailable) { return result(false, evidenceFailure(unavailable, "validation_unavailable"), r, false); }
    }

    /** Root calls this and its exact-window share action consecutively on the same engine thread. */
    synchronized Bundle authorizeShare(Bundle metadata) {
        final AtomicWorkbenchPasteRequest r;
        try { r = parse(metadata); } catch (Exception invalid) { return result(false, "invalid_metadata", null, false); }
        prune();
        if (closed) return result(false, "session_ended", r, false);
        String invalid = AtomicWorkbenchPastePolicy.invalid(r, clock.now());
        if (invalid != null) return result(false, invalid, r, false);
        if (active != null) return result(false, active.cleanup ? "focus_restore_pending" : "operation_busy", r, false);
        if (seen.containsKey(r.id)) return result(false, "request_consumed", r, false);
        if (seen.size() >= 128) return result(false, "operation_busy", r, false);
        try {
            if (!freshSession(r)) return result(false, "session_ended", r, false);
            Identity target = snapshot(r.windowId, true);
            if (!target.matches(r) || !freshSession(r) || !target.sameTarget(snapshot(r.windowId, true)) || !freshSession(r))
                return result(false, "target_changed", r, false);
            // Claim only after validation. Any later share/start exception consumes this ID.
            seen.put(r.id, new Seen(r));
            return result(true, "share_authorized", r, false);
        } catch (Exception unavailable) { return result(false, "share_authorization_unavailable", r, false); }
    }

    /** Cleanup intentionally accepts an expired request. No request can extend its editing deadline. */
    synchronized Bundle release(Bundle metadata) {
        final AtomicWorkbenchPasteRequest r;
        try { r = parse(metadata); } catch (Exception invalid) { return result(false, "invalid_metadata", null, false); }
        if (active == null) {
            Seen previous = seen.get(r.id);
            return result(previous != null && same(previous.request, r), previous == null ? "lease_missing" : "already_released", r, false);
        }
        if (!same(active.request, r)) return result(false, "lease_mismatch", r, false);
        return releaseActive();
    }

    synchronized Bundle maintain() {
        prune();
        if (active == null) return result(true, "idle", null, false);
        // An active side-focus lease stays in place while its valid editing request runs.
        if (!closed && clock.now() < active.request.deadlineAt && (active.prepared||active.windowEvidence!=null) && !active.ending) {
            try {
                if (freshSession(active.request) && workspace.inputRevision() == active.ownedRevision
                        && workspace.activeInputWindow() == active.ownedWindow
                        && active.target.sameTarget(snapshot(active.request.windowId, true))
                        && clock.now() < active.request.deadlineAt) return result(true, active.prepared?"prepared":"window_prepared", active.request, false);
            } catch (Exception unavailable) { return result(false, "maintenance_unavailable", active.request, false); }
        }
        return releaseActive();
    }
    synchronized boolean hasCleanupResponsibility() { return active != null && active.cleanup; }
    synchronized boolean hasCleanupPending() { return active != null && active.cleanup && ((!active.prepared&&active.windowEvidence==null) || active.ending); }
    @Override public synchronized void close() {
        closed = true;
        if (active != null) releaseActive();
        if (hasCleanupResponsibility()) throw new IllegalStateException("paste_focus_restore_pending");
    }

    private Bundle releaseActive() {
        Lease lease = active;
        lease.ending = true;
        AtomicWorkbenchPasteRequest r = lease.request;
        if (!lease.cleanup) { active = null; return result(true, "released", r, true); }
        try {
            // A new Provider/Root owner never inherits an old lease's authority.
            if (!workspace.sessionCurrent(session, reset)) { active = null; return result(true, "session_ended", r, false); }
            if (workspace.inputRevision() != lease.ownedRevision || workspace.activeInputWindow() != lease.ownedWindow) {
                active = null; return result(true, "newer_input_preserved", r, false);
            }
            if (!lease.ownershipKnown) return result(false, "input_ownership_unconfirmed", r, false);
            Identity owned = lease.ownedWindow == r.windowId ? lease.target : lease.prior;
            if (lease.ownedWindow >= 0) {
                Identity current = snapshot(lease.ownedWindow, lease.ownedWindow == r.windowId);
                boolean same = lease.ownedWindow == r.windowId ? owned != null && owned.sameTarget(current) : owned != null && owned.sameDisplay(current);
                if (!same) { active = null; return result(true, "newer_target_preserved", r, false); }
            }
            if (lease.priorWindow >= 0 && !lease.prior.sameDisplay(snapshot(lease.priorWindow, false))) {
                active = null; return result(true, "prior_display_changed", r, false);
            }
            Bundle restored = null;
            try { restored = workspace.focusInputOnly(lease.priorWindow); }
            finally { observeAfterAction(lease); }
            if (!success(restored) || !lease.ownershipKnown || lease.ownedWindow != lease.priorWindow)
                return result(false, "focus_restore_pending", r, false);
            // Revalidate the original display after the focus action as well.
            if (lease.priorWindow >= 0 && !lease.prior.sameDisplay(snapshot(lease.priorWindow, false)))
                return result(false, "focus_restore_pending", r, false);
            active = null; return result(true, "released", r, true);
        } catch (Exception unavailable) { return result(false, "focus_restore_pending", r, false); }
    }

    private void observeAfterAction(Lease lease) {
        observeAfterAction(lease,false);
    }
    private void observeAfterAction(Lease lease,boolean allowHost) {
        try {
            long revision = workspace.inputRevision(); int window = workspace.activeInputWindow();
            lease.ownershipKnown = revision > lease.ownedRevision && (window == lease.priorWindow || window == lease.request.windowId || allowHost&&window==-1);
            lease.ownedRevision = revision; lease.ownedWindow = window;
        } catch (Exception unavailable) { lease.ownershipKnown = false; }
    }
    private boolean freshSession(AtomicWorkbenchPasteRequest r) throws Exception {
        return !closed && AtomicWorkbenchPastePolicy.invalid(r, clock.now()) == null && workspace.sessionCurrent(session, reset)
                && !closed && AtomicWorkbenchPastePolicy.invalid(r, clock.now()) == null;
    }
    private Identity snapshot(int id, boolean target) throws Exception {
        Bundle b = workspace.windowState(id);
        if (!success(b) || !Boolean.FALSE.equals(b.get("recovery_pending")) || !"active".equals(b.get("state"))
                || target && (!Boolean.FALSE.equals(b.get("native_home")) || !Boolean.FALSE.equals(b.get("home_only"))))
            throw new IllegalStateException("window_snapshot_unknown");
        Identity out = new Identity(); out.window = integer(b, "window_id"); out.display = integer(b, "display_id");
        out.name = string(b, "display_name", 256); out.unique = string(b, "display_unique_id", 512);
        out.user = integer(b, "user_id"); out.uid = integer(b, "target_uid"); out.task = integer(b, "task_id");
        out.pkg = string(b, "package", 256);
        if (out.window != id || out.display <= 0 || out.user != userId || !out.name.matches("DuoAtomic-" + appUid + "-w" + id
                + "-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
                || target && (out.uid < 10000 || out.uid / 100000 != userId || out.task < 0)) throw new IllegalStateException("window_identity_unknown");
        return out;
    }
    private AtomicWorkbenchPasteRequest parse(Bundle b) {
        if (b == null || b.size() != KEYS.size() || !b.keySet().equals(KEYS)) throw new IllegalArgumentException("invalid_metadata");
        for (String key : KEYS) {
            Object value = b.get(key);
            if (INTS.contains(key) ? !(value instanceof Integer) : LONGS.contains(key) ? !(value instanceof Long) : !(value instanceof String))
                throw new IllegalArgumentException("invalid_metadata");
        }
        if (integer(b, "schema") != 1 || integer(b, "module_uid") != appUid || integer(b, "user") != userId
                || (Long) b.get("session") != session || (Long) b.get("reset") != reset) throw new IllegalArgumentException("invalid_metadata");
        return new AtomicWorkbenchPasteRequest(string(b, "id", 32), (Long) b.get("session"), (Long) b.get("reset"), (Long) b.get("epoch"),
                integer(b, "window"), integer(b, "display"), string(b, "name", 256), string(b, "unique", 512), integer(b, "user"),
                integer(b, "module_uid"), integer(b, "target_uid"), integer(b, "task"), string(b, "package", 256),
                string(b, "source_id", 128), (Long) b.get("source_revision"), "x", (Long) b.get("created"), (Long) b.get("deadline"));
    }
    private void prune() { seen.entrySet().removeIf(e -> e.getValue().request.deadlineAt <= clock.now()
            && (active == null || !e.getKey().equals(active.request.id))); }
    private Bundle result(boolean success, String reason, AtomicWorkbenchPasteRequest r, boolean restored) {
        Bundle b = new Bundle(); b.putBoolean("success", success); b.putString("reason", reason);
        b.putString("request_id", r == null ? "" : r.id); b.putBoolean("focus_restored", restored);
        b.putBoolean("restore_required", hasCleanupResponsibility());
        b.putBoolean("cleanup_pending", hasCleanupPending()); return b;
    }
    private static boolean success(Bundle b) { return b != null && Boolean.TRUE.equals(b.get("success")); }
    private static String evidenceFailure(Throwable failure, String fallback) {
        for (int i = 0; i < 4 && failure.getCause() != null; i++) failure = failure.getCause();
        String reason = failure.getMessage();
        return "editor_evidence_unavailable".equals(reason) || "editor_evidence_rejected".equals(reason)
                || "stale_editor_evidence".equals(reason) || "deadline".equals(reason) ? reason : fallback;
    }
    private static int integer(Bundle b, String key) { Object v = b.get(key); if (!(v instanceof Integer)) throw new IllegalArgumentException("invalid_metadata"); return (Integer) v; }
    private static String string(Bundle b, String key, int max) { Object v = b.get(key); if (!(v instanceof String) || !AtomicWorkbenchPastePolicy.identifier((String) v, max)) throw new IllegalArgumentException("invalid_metadata"); return (String) v; }
    private static boolean same(AtomicWorkbenchPasteRequest a, AtomicWorkbenchPasteRequest b) {
        return a.id.equals(b.id) && a.session == b.session && a.resetGeneration == b.resetGeneration && a.uiEpoch == b.uiEpoch
                && a.windowId == b.windowId && a.displayId == b.displayId && a.displayName.equals(b.displayName)
                && a.displayUniqueId.equals(b.displayUniqueId) && a.userId == b.userId && a.moduleUid == b.moduleUid
                && a.targetUid == b.targetUid && a.taskId == b.taskId && a.packageName.equals(b.packageName)
                && a.sourcePayloadId.equals(b.sourcePayloadId) && a.sourceRevision == b.sourceRevision
                && a.createdAt == b.createdAt && a.deadlineAt == b.deadlineAt;
    }
}
