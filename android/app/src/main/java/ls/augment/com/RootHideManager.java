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
    private static final String ROOT_DIR = "/data/adb/ls_augment/v2";
    private static final String TARGETS_FILE = ROOT_DIR + "/targets.conf";
    private static final String BACKUP_FILE = ROOT_DIR + "/targets.backup.conf";
    private static final String EMERGENCY_FILE = ROOT_DIR + "/emergency_restore.sh";
    private static final ReentrantLock ACTION_LOCK = new ReentrantLock();
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

    RootStatus requestRootStatus() {
        context.getSharedPreferences(AppConfig.DIAGNOSTICS, Context.MODE_PRIVATE)
                .edit().putBoolean("root_prompt_suppressed", false).apply();
        return probeRoot();
    }

    private RootStatus probeRoot() {
        if (!new java.io.File("/system/bin/su").exists()) {
            RootShell.Result path = RootShell.run("command -v su 2>/dev/null || true", null, 3, 4096);
            if (path.output.isEmpty()) return remember(
                    new RootStatus(RootState.UNAVAILABLE, "未找到 su", "无"));
        }
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
                ? "检测到旧 APK/KSU。请先在旧版本恢复全部应用、卸载旧模块与旧 APK并重启。"
                : "未检测到旧架构冲突";
        return new ConflictState(oldPackage, oldModule, message);
    }

    Set<Target> targets() {
        return parseTargets(config.get(AppConfig.HIDE_TARGETS));
    }

    OperationResult saveTargets(Set<Target> desired) {
        ACTION_LOCK.lock();
        try {
            RootStatus root = rootStatus();
            if (root.state != RootState.GRANTED) return OperationResult.failure(root.message);
            if (conflictState().hasConflict()) {
                return OperationResult.failure("旧 APK/KSU 仍存在，不能建立新版本目标配置");
            }
            UserDirectory directory = listUsersResult(false);
            if (!directory.success) return OperationResult.failure(directory.message);
            Set<Integer> knownUsers = directory.userIds();
            LinkedHashSet<Target> userTargets = new LinkedHashSet<>();
            int removedSystemTargets = 0;
            for (Target target : desired) {
                if (!target.isValid() || isProtected(target.packageName)) {
                    return OperationResult.failure("包含无效或受保护目标：" + target);
                }
                if (!knownUsers.contains(target.userId)) {
                    return OperationResult.failure("目标用户不存在或已被移除：" + target.userId);
                }
                if (!isUserInstalledApp(target)) {
                    removedSystemTargets++;
                    continue;
                }
                userTargets.add(target);
            }
            Set<Target> old = targets();
            for (Target target : old) {
                if (!userTargets.contains(target) && queryState(target) == State.HIDDEN) {
                    if (!knownUsers.contains(target.userId)) continue;
                    OperationResult show = changeValidated(target, false, knownUsers);
                    if (!show.success) return OperationResult.failure(
                            "移除前恢复失败：" + target + "；" + show.message);
                }
            }
            String serialized = serialize(userTargets);
            RootShell.Result rootWrite = writeRootTargets(serialized.replace(';', '\n'));
            if (!rootWrite.isSuccess()) return OperationResult.failure(
                    "Root 恢复副本写入失败：" + rootWrite.publicError());
            Map<String, String> update = new LinkedHashMap<>();
            update.put(AppConfig.HIDE_TARGETS, serialized);
            AppConfig.SaveResult saved = config.save(update);
            if (!saved.success) return OperationResult.failure(saved.message);
            syncMirrors();
            AuditLog.write(context, "TARGETS", "saved count=" + userTargets.size()
                    + " removed_system=" + removedSystemTargets);
            String message = "已保存 " + userTargets.size() + " 个用户应用目标";
            if (removedSystemTargets > 0) {
                message += "；已移除并恢复 " + removedSystemTargets + " 个系统应用目标";
            }
            return OperationResult.success(message);
        } finally {
            ACTION_LOCK.unlock();
        }
    }

    State queryState(Target target) {
        if (target == null || !target.isValid()) return State.ERROR;
        String remembered = context.getSharedPreferences(AppConfig.DIAGNOSTICS, Context.MODE_PRIVATE)
                .getString("root_last_state", "");
        if (RootState.DENIED.name().equals(remembered)
                || RootState.UNAVAILABLE.name().equals(remembered)) return State.ERROR;
        String marker = "User " + target.userId + ":";
        String command = "dumpsys package " + RootShell.quote(target.packageName)
                + " 2>/dev/null | grep -F " + RootShell.quote(marker) + " | head -n 1";
        RootShell.Result result = RootShell.run(command, null, 12, 16 * 1024);
        if (!result.isSuccess() && result.output.isEmpty()) return State.ERROR;
        String line = result.output;
        if (line.contains("installed=false")) return State.MISSING;
        if (line.contains("hidden=true")) return State.HIDDEN;
        if (line.contains("hidden=false")) return State.VISIBLE;
        return State.MISSING;
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

    OperationResult emergencyRestore() { return changeAll(false, false); }

    private OperationResult changeAll(boolean hide, boolean currentUserOnly) {
        ACTION_LOCK.lock();
        try {
            RootStatus root = rootStatus();
            if (root.state != RootState.GRANTED) return OperationResult.failure(root.message);
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
            for (Target target : targets()) {
                if (!knownUsers.contains(target.userId)) {
                    // A removed Android user is not a valid command target.
                    // Keep recovery fail-closed and simply ignore its stale entry.
                    continue;
                }
                if (hide && currentUserOnly && target.userId != current.userId) continue;
                if (hide && !isUserInstalledApp(target)) {
                    // Legacy versions allowed system targets. Never hide them
                    // again; if one is still hidden, restore it while the old
                    // target remains available to the emergency recovery path.
                    if (queryState(target) == State.HIDDEN) {
                        OperationResult restored = changeValidated(target, false, knownUsers);
                        if (!restored.success) {
                            failures.add(target + ":系统应用恢复失败：" + restored.message);
                        }
                    }
                    continue;
                }
                OperationResult result = changeValidated(target, hide, knownUsers);
                if (result.success) success++; else failures.add(target + ":" + result.message);
            }
            syncMirrors();
            String action = hide ? "HIDE_ALL" : "SHOW_ALL";
            AuditLog.write(context, action, "success=" + success + " failures=" + failures.size());
            return failures.isEmpty()
                    ? OperationResult.success("已处理 " + success + " 个目标")
                    : OperationResult.failure("成功 " + success + "，失败 " + failures.size()
                    + "：" + failures.get(0));
        } finally {
            ACTION_LOCK.unlock();
        }
    }

    private OperationResult change(Target target, boolean hide, boolean lockHeld) {
        if (!lockHeld) ACTION_LOCK.lock();
        try {
            if (!lockHeld) {
                RootStatus root = rootStatus();
                if (root.state != RootState.GRANTED) return OperationResult.failure(root.message);
            }
            UserDirectory directory = listUsersResult(false);
            if (!directory.success) return OperationResult.failure(directory.message);
            OperationResult result = changeValidated(target, hide, directory.userIds());
            if (!lockHeld && result.success) syncMirrors();
            return result;
        } finally {
            if (!lockHeld) ACTION_LOCK.unlock();
        }
    }

    private OperationResult changeValidated(Target target, boolean hide,
            Set<Integer> knownUsers) {
            if (target == null || !target.isValid() || isProtected(target.packageName)) {
                return OperationResult.failure("目标无效或受保护");
            }
            if (knownUsers == null || !knownUsers.contains(target.userId)) {
                return OperationResult.failure("目标用户不存在或无法验证");
            }
            if (hide && !isUserInstalledApp(target)) {
                return OperationResult.failure("仅支持隐藏用户安装的应用");
            }
            if (hide && conflictState().hasConflict()) {
                return OperationResult.failure("旧架构仍存在，已阻止隐藏动作");
            }
            if (hide && !config.getBoolean(AppConfig.HIDE_MASTER)) {
                return OperationResult.failure("隐藏管理总开关未启用");
            }
            State expected = hide ? State.HIDDEN : State.VISIBLE;
            State before = queryState(target);
            if (before == expected) return OperationResult.success("状态已经是 " + expected);
            if (before == State.MISSING) return OperationResult.failure("目标在该用户中不存在");
            String mode = hide ? "hide" : "unhide";
            for (int attempt = 1; attempt <= 3; attempt++) {
                StringBuilder command = new StringBuilder();
                if (hide) {
                    command.append("/system/bin/am force-stop --user ")
                            .append(target.userId).append(' ')
                            .append(RootShell.quote(target.packageName))
                            .append(" </dev/null >/dev/null 2>&1 || true; ");
                }
                command.append("/system/bin/pm ").append(mode).append(" --user ")
                        .append(target.userId).append(' ')
                        .append(RootShell.quote(target.packageName))
                        .append(" </dev/null >/dev/null 2>&1");
                RootShell.Result commandResult = RootShell.run(command.toString(), null, 15, 4096);
                State after = queryState(target);
                if (after == expected) {
                    AuditLog.write(context, mode.toUpperCase(Locale.US),
                            target + " result=SUCCESS attempts=" + attempt);
                    return OperationResult.success("操作成功");
                }
                if (commandResult.timedOut) return OperationResult.failure("PackageManager 操作超时");
            }
            State actual = queryState(target);
            AuditLog.write(context, mode.toUpperCase(Locale.US),
                    target + " result=FAIL actual=" + actual);
            return OperationResult.failure("状态校验失败，实际为 " + actual);
    }

    Summary summary() {
        int visible = 0, hidden = 0, missing = 0, error = 0;
        Set<Target> targets = targets();
        for (Target target : targets) {
            switch (queryState(target)) {
                case VISIBLE: visible++; break;
                case HIDDEN: hidden++; break;
                case MISSING: missing++; break;
                default: error++; break;
            }
        }
        Aggregate aggregate;
        int total = targets.size();
        if (total == 0) aggregate = Aggregate.EMPTY;
        else if (missing > 0 || error > 0) aggregate = Aggregate.ERROR;
        else if (visible == total) aggregate = Aggregate.ALL_VISIBLE;
        else if (hidden == total) aggregate = Aggregate.ALL_HIDDEN;
        else aggregate = Aggregate.MIXED;
        return new Summary(aggregate, total, visible, hidden, missing, error);
    }

    OperationResult syncMirrors() {
        StringBuilder hidden = new StringBuilder();
        for (Target target : targets()) {
            if (queryState(target) != State.HIDDEN) continue;
            if (hidden.length() > 0) hidden.append(';');
            hidden.append(target);
        }
        Summary summary = summary();
        StringBuilder command = new StringBuilder();
        if (hidden.length() == 0) {
            command.append("settings delete global ").append(AppConfig.HIDDEN_MIRROR)
                    .append(" >/dev/null 2>&1 || true; ");
        } else {
            command.append("settings put global ").append(AppConfig.HIDDEN_MIRROR).append(' ')
                    .append(RootShell.quote(hidden.toString())).append("; ");
        }
        command.append("settings put global ").append(AppConfig.TILE_STATE).append(' ')
                .append(summary.aggregate.name());
        RootShell.Result result = RootShell.run(command.toString(), null, 12, 4096);
        return result.isSuccess() ? OperationResult.success("运行镜像已同步")
                : OperationResult.failure(result.publicError());
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
                unique.put(userId, new UserRecord(userId, matcher.group(2)));
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
        if (userId < 0 || userId > 99999) return Collections.emptyList();
        RootStatus root = rootStatus();
        RootShell.Result result = root.state == RootState.GRANTED
                ? RootShell.run("/system/bin/pm list packages -3 --user " + userId + " 2>/dev/null",
                null, 30, 2 * 1024 * 1024)
                : new RootShell.Result(126, "root_unavailable", false);
        LinkedHashSet<String> packages = new LinkedHashSet<>();
        for (String line : result.output.split("\\r?\\n")) {
            String value = line.startsWith("package:") ? line.substring(8).trim() : "";
            if (isValidPackage(value)) packages.add(value);
        }
        // `pm list packages --user` can omit packages hidden for that user.
        // Re-add only managed third-party targets; legacy system targets remain
        // available through showAll/emergencyRestore but never return to the picker.
        for (Target target : targets()) {
            if (target.userId == userId && target.isValid() && isUserInstalledApp(target)) {
                packages.add(target.packageName);
            }
        }
        if (packages.isEmpty() && userId == 0) {
            for (ApplicationInfo info : context.getPackageManager().getInstalledApplications(0)) {
                if (!hasSystemFlag(info)) packages.add(info.packageName);
            }
        }
        ArrayList<AppRecord> records = new ArrayList<>(packages.size());
        PackageManager pm = context.getPackageManager();
        for (String packageName : packages) {
            String label = packageName;
            long installedAt = 0L;
            try {
                ApplicationInfo info = pm.getApplicationInfo(packageName, 0);
                if (hasSystemFlag(info)) continue;
                CharSequence loaded = info.loadLabel(pm);
                if (loaded != null && loaded.length() > 0) label = loaded.toString();
                PackageInfo packageInfo = pm.getPackageInfo(packageName, 0);
                installedAt = packageInfo.firstInstallTime;
            } catch (Throwable ignored) { }
            records.add(new AppRecord(new Target(userId, packageName), label, false,
                    installedAt, isProtected(packageName)));
        }
        records.sort(Comparator.comparing((AppRecord app) -> app.label, String.CASE_INSENSITIVE_ORDER)
                .thenComparing(app -> app.target.packageName));
        return records;
    }

    private boolean isUserInstalledApp(Target target) {
        if (target == null || !target.isValid()) return false;
        try {
            ApplicationInfo info = context.getPackageManager().getApplicationInfo(
                    target.packageName,
                    PackageManager.MATCH_DISABLED_COMPONENTS
                            | PackageManager.MATCH_UNINSTALLED_PACKAGES);
            return !hasSystemFlag(info);
        } catch (Throwable ignored) {
            // A package installed only in another Android user may not be
            // visible through this process' PackageManager. Ask the privileged
            // package service and fail closed if it cannot prove third-party status.
        }
        RootShell.Result result = RootShell.run(
                "/system/bin/pm list packages -3 -u --user " + target.userId + " "
                        + RootShell.quote(target.packageName) + " 2>/dev/null",
                null, 8, 16 * 1024);
        if (!result.isSuccess()) return false;
        for (String line : result.output.split("\\r?\\n")) {
            if (("package:" + target.packageName).equals(line.trim())) return true;
        }
        return false;
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
        String command = "umask 077; mkdir -p " + ROOT_DIR + "; chmod 0700 " + ROOT_DIR + "; "
                + "tmp=" + ROOT_DIR + "/.targets.$$; cat >\"$tmp\"; chmod 0600 \"$tmp\"; "
                + "[ -f " + TARGETS_FILE + " ] && cp -f " + TARGETS_FILE + " " + BACKUP_FILE
                + " || true; mv -f \"$tmp\" " + TARGETS_FILE + "; chmod 0600 " + TARGETS_FILE + "; "
                + "cat >" + EMERGENCY_FILE + " <<'LSAUGMENT_RESTORE'\n"
                + "#!/system/bin/sh\n"
                + "TARGETS=/data/adb/ls_augment/v2/targets.conf\n"
                + "[ -r \"$TARGETS\" ] || exit 2\n"
                + "while IFS=: read -r uid pkg || [ -n \"$uid$pkg\" ]; do\n"
                + "  case \"$uid\" in ''|*[!0-9]*) continue ;; esac\n"
                + "  case \"$pkg\" in ''|*[!A-Za-z0-9._]*|.*|*..*|*.) continue ;; esac\n"
                + "  /system/bin/pm unhide --user \"$uid\" \"$pkg\" </dev/null >/dev/null 2>&1 || true\n"
                + "done <\"$TARGETS\"\n"
                + "settings delete global ls_augment_hidden_targets >/dev/null 2>&1 || true\n"
                + "settings put global ls_augment_tile_state ALL_VISIBLE >/dev/null 2>&1 || true\n"
                + "exit 0\n"
                + "LSAUGMENT_RESTORE\n"
                + "chmod 0700 " + EMERGENCY_FILE;
        return RootShell.run(command, text.isEmpty() ? "" : text + "\n", 12, 64 * 1024);
    }

    private static Set<Target> parseTargets(String raw) {
        LinkedHashSet<Target> targets = new LinkedHashSet<>();
        if (raw == null) return targets;
        for (String item : raw.split("[;\\r\\n]+")) {
            int split = item.indexOf(':');
            if (split <= 0) continue;
            try {
                Target target = new Target(Integer.parseInt(item.substring(0, split)),
                        item.substring(split + 1));
                if (target.isValid() && !isProtected(target.packageName)) targets.add(target);
            } catch (Throwable ignored) { }
        }
        return targets;
    }

    private static String serialize(Set<Target> targets) {
        ArrayList<Target> sorted = new ArrayList<>(targets);
        sorted.sort(Comparator.comparingInt((Target value) -> value.userId)
                .thenComparing(value -> value.packageName));
        StringBuilder out = new StringBuilder();
        for (Target target : sorted) {
            if (out.length() > 0) out.append(';');
            out.append(target);
        }
        return out.toString();
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

    static final class Target {
        final int userId;
        final String packageName;
        Target(int userId, String packageName) {
            this.userId = userId;
            this.packageName = packageName == null ? "" : packageName;
        }
        boolean isValid() { return userId >= 0 && userId <= 99999 && isValidPackage(packageName); }
        @Override public String toString() { return userId + ":" + packageName; }
        @Override public boolean equals(Object other) {
            return other instanceof Target && userId == ((Target) other).userId
                    && packageName.equals(((Target) other).packageName);
        }
        @Override public int hashCode() { return 31 * userId + packageName.hashCode(); }
    }

    static final class UserRecord {
        final int userId;
        final String name;
        UserRecord(int userId, String name) { this.userId = userId; this.name = name; }
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
        private OperationResult(boolean success, String message) {
            this.success = success; this.message = message;
        }
        static OperationResult success(String message) { return new OperationResult(true, message); }
        static OperationResult failure(String message) { return new OperationResult(false, message); }
    }
}
