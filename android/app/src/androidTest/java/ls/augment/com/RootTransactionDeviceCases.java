package ls.augment.com;

import android.content.Context;
import android.os.Bundle;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Temporary instrumentation-only fixture. Calls the same production backend as
 * the application's controls; this is not a visual button-click test.
 * No arbitrary package, shell command, unhide or recovery-log deletion is exposed.
 */
final class RootTransactionDeviceCases {
    private static final String PACKAGE = "ls.augment.txvictim";

    private RootTransactionDeviceCases() { }

    static JSONObject run(Context context, Bundle arguments) throws Exception {
        JSONObject report = new JSONObject().put("success", false)
                .put("package", PACKAGE).put("moduleVersion", BuildConfig.VERSION_CODE)
                .put("moduleVersionName", BuildConfig.VERSION_NAME)
                .put("entryType", "TEST_APK_PRODUCTION_BACKEND_NOT_VISUAL_CLICK")
                .put("backendCalled", false);
        String action = arguments.getString("action", "");
        report.put("action", action);
        try {
            if (!"configure".equals(action) && !"hide".equals(action)
                    && !"snapshot".equals(action) && !"restore-config".equals(action))
                throw new IllegalArgumentException("Unknown fixture action");
            if (arguments.containsKey("package") && !PACKAGE.equals(arguments.getString("package")))
                throw new IllegalArgumentException("Only the fixed fixture package is permitted");

            RootHideManager.Target first = target(arguments, "userId", "expectedSerial");
            boolean hasSecond = arguments.containsKey("secondUserId")
                    || arguments.containsKey("secondExpectedSerial");
            if (!"hide".equals(action) && !hasSecond)
                throw new IllegalArgumentException("This action requires two explicit user instances");
            Set<RootHideManager.Target> requested = new LinkedHashSet<>();
            requested.add(first);
            if (hasSecond) {
                RootHideManager.Target second = target(arguments, "secondUserId", "secondExpectedSerial");
                if (first.userId == second.userId)
                    throw new IllegalArgumentException("The two user IDs must be different");
                requested.add(second);
            }
            report.put("requested", targetValues(requested));

            // Production operations use the same reentrant action lock. This
            // orders baseline checks with manager calls, not with user lifecycle.
            RootHideManager.ACTION_LOCK.lock();
            try {
                requireCurrent(context, requested);
                AppConfig config = new AppConfig(context);
                RootHideManager manager = new RootHideManager(context);
                switch (action) {
                    case "configure": {
                        requireEmptyBaseline(config);
                        report.put("backendCalled", true);
                        RootHideManager.OperationResult result = manager.saveTargets(requested, switches(true));
                        report.put("backend", operation(result));
                        boolean persisted = exactSelection(config, requested)
                                && "1".equals(config.get(AppConfig.HIDE_MASTER))
                                && "0".equals(config.get(AppConfig.AUTOMATION_ENABLED));
                        report.put("configurationMatches", persisted);
                        report.put("success", result.success && result.runtimeSynced && persisted);
                        break;
                    }
                    case "hide": {
                        requireFixtureSelection(config, requested, false);
                        if (!manager.targets().contains(first))
                            throw new IllegalStateException("The exact requested instance is not selected");
                        if (!"1".equals(config.get(AppConfig.HIDE_MASTER))
                                || !"0".equals(config.get(AppConfig.AUTOMATION_ENABLED)))
                            throw new IllegalStateException("Fixture requires master enabled and automation disabled");
                        // One call only. NOT_READY, UNKNOWN and transport failures
                        // are reported as returned; this entry never retries hide.
                        report.put("backendCalled", true);
                        RootHideManager.OperationResult result = manager.hide(first);
                        report.put("backend", operation(result));
                        RootHideManager.State state = manager.queryState(first);
                        report.put("state", state.name());
                        report.put("success", result.success && result.runtimeSynced
                                && state == RootHideManager.State.HIDDEN);
                        break;
                    }
                    case "snapshot":
                        report.put("success", true);
                        break;
                    case "restore-config": {
                        requireFixtureSelection(config, requested, true);
                        report.put("backendCalled", true);
                        RootHideManager.OperationResult result = manager.saveTargets(
                                Collections.emptySet(), switches(false));
                        report.put("backend", operation(result));
                        boolean restored = config.get(AppConfig.HIDE_TARGETS).isEmpty()
                                && "0".equals(config.get(AppConfig.HIDE_MASTER))
                                && "0".equals(config.get(AppConfig.AUTOMATION_ENABLED));
                        report.put("configurationMatches", restored)
                                .put("systemHiddenStateRestored", false)
                                .put("rootHistoryDeleted", false);
                        report.put("success", result.success && result.runtimeSynced && restored);
                        break;
                    }
                    default:
                        throw new AssertionError("Validated action missing");
                }
                // Only these explicitly supplied fixture targets are queried or
                // exported. Snapshot does not enumerate unrelated configuration.
                JSONArray states = new JSONArray();
                boolean readable = true;
                for (RootHideManager.Target target : requested) {
                    HideUserIdentity.Snapshot identity = HideUserIdentity.match(
                            context, target.userId, target.userSerial);
                    RootHideManager.State state = identity.success
                            ? manager.queryState(target) : RootHideManager.State.ERROR;
                    states.put(targetValue(target).put("identityMatched", identity.success)
                            .put("observedSerial", identity.userSerial)
                            .put("identityMessage", identity.message).put("state", state.name()));
                    readable &= identity.success && state != RootHideManager.State.ERROR;
                }
                report.put("targets", states).put("postIdentityAndStateReadable", readable);
                if (!readable) report.put("success", false);
            } finally {
                RootHideManager.ACTION_LOCK.unlock();
            }
        } catch (Exception failure) {
            // Keep a machine-readable failure artifact even when a precondition
            // is rejected or the backend reports an unavailable environment.
            report.put("success", false).put("errorType", failure.getClass().getName())
                    .put("error", String.valueOf(failure.getMessage()));
        }
        return report;
    }

    private static RootHideManager.Target target(Bundle args, String userKey, String serialKey) {
        long user = number(args, userKey, 99999);
        long serial = number(args, serialKey, Integer.MAX_VALUE);
        return new RootHideManager.Target((int) user, serial, PACKAGE);
    }

    private static long number(Bundle args, String key, long maximum) {
        String value = args.getString(key);
        if (value == null || !value.matches("0|[1-9][0-9]*"))
            throw new IllegalArgumentException("Explicit canonical numeric argument required: " + key);
        try {
            long parsed = Long.parseLong(value);
            if (parsed > maximum) throw new IllegalArgumentException("Argument out of range: " + key);
            return parsed;
        } catch (NumberFormatException invalid) {
            throw new IllegalArgumentException("Argument out of range: " + key, invalid);
        }
    }

    private static void requireCurrent(Context context, Set<RootHideManager.Target> requested) {
        for (RootHideManager.Target target : requested) {
            HideUserIdentity.Snapshot identity = HideUserIdentity.match(
                    context, target.userId, target.userSerial);
            if (!identity.success)
                throw new IllegalStateException("User instance verification failed for "
                        + target.userId + ": " + identity.message);
        }
    }

    private static void requireEmptyBaseline(AppConfig config) {
        String raw = config.get(AppConfig.HIDE_TARGETS);
        if (!raw.isEmpty() || !HideTargetCodec.parse(raw).valid
                || !"0".equals(config.get(AppConfig.HIDE_MASTER))
                || !"0".equals(config.get(AppConfig.AUTOMATION_ENABLED)))
            throw new IllegalStateException("Configure requires exact empty selection, master 0 and automation 0");
    }

    private static void requireFixtureSelection(AppConfig config,
            Set<RootHideManager.Target> requested, boolean requireAllInstances) {
        HideTargetCodec.Selection selection = HideTargetCodec.parse(config.get(AppConfig.HIDE_TARGETS));
        if (!selection.valid) throw new IllegalStateException("Invalid selection is preserved");
        for (HideTargetCodec.Entry entry : selection.entries) {
            if (!PACKAGE.equals(entry.packageName) || !entry.isBound())
                throw new IllegalStateException("Selection must contain only confirmed fixture targets");
            if (requireAllInstances && !requested.contains(entry))
                throw new IllegalStateException("Restore requires explicit identities for every selected fixture target");
        }
    }

    private static boolean exactSelection(AppConfig config, Set<RootHideManager.Target> requested) {
        HideTargetCodec.Selection selection = HideTargetCodec.parse(config.get(AppConfig.HIDE_TARGETS));
        return selection.valid && new LinkedHashSet<>(selection.entries).equals(requested);
    }

    private static Map<String, String> switches(boolean enabled) {
        Map<String, String> settings = new LinkedHashMap<>();
        settings.put(AppConfig.HIDE_MASTER, enabled ? "1" : "0");
        settings.put(AppConfig.AUTOMATION_ENABLED, "0");
        return settings;
    }

    private static JSONObject operation(RootHideManager.OperationResult result) throws Exception {
        return new JSONObject().put("success", result.success).put("message", result.message)
                .put("runtimeSynced", result.runtimeSynced).put("reviewRequired", result.reviewRequired);
    }

    private static JSONArray targetValues(Set<RootHideManager.Target> requested) throws Exception {
        JSONArray result = new JSONArray();
        for (RootHideManager.Target target : requested) result.put(targetValue(target));
        return result;
    }

    private static JSONObject targetValue(RootHideManager.Target target) throws Exception {
        return new JSONObject().put("userId", target.userId).put("expectedSerial", target.userSerial)
                .put("package", PACKAGE);
    }
}
