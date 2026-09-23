package ls.augment.com;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.function.Supplier;

/** Process-lifetime transaction registry; native ownership is validated by the actual engine. */
final class HideRootServer {
    interface Permit {
        /** Read-only. Check actual readiness generation; never do IPC or a system mutation here. */
        void requireCurrent() throws Throwable;
        /** Opaque, Engine-qualified current ConfirmedHide identity; absence grants no credit. */
        default Object recoverySource() { return null; }
    }
    interface Engine {
        /** Read-only reservation. Null/exception means unavailable, with no system modification. */
        Permit reserve(HideRootProtocol.Request request) throws Throwable;
        /**
         * Must revalidate permit and tuple within the real lifecycle/mutation boundary.
         * A prior requireCurrent() call cannot make check-then-write atomic.
         * Return REJECTED_BEFORE_WRITE only if no force-stop, stopped-state write, hide or
         * other transaction modification happened. All uncertain/partial failures are UNKNOWN.
         */
        CompletionStage<HideRootProtocol.Outcome> execute(HideRootProtocol.Request request, Permit permit) throws Throwable;
    }
    private static final int MAX_CAPACITY = 8192;
    private final Object registryLock = new Object();
    private final Map<String, Record> records = new HashMap<>();
    // Every real confirmed source fits independently of legacy transaction/preview occupancy.
    private final HideRestoreGrantLedger<RecoveryRecord> recoveries =
            new HideRestoreGrantLedger<>(HideRestoreGrantLedger.MAX_SOURCES);
    private final int capacity;
    private final Engine engine;
    private final Supplier<String> nonceSource;
    private int pendingReservations;
    private final long waitMillis;

    HideRootServer(int capacity, Engine engine) { this(capacity, engine, 8000L); }
    HideRootServer(int capacity, Engine engine, long waitMillis) {
        this(capacity, engine, () -> UUID.randomUUID().toString(), waitMillis);
    }
    HideRootServer(int capacity, Engine engine, Supplier<String> nonceSource) {
        this(capacity, engine, nonceSource, 8000L);
    }
    HideRootServer(int capacity, Engine engine, Supplier<String> nonceSource, long waitMillis) {
        if (capacity < 1 || capacity > MAX_CAPACITY || engine == null || nonceSource == null
                || waitMillis < 0 || waitMillis > 10000)
            throw new IllegalArgumentException("Invalid transaction registry");
        this.capacity = capacity; this.engine = engine; this.nonceSource = nonceSource;
        this.waitMillis = waitMillis;
    }

    /** Caller UID must have been captured at the real Binder entry before clearing or dispatching. */
    HideRootProtocol.Reply handle(int capturedCallerUid, String[] arguments) {
        HideRootProtocol.Request request = parse(capturedCallerUid, arguments);
        // A new manual SHOW is the only module entry that may make a target visible.
        // Legacy ownership requests remain parseable solely for historical STATUS.
        if (request.isRestore() && !request.isStatus()) {
            if (request.isPrepare()) return request.isRecovery()
                    ? recoveryUnavailable(request, HideRootProtocol.Outcome.NOT_READY) : unavailable(request);
            return reply(request, HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE);
        }
        if (request.isRecovery()) return recovery(request);
        if (request.isPrepare()) return prepare(request);
        if(!request.isStatus() && !request.isExecute() && !request.isCancel())throw new IllegalArgumentException("INVALID_VERB");
        Record record;
        synchronized (registryLock) {
            record = records.get(request.nonce);
            if (record == null) return reply(request, HideRootProtocol.Outcome.UNKNOWN_NONCE);
            if (!sameTuple(record.request, request)) return reply(request, HideRootProtocol.Outcome.NONCE_CONFLICT);
            if (request.isCancel()) {
                // The same lock decides cancellation versus dispatch. Only an unused
                // reservation can be retired; queued/running native work is never cancelled.
                if (record.recovery == null && record.outcome == HideRootProtocol.Outcome.RESERVED) {
                    record.outcome = HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE;
                    record.completed.countDown();
                }
                return reply(request, record.outcome);
            }
            if (record.recovery == null && (request.isStatus() || record.outcome != HideRootProtocol.Outcome.RESERVED))
                return reply(request, record.outcome);
            // Claim exactly once before any potentially slow or failing readiness/engine callback.
            if (record.recovery == null) record.outcome = HideRootProtocol.Outcome.RUNNING;
        }
        if (record.recovery != null) {
            if (request.isStatus()) return recoverySnapshot(request, record.recovery);
            return dispatchRecovery(request, recoveries.claim(record.recovery.grant));
        }
        try {
            record.permit.requireCurrent();
        } catch (Throwable notReady) {
            finish(record, HideRootProtocol.Outcome.NOT_READY);
            return snapshot(request, record);
        }
        try {
            // Engine must promptly dispatch and return; it must never wait here for AMS work.
            // No registry monitor is held, including while a stage invokes an inline callback.
            CompletionStage<HideRootProtocol.Outcome> execution = engine.execute(request, record.permit);
            if (execution == null) finish(record, HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH);
            else execution.whenComplete((outcome, failure) -> finish(record,
                    failure == null ? terminal(record.request,outcome) : HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH));
        } catch (Throwable unknown) {
            // Includes dispatch or callback-registration failure. A synchronous prior completion
            // wins; finish never overwrites a terminal result or enables a second execution.
            finish(record, HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH);
        }
        try {
            if (!record.completed.await(waitMillis, TimeUnit.MILLISECONDS))
                return snapshot(request, record);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            return snapshot(request, record);
        }
        return snapshot(request, record);
    }

    private HideRootProtocol.Reply recovery(HideRootProtocol.Request request) {
        if (request.isPrepare()) {
            try {
                // Engine callbacks and native admission remain outside the ledger's private lock.
                Permit permit = engine.reserve(request);
                if (permit == null) return recoveryUnavailable(request, HideRootProtocol.Outcome.NOT_READY);
                permit.requireCurrent();
                Object source = permit.recoverySource();
                if (source == null) return recoveryUnavailable(request, HideRootProtocol.Outcome.NOT_READY);
                RecoveryRecord record = new RecoveryRecord(permit);
                HideRestoreGrantLedger.IssueResult issued = recoveries.issue(
                        new HideRestoreGrantLedger.Binding(source, request.userId, request.serial,
                                request.packageName, request.sourceHideNonce), record, request.challenge);
                record.proof = issued.proof;
                record.grant = issued.grant;
                return HideRootProtocol.Reply.recoveryPrepared(request, issued.grant, issued.proof,
                        recoveryOutcome(issued.state));
            } catch (HideRestoreGrantLedger.Rejection rejected) {
                return recoveryUnavailable(request, rejected.reason == HideRestoreGrantLedger.Reason.CAPACITY
                        ? HideRootProtocol.Outcome.CAPACITY : HideRootProtocol.Outcome.NOT_READY);
            } catch (Throwable unavailable) {
                return recoveryUnavailable(request, HideRootProtocol.Outcome.NOT_READY);
            }
        }
        if (request.isStatus()) return reply(request, recoveryOutcome(recoveries.status(
                new HideRestoreGrantLedger.StatusProof(request.coordinate, request.authentication))));
        HideRestoreGrantLedger.ClaimResult<RecoveryRecord> claimed = recoveries.claim(
                new HideRestoreGrantLedger.Grant(request.coordinate, request.authentication));
        return dispatchRecovery(request, claimed);
    }

    private HideRootProtocol.Reply dispatchRecovery(HideRootProtocol.Request request,
            HideRestoreGrantLedger.ClaimResult<RecoveryRecord> claimed) {
        if (claimed.execution == null) return reply(request, recoveryOutcome(claimed.state));
        HideRestoreGrantLedger.Execution<RecoveryRecord> execution = claimed.execution;
        RecoveryRecord record = recoveries.payload(execution);
        if (record == null) {
            return reply(request, recoveryOutcome(recoveries.finish(execution, HideRestoreGrantLedger.State.UNKNOWN)));
        }
        try {
            record.permit.requireCurrent();
        } catch (Throwable unavailable) {
            // This callback is read-only and execute has not been invoked. A fresh intent may retry.
            finishRecovery(execution, record, HideRestoreGrantLedger.State.REJECTED_BEFORE_WRITE);
            return recoverySnapshot(request, record);
        }
        try {
            CompletionStage<HideRootProtocol.Outcome> running = engine.execute(request, record.permit);
            if (running == null) finishRecovery(execution, record, HideRestoreGrantLedger.State.UNKNOWN);
            else running.whenComplete((outcome, failure) -> finishRecovery(execution, record,
                    failure == null && outcome == HideRootProtocol.Outcome.RESTORED
                            ? HideRestoreGrantLedger.State.RESTORED
                            : failure == null && outcome == HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE
                                    ? HideRestoreGrantLedger.State.REJECTED_BEFORE_WRITE
                                    : HideRestoreGrantLedger.State.UNKNOWN));
        } catch (Throwable uncertainDispatch) {
            // Includes a queue/callback-registration exception: it is never a zero-write proof.
            finishRecovery(execution, record, HideRestoreGrantLedger.State.UNKNOWN);
        }
        try { record.completed.await(waitMillis, TimeUnit.MILLISECONDS); }
        catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); }
        return recoverySnapshot(request, record);
    }

    private void finishRecovery(HideRestoreGrantLedger.Execution<RecoveryRecord> execution,
            RecoveryRecord record, HideRestoreGrantLedger.State outcome) {
        recoveries.finish(execution, outcome);
        record.completed.countDown();
    }
    private HideRootProtocol.Reply recoverySnapshot(HideRootProtocol.Request request, RecoveryRecord record) {
        return reply(request, recoveryOutcome(recoveries.status(record.proof)));
    }
    private static HideRootProtocol.Reply recoveryUnavailable(HideRootProtocol.Request request,
            HideRootProtocol.Outcome outcome) {
        return HideRootProtocol.Reply.recoveryPrepared(request, null, null, outcome);
    }
    private static HideRootProtocol.Outcome recoveryOutcome(HideRestoreGrantLedger.State state) {
        switch (state) {
            case RESERVED: return HideRootProtocol.Outcome.RESERVED;
            case RUNNING: return HideRootProtocol.Outcome.RUNNING;
            case REJECTED_BEFORE_WRITE: return HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE;
            case RESTORED: return HideRootProtocol.Outcome.RESTORED;
            case UNKNOWN: return HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH;
            default: return HideRootProtocol.Outcome.UNKNOWN_NONCE;
        }
    }
    private static final class RecoveryRecord {
        final Permit permit;
        final CountDownLatch completed = new CountDownLatch(1);
        volatile HideRestoreGrantLedger.StatusProof proof;
        volatile HideRestoreGrantLedger.Grant grant;
        RecoveryRecord(Permit permit) { this.permit = permit; }
    }

    private static HideRootProtocol.Outcome terminal(HideRootProtocol.Request request,HideRootProtocol.Outcome outcome) {
        return (request.isRestore() ? outcome == HideRootProtocol.Outcome.RESTORED
                : outcome == HideRootProtocol.Outcome.CHANGED || outcome == HideRootProtocol.Outcome.NOOP)
                || outcome == HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE
                ? outcome : HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH;
    }

    private HideRootProtocol.Reply prepare(HideRootProtocol.Request request) {
        synchronized (registryLock) {
            // Slow reservations consume capacity too; never evict known records to make room.
            if (records.size() + pendingReservations >= capacity)
                return new HideRootProtocol.Reply(request, "-", HideRootProtocol.Outcome.CAPACITY);
            pendingReservations++;
        }
        try {
            Permit permit = engine.reserve(request);
            if (permit == null) return unavailable(request);
            permit.requireCurrent();
            if (request.isRestore()) {
                Object source = permit.recoverySource();
                if (source == null) return unavailable(request);
                for (int retry = 0; retry < 8; retry++) {
                    RecoveryRecord recovery = new RecoveryRecord(permit);
                    HideRestoreGrantLedger.IssueResult issued = recoveries.issue(
                            new HideRestoreGrantLedger.Binding(source, request.userId, request.serial,
                                    request.packageName, request.sourceHideNonce), recovery, UUID.randomUUID().toString());
                    if (issued.grant == null) return unavailable(request);
                    recovery.grant = issued.grant; recovery.proof = issued.proof;
                    String nonce = issued.grant.coordinate.nonce;
                    synchronized (registryLock) {
                        // Legacy nonce-only lookup must never replace an earlier record.
                        if (records.containsKey(nonce)) continue;
                        records.put(nonce, new Record(request, permit, recovery));
                        return new HideRootProtocol.Reply(request, nonce, HideRootProtocol.Outcome.RESERVED);
                    }
                }
                return unavailable(request);
            }
            for (int retry = 0; retry < 8; retry++) {
                String nonce = nonceSource.get(); // Random generation is outside registryLock.
                new HideRootProtocol.Request(request.isManualShow() ? HideRootProtocol.Verb.SHOW : HideRootProtocol.Verb.HIDE,
                        request.userId,request.serial,request.packageName,nonce,request.sourceHideNonce); // Validate injected/default UUID source.
                synchronized (registryLock) {
                    if (records.containsKey(nonce)) continue;
                    records.put(nonce, new Record(request, permit));
                    return new HideRootProtocol.Reply(request, nonce, HideRootProtocol.Outcome.RESERVED);
                }
            }
            return unavailable(request);
        } catch (Throwable notReady) {
            return unavailable(request);
        } finally {
            synchronized (registryLock) { pendingReservations--; }
        }
    }

    private void finish(Record record, HideRootProtocol.Outcome outcome) {
        synchronized (registryLock) {
            if (record.outcome != HideRootProtocol.Outcome.RUNNING) return;
            record.outcome = outcome;
            record.completed.countDown();
        }
    }
    private HideRootProtocol.Reply snapshot(HideRootProtocol.Request request, Record record) {
        synchronized (registryLock) { return reply(request, record.outcome); }
    }
    private static HideRootProtocol.Reply unavailable(HideRootProtocol.Request request) {
        return new HideRootProtocol.Reply(request, "-", HideRootProtocol.Outcome.NOT_READY);
    }
    private static HideRootProtocol.Reply reply(HideRootProtocol.Request request, HideRootProtocol.Outcome outcome) {
        return new HideRootProtocol.Reply(request, request.nonce, outcome);
    }
    private static boolean sameTuple(HideRootProtocol.Request a, HideRootProtocol.Request b) {
        return a.isRestore()==b.isRestore() && a.isManualShow()==b.isManualShow()
                && a.userId == b.userId && a.serial == b.serial
                && a.packageName.equals(b.packageName) && Objects.equals(a.sourceHideNonce,b.sourceHideNonce);
    }
    private static final class Record {
        final HideRootProtocol.Request request;
        final Permit permit;
        final RecoveryRecord recovery;
        final CountDownLatch completed = new CountDownLatch(1);
        HideRootProtocol.Outcome outcome = HideRootProtocol.Outcome.RESERVED;
        Record(HideRootProtocol.Request request, Permit permit) { this(request, permit, null); }
        Record(HideRootProtocol.Request request, Permit permit, RecoveryRecord recovery) {
            this.request = request; this.permit = permit; this.recovery = recovery;
        }
    }

    static HideRootProtocol.Request parse(int capturedCallerUid, String[] input) {
        if (capturedCallerUid != 0) throw new IllegalArgumentException("ROOT_REQUIRED");
        if (input == null || input.length < 2 || input.length > 11) throw new IllegalArgumentException("ARG_COUNT");
        String[] args = input.clone(); int bytes = args.length - 1;
        boolean recovery = "PREPARE_RECOVERY".equals(args[1]) || "RECOVER".equals(args[1])
                || "RECOVERY_STATUS".equals(args[1]);
        int maxBytes = recovery ? HideRootProtocol.MAX_RECOVERY_BYTES : HideRootProtocol.MAX_BYTES;
        if (!recovery && args.length > 7) throw new IllegalArgumentException("ARG_COUNT");
        for (String arg : args) {
            if (arg == null || arg.isEmpty() || arg.length() > maxBytes)
                throw new IllegalArgumentException("ARG_LENGTH");
            for (int i = 0; i < arg.length(); i++) if (arg.charAt(i) < 33 || arg.charAt(i) > 126)
                throw new IllegalArgumentException("NON_ASCII_OR_CONTROL");
            bytes += arg.length();
        }
        if (bytes > maxBytes || !HideRootProtocol.COMMAND.equals(args[0]))
            throw new IllegalArgumentException("INVALID_REQUEST");
        if (recovery) return HideRootProtocol.parseRecoveryRequest(args);
        HideRootProtocol.Verb verb = HideRootProtocol.Verb.valueOf(args[1]);
        boolean restore=verb==HideRootProtocol.Verb.PREPARE_RESTORE || verb==HideRootProtocol.Verb.RESTORE
                || verb==HideRootProtocol.Verb.RESTORE_STATUS;
        boolean prepare=verb==HideRootProtocol.Verb.PREPARE || verb==HideRootProtocol.Verb.PREPARE_RESTORE
                || verb==HideRootProtocol.Verb.PREPARE_SHOW;
        if (args.length != (restore ? prepare ? 6 : 7 : prepare ? 5 : 6)) throw new IllegalArgumentException("ARG_COUNT");
        HideRootProtocol.Request request = new HideRootProtocol.Request(verb, Integer.parseInt(args[2]),
                Long.parseLong(args[3]), args[4], prepare ? null : args[5],restore ? args[prepare ? 5 : 6] : null);
        if (!Arrays.equals(args, request.args())) throw new IllegalArgumentException("NON_CANONICAL_REQUEST");
        return request;
    }
}
