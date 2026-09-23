package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Framed, filtered package dumps. One dump covers every selected user of a package. */
final class HidePackageSnapshot {
    private static final Pattern PACKAGE = Pattern.compile("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+");
    private static final Pattern USER = Pattern.compile("^\\s*User (\\d+):\\s*(.*)$");
    private static final Pattern INSTALLED = Pattern.compile("(?:^|\\s)installed=(true|false)(?:\\s|$)");
    private static final Pattern HIDDEN = Pattern.compile("(?:^|\\s)hidden=(true|false)(?:\\s|$)");
    private HidePackageSnapshot() { }

    static String command(Set<String> packages) {
        StringBuilder script = new StringBuilder();
        for (String pkg : packages) {
            if (pkg == null || pkg.length() > 255 || !PACKAGE.matcher(pkg).matches())
                throw new IllegalArgumentException("Invalid package");
            // Large package dumps can exceed exec's single-argument limit. Stream
            // directly into the filter and retain dumpsys' status inside the frame.
            script.append("printf '\\nLSA_BEGIN:").append(pkg).append(":STREAM\\n'; { ")
                    .append("/system/bin/dumpsys package '").append(pkg)
                    .append("' 2>&1; rc=$?; printf '\\nLSA_DUMP_RC:%s\\n' \"$rc\"; } | ")
                    .append("/system/bin/grep -E '^[[:space:]]*User [0-9]+:|^Queries:|Unable to find package:|^LSA_DUMP_RC:'; ")
                    .append("printf 'LSA_END:").append(pkg).append("\\n';\n");
        }
        return script.append("exit 0\n").toString();
    }

    static Map<String, PackageState> parse(String output, Set<String> packages) {
        Map<String, PackageState> states = new LinkedHashMap<>();
        String active = null;
        boolean queries = false;
        boolean streaming = false, completed = false;
        PackageState current = null;
        for (String line : output.split("\\r?\\n")) {
            if (line.startsWith("LSA_BEGIN:")) {
                String[] fields = line.split(":", -1);
                active = fields.length == 3 && packages.contains(fields[1]) ? fields[1] : null;
                streaming = active != null && "STREAM".equals(fields[2]);
                completed = false;
                current = active == null ? null : new PackageState(streaming || "0".equals(fields[2]));
                queries = false;
            } else if (active != null && line.equals("LSA_END:" + active)) {
                if (streaming && !completed) current.valid = false;
                if (states.containsKey(active)) current.valid = false;
                states.put(active, current);
                active = null;
                current = null;
            } else if (current != null) {
                if (line.startsWith("LSA_DUMP_RC:")) {
                    if (!streaming || completed || !line.equals("LSA_DUMP_RC:0")) current.valid = false;
                    completed = true;
                    continue;
                }
                if (completed && !line.trim().isEmpty()) { current.valid = false; continue; }
                if (line.equals("Queries:")) { queries = true; continue; }
                if (queries) continue;
                if (line.trim().equals("Unable to find package: " + active)) current.missing = true;
                Matcher user = USER.matcher(line);
                if (!user.matches()) continue;
                try {
                    int id = Integer.parseInt(user.group(1));
                    Matcher installed = INSTALLED.matcher(user.group(2));
                    Matcher hidden = HIDDEN.matcher(user.group(2));
                    HideBatchExecutor.State state = HideBatchExecutor.State.ERROR;
                    if (installed.find()) {
                        if (installed.group(1).equals("false")) state = HideBatchExecutor.State.MISSING;
                        else if (hidden.find()) state = hidden.group(1).equals("true")
                                ? HideBatchExecutor.State.HIDDEN : HideBatchExecutor.State.VISIBLE;
                    }
                    if (current.users.containsKey(id)) state = HideBatchExecutor.State.ERROR;
                    current.users.put(id, state);
                } catch (NumberFormatException ignored) { current.valid = false; }
            }
        }
        return states;
    }

    static final class PackageState {
        boolean valid;
        boolean missing;
        final Map<Integer, HideBatchExecutor.State> users = new LinkedHashMap<>();
        PackageState(boolean valid) { this.valid = valid; }
        HideBatchExecutor.State user(int id) {
            if (!valid || (missing && !users.isEmpty())) return HideBatchExecutor.State.ERROR;
            if (missing) return HideBatchExecutor.State.MISSING;
            // No recognizable package state includes denied/unsupported dumps, never success.
            if (users.isEmpty()) return HideBatchExecutor.State.ERROR;
            return users.getOrDefault(id, HideBatchExecutor.State.MISSING);
        }
    }
}
