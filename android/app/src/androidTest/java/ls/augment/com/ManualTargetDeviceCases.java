package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test APK only: explicit current commands for one fixed disposable package, never lifecycle cleanup. */
final class ManualTargetDeviceCases {
    private static final String PACKAGE = "ls.augment.txvictim";
    private ManualTargetDeviceCases() { }

    static JSONObject run(Context context, Bundle args) throws Exception {
        JSONObject report = new JSONObject().put("success", false).put("package", PACKAGE)
                .put("entryType", "TEST_APK_ACTUAL_CONTROLLER_NOT_VISUAL_CLICK")
                .put("moduleVersion", BuildConfig.VERSION_CODE).put("fingerprint", Build.FINGERPRINT)
                .put("sdk", Build.VERSION.SDK_INT).put("release", Build.VERSION.RELEASE)
                .put("controllerHideCalls", 0).put("controllerShowCalls", 0)
                .put("controllerPreviewCalls", 0).put("statusCalls", 0)
                .put("callCountersScope", "DIRECT_FIXTURE_API_INVOCATIONS_NOT_NATIVE_HOOK_COUNTS")
                .put("hideMasterChangedByFixture", false).put("automaticShow", false)
                .put("visualClicks", 0).put("historyDeleted", false);
        SharedPreferences raw = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, ?> rawBefore = new LinkedHashMap<>(raw.getAll());
        RootHideManager.ACTION_LOCK.lock();
        try {
            String action = args.getString("action", "");
            report.put("action", action);
            require(List.of("snapshot", "select", "hide", "preview", "cancel", "show", "unselect",
                    "serial-reject", "status-only").contains(action), "Unknown fixed fixture action");
            require(!args.containsKey("package") || PACKAGE.equals(args.getString("package")),
                    "Only the fixed disposable package is allowed");
            RootHideManager.Target target = target(args, "userId", "expectedSerial");
            RootHideManager.Target other = target(args, "secondUserId", "secondExpectedSerial");
            require(target.userId != other.userId && (target.userId == 0 || target.userId == 999)
                    && (other.userId == 0 || other.userId == 999), "Explicit users must be exactly 0 and 999");
            report.put("userId", target.userId).put("expectedSerial", target.userSerial)
                    .put("secondUserId", other.userId).put("secondExpectedSerial", other.userSerial);
            // AppConfig construction can initialize an old installation. Require an already initialized app.
            require(Boolean.TRUE.equals(rawBefore.get("approved_ui_migration_v1"))
                    && Boolean.TRUE.equals(rawBefore.get("freeform_independent_migration_v1"))
                    && Boolean.TRUE.equals(rawBefore.get("private_initialized_v2"))
                    && positiveLong(rawBefore.get("snapshot_revision_v1"))
                    && positiveLong(rawBefore.get("snapshot_updated_at_v1")),
                    "Fixture requires initialized app preferences; it does not initialize configuration");
            AppConfig config = new AppConfig(context);
            Map<String, String> configBefore = config.snapshot();
            report.put("hideMasterBefore", config.get(AppConfig.HIDE_MASTER));
            RootShell.Result root = RootShell.run("printf 'ROOT|'; id -u; printf 'BOOT|'; "
                    + "cat /proc/sys/kernel/random/boot_id; printf 'SYSTEM_SERVER|'; pidof system_server", null, 8, 4096);
            report.put("rootProbe", shell(root));
            require(root.isSuccess() && root.capture != null && root.capture.reliable()
                    && root.output.startsWith("ROOT|0\n"), "Read-only Root probe failed");
            requireIdentity(context, target); requireIdentity(context, other);
            RootHideManager manager = new RootHideManager(context);
            HideTargetStore store = new HideTargetStore();
            Capture before = capture(manager, store, target, other);
            report.put("before", before.json);
            require(before.first != RootHideManager.State.ERROR && before.second != RootHideManager.State.ERROR,
                    "Both exact fixture states must be readable");
            Capture[] comparison = {before};
            try {
                if ("snapshot".equals(action)) {
                    report.put("readOnly", true);
                    require(before.read.status == HideTargetStore.ReadStatus.OK
                            || before.read.status == HideTargetStore.ReadStatus.ABSENT,
                            "Independent document is unavailable or corrupt; original data is retained");
                } else if ("select".equals(action) || "unselect".equals(action)) {
                    if ("unselect".equals(action)) require(before.read.status == HideTargetStore.ReadStatus.OK
                            && find(before.read, target) != null, "Unselect requires an existing retained target record");
                    RootHideManager.OperationResult refreshed = manager.refreshTargets();
                    report.put("refresh", operation(refreshed)); require(refreshed.success, "Selection read failed");
                    comparison[0] = capture(manager, store, target, other);
                    report.put("selectionBaseline", comparison[0].json);
                    require(comparison[0].read.status == HideTargetStore.ReadStatus.OK, "Selection document missing");
                    Set<RootHideManager.Target> selected = new LinkedHashSet<>(manager.targets());
                    if ("select".equals(action)) selected.add(target); else selected.remove(target);
                    RootHideManager.OperationResult result = manager.saveTargets(selected,
                            java.util.Collections.emptyMap(), comparison[0].read.snapshot.revision);
                    report.put("selection", operation(result)); require(result.success, "Selection save not confirmed");
                    HideTargetStore.Record updated = find(store.read(), target);
                    require(updated != null && updated.managed == "select".equals(action),
                            "Managed flag not read back; unselect must retain the record");
                    HideTargetStore.Record old = find(comparison[0].read, target);
                    if (old != null) require(sameIntentAndOperationExceptManaged(old, updated),
                            "Selection changed target identity, desired state, or existing operation");
                } else if ("status-only".equals(action)) {
                    require(before.read.status == HideTargetStore.ReadStatus.OK, "Original document unavailable");
                    HideTargetStore.Record saved = find(before.read, target);
                    require(saved != null && saved.bound && saved.lastOperation != null
                            && !saved.lastOperation.backendNonce.isEmpty(), "No original nonce exists to query");
                    HideTargetStore.LastOperation old = saved.lastOperation;
                    require(args.containsKey("expectedOperationId")
                            && old.id.equals(args.getString("expectedOperationId")), "Exact original operation ID required");
                    require(!args.containsKey("expectedBackendNonce")
                            || old.backendNonce.equals(args.getString("expectedBackendNonce")), "Original nonce mismatch");
                    report.put("statusOnly", true).put("originalOperationId", old.id)
                            .put("originalBackendNonce", old.backendNonce).put("originalOperationStatus", old.status.name());
                    HideManualClient client = new HideManualClient(request -> {
                        try { report.put("statusVerb", request.verb.name()).put("statusCommand", request.command()); }
                        catch (Exception impossible) { throw new IllegalStateException(impossible); }
                        RootShell.Result transport = RootShell.run(request.command(), null, 15, 1024);
                        try { report.put("statusTransport", shell(transport)); }
                        catch (Exception impossible) { throw new IllegalStateException(impossible); }
                        return transport;
                    });
                    report.put("statusCalls", 1);
                    HideRootProtocol.Reply reply = client.status(target,
                            old.action == HideTargetStore.Action.HIDE, old.backendNonce);
                    report.put("statusOutcome", reply == null ? "UNPARSED" : reply.outcome.name());
                    require(reply != null, "Original status response was not authenticated by the protocol parser");
                } else {
                    require(before.read.status == HideTargetStore.ReadStatus.OK,
                            "Initialize/select the independent document before testing commands or previews");
                    require(readable(before.first), "Current fixture must be installed");
                    HideTargetController controller = new HideTargetController(context, manager);
                    if ("hide".equals(action)) {
                        report.put("controllerHideCalls", 1);
                        RootHideManager.OperationResult result = controller.hide(target);
                        report.put("actionResult", operation(result)); require(result.success, "Current hide not confirmed");
                        requireSuccessfulRecord(store.read(), target, true);
                    } else {
                        RootHideManager.Target previewTarget = target;
                        if ("serial-reject".equals(action)) {
                            long wrongSerial = number(args, "wrongSerial", Long.MAX_VALUE);
                            require(wrongSerial != target.userSerial, "wrongSerial must differ from actual serial");
                            previewTarget = new RootHideManager.Target(target.userId, wrongSerial, PACKAGE);
                            report.put("wrongSerial", wrongSerial);
                        }
                        report.put("controllerPreviewCalls", 1);
                        HideTargetController.Preview preview = controller.preview(previewTarget);
                        report.put("preview", new JSONObject().put("success", preview.success).put("message", preview.message)
                                .put("state", preview.state == null ? JSONObject.NULL : preview.state.name()));
                        Capture afterPreview = capture(manager, store, target, other);
                        report.put("afterPreview", afterPreview.json);
                        require(sameDocument(before.read, afterPreview.read)
                                && before.first == afterPreview.first && before.second == afterPreview.second,
                                "Preview changed the document or either fixture state");
                        report.put("previewReadOnlyVerified", true);
                        try {
                            if ("serial-reject".equals(action)) {
                                require(!preview.success, "Wrong-serial preview unexpectedly accepted");
                            } else {
                                require(preview.success, "Current-target preview unavailable");
                                if ("show".equals(action)) {
                                    require("MANUAL_SHOW".equals(args.getString("confirm")), "Explicit simulated manual confirmation required");
                                    report.put("simulatedCurrentUserConfirmation", true).put("controllerShowCalls", 1);
                                    RootHideManager.OperationResult result = controller.show(preview);
                                    report.put("actionResult", operation(result)); require(result.success, "Current manual show not confirmed");
                                    requireSuccessfulRecord(store.read(), target, false);
                                } else {
                                    controller.cancel(preview);
                                    report.put("previewCanceled", true);
                                }
                                Capture beforeReplay = capture(manager, store, target, other);
                                report.put("beforeReplay", beforeReplay.json);
                                // This is the same canceled/consumed in-memory preview, never a fresh instruction.
                                int calls = report.getInt("controllerShowCalls") + 1;
                                report.put("controllerShowCalls", calls);
                                RootHideManager.OperationResult replay = controller.show(preview);
                                report.put("samePreviewRepeated", operation(replay));
                                require(!replay.success, "Canceled/consumed preview unexpectedly accepted");
                                Capture afterReplay = capture(manager, store, target, other);
                                report.put("afterReplay", afterReplay.json);
                                require(sameDocument(beforeReplay.read, afterReplay.read)
                                        && beforeReplay.first == afterReplay.first && beforeReplay.second == afterReplay.second,
                                        "Rejected preview reuse changed document/state");
                                report.put("reuseRejectedWithoutDocumentOrStateChange", true);
                            }
                        } finally { controller.cancel(preview); }
                    }
                }
                report.put("success", true);
            } finally {
                requireIdentity(context, target); requireIdentity(context, other);
                Capture after = capture(manager, store, target, other);
                report.put("after", after.json);
                Map<String, String> configAfter = config.snapshot();
                Map<String, String> unchangedBefore = new LinkedHashMap<>(configBefore);
                Map<String, String> unchangedAfter = new LinkedHashMap<>(configAfter);
                unchangedBefore.remove(AppConfig.HIDE_TARGETS); unchangedAfter.remove(AppConfig.HIDE_TARGETS);
                boolean selection = "select".equals(action) || "unselect".equals(action);
                boolean others = unrelated(comparison[0].read, target, false).equals(unrelated(after.read, target, false));
                boolean otherIntent = unrelated(comparison[0].read, target, true).equals(unrelated(after.read, target, true));
                report.put("otherUserStatePreserved", before.second == after.second)
                        .put("unrelatedRecordsPreserved", others)
                        .put("unrelatedIntentAndOperationsPreserved", otherIntent)
                        .put("observationRefreshAllowedForSelection", selection)
                        .put("settingsExceptSelectionPreserved", unchangedBefore.equals(unchangedAfter))
                        .put("configurationPreserved", configBefore.equals(configAfter))
                        .put("hideMasterAfter", config.get(AppConfig.HIDE_MASTER));
                require(before.second == after.second && (selection ? otherIntent : others)
                                && unchangedBefore.equals(unchangedAfter),
                        "Other user, unrelated record, or non-selection settings changed");
                if (selection) {
                    requireObservationIfChanged(find(comparison[0].read, target), find(after.read, target), after.first);
                    requireObservationIfChanged(find(comparison[0].read, other), find(after.read, other), after.second);
                }
                boolean mutation = "hide".equals(action) || "show".equals(action);
                RootHideManager.State expected = mutation && report.optBoolean("success")
                        ? ("hide".equals(action) ? RootHideManager.State.HIDDEN : RootHideManager.State.VISIBLE) : before.first;
                if (report.optBoolean("success")) require(after.first == expected, "Final current state differs from expected action");
                if (!mutation && !"select".equals(action) && !"unselect".equals(action))
                    require(sameDocument(before.read, after.read), "Read-only action changed document revision/operation");
            }
        } catch (Exception failure) {
            report.put("success", false).put("errorType", failure.getClass().getName())
                    .put("error", String.valueOf(failure.getMessage()));
        } finally {
            try {
                boolean rawPreserved = rawBefore.equals(raw.getAll());
                report.put("rawConfigurationPreservedFromEntry", rawPreserved);
                if ("snapshot".equals(args.getString("action")) && !rawPreserved)
                    report.put("success", false).put("error", "Read-only snapshot changed private configuration");
            } finally { RootHideManager.ACTION_LOCK.unlock(); }
        }
        return report;
    }

    private static final class Capture {
        final HideTargetStore.ReadResult read;
        final RootHideManager.State first, second;
        final JSONObject json;
        Capture(HideTargetStore.ReadResult read, RootHideManager.State first, RootHideManager.State second, JSONObject json) {
            this.read = read; this.first = first; this.second = second; this.json = json;
        }
    }
    private static Capture capture(RootHideManager manager, HideTargetStore store,
            RootHideManager.Target target, RootHideManager.Target other) throws Exception {
        HideTargetStore.ReadResult read = store.read();
        RootHideManager.State first = manager.queryState(target), second = manager.queryState(other);
        JSONObject document = new JSONObject().put("status", read.status.name()).put("error", read.error)
                .put("sha256", read.sha256).put("revision", read.snapshot == null ? -1 : read.snapshot.revision)
                .put("recordCount", read.snapshot == null ? -1 : read.snapshot.records.size());
        JSONArray states = new JSONArray();
        states.put(new JSONObject().put("userId", target.userId).put("serial", target.userSerial).put("state", first.name())
                .put("record", record(find(read, target))));
        states.put(new JSONObject().put("userId", other.userId).put("serial", other.userSerial).put("state", second.name())
                .put("record", record(find(read, other))));
        return new Capture(read, first, second, new JSONObject().put("document", document).put("states", states));
    }
    private static HideTargetStore.Record find(HideTargetStore.ReadResult read, RootHideManager.Target target) {
        return read.snapshot == null ? null : HideTargetController.find(read.snapshot, target);
    }
    private static Object record(HideTargetStore.Record value) throws Exception {
        if (value == null) return JSONObject.NULL;
        JSONObject result = new JSONObject().put("userId", value.userId).put("userSerial", value.userSerial)
                .put("packageName", value.packageName).put("bound", value.bound).put("managed", value.managed)
                .put("desiredHidden", value.desiredHidden == null ? JSONObject.NULL : value.desiredHidden)
                .put("observedState", value.observedState.name()).put("observedAt", value.observedAt);
        HideTargetStore.LastOperation op = value.lastOperation;
        return result.put("lastOperation", op == null ? JSONObject.NULL : new JSONObject().put("id", op.id)
                .put("revision", op.revision).put("action", op.action.name()).put("status", op.status.name())
                .put("error", op.error).put("backendNonce", op.backendNonce));
    }
    private static String canonical(HideTargetStore.Record value) {
        return value == null ? "" : new HideTargetStore.Snapshot(Long.MAX_VALUE, List.of(value)).encode();
    }
    private static boolean sameIntentAndOperationExceptManaged(HideTargetStore.Record before, HideTargetStore.Record after) {
        return canonical(before).equals(canonical(new HideTargetStore.Record(after.userId, after.userSerial,
                after.packageName, after.bound, before.managed, after.desiredHidden, before.observedState,
                before.observedAt, after.lastOperation)));
    }
    private static List<String> unrelated(HideTargetStore.ReadResult read, RootHideManager.Target target, boolean ignoreObservation) {
        List<String> result = new ArrayList<>();
        if (read.snapshot != null) for (HideTargetStore.Record row : read.snapshot.records)
            if (row.userId != target.userId || row.userSerial != target.userSerial || !PACKAGE.equals(row.packageName)) {
                HideTargetStore.Record compared = ignoreObservation ? new HideTargetStore.Record(row.userId,
                        row.userSerial, row.packageName, row.bound, row.managed, row.desiredHidden,
                        HideTargetStore.ObservedState.UNKNOWN, 0, row.lastOperation) : row;
                result.add(canonical(compared));
            }
        return result;
    }
    private static void requireObservationIfChanged(HideTargetStore.Record before, HideTargetStore.Record after,
            RootHideManager.State actual) {
        if (after != null && (before == null || before.observedState != after.observedState || before.observedAt != after.observedAt))
            require(after.observedState == HideTargetStore.ObservedState.valueOf(actual == RootHideManager.State.ERROR
                    ? "UNKNOWN" : actual.name()) && after.observedAt > 0,
                    "Refreshed fixture observation does not match current state");
    }
    private static boolean sameDocument(HideTargetStore.ReadResult first, HideTargetStore.ReadResult second) {
        return first.status == second.status && first.raw.equals(second.raw) && first.sha256.equals(second.sha256);
    }
    private static void requireSuccessfulRecord(HideTargetStore.ReadResult read, RootHideManager.Target target, boolean hidden) {
        HideTargetStore.Record value = find(read, target);
        require(read.status == HideTargetStore.ReadStatus.OK && value != null && value.bound
                && Boolean.valueOf(hidden).equals(value.desiredHidden)
                && value.observedState == (hidden ? HideTargetStore.ObservedState.HIDDEN : HideTargetStore.ObservedState.VISIBLE)
                && value.lastOperation != null && value.lastOperation.status == HideTargetStore.OperationStatus.SUCCEEDED
                && value.lastOperation.action == (hidden ? HideTargetStore.Action.HIDE : HideTargetStore.Action.SHOW),
                "Final durable action record was not confirmed");
    }
    private static RootHideManager.Target target(Bundle args, String userKey, String serialKey) {
        return new RootHideManager.Target((int) number(args, userKey, 999), number(args, serialKey, Long.MAX_VALUE), PACKAGE);
    }
    private static long number(Bundle args, String name, long max) {
        String raw = args.getString(name);
        require(raw != null && raw.matches("0|[1-9][0-9]*"), "Explicit canonical number required: " + name);
        long number = Long.parseLong(raw); require(number <= max, "Argument out of range: " + name); return number;
    }
    private static boolean positiveLong(Object value) { return value instanceof Long && (Long) value > 0; }
    private static boolean readable(RootHideManager.State state) {
        return state == RootHideManager.State.HIDDEN || state == RootHideManager.State.VISIBLE;
    }
    private static void requireIdentity(Context context, RootHideManager.Target target) {
        require(HideUserIdentity.match(context, target.userId, target.userSerial).success, "User instance changed");
    }
    private static void require(boolean condition, String message) { if (!condition) throw new IllegalStateException(message); }
    private static JSONObject operation(RootHideManager.OperationResult result) throws Exception {
        return new JSONObject().put("success", result.success).put("message", result.message)
                .put("runtimeSynced", result.runtimeSynced).put("reviewRequired", result.reviewRequired);
    }
    private static JSONObject shell(RootShell.Result result) throws Exception {
        return new JSONObject().put("success", result.isSuccess()).put("exitCode", result.exitCode)
                .put("timedOut", result.timedOut).put("captureReliable", result.capture != null && result.capture.reliable())
                .put("output", result.output);
    }
}
