package ls.augment.com;

import android.content.Context;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;

/** Current user commands only. No lifecycle, observer or disk replay enters execute(). */
final class HideTargetController {
    interface Access {
        String rootProblem();
        String targetProblem(RootHideManager.Target target);
        HideRecoveryIdentity.Snapshot identity(RootHideManager.Target target);
        RootHideManager.State state(RootHideManager.Target target);
        default Observation observe(RootHideManager.Target target) { return new Observation(identity(target), state(target)); }
        default String syncObserved() { return ""; }
        long elapsed();
        long now();
    }
    static final class Observation {
        final HideRecoveryIdentity.Snapshot identity;
        final RootHideManager.State state;
        Observation(HideRecoveryIdentity.Snapshot identity, RootHideManager.State state) { this.identity=identity; this.state=state; }
    }
    private final Access access;
    private final HideTargetStore store;
    private final HideManualClient client;
    private final boolean publishEachResult;

    HideTargetController(Context context, RootHideManager manager) {
        this(context, manager, true, false);
    }
    static HideTargetController forBatch(Context context, RootHideManager manager) {
        return new HideTargetController(context, manager, false, false);
    }
    static HideTargetController forCheckedBatch(Context context, RootHideManager manager, RootHideManager.RootStatus root) {
        if (root == null || root.state != RootHideManager.RootState.GRANTED) throw new IllegalArgumentException("Batch Root check missing");
        return new HideTargetController(context, manager, false, true);
    }
    private HideTargetController(Context context, RootHideManager manager, boolean publishEachResult, boolean rootChecked) {
        this(new Access() {
            public String rootProblem() {
                // Only this already-checked batch skips repeated probes. Each privileged
                // transport and durable write still enforces current root permission.
                if (rootChecked) return manager.rootAuthorizationProblem();
                RootHideManager.RootStatus root = manager.rootStatus();
                return root.state == RootHideManager.RootState.GRANTED ? "" : root.message;
            }
            public String targetProblem(RootHideManager.Target target) { return manager.currentTargetProblem(target); }
            public HideRecoveryIdentity.Snapshot identity(RootHideManager.Target target) {
                return HideRecoveryIdentity.read(context.getApplicationContext(), target);
            }
            public RootHideManager.State state(RootHideManager.Target target) { return manager.queryState(target); }
            public Observation observe(RootHideManager.Target target) {
                HideRecoveryIdentity.Snapshot snapshot = identity(target);
                return new Observation(snapshot, RootHideManager.State.valueOf(snapshot.observedState));
            }
            public String syncObserved() {
                RootHideManager.OperationResult synced = manager.syncMirrors();
                return synced.success ? "" : synced.message;
            }
            public long elapsed() { return SystemClock.elapsedRealtime(); }
            public long now() { return System.currentTimeMillis(); }
        }, new HideTargetStore(), new HideManualClient(), publishEachResult);
    }
    HideTargetController(Access access, HideTargetStore store, HideManualClient client) {
        this(access, store, client, true);
    }
    HideTargetController(Access access, HideTargetStore store, HideManualClient client, boolean publishEachResult) {
        this.access = access; this.store = store; this.client = client; this.publishEachResult = publishEachResult;
    }

    static final class Preview {
        final boolean success;
        final String message;
        final RootHideManager.Target target;
        final RootHideManager.State state;
        private final HideTargetController controller;
        private final String identity;
        private final long checkedAt;
        private final AtomicBoolean used = new AtomicBoolean();
        private Preview(HideTargetController controller, RootHideManager.Target target,
                RootHideManager.State state, String identity, long checkedAt, String message) {
            this.controller = controller; this.target = target; this.state = state; this.identity = identity;
            this.checkedAt = checkedAt; this.message = message; success = controller != null;
        }
        static Preview failure(String message) { return new Preview(null, null, null, "", 0, message); }
    }

    /** Preview does not prepare a backend reservation or persist an action. */
    Preview preview(RootHideManager.Target target) {
        RootHideManager.ACTION_LOCK.lock();
        try {
            String problem = access.rootProblem();
            if (problem.isEmpty()) problem = access.targetProblem(target);
            if (!problem.isEmpty()) return Preview.failure(problem);
            Observation initial = access.observe(target);
            HideRecoveryIdentity.Snapshot identity = initial.identity;
            if (!validIdentity(target, identity)) return Preview.failure("当前应用或空间身份无法确认");
            RootHideManager.State state = initial.state;
            if (state != RootHideManager.State.HIDDEN && state != RootHideManager.State.VISIBLE)
                return Preview.failure("当前应用未安装或显示状态无法确认");
            HideTargetStore.ReadResult saved = store.read();
            if (saved.status != HideTargetStore.ReadStatus.OK)
                return Preview.failure("独立目标记录尚未读取成功；请刷新后再操作。" + saved.error);
            return new Preview(this, target, state, identity.packageIdentity, access.elapsed(),
                    "应用：" + target.packageName + "\n空间 " + target.userId + "（序列号 " + target.userSerial
                    + "）\n当前" + (state == RootHideManager.State.HIDDEN ? "已隐藏" : "已显示")
                    + "。确认后仅显示这个空间中的这个应用。");
        } catch (RuntimeException invalid) { return Preview.failure("核对未完成，尚未发送显示命令"); }
        finally { RootHideManager.ACTION_LOCK.unlock(); }
    }

    void cancel(Preview preview) {
        if (preview != null && preview.controller == this) preview.used.compareAndSet(false, true);
    }

    RootHideManager.OperationResult show(Preview preview) {
        if (preview == null || !preview.success || preview.controller != this
                || !preview.used.compareAndSet(false, true)) return fail("此次确认已取消或已使用，请重新核对");
        return execute(preview.target, false, preview);
    }

    /** HIDE callers retain their existing explicit manual/automation policy checks. */
    RootHideManager.OperationResult hide(RootHideManager.Target target) { return execute(target, true, null); }

    /** The batch already received explicit confirmation. Execute retains all fresh mutation checks. */
    RootHideManager.OperationResult showInConfirmedBatch(RootHideManager.Target target) {
        if (publishEachResult) return fail("此入口仅用于已确认的批量操作");
        return execute(target, false, null);
    }

    private RootHideManager.OperationResult execute(RootHideManager.Target target, boolean hidden, Preview preview) {
        RootHideManager.ACTION_LOCK.lock();
        HideManualClient.Reservation reservation = null;
        try {
            String problem = access.rootProblem();
            if (problem.isEmpty()) problem = access.targetProblem(target);
            if (!problem.isEmpty()) return fail(problem);
            Observation initial = access.observe(target);
            HideRecoveryIdentity.Snapshot identity = initial.identity;
            if (!validIdentity(target, identity)) return fail("当前安装或用户身份无法确认");
            if (preview != null && (access.elapsed() - preview.checkedAt < 0
                    || access.elapsed() - preview.checkedAt > 120_000
                    || !preview.identity.equals(identity.packageIdentity))) return fail("核对已过期或应用身份变化，请重新确认");
            RootHideManager.State observed = initial.state;
            if (observed != RootHideManager.State.VISIBLE && observed != RootHideManager.State.HIDDEN)
                return fail("应用未安装或状态无法确认，未发送命令");
            HideTargetStore.ReadResult read = store.read();
            if (read.status != HideTargetStore.ReadStatus.OK) return fail("独立目标记录读取失败，原文件保留。" + read.error);
            HideTargetStore.Record old = find(read.snapshot, target);
            // An uncertain old command is never resent. If it is still running, avoid racing it.
            if (old != null && old.lastOperation != null && !old.lastOperation.backendNonce.isEmpty()
                    && (old.lastOperation.status == HideTargetStore.OperationStatus.PENDING
                        || old.lastOperation.status == HideTargetStore.OperationStatus.UNKNOWN)) {
                HideRootProtocol.Reply previous = client.status(target,
                        old.lastOperation.action == HideTargetStore.Action.HIDE, old.lastOperation.backendNonce);
                if (previous != null && previous.outcome == HideRootProtocol.Outcome.RESERVED)
                    previous = client.retireReserved(target,
                            old.lastOperation.action == HideTargetStore.Action.HIDE, old.lastOperation.backendNonce);
                if (previous == null || previous.outcome != HideRootProtocol.Outcome.CHANGED
                        && previous.outcome != HideRootProtocol.Outcome.NOOP
                        && previous.outcome != HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE
                        && previous.outcome != HideRootProtocol.Outcome.NOT_READY
                        && previous.outcome != HideRootProtocol.Outcome.UNKNOWN_NONCE)
                    return fail("上次命令结果尚未确认；本次只查询，没有重发，请稍后重新核对");
            }
            String id = UUID.randomUUID().toString();
            long revision = read.snapshot.revision + 1;
            HideTargetStore.LastOperation operation = operation(id, revision, hidden,
                    HideTargetStore.OperationStatus.PENDING, "", "");
            HideTargetStore.Record pending = record(target, old != null && old.managed, hidden, observed,
                    access.now(), operation);
            boolean desired = hidden ? observed == RootHideManager.State.HIDDEN : observed == RootHideManager.State.VISIBLE;
            if (desired) {
                // A verified no-op has no reserved or dispatched native command.
                // Save its intent/result once; never create an intermediate pending command.
                Observation verified = access.observe(target);
                boolean confirmed = validIdentity(target, verified.identity)
                        && identity.packageIdentity.equals(verified.identity.packageIdentity)
                        && verified.state == observed;
                return finish(read, pending, confirmed, false, verified.state,
                        confirmed ? "" : "应用身份或状态发生变化，请重新确认");
            }
            HideTargetStore.WriteResult written = replace(read, pending);
            if (!written.applied) return fail("命令记录保存未确认，未发送应用操作。" + written.error);
            HideTargetStore.ReadResult current = written.acknowledgedRead();
            HideRootProtocol.Reply reply = null;
            if (!desired) {
                reservation = client.prepare(target, hidden);
                if (reservation == null) return finish(current, pending, false, false, observed, "系统尚未接受准备，本次未执行");
                operation = operation(id, current.snapshot.revision + 1, hidden, HideTargetStore.OperationStatus.PENDING, "", reservation.nonce);
                pending = record(target, pending.managed, hidden, observed, access.now(), operation);
                written = replace(current, pending);
                if (!written.applied) return fail("执行编号保存未确认，未发送应用操作。" + written.error);
                current = written.acknowledgedRead();
                HideRecoveryIdentity.Snapshot checked = access.identity(target);
                if (!validIdentity(target, checked) || !identity.packageIdentity.equals(checked.packageIdentity)
                        || !access.targetProblem(target).isEmpty())
                    return finish(current, pending, false, false, observed, "执行前应用或空间身份变化，未发送命令");
                if (!client.arm(reservation)) return finish(current, pending, false, false, observed, "此次命令已取消");
                reply = client.execute(reservation);
            }
            Observation verified = access.observe(target);
            HideRecoveryIdentity.Snapshot after = verified.identity;
            observed = verified.state;
            boolean identityMatches = validIdentity(target, after) && identity.packageIdentity.equals(after.packageIdentity);
            boolean confirmed = identityMatches && (hidden ? observed == RootHideManager.State.HIDDEN : observed == RootHideManager.State.VISIBLE)
                    && (desired || reply != null && reply.mutationSuccess());
            boolean unknown = !desired && (reply == null || reply.outcome == HideRootProtocol.Outcome.RUNNING
                    || reply.outcome == HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH);
            return finish(current, pending, confirmed, unknown, observed,
                    confirmed ? "" : "执行结果或当前状态未确认；保留记录，不自动重发");
        } catch (RuntimeException unknown) { return fail("操作结果未确认，记录保留；不会自动重试或显示应用"); }
        finally { client.cancel(reservation); RootHideManager.ACTION_LOCK.unlock(); }
    }

    private RootHideManager.OperationResult finish(HideTargetStore.ReadResult current, HideTargetStore.Record pending,
            boolean success, boolean unknown, RootHideManager.State observed, String error) {
        HideTargetStore.LastOperation op = pending.lastOperation;
        HideTargetStore.LastOperation terminal = operation(op.id, current.snapshot.revision + 1,
                op.action == HideTargetStore.Action.HIDE, success ? HideTargetStore.OperationStatus.SUCCEEDED
                : unknown ? HideTargetStore.OperationStatus.UNKNOWN : HideTargetStore.OperationStatus.FAILED, error, op.backendNonce);
        HideTargetStore.WriteResult saved = replace(current, record(new RootHideManager.Target(pending.userId,
                pending.userSerial, pending.packageName), pending.managed, pending.desiredHidden, observed, access.now(), terminal));
        if (!saved.applied) return fail("结果记录保存未确认，请只读核对当前状态；不会自动重发。" + saved.error);
        if (!success) return fail(error);
        String message = op.action == HideTargetStore.Action.SHOW
                ? "已确认这个空间中的应用为显示状态" : "已确认这个空间中的应用为隐藏状态";
        // RootHideManager publishes once after the batch, including partial failures.
        if (!publishEachResult) return RootHideManager.OperationResult.observedSuccess(message, false);
        // Publish the observed result so Settings/tile consumers do not keep an old hidden mirror.
        // This refresh never issues an application action, and cannot undo a confirmed command.
        String sync;
        try { sync = access.syncObserved(); }
        catch (RuntimeException pendingSync) { sync = "界面状态同步尚未完成"; }
        return RootHideManager.OperationResult.observedSuccess(message
                + (sync.isEmpty() ? "" : "；界面刷新待完成：" + sync), sync.isEmpty());
    }

    private HideTargetStore.WriteResult replace(HideTargetStore.ReadResult receipt, HideTargetStore.Record record) {
        HideTargetStore.Snapshot snapshot = receipt.snapshot;
        List<HideTargetStore.Record> records = new ArrayList<>(snapshot.records);
        records.removeIf(r -> r.key().equals(record.key())); records.add(record);
        return store.compareAndSet(receipt, new HideTargetStore.Snapshot(snapshot.revision + 1, records));
    }
    static HideTargetStore.Record find(HideTargetStore.Snapshot snapshot, RootHideManager.Target target) {
        for (HideTargetStore.Record record : snapshot.records)
            if (record.userId == target.userId && record.userSerial == target.userSerial && record.packageName.equals(target.packageName)) return record;
        return null;
    }
    private static HideTargetStore.LastOperation operation(String id, long revision, boolean hidden,
            HideTargetStore.OperationStatus status, String error, String nonce) {
        return new HideTargetStore.LastOperation(id, revision, hidden ? HideTargetStore.Action.HIDE
                : HideTargetStore.Action.SHOW, status, error, nonce);
    }
    private static HideTargetStore.Record record(RootHideManager.Target target, boolean managed, Boolean desired,
            RootHideManager.State observed, long now, HideTargetStore.LastOperation operation) {
        return new HideTargetStore.Record(target.userId, target.userSerial, target.packageName, target.isBound(), managed,
                desired, observed == RootHideManager.State.ERROR ? HideTargetStore.ObservedState.UNKNOWN
                : HideTargetStore.ObservedState.valueOf(observed.name()), now, operation);
    }
    private static boolean validIdentity(RootHideManager.Target target, HideRecoveryIdentity.Snapshot identity) {
        return target != null && target.isBound() && identity != null && identity.success
                && identity.userSerial == target.userSerial && !"unknown".equals(identity.packageIdentity);
    }
    private static RootHideManager.OperationResult fail(String message) { return RootHideManager.OperationResult.failure(message); }
}
