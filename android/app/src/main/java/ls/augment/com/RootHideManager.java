package ls.augment.com;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** PackageManager truth, target persistence, aggregate state and recovery. */
final class RootHideManager {
    static final int APP_METADATA_FLAGS = PackageManager.MATCH_DISABLED_COMPONENTS
            | PackageManager.MATCH_UNINSTALLED_PACKAGES;
    private static final String ROOT_DIR = "/data/adb/ls_augment/v2";
    private static final String TARGETS_FILE = ROOT_DIR + "/targets.conf";
    private static final String BACKUP_FILE = ROOT_DIR + "/targets.backup.conf";
    private static final String EMERGENCY_FILE = ROOT_DIR + "/emergency_restore.sh";
    static final ReentrantLock ACTION_LOCK = new ReentrantLock();
    private static final Pattern PACKAGE = Pattern.compile(
            "[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+");
    private static final Pattern USER = Pattern.compile("UserInfo\\{(\\d+):([^:}]*)");
    private static final Set<String> PROTECTED;

    static {
        LinkedHashSet<String> values = new LinkedHashSet<>();
        Collections.addAll(values,
                "android", "system", "com.android.systemui", "com.android.settings",
                "ls.augment.com", "io.github.lsf.augment",
                "me.weishu.kernelsu", "me.weishu.kernelsu.debug",
                "com.rifsxd.ksunext", "org.lsposed.manager",
                "com.topjohnwu.magisk", "me.bmax.apatch");
        PROTECTED = Collections.unmodifiableSet(values);
    }

    enum RootState { GRANTED, DENIED, UNAVAILABLE, TIMEOUT }
    enum State { VISIBLE, HIDDEN, MISSING, ERROR }
    enum Aggregate { ALL_VISIBLE, ALL_HIDDEN, MIXED, EMPTY, ERROR }

    private final Context context;
    private final AppConfig config;
    private final HideTargetStore targetStore = new HideTargetStore();
    private volatile HideTargetStore.Snapshot targetSnapshot;
    private volatile String targetProblem = "独立应用名单尚未读取";

    RootHideManager(Context context) {
        this.context = context.getApplicationContext();
        this.config = new AppConfig(this.context);
    }

    RootStatus rootStatus() {
        if (context.getSharedPreferences(AppConfig.DIAGNOSTICS, Context.MODE_PRIVATE)
                .getBoolean("root_prompt_suppressed", false)) {
            return new RootStatus(RootState.DENIED, "授权曾被拒绝；请主动重新授权", "未知");
        }
        return probeRoot();
    }

    String rootAuthorizationProblem() {
        return context.getSharedPreferences(AppConfig.DIAGNOSTICS, Context.MODE_PRIVATE)
                .getBoolean("root_prompt_suppressed", false) ? "Root 授权已被拒绝" : "";
    }

    RootStatus requestRootStatus() {
        context.getSharedPreferences(AppConfig.DIAGNOSTICS, Context.MODE_PRIVATE)
                .edit().putBoolean("root_prompt_suppressed", false).apply();
        return probeRoot();
    }

    private RootStatus probeRoot() {
        RootShell.Result result = RootShell.run(
                "printf 'uid='; id -u; if [ -d /data/adb/ksu ]; then printf '|provider=KernelSU'; "
                        + "elif [ -d /data/adb/magisk ]; then printf '|provider=Magisk'; "
                        + "elif [ -d /data/adb/ap ]; then printf '|provider=APatch'; "
                        + "else printf '|provider=Root'; fi", null, 8, 4096);
        if (result.timedOut) return remember(new RootStatus(RootState.TIMEOUT, "Root 授权超时", "未知"));
        if (result.output.contains("uid=0")) {
            String provider = valueAfter(result.output, "|provider=");
            RootStatus status = remember(new RootStatus(RootState.GRANTED, "已授权",
                    provider.isEmpty() ? "Root" : provider));
            config.initializeRuntimeMirrorsIfNeeded();
            refreshTargets();
            return status;
        }
        if (result.exitCode == 127) return remember(new RootStatus(RootState.UNAVAILABLE, "Root 不可用", "无"));
        return remember(new RootStatus(RootState.DENIED,
                result.output.isEmpty() ? "Root 授权被拒绝" : result.publicError(), "未知"));
    }

    private RootStatus remember(RootStatus status) {
        context.getSharedPreferences(AppConfig.DIAGNOSTICS, Context.MODE_PRIVATE).edit()
                .putString("root_last_state", status.state.name())
                .putString("root_last_message", status.message)
                .putString("root_provider", status.provider)
                .putBoolean("root_prompt_suppressed", status.state == RootState.DENIED)
                .apply();
        return status;
    }

    ConflictState conflictState() {
        RootShell.Result result = RootShell.run(
                "old_pkg=0; old_mod=0; pm path io.github.lsf.augment >/dev/null 2>&1 && old_pkg=1; "
                        + "[ -d /data/adb/modules/ls_augment ] && old_mod=1; "
                        + "printf 'old_pkg=%s;old_module=%s' \"$old_pkg\" \"$old_mod\"", null, 8, 4096);
        if (!result.isSuccess()) return new ConflictState(false, false, "无法完成旧架构检测");
        boolean oldPackage = result.output.contains("old_pkg=1");
        boolean oldModule = result.output.contains("old_module=1");
        String message = oldPackage || oldModule
                ? "检测到旧 APK/KSU。请先保留旧配置和恢复记录；当前不能证明遗留隐藏状态归属，勿直接按旧名单批量恢复。"
                : "未检测到旧架构冲突";
        return new ConflictState(oldPackage, oldModule, message);
    }

    Set<Target> targets() {
        LinkedHashSet<Target> targets = new LinkedHashSet<>();
        HideTargetStore.Snapshot snapshot = targetSnapshot;
        if (snapshot != null) for (HideTargetStore.Record record : snapshot.records)
            if (record.managed) targets.add(new Target(record.userId, record.userSerial, record.packageName, record.bound));
        return targets;
    }

    HideTargetCodec.Selection selectionStatus() {
        return HideTargetCodec.parse(targetSnapshot != null && targetProblem.isEmpty()
                ? serialize(targets()) : "!independent-targets-unavailable");
    }

    long targetRevision() { return targetSnapshot == null ? -1 : targetSnapshot.revision; }

    /** Worker-thread only. Existing independent data always wins over the private cache. */
    OperationResult refreshTargets() {
        ACTION_LOCK.lock();
        try {
            HideTargetStore.ReadResult read = targetStore.read();
            if (read.status == HideTargetStore.ReadStatus.ABSENT) {
                HideTargetStore.LegacyResult legacy = targetStore.readLegacyTargets();
                HideTargetCodec.Selection cache = HideTargetCodec.parse(config.get(AppConfig.HIDE_TARGETS));
                if (!cache.valid || legacy.status != HideTargetStore.ReadStatus.OK
                        && legacy.status != HideTargetStore.ReadStatus.ABSENT) {
                    targetProblem = "旧名单无法完整校验，原文件与缓存保留，未建立空名单";
                    return OperationResult.failure(targetProblem);
                }
                LinkedHashMap<String, HideTargetStore.Record> records = new LinkedHashMap<>();
                List<HideTargetCodec.Entry> entries = new ArrayList<>(legacy.entries);
                entries.addAll(cache.entries);
                for (HideTargetCodec.Entry entry : entries) {
                    HideTargetStore.Record record = new HideTargetStore.Record(entry.userId, entry.userSerial,
                            entry.packageName, entry.confirmed, true, null, HideTargetStore.ObservedState.UNKNOWN, 0, null);
                    records.put(record.key(), record);
                }
                // Validate the complete merged selection before establishing authority.
                // A cache bound failure must not leave an unusable committed document.
                LinkedHashSet<Target> merged = new LinkedHashSet<>();
                for (HideTargetStore.Record record : records.values())
                    merged.add(new Target(record.userId, record.userSerial, record.packageName, record.bound));
                serialize(merged);
                HideTargetStore.Snapshot migrated = new HideTargetStore.Snapshot(1, new ArrayList<>(records.values()));
                RootShell.Result archived = HideRecoveryArchive.preserve(cache.raw);
                if (!archived.isSuccess()) {
                    targetProblem = "旧私有名单归档未确认，原值保留";
                    return OperationResult.failure(targetProblem);
                }
                // Retire the old script; this installer never unhides an application.
                RootShell.Result retired = HideRecoveryEmergency.install();
                if (!retired.isSuccess()) {
                    targetProblem = "旧应急入口保护未确认，未迁移名单";
                    return OperationResult.failure(targetProblem);
                }
                HideTargetStore.WriteResult saved = targetStore.compareAndSet(0, migrated);
                if (!saved.applied) {
                    targetProblem = "独立名单迁移保存未确认，保留全部旧值。" + saved.error;
                    return OperationResult.failure(targetProblem);
                }
                read = targetStore.read();
                if (read.status != HideTargetStore.ReadStatus.OK || !migrated.encode().equals(read.snapshot.encode())) {
                    targetProblem = "迁移读回尚未确认，保留旧名单，停止操作";
                    return OperationResult.failure(targetProblem);
                }
                // A valid independent document is the durable migration marker. No old file is deleted.
            }
            if (read.status != HideTargetStore.ReadStatus.OK) {
                targetProblem = read.error.isEmpty() ? "独立名单未获读取确认" : read.error;
                return OperationResult.failure("独立名单读取失败，原文件保留。" + targetProblem);
            }
            targetSnapshot = read.snapshot;
            targetProblem = "";
            String serialized = serialize(targets());
            if (!serialized.equals(config.get(AppConfig.HIDE_TARGETS))) {
                AppConfig.SaveResult cache = config.save(Collections.singletonMap(AppConfig.HIDE_TARGETS, serialized));
                if (!cache.success) return OperationResult.success("独立名单已读取，私有缓存稍后同步");
            }
            return OperationResult.success("独立名单已读取");
        } catch (RuntimeException invalid) {
            targetProblem = "独立名单校验未完成，原值保留";
            return OperationResult.failure(targetProblem);
        } finally { ACTION_LOCK.unlock(); }
    }

    OperationResult saveTargets(Set<Target> desired) {
        return saveTargets(desired, Collections.emptyMap());
    }

    /** Read-only validation before presenting the import confirmation. */
    OperationResult validateImportTargets(Set<Target> desired) {
        ACTION_LOCK.lock();
        try {
            for (Target target : desired) if (target == null || !target.isValid()
                    || target.isBound() || isProtected(target.packageName))
                return OperationResult.failure("包含无效或受保护目标：" + target);
            return OperationResult.success("待确认应用选择已校验，导入后需重新选择用户空间");
        } finally { ACTION_LOCK.unlock(); }
    }

    OperationResult saveTargets(Set<Target> desired, Map<String, String> settings) {
        return saveTargets(desired, settings, -1);
    }

    /** The displayed revision prevents a stale page from replacing a newer selection. */
    OperationResult saveTargets(Set<Target> desired, Map<String, String> settings, long expectedRevision) {
        ACTION_LOCK.lock();
        try {
            for (Map.Entry<String, String> entry : settings.entrySet())
                if (ConfigSchema.normalize(entry.getKey(), entry.getValue()) == null)
                    return OperationResult.failure("配置值无效：" + entry.getKey());
            RootStatus root = rootStatus();
            if (root.state != RootState.GRANTED) return OperationResult.failure(root.message);
            if (!targetProblem.isEmpty() || targetSnapshot == null) return OperationResult.failure(targetProblem);
            if (expectedRevision >= 0 && expectedRevision != targetSnapshot.revision)
                return OperationResult.failure("应用名单已更新，请重新读取后再保存；本次草稿未覆盖新名单");
            if (conflictState().hasConflict()) return OperationResult.failure("旧 APK/KSU 仍存在，不能建立新目标配置");
            HideTargetStore.Snapshot before = targetSnapshot;
            Set<Target> previous = targets();
            LinkedHashSet<Target> newlyBound = new LinkedHashSet<>();
            for (Target target : desired) {
                if (target == null || !target.isValid() || isProtected(target.packageName))
                    return OperationResult.failure("包含无效或受保护目标：" + target);
                if (target.isBound() && !previous.contains(target)) {
                    HideUserIdentity.Snapshot identity = matchUser(target);
                    if (!identity.success) return OperationResult.failure(identity.message);
                    newlyBound.add(target);
                }
            }
            if (!userInstalledTargets(newlyBound).containsAll(newlyBound))
                return OperationResult.failure("无法确认新选择是当前用户应用，原选择保留");
            // Validate cache bounds before committing the authoritative document.
            String serialized = serialize(desired);
            LinkedHashMap<String, HideTargetStore.Record> records = new LinkedHashMap<>();
            for (HideTargetStore.Record old : before.records) {
                Target target = new Target(old.userId, old.userSerial, old.packageName, old.bound);
                HideTargetStore.Record next = new HideTargetStore.Record(old.userId, old.userSerial, old.packageName,
                        old.bound, desired.contains(target), old.desiredHidden, old.observedState, old.observedAt, old.lastOperation);
                records.put(next.key(), next);
            }
            for (Target target : desired) {
                String key = target.userId + "|" + target.userSerial + "|" + target.packageName;
                HideTargetStore.Record old = records.get(key);
                records.put(key, new HideTargetStore.Record(target.userId, target.userSerial, target.packageName,
                        target.isBound(), true, old == null ? null : old.desiredHidden,
                        old == null ? HideTargetStore.ObservedState.UNKNOWN : old.observedState,
                        old == null ? 0 : old.observedAt, old == null ? null : old.lastOperation));
            }
            for (Target target : newlyBound) if (!matchUser(target).success)
                return OperationResult.failure("保存前用户空间变化，原选择保留");
            HideTargetStore.WriteResult committed = targetStore.compareAndSet(before.revision,
                    new HideTargetStore.Snapshot(before.revision + 1, new ArrayList<>(records.values())));
            if (!committed.applied) return OperationResult.failure("独立名单提交未确认：" + committed.error);
            targetSnapshot = committed.snapshot;
            targetProblem = "";
            Map<String, String> update = new LinkedHashMap<>(settings);
            update.put(AppConfig.HIDE_TARGETS, serialized);
            AppConfig.SaveResult cache = config.save(update);
            if (!cache.success) return new OperationResult(true,
                    "独立名单已保存；其他设置或缓存未保存，请重新读取后核对。" + cache.message, false);
            OperationResult mirrored = syncMirrors();
            AuditLog.write(context, "TARGETS", "saved count=" + desired.size());
            return new OperationResult(true, "已保存 " + desired.size()
                    + " 个目标；取消选择不会显示应用，原记录继续保留"
                    + (mirrored.success ? "" : "；状态同步未完成：" + mirrored.message), cache.runtimeSynced && mirrored.success);
        } catch (RuntimeException invalid) {
            return OperationResult.failure("名单提交未确认，原文件保留，请重新读取核对");
        } finally { ACTION_LOCK.unlock(); }
    }

    State queryState(Target target) {
        return queryStates(Collections.singleton(target)).getOrDefault(target, State.ERROR);
    }

    /** No TTL cache: each caller gets a fresh, bounded PackageManager snapshot. */
    Map<Target, State> queryStates(Set<Target> requested) {
        Map<Target, State> states = new LinkedHashMap<>();
        Map<String, Set<Target>> packages = new LinkedHashMap<>();
        for (Target target : requested) {
            states.put(target, State.ERROR);
            if (target != null && target.isValid() && target.isBound() && matchUser(target).success) packages
                    .computeIfAbsent(target.packageName, ignored -> new LinkedHashSet<>()).add(target);
        }
        String remembered = context.getSharedPreferences(AppConfig.DIAGNOSTICS, Context.MODE_PRIVATE)
                .getString("root_last_state", "");
        if (RootState.DENIED.name().equals(remembered)
                || RootState.UNAVAILABLE.name().equals(remembered)) return states;
        List<String> names = new ArrayList<>(packages.keySet());
        for (int offset = 0; offset < names.size(); offset += HideBatchExecutor.BATCH_SIZE) {
            Set<String> batch = new LinkedHashSet<>(names.subList(offset,
                    Math.min(offset + HideBatchExecutor.BATCH_SIZE, names.size())));
            RootShell.Result result = RootShell.run(HidePackageSnapshot.command(batch), null,
                    12L * batch.size(), 256 * 1024);
            if (!result.isSuccess()) continue;
            Map<String, HidePackageSnapshot.PackageState> parsed = HidePackageSnapshot.parse(result.output, batch);
            for (String pkg : batch) {
                HidePackageSnapshot.PackageState state = parsed.get(pkg);
                if (state == null) continue;
                for (Target target : packages.get(pkg))
                    if (matchUser(target).success)
                        states.put(target, State.valueOf(state.user(target.userId).name()));
            }
        }
        return states;
    }

    OperationResult hide(Target target) { return change(target, true, false); }
    OperationResult show(Target target) { return change(target, false, false); }

    OperationResult hideAll(boolean currentUserOnly) {
        return changeAll(true, currentUserOnly);
    }

    OperationResult runScreenOffAutomation() {
        ACTION_LOCK.lock();
        try {
            android.os.PowerManager power = context.getSystemService(android.os.PowerManager.class);
            boolean authorized = RootState.GRANTED.name().equals(context
                    .getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .getString("root_last_state", ""));
            if (!ScreenAutomationPolicy.mayRun(config.getBoolean(AppConfig.HIDE_MASTER),
                    config.getBoolean(AppConfig.AUTOMATION_ENABLED), authorized,
                    power != null && !power.isInteractive())) {
                return OperationResult.success("自动隐藏当前无需执行");
            }
            // Reentrant queue shared with manual hide/show and emergency restore.
            return changeAll(true, !"all".equals(config.get(AppConfig.AUTOMATION_SCOPE)));
        } finally {
            ACTION_LOCK.unlock();
        }
    }

    OperationResult showAll() { return changeAll(false, false); }

    OperationResult emergencyRestore() { return OperationResult.failure("请从应用隐藏页面主动选择全部显示"); }

    OperationResult toggleAll() {
        ACTION_LOCK.lock();
        try {
            RootStatus root = rootStatus();
            if (root.state != RootState.GRANTED) return OperationResult.failure(root.message);
            // Decide and act under the same queue lock as manual and screen-off actions.
            Summary current = summary();
            if (current.aggregate == Aggregate.ERROR) return OperationResult.failure(
                    "部分应用选择的用户空间或状态无法确认，请重新核对选择");
            return changeAll(current.aggregate == Aggregate.ALL_VISIBLE, false, root);
        } finally { ACTION_LOCK.unlock(); }
    }

    private OperationResult changeAll(boolean hide, boolean currentUserOnly) {
        return changeAll(hide, currentUserOnly, null);
    }

    private OperationResult changeAll(boolean hide, boolean currentUserOnly, RootStatus checkedRoot) {
        return changeAll(hide, currentUserOnly, checkedRoot, null, null);
    }

    OperationResult changeConfirmed(boolean hide, Set<Target> confirmed, java.util.function.Consumer<String> progress) {
        if (confirmed == null) return OperationResult.failure("应用名单未确认");
        return changeAll(hide, false, null, new LinkedHashSet<>(confirmed), progress);
    }

    private OperationResult changeAll(boolean hide, boolean currentUserOnly, RootStatus checkedRoot,
            Set<Target> confirmed, java.util.function.Consumer<String> progress) {
        ACTION_LOCK.lock();
        try {
            reportProgress(progress, "正在检查应用…");
            RootStatus root = checkedRoot == null ? rootStatus() : checkedRoot;
            if (root.state != RootState.GRANTED) return OperationResult.failure(root.message);
            if (!selectionStatus().valid)
                return OperationResult.failure("独立应用名单尚未读取成功，已保留原内容并停止操作");
            if (confirmed != null && !confirmed.equals(targets()))
                return OperationResult.failure("配置应用已变化，请重新确认操作");
            if (hide && conflictState().hasConflict()) {
                return OperationResult.failure("旧架构仍存在，已阻止隐藏动作");
            }
            if (hide && !config.getBoolean(AppConfig.HIDE_MASTER)) {
                return OperationResult.failure("隐藏管理总开关未启用");
            }
            UserDirectory directory = listUsersResult(false);
            if (!directory.success) return OperationResult.failure(directory.message);
            Set<Integer> knownUsers = directory.userIds();
            UserResolution current = currentUserOnly
                    ? resolveCurrentUser(directory) : UserResolution.failure("not_required");
            if (currentUserOnly && !current.resolved) {
                return OperationResult.failure(current.message);
            }
            int success = 0;
            List<String> failures = new ArrayList<>();
            Set<Target> configured = targets();
            if (configured.isEmpty()) return OperationResult.failure("请先配置应用");
            Set<Target> userApps = userInstalledTargets(configured);
            Set<Target> actionTargets = new LinkedHashSet<>();
            Set<Target> legacyTargets = new LinkedHashSet<>();
            for (Target target : configured) {
                if (target == null || !target.isValid() || isProtected(target.packageName)) {
                    failures.add(target + ":目标无效或受保护");
                    continue;
                }
                if (hide && currentUserOnly && target.userId != current.userId) continue;
                if (!target.isBound()) {
                    failures.add(target + ":尚未确认用户空间，请重新选择应用");
                    continue;
                }
                HideUserIdentity.Snapshot identity = matchUser(target);
                if (!knownUsers.contains(target.userId) || !identity.success) {
                    failures.add(target + ":" + (identity.success ? "目标用户已移除" : identity.message));
                    continue;
                }
                if (!userApps.contains(target)) {
                    // Legacy selection is intent, not ownership of hidden state.
                    legacyTargets.add(target);
                    continue;
                }
                actionTargets.add(target);
            }
            HideBatchExecutor.Outcome<Target> changed = executeBatch(actionTargets, hide, root, progress);
            success += changed.success.size();
            for (Map.Entry<Target, String> failure : changed.failures.entrySet())
                failures.add(failure.getKey() + ":" + failure.getValue());
            reportProgress(progress, "正在更新应用状态…");
            OperationResult mirrored = syncMirrors();
            String action = hide ? "HIDE_ALL" : "SHOW_ALL";
            AuditLog.write(context, action, "success=" + success + " failures=" + failures.size());
            if (!legacyTargets.isEmpty()) return OperationResult.failure("已处理 " + success + " 个目标，失败 "
                    + failures.size() + " 个；已跳过 " + legacyTargets.size()
                    + " 个无法确认的普通应用，请在配置应用中重新核对选择");
            return failures.isEmpty()
                    ? new OperationResult(true, "已处理 " + success + " 个目标"
                    + (mirrored.success ? "" : "；运行状态同步失败：" + mirrored.message), mirrored.success)
                    : OperationResult.failure("成功 " + success + "，失败 " + failures.size()
                    + "：" + failures.get(0));
        } finally {
            ACTION_LOCK.unlock();
        }
    }

    private OperationResult change(Target target, boolean hide, boolean lockHeld) {
        if (!lockHeld) ACTION_LOCK.lock();
        try {
            if (!hide) return OperationResult.review("请逐个核对当前应用并手动确认显示");
            if (!lockHeld) {
                RootStatus root = rootStatus();
                if (root.state != RootState.GRANTED) return OperationResult.failure(root.message);
            }
            UserDirectory directory = listUsersResult(false);
            if (!directory.success) return OperationResult.failure(directory.message);
            OperationResult result = changeValidated(target, hide, directory.userIds());
            if (!lockHeld && result.success) {
                OperationResult mirrored = syncMirrors();
                return new OperationResult(true, result.message
                        + (mirrored.success ? "" : "；运行状态同步失败：" + mirrored.message), mirrored.success);
            }
            return result;
        } finally {
            if (!lockHeld) ACTION_LOCK.unlock();
        }
    }

    private OperationResult changeValidated(Target target, boolean hide,
            Set<Integer> knownUsers) {
            if (!hide) return OperationResult.review("请逐个核对当前应用并手动确认显示");
            if (target == null || !target.isValid() || isProtected(target.packageName)) {
                return OperationResult.failure("目标无效或受保护");
            }
            if (knownUsers == null || !knownUsers.contains(target.userId)) {
                return OperationResult.failure("目标用户不存在或无法验证");
            }
            if (!target.isBound()) return OperationResult.failure("应用选择尚未确认用户身份");
            HideUserIdentity.Snapshot user = matchUser(target);
            if (!user.success) return OperationResult.failure(user.message);
            if (hide && !isUserInstalledApp(target)) {
                return OperationResult.failure("仅支持隐藏用户安装的应用");
            }
            if (hide && conflictState().hasConflict()) {
                return OperationResult.failure("旧架构仍存在，已阻止隐藏动作");
            }
            if (hide && !config.getBoolean(AppConfig.HIDE_MASTER)) {
                return OperationResult.failure("隐藏管理总开关未启用");
            }
            HideBatchExecutor.Outcome<Target> outcome = executeBatch(Collections.singleton(target), hide);
            return outcome.success.contains(target) ? OperationResult.success("操作成功")
                    : OperationResult.failure(outcome.failures.getOrDefault(target, "状态校验失败"));
    }

    /** User-requested batches retain per-target identity checks; disk records never replay commands. */
    private HideBatchExecutor.Outcome<Target> executeBatch(Set<Target> targets, boolean hide) {
        return executeBatch(targets, hide, rootStatus(), null);
    }

    private HideBatchExecutor.Outcome<Target> executeBatch(Set<Target> targets, boolean hide,
            RootStatus root, java.util.function.Consumer<String> progress) {
        HideBatchExecutor.Outcome<Target> outcome = new HideBatchExecutor.Outcome<>();
        if (root.state != RootState.GRANTED) {
            for (Target target : targets) outcome.failures.put(target, root.message);
            return outcome;
        }
        HideTargetController commands = HideTargetController.forCheckedBatch(context, this, root);
        boolean stopped = false;
        int index = 0;
        for (Target target : targets) {
            OperationResult result;
            reportProgress(progress, (hide ? "正在隐藏 " : "正在显示 ") + (++index) + "/" + targets.size());
            if (stopped) result = OperationResult.failure("上一目标未完成，已停止后续目标");
            else if (hide) result = commands.hide(target);
            else result = commands.showInConfirmedBatch(target);
            if (result.success) outcome.success.add(target);
            else { outcome.failures.put(target, result.message); stopped = true; }
            AuditLog.write(context, hide ? "HIDE" : "SHOW", target + " success=" + result.success);
        }
        return outcome;
    }

    private static void reportProgress(java.util.function.Consumer<String> progress, String message) {
        if (progress != null) try { progress.accept(message); } catch (RuntimeException ignored) { }
    }

    String currentTargetProblem(Target target) {
        if (target == null || !target.isBound() || isProtected(target.packageName)) return "目标无效、身份未绑定或属于受保护应用";
        HideUserIdentity.Snapshot identity = matchUser(target);
        if (!identity.success) return identity.message;
        return isUserInstalledApp(target) ? "" : "只能操作所选空间中当前安装的普通应用";
    }

    Summary summary() {
        if (!refreshTargets().success) return new Summary(Aggregate.ERROR, 1, 0, 0, 0, 1);
        if (!selectionStatus().valid) return new Summary(Aggregate.ERROR, 1, 0, 0, 0, 1);
        return summary(queryStates(targets()));
    }

    private Summary summary(Map<Target, State> states) {
        int visible = 0, hidden = 0, missing = 0, error = 0;
        for (State state : states.values()) {
            switch (state) {
                case VISIBLE: visible++; break;
                case HIDDEN: hidden++; break;
                case MISSING: missing++; break;
                default: error++; break;
            }
        }
        Aggregate aggregate;
        int total = states.size();
        if (total == 0) aggregate = Aggregate.EMPTY;
        else if (missing > 0 || error > 0) aggregate = Aggregate.ERROR;
        else if (visible == total) aggregate = Aggregate.ALL_VISIBLE;
        else if (hidden == total) aggregate = Aggregate.ALL_HIDDEN;
        else aggregate = Aggregate.MIXED;
        return new Summary(aggregate, total, visible, hidden, missing, error);
    }

    OperationResult syncMirrors() {
        ACTION_LOCK.lock();
        try {
            OperationResult loaded = refreshTargets();
            if (!loaded.success) return loaded;
            if (!selectionStatus().valid) {
                RootShell.Result cleared = RuntimeStateStore.publishHidden(context, "", Aggregate.ERROR.name());
                return OperationResult.failure("应用选择无法解析，已保留原内容"
                        + (cleared.isSuccess() ? "；有效隐藏镜像已清空" : "；镜像清除失败：" + cleared.publicError()));
            }
            Map<Target, State> states = queryStates(targets());
            HideTargetStore.Snapshot before = targetSnapshot;
            List<HideTargetStore.Record> observed = new ArrayList<>();
            boolean changed = false;
            for (HideTargetStore.Record old : before.records) {
                State state = states.get(new Target(old.userId, old.userSerial, old.packageName, old.bound));
                HideTargetStore.ObservedState actual = state == null ? old.observedState
                        : state == State.ERROR ? HideTargetStore.ObservedState.UNKNOWN
                        : HideTargetStore.ObservedState.valueOf(state.name());
                boolean different = actual != old.observedState;
                changed |= different;
                observed.add(new HideTargetStore.Record(old.userId, old.userSerial, old.packageName,
                        old.bound, old.managed, old.desiredHidden, actual,
                        different ? System.currentTimeMillis() : old.observedAt, old.lastOperation));
            }
            if (changed) {
                HideTargetStore.WriteResult saved = targetStore.compareAndSet(before.revision,
                        new HideTargetStore.Snapshot(before.revision + 1, observed));
                if (!saved.applied) return OperationResult.failure("当前状态已读取，观察记录保存未确认：" + saved.error);
                targetSnapshot = saved.snapshot;
            }
            Set<Target> hidden = new LinkedHashSet<>();
            for (Map.Entry<Target, State> entry : states.entrySet()) {
                if (entry.getValue() != State.HIDDEN) continue;
                hidden.add(entry.getKey());
            }
            Summary summary = summary(states);
            RootShell.Result result = RuntimeStateStore.publishHidden(context,
                    HideTargetCodec.encode(hidden), summary.aggregate.name());
            if (states.containsValue(State.ERROR)) return OperationResult.failure(
                    "部分选择的用户身份或状态无法确认，已保留选择并排除无效隐藏镜像"
                            + (result.isSuccess() ? "" : "；镜像同步失败：" + result.publicError()));
            return result.isSuccess() ? OperationResult.success("运行镜像已同步")
                    : OperationResult.failure(result.publicError());
        } finally { ACTION_LOCK.unlock(); }
    }

    List<UserRecord> listUsers() {
        return listUsersResult(true).users;
    }

    UserDirectory userDirectory() {
        return listUsersResult(true);
    }

    private UserDirectory listUsersResult(boolean checkRoot) {
        if (checkRoot) {
            RootStatus root = rootStatus();
            if (root.state != RootState.GRANTED) {
                return UserDirectory.failure("无法读取系统用户：" + root.message);
            }
        }
        RootShell.Result result = RootShell.run(
                "pm list users 2>/dev/null", null, 12, 64 * 1024);
        if (!result.isSuccess()) {
            return UserDirectory.failure("无法读取系统用户列表：" + result.publicError());
        }
        LinkedHashMap<Integer, UserRecord> unique = new LinkedHashMap<>();
        Matcher matcher = USER.matcher(result.output);
        while (matcher.find()) {
            try {
                int userId = Integer.parseInt(matcher.group(1));
                if (userId < 0 || userId > 99999 || unique.containsKey(userId)) continue;
                HideUserIdentity.Snapshot identity = HideUserIdentity.read(context, userId);
                unique.put(userId, new UserRecord(userId,
                        identity.success ? identity.userSerial : -1, matcher.group(2)));
            } catch (Throwable ignored) { }
        }
        if (unique.isEmpty()) {
            return UserDirectory.failure("系统用户列表为空或格式不受支持");
        }
        ArrayList<UserRecord> users = new ArrayList<>(unique.values());
        users.sort(Comparator.comparingInt(user -> user.userId));
        return UserDirectory.success(users);
    }

    List<AppRecord> listApps(int userId) {
        HideUserIdentity.Snapshot identity = HideUserIdentity.read(context, userId);
        return identity.success ? listApps(userId, identity.userSerial) : Collections.emptyList();
    }

    List<AppRecord> listApps(int userId, long expectedSerial) {
        if (!HideUserIdentity.match(context, userId, expectedSerial).success)
            return Collections.emptyList();
        RootStatus root = rootStatus();
        RootShell.Result result = root.state == RootState.GRANTED
                ? RootShell.run("/system/bin/pm list packages -3 --user " + userId + " 2>/dev/null",
                null, 30, 2 * 1024 * 1024)
                : new RootShell.Result(126, "root_unavailable", false);
        if (!result.isSuccess()) return Collections.emptyList();
        LinkedHashSet<String> packages = new LinkedHashSet<>();
        for (String line : result.output.split("\\r?\\n")) {
            String value = line.startsWith("package:") ? line.substring(8).trim() : "";
            if (isValidPackage(value)) packages.add(value);
        }
        // Old intent supplies package names only. Hidden apps can be absent from
        // the default list, including after an upgrade leaves their selection
        // pending. Even an old serial mismatch is only a discovery hint: verify
        // third-party status AND installation in the current captured user.
        // These current-user candidates never change or confirm stored intent.
        Set<Target> candidates = new LinkedHashSet<>();
        for (Target target : targets()) if (target.userId == userId && target.isValid()
                && !isProtected(target.packageName) && !packages.contains(target.packageName))
            candidates.add(new Target(userId, expectedSerial, target.packageName));
        if (!candidates.isEmpty()) {
            RootShell.Result inventory = RootShell.run("/system/bin/pm list packages -3 -u --user "
                    + userId + " 2>/dev/null", null, 12, 2 * 1024 * 1024);
            if (inventory.isSuccess()) {
                Set<String> thirdParty = new LinkedHashSet<>();
                for (String line : inventory.output.split("\\r?\\n"))
                    if (line.startsWith("package:")) thirdParty.add(line.substring(8).trim());
                Map<Target, State> currentStates = queryStates(candidates);
                for (Target candidate : candidates) {
                    State state = currentStates.getOrDefault(candidate, State.ERROR);
                    if (thirdParty.contains(candidate.packageName)
                            && (state == State.VISIBLE || state == State.HIDDEN))
                        packages.add(candidate.packageName);
                }
            }
        }
        ArrayList<AppRecord> records = new ArrayList<>(packages.size());
        PackageManager pm = context.getPackageManager();
        for (String packageName : packages) {
            String label = packageName;
            long installedAt = 0L;
            try {
                ApplicationInfo info = pm.getApplicationInfo(packageName, APP_METADATA_FLAGS);
                if (hasSystemFlag(info)) continue;
                CharSequence loaded = info.loadLabel(pm);
                if (loaded != null && loaded.length() > 0) label = loaded.toString();
                PackageInfo packageInfo = pm.getPackageInfo(packageName, APP_METADATA_FLAGS);
                installedAt = packageInfo.firstInstallTime;
            } catch (Throwable ignored) { }
            records.add(new AppRecord(new Target(userId, expectedSerial, packageName), label, false,
                    installedAt, isProtected(packageName)));
        }
        records.sort(Comparator.comparing((AppRecord app) -> app.label, String.CASE_INSENSITIVE_ORDER)
                .thenComparing(app -> app.target.packageName));
        return HideUserIdentity.match(context, userId, expectedSerial).success
                ? records : Collections.emptyList();
    }

    private boolean isUserInstalledApp(Target target) {
        return userInstalledTargets(Collections.singleton(target)).contains(target);
    }

    private Set<Target> userInstalledTargets(Set<Target> requested) {
        Set<Target> installed = new LinkedHashSet<>();
        Map<String, Boolean> local = new LinkedHashMap<>();
        Map<Integer, Set<Target>> unresolved = new LinkedHashMap<>();
        for (Target target : requested) {
            if (target == null || !target.isValid() || isProtected(target.packageName)) continue;
            if (!local.containsKey(target.packageName)) {
                Boolean thirdParty = null;
                try {
                    thirdParty = !hasSystemFlag(context.getPackageManager().getApplicationInfo(
                            target.packageName, APP_METADATA_FLAGS));
                } catch (Throwable ignored) { }
                local.put(target.packageName, thirdParty);
            }
            Boolean thirdParty = local.get(target.packageName);
            if (Boolean.TRUE.equals(thirdParty)) installed.add(target);
            else if (thirdParty == null) unresolved
                    .computeIfAbsent(target.userId, ignored -> new LinkedHashSet<>()).add(target);
        }
        // Other-user packages may be invisible to this process. One privileged
        // third-party inventory per user replaces a filtered inventory per app.
        for (Map.Entry<Integer, Set<Target>> entry : unresolved.entrySet()) {
            RootShell.Result result = RootShell.run("/system/bin/pm list packages -3 -u --user "
                    + entry.getKey() + " 2>/dev/null", null, 12, 2 * 1024 * 1024);
            if (!result.isSuccess()) continue;
            Set<String> packages = new LinkedHashSet<>();
            for (String line : result.output.split("\\r?\\n"))
                if (line.startsWith("package:")) packages.add(line.substring(8).trim());
            for (Target target : entry.getValue())
                if (packages.contains(target.packageName)) installed.add(target);
        }
        return installed;
    }

    private static boolean hasSystemFlag(ApplicationInfo info) {
        if (info == null) return true;
        int systemFlags = ApplicationInfo.FLAG_SYSTEM | ApplicationInfo.FLAG_UPDATED_SYSTEM_APP;
        return (info.flags & systemFlags) != 0;
    }

    UserResolution currentUser() {
        UserDirectory directory = listUsersResult(true);
        return directory.success ? resolveCurrentUser(directory)
                : UserResolution.failure(directory.message);
    }

    UserResolution currentUser(UserDirectory directory) {
        if (directory == null || !directory.success) {
            return UserResolution.failure(directory == null
                    ? "系统用户列表不可用" : directory.message);
        }
        return resolveCurrentUser(directory);
    }

    private UserResolution resolveCurrentUser(UserDirectory directory) {
        RootShell.Result primary = RootShell.run(
                "cmd activity get-current-user 2>/dev/null", null, 5, 1024);
        RootShell.Result fallback = RootShell.run(
                "am get-current-user 2>/dev/null", null, 5, 1024);
        if (primary.timedOut || fallback.timedOut) {
            return UserResolution.failure("当前用户识别超时，已拒绝执行批量操作");
        }
        return UserResolution.resolve(primary.isSuccess(), primary.output,
                fallback.isSuccess(), fallback.output, directory.userIds());
    }

    private RootShell.Result writeRootTargets(String text) {
        return HideRecoveryEmergency.writeTargets(text);
    }

    private HideUserIdentity.Snapshot matchUser(Target target) {
        return HideUserIdentity.match(context, target.userId, target.userSerial);
    }

    private static Set<Target> parseTargets(String raw) {
        LinkedHashSet<Target> targets = new LinkedHashSet<>();
        HideTargetCodec.Selection selection = HideTargetCodec.parse(raw);
        if (!selection.valid) return targets;
        for (HideTargetCodec.Entry entry : selection.entries) targets.add(new Target(entry));
        return targets;
    }

    private static String serialize(Set<Target> targets) {
        return HideTargetCodec.encode(targets);
    }

    static boolean isValidPackage(String packageName) {
        return packageName != null && packageName.length() <= 255
                && PACKAGE.matcher(packageName).matches() && !packageName.contains("..");
    }

    static boolean isProtected(String packageName) { return PROTECTED.contains(packageName); }

    private static String valueAfter(String text, String marker) {
        int index = text.indexOf(marker);
        return index < 0 ? "" : text.substring(index + marker.length()).trim();
    }

    static final class Target extends HideTargetCodec.Entry {
        Target(int userId, String packageName) {
            super(userId, -1, packageName, false);
        }
        Target(int userId, long userSerial, String packageName) {
            super(userId, userSerial, packageName, true);
        }
        Target(int userId, long userSerial, String packageName, boolean confirmed) {
            super(userId, userSerial, packageName, confirmed);
        }
        Target(HideTargetCodec.Entry entry) {
            super(entry.userId, entry.userSerial, entry.packageName, entry.confirmed);
        }
    }

    static final class UserRecord {
        final int userId;
        final long userSerial;
        final long serial;
        final String name;
        UserRecord(int userId, String name) { this(userId, -1, name); }
        UserRecord(int userId, long userSerial, String name) {
            this.userId = userId; this.userSerial = userSerial; this.serial = userSerial; this.name = name;
        }
        @Override public String toString() { return name + "（user " + userId + "）"; }
    }

    static final class UserDirectory {
        final boolean success;
        final List<UserRecord> users;
        final String message;

        private UserDirectory(boolean success, List<UserRecord> users, String message) {
            this.success = success;
            this.users = Collections.unmodifiableList(new ArrayList<>(users));
            this.message = message == null ? "" : message;
        }

        static UserDirectory success(List<UserRecord> users) {
            return new UserDirectory(true, users, "已读取 " + users.size() + " 个用户空间");
        }

        static UserDirectory failure(String message) {
            return new UserDirectory(false, Collections.emptyList(), message);
        }

        Set<Integer> userIds() {
            LinkedHashSet<Integer> result = new LinkedHashSet<>();
            for (UserRecord user : users) result.add(user.userId);
            return Collections.unmodifiableSet(result);
        }
    }

    static final class AppRecord {
        final Target target;
        final String label;
        final boolean system;
        final long installedAt;
        final boolean protectedApp;
        AppRecord(Target target, String label, boolean system, long installedAt, boolean protectedApp) {
            this.target = target; this.label = label; this.system = system;
            this.installedAt = installedAt; this.protectedApp = protectedApp;
        }
    }

    static final class RootStatus {
        final RootState state;
        final String message;
        final String provider;
        RootStatus(RootState state, String message, String provider) {
            this.state = state; this.message = message; this.provider = provider;
        }
    }

    static final class ConflictState {
        final boolean oldPackage;
        final boolean oldModule;
        final String message;
        ConflictState(boolean oldPackage, boolean oldModule, String message) {
            this.oldPackage = oldPackage; this.oldModule = oldModule; this.message = message;
        }
        boolean hasConflict() { return oldPackage || oldModule; }
    }

    static final class Summary {
        final Aggregate aggregate;
        final int total, visible, hidden, missing, error;
        Summary(Aggregate aggregate, int total, int visible, int hidden, int missing, int error) {
            this.aggregate = aggregate; this.total = total; this.visible = visible;
            this.hidden = hidden; this.missing = missing; this.error = error;
        }
    }

    static final class OperationResult {
        final boolean success;
        final String message;
        final boolean runtimeSynced;
        final boolean reviewRequired;
        private OperationResult(boolean success, String message) {
            this(success, message, success);
        }
        private OperationResult(boolean success, String message, boolean runtimeSynced) {
            this(success, message, runtimeSynced, false);
        }
        private OperationResult(boolean success, String message, boolean runtimeSynced, boolean reviewRequired) {
            this.success = success; this.message = message; this.runtimeSynced = runtimeSynced;
            this.reviewRequired = reviewRequired;
        }
        static OperationResult success(String message) { return new OperationResult(true, message); }
        static OperationResult observedSuccess(String message, boolean synced) { return new OperationResult(true, message, synced); }
        static OperationResult failure(String message) { return new OperationResult(false, message); }
        static OperationResult review(String message) { return new OperationResult(false, message, false, true); }
    }
}
