package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.ResolverStyle;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Recovery attribution and identity observations, never proof of mutation ownership.
 * Package evidence is neither an installation UUID nor proof that no manual state
 * change occurred later. Unknown evidence must not authorize automatic recovery.
 */
final class HideRecoveryIdentity {
    private static final String PREFS = "hide_recovery_v1";
    private static final String INSTANCE = "instance_id";
    private static final String UNKNOWN = "unknown";
    private static final String END = "LSA_PACKAGE_IDENTITY_END:0";
    private static final int MAX_DUMP = 1024 * 1024;
    private static final Pattern UUID_TEXT = Pattern.compile(
            "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}");
    private static final Pattern PACKAGE = Pattern.compile(
            "[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+");
    private static final Pattern PACKAGE_HEADER = Pattern.compile(
            "Package \\[([^\\]]+)\\] \\([0-9a-fA-F]+\\):");
    private static final Pattern USER_HEADER = Pattern.compile("User ([0-9]+):\\s*(.*)");
    private static final Pattern APP_ID = Pattern.compile("(appId|userId)=([0-9]+)");
    private static final Pattern INODE = Pattern.compile(
            "(?:^|\\s)(ceDataInode|deDataInode)=([^\\s]+)(?=\\s|$)");
    private static final Pattern INODE_NAME = Pattern.compile(
            "(?:^|\\s)(?:ceDataInode|deDataInode)(?=\\s|=|$)");
    private static final DateTimeFormatter TIME = DateTimeFormatter
            .ofPattern("uuuu-MM-dd HH:mm:ss", Locale.ROOT).withResolverStyle(ResolverStyle.STRICT);

    private HideRecoveryIdentity() { }

    /** Call on the mutation worker. A failed commit must never release an owner. */
    static synchronized Owner owner(Context context) {
        if (context == null) return Owner.failure("无法确认恢复记录所属实例");
        try {
            ApplicationInfo info = context.getApplicationInfo();
            if (info == null || info.uid < 0) return Owner.failure("无法确认本应用所属用户");
            int userId = info.uid / 100000;
            if (userId < 0 || userId > 99999) return Owner.failure("本应用用户标识无效");
            SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            boolean present = prefs.contains(INSTANCE);
            String stored = prefs.getString(INSTANCE, null);
            if (present && (stored == null || !UUID_TEXT.matcher(stored).matches()))
                return Owner.failure("已有恢复实例标识无法解析，已保留原值");
            String id = present ? UUID.fromString(stored).toString() : UUID.randomUUID().toString();
            // Recommit even an existing valid value: Android may retain an edit
            // in memory after commit() reports a disk failure. A retry must not
            // mistake that in-memory value for a durable instance identifier.
            if (!prefs.edit().putString(INSTANCE, id).commit())
                return Owner.failure("恢复实例标识保存失败");
            if (!id.equals(prefs.getString(INSTANCE, null)))
                return Owner.failure("恢复实例标识回读校验失败");
            return new Owner(true, id, userId, "");
        } catch (RuntimeException error) {
            return Owner.failure("无法读取或保存恢复实例标识");
        }
    }

    static Snapshot read(Context context, RootHideManager.Target target) {
        if (context == null || target == null || !validPackage(target.packageName)
                || target.userId < 0 || target.userId > 99999)
            return Snapshot.failure("恢复目标或用户无效");
        // Unbound targets are allowed only for callers collecting read-only
        // recovery evidence. Mutation entry points independently require isBound().
        HideUserIdentity.Snapshot user = target.isBound()
                ? HideUserIdentity.match(context, target.userId, target.userSerial)
                : HideUserIdentity.read(context, target.userId);
        if (!user.success) return Snapshot.failure(user.message);
        final long serial = user.userSerial;
        try {
            String command = "/system/bin/dumpsys package " + RootShell.quote(target.packageName)
                    + "; rc=$?; printf '\\nLSA_PACKAGE_IDENTITY_END:%s\\n' \"$rc\"; exit \"$rc\"";
            RootShell.Result result = RootShell.run(command, null, 12, MAX_DUMP);
            if (!result.isSuccess()) return Snapshot.failure("包身份资料查询失败，已停止本次操作");
            final String dump;
            // RootShell trims output, so a successful empty dump contains only
            // the footer. Missing framing is a read failure, never optional data.
            if (result.output.equals(END)) dump = "";
            else if (result.output.endsWith("\n" + END))
                dump = result.output.substring(0, result.output.length() - END.length() - 1);
            else return Snapshot.failure("包身份资料查询不完整，已停止本次操作");
            String identity = packageIdentity(target.packageName, target.userId, dump);
            HideUserIdentity.Snapshot after = HideUserIdentity.match(context, target.userId, serial);
            if (!after.success) return Snapshot.failure(after.message);
            return new Snapshot(true, UNKNOWN.equals(identity)
                    ? "包身份资料不足，需人工核对" : "", serial, identity, observedState(target, dump));
        } catch (RuntimeException error) {
            return Snapshot.failure("包身份资料查询异常，已停止本次操作");
        }
    }

    private static String observedState(RootHideManager.Target target, String dump) {
        String pkg = target.packageName;
        HidePackageSnapshot.PackageState parsed = HidePackageSnapshot.parse(
                "LSA_BEGIN:" + pkg + ":0\n" + dump + "\nLSA_END:" + pkg + "\n",
                java.util.Collections.singleton(pkg)).get(pkg);
        return parsed == null ? "ERROR" : parsed.user(target.userId).name();
    }

    /**
     * Conservative AOSP text-dump parser. Only the active Packages section and an
     * unambiguous explicit user are accepted. Global firstInstallTime is ignored.
     * The formatted time has second precision and depends on the system timezone;
     * this fingerprint is corroborating evidence, not a persistent install UUID.
     */
    static String packageIdentity(String pkg, int userId, String dump) {
        if (!validPackage(pkg) || userId < 0 || userId > 99999 || dump == null
                || dump.isEmpty() || dump.length() >= MAX_DUMP || dump.indexOf('\0') >= 0)
            return UNKNOWN;
        boolean packages = false, active = false, selectedUser = false, seenUser = false;
        int packageCount = 0, userCount = 0, packageIndent = -1, userIndent = -1;
        String appId = null, firstTime = null, ce = null, de = null;
        Set<String> appFields = new HashSet<>();
        Set<Integer> users = new HashSet<>();
        try {
            for (String line : dump.split("\\r?\\n", -1)) {
                String text = line.trim();
                if (text.isEmpty()) continue;
                int indent = indentation(line);
                if (indent == 0) {
                    packages = text.equals("Packages:");
                    active = false;
                    selectedUser = false;
                    continue;
                }
                if (!packages) continue;
                Matcher header = PACKAGE_HEADER.matcher(text);
                if (header.matches()) {
                    active = pkg.equals(header.group(1));
                    selectedUser = false;
                    seenUser = false;
                    if (active) {
                        if (++packageCount != 1) return UNKNOWN;
                        packageIndent = indent;
                    }
                    continue;
                }
                if (!active) continue;
                if (text.startsWith("Package [") || indent <= packageIndent) return UNKNOWN;
                Matcher user = USER_HEADER.matcher(text);
                if (user.matches()) {
                    int id = Integer.parseInt(user.group(1));
                    if (id < 0 || id > 99999 || !users.add(id)) return UNKNOWN;
                    seenUser = true;
                    selectedUser = id == userId;
                    userIndent = indent;
                    if (selectedUser) {
                        userCount++;
                        String[] inodes = inodes(user.group(2), ce, de);
                        ce = inodes[0];
                        de = inodes[1];
                    }
                    continue;
                }
                if (text.startsWith("User ")) return UNKNOWN;
                if (!seenUser) {
                    Matcher app = APP_ID.matcher(text);
                    if (app.matches()) {
                        String value = number(app.group(2));
                        if (Long.parseLong(value) > 99999 || !appFields.add(app.group(1))
                                || (appId != null && !appId.equals(value))) return UNKNOWN;
                        appId = value;
                    } else if (text.startsWith("appId") || text.startsWith("userId")) {
                        return UNKNOWN;
                    }
                    continue;
                }
                if (!selectedUser) continue;
                if (indent <= userIndent) {
                    selectedUser = false;
                    continue;
                }
                if (text.startsWith("firstInstallTime")) {
                    if (!text.startsWith("firstInstallTime=") || firstTime != null) return UNKNOWN;
                    String value = text.substring("firstInstallTime=".length());
                    LocalDateTime parsed = LocalDateTime.parse(value, TIME);
                    // Reject epoch sentinel dates (including timezone shifts), not
                    // every date in 1970: restored OEM apps can have valid later dates.
                    if (parsed.isBefore(LocalDateTime.of(1970, 1, 3, 0, 0))) return UNKNOWN;
                    firstTime = TIME.format(parsed);
                }
                String[] inodes = inodes(text, ce, de);
                ce = inodes[0];
                de = inodes[1];
            }
            if (packageCount != 1 || userCount != 1 || appId == null || firstTime == null)
                return UNKNOWN;
            String canonical = "package-evidence-v1\npackage=" + pkg + "\nuser=" + userId
                    + "\nappId=" + appId + "\nfirstInstallTime=" + firstTime
                    + "\nceDataInode=" + (ce == null ? "absent" : ce)
                    + "\ndeDataInode=" + (de == null ? "absent" : de) + "\n";
            byte[] hash = MessageDigest.getInstance("SHA-256")
                    .digest(canonical.getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder(64);
            for (byte value : hash) {
                hex.append(Character.forDigit((value & 255) >>> 4, 16));
                hex.append(Character.forDigit(value & 15, 16));
            }
            return hex.toString();
        } catch (Exception invalid) {
            return UNKNOWN;
        }
    }

    private static String[] inodes(String text, String ce, String de) {
        Matcher matcher = INODE.matcher(text);
        int parsed = 0;
        while (matcher.find()) {
            parsed++;
            String value = number(matcher.group(2));
            if (matcher.group(1).equals("ceDataInode")) {
                if (ce != null) throw new IllegalArgumentException("duplicate CE inode");
                ce = value;
            } else {
                if (de != null) throw new IllegalArgumentException("duplicate DE inode");
                de = value;
            }
        }
        Matcher names = INODE_NAME.matcher(text);
        int declared = 0;
        while (names.find()) declared++;
        if (declared != parsed) throw new IllegalArgumentException("unrecognized inode field");
        return new String[]{ce, de};
    }

    private static String number(String value) {
        if (!value.matches("[0-9]+")) throw new IllegalArgumentException("invalid number");
        return Long.toString(Long.parseLong(value));
    }

    private static boolean validPackage(String pkg) {
        return pkg != null && pkg.length() <= 255 && PACKAGE.matcher(pkg).matches();
    }

    private static int indentation(String line) {
        int count = 0;
        while (count < line.length() && (line.charAt(count) == ' ' || line.charAt(count) == '\t'))
            count++;
        return count;
    }

    static final class Owner {
        final boolean success;
        final String id;
        final int userId;
        final String message;
        Owner(boolean success, String id, int userId, String message) {
            this.success = success;
            this.id = id;
            this.userId = userId;
            this.message = message;
        }
        static Owner failure(String message) { return new Owner(false, "", -1, message); }
    }

    static final class Snapshot {
        final boolean success;
        final String message;
        final long userSerial;
        final String packageIdentity;
        final String observedState;
        Snapshot(boolean success, String message, long serial, String identity) {
            this(success, message, serial, identity, "ERROR");
        }
        Snapshot(boolean success, String message, long serial, String identity, String state) {
            this.success = success;
            this.message = message;
            this.userSerial = serial;
            this.packageIdentity = identity;
            this.observedState = state;
        }
        static Snapshot failure(String message) { return new Snapshot(false, message, -1, UNKNOWN); }
    }
}
