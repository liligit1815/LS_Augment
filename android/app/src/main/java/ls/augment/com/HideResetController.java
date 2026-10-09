package ls.augment.com;

import android.content.Context;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;

/** A newly confirmed total reset, never an observer or replay of historical commands. */
final class HideResetController {
    interface Access {
        String rootProblem();
        HideTargetStore.ReadResult targets();
        HideTargetStore.LegacyResult legacy();
        String cachedSelection();
        HideRecoveryCatalog.Page sources(String cursor);
        RootHideManager.UserDirectory users();
        HideRecoveryIdentity.Snapshot identity(RootHideManager.Target target);
        String pendingProblem(RootHideManager.Target target);
        String targetProblem(RootHideManager.Target target);
        RootHideManager.OperationResult show(RootHideManager.Target target);
        String storageStamp();
        RootShell.Result clearStorage(String expectedStamp);
    }

    private final Access access;
    private long generation;

    HideResetController(Context context) {
        Context app = context.getApplicationContext();
        RootHideManager manager = new RootHideManager(app);
        HideTargetStore store = new HideTargetStore();
        HideRootClient oldTransactions = new HideRootClient();
        HideManualClient manualTransactions = new HideManualClient();
        HideTargetController commands = HideTargetController.forBatch(app, manager);
        AppConfig config = new AppConfig(app);
        access = new Access() {
            public String rootProblem() {
                RootHideManager.RootStatus root = manager.rootStatus();
                return root.state == RootHideManager.RootState.GRANTED ? "" : root.message;
            }
            public HideTargetStore.ReadResult targets() { return store.read(); }
            public HideTargetStore.LegacyResult legacy() { return store.readLegacyTargets(); }
            public String cachedSelection() { return config.get(AppConfig.HIDE_TARGETS); }
            public HideRecoveryCatalog.Page sources(String cursor) { return HideRecoveryCatalog.read(cursor); }
            public RootHideManager.UserDirectory users() { return manager.userDirectory(); }
            public HideRecoveryIdentity.Snapshot identity(RootHideManager.Target target) {
                return HideRecoveryIdentity.read(app, target);
            }
            public String pendingProblem(RootHideManager.Target target) {
                HideTargetStore.ReadResult current = store.read();
                if (current.status != HideTargetStore.ReadStatus.OK && current.status != HideTargetStore.ReadStatus.ABSENT)
                    return "当前操作记录未读取成功，未执行新的应用操作";
                HideTargetStore.Record record = current.snapshot == null ? null : HideTargetController.find(current.snapshot, target);
                HideTargetStore.LastOperation operation = record == null ? null : record.lastOperation;
                if (operation != null && !operation.backendNonce.isEmpty()
                        && (operation.status == HideTargetStore.OperationStatus.PENDING
                            || operation.status == HideTargetStore.OperationStatus.UNKNOWN)) {
                    boolean hiding = operation.action == HideTargetStore.Action.HIDE;
                    HideRootProtocol.Reply reply = manualTransactions.status(target, hiding, operation.backendNonce);
                    if (reply != null && reply.outcome == HideRootProtocol.Outcome.RESERVED)
                        reply = manualTransactions.retireReserved(target, hiding, operation.backendNonce);
                    if (reply == null || reply.outcome != HideRootProtocol.Outcome.CHANGED
                            && reply.outcome != HideRootProtocol.Outcome.NOOP
                            && reply.outcome != HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE
                            && reply.outcome != HideRootProtocol.Outcome.NOT_READY
                            && reply.outcome != HideRootProtocol.Outcome.UNKNOWN_NONCE)
                        return "前一次应用操作仍可能运行，恢复依据保留，请稍后重试总重置";
                }
                return oldTransactions.beforeNewOperation(target.userId, target.userSerial, target.packageName);
            }
            public String targetProblem(RootHideManager.Target target) { return manager.currentTargetProblem(target); }
            public RootHideManager.OperationResult show(RootHideManager.Target target) {
                return commands.showInConfirmedBatch(target);
            }
            public String storageStamp() { return HideResetStorage.stamp(); }
            public RootShell.Result clearStorage(String expectedStamp) { return HideResetStorage.clear(expectedStamp); }
        };
    }

    HideResetController(Access access) { this.access = java.util.Objects.requireNonNull(access); }

    static final class Result {
        final boolean success, reviewRequired;
        final int restoredCount, verifiedCount;
        final String message;
        private final HideResetController owner;
        private final long generation;
        private final Map<String, Candidate> candidates;
        private final String storageStamp;
        private boolean used;
        private Result(boolean success, boolean reviewRequired, int restored, int verified, String message,
                HideResetController owner, long generation, Map<String, Candidate> candidates, String stamp) {
            this.success = success; this.reviewRequired = reviewRequired;
            restoredCount = restored; verifiedCount = verified; this.message = message;
            this.owner = owner; this.generation = generation;
            this.candidates = Collections.unmodifiableMap(new LinkedHashMap<>(candidates)); storageStamp = stamp;
        }
    }

    /** Call only after a new total-reset confirmation and after both hiding switches are paused. */
    Result restoreRecorded(Consumer<String> progress) {
        RootHideManager.ACTION_LOCK.lock();
        int restored = 0, verified = 0;
        long currentGeneration = ++generation;
        Map<String, Candidate> candidates = new LinkedHashMap<>();
        try {
            String problem = access.rootProblem();
            if (!problem.isEmpty()) return failure(false, restored, verified, problem);
            Discovery found = discover();
            if (!found.problem.isEmpty()) return failure(true, restored, verified, found.problem);
            candidates = found.candidates;
            // Establish the whole scope before making any change. An unreadable later page
            // must not silently reduce a total reset to the currently selected applications.
            RootHideManager.UserDirectory users = access.users();
            if (users == null || !users.success) return failure(false, restored, verified, "用户空间读取未确认，恢复记录保留");
            List<String> failures = new ArrayList<>();
            int index = 0;
            List<Candidate> ordered = new ArrayList<>(candidates.values());
            // Old unbound selections may describe the same package as a verified current
            // record. Restore the verified coordinate first; the legacy row then verifies
            // the visible state without inheriting authority to modify a replacement user.
            ordered.sort(Comparator.comparing((Candidate candidate) -> !candidate.bound)
                    .thenComparing(candidate -> !candidate.recordedAuthority && !candidate.hasHideEvidence));
            for (Candidate candidate : ordered) {
                report(progress, "正在恢复隐藏应用 " + (++index) + "/" + candidates.size());
                Check check = inspect(candidate, users, true);
                if (!check.problem.isEmpty()) { failures.add(candidate.packageName + "：" + check.problem); continue; }
                if (check.hidden) {
                    if (!candidate.recordedAuthority && !candidate.hasHideEvidence) {
                        failures.add(candidate.packageName + "：只有旧名单，缺少隐藏前状态，需先核对显示此应用");
                        continue;
                    }
                    RootHideManager.OperationResult shown = access.show(check.target);
                    if (shown == null || !shown.success) {
                        failures.add(candidate.packageName + "：" + (shown == null ? "显示结果未确认" : shown.message));
                        // A dispatched unknown command must not overlap further reset actions.
                        break;
                    }
                    Check after = inspect(candidate, users, false);
                    if (!after.problem.isEmpty() || after.hidden || !check.identity.equals(after.identity)) {
                        failures.add(candidate.packageName + "：显示后的状态或安装身份未确认"); break;
                    }
                    restored++;
                }
                verified++;
            }
            if (!failures.isEmpty()) return failure(true, restored, verified,
                    "已恢复 " + restored + " 个应用，仍有记录未完成核对；全部恢复依据继续保留。" + failures.get(0));
            // Fresh SHOW results update the target document. Bind cleanup to its final bytes
            // and to every recovery/transaction file, including previously deselected targets.
            String stamp = access.storageStamp();
            if (!stamp.matches("[0-9a-f]{64}")) return failure(false, restored, verified, "恢复后的记录校验未完成，记录保留");
            return new Result(true, false, restored, verified, "已显示并核对模块记录中的隐藏应用"
                    + (restored == 0 ? "" : "；保留应用原有的启用、安装与停止状态，历史未记录的停止状态无法追溯"),
                    this, currentGeneration, candidates, stamp);
        } catch (RuntimeException error) {
            return failure(false, restored, verified, "隐藏应用恢复未完成，原名单和恢复依据继续保留");
        } finally { RootHideManager.ACTION_LOCK.unlock(); }
    }

    /** Single-use, same-controller cleanup receipt; failed restoration cannot erase evidence. */
    RootHideManager.OperationResult clearVerified(Result result) {
        RootHideManager.ACTION_LOCK.lock();
        try {
            if (result == null || !result.success || result.owner != this || result.generation != generation || result.used)
                return RootHideManager.OperationResult.failure("缺少本次完整恢复校验，未清除应用名单或恢复记录");
            result.used = true;
            String rootProblem = access.rootProblem();
            if (!rootProblem.isEmpty()) return RootHideManager.OperationResult.failure(rootProblem);
            // rootProblem may refresh caches or synchronize mirrors. No source changes are
            // accepted between completion and deletion, even if the current app looks visible.
            if (!result.storageStamp.equals(access.storageStamp()))
                return RootHideManager.OperationResult.failure("恢复记录在核对后已变化，未清除，请重新执行总重置");
            RootHideManager.UserDirectory users = access.users();
            if (users == null || !users.success) return RootHideManager.OperationResult.failure("用户空间再次核对失败，恢复记录保留");
            for (Candidate candidate : result.candidates.values()) {
                Check check = inspect(candidate, users, false);
                if (!check.problem.isEmpty() || check.hidden)
                    return RootHideManager.OperationResult.failure("应用状态在清除前未获确认，恢复记录保留：" + candidate.packageName);
            }
            RootShell.Result cleared = access.clearStorage(result.storageStamp);
            return cleared != null && cleared.isSuccess()
                    ? RootHideManager.OperationResult.success("隐藏应用已恢复，应用名单和恢复记录已清除")
                    : RootHideManager.OperationResult.failure("隐藏记录清除未获确认：" + (cleared == null ? "结果未知" : cleared.publicError()));
        } catch (RuntimeException error) {
            return RootHideManager.OperationResult.failure("清除前核对未完成，应用名单和恢复依据保留");
        } finally { RootHideManager.ACTION_LOCK.unlock(); }
    }

    private Discovery discover() {
        Map<String, Candidate> candidates = new LinkedHashMap<>();
        HideTargetStore.ReadResult read = access.targets();
        if (read == null || read.status != HideTargetStore.ReadStatus.OK && read.status != HideTargetStore.ReadStatus.ABSENT)
            return new Discovery(candidates, "独立应用记录读取失败，原记录保留");
        if (read.snapshot != null) for (HideTargetStore.Record record : read.snapshot.records) {
            Candidate candidate = add(candidates, new HideTargetCodec.Entry(record.userId, record.userSerial,
                    record.packageName, record.bound));
            // A newly confirmed total reset explicitly authorizes displaying the modern
            // independent list. Repeated HIDE/no-op used to overwrite its earlier nonce;
            // nonce absence must not prevent that fresh SHOW instruction. This is authority
            // for the user's current command, never proof of an installation-time baseline.
            candidate.recordedAuthority |= record.bound && record.userSerial >= 0;
            if (record.lastOperation != null && record.lastOperation.action == HideTargetStore.Action.HIDE
                    && !record.lastOperation.backendNonce.isEmpty())
                candidate.hasHideEvidence = true;
        }
        HideTargetStore.LegacyResult legacy = access.legacy();
        if (legacy == null || legacy.status != HideTargetStore.ReadStatus.OK && legacy.status != HideTargetStore.ReadStatus.ABSENT)
            return new Discovery(candidates, "旧应用名单读取失败，原记录保留");
        for (HideTargetCodec.Entry entry : legacy.entries) add(candidates, entry);
        String problem = addSelection(candidates, access.cachedSelection());
        if (!problem.isEmpty()) return new Discovery(candidates, problem);
        String cursor = "";
        Set<String> visited = new LinkedHashSet<>();
        Set<String> sourceKeys = new LinkedHashSet<>();
        do {
            if (!visited.add(cursor) || visited.size() > 16384) return new Discovery(candidates, "恢复历史分页未完成，原记录保留");
            HideRecoveryCatalog.Page page = access.sources(cursor);
            if (page == null || !page.success || !page.message.isEmpty())
                return new Discovery(candidates, "恢复历史不完整或含未知记录，原记录保留");
            for (HideRecoveryCatalog.Source source : page.sources) {
                if (!sourceKeys.add(source.key) || !source.problem.isEmpty())
                    return new Discovery(candidates, "恢复来源读取或校验失败，原记录保留");
                String raw = new String(source.bytes, StandardCharsets.UTF_8);
                if (source.key.startsWith("journal:")) {
                    String line = raw.endsWith("\n") ? raw.substring(0, raw.length() - 1) : raw;
                    HideRecoveryJournal.Entry entry = HideRecoveryJournal.parse(line);
                    if (entry == null || !source.key.equals("journal:" + entry.operationId + "." + entry.stage + ".record"))
                        return new Discovery(candidates, "恢复操作记录格式不完整，原记录保留");
                    Candidate candidate = add(candidates, new HideTargetCodec.Entry(entry.userId, entry.userSerial,
                            entry.packageName, true));
                    if (entry.stage == HideRecoveryJournal.Stage.PREPARED && !"unknown".equals(entry.packageIdentity)) {
                        candidate.hasHideEvidence = true;
                        candidate.packageIdentities.add(entry.packageIdentity);
                    }
                } else if (!source.key.startsWith("script:")) {
                    problem = addSelection(candidates, raw);
                    if (!problem.isEmpty()) return new Discovery(candidates, problem);
                }
            }
            cursor = page.nextCursor;
            if (cursor == null) return new Discovery(candidates, "恢复历史分页无效，原记录保留");
        } while (!cursor.isEmpty());
        return new Discovery(candidates, "");
    }

    private static String addSelection(Map<String, Candidate> candidates, String raw) {
        if (raw == null) return "旧应用名单无法读取，原记录保留";
        for (String line : raw.split("[;\\r\\n]+", -1)) {
            if (line.isEmpty()) continue;
            HideTargetCodec.Selection selection = HideTargetCodec.parse(line);
            if (!selection.valid) return "旧应用名单含无法解析的内容，原记录保留";
            for (HideTargetCodec.Entry entry : selection.entries) add(candidates, entry);
        }
        return "";
    }

    private static Candidate add(Map<String, Candidate> candidates, HideTargetCodec.Entry entry) {
        if (entry == null || !entry.isValid()) throw new IllegalArgumentException("Invalid reset target");
        String key = entry.userId + "|" + entry.userSerial + "|" + entry.packageName;
        Candidate candidate = candidates.computeIfAbsent(key, ignored -> new Candidate(entry));
        candidate.bound |= entry.isBound();
        return candidate;
    }

    private Check inspect(Candidate candidate, RootHideManager.UserDirectory users, boolean beforeCommand) {
        if (RootHideManager.isProtected(candidate.packageName)) return Check.failure("包含受保护应用，不执行恢复");
        RootHideManager.UserRecord currentUser = null;
        for (RootHideManager.UserRecord user : users.users) if (user.userId == candidate.userId) currentUser = user;
        // Removed spaces contain no surviving application state. A reused numeric ID is
        // never used as an authorization to modify the replacement space.
        if (currentUser == null) return Check.absent();
        if (currentUser.userSerial < 0) return Check.failure("当前用户序列号无法确认");
        if (candidate.userSerial >= 0 && candidate.userSerial != currentUser.userSerial)
            return Check.failure("用户编号已被其他空间复用，原记录保留，不能修改替代空间");
        RootHideManager.Target target = new RootHideManager.Target(candidate.userId,
                candidate.userSerial < 0 ? currentUser.userSerial : candidate.userSerial, candidate.packageName);
        HideRecoveryIdentity.Snapshot identity = access.identity(target);
        if (identity == null || !identity.success || identity.userSerial != target.userSerial)
            return Check.failure("应用或用户空间身份读取失败");
        if (beforeCommand && candidate.bound) {
            String pending = access.pendingProblem(target);
            if (!pending.isEmpty()) return Check.failure(pending);
        }
        if ("MISSING".equals(identity.observedState)) return Check.absent();
        if (!"VISIBLE".equals(identity.observedState) && !"HIDDEN".equals(identity.observedState))
            return Check.failure("当前显示状态未获确认");
        if ("unknown".equals(identity.packageIdentity)) return Check.failure("当前安装身份无法确认");
        boolean hidden = "HIDDEN".equals(identity.observedState);
        if (hidden && (!candidate.bound || candidate.userSerial < 0)) return Check.failure("旧名单缺少已确认的用户序列，需核对显示应用");
        if (hidden && !candidate.packageIdentities.isEmpty() && !candidate.packageIdentities.contains(identity.packageIdentity))
            return Check.failure("当前安装身份与隐藏前记录不一致，需核对显示应用");
        if (hidden) {
            String problem = access.targetProblem(target);
            if (!problem.isEmpty()) return Check.failure(problem);
        }
        return new Check(target, hidden, identity.packageIdentity, "");
    }

    private Result failure(boolean review, int restored, int verified, String message) {
        return new Result(false, review, restored, verified, message, null, 0, Collections.emptyMap(), "");
    }
    private static void report(Consumer<String> progress, String message) {
        if (progress != null) try { progress.accept(message); } catch (RuntimeException ignored) { }
    }
    private static final class Candidate {
        final int userId;
        final long userSerial;
        final String packageName;
        boolean bound, hasHideEvidence, recordedAuthority;
        final Set<String> packageIdentities = new LinkedHashSet<>();
        Candidate(HideTargetCodec.Entry entry) { userId = entry.userId; userSerial = entry.userSerial; packageName = entry.packageName; bound = entry.isBound(); }
    }
    private static final class Discovery {
        final Map<String, Candidate> candidates;
        final String problem;
        Discovery(Map<String, Candidate> candidates, String problem) { this.candidates = candidates; this.problem = problem; }
    }
    private static final class Check {
        final RootHideManager.Target target;
        final boolean hidden;
        final String identity, problem;
        Check(RootHideManager.Target target, boolean hidden, String identity, String problem) {
            this.target = target; this.hidden = hidden; this.identity = identity; this.problem = problem;
        }
        static Check failure(String problem) { return new Check(null, false, "", problem); }
        static Check absent() { return new Check(null, false, "", ""); }
    }
}
