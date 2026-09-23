package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import java.lang.reflect.Method;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/** Fixed disposable targets only; times the production batch and its final publication. */
final class HidePerformanceDeviceCases {
    static JSONObject run(Context context, Bundle args) throws Exception {
        RootHideManager.ACTION_LOCK.lock();
        try {
            RootHideManager manager = new RootHideManager(context);
            require(manager.rootStatus().state == RootHideManager.RootState.GRANTED, "Root unavailable");
            Set<RootHideManager.Target> configured = manager.targets();
            Map<String, String> config = new AppConfig(context).snapshot();
            JSONObject report = new JSONObject();
            if ("true".equals(args.getString("transportChecks"))) {
                JSONArray quick = new JSONArray();
                for (int i=0;i<6;i++) {
                    long start=SystemClock.elapsedRealtime();
                    require(RootShell.run("exit 0",null,5,1024).isSuccess(),"Root exit failed");
                    quick.put(SystemClock.elapsedRealtime()-start);
                }
                String value="空间 999：应用配置\n".repeat(10000);
                RootShell.Result echo=RootShell.runProcess(new ProcessBuilder("/system/bin/cat").redirectErrorStream(true),value,5,512*1024,null);
                require(echo.isSuccess()&&echo.capture.reliable()&&echo.capture.text().equals(value),"UTF-8 input/output changed");
                RootShell.Result denied=RootShell.runProcess(new ProcessBuilder("/system/bin/sh","-c","printf denied; exit 7").redirectErrorStream(true),null,5,1024,null);
                require(denied.exitCode==7&&!denied.isSuccess()&&denied.output.equals("denied"),"Failed exit lost");
                RootShell.Result large=RootShell.runProcess(new ProcessBuilder("/system/bin/head","-c","4096","/dev/zero").redirectErrorStream(true),null,5,1024,null);
                require(large.isSuccess()&&large.capture.truncated&&!large.capture.reliable(),"Truncated output accepted as complete");
                long start=SystemClock.elapsedRealtime();
                RootShell.Result blocked=RootShell.runProcess(new ProcessBuilder("/system/bin/sleep","10").redirectErrorStream(true),"x".repeat(1024*1024),1,1024,null);
                long timeoutMs=SystemClock.elapsedRealtime()-start;
                require(blocked.timedOut&&timeoutMs<3500,"Blocked input escaped deadline");
                return report.put("rootCommandMs",quick).put("blockedInputTimeoutMs",timeoutMs)
                        .put("utf8ExitFailureOutputLimitVerified",true);
            }
            if ("true".equals(args.getString("transportTiming"))) {
                JSONArray timed = new JSONArray(), signaled = new JSONArray();
                java.util.concurrent.ExecutorService waiter = java.util.concurrent.Executors.newSingleThreadExecutor();
                try {
                    for (int i=0;i<6;i++) {
                        for (boolean polling : new boolean[]{true,false}) {
                            long start = SystemClock.elapsedRealtime();
                            Process process = new ProcessBuilder("/system/bin/su", "-c", "exit 0").start();
                            try {
                                if (polling) require(process.waitFor(5, java.util.concurrent.TimeUnit.SECONDS), "Timed wait failed");
                                else require(waiter.submit(() -> process.waitFor()).get(5, java.util.concurrent.TimeUnit.SECONDS)==0,"Signaled wait failed");
                                (polling ? timed : signaled).put(SystemClock.elapsedRealtime()-start);
                            } finally { process.destroy(); }
                        }
                    }
                } finally { waiter.shutdownNow(); }
                return report.put("timedWaitMs",timed).put("signaledWaitMs",signaled);
            }
            if ("true".equals(args.getString("readOnly"))) {
                JSONArray times = new JSONArray();
                for (RootHideManager.Target target : configured) {
                    long start = SystemClock.elapsedRealtime();
                    HideRecoveryIdentity.Snapshot identity = HideRecoveryIdentity.read(context, target);
                    long identityMs = SystemClock.elapsedRealtime() - start;
                    start = SystemClock.elapsedRealtime();
                    RootHideManager.State state = manager.queryState(target);
                    require(identity.observedState.equals(state.name()), "Combined snapshot state differs");
                    times.put(new JSONObject().put("target", target.toString()).put("identityMs", identityMs)
                            .put("stateMs", SystemClock.elapsedRealtime() - start).put("state", state.name())
                            .put("identityKnown", identity.success && !"unknown".equals(identity.packageIdentity)));
                }
                long start = SystemClock.elapsedRealtime();
                require(manager.syncMirrors().success, "Mirror refresh failed");
                return report.put("readOnly", times).put("syncMs", SystemClock.elapsedRealtime() - start);
            }
            String action = args.getString("action", "");
            require(action.equals("hide") || action.equals("show"), "Explicit hide/show required");
            Set<RootHideManager.Target> fixtures = new LinkedHashSet<>();
            fixtures.add(new RootHideManager.Target(0, 0, "ls.augment.txvictim"));
            fixtures.add(new RootHideManager.Target(999, 10, "ls.augment.txvictim"));
            require(java.util.Collections.disjoint(fixtures, configured), "Fixture must not replace user selection");
            boolean noop = "true".equals(args.getString("noop"));
            RootHideManager.State desired = action.equals("hide") ? RootHideManager.State.HIDDEN : RootHideManager.State.VISIBLE;
            RootHideManager.State initial = noop ? desired : action.equals("hide") ? RootHideManager.State.VISIBLE : RootHideManager.State.HIDDEN;
            for (RootHideManager.Target target : fixtures) {
                require(manager.currentTargetProblem(target).isEmpty(), "Fixture identity invalid");
                require(manager.queryState(target) == initial, "Fixture initial state mismatch");
            }
            Map<RootHideManager.Target, RootHideManager.State> userStates = manager.queryStates(configured);
            require(manager.syncMirrors().success, "Baseline mirror failed");
            Method batch = RootHideManager.class.getDeclaredMethod("executeBatch", Set.class, boolean.class);
            batch.setAccessible(true);
            long start = SystemClock.elapsedRealtime();
            @SuppressWarnings("unchecked") HideBatchExecutor.Outcome<RootHideManager.Target> result =
                    (HideBatchExecutor.Outcome<RootHideManager.Target>) batch.invoke(manager, fixtures, action.equals("hide"));
            long batchMs = SystemClock.elapsedRealtime() - start;
            start = SystemClock.elapsedRealtime();
            RootHideManager.OperationResult sync = manager.syncMirrors();
            long syncMs = SystemClock.elapsedRealtime() - start;
            require(result.success.size() == 2 && result.failures.isEmpty(), "Batch failed: " + result.failures);
            require(sync.success, "Final mirror failed");
            for (RootHideManager.Target target : fixtures)
                require(manager.queryState(target) == (action.equals("hide") ? RootHideManager.State.HIDDEN : RootHideManager.State.VISIBLE), "Final state mismatch");
            require(userStates.equals(manager.queryStates(configured)), "User application state changed");
            require(manager.refreshTargets().success && configured.equals(manager.targets()), "Selection changed");
            require(config.equals(new AppConfig(context).snapshot()), "Configuration changed");
            return report.put("success", true).put("action", action).put("noop", noop).put("targets", 2)
                    .put("batchMs", batchMs).put("syncMs", syncMs).put("totalMs", batchMs + syncMs)
                    .put("userStateAndConfigurationPreserved", true);
        } finally { RootHideManager.ACTION_LOCK.unlock(); }
    }
    private static void require(boolean valid, String message) { if (!valid) throw new AssertionError(message); }
}
