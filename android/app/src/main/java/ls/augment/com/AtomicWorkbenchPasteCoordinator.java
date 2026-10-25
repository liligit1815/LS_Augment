package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/** Serial, bounded, once-only editing. All Host calls run off the UI thread. */
final class AtomicWorkbenchPasteCoordinator implements AutoCloseable {
    interface Clock { long now(); }
    interface Callback { void complete(AtomicWorkbenchPasteResult result); }
    interface Host {
        // Root owns authentication/focus. This never launches/promotes/recreates a task.
        AtomicWorkbenchEditorEvidence prepare(AtomicWorkbenchPasteRequest request) throws Exception;
        boolean validate(AtomicWorkbenchPasteRequest request, AtomicWorkbenchEditorEvidence evidence) throws Exception;
        // Restore only if this lease still owns temporary input focus; preserve newer user actions.
        boolean release(AtomicWorkbenchPasteRequest request, AtomicWorkbenchEditorEvidence evidence) throws Exception;
    }
    interface Backend { Editor capture(AtomicWorkbenchPasteRequest request, AtomicWorkbenchEditorEvidence evidence) throws Exception; }
    interface Editor extends AutoCloseable {
        AtomicWorkbenchPastePolicy.Snapshot read() throws Exception;
        boolean current() throws Exception;
        void commit(String text) throws Exception;
        @Override void close();
    }
    private static final class Ticket { boolean cancelled, dispatched; String reason = "cancelled"; }
    private final Clock clock;
    private final Backend backend;
    private final Executor worker, callbacks;
    private final Map<String, AtomicWorkbenchPasteResult> completed = new LinkedHashMap<>();
    private final Map<String, Long> deadlines = new LinkedHashMap<>();
    private Ticket active;
    private String activeId;
    private boolean closed;

    AtomicWorkbenchPasteCoordinator(Clock clock, Backend backend, Executor callbacks) {
        this(clock, backend, Executors.newSingleThreadExecutor(task -> {
            Thread thread = new Thread(task, "DuoTextDrop"); thread.setDaemon(true); return thread;
        }), callbacks);
    }
    AtomicWorkbenchPasteCoordinator(Clock clock, Backend backend, Executor worker, Executor callbacks) {
        this.clock = clock; this.backend = backend; this.worker = worker; this.callbacks = callbacks;
    }

    void submit(AtomicWorkbenchPasteRequest request, Host host, Callback callback) {
        final Ticket ticket;
        synchronized (this) {
            deadlines.entrySet().removeIf(entry -> {
                if (entry.getValue() > clock.now()) return false;
                completed.remove(entry.getKey()); return true;
            });
            AtomicWorkbenchPasteResult old = completed.get(request.id);
            if (old != null) { deliver(callback, old); return; }
            if (active != null || closed || completed.size() >= 128) {
                deliver(callback, result(request, AtomicWorkbenchPasteResult.State.REJECTED,
                        request.id.equals(activeId) ? "request_in_progress" : closed ? "session_ended" : "operation_busy", false, false)); return;
            }
            ticket = new Ticket(); active = ticket; activeId = request.id;
        }
        try { worker.execute(() -> run(request, host, callback, ticket)); }
        catch (RuntimeException rejected) { finish(request, callback, ticket,
                result(request, AtomicWorkbenchPasteResult.State.FAILED, "executor_unavailable", false, false)); }
    }

    synchronized void cancelAll() { if (active != null) active.cancelled = true; }
    @Override public synchronized void close() {
        closed = true; cancelAll();
        if (worker instanceof java.util.concurrent.ExecutorService) ((java.util.concurrent.ExecutorService) worker).shutdown();
    }

    private void run(AtomicWorkbenchPasteRequest r, Host host, Callback callback, Ticket ticket) {
        AtomicWorkbenchEditorEvidence evidence = null;
        Editor editor = null;
        boolean located = false, restored = false;
        AtomicWorkbenchPasteResult outcome;
        try {
            check(r, ticket);
            // Even prepare failure may have changed focus. finally always calls release.
            evidence = host.prepare(r);
            if (evidence == null || !evidence.matches(r, clock.now())) throw new Reject("editor_evidence_unavailable");
            check(r, ticket);
            editor = backend.capture(r, evidence);
            if (editor == null) throw new Reject("editor_missing");
            located = true;
            AtomicWorkbenchPastePolicy.Snapshot before = editor.read();
            check(r, ticket);
            if (before == null || !editor.current() || !host.validate(r, evidence)) throw new Reject("editor_changed");
            AtomicWorkbenchPastePolicy.Snapshot fresh = editor.read();
            if (!before.same(fresh)) throw new Reject("selection_changed");
            check(r, ticket);
            if (!editor.current() || !host.validate(r, evidence)) throw new Reject("editor_changed");
            synchronized (this) {
                check(r, ticket);
                // From here a thrown/void return may already have changed the editor. Never retry.
                ticket.dispatched = true;
            }
            editor.commit(r.text);
            boolean verified = false;
            for (int attempt = 0; attempt < 3 && clock.now() < r.deadlineAt; attempt++) {
                if (cancelled(ticket) || !editor.current() || !host.validate(r, evidence)) break;
                AtomicWorkbenchPastePolicy.Snapshot after = editor.read();
                if (editor.current() && host.validate(r, evidence)
                        && AtomicWorkbenchPastePolicy.verifies(before, r.text, after)) { verified = true; break; }
            }
            outcome = result(r, verified ? AtomicWorkbenchPasteResult.State.VERIFIED : AtomicWorkbenchPasteResult.State.UNVERIFIED,
                    verified ? "verified" : "verification_unavailable", true, true);
        } catch (Reject rejected) {
            outcome = result(r, ticket.dispatched ? AtomicWorkbenchPasteResult.State.UNVERIFIED
                    : "cancelled".equals(rejected.reason) ? AtomicWorkbenchPasteResult.State.CANCELLED : AtomicWorkbenchPasteResult.State.REJECTED,
                    ticket.dispatched ? "dispatch_unknown" : rejected.reason, located, ticket.dispatched);
        } catch (Exception unavailable) {
            outcome = result(r, ticket.dispatched ? AtomicWorkbenchPasteResult.State.UNVERIFIED : AtomicWorkbenchPasteResult.State.FAILED,
                    ticket.dispatched ? "dispatch_unknown" : failureReason(unavailable), located, ticket.dispatched);
        } finally {
            try { if (editor != null) editor.close(); } catch (RuntimeException ignored) { }
            // Includes a prepare that partially changed focus before throwing.
            try { restored = host.release(r, evidence); } catch (Exception ignored) { }
        }
        finish(r, callback, ticket, outcome.restoration(restored));
    }

    private synchronized boolean cancelled(Ticket ticket) { return ticket.cancelled || closed; }
    private void check(AtomicWorkbenchPasteRequest request, Ticket ticket) throws Reject {
        if (cancelled(ticket)) throw new Reject("cancelled");
        String reason = AtomicWorkbenchPastePolicy.invalid(request, clock.now());
        if (reason != null) throw new Reject(reason);
    }
    private void finish(AtomicWorkbenchPasteRequest r, Callback callback, Ticket ticket, AtomicWorkbenchPasteResult outcome) {
        synchronized (this) {
            completed.put(r.id, outcome);
            deadlines.put(r.id, r.deadlineAt);
            if (active == ticket) { active = null; activeId = null; }
        }
        deliver(callback, outcome);
    }
    private void deliver(Callback callback, AtomicWorkbenchPasteResult result) { callbacks.execute(() -> callback.complete(result)); }
    private static String failureReason(Throwable failure) {
        for (int i = 0; i < 4 && failure.getCause() != null; i++) failure = failure.getCause();
        String reason = failure.getMessage();
        if (reason != null && java.util.Set.of("service_not_enabled", "editor_not_bound", "editor_missing",
                "editor_connection_missing", "password_editor", "editor_changed", "selection_changed",
                "deadline", "verification_unavailable", "service_unavailable", "editor_evidence_unavailable").contains(reason)) return reason;
        return "editor_unavailable";
    }
    private static AtomicWorkbenchPasteResult result(AtomicWorkbenchPasteRequest r, AtomicWorkbenchPasteResult.State state,
            String reason, boolean located, boolean dispatched) {
        return new AtomicWorkbenchPasteResult(r.id, state, reason, located, dispatched, true);
    }
    private static final class Reject extends Exception { final String reason; Reject(String reason) { this.reason = reason; } }
}
