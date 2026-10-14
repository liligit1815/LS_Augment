package ls.augment.com;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/** Read-only activation gate for the actual system listener, independent of its enabled setting. */
final class HideAutomationReadiness {
    private static final long CLOCK_TOLERANCE_MS = 3_000L;
    private static final String RUNTIME_KEY = "ls_augment_automation_runtime";

    private HideAutomationReadiness() { }

    static final class Result {
        final boolean ready, needsScope;
        final String reason, message;
        private Result(boolean ready, boolean needsScope, String reason, String message) {
            this.ready=ready; this.needsScope=needsScope; this.reason=reason; this.message=message;
        }
        private static Result blocked(String reason, String message) {
            return new Result(false, false, reason, message);
        }
    }

    static Result inspect(boolean connected, Collection<String> actualScope, String expectedVersion,
            Map<String,?> diagnostics, int bootCount, long now, long elapsedRealtime) {
        if (!connected) return new Result(false, true, "framework_disconnected",
                "框架未连接，请在 LSPosed 中启用模块后返回重试");
        // ModuleScopeService canonicalizes Android's framework package to the public service's system name.
        if (actualScope==null || !actualScope.contains("system") && !actualScope.contains("android"))
            return new Result(false, true, "system_scope_missing",
                    "需要勾选系统框架作用域，并重启手机加载监听");
        if (bootCount<0 || now<=0 || elapsedRealtime<0 || elapsedRealtime>now)
            return Result.blocked("boot_unavailable", "当前启动信息无法核验，请重新检查运行条件");

        Map<String,String> heartbeat=heartbeat(diagnostics==null?null:diagnostics.get(RUNTIME_KEY));
        if (heartbeat==null) return Result.blocked("listener_unreported",
                "尚未收到锁屏监听握手，请重启手机后返回重试");
        if (expectedVersion==null || expectedVersion.isEmpty() || !expectedVersion.equals(heartbeat.get("version")))
            return Result.blocked("listener_version_mismatch",
                    "锁屏监听尚未加载当前版本，请重启手机后返回重试");
        if (!"system_server".equals(heartbeat.get("listener")))
            return Result.blocked("listener_invalid", "锁屏监听来源无法核验，请重启手机后返回重试");
        long pid=positive(heartbeat.get("pid")), observedAt=positive(heartbeat.get("time"));
        if (pid<=0 || !currentBootTime(observedAt,now,elapsedRealtime))
            return Result.blocked("listener_stale", "锁屏监听握手不属于当前启动，请重启手机后返回重试");

        AutomationDiagnosticState.State owner=AutomationDiagnosticState.State.read(diagnostics);
        if (owner.ownerBoot!=bootCount || owner.sequence<=0
                || !currentBootTime(owner.observedAt,now,elapsedRealtime))
            return Result.blocked("owner_stale", "尚未确认当前启动的锁屏监听，请重启手机后返回重试");
        String[] session=owner.session.split(":",-1);
        if (session.length!=2 || positive(session[0])!=pid || positive(session[1])<=0
                || positive(session[1])>elapsedRealtime+CLOCK_TOLERANCE_MS
                || owner.observedAt+CLOCK_TOLERANCE_MS<observedAt)
            return Result.blocked("owner_mismatch", "锁屏监听握手与当前状态不一致，请重新检查运行条件");
        if (!"READY".equals(owner.bridge) || !owner.bridgeError.isEmpty())
            return Result.blocked("bridge_"+owner.bridge.toLowerCase(java.util.Locale.ROOT), bridgeMessage(owner.bridge));
        // A registered listener with a verified snapshot reports runtime=disabled before any user enables it.
        // Neither enabled=true nor screen-off execution is a prerequisite for first-time activation.
        return new Result(true, false, "ready", "锁屏监听已就绪");
    }

    private static boolean currentBootTime(long observedAt,long now,long elapsedRealtime) {
        return observedAt>0 && observedAt>=now-elapsedRealtime-CLOCK_TOLERANCE_MS
                && observedAt<=now+CLOCK_TOLERANCE_MS;
    }

    private static Map<String,String> heartbeat(Object value) {
        if (!(value instanceof String) || ((String)value).length()>1000) return null;
        Map<String,String> fields=new LinkedHashMap<>();
        for (String part:((String)value).split(";",-1)) {
            if (part.isEmpty()) continue;
            int separator=part.indexOf('=');
            if (separator<=0 || fields.put(part.substring(0,separator),part.substring(separator+1))!=null) return null;
        }
        return fields.isEmpty()?null:fields;
    }

    private static long positive(String value) {
        if (value==null || !value.matches("[0-9]{1,19}")) return -1;
        try { long parsed=Long.parseLong(value); return parsed>0?parsed:-1; }
        catch (NumberFormatException invalid) { return -1; }
    }

    private static String bridgeMessage(String bridge) {
        if ("WAITING_FOR_UNLOCK".equals(bridge)) return "请先解锁手机，再重新检查锁屏监听";
        if (bridge.startsWith("WAITING_FOR_")) return "系统服务仍在启动，请稍候重新检查锁屏监听";
        if ("LISTENER_FAILED".equals(bridge)) return "锁屏监听注册未完成，请重启手机后返回重试";
        return "锁屏监听暂时无法读取模块配置，请重新检查运行条件";
    }
}
