package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/** Fixed test APK fixture, actual client/storage/controller/backend; no visual-click claim. */
final class RootOwnedRestoreDeviceCases {
    private static final String PACKAGE = "ls.augment.txvictim";
    private RootOwnedRestoreDeviceCases() { }

    static JSONObject run(Context context, Bundle args) throws Exception {
        JSONObject report = new JSONObject().put("success", false).put("package", PACKAGE)
                .put("entryType", "TEST_APK_ACTUAL_BACKEND_NOT_VISUAL_CLICK")
                .put("moduleVersion", BuildConfig.VERSION_CODE).put("clientHideCalls", 0)
                .put("controllerPreviewCalls", 0).put("controllerRestoreCalls", 0).put("statusCalls", 0);
        SharedPreferences rawPreferences = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, ?> rawBefore = new LinkedHashMap<>(rawPreferences.getAll());
        RootHideManager.ACTION_LOCK.lock();
        try {
            require(Boolean.TRUE.equals(rawBefore.get("approved_ui_migration_v1"))
                    && Boolean.TRUE.equals(rawBefore.get("freeform_independent_migration_v1"))
                    && Boolean.TRUE.equals(rawBefore.get("private_initialized_v2"))
                    && rawBefore.get("snapshot_revision_v1") instanceof Long
                    && (Long) rawBefore.get("snapshot_revision_v1") > 0
                    && rawBefore.get("snapshot_updated_at_v1") instanceof Long
                    && (Long) rawBefore.get("snapshot_updated_at_v1") > 0,
                    "Fixture requires initialized preferences; it does not initialize/migrate configuration");
            String action = args.getString("action", "");
            report.put("action", action);
            require(List.of("hide", "reject-hide", "restore", "cancel", "reject", "recheck", "snapshot").contains(action), "Unknown fixed fixture action");
            require(!args.containsKey("package") || PACKAGE.equals(args.getString("package")), "Only fixed fixture package is allowed");
            RootHideManager.Target target = target(args, "userId", "expectedSerial");
            RootHideManager.Target other = target(args, "secondUserId", "secondExpectedSerial");
            require(target.userId != other.userId, "Two distinct explicit user instances required");
            requireIdentity(context, target); requireIdentity(context, other);
            AppConfig config = new AppConfig(context);
            Map<String, String> beforeConfig = config.snapshot();
            RootHideManager manager = new RootHideManager(context);
            require(manager.rootStatus().state == RootHideManager.RootState.GRANTED, "Root not available");
            RootHideManager.State before = manager.queryState(target), otherBefore = manager.queryState(other);
            require(readable(before) && readable(otherBefore), "Both fixture installations must be readable");
            report.put("before", states(target, before, other, otherBefore));
            try {
                if ("hide".equals(action) || "reject-hide".equals(action)) {
                    require(before == RootHideManager.State.VISIBLE, "Hide requires visible fixed fixture");
                    HideRecoveryIdentity.Snapshot identity = HideRecoveryIdentity.read(context, target);
                    HideRecoveryIdentity.Owner owner = HideRecoveryIdentity.owner(context);
                    require(identity.success && identity.userSerial == target.userSerial
                            && !"unknown".equals(identity.packageIdentity) && owner.success, "Exact fixture evidence required");
                    HideRootClient client = new HideRootClient();
                    HideRootClient.Preparation prepared = client.prepare(List.of(new HideRootClient.Identity(
                            target.userId, target.userSerial, PACKAGE, identity.packageIdentity,
                            owner.id, owner.userId, System.currentTimeMillis())));
                    require(prepared.attempt != null, prepared.error);
                    try {
                        HideRecoveryJournal.Entry entry = prepared.attempt.entries.get(0);
                        report.put("sourceOperationId", entry.operationId).put("sourceKey", key(entry));
                        RootShell.Result saved = client.persistPrepared(prepared.attempt);
                        report.put("prewrite", shell(saved)); require(saved.isSuccess(), "Hide prewrite not confirmed");
                        // Verify the actual read-only catalog sees the durable source before dispatch.
                        require(readRow(entry.operationId, HideRecoveryJournal.Stage.PREPARED, target) != null, "Source readback failed");
                        requireIdentity(context, target);
                        require(manager.queryState(target) == before, "Fixture changed during prewrite");
                        report.put("clientHideCalls", 1);
                        RootShell.Result result = client.hide(prepared.attempt);
                        report.put("backend", shell(result));
                        if ("reject-hide".equals(action)) {
                            require(!result.isSuccess(), "Invalidated hide unexpectedly accepted");
                            report.put("statusCalls", 1);
                            HideRootClient.Exchange status = client.status(entry);
                            report.put("statusTransport", shell(status.transport))
                                    .put("typedStatusOutcome", status.reply == null ? "UNPARSED" : status.reply.outcome.name());
                            require(status.reply != null && status.reply.outcome == HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE,
                                    "INCONCLUSIVE: hide did not confirm exact rejection before write");
                            require(manager.queryState(target) == before, "Rejected hide changed fixture visibility");
                        } else {
                            require(result.isSuccess(), "Actual hide result not confirmed");
                            require(manager.queryState(target) == RootHideManager.State.HIDDEN, "Fixture was not hidden");
                        }
                    } finally { client.closeUnused(prepared.attempt); }
                } else if (!"snapshot".equals(action)) {
                    String operationId = uuid(args, "operationId");
                    HideRecoveryJournal.Stage stage = "recheck".equals(action)
                            ? HideRecoveryJournal.Stage.RESTORE_PREPARED : HideRecoveryJournal.Stage.PREPARED;
                    HideRecoveryController.Row row = readRow(operationId, stage, target);
                    report.put("sourceKey", row.sourceKey);
                    if ("recheck".equals(action)) {
                        report.put("statusOnly", true);
                        report.put("statusCalls", 1);
                        RootShell.Result result = new HideRootClient().recheckRestore(row.journalEntry);
                        report.put("backend", shell(result));
                        require(result.isSuccess(), "Original restore result is not confirmed");
                        require(manager.queryState(target) == before, "Read-only recheck changed state");
                    } else {
                        require(before == RootHideManager.State.HIDDEN, "Restore/cancel/reject requires hidden fixed fixture");
                        HideRecoveryController controller = new HideRecoveryController(context);
                        report.put("controllerPreviewCalls", 1);
                        HideRecoveryController.Preview preview = controller.preview(row, target.userId);
                        report.put("previewSuccess", preview.success).put("previewMessage", preview.message)
                                .put("hasLiveRestoreAttempt", preview.restoreAttempt != null);
                        try {
                            {
                                require(preview.success && preview.restoreAttempt != null,
                                        "INCONCLUSIVE: actual restore preview unavailable; this does not prove expected source rejection");
                                report.put("restoreOperationId", preview.restoreAttempt.entry.operationId)
                                        .put("restoreKey", key(preview.restoreAttempt.entry));
                                if ("cancel".equals(action)) controller.cancel(preview);
                                report.put("controllerRestoreCalls", 1);
                                RootHideManager.OperationResult result = controller.restore(preview);
                                report.put("backend", operation(result));
                                if ("restore".equals(action)) {
                                    require(result.success, "Actual conditional restore not confirmed");
                                    require(readRow(preview.restoreAttempt.entry.operationId,
                                            HideRecoveryJournal.Stage.RESTORE_PREPARED, target) != null, "Restore prewrite readback failed");
                                    RootHideManager.OperationResult duplicate = controller.restore(preview);
                                    report.put("controllerRestoreCalls", 2);
                                    report.put("samePreviewRepeated", operation(duplicate));
                                    require(!duplicate.success, "Used preview unexpectedly accepted");
                                } else {
                                    require(!result.success, "Canceled/invalidated restore unexpectedly accepted");
                                    if ("reject".equals(action)) {
                                        report.put("statusCalls", 1);
                                        HideRootClient.Exchange status = new HideRootClient().restoreStatus(preview.restoreAttempt.entry);
                                        report.put("statusTransport", shell(status.transport))
                                                .put("typedStatusOutcome", status.reply == null ? "UNPARSED" : status.reply.outcome.name());
                                        require(status.reply != null && status.reply.outcome == HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE,
                                                "INCONCLUSIVE: expected exact prewrite rejection was not confirmed");
                                    }
                                }
                            }
                            RootHideManager.State expected = "restore".equals(action)
                                    ? RootHideManager.State.VISIBLE : before;
                            require(manager.queryState(target) == expected, "Unexpected fixture state after action");
                        } finally { controller.cancel(preview); }
                    }
                }
                report.put("success", true);
            } finally {
                requireIdentity(context, target); requireIdentity(context, other);
                RootHideManager.State after = manager.queryState(target), otherAfter = manager.queryState(other);
                boolean preserved = beforeConfig.equals(config.snapshot());
                report.put("after", states(target, after, other, otherAfter))
                        .put("otherUserStatePreserved", otherAfter == otherBefore)
                        .put("configurationPreserved", preserved).put("historyDeleted", false);
                require(preserved && otherAfter == otherBefore && readable(after), "Configuration or other user changed / final state unreadable");
            }
        } catch (Exception failure) {
            report.put("success", false).put("errorType", failure.getClass().getName())
                    .put("error", String.valueOf(failure.getMessage()));
        } finally {
            try {
                boolean rawPreserved = rawBefore.equals(rawPreferences.getAll());
                report.put("rawConfigurationPreservedFromEntry", rawPreserved);
                if (!rawPreserved) report.put("success", false).put("configurationError", "Raw preferences changed during entry");
            } finally { RootHideManager.ACTION_LOCK.unlock(); }
        }
        return report;
    }

    private static HideRecoveryController.Row readRow(String id, HideRecoveryJournal.Stage stage,
            RootHideManager.Target target) {
        HideRecoveryCatalog.Page page = HideRecoveryCatalog.readOne("journal:" + id + "." + stage + ".record");
        require(page.success && page.sources.size() == 1, "Exact durable record not readable");
        List<HideRecoveryController.Row> rows = HideRecoveryController.rows(page.sources.get(0));
        require(rows.size() == 1, "Unexpected record row count");
        HideRecoveryController.Row row = rows.get(0);
        require(row.actionable && row.journalEntry != null && row.journalEntry.stage == stage
                && row.journalEntry.operationId.equals(id) && row.originalUserId == target.userId
                && row.userSerial == target.userSerial && PACKAGE.equals(row.packageName), "Record must match exact fixed fixture instance");
        return row;
    }
    private static String key(HideRecoveryJournal.Entry entry) { return "journal:" + entry.operationId + "." + entry.stage + ".record"; }
    private static String uuid(Bundle args, String name) {
        String value = args.getString(name);
        require(value != null && value.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"), "Explicit canonical UUID required");
        return value;
    }
    private static RootHideManager.Target target(Bundle args, String userKey, String serialKey) {
        return new RootHideManager.Target((int) number(args, userKey, 99999), number(args, serialKey, Integer.MAX_VALUE), PACKAGE);
    }
    private static long number(Bundle args, String key, long max) {
        String value = args.getString(key);
        require(value != null && value.matches("0|[1-9][0-9]*"), "Explicit canonical user/serial required");
        long result = Long.parseLong(value); require(result <= max, "User/serial outside range"); return result;
    }
    private static void requireIdentity(Context context, RootHideManager.Target target) {
        require(HideUserIdentity.match(context, target.userId, target.userSerial).success, "User instance changed");
    }
    private static boolean readable(RootHideManager.State state) { return state == RootHideManager.State.VISIBLE || state == RootHideManager.State.HIDDEN; }
    private static void require(boolean value, String message) { if (!value) throw new IllegalStateException(message); }
    private static JSONObject shell(RootShell.Result result) throws Exception {
        return new JSONObject().put("success", result.isSuccess()).put("exitCode", result.exitCode)
                .put("timedOut", result.timedOut).put("output", result.output);
    }
    private static JSONObject operation(RootHideManager.OperationResult result) throws Exception {
        return new JSONObject().put("success", result.success).put("message", result.message)
                .put("runtimeSynced", result.runtimeSynced).put("reviewRequired", result.reviewRequired);
    }
    private static JSONArray states(RootHideManager.Target first, RootHideManager.State a,
            RootHideManager.Target second, RootHideManager.State b) throws Exception {
        return new JSONArray().put(new JSONObject().put("userId", first.userId).put("serial", first.userSerial).put("state", a.name()))
                .put(new JSONObject().put("userId", second.userId).put("serial", second.userSerial).put("state", b.name()));
    }
}
