package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

/** Shared configuration and bounded, content-free evidence for the global gesture entry. */
public final class AtomicWorkbenchConfig {
    public static final String ENABLED = "atomic_workbench_enabled";
    public static final String SHOW_MEDIA = "atomic_workbench_show_media";
    public static final String QUICK_OPEN_APPS = "atomic_workbench_quick_open_apps";
    public static final String EMPTY_SIDE_SLOTS = "atomic_workbench_empty_side_slots";
    public static final String SIDE_COUNT = "atomic_workbench_side_count";
    public static final String TRIGGER_AREA_SCALE = "atomic_workbench_trigger_area_scale";
    public static final String CORNER_SENSITIVITY = "atomic_workbench_corner_sensitivity";
    public static final String READY = "ls_augment_atomic_workbench_gesture_ready";
    public static final String RUNTIME = "ls_augment_atomic_workbench_gesture_runtime";
    public static final String EXTRA_ENTRY = "atomic_workbench_entry";
    public static final String EXTRA_SIDE = "atomic_workbench_side";
    public static final String EXTRA_TASK_ID = "atomic_workbench_task_id";
    public static final String EXTRA_COMPONENT = "atomic_workbench_component";
    public static final String EXTRA_CONFIG_REVISION = "atomic_workbench_config_revision";
    public static final String EXTRA_CONFIG_CHECKSUM = "atomic_workbench_config_checksum";
    public static final String EXTRA_TRIGGER_ELAPSED = "atomic_workbench_trigger_elapsed";
    public static final String EXTRA_ENTRY_BUILD = "atomic_workbench_entry_build";
    public static final long READY_MAX_AGE_MS = 45_000L;
    public static final long REQUEST_MAX_AGE_MS = 3_000L;
    private AtomicWorkbenchConfig() { }

    /** A queued gesture belongs to one enabled configuration and a short monotonic-time window. */
    public static boolean requestCurrent(long requestedRevision, long currentRevision, boolean enabled,
            long triggeredElapsed, long nowElapsed, int entryBuild, int installedBuild) {
        return enabled && requestedRevision > 0 && requestedRevision == currentRevision
                && entryBuild > 0 && entryBuild == installedBuild && triggeredElapsed >= 0
                && nowElapsed >= triggeredElapsed && nowElapsed - triggeredElapsed <= REQUEST_MAX_AGE_MS;
    }

    /** Checksum also distinguishes reset generations when a revision could otherwise be repeated. */
    public static boolean requestCurrent(long requestedRevision, String requestedChecksum,
            long currentRevision, String currentChecksum, boolean enabled,
            long triggeredElapsed, long nowElapsed, int entryBuild, int installedBuild) {
        return requestedChecksum != null && requestedChecksum.matches("[0-9a-f]{64}")
                && requestedChecksum.equals(currentChecksum)
                && requestCurrent(requestedRevision, currentRevision, enabled, triggeredElapsed, nowElapsed,
                        entryBuild, installedBuild);
    }

    public static String evidence(boolean ready, int version, int pid, int boot, long elapsed, String reason) {
        String safeReason = reason == null ? "" : reason.replace(';', ' ').replace('\r', ' ').replace('\n', ' ');
        if (safeReason.length() > 140) safeReason = safeReason.substring(0, 140);
        return "v=1;ready=" + (ready ? "1" : "0") + ";build=" + version + ";pid=" + pid
                + ";boot=" + boot + ";elapsed=" + elapsed + ";reason=" + safeReason;
    }

    /** Empty means a current hook and its configuration bridge have actually reported ready. */
    public static String readinessProblem(String raw, int build, int boot, int expectedPid, long nowElapsed) {
        try {
            if (raw == null || raw.length() > 512) return "未收到全局手势接入状态";
            Map<String, String> fields = new LinkedHashMap<>();
            for (String item : raw.split(";", -1)) {
                int equals = item.indexOf('=');
                if (equals <= 0 || fields.put(item.substring(0, equals), item.substring(equals + 1)) != null)
                    return "全局手势接入状态无效";
            }
            if (!"1".equals(fields.get("v")) || fields.size() != 7) return "未收到全局手势接入状态";
            if (Integer.parseInt(fields.get("build")) != build) return "系统框架尚未加载当前模块版本，请重启手机";
            int pid = Integer.parseInt(fields.get("pid"));
            if (pid <= 0 || expectedPid > 0 && pid != expectedPid) return "系统框架进程已变化，请重新检查";
            if (boot < 0 || Integer.parseInt(fields.get("boot")) != boot) return "全局手势状态不属于本次开机";
            long observed = Long.parseLong(fields.get("elapsed"));
            if (observed < 0 || nowElapsed < observed || nowElapsed - observed > READY_MAX_AGE_MS)
                return "全局手势接入状态已过期，请检查系统框架作用域";
            if (!"1".equals(fields.get("ready"))) {
                String reason = fields.get("reason");
                return reason == null || reason.isEmpty() ? "全局手势尚未就绪" : reason;
            }
            return "";
        } catch (RuntimeException invalid) { return "未收到有效的全局手势接入状态"; }
    }
}
