package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Actual Activity navigation for one fixed fixture. No row review/restore/status
 * button is clicked, no production collaborator is replaced, and no Root command
 * is constructed here. Production page loading may archive history/install its
 * recovery notice; this is not a zero-file-write or visual screenshot test.
 */
final class RecoveryNavigationDeviceCases {
    private static final String PACKAGE = "ls.augment.txvictim";
    private static final int MAX_PAGES = 16;
    private static final long PAGE_WAIT_MS = 75000, NAVIGATION_MS = 240000;
    private static final long CLEANUP_WAIT_MS = 75000, DESTROY_WAIT_MS = 5000;
    private final Instrumentation instrumentation;
    private final Context context;
    private final JSONObject report = new JSONObject();
    private final JSONArray pages = new JSONArray(), clicks = new JSONArray();
    private HideRecoveryActivity activity;
    private long deadline;

    private RecoveryNavigationDeviceCases(Instrumentation instrumentation) {
        this.instrumentation = instrumentation;
        context = instrumentation.getTargetContext();
    }

    static JSONObject run(Instrumentation instrumentation, Bundle args) throws Exception {
        return new RecoveryNavigationDeviceCases(instrumentation).execute(args);
    }

    private JSONObject execute(Bundle args) throws Exception {
        require(Looper.myLooper() != Looper.getMainLooper(), "Navigation fixture must run on the instrumentation thread");
        report.put("success", false).put("entryType", "ACTUAL_ACTIVITY_NAVIGATION_FIXED_FIXTURE")
                .put("moduleVersion", BuildConfig.VERSION_CODE).put("package", PACKAGE)
                .put("pages", pages).put("navigationClicks", clicks).put("maxPagesPerSearch", MAX_PAGES)
                .put("maxSourceSearches", 2).put("maxTotalSourceSearchPages", 2 * MAX_PAGES)
                .put("pageWaitMillis", PAGE_WAIT_MS).put("navigationBudgetMillis", NAVIGATION_MS)
                .put("cleanupWorkerWaitMillis", CLEANUP_WAIT_MS).put("destroyWaitMillis", DESTROY_WAIT_MS)
                .put("rowActionClicks", 0).put("directMutationCalls", 0)
                .put("directRootCommands", 0).put("visualScreenshotEvidence", false)
                .put("backendMutationSuccessClaim", false).put("productionDependenciesReplaced", false)
                .put("workerDrainScope", "ACTIVITY_EXECUTOR_ONLY").put("shellDescendantDrainProven", false)
                .put("pageMayWritePreservedHistoryAndRecoveryNotice", true);
        SharedPreferences preferences = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, Object> rawBefore = copy(preferences.getAll());
        AppConfig config = null;
        Map<String, String> beforeConfig = null;
        RootHideManager manager = null;
        RootHideManager.Target first = null, second = null;
        RootHideManager.State firstBefore = null, secondBefore = null;
        Throwable failure = null;
        Capture capture = new Capture();
        Application application = (Application) context.getApplicationContext();
        application.registerActivityLifecycleCallbacks(capture);
        try {
            require(!args.containsKey("package") || PACKAGE.equals(args.getString("package")), "Only fixed fixture package is allowed");
            first = target(args, "userId", "expectedSerial");
            second = target(args, "secondUserId", "secondExpectedSerial");
            require(first.userId != second.userId, "Two distinct explicit user instances required");
            String source = args.getString("expectedSourceOperationId");
            require(source != null && source.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"), "Explicit canonical source operation ID required");
            String stageName = args.getString("expectedSourceStage", "PREPARED");
            require("PREPARED".equals(stageName) || "RESTORE_PREPARED".equals(stageName), "Only prepared source stages are permitted");
            HideRecoveryJournal.Stage stage = HideRecoveryJournal.Stage.valueOf(stageName);
            String configured = args.getString("expectedConfigured", "false");
            require("true".equals(configured) || "false".equals(configured), "expectedConfigured must be canonical true/false");
            requireInitialized(rawBefore);
            config = new AppConfig(context);
            beforeConfig = new LinkedHashMap<>(config.snapshot());
            require(rawBefore.equals(copy(preferences.getAll())), "Configuration initialization unexpectedly wrote preferences");
            HideTargetCodec.Selection selection = HideTargetCodec.parse(config.get(AppConfig.HIDE_TARGETS));
            require(selection.valid, "Saved selection cannot be parsed without changing it");
            boolean selected = false;
            for (HideTargetCodec.Entry entry : selection.entries)
                if (entry.userId == first.userId && entry.userSerial == first.userSerial
                        && PACKAGE.equals(entry.packageName)) selected = true;
            require(selected == Boolean.parseBoolean(configured), "Focused fixture configured membership differs from explicit expectation");
            report.put("targetConfigured", selected).put("expectedSourceOperationId", source).put("expectedSourceStage", stageName)
                    .put("primary", targetJson(first)).put("secondary", targetJson(second));
            manager = new RootHideManager(context);
            requireIdentity(first); requireIdentity(second);
            firstBefore = manager.queryState(first); secondBefore = manager.queryState(second);
            require(readable(firstBefore) && readable(secondBefore), "Both fixture installations must be readable");
            report.put("before", states(firstBefore, secondBefore));
            deadline = SystemClock.elapsedRealtime() + NAVIGATION_MS;
            Intent intent = HideRecoveryActivity.intent(context, first).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            Activity launched = instrumentation.startActivitySync(intent);
            require(launched instanceof HideRecoveryActivity, "Wrong real Activity launched");
            activity = (HideRecoveryActivity) launched;
            require(capture.activities.size() == 1 && capture.activities.get(0) == activity, "Activity launch was not unique");
            awaitReady();
            assertFocused(first, false);
            findAndInspect(source, stage, first);
            click("configuredButton"); awaitReady(); assertFocused(first, true);
            report.put("configuredCategoryPreservedTuple", true);
            click("historyButton"); awaitReady(); assertFocused(first, false);
            findAndInspect(source, stage, first);
            report.put("historyCategoryPreservedTuple", true);
            click("allRecordsButton"); awaitReady();
            JSONObject allRecords = onMain(() -> {
                require("".equals(field("focusPackage")) && ((Integer) field("focusUser")) == -1
                        && ((Long) field("focusSerial")) == -1L && !((Boolean) field("configuredOnly")),
                        "Only explicit all-records navigation must clear the entire tuple");
                Page actual = page();
                return new JSONObject().put("statusText", actual.status).put("rowCount", actual.rows.size())
                        .put("nextCursor", actual.next).put("completeHistoryEnumerationClaim", false);
            });
            report.put("allRecordsPageObservation", allRecords).put("explicitAllRecordsClearedTuple", true)
                    .put("navigationAssertionsPassed", true);
        } catch (Throwable error) {
            failure = error;
            report.put("failure", android.util.Log.getStackTraceString(error));
        } finally {
            if (activity == null && !capture.activities.isEmpty()) activity = capture.activities.get(0);
            report.put("capturedActivityCount", capture.activities.size());
            try { require(closeActivity() && capture.activities.size() <= 1, "Activity/worker cleanup was not fully observed"); }
            catch (Throwable cleanup) { report.put("cleanupFailure", android.util.Log.getStackTraceString(cleanup)); if (failure == null) failure = cleanup; }
            application.unregisterActivityLifecycleCallbacks(capture);
            try {
                boolean rawSame = rawBefore.equals(copy(preferences.getAll()));
                boolean snapshotSame = config != null && beforeConfig != null && beforeConfig.equals(config.snapshot());
                report.put("rawPreferencesUnchanged", rawSame).put("completeConfigSnapshotUnchanged", snapshotSame);
                require(manager != null && first != null && second != null && firstBefore != null && secondBefore != null,
                        "Both fixture state baselines must exist");
                requireIdentity(first); requireIdentity(second);
                RootHideManager.State firstAfter = manager.queryState(first), secondAfter = manager.queryState(second);
                report.put("after", states(firstAfter, secondAfter));
                boolean unchanged = firstAfter == firstBefore && secondAfter == secondBefore
                        && readable(firstAfter) && readable(secondAfter);
                report.put("bothUserInstancesMatchedAfter", true).put("bothHiddenStatesUnchanged", unchanged);
                require(unchanged, "One of the two fixture states changed");
                require(rawSame && snapshotSame, "Configuration changed or its full comparison was unavailable");
            } catch (Throwable postcondition) {
                report.put("postconditionFailure", android.util.Log.getStackTraceString(postcondition));
                if (failure == null) failure = postcondition;
            }
        }
        report.put("success", failure == null).put("status", failure == null ? "PASS" : "FAIL_OR_INCONCLUSIVE");
        return report;
    }

    private void findAndInspect(String source, HideRecoveryJournal.Stage stage, RootHideManager.Target target) throws Exception {
        Set<String> visited = new LinkedHashSet<>();
        for (int page = 0; page < MAX_PAGES; page++) {
            assertFocused(target, false);
            Page snapshot = onMain(this::page);
            require(visited.add(snapshot.cursor), "Search repeated a cursor");
            pages.put(new JSONObject().put("cursor", snapshot.cursor).put("nextCursor", snapshot.next)
                    .put("rowCount", snapshot.rows.size()).put("statusText", snapshot.status));
            for (int index = 0; index < snapshot.rows.size(); index++) {
                HideRecoveryController.Row row = snapshot.rows.get(index);
                HideRecoveryJournal.Entry entry = row.journalEntry;
                if (entry == null || !source.equals(entry.operationId) || entry.stage != stage) continue;
                require(row.sourceKey.equals("journal:" + source + "." + stage.name() + ".record")
                        && entry.userId == target.userId && entry.userSerial == target.userSerial
                        && PACKAGE.equals(entry.packageName) && row.actionable && !row.chooseUser,
                        "Source row does not identify the exact actionable fixture instance");
                while (index >= onMain(() -> ((LinearLayout) field("list")).getChildCount())) {
                    click("moreRows"); awaitReady();
                }
                final int rowIndex = index;
                JSONObject actual = onMain(() -> inspectRenderedRow(rowIndex, row));
                report.put("matchedActualRow", actual).put("sourceRecordFound", true);
                return;
            }
            if (snapshot.next.isEmpty()) break;
            require(page + 1 < MAX_PAGES, "INCONCLUSIVE: expected record exceeds fixed page budget");
            click("nextPage"); awaitReady();
        }
        throw new IllegalStateException("INCONCLUSIVE: expected exact source not found in the bounded real navigation");
    }

    private JSONObject inspectRenderedRow(int index, HideRecoveryController.Row row) throws Exception {
        LinearLayout list = (LinearLayout) field("list");
        List<?> actions = (List<?>) field("actions");
        require(index < list.getChildCount() && index < actions.size(), "Expected row has not been rendered");
        Button action = (Button) actions.get(index);
        View card = list.getChildAt(index);
        List<String> texts = new ArrayList<>();
        collectText(card, texts);
        require(isDescendant(card, action) && texts.contains(PACKAGE) && texts.contains(row.details)
                && action.isEnabled() && action.getText().length() > 0, "Actual card/button does not match its source row");
        require(field("activePreview") == null && field("dialog") == null, "Navigation unexpectedly opened a mutation preview");
        return new JSONObject().put("sourceKey", row.sourceKey).put("userId", row.originalUserId)
                .put("serial", row.userSerial).put("package", row.packageName)
                .put("buttonText", action.getText().toString()).put("buttonEnabled", action.isEnabled())
                .put("buttonClicked", false).put("renderedText", new JSONArray(texts));
    }

    private void assertFocused(RootHideManager.Target target, boolean configured) throws Exception {
        onMain(() -> {
            require(PACKAGE.equals(field("focusPackage")) && ((Integer) field("focusUser")) == target.userId
                    && ((Long) field("focusSerial")) == target.userSerial
                    && ((Boolean) field("configuredOnly")) == configured, "Navigation lost the exact target tuple/category");
            for (HideRecoveryController.Row row : page().rows)
                require(PACKAGE.equals(row.packageName) && row.originalUserId == target.userId
                        && row.userSerial == target.userSerial, "Focused list leaked another user/serial/package");
            require(field("activePreview") == null && field("dialog") == null, "Navigation opened a row action");
            return null;
        });
    }

    private void click(String name) throws Exception {
        require(List.of("configuredButton", "historyButton", "allRecordsButton", "nextPage", "moreRows").contains(name), "Non-navigation click is forbidden");
        require(SystemClock.elapsedRealtime() < deadline, "Navigation deadline exhausted");
        JSONObject clicked = onMain(() -> {
            require(!((Boolean) field("busy")), "Page is still busy");
            Button button = (Button) field(name);
            require(button != null && button.isShown() && button.isEnabled()
                    && !((List<?>) field("actions")).contains(button), "Navigation button is not ready or is a row action");
            String text = button.getText().toString();
            require(button.performClick(), "Actual navigation button did not handle the click");
            return new JSONObject().put("field", name).put("actualText", text);
        });
        clicks.put(clicked);
    }

    private void awaitReady() throws Exception {
        long until = Math.min(deadline, SystemClock.elapsedRealtime() + PAGE_WAIT_MS);
        while (SystemClock.elapsedRealtime() < until) {
            if (onMain(() -> !activity.isFinishing() && !activity.isDestroyed() && !((Boolean) field("busy"))
                    && ((LinearLayout) field("list")).getChildCount() == Math.min(((List<?>) field("rows")).size(), (Integer) field("visibleLimit"))
                    && ((List<?>) field("actions")).size() == ((LinearLayout) field("list")).getChildCount())) return;
            SystemClock.sleep(40);
        }
        report.put("pageWaitTimedOut", true);
        throw new IllegalStateException("INCONCLUSIVE: real Activity did not finish loading/rendering within its budget");
    }

    private boolean closeActivity() throws Exception {
        if (activity == null) { report.put("activityStarted", false).put("workerTerminated", true); return true; }
        ExecutorService worker = onMain(() -> (ExecutorService) field("worker"));
        boolean idle = onMain(() -> !((Boolean) field("busy")));
        report.put("activityStarted", true).put("busyBeforeFinish", !idle);
        // Do not force/cancel a production worker or assume finish drains it.
        // onDestroy shuts down its executor; awaitTermination is OFF the UI thread.
        onMain(() -> { activity.finish(); return null; });
        long until = SystemClock.elapsedRealtime() + DESTROY_WAIT_MS;
        while (!onMain(activity::isDestroyed) && SystemClock.elapsedRealtime() < until) SystemClock.sleep(40);
        boolean destroyed = onMain(activity::isDestroyed);
        boolean terminated = worker.awaitTermination(CLEANUP_WAIT_MS, TimeUnit.MILLISECONDS);
        report.put("activityDestroyed", destroyed).put("workerShutdown", worker.isShutdown())
                .put("workerTerminated", terminated).put("cleanupTimedOut", !destroyed || !terminated);
        return destroyed && worker.isShutdown() && terminated;
    }

    @SuppressWarnings("unchecked") private Page page() throws Exception {
        return new Page(new ArrayList<>((List<HideRecoveryController.Row>) field("rows")),
                (String) field("cursor"), (String) field("nextCursor"), ((TextView) field("status")).getText().toString());
    }
    private Object field(String name) throws Exception { Field value = HideRecoveryActivity.class.getDeclaredField(name); value.setAccessible(true); return value.get(activity); }
    private <T> T onMain(Callable<T> work) throws Exception { FutureTask<T> task = new FutureTask<>(work); instrumentation.runOnMainSync(task); return task.get(); }
    private void requireIdentity(RootHideManager.Target target) { require(HideUserIdentity.match(context, target.userId, target.userSerial).success, "Explicit user instance changed"); }
    private static RootHideManager.Target target(Bundle args, String user, String serial) { return new RootHideManager.Target((int) number(args, user, 99999), number(args, serial, Integer.MAX_VALUE), PACKAGE); }
    private static long number(Bundle args, String name, long max) { String value = args.getString(name); require(value != null && value.matches("0|[1-9][0-9]*"), "Explicit canonical " + name + " required"); long number = Long.parseLong(value); require(number <= max, "User/serial exceeds supported range"); return number; }
    private static JSONObject targetJson(RootHideManager.Target target) throws Exception { return new JSONObject().put("userId", target.userId).put("serial", target.userSerial).put("package", PACKAGE); }
    private static JSONObject states(RootHideManager.State primary, RootHideManager.State secondary) throws Exception { return new JSONObject().put("primary", primary.name()).put("secondary", secondary.name()); }
    private static boolean readable(RootHideManager.State value) { return value == RootHideManager.State.HIDDEN || value == RootHideManager.State.VISIBLE; }
    private static void require(boolean value, String message) { if (!value) throw new IllegalStateException(message); }
    private static void requireInitialized(Map<String, Object> raw) {
        require(Boolean.TRUE.equals(raw.get("approved_ui_migration_v1")) && Boolean.TRUE.equals(raw.get("freeform_independent_migration_v1"))
                && Boolean.TRUE.equals(raw.get("private_initialized_v2")) && raw.get("snapshot_revision_v1") instanceof Long
                && (Long) raw.get("snapshot_revision_v1") > 0 && raw.get("snapshot_updated_at_v1") instanceof Long
                && (Long) raw.get("snapshot_updated_at_v1") > 0, "Preinitialized configuration required; fixture never initializes or migrates it");
    }
    private static Map<String, Object> copy(Map<String, ?> input) { Map<String, Object> copy = new LinkedHashMap<>(); for (Map.Entry<String, ?> entry : input.entrySet()) copy.put(entry.getKey(), entry.getValue() instanceof Set<?> ? new LinkedHashSet<>((Set<?>) entry.getValue()) : entry.getValue()); return copy; }
    private static void collectText(View view, List<String> values) { if (view instanceof TextView) values.add(((TextView) view).getText().toString()); if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) collectText(((ViewGroup) view).getChildAt(i), values); }
    private static boolean isDescendant(View parent, View wanted) { if (parent == wanted) return true; if (parent instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) parent).getChildCount(); i++) if (isDescendant(((ViewGroup) parent).getChildAt(i), wanted)) return true; return false; }
    private static final class Page { final List<HideRecoveryController.Row> rows; final String cursor, next, status; Page(List<HideRecoveryController.Row> rows, String cursor, String next, String status) { this.rows = rows; this.cursor = cursor; this.next = next; this.status = status; } }
    private static final class Capture implements Application.ActivityLifecycleCallbacks {
        final List<HideRecoveryActivity> activities = new java.util.concurrent.CopyOnWriteArrayList<>();
        public void onActivityCreated(Activity value, Bundle state) { if (value instanceof HideRecoveryActivity) activities.add((HideRecoveryActivity) value); }
        public void onActivityStarted(Activity value) { }
        public void onActivityResumed(Activity value) { }
        public void onActivityPaused(Activity value) { }
        public void onActivityStopped(Activity value) { }
        public void onActivitySaveInstanceState(Activity value, Bundle state) { }
        public void onActivityDestroyed(Activity value) { }
    }
}
