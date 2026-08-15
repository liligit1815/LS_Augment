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
                "android", "com.android.systemui", "com.android.settings",
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
            for (Target target : desired) {
                if (!target.isValid() || isProtected(target.packageName)) {
                    return OperationResult.failure("包含无效或受保护目标：" + target);
                }
            }
            Set<Target> old = targets();
            for (Target target : old) {
                if (!desired.contains(target) && queryState(target) == State.HIDDEN) {
                    OperationResult show = change(target, false, true);
                    if (!show.success) return OperationResult.failure(
                            "移除前恢复失败：" + target + "；" + show.message);
                }
            }
            String serialized = serialize(desired);
            RootShell.Result rootWrite = writeRootTargets(serialized.replace(';', '\n'));
            if (!rootWrite.isSuccess()) return OperationResult.failure(
                    "Root 恢复副本写入失败：" + rootWrite.publicError());
            Map<String, String> update = new LinkedHashMap<>();
            update.put(AppConfig.HIDE_TARGETS, serialized);
            AppConfig.SaveResult saved = config.save(update);
            if (!saved.success) return OperationResult.failure(saved.message);
            syncMirrors();
            AuditLog.write(context, "TARGETS", "saved count=" + desired.size());
            return OperationResult.success("已保存 " + desired.size() + " 个目标");
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
            int current = currentUserId();
            int success = 0;
            List<String> failures = new ArrayList<>();
            for (Target target : targets()) {
                if (hide && currentUserOnly && target.userId != current) continue;
                OperationResult result = change(target, hide, true);
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
            if (target == null || !target.isValid() || isProtected(target.packageName)) {
                return OperationResult.failure("目标无效或受保护");
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
                    if (!lockHeld) syncMirrors();
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
        } finally {
            if (!lockHeld) ACTION_LOCK.unlock();
        }
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
        RootStatus root = rootStatus();
        if (root.state != RootState.GRANTED) {
            return new ArrayList<>(Collections.singletonList(new UserRecord(0, "主用户（Root 未授权）")));
        }
        RootShell.Result result = RootShell.run("pm list users 2>/dev/null", null, 12, 64 * 1024);
        ArrayList<UserRecord> users = new ArrayList<>();
        Matcher matcher = USER.matcher(result.output);
        while (matcher.find()) {
            try { users.add(new UserRecord(Integer.parseInt(matcher.group(1)), matcher.group(2))); }
            catch (Throwable ignored) { }
        }
        if (users.isEmpty()) users.add(new UserRecord(0, "主用户"));
        users.sort(Comparator.comparingInt(user -> user.userId));
        return users;
    }

    List<AppRecord> listApps(int userId) {
        if (userId < 0 || userId > 99999) return Collections.emptyList();
        RootStatus root = rootStatus();
        RootShell.Result result = root.state == RootState.GRANTED
                ? RootShell.run("/system/bin/pm list packages --user " + userId + " 2>/dev/null",
                null, 30, 2 * 1024 * 1024)
                : new RootShell.Result(126, "root_unavailable", false);
        LinkedHashSet<String> packages = new LinkedHashSet<>();
        for (String line : result.output.split("\\r?\\n")) {
            String value = line.startsWith("package:") ? line.substring(8).trim() : "";
            if (isValidPackage(value)) packages.add(value);
        }
        // `pm list packages --user` intentionally omits packages hidden for that
        // user. Keep every managed target addressable so the UI can always offer
        // a recovery/show action after a successful hide.
        for (Target target : targets()) {
            if (target.userId == userId && target.isValid()) packages.add(target.packageName);
        }
        if (packages.isEmpty() && userId == 0) {
            for (ApplicationInfo info : context.getPackageManager().getInstalledApplications(0)) {
                packages.add(info.packageName);
            }
        }
        ArrayList<AppRecord> records = new ArrayList<>(packages.size());
        PackageManager pm = context.getPackageManager();
        for (String packageName : packages) {
            String label = packageName;
            boolean system = packageName.startsWith("com.android.") || packageName.startsWith("cn.nubia.");
            long installedAt = 0L;
            try {
                ApplicationInfo info = pm.getApplicationInfo(packageName, 0);
                CharSequence loaded = info.loadLabel(pm);
                if (loaded != null && loaded.length() > 0) label = loaded.toString();
                system = (info.flags & ApplicationInfo.FLAG_SYSTEM) != 0;
                PackageInfo packageInfo = pm.getPackageInfo(packageName, 0);
                installedAt = packageInfo.firstInstallTime;
            } catch (Throwable ignored) { }
            records.add(new AppRecord(new Target(userId, packageName), label, system,
                    installedAt, isProtected(packageName)));
        }
        records.sort(Comparator.comparing((AppRecord app) -> app.label, String.CASE_INSENSITIVE_ORDER)
                .thenComparing(app -> app.target.packageName));
        return records;
    }

    int currentUserId() {
        RootShell.Result result = RootShell.run("am get-current-user 2>/dev/null", null, 5, 1024);
        try { return Integer.parseInt(result.output.trim()); } catch (Throwable ignored) { return 0; }
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
